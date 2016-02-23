set define off verify off
prompt ...wwv_flow_security
create or replace package wwv_flow_security as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2001 - 2014. All Rights Reserved.
--
--    DESCRIPTION
--      Security and authentication services
--
--    SECURITY
--      This package is only accessable to the owner of Oracle Application Express
--      This package contains globals that control parsing and company (aka workspace)
--      identification.
--      g_parse_as_schema   = schema to parse SQL as
--      g_security_group_id = identifies the workspace of the current user (provides VPD)
--
--    NOTES
--      Package Body should be wraped
--
--    MULTI-CUSTOMER
--      This package facilitates multi customer (virtual private database) support
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    01/20/2000 - Created
--     mhichwa    01/21/2000 - Added sdillon encode, checksum, decode, fetch_key routines, determine_cookie_auth_user
--     mhichwa    03/08/2000 - Added get_asfcookie
--     mhichwa    05/16/2000 - Removed procedure get_JServSessionIdroot_cookie
--     mhichwa    05/16/2000 - Added set_oracle_login_server_env
--     mhichwa    06/06/2000 - Added custom auth globals
--     mhichwa    01/12/2001 - Added cookie logout procedure
--     mhichwa    01/27/2001 - Added company, and function to translate short name to sec group id
--     mhichwa    01/28/2001 - Added company to show_cookie
--     mhichwa    02/24/2001 - Added find_security_group_id_dbauth;
--     mhichwa    02/28/2001 - Added user is internal function
--     mhichwa    03/03/2001 - Added g parse as schema global
--     mhichwa    03/03/2001 - Added user can develop any flow
--     mhichwa    03/03/2001 - Added g_curr_flow_security_group_id
--     mhichwa    03/05/2001 - Added get_security_group_id
--     mhichwa    03/13/2001 - Added flow owner call
--     mhichwa    03/19/2001 - Added run flow procedure
--     mhichwa    03/23/2001 - Added find company name given security group id
--     sdillon    04/16/2001 - Added get first schema function, given security group id
--     mhichwa    04/23/2001 - Changed documentation
--     mhichwa    04/23/2001 - Added fnd user api
--     jkallman   06/18/2001 - Added set_custom_auth_env
--     mhichwa    08/27/2001 - Added create session procedure for use in benchmarking
--     mhichwa    08/28/2001 - Removed security group ID argument to create session since its set from a global in a trigger
--     sspadafo   11/20/2001 - Added exec_custom2_auth
--     mhichwa    11/26/2001 - Changed comments
--     sspadafo   06/18/2002 - Added session_cookie_info procedure,cookie_user,cookie_session functions
--     sspadafo   09/24/2002 - Added custom auth globals, exec_custom_auth_options, get_custom_auth_options procedures
--     sspadafo   10/02/2002 - Removed custom auth setup globals related used only in login processing
--     sspadafo   10/03/2002 - Removed unneeded cookie globals for custom auth setups
--     sspadafo   11/27/2002 - Added g_sso_session_registration boolean for securing single signon session registration
--     mhichwa    12/19/2002 - Removed function find_security_group_id_dbauth
--     sspadafo   04/24/2003 - Added g_authenticated boolean for popup LOV page authentication (Bug 2792894)
--     sspadafo   04/24/2003 - Removed obsolete procedures set_custom_auth_env, set_authentication_env (no bug filed)
--     sspadafo   04/24/2003 - Added hash_session_id function (Bug 2792894)
--     sspadafo   05/01/2003 - Added get_hashed_session_id and g_element constant used by wwv_flow_element pkg (Bug 2792894)
--     sspadafo   06/15/2003 - Add internal page sentry function for internal flows (Bug 3008867)
--     sspadafo   06/24/2003 - Expose session_cookie_info_internal procedure (Bug 3017850)
--     sspadafo   03/12/2004 - Add checksum booleans for cross-site scripting problems (Bug 2998081)
--     sspadafo   03/18/2004 - Add functions verify_notify_msg_checksum and verify_print_msg_checksum (Bug 2998081)
--     sspadafo   05/29/2004 - Add g_user global (Bug 3660623)
--     sspadafo   06/12/2004 - Add function current_company_can_parse (Bug 3689457)
--     sspadafo   06/14/2004 - Add g_import_in_progress (Bug 3689457)
--     sspadafo   06/25/2004 - Add authenticated_session function (Bug 3449543)
--     sspadafo   06/26/2004 - Add user_authenticated_to_builder function (Bug 3449543)
--     sspadafo   06/26/2004 - Change user_authenticated_to_builder function to user_builder_session_company (Bug 3449543)
--     sspadafo   07/30/2004 - Revise g_element constant
--     sspadafo   08/11/2004 - Add ip_check function
--     sspadafo   10/03/2004 - Add disable_admin_login, disable_admin_login functions
--     sspadafo   02/08/2005 - Added globals for URL tampering feature
--     sspadafo   02/27/2005 - Added reset_app_checksum_salt procedure
--     sspadafo   03/23/2005 - Added g_instance_save (Bug 4255908)
--     sspadafo   03/28/2005 - Removed g_instance_save (Bug 4255908)
--     sspadafo   05/02/2005 - Added check_db_password function for database user account authentication
--     sspadafo   09/29/2005 - Add encode_key and decode_key functions
--     sspadafo   10/24/2005 - Add check_db_password function with p_username argument and return vc2 for extended database account authentication (Bug 4673279)
--     sspadafo   11/30/2005 - Add character to g_element (Bug 4690231)
--     sspadafo   11/30/2005 - Remove some comments visible in source
--     sspadafo   11/30/2005 - Add g_raw16, g_raw32, g_raw64, g_num, g_crypto_salt variables (Bug 4690231)
--     sspadafo   11/30/2005 - Add crypto_mac_md5, crypto_randomnumber, crypto_randombytes functions as wrappers for dbms_crypto functions (Bug 4690231)
--     sspadafo   12/10/2005 - Add g_raw7 (Bug 4690231)
--     sspadafo   02/20/2006 - Add g_page_request boolean (Bug 5049931)
--     sspadafo   03/08/2006 - Added p_session_id parameter to authenticated_session function (Bug 4922130)
--     sspadafo   04/28/2006 - Added overloaded crypto_randombytes function (Bug 4773656)
--     mhichwa    06/22/2006 - Added g_parse_as_schema_override global (bug 5251946)
--     sspadafo   11/30/2006 - Added g_flow_id (bug 5597257)
--     sspadafo   11/30/2006 - Added constants and variables to support fnd account security features
--     sspadafo   12/14/2006 - Added strong_password_check, strong_password_validation
--     sspadafo   12/16/2006 - Added get_expired_user_sgid, get_expired_user_name functions, purge_expired_user_header procedure
--     jstraub    01/03/2007 - Added encrypt_wallet_pwd and decrypt_wallet_pwd
--     sspadafo   01/07/2007 - Added AUTH_UNKNOWN_WORKSPACE constant
--     sspadafo   01/27/2007 - Added functions get_translated_flow_id, get_flow_id; added variable g_translated_flow_id (Bug 5597257)
--     jstraub    02/01/2007 - Added prep_url
--     mhichwa    11/02/2007 - Set define off, then on again at end of file
--     mhichwa    12/19/2007 - Removed comments that are no longer valid updated copyright.  Other comments also updated.
--     sspadafo   12/20/2007 - Added g_instance to use as secure copy of wwv_flow.g_instance
--     sspadafo   12/08/2008 - Added set_session_lifetime_minutes, set_session_max_idle_minutes
--     sspadafo   12/22/2008 - Changed name of session timeout procedures to reflect units in seconds
--     jstraub    12/23/2008 - Added encrypt_item_value and decrypt_item_value
--     mhichwa    12/23/2008 - Added encrypt_session_value and decrypt_session_value
--     sspadafo   12/29/2008 - Removed encrypt_item_value and decrypt_item_value
--     sspadafo   12/31/2008 - Added raw global g_raw32767;
--     sspadafo   01/24/2009 - Added p_not_reusable_err to strong_password_check
--     mhichwa    01/28/2009 - Added g_context global to allow for security checks to be context specific
--     cbcho      04/06/2009 - Added g_websheet_schema
--     pawolf     04/09/2009 - Renamed g_websheet_schema and removed default
--     cbcho      06/08/2009 - Renamed g_teamspace_schema to g_apex$_schema
--     sspadafo   11/01/2009 - Added exec_websheet_auth procedure
--     sspadafo   11/10/2009 - Added ws_internal_page_sentry function
--     jkallman   11/25/2009 - Rename encrypt_wallet_pwd & decrypt_wallet_pwd to encrypt_pwd & decrypt_pwd
--     sspadafo   12/07/2009 - Added global g_ws_instance
--     sspadafo   01/20/2010 - Added function devenv_login
--     jkallman   05/13/2010 - Added function authorized_url (Bug 9708920)
--     cneumuel   03/03/2011 - Removed g_raw7, g_raw16, g_raw32, g_raw64, g_raw32767, g_num (Feature 630)
--     cneumuel   03/03/2011 - Added api for reading/writing wallet, removed encrypt_pwd, decrypt_pwd (Feature 631)
--     cneumuel   03/04/2011 - Removed encrypt, decrypt, they were only used internally (Feature 630)
--     cneumuel   03/21/2011 - Refactorings
--     cneumuel   03/30/2011 - Added apex_builder_authentication, get_ws_cookie_props
--     jkallman   04/12/2011 - Added procedure set_internal_cookie_name
--     cneumuel   04/18/2011 - Added g_custom_auth_attempts and cookie_user_can_dev_curr_flow from wwv_flow
--     cneumuel   04/18/2011 - Added get_authentication_id and get_flow_cookie_props from custom_auth_std.plb
--     cneumuel   04/21/2011 - Moved crypto functions from wwv_flow_security to wwv_flow_crypto
--     cneumuel   04/29/2011 - Added global variable g_dyn_exec_smtp_conn for passing a utl_smtp.connection to/from dynamic pl/sql (Feature #604)
--     cneumuel   05/06/2011 - In get_wallet: removed encryption type parameter
--     cneumuel   05/17/2011 - Removed devenv_login and added get_builder_session_id
--     cneumuel   06/06/2011 - Removed get_flow_cookie_props, get_authentication_id
--     cneumuel   06/15/2011 - Added get_translated_id
--     cneumuel   06/21/2011 - removed obsolete functions get_hashed_session_id, internal_page_sentry, ws_internal_page_sentry, exec_custom2_auth
--     cneumuel   07/01/2011 - Added has_apex_administrator_role (bug #8560829)
--     pawolf     09/08/2011 - Added new procedure set_rm_consumer_group (Bug 12944223)
--     cneumuel   09/15/2011 - Removed obsolete g_custom_auth_setups
--     cneumuel   09/15/2011 - In authenticate: added p_ignore_password
--     hfarrell   09/16/2011 - Added procedure grant_restful_connect for RESTful Services
--     cneumuel   10/18/2011 - Added get_service_group_name_prefix (bug #13101596)
--     cneumuel   10/24/2011 - Renamed get_service_group_name_prefix to get_workspace_group_prefix
--     pawolf     10/25/2011 - Changed get_workspace_group_prefix to use g_security_group_id
--     cneumuel   10/28/2011 - Renamed set_rm_consumer_group to set_g_security_group_id and added host_prefix checking (bug #13101596)
--     cneumuel   11/02/2011 - Made set_rm_consumer_group public for file_mgr
--     pawolf     11/22/2011 - Added p_check_host_prefix to set_g_security_group_id (Bug 12944223)
--     cneumuel   11/29/2011 - Moved exec_websheet_auth to wwv_flow_ws_security (bug #13360987)
--                           - Added has_apex_administrator_role_yn (bug #13426740)
--     pawolf     12/14/2011 - Added does_host_prefix_match (bug 13475686)
--     pawolf     01/24/2012 - Added clear_page_checksum, get_page_item_value_checksum and get_page_checksum (bug 12790216)
--     pawolf     02/15/2012 - Added get_protected_page_items_count (bug# 13722696)
--     jkallman   02/15/2012 - Removed the obsolete version of check_db_password (Bug 13723466)
--     cneumuel   03/28/2012 - In authenticate: removed p_internal. Added get_workspace_sec_settings (bug #13713222) 
--     cneumuel   04/02/2012 - Added user_is_dba (moved from wwv_flow_login)
--     cneumuel   04/05/2012 - In t_workspace_sec, get_workspace_sec_settings: added login_throttle_delay (feature #899)
--     cneumuel   04/05/2012 - Moved wwv_flow_security.set_session_{lifetime,max_idle}_seconds to wwv_flow_session_state (feature #897)
--     jkallman   05/02/2012 - Added p_check_account_status to set_g_security_group_id
--     cneumuel   05/09/2012 - Removed dead code: check_db_password, cookie_auth_logout, get_asfcookie, run_flow, check_instance_owner, determine_cookie_auth_user,
--                           - cookie_session, create_new_session, remove_session, exec_custom_auth, user_can_develop_current_flow, get_fnd_user_id, create_fnd_user,
--                           - remove_fnd_user, update_fnd_user, encode_key, decode_key
--                           - show_cookie
--     cneumuel   06/14/2012 - Added t_workspace_sec.login_throttle_methods (bug #13713222)
--     cneumuel   06/15/2012 - Added is_workspace_password_valid (bug #13994800)
--     cneumuel   06/15/2012 - Added get_client_ip_address (feature #899)
--                           - Removed hash_session_id
--     cneumuel   06/18/2012 - In get_client_ip_address: added p_remove_proxies
--     cneumuel   06/26/2012 - Removed obsolete variable g_custom_auth_login_page (feature #791)
--     cneumuel   08/08/2012 - In authenticate: added p_settings_from_workspace, to override the workspace from which auth settings like max login attempts are taken (bug #14469455)
--     cneumuel   01/17/2013 - Added configure_trace_and_debug, db_session_init, teardown, final_exception_handler from flow.plb, so they are callable from other toplevel procs (bug #16002675)
--     cneumuel   02/08/2013 - set_db_session_info: set v$session info for request and check QoS settings (bug #15893138)
--     pawolf     04/08/2013 - Moved wwv_flow_security.g_page_checksum* variables into wwv_flow.show
--     pawolf     04/08/2013 - Added path_prefix to t_workspace and made get_workspace public
--     pawolf     04/16/2013 - Added files_version to t_workspace (feature #1165)
--     cneumuel   05/24/2013 - Added who_called_me: patched version of owa_util.who_called_me that supports changes to call stack because of _plsql_max_stack_size (bug #16809536)
--     cneumuel   06/04/2013 - Removed set_internal_cookie_name (bug #12803793)
--     cneumuel   06/06/2013 - Added check_request_can_be_processed,setup_session_via_show (bug #16914036)
--     cneumuel   07/01/2013 - Added support for RAS sessions, dynamic roles and namespaces (feature #1152)
--     cneumuel   07/16/2013 - Moved RAS code to wwv_flow_session_ras
--     cneumuel   07/24/2013 - Added can_set_g_security_group_id
--                           - Replaced who_called_me with get_owner_of_calling_code
--     cneumuel   08/20/2013 - Added teardown_fsp_show_popuplov (bug #16914036)
--     cneumuel   09/05/2013 - removed apex_builder_authentication (replaced by wwv_flow_authentication_dev.get_intenral_authentication)
--     cneumuel   09/09/2013 - In can_set_g_security_group_id: default p_calling_user to coalesce(g_parse_as_schema_override, g_parse_as_schema, user)
--     cneumuel   09/11/2013 - Moved implementation of close_open_db_links from htmldb_util to wwv_flow_security
--     cneumuel   10/17/2013 - added hash_password, which supports different hashing algorithms (feature #1290)
--     cneumuel   10/18/2013 - moved hash_password from wwv_flow_security to wwv_flow_crypto
--                           - in encrypt_session_value, decrypt_session_value: add p_item_name and use it together with g_security_group_id as initialization vector
--     cneumuel   10/21/2013 - wwv_flow_utilities.page_checksum -> wwv_flow_security.url_checksum
--     cneumuel   10/24/2013 - In reset_app_checksum_salt: also change salt in translated apps (bug #17648313)
--     cneumuel   10/25/2013 - Removed g_element
--     cneumuel   10/30/2013 - Moved c_sso_select_workspace_page from wwv_flow_security to wwv_flow_authentication_dev
--     cneumuel   01/31/2014 - Added get_db_user: return parsing user, fall back to USER if null
--                           - In has_apex_administrator_role: default p_username to null. if null, fall back to get_db_user (bug #18159798)
--                           - In can_set_g_security_group_id: fall back to get_db_user if given user is APEX user (bug #18159798)
--     cneumuel   03/05/2014 - In t_workspace, get_workspace: added max_session_length_sec, max_session_idle_sec (feature #1323)
--     cneumuel   03/28/2014 - removed g_import_in_progress (bug #18329215)
--     cneumuel   05/09/2014 - Removed unused variables: t_workspace.{first_schema_provisioned,cloud_group_name}, g_ws_instance, g_crypto_salt
--     cneumuel   05/13/2014 - Added g_authentication_user_id (bug #18693768)
--     cneumuel   06/12/2014 - Added get_flow_security_group_id
--     cneumuel   06/25/2014 - Added get_sanitized_path_prefix (bug #19050885)
--     cneumuel   09/30/2014 - In reset_app_checksum_salt: added p_function parameter
--     cneumuel   11/03/2014 - In url_checksum: change p_checksum_type to t_checksum_protection_type. for "may not be set from browser", add random value to always generate a wrong checksum (feature #1568)
--                           - moved g_url_checksum_src from wwv_flow to wwv_flow_security 
--     cneumuel   12/05/2014 - Added exists_db_user (bug #20130260)
--     cneumuel   12/09/2014 - Added get_db_user_or_role (bug #20130260)
--     cneumuel   01/08/2015 - In ip_check: fix ipv6 normalization issues (bug #16512248)
--     cneumuel   02/09/2015 - Added overloaded set_g_security_group_id, for set_security_group_id in wwv_flow_api and htmldb_util (bug #20506295)
--     cneumuel   06/08/2015 - Renamed does_host_prefix_match to does_url_match_workspace, added p_path_prefix and include that in check (feature #1798)
--     cneumuel   08/03/2015 - Added clear_workspace_cache (bug #21530759)
--     cneumuel   09/02/2015 - In find_security_group_id: add p_only_assigned and only return assigned workspace if true (bug #21766012)
--
--------------------------------------------------------------------------------

--==============================================================================
-- for passing a connection record to/from dynamic code in wwv_flow_mail
--==============================================================================
g_dyn_exec_smtp_conn sys.utl_smtp.connection;

--==============================================================================
-- wallet information for public key certificates of ssl encoded ldap, http and
-- mail
--==============================================================================
type t_wallet is record (
    wallet_path                 varchar2(4000),
    wallet_pwd                  varchar2(4000) );

--==============================================================================
-- workspace settings
--==============================================================================
type t_workspace is record (
    security_group_id            wwv_flow_companies.provisioning_company_id%type,
    short_name                   wwv_flow_companies.short_name%type,
    display_name                 wwv_flow_companies.display_name%type,
    rm_consumer_group            wwv_flow_companies.rm_consumer_group%type,
    host_prefix                  wwv_flow_companies.host_prefix%type,
    path_prefix                  wwv_flow_companies.path_prefix%type,
    account_status               wwv_flow_companies.account_status%type,
    fnd_user_max_login_failures  wwv_flow_companies.fnd_user_max_login_failures%type,
    expire_fnd_user_accounts     wwv_flow_companies.expire_fnd_user_accounts%type,
    qos_max_workspace_requests   wwv_flow_companies.qos_max_workspace_requests%type,
    qos_max_session_requests     wwv_flow_companies.qos_max_session_requests%type,
    qos_max_session_kill_timeout wwv_flow_companies.qos_max_session_kill_timeout%type,
    max_session_length_sec       wwv_flow_companies.max_session_length_sec%type,
    max_session_idle_sec         wwv_flow_companies.max_session_idle_sec%type,
    files_version                wwv_flow_companies.files_version%type
);

--==============================================================================
-- workspace login control settings
--==============================================================================
type t_workspace_sec is record (
    login_throttle_delay   pls_integer,
    login_throttle_methods varchar2(4000),
    expire_accounts        boolean,
    failed_login_threshold pls_integer );

--==============================================================================
-- checksum level types
--==============================================================================
subtype t_checksum_protection_type is pls_integer range 0 .. 4;
c_checksum_type_none            constant t_checksum_protection_type := 0;
c_checksum_type_app             constant t_checksum_protection_type := 1; -- also 'PUBLIC_BOOKMARK'
c_checksum_type_user            constant t_checksum_protection_type := 2; -- also 'PRIVATE_BOOKMARK'
c_checksum_type_session         constant t_checksum_protection_type := 3; -- also 'SESSION'
c_checksum_type_noargs          constant t_checksum_protection_type := 4;

--==============================================================================
-- URL Tampering Prevention - value set in f and tested in wwv_flow.show
--==============================================================================
g_url_checksum_src  varchar2(32767);

g_custom_authentication_page    number;
g_custom_invalid_session_url    varchar2(4000);
g_sso_session_registration      boolean        := false;
g_authenticated                 boolean        := false;
g_notification_checksum         boolean        := true;
g_success_message_checksum      boolean        := true;
g_internal_app_checksum         boolean        := true;
g_user                          varchar2(255);
g_flow_id                       number;
g_instance                      number;
g_translated_flow_id            number;
g_page_request                  boolean        := false;
g_context                       varchar2(60)   := 'NULL';   -- mike security

-------------------------------
-- the current users company ID
--
g_security_group_id            number := 0;


--------------------------------------------------------------------
-- the Oracle Schema whos rights and privs will be used to parse SQL
--
g_parse_as_schema              varchar2(255);  -- owner of the application, use this owner to parse SQL


---------------------------------------------------
-- to avoid parsing as the flows schema supper user
g_parse_as_schema_override     varchar2(255);  -- for app builder set this global to avoid parsing as flows schema

------------------------------------------------------------------------------
-- the schema where the APEX$ tables are located for the current workspace
g_apex$_schema                 varchar2(255);

-----------------------------------------------------
-- the security group id (aka company id) of the flow
--
g_curr_flow_security_group_id  number;

--
-- constants and variables to support fnd account access
--
AUTH_NORMAL                   constant pls_integer := 0;
AUTH_UNKNOWN_USER             constant pls_integer := 1;
AUTH_ACCOUNT_LOCKED           constant pls_integer := 2;
AUTH_ACCOUNT_EXPIRED          constant pls_integer := 3;
AUTH_PASSWORD_MISMATCH        constant pls_integer := 4;
AUTH_PASSWORD_FIRST_USE       constant pls_integer := 5;
AUTH_PWD_ATTEMPTS_EXCEEDED    constant pls_integer := 6;
AUTH_INTERNAL_ERROR           constant pls_integer := 7;
AUTH_UNKNOWN_WORKSPACE        constant pls_integer := 8;
AUTH_LOGIN_ATTEMPTS_THROTTLED constant pls_integer := 9;


g_authenticate_user_action     boolean;        -- set when wwv_flow_security.authenticate is executing
g_authentication_result        number;         -- coded result of wwv_flow_security.authenticate
g_authentication_user_id       number;         -- workspace user id if wwv_flow_security.authenticate was successful
g_custom_authentication_status varchar2(4000); -- may be set by author of custom authentication function using api

--==============================================================================
-- Translate company name to the security group id
--==============================================================================
function find_security_group_id (
     p_company       in varchar2 default null,
     p_only_assigned in boolean  default false )
     return number;

--==============================================================================
--
--==============================================================================
function find_first_schema (
     p_security_group_id in number)
     return varchar2;

--==============================================================================
--
--==============================================================================
function find_company_name (
     p_security_group_id in number)
     return varchar2;

--
-- C O O K I E
--

--==============================================================================
--
--==============================================================================
function cookie_user
    return varchar2;

--==============================================================================
-- determine if application developer can edit the current flow
--
-- Identify the developer from the session cookie. The
-- wwv_flow_security.cookie_user function will return the user only if an
-- session cookie exists matching wwv_flow_security.g_security_group_id and the
-- session encoded in the cookie still exists in wwv_flow_sessions$ and also
-- has matching criteria.
--==============================================================================
function cookie_user_can_dev_curr_flow(
    p_user in varchar2 default null)
   return boolean;

--==============================================================================
-- return the default cookie name
--==============================================================================
function get_default_cookie_name (
    p_flow_id           in number,
    p_security_group_id in number default null )
    return varchar2;

--
-- P L A T F O R M   P R I V S
--
--==============================================================================
--
--==============================================================================
function flow_owner (
    p_flow_id             in number,
    p_security_group_id   in number)
    return varchar2;

--==============================================================================
-- return the workspace id of a given application or null if the app does not
-- exist.
--==============================================================================
function get_flow_security_group_id (
    p_flow_id in number )
    return number;

--==============================================================================
-- used in 4000, 4050
--==============================================================================
function user_is_internal
   return boolean;

--==============================================================================
-- used in 4000
--==============================================================================
function user_can_develop_flow (
   p_flow_id in number)
   return boolean;

--==============================================================================
--
--==============================================================================
function current_company_can_build (
    p_in_schema in varchar2)
    return boolean;

--==============================================================================
--
--==============================================================================
function current_company_can_parse (
    p_in_schema in varchar2)
    return boolean;

--==============================================================================
--
--==============================================================================
function get_security_group_id (
    p_provisioned_schema in varchar2)
    return number;

--==============================================================================
-- used in 4000, 4350
--==============================================================================
function user_can_develop_any_flow
    return boolean;

--==============================================================================
-- return USER, ROLE or null, depending on whether p_username is a database
-- user, a role or not defined in sys.user$
--==============================================================================
function get_db_user_or_role (
    p_username in varchar2 )
    return varchar2;

--==============================================================================
-- return whether a db user exists
--==============================================================================
function exists_db_user (
    p_username in varchar2 )
    return boolean;

--==============================================================================
-- return the database user which executes this api call. the function looks
-- at g_parse_as_schema_override and g_parse_as_schema before falling back to
-- USER.
--==============================================================================
function get_db_user
    return varchar2;

--==============================================================================
-- return if p_username has been granted APEX_ADMINISTRATOR_ROLE or is in
-- (wwv_flow.g_flow_schema_owner, SYS, SYSTEM)
--==============================================================================
function has_apex_administrator_role (
    p_username in varchar2 default null )
    return boolean;
--
--==============================================================================
-- return Y if p_username has been granted APEX_ADMINISTRATOR_ROLE or is in
-- (wwv_flow.g_flow_schema_owner, SYS, SYSTEM)
--==============================================================================
function has_apex_administrator_role_yn (
    p_username in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- return if p_username has role "DBA"
--==============================================================================
function user_is_dba(
    p_username in varchar2)
    return boolean;

--==============================================================================
-- is the user authenticated to the builder?
--==============================================================================
function user_builder_session_company
    return number;

--==============================================================================
-- return the session id of the development environment.
-- this is used to provide links to the builder with the proper session id
--==============================================================================
function get_builder_session_id
    return number;

--==============================================================================
--
--==============================================================================
procedure session_cookie_info_internal(
    p_user    out varchar2,
    p_session out number,
    p_sgid    out number);

--==============================================================================
-- Verify notification message checksum
--==============================================================================
function verify_notify_msg_checksum
    return boolean;

--==============================================================================
-- Verify print success message checksum
--==============================================================================
function verify_print_msg_checksum
    return boolean;

--==============================================================================
--
--==============================================================================
function authenticated_session(
    p_flow_id           in number,
    p_security_group_id in number,
    p_session_id        in number default null)
    return boolean;

--==============================================================================
-- normalize a compressed ipv6 address. compression removes leading zeroes and
-- replaces a consecutive sequence of zero groups with :: (only allowed once,
-- to avoid abiguity).
--
-- compressed             normalized
-- ---------------------- ---------------------------------------
-- 2001:db8::ff00:42:8329 2001:0db8:0000:0000:0000:ff00:0042:8329
-- ::1                    0000:0000:0000:0000:0000:0000:0000:0001
--
--==============================================================================
function normalize_ipv6_address (
    p_ip_address in varchar2 )
    return wwv_flow_global.vc_arr2;

--==============================================================================
-- Checks if page access is from an IP address that is in an "allow list".
--
-- PARAMETERS
-- * p_remote_addr       The address to check. Defaults to the REMOTE_ADDR CGI
--                       value.
-- * p_restrict_ip_range The comma separated list of allowed IP ranges.
--                       Defaults to the RESTRICT_IP_RANGE instance parameter.
--
-- used in 4550
--==============================================================================
function ip_check (
    p_remote_addr       in varchar2 default null,
    p_restrict_ip_range in varchar2 default null )
    return boolean;

--==============================================================================
-- Return the client IP address
--
-- If p_remove_proxies is true, the computation is based on g_remote_addr,
-- g_x_forwarded_for and INBOUND_PROXIES. If Apex detects that it is behind a
-- proxy (g_x_forwarded_for exists and is not equal to g_remote_addr), it
-- removes the proxies from g_x_forwarded_for and returns the rightmost
-- remaining address.
--
-- If p_remove_proxies is false, the function returns g_x_forwarded_concatenated
-- with g_remote_addr.
--==============================================================================
function get_client_ip_address (
    p_remove_proxies in boolean default true )
    return varchar2;

--==============================================================================
-- The DISABLE_ADMIN_LOGIN preference setting
-- can be created and set to YES using the site
-- admin page for environment preferences. If this
-- preference is YES, this function will return true.
--==============================================================================
function disable_admin_login
    return boolean;

--==============================================================================
-- The DISABLE_WORKSPACE_LOGIN preference setting
-- can be created and set to YES using the site
-- admin page for environment preferences. If this
-- preference is YES, this function will return true.
--==============================================================================
function disable_workspace_login
    return boolean;

--##############################################################################
--#
--# U R L   T A M P E R I N G
--#
--##############################################################################

g_page_protection_enabled     boolean := false;
g_page_protection_level       varchar2(1);
g_direct_branch               boolean := false;
g_application_checksum_salt   raw(255);
g_application_bookmark_cs_fnc wwv_flow_crypto.t_hash_function;

--==============================================================================
-- Reset checksum salt and bookmark hash function for an application.
-- See 4000:517
--==============================================================================
procedure reset_app_checksum_salt (
    p_flow_id  in number,
    p_function in wwv_flow_crypto.t_hash_function );

--==============================================================================
-- compute checksum
--==============================================================================
function url_checksum (
    p_string                     in varchar2,
    p_checksum_type              in t_checksum_protection_type,
    p_bookmark_checksum_function in wwv_flow_crypto.t_hash_function,
    p_checksum_salt              in raw )
    return varchar2;

--##############################################################################
--
-- P A S S W O R D   C H E C K I N G
--
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
-- perform password validation and return a html text that describes the errors
-- or null if the validation succeeds
--==============================================================================
function strong_password_validation(
    p_username         in varchar2,
    p_password         in varchar2,
    p_old_password     in varchar2 default null,
    p_workspace_name   in varchar2,
    p_use_strong_rules in boolean default false)
    return varchar2;

--==============================================================================
-- Authenticate a workspace user
--
-- ARGUMENTS
-- * p_user_name               login user name (a workspace user)
-- * p_password                p_user_name's password
-- * p_company                 workspace where p_user_name authenticates to
-- * p_ignore_password         if true, do not check password. this is used for
--                             when the builder is in single-sign-on mode and
--                             p_user_name is just a shadow account.
-- * p_settings_from_workspace if not null, take workspace security settings (
--                             account expiration, max. login failures) from
--                             there instead of from p_company.
--==============================================================================
function authenticate (
    p_user_name               in varchar2 default null,
    p_password                in varchar2 default null,
    p_company                 in varchar2 default null,
    p_ignore_password         in boolean default false,
    p_settings_from_workspace in number default null )
    return boolean;

--==============================================================================
-- return if the given credentials are valid in the workspace
--==============================================================================
function is_workspace_password_valid (
    p_workspace_id     in number,
    p_username         in varchar2,
    p_password         in varchar2 )
    return boolean;

--==============================================================================
-- used in 4050, 4350
--==============================================================================
function get_expired_user_sgid
    return number;

--==============================================================================
-- used in 4050, 4155, 4350
--==============================================================================
function get_expired_user_name
    return varchar2;

--==============================================================================
-- used in 4050, 4155, 4350
--==============================================================================
procedure purge_expired_user_header(
    p_session in number default wwv_flow.g_instance);
--
--==============================================================================
-- Set the system preferences for the wallet.
-- Used for ssl connections with dbms_ldap and utl_mail.
--==============================================================================
procedure set_wallet (
    p_wallet in t_wallet );
--
--==============================================================================
-- Get the system preferences for the wallet.
-- Used for ssl connections with dbms_ldap and utl_mail.
--==============================================================================
function get_wallet
    return t_wallet;

--==============================================================================
-- Return the translated flow_id or fall back to g_flow_id
-- used in tab.sql
--==============================================================================
function get_translated_flow_id
    return number;


--==============================================================================
-- Return p_id with the translated flow id in the decimal places
--==============================================================================
function get_translated_id (
    p_id in number )
    return number;

--==============================================================================
-- used in tab.sql
--==============================================================================
function get_flow_id
    return number;

--==============================================================================
--
--==============================================================================
function prep_url(
    p_url       in varchar2
    ) return varchar2;

--==============================================================================
--
--==============================================================================
function encrypt_session_value (
    p_item_name         in varchar2,
    p_unencrypted_value in varchar2 )
    return varchar2;

--==============================================================================
--
--==============================================================================
function decrypt_session_value (
    p_item_name       in varchar2,
    p_encrypted_value in varchar2 )
    return varchar2;

--==============================================================================
--
--==============================================================================
function authorized_url(
    p_url in varchar2 ) return varchar2;

--==============================================================================
-- Set a Resource Manager consumer group for the current database session.
--==============================================================================
procedure set_rm_consumer_group (
    p_consumer_group in varchar2 );

--==============================================================================
-- Returns if the workspace's host_prefix and path_prefix allow access via the
-- URL (i.e. CGI variables).
--==============================================================================
function does_url_match_workspace (
    p_security_group_id in number,
    p_host_prefix       in varchar2,
    p_path_prefix       in varchar2 )
    return boolean;

--==============================================================================
-- Return whether the calling user can set the security group id
--
-- This check is used in public API procedures that set security group id, to
-- ensure that the operation is allowed.
--
-- ARGUMENTS
-- * p_security_group_id the security group id to be set
-- * p_calling_user      the db user for which the check should be performed.
--                       it defaults to coalesce(g_parse_as_schema_override,
--                       g_parse_as_schema, user)
--==============================================================================
function can_set_g_security_group_id (
    p_security_group_id    in number,
    p_calling_user         in varchar2 default null )
    return boolean;

--==============================================================================
-- Set g_security_group_id.
--
-- This
-- - activates the workspace's Resource Manager consumer group if one is
--   assigned
-- - checks the workspace's host_prefix (a comma-separated list) against the
--   HTTP_HOST CGI variable and raises an error if host_prefix is set but no
--   list element matches
--==============================================================================
procedure set_g_security_group_id (
    p_security_group_id    in number  default g_security_group_id,
    p_check_host_prefix    in boolean default true,
    p_check_account_status in boolean default true );

--==============================================================================
-- set security group id if this is allowed for p_calling_user. if it is not
-- allowed and p_raise_error, raise an error
--==============================================================================
procedure set_g_security_group_id (
    p_security_group_id    in number,
    p_calling_user         in varchar2,
    p_raise_error          in boolean );

--==============================================================================
-- Grant Connect Through APEX_REST_PUBLIC_USER for access to RESTful Services
--==============================================================================
procedure grant_restful_connect;

--==============================================================================
-- Clear the internal page checksum variable.
--==============================================================================
procedure clear_page_checksum;

--==============================================================================
-- Returns the checksum for a page item value and adds the calculated checksum
-- to the internal page checksum as well to generate a cross check checksum.
--==============================================================================
function get_page_item_value_checksum (
    p_page_submission_id in number,
    p_value              in varchar2 )
    return varchar2;

--==============================================================================
-- Returns the number of page items which have been protected by a call to
-- get_page_item_value_checksum.
-- This function is used by page and region cache to determine if a page or
-- region is cacheable.
--==============================================================================
function get_protected_page_items_count
    return pls_integer;

--==============================================================================
-- Returns the page checksum based on the checksums set by the
-- get_page_item_checksum calls.
--==============================================================================
function get_page_checksum (
    p_page_submission_id in number )
    return varchar2;

--##############################################################################
--#
--# WORKSPACE UTILITIES
--#
--##############################################################################

--==============================================================================
-- clear internally cached workspace info
--==============================================================================
procedure clear_workspace_cache;

--==============================================================================
-- return workspace settings.
--==============================================================================
function get_workspace (
    p_security_group_id in number )
    return t_workspace;

--==============================================================================
-- return security settings of workspace.
--==============================================================================
function get_workspace_sec_settings (
    p_security_group_id in number default wwv_flow_security.g_security_group_id,
    p_internal          in boolean default false )
    return t_workspace_sec;

--==============================================================================
-- Get group_name||'.' for the current workspace
--==============================================================================
function get_workspace_group_prefix (
    p_security_group_id in number default g_security_group_id )
    return varchar2;

--==============================================================================
-- a workspace's path_prefix needs to be unique and only allows a restricted
-- set of characters. this function sanitizes the given p_path_prefix to make
-- it conform to these criteria. if the sanitized prefix is not unique or null,
-- it gets replaced by a unique number.
--
-- ARGUMENTS
-- * p_path_prefix       input path prefix
-- * p_security_group_id workspace id of the input path prefix
--==============================================================================
function get_sanitized_path_prefix (
    p_path_prefix       in varchar2,
    p_security_group_id in number )
    return varchar2;

--##############################################################################
--#
--# BEGINNING AND ENDING A REQUEST
--#
--##############################################################################

--==============================================================================
-- at the beginning of a request, configure the sql/hprof and debug mode
--==============================================================================
procedure configure_trace_and_debug (
    p_trace                      in varchar2,
    p_debug                      in varchar2,
    p_alert_if_debug_not_allowed in boolean );

--==============================================================================
-- return whether debug is enabled (set via configure_trace_and_debug)
--==============================================================================
function is_debug_enabled
    return boolean;

--==============================================================================
-- return whether remote debug is enabled (set via configure_trace_and_debug)
--==============================================================================
function is_remote_debug_enabled
    return boolean;

--==============================================================================
-- return the sql or hprof trace mode (set via configure_trace_and_debug)
--==============================================================================
function get_trace_mode
    return varchar2;

--==============================================================================
-- db session init (aka vpd)
--==============================================================================
procedure db_session_init;

--==============================================================================
-- cleanup code at the end of the top level request procedure
--==============================================================================
procedure teardown (
    p_trace in varchar2 default null );

--==============================================================================
-- exception handling code at the end of the top level request procedure
--==============================================================================
procedure final_exception_handler (
    p_trace           in varchar2 default null,
    p_show_error_page in boolean default true );

--==============================================================================
-- cleanup code in show, when the request is FSP_SHOW_POPUPLOV
--==============================================================================
procedure teardown_fsp_show_popuplov;

--==============================================================================
-- set info in v$session, via dbms_application_info and
-- dbms_session.set_identifier
--==============================================================================
procedure set_db_session_info;

--==============================================================================
-- function to get the owner of the calling PL/SQL function or procedure
-- default to USER if the caller could not be determined (e.g. an anonymous block)
--==============================================================================
function get_owner_of_calling_code
    return varchar2;

--==============================================================================
-- perform initial security checks for show/accept, after the application
-- metadata has been initialized.
--
-- The checks are
-- * app owner is a valid workspace schema
-- * app owner is a valid database schema
-- * FSP_SHOW_POPUPLOV request can be processed
--==============================================================================
procedure check_request_can_be_processed;

--==============================================================================
-- Use wwv_flow.show to initialize the environment, but exits before actually
-- rendering the page. This procedure does not reset global variables, so
-- teardown/final_exception_handler have to be run by the caller.
--
-- ARGUMENTS
-- * p_flow_id               application id
-- * p_flow_step_id          page id
-- * p_instance              session id
-- * p_error_if_unauthorized if true and wwv_flow.show fails to authenticated
--                           the session, raise WWV_FLOW_HELP.UNAUTHORIZED
--==============================================================================
procedure setup_session_via_show (
    p_flow_id               in number,
    p_flow_step_id          in number,
    p_instance              in number,
    p_error_if_unauthorized in boolean default true );

--==============================================================================
-- Close all database links open in the current session
--==============================================================================
procedure close_open_db_links;

end wwv_flow_security;
/
show errors

set define '^'
