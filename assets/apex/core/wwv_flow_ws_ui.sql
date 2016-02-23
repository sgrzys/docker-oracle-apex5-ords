set define '^'
set verify off
prompt ...wwv_flow_ws_ui

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ws_ui.sql
Rem    DESCRIPTION
Rem     
Rem
Rem    NOTES
Rem      API used for general UI for WebSheets.
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem    mhichwa   04/10/2007 - Created
Rem    mhichwa   04/17/2007 - Extended show_folders
Rem    cbcho     05/27/2007 - Renamed wwv_flow_worksheet_ui to wwv_flow_ws_ui
Rem    jkallman  02/08/2010 - Removed show_folders, show_breadcrumb
Rem    cbcho     02/18/2011 - Added page_header, menu_bar, control_panel
Rem    shrahman  02/21/2011 - Modified spec for control panel
Rem    cbcho     02/21/2011 - Added p_ws_app_id to page_header
Rem    cbcho     02/22/2011 - Added show_page_900_footer
Rem    cbcho     03/23/2011 - Added p22_* data grid help procedures
Rem    cbcho     03/23/2011 - Removed obsolete procedure show_tabs
Rem    cbcho     03/29/2011 - Added p_data_grid_id to p22_data_grid_list
Rem    cbcho     03/30/2011 - Changed show_breadcrumbs to accept p_current_entry
Rem    cbcho     04/06/2011 - Changed show_breadcrumbs to add p_parent_entry
Rem    cbcho     04/06/2011 - Removed menu_bar, show_page_900_footer
Rem    cbcho     04/26/2011 - Added show_slide_breadcrumbs
Rem    cbcho     05/11/2011 - Added p900_footer
Rem    cbcho     05/13/2011 - Added print_custom_css
Rem    cbcho     06/10/2011 - Added plsql_example
Rem    cbcho     05/25/2012 - Added show_data_grid_menu
Rem    cbcho     06/04/2012 - Added data_grid_sql_help
Rem    cbcho     06/18/2012 - Added show_report_menu (feature #986)
Rem    cbcho     04/17/2013 - Added p201_define_data_grid_columns (feature #1040)


create or replace package wwv_flow_ws_ui
as

procedure page_header (
    p_app_id     in number,
    p_session    in number,
    p_app_user   in varchar2,
    p_ws_app_id  in number);

procedure control_panel (
    p_app_id      in number,
    p_session     in number,
    p_ws_app_id   in number,
    p_ws_page_id  in number);

procedure show_breadcrumbs (
    p_ws_app_id            in number,    
    p_app_session          in number,
    p_page_id              in number,
    p_image_prefix         in varchar2 default null,
    p_parent_entry         in varchar2 default null,
    p_parent_entry_page_id in number default null,
    p_current_entry        in varchar2 default null);
    
procedure show_slide_breadcrumbs (
    p_ws_app_id            in number,    
    p_app_session          in number,
    p_page_id              in number,
    p_image_prefix         in varchar2 default null);    

procedure show_attachments (
    p_ws_app_id   in number,
    p_webpage_id  in number);
    
procedure show_notes (
    p_session     in number,
    p_ws_app_id   in number,
    p_webpage_id  in number);

procedure show_tags (
    p_ws_app_id   in number,
    p_webpage_id  in number);

procedure p22_data_grid_list (
    p_app_id       in number,
    p_app_session  in number,
    p_ws_app_id    in number,
    p_data_grid_id in number);
    
procedure p22_data_grid_columns (
    p_data_grid_id   in number);
    
procedure p22_data_grid_query (
    p_data_grid_id   in number);
    
procedure p900_footer (
    p_app_id          in number default 0,
    p_ws_app_id       in number default 0,
    p_page_id         in number default 0,
    p_app_session     in number default 0
    );    

procedure print_custom_css (
    p_ws_app_id  in number
    );
    
procedure plsql_example;

procedure show_data_grid_menu (
    p_ws_app_id   in number,
    p_app_session in number);

procedure show_report_menu (
    p_ws_app_id   in number,
    p_app_session in number);
        
procedure data_grid_sql_help (
    p_app_id       in number,
    p_app_session  in number,
    p_ws_app_id    in number);
    
procedure p201_define_data_grid_columns;
 
end wwv_flow_ws_ui;
/
show errors;

