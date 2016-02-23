set define '^'
set verify off
prompt ...wwv_flow_plugin


create or replace package wwv_flow_plugin
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_plugin.sql
--
--    DESCRIPTION
--      This package is responsible for handling plug-ins.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      04/02/2009 - Created
--    pawolf      04/10/2009 - Continue implementation
--    pawolf      04/15/2009 - Continue implementation
--    pawolf      04/22/2009 - Added get_attribute_def_javascript
--    pawolf      04/29/2009 - Renamed package to wwv_flow_item_type_plugin
--    pawolf      04/14/2009 - Added dynamic attributes
--    pawolf      06/03/2009 - Renamed wwv_flow_plugin_attributes.attribute_level to attribute_scope
--    pawolf      06/08/2009 - Added dynamic action support
--    pawolf      07/09/2009 - Added validate_attribute_values
--    pawolf      13/09/2009 - Added synchronize_attribute_values
--    pawolf      14/09/2009 - Simplified interface
--    pawolf      07/17/2009 - Added new debugging procedures
--    pawolf      07/23/2009 - Modified call interface for dynamic actions
--    pawolf      07/27/2009 - Added is_in_use
--    pawolf      07/27/2009 - Fixed bug for LOV parameters
--    pawolf      09/25/2009 - Moved Builder specific code to wwv_flow_plugin_f4000
--    pawolf      10/05/2009 - Added constant c_plugin_type_report_col_type
--    pawolf      10/28/2009 - Removed error_display_location from wwv_flow_plugins
--    pawolf      12/29/2009 - Modified calling interface for validations
--    pawolf      12/29/2009 - Added "standard_validations" to wwv_flow_step_items
--    pawolf      01/07/2010 - Added region error message to t_region
--    pawolf      01/20/2010 - Added escape_on_http_output to wwv_flow_step_items
--    pawolf      02/02/2010 - Added cascading lov columns to wwv_flow_step_items
--    pawolf      02/20/2010 - Added support for processes
--    pawolf      12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--    cneumuel    03/02/2011 - Added plugin support for authorization (feature #580)
--    pawolf      05/13/2011 - Added plug-ins for authentication schemes (feature 581)
--    cneumuel    05/20/2011 - Signature changes to authentication plugins (feature 581)
--    pawolf      05/23/2011 - Changed signatures of authentication plugins (feature 581)
--    cneumuel    05/23/2011 - Added decode_ajax_identifier and changed signature of ajax_callback, to use it out of wwv_flow_authentication_engine (feature #581)
--    cneumuel    05/26/2011 - Added decode_ajax_request to trigger ajax callbacks for authentications (feature #581)
--    cneumuel    08/09/2011 - In execute_authorization: renamed p_user_name to p_username (bug #12849435)
--    pawolf      02/24/2012 - Renamed package to wwv_flow_plugin
--    cneumuel    09/12/2013 - In execute_authorization: added p_caching, p_component (feature #1058)
--    cneumuel    09/30/2013 - In execute_process: t_process record now gets populated from caller wwv_flow_process.perform_process (feature #1281)
--    cneumuel    11/15/2013 - In render_region: pass t_plug instead of report id, to support migration of regions to native plugins (feature #1312)
--    pawolf      02/17/2013 - Added support for region columns (feature #1393)
--    pawolf      07/18/2014 - Changed render_region to a function (feature #1461)
--    pawolf      12/06/2014 - Added emit_css_file_urls (feature #1262)
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_ajax_callback is record (
    callback_type varchar2(12),
    id            number
);
--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

-- plugin types
c_plugin_type_item_type       constant varchar2(30) := 'ITEM TYPE';
c_plugin_type_dynamic_action  constant varchar2(30) := 'DYNAMIC ACTION';
c_plugin_type_validation_type constant varchar2(30) := 'VALIDATION TYPE';
c_plugin_type_region_type     constant varchar2(30) := 'REGION TYPE';
c_plugin_type_report_col_type constant varchar2(30) := 'REPORT COLUMN TYPE';
c_plugin_type_process_type    constant varchar2(30) := 'PROCESS TYPE';
c_plugin_type_authorization   constant varchar2(30) := 'AUTHORIZATION TYPE';
c_plugin_type_authentication  constant varchar2(30) := 'AUTHENTICATION TYPE';

-- attribute scope
c_attribute_scope_application constant varchar2(20) := 'APPLICATION';
c_attribute_scope_component   constant varchar2(20) := 'COMPONENT';
c_attribute_scope_column      constant varchar2(20) := 'COLUMN';

--
-- possible plugin types for ajax callbacks: item, region, dynamic action,
-- authentication
--
c_ajax_callback_item           constant varchar2(12) := 'ITEM TYPE';
c_ajax_callback_region         constant varchar2(12) := 'REGION TYPE';
c_ajax_callback_dynamic_action constant varchar2(12) := 'DA TYPE';
c_ajax_callback_authentication constant varchar2(12) := 'AUTH TYPE';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
g_current_item_id number;
g_ajax_identifier varchar2(255);
--
--==============================================================================
-- Returns the name attribute which has to be used for a HTML input element if
-- you want that the value of the element is stored in session state when the
-- page is submitted. If you have a HTML input element which returns multiple
-- values (eg. select list with multiple="multiple") you have
-- to set p_is_multi_value.
-- Note: This function has to be called before you write something to the
--       HTTP buffer with HTP.P(RN)
--==============================================================================
function get_input_name_for_page_item (
    p_is_multi_value in boolean )
    return varchar2;
--
--==============================================================================
-- Returns the AJAX identifier which has to be used for the on-demand call
-- of a plug-in.
--
-- Note: if the plug-in doesn't have an AJAX callback configured, null will be
--       returned!
--==============================================================================
function get_ajax_identifier return varchar2;
--
--==============================================================================
-- Function to render an item type plugin.
-- p_item_idx contains the index for the wwv_flow.g_item_xx arrays.
--==============================================================================
function render_page_item (
    p_item_idx            in binary_integer,
    p_value               in varchar2,
    p_lov                 in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Function to validate an item type plugin. If the validation fails,
-- message will contain a value. display_location and page_item_name can
-- optionally be set.
--==============================================================================
function validate_page_item (
    p_item_id in number )
    return wwv_flow_plugin_api.t_page_item_validation_result;
--
--==============================================================================
-- Function to render a region plugin.
-- p_region_id is the id of the non-translated region.
--==============================================================================
function render_region (
    p_plug                in wwv_flow.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Function to render a dynamic action plugin.
-- p_dynamic_action_id is the id of the non-translated dynamic action.
--==============================================================================
function render_dynamic_action (
    p_dynamic_action_id in number,
    p_action            in varchar2,
    p_attribute_01      in varchar2,
    p_attribute_02      in varchar2,
    p_attribute_03      in varchar2,
    p_attribute_04      in varchar2,
    p_attribute_05      in varchar2,
    p_attribute_06      in varchar2,
    p_attribute_07      in varchar2,
    p_attribute_08      in varchar2,
    p_attribute_09      in varchar2,
    p_attribute_10      in varchar2,
    p_attribute_11      in varchar2,
    p_attribute_12      in varchar2,
    p_attribute_13      in varchar2,
    p_attribute_14      in varchar2,
    p_attribute_15      in varchar2 )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;
--
--==============================================================================
-- Function to execute a process plugin.
-- p_process_idx contains the index for the wwv_flow.g_process_xx arrays.
--==============================================================================
function execute_process (
    p_process_idx in binary_integer,
    p_process in out nocopy wwv_flow_plugin_api.t_process,
    p_type    in varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;
--
--==============================================================================
-- Function to execute an authorization plugin.
-- p_authorization_id is the id of the non-translated authorization.
--==============================================================================
function execute_authorization (
    p_authorization_id  in number,
    p_type              in varchar2,
    p_name              in varchar2,
    p_username          in varchar2,
    p_caching           in varchar2,
    p_component         in wwv_flow.t_component,
    p_attribute_01      in varchar2,
    p_attribute_02      in varchar2,
    p_attribute_03      in varchar2,
    p_attribute_04      in varchar2,
    p_attribute_05      in varchar2,
    p_attribute_06      in varchar2,
    p_attribute_07      in varchar2,
    p_attribute_08      in varchar2,
    p_attribute_09      in varchar2,
    p_attribute_10      in varchar2,
    p_attribute_11      in varchar2,
    p_attribute_12      in varchar2,
    p_attribute_13      in varchar2,
    p_attribute_14      in varchar2,
    p_attribute_15      in varchar2 )
    return wwv_flow_plugin_api.t_authorization_exec_result;
--
--==============================================================================
-- Function to execute the session sentry function of an authentication plugin.
--==============================================================================
function execute_session_sentry (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;
--
--==============================================================================
-- Function to execute the invalid session function of an authentication plugin.
--==============================================================================
function execute_invalid_session (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_inval_result;
--
--==============================================================================
-- Function to verify if the login credentials of an authentication plugin are
-- valid.
--==============================================================================
function execute_authentication (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;
--
--==============================================================================
-- Function to execute the post logout function an authentication plugin.
--==============================================================================
function execute_post_logout (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_logout_result;
--
--==============================================================================
-- function to decode an ajax identifier from a "PLUGIN=xxx" request
--==============================================================================
function decode_ajax_request (
    p_request in varchar2 )
    return t_ajax_callback;
--
--==============================================================================
-- Procedure to create a response for an AJAX call of a plugin.
--==============================================================================
procedure ajax_callback (
    p_ajax_callback in t_ajax_callback );
--
--==============================================================================
-- Procedure which immediately emits the css file urls stored for a plug-in.
--==============================================================================
procedure emit_css_file_urls (
    p_plugin_type in varchar2,
    p_name        in varchar2 );
--
--
end wwv_flow_plugin;
/
show errors
