set define '^'
set verify off
prompt ...wwv_flow_flash_chart5


Rem  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_flash_chart5.sql
Rem
Rem    DESCRIPTION
Rem      Flash charting engine for AnyChart5
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    NOTES
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    CUSTOMER MAY CUSTOMIZE
Rem      NO
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem    hfarrell  05/06/2009 - Created. Based on wwv_flow_flash_chart2.sql
Rem    hfarrell  07/04/2009 - Added migrate_flash_to_flash5
Rem    hfarrell  03/09/2010 - Removed migrate_flash_to_flash5 as it has been added to wwv_flow_migrate
Rem    hfarrell  04/11/2010 - Added g_data_clob to output chart data as clob instead of varchar2, and append g_data_clob to chart xml help in g_clob
Rem    hfarrell  04/22/2010 - Added g_region_src_clob to out region source, in support of accessible charts
Rem    hfarrell  04/23/2010 - Added get_accessible_report for generation of accessible chart report: bug 7027389
Rem    hfarrell  05/24/2010 - Fix for bug 7027389: added function get_query_from_function for use in wwv_flow_disp_page_plugs.display_plug_body
Rem    hfarrell  05/25/2010 - Removed exposure of function get_query_from_function, as function being added to plug.plb instead.
Rem    pawolf    05/04/2011 - Added support for quoted/multibyte bind variables (feature 224)
Rem    hfarrell  04/05/2012 - Added show procedure i.e. logic moved from plug.plb render_flash_chart5 to this new procedure
Rem    cneumuel  04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem    pawolf    04/30/2012 - Added "Refresh" dynamic action support for charts (feature #741)
Rem    hfarrell  02/20/2015 - Removed g_data_clob (bug #17589245)

create or replace package wwv_flow_flash_chart5 as

g_max_size_reached   boolean         := false;
g_chart_engine       varchar2(255)   := 'ANYCHART';
g_status             varchar2(32767) := null;
g_clob               clob;
g_region_src_clob    clob;
empty_vc_arr         wwv_flow_global.vc_arr2;
g_dbms_output        sys.dbms_output.chararr;

procedure chart(p_region_id in number default null);

procedure show (
    p_region_id        in number,
    p_region_static_id in varchar2,
    p_region_source    in varchar2 );

function static_xml (
    p_region_id in number
    ) return varchar2;

-----------------------------------------------------------------------------------------------
-- get varchar2 array of report results
-- p_owner:  owner / schema name
-- p_query:  SQL statement 
-- p_report_name: name of chart and series
-- p_format: CSV, HTML or XML
-- p_values: bind values
-- p_max_rows: number of report rows processed
-- p_dbms_output_lines: number of dbms output lines 
    
function get_accessible_report (
    p_owner             varchar2,
    p_query             varchar2,
    p_report_name       varchar2,
    p_format            varchar2 default 'HTML',
    p_max_size          number   default 10000,
    p_max_rows          number   default 10,
    p_limit_type        varchar2 default 'S', -- 'S' for size 'R' for rows
    p_dbms_output_lines number   default 10000,
    p_headers           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_header_align      in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_column_align      in wwv_flow_global.vc_arr2 default empty_vc_arr
) return wwv_flow_global.vc_arr2;

procedure ajax;

end wwv_flow_flash_chart5;
/
show error;
