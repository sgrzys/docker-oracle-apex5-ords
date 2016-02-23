set define '^' verify off
prompt ...wwv_flow_authentication_native
create or replace package wwv_flow_authentication_native
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011. All Rights Reserved.
--
--    NAME
--      wwv_flow_authentication_native.sql
--
--    DESCRIPTION
--      This package provides an internal API for native authentication plugins
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/17/2011 - Created
--    cneumuel    05/26/2011 - Made ias_sso_invalid_session public, for reuse in internal authentication
--    pawolf      05/27/2011 - Added CGI_VARIABLE authentication
--    pawolf      06/17/2011 - Renamed CGI_VARIABLE to HTTP_HEADER_VARIABLE
--    cneumuel    10/17/2011 - Added get_header_cgi_username
--    pawolf      10/17/2011 - Added Cloud IDM authentication, added get_absolute_logout_url
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    cneumuel    02/29/2012 - Renamed from wwv_flow_native_authentication
--    pawolf      04/02/2012 - Added p_plugin to APIs
--    cneumuel    05/09/2012 - In ldap_authentication_hlp: ldap username escaping based on authentication scheme attribute value (bug #14047270)
--    cneumuel    05/10/2012 - Made ldap_authentication_impl public (bug #14047270)
--    cneumuel    04/03/2013 - In ldap_authentication_impl: added p_parse_as_schema for websheets (bug #16593319)
--
--------------------------------------------------------------------------------
--
--==============================================================================
-- native plugin scheme types
--==============================================================================
c_type_apex_accounts        constant varchar2(30) := 'NATIVE_APEX_ACCOUNTS';
c_type_ldap                 constant varchar2(30) := 'NATIVE_LDAP';
c_type_db_accounts          constant varchar2(30) := 'NATIVE_DB_ACCOUNTS';
c_type_open_door            constant varchar2(30) := 'NATIVE_OPEN_DOOR';
c_type_custom               constant varchar2(30) := 'NATIVE_CUSTOM';
c_type_dad                  constant varchar2(30) := 'NATIVE_DAD';
c_type_ias_sso              constant varchar2(30) := 'NATIVE_IAS_SSO';
c_type_http_header_variable constant varchar2(30) := 'NATIVE_HTTP_HEADER_VARIABLE';
c_type_cloud_idm            constant varchar2(30) := 'NATIVE_CLOUD_IDM';
--
--==============================================================================
--
subtype t_ssl_mode is varchar2(10);
c_ssl_mode_ssl      constant t_ssl_mode := 'SSL';
c_ssl_mode_ssl_auth constant t_ssl_mode := 'SSL_AUTH';
c_ssl_mode_no_ssl   constant t_ssl_mode := 'NO_SSL';

subtype t_ldap_esc is varchar2(4);
c_ldap_esc_std           constant t_ldap_esc := 'STD';
c_ldap_esc_special_chars constant t_ldap_esc := 'ONLY';
c_ldap_esc_no_escaping   constant t_ldap_esc := 'NO';

type t_custom_attributes is record (
    -- only for c_type_custom
    sso_partner_app_name varchar2(4000),
    -- for c_type_ldap and c_type_custom
    ldap_host            varchar2(4000),
    ldap_port            number,
    ssl_mode             varchar2(10),
    dn_string            varchar2(4000),
    use_exact_dn         boolean,
    search_filter        varchar2(4000),
    edit_function        varchar2(4000),
    username_escaping    t_ldap_esc );
--
--==============================================================================
-- Get CGI variable value for HEADER authentication
--==============================================================================
function get_header_cgi_username (
    p_cgi_variable in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns an absolute (including http://domain/) logout URL if the passed in
-- logout url is relative (for example f?p=xxx).
--==============================================================================
function get_absolute_logout_url (
    p_logout_url in varchar2,
    p_escape_url in boolean  default true )
    return varchar2;
--
--==============================================================================
-- Invalid Session function for iAS SSO authentication.
--==============================================================================
function ias_sso_invalid_session (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_inval_result;
--
--==============================================================================
-- This function returns the attribute values of the current application's
-- authentication scheme. It is only supported for LDAP and CUSTOM
-- authentication, for others an error is raised. If the authentication type is
-- native LDAP authentication, it returns the ldap attributes. If it is CUSTOM,
-- it additionally returns the sso partner app name.
--==============================================================================
function get_custom_attributes
    return t_custom_attributes;
--
--==============================================================================
-- perform the LDAP authentication check 
--==============================================================================
function ldap_authentication_impl (
    p_username           in varchar2,
    p_password           in varchar2,
    p_ldap_attributes    in t_custom_attributes,
    p_parse_as_schema    in varchar2 default wwv_flow_security.g_parse_as_schema )
    return wwv_flow_plugin_api.t_authentication_auth_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin_rt to run the session sentry
-- function.
--==============================================================================
function execute_session_sentry (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin_rt to run the invalid 
-- session function.
--==============================================================================
function execute_invalid_session (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_inval_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin_rt to run the authentication
-- function for verifying the end user's username/password credentials.
--==============================================================================
function execute_authentication (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin_rt to run the 
-- "ajax_function" callback triggered by external authentication servers.
--==============================================================================
function execute_ajax_callback (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_ajax_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin_rt to run the 
-- post logout function.
--==============================================================================
function execute_post_logout (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_logout_result;

end wwv_flow_authentication_native;
/
show errors
