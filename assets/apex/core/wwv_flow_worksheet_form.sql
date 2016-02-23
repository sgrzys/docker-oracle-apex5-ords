set define '^'
set verify off
prompt ...wwv_flow_worksheet_form

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_worksheet_form.sql
Rem    DESCRIPTION
Rem     Interface to create worksheet form.
Rem
Rem    NOTES
Rem      API to generate worksheet forms based on wwv_flow_worksheet_* tables.
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbcho    09/11/2007 - Created
Rem     cbcho    09/21/2007 - Changed show to accept p_last_page
Rem     cbcho    09/26/2007 - Added p_max_row in procedure show
Rem     cbcho    11/07/2007 - Added get_lov_query
Rem     cbcho    01/14/2008 - Exposed form_navigation to use in AV application 7700
Rem     cbcho    01/15/2008 - Added p_display_button_bar to show
Rem     cbcho    05/15/2008 - Exposed get_column_value, col_value_arr, col_value_arr2, empty_full_col_arr2
Rem     cbcho    07/16/2014 - Removed p_init from form_navigation.  Initialization needs to happen b/f the procedure call (bug #19227507)


create or replace package wwv_flow_worksheet_form
as

type col_value_arr is table of varchar2(32767) index by binary_integer;
type col_value_arr2 is table of varchar2(32767) index by varchar2(255);

empty_full_col_arr2         wwv_flow_worksheet_standard.full_col_arr2;

function get_lov_query (
    p_worksheet_id      in number,
    p_column_id         in number default null,
    p_db_column_name    in varchar2 default null) return varchar2;

procedure get_column_value (
    p_worksheet_id              in number,
    p_app_user                  in varchar2,
    p_row_id                    in varchar2,
    p_ok_column_attributes_by_n in wwv_flow_worksheet_standard.full_col_arr2 default empty_full_col_arr2,
    p_column_value              out col_value_arr,
    p_column_value_by_name      out col_value_arr2);

--
-- wwv_flow_worksheet.get_worksheet_attributes must be called b/f calling this procedure
--    
procedure form_navigation (
    p_worksheet_id     in number,
    p_app_user         in varchar2,    
    p_pk               in varchar2 default null,    
    p_base_report_id   in number   default null,
    p_next_pk          out varchar2,
    p_prev_pk          out varchar2,
    p_row_cnt          out number,
    p_total_row_cnt    out number
    );
        
procedure show (
    p_flow_id            in number,
    p_worksheet_id       in number,
    p_app_user           in varchar2,
    p_row_id             in varchar2 default null,
    p_show_column_edit   in varchar2 default 'N',
    p_show_stickies      in varchar2 default 'Y',
    p_session            in number   default null,    
    p_base_report_id     in number   default null,   
    p_style              in varchar2 default 'REPLACE',
    p_display_button_bar in varchar2 default 'Y'
    );

end wwv_flow_worksheet_form;
/
show errors;

