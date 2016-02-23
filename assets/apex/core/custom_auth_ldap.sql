set define '^' verify off
prompt ...wwv_flow_custom_auth_ldap
create or replace package wwv_flow_custom_auth_ldap
as
--  Copyright (c) Oracle Corporation 2001-2002. All Rights Reserved.
--
--     NAME
--       wwv_flow_custom_auth_ldap.sql
--
--     DESCRIPTION
--       API package to expose ldap authentication function
--
--     MODIFIED   (MM/DD/YYYY)
--       sspadafo  11/05/2002 - Created - split from wwv_flow_custom_auth_std
--       jstraub   03/17/2010 - added p_use_ssl to authenticate
--       jstraub   03/22/2010 - Added p_use_exact_dn, p_search_filter to support non-exact dn
--       cneumuel  04/23/2013 - Added get_last_error (bug #15929196)
--
--------------------------------------------------------------------------------

--==============================================================================
-- authenicate against ldap directory
--==============================================================================
function authenticate (
    p_dn                 in varchar2,
    p_search_filter      in varchar2 default null,
    p_password           in varchar2,
    p_ldap_host          in varchar2,
    p_ldap_port          in number,
    p_use_ssl            in varchar2 default 'N',
    p_use_exact_dn       in varchar2 default 'Y')
    return boolean;

--==============================================================================
-- return the last exception that occurred withing authenticate()
--==============================================================================
function get_last_error
    return varchar2;

end wwv_flow_custom_auth_ldap;
/
show errors package wwv_flow_custom_auth_ldap
