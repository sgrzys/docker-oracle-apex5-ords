set define '^'
set verify off
prompt ...wwv_flow_ws_stickies

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ws_stickies.sql
Rem    DESCRIPTION
Rem     
Rem
Rem    NOTES
Rem     
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     mhichwa  04/17/2007 - Created
Rem     madelfio 06/06/2007 - Added comma to show_stickies spec
Rem     cbcho    05/12/2007 - Added p_print,p_body to show_stickies
Rem     cbcho    05/27/2007 - Changed wwv_flow_worksheet_stickies to wwv_flow_ws_stickies




create or replace package wwv_flow_ws_stickies
as
procedure show_stickies (
    p_application_id    in number,
    p_worksheet_id      in number,
    p_session           in number,
    p_row_id            in number,
    p_print             in varchar2 default 'Y',
    p_body_array        out wwv_flow_global.vc_arr2)
    ;
end wwv_flow_ws_stickies;
/
show errors;

