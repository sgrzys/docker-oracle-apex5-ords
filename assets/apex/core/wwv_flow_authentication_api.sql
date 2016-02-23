set define '^' verify off
prompt wwv_flow_authentication_api
create or replace package wwv_flow_authentication_api
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011. All Rights Reserved.
--
--    NAME
--      wwv_flow_authentication_api.sql
--
--    DESCRIPTION
--      This package provides a public API for authentication plugins
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/23/2011 - Created
--    pawolf      05/26/2011 - Made some minor modifications--
--    cneumuel    05/27/2011 - in callback(): added p_app_id
--    cneumuel    06/06/2011 - Added get_login_username_cookie,send_login_username_cookie
--    cneumuel    08/08/2011 - In login(): Added p_uppercase_username (bug #12846747)
--    cneumuel    01/13/2012 - In logout(): added p_ws_app_id (bug #13360987)
--    cneumuel    02/29/2012 - Renamed from wwv_flow_authentication
--    cneumuel    03/26/2012 - Added post_login (bug #13813195)
--    cneumuel    06/05/2012 - Added is_authenticated, is_public_user
--    cneumuel    09/05/2012 - Added documentation
--    cneumuel    02/21/2013 - In post_login: default p_password to null, it is obsolete
--
--------------------------------------------------------------------------------
--
--==============================================================================
c_default_username_cookie constant varchar2(30) := 'LOGIN_USERNAME_COOKIE';

--==============================================================================
-- Authenticate the user in the current session (part of the default login page)
--
-- Login processing has 8 steps:
--   1. run authentication scheme's pre-authentication procedure
--   2. run authentication scheme's authentication function to check the user
--      credentials (p_username, p_password), returning true on success
--   3. if result=true: run post-authentication procedure
--   4. if result=true: save username in session table
--   5. if result=true: set redirect url to deep link
--   6. if result=false: set redirect url to current page, with an error message
--      in the notification_msg parameter
--   7. log authentication result
--   8. redirect
--
-- ARGUMENTS
-- * p_username            user's name
-- * p_password            user's password
-- * p_uppercase_username  if true then p_username is converted to uppercase
--
-- EXAMPLE
--   apex_authentication.login('JOE USER', 'mysecret');
--
-- SEE ALSO
--   post_login
--==============================================================================
procedure login (
    p_username           in varchar2,
    p_password           in varchar2,
    p_uppercase_username in boolean default true );
--
--==============================================================================
-- Authenticate the user in the current session.
--
-- This procedure runs a subset of login(), without steps 1. and 2. It is
-- primarily useful in authentication schemes where user credentials checking
-- is done externally to Apex.
--
-- ARGUMENTS
-- * p_username            user's name
-- * p_password            this parameter is obsolete and should be omitted
-- * p_uppercase_username  if true then p_username is converted to uppercase
--
-- EXAMPLE
--   apex_authentication.post_login('JOE USER');
--
-- SEE ALSO
--   login
--==============================================================================
procedure post_login (
    p_username           in varchar2,
    p_password           in varchar2 default null,
    p_uppercase_username in boolean  default true );
--
--==============================================================================
-- Send a cookie with the username (part of the default login page)
--
-- ARGUMENTS
-- * p_username            user's name
-- * p_cookie_name         the cookie name which stores p_username in the
--                         browser
--
-- EXAMPLE
--   apex_authentication.send_login_username_cookie('JOE USER');
--
-- SEE ALSO
--   get_login_username_cookie
--==============================================================================
procedure send_login_username_cookie (
    p_username    in varchar2,
    p_cookie_name in varchar2 default c_default_username_cookie );
--
--==============================================================================
-- Read the cookie with the username (part of the default login page)
--
-- ARGUMENTS
-- * p_cookie_name         the cookie name which stores the username in the
--                         browser
--
-- EXAMPLE
--   :P101_USERNAME := apex_authentication.get_login_username_cookie;
--
-- SEE ALSO
--   send_login_username_cookie
--==============================================================================
function get_login_username_cookie (
    p_cookie_name in varchar2 default c_default_username_cookie )
    return varchar2;
--
--==============================================================================
-- Close the session and redirect to the application's home page.
--
-- To be called directly from the browser.
--
-- ARGUMENTS
-- * p_session_id          the Application Express session which should be
--                         closed.
-- * p_app_id              the database application id
-- * p_ws_app_id           the websheet application id
--
-- EXAMPLE
--   apex_authentication.logout(:SESSION, :APP_ID);
--==============================================================================
procedure logout (
    p_session_id in number,
    p_app_id     in number,
    p_ws_app_id  in number default null );

--==============================================================================
-- Landing resource for external login pages.
--
-- To be called directly from the browser.
--
-- ARGUMENTS
-- * p_session_id          the Application Express session
-- * p_app_id              the database application id
-- * p_ajax_identifier     the system-generated AJAX identifier (see
--                         apex_plugin.get_ajax_identifier)
-- * p_x01-p_x10           optional parameters that the external login can pass
--                         to the authentication plugin
--
-- EXAMPLE
--   --
--   -- we redirect to an external login page and pass the callback into
--   -- Application Express, which the external login redirects to after
--   -- successful authentication.
--   --
--   declare
--     l_callback varchar2(4000) := apex_application.get_callback_url;
--   begin
--     sys.owa_util.redirect_url(
--         'https://single-signon.example.com/my_custom_sso.login?p_on_success='||
--         sys.utl_url.escape (
--             url                   => l_callback,
--             escape_reserved_chars => true );
--     apex_application.stop_apex_engine;
--   end;
--   --
--   -- an example external login page could for example save user data in
--   -- a shared table and call back with a handle to the data
--   --
--   create or replace package body my_custom_sso as
--     procedure login (
--         p_on_success in varchar2 )
--     is
--       l_login_id varchar2(32);
--     begin
--       l_login_id := rawtohex(sys.dbms_crypto.random(32));
--       insert into login_data(id, username) values (l_login_id, 'JOE USER');
--       sys.owa_util.redirect_url (
--           p_on_success||'&p_x01='||l_login_id );
--     end;
--   end my_custom_sso;
--   --
--   -- in Application Express, the callback will activate the authentication
--   -- plugin's ajax code. it can take the value of x01 and fetch the actual
--   -- user data from the shared table.
--   --
--
-- SEE ALSO
--   get_callback_url
--==============================================================================
procedure callback (
    p_session_id      in number,
    p_app_id          in number,
    p_ajax_identifier in varchar2,
    p_x01             in varchar2 default null,
    p_x02             in varchar2 default null,
    p_x03             in varchar2 default null,
    p_x04             in varchar2 default null,
    p_x05             in varchar2 default null,
    p_x06             in varchar2 default null,
    p_x07             in varchar2 default null,
    p_x08             in varchar2 default null,
    p_x09             in varchar2 default null,
    p_x10             in varchar2 default null );

--==============================================================================
-- Plugin helper function to return a URL that can be used as a landing
-- request for external login pages.
--
-- When the browser sends the request, it triggers the authentication plugin
-- ajax callback, which can be used to log the user in.
--
-- ARGUMENTS
-- * p_x01-p_x10           optional parameters that the external login can pass
--                         to the authentication plugin
--
-- SEE ALSO
--   callback
--==============================================================================
function get_callback_url (
    p_x01 in varchar2 default null,
    p_x02 in varchar2 default null,
    p_x03 in varchar2 default null,
    p_x04 in varchar2 default null,
    p_x05 in varchar2 default null,
    p_x06 in varchar2 default null,
    p_x07 in varchar2 default null,
    p_x08 in varchar2 default null,
    p_x09 in varchar2 default null,
    p_x10 in varchar2 default null )
    return varchar2;

--==============================================================================
-- Check if the user is authenticated in the session
--
-- Returns TRUE if the user is already logged on or FALSE if the user of the
-- current session is not yet authenticated
--
-- EXAMPLE
--   if apex_authentication.is_authenticated then
--     sys.htp.p(apex_escape.html(:APP_USER)||', you are known to the system');
--   else
--     sys.htp.p('Please sign in');
--   end if;
--
-- SEE ALSO
--   is_public_user
--==============================================================================
function is_authenticated
    return boolean;

--==============================================================================
-- Check if the user is NOT authenticated in the session
--
-- Returns FALSE if the user is already logged on or TRUE if the user of the
-- current session is not yet authenticated
--
-- EXAMPLE
--   if apex_authentication.is_public_user then
--     sys.htp.p('Please sign in');
--   else
--     sys.htp.p(apex_escape.html(:APP_USER)||', you are known to the system');
--   end if;
--
-- SEE ALSO
--   is_authenticated
--==============================================================================
function is_public_user
    return boolean;

end wwv_flow_authentication_api;
/
show errors
