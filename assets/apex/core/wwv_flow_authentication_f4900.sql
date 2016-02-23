set define '^' verify off
prompt ...wwv_flow_authentication_f4900.sql
create or replace package wwv_flow_authentication_f4900 as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_authentication_f4900.sql
--
--    DESCRIPTION
--      Authentication scheme for Websheets DB application.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    06/21/2013 - Created (moved from wwv_flow_f4000_plugins)
--
--------------------------------------------------------------------------------
--
--==============================================================================
-- Check if session can be used.
--==============================================================================
function session_sentry (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;
--
--==============================================================================
-- Redirect to login if invalid session
--==============================================================================
function invalid_session (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_inval_result;
--
--==============================================================================
-- Callback for CLOUD_IDM/OAM authentication.
--==============================================================================
function callback (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_ajax_result;
--
--==============================================================================
-- Compute logout url
--==============================================================================
function post_logout (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_logout_result;

end wwv_flow_authentication_f4900;
/
show err

