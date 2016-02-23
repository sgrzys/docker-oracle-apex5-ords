set define '^'
set verify off
prompt ...wwv_flow_worksheet_standard

Rem    MODIFIED (MM/DD/YYYY)
Rem     madelfio 04/03/2007 - Created
Rem     mhichwa  04/04/2007 - Added report procedures
Rem     madelfio 04/05/2007 - Added convert_column procedure
Rem     madelfio 04/24/2007 - Added save_as_named_report procedures
Rem     madelfio 05/03/2007 - Updated save_report_ordering to use report_id instead of report_name
Rem     madelfio 05/07/2007 - Replaced save_as_named_report with copy_worksheet_report
Rem     mhichwa  05/07/2007 - added col_heading_num_to_char col_heading_char_to_num
Rem     mhichwa  05/14/2007 - Added bulk update columns
Rem     madelfio 05/16/2007 - Added user_may_view_col and user_may_edit_col functions
Rem     madelfio 05/16/2007 - Updated set_column_filters, added clear_filters_on_column, clear_filter
Rem     madelfio 05/17/2007 - Added save_report_breaks and save_report_agg
Rem     madelfio 05/18/2007 - Added set_column_sort
Rem     mhichwa  05/21/2007 - Added delete_rows
Rem     madelfio 05/25/2007 - Added get_column_label, is_column_filtered, hide_column
Rem     madelfio 05/30/2007 - Added col_attr_t, col_arr and get_pseudocolumn_attributes
Rem     mhichwa  06/11/2007 - Added procedure update_row
Rem     mhichwa  06/12/2007 - Added update_cell and get_cell
Rem     madelfio 06/20/2007 - Added display_as to col_attr_t
Rem     madelfio 07/05/2007 - Added user_may_edit to col_attr_t
Rem     madelfio 07/24/2007 - Removed unneeded APIs (moved to wwv_flow_worksheet_api)
Rem     madelfio 08/16/2007 - Removed set_row_level_privs procedure
Rem     jstraub  08/28/2007 - Added p_category_id to save_derived_report
Rem     madelfio 09/05/2007 - Removed rand and next_val (duplicates of wwv_flow_id versions)
Rem     madelfio 09/27/2007 - Removed functions now in wwv_flow_worksheet_api
Rem     madelfio 10/02/2007 - Added p_create_report_if_necessary to get_report_id
Rem     madelfio 10/08/2007 - Added APIs for computed columns
Rem     cbcho    10/08/2007 - Added p_public to save_derived_report
Rem     jstraub  10/09/2007 - Added p_report_descr to saved_derived_report
Rem     madelfio 10/16/2007 - Changed parameter name for user_may_edit_worksheet
Rem     jstraub  11/05/2007 - Added p_flow_id to create_ws_cols_and_hr_data to handle flow_id not null for worksheet_cols
Rem     madelfio 11/20/2007 - Added get_column_diff, synch_report_columns
Rem     madelfio 11/21/2007 - Added col_arr2 data type
Rem     madelfio 11/27/2007 - Added get_dbms_sql_cursor, and supporting types.  Added is_valid_ir_query
Rem     madelfio 11/28/2007 - Added p_is_default to save_derived_report.  Cleaned up obsolete procedures
Rem     madelfio 11/28/2007 - Added filter_date_ranges to col_attr_t
Rem     cbcho    11/29/2007 - Added default_rpt_settings
Rem     madelfio 12/04/2007 - Added parameter to synch_report_columns
Rem     madelfio 12/07/2007 - Added attributes to col_attr_t to support HTML Expressions and Links
Rem     madelfio 12/11/2007 - Added attributes to col_attr_t to support developer-defined LOVs
Rem     madelfio 12/12/2007 - Added get_group_name
Rem     cbcho    12/17/2007 - Added p_ctrl_break to default_rpt_settings
Rem     madelfio 12/21/2007 - Added show_worksheet_button
Rem     madelfio 01/03/2008 - Added check_computation_expr
Rem     madelfio 01/03/2008 - Added alignment columns to col_attr_t
Rem     cbcho    01/08/2008 - Added p_computed_column_prefix in get_column_label
Rem     madelfio 01/10/2008 - Added full_column collections and updated col_attr_t
Rem     madelfio 01/17/2008 - Added p_show_detail_link to is_valid_ir_query
Rem     madelfio 01/23/2008 - Added chart_sorting column parameters
Rem     madelfio 01/25/2008 - Moved get_column_attributes, get_single_column_attributes here
Rem     madelfio 01/26/2008 - Added p_condition_id to check_highlight
Rem     madelfio 01/27/2008 - Added star schema attributes to col_attr_t
Rem     madelfio 01/29/2008 - Added alternative get_dbms_sql_cursor which returns trimmed query
Rem     madelfio 02/03/2008 - Added get_compute_sql
Rem     madelfio 02/14/2008 - Added g_canonical_date_format
Rem     madelfio 02/15/2008 - Added g_canonical_number_format and g_nls_num_characters
Rem     madelfio 02/20/2008 - Removed 4900-specific procedures (moved a backup copy to trunk/internal_utilities/worksheet)
Rem     madelfio 02/20/2008 - Updated report_label datatype from varchar2(255) to varchar2(4000) in col_attr_t
Rem     madelfio 02/20/2008 - Updated g_canonical_number_format to use '.' instead of 'D' as decimal separator (bug 6827819)
Rem     madelfio 02/20/2008 - Added esc_ir_col_header to support proper column header formatting (Bug 6834893)
Rem     madelfio 02/22/2008 - Added get_condition_name for use in default_rpt_settings
Rem     madelfio 03/30/2008 - Added check for duplicate highlight conditions in check_highlight (bug 6883403)
Rem     madelfio 05/09/2008 - Increased precision and scale of g_canonical_number_format (bug 7032756)
Rem     madelfio 06/05/2008 - Added page_id check for g_running_worksheets_app default value
Rem     cbcho    07/25/2008 - Changed g_attachment_subquery,g_sticky_subquery,g_link_subquery to use new wwv_flow_ws_files,wwv_flow_ws_notes,wwv_flow_ws_links tables
Rem     cbcho    09/29/2008 - Increased precision of g_canonical_number_format to 38 digits on the left
Rem     cbcho    04/29/2009 - Changed get_dbms_sql_cursor p_owner default to null since we do nvl already to wwv_flow_security.g_parse_as_schema. This will make nvl logic on websheet work.
Rem     cbcho    05/15/2009 - Changed g_attachment_subquery,g_sticky_subquery,g_link_subquery to use apex$ table
Rem     cbcho    09/17/2009 - Added page 900 to g_running_worksheets_app and g_ws_data_report_name global
Rem     cbcho    10/01/2009 - Added g_running_ws_report to identify Websheet Reports
Rem     cbcho    10/29/2009 - Added p_new_default_rpt_type,p_new_default_rpt_name to get_report_id
Rem     cbcho    10/29/2009 - Added p_default_rpt_type to save_derived_report
Rem     cbcho    11/05/2009 - Removed default_rpt_settings, no longer display default rpt settings in edit IR
Rem     cbcho    11/05/2009 - Added display_saved_reports
Rem     cbcho    11/06/2009 - Added tz_dependent to col_attr_t
Rem     cbcho    11/19/2009 - Removed display_saved_reports
Rem     cbcho    11/24/2009 - Added check_filter_expr
Rem     cbcho    12/01/2009 - Added all_column_function_disabled
Rem     cbcho    12/16/2009 - Changed get_column_type to get computation column type
Rem     cbcho    12/23/2009 - Removed websheet data section global variable
Rem     pawolf   01/23/2010 - Added named LOV support for IR columns
Rem     cbcho    02/03/2010 - Changed g_running_ws_report to true if running 4900:3000
Rem     jkallman 02/08/2010 - Removed user_may_edit_folder, user_may_edit_webpage
Rem     jkallman 02/17/2010 - Added set_ws_app_date_format
Rem     cbcho    04/12/2010 - Added g_ws_data_section_style for websheet data section
Rem     cbcho    04/16/2010 - Added p_button_class to show_worksheet_button
Rem     cbcho    05/11/2010 - Removed g_ws_data_section_style. Not needed.
Rem     cbcho    05/13/2010 - Added get_row_filter_sql
Rem     pawolf   05/21/2010 - Added is_computed to col_attr_t (bug# 9719272)
Rem     cbcho    07/21/2010 - Added g_pref_rpt_view_mode, p_rpt_view_mode in set_worksheet_prefs (bug 9707701)
Rem     arayner  05/11/2011 - Added p_button_name parameter to show_worksheet_button
Rem     cbcho    05/15/2012 - Added get_ir_security_group_id
Rem     cbcho    07/13/2012 - Added get_group_by_function_label (feature # 1008)
Rem     cbcho    08/17/2012 - Added max_length to col_attr_t (bug 9811459)
Rem     cbcho    03/17/2014 - Moved get_requested_report_id to wwv_flow_worksheet_api (feature #577)
Rem     arayner  03/20/2014 - Changes in support of multiple IRR / page (feature #577)
Rem     arayner  05/02/2014 - Added p_button_icon and p_is_label_visible parameters to show_worksheet_button (feature #1187)
Rem     arayner  07/08/2014 - Added g_tag_alias global
Rem     cbcho    07/09/2014 - Added get_db_column_name to get column name with passed in column ID
Rem     cbcho    09/11/2014 - Removed all_column_function_disabled and added col_header_function_diabled
Rem     arayner  10/28/2014 - Removed p_button_template_id and p_button_link from show_worksheet_button, no longer used (feature #577)
Rem     arayner  02/04/2015 - Changed g_pref_show_rpt_settings to be named g_pref_hide_rpt_settings and corresponding API parameter to set_worksheet_prefs, as this actually tracks hidden state (bug #20468679)
Rem     arayner  02/14/2015 - Added column static ID support (feature #1457)
Rem     cbcho    02/24/2015 - Removed check_computation_expr, check_filter_expr and added merged function check_expr (bug #20554219)
Rem     cbcho    02/24/2015 - Removed get_compute_sql, get_row_filter_sql and added merged function get_sql_from_expr (bug #20554219)
Rem     pawolf   06/17/2015 - Removed link_checksum_type column (bug #21270343)
Rem     cbcho    09/23/2015 - Added replace_col_header_tags (bug #21886782)

create or replace package wwv_flow_worksheet_standard
is
--
--
--
--  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
--
--    NAME
--      wwv_flow_worksheet_standard.sql
--
--    DESCRIPTION
--      Generic worksheet APIs.
--
--    RUNTIME DEPLOYMENT: YES
--
--

    empty_vc_arr wwv_flow_global.vc_arr2;

    type col_attr_t is record (
        id                     number,
        column_expression      varchar2(4000),
        db_column_name         varchar2(255),
        column_alias           varchar2(255),
        column_identifier      varchar2(10),
        report_label           varchar2(4000),
        column_type            varchar2(255),
        format_mask            varchar2(255),
        display_as             varchar2(255),
        display_text_as        varchar2(255),
        display_order          number,
        heading_alignment      varchar2(255),
        column_alignment       varchar2(255),
        max_length             number,
        --
        filter_date_ranges     varchar2(255),
        col_index_in_query     number,
        html_expression        varchar2(4000),
        link                   varchar2(4000),
        linktext               varchar2(4000),
        link_attr              varchar2(4000),
        --
        rpt_distinct_lov       varchar2(1),
        rpt_show_filter_lov    varchar2(1),
        rpt_lov                varchar2(4000),
        rpt_named_lov          varchar2(32767),
        --
        fact_table_key         varchar2(4000),
        dimension_table        varchar2(4000),
        dimension_table_id     varchar2(4000),
        dimension_table_value  varchar2(4000),
        --
        display_condition_type varchar2(255),
        display_condition      varchar2(4000),
        display_condition2     varchar2(4000),
        security_scheme        varchar2(255),
        user_may_view          varchar2(1),
        user_may_edit          varchar2(1),
        show_column            varchar2(1),
        tz_dependent           varchar2(1),
        is_computed            varchar2(1),
        static_id              varchar2(255));

    type col_arr   is table of col_attr_t index by binary_integer;
    type col_arr2  is table of col_attr_t index by varchar2(255);

    type full_col_arr  is table of wwv_flow_worksheet_columns%rowtype index by binary_integer;
    type full_col_arr2 is  table of wwv_flow_worksheet_columns%rowtype index by varchar2(255);

    type bind_arr  is table of varchar2(4000) index by varchar2(30);
    empty_bind_arr        bind_arr;

    g_pref_parent_report_id  number;
    g_pref_show_nulls        varchar2(30);
    g_pref_show_rpt_cols     varchar2(30);
    g_pref_hide_rpt_settings varchar2(30);
    g_pref_rpt_view_mode     varchar2(255);

    type col_privs is table of boolean index by varchar2(30);
    g_empty_col_privs     col_privs;
    g_user_may_view_col   col_privs;
    g_user_may_edit_col   col_privs;

    g_attachment_subquery       varchar2(255) := '(select r.id from dual where exists (select null from apex$_ws_files where row_id = r.id and component_level = ''ROW''))';
    g_sticky_subquery           varchar2(255) := '(select r.id from dual where exists (select null from apex$_ws_notes where row_id = r.id and component_level = ''ROW''))';
    g_link_subquery             varchar2(255) := '(select r.id from dual where exists (select null from apex$_ws_links where row_id = r.id and component_level = ''ROW''))';

    g_attachment_alias          varchar2(30)  := 'acnt';
    g_sticky_alias              varchar2(30)  := 'scnt';
    g_link_alias                varchar2(30)  := 'lcnt';
    g_tag_alias                 varchar2(30)  := 'tags';
    g_value                     varchar2(32767);

    g_running_worksheets_app    boolean := (case when wwv_flow.g_flow_id = 4900 and wwv_flow.g_flow_step_id in (0, 2, 20) then true else false end);   
    g_running_ws_report         boolean := (case when wwv_flow.g_flow_id = 4900 and wwv_flow.g_flow_step_id in (3000) then true else false end);    
    g_ws_app_date_format        varchar2(255);

    g_canonical_date_format     varchar2(255) := 'YYYYMMDDHH24MISS';
    g_canonical_number_format   varchar2(255) := '99999999999999999999999999999999999999.99999999';
    g_nls_num_characters        varchar2(255) := 'NLS_NUMERIC_CHARACTERS=''.,''';

    function get_ir_security_group_id return number;
    
    function col_header_function_diabled (
        p_column_id      in number,
        p_db_column_name in varchar2,
        p_worksheet_id   in number) return boolean;

    function replace_col_header_tags (
        p_string in varchar2)
        return varchar2;
        
    function esc_ir_col_header ( 
        p_string in varchar2) 
        return varchar2;

    ----------------------
    -- get_dbms_sql_cursor
    --
    function get_dbms_sql_cursor(
        p_query              in varchar2,
        p_owner              in varchar2 default null,
        p_do_worksheet_binds in varchar2 default 'N',
        p_bind_array         in bind_arr default empty_bind_arr,
        p_final_query        out varchar2)
        return integer;

    function get_dbms_sql_cursor(
        p_query              in varchar2,
        p_owner              in varchar2 default null,
        p_do_worksheet_binds in varchar2 default 'N',
        p_bind_array         in bind_arr default empty_bind_arr)
        return integer;

    ----------
    -- buttons
    --
    procedure show_worksheet_button (
       p_button_label       in varchar2 default null,
       p_button_attributes  in varchar2 default null,
       p_button_class       in varchar2 default null,
       p_button_name        in varchar2 default null,
       p_button_icon        in varchar2 default null,
       p_is_label_visible   in boolean  default true);


    --------------
    -- preferences
    --
    procedure init_worksheet_prefs (
       p_worksheet_id      in number,
       p_app_user          in varchar2);

    procedure set_worksheet_prefs (
       p_worksheet_id      in number,
       p_app_user          in varchar2,
       p_parent_report_id  in number   default g_pref_parent_report_id,
       p_hide_rpt_settings in varchar2 default g_pref_hide_rpt_settings,
       p_show_nulls        in varchar2 default g_pref_show_nulls,
       p_show_rpt_cols     in varchar2 default g_pref_show_rpt_cols,
       p_rpt_view_mode     in varchar2 default g_pref_rpt_view_mode);

    -------------------------------
    -- column computation functions
    --

    function col_heading_num_to_char (
        p_number       in number)
        return varchar2;

    function col_heading_char_to_num (
        p_char         in varchar2)
        return number;

    function get_next_identifier (
        p_worksheet_id in number)
        return varchar2;

    function get_next_computed_identifier (
        p_worksheet_id in number,
        p_report_id in number)
        return varchar2;

    function get_next_db_column_name (
        p_worksheet_id in number,
        p_column_type  in varchar2)
        return varchar2;

    function get_next_computed_column_name (
        p_worksheet_id in number,
        p_report_id in number)
        return varchar2;

    function get_next_display_order_number (
        p_worksheet_id in number)
        return number;

    function get_pseudocolumn_attributes (
        p_column_alias in varchar2)
        return col_attr_t;

    function get_db_column_name (
        p_worksheet_id in number,
        p_column_identifier in varchar2)
        return varchar2;

    function get_db_column_name (
        p_worksheet_id in number,
        p_report_id    in number,
        p_column_id    in varchar2)
        return varchar2;

    function get_column_label (
       p_worksheet_id           in number,
       p_db_column_name         in varchar2,
       p_computed_column_prefix in varchar2 default null
       ) return varchar2;

    function get_column_type (
       p_worksheet_id   in number,
       p_app_user       in varchar2,
       p_report_id      in number,
       p_db_column_name in varchar2
       ) return varchar2;

    function get_condition_name (
        p_condition_name in varchar2,
        p_column_label   in varchar2,
        p_operator       in varchar2,
        p_expr           in varchar2,
        p_expr2          in varchar2)
        return varchar2;

    procedure get_column_attributes (
        p_worksheet_id          in number,
        p_app_user              in varchar2,
        p_report_id             in number default null,
        --
        p_column_name           in varchar2 default null,
        p_include_hidden_cols   in varchar2 default 'N',
        p_include_computed_cols in varchar2 default 'Y',
        --
        p_column_attributes         out full_col_arr,
        p_column_attributes_by_name out full_col_arr2);
        
    function get_single_column_attributes (
        p_worksheet_id in number,
        p_app_user     in varchar2,
        p_report_id    in number default null,
        --
        p_column_name  in varchar2)
        return wwv_flow_worksheet_columns%rowtype;
    
    function get_group_name (
        p_worksheet_id   in number,
        p_group_id       in number) 
        return varchar2;

    function get_sql_from_expr (
        p_worksheet_id in number,
        p_app_user     in varchar2,
        p_report_id    in number,
        --
        p_expr         in varchar2)
    return varchar2;

    -----------------------------
    -- dialog validations
    --
  
    function check_expr (
        p_worksheet_id     in number,
        p_app_user         in varchar2,
        p_report_id        in number,
        --
        p_expr             in varchar2,
        p_expr_type        in varchar2,
        p_format_mask      in varchar2 default null)
    return varchar2;
    
    function check_flashback_time (
        p_flashback_time in varchar2)
    return varchar2;
    
    function check_highlight (
        p_worksheet_id   in number,
        p_app_user       in varchar2,
        p_report_id      in number,
        --
        p_condition_id   in number,
        p_name           in varchar2,
        p_sequence       in varchar2,
        p_color1         in varchar2,
        p_color2         in varchar2,
        --
        p_column         in varchar2,
        p_operator       in varchar2,
        p_expr           in varchar2,
        p_expr2          in varchar2)
    return varchar2;

    ---------------------
    -- report settings
    --

    function get_report_id (
        p_worksheet_id               in number,
        p_app_user                   in varchar2,
        p_report_id                  in number,
        --
        p_new_default_rpt_type       in varchar2 default 'PRIMARY',
        p_new_default_rpt_name       in varchar2 default null,
        p_create_report_if_necessary in varchar2 default 'Y')
    return number;

    function save_derived_report (
        p_worksheet_id      in number,
        p_app_user          in varchar2,
        p_base_report_id    in number,
        p_report_name       in varchar2 default null,
        p_report_descr      in varchar2 default null,
        p_category_id       in varchar2 default null,
        p_public            in varchar2 default null,
        p_is_default        in varchar2 default null,
        p_default_rpt_type  in varchar2 default 'PRIMARY')
        return number;

    procedure delete_report (
        p_worksheet_id      in number,
        p_app_user          in varchar2,
        p_report_id         in number);

    function is_column_filtered (
        p_worksheet_id        in number,
        p_app_user            in varchar2,
        p_derived_report_id   in varchar2,
        --
        p_filter_column       in varchar2)
        return varchar2;

    --
    -- security checks
    --

    function user_may_edit_worksheet (
        p_worksheet_id in number)
        return boolean;

    function user_may_view_col (
        p_worksheet_id   in number,
        p_app_user       in varchar2,
        p_db_column_name in varchar2)
        return boolean;

    function user_may_edit_col (
        p_worksheet_id   in number,
        p_app_user       in varchar2,
        p_db_column_name in varchar2)
        return boolean;

    procedure get_col_privs (
        p_worksheet_id   in number,
        p_others_may_view  out varchar2,
        p_others_may_edit  out varchar2);

    procedure save_col_privs (
        p_worksheet_id   in number,
        p_others_may_view  in varchar2,
        p_others_may_edit  in varchar2);

    --
    -- sync report columns
    --

    procedure get_column_diff (
        p_flow_id         in  number,
        p_region_id       in  number,
        p_query           in  varchar2,
        p_removed_columns out wwv_flow_global.vc_arr2,
        p_new_columns     out wwv_flow_global.vc_arr2)
        ;

    procedure synch_report_columns (
        p_flow_id   in number,
        p_region_id in number,
        p_query     in varchar2,
        p_add_new_cols_to_default_rpt in varchar2 default 'Y')
        ;

    function is_valid_ir_query (
        p_flow_id   in number,
        p_region_id in number default null,
        p_query     in varchar2,
        p_show_detail_link in varchar2 default null,
        p_pk1       in varchar2 default null,
        p_pk2       in varchar2 default null,
        p_pk3       in varchar2 default null)
    return varchar2;     
    
    procedure set_ws_app_date_format( p_ws_app_id in number );
    
    function get_group_by_function_label (
        p_worksheet_id     in number,
        p_function         in varchar2,
        p_function_column  in varchar2,
        p_label            in varchar2 default null
        ) return varchar2;
     
    function build_ir_dom_id (
        p_id               in varchar2 
    ) return varchar2;
     
end wwv_flow_worksheet_standard;
/
show errors
