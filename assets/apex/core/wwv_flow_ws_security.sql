set define '^' verify off
prompt ...wwv_flow_ws_security
create or replace package wwv_flow_ws_security as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2010. All Rights Reserved.
--
--    NAME
--      wwv_flow_ws_security.sql
--
--    DESCRIPTION
--      Security related functions for Websheets
--
--    MODIFIED (MM/DD/YYYY)
--     jkallman 01/21/2010 - Created
--     jstraub  01/21/2010 - Added current_user_is_devenv
--     jstraub  01/21/2010 - Added current_user_is_admin
--     sspadafo 01/25/2010 - Added f4900_create_auth_setup, ws_auth_type
--     jstraub  01/27/2010 - Added ws_acl_type and get_current_user_role
--     jstraub  02/04/2010 - Added admin_exists
--     sbkenned 02/12/2010 - Added admin_exists_sbk and create_auth_setup to pass in ws_app_id
--                           (will remove old and rename next week)
--     sbkenned 02/19/2010 - Removed f4900_create_auth_setup
--                         - Edited admin_exists (to match admin_exists_sbk), removed admin_exists_sbk
--     jstraub  03/11/2010 - Added ws_allow_public function returning boolean
--     cbcho    03/17/2010 - Added validate_sql,is_valid_sql
--     sspadafo 03/17/2010 - Added update_auth_setup procedure
--     cbcho    03/18/2010 - Added str_contains_valid_sql
--     cbcho    03/19/2010 - Changed is_valid_sql to pass table, schema parameter
--     cbcho    03/24/2010 - Added sql_enabled
--     jstraub  03/24/2010 - Removed remove_sql_val_cache, set_sql_val_cache, added is_valid_ws_query, sql_enabled_inst
--     jstraub  04/09/2010 - Added sql_enabled_yn and sql_enabled_inst_yn
--     jstraub  05/20/2010 - Added authenticate
--     mhichwa  06/11/2010 - added p_websheet_page_id to authenticate bug 9797007
--     cbcho    02/23/2011 - Changed str_contains_valid_sql to accept p_string as clob
--     cneumuel 03/30/2011 - Moved builder code into unauthenticate_on_auth_change
--     cneumuel 05/17/2011 - Removed obsolete current_user_is_devenv
--     cbcho    05/20/2011 - Changed str_contains_valid_sql to accept additional parameters p_page_id, p_section_id
--     cneumuel 11/29/2011 - Added set_role, get_authentication, exec_websheet_auth (from wwv_flow_security), removed authenticate (bug #13360987)
--     cneumuel 05/09/2012 - Removed obsolete code: unauthenticate_on_auth_change
--     cneumuel 05/10/2012 - Added ldap_username_escaping, owner to t_ws_authentication bug #14047270)
--     cneumuel 05/16/2012 - Removed create_auth_setup, update_auth_setup, added update_ws_properties (feature #808)
--
--------------------------------------------------------------------------------

--==============================================================================
subtype t_authent_scheme is varchar2(30);
c_authent_scheme_apex      constant t_authent_scheme := 'APEX';
c_authent_scheme_ldap      constant t_authent_scheme := 'LDAP';
c_authent_scheme_database  constant t_authent_scheme := 'DATABASE';
c_authent_scheme_dbaccount constant t_authent_scheme := 'DB_ACCOUNT';
c_authent_scheme_osso      constant t_authent_scheme := 'OSSO';
c_authent_scheme_cloud_idm constant t_authent_scheme := 'CLOUD_IDM';
c_authent_scheme_custom    constant t_authent_scheme := 'CUSTOM';

type t_ws_authentication is record (
    websheet_application_id   wwv_flow_ws_custom_auth_setups.websheet_application_id%type,
    acl_type                  wwv_flow_ws_applications.acl_type%type,
    allow_public_access_yn    wwv_flow_ws_applications.allow_public_access_yn%type,
    owner                     wwv_flow_ws_applications.owner%type,
    scheme_type               t_authent_scheme,
    page_sentry_function      wwv_flow_ws_custom_auth_setups.page_sentry_function%type,
    sess_verify_function      wwv_flow_ws_custom_auth_setups.sess_verify_function%type,
    invalid_session_page      wwv_flow_ws_custom_auth_setups.invalid_session_page%type,
    invalid_session_url       wwv_flow_ws_custom_auth_setups.invalid_session_url%type,
    pre_auth_process          wwv_flow_ws_custom_auth_setups.pre_auth_process%type,
    auth_function             wwv_flow_ws_custom_auth_setups.auth_function%type,
    post_auth_process         wwv_flow_ws_custom_auth_setups.post_auth_process%type,
    cookie_name               wwv_flow_ws_custom_auth_setups.cookie_name%type,
    cookie_path               wwv_flow_ws_custom_auth_setups.cookie_path%type,
    cookie_domain             wwv_flow_ws_custom_auth_setups.cookie_domain%type,
    use_secure_cookie_yn      wwv_flow_ws_custom_auth_setups.use_secure_cookie_yn%type,
    ldap_host                 wwv_flow_ws_custom_auth_setups.ldap_host%type,
    ldap_port                 wwv_flow_ws_custom_auth_setups.ldap_port%type,
    ldap_string               wwv_flow_ws_custom_auth_setups.ldap_string%type,
    ldap_search_filter        wwv_flow_ws_custom_auth_setups.ldap_search_filter%type,
    ldap_edit_function        wwv_flow_ws_custom_auth_setups.ldap_edit_function%type,
    ldap_username_escaping    wwv_flow_ws_custom_auth_setups.ldap_username_escaping%type,
    ldap_use_ssl              wwv_flow_ws_custom_auth_setups.ldap_use_ssl%type,
    ldap_use_exact_dn         wwv_flow_ws_custom_auth_setups.ldap_use_exact_dn%type,
    logout_url                wwv_flow_ws_custom_auth_setups.logout_url%type,
    security_group_id         wwv_flow_ws_custom_auth_setups.security_group_id%type );

--==============================================================================
-- set role for the current request. p_role must be one of
--   - (R)eader
--   - (C)ontributor
--   - (A)dmin
--   - (0) not authorized
--   - null
-- setting it to null activates the default role processing (i.e. lookup of
-- workspace or acl roles).
--==============================================================================
procedure set_role (
    p_role in varchar2 default null );

--==============================================================================
function get_current_user_role
    return varchar2;

--==============================================================================
function current_user_is_not_reader
    return boolean;

--==============================================================================
function current_user_is_reader
    return boolean;

--==============================================================================
function current_user_is_admin
    return boolean;

--==============================================================================
function admin_exists(
    p_username         in varchar2 default null,
    p_websheet_app_id  in number)
    return boolean;

--==============================================================================
procedure exec_websheet_auth(
    p_websheet_app_id in varchar2);

--==============================================================================
function get_authentication (
    p_websheet_app_id in number)
    return t_ws_authentication;

--==============================================================================
procedure update_ws_properties (
    p_ws in wwv_flow_ws_app_and_auth%rowtype );

--==============================================================================
function ws_auth_type(
    p_websheet_application_id in number)
    return varchar2;

--==============================================================================
function ws_acl_type(
    p_websheet_application_id in number)
    return varchar2;

--==============================================================================
function ws_allow_public(
    p_websheet_application_id in number)
    return boolean;

--==============================================================================
function sql_enabled (
    p_ws_app_id  in number) return boolean;

--==============================================================================
function sql_enabled_yn (
    p_ws_app_id  in number) return varchar2;

--==============================================================================
function sql_enabled_inst return boolean;

--==============================================================================
function sql_enabled_inst_yn return varchar2;

--==============================================================================
function is_valid_sql (
    p_ws_app_id  in number,
    p_type       in varchar2,
    p_sql        in varchar2 default null,
    p_schema     in varchar2 default null,
    p_table_name in varchar2 default null) return varchar2;

--==============================================================================
function is_valid_ws_query (
    p_ws_app_id     in number,
    p_sql           in varchar2) return varchar2;

--==============================================================================
function str_contains_valid_sql (
    p_ws_app_id    in number,
    p_page_id      in number,
    p_section_id   in out number,
    p_string       in clob default null) return varchar2;
end wwv_flow_ws_security;
/

show errors;

