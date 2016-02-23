set define '^' verify off
prompt ...wwv_flow_region_native
create or replace package wwv_flow_region_native as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_region_native.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native region types.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      06/07/2011 - Created
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    pawolf      03/23/2012 - Added new region type jQM List View (feature# 884)
--    pawolf      04/02/2012 - Added p_plugin to APIs
--    pawolf      04/04/2012 - Renamed wwv_flow_region_native to wwv_flow_region_native
--    pawolf      04/27/2012 - Added Builder checks for jQM List View region type
--    pmanirah    07/30/2013 - Added c_css_calendar constant for css calendar 
--    msewtz      09/12/2013 - Added c_jqm_responsive_table
--    cneumuel    11/15/2013 - Moved breadcrumb and list from wwv_flow_disp_page_plugs to wwv_flow_region_native (feature #1312)
--    cneumuel    11/22/2013 - REGION_DISPLAY_SELECTOR, URL, HELP_TEXT migrated to native plugins (feature #1312)
--    cneumuel    12/05/2013 - classic reports and tabular forms migration to native plugins (feature #1312)
--    cneumuel    12/06/2013 - Added render_classic_report, ajax_classic_report, moved from wwv_flow_disp_page_plugs.display_report, wwv_render_report3.ajax (feature #1312)
--    cneumuel    12/06/2013 - interactive reports migration to native plugins (feature #1312)
--    cneumuel    12/16/2013 - html and plsql migration to native plugins (feature #1312)
--    cneumuel    02/10/2014 - Changed NATIVE_HTML region to NATIVE_STATIC
--    msewtz      02/17/2014 - Added support for #COMPONENT_CSS_CLASSES# substitution for classic reports, lists and menus (feature 1383)
--    msewtz      03/31/2014 - Added template options to lists 
--    pawolf      04/15/2014 - Added jQM Reflow and Column Toggle region types
--                           - Removed JQM_RESPONSIVE_TABLE
--    hfarrell    04/17/2014 - Removed c_legacy_flash_chart (feature #1345)
--    arayner     07/28/2014 - Added p_region_name to render_list (feature #1465)
--    pmanirah    10/13/2014 - Added c_static_search for static search region type
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
subtype t_region_type is varchar2(40);
c_data_upload_column_mapping constant t_region_type := 'NATIVE_DATA_UPLOAD_COLUMN_MAPPING';
c_jqm_list_view              constant t_region_type := 'NATIVE_JQM_LIST_VIEW';
c_css_calendar               constant t_region_type := 'NATIVE_CSS_CALENDAR';
c_jqm_reflow                 constant t_region_type := 'NATIVE_JQM_REFLOW';
c_jqm_column_toggle          constant t_region_type := 'NATIVE_JQM_COLUMN_TOGGLE';
c_list_region                constant t_region_type := 'NATIVE_LIST';
c_breadcrumb_region          constant t_region_type := 'NATIVE_BREADCRUMB';
c_display_selector           constant t_region_type := 'NATIVE_DISPLAY_SELECTOR';
c_url                        constant t_region_type := 'NATIVE_URL';
c_help_text                  constant t_region_type := 'NATIVE_HELP_TEXT';
c_ir                         constant t_region_type := 'NATIVE_IR';
c_fnc_report                 constant t_region_type := 'NATIVE_FNC_REPORT';
c_sql_report                 constant t_region_type := 'NATIVE_SQL_REPORT';
c_tabform                    constant t_region_type := 'NATIVE_TABFORM';
c_static                     constant t_region_type := 'NATIVE_STATIC';
c_plsql                      constant t_region_type := 'NATIVE_PLSQL';
c_jstree                     constant t_region_type := 'NATIVE_JSTREE';
c_calendar                   constant t_region_type := 'NATIVE_CALENDAR';
c_flash_chart5               constant t_region_type := 'NATIVE_FLASH_CHART5';
c_flash_map                  constant t_region_type := 'NATIVE_FLASH_MAP';
c_legacy_svg_chart           constant t_region_type := 'NATIVE_SVG_CHART';
c_legacy_simple_chart        constant t_region_type := 'NATIVE_SIMPLE_CHART';
c_legacy_tree                constant t_region_type := 'NATIVE_TREE';
c_static_search              constant t_region_type := 'NATIVE_STATIC_SEARCH';

--##############################################################################
--#
--# LIST REGION
--#
--##############################################################################

--==============================================================================
procedure render_list (
    p_region_id               in number,
    p_region_name             in varchar2 default null,    
    p_list_id                 in number,
    p_list_template_id        in number,
    p_region_sub_css_classes  in varchar2 default null,
    p_region_template_options in varchar2 default null );

--##############################################################################
--#
--# CLASSIC REPORT
--#
--##############################################################################

--==============================================================================
-- direct render request, via wwv_flow.show
--==============================================================================
procedure render_classic_report (
    p_region_id     in number   default null,
    p_output_format in varchar2 default 'CSV' );

--==============================================================================
-- handler for ajax requests (dynamic action refresh, sorting, pagination),
-- called from generic handler wwv_flow_ajax.widget.
--==============================================================================
procedure ajax_classic_report (
    p_region_id     in number,
    p_action        in varchar2,
    p_action_mod    in varchar2 );

--##############################################################################
--#
--# DISPATCHERS
--#
--##############################################################################

--==============================================================================
-- Dispatcher which actually calls the native region plug-in.
--==============================================================================
function render_region (
    p_type                in varchar2,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Dispatcher which actually calls the native region plug-in.
--==============================================================================
function ajax_region (
    p_type   in varchar2,
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_region in wwv_flow_plugin_api.t_region )
    return wwv_flow_plugin_api.t_region_ajax_result;
--
--==============================================================================
-- Dispatcher which validates the entered data in the Builder.
--==============================================================================
procedure validate_builder_region (
    p_type             in varchar2,
    p_attribute_scope  in varchar2,
    p_page_item_prefix in varchar2 );
--
--
end wwv_flow_region_native;
/
show errors
