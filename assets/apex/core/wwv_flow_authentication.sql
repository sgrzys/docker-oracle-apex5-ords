set define '^' verify off
prompt ...wwv_flow_authentication
create or replace package wwv_flow_authentication as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_authentication.sql
--
--    DESCRIPTION
--      This package provides an internal API for authentication plugins
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/17/2011 - Created
--    cneumuel    05/20/2011 - Added execute_login,execute_logout, moved native plugins to wwv_flow_plugin_authentication (feature #581)
--    cneumuel    05/26/2011 - Signature changes and code improvements - first working version (feature #581)
--    cneumuel    06/06/2011 - Added get_cookie_properties,get_login_help_for_app,activate_in_app,get_translated_authent_name
--    cneumuel    07/11/2011 - Session zero support (bug #12732173)
--    cneumuel    07/25/2011 - Added is_invalid_session_page, which returns true on the login page (bug #12794514)
--    cneumuel    07/28/2011 - Added get_builtin_login_url, return that open door auth does not need password (bug #12795092)
--    cneumuel    10/13/2011 - In execute_login: add p_post_login (bug #13045147)
--    cneumuel    01/13/2012 - In execute_logout(): added p_ws_app_id to get session cookie from websheet app (bug #13360987)
--    cneumuel    02/03/2012 - Added get_session_0_cookie_value (bug #13653895)
--    cneumuel    02/29/2012 - Renamed from wwv_flow_authentication_engine
--    cneumuel    03/28/2012 - Added throttle_login_attempts, log_login (bug #13713222)
--    cneumuel    03/30/2012 - Cleaned up login throttle code (bug #13713222)
--    cneumuel    04/02/2012 - Added add_login_throttle_onload_code.
--    cneumuel    04/05/2012 - In t_login_throttle,compute_login_throttle: use instance setting for delay (feature #899)
--    cneumuel    04/10/2012 - Added is_public_page (bug #13940433)
--    cneumuel    05/03/2012 - Moved get_login_help_for_app, get_translated_authent_name, activate_in_app to wwv_flow_authentication_dev
--    cneumuel    05/10/2012 - Removed dead code: send_session_cookie
--    cneumuel    05/16/2012 - Removed send_session_0_cookie, get_session_0_cookie_value, added get_session_id_if_public (bug #13708507)
--    cneumuel    06/14/2012 - extend login throttle to delay by username, ip or username+ip (feature #899)
--    cneumuel    07/03/2012 - In load_authentication, authenticate_and_init_session: added ui detection logic (feature #791)
--    cneumuel    08/08/2012 - In execute_login: added p_builder_login_for_workspace, to correctly log the workspace and appliy the throttle for builder logins
--    cneumuel    11/15/2012 - In execute_login: change workspace consistency check to allow builder login via other app than 4550 (bug #15867739)
--    cneumuel    07/04/2013 - Added get_scheme_type (feature #1233)
--    cneumuel    01/28/2014 - REQUIRE_HTTPS is tri-state (A, I, N), added public function require_https. added support for HTTP_RESPONSE_HEADERS (feature #1065)
--
--------------------------------------------------------------------------------

type t_authentication_result is record (
    is_valid     boolean,
    redirect_url varchar2(32767) );

type t_failed_login_counter is record (
    method_name    varchar2(30),
    counting       boolean,
    login_attempts pls_integer,
    last_login     date );

type t_login_throttle is record (
    username_counter    t_failed_login_counter,
    ip_counter          t_failed_login_counter,
    username_ip_counter t_failed_login_counter,
    delay_increase      pls_integer,
    delay_seconds       pls_integer );

--##############################################################################
--#
--# U T I L I T Y   F U N C T I O N S
--#
--##############################################################################

--==============================================================================
-- get authentication scheme type of current application.
-- this has to be run after the metadata has been loaded, e.g. via
-- authenticate_and_init_session.
--==============================================================================
function get_scheme_type
    return wwv_flow_authentications.scheme_type%type;

--==============================================================================
-- helper function to get the builtin login url in app 4155 for the current
-- page and session.
--==============================================================================
function get_builtin_login_url return varchar2;

--==============================================================================
-- get cookie properties for specified application
--==============================================================================
procedure get_cookie_properties (
    p_app_id        in number,
    p_cookie_name   out varchar2,
    p_cookie_path   out varchar2,
    p_cookie_domain out varchar2,
    p_secure        out boolean );

--==============================================================================
-- Helper function for authorizations
--
-- Return if the current page is the invalid session (i.e. login) page
--==============================================================================
function is_invalid_session_page
    return boolean;

--==============================================================================
-- Helper function for authorizations
--
-- Return if the current page is a public page
--==============================================================================
function is_public_page
    return boolean;

--==============================================================================
-- return the REQUIRE_HTTPS instance preference
--==============================================================================
function require_https
    return varchar2;

--==============================================================================
-- determine whether session joining is allowed
--==============================================================================
function rejoin_existing_sessions (
    p_app_id                       in wwv_flows.id%type,
    p_app_browser_frame            in wwv_flows.browser_frame%type,
    p_app_rejoin_existing_sessions in wwv_flows.rejoin_existing_sessions%type,
    p_page_info                    in wwv_flow_page.t_page_info )
    return wwv_flows.rejoin_existing_sessions%type;

--##############################################################################
--#
--# S E S S I O N   I N I T I A L I Z A T I O N
--#
--##############################################################################

--==============================================================================
-- Show/accept interface
--
-- The function to start authentication and initialize the session.
--==============================================================================
function authenticate_and_init_session (
    p_app_id                  in number,
    p_has_safe_url_parameters in boolean default null )
    return t_authentication_result;

--##############################################################################
--#
--# L O G I N / L O G O U T
--#
--##############################################################################

--==============================================================================
-- login interface
--
-- the entry point to the engine to perform user/password authentication.
--
-- ARGUMENTS
-- * p_username                    the end user's name
-- * p_password                    the end user's password
-- * p_current_app_id
-- * p_next_app_id
-- * p_next_page_id
-- * p_post_login                  if true, do not call pre-authentication and
--                                 authentication function, i.e. no credentials
--                                 hecking
-- * p_builder_login_for_workspace when called from wwv_flow_login.builder: the
--                                 workspace where the user wants to login. null
--                                 otherwise.
--==============================================================================
procedure execute_login (
    p_username                    in varchar2,
    p_password                    in varchar2,
    p_current_app_id              in number,
    p_next_app_id                 in number,
    p_next_page_id                in number,
    p_post_login                  in boolean default false,
    p_builder_login_for_workspace in number  default null );

--==============================================================================
-- custom_auth_std.logout interface
--
-- log out of session, using the authentication scheme of p_app_id.
-- if p_app_id=4900, then p_ws_app_id should contain the websheet app id.
--==============================================================================
procedure execute_logout (
    p_session_id in number,
    p_app_id     in number,
    p_ws_app_id  in number default null );

--##############################################################################
--#
--# L O G I N   T H R O T T L E
--#
--##############################################################################

--==============================================================================
-- if workspace expiry is enabled, create a record with the number of seconds
-- that login has to be delayed because of past login attempts.
-- if workspace expiry is disabled, return an empty record.
--==============================================================================
function create_login_throttle (
    p_security_group_id in number default wwv_flow_security.g_security_group_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_username          in varchar2 )
    return t_login_throttle;

--==============================================================================
-- if workspace expiry is disabled, do nothing.
-- elsif p_throttle contains a delay, set p_authentication to failed because of
-- the login delay.
-- elsif p_add_1_failure, add a login failure and re-compute the delay.
--==============================================================================
procedure apply_login_throttle (
    p_throttle       in out nocopy t_login_throttle,
    p_authentication in out nocopy wwv_flow_plugin_api.t_authentication_auth_result,
    p_add_1_failure  in boolean default false );

--==============================================================================
-- add javascript code for login throttle timer
--==============================================================================
procedure add_login_throttle_onload_code;

--##############################################################################
--#
--# L O G G I N G
--#
--##############################################################################

--==============================================================================
-- write successful and failed login attempts to the access log.
--==============================================================================
procedure log_login (
    p_username               in varchar2,
    p_security_group_id      in number   default wwv_flow_security.g_security_group_id,
    p_owner                  in varchar2 default wwv_flow_security.g_parse_as_schema,
    p_application_id         in number   default wwv_flow_security.g_flow_id,
    p_authentication_method  in varchar2,
    p_authentication_result  in number,
    p_custom_status_text     in varchar2 default null );

end wwv_flow_authentication;
/
show errors

