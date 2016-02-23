set define '^' verify off
prompt ...wwv_flow_meta_data
create or replace package wwv_flow_meta_data as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    DESCRIPTION
--      Fetch meta data for flow rendering
--
--    NOTES
--      Information required to render and process page information is queried from
--      tables using this package.  Template information is queried using the
--      wwv_flow_templates_util package.

--    SECURITY
--      only executable by flows engine
--
--    SECURITY
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--      mhichwa  11/13/1999 - Created
--      mhichwa  12/09/1999 - Added fetch_toplevel_tab_info
--      mhichwa  01/09/2000 - Removed alt_flow_step_id argument
--      mhichwa  01/12/2000 - Added fetch_page_plugs function
--      mhichwa  02/19/2000 - Moved fetch_template_preference from fetch_flow_info
--      mhichwa  05/02/2000 - Added g_first_displayable_field global
--      mhichwa  11/08/2000 - Added static subs
--      mhichwa  12/12/2000 - fetch_required_roles is obsolete
--      mhichwa  12/22/2000 - Added security checks passed global
--      mhichwa  12/26/2000 - Added security checks failed
--      mhichwa  01/20/2001 - Added g_on_new_instance_fired_for
--      mhichwa  08/01/2001 - Set sec failed and fast to 4000 from 5000 bytes
--      tmuth    10/03/2002 - Changed g_first_displayable_field to 50 char instead of 8
--      mhichwa  10/20/2002 - Added fetch_show and accept processing
--      sspadafo 12/27/2002 - Added fetch_show_branch_info and fetch_accept_branch_info (Bug 2729764)
--      sspadafo 02/09/2003 - Added globals for new build option evaluation method (Bug 2748385)
--      sspadafo 02/10/2003 - Added functions fetch_g_build_options_.. to return build option globals (Bug 2748385)
--      sspadafo 02/08/2005 - Added fetch_protected_item_ids, fetch_protected_page_info procedures for URL tampering feature
--      sspadafo 02/27/2006 - Remove obsolete fetch_process_info
--      sspadafo 04/23/2006 - Added fetch_public_page_info for zero session ID feature
--      sspadafo 12/03/2007 - Removed fetch_protected_item_ids procedure
--      mhichwa  09/11/2008 - Added p_mode argument
--      sspadafo 01/11/2009 - Removed obsolete procedure fetch_branch_info
--      pawolf   04/10/2009 - Moved format_lov_query to wwv_flow_meta_data
--      pawolf   06/09/2009 - Added is_ok_to_display and is_valid_build_option
--      pawolf   06/10/2009 - Moved functions from wwv_flow_meta_data to wwv_flow_meta_util
--      cneumuel 06/30/2011 - Added do_static_substitutions and find_static_substitution, moved g_static_substitution% from spec to body (bug #12636771)
--      cneumuel 05/21/2012 - Removed fetch_template_preference, fetch_items_on_new_instance
--      cneumuel 05/24/2012 - Added find_item_by_name, find_item_by_id
--      cneumuel 05/29/2012 - in t_item_properties: removed dependency to wwv_flow_step_items because of dependency problem in coreins.sql (mail vlad)
--      cneumuel 05/31/2012 - In t_item_properties and cursors: add scope (feature #897)
--      cneumuel 06/01/2012 - Added t_item_scope.c_report_scope for saving report metadata in session state
--                          - In find_item_by_name: added p_application_id
--      cneumuel 05/31/2013 - removed g_on_new_instance_fired_for (feature #861)
--      cneumuel 09/11/2013 - Added fetch_flow_record
--      cneumuel 02/21/2014 - Remove obsolete fetch_public_page_info, fetch_protected_page_info (feature #1047)
--      cneumuel 03/11/2014 - result cache optimizations for find_item_by_%
--      cneumuel 03/14/2014 - Remove internal_rc_find_item_by_name from spec
--      cneumuel 04/04/2014 - Moved fetch_button_info and fetch_item_info into fetch_page_plugs. Added get_component_index (feature #1314)
--      cneumuel 04/08/2014 - In get_component_index: use type and id as parameters, not object type
--      cneumuel 06/05/2014 - Added c_process_scope: pseudo item type for process scope session state
--      cneumuel 07/17/2014 - In fetch_step_info: change to procedure that raises error if page not found. optimizations.
--      cneumuel 11/05/2014 - In fetch_branch_info, fetch_process_info, fetch_computations: use result cache and table of record result type
--      cneumuel 02/09/2015 - In find_item_by_name: added p_error_when_not_found (bug #20495355)
--      cneumuel 05/07/2015 - long identifier support (bug #21031940)
--      cneumuel 10/09/2015 - in t_item_properties.protection_level_nr: use wwv_flow_security.t_checksum_protection_type (bug #21973444)
--
--------------------------------------------------------------------------------

--==============================================================================
-- item properties
--==============================================================================
subtype t_item_scope is varchar2(7);
c_page_item_scope    constant t_item_scope := 'PAGE';    -- page item
c_app_item_scope     constant t_item_scope := 'APP';     -- app-local app item
c_global_item_scope  constant t_item_scope := 'GLOBAL';  -- global app item
c_report_scope       constant t_item_scope := 'REPORT';  -- report metadata pseudo-item
c_process_scope      constant t_item_scope := 'PROCESS'; -- process metadata pseudo-item
type t_item_properties is record (
    id                    number,
    security_group_id     number,
    scope                 t_item_scope,
    name                  varchar2(255),
    prompt                varchar2(4000),
    data_type             wwv_flow_step_items.data_type%type,
    restricted_characters varchar2(20),
    is_persistent         varchar2(1),
    is_encrypted          boolean,
    is_password_dnss      boolean,
    escape_on_http_input  boolean,
    protection_level_nr   wwv_flow_security.t_checksum_protection_type not null default wwv_flow_security.c_checksum_type_none );

--==============================================================================
-- package globals
--==============================================================================
g_first_displayable_field      varchar2(50);
g_build_options_included       varchar2(32767);
g_build_options_excluded       varchar2(32767);

--==============================================================================
-- flow level fetch
--==============================================================================
function  fetch_flow_info
    return number;
--==============================================================================
function  fetch_icon_bar_info
    return number;

--==============================================================================
function  fetch_flow_record (
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_application_id    in number )
    return wwv_flows%rowtype;

--==============================================================================
-- page level fetch
-- raises APEX.PAGE.NOT_FOUND if page can not be found
--==============================================================================
procedure  fetch_step_info;

--==============================================================================
function  fetch_tab_info
    return number;
--==============================================================================
function  fetch_toplevel_tab_info (p_tabset in varchar2)
    return number;

--==============================================================================
function fetch_branch_info
    return number;

--==============================================================================
procedure fetch_process_info (
    p_in_accept in boolean );

--==============================================================================
function fetch_g_build_options_included
    return varchar2;
--==============================================================================
function fetch_g_build_options_excluded
    return varchar2;
--==============================================================================
function  fetch_computations
    return number;

--==============================================================================
procedure fetch_item_type_settings;
--==============================================================================
-- fetch regions and optionally also items and buttons into the wwv_flow.g_NNN
-- tables.
--
-- ARGUMENTS
-- * p_include_subcomponents if true (wwv_flow.show), also fetch items and buttons
--==============================================================================
procedure  fetch_page_plugs (
    p_include_subcomponents in boolean );

--==============================================================================
-- for a region, item or button, get it's index in the wwv_flow.g_NNN tables
-- (e.g. wwv_flow.g_plugs).
--==============================================================================
function get_component_index (
    p_type_id      in wwv_flow.t_region_component_type_id,
    p_component_id in number )
    return pls_integer;

--==============================================================================
-- return item properties
--
-- t_item_properties.id is the ID of the ITEM (p_name) or 0 for items that begin
-- with IR and are not an existing item name or -1 if the item is contained in
-- the component value array
--
-- ARGUMENTS
-- * p_name                 the item name
-- * p_application_id       the application
-- * p_error_when_not_found if true (default), raise internal error if the item
--                          can not be found. if false, return an empty record.
--==============================================================================
function find_item_by_name (
    p_name                  in  varchar2,
    p_application_id        in  number default wwv_flow_security.g_flow_id,
    p_error_when_not_found  in  boolean default true )
    return t_item_properties;

--==============================================================================
-- return item properties
--
-- t_item_properties.id is the ID of the ITEM (p_name) or 0 for items that begin
-- with IR and are not an existing item name or -1 if the item is contained in
-- the component value array
--
--==============================================================================
function find_item_by_id (
    p_id in number,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return t_item_properties;

--==============================================================================
-- replace application-level substitution variables in p_str
--==============================================================================
procedure do_static_substitutions (
    p_str in out nocopy varchar2 );
--
--==============================================================================
-- look up application-level substitution variable p_name. if found, return true
-- and the variable's value in p_value
--==============================================================================
function find_static_substitution (
    p_name  in varchar2,
    p_value in out nocopy varchar2 )
    return boolean;

end wwv_flow_meta_data;
/
show errors
