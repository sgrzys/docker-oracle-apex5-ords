set define '^'
set verify off
prompt wwv_flow_flash_chart5_util

Rem    NAME
Rem      wwv_flow_flash_chart5_util.sql
Rem
Rem    DESCRIPTION
Rem      Flash Chart utility package.
Rem
Rem    NOTES
Rem      This package contains utility functions for flash chart 5.
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    hfarrell    04/20/2009 - Created - based on wwv_flow_flash_chart_util.sql
Rem    hfarrell    06/11/2009 - Updated fetch_chart_attr and save_chart_attr to include additional attributes for markers and legends
Rem    hfarrell    06/15/2009 - Updated fetch_chart_attr and save_chart_attr to include prefix and postfix for both axes
Rem    hfarrell    06/15/2009 - Updated fetch_chart_attr and save_chart_attr to include values_prefix and values_postfix for Pies, Doughnuts and Gauges
Rem    hfarrell    06/23/2009 - Updated fetch_chart_attr and save_chart_attr to include gauge font attributes
Rem    hfarrell    06/30/2009 - Updated fetch_chart_attr and save_chart_attr to support additional gauge attributes:pointer, minor_interval, major_interval, 
Rem                             start_angle, sweep_angle, label_rotation, label_align
Rem    hfarrell    07/17/2009 - Added attributes for inverting X and Y axes to fetch_chart_attr and save_chart_attr
Rem    hfarrell    08/24/2009 - Added support for Gantt charts to fetch_chart_attr and save_chart_attr: ProjectGantt and ResourceGantt
Rem    hfarrell    09/18/2009 - Added support for maps, added show_map_tree procedure to use with jQuery Treeview and show_tree to use with jQuery FileTree
Rem    hfarrell    09/23/2009 - Removed show_tree procedure, not required.
Rem    hfarrell    11/09/2009 - Added support for declarative action links on charts: fetch_chart_series_attr and save_chart_series_attr updated
Rem    hfarrell    11/13/2009 - Updated fetch_chart_attr and save_chart_attr with Gantt chart datagrid attributes
Rem    hfarrell    12/11/2009 - Added support for map defined/undefined/grid color and series type setting.Added Gantt date format support for datagrid.
Rem    hfarrell    03/05/2010 - Fix for bug 5905923: added X & Y axis major_interval and minor_interval parameters to fetch_chart_attr and save_chart_attr, to control grid spacing on charts
Rem    hfarrell    03/26/2010 - Updated fetch_chart_attr and save_chart_attr to include series_style for setting bar, column or bubble series style
Rem    hfarrell    04/14/2010 - Updated is_valid_flash_chart_query to include p_owner for use in Create App wizard, where no entry exists yet in wwv_flows so wwv_flow_security.flow_owner check would always fail
Rem    hfarrell    04/19/2010 - Updated save_chart_attr and fetch_chart_attr to include gantt_start_date and gantt_end_date
Rem    hfarrell    12/03/2010 - Fix for bug 10180629: updated fetch_chart_attr and save_chart_attr to include p_label_position, p_pie_decimal_places, p_pie_prefix and p_pie_postfix for Pie chart label positioning, decimal places, values prefix and postfix
Rem    hfarrell    01/06/2011 - Added support for overlay and sorted overlay modes on bar charts
Rem    hfarrell    01/06/2011 - Updated fetch_chart_attr and save_chart_attr to include two new attributes for column and bar charts: p_overlay and p_sort_overlay
Rem    hfarrell    01/14/2011 - Updated fetch_chart_attr and save_chart_attr to include two new attributes: p_gantt_start_date_item and p_gantt_end_date_item
Rem    hfarrell    01/20/2011 - Updated fetch_chart_attr, save_chart_attr, fetch_map_attr, and save_map_attr to include new color scheme level attribute: p_color_scheme_level
Rem    hfarrell    03/05/2012 - Feature #494 - add conditional settings on chart series, and set authorization scheme on series query
Rem    hfarrell    03/05/2012 - Feature #543 - add chart_rendering parameter for charts
Rem    hfarrell    03/29/2012 - Updated save_chart_series_attr and fetch_chart_series_attr to add p_required_patch (feature #494)
Rem    hfarrell    04/20/2012 - Updated save_map_attr and fetch_map_attr to include p_chart_rendering - not supported yet but should be in future AnyChart release
Rem    pawolf      04/30/2012 - Removed get_asynch_update_js (feature #741)
Rem    pawolf      05/02/2012 - Added "Refresh" dynamic action support for charts (feature #741)
Rem    hfarrell    07/30/2013 - Added p_extra_y_axis_min, p_extra_y_axis_max to save_chart_attr and fetch_chart_attr (feature #742)
Rem    hfarrell    08/26/2013 - In save_chart_attr and fetch_chart_attr: added p_smart_calc_mode (feature #742)

create or replace package wwv_flow_flash_chart5_util as 
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    DESCRIPTION
--      Flash Chart 5 utility package.
--
--    SECURITY
--
--    NOTES
--      
--

function is_valid_flash_chart_query (
    p_flow_id           in number,
    p_security_group_id in number,
    p_chart_type        in varchar2, 
    p_query             in varchar2,
    p_query_type        in varchar2 default 'SQL_QUERY',
    p_owner             in varchar2 default null
    ) return varchar2;

function get_flash_filename (
  p_flash_chart_type in varchar2
) return varchar2;

function get_files(
  p_id in number
) return varchar2;

procedure show_map_tree(
    p_folder_name                in varchar2,
    p_wizard_type                in varchar2
);

procedure show_map_tree2(
    p_folder_name                in varchar2,
    p_wizard_type                in varchar2
);

procedure fetch_chart_attr (
    p_flow_id                    in number,
    p_region_id                  in number,
    p_chart_id                   out number,
    p_chart_title                out varchar2,
    p_chart_type                 out varchar2,
    p_chart_rendering            out varchar2,
    p_chart_width                out number,
    p_chart_height               out number,                      
    p_chart_margin_top           out number,
    p_chart_margin_bottom        out number,
    p_chart_margin_left          out number,
    p_chart_margin_right         out number,
    p_chart_gradient_angle       out number,
    p_animation                  out varchar2,
    --
    p_color_scheme               out varchar2,
    p_color_scheme_level         out varchar2,
    p_hatch_pattern              out varchar2,
    p_custom_colors              out varchar2,
    p_series_style               out varchar2,
    p_bgtype                     out varchar2,
    p_bgcolor1                   out varchar2,
    p_bgcolor2                   out varchar2,
    --
    p_show_hints                 out varchar2,
    p_show_names                 out varchar2,
    p_show_values                out varchar2,
    p_show_legend                out varchar2,
    p_show_grid                  out varchar2,
    p_show_scrollbar             out varchar2,
    p_show_marker                out varchar2,
    p_show_dial_majorticks       out varchar2,
    p_show_dial_minorticks       out varchar2,
    p_show_dial_tick_labels      out varchar2,
    p_label_position             out varchar2,
    p_pie_decimal_places         out number,
    --
    p_multi_y_axes               out varchar2,
    p_multi_x_axes               out varchar2,
    p_invert_x_axis              out varchar2,
    p_invert_y_axis              out varchar2,
    p_overlay                    out varchar2,
    p_sort_overlay               out varchar2,
    p_smart_calc_mode            out varchar2,
    --
    p_gauge_frame                out varchar2,
    p_gauge_pointer              out varchar2,
    p_gauge_major_interval       out number,
    p_gauge_minor_interval       out number,
    p_gauge_start_angle          out number,
    p_gauge_sweep_angle          out number,
    p_gauge_label_rotation       out number,
    p_gauge_label_align          out varchar2,
    p_invert_scale               out varchar2,
    --
    p_gantt_navigate             out varchar2,
    p_gantt_actual_start         out varchar2,
    p_gantt_actual_end           out varchar2,
    p_gantt_actual_shape         out varchar2,
    p_gantt_progress_start       out varchar2,
    p_gantt_progress_end         out varchar2,
    p_gantt_progress_shape       out varchar2,
    p_gantt_baseline_start       out varchar2,
    p_gantt_baseline_end         out varchar2,
    p_gantt_baseline_shape       out varchar2,
    p_gantt_line_height          out number,
    p_gantt_item_height          out number,
    p_gantt_item_padding         out number,
    p_show_datagrid              out varchar2,
    p_show_datagrid_id           out varchar2,
    p_show_datagrid_name         out varchar2,
    p_show_datagrid_start        out varchar2,
    p_show_datagrid_end          out varchar2,
    p_gantt_date_format          out varchar2,
    p_gantt_start_date           out date,
    p_gantt_start_date_item      out varchar2,
    p_gantt_end_date             out date,
    p_gantt_end_date_item        out varchar2,
    --
    p_map_source                 out varchar2,
    p_map_projection             out varchar2,
    p_map_label_mode             out varchar2,
    p_map_region_column          out varchar2,
    --
    p_group_series               out varchar2,
    p_legend_title               out varchar2,
    p_legend_layout              out varchar2,
    p_legend_background          out varchar2,
    p_x_axis_title               out varchar2,
    p_x_axis_min                 out number,
    p_x_axis_max                 out number,
    p_x_axis_title_font_face     out varchar2,
    p_x_axis_title_font_size     out number,
    p_x_axis_title_font_color    out varchar2,
    p_x_axis_label_font_face     out varchar2,
    p_x_axis_label_font_size     out number,
    p_x_axis_label_font_color    out varchar2,
    p_x_axis_decimal_place       out varchar2,
    p_x_axis_prefix              out varchar2,
    p_x_axis_postfix             out varchar2,    
    p_x_axis_label_rotation      out number,
    p_x_axis_major_interval      out number,
    p_x_axis_minor_interval      out number,
    p_y_axis_title               out varchar2,
    p_y_axis_min                 out number,
    p_y_axis_max                 out number,
    p_y_axis_label_font_face     out varchar2,
    p_y_axis_label_font_size     out number,
    p_y_axis_label_font_color    out varchar2,    
    p_y_axis_label_rotation      out number,
    p_y_axis_title_font_face     out varchar2,
    p_y_axis_title_font_size     out number,
    p_y_axis_title_font_color    out varchar2,
    p_y_axis_decimal_place       out varchar2,
    p_y_axis_prefix              out varchar2,
    p_y_axis_postfix             out varchar2,
    p_y_axis_major_interval      out number,
    p_y_axis_minor_interval      out number,
    --
    p_extra_y_axis_min           out number,
    p_extra_y_axis_max           out number,
    --
    p_values_font_face           out varchar2,
    p_values_font_size           out number,
    p_values_font_color          out varchar2,    
    p_values_rotation            out number,
    p_values_prefix              out varchar2,
    p_values_postfix             out varchar2,
    p_pie_prefix                 out varchar2,
    p_pie_postfix                out varchar2,
    --
    p_hints_font_face            out varchar2,
    p_hints_font_size            out number,
    p_hints_font_color           out varchar2,
    p_legend_font_face           out varchar2,
    p_legend_font_size           out number,
    p_legend_font_color          out varchar2,
    p_chart_title_font_face      out varchar2,
    p_chart_title_font_size      out varchar2,
    p_chart_title_font_color     out varchar2,
    p_gauge_label_font_face      out varchar2,
    p_gauge_label_font_size      out varchar2,
    p_gauge_label_font_color     out varchar2,
    p_xml                        out varchar2,
    p_use_xml                    out varchar2,    
    p_async                      out varchar2,
    p_async_time                 out number
    );

procedure save_chart_attr (
    p_flow_id                  in number,
    p_region_id                in number,
    p_chart_id                 in number,
    p_chart_title              in varchar2 default null,
    p_chart_type               in varchar2 default null,
    p_chart_rendering          in varchar2 default null,
    p_chart_width              in number default null,
    p_chart_height             in number default null,
    p_chart_margin_top         in number default null,
    p_chart_margin_bottom      in number default null,
    p_chart_margin_left        in number default null,
    p_chart_margin_right       in number default null,
    p_chart_gradient_angle     in number default null,
    p_animation                in varchar2 default null,
    p_color_scheme             in varchar2 default null,
    p_color_scheme_level       in varchar2 default null,
    p_hatch_pattern            in varchar2 default null,
    p_custom_colors            in varchar2 default null,
    p_series_style             in varchar2 default null,
    p_bgtype                   in varchar2 default null,
    p_bgcolor1                 in varchar2 default null,
    p_bgcolor2                 in varchar2 default null,
    p_show_hints               in varchar2 default null,
    p_show_names               in varchar2 default null,
    p_show_values              in varchar2 default null,
    p_show_legend              in varchar2 default null,
    p_show_grid                in varchar2 default null,
    p_show_scrollbar           in varchar2 default null,
    p_show_marker              in varchar2 default null,
    p_show_dial_majorticks     in varchar2 default null,
    p_show_dial_minorticks     in varchar2 default null,
    p_show_dial_tick_labels    in varchar2 default null,
    p_label_position           in varchar2 default null,
    p_pie_decimal_places       in number   default null,
    --
    p_multi_y_axes             in varchar2 default null,
    p_multi_x_axes             in varchar2 default null,
    p_invert_x_axis            in varchar2 default null,
    p_invert_y_axis            in varchar2 default null,
    p_overlay                  in varchar2 default null,
    p_sort_overlay             in varchar2 default null,
    p_smart_calc_mode          in varchar2 default null,
    --
    p_gauge_frame              in varchar2 default null,
    p_gauge_pointer            in varchar2 default null,
    p_gauge_major_interval     in number default null,
    p_gauge_minor_interval     in number default null,
    p_gauge_start_angle        in number default null,
    p_gauge_sweep_angle        in number default null,
    p_gauge_label_rotation     in number default null,
    p_gauge_label_align        in varchar2 default null,
    p_invert_scale             in varchar2 default null,
    --
    p_gantt_navigate           in varchar2 default null,
    p_gantt_actual_start       in varchar2 default null,
    p_gantt_actual_end         in varchar2 default null,
    p_gantt_actual_shape       in varchar2 default null,
    p_gantt_progress_start     in varchar2 default null,
    p_gantt_progress_end       in varchar2 default null,
    p_gantt_progress_shape     in varchar2 default null,
    p_gantt_baseline_start     in varchar2 default null,
    p_gantt_baseline_end       in varchar2 default null,
    p_gantt_baseline_shape     in varchar2 default null,
    p_gantt_line_height        in number default null,
    p_gantt_item_height        in number default null,
    p_gantt_item_padding       in number default null,
    p_show_datagrid            in varchar2 default null,
    p_show_datagrid_id         in varchar2 default null,
    p_show_datagrid_name       in varchar2 default null,
    p_show_datagrid_start      in varchar2 default null,
    p_show_datagrid_end        in varchar2 default null,
    p_gantt_date_format        in varchar2 default null,
    p_gantt_start_date         in date default null,
    p_gantt_start_date_item    in varchar2 default null,
    p_gantt_end_date           in date default null,
    p_gantt_end_date_item      in varchar2 default null,        
    --
    p_map_source               in varchar2 default null,
    p_map_projection           in varchar2 default null,
    p_map_label_mode           in varchar2 default null,
    p_map_region_column        in varchar2 default null,
    --
    p_group_series             in varchar2 default null,
    p_legend_title             in varchar2 default null,
    p_legend_layout            in varchar2 default null,
    p_legend_background        in varchar2 default null,
    p_enable_3d_mode           in varchar2 default null,
    p_x_axis_title             in varchar2 default null,
    p_x_axis_min               in number default null,
    p_x_axis_max               in number default null,
    p_x_axis_scroll_start      in varchar2 default null,
    p_x_axis_scroll_end        in varchar2 default null,
    p_x_axis_scroll_range      in varchar2 default null,
    p_x_axis_scroll_range_unit in varchar2 default null,
    p_x_axis_label_font_face   in varchar2 default null,
    p_x_axis_label_font_size   in number default null,
    p_x_axis_label_font_color  in varchar2 default null,
    p_x_axis_label_rotation    in number default null,
    p_x_axis_title_font_face   in varchar2 default null,
    p_x_axis_title_font_size   in number default null,
    p_x_axis_title_font_color  in varchar2 default null,
    p_x_axis_decimal_place     in varchar2 default null,
    p_x_axis_prefix            in varchar2 default null,
    p_x_axis_postfix           in varchar2 default null,
    p_x_axis_major_interval    in number default null,
    p_x_axis_minor_interval    in number default null,
    p_y_axis_title             in varchar2 default null,
    p_y_axis_min               in number default null,
    p_y_axis_max               in number default null,
    p_y_axis_scroll_start      in varchar2 default null,
    p_y_axis_scroll_end        in varchar2 default null,
    p_y_axis_scroll_range      in varchar2 default null,
    p_y_axis_scroll_range_unit in varchar2 default null,
    p_y_axis_label_font_face   in varchar2 default null,
    p_y_axis_label_font_size   in number default null,
    p_y_axis_label_font_color  in varchar2 default null,
    p_y_axis_label_rotation    in number default null,
    p_y_axis_title_font_face   in varchar2 default null,
    p_y_axis_title_font_size   in number default null,
    p_y_axis_title_font_color  in varchar2 default null,
    p_y_axis_decimal_place     in varchar2 default null,
    p_y_axis_prefix            in varchar2 default null,
    p_y_axis_postfix           in varchar2 default null,
    p_y_axis_major_interval    in number default null,
    p_y_axis_minor_interval    in number default null,
    --
    p_extra_y_axis_min         in number default null,
    p_extra_y_axis_max         in number default null,
    --
    p_values_font_face         in varchar2 default null,
    p_values_font_size         in number default null,
    p_values_font_color        in varchar2 default null,
    p_values_rotation          in number default null,
    p_values_prefix            in varchar2 default null,
    p_values_postfix           in varchar2 default null,
    p_pie_prefix               in varchar2 default null,
    p_pie_postfix              in varchar2 default null,
    p_hints_font_face          in varchar2 default null,
    p_hints_font_size          in number default null,
    p_hints_font_color         in varchar2 default null,
    p_legend_font_face         in varchar2 default null,
    p_legend_font_size         in number default null,
    p_legend_font_color        in varchar2 default null,
    p_chart_title_font_face    in varchar2 default null,
    p_chart_title_font_size    in varchar2 default null,
    p_chart_title_font_color   in varchar2 default null,
    p_gauge_label_font_face    in varchar2 default null,
    p_gauge_label_font_size    in varchar2 default null,
    p_gauge_label_font_color   in varchar2 default null,
    p_xml                      in varchar2 default null,
    p_use_xml                  in varchar2 default null,
    p_async                    in varchar2 default null,
    p_async_time               in number default null
    );

procedure fetch_map_attr (
    p_flow_id                    in number,
    p_region_id                  in number,
    p_chart_id                   out number,
    p_chart_title                out varchar2,
    p_chart_rendering            out varchar2,
    p_chart_type                 out varchar2,
    p_chart_width                out number,
    p_chart_height               out number,                      
    p_chart_margin_top           out number,
    p_chart_margin_bottom        out number,
    p_chart_margin_left          out number,
    p_chart_margin_right         out number,
    p_chart_gradient_angle       out number,
    p_animation                  out varchar2,
    --
    p_color_scheme               out varchar2,
    p_color_scheme_level         out varchar2,
    p_hatch_pattern              out varchar2,
    p_custom_colors              out varchar2,
    p_set_undef_colors           out varchar2,
    p_undef_color_scheme         out varchar2,
    p_undef_hatch_pattern        out varchar2,
    p_undef_custom_colors        out varchar2,
    p_bgtype                     out varchar2,
    p_bgcolor1                   out varchar2,
    p_bgcolor2                   out varchar2,
    p_grid_bgtype                out varchar2,
    p_grid_bgcolor1              out varchar2,
    p_grid_bgcolor2              out varchar2,
    p_grid_gradient_angle        out varchar2,
    --
    p_show_hints                 out varchar2,
    p_show_names                 out varchar2,
    p_show_values                out varchar2,
    p_show_legend                out varchar2,
    p_show_grid                  out varchar2,
    p_show_zoom                  out varchar2,
    p_show_nav                   out varchar2,
    p_show_marker                out varchar2,
    --
    p_map_source                 out varchar2,
    p_map_projection             out varchar2,
    p_map_label_mode             out varchar2,
    p_map_region_column          out varchar2,
    p_map_centroid_x             out varchar2,
    p_map_centroid_y             out varchar2,
    p_map_centre                 out varchar2,
    --
    p_group_series               out varchar2,
    p_legend_title               out varchar2,
    p_legend_layout              out varchar2,
    p_legend_background          out varchar2,
    p_legend_items               out varchar2,
    p_values_font_face           out varchar2,
    p_values_font_size           out number,
    p_values_font_color          out varchar2,    
    p_values_rotation            out number,
    p_values_prefix              out varchar2,
    p_values_postfix             out varchar2,
    --
    p_hints_font_face            out varchar2,
    p_hints_font_size            out number,
    p_hints_font_color           out varchar2,
    p_legend_font_face           out varchar2,
    p_legend_font_size           out number,
    p_legend_font_color          out varchar2,
    p_chart_title_font_face      out varchar2,
    p_chart_title_font_size      out varchar2,
    p_chart_title_font_color     out varchar2,
    p_xml                        out varchar2,
    p_use_xml                    out varchar2,    
    p_async                      out varchar2,
    p_async_time                 out number
    );

procedure save_map_attr (
    p_flow_id                  in number,
    p_region_id                in number,
    p_chart_id                 in number,
    p_chart_title              in varchar2 default null,
    p_chart_rendering          in varchar2 default null,
    p_chart_type               in varchar2 default null,
    p_chart_width              in number default null,
    p_chart_height             in number default null,
    p_chart_margin_top         in number default null,
    p_chart_margin_bottom      in number default null,
    p_chart_margin_left        in number default null,
    p_chart_margin_right       in number default null,
    p_chart_gradient_angle     in number default null,
    p_animation                in varchar2 default null,
    --
    p_color_scheme             in varchar2 default null,
    p_color_scheme_level       in varchar2 default null,
    p_hatch_pattern            in varchar2 default null,
    p_custom_colors            in varchar2 default null,
    p_set_undef_colors         in varchar2 default null,
    p_undef_color_scheme       in varchar2 default null,
    p_undef_hatch_pattern      in varchar2 default null,
    p_undef_custom_colors      in varchar2 default null,
    p_bgtype                   in varchar2 default null,
    p_bgcolor1                 in varchar2 default null,
    p_bgcolor2                 in varchar2 default null,
    p_grid_bgtype              in varchar2 default null,
    p_grid_bgcolor1            in varchar2 default null,
    p_grid_bgcolor2            in varchar2 default null,
    p_grid_gradient_angle      in varchar2 default null,
    --
    p_show_hints               in varchar2 default null,
    p_show_names               in varchar2 default null,
    p_show_values              in varchar2 default null,
    p_show_legend              in varchar2 default null,
    p_show_grid                in varchar2 default null,
    p_show_zoom                in varchar2 default null,
    p_show_nav                 in varchar2 default null,
    p_show_marker              in varchar2 default null,
    --
    p_map_source               in varchar2 default null,
    p_map_projection           in varchar2 default null,
    p_map_label_mode           in varchar2 default null,
    p_map_region_column        in varchar2 default null,
    p_map_centroid_x           in varchar2 default null,
    p_map_centroid_y           in varchar2 default null,
    p_map_centre               in varchar2 default null,
    --
    p_group_series             in varchar2 default null,
    p_legend_title             in varchar2 default null,
    p_legend_layout            in varchar2 default null,
    p_legend_background        in varchar2 default null,
    p_legend_items             in varchar2 default null,
    p_enable_3d_mode           in varchar2 default null,
    p_values_font_face         in varchar2 default null,
    p_values_font_size         in number default null,
    p_values_font_color        in varchar2 default null,
    p_values_rotation          in number default null,
    p_values_prefix            in varchar2 default null,
    p_values_postfix           in varchar2 default null,
    p_hints_font_face          in varchar2 default null,
    p_hints_font_size          in number default null,
    p_hints_font_color         in varchar2 default null,
    p_legend_font_face         in varchar2 default null,
    p_legend_font_size         in number default null,
    p_legend_font_color        in varchar2 default null,
    p_chart_title_font_face    in varchar2 default null,
    p_chart_title_font_size    in varchar2 default null,
    p_chart_title_font_color   in varchar2 default null,
    p_xml                      in varchar2 default null,
    p_use_xml                  in varchar2 default null,
    p_async                    in varchar2 default null,
    p_async_time               in number default null
    );    
    
procedure fetch_chart_series_attr (
    p_series_id               in number,
    p_chart_id                out number,
    p_series_name             out varchar2,
    p_series_type             out varchar2,
    p_series_required_role    out varchar2,
    p_required_patch          out number,
    p_series_seq              out number,
    p_query                   out varchar2,
    p_query_type              out varchar2,
    p_query_parse_opt         out varchar2,
    p_ajax_items_to_submit    out varchar2,
    p_query_max_rows          out number,
    p_query_no_data_found     out varchar2,
    p_show_action_link        out varchar2,
    p_action_link             out varchar2,
    p_checksum_link           out varchar2,
    p_display_when_cond_type  out varchar2,
    p_display_when_condition  out varchar2,
    p_display_when_condition2 out varchar2
    );
    
 procedure save_chart_series_attr (
    p_chart_id                in number,
    p_series_id               in number default null,
    p_series_name             in varchar2 default null,
    p_series_type             in varchar2 default null,
    p_series_required_role    in varchar2 default null,
    p_required_patch          in number default null,
    p_series_seq              in number default null,
    p_query                   in varchar2 default null,
    p_query_type              in varchar2 default null,
    p_query_parse_opt         in varchar2 default null,
    p_ajax_items_to_submit    in varchar2 default null,
    p_query_max_rows          in number default null,
    p_query_no_data_found     in varchar2 default null,
    p_show_action_link        in varchar2 default 'N',
    p_checksum_link           in varchar2 default null,
    p_display_when_cond_type  in varchar2 default null,
    p_display_when_condition  in varchar2 default null,
    p_display_when_condition2 in varchar2 default null
    );
end wwv_flow_flash_chart5_util;
/
show errors
