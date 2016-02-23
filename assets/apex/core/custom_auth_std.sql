set define '^' verify off
prompt ...wwv_flow_custom_auth_std
create or replace package wwv_flow_custom_auth_std as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001-2012. All Rights Reserved.
--
--     NAME
--       custom_auth_std.sql
--
--     DESCRIPTION
--       API package for flow developers using custom authentication
--       setups.
--
--       These functions and procedures allow flow developers to
--       invoke built-in entry points to the flow engine's custom
--       authentication code path and to interrogate environmental
--       and table values related to custom authentication.
--
--       Some of these modules may be intended for use only within
--       the flow engine runtime context, and others may be
--       called from within any context, as the comments indicate.
--
--    SECURITY
--       Executable via public synonym and grant
--
--     RUNTIME DEPLOYMENT: YES
--
--     MODIFIED    (MM/DD/YYYY)
--     sspadafo     09/24/2002 - Created
--     sspadafo     10/29/2002 - Added flowchart proc
--     sspadafo     11/05/2002 - Remove grant statement after code
--     sspadafo     11/15/2002 - Rename function get_session_id to get_session_id_from_cookie
--     sspadafo     11/16/2002 - Change params and extended function of logout procedure
--     sspadafo     11/16/2002 - Added moc_page_sentry_v1 and moc_logout_v1 functions/procedures
--     sspadafo     11/26/2002 - Removed params from get_username, is_session_valid
--     sspadafo     11/26/2002 - Added Portal SSO support
--     sspadafo     11/27/2002 - Moved Portal SSO support to wwv_flow_custom_auth_sso package
--     sspadafo     11/28/2002 - Moved portal_sso_sentry_v1 back into this package
--     sspadafo     05/30/2003 - Exposed ldap_authenticate function
--     sspadafo     11/04/2003 - Add get_ldap_props procedure (Bug 3236319)
--     sspadafo     06/25/2004 - Add p_preserve_case param to login,post_login procedures (Bug 3121711)
--     sspadafo     01/30/2005 - Add portal_sso_sentry_v0 (Bug 4152406)
--     cbcho        03/31/2006 - Added procedure authentication_status
--     sspadafo     08/31/2007 - Added procedure remove_session (Bug 6146451)
--     sspadafo     04/23/2008 - Added p_use_secure_cookie parameter to login, post_login, and logout (Bug 6991519)
--     sspadafo     01/03/2009 - Added support for declarative secure cookie property
--     sspadafo     11/01/2009 - Added ws_login, ws_post_login, ws_logout procedures
--     jstraub      03/18/2010 - Added p_use_ssl to get_ldap_props and ldap_authenticate
--     jstraub      03/26/2010 - Added p_use_exact_dn, p_search_filter to get_ldap_props and ldap_authenticate
--     jkallman     05/13/2010 - Remove all references to MOC authentication (Bug 9708928)
--     jkallman     06/14/2010 - Added missing parameter p_websheet_page_id to ws_login
--     cneumuel     04/11/2011 - Added internal proc builder_logout for builder sso
--     cneumuel     05/20/2011 - Added plugin_logout for plugin authentication logout (feature #581)
--     cneumuel     05/26/2011 - Moved plugin_logout to wwv_flow_authentication.logout (feature #581)
--     cneumuel     05/30/2011 - In ldap_authenticate(): made p_ldap_edit_function and p_owner optional
--     cneumuel     06/06/2011 - Removed flowchart_perpage,flowchart_login
--     cneumuel     07/27/2011 - Removed builder_logout since it is obsolete because of authentication plugins
--     cneumuel     03/18/2013 - In logout, logout_then_go_to_page, logout_then_go_to_url: added deprecation warning and desupport when compatibility mode >= 5 (bug #16506797)
--
--------------------------------------------------------------------------------

function get_username
    --
    -- Context: flows runtime
    -- Purpose: get username from wwv_flow_session$ for current session
    --
    return varchar2
    ;

function get_session_id_from_cookie
    --
    -- Context: flows runtime with cookie in cgi environment
    -- Purpose: get session id of current user based on cookie
    --
    return number
    ;

function is_session_valid
    --
    -- Context: flows runtime
    -- Purpose: determine if session exists and is valid
    --
    return boolean
    ;

procedure ws_logout(
    --
    -- Context: Use as redirect URL from navbar logout item and similar places
    -- Purpose: determine cookie for given websheet app, unset cookie, then redirect to url
    --
    p_websheet_app_id     in varchar2 default null,
    p_next_url            in varchar2 default null,
    p_use_secure_cookie   in boolean default false)
    ;

procedure remove_session
    ;

function portal_sso_sentry_v0
    return boolean
    ;

function portal_sso_sentry_v1
    return boolean
    ;

procedure login(
    --
    -- Context: any
    -- Purpose: Do after login page submit processing
    --          starting at the pre-authentication step.
    --
    p_uname             in varchar2 default null,
    p_password          in varchar2 default null,
    p_session_id        in varchar2 default null,
    p_flow_page         in varchar2 default null,
    p_entry_point       in varchar2 default null,
    p_preserve_case     in boolean default false,
    p_use_secure_cookie in boolean default false)
    ;

procedure ws_login(
    --
    -- Purpose: Do websheet login page submit processing
    --          starting at the pre-authentication step.
    --
    p_uname             in varchar2 default null,
    p_password          in varchar2 default null,
    p_session_id        in varchar2 default null,
    p_websheet_app_id   in varchar2 default null,
    p_entry_point       in varchar2 default null,
    p_preserve_case     in boolean default false,
    p_use_secure_cookie in boolean default false,
    p_websheet_page_id  in varchar2 default null )
    ;

procedure post_login(
    --
    -- Context: any
    -- Purpose: Do after login page submit processing
    --          starting at the post-authentication step.
    --
    p_uname             in varchar2 default null,
    p_password          in varchar2 default null,
    p_session_id        in varchar2 default null,
    p_flow_page         in varchar2 default null,
    p_preserve_case     in boolean default false,
    p_use_secure_cookie in boolean default false)
    ;

procedure ws_post_login(
    --
    -- Context: any
    -- Purpose: Do websheet login page submit processing
    --          starting at the post-authentication step.
    --
    p_uname             in varchar2 default null,
    p_password          in varchar2 default null,
    p_session_id        in varchar2 default null,
    p_websheet_app_id   in varchar2 default null,
    p_preserve_case     in boolean default false,
    p_use_secure_cookie in boolean default false)
    ;

procedure login_page(
    --
    -- Context: any
    -- Purpose: show flow 4155:1000 builtin login page
    --
   p_flow_page  in varchar2 default null)
   ;

procedure get_cookie_props(
    --
    -- Context: any
    -- Purpose: get cookie properties for specified flow
    --
    p_flow in number,
    p_cookie_name   out varchar2,
    p_cookie_path   out varchar2,
    p_cookie_domain out varchar2,
    p_secure        out boolean)
    ;

function ldap_dnprep(
    p_username in varchar2)
   return varchar2
   ;

procedure get_ldap_props(
    --
    -- Context: in application
    -- Purpose: get ldap config for current application's authentication scheme
    --
    p_ldap_host          out varchar2,
    p_ldap_port          out integer,
    p_use_ssl            out varchar2,
    p_use_exact_dn       out varchar2,
    p_ldap_dn            out varchar2,
    p_search_filter      out varchar2,
    p_ldap_edit_function out varchar2)
    ;

--##############################################################################
--#
--# DEPRECATED APIS - DO NOT USE
--#
--##############################################################################

--==============================================================================
function ldap_authenticate(
    p_username           in varchar2,
    p_password           in varchar2,
    p_ldap_host          in varchar2,
    p_ldap_port          in number,
    p_use_ssl            in varchar2 default 'N',
    p_use_exact_dn       in varchar2 default 'Y',
    p_ldap_string        in varchar2,
    p_search_filter      in varchar2 default null,
    p_ldap_edit_function in varchar2 default null,
    p_owner              in varchar2 default null)
    return boolean;

--==============================================================================
-- use apex_authentication.logout instead
--==============================================================================
procedure logout (
    p_this_flow           in varchar2 default null,
    p_next_flow_page_sess in varchar2 default null,
    p_next_url            in varchar2 default null,
    p_use_secure_cookie   in boolean default false );

--==============================================================================
-- use apex_authentication.logout instead
--==============================================================================
procedure logout_then_go_to_page (
    p_args in varchar2 default null);

--==============================================================================
-- use apex_authentication.logout instead
--==============================================================================
procedure logout_then_go_to_url (
    p_args in varchar2 default null);

end wwv_flow_custom_auth_std;
/
show errors
