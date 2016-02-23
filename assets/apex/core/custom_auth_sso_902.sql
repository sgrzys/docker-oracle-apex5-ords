set define '^' verify off
prompt ...wwv_flow_custom_auth_sso
create or replace package wwv_flow_custom_auth_sso as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001-2014. All Rights Reserved.
--
--     NAME
--       custom_auth_sso_902.sql
--
--     DESCRIPTION
--
--       Conditionally compiled on installation only if wwsec_ packages
--       used by 9iAS Single Signon are installed in flows schema.
--
--     SECURITY
--       Executable via public synonym and grant
--
--     RUNTIME DEPLOYMENT: YES
--
--     MODIFIED  (MM/DD/YYYY)
--     sspadafo   11/27/2002 - Created
--     sspadafo   11/28/2002 - Login server support enhancements
--     sspadafo   11/29/2002 - Login server support enhancements
--     sspadafo   08/07/2003 - Replaced partner app name Marvel with HTML_DB (Bug 3089490)
--     sspadafo   03/08/2006 - Created file as 902 version of custom_auth_sso.sql (Bug 4667487)
--     sspadafo   03/08/2006 - Added urlc_vals procedure (Bug 4667487)
--     cneumuel   11/04/2014 - Added get_version_identifier (feature #1153)
--     cneumuel   06/09/2015 - Removed obsolete globals (feature #1798)
--
--------------------------------------------------------------------------------

g_username varchar2(4000);

--==============================================================================
function get_version_identifier
    return varchar2;

--==============================================================================
procedure portal_sso_redirect(
    p_partner_app_name in varchar2);

--==============================================================================
procedure portal_sso_redirect;

--==============================================================================
procedure process_success(
    urlc in varchar2,
    p_partner_app_name in varchar2);

--==============================================================================
procedure process_success(
    urlc in varchar2);

--==============================================================================
procedure urlc_vals(
    p_ssousername       in out varchar2,
    p_ipadd             in out varchar2,
    p_ssotimeremaining  in out varchar2,
    p_sitetimestamp     in out varchar2,
    p_urlrequested      in out varchar2,
    p_subscriberid      in out varchar2,
    p_newsitekey        in out varchar2,
    p_pouserdn          in out varchar2,
    p_pouserguid        in out varchar2,
    p_ponlslanguage     in out varchar2,
    p_ponlslocale       in out varchar2,
    p_posubscribername  in out varchar2,
    p_posubscriberdn    in out varchar2,
    p_posubscriberguid  in out varchar2,
    p_polstime          in out varchar2,
    p_polstz            in out varchar2);

end wwv_flow_custom_auth_sso;
/
show errors
