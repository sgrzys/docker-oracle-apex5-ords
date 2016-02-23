set define '^'
set verify off

prompt ...wwv_flow_generic_login

Rem NAME
Rem      generic_login.sql
Rem
Rem SCRIPT ARGUMENTS
Rem      none
Rem
Rem RUNTIME DEPLOYMENT: YES
Rem
Rem MODIFIED      (MM/DD/YYYY)
Rem      mhichwa   04/04/2001 - Created
Rem      mhichwa   04/06/2001 - aded logout text and link and link text 
Rem      mhichwa   06/22/2001 - changed logout to default to 4750 for login
Rem      mhichwa   06/26/2001 - changed login to login2 to avoid issues with overloading on urls
Rem      jstraub   08/20/2001 - Added reset_pw procedure
Rem      jstraub   09/14/2001 - Added parameter p_msg to reset_pw procedure
Rem      mhichwa   10/22/2001 - Extended comments
Rem      sspadafo  12/06/2001 - Fixed speling in 'You are now loged out.'

create or replace package wwv_flow_generic
as
--  Copyright (c) Oracle Corporation 2001. All Rights Reserved.
--
--    DESCRIPTION
--      Provides an API to call flow 4100 which performs a cookie based login.
--      This API identifies what the login screen looks like and what URL it
--      goes to when the authentication is successful.  The login function is
--      overloaded.
--
--      This package is for use with oracle platform authenticaion only.
--      If you are a repository for usernames and passwords other then
--      wwv_flow_fnd_user then you should not use this package.
--
--    SECURITY
--      Publicly executable with public syn.
--
--    NOTES
--      p_flow_page    = a valid flow ID and page ID
--      p_company      = a valid company name (not ID) case insensitive
--      p_login_url    = a URL to goto after authentication
--      p_cancel_url   = a URL to goto when the user presses the cancel button
--      p_login_name   = Text displayed in the login dialog
--      
--    EXAMPLE LOGIN PROCEDURE
--      create or replace procedure my_login is
--      begin
--          wwv_flow_generic.login(
--              p_flow_page=>'58:1',
--              p_company=>'Oracle Racing',
--              p_login_name=>'Login',
--              p_cancel_url=>'http://www.oracle.com');
--      end my_login;
--      /
--
--    EXAMPLE LOGIN URL
--      wwv_flow_generic.login?p_flow_page=100:1&p_company=oracle+racing
--      
--    EXAMPLE LOGOUT URL
--      wwv_flow_generic.logout
--
procedure login2(
   --
   --
   --
   p_login_url  in varchar2 default 'login_url_undefined',
   p_company    in varchar2 default 'oracle',
   p_login_name in varchar2 default 'Login',
   p_cancel_url in varchar2 default '')
   ;
procedure login(
   --
   --
   --
   p_flow_page  in varchar2 default '3000:3005',
   p_company    in varchar2 default 'oracle',
   p_login_name in varchar2 default 'Login',
   p_cancel_url in varchar2 default '')
   ;
   
procedure reset_pw(
   --
   --
   --
   p_company    in varchar2 default 'oracle',
   p_flow_page in varchar2 default '4750:7',
   p_msg        in varchar2 default null)
   ;
    
procedure logout (
   --
   --
   --
   p_logout_text   in varchar2 default 'You are now logged out',
   p_link_text     in varchar2 default 'here',
   p_link_template in varchar2 default 'Click #LINK# to login',
   p_login_url     in varchar2 default 'wwv_flow_generic.login?p_flow_page=4750:1&p_company=oracle')
   ;
end;
/
show errors

grant execute on wwv_flow_generic to public
/

