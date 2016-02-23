set define '^'
set verify off
prompt ...wwv_flow_dynamic_action_native


create or replace package wwv_flow_dynamic_action_native
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_dynamic_action_native.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native dynamic actions.
--
--    MODIFIED   (MM/DD/YYYY)
--    arayner     12/08/2009 - Created
--    arayner     12/08/2009 - Added render_show and render_hide procedures
--    arayner     12/08/2009 - Added other native types
--    arayner     12/09/2009 - Added render_add_class, render_remove_class and render_set_css procedures
--    arayner     12/09/2009 - Removed render_hide_and_clear and render_disable_and_clear, merged into hide and disable
--    arayner     12/09/2009 - Removed render_hide_item_row and render_show_item_row, merged into hide and show
--    arayner     12/11/2009 - Added ajax_set to support setting values from a sql statement
--    arayner     12/11/2009 - Renamed render_set and ajax_set to be render_set_value and ajax_set_value
--    pawolf      12/16/2009 - Added set focus and submit page
--    pawolf      02/05/2010 - Changed to new plug-in interface
--    pawolf      02/09/2010 - Added render_refresh
--    arayner     04/12/2010 - Added render_execute_plsql_code
--    arayner     04/13/2010 - Added ajax_execute_plsql_code
--    arayner     04/17/2010 - Added render_cancel_event
--    pawolf      04/18/2010 - Added dynamic actions confirm, alert and clear
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    pawolf      04/02/2012 - Created dispatcher functins
--    pawolf      04/04/2012 - Renamed wwv_flow_native_dynamic_action to wwv_flow_dynamic_action_native
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin to run the render function.
--==============================================================================
function render (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin to run the ajax function.
--==============================================================================
function ajax (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action )
    return wwv_flow_plugin_api.t_dynamic_action_ajax_result;
--
end wwv_flow_dynamic_action_native;
/
show errors
