set define '^' verify off
prompt ...htmldb_util
create or replace package htmldb_util authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2003 - 2015. All Rights Reserved.
--
-- NAME
--   htmldb_util.sql

-- DESCRIPTION
--   APEX Utilities
--   Provides procedural access for advanced APEX application development
--
-- SECURITY
--   Publicly executable.
--
-- MODIFIED   (MM/DD/YYYY)
--   mhichwa   10/07/2003 - Created
--   jstraub   10/16/2003 - Added pause procedure
--   sspadafo  06/27/2004 - Add get_file_id function (Bug 3449543)
--   msewtz    07/06/2004 - Added get_since
--   jkallman  08/09/2004 - Add p_workspace argument to count_click
--   sspadafo  09/20/2004 - Add functions from wwv_flow_user_api/wwv_flow_fnd_user_api
--   sspadafo  02/15/2005 - Added function prepare_url
--   sspadafo  02/26/2005 - Added globals g_val_num, g_val_vc2 and functions savekey_num, keyval_num, savekey_vc2, keyval_vc2 for use in correlated subqueries
--   mhichwa   12/08/2005 - removed references to product name
--   sspadafo  11/29/2006 - Added lock_account,unlock_account,get_account_locked_status,expire_workspace_account,unexpire_workspace_account,
--   sspadafo  11/29/2006 - expire_end_user_account,unexpire_end_user_account,workspace_account_days_left,end_user_account_days_left,set_custom_auth_status,
--   sspadafo  11/29/2006 - set_authentication_result,change_password_on_first_use,password_first_use_occurred,get_authentication_status
--   sspadafo  12/10/2006 - Replace get_authentication_status with get_authentication_result
--   madelfio  12/12/2006 - Added flash procedure to accept Anychart parameters
--   madelfio  12/13/2006 - Added instance3 parameter to flash procedure (used by 3DColumn chart)
--   madelfio  12/21/2006 - Added onEnterFrame parameter to flash procedure
--   sathikum  01/17/2007 - Added Month_caleddar procedure
--   sathikum  01/18/2007 - added parameter p_date_type_field to day_calendar,month_calendar and week_calendar
--   mhichwa   01/31/2007 - Added page and region caching wrapper calls
--   madelfio  02/12/2007 - Added j, loading, and waiting parameters to flash procedure (after Anychart changes 02/09/07)
--   mhichwa   02/15/2007 - removed procedure purge_regions_by_id since this would be bad coding practice
--   mhichwa   02/15/2007 - removed function count_stale_regions, becuase it has limited value, and you get this from the views
--   mhichwa   02/15/2007 - changed function name from cache_get_date_cached to cache_get_date_of_page_cache
--   mhichwa   02/16/2007 - removed procedure purge_stale_regions
--   sbkenned  02/16/2007 - updated comments for page and region caching
--   sspadafo  04/27/2007 - Added function cache_get_date_of_region_cache (Bug 5996963)
--   mhichwa   05/23/2007 - Added export application wrapper (bug 6071215)
--   mhichwa   05/24/2007 - Added get_application_id_status (bug 6073463)
--   mhichwa   05/24/2007 - Added minimum_free_application_id (bug 6072916)
--   mhichwa   05/24/2007 - Added function get_application_name (bug 6073463)
--   mhichwa   05/25/2007 - Added export_appliction_page (bug 6075260)
--   mhichwa   05/25/2007 - Added export_appliction_component (bug 6075265)
--   jkallman  10/30/2007 - Added json_from_string, json_from_array, json_from_items
--   cbcho     11/06/2007 - Added flash2
--   mhichwa   01/10/2008 - Added get_blob_file procedure
--   mhichwa   01/11/2008 - Enhanced blob support
--   madelfio  01/15/2008 - Added IR_ procedures
--   madelfio  01/17/2008 - Added IR operators to ir_filter
--   mhichwa   01/17/2008 - Added p_content_disposition
--   mhichwa   01/17/2008 - Added html_pct_graph_mask and filesize_mask functions
--   mhichwa   01/22/2008 - Added and removed comments
--   mhichwa   01/23/2008 - Added procedure get_blob
--   mhichwa   01/23/2008 - Documented iteractive report, and blob procedures and functions
--   sspadafo  01/23/2008 - Added p_description to first fetch_user procedure (Bug 6475019)
--   sspadafo  01/23/2008 - Added account expiration and locking parameters to edit_user procedure (Bug 6474973)
--   sspadafo  01/23/2008 - Added procedure strong_password_check and function strong_password_validation (Bug 6474962)
--   mhichwa   01/24/2008 - Added comments
--   mhichwa   01/24/2008 - Improved html_pct_graph_mask
--   mhichwa   01/24/2008 - Extended html_pct_graph_mask to support width in format mask
--   mhichwa   01/28/2008 - Fixed apex_util.get_blob_file_src example comments
--   msewtz    02/04/2008 - Added wrapper for wwv_flow_utilities.get_print_document and wwv_flow_utility.download_print_document
--   msewtz    02/06/2008 - Added overloaded versions of download_print_document and get_print_document to support supplying XML data in CLOB format
--   sbkenned  02/13/2008 - updated comments for get_blob_file and get_blob_file_src
--   cbackstr  03/24/2008 - add json_from_sql (Bug 6897619)
--   mhichwa   09/09/2008 - Added set_blob procedure
--   mhichwa   09/15/2008 - Changed set_blob into a function returning the file name
--   mhichwa   09/15/2008 - Added g_blob_action column
--   arayner   10/24/2008 - Added overloaded get_group_name function with p_group_id as a number (Bug 7488305)
--   arayner   10/29/2008 - Changed get_file_id parameter p_fname to be p_name (bug 7201348)
--   sspadafo  12/08/2008 - Added set_session_lifetime_minutes, set_session_max_idle_minutes
--   sspadafo  12/22/2008 - Changed name of session timeout procedures to reflect units in seconds
--   sspadafo  01/24/2009 - Added p_not_reusable_err to strong_password_check
--   jstraub   02/06/2009 - Added ws_* functions/procedures for Web services interactions
--   cbcho     05/18/2009 - Added get_ws_file, get_ws_file_src
--   mhichwa   07/29/2009 - Added g_blob_mime_type and g_blob_file_charset
--   jkallman  08/03/2009 - Added function get_since_tswltz
--   jkallman  08/27/2009 - Added set_session_time_zone, get_session_time_zone
--   jstraub   08/27/2009 - Added g_request_headers global and make header parameters consistent for ws_make_request w/ wwv_flow_web_services.make_soap_request
--   jstraub   08/28/2009 - Added ws_make_rest_request
--   jstraub   09/22/2009 - Moved ws_ procedures and functions to wwv_flow_web_services_api
--   mhichwa   10/28/2009 - added SET_SESSION_ACCESSIBLE_OFF and SET_SESSION_ACCESSIBLE_ON
--   mhichwa   11/04/2009 - support ACCESSIBILITY_TOGGLE
--   cbcho     11/05/2009 - Added p_report_alias to ir_filter,ir_clear,ir_reset
--   mhichwa   11/17/2009 - added submit_feedback
--   mhichwa   11/24/2009 - added get_language_selector functions
--   mhichwa   11/24/2009 - added support for additional feedback attributes
--   mhichwa   11/25/2009 - added support for p_email in feedback
--   mhichwa   11/27/2009 - Added get timeframe
--   jkallman  12/10/2009 - Added set_session_lang, get_session_lang, reset_session_lang
--   mhichwa   12/15/2009 - added support for feedback labels
--   mhichwa   12/30/2009 - added feedback_followup procedure and function
--   cbcho     01/22/2010 - Added ir_delete_report
--   cbcho     02/03/2010 - Added get_apex_seq
--   cbcho     02/06/2010 - Removed get_apex_seq
--   jkallman  03/01/2010 - Added get_since_tswtz
--   jkallman  03/02/2010 - Added set_edition, get_edition
--   pawolf    03/10/2010 - Modified get_ws_file* procedures
--   cbcho     03/11/2010 - Removed get_ws_file_src, moved get_ws_file to wwv_flow_file_mgr
--   sathikum  03/29/2010 - added custom_calendar
--   sbkenned  04/07/2010 - added set_security_group_id
--   arayner   04/18/2010 - Changed all accessibility mode related APIs to use "screen reader" text
--   jkallman  04/22/2010 - Added set_session_territory, get_session_territory, reset_session_territory
--   mhichwa   05/25/2010 - change p_type from varchar2 to number in the procedure submit_feedback in support of bug 9749729
--   jkallman  09/15/2010 - Added overloaded implementations of get_since
--   cbcho     10/12/2010 - Added ir_delete_subscription (bug 10185939)
--   sathikum  02/28/2011 - Added delete_user_group (feature #592)
--   jstraub   04/15/2011 - Added host_url
--   pawolf    05/02/2011 - Added redirect_url (feature# 694)
--   arayner   05/26/2011 - Added high contrast mode APIs (feature 637)
--   mhichwa   06/23/2011 - Added get_uuid, get_apex_char_id, get_apex_id, compress_int
--   pawolf    08/05/2011 - Added set_compatibility_mode (bug# 12835127)
--   pawolf    11/03/2011 - Added is_web_safe (bug# 13344998)
--   pawolf    11/14/2011 - Added validate_web_safe and check_web_safe (bug# 13344998)
--   pawolf    01/02/2012 - Removed is_web_safe, validate_web_safe and check_web_safe (bug# 13344998)
--   pawolf    01/04/2012 - Added has_restricted_chars (bug# 13344998)
--   sathikum  01/13/2012 - Added procedure set_build_option_status (Bug# #13050595 )
--   jkallman  02/02/2012 - Added close_open_db_links
--   pawolf    02/03/2012 - Added MUST_NOT_BE_PUBLIC_USER support to public_check_authorization (bug 13682279)
--   sathikum  03/06/2012 - Added agenda_calendar procedure (#812)
--   pawolf    05/02/2012 - Removed flash
--   cbcho     05/14/2012 - Added deprecated comment on ir_* procedures
--   jkallman  06/11/2012 - Added get_build_option_status (#957)
--   jkallman  06/15/2012 - Add additional options to create_user
--   jkallman  08/03/2012 - Added p_default_date_format to create_user, edit_user
--   cneumuel  12/07/2012 - Changed sample domains in docs to example.com (bug #15963390)
--   msewtz    05/21/2013 - Added set_report_column_format to overwrite column format settings for classic reports
--   cneumuel  07/09/2013 - Added set_group_group_grants (feature #1233)
--   cneumuel  07/12/2013 - Added set_group_user_grants (feature #1233)
--   cneumuel  09/11/2013 - Made an invoker rights package
--                        - added reset_password (feature #1276)
--                        - deprecated export_application, export_application_page, export_application_component, get_application_id_status, get_application_name
--   msewtz    01/09/2014 - added feedback_enabled funcion
--   hfarrell  01/10/2014 - Added p_triggering_element and p_dialog to prepare_url
--   cbcho     04/08/2014 - Added uncompress_int
--   vuvarov   06/03/2014 - Deprecated get_language_selector_* functions
--   cneumuel  01/30/2015 - Added get_hash (bug #20384628)
--   cbcho     02/11/2015 - Added set_current_theme_style
--   cneumuel  02/24/2015 - In set_session_state: add p_commit
--   cneumuel  07/01/2015 - Made package definer rights again (bug #21257683)
--
--------------------------------------------------------------------------------

c_must_not_be_public_user constant varchar2(30) := 'MUST_NOT_BE_PUBLIC_USER';

g_blob              blob;                      -- BLOB uploaded via APEX listener
g_blob_mime_type    varchar2(512)  := null;    -- BLOB mimetype via APEX listener
g_blob_file_charset varchar2(512)  := null;    -- BLOB file_charset via APEX listener
g_blob_action       varchar2(512)  := null;    -- owner:table:blob column:pk column name 1:pk column name 2
g_pk1               varchar2(4000) := null;
g_pk2               varchar2(4000) := null;
empty_vc_arr        wwv_flow_global.vc_arr2;

g_request_cookies   utl_http.cookie_table;
g_response_cookies  utl_http.cookie_table;

type header is record (name varchar2(256), value varchar2(1024));
type header_table is table of header index by binary_integer;

g_headers           header_table;
g_request_headers   header_table;

g_status_code       pls_integer;



--##############################################################################
--#
--# LANGUAGE SELECTOR
--# UNDOCUMENTED - DEPRECATED - DO NOT USE
--#
--##############################################################################

--==============================================================================
function get_language_selector_list
    return varchar2;

--==============================================================================
function get_language_selector_ul
    return varchar2;

--==============================================================================
function get_language_selector_ul2
    return varchar2;

--##############################################################################
--#
--# FEEDBACK
--#
--##############################################################################

--==============================================================================
procedure submit_feedback (
    p_comment          in varchar2 default null,
    p_type             in number   default 1,
    p_application_id   in varchar2 default null,
    p_page_id          in varchar2 default null,
    p_email            in varchar2 default null,
    p_screen_width     in varchar2 default null,
    p_screen_height    in varchar2 default null,
    p_attribute_01     in varchar2 default null,
    p_attribute_02     in varchar2 default null,
    p_attribute_03     in varchar2 default null,
    p_attribute_04     in varchar2 default null,
    p_attribute_05     in varchar2 default null,
    p_attribute_06     in varchar2 default null,
    p_attribute_07     in varchar2 default null,
    p_attribute_08     in varchar2 default null,
    p_label_01         in varchar2 default null,
    p_label_02         in varchar2 default null,
    p_label_03         in varchar2 default null,
    p_label_04         in varchar2 default null,
    p_label_05         in varchar2 default null,
    p_label_06         in varchar2 default null,
    p_label_07         in varchar2 default null,
    p_label_08         in varchar2 default null );

--==============================================================================
procedure submit_feedback_followup (
    p_feedback_id      in number,
    p_follow_up        in varchar2 default null,
    p_email            in varchar2 default null );

--==============================================================================
function get_feedback_follow_up (
    p_feedback_id    in number,
    p_row            in number default 1,
    p_template       in varchar2 default '<br />#CREATED_ON# (#CREATED_BY#) #FOLLOW_UP#')
    return varchar2;

function feedback_enabled
      return boolean;

--##############################################################################
--#
--# ACCESSIBILITY
--#
--##############################################################################

--
-- Screen Reader Mode
--

--==============================================================================
function is_screen_reader_session
    return boolean;

--==============================================================================
function is_screen_reader_session_yn
    return varchar2;

--==============================================================================
procedure set_session_screen_reader_on;

--==============================================================================
procedure set_session_screen_reader_off;

--==============================================================================
procedure show_screen_reader_mode_toggle (
    p_on_message  in varchar2 default null,
    p_off_message in varchar2 default null );

--==============================================================================
function get_screen_reader_mode_toggle (
    p_on_message  in varchar2 default null,
    p_off_message in varchar2 default null)
    return varchar2;

--
-- High Contrast Mode
--

--==============================================================================
function is_high_contrast_session
    return boolean;

--==============================================================================
function is_high_contrast_session_yn
    return varchar2;

--==============================================================================
procedure set_session_high_contrast_on;

--==============================================================================
procedure set_session_high_contrast_off;

--==============================================================================
procedure show_high_contrast_mode_toggle (
    p_on_message  in varchar2 default null,
    p_off_message in varchar2 default null);

--==============================================================================
function get_high_contrast_mode_toggle (
    p_on_message  in varchar2 default null,
    p_off_message in varchar2 default null)
    return varchar2;

--##############################################################################
--#
--# SESSION STATE
--#
--##############################################################################

--==============================================================================
-- This function returns the value in session state for a given item.
--
-- PARAMETERS
--   p_item:     Case insensitive name of the item for which you
--               wish to have the session state fetched.
--
-- EXAMPLE
--   l_val := apex_util.get_session_state('my_item');
--==============================================================================
function get_session_state (
    p_item  in varchar2)
    return varchar2;

--==============================================================================
-- This function returns the numeric value in session state for a given
-- numeric item.
--
-- PARAMETERS
--   p_item:     Case insensitive name of the numeric item for which you
--               wish to have the session state fetched.
--
-- EXAMPLE
--   l_num := apex_util.get_numeric_session_state('my_item');
function get_numeric_session_state (
    p_item      in varchar2)
    return number;

--==============================================================================
--
-- Given an application-level item name, locate item in current or specified
-- application and current or specified session and return item value.
--
-- PARAMETERS
--   p_item:     name of application-level item
--   p_app:      application ID that owns the item
--   p_session:  session ID
--
-- EXAMPLE
--  l_num := apex_util.fetch_app_item(p_item=>'F300_NAME',p_app=>300)
--==============================================================================
function fetch_app_item(
    p_item         in varchar2,
    p_app          in number default null,
    p_session      in number default null)
    return varchar2;

--==============================================================================
-- This function returns the numeric primary key of the named file in
-- wwv_flow_file_objects$
--==============================================================================
function get_file_id(
    p_name in varchar2)
    return number;

--==============================================================================
-- This procedure is used to download files from the HTMLDB file
-- repository.
--
-- PARAMETERS
--   p_file_id:      The id in wwv_flow_files of the file to download.
--   p_mime_type:    The mime type of the file to download
--   p_inline:       'YES' to display inline in browser, 'NO' to download as
--                   attachment
--
-- EXAMPLE
--   apex_util.get_file(
--       p_file_id   => '8675309',
--       p_mime_type => 'text/xml',
--       p_inline    => 'YES');
--==============================================================================
procedure get_file (
    p_file_id   in varchar2,
    p_mime_type in varchar2 default null,
    p_inline    in varchar2 default 'NO');

--==============================================================================
-- This procedure is used to count clicks from an application to external site.
--
-- PARAMETERS
--   p_url:          the url to redirect to
--   p_cat:          a category to classify the click
--   p_id:           a secondary id to associate with the click <-- optional
--   p_user:         the application user <-- optional
--   p_workspace:    the workspace associated with the application <-- optional (deprecated)
--   p_workspace:    the workspace associated with the application <-- optional
--==============================================================================
procedure count_click (
    p_url       in varchar2,
    p_cat       in varchar2,
    p_id        in varchar2    default null,
    p_user      in varchar2    default null,
    p_company   in varchar2    default null,
    p_workspace in varchar2    default null);

--==============================================================================
-- Programmatically set session state for a current session.
-- This procedure must be called from Application Express since it requires
-- the Application Express environment.
--
-- PARAMETERS
--   p_name:   Name of application or page level item to set session state for
--   p_value:  Value of session state to set.
--   p_commit: If true (the default), commit after modifying session state. If
--             false or if the existing value in session state equals p_value,
--             no commit is issued.
--
-- EXAMPLE
--   The following example shows how to use the SET_SESSION_STATE procedure to
--   set the value of the item 'my_item' to 'myvalue' in the current session.
--
--   apex_util.set_session_state('my_item','myvalue');
--==============================================================================
procedure set_session_state (
    p_name    in varchar2 default null,
    p_value   in varchar2 default null,
    p_commit  in boolean  default true );

--==============================================================================
-- OBSOLETE
--   use apex_authorization.reset_cache instead
--
-- Security checks are cached to increase performance, this procedure allows you to
-- undo the caching and thus require all security checks to be revalidated for the
-- current user.  Use this routine if you allow a user to change "responcibilities"
-- within an application, thus changing the authorization checks that they pass.
--
-- EXAMPLE
--   apex_util.reset_authorizations;
--==============================================================================
procedure reset_authorizations;

--==============================================================================
-- OBSOLETE
--   use apex_authorization.is_authorized instead
--
-- Given the name of a flow security scheme determine if the current user
-- passes the security check.
--
-- You can also check for the predefined authorization MUST_NOT_BE_PUBLIC_USER,
-- use the constant c_must_not_be_public_user to reference it.
--
-- PARAMETERS
--   p_security_scheme
--
-- EXAMPLE
--  l_boolean := apex_util.public_check_authorization('MY_SECURITY_SCHEME');
--==============================================================================
function public_check_authorization (
    p_security_scheme in varchar2)
    return boolean;

--##############################################################################
--#
--# STRING / TABLE CONVERSION
--#
--##############################################################################

--==============================================================================
--This function takes in a string and returns a PL/SQL array, of type
--wwv_flow_global.vc_arr2, which is a table of varchar2(32767).
--
-- PARAMETERS
--
-- p_string:    string to be converted into a plsql table of type wwv_flow_global.vc_arr2
-- p_separator: string seperator, by default a colon.
--
--EXAMPLE
--  l_vc_arr2 := apex_util.string_to_table('ONE:TWO:THREE');
--==============================================================================
function string_to_table (
    p_string    in varchar2,
    p_separator in varchar2 default ':')
    return wwv_flow_global.vc_arr2;

--==============================================================================
--This function takes in a PL/SQL table of type wwv_flow_global.vc_arr2
--and returns a string separated by the separator supplied, or a ':' by default.
--
-- PARAMETERS
--   p_table:     PL/SQL table that is to be converted into delimited string
--   p_string:   string seperator, by default a colon.
--
-- EXAMPLE
--   l_string := apex_util.table_to_string(l_vc_arr2);
--==============================================================================
function table_to_string (
    p_table     in wwv_flow_global.vc_arr2,
    p_string    in varchar2 default ':')
    return varchar2;

--==============================================================================
-- compute a hash value for all given values. this function can be used to
-- implement lost update detection for data records.
--
-- PARAMETERS
-- * p_values    input values
-- * p_salted    if true (the default), salt hash with internal session info
--
-- EXAMPLE
--   Update SAL/COMM of a given EMP record, but fail if data has changed.
--
--   declare
--       l_hash varchar2(4000);
--   begin
--       select apex_util.get_hash(apex_t_varchar2 (
--                  empno, sal, comm ))
--         into l_hash
--         from emp
--        where empno = :P1_EMPNO;
--
--       if :P1_HASH <> l_hash then
--           raise_application_error(-20001, 'Somebody already updated SAL/COMM');
--       end if;
--
--       update emp
--          set sal = :P1_SAL,
--              comm = :P1_COMM
--        where empno = :P1_EMPNO;
--   exception when no_data_found then
--       raise_application_error(-20001, 'Employee not found');
--   end;
--==============================================================================
function get_hash (
    p_values in wwv_flow_t_varchar2,
    p_salted in boolean default true )
    return varchar2;

--==============================================================================
-- Encode (into HEX) all special characters which includes spaces,
-- question marks, ampersands, etc.
--
-- PARAMETERS
--   p_string:    The string you would like to have encoded
--
-- EXAMPLES
--   l_url := apex_util.url_encode('http://www.myurl.com?id=1&cat=foo');
--==============================================================================
function url_encode (
    p_url       in varchar2)
    return varchar2;

--==============================================================================
-- Return the virtual GUID used by APEX to generate component primary keys
--==============================================================================
function get_apex_id
    return number;

--==============================================================================
-- Return the virtual GUID used by APEX to generate component primary keys
-- compressed into alpha numberic format
--==============================================================================
function get_apex_char_id
    return varchar2;

--==============================================================================
-- Return a minimum of 4 character alphanumeric compressed value for an integer
--
-- PARAMETERS
--   p_number: any integer
--==============================================================================
function compress_int (
    p_number in integer)
    return   varchar2;

--==============================================================================
-- Return the number used in compress_int
--
-- PARAMETERS
--   p_str: alphanumeric character of compressed value
--==============================================================================
function uncompress_int (p_str in varchar2)
    return number;

--==============================================================================
-- Used to get return a uuid formatted guid
--==============================================================================
function get_uuid
    return varchar2;

--==============================================================================
-- Reset all cached items for a given page to null
--
-- PARAMETERS
--   p_page_id:   The ID of the page in the current application and session to clear the cache for
--
-- EXAMPLE
--   apex_util.clear_page_cache(1);
--==============================================================================
procedure clear_page_cache (
    p_page_id in number default null);

--==============================================================================
--For the current session remove session state for the given flow.
--
--PARAMETERS
--  p_app_id:   The ID of the application to clear the cache for current session
--
--EXAMPLE
--  apex_util.clear_app_cache('101');
--==============================================================================
procedure clear_app_cache (
    p_app_id    in varchar2 default null);

--==============================================================================
--For the current user's session remove session state and flow system preferences.
--Run this procedure if you reuse session IDs and want to run htmldb application without
--the benifit of existing session state.
--
--EXAMPLE
--  apex_util.clear_user_cache;
--==============================================================================
procedure clear_user_cache;

--==============================================================================
-- Pause for number of seconds identified by p_seconds
--  (capped at 120 seconds)
--==============================================================================
procedure pause (
    p_seconds   in number);

--##############################################################################
--#
--# GET_SINCE AND VARIANTS
--#
--##############################################################################


--==============================================================================
-- Used to get a string representation of the time in days, examples: 5 days, 2 weeks, 8 seconds.
--
-- PARAMETERS
--   p_days: numeric number of days
--==============================================================================
function get_timeframe (
    p_days in number default null)
    return varchar2;

--==============================================================================
-- Used to get a string representation of the time passed since the input date
--
-- PARAMETERS
--   p_date: date that is used to compute time since p_date and sysdate
--==============================================================================
function get_since(
    p_date date)
    return varchar2;

--==============================================================================
function get_since(
    p_value in timestamp )
    return varchar2;

function get_since(
    p_value in timestamp with time zone )
    return varchar2;

function get_since(
    p_value in timestamp with local time zone )
    return varchar2;

--==============================================================================
-- Used to get a string representation of the time passed since the input
-- timestamp with time zone
--
-- PARAMETERS
--   p_timestamp: timestamp with time zone  that is used to compute time since p_timestamp and systimestamp
--==============================================================================
function get_since_tswtz(
    p_timestamp in timestamp with time zone )
    return varchar2;

--==============================================================================
-- Used to get a string representation of the time passed since the input
-- timestamp with local time zone
--
-- PARAMETERS
--   p_ltimestamp: timestamp with local time zone  that is used to compute time since p_ltimestamp and localtimestamp
--==============================================================================
function get_since_tswltz(
    p_ltimestamp in timestamp with local time zone )
    return varchar2;

--##############################################################################
--#
--# USER PREFERENCES
--#
--##############################################################################

--==============================================================================
--Used to set a preference for a user that persists beyond the user's current session.
--
--PARAMETERS
--  p_preference:   name of the preference, case sensitive
--  p_value:        the value for the preference
--  p_user:         the user to set the preference for
--
--EXAMPLE
--  apex_util.set_preference(
--      p_preference => 'default_view',
--      p_value      => 'WEEKLY',
--      p_user       => :APP_USER);
--==============================================================================
procedure set_preference (
    p_preference   in varchar2 default null,
    p_value        in varchar2 default null,
    p_user         in varchar2 default null);

--==============================================================================
--Used to retrieve the value of a previously saved preference for a given user.
--
--PARAMETERS
--  p_prefernce:    the name of the preference to retrieve the value
--  p_user:         the user to retrieve the preference for
--
--EXAMPLE
--  l_default_view := apex_util.get_preference(
--                      p_preference => 'default_view',
--                      p_user       => :APP_USER);
--==============================================================================
function get_preference (
    p_preference   in varchar2 default null,
    p_user         in varchar2 default v('USER'))
    return varchar2;

--==============================================================================
--Removes the preference for the supplied user.
--
--PARAMETERS
--  p_preference:   the name of the preference to remove
--  p_user:         the user to remove the preference for
--
--EXAMPLE
--  apex_util.remove_preference(
--      p_preference => 'default_view',
--      p_user       => :APP_USER);
--==============================================================================
procedure remove_preference(
    p_preference   in varchar2 default null,
    p_user         in varchar2 default v('USER'));

--==============================================================================
-- This procedure removes user's column heading sorting preference value.
--
--PARAMETERS
--  p_user:         the user to remove sorting preferences for
--
--EXAMPLE
--  apex_util.remove_sort_preferences;
--==============================================================================
procedure remove_sort_preferences (
    p_user         in varchar2 default v('USER'));

--##############################################################################
--#
--# USERS AND GROUPS
--#
--##############################################################################

--==============================================================================
-- Given a group name return a boolean true or false if the current
-- application user is part of that group.
--
-- EXAMPLE
--   if apex_util.current_user_in_group('MY_GROUP') then ...
--==============================================================================
function current_user_in_group (
   p_group_name          in varchar2 )
   return boolean;

--==============================================================================
-- Given a group numeric identifier return a boolean true or false if the current
-- application user is part of that group.
--
-- EXAMPLE
--   if apex_util.current_user_in_group(1234567) then ...
--
--   The above example assumes that 1234567 is a valid group ID.
--==============================================================================
function current_user_in_group (
   p_group_id            in number)
   return boolean;

--==============================================================================
-- Checks the wwv_flow_fnd_users table to see if username/password combo is
-- valid within the current workspace (checking by security_group_id)
--==============================================================================
function is_login_password_valid (
   p_username in varchar2 default null,
   p_password  in varchar2 default null)
   return boolean;

--==============================================================================
-- Simply checks wwv_flow_fnd_users table to see if
-- username is unique within the current workspace (checking by security_group_id)
--==============================================================================
function is_username_unique (
   p_username              in varchar2)
   return boolean;

--==============================================================================
-- Given a group name return the groups numeric identifier.
--
-- EXAMPLE
--   ... apex_util.get_group_name('MY_GROUP') ...
--==============================================================================
function get_group_id (
   p_group_name          in varchar2 )
   return number;

--==============================================================================
-- Given a group ID return the aphanumeric name.
--
-- EXAMPLE
--   ... apex_util.get_group_name(1234567) ...
--==============================================================================
function get_group_name (
   p_group_id            in varchar2 )
   return varchar2;

--==============================================================================
-- Added overloaded version with correct number type for p_group_id.
-- Given a group ID (numeric) return the aphanumeric name.
--
-- EXAMPLE
--   ... apex_util.get_group_name(1234567) ...
--==============================================================================
function get_group_name (
   p_group_id            in number )
   return varchar2;

--==============================================================================
-- For a given user return the identified email address from the fnd user table.  Only works
-- with standard user management system.  If you use applications with
-- other user repositories this API will not return useful information.
--
-- EXAMPLE
--   ... apex_util.get_email('JOE.USER')
--
--   The example above assumes a username JOE.USER exists.
--==============================================================================
function get_email (
   p_username            in varchar2)
   return varchar2;

--==============================================================================
-- For a given user return the identified first name.  Only works
-- with standard user management system.  If you use applications with
-- other user repositories this API will not return useful information.
--
-- EXAMPLE
--   ... apex_util.get_first_name('JOE_USER')
--
--   The example above assumes a username JOE_USER exists.
--==============================================================================
function get_first_name (
   p_username            in varchar2)
   return varchar2;

--==============================================================================
-- For a given user return the identified last name.  Only works
-- with standard user management system.  If you use with
-- other user repositories this API will not return useful information.
--
-- EXAMPLE
--   ... apex_util.get_last_name('JOE_USER')
--
--   The example above assumes a username JOE_USER exists.
--==============================================================================
function get_last_name (
   p_username            in varchar2)
   return varchar2;

--==============================================================================
-- For the current user return the numeric identifier.  Only
-- useful when useing user management system.
function get_current_user_id
   return number;

--==============================================================================
-- Given a username return the numeric idenfier.
--
-- EXAMPLE
--   ... apex_util.get_user_id('JOE_USER')
--
--   The example above assumes JOE_USER is a valid username.
--==============================================================================
function get_user_id (
   p_username            in varchar2)
   return number;

--==============================================================================
-- Given a user ID return the username.
--
-- EXAMPLE
--   ... apex_util.get_username(222222)
--
--   The example above assumes 222222 is a valid user ID.
--==============================================================================
function get_username (
   p_userid              in number)
   return varchar2;

--==============================================================================
-- Given a user name and attribute number, valid values are 1..10
-- return the attribute value.  The wwv_flow_fnd_user table contains
-- 10 columns attribute_01 .. attribute_10 for extra user attributes.
--==============================================================================
function get_attribute (
   p_username             in varchar2,
   p_attribute_number     in number)
   return varchar2;

--==============================================================================
-- Given a username returns a comma seperated list of groups that
-- this user is a member of.
--
-- EXAMPLE
--   htp.p('user JOE_USER is a member of the following groups: '||
--         apex_util.get_groups_user_belongs_to('JOE_USER'));
--==============================================================================
function get_groups_user_belongs_to (
   p_username            in varchar2)
   return varchar2;

--==============================================================================
-- For the currently logged in user, return the schema that the workspace
-- was provisioned with, by default.
--==============================================================================
function get_default_schema
   return varchar2;

--==============================================================================
-- For a given userid set the identified email address.  Only works
-- with standard user management system.  If you use with
-- other user repositories this API will not set useful information.
--
-- EXAMPLE
--   ... apex_util.set_email(222222,'MIKE@HOTMAIL.COM')
--
--   The example above assumes a user ID 222222 exists.
--   An error will be raised in the event this procedure fails.
--==============================================================================
procedure set_email (
   p_userid              in number,
   p_email               in varchar2);

--==============================================================================
-- For a given user set the identified first name.  Only works
-- with standard user management system.  If you use with
-- other user repositories this API will not return useful information.
--
-- EXAMPLE
--   ... apex_util.set_first_name(222222,'Mike')
--
--   The example above assumes a user ID 222222 exists.
--   An error will be raised in the event this procedure fails.
--==============================================================================
procedure set_first_name (
   p_userid              in number,
   p_first_name          in varchar2);

--==============================================================================
-- For a given user set the identified last name.  Only works
-- with standard user management system.  If you use with
-- other user repositories this API will not return useful information.
--
-- EXAMPLE
--   ... apex_util.set_last_name('JOE_USER')
--
--   The example above assumes a username JOE_USER exists.
--   An error will be raised in the event this procedure fails.
--==============================================================================
procedure set_last_name (
   p_userid              in number,
   p_last_name           in varchar2);

--==============================================================================
-- Given a user ID set the username.
--
-- EXAMPLE
--   ... apex_util.set_username(222222,'JOE')
--
--   The example above assumes 222222 is a valid user ID.
--   An error will be raised in the event this procedure fails.
--==============================================================================
procedure set_username (
   p_userid              in number,
   p_username            in varchar2);

--==============================================================================
-- Given a user ID and attribute number, valid values are 1..10
-- set the attribute value.  The wwv_flow_fnd_user table contains
-- 10 columns attribute_01 .. attribute_10 for extra user attributes.
-- An error will be raised in the event this procedure fails.
--
-- EXAMPLE
--   ... apex_util.set_attribute(22222,1,'likes sailing and tennis');
--==============================================================================
procedure set_attribute (
   p_userid               in number,
   p_attribute_number     in number,
   p_attribute_value      in varchar2);

--==============================================================================
-- This procedure exports all users in a the current workspace, designed
-- to be called from the development environment.
--==============================================================================
procedure export_users (
    p_export_format in varchar2 default 'UNIX');

--==============================================================================
-- This procedure allows for programatic and bulk creation of users.
--
-- PARAMETERS
--    p_id                = unique identifier of the group, typically a large virtually globally unique number.
--    p_group_name        = name of group
--    p_security_group_id = identifies which workspace this user group belongs to
--    p_group_desc        = text description used as an note to the developer
--==============================================================================
procedure create_user_group (
    p_id                      in number    default null,
    p_group_name              in varchar2,
    p_security_group_id       in number    default null,
    p_group_desc              in varchar2  default null );

--==============================================================================
-- This procedure allows for removal of group from wwv_flow_fnd_user_groups.
-- This procedure is overloaded.
--
-- PARAMETERS
--    p_group_id          = unique identifier of the group, typically a large virtually globally unique number.
--==============================================================================
procedure delete_user_group (
    p_group_id                 in number);

--==============================================================================
-- This procedure allows for removal of group from wwv_flow_fnd_user_groups.
-- This procedure is overloaded.
--
-- PARAMETERS
--    p_group_name          = group name.
--==============================================================================
procedure delete_user_group (
    p_group_name              in varchar2);

--==============================================================================
-- Modify the group grants for a given group.
--
-- PARAMETERS
--   p_group_name               = target group name
--   p_granted_group_names      = names of groups that should be granted to p_group_name
--
-- EXAMPLE
--   -- create 3 groups
--   apex_util.create_user_group (
--       p_group_name => 'ACCTS_PAY' );
--   apex_util.create_user_group (
--       p_group_name => 'ACCTS_REC' );
--   apex_util.create_user_group (
--       p_group_name => 'MANAGER' );
--   -- grant ACCTS_PAY and ACCTS_REC to MANAGER
--   apex_util.set_group_group_grants (
--       p_group_name          => 'MANAGER',
--       p_granted_group_names => apex_t_varchar2('ACCTS_PAY', 'ACCTS_REC') );
--==============================================================================
procedure set_group_group_grants (
    p_group_name              in varchar2,
    p_granted_group_names     in wwv_flow_t_varchar2 );

--==============================================================================
-- Modify the group grants for a given user.
--
-- PARAMETERS
--   p_user_name                = target user name
--   p_granted_group_names      = names of groups that should be granted to p_user_name
--
-- EXAMPLE
--   -- create group and user
--   apex_util.create_user_group (
--       p_group_name => 'MANAGER' );
--   apex_util.create_user (
--       p_user_name    => 'Example User',
--       p_web_password => l_random_password );
--   -- grant MANAGER to Example User
--   apex_util.set_group_user_grants (
--       p_user_name           => 'Example User',
--       p_granted_group_names => apex_t_varchar2('MANAGER') );
--==============================================================================
procedure set_group_user_grants (
    p_user_name               in varchar2,
    p_granted_group_names     in wwv_flow_t_varchar2 );

--==============================================================================
-- This procedure allows for programatic and bulk creation of users.
--
-- PARAMETERS
--    p_user_id         numeric primary key of user
--    p_user_name       the username the user uses to login
--    p_first_name      informational only
--    p_last_name       informational only
--    p_web_password    the unencrypted password for the new user
--    p_group_ids       A colon delimited list of group IDs from the table wwv_flow_fnd_user_groups
--    p_developer_privs A colon delmited list of developer privs, privs include:
--                      ADMIN:BROWSE:CREATE:DATA_LOADER:DB_MONITOR:EDIT:HELP:MONITOR:SQL:USER_MANAGER
--    p_default_schema  A valid oracle schema that is the default schema for use in browsing and
--                      creating Application Express
--    p_default_date_format Oracle Date format for user, used for now only in SQL Workshop
--    p_allow_access_to_schemas A colon delimited list of oracle schemas that the user is allowed to
--                      parse as.  If null the user can parse as any schema available to the workspace.
--                      This does not provide privilege it only resticts privilege, so listing a schema
--                      does not provide the privilege to parse as a schema, it only restricts that user
--                      to that list of schemas.
--    p_attributes_XX   These attributes allow you to store arbitary information about a given user.
--                      They are for use by flow developers who want to extend user information.
--    p_web_password_format Identifies the format of the web password.
--                      The range of values is CLEAR_TEXT, HEX_ENCODED_DIGEST, DIGEST
--
-- EXAMPLE
--    From sqlplus logged in as a schema assigned to the target workspace
--
--    begin
--       for i in 1..10 loop
--          apex_util.create_user(
--             p_user_name => 'USER_'||i,
--             p_email_address => 'user_'||i||'@myworkspace.com',
--             p_web_password => 'user_'||i) ;
--       end loop;
--       commit;
--    end;
--    /
--==============================================================================
procedure create_user (
    p_user_id                      in number   default null,
    p_user_name                    in varchar2,
    p_first_name                   in varchar2 default null,
    p_last_name                    in varchar2 default null,
    p_description                  in varchar2 default null,
    p_email_address                in varchar2 default null,
    p_web_password                 in varchar2,
    p_web_password_format          in varchar2 default 'CLEAR_TEXT',
    p_group_ids                    in varchar2 default null,
    p_developer_privs              in varchar2 default null,
    p_default_schema               in varchar2 default null,
    p_default_date_format          in varchar2 default null,
    p_allow_access_to_schemas      in varchar2 default null,
    p_account_expiry               in date     default trunc(sysdate),
    p_account_locked               in varchar2 default 'N',
    p_failed_access_attempts       in number   default 0,
    p_change_password_on_first_use in varchar2 default 'Y',
    p_first_password_use_occurred  in varchar2 default 'N',
    p_attribute_01                 in varchar2 default null,
    p_attribute_02                 in varchar2 default null,
    p_attribute_03                 in varchar2 default null,
    p_attribute_04                 in varchar2 default null,
    p_attribute_05                 in varchar2 default null,
    p_attribute_06                 in varchar2 default null,
    p_attribute_07                 in varchar2 default null,
    p_attribute_08                 in varchar2 default null,
    p_attribute_09                 in varchar2 default null,
    p_attribute_10                 in varchar2 default null,
    p_allow_app_building_yn        in varchar2 default null,
    p_allow_sql_workshop_yn        in varchar2 default null,
    p_allow_websheet_dev_yn        in varchar2 default null,
    p_allow_team_development_yn    in varchar2 default null );

--==============================================================================
-- This procedure allows for programatic and bulk creation of users from a text
-- file.  The file must be in one of two formats.
--
-- FORMAT 1
--    username,email,PRIV1:PRIV2,password
--
-- FORMAT 2
--    username,email,PRIV1:PRIV2
--
-- PRIV1:PRIV2 is a colon delimited list of developer privelages of the
-- user.  Valid privelages are detailed in create_fnd_user spec.
--
-- Each line must end with a line feed (chr(10)).
--
-- PARAMETERS
--    p_id          The id of the file in wwv_flow_file_objects$
--    p_mode        Either CREATE or display depending on whether you
--                  actually want to create the users or just display them
--                  via htp.p
--    p_format      Can be either 1, 2 or 3.  Refers to the format of the file
--                  and the create user process.  1: passwords are contained in
--                  the file in clear text.  2: passwords have been supplied via
--                  the p_password parameter.  3: passwords should be randomly
--                  generated and then e-mailed to the user.
--    p_password    Only relevant in format 2.  Every user created is given the
--                  password supplied in this parameter.
--    p_app         The name of the application.  This name appears in the subject
--                  and body of the e-mail message sent to users when format is 3.
--    p_appurl      Optional URL can be supplied when file format is 3.  The URL will
--                  appear at the end of the mail message.
--    p_start       This parameter holds the start time of execution
--    p_end         Parameter holds the time the procedure completes
--    p_loaded      The number of users that were provisioned by the execution of the
--                  procedure.
--==============================================================================
procedure create_user_from_file (
    p_id in number,
    p_mode      in varchar2 default 'CREATE',
    p_format    in varchar2 default '1',
    p_password  in varchar2 default 'oracle',
    p_app       in varchar2 default null,
    p_appurl    in varchar2 default null,
    p_start    out varchar2,
    p_end      out varchar2,
    p_loaded   out varchar2 );

--==============================================================================
-- This procedure allows for programatic removal of users.
-- This procedure is overloaded.
--==============================================================================
procedure remove_user (
    p_user_id         in number);

--==============================================================================
-- This procedure allows for programatic removal of users.
-- This procedure is overloaded.
--
-- EXAMPLE
--    begin wwv_flow_security.g_security_group_id := 20; end;
--    /
--
--    begin
--       for i in 1..10 loop
--          wwv_flow_fnd_user_api.remove_fnd_user(
--             p_user_name => 'USER_'||i);
--       end loop;
--       commit;
--    end;
--    /
--==============================================================================
procedure remove_user (
    p_user_name       in varchar2 );

--==============================================================================
-- This procedure changes the current user's password.
--==============================================================================
procedure change_current_user_pw (
    p_new_password    in varchar2 );

--==============================================================================
-- This procedure resets the named user's password.
--==============================================================================
procedure reset_pw (
    p_user                  in varchar2,
    p_msg                   in varchar2 );

--==============================================================================
-- change password of p_user_name in the current workspace to p_new_password.
-- If p_change_password_on_first_use is true, then the user has to change the
-- password on the next login.
--
-- this procedure can be used to implement a custom change my password page in
-- an application.
--
-- PARAMETERS
-- * p_user_name                    the user whose password should be changed.
--                                  defaults to the currently logged in APEX
--                                  user.
-- * p_old_password                 the old (current) password of the user. if
--                                  the value is not the user's password, an
--                                  error occurs. the call also succeeds if the
--                                  given value is null and the owner of the
--                                  calling PL/SQL code has
--                                  APEX_ADMINISTRATOR_ROLE.
-- * p_new_password                 the new password
-- * p_change_password_on_first_use if true (default), then the user has to
--                                  change the password on the next login.
--
-- RAISES
-- * INVALID_CREDENTIALS            p_user_name/p_old_password mismatch
-- * APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER authentication was prevented by
--                                  login throttle
-- * internal error                 p_old_password is null and caller does not
--                                  have APEX_ADMINISTRATOR_ROLE
-- * internal error                 caller is not a valid workspace schema
--
-- EXAMPLE
--   apex_util.reset_password (
--       p_old_password => :P111_OLD_PASSWORD,
--       p_new_password => :P111_NEW_PASSWORD );
--==============================================================================
procedure reset_password (
    p_user_name                    in varchar2 default wwv_flow_security.g_user,
    p_old_password                 in varchar2 default null,
    p_new_password                 in varchar2,
    p_change_password_on_first_use in boolean default true );

--==============================================================================
-- obsolete
--==============================================================================
function user_in_group (
    p_group_name in varchar2)
    return boolean;

--==============================================================================
-- Return the colon-delimited list of developer roles
-- for the specified user in the current workspace
--==============================================================================
function get_user_roles (
    p_username              in varchar2)
    return varchar2;

--==============================================================================
-- given a workspace short name return the security group id
-- p_workspace = short name of workspace
--==============================================================================
function find_security_group_id (
     p_workspace  in varchar2 default null)
     return number;

--==============================================================================
-- given a security_group_id, return the workspace short name
-- p_workspace = short name of workspace
--==============================================================================
function find_workspace (
     p_security_group_id  in varchar2 default null)
     return varchar2;

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_user (
     p_user_id       in number,
     p_workspace       out varchar2,
     p_user_name     out varchar2,
     p_first_name    out varchar2,
     p_last_name     out varchar2,
     p_web_password  out varchar2,
     p_email_address out varchar2,
     p_start_date    out varchar2,
     p_end_date      out varchar2,
     p_employee_id   out varchar2,
     p_allow_access_to_schemas out varchar2,
     p_person_type     out varchar2,
     p_default_schema  out varchar2,
     p_groups          out varchar2,
     p_developer_role  out varchar2,
     p_description     out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_user (
     p_user_id         in number,
     p_user_name       out varchar2,
     p_first_name      out varchar2,
     p_last_name       out varchar2,
     p_email_address   out varchar2,
     p_groups          out varchar2,
     p_developer_role  out varchar2,
     p_description     out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_user (
     p_user_id                      in number,
     p_workspace                    out varchar2,
     p_user_name                    out varchar2,
     p_first_name                   out varchar2,
     p_last_name                    out varchar2,
     p_web_password                 out varchar2,
     p_email_address                out varchar2,
     p_start_date                   out varchar2,
     p_end_date                     out varchar2,
     p_employee_id                  out varchar2,
     p_allow_access_to_schemas      out varchar2,
     p_person_type                  out varchar2,
     p_default_schema               out varchar2,
     p_groups                       out varchar2,
     p_developer_role               out varchar2,
     p_description                  out varchar2,
     p_account_expiry               out date,
     p_account_locked               out varchar2,
     p_failed_access_attempts       out number,
     p_change_password_on_first_use out varchar2,
     p_first_password_use_occurred  out varchar2 );

--==============================================================================
-- Edit user information to
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
--==============================================================================
procedure edit_user (
     p_user_id                      in number,
     p_user_name                    in varchar2,
     p_first_name                   in varchar2 default null,
     p_last_name                    in varchar2 default null,
     p_web_password                 in varchar2 default null,
     p_new_password                 in varchar2 default null,
     p_email_address                in varchar2 default null,
     p_start_date                   in varchar2 default null,
     p_end_date                     in varchar2 default null,
     p_employee_id                  in varchar2 default null,
     p_allow_access_to_schemas      in varchar2 default null,
     p_person_type                  in varchar2 default null,
     p_default_schema               in varchar2 default null,
     p_default_date_format          in varchar2 default null,
     p_group_ids                    in varchar2 default null,
     p_developer_roles              in varchar2 default null,
     p_description                  in varchar2 default null,
     p_account_expiry               in date     default null,
     p_account_locked               in varchar2 default 'N',
     p_failed_access_attempts       in number   default 0,
     p_change_password_on_first_use in varchar2 default 'Y',
     p_first_password_use_occurred  in varchar2 default 'N' );

--==============================================================================
procedure lock_account (
     p_user_name     in varchar2 );

--==============================================================================
procedure unlock_account(
     p_user_name     in varchar2 );

--==============================================================================
function get_account_locked_status (
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
procedure expire_workspace_account (
    p_user_name in varchar2 );

--==============================================================================
procedure unexpire_workspace_account(
    p_user_name in varchar2 );

--==============================================================================
procedure expire_end_user_account(
    p_user_name in varchar2 );

--==============================================================================
procedure unexpire_end_user_account(
    p_user_name in varchar2 );

--==============================================================================
function workspace_account_days_left(
    p_user_name in varchar2)
    return number;

--==============================================================================
function end_user_account_days_left(
    p_user_name in varchar2)
    return number;

--==============================================================================
procedure set_custom_auth_status(
    p_status in varchar2 );

--==============================================================================
procedure set_authentication_result(
    p_code in number );

--==============================================================================
function change_password_on_first_use(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
function password_first_use_occurred(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
function get_authentication_result
    return number;

--==============================================================================
-- If URL is f?p format, do escape_url on the argument values only.
-- This function assumes that all substitutions, e.g., &ITEM_NAME. substitutions have already been performed.
--==============================================================================
function prepare_url(
    p_url                in varchar2,
    p_url_charset        in varchar2 default null,
    p_checksum_type      in varchar2 default null,
    p_triggering_element in varchar2 default 'this',
    p_dialog             in varchar2 default 'null')
    return varchar2;

--==============================================================================
function savekey_num (
    p_val in number )
    return number;

--==============================================================================
function keyval_num
    return number;

--==============================================================================
function savekey_vc2 (
    p_val in varchar2 )
    return varchar2;

--==============================================================================
function keyval_vc2
    return varchar2;

--==============================================================================
procedure flash2 (
    p                    in varchar2,
    preloaderLoadingText in varchar2 default null,
    swffile              in varchar2 default null,
    preloaderInitText    in varchar2 default null,
    XMLCallDate          in varchar2 default null );

--##############################################################################
--#
--# CALENDAR
--#
--##############################################################################

--==============================================================================
procedure increment_calendar;

--==============================================================================
procedure decrement_calendar;

--==============================================================================
procedure today_calendar;

--==============================================================================
procedure custom_calendar(p_date_type_field varchar2 default null);

--==============================================================================
procedure weekly_calendar(p_date_type_field varchar2 default null);

--==============================================================================
procedure daily_calendar(p_date_type_field varchar2 default null);

--==============================================================================
procedure agenda_calendar(p_date_type_field varchar2 default null);

--==============================================================================
procedure month_calendar(p_date_type_field varchar2 default null);

--##############################################################################
--#
--# PAGE AND REGION CACHING APIS
--#
--##############################################################################

--==============================================================================
-- Purges all cached pages and regions for a given application.
--==============================================================================
procedure cache_purge_by_application (
   p_application    in number);

--==============================================================================
-- Purges all cached pages and regions for a given application and page.
-- If p_user_name is supplied, only that user's cached pages and regions
-- will be purged.
--==============================================================================
procedure cache_purge_by_page (
   p_application  in number,
   p_page         in number,
   p_user_name    in varchar2 default null);

--==============================================================================
-- Deletes all cached pages and regions for the specified application
-- that have passed their timeout.  When you select to have a page or
-- region be cached, you can specify an active time period.  Once that
-- has passed, that cache will not be used.  This removes those
-- unusable pages and regions from the cache.
--==============================================================================
procedure cache_purge_stale (
   p_application    in number);

--==============================================================================
-- Returns the date and time the specified application page
-- was cached either for the user issuing the call
-- or for all users if the page was not set to be cached by user.
--==============================================================================
function cache_get_date_of_page_cache (
   p_application  in number,
   p_page         in number)
   return date;

--==============================================================================
-- Purges all cached regions for a given application.
--==============================================================================
procedure purge_regions_by_app (
    p_application in number);

--==============================================================================
-- Purges all cached regions of a given name for a given application
-- and page.
--==============================================================================
procedure purge_regions_by_name (
    p_application  in number,
    p_page         in number,
    p_region_name  in varchar2);

--==============================================================================
-- Purges all cached regions for a given application and page.
--==============================================================================
procedure purge_regions_by_page (
    p_application  in number,
    p_page         in number);

--==============================================================================
-- Returns the date and time the specified region
-- was cached either for the user issuing the call
-- or for all users if the region was not set to be cached by user.
--==============================================================================
function cache_get_date_of_region_cache (
   p_application  in number,
   p_page         in number,
   p_region_name  in varchar2)
   return date;

--##############################################################################
--#
--# EXPORT
--#
--##############################################################################


--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_application (
    p_workspace_id            in number,
    p_application_id          in number);

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_application_page (
    p_workspace_id            in number,
    p_application_id          in number,
    p_page_id                 in number);

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_application_component (
    p_workspace_id            in number,
    p_application_id          in number,
    p_component_id            in number,
    p_component_type          in varchar2);

--==============================================================================
--  For use from SQL prompt
--
-- EXAMPLE
--   begin dbms_output.put_line(apex_util.minimum_free_application_id); end;
--==============================================================================
function minimum_free_application_id
    return number;

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
function get_application_id_status (
    p_workspace_id           in  number,
    p_application_id         in  number)
    return number;

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
function get_application_name (
    p_workspace_id           in  number,
    p_application_id         in  number)
    return varchar2;

--##############################################################################
--#
--# JSON
--#
--##############################################################################

--==============================================================================
procedure json_from_sql (
    sqlq     in varchar2 default null,
    p_sub    in varchar2 default 'N',
    p_owner  in varchar2 default null);

--==============================================================================
procedure json_from_array (
    p_rows   in number   default null,
    p_cols   in number   default null,
    p_name01 in varchar2 default null,
    p_name02 in varchar2 default null,
    p_name03 in varchar2 default null,
    p_name04 in varchar2 default null,
    p_name05 in varchar2 default null,
    p_name06 in varchar2 default null,
    p_name07 in varchar2 default null,
    p_name08 in varchar2 default null,
    p_name09 in varchar2 default null,
    p_name10 in varchar2 default null,
    p_f01    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f02    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f03    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f04    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f05    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f06    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f07    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f08    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f09    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f10    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_sub    in varchar2 default 'N');

--==============================================================================
procedure json_from_items(
    p_items      in varchar2 default null,
    p_separator  in varchar2 default ':',
    p_sub        in varchar2 default 'N');

--==============================================================================
procedure json_from_string(
    p_items      in varchar2 default null,
    p_separator  in varchar2 default ':',
    p_sub        in varchar2 default 'N');


--##############################################################################
--#
--# BLOB SUPPORT
--#
--##############################################################################

--==============================================================================
-- Automatically called from APEX form pages
-- Not designed to be called proceduarlly
-- Calls to this procedure can be generated by calling the apex_util.get_blob_file_src function
-- Page must have item of type FILE (FILE Browse)
-- Page item source must use the following format "DB_COLUMN:MIMETYPE_COLUMN:FILENAME_COLUMN:LAST_UPDATE_COLUMN:CHARSET_COLUMN:CONTENT_DISPOSITION:DOWNLOAD_LINK"
--    DB_COLUMN           = Required case sensitive name of a valid column which is of type BLOB
--    MIMETYPE_COLUMN     = Optional case sensitive column name of a table column used to store the mimetype
--    FILENAME_COLUMN     = Optional case sensitive column name of a table column used to store the file name
--    LAST_UPDATE_COLUMN  = Optional case sensitive column name of a table column used to store the last update date of the BLOB
--    CHARSET_COLUMN      = Optional case sensitive column name of a table column used to store the file character set
--    CONTENT_DISPOSITION = inline or attachment
--    DOWNLOAD_LINK       = Optional text to be used for the download text, defaults to Download, translated
-- Page item source must include at least the database column name and a trailing colon
-- Mimetype column is required if the mimetype is to be encoded in the download header
-- Page item must be of source type of DATABASE COLUMN
-- Page must have a DML process of type DML_PROCESS_ROW, used to determine the tablename
-- Must be called from an APEX application context
-- Invalid inputs will result in a 404 error
--==============================================================================
procedure get_blob_file(
    s                     in number,                -- APEX session ID
    a                     in number,                -- APEX application ID
    p                     in number,                -- APEX page ID of the form page
    d                     in number,                -- DML process APEX meta data ID
    i                     in number,                -- ITEM of type FILE APEX meta data ID
    p_pk1                 in varchar2,              -- Primary key value
    p_ck                  in varchar2,              -- Checksum used to prevent URL Tampering
    p_pk2                 in varchar2 default null, -- Optional Second Primary Key Value, used for compound keys
    p_mimetype            in varchar2 default null, -- Optional ...
    p_content_disposition in varchar2 default null, -- Optional use "inline" or "attachment" all other values ignored
    p_show_last_mod       in varchar2 default 'Y'); -- Optional ...

--==============================================================================
-- Generates a call to the apex_util.get_blob_file that can be used to download a BLOB column content
-- Only generates usable output if called from a valid APEX session
--
-- EXAMPLE
--    PLSQL Function Body: return '<img src="'||apex_util.get_blob_file_src('P2_ATTACHMENT',empno)||'" />';
--==============================================================================
function get_blob_file_src (
    p_item_name in varchar2 default null,           -- Name of valid application page ITEM that with type FILE, and source type of DB column
    p_v1        in varchar2 default null,           -- Value of primary key column
    p_v2        in varchar2 default null,           -- Optional value of second primary key column
    p_content_disposition in varchar2 default null) -- Optional content disposition, valid values are "inline" and "attachment", other values ignored
    return varchar2;

--==============================================================================
-- This procedure will download a blob column given proper inputs
-- This get_blob function is designed to be called from APEX reports automatically
-- Classic and Interactive Reports given a format mask will generate a link to this procedure
-- Report that uses  "select ... dbms_lob.getlength(myblob_column) ..." syntax
--
-- The report column format mask has the following format
-- DOWNLOAD|IMAGE:<blob_tab>:<blob_col>:<pk1_col>:<pk2_col>:<mimetype_col>:<filename_col>:<last_update_col>:<charset_col>:<content disposition>:<download text>
-- All arguments are delimited by colons
--
-- This procedure is NOT designed to be called directly, it is intended to be called by APEX reporting engines
-- Reference function apex_util.get_blob_file_src
--
-- position 1: "DOWNLOAD" or "IMAGE"
--             Download will result in the generation a "a href=" tag
--             Image will result in the generation of an inline "img src=" tag
--             Use image when your files are images
--             Using image for non image based files will result in broken image links
--             Required
-- position 2: Name of the table containing the blob column in question
--             Required and case sensitive
-- position 3: Name of the BLOB column name
--             Required and case sensitive
-- position 4: Name of the primary key column in the table identified in position 2
--             Required and case sensitive
-- position 5: Name of a secondary key column to uniquely identify the row that contains the BLOB column
--             Optional and case sensitive
-- position 6: Name of a column that is used to store the mime type that corresponds to the BLOB column
--             Managing the mimetype allows the mimetype to be encoded in the file download
--             If a mimetype is not specified download will use "application/octet-stream"
--             A proper mimetype allows the browser to pick an approparte application to display the file
--             Optional and case sensitive
-- position 7: Name of a column that is used to store the filename of the BLOB column identified in position 3
--             Managing the filename allows downloads to default the file name to a usefull value
--             Optional and case sensitive
--             Not used for IMAGE format but left in so format can easily be changed between IMAGE and DOWNLOAD
-- position 8: Name of a column that is used to store the date the BLOB was last updated
--             If used, the HTTP header of the file download will indicate the date of last modification and
--                browsers will be able to cache the BLOB.  If not specified, the browser may not be able to cache files.
--             Optional and case sensitive
-- position 9: Name of the character set that is used to store the character set of the file in the BLOB column
--             Most useful for applications that have files in multiple character sets
--             Optional and case sensitive
--             Not used for IMAGE format but left in so format can easily be changed between IMAGE and DOWNLOAD
-- position 10: For DOWNLOAD format masks, identifies the content disposition
--             Defaults to inline
--             Valid values are "inline" and "attachment"
--             A value of inline will cause the browser to render the file inline if it can
--             A value of attachment will prompt the user to download the file
--             Optional, use lower case
--             Not used for IMAGE format but left in so format can easily be changed between IMAGE and DOWNLOAD
-- position 11: For DOWNLOAD format masks, identifies the text used to indicate a download link text
--             Default to "Download"
--             Translated into 10 languages
--             Specify if you wish to over-ride the default text
--             Standard APEX substitutions are performed
--             Only used for DOWNLOAD format masks
--             Optional
--             For IMAGE, String used for the alt tag associated with the image
--
-- Example Report format masks:
--
-- DOWNLOAD:EMP:RESUME:EMPNO::MIMETYPE:FILENAME:RESUME_LAST_UPDATE
-- DOWNLOAD:EMP:RESUME:EMPNO::MIMETYPE:FILENAME:RESUME_LAST_UPDATE:::Resume
-- IMAGE:EMP:EMP_PHOTO:EMPNO::MIMETYPE::PHOTO_LAST_UPDATE:::Employee Photo
--
--==============================================================================
procedure get_blob (
    s                 in number,                -- session id
    a                 in number,                -- application id
    c                 in number,                -- id of the report column
    p                 in number,                -- page
    k1                in varchar2,              -- primary key 1 value
    ck                in varchar2,              -- checksum
    rt                in varchar2 default 'IR', -- optional report type IR (interactive repors) or CR (classic reports)
    k2                in varchar2 default null, -- optional, primary key 2 value
    lm                in varchar2 default 'Y'   -- optional, show last modified
    );

--==============================================================================
-- APEX Listener procedure to set blob
--
-- returns file name
--==============================================================================
function set_blob (
   p_application_id      in varchar2 default null,
   p_page_id             in varchar2 default null,
   p_session_id          in varchar2 default null,
   p_request             in varchar2 default null,
   --
   p_item_id             in varchar2 default null,
   --
   p_file_name           in varchar2 default null,
   p_mime_type           in varchar2 default null,
   p_blob_content        in blob )
   return varchar2;

--##############################################################################
--#
--# INTERACTIVE REPORTS
--#
--##############################################################################

--==============================================================================
-- Note:  Deprecated starting APEX 4.2.  Use APEX_IR.ADD_FILTER instead.
--
-- Used to control Interactive Report filters
-- Given an APEX page sets a report filter
-- Useful if you want to define report filters declaratively
-- If p_report_alias is null, it creates filter on Primary default
-- If p_report_alias passed, it creates filter on the specific saved report
--
-- Valid values for p_operator_abbr
-- EQ = Equals
-- LT = Less than
-- LTE = Less then or equal to
-- GT = Greater Than
-- GTE = Greater than or equal to
-- LIKE = SQL Like operator
-- N = Null
-- NN = Not Null
--
-- Filter values are bound into Report SQL
--
-- EXAMPLE
--    apex_util.ir_filter(p_page_id=>1,p_report_column=>'DEPTNO',p_operator_abbr=>'EQ',p_filter_value=>'10');
--
--==============================================================================
procedure ir_filter (
    p_page_id       in number,                -- Page of the current APEX application that contains an Interactive Report
    p_report_column in varchar2,              -- Name of the report SQL column (or column alias) to be filtered
    p_operator_abbr in varchar2 default null, -- Filter type, Valid values are 'EQ' , 'LT', 'LTE', 'GT', 'GTE', 'LIKE', 'N', 'NN'
    p_filter_value  in varchar2,              -- Value of filter, not used for N and NN
    p_report_alias in varchar2 default null   -- valid saved report alias within current application page
    );

--==============================================================================
-- Note:  Deprecated starting APEX 4.2.  Use APEX_IR.RESET_REPORT instead.
--
-- Resets an interactive report for current user session and application
-- Same as a user reseting via the pull down menu
-- Resetting will re-create default filter, control breaks, display columns etc
-- If p_report_alias is null, it resets Primary default report settings
-- If p_report_alias passed, it resets specific saved report settings
--==============================================================================
procedure ir_reset (
    p_page_id      in number,               -- valid page number within current application
    p_report_alias in varchar2 default null -- valid saved report alias within current application page
    );

--==============================================================================
-- Note:  Deprecated starting APEX 4.2.  Use APEX_IR.CLEAR_REPORT instead.
--
-- Clears an interactive report for current user session and application
-- Clears filters for an interactive report
-- Clears any report filters including default filters
-- Clears all interactive reports for a given application page
-- If p_report_alias is null, it clears Primary default report settings
-- If p_report_alias passed, it clears specific saved report settings
--==============================================================================
procedure ir_clear (
    p_page_id      in number,               -- valid page number within current application
    p_report_alias in varchar2 default null -- valid saved report alias within current application page
    );

--==============================================================================
-- Note:  Deprecated starting APEX 4.2.  Use APEX_IR.DELETE_REPORT instead.
--
-- Deletes saved interactive report for current application
-- Can delete all saved reports except Primary Default report
--==============================================================================
procedure ir_delete_report(
    p_report_id           in number -- valid saved report id within current application
    );

--==============================================================================
-- Note:  Deprecated starting APEX 4.2.  Use APEX_IR.DELETE_SUBSCRIPTION instead.
--
-- Deletes interactive report subscription for current workspace
--==============================================================================
procedure ir_delete_subscription(
    p_subscription_id           in number -- valid subscription id within current workspace
    );

--##############################################################################
--#
--# FORMAT MASKS
--#
--# Used by interactive and classic reports to provide additional format masks
--#
--##############################################################################

--==============================================================================
-- Takes a file size in bytes and returns a rounded off size with trailing KB, MB, GB, or TB
-- Provides a more readable file size
-- Use FILESIZE format mask on numeric columns from within Classic and Interactive Reports
-- Null values will return null
-- KB, MB, GB, and TB are always english language strings
--
-- Example report format masks for interactive and classic reports
--     "FILESIZE"
--
-- Example SQL query syntax
--     "select apex_util.filesize_mask(8675309) from dual"
--==============================================================================
function filesize_mask (
    p_number       in number default null)
    return varchar2;

--==============================================================================
-- Given a number between 0 and 100, a HTML graph
-- The width of the HTML graph will devault to 100 px in width
-- Number outside the range 0 to 100 will result in a null return
-- Used by classic and interactive reports with format mask of GRAPH
-- Generates a div tag with inline styles
-- If p_format argument is supplied, p_size, p_background, p_bar_background are ignored
--
-- Report column mask syntax PCT_GRAPH:<BACKGROUND>:<FOREGROUND>:<CHART_WIDTH>
-- position 1: PCT_GRAPH format mask indicator
-- position 2: Background color in hex, 6 characters
--             Optional
-- position 3: Foreground "bar" color in hex, 6 characters
--             Optionsl
-- position 4: Chart width in Pixels
--             Numeric, defaults to 100
--             p_number is automatically scaled, so 50 would be half chart_width
--             Optional
--
-- SQL Example:
--    select apex_util.html_pct_graph_mask(33) from dual
--
-- Report Numeric Column Format Mask Example:
--    PCT_GRAPH:777777:111111:200
--==============================================================================
function html_pct_graph_mask (
    p_number         in number   default null, -- Number between 0 and 100
    p_size           in number   default 100,  -- Width of graph in pixels
    p_background     in varchar2 default null, -- 6 character hex color of chart background (not bar color)
    p_bar_background in varchar2 default null, -- 6 character hex color of chart bar (bar color)
    p_format         in varchar2 default null) -- PCT_GRAPH:<BACKGROUND>:<FOREGROUND>:<CHART_WIDTH>
    return varchar2;


--##############################################################################
--#
--# PASSWORD CHECKING
--#
--##############################################################################

--==============================================================================
procedure strong_password_check(
    p_username                    in  varchar2,
    p_password                    in  varchar2,
    p_old_password                in  varchar2,
    p_workspace_name              in  varchar2,
    p_use_strong_rules            in  boolean,
    p_min_length_err              out boolean,
    p_new_differs_by_err          out boolean,
    p_one_alpha_err               out boolean,
    p_one_numeric_err             out boolean,
    p_one_punctuation_err         out boolean,
    p_one_upper_err               out boolean,
    p_one_lower_err               out boolean,
    p_not_like_username_err       out boolean,
    p_not_like_workspace_name_err out boolean,
    p_not_like_words_err          out boolean,
    p_not_reusable_err            out boolean);

--==============================================================================
function strong_password_validation(
    p_username         in varchar2,
    p_password         in varchar2,
    p_old_password     in varchar2 default null,
    p_workspace_name   in varchar2,
    p_use_strong_rules in boolean default false)
    return varchar2;

--##############################################################################
--#
--# PRINTING
--#
--##############################################################################

--==============================================================================
-- This function returns a document as BLOB using XML based report data and RTF or XSL-FO based report layout.
--
-- PARAMETERS
--   p_report_data:        XML based report data (utf-8 encoded)
--   p_report_layout:      Report layout in XSL-FO or RTF format
--   p_report_layout_type: Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:    Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:       URL of of the print server. If not specified, the print server will be derived from preferences
--                         example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
function get_print_document (
    p_report_data         in clob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;

--==============================================================================
-- This function returns a document as BLOB using XML based report data and RTF or XSL-FO based report layout.
--
-- PARAMETERS
--   p_report_data:        XML based report data (utf-8 encoded)
--   p_report_layout:      Report layout in XSL-FO or RTF format
--   p_report_layout_type: Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:    Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:       URL of of the print server. If not specified, the print server will be derived from preferences
--                         example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
function get_print_document (
    p_report_data         in blob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;

--==============================================================================
-- This function returns a document as BLOB using pre-defined report query and pre-defined report layout.
--
-- PARAMETERS
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout_name:  Name of the report query (stored under application's shared components)
--                          if report layout name is not specified, layout associated with report query will be used
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
function get_print_document (
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout_name  in varchar2 default null,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;

--==============================================================================
-- This function returns a document as BLOB using a pre-defined report query and RTF or XSL-FO based report layout.
--
-- PARAMETERS
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout:       Defines the report layout in in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
function get_print_document (
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;

--==============================================================================
-- This procedure initiates the download of a print document using XML based report data and RTF or XSL-FO based report layout.
--
-- PARAMETERS
--   p_file_name            Defines the filename of the print document
--   p_content_disposition: Specifies whether to download the print document or display inline ("attachment", "inline")
--   p_report_data:         XML based report data
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
procedure download_print_document (
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_report_data         in clob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);

--==============================================================================
-- This procedure initiates the download of a print document using XML based report data and RTF or XSL-FO based report layout.
--
-- PARAMETERS
--   p_file_name            Defines the filename of the print document
--   p_content_disposition: Specifies whether to download the print document or display inline ("attachment", "inline")
--   p_report_data:         XML based report data
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
procedure download_print_document (
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_report_data         in blob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);

--==============================================================================
-- This procedure initiates the download of a print document using pre-defined report query and pre-defined report layout.
--
-- PARAMETERS
--   p_file_name            Filename of print document
--   p_content_disposition: Download print document or display inline ("attachment", "inline")
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout_name:  Name of the report query (stored under application's shared components)
--                          if report layout name is not specified, layout associated with report query will be used
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
procedure download_print_document (
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout_name  in varchar2 default null,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null );

--==============================================================================
-- This procedure initiates the download of a print document using pre-defined report query and RTF and XSL-FO based report layout.
--
-- PARAMETERS
--   p_file_name            Filename of print document
--   p_content_disposition: Download print document or display inline ("attachment", "inline")
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--==============================================================================
procedure download_print_document (
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);

--==============================================================================
-- This function returns the host URL for the Application Express instance.
--
-- PARAMETERS
--   p_option           Specifies the parts of the URL to include
--
--                      Possible values for p_option are:
--                          NULL   - Return URL up to port number (e.g., https://myserver.com:7778 )
--                          SCRIPT - Return URL to include script name (e.g., https://myserver.com:7778/pls/apex/ )
--                          IMGPRE - Return URL to include image prefix (e.g., https://myserver.com:7778/i/ )
--==============================================================================
function host_url(
    p_option          in varchar2 default null )
    return varchar2;

--==============================================================================
-- Calls owa_util.redirect_url to redirect the browser to a new URL.
-- The procedure automatically calls apex_application.stop_apex_engine to
-- abort further processing of the APEX application.
--
-- p_reset_htp_buffer should be set to FALSE if the application has set it's own
-- cookie in the response, otherwise the HTP buffer will be reseted to make sure
-- that the browser understands the redirect to the new URL and isn't confused
-- by data which has already been written to the HTP buffer.
--==============================================================================
procedure redirect_url (
    p_url              in varchar2,
    p_reset_htp_buffer in boolean default true );

--##############################################################################
--#
--# SESSION HANDLING
--#
--##############################################################################

--==============================================================================
procedure set_session_lifetime_seconds(
    p_seconds in number,
    p_scope   in varchar2 default 'SESSION');

--==============================================================================
procedure set_session_max_idle_seconds(
    p_seconds  in number,
    p_scope    in varchar2 default 'SESSION');


--==============================================================================
-- set_session_time_zone() will set the time zone for the current Application Express session.
-- As well, it will also immediately set the database session time zone to this setting.  If the value
-- specific is invalid, then the session time zone will be set to the database time zone.
--==============================================================================
procedure set_session_time_zone(
    p_time_zone in varchar2 );

--==============================================================================
-- get_session_time_zone() will return the current time zone for the currnet Application Express session, if it has been set.
-- If it has not been explicitly set, then a null value will be returned.  When it has not been explicitly set, the
-- database session time zone is always set to the database time zone
--==============================================================================
function get_session_time_zone return varchar2;

--==============================================================================
-- reset_session_time_zone will clear the time zone setting for the current APEX session.  As well, it will alter
-- the time zone setting of the database session to the database time zone
--==============================================================================
procedure reset_session_time_zone;

--==============================================================================
-- set_session_lang() will set the language for the current Application Express session, but this
-- is only relevant when the application language is derived from 'Session'.
--==============================================================================
procedure set_session_lang(
    p_lang in varchar2 );

--==============================================================================
-- get_session_lang() will return the current language for the current Application Express session, but this
-- is only relevant when the application language is derived from 'Session'.
--==============================================================================
function get_session_lang return varchar2;

--==============================================================================
-- reset_session_lang will clear the language setting for the current APEX session.
--==============================================================================
procedure reset_session_lang;

--==============================================================================
-- set_session_territory() will set the territory for the current Application Express session
--==============================================================================
procedure set_session_territory(
    p_territory in varchar2 );

--==============================================================================
-- get_session_territory() will return the current territory for the current Application Express session
--==============================================================================
function get_session_territory return varchar2;

--==============================================================================
-- reset_session_territory will clear the territory setting for the current APEX session.
--==============================================================================
procedure reset_session_territory;

--##############################################################################
--#
--# EDITIONS
--#
--##############################################################################

--==============================================================================
-- set_edition will set the edition for all workspace-schema parsed SQL for the current page view
--==============================================================================
procedure set_edition( p_edition in varchar2 );

--==============================================================================
function get_edition return varchar2;

--==============================================================================
-- when used with find_security_group_id, eases use of mail package, etc, in batch mode
--==============================================================================
procedure set_security_group_id ( p_security_group_id  in number );

--==============================================================================
-- set_compatibility_mode will update the compatibility mode setting of the specified
-- application. Valid values for p_compatibility_mode are '4.0' and '4.1'.
--==============================================================================
procedure set_compatibility_mode (
    p_application_id     in number,
    p_compatibility_mode in varchar2 );

--##############################################################################
--#
--# NOTE: The following APIs are for internal use only and are likely to be
--#       changed or removed in a future version of Application Express.
--#
--##############################################################################

--==============================================================================
-- Returns TRUE if p_value contains dangerous characters which could be used
-- to attack the application/system/... and FALSE if p_value is safe.
--
-- p_check can be one of the following values:
--
--   US_ONLY - Whitelist for a-Z, 0-9 and space
--   WEB_SAFE - Blacklist HTML command characters (<>")
--   NO_SPECIAL_CHAR - Blacklist &<>"/;,*|=% and --
--   NO_SPECIAL_CHAR_NL - Blacklist &<>"/;,*|=% or -- and new line
--==============================================================================
function has_restricted_chars (
    p_value in varchar2,
    p_check in varchar2 )
    return boolean;


--==============================================================================
-- Procedure to change the status of Build Options
-- p_app: The Application id
-- p_id: The Build Option Id
-- p_build_status: Status with possible values 'INCLUDE','EXCLUDE' (Both uppercase)
--==============================================================================
procedure set_build_option_status(
   p_application_id   in number,
   p_id               in number,
   p_build_status     in varchar2 );

--==============================================================================
-- Function to get the status of Build Options
-- p_application_id: The Application id
-- p_id:  The Build Option Id
--==============================================================================
function get_build_option_status(
   p_application_id   in number,
   p_id               in number )
return varchar2;

--==============================================================================
-- Function to get the status of Build Options
-- p_application_id: The Application id
-- p_build_option_name: Build Option Name
--==============================================================================
function get_build_option_status(
   p_application_id   in number,
   p_build_option_name in varchar2 )
return varchar2;


--==============================================================================
-- Close all database links open in the current session
--==============================================================================
procedure close_open_db_links;

--==============================================================================
-- set format mask for report columns in classic reports
--==============================================================================
procedure set_report_column_format (
    p_column_format in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr
);

--==============================================================================
-- set current theme style for the current application
--==============================================================================
procedure set_current_theme_style (
    p_theme_number   in number,
    p_theme_style_id in number
    );
end htmldb_util;
/
show errors
