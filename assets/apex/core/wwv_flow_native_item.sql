set define '^'
set verify off
prompt ...wwv_flow_native_item


create or replace package wwv_flow_native_item
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    NAME
--      wwv_flow_native_item.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native item types.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      09/11/2009 - Created
--    pawolf      09/14/2009 - Continue
--    pawolf      09/29/2009 - Added Rich Text Editor
--    pawolf      10/05/2009 - Added new Textarea
--    pawolf      11/03/2009 - Replaced apex_plugin references with wwv_flow_plugin
--    sathikum    12/11/2009 - Added new DatePicker
--    pawolf      12/18/2009 - Added new item type "Number Field"
--    pawolf      12/29/2009 - Modified calling interface for validations
--    pawolf      12/29/2009 - Added new item type "Password"
--    pawolf      01/12/2010 - Added item type date picker classic
--    pawolf      01/14/2010 - Added item type select list
--    pawolf      01/15/2010 - Added constants for native item types
--    pawolf      01/18/2010 - Added item type "Popup LOV"
--    pawolf      01/26/2010 - Added cascading support for Select List
--    pawolf      01/27/2010 - Added item type "Shuttle"
--    pawolf      02/02/2010 - Added item type "Checkbox" and "Radiogroup"
--    pawolf      02/05/2010 - Changed to new plug-in interface
--    pawolf      02/16/2010 - Don't support OUT of p_value in validation API anymore
--    pawolf      03/05/2010 - Added file handling item type
--    pawolf      03/09/2010 - Added new item type "Display Image"
--    pawolf      03/16/2010 - Added item type "List Manager"
--    pawolf      03/17/2010 - Added cascading LOV support for popup LOVs and List Manager
--    pawolf      04/13/2010 - Added merged text, hidden and color picker item types
--    pawolf      12/22/2010 - Added render_popup_lov_dialog as public
--    cneumuel    05/23/2011 - Added add_ckeditor_javascript helper procedure
--    pawolf      06/24/2011 - Added p_multiple_values to render_popup_lov_dialog
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    pawolf      02/29/2012 - Added HTML5 date picker (feature# 840)
--    pawolf      02/29/2012 - Changed package to use dispatcher functions
--    pawolf      03/22/2012 - Added new item type "Yes/No" (feature# 882)
--    pawolf      03/22/2012 - Added new item type "Slider" (feature# 883)
--    pawolf      04/02/2012 - Added p_plugin to APIs
--    sathikum    02/11/2013 - Added new attribute toolbar_position to Ckeditor 4.x (feature #1121)
--    pawolf      11/06/2014 - In add_ckeditor_javascript: added p_label parameter for better accessibility (bug #12702214)
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_hidden                    constant varchar2(40) := 'NATIVE_HIDDEN';
c_text_field                constant varchar2(40) := 'NATIVE_TEXT_FIELD';
c_number_field              constant varchar2(40) := 'NATIVE_NUMBER_FIELD';
c_select_list               constant varchar2(40) := 'NATIVE_SELECT_LIST';
c_date_picker               constant varchar2(40) := 'NATIVE_DATE_PICKER';
c_date_picker_html5         constant varchar2(40) := 'NATIVE_DATE_PICKER_HTML5';
c_auto_complete             constant varchar2(40) := 'NATIVE_AUTO_COMPLETE';
c_textarea                  constant varchar2(40) := 'NATIVE_TEXTAREA';
c_rich_text_editor          constant varchar2(40) := 'NATIVE_RICH_TEXT_EDITOR';
c_password                  constant varchar2(40) := 'NATIVE_PASSWORD';
c_popup_lov                 constant varchar2(40) := 'NATIVE_POPUP_LOV';
c_date_picker_classic       constant varchar2(40) := 'NATIVE_DATE_PICKER_CLASSIC';
c_stop_and_start_html_table constant varchar2(40) := 'NATIVE_STOP_AND_START_HTML_TABLE';
c_display_only              constant varchar2(40) := 'NATIVE_DISPLAY_ONLY';
c_shuttle                   constant varchar2(40) := 'NATIVE_SHUTTLE';
c_checkbox                  constant varchar2(40) := 'NATIVE_CHECKBOX';
c_radiogroup                constant varchar2(40) := 'NATIVE_RADIOGROUP';
c_file                      constant varchar2(40) := 'NATIVE_FILE';
c_display_image             constant varchar2(40) := 'NATIVE_DISPLAY_IMAGE';
c_list_manager              constant varchar2(40) := 'NATIVE_LIST_MANAGER';
c_text_with_calculator      constant varchar2(40) := 'NATIVE_TEXT_WITH_CALCULATOR';
c_color_picker              constant varchar2(40) := 'NATIVE_COLOR_PICKER';
c_yes_no                    constant varchar2(40) := 'NATIVE_YES_NO';
c_slider                    constant varchar2(40) := 'NATIVE_SLIDER';

-- Used by HTML5 date picker
c_browser_date_format_mask     constant varchar2(30) := 'YYYY-MM-DD';
c_browser_datetime_format_mask constant varchar2(30) := 'YYYY-MM-DD"T"HH24:MI:SS';
--
--==============================================================================
-- Renders the HTML code for popup LOV dialog.
--==============================================================================
procedure render_popup_lov_dialog (
    p_item_name        in varchar2,
    p_fetch            in varchar2,
    p_lov_definition   in varchar2,
    p_lov_display_null in boolean,
    p_lov_null_text    in varchar2 default null,
    p_lov_null_value   in varchar2 default null,
    p_has_hidden_item  in boolean  default false,
    p_allow_multiple   in boolean  default false );
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin to run the render function.
--==============================================================================
function render (
    p_type                in varchar2,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin to run the validate function.
--==============================================================================
function validate (
    p_type   in varchar2,
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_value  in varchar2 )
    return wwv_flow_plugin_api.t_page_item_validation_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin to run the ajax function.
--==============================================================================
function ajax (
    p_type   in varchar2,
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_item   in wwv_flow_plugin_api.t_page_item )
    return wwv_flow_plugin_api.t_page_item_ajax_result;
--
--==============================================================================
-- Helper procedure to add javascript code for the ckeditor (referenced by
-- native item and f4000 clob textarea
--==============================================================================
procedure add_ckeditor_javascript (
    p_item_name           in varchar2,
    p_label               in varchar2 default null,
    p_toolbar             in varchar2, -- e.g. "Full"
    p_toolbar_expanded    in boolean,
    p_skin                in varchar2,
    p_toolbar_position    in varchar2  -- e.g "top","bottom"
    );
--
--
end wwv_flow_native_item;
/
show errors
