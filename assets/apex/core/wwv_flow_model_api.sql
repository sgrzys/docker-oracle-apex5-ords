set define '^'
set verify off

prompt wwv_flow_model_api.sql

Rem    MODIFIED   (MM/DD/YYYY)
Rem     msewtz     03/07/2005 - Created
Rem     msewtz     04/05/2005 - Revised
Rem     msewtz     05/20/2005 - updated copy_model_pages, copying hierachy
Rem     msewtz     06/23/2006 - added get_model_id, deleted incomplete models and returns new model id
Rem     msewtz     10/31/2007 - added p_implementation
Rem     hfarrell   12/10/2007 - modified add_page to include p_master_table and p_detail_table
Rem     hfarrell   01/24/2008 - added set_report_to_report_link procedure
Rem     hfarrell   10/08/2008 - Added parameter p_form_table to add_page, for use in Forms Migrations application generation
Rem     hfarrell   02/16/2009 - Added block_id and report_id to add_page, for use in Forms Conversion application generation, release 3.2
Rem     hfarrell   04/13/2010 - Updated add_page to support charts creation
Rem     jstraub    01/28/2011 - Added p_pk1 and p_pk2 to add_page to support using ROWID for report and form on table
Rem     hfarrell   04/06/2012 - Added p_chart_rendering to add_page (feature #856)
Rem     msewtz     04/08/2012 - Added LISTVIEW and REPORTANDLISTVIEW page types
Rem     hfarrell   12/18/2013 - Added p_page_mode to add_page procedure and function

create or replace package wwv_flow_model_api as


    -----------------------------------------------------------------------------------------------
    -- get_model_id
    -- deletes incomplete models and returns new model ID

    function get_model_id return number;

    -----------------------------------------------------------------------------------------------
    -- add_form_report_w_analysis
    --    p_model_id:         model_id
    --    p_parent_page_num:  parent page
    --    p_owner:            parse as schema name
    --    p_table:            source table for report and form page

    procedure add_form_report_w_analysis (
        p_model_id         varchar2,
        p_page_type        varchar2 default null,
        p_parent_page_num  varchar2 default null,
        p_owner            varchar2 default null,
        p_table            varchar2 default null,
        p_sum_cols         varchar2 default null,
        p_aggregate_cols   varchar2 default null,
        p_agg_function     varchar2 default null,
        p_create_mode      varchar2 default null,
        p_chart_type       varchar2 default null
    );

    -----------------------------------------------------------------------------------------------
    -- add_page, return page_id
    -- p_model_id:        model_id
    -- p_page_name:       name of new page
    -- p_page_type:       page source type: REPORT, REPORTANDFORM, TABULARFORM, FORM, BLANK
    -- p_page_source:     page source type: TABLE, QUERY, SPREADSHEET
    -- p_parent_page_id:  parent page
    -- p_owner:           parse as schema name
    -- p_table:           source table for report and form page
    -- p_query:           source query for report page
    -- p_spreadsheet_data:source data for spreadsheet based table
    -- p_display_column:   display column for list view
    -- p_supp_info_column: supplemental info column for list view
    -- p_report_filter:   report filter
    -- p_form_and_report: flag to determine whether to create report (QUERY) or report and from (UPDATE)
    -- p_implementation:  flag to determine whether to create classic or interactive report
    -- p_master_table:    source table for the 1st page of master-detail form
    -- p_detail_table:    source table for the master-detail page of a master-detail form
    -- p_form_table:      source table for Forms Migrations Form Page generation
    -- p_block_id:        wwv_mig_frm_blocks.id value to identify converted Oracle Forms block
    -- p_report_id:       wwv_mig_rpts.id value to identify converted Oracle Report
    -- p_chart_rendering  chart rendering: FLASH_PREFERRED or SVG_ONLY
    -- p_chart_type:      chart type:2DColumn,3DColumn,Horizontal2DColumn,Horizontal3DColumn,2DPie,2DDoughnut,3DPie,2DLine,GaugeChart
    -- p_chart_title:     chart title
    -- p_chart_query:     source query for chart page
    -- p_x_axis_title:    title for X axis of chart
    -- p_y_axis_title:    title for Y axis of chart
    -- p_page_mode:       mode of the page: NORMAL, MODAL or NON_MODAL

    function add_page (
        p_model_id         varchar2,
        p_page_name        varchar2,
        p_page_type        varchar2,
        p_page_source      varchar2,
        p_parent_page_num  varchar2 default null,
        p_owner            varchar2 default null,
        p_table            varchar2 default null,
        p_pk1              varchar2 default null,
        p_pk2              varchar2 default null,
        p_query            varchar2 default null,
        p_spreadsheet_data varchar2 default null,
        p_display_column   varchar2 default null,
        p_supp_info_column varchar2 default null,        
        p_report_filter    varchar2 default null,
        p_form_and_report  varchar2 default null,
        p_implementation   varchar2 default null,
        p_master_table     varchar2 default null,
        p_detail_table     varchar2 default null,
        p_form_table       varchar2 default null,
        p_block_id         number   default null,
        p_report_id        number   default null,
        p_chart_rendering  varchar2 default null,
        p_chart_type       varchar2 default null,
        p_chart_title      varchar2 default null,
        p_chart_query      varchar2 default null,
        p_x_axis_title     varchar2 default null,
        p_y_axis_title     varchar2 default null,
        p_page_mode        varchar2 default null
    ) return number;

    -----------------------------------------------------------------------------------------------
    -- add_page
    -- p_model_id:        model_id
    -- p_page_name:       name of new page
    -- p_page_type:       page source type: REPORT, REPORTANDFORM, TABULARFORM, FORM, BLANK
    -- p_page_source:     page source type: TABLE, QUERY, SPREADSHEET
    -- p_parent_page_id:  parent page
    -- p_owner:           parse as schema name
    -- p_table:           source table for report and form page
    -- p_query:           source query for report page
    -- p_spreadsheet_data:source data for spreadsheet based table
    -- p_display_column:   display column for list view
    -- p_supp_info_column: supplemental info column for list view
    -- p_report_filter:   report filter
    -- p_form_and_report: flag to determine whether to create report (QUERY) or report and from (UPDATE)
    -- p_implementation:  flag to determine whether to create classic or interactive report
    -- p_master_table:    source table for the 1st page of master-detail form
    -- p_detail_table:    source table for the master-detail page of a master-detail form
    -- p_form_table:      source table for Forms Migrations Form Page generation
    -- p_block_id:        wwv_mig_frm_blocks.id value to identify converted Oracle Forms block
    -- p_report_id:       wwv_mig_rpts.id value to identify converted Oracle Report
    -- p_chart_rendering  chart rendering: FLASH_PREFERRED or SVG_ONLY
    -- p_chart_type:      chart type:2DColumn,3DColumn,Horizontal2DColumn,Horizontal3DColumn,2DPie,2DDoughnut,3DPie,2DLine,GaugeChart
    -- p_chart_title:     chart title
    -- p_chart_query:     source query for chart page
    -- p_x_axis_title:    title for X axis of chart
    -- p_y_axis_title:    title for Y axis of chart
    -- p_page_mode:       mode of the page: NORMAL, MODAL or NON_MODAL

    procedure add_page (
        p_model_id         varchar2,
        p_page_name        varchar2,
        p_page_type        varchar2,
        p_page_source      varchar2,
        p_parent_page_num  varchar2 default null,
        p_owner            varchar2 default null,
        p_table            varchar2 default null,
        p_pk1              varchar2 default null,
        p_pk2              varchar2 default null,
        p_query            varchar2 default null,
        p_spreadsheet_data varchar2 default null,
        p_display_column   varchar2 default null,
        p_supp_info_column varchar2 default null,        
        p_report_filter    varchar2 default null,
        p_form_and_report  varchar2 default null,
        p_implementation   varchar2 default null,
        p_master_table     varchar2 default null,
        p_detail_table     varchar2 default null,
        p_form_table       varchar2 default null,
        p_block_id         number   default null,
        p_report_id        number   default null,
        p_chart_rendering  varchar2 default null,
        p_chart_type       varchar2 default null,
        p_chart_title      varchar2 default null,
        p_chart_query      varchar2 default null,
        p_x_axis_title     varchar2 default null,
        p_y_axis_title     varchar2 default null,
        p_page_mode        varchar2 default null
    );

    -----------------------------------------------------------------------------------------------
    -- set_report_to_report_link
    -- p_report_tables:        Array of 2 table names: parent table and child table
    -- p_owner:                parse as schema name
    -- p_parent_page_num:      parent page

    procedure set_report_to_report_link (
        p_report_tables     wwv_flow_global.vc_arr2,
        p_owner             varchar2,
        p_parent_page_num   varchar2
    );


    -----------------------------------------------------------------------------------------------
    -- copy_model_pages
    -- p_owner:           parse as schema name
    -- p_model_id         new model ID
    -- p_source_model_id  source mode ID

    procedure copy_model_pages (
        p_owner                   varchar2,
        p_model_id                varchar2,
        p_source_model_id         varchar2,
        p_parent_page_id          number default null,
        p_source_parent_page_id   number default null
    );

end;
/
