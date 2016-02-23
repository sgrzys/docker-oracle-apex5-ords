set define '^' feedback off
prompt ...wwv_flow_install_wizard
create or replace package wwv_flow_install_wizard as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2006 - 2013. All Rights Reserved.
--
--
--    DESCRIPTION
--      This package provides install engine for application install wizard.
--
--    RUNTIME DEPLOYMENT: YES
--
--    NAME
--      wwv_flow_install_wizard.sql
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    01/17/2006 - Created
--     madelfio 01/26/2006 - Added deinstall, set_sub_strings, install_condition
--     cbcho    01/30/2006 - Added p_flow_id in install_condition, install
--     cbcho    03/31/2006 - Added procedure configuration_options; logic moved from 4000:2103 large PLSQL region, Configuration Options
--     madelfio 05/04/2006 - Added p_flow_id to deinstall procedure to support application-specific deployment logs
--     madelfio 06/22/2006 - Added get_existing_objects, get_missing_privs, get_free_space functions to perform prerequisite checks
--     madelfio 01/11/2007 - Created upgrade procedure
--     cbcho    01/26/2007 - Added create_acl_ddl
--     cneumuel 07/18/2013 - Added run_install_checks, needs_upgrade, exception handling
--     cbcho    01/09/2014 - Added auto_install_sup_obj (feature #1248)
--
--------------------------------------------------------------------------------

--==============================================================================
function install_condition (
    p_flow_id           in number,
    p_condition_type    in varchar2 default null,
    p_condition         in varchar2 default null,
    p_condition2        in varchar2 default null )
    return boolean;

--==============================================================================
-- perform wwv_flow_install_checks for the given application
-- return IDs of checks that failed, separated by ":"
function run_install_checks (
    p_flow_id           in number )
    return varchar2;

--==============================================================================
procedure install (
    p_install_id        in number,
    p_flow_id           in number,
    p_schema            in varchar2 );

--==============================================================================
-- return whether supporting objects should be upgraded, by executing
-- wwv_flow_install.get_version_sql_query
--==============================================================================
function needs_upgrade (
    p_flow_id           in number )
    return boolean;

--==============================================================================
procedure upgrade (
    p_install_id        in number,
    p_flow_id           in number,
    p_schema            in varchar2 );
    
--==============================================================================
procedure deinstall (
    p_install_id        in number,
    p_flow_id           in number,
    p_schema            in varchar2 );
    
--==============================================================================
procedure set_sub_strings (
    p_ss_prompts        in wwv_flow_global.vc_arr2,
    p_ss_values         in wwv_flow_global.vc_arr2,
    p_install_id        in number );
    
--==============================================================================
procedure configuration_options (
    p_flow_id           in number default null );

--==============================================================================
function get_existing_objects(
    p_flow_id           in number)
    return varchar2;
    
--==============================================================================
function get_missing_privs(
    p_flow_id           in number)
    return varchar2;
    
--==============================================================================
function get_free_space(
    p_flow_id           in number)
    return varchar2;

--==============================================================================
procedure create_acl_ddl (
    p_flow_id           in number,
    p_security_group_id in number );

--==============================================================================
procedure auto_install_sup_obj (
    p_flow_id           in number);
end wwv_flow_install_wizard;
/

show errors
