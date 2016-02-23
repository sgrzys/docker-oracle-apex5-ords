set define '^'
set verify off
prompt ...wwv_flow_process_utility

Rem NAME
Rem      processu.sql
Rem
Rem    SCRIPT ARGUMENTS
Rem      1:
Rem      2:
Rem      3:  Flow Schema Owner
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem      cbcho    04/26/2002 - Created
Rem      cbcho    04/29/2002 - Added multi_row_update_info
Rem      cbcho    04/29/2002 - Added multi_row_update_sql
Rem      cbcho    04/07/2004 - Added get_next_or_prev_pk_sql, get_next_or_prev_pk_info
Rem      cbcho    04/09/2004 - Added p_item_pk2,p_item_next2,p_item_prev2 on get_next_or_prev_pk_sql
Rem      cbcho    04/13/2004 - Added where clause, row count parameters on get_next_prev_pk_sql
Rem      sspadafo 06/09/2004 - Add new parameter p_dml_fetch_mode to dml_row_sql (Bug 3674771)
Rem      jstraub  04/20/2011 - Added p_rv_column to dml_row_sql to support row version column

create or replace package wwv_flow_process_utility as

--  Copyright (c) Oracle Corporation 1999 - 2002. All Rights Reserved.
--
--    DESCRIPTION
--      Flow page level process utility.
--
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--    RUNTIME DEPLOYMENT: YES
--

function dml_row_info (
    p_process_id    in varchar2,
    p_type          in varchar2)
    return varchar2;

function dml_row_sql (
    p_owner            in varchar2,
    p_table_name       in varchar2,
    p_pk_item          in varchar2,
    p_pk_column        in varchar2,
    p_pk_item2         in varchar2 default null,
    p_pk_column2       in varchar2 default null,
    p_rv_column        in varchar2 default null,
    p_allowed_actions  in varchar2 default null,
    p_dml_fetch_mode   in varchar2 default null)
    return varchar2;

function multi_row_update_info (
    p_process_id    in varchar2,
    p_type          in varchar2)
    return varchar2;

function multi_row_update_sql (
    p_owner            in varchar2,
    p_table_name       in varchar2,
    p_pk_column        in varchar2,
    p_pk_column2       in varchar2 default null
    )
    return varchar2;

function set_pref_to_item_info (
    p_process_id    in varchar2,
    p_type          in varchar2)
    return varchar2;

function set_pref_to_item_sql (
    p_preference       in varchar2,
    p_item             in varchar2
    )
    return varchar2;

function get_next_or_prev_pk_info (
    p_process_id    in varchar2,
    p_type          in varchar2)
    return varchar2;

function get_next_or_prev_pk_sql (
    p_owner              varchar2,
    p_table              varchar2,
    p_pk_column          varchar2,
    p_pk_column2         varchar2 default null,
    p_sort_column        varchar2 default null,
    p_sort_column2       varchar2 default null,
    p_item_pk            varchar2 default null,
    p_item_next          varchar2 default null,
    p_item_prev          varchar2 default null,
    p_item_pk2           varchar2 default null,
    p_item_next2         varchar2 default null,
    p_item_prev2         varchar2 default null,
    p_item_row_cnt       varchar2 default null,
    p_where              varchar2 default null)
    return varchar2;
end wwv_flow_process_utility;
/
show errors

