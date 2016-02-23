set define '^'
set verify off

prompt ...htmldb_custom_auth

Rem     NAME
Rem       htmldb_custom_auth.sql
Rem
Rem     SCRIPT ARGUMENTS
Rem       none
Rem
Rem     DESCRIPTION
Rem       Publicy executable for wwv_flow_custom_auth
Rem
Rem     RUNTIME DEPLOYMENT: YES
Rem
Rem     MODIFIED   (MM/DD/YYYY)
Rem       jstraub   10/08/2003 - Created
Rem       sspadafo  09/20/2004 - Add functions from wwv_flow_custom_auth_std and sso package
Rem       sspadafo  09/28/2004 - Remove sso procedures/functions
Rem       sspadafo  08/31/2007 - Added procedure remove_session (Bug 6146451)
Rem       sspadafo  01/03/2009 - Added p_secure out parameter to get_cookie_props
Rem       jstraub   03/22/2010 - Added p_use_ssl to ldap_authenticate and get_ldap_props
Rem       jstraub   03/26/2010 - Added p_use_exact_dn, p_search_filter to ldap_authenticate and get_ldap_props

create or replace package htmldb_custom_auth
as
--  Copyright (c) Oracle Corporation 2001-2003. All Rights Reserved.
--
--     DESCRIPTION
--       API package for flow developers using custom authentication.
--
--       These functions and procedures provide access to flow
--       metadata and flow session state and provide wrappers
--       for commonly used security-related modules.
--
--       Some of these modules are intended for use only within
--       the flow engine runtime context, and others may be
--       called from within any context, if so indicated.
--
--    SECURITY
--       Executable via public synonym and grant
--
--    NOTES
--
--    EXAMPLE
--
--
function get_next_session_id
    --
    -- Context: HTML DB runtime
    -- Purpose: Generate next session id from sequence generator
    --
    return number;

function get_security_group_id
    --
    -- Context: HTML DB runtime
    -- Purpose: Return the wwv_flow_security.g_security_group_id global
    --
    return number;

function application_page_item_exists(
    --
    -- Context: HTML DB runtime
    -- Purpose: Return boolean as to existence within the current
    --          flow page's metadata of a named page-level item.
    --
    p_item_name in varchar2)
    return boolean;

function current_page_is_public
    --
    -- Context: HTML DB runtime
    -- Purpose: Return boolean corresponding to current flow
    --          page attribute PAGE_IS_PUBLIC_Y_N setting.
    --
    return boolean;

function session_id_exists
    --
    -- Context: HTML DB runtime
    -- Purpose: Return boolean if wwv_flow.g_instance is set/not set
    --
    return boolean;

function get_user
    --
    -- Context: HTML DB runtime
    -- Purpose: Return wwv_flow.g_user global
    --
    return varchar2;

function get_session_id
    --
    -- Context: HTML DB runtime
    -- Purpose: Return wwv_flow.g_instance global
    --
    return number;

procedure set_user(
    --
    -- Context: HTML DB runtime
    -- Purpose: Set wwv_flow.g_user global
    --
    p_user in varchar2);

procedure set_session_id(
    --
    -- Context: HTML DB runtime
    -- Purpose: Set wwv_flow.g_instance global
    --
    p_session_id in number);

procedure set_session_id_to_next_value
    --
    -- Context: HTML DB runtime
    -- Purpose: Set wwv_flow.g_instance to next
    --          session id from sequence generator.
    --
    ;

procedure define_user_session(
    --
    -- Context: HTML DB runtime
    -- Purpose: Combine the functions of set_user and
    --          set_session_id to provide a concise API call
    --
    p_user in varchar2,
    p_session_id in number)
    ;

function get_username
    --
    -- Context: htmldb application runtime
    -- Purpose: get username from wwv_flow_session$ for current session
    --
    return varchar2
    ;

function get_session_id_from_cookie
    --
    -- Context: htmldb application runtime with cookie in cgi environment
    -- Purpose: get session id of current user based on cookie
    --
    return number
    ;

function is_session_valid
    --
    -- Context: htmldb application runtime
    -- Purpose: determine if session exists and is valid
    --
    return boolean
    ;

procedure logout(
    --
    -- Context: Use as redirect URL from navbar logout item and similar places
    -- Purpose: determine cookie for given flow, unset cooie, then redirect to url
    --          if p_next_url is passed in, else redirect to flow page using
    --          p_next_flow_page_sess
    --
    p_this_app            in varchar2 default null,
    p_next_app_page_sess  in varchar2 default null, -- assumed to be FLOW:PAGE:SESSION to redirect to
    p_next_url            in varchar2 default null) -- assumed to be full url to redirect to
    ;

procedure logout_then_go_to_page(
    --
    -- Context: Use as redirect URL from navbar logout item and similar places
    -- Purpose: wrapper for logout procedure when redirect to flow page is needed.
    --          Makes it easier to cram all the logout arguments into one for use in URLs
    --
    p_args in varchar2 default null) -- assumed to be THISFLOW:FLOW:PAGE:SESSION to redirect to
    ;

procedure remove_session
    ;

procedure logout_then_go_to_url(
    --
    -- Context: Use as redirect URL from navbar logout item and similar places
    -- Purpose: wrapper for logout procedure when redirect to free form url is needed.
    --          Makes it easier to cram all the logout arguments into one for use in URLs
    --
    p_args in varchar2 default null) -- assumed to be THISFLOW:URL to redirect to
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
    p_app_page          in varchar2 default null,
    p_entry_point       in varchar2 default null,
    p_preserve_case     in boolean default false)
    ;

procedure post_login(
    --
    -- Context: any
    -- Purpose: Do after login page submit processing
    --          starting at the post-authentication step.
    --
    p_uname             in varchar2 default null,
    p_session_id        in varchar2 default null,
    p_app_page          in varchar2 default null,
    p_preserve_case     in boolean default false)
    ;

procedure get_cookie_props(
    --
    -- Context: any
    -- Purpose: get cookie properties for specified flow
    --
    p_app_id         in number,
    p_cookie_name   out varchar2,
    p_cookie_path   out varchar2,
    p_cookie_domain out varchar2,
    p_secure        out boolean)
    ;

function ldap_dnprep(
    p_username in varchar2)
    return varchar2
   ;

function ldap_authenticate(
    --
    -- Context: any
    -- Purpose: verify credentials using ldap directory
    --
    p_username           in varchar2,
    p_password           in varchar2,
    p_ldap_host          in varchar2,
    p_ldap_port          in number,
    p_use_ssl            in varchar2 default 'N',
    p_use_exact_dn       in varchar2 default 'Y',
    p_ldap_string        in varchar2,
    p_search_filter      in varchar2 default null,
    p_ldap_edit_function in varchar2,
    p_owner              in varchar2)
    return boolean
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

end htmldb_custom_auth;
/
show errors
