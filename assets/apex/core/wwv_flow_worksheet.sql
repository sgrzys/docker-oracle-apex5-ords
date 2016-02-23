set define '^'
set verify off
prompt ...wwv_flow_worksheet

Rem  Copyright (c) Oracle Corporation 2007 - 2009. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_worksheet.sql
Rem    DESCRIPTION
Rem     Interface to create data store.
Rem
Rem    NOTES
Rem      API to generate data store components based on wwv_flow_worksheet_* tables.
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbcho    02/28/2007 - Created
Rem     cbcho    04/05/2007 - Changed report and form to use sort and filter information from wwv_flow_worksheet_rpts
Rem     madelfio 04/11/2007 - Added col_attr_t type and col_arr array
Rem     madelfio 04/17/2007 - Added stickies and attachments sections to show_form
Rem     jstraub  04/18/2007 - Increased size of db_column_name to support in-line query
Rem     madelfio 04/19/2007 - Added p_search_string parameter for show_form and form_navigation
Rem     madelfio 04/24/2007 - Added support for named reports
Rem     madelfio 05/04/2007 - Added get_english_filter_expr for human-readable format
Rem     madelfio 05/09/2007 - Added COMPUTED column logic
Rem     madelfio 05/11/2007 - Added g_current_form_row
Rem     msewtz   05/18/2007 - Added break column support and aggregation
Rem     madelfio 05/22/2007 - Added column_alias to col_attr_t
Rem     madelfio 05/22/2007 - Added get_filter_query
Rem     madelfio 05/24/2007 - Replace db_column_name with column_expression and column_alias in col_attr_t
Rem     madelfio 05/25/2007 - Moved get_filter_expr and get_english_filter_expr to wwv_flow_worksheet_expr
Rem     madelfio 05/25/2007 - Added get_pseudocolumn_attributes to move logic out of get_report_column_attributes
Rem     madelfio 05/29/2007 - Moved col_attr_t and col_arr to wwv_flow_worksheet_standard
Rem     madelfio 07/20/2007 - Exposed get_dbms_sql_cursor
Rem     madelfio 08/02/2007 - Updated filter and highlight logic to use new wwv_flow_worksheet_conditions table
Rem     madelfio 08/02/2007 - Updated logic for determining which columns can be edited inline
Rem     madelfio 08/16/2007 - Removed unneeded globals and procedures
Rem     madelfio 08/20/2007 - Added show_full_worksheet_region
Rem     madelfio 09/12/2007 - Cleaned APIs, removed obsolete parameters and local variables, moved some globals to spec to support wwv_flow_worksheet_form
Rem     madelfio 09/18/2007 - Removed obsolete parameters, variables, and functions
Rem     madelfio 09/18/2007 - Added get_select_list, get_single_row_query (for form display)
Rem     madelfio 09/24/2007 - Moved form functions to wwv_flow_worksheet_form
Rem     madelfio 10/08/2007 - Added user-level computed columns
Rem     madelfio 10/08/2007 - Added show_region to support worksheets as new region type
Rem     madelfio 10/25/2007 - Exposed get_worksheet_report_query
Rem     madelfio 10/30/2007 - Added support for max_row_count, cleaned up query generation
Rem     madelfio 11/08/2007 - Support group by in get_worksheet_report_query for charts
Rem     madelfio 11/08/2007 - Updated get_filter_query to limit rows returned, use proper filter syntax
Rem     madelfio 11/21/2007 - Added logic for aggregations as analytic SQL functions
Rem     madelfio 11/27/2007 - Removed get_dbms_sql_cursor, exposed g_binds
Rem     madelfio 12/07/2007 - Added globals for column categories
Rem     madelfio 12/07/2007 - Added p_report_id parameter to get_report_column_attributes
Rem     madelfio 12/10/2007 - Added g_id_postfix
Rem     madelfio 12/10/2007 - Added empty arrays to support reset_globals procedure
Rem     madelfio 12/11/2007 - Added parameter to get_report_column_attributes, and globals
Rem     madelfio 01/07/2007 - Removed unused functions, changed get_report_column_attributes to procedure
Rem     madelfio 01/11/2008 - Added get_all_column_attributes
Rem     madeflio 01/16/2008 - Added p_include_max_row_filter parameter
Rem     madelfio 01/18/2008 - Allow p_columns parameter to be null for get_single_row_query
Rem     madelfio 01/27/2008 - Added p_sql_hint to get_worksheet_report_query
Rem     madelfio 02/22/2008 - Added p_apply_formats to get_worksheet_report_query
Rem     madelfio 02/24/2008 - Added select hidden_cols and exclude_special_formats to get_worksheet_report_query
Rem     cbcho    08/01/2008 - Added p_include_change_count in get_worksheet_report_query
Rem     cbcho    08/15/2008 - Added p_view_mode to show_report
Rem     jstraub  10/01/2008 - Added g_export_clob to implement HTML download email option
Rem     cbcho    07/02/2009 - Exposed reset_globals
Rem     cbcho    07/10/2009 - Added g_notify_in_progress
Rem     cbcho    07/27/2009 - Added g_notify_websheet_id 
Rem     cbcho    10/30/2009 - Added p_show_hidden_search_opt to show_report
Rem     cbcho    11/13/2009 - Added globals to show actions menu dynamically using wwv_flow_worksheet_api.ir_actions_menu_settings
Rem     arayner  02/02/2010 - Added new show_report_and_worksheet_bar procedure for handling report and search bar updates
Rem     arayner  02/02/2010 - Removed show worksheet bar parameter from show_report_and_worksheet_bar procedure
Rem     cbcho    02/26/2010 - Removed p_show_hidden_search_opt
Rem     arayner  04/20/2010 - Added parameter p_region_static_id to show_region
Rem     arayner  04/21/2010 - Added get_report_summary_text
Rem     arayner  04/22/2010 - Extended get_report_summary_text
Rem     cbcho    09/25/2013 - Changed get_worksheet_report_query to accept pivot parameters (feature #536)
Rem     arayner  03/20/2014 - Changes in support of multiple IRR / page (feature #577)
Rem     arayner  04/09/2014 - Added region static ID parameter to show_full_worksheet_region
Rem     arayner  04/25/2014 - Minor tidying

create or replace package wwv_flow_worksheet
as

g_notify_in_progress        boolean := false;
g_delete_in_progress        boolean := false;

g_notify_websheet_id        number := null;

empty_worksheet_attributes  wwv_flow_worksheets%rowtype;
empty_report_attributes     wwv_flow_worksheet_rpts%rowtype;
empty_col_arr               wwv_flow_worksheet_standard.col_arr;
empty_col_arr2              wwv_flow_worksheet_standard.col_arr2;
empty_binds                 wwv_flow_worksheet_standard.bind_arr;

g_worksheet_attributes      wwv_flow_worksheets%rowtype;
g_report_attributes         wwv_flow_worksheet_rpts%rowtype;
g_column_attributes         wwv_flow_worksheet_standard.col_arr;
g_column_attributes_by_name wwv_flow_worksheet_standard.col_arr2;
g_binds                     wwv_flow_worksheet_standard.bind_arr;

g_num_highlight_cols        number := 0;
g_num_link_cols             number := 0;
g_num_break_cols            number := 0;
g_num_visible_cols          number := 0;
g_num_hidden_cols           number := 0;
g_num_aggregate_cols        number := 0;

g_break_col_list            varchar2(32767) := null;

g_base_worksheet_table      varchar2(255) := null;
g_base_worksheet_table_pk1  varchar2(255) := null;
g_base_worksheet_table_pk2  varchar2(255) := null;
g_base_worksheet_table_pk3  varchar2(255) := null;

g_id_postfix                varchar2(255);

g_export_clob               clob;

g_irr_static_id               varchar2(255) := null;

-- Actions Menu Settings
-- This gets set from wwv_flow_worksheet_api.ir_actions_menu_settings
g_ir_show_select_columns      varchar2(1) := null;
g_ir_show_filter              varchar2(1) := null;
g_ir_show_sort                varchar2(1) := null;
g_ir_show_ctrl_break          varchar2(1) := null;
g_ir_show_highlight           varchar2(1) := null;
g_ir_show_computation         varchar2(1) := null;
g_ir_show_aggregate           varchar2(1) := null;
g_ir_show_notify              varchar2(1) := null;
g_ir_show_chart               varchar2(1) := null;
g_ir_show_group_by            varchar2(1) := null;
g_ir_show_flashback           varchar2(1) := null;
g_ir_show_save_report         varchar2(1) := null;
g_ir_show_save_report_public  varchar2(1) := null;
g_ir_show_reset               varchar2(1) := null;
g_ir_show_help                varchar2(1) := null;
g_ir_show_download            varchar2(1) := null;
g_ir_show_download_csv        varchar2(1) := null;
g_ir_show_download_html       varchar2(1) := null;
g_ir_show_download_email      varchar2(1) := null;
g_ir_show_download_xls        varchar2(1) := null;
g_ir_show_download_pdf        varchar2(1) := null;
g_ir_show_download_rtf        varchar2(1) := null;
g_ir_show_download_xml        varchar2(1) := null;


type num_arr is table of number index by binary_integer;


procedure reset_globals;

-- ------------------------------
-- procedures to populate globals
-- 
procedure get_worksheet_attributes (
    p_worksheet_id in number
);

procedure get_report_attributes (
    p_worksheet_id   in number,
    p_app_user       in varchar2,
    p_base_report_id in number
);

-- ----------------------------------------
-- procedure to fetch all column attributes
-- including computed columns for the 
-- specified report
--
procedure get_all_column_attributes (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number default null,
    --
    p_include_hidden_cols in varchar2 default 'N',
    --
    p_column_attributes         out wwv_flow_worksheet_standard.full_col_arr,
    p_column_attributes_by_name out wwv_flow_worksheet_standard.full_col_arr2);

-- ---------------------------
-- functions returning queries
--
function get_filter_query (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number default null,
    p_derived_report_id in number default null,
    p_column            in varchar2,
    p_search_string     in varchar2 default null
) return varchar2;

function get_single_row_query (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_derived_report_id in number,
    --
    p_columns           in varchar2 default null,
    p_pk1               in varchar2,
    p_pk2               in varchar2 default null,
    p_pk3               in varchar2 default null
) return varchar2;

function get_worksheet_report_query (
    p_worksheet_id            in number,
    p_app_user                in varchar2,
    p_report_id               in number,
    -- override query clauses
    p_sql_hint                in varchar2 default 'DEFAULT',
    p_highlight_list          in varchar2 default 'DEFAULT',
    p_pk_columns              in varchar2 default 'DEFAULT',
    p_select_list             in varchar2 default 'DEFAULT',
    p_aggregate_list          in varchar2 default 'DEFAULT',
    p_from                    in varchar2 default 'DEFAULT',
    p_flashback               in varchar2 default 'DEFAULT',
    p_where                   in varchar2 default 'DEFAULT',
    p_group_by                in varchar2 default 'DEFAULT',
    p_order_by                in varchar2 default 'DEFAULT',
    --
    p_pivot_select_list       in varchar2 default null,
    p_pivot                   in varchar2 default null,
    -- other query settings
    p_include_max_row_cnt     in varchar2 default 'N',  -- pass 'Y' to include the total row count as a query column
    p_include_max_row_filter  in varchar2 default 'Y',  -- pass 'Y' to include a stopkey clause
    p_exclude_column          in varchar2 default null, -- pass column name to exclude filters on a column
    p_apply_sql_formats       in varchar2 default 'N',  -- include format masks in SQL?  Used for PDF printing
    p_select_hidden_cols      in varchar2 default 'Y',  -- specifies whether to include hidden columns that are referenced by visible columns
    p_exclude_special_formats in varchar2 default 'N',  -- exclude non-Oracle format mask columns (PCT_GRAPH, IMAGE, etc)
    p_include_change_count    in varchar2 default 'N'   -- include change_count in SQL.  Used to check for concurrency in report and form
    )
return varchar2;

-- -----------------------------------------
-- procedures to display interactive reports
--
procedure show_report (
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_report_id        in number default null,
    --
    p_request          in varchar2,
    p_flow_id          in number default null,
    p_max_rows         in number default null,
    p_view_mode        in varchar2 default null,
    p_search_string    in varchar2 default null,
    --
    p_show_checkbox    in varchar2 default 'N',
    p_show_report_tabs in varchar2 default null
    );

procedure show_full_worksheet_region (
    p_region_static_id in varchar2 default null,
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_report_id        in number default null,
    --
    p_request          in varchar2,
    --
    p_show_checkbox    in varchar2 default 'N',
    p_show_report_tabs in varchar2 default null
    );

procedure show_region (
    p_region_id        in number,
    p_region_static_id in varchar2 default null
    );

procedure show_report_and_worksheet_bar (
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_report_id        in number default null,    
    --
    p_request          in varchar2,
    p_flow_id          in number default null,
    p_max_rows         in number default null,
    p_view_mode        in varchar2 default null,
    p_search_string    in varchar2 default null,
    --
    p_show_checkbox    in varchar2 default 'N',
    p_show_report_tabs in varchar2 default null
    );

function get_report_summary_text (
    p_region                varchar2 default null,
    p_report                varchar2 default null,
    p_view                  varchar2 default null,
    p_displayed_rows_start  varchar2 default null,
    p_displayed_rows_end    varchar2 default null,
    p_total_rows            varchar2 default null
) return varchar2;

 
end wwv_flow_worksheet;
/
show errors;

