set define '^' verify off
prompt ...wwv_flow_session_state.sql
create or replace package wwv_flow_session_state as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_session_state.sql
--
--    DESCRIPTION
--      This package encapsulates all access to session state (wwv_flow_data)
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    04/05/2012 - Created
--    cneumuel    04/10/2012 - Added get_deferred_session_val_id for wwv_flow_item (feature #897)
--    cneumuel    04/12/2012 - Added clear_state_for_id,clear_all_state_for_id
--    cneumuel    04/12/2012 - Added initialize_all_page_items, clear_all_state_for_name
--    cneumuel    05/24/2012 - Renamed save to save_by_id, added save, save_by_name,
--                             has_component_value, set_component_values, get_component_values, clear_component_values,
--                             set_substitution_cache_byname, set_substitution_cache, replace_substitution_names, v,
--                             renamed fetch_flow_item to get_item_value (feature #940)
--    cneumuel    06/01/2012 - Added get_global_item_id, added p_item_scope to save_nocache (feature #897)
--    cneumuel    08/01/2012 - Added do_hash_substitutions: #xxx# substitution for wwv_flow.do_substitutions (bug #14399765)
--    cneumuel    08/06/2012 - In do_hash_substitutions: add p_start_pos. replace #MIN#, #APP_VERSION#, #APEX_VERSION#
--    cneumuel    10/08/2013 - Removed initialize_all_page_items (feature #1281)
--    cneumuel    01/10/2014 - Added clear_state_for_ids. Add commits after session state delete, to shorten the window for locks, especially after reset pagination/clear cache.
--    cneumuel    02/21/2014 - Moved do_substitutions implementation from wwv_flow to wwv_flow_session_state. Added &<item>!<mode>. escaping
--    cneumuel    02/28/2014 - Added reset
--    cneumuel    03/24/2014 - Added parse_substitution, substitute to support substitution escape filters (feature #1069)
--    cneumuel    03/26/2014 - Added do_raw_substitutions, do_html_substitutions
--    cneumuel    03/26/2014 - Added overloaded parse_substitution
--    cneumuel    03/27/2014 - In v: changed type of p_escape parameter
--    cneumuel    03/28/2014 - Added enable_access, disable_access (bug #18329215)
--    cneumuel    05/20/2014 - In save_nocache, save, save_by_id: added p_commit (default true) that, if false, does not commit when updating wwv_flow_data but sets an internal variable
--                           - Added perform_pending_commits: commit if internal commit variable is set and reset it
--    cneumuel    07/07/2014 - In fetch_value_by_id: add p_deferred_item_only (bug #18846680)
--    cneumuel    11/17/2014 - In v: changed type and name of scope parameter
--    cneumuel    02/13/2015 - Added substitution applier type and procedures, for applying substitutions from a fixed set of names: fix for issues with report column substitutions (bug #20488779)
--
--------------------------------------------------------------------------------

c_deep_link_item_name constant varchar2(4000) := 'FSP_AFTER_LOGIN_URL';

--==============================================================================
-- modes for how we can escape substitution variables
--==============================================================================
subtype t_escape_mode is pls_integer range 1..5;
c_escape_mode_raw            constant t_escape_mode := 1;
c_escape_mode_html           constant t_escape_mode := 2;
c_escape_mode_html_attribute constant t_escape_mode := 3;
c_escape_mode_javascript     constant t_escape_mode := 4;
c_escape_mode_striphtml      constant t_escape_mode := 5;

--==============================================================================
-- type for tuple of substitution name and escape mode
--==============================================================================
type t_substitution is record (
    pattern     varchar2(32767),
    name        varchar2(32767),
    escape_mode t_escape_mode default c_escape_mode_raw );

--==============================================================================
-- type for replacing multiple substitution strings
--
-- SEE ALSO
--   * init_applier, reset_applier, advance, apply_and_advance
--==============================================================================
type t_map_v2_int        is table of pls_integer index by varchar2(32767);
type t_applier_text_part is record (
    first_text_idx       pls_integer,
    text_before          varchar2(32767),
    pattern_idx          pls_integer,
    substitution         t_substitution );
type t_applier_text_parts is table of t_applier_text_part index by pls_integer;
type t_substitution_applier is record (
    found                boolean,                -- true if substitution pattern was found
    text                 varchar2(32767),        -- result text
    substitution         t_substitution,         -- the substitution pattern
    pattern_idx          pls_integer,            -- index of substitution.name in patterns
    patterns             wwv_flow_t_varchar2,    -- start patterns
    patterns_count       pls_integer,            -- patterns.count
    start_char           varchar2(1),            -- start character for a match (# or &)
    end_char             varchar2(1),            -- end character for a match (# or .)
    --
    parsed_texts         t_map_v2_int,           -- text -> index of first text_parts element
    first_text_idx       pls_integer,
    current_idx          pls_integer,            -- current index into text_parts
    text_parts           t_applier_text_parts ); -- all parsed text parts

--==============================================================================
-- disable all read/write access to session state. after calling this procedure,
-- all APIs of wwv_flow_session_state except for enable() will raise an error.
--==============================================================================
procedure disable_access;

--==============================================================================
-- enable read/write access to session state. by default, access is enabled.
--==============================================================================
procedure enable_access;

--==============================================================================
-- split p_pattern into a name part and substitution mode part. they are
-- separated by "!". valid substitution mode strings are
--
-- - !RAW .... c_escape_mode_raw
-- - !HTML ... c_escape_mode_html
-- - !ATTR ... c_escape_mode_html_attribute
-- - !JS ..... c_escape_mode_javascript
--
-- the function assumes that the input string still contains the surrounding
-- substitution characters (& and . for items, # and # for columns)
--==============================================================================
function parse_substitution (
    p_pattern        in varchar2,
    p_pattern_length in pls_integer,
    p_default_mode   in t_escape_mode )
    return t_substitution;

--==============================================================================
-- overloaded version that extracts the pattern from p_text
--==============================================================================
function parse_substitution (
    p_text           in varchar2,
    p_pattern_start  in pls_integer,
    p_pattern_end    in pls_integer,
    p_default_mode   in t_escape_mode )
    return t_substitution;

--==============================================================================
-- replace the substitution pattern in p_text with p_value, thereby escaping
-- the value based on p_substitution.escape_mode.
--
-- ARGUMENTS
-- * p_text                   text where substitution should occur
-- * p_substitution           parsed substitution pattern (see parse_substitution above)
-- * p_value                  replacement value
-- * p_fix_html_double_escape LEGACY - DO NOT USE IN NEW CODE
--                            if true, try to fix html double escaping. the default is false.
--==============================================================================
procedure substitute (
    p_text                   in out nocopy varchar2,
    p_substitution           in t_substitution,
    p_value                  in varchar2,
    p_fix_html_double_escape in boolean default false );

--==============================================================================
-- init a substitution applier. this gives you an "object" that can be used to
-- do template substitutions. you give it patterns, start and end characters and
-- after initialization, the applier can be used multiple times.
--
-- ARGUMENTS
-- * p_this       the applier record
-- * p_names      table of varchar2 that contains start patterns
-- * p_start_char the start character for a pattern
-- * p_end_char   the end character of a pattern
--
-- EXAMPLE
--   the example below initializes an applier record and then uses it to apply
--   substitutions in a text.
--
--   declare
--       l_applier wwv_flow_session_state.t_substitution_applier;
--       l_names   wwv_flow_t_varchar2 := wwv_flow_t_varchar2('FOO'  , 'BAR');
--       l_values  wwv_flow_t_varchar2 := wwv_flow_t_varchar2('Hello', '<World>');
--       l_text    varchar2(32767)     := '#FOO#, #BAR!HTML#!';
--   begin
--       wwv_flow_session_state.init_applier (
--           p_this  => l_applier,
--           p_names => l_names );
--       wwv_flow_session_state.start_applier (
--           p_this => l_applier,
--           p_text => l_text );
--       while l_applier.found loop
--           wwv_flow_session_state.apply_and_advance (
--               p_this  => l_applier,
--               p_value => l_values(l_applier.pattern_idx) );
--       end loop;
--       dbms_output.put_line(l_applier.text);
--       --
--       -- output: Hello, &lt;World&gt;!
--  end;
--==============================================================================
procedure init_applier (
    p_this       in out nocopy t_substitution_applier,
    p_names      in wwv_flow_t_varchar2,
    p_start_char in varchar2 default '#',
    p_end_char   in varchar2 default '#' );
procedure init_applier (
    p_this       in out nocopy t_substitution_applier,
    p_names      in wwv_flow_global.vc_arr2,
    p_start_char in varchar2 default '#',
    p_end_char   in varchar2 default '#' );


--==============================================================================
-- see init_applier
--==============================================================================
procedure start_applier (
    p_this      in out nocopy t_substitution_applier,
    p_text      in varchar2 );

--==============================================================================
-- see init_applier
--==============================================================================
procedure advance (
    p_this      in out nocopy t_substitution_applier );

--==============================================================================
-- see init_applier
--==============================================================================
procedure apply_and_advance (
    p_this                   in out nocopy t_substitution_applier,
    p_value                  in varchar2,
    p_fix_html_double_escape in boolean default false );

--==============================================================================
-- helper procedure to reset the package global session state
--==============================================================================
procedure reset;

--==============================================================================
-- helper for wwv_flow.clear_page_cache
--
-- Reset all cached items for a given page to null
--==============================================================================
procedure clear_state_for_page (
    p_page_id in number default null);

--==============================================================================
-- For the current session remove session state for the given flow.  Requires
-- wwv_flow_security.g_instance to be set to the current session.
--==============================================================================
procedure clear_state_for_application (
    p_application_id in varchar2 );

--==============================================================================
-- ...
--==============================================================================
procedure clear_state_for_user;

--==============================================================================
-- remove session state by item ids in the current session
--==============================================================================
procedure clear_state_for_ids (
    p_item_ids       in wwv_flow_t_number );

--==============================================================================
-- remove session state by item id in the current session
--==============================================================================
procedure clear_state_for_id (
    p_item_id        in number );

--==============================================================================
-- remove session state by item id, for all sessions
--==============================================================================
procedure clear_all_state_for_id (
    p_item_id        in number,
    p_application_id in number default wwv_flow_security.g_flow_id );

--==============================================================================
-- remove session state by item name, for all sessions
--==============================================================================
procedure clear_all_state_for_name (
    p_item_name      in varchar2,
    p_application_id in number default wwv_flow_security.g_flow_id );

--==============================================================================
-- ...
--==============================================================================
procedure save_deferred_session_vals;
--==============================================================================
-- ...
--==============================================================================
function get_deferred_session_val_id (
    p_string in varchar2 )
    return number;

--==============================================================================
-- return if p_item_name is the name of a global item
--==============================================================================
function is_builtin_global_item_name (
    p_item_name in varchar2 )
    return boolean;

--==============================================================================
-- Set global session state (i.e. independent of application, e.g. deep link)
--==============================================================================
procedure set_builtin_global_item_value (
    p_item_name in varchar2,
    p_value     in varchar2,
    p_do_update in boolean default false,
    p_commit    in boolean default true );

--==============================================================================
-- Get "id" for global session state item
--==============================================================================
function get_global_item_id (
    p_item_name in varchar2 )
    return number;

--==============================================================================
-- Get global session state (i.e. independent of application, e.g. deep link)
--==============================================================================
function get_builtin_global_item_value (
    p_item_name         in varchar2,
    p_session_id        in number default wwv_flow_security.g_instance )
    return varchar2;

--==============================================================================
-- Save item to session state (ignoring the substitution cache) and commit if
-- p_commit is true
--==============================================================================
procedure save_nocache (
    p_item_id        in number,
    p_item_scope     in wwv_flow_meta_data.t_item_scope,
    p_item_name      in varchar2,
    p_item_value     in varchar2,
    p_item_filter    in varchar2 default 'N',
    p_is_encrypted   in varchar2 default 'N',
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_do_update      in boolean  default false,
    p_commit         in boolean  default true );

--==============================================================================
-- Save session state to plsql memory cache and database.
--
-- p_item           = application or page item
-- p_item_value     = value of item to be stored as session state
-- p_external_input = if true, escape input
-- p_commit         = perform commit if true
--==============================================================================
procedure save (
    p_item              in wwv_flow_meta_data.t_item_properties,
    p_item_value        in varchar2,
    p_external_input    in boolean,
    p_commit            in boolean default true );

--==============================================================================
-- Save session state to plsql memory cache and database.
--
-- p_item_id    = id of application or page item
-- p_item_value = value of item to be stored as session state
-- p_commit     = perform commit if true
--==============================================================================
procedure save_by_id (
    p_item_id           in number,
    p_item_value        in varchar2,
    p_commit            in boolean default true );

--==============================================================================
-- Save session state to plsql memory cache and database.
--
-- item_name  = name of application or page item
-- item_value = value of item to be stored as session state
--==============================================================================
procedure save_by_name (
    p_item_name         in varchar2,
    p_item_value        in varchar2,
    p_commit            in boolean default true );

--==============================================================================
-- if the above save% procedures were called with p_commit=>false, this
-- procedure can be used to perform outstanding commits. it uses an internal
-- variable to only commit when actual session state dml was performed.
--==============================================================================
procedure perform_pending_commits;

--==============================================================================
-- Return if p_name is part of the component value map
--==============================================================================
function has_component_value (
    p_name in varchar2 )
    return boolean;

--==============================================================================
-- Sets the component specific values which can then be used as bind variables,
-- substitution values, ...
-- p_value_map is index by the uppercase column names of the component.
--
-- Note: Always call clear_component_values after a row of your component has
--       been processed to make sure that these values are not accidentially
--       used outside your component. Don't forget about the exception handler!!
--==============================================================================
procedure set_component_values (
    p_value_map in wwv_flow_global.vc_map );

--==============================================================================
-- Returns the component specific values. These values can change if the bind
-- variable was used as an assignment target.
-- p_value_map is index by the uppercase column names of the component.
--==============================================================================
function get_component_values
    return wwv_flow_global.vc_map;

--==============================================================================
-- Clears the component specific values which can then be used as bind variables,
-- substitution values, ...
--
-- This procedure should always be called after a row of your component has
-- been processed to make sure that these values are not accidentially
-- used outside your component. Don't forget about the exception handler to call
-- this procedure there as well!!
--==============================================================================
procedure clear_component_values;

--==============================================================================
-- Update the cache of session state maintained in a pl/sql table.
--
-- p_name      = name of the application or page item
-- p_value     = Session state value for the item
--==============================================================================
procedure set_substitution_cache_byname (
    p_name       in varchar2,
    p_value      in varchar2 );

--==============================================================================
-- Update the cache of session state maintained in a pl/sql table.
-- This procedure does not write the change to disk.
--
-- p_id        = ID of the application or page item
-- p_value     = Session state value for the item
-- p_name      = name of the application or page item
-- p_filter    = filter value of the item (escape on http output)
-- p_encrypted = encrypted (Y/N) flag of the item
--==============================================================================
procedure set_substitution_cache (
    p_id         in number,
    p_value      in varchar2,
    p_name       in varchar2 default null,
    p_filter     in varchar2 default null,
    p_encrypted  in varchar2 default null );

--==============================================================================
-- fetch all of the application's session state into the substitution cache,
-- i.e. the wwv_flow.g_substitution_item% variables.
--==============================================================================
procedure fetch_into_substitution_cache (
    p_exact_substitutions_only in boolean );

--==============================================================================
-- utility to substitute "&ITEM."
--
-- part of do_substitutions but exposed for backwards compatibility, since it
-- is used in wwv_flow_utilities.parse.
--==============================================================================
procedure do_exact_item_substitutions (
    p_string                     in out nocopy varchar2,
    p_has_substituted_session_id in out boolean,
    p_search_start_pos           in pls_integer,
    p_escape_mode                 in t_escape_mode );

--==============================================================================
-- replace generic #xxx# values in p_str
--
-- part of do_substitutions, but can also be used to replace the xxxIMAGExxx
-- and xxxOWNERxxx values.
--==============================================================================
procedure do_hash_substitutions (
    p_str       in out nocopy varchar2,
    p_start_pos in binary_integer default null );

--==============================================================================
-- substitute &ITEM. and &ITEM (if wwv_flow.g_exact_substitutions_only = 'N')
-- and #HASH#
--==============================================================================
function do_substitutions (
    p_string      in varchar2,
    p_escape_mode in t_escape_mode )
    return varchar2;

--==============================================================================
-- overloaded do_substitutions with p_escape_mode=c_escape_mode_raw
--==============================================================================
function do_raw_substitutions (
    p_string      in varchar2 )
    return varchar2;

--==============================================================================
-- overloaded do_substitutions with p_escape_mode=c_escape_mode_html
--==============================================================================
function do_html_substitutions (
    p_string      in varchar2 )
    return varchar2;

--==============================================================================
-- return flow value (formerly stand-alone v function)
--
-- This program allows you to reference flow variables using
-- v('FLOW_VAR') syntax.  This prevents the shared pool from
-- filling up and running out of enqueues when running with
-- large numbers of concurrent users.
--
-- p_item_id                Case insensitive name of the item for which you
--                          wish to have the session state fetched.
-- p_flow                   Identifies the flow ID
-- p_session_and_user_scope If true (default), will look in session state in both
--                          the session cache and in the user cache.
--                          otherwise, will look only in the session cache and will
--                          omit looking for this value in the user cache.
--                          SESSION caching is caching of session state of an
--                          item value for a flows session.  User caching is
--                          the caching of an item value for a user over all
--                          sessions for that user.
--==============================================================================
function v (
    p_item                   in varchar2,
    p_flow                   in number        default null,
    p_session_and_user_scope in boolean       default true,
    p_escape                 in t_escape_mode default c_escape_mode_raw )
    return varchar2;

--==============================================================================
-- Given a flow-level item name, locate item in current or specified
-- application and current or specified session and return item value.
--
--
-- Security:
--    Caller must be a package,procedure, or function whose
--    owner can be identified by owa_util.who_called_me.
--    This owner will be used to find the security_group_id
--    associated with that schema.
--==============================================================================
function get_item_value (
    p_item         in varchar2,
    p_flow         in number default wwv_flow_security.g_flow_id,
    p_instance     in number default wwv_flow_security.g_instance )
    return varchar2;

--==============================================================================
-- internal helper routine to get an item value by item_id
--
-- ARGUMENTS
-- * p_item_id             id of the item
-- * p_deferred_item_only  if true, ensure that the item has been saved with
--                         get_deferred_session_val_id and return null
--                         otherwise. see wwv_flow_utilities.gen_popup_list.
--==============================================================================
function fetch_value_by_id (
    p_item_id            in number,
    p_deferred_item_only in boolean default false)
    return varchar2;

--==============================================================================
-- internal helper routine to get a numeric item value by item_id
--==============================================================================
function fetch_num_value_by_id (
    p_item_id in number )
    return number;

--==============================================================================
-- internal helper routine to return the changed status
-- (wwv_flow_data.session_state_status)
--==============================================================================
function get_status (
    p_item_properties in wwv_flow_meta_data.t_item_properties )
    return wwv_flow_data.session_state_status%type;

--==============================================================================
-- internal helper routine to return if any session_state_status is 'U'
-- if p_application_id is null, the application id is ignored
--==============================================================================
function is_status_changed (
    p_application_id in number )
    return boolean;

end wwv_flow_session_state;
/
show err

