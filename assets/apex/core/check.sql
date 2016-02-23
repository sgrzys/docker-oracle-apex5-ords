set define '^'
set verify off
prompt ...wwv_flow_check

Rem    SCRIPT ARGUMENTS
Rem      none
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   01/26/2000 - Created
Rem      mhichwa   05/23/2001 - Added check condition
Rem      pawolf    05/04/2011 - Removed check_condition, cache_sql and check_cache
Rem      pawolf    05/04/2011 - Added support for quoted/multibyte bind variables (feature 224)


create or replace package wwv_flow_check
as

--  Copyright (c) Oracle Corporation 1999. All Rights Reserved.
--
--    DESCRIPTION
--      Flow utility to check conditions
--
--    SECURITY
--
--    NOTES
--      To improve performance checks are cached to avoid evaluating duplicate checks.
--

function check_cond_plsql_expresion (
    p_condition in varchar2 default null)
    return boolean
    ;

function check_condition_sql_expresion (
    p_condition in varchar2 default null)
    return boolean
    ;
end wwv_flow_check;
/
show errors
