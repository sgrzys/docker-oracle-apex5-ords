set define '^'
set verify off
prompt ...wwv_flow_ws_import.sql

Rem wwv_flow_ws_import.sql
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED        (MM/DD/YYYY)
Rem      msewtz 04/11/2007 - Created
Rem    madelfio 09/13/2007 - Added p_alias to create_worksheet_on_table
Rem     jstraub 11/06/2007 - Added f_flow_id to import_csv
Rem    cbcho    05/27/2008 - Changed wwv_flow_worksheet_import to wwv_flow_ws_import
Rem    cbcho    08/05/2008 - Added p_websheet_id to import_csv
Rem    cbcho    08/27/2008 - Exposed is_date
Rem    cbcho    09/16/2008 - Changed is_number
Rem    cbcho    05/28/2009 - Obsoleted import_query_data
Rem    cbcho    10/02/2009 - Added import_text_sections
Rem    cbcho    02/10/2010 - Added p_ws_app_id to import_csv
Rem    cbcho    05/05/2010 - Removed obsolete procedure create_worksheet_on_table
Rem    cbcho    11/18/2010 - Removed is_number from the spec (bug 10270449)


create or replace package wwv_flow_ws_import as

function is_date (
    p_str    in varchar2,
    p_format out varchar2) return boolean;

procedure import_csv (
     p_flow_id            number default null,
     p_ws_app_id          number,
     p_worksheet_id       number,
     p_websheet_id        number,
     p_collection_name    varchar2,
     p_headings_included  varchar2);

procedure import_text_sections (    
    p_ws_app_id           in number,        
    p_webpage_id          in number,
    p_collection_name     in varchar2,
    p_headings_included   in varchar2 default 'Y');
end wwv_flow_ws_import;
/