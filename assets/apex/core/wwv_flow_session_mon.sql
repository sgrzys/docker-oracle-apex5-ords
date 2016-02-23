set define '^'
set verify off
prompt ...wwv_flow_session_mon


Rem    NAME
Rem      wwv_flow_session_mon.sql
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    tmuth       05/03/2005 - Created
Rem    mhichwa     05/03/2005 - Added p_mode argument to populate_sys_stats_arry procedure
Rem    tmuth       05/13/2005 - Added highlight_plan_ind_cols function
Rem    jkallman    04/13/2012 - Added p_inst_id parameter to populate_stats_array (Feature #906)



create or replace package wwv_flow_session_mon
as
--  Copyright (c) Oracle Corporation 1999 - 2005. All Rights Reserved.
--
--    DESCRIPTION
--      Session monitoring utility package
--
--    SECURITY
--      NOT Publicly executable.
--
--
--    RUNTIME DEPLOYMENT: YES
--

    procedure populate_stats_array(p_sid in number, p_inst_id in number);

    procedure populate_sys_stats_array(p_mode in varchar2 default 'REPORT');
    
    function highlight_plan_ind_cols(
        p_object_owner  in  varchar2,
        p_object_name   in  varchar2,
        p_string        in  varchar2)
    return varchar2;

end wwv_flow_session_mon;
/
show errors

