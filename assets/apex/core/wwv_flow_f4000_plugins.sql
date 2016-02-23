set define '^' verify off
prompt ...wwv_flow_f4000_plugins
create or replace package wwv_flow_f4000_plugins as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_f4000_plugins.sql
--
--    DESCRIPTION
--      This package contains the code for all APEX Builder plug-ins.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      10/01/2009 - Created
--    pawolf      11/03/2009 - Replaced apex_plugin references with wwv_flow_plugin
--    pawolf      12/29/2009 - Modified calling interface for validations
--    pawolf      02/05/2010 - Changed to new plug-in interface
--    pawolf      04/08/2010 - Added hierarchical_checkbox
--    pawolf      04/15/2010 - Added advanced autocomplete
--    pawolf      12/20/2010 - Added render_plugin_attribute
--    pawolf      12/22/2010 - Added popup LOV support for plug-in attributes of type page number (feature# 527)
--    cneumuel    05/06/2011 - Added CLOB textarea plugin
--    cneumuel    05/26/2011 - Added internal authentication (feature #581)
--    cneumuel    06/03/2011 - Moved get_clob_textarea_value to wwv_flow_utilities because it needs to exist in a runtime-only environment
--    cneumuel    06/08/2011 - Added internal_ws_session_sentry,internal_ws_invalid_session for plugin-based 4900 authentication.
--    cneumuel    06/30/2011 - Added internal_4155_session_sentry
--    cneumuel    06/30/2011 - Added internal_post_logout to fix broken sso logout
--    cneumuel    10/21/2011 - Added internal_session_callback (bug #13101596)
--    cneumuel    11/29/2011 - CLOUD_IDM authentication for websheets (bug #13360987)
--    cneumuel    01/13/2012 - Added internal_ws_post_logout (bug #13360987)
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    cneumuel    03/28/2012 - Added internal_authenticate (bug #13713222)
--    hfarrell    04/12/2012 - Added render_html_chart (feature #856) - NOTE: this may not be required, to discuss with Patrick
--    hfarrell    04/13/2012 - Removed render_html_chart and moved it to new package wwv_flow_legacy_plugins
--    pawolf      07/06/2012 - Added render_ui_component_selectlist
--    vuvarov     07/10/2012 - Replaced apex_plugin references with wwv_flow_plugin_api
--    pawolf      01/24/2013 - Added render_code_area
--    pawolf      01/30/2013 - Continued working on code_area plugin
--    pawolf      04/26/2013 - Added execute_download_as_zip
--    cneumuel    05/17/2013 - moved internal_4155_session_sentry to wwv_flow_authentication_f4155.session_sentry (bug #16827691).
--    cneumuel    06/21/2013 - moved internal_ws_% authentication plugin to wwv_flow_authentication_f4900
--                           - moved internal_% authentication plugin to wwv_flow_authentication_dev
--    jsnyders    08/05/2013 - Added splitter plugin functions
--    pawolf      10/17/2013 - Added wizard selection plug-in
--    pawolf      11/15/2013 - Exposed emit_code_complete_list to public
--    cbcho       01/24/2014 - Added render_clob_code_editor, ajax_clob_code_editor (feature #1344)
--    msewtz      03/20/2014 - Added template options checkbox plug-in
--    arayner     03/26/2014 - Added render_data_grid and ajax_data_grid callouts (feature #577)
--    cneumuel    07/18/2014 - Added render_internal_page_popuplov
--    arayner     09/15/2014 - Added render_add_check_all_checkbox
--
--------------------------------------------------------------------------------

--******************************************************************************
-- REGION PLUG-INs
--******************************************************************************

--==============================================================================
-- Renders the anchor links region on APEX Builder property page.
--==============================================================================
function render_anchors (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Renders a "Subscriptions" region to displays if there are subscriptions.
--==============================================================================
function render_subscriptions (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Renders the splitter region plugin
--==============================================================================
function render_splitter (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Handles persisting splitter state changes as a user preference
--==============================================================================
function ajax_splitter (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_region_ajax_result;
--******************************************************************************
-- DYNAMIC ACTION PLUG-INs
--******************************************************************************

--==============================================================================
-- Renders the "Hide Required" dynamic action.
--==============================================================================
function render_hide_required (
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;
--
--==============================================================================
-- Renders the "Show Required" dynamic action.
--==============================================================================
function render_show_required (
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;

--******************************************************************************
-- ITEM TYPE PLUG-INs
--******************************************************************************

--==============================================================================
-- Renders a search item type.
--==============================================================================
function render_searchbox (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders the condition type selectlist and adds the necessary javascript
-- code to show/hide the attached expression1/2 fields.
--==============================================================================
function render_condition_type (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Validates the condition type expression fields.
--==============================================================================
function validate_condition_type (
    p_item   in     wwv_flow_plugin_api.t_page_item,
    p_plugin in     wwv_flow_plugin_api.t_plugin,
    p_value  in     varchar2 )
    return wwv_flow_plugin_api.t_page_item_validation_result;
--
--==============================================================================
-- Renders a hierarchical checkboxes based on the defined attributes in p_item.
--==============================================================================
function render_hierarchical_checkbox (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders the autocomplete item type based on the defined attributes in
-- p_item.
--==============================================================================
function render_advanced_auto_complete (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Returns the possible values restricted by the value specified in wwv_flow.g_x01.
-- wwv_flow.g_x02 contains the maximum number of records which should be returned.
--==============================================================================
function ajax_advanced_auto_complete (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;
--
--==============================================================================
-- Validates the submitted value if it is contained in the list of possible values.
--==============================================================================
function validate_advanced_auto_compl (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_value  in varchar2 )
    return wwv_flow_plugin_api.t_page_item_validation_result;
--
--==============================================================================
-- Renders a group select list of components which restricts the output
-- to the component supported by the current user interface.
--==============================================================================
function render_ui_component_selectlist (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders a plug-in attribute item type.
--==============================================================================
function render_plugin_attribute (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Based on the passed attribute type the function will perform different
-- operations.
--==============================================================================
function ajax_plugin_attribute (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;
--
--==============================================================================
-- CLOB Textarea item plugin
--
-- emit textarea for clob result of select statement in p_item.attribute_01
--
-- data is passed from browser to server via a synchronous ajax request right
-- before the submit. the ajax request passes 4000 character chunks via the f01
-- array of apex_application.show, where it is stored in a collection's clob001
-- whose name equals the item name.
--==============================================================================
function render_clob_textarea (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- CLOB Textarea item plugin
--
-- write g_f01 array into collection p_item.name
--==============================================================================
function ajax_clob_textarea (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;
--
--==============================================================================
-- Renders a CLOB CodeMirror editor based on the defined attributes in p_region.
--==============================================================================
function render_clob_code_editor (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Renders a CodeMirror editor based on the defined attributes in p_item.
--==============================================================================
function render_code_editor (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- AJAX callout for CLOB CodeMirror editor.
--==============================================================================
function ajax_clob_code_editor (
    p_region  in wwv_flow_plugin_api.t_region,
    p_plugin  in wwv_flow_plugin_api.t_plugin)
    return wwv_flow_plugin_api.t_region_ajax_result;
--
--==============================================================================
-- AJAX callout for CodeMirror editor.
--==============================================================================
function ajax_code_editor (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;
--
--==============================================================================
-- Emit the code complete values based on the provided values.
--==============================================================================
procedure emit_code_complete_list (
    p_application_id in number,
    p_type           in varchar2,
    p_search_prefix  in varchar2,
    p_parent         in varchar2,
    p_grand_parent   in varchar2 );
--
--==============================================================================
-- Downloads several files as one zip file.
--==============================================================================
function execute_download_as_zip (
    p_process in wwv_flow_plugin_api.t_process,
    p_plugin  in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_process_exec_result;

--==============================================================================
-- Renders a wizard selection widget based on the defined attributes in p_item.
--==============================================================================
function render_wizard_selection (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;

--==============================================================================
-- AJAX callout for wizard selection
--==============================================================================
function ajax_wizard_selection (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;

--
--==============================================================================
-- Renders a template option checkboxes based on the defined attributes in p_item.
--==============================================================================
function render_template_opt_checkbox (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;

--==============================================================================
-- AJAX callout for template option checkboxes
--==============================================================================
function ajax_template_opt_checkbox (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;

--==============================================================================
-- Renders a Data Grid
--==============================================================================
function render_data_grid (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- AJAX callout for a Data Grid
--==============================================================================
function ajax_data_grid (
    p_region  in wwv_flow_plugin_api.t_region,
    p_plugin  in wwv_flow_plugin_api.t_plugin)
    return wwv_flow_plugin_api.t_region_ajax_result;
--
--==============================================================================
-- Renders a Internal Page Popup LOV
--==============================================================================
function render_internal_page_popuplov (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders the "Add Check All Checkbox" dynamic action, which turns a column heading
-- containing the #CHECK_ALL_CHECKBOX# string into an accessible 'check all' checkbox.
--==============================================================================
function render_add_check_all_checkbox (
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;

end wwv_flow_f4000_plugins;
/
show errors
