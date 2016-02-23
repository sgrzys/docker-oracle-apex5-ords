set define '^'
set verify off
prompt ...wwv_flow_print_util.sql

Rem  Copyright (c) Oracle Corporation 2006. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_print_util.sql
Rem
Rem    DESCRIPTION
Rem      Engine for Application Express integration with high fidelity printing
Rem
Rem    NOTES
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jstraub    11/27/2006 - Created
Rem      jstraub    11/30/2006 - Removed p_url parameter
Rem      jstraub    12/06/2006 - Changed p_report_data parameter to blob
Rem      msewtz     12/09/2007 - Added p_print_server to convert
Rem      msewtz     12/11/2007 - Added get_header

create or replace package wwv_flow_print_util
as

function convert (
    p_report_data    in blob,
    p_template       in clob,
    p_template_type  in varchar2,
    p_output         in varchar2,
    p_print_server   in varchar2 default null  
) return blob;

function get_header return wwv_flow_global.vc_arr2;

end wwv_flow_print_util;
/

show errors