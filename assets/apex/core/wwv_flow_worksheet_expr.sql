set define '^'
set verify off
prompt ...wwv_flow_worksheet_expr

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_worksheet_expr.sql
Rem
Rem    DESCRIPTION
Rem     Interface to process worksheet expressions.
Rem
Rem    NOTES
Rem      API for handling expressions and computations for worksheets.
Rem
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     madelfio 05/24/2007 - Created
Rem     madelfio 05/30/2007 - Updated get_english_filter_expr to use same logic as get_filter_expr
Rem     jstraub  08/13/2007 - Added highlight_expr
Rem     madelfio 08/30/2007 - Added expr_is_numeric
Rem     madelfio 10/16/2007 - Added get_filter_query
Rem     madelfio 01/16/2008 - Added tokenize function
Rem     madelfio 01/22/2008 - Added validate_comp_expression, removed get_filter_expr
Rem     madelfio 01/25/2008 - Added in_list function for "in" and "not in" operators
Rem     madelfio 02/03/2008 - Updated get_compute_sql to validate column replacements
Rem     cbcho    05/13/2010 - Added get_row_filter_sql
Rem     cbcho    02/24/2015 - Removed get_filter_sql, get_compute_sql, get_compute_sql2 as they are no longer needed (bug #20554219)

create or replace package wwv_flow_worksheet_expr
as

function is_valid_format_mask (
    p_format_mask in varchar2,
    p_string_type in varchar2 default 'BOTH',
    p_allow_since in varchar2 default 'Y')
return boolean;

function tokenize (
    p_expression in varchar2)
return wwv_flow_global.vc_arr2;

function validate_comp_expression (
    p_token_list           in  wwv_flow_global.vc_arr2,
    p_valid_token_list     in  wwv_flow_global.vc_arr2,
    p_allow_literals       in  varchar2 default 'Y',
    p_invalid_token_return out varchar2)
return boolean;

function in_list (
    p_in_expr in varchar2)
return wwv_flow_global.vc_arr2;

function highlight_expr(
    p_val1 in varchar2,
    p_val2 in varchar2,
    p_expression_type in varchar2,
    p_highlight_rule in number)
return number;

end wwv_flow_worksheet_expr;
/
show errors;
