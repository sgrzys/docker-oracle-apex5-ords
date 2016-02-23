set define '^' verify off
prompt ...wwv_flow_app_builder_api
create or replace package wwv_flow_app_builder_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_app_builder_api.sql
--
--    DESCRIPTION
--     Interface to build and manage application components outside of APEX builder.
--
--    NOTES
--      This API is unsupported.    
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    01/30/2013 - Created
--     cbcho    02/13/2013 - Added create_page_computation
--     cbcho    02/19/2013 - Changed create_ir_page to remove p_css_file_urls, p_inline_css
--     cbcho    03/08/2013 - Changed create_ir_page to add p_show_save_public, p_show_subscription
--     cbcho    06/19/2013 - Added edit_page_item, edit_ir_column_label, edit_cr_column_label
--     cbcho    07/15/2013 - Added edit_cr_column
--     cbcho    07/16/2013 - Added display condition parameters in edit_ir_column, edit_cr_column
--     cbcho    07/29/2013 - Removed edit_ir_column_label, edit_cr_column_label
--     cbcho    02/25/2014 - Added p_display_text_as in edit_ir_column
--     cbcho    03/19/2014 - Changed edit_ir_column, edit_cr_column to support editing display type and LOV
--     cbcho    01/16/2015 - Added set_current_theme_style
--
--------------------------------------------------------------------------------

subtype t_ir_column_type is varchar2(10);

c_ir_column_type_string constant t_ir_column_type := 'STRING';
c_ir_column_type_number constant t_ir_column_type := 'NUMBER';
c_ir_column_type_date constant t_ir_column_type := 'DATE';
c_ir_column_type_clob constant t_ir_column_type := 'CLOB';
c_ir_column_type_other constant t_ir_column_type := 'OTHER';

type t_ir_column is record (
    db_column_name     varchar2(255),
    column_type        t_ir_column_type,
    tz_dependent       boolean default false,
    max_length         number,
    column_label       varchar2(4000),
    display_seq        number,
    display_in_report  boolean default true,
    format_mask        varchar2(255),
    column_link        varchar2(4000),
    column_link_text   varchar2(4000),
    column_link_attr   varchar2(4000));
    
type t_ir_column_list is table of t_ir_column index by binary_integer;

function minimum_free_page (
    p_start_page in number default 1)
    return number;
    
function ir_query_changed (
    p_interactive_report_id  in number,
    p_new_query              in varchar2
    ) return boolean;

procedure set_application_id (
    p_application_id in number);
    
procedure get_ir_column_diff (
    p_interactive_report_id in number,
    p_sql_query             in varchar2,
    --
    p_removed_columns       out wwv_flow_global.vc_arr2,
    p_new_columns           out wwv_flow_global.vc_arr2);
        
procedure delete_page (
    p_page_id in number);

procedure create_page_process (
    p_page_id  in number,
    p_sequence in number,
    p_name     in varchar2,
    p_point    in varchar2,
    p_type     in varchar2,
    p_sql      in varchar2);

procedure create_page_computation (
    p_page_id     in number,
    p_sequence    in number,
    p_item_name   in varchar2,
    p_point       in varchar2,
    p_type        in varchar2,
    p_computation in varchar2);
       
procedure create_page_button (
    p_page_id      in number,
    p_sequence     in number,
    p_region_id    in number,
    p_name         in varchar2,
    p_action       in varchar2,
    p_image        in varchar2 default null,
    p_image_alt    in varchar2 default null,
    p_position     in varchar2 default null,
    p_alignment    in varchar2 default null,
    p_redirect_url in varchar2 default null);
 
procedure create_page_branch (
    p_page_id              in number,
    p_sequence             in number,
    p_name                 in varchar2,
    p_type                 in varchar2,
    p_action               in varchar2,
    p_point                in varchar2,
    p_authorization_scheme in varchar2 default null);
    
procedure create_ir_page (
    p_page_id               in number,
    p_user_interface_id     in number,
    p_sql_query             in varchar2,
    p_report_name           in varchar2,
    p_report_description    in varchar2 default null,
    --
    p_columns               in t_ir_column_list,
    --
    p_show_save_public      in boolean default false,
    p_show_subscription     in boolean default false
    );

procedure edit_ir_column (
    p_id                      in number,
    p_page_id                 in number,
    p_interactive_report_id   in number,
    --
    p_display_order           in number   default null,
    p_column_label            in varchar2 default null,
    p_display_in_default_rpt  in varchar2 default null,
    --
    p_heading_alignment       in varchar2 default null,
    --
    p_allow_sorting           in varchar2 default null,
    p_allow_filtering         in varchar2 default null,
    p_allow_highlighting      in varchar2 default null,
    p_allow_ctrl_breaks       in varchar2 default null,
    p_allow_aggregations      in varchar2 default null,
    p_allow_computations      in varchar2 default null,
    p_allow_charting          in varchar2 default null,
    p_allow_group_by          in varchar2 default null,
    p_allow_hide              in varchar2 default null,
    --
    p_display_text_as         in varchar2 default 'ESCAPE_SC',
    p_rpt_show_filter_lov     in varchar2 default null,
    p_rpt_lov                 in varchar2 default null,
    --
    p_format_mask             in varchar2 default null,
    p_column_link             in varchar2 default null,
    p_column_linktext         in varchar2 default null,
    p_column_link_attr        in varchar2 default null,
    --
    p_display_condition_type  in varchar2 default null,
    p_display_condition       in varchar2 default null,
    p_display_condition2      in varchar2 default null
    );
    
procedure edit_ir_query (
    p_interactive_report_id      in number,
    p_page_id                    in number,
    p_region_id                  in number,
    --
    p_sql_query                  in varchar2
    );
    
procedure edit_ir_default_rpt (
    p_interactive_report_id      in number,
    p_page_id                    in number,
    p_region_id                  in number,
    --
    p_report_columns             in varchar2,
    p_sort_col1                  in varchar2 default null,
    p_sort_dir1                  in varchar2 default null,
    p_sort_null1                 in varchar2 default null,
    p_sort_col2                  in varchar2 default null,
    p_sort_dir2                  in varchar2 default null,
    p_sort_null2                 in varchar2 default null,
    p_sort_col3                  in varchar2 default null,
    p_sort_dir3                  in varchar2 default null,
    p_sort_null3                 in varchar2 default null,
    p_sort_col4                  in varchar2 default null,
    p_sort_dir4                  in varchar2 default null,
    p_sort_null4                 in varchar2 default null,
    p_sort_col5                  in varchar2 default null,
    p_sort_dir5                  in varchar2 default null,
    p_sort_null5                 in varchar2 default null,
    p_sort_col6                  in varchar2 default null,
    p_sort_dir6                  in varchar2 default null,
    p_sort_null6                 in varchar2 default null
    );
    
procedure edit_page_item (
    p_page_id             in number,
    p_item_name           in varchar2,
    p_item_label          in varchar2 default null,
    p_label_template_id   in number default null,
    p_width               in number default null,
    p_height              in number default null,
    p_format_mask         in varchar2 default null,
    --
    p_help_text           in varchar2 default null
    );

procedure edit_cr_column (
    p_page_id                 in number,
    p_region_id               in number,
    p_column_alias            in varchar2,
    p_column_label            in varchar2,
    p_heading_alignment       in varchar2 default null,
    --
    p_display_as              in varchar2 default 'ESCAPE_SC',
    p_inline_lov              in varchar2 default null,
    --
    p_display_when_cond_type  in varchar2 default null,
    p_display_when_condition  in varchar2 default null,
    p_display_when_condition2 in varchar2 default null
    );

procedure set_current_theme_style (
    p_theme_number   in number,
    p_theme_style_id in number
    );
end wwv_flow_app_builder_api;
/
show errors;