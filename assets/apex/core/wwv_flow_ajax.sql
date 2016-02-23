set define '^'

set verify off
prompt ...wwv_flow_ajax

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ajax.sql
Rem    DESCRIPTION
Rem     Interface to handle worksheet AJAX interactions.
Rem
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbackstr    05/03/2007 - Created
Rem     madelfio    07/30/2007 - Added p_app_user and p_report_id parameters to sort_widget
Rem     jkallman    10/30/2007 - Add p_separator to json_from_items, correct parameter name in json_from_string
Rem     madelfio    01/11/2008 - Added p_aliases parameter to json_from_sql
Rem     pawolf      04/10/2009 - Removed sort_widget_html
Rem     jstraub     11/30/2009 - Added p_cursor to json_from_sql to support WWV_FLOW_REST
Rem     cbcho       01/19/2012 - Removed print_widget_debug (bug 13596323)
Rem     cbcho       05/22/2013 - Changed json_from_sql to accept p_escape_columns to render LOV display value based on column display type (bug #16700362)

create or replace package wwv_flow_ajax as

empty_vc_arr wwv_flow_global.vc_arr2;
empty_vc_map wwv_flow_global.vc_map;

function json_replace(
    p_text     in varchar2 default null
)return varchar2;

procedure json_from_array (
    p_rows   in number default null,
    p_cols   in number default null,
    p_name01 in varchar2 default null,
    p_name02 in varchar2 default null,
    p_name03 in varchar2 default null,
    p_name04 in varchar2 default null,
    p_name05 in varchar2 default null,
    p_name06 in varchar2 default null,
    p_name07 in varchar2 default null,
    p_name08 in varchar2 default null,
    p_name09 in varchar2 default null,
    p_name10 in varchar2 default null,
    p_f01    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f02    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f03    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f04    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f05    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f06    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f07    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f08    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f09    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f10    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_sub    in varchar2 default 'N');

procedure json_from_sql (
    sqlq                  in varchar2 default null,
    p_cursor              in integer  default null,
    p_sub                 in varchar2 default 'N',
    p_owner               in varchar2 default null,
    p_do_worksheet_binds  in varchar2 default 'N',
    p_aliases             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_escape_columns      in wwv_flow_global.vc_map default empty_vc_map
);

procedure json_from_items(
    p_items      in varchar2 default null,
    p_separator  in varchar2 default ':',
    p_sub        in varchar2 default 'N'
);

procedure json_from_string(
    p_items      in varchar2 default null,
    p_separator  in varchar2 default ':',
    p_sub        in varchar2 default 'N'
);

procedure ajax_collection(
	p_collection    in varchar2 default null,
	p_action		in varchar2 default null,
	p_format		in varchar2 default null,
	p_item			in varchar2 default null
);

procedure widget;

end wwv_flow_ajax;
/
show errors;
