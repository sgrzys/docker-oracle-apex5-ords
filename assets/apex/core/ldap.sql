set define '^' verify off
prompt ...wwv_flow_ldap
create or replace package wwv_flow_ldap as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_ldap.sql
--
--    DESCRIPTION
--      Flow LDAP package
--
--      This package contains functions and procedures used to
--      extract data from an LDAP server, such as OID.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--      tmuth    10/22/2002 - Created
--      jkallman 10/23/2002 - Added get_all_user_attributes
--      jkallman 02/19/2008 - Added get_groups, get_groups_string, move globals to body
--      jstraub  04/08/2010 - Added p_use_ssl to all functions and procedures
--      cneumuel 02/13/2012 - In get_groups,get_groups_string: anonymized parameter comments (bug #13690876)
--      cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
--      cneumuel 08/16/2012 - Code cleanup, added p_nested_membership, support for "uid=xxx" RDNs (bug #13605304)
--      cneumuel 10/28/2013 - Added search (feature #3)
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Return if the user credentials can be used to perform a SIMPLE_BIND_S
--
-- ARGUMENTS
-- * p_username        login name of the user
-- * p_password        password for p_username
-- * p_search_base     LDAP search base, e.g. ou=employees,dc=example,dc=com
-- * p_host            LDAP server host name
-- * p_port            LDAP server port name
-- * p_use_ssl         if Y: use SSL in bind to LDAP server
--                     if A: use SSL with one way authentication (requires
--                           certificate in wallet)
--                     if N: do not use SSL
--==============================================================================
function authenticate(
    p_username     in varchar2 default null,
    p_password     in varchar2 default null,
    p_search_base  in varchar2,
    p_host         in varchar2,
    p_port         in varchar2 default 389,
    p_use_ssl      in varchar2 default 'N')
    return boolean;

--##############################################################################
--#
--# AUTHORIZATION (GROUP MEMBERSHIP)
--#
--##############################################################################

--==============================================================================
function is_member(
    p_username     in varchar2,
    p_pass         in varchar2 default null,
    p_auth_base    in varchar2,
    p_host         in varchar2,
    p_port         in varchar2 default 389,
    p_use_ssl      in varchar2 default 'N',
    p_group        in varchar2,
    p_group_base   in varchar2,
    p_nested_membership in boolean default false )
    return boolean;

--==============================================================================
function member_of(
    p_username          in varchar2 default null,
    p_pass              in varchar2 default null,
    p_auth_base         in varchar2,
    p_host              in varchar2,
    p_port              in varchar2 default 389,
    p_use_ssl           in varchar2 default 'N',
    p_nested_membership in boolean default false )
    return wwv_flow_global.vc_arr2;

--==============================================================================
function member_of2(
    p_username          in varchar2 default null,
    p_pass              in varchar2 default null,
    p_auth_base         in varchar2,
    p_host              in varchar2,
    p_port              in varchar2 default 389,
    p_use_ssl           in varchar2 default 'N',
    p_nested_membership in boolean default false )
    return varchar2;


--==============================================================================
function get_groups(
    p_ldap_host             in  varchar2,
    p_ldap_port             in  number  default 389,
    p_use_ssl               in varchar2 default 'N',
    p_username              in  varchar2,
    p_service_account       in  varchar2 default null,
    p_service_account_pwd   in  varchar2 default null,
    p_search_base           in  varchar2 default null,
    p_scope                 in  binary_integer  default sys.dbms_ldap.scope_subtree,
    p_group_attribute       in  varchar2 default 'cn',
    p_nested_membership in boolean default false )
return sys.dbms_ldap_utl.string_collection;

--==============================================================================
function get_groups_string(
    p_ldap_host             in  varchar2,
    p_ldap_port             in  number  default 389,
    p_use_ssl               in varchar2 default 'N',
    p_username              in  varchar2,
    p_service_account       in  varchar2 default null,
    p_service_account_pwd   in  varchar2 default null,
    p_search_base           in  varchar2 default null,
    p_scope                 in  binary_integer  default sys.dbms_ldap.scope_subtree,
    p_group_attribute       in  varchar2 default 'cn',
    p_delimiter             in  varchar2 default ':',
    p_nested_membership     in boolean default false )
return varchar2;

--##############################################################################
--#
--# USER ATTRIBUTES
--#
--##############################################################################

--==============================================================================
procedure get_user_attributes(
    p_username          in  varchar2 default null,
    p_pass              in  varchar2 default null,
    p_auth_base         in  varchar2,
    p_host              in  varchar2,
    p_port              in  varchar2 default 389,
    p_use_ssl           in varchar2 default 'N',
    p_attributes        in  wwv_flow_global.vc_arr2,
    p_attribute_values  out wwv_flow_global.vc_arr2);

--==============================================================================
procedure get_all_user_attributes(
    p_username          in  varchar2 default null,
    p_pass              in  varchar2 default null,
    p_auth_base         in  varchar2 default null,
    p_host              in  varchar2,
    p_port              in  varchar2 default 389,
    p_use_ssl           in varchar2 default 'N',
    p_attributes        out wwv_flow_global.vc_arr2,
    p_attribute_values  out wwv_flow_global.vc_arr2);

--##############################################################################
--#
--# SEARCH
--#
--##############################################################################

--==============================================================================
-- search the ldap repository. the result is an object table of (dn, name, val)
-- that can for example be used in table() queries, see below.
--
-- ATTRIBUTES
-- * p_username          username to connect as (can be null for anonymous binds)
-- * p_pass              password of p_username (can be null for anonymous binds)
-- * p_auth_base         authentication base dn for p_username (can be null for anonymous binds)
-- * p_host              ldap server hostname
-- * p_port              ldap server port (default 389)
-- * p_use_ssl           'Y' if a SSL connection is required (default N)
-- * p_search_base       dn base for the search
-- * p_search_filter     ldap search filter expression
-- * p_scope             search scope (default descends into subtrees)
-- * p_timeout_sec       timeout for the search (default 3 seconds)
-- * p_attribute_names   comma separated list of return attribute names
--
-- EXAMPLE 1
--   select val group_dns
--     from table(apex_ldap.search (
--                    p_host            => 'ldap.example.com',
--                    p_search_base     => 'dc=example,dc=com',
--                    p_search_filter   => 'uid='||apex_escape.ldap_search_filter(:APP_USER),
--                    p_attribute_names => 'memberof' ));
--
-- EXAMPLE 2
--   select dn, mail, dispname, phone
--     from ( select dn, name, val
--              from table(apex_ldap.search (
--                             p_host            => 'ldap.example.com',
--                             p_search_base     => 'dc=example,dc=com',
--                             p_search_filter   => '&(objectClass=person)(ou=Test)',
--                             p_attribute_names => 'mail,displayname,telephonenumber' )))
--    pivot (min(val) for name in ( 'mail'            mail,
--                                  'displayname'     dispname,
--                                  'telephonenumber' phone ))
--==============================================================================
function search (
    p_username          in varchar2 default null,
    p_pass              in varchar2 default null,
    p_auth_base         in varchar2 default null,
    p_host              in varchar2,
    p_port              in number   default 389,
    p_use_ssl           in varchar2 default 'N',
    p_search_base       in varchar2,
    p_search_filter     in varchar2,
    p_scope             in binary_integer default sys.dbms_ldap.scope_subtree,
    p_timeout_sec       in binary_integer default 3,
    p_attribute_names   in varchar2 )
    return wwv_flow_t_ldap_attributes pipelined;

end wwv_flow_ldap;
/
show errors

