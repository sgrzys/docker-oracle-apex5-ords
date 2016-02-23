set define '^'
set verify off
prompt ...wwv_flow_worksheet_api

Rem    MODIFIED (MM/DD/YYYY)
Rem     madelfio 07/24/2007 - Created
Rem     madelfio 07/30/2007 - Added APIs for creating worksheets and reports
Rem     madelfio 08/10/2007 - Added show_column_list and save_column_list
Rem     madelfio 08/24/2007 - Updated APIs for use with Audit Vault interface
Rem     jstraub  08/24/2007 - Added APIs for categories
Rem     jstraub  08/24/2007 - Removed session_id from category APIs
Rem     jstraub  08/27/2007 - Added category_id to create_worksheet_report, removed display_sequence from update_category
Rem     cbcho    08/27/2007 - Moved show_column_list to wwv_flow_worksheet_dialogue
Rem     cbcho    08/27/2007 - Added save_ordering
Rem     madelfio 08/28/2007 - Added toggle_filter
Rem     jstraub  08/28/2007 - Added save_derived_report
Rem     madelfio 08/28/2007 - Added add_or_update_filter
Rem     madelfio 09/05/2007 - Added get_search_string and set_search_string
Rem     madelfio 09/12/2007 - Added add_or_update_search_filter and create_ws_col_group
Rem     madelfio 09/12/2007 - Added get_worksheet_id, and p_alias parameter to create_worksheet
Rem     madelfio 09/18/2007 - Changed condition_text to condition_sql
Rem     madelfio 09/24/2007 - Added reset_report_settings
Rem     madelfio 09/27/2007 - Added flashback and rename_report procedures
Rem     madelfio 10/02/2007 - Updated delete_report, add_or_update_highlight takes null highlight name
Rem     cbcho    10/03/2007 - Added create_chart, create_calendar, create_aggregate, create_computation
Rem     jstraub  10/09/2007 - Added p_report_descr to saved_derived_report
Rem     cbcho    10/10/2007 - added p_report_descr to rename_report
Rem     madelfio 10/12/2007 - Added p_flow_id to create_worksheet_column and create_ws_col_group
Rem     madelfio 10/15/2007 - Added get_column_info function
Rem     jstraub  10/23/2007 - Added create_dataview
Rem     madelfio 11/02/2007 - Updated create APIs
Rem     madelfio 11/05/2007 - Removed add_filter (merged into add_or_update_filter)
Rem     madelfio 11/05/2007 - Added view_as_report, view_as_chart, view_as_calendar
Rem     madelfio 11/06/2007 - Added expr2 for filters/highlights
Rem     madelfio 11/29/2007 - Updated aggregate and computation functions
Rem     cbcho    11/29/2007 - Added p_is_default to save_derived_report
Rem     madelfio 12/05/2007 - Added show_column_in_default_report
Rem     madelfio 12/11/2007 - Added new chart columns (for axis titles)
Rem     madelfio 12/19/2007 - Added set_control_breaks, delete_chart
Rem     madelfio 12/20/2007 - Added flow_id, page_id to worksheet_conditions and worksheet_computation inserts
Rem     cbcho    01/03/2008 - Added p_validation_error to add_or_update_computation
Rem     madelfio 01/06/2008 - Added delete_reports_for_user and delete_reports_for_app
Rem     cbcho    01/10/2008 - Added show_single_row_view
Rem     cbcho    01/14/2008 - Added get_form_navigation
Rem     madelfio 01/17/2008 - Added ir_ procedures
Rem     cbcho    01/22/2008 - Added p_validation_error out parameter to set_flashback,add_or_update_highlight
Rem     madelfio 01/23/2008 - Added chart_sorting to wwv_flow_worksheet_rpts
Rem     madelfio 01/24/2008 - Added reset_pagination APIs
Rem     cbcho    02/07/2008 - Added p_old_aggregation to create_aggregate (bug 6802554)
Rem     cbcho    02/11/2008 - Changed save_ordering to save null sorting information too (bug 6802611)
Rem     madelfio 02/14/2008 - Added p_validation_error to add_or_update_filter
Rem     cbcho    06/03/2008 - Exposed get_condition_sql
Rem     cbcho    08/15/2008 - Added p_view_mode to create_worksheet_report
Rem     cbcho    09/30/2008 - Added send_email
Rem     cbcho    10/07/2008 - Added save_group_by
Rem     cbcho    10/08/2008 - Added delete_group_by
Rem     cbcho    10/14/2008 - Changed save_group_by to acccept group by sum
Rem     cbcho    10/17/2008 - Changed save_group_by,delete_group_by to accept p_group_by_id
Rem     cbcho    06/05/2009 - Added save_notify
Rem     cbcho    06/30/2009 - Added delete_notify
Rem     cbcho    07/24/2009 - Added p_end_day, p_end_day_unit to save_notify
Rem     cbcho    07/30/2009 - Added p_filter_type to add_or_update_filter
Rem     cbcho    10/05/2009 - Added p_worksheet_id to ir_filter,ir_reset,ir_clear
Rem     cbcho    10/29/2009 - Added p_default_rpt_type to save_derived_report
Rem     cbcho    11/05/2009 - Added p_report_alias to ir_clear,ir_filter,ir_reset,ir_reset_pagination
Rem     cbcho    11/10/2009 - Added p_time_zone to get_condition_sql
Rem     cbcho    11/13/2009 - Added ir_actions_menu_settings
Rem     cbcho    11/16/2009 - Added p_is_default to delete_report,rename_report. Added p_default_rpt_type to rename_report
Rem     cbcho    11/19/2009 - Added saved_report_exists
Rem     cbcho    11/20/2009 - Added delete_saved_report to call from Manage Saved Report page in f4000
Rem     cbcho    01/05/2010 - Changed add_or_update_filter to accept p_filter_name
Rem     cbcho    01/07/2010 - Added edit_report_alias
Rem     cbcho    01/08/2010 - Added p_validation_error to save_notify
Rem     cbcho    01/12/2010 - Added p_email_subject to save_notify
Rem     cbcho    01/22/2010 - Added ir_delete_report
Rem     cbcho    10/01/2010 - Added p_validation_error to save_group_by (bug 10071156)
Rem     cbcho    10/04/2010 - Added p_validation_error to save_chart (bug 10074067)
Rem     cbcho    10/12/2010 - Added ir_delete_subscription (bug 10185939)
Rem     cbcho    10/15/2010 - Added do_app_substitutions (bug 10198889)
Rem     cbcho    04/24/2012 - Added delete_subscription to remove subscription (feature #549)
Rem     cbcho    05/09/2012 - Moved public procedure ir_filter,ir_reset,ir_clear,ir_delete_report,ir_delete_subscription to wwv_flow_worksheet_util (feature #746)
Rem     cbcho    05/11/2012 - Added *_using_alias to clear, reset, add filter
Rem     cbcho    05/16/2012 - Added get_filter_opterator
Rem     cbcho    07/13/2012 - Added sort_on_group_by_column, save_group_by_sort (feature #1008)
Rem     cbcho    02/05/2013 - Exposed get_primary_report_id (bug 16238360)
Rem     cbcho    05/03/2013 - Changed save_notify to remove obsolete parameters (feature #1041)
Rem     cbcho    06/28/2013 - Changed save_group_by to save additional group by column and functions (feature #548)
Rem     cbcho    09/13/2013 - Added save_pivot, delete_pivot (feature #536)
Rem     cbcho    09/25/2013 - Added new types for pivot (feature #536)
Rem     cbcho    10/07/2013 - Added save_pivot_sort (feature #536)
Rem     cbcho    03/13/2013 - Deprecated clear_worksheet_prefs, get_worksheet_id_to_use
Rem     cbcho    03/27/2014 - Added add_filter_using_item (feature #1402)
Rem     cbcho    03/28/2014 - Added clear_ir (feature #1402)
Rem     arayner  06/30/2014 - Added get_ir_info_from_request (feedback EA2-77)
Rem     cbcho    10/27/2014 - Exposed get_report_id_using_alias
Rem     cbcho    01/07/2015 - Added unsubscribe_email  (bug #20138966)

create or replace package wwv_flow_worksheet_api
is
--
--
--
--  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
--
--    NAME
--      wwv_flow_worksheet_api.sql
--
--    DESCRIPTION
--      Public worksheet APIs.
--
--    RUNTIME DEPLOYMENT: YES
--
--

g_flow_id      number;
g_worksheet_id number;

type t_group_by_function is record (
    function_name   varchar2(255), 
    column_name     varchar2(255),
    column_label    varchar2(4000),
    format_mask     varchar2(255),  
    display_sum     boolean default false);

type t_group_by_function_list is table of t_group_by_function index by binary_integer;
type t_pivot_function_list is table of wwv_flow_worksheet_pivot_agg%rowtype index by binary_integer;
type t_pivot_sort_list is table of wwv_flow_worksheet_pivot_sort%rowtype index by binary_integer;

type t_column_name_list is table of varchar2(255) index by binary_integer;

function get_filter_opterator (
    p_operator_abbr  in varchar2)
    return varchar2;
    
function saved_report_exists (
    p_region_id   in number) return boolean;
    
function get_worksheet_id (
    p_worksheet_alias     in varchar2,
    p_flow_id             in number default null)
return number;

function highlight_expr(
    p_val1 in varchar2,
    p_val2 in varchar2,
    p_expression_type in varchar2,
    p_highlight_rule in number)
return number;

function get_report_name (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number)
return varchar2;

function get_column_info (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2)
return varchar2;

function get_primary_report_id (
    p_worksheet_id in number)
    return number;

function get_report_id_using_alias (
    p_worksheet_id     in number,
    p_report_alias     in varchar2,
    p_region_static_id in varchar2 default null)
    return number;

--------------------
-- USER PREFERENCES
--
procedure reset_pagination (
    p_child_report_id   in number);

procedure reset_pagination (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

------------------
-- SELECT COLUMNS
--
procedure hide_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

procedure show_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

procedure show_column_in_default_report (
    p_worksheet_id        in number,
    p_column              in varchar2);

function get_column_list (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number)
return varchar2;

procedure save_column_list (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_column_list  in wwv_flow_global.vc_arr2);

-----------------------
-- USER DEFINED REPORTS
--
procedure reset_report_settings (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number);

procedure clear_report_settings (
    p_worksheet_id    in number,
    p_app_user        in varchar2,
    p_report_id       in number);

function save_derived_report (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_base_report_id    in number,
    p_report_name       in varchar2 default null,
    p_report_descr      in varchar2 default null,
    p_category_id       in varchar2 default null,
    p_public            in varchar2 default null,
    p_is_default        in varchar2 default null,
    p_default_rpt_type  in varchar2 default 'PRIMARY'
    )
    return number;

procedure rename_report (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    p_report_name       in varchar2 default null,
    p_report_descr      in varchar2 default null,
    p_category_id       in varchar2 default null,
    p_public            in varchar2 default null,
    p_is_default        in varchar2 default null,
    p_default_rpt_type  in varchar2 default 'PRIMARY');

procedure delete_report (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    p_is_default        in varchar2 default null);
    
procedure delete_saved_report (
    p_worksheet_id      in number,    
    p_report_id         in number,
    p_is_default        in varchar2 default null);
    
procedure delete_subscription (
    p_subscription_id     in number,
    p_security_group_id   in number);

procedure unsubscribe_email (
    p_subscription_id     in number,
    p_security_group_id   in number,
    p_email               in varchar2 -- an email or comma separated email list to unsubscribe
    );

procedure edit_report_alias (    
    p_report_id      in number,
    p_report_alias   in varchar2);
    
procedure delete_reports_for_user (
    p_flow_id           in number,
    p_page_id           in number default null,
    p_app_user          in varchar2,
    p_delete_child_rpts in varchar2 default 'Y');

procedure delete_reports_for_app (
    p_flow_id             in number,
    p_page_id             in number default null,
    p_delete_child_rpts   in varchar2 default 'Y',
    p_delete_default_rpts in varchar2 default 'N');

-------------
-- SORTING
--
procedure sort_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_sort_column         in varchar2,
    p_sort_direction      in varchar2);

procedure save_ordering (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in wwv_flow_global.vc_arr2,
    p_sort_direction      in wwv_flow_global.vc_arr2,
    p_null_sorting        in wwv_flow_global.vc_arr2);

procedure sort_on_group_by_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in varchar2,
    p_sort_direction      in varchar2);
        
procedure save_group_by_sort (
    p_id                  in number,
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in wwv_flow_global.vc_arr2,
    p_sort_direction      in wwv_flow_global.vc_arr2,
    p_null_sorting        in wwv_flow_global.vc_arr2);

-----------------
-- CONTROL BREAKS
--
procedure break_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

procedure remove_break_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

procedure toggle_break_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

procedure set_control_breaks (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_break_on            in wwv_flow_global.vc_arr2,
    p_break_enabled_list  in wwv_flow_global.vc_arr2);

-----------
-- FILTERS
--

procedure add_or_update_filter (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    -- filtering
    p_condition_id        in number   default null,
    p_filter_name         in varchar2 default null,   
    p_filter_column       in varchar2 default null,
    p_filter_operator     in varchar2 default '=',
    p_filter_expr_type    in varchar2 default null,
    p_filter_expr         in varchar2 default null,
    p_filter_expr2        in varchar2 default null,
    --
    p_clear_existing_col_filters in varchar2 default 'Y',
    p_filter_type         in varchar2 default 'NORMAL',
    --
    p_validation_error    out varchar2);

procedure clear_filters_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_filter_column       in varchar2);

procedure clear_filter (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_condition_id in number);

procedure toggle_filter (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    --
    p_condition_id      in number,
    p_filter_enabled    in varchar2);

-------------
-- HIGHLIGHTS
--
procedure toggle_highlighting (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    --
    p_condition_id      in number,
    p_highlight_enabled in varchar2);

procedure fetch_highlight (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_condition_id        in number default null,
    p_name                out varchar2,
    -- highlight condition
    p_column              out varchar2,
    p_operator            out varchar2,
    p_expr_type           out varchar2,
    p_expr                out varchar2,
    -- highlight formatting
    p_highlight_sequence  out varchar2,
    p_highlight_enabled   out varchar2,
    p_row_bg_color        out varchar2,
    p_row_font_color      out varchar2,
    p_row_format          out varchar2,
    p_column_bg_color     out varchar2,
    p_column_font_color   out varchar2,
    p_column_format       out varchar2
    );

procedure add_or_update_highlight (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_condition_id        in number   default null,
    p_name                in varchar2 default null,
    -- highlight condition
    p_column              in varchar2,
    p_operator            in varchar2,
    p_expr_type           in varchar2 default null,
    p_expr                in varchar2 default null,
    p_expr2               in varchar2 default null,
    -- highlight settings
    p_highlight_sequence  in varchar2 default null,
    p_highlight_enabled   in varchar2 default 'Y',
    p_highlight_type      in varchar2 default 'ROW',
    -- highlight formatting
    p_bg_color            in varchar2 default null,
    p_font_color          in varchar2 default null,
    p_format              in varchar2 default null,
    p_validation_error    out varchar2
    );


procedure clear_highlight (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_condition_id in number);

--------------
-- AGGREGATES
--
procedure create_aggregate (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_old_aggregation     in varchar2 default null,
    p_aggregate           in varchar2 default null,
    p_column              in varchar2 default null);

procedure remove_aggregate (
    p_worksheet_id    in number,
    p_app_user        in varchar2,
    p_report_id       in number,
    p_aggregate       in varchar2,
    p_column          in varchar2);

----------------
-- COMPUTATIONS
--
procedure add_or_update_computation (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_computation_id      in number default null,
    p_computation_expr    in varchar2 default null,
    p_format_mask         in varchar2 default null,
    p_column_label        in varchar2 default null,
    p_report_label        in varchar2 default null,
    p_validation_error    out varchar2);

procedure fetch_computation (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_computation_id      in number,
    --
    p_computation_expr    out varchar2,
    p_format_mask         out varchar2,
    p_column_label        out varchar2,
    p_report_label        out varchar2);

procedure delete_computation (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_computation_id      in number);

---------------
-- FLASHBACK
--
procedure set_flashback (
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_report_id        in number,
    p_mins_ago         in varchar2,
    p_validation_error out varchar2);

procedure toggle_flashback (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_flashback_enabled in varchar2 default null);

procedure clear_flashback (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);


-------------------
-- CHART / CALENDAR
--
procedure set_report_type (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_report_type  in varchar2);

procedure save_chart (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_chart_type         in varchar2 default null,
    p_chart_label_column in varchar2 default null,
    p_chart_label_title  in varchar2 default null,
    p_chart_value_column in varchar2 default null,
    p_chart_aggregate    in varchar2 default null,
    p_chart_value_title  in varchar2 default null,
    p_chart_sorting      in varchar2 default null,
    --
    p_validation_error   out varchar2);

procedure delete_chart (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

procedure save_calendar (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_calendar_date_column in varchar2,
    p_calendar_display_column in varchar2);

-----------------------------
-- Report / Category Creation
--
procedure create_category (
    p_id                      in varchar2 default null,
    p_worksheet_id            in varchar2 default null,
    p_base_cat_id             in varchar2 default null,
    p_application_user        in varchar2 default null,
    p_name                    in varchar2 default null,
    p_display_sequence        in varchar2 default null);

procedure update_category (
    p_id                      in varchar2 default null,
    p_worksheet_id            in varchar2 default null,
    p_base_cat_id             in varchar2 default null,
    p_application_user        in varchar2 default null,
    p_name                    in varchar2 default null);

procedure delete_category (
    p_id                      in varchar2 default null);

procedure create_worksheet_report (
    p_id                      in number   default null,
    p_worksheet_id            in number   default null,
    p_flow_id                 in number   default null,
    p_page_id                 in number   default null,
    p_session_id              in number   default null,
    p_base_report_id          in number   default null,
    p_application_user        in varchar2 default null,
    p_name                    in varchar2 default null,
    p_description             in varchar2 default null,
    p_report_seq              in varchar2 default null,
    p_report_type             in varchar2 default null,
    p_report_alias            in varchar2 default null,
    p_status                  in varchar2 default null,
    p_category_id             in varchar2 default null,
    p_autosave                in varchar2 default null,
    --
    p_display_rows            in number   default null,
    p_view_mode               in varchar2 default null,
    p_report_columns          in varchar2 default null,
    --
    p_sort_column_1           in varchar2 default null,
    p_sort_direction_1        in varchar2 default null,
    p_sort_column_2           in varchar2 default null,
    p_sort_direction_2        in varchar2 default null,
    p_sort_column_3           in varchar2 default null,
    p_sort_direction_3        in varchar2 default null,
    p_sort_column_4           in varchar2 default null,
    p_sort_direction_4        in varchar2 default null,
    p_sort_column_5           in varchar2 default null,
    p_sort_direction_5        in varchar2 default null,
    p_sort_column_6           in varchar2 default null,
    p_sort_direction_6        in varchar2 default null,
    --
    p_break_on                in varchar2 default null,
    p_break_enabled_on        in varchar2 default null,
    p_control_break_options   in varchar2 default null,
    --
    p_sum_columns_on_break    in varchar2 default null,
    p_avg_columns_on_break    in varchar2 default null,
    p_max_columns_on_break    in varchar2 default null,
    p_min_columns_on_break    in varchar2 default null,
    p_median_columns_on_break in varchar2 default null,
    p_mode_columns_on_break   in varchar2 default null,
    p_count_distnt_col_on_break in varchar2 default null,
    --
    p_flashback_mins_ago      in varchar2 default null,
    p_flashback_enabled       in varchar2 default null,
    --
    p_chart_type              in varchar2 default null,
    p_chart_3d                in varchar2 default null,
    p_chart_label_column      in varchar2 default null,
    p_chart_label_title       in varchar2 default null,
    p_chart_value_column      in varchar2 default null,
    p_chart_aggregate         in varchar2 default null,
    p_chart_value_title       in varchar2 default null,
    p_chart_sorting           in varchar2 default null,
    -- calendar
    p_calendar_date_column    in varchar2 default null,
    p_calendar_display_column in varchar2 default null);

procedure create_ws_report_condition (
    p_id                        in number   default null,
    p_flow_id                   in number   default null,
    p_page_id                   in number   default null,
    p_worksheet_id              in number   default null,
    p_report_id                 in number   default null,
    p_name                      in varchar2 default null,
    p_condition_type            in varchar2 default null,
    p_allow_delete              in varchar2 default null,
    --
    p_column_name               in varchar2 default null,
    p_operator                  in varchar2 default null,
    p_expr_type                 in varchar2 default null,
    p_expr                      in varchar2 default null,
    p_expr2                     in varchar2 default null,
    p_condition_sql             in varchar2 default null,
    p_condition_display         in varchar2 default null,
    --
    p_enabled                   in varchar2 default null,
    --
    p_highlight_sequence        in number   default null,
    p_row_bg_color              in varchar2 default null,
    p_row_font_color            in varchar2 default null,
    p_row_format                in varchar2 default null,
    p_column_bg_color           in varchar2 default null,
    p_column_font_color         in varchar2 default null,
    p_column_format             in varchar2 default null);

procedure create_ws_col_group (
    p_id               in number default null,
    p_flow_id          in number   default null,
    p_worksheet_id     in number default null,
    p_name             in varchar2 default null,
    p_description      in varchar2 default null,
    p_display_sequence in varchar2 default null);
--
--
--
procedure create_dataview (
    p_flow_id                       in varchar2,
    p_tab_owner                     in varchar2,
    p_tabview                       in varchar2,
    p_columns                       in varchar2,
    p_name                          in varchar2,
    p_owner                         in varchar2);

procedure show_single_row_view (
    p_flow_id          in number,
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_row_id           in varchar2 default null,
    p_base_report_id   in number   default null
    );

procedure get_form_navigation (
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_pk               in varchar2 default null,
    p_base_report_id   in number default null,
    p_next_pk          out varchar2,
    p_prev_pk          out varchar2,
    p_row_cnt          out number,
    p_total_row_cnt    out number
    );
    
procedure get_condition_sql (
    p_worksheet_id       in number,
    p_app_user           in varchar2,
    p_derived_report_id  in number,
    p_condition_type     in varchar2 default 'FILTER',
    -- condition
    p_column_name        in varchar2 default null,
    p_operator           in varchar2 default '=',
    p_expr_type          in varchar2 default null,
    p_expr               in out varchar2,
    p_expr2              in out varchar2,
    p_time_zone          out varchar2,
    p_use_bind_for_expr  in varchar2 default 'Y',
    -- parameters to override display settings
    p_display_column     in varchar2 default null,
    p_display_operator   in varchar2 default null,
    p_display_expr       in varchar2 default null,
    p_display_expr2      in varchar2 default null,
    -- output
    p_condition_sql      out varchar2,
    p_condition_name     out varchar2,
    p_validation_error   out varchar2
    );
    
procedure send_email (
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_base_report_id   in number,
    p_to               in varchar2,
    p_cc               in varchar2 default null,
    p_bcc              in varchar2 default null,
    p_subject          in varchar2 default null,
    p_body             in varchar2 default null);
        
procedure save_group_by (
    p_worksheet_id       in number,
    p_app_user           in varchar2,
    p_report_id          in number,
    --                   
    p_group_by_id        in number default null,
    --                   
    p_column_list        in t_column_name_list,
    p_function_list      in t_group_by_function_list,
    --
    p_validation_error   out varchar2
    );
    
procedure delete_group_by (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

procedure save_notify (
    p_worksheet_id    in number,
    p_app_user        in varchar2,
    p_report_id       in number,
    p_notify_id       in number default null,    
    p_email_address   in varchar2 default null,
    p_email_subject   in varchar2 default null,
    p_start_date      in varchar2 default null,
    p_end_date        in varchar2 default null,
    p_notify_interval in varchar2 default null,
    p_validation_error out varchar2);
    
procedure delete_notify (
    p_worksheet_id    in number,
    p_app_user        in varchar2,
    p_report_id       in number,
    p_notify_id       in number default null);

function do_app_substitutions (
    p_string                       in varchar2 default null)
    return varchar2;
    
procedure do_notify;

procedure ir_actions_menu_settings (
    p_settings  in varchar2 default null,
    p_enable_yn in varchar2 default null
    );

procedure ir_reset_pagination (
    p_page_id          in number,
    p_region_static_id in varchar2 default null,
    p_report_alias     in varchar2 default null);

procedure reset_report_using_alias (
    p_page_id          in number,
    p_region_static_id in varchar2 default null,
    p_report_alias     in varchar2 default null);

procedure clear_report_using_alias (
    p_page_id          in number,
    p_region_static_id in varchar2 default null,
    p_report_alias     in varchar2 default null);

procedure add_filter_using_alias (
    p_page_id          in number,
    p_region_static_id in varchar2 default null,
    p_report_alias     in varchar2 default null,
    --
    p_report_column    in varchar2,
    p_filter_value     in varchar2,
    p_operator_abbr    in varchar2 default null
    );

procedure add_filter_using_item (
    p_page_id          in number,
    p_request          in varchar2 default null,
    --
    p_item_name        in varchar2 default null,
    p_item_value       in varchar2 default null
    );

procedure clear_ir (
    p_page_id     in number,
    p_clear_cache in varchar2,
    p_request     in varchar2 default null);

procedure save_pivot (
    p_worksheet_id       in number,
    p_report_id          in number,
    --
    p_pivot_id           in number default null,
    p_pivot_column_list  in t_column_name_list,
    p_row_column_list    in t_column_name_list,
    p_function_list      in t_pivot_function_list,
    --
    p_validation_error   out varchar2
    );

procedure save_pivot_sort (
    p_id                  in number,
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in wwv_flow_global.vc_arr2,
    p_sort_direction      in wwv_flow_global.vc_arr2,
    p_null_sorting        in wwv_flow_global.vc_arr2);
        
procedure delete_pivot (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);
       
procedure get_ir_info_from_request (
    p_request          in varchar2,
    --
    p_region_static_id out varchar2,
    p_report_alias     out varchar2);
           
end wwv_flow_worksheet_api;
/
show errors