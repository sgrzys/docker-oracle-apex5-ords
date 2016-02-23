set define '^' verify off
prompt ...wwv_flow_authorization
create or replace package wwv_flow_authorization as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011. All Rights Reserved.
--
--    NAME
--      wwv_flow_authorization.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native authorization types.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    02/03/2011 - Created
--    pawolf      10/25/2011 - Added Cloud IDM (bug# 13101596)
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    pawolf      04/02/2012 - Added p_plugin to APIs
--    cneumuel    04/10/2012 - Added g_authorize_public_pages (bug #13940433)
--    cneumuel    06/14/2013 - session data model changes (feature #1149)
--    cneumuel    07/04/2013 - Added enable_dynamic_groups, get_dynamic_groups, IS_IN_GROUP authorization (feature #1233)
--    cneumuel    07/08/2013 - in reset_cache: added p_after_login to initialize dynamic groups (feature #1233)
--    cneumuel    07/12/2013 - Added compute_dynamic_groups and removed p_after_login from reset_cache (feature #1233)
--
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Native authorizations
--
c_exists                constant varchar2(40) := 'NATIVE_EXISTS';
c_not_exists            constant varchar2(40) := 'NATIVE_NOT_EXISTS';
c_function_body         constant varchar2(40) := 'NATIVE_FUNCTION_BODY';
c_item_equals_value     constant varchar2(40) := 'NATIVE_ITEM_EQUALS_VALUE';
c_item_not_equals_value constant varchar2(40) := 'NATIVE_ITEM_NOT_EQUALS_VALUE';
c_item_is_null          constant varchar2(40) := 'NATIVE_ITEM_IS_NULL';
c_item_is_not_null      constant varchar2(40) := 'NATIVE_ITEM_IS_NOT_NULL';
c_pref_equals_value     constant varchar2(40) := 'NATIVE_PREF_EQUALS_VALUE';
c_pref_not_equals_value constant varchar2(40) := 'NATIVE_PREF_NOT_EQUALS_VALUE';
c_cloud_idm             constant varchar2(40) := 'NATIVE_CLOUD_IDM';
c_is_in_group           constant varchar2(40) := 'NATIVE_IS_IN_GROUP';
c_is_not_in_group       constant varchar2(40) := 'NATIVE_IS_NOT_IN_GROUP';
--
--------------------------------------------------------------------------------
-- globals for this request
g_authorize_public_pages boolean; -- wwv_flow.authorize_public_pages_yn
--
--==============================================================================
-- Checks native authorization
--==============================================================================
function check_native_authorization (
    p_type          in varchar2,
    p_plugin        in wwv_flow_plugin_api.t_plugin,
    p_authorization in wwv_flow_plugin_api.t_authorization )
    return wwv_flow_plugin_api.t_authorization_exec_result;
--
--==============================================================================
-- rebuild wwv_flow_session_groups$
--==============================================================================
procedure compute_dynamic_groups;
--
--==============================================================================
-- Resets authorization for the session.
-- If p_save_state is true then the state in wwv_flow_session_authz$ will be cleared.
--==============================================================================
procedure reset_cache (
    p_save_state  in boolean );
--
--==============================================================================
-- initialize package with session info from wwv_flow_session$
--==============================================================================
procedure init_cache;
--
--==============================================================================
-- return whether user has privilege given a security scheme.
--
-- p_authorization:
--   determines kind of authorization. can be prefixed by '!' for negation of
--   authorization result. one of
--   - NULL or %null%: always true, negation not possible
--   - MUST_NOT_BE_PUBLIC_USER: true if not in (nobody, PUBLIC_USER,
--     HTMLDB_PUBLIC_USER, ANONYMOUS, APEX_PUBLIC_USER)
--   - security scheme ID: uses authorization result of plugin
--   - otherwise: invalid, show error page
-- p_component:
--   if in (FLOW, PAGE) and authorization fails: show error page
--==============================================================================
function is_authorized (
    p_authorization in varchar2,
    p_component     in varchar2 default null )
    return boolean;
--
--==============================================================================
-- return whether the given authorization is passed
--==============================================================================
function is_authorized_by_name (
    p_authorization_name in varchar2 )
    return boolean;
--
--==============================================================================
-- Internal builder authorization, helper for Developer Authorization plugin.
--==============================================================================
function is_authorized_developer (
    p_developer_authorization in varchar2 )
    return boolean;
--
--==============================================================================
-- Enable groups in the current session.
--
-- ARGUMENTS
-- * p_group_names:        table of group names
--==============================================================================
procedure enable_dynamic_groups (
    p_group_names in wwv_flow_t_varchar2 );
--
--==============================================================================
-- Return enabled dynamic groups for the current session
--==============================================================================
function get_dynamic_groups
    return wwv_flow_t_varchar2;
--
end wwv_flow_authorization;
/
show errors
