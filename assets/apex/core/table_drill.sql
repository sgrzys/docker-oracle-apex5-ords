set define '^' verify off
prompt ...wwv_flow_table_drill
create or replace package wwv_flow_table_drill as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2002. All Rights Reserved.
--
--    NAME
--      table_drill.sql
--
--    DESCRIPTION
--      Given owner and table name this package generates report to drill up and drill down 
--      based on the referential integrity.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    09/05/2002 - Created
--     cbcho    09/16/2002 - Added build_view_sql
--     cbcho    09/18/2002 - Added p_include parameter
--     cbcho    09/19/2002 - Added draw_data_model
--     cbcho    09/20/2002 - Added p_type parameter
--     cbcho    02/26/2003 - Bug 2814129: Added p_show_drill in build_sql to conditionally show drill up and drill down links
--     klrice   02/02/2005 - Allow for page to be passed in 
--     cneumuel 06/08/2012 - In build_sql, build_view_sql: added parameters to move code from 4500:{42,46} to package and fix sql injections (bug #14169394)
--
--------------------------------------------------------------------------------

empty_vc_arr wwv_flow_global.vc_arr2;

function build_sql (
    p_owner           varchar2,
    p_to_table        varchar2,
    p_type            varchar2 default 'TABLE',
    p_from_table      varchar2 default null,    
    p_drill           varchar2 default null,
    p_rowid_item_name varchar2 default null,
    p_show_drill      varchar2 default 'Y',
    p_include         varchar2 default null,
    p_where_columns   wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_where_values    wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_where_types     wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_order_columns   wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_order_ascdesc   wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr )
    return varchar2;
    
function build_view_sql (
    p_owner           varchar2,
    p_to_table        varchar2,
    p_type            varchar2 default 'TABLE',
    p_from_table      varchar2 default null,    
    p_drill           varchar2 default null,
    p_rowid_item_name varchar2 default null,
    p_include         varchar2 default null,
    p_where_columns   wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_where_values    wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_where_types     wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_order_columns   wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_order_ascdesc   wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr )
    return varchar2;    

procedure draw_data_model (
    p_owner       in varchar2,
    p_table_name  in varchar2,
    p_session     in number,
    p_page        in varchar2 default null,
    p_request     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_item_oid    in varchar2 default null );
    
end wwv_flow_table_drill;
/
show errors;
