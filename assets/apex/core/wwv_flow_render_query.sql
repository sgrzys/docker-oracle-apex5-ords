set define '^' verify off
prompt ...wwv_flow_render_query.sql
create or replace package wwv_flow_render_query as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2005 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_render_query.sql
--
--    DESCRIPTION
--
--    MODIFIED   (MM/DD/YYYY)
--    msewtz      01/26/2005 - Created
--    skutz       02/16/2005 - change signature for get report added empty_vcc_arr variable
--    skutz       02/21/2005 - added global g_dbms_output to facilitate output from recursive sql calls
--    msewtz      02/23/2005 - Added p_max_rows and p_dbms_output_lines to limit number of rows and dbms output buffer
--    msewtz      03/03/2005 - changed p_max_rows to p_max_size to support limiting report size by number of bytes
--    skutz       03/18/2005 - added p_max_rows and p_limit_type to get report so it now supports either max size or rows
--    mhichwa     07/20/2005 - Added support for g_max_size_reached global to indicate when a report exceeds its maximum size
--    msewtz      01/04/2008 - Added print_interactive_report
--    madelfio    01/07/2008 - Updated get_report, print_interactive_report to accept column attributes
--    madelfio    02/21/2008 - Added p_content_disposition to print_interactive_report (Bug 6837907)
--    cneumuel    04/18/2012 - Prefix sys objects with schema (bug #12338050)
--    msewtz      12/03/2013 - increased limit of rows in PDF export to 10M (bug 17832836)
--    msewtz      02/27/2014 - Updated escaping of special characters for PDF export when using the APEX Listener (bug 18282188)
--
--------------------------------------------------------------------------------

    g_status varchar2(32767) := null;
    empty_vc_arr                wwv_flow_global.vc_arr2;
    g_dbms_output               sys.dbms_output.chararr;
    g_max_size_reached          boolean := false;
    g_is_api_call               boolean := false;    

    -----------------------------------------------------------------------------------------------
    -- get varchar2 array of report results
    -- p_owner:  owner / schema name
    -- p_query:  SQL statement
    -- p_format: CSV, HTML or XML
    -- p_values: bind values
    -- p_max_rows: number of report rows processed
    -- p_dbms_output_lines: number of dbms output lines

    function get_report (
        p_owner             varchar2,
        p_query             varchar2,
        p_format            varchar2 default 'HTML',
        p_values            in wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_max_size          number   default 10000000,
        p_max_rows          number   default 10,
        p_limit_type        varchar2 default 'S', -- 'S' for size 'R' for rows
        p_dbms_output_lines number   default 10000000,
        p_headers           in wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_header_align      in wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_column_align      in wwv_flow_global.vc_arr2 default empty_vc_arr
    ) return wwv_flow_global.vc_arr2;

    -----------------------------------------------------------------------------------------------
    -- print report results via sys.htp.p or sys.dbms_output
    -- p_owner:  owner / schema name
    -- p_query:  SQL statement
    -- p_format: CSV, HTML or XML
    -- p_output: sys.HTP or sys.DBMS_OUTPUT
    -- p_max_rows: number of report rows processed
    -- p_dbms_output_lines: number of dbms output lines

    procedure print (
        p_owner             varchar2,
        p_query             varchar2,
        p_format            varchar2 default 'HTML',
        p_output            varchar2 default 'DBMS_OUTPUT',
        p_max_size          number   default 10000000,
        p_dbms_output_lines number   default 10000000

    );

    -----------------------------------------------------------------------------------------------
    -- print report results via sys.htp.p or sys.dbms_output
    -- p_owner:  owner / schema name
    -- p_query:  SQL statement
    -- p_format: CSV, HTML or XML
    -- p_output: sys.HTP or sys.DBMS_OUTPUT
    -- p_values: bind values array
    -- p_max_rows: number of report rows processed
    -- p_dbms_output_lines: number of dbms output lines

    procedure print_with_binds (
        p_owner             varchar2,
        p_query             varchar2,
        p_format            varchar2 default 'HTML',
        p_output            varchar2 default 'DBMS_OUTPUT',
        p_values            wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_max_size          number   default 10000000,
        p_dbms_output_lines number   default 10000000

    );

    ----------------------------------------------------------------------------------------------
    -- print_interactive_report

    procedure print_interactive_report (
        p_flow_id       in number,
        p_region_id     in number,
        p_format        in varchar2 default null,
        p_content_disposition in varchar2 default null,
        p_query_text    in varchar2 default null,
        p_query_name    in varchar2 default null,
        p_query_owner   in varchar2 default null,
        p_values        wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_headers       wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_header_align  wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_column_align  wwv_flow_global.vc_arr2 default empty_vc_arr
    );

    ----------------------------------------------------------------------------------------------
    -- get report query

    function get_report_query (
        p_flow_id       in varchar2 default null,
        p_is_api_call   in boolean default false,        
        p_shared_query  in varchar2 default null,
        p_query_name    in varchar2 default null,
        p_query_owner   in varchar2 default null,
        p_sql_stmnts    in wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_xml_structure in varchar2 default null,
        p_layout_id     in number   default null,
        p_layout_type   in varchar2 default null,
        p_layout        in clob     default null,
        p_format        in varchar2 default null,
        p_items         in varchar2 default null,
        p_binds         in wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_values        in wwv_flow_global.vc_arr2 default empty_vc_arr
    ) return blob;

    ----------------------------------------------------------------------------------------------
    -- print_report_query

    procedure print_report_query (
        p_flow_id       in varchar2 default null,
        p_shared_query  in varchar2 default null,
        p_query_name    in varchar2 default null,
        p_query_owner   in varchar2 default null,
        p_sql_stmnts    in wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_xml_structure in varchar2 default null,
        p_layout_id     in number   default null,
        p_layout_type   in varchar2 default null,
        p_layout        in clob     default null,
        p_format        in varchar2 default null,
        p_items         in varchar2 default null,
        p_binds         in wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_values        in wwv_flow_global.vc_arr2 default empty_vc_arr
    );

end wwv_flow_render_query;
/
show err
