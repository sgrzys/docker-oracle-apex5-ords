set define '^'
set verify off
prompt ...wwv_flow_ws_form

Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    SCRIPT ARGUMENTS
Rem      none
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      cbcho     05/15/2008 - Created
Rem      pawolf    01/29/2010 - Added parameter to define if we are in a partial page refresh
Rem      cbcho     04/13/2010 - Added show_manage
Rem      cbcho     04/14/2010 - Added show_actions
Rem      cbcho     04/14/2010 - Added show_column_popup
Rem      cbcho     04/22/2010 - Added p_ws_app_id, p_data_grid_id to show
Rem      cbcho     04/25/2010 - Added p_validation_passed  to show
Rem      cbcho     03/29/2011 - Added p_return_url to show
Rem      cbcho     04/11/2011 - Removed show_manage
Rem      cbcho     01/27/2012 - Changed show_actions to add p_ws_app_id, p_ir_id, p_data_grid_id (bug 13619617)
Rem      cbcho     06/21/2012 - Added p_last_page_id, p_last_section_id to show to link back to websheet page (feature #900)

create or replace package wwv_flow_ws_form
as

procedure show_column_popup (
    p_db_column_name in varchar2,
    p_workspace_id   in number,
    p_worksheet_id   in number);
    
procedure show_actions (
    p_row_id         in number,
    p_ws_app_id      in number default null,
    p_ir_id          in number default null,
    p_data_grid_id   in number default null
    );

procedure show (
    p_ws_app_id            in number,
    p_worksheet_id         in number,
    p_data_grid_id         in number,
    p_app_user             in varchar2,
    p_row_id               in varchar2 default null,
    p_session              in number   default null,
    p_base_report_id       in number   default null,
    p_partial_page_refresh in boolean,
    p_validation_passed    in varchar2 default 'Y', 
    p_last_page_id         in number default null,
    p_last_section_id      in number default null
    );
    
end wwv_flow_ws_form;
/
show errors
