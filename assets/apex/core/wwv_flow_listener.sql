set define '^' verify off
prompt ...wwv_flow_listener
create or replace package wwv_flow_listener as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_listener.sql

--    DESCRIPTION
--      This package provides utility functions for the APEX listener
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    09/13/2011 - Created
--    cneumuel    09/15/2011 - In authenticate, get_workspace_user_groups: changed p_workspace to p_workspace_id
--    cneumuel    09/16/2011 - Added get_workspace_user_type
--    hfarrell    09/21/2011 - Added get_session_username - need to check with Patrick and Christian
--    hfarrell    09/26/2011 - Added install_seed_data for RESTful Services
--    hfarrell    03/08/2012 - Added is_valid_template (bug 13815223)
--    hfarrell    07/11/2012 - Added is_required_version to check the version of APEX Listener installed, which must be 2.0.0 or higher
--    hfarrell    08/02/2012 - Added procedure reset_sample_data to support resetting of oracle.example.hr sample (as requested by Mike and Kris via email)
--    hfarrell    03/06/2013 - Added SQL Developer-required functions for obtaining user group information for RESTful Services:get_workspace_user_groups,get_workspace_user_group_name and get_workspace_user_group_id.
--                             Changed p_workspace_id from varchar2 to number in get_workspace_user_groups, authenticate,get_workspace_user_type  (bug #16450494)
--    hfarrell    03/13/2013 - Extracted client and group creation logic from install_seed_data to install_prereq_data, to allow for separate execution on non-Cloud instance (bug #16483083)
--    cneumuel    04/26/2013 - Renamed vc4000array to wwv_flow_t_varchar2
--    vuvarov     01/09/2014 - Added install_friendly_url_service (feature #1267)
--    cneumuel    11/20/2014 - Added get_workspace_schemas (bug #16535613)
--    hfarrell    08/26/2015 - Added get_module_version, and get_privilege_version (bug #21682162)
--
--==============================================================================
-- return if p_username is a valid user in p_workspace_id and can authenticate
-- with p_password
--==============================================================================
function authenticate (
    p_workspace_id in number,
    p_username     in varchar2,
    p_password     in varchar2 )
    return boolean;

--==============================================================================
-- return all workspace schema names
--==============================================================================
function get_workspace_schemas (
    p_workspace_id in number)
    return wwv_flow_t_varchar2;

--==============================================================================
-- return groups the workspace user is in
--==============================================================================
function get_workspace_user_groups (
    p_workspace_id in number,
    p_username     in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
-- return groups in the workspace
--==============================================================================
function get_workspace_user_groups (
    p_workspace_id in number)
    return wwv_flow_t_varchar2;

--==============================================================================
-- return group name in a given workspace for a given group ID
--==============================================================================
function get_workspace_user_group_name (
         p_workspace_id  in number,
         p_user_group_id in number)
         return varchar2;

--==============================================================================
-- return group ID in a given workspace for a given group name
--==============================================================================
function get_workspace_user_group_id (
         p_workspace_id  in number,
         p_group_name    in varchar2 )
         return number;

--==============================================================================
-- return if the user is Administrator, Developer or User in the given workspace
--==============================================================================
function get_workspace_user_type (
    p_workspace_id in number,
    p_username     in varchar2 )
    return varchar2;

--==============================================================================
-- return username of the APEX session if it is a valid session
--==============================================================================
function get_session_username (
    p_application_id in number,
    p_session_id     in number )
    return varchar2;

--==============================================================================
-- return if p_template is a valid template containing no length parameters
-- greater than 100 characters
--==============================================================================
function is_valid_template (
    p_template       in varchar2)
    return boolean;

--==============================================================================
-- return if p_module_id is a valid module in ORDS cached version
--==============================================================================
function get_module_version (
    p_workspace_id   in number,
    p_module_id      in number)
    return number;

--==============================================================================
-- return if p_privilege_id is a valid privilege in ORDS cached version
--==============================================================================
function get_privilege_version (
    p_workspace_id   in number,
    p_privilege_id   in number)
    return number;

--==============================================================================
-- return if p_template is a valid template containing no length parameters
-- greater than 100 characters
--==============================================================================
function is_required_version
    return boolean;

procedure install_prereq_data;

procedure install_seed_data;

procedure reset_sample_data;

--==============================================================================
-- Installs "Friendly URL service" RESTful module into current SGID
--==============================================================================
procedure install_friendly_url_service;

end wwv_flow_listener;
/
show errors
