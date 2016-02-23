set define '^'

set verify off
prompt ...wwv_flow_worksheet_ajax

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_worksheet_ajax.sql
Rem    DESCRIPTION
Rem     Interface to handle worksheet AJAX interactions.
Rem
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbackstr    09/27/2007 - Created
Rem     cbcho       10/05/2007 - Added sort_widget_html
Rem     cbackstr    10/18/2007 - Added ajax call for pulling lov for cell editing
Rem     madelfio    01/03/2008 - Added edit_link to sort_widget_html
Rem     arayner     03/20/2014 - Changes in support of multiple IRR / page (feature #577)
Rem     arayner     03/26/2014 - Exposed clean_column_name and get_lov_json (feature #577)
Rem     arayner     03/27/2014 - Moved get_lov_json from wwv_flow_worksheet_ajax package to wwv_flow_ws_api package


create or replace package wwv_flow_worksheet_ajax as

type col_attr_t is record (
    db_column_name       varchar2(255),
    report_label         varchar2(255),
    column_type          varchar2(255),
    format_mask          varchar2(255),
    computation_expr_1   varchar2(4000));

type col_arr is table of col_attr_t index by binary_integer;

procedure sort_widget(
	p_worksheet_id  in varchar2,
	p_app_user      in varchar2,
	p_report_id     in number,
	p_col			in varchar2 default null,
	p_col_state     in varchar2 default null,
	p_filter		in varchar2 default null
);

procedure uvalues(
	p_worksheet_id  in varchar2,
	p_app_user      in varchar2,
	p_report_id     in number,
	p_col		    in varchar2 default null
);

procedure sort_widget_html(
    p_worksheet     in varchar2 default null,
    p_edit_link     in varchar2 default null);


function clean_column_name (
    p_column_name in varchar2
) return varchar2;
  

procedure widget(
    p_region        in wwv_flow_plugin_api.t_region 
);

end wwv_flow_worksheet_ajax;

/
show errors;
