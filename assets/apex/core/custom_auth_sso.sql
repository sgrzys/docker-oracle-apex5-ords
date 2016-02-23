set define '^'
set verify off

prompt ...wwv_flow_custom_auth_sso

Rem     NAME
Rem       custom_auth_sso.sql
Rem
Rem     SCRIPT ARGUMENTS
Rem       none
Rem
Rem     RUNTIME DEPLOYMENT: YES
Rem
Rem     MODIFIED  (MM/DD/YYYY)
Rem     sspadafo   11/27/2002 - Created
Rem     sspadafo   11/28/2002 - Login server support enhancements
Rem     sspadafo   11/29/2002 - Login server support enhancements
Rem     sspadafo   08/07/2003 - Replaced partner app name Marvel with HTML_DB (Bug 3089490)




create or replace package wwv_flow_custom_auth_sso
as
--  Copyright (c) Oracle Corporation 2001-2002. All Rights Reserved.
--
--     DESCRIPTION
--
--       Conditionally compiled on installation only if wwsec_ packages
--       used by 9iAS Single Signon are installed in flows schema.
--
--    SECURITY
--       Executable via public synonym and grant
--
--    NOTES
--      
--    EXAMPLE
--
--
    g_listener_token    varchar2(2000);
    g_requested_url     varchar2(2000);
    g_cancel_url        varchar2(2000);
    g_dad_name          varchar2(2000); 
    g_partner_app_name  varchar2(2000) := 'HTML_DB';

procedure portal_sso_redirect(
    p_partner_app_name in varchar2)
    ;
procedure portal_sso_redirect
    ;
    
procedure process_success(
    urlc in varchar2,
    p_partner_app_name in varchar2)
    ; 
    
procedure process_success(
    urlc in varchar2)
    ;
    
end wwv_flow_custom_auth_sso;
/
show errors
