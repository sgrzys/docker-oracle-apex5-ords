set define '^' verify off
prompt ...wwv_flow_worksheet_dialogue
create or replace package wwv_flow_worksheet_dialogue as
--------------------------------------------------------------------------------
--
--    NAME
--      wwv_flow_worksheet_dialogue.sql
--
--    MODIFIED   (MM/DD/YYYY)
--      cbcho     08/17/2007 - Created
--      cbcho     08/21/2007 - Added show_highlight, show_filter
--      cbcho     08/23/2007 - Added show_ordering
--      jstraub   08/27/2007 - Added show_save
--      cbcho     09/12/2007 - Changed show_column_list to accept p_column_type
--      cbcho     09/12/2007 - Added show_chart
--      cbcho     09/13/2007 - Added show_calendar, show_delete_confirm
--      cbcho     09/17/2007 - Added show_aggregate
--      cbcho     10/10/2007 - Removed show_rename, added p_save_type to show_save to do rename
--      cbcho     11/30/2007 - Added p_aggregate to show_aggregate
--      cbcho     12/12/2007 - Added show_select_columns
--      cbcho     12/14/2007 - Added show_control_break
--      cbcho     12/17/2007 - Added show_save_default
--      cbcho     01/22/2008 - Added get_valid_sql_functions, show_format_mask
--      cbcho     01/26/2008 - Added get_group_name
--      cbcho     01/26/2008 - Removed get_group_name to use wwv_flow_worksheet_standar.get_group_name instead
--      cbcho     05/19/2008 - Exposed print_button, print_column_lov
--      cbcho     05/20/2008 - Exposed get_pseudo_column_label
--      cbcho     05/28/2008 - Exposed get_column_list
--      cbcho     06/05/2008 - Added print_button2
--      cbcho     07/01/2008 - Extended print_button2 to accept more arguments
--      cbcho     10/06/2008 - Added show_group_by
--      cbcho     10/17/2008 - Changed show_group_by to accept p_group_by_id
--      cbcho     05/28/2009 - Added show_notify
--      cbcho     10/30/2009 - Added p_save_type to show_save_default
--      cbcho     11/24/2009 - Added get_valid_row_filter_operators
--      pawolf    11/23/2010 - Changed return type of get_row_filter_operators 
--      cbcho     07/13/2012 - Added show_group_by_sort (feature #1008)
--      cneumuel  04/26/2013 - Renamed vc4000array to wwv_flow_t_varchar2
--      cbcho     07/08/2013 - Changed print_column_lov to include p_display_null_text (feature #548)
--      cbcho     09/12/2013 - Obsoleted show_calendar
--      cbcho     09/12/2013 - Added show_pivot (feature #536)
--      cbcho     10/04/2013 - Added show_pivot_sort (feature #536)
--      arayner   10/28/2014 - Removed print_button and print_button2, no longer used
--      cbcho     02/24/2015 - Removed get_row_filter_operators function as it is identical as get_sql_functions (bug #20554219)
--
--------------------------------------------------------------------------------

c_max_group_by_columns     constant number := 8;
c_max_pivot_columns        constant number := 3;

function get_sql_functions return wwv_flow_t_varchar2;

function get_pseudo_column_label (
    p_db_column_name in varchar2) return varchar2;

procedure get_column_list (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in varchar2,
    p_type              in varchar2 default null,
    p_display_pseudo_column in varchar2 default 'Y',
    p_column_label      out wwv_flow_global.vc_arr2,
    p_db_column_name    out wwv_flow_global.vc_arr2,
    p_is_displayed      out wwv_flow_global.vc_arr2,
    p_group_id          out wwv_flow_global.vc_arr2,
    p_column_type       out wwv_flow_global.vc_arr2,
    p_column_category   out wwv_flow_global.vc_arr2,
    p_rows              out number);
    
procedure print_column_lov (
    p_worksheet_id            in number,
    p_base_report_id          in number,
    p_derived_report_id       in number,
    p_app_user                in varchar2,
    p_report_columns          in varchar2 default null,
    p_selected_column         in varchar2 default null,
    p_column_type             in varchar2 default null,
    p_dialog_type             in varchar2 default null,
    p_display_computed_column in varchar2 default 'Y',
    p_display_null            in varchar2 default 'Y',
    p_display_null_text       in varchar2 default null,
    p_display_pseudo_column   in varchar2 default 'Y',
    p_include_class           in varchar2 default 'N'    
    );
         
procedure show_format_mask (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in varchar2);

procedure show_column_list (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in varchar2,
    p_column_type  in varchar2 default null);
    
procedure show_select_columns (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in varchar2);
    
procedure save_column_list (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in varchar2,
    p_column_list  in wwv_flow_global.vc_arr2);

procedure show_highlight (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    p_condition_id in varchar2 default null);

procedure show_filter (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    p_condition_id in varchar2 default null);

procedure show_ordering (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

procedure show_group_by_sort (
    p_worksheet_id      in number,
    p_report_id         in number,
    p_app_user          in varchar2
    );
    
procedure show_save (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    p_save_type    in varchar2 default 'SAVE');
    
procedure show_save_default (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    p_save_type    in varchar2 default 'SAVE');    
    
procedure show_chart (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

procedure show_delete (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    p_is_default   in varchar2 default 'N');
    
procedure show_aggregate (
    p_worksheet_id in number,    
    p_app_user     in varchar2,
    p_report_id    in number,
    p_aggregate    in varchar2 default null);
    
procedure show_flashback (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);
    
procedure show_reset (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

procedure show_computation (
    p_worksheet_id   in number,
    p_app_user       in varchar2,
    p_report_id      in number,
    p_computation_id in varchar2 default null);
    
procedure show_download (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);  
    
procedure show_control_break (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);
    
procedure show_group_by (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);
    
procedure show_notify (
    p_worksheet_id  in number,    
    p_app_user      in varchar2,
    p_report_id     in number
    );
    
procedure show_pivot (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);
    
procedure show_pivot_sort (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number
    );   
end  wwv_flow_worksheet_dialogue;
/
show errors
