set define '^' verify off
prompt ...wwv_dbms_sql
create or replace package sys.wwv_dbms_sql authid current_user as
--------------------------------------------------------------------------------
--
--    MODIFIED   (MM/DD/YYYY)
--      jkallman  01/28/2008 - Created
--      mhichwa   01/30/2008 - Added procedure parse_as_user and open cursor
--      sspadafo  01/30/2008 - Make package invoker's rights
--      jkallman  01/31/2008 - Change parse_as_user arguments to take username and not id, remove open_cursor
--      jkallman  02/04/2008 - Change all names and values arrays to be of type sys.wwv_dbms_sql.vc_arr2
--      jkallman  03/15/2010 - Added function is_ws_query_valid
--      jstraub   03/24/2010 - Removed is_ws_query_valid
--      jkallman  03/30/2010 - Added procedure kill_session
--      hfarrell  04/05/2011 - Fix for bug 7048187: replaced all occurrences of varchar2s with varchar2a
--      jstraub   11/23/2011 - Added back signatures for run_ddl and parse_as_user with varchar2s for 3.2 compat (bug 13415471)
--      pawolf    12/22/2011 - Added clear/get_error_backtrace to remove dependency to wwv_flow_error package
--      pawolf    01/10/2012 - Added new parameters to select_vc, select_num and select_date (bug# 13576517)
--      cneumuel  05/08/2012 - Removed get_userid, valueof_vc, valueof_num, valueof_date, func_returning_cursor
--      cneumuel  06/25/2012 - Added back get_userid, valueof_vc, valueof_num, valueof_date, func_returning_cursor with dummy implementations, to avoid errors in APEX_030200
--      cneumuel  02/08/2013 - get_parallel_requests: function returns v$session info for requests to a workspace. In kill_session: added p_reason (bug #15893138)
--      cneumuel  02/25/2013 - In get_parallel_requests: use wwv_flow_gv$session, removed event column (bug #15893138)
--      cneumuel  06/26/2013 - Obsoleted parse_as_user(varchar2s), run_ddl(varchar2s)
--      cneumuel  07/17/2013 - Added get_error_statement
--      cneumuel  05/05/2014 - Replaced wwv_flow_gv$session with sys.gv_$session
--      cneumuel  11/04/2014 - Added get_version_identifier (feature #1153)
--      cneumuel  01/15/2015 - Added overloaded get_parallel_requests (bug #20364030)
--
--------------------------------------------------------------------------------

type vc_arr2 is table of varchar2(32767) index by binary_integer;

type t_workspace_session_info is record (
    sid               sys.gv_$session.sid%type,
    serial#           sys.gv_$session.serial#%type,
    client_identifier sys.gv_$session.client_identifier%type,
    action            sys.gv_$session.action%type,
    last_call_et      sys.gv_$session.last_call_et%type );
type t_workspace_session_info_tab is table of t_workspace_session_info index by binary_integer;

c_empty_vc_arr2 vc_arr2;

--==============================================================================
function get_version_identifier
    return varchar2;

--==============================================================================
procedure parse_as_user (
    p_cursor    in integer,
    p_query     in varchar2,
    p_username  in varchar2,
    p_use_roles in boolean default FALSE);

--==============================================================================
procedure parse_as_user (
    p_cursor    in integer,
    p_statement in sys.dbms_sql.varchar2a,
    p_username  in varchar2,
    p_lfflg     in boolean default FALSE,
    p_use_roles in boolean default FALSE);

--==============================================================================
-- No inputs or outputs -- just execute
-- a block of code,
-- will autobind using GET_BINDS and V() function
--
-- p_sql can be anything except a SELECT (well, it can be
-- a select but nothing will happen if it is)
--==============================================================================
procedure run_block (
    p_sql       in varchar2,
    p_user      in varchar2,
    p_use_roles in boolean default FALSE);

--==============================================================================
-- No outputs -- executes the block of SQL
-- and binds using the p_names table and p_values array.
--
-- p_sql can be anything except a SELECT (well, it can be
-- a select but nothing will happen if it is)
--==============================================================================
procedure run_block (
    p_sql    in    varchar2,
    p_names  in sys.dbms_sql.desc_tab,
    p_values in sys.wwv_dbms_sql.vc_arr2,
    p_user   in varchar2 );


--==============================================================================
-- runs long DDL statements that are stored in the
-- varchar2a table. Usage:
--
-- flows@DEV816> declare
-- 2  x dbms_sql.varchar2a;
-- 3  begin
-- 4     x(1) := 'create table ';
-- 5     x(2) := ' test ( x int )';
-- 6     sys.wwv_dbms_sql.run_ddl( x, 'SCOTT' );
-- 7  end;
-- 8  /
--==============================================================================
procedure run_ddl (
    p_sql    in sys.dbms_sql.varchar2a,
    p_user   in varchar2 );

--==============================================================================
-- No outputs - same as run_block except the bind
-- names are a varchar array and not a dbms_sql
-- data type.  If state is to be preserved then
-- bind vars that change during execution will be
-- written back to the flows session state cache.
--==============================================================================
procedure run_block2 (
    p_sql    in    varchar2,
    p_names  in sys.wwv_dbms_sql.vc_arr2,
    p_values in sys.wwv_dbms_sql.vc_arr2,
    p_user   in varchar2,
    p_preserve_state in boolean default TRUE );

--==============================================================================
-- No outputs - same as run_block except the bind
-- names are a varchar array and not a dbms_sql
-- data type.  If state is to be preserved then
-- bind vars that change during execution will be
-- written back to the flows session state cache.
--==============================================================================
procedure run_block3 (
    p_sql    in varchar2,
    p_names  in sys.wwv_dbms_sql.vc_arr2,
    p_values in sys.wwv_dbms_sql.vc_arr2,
    p_types  in sys.wwv_dbms_sql.vc_arr2,
    p_masks  in sys.wwv_dbms_sql.vc_arr2,
    p_user   in varchar2,
    p_preserve_state in boolean default TRUE );

--==============================================================================
-- No outputs - same as run_block2 but this not specify an outside and
-- binding variables.  This only binds using arrays and does not support
-- autobinds (bind variables directly in the statement but not in the array).
-- State will *not* be preserved.  Thus, any assignments to items or bind variables
-- performed in SQL in run_block4 will not persist.  For now, run_block4
-- should only be used for wwv_flow_dml.insert_row and wwv_flow_dml.update_row.
--==============================================================================
procedure run_block4 (
    p_sql    in    varchar2,
    p_names  in sys.wwv_dbms_sql.vc_arr2,
    p_values in sys.wwv_dbms_sql.vc_arr2,
    p_user   in varchar2 );

--==============================================================================
-- No inputs or outputs -- same as run_block
-- just execute a block of code,
-- will autobind item references if p_auto_bind_items is true and will
-- also bind variables passed with p_names and p_values
--
-- p_sql can be anything except a SELECT (well, it can be
-- a select but nothing will happen if it is)
--
-- If p_auto_bind_items is true then item binds that change during
-- execution will be written back to the flows session state cache.
--==============================================================================
procedure run_block5 (
    p_sql             in varchar2,
    p_auto_bind_items in boolean default true,
    p_names           in sys.wwv_dbms_sql.vc_arr2,
    p_values          in sys.wwv_dbms_sql.vc_arr2,
    p_user            in varchar2 );

--==============================================================================
-- PL/SQL syntax check
-- wraps begin return null; end; around p_sql and executes
-- using run_block
--==============================================================================
function check_plsql (
    p_sql               in varchar2,
        p_flow_id           in number,
        p_security_group_id in number
) return varchar2;

--==============================================================================
-- p_sql should be a query that selects A single row and A single
--  column and that column should be a NUMBER.
-- same as select_num below.
--==============================================================================
function countem( p_sql in varchar2,
                p_user in varchar2 ) return varchar2;

--==============================================================================
-- p_sql should be a query that selects A single row and A single
--  column and that column should be a NUMBER, string or date -- just
-- calll the right function.
--==============================================================================
function select_vc (
    p_sql             in varchar2,
    p_user            in varchar2,
    p_auto_bind_items in boolean default true,
    p_names           in sys.wwv_dbms_sql.vc_arr2 default c_empty_vc_arr2,
    p_values          in sys.wwv_dbms_sql.vc_arr2 default c_empty_vc_arr2 )
    return varchar2;
function select_num (
    p_sql             in varchar2,
    p_user            in varchar2,
    p_auto_bind_items in boolean default true,
    p_names           in sys.wwv_dbms_sql.vc_arr2 default c_empty_vc_arr2,
    p_values          in sys.wwv_dbms_sql.vc_arr2 default c_empty_vc_arr2 )
    return number;
function select_date (
    p_sql             in varchar2,
    p_user            in varchar2,
    p_auto_bind_items in boolean default true,
    p_names           in sys.wwv_dbms_sql.vc_arr2 default c_empty_vc_arr2,
    p_values          in sys.wwv_dbms_sql.vc_arr2 default c_empty_vc_arr2 )
    return date;

--==============================================================================
-- kill the session (p_sid, p_serial#)
--
-- ARGUMENTS
-- * p_sid       sid of the to be killed session
-- * p_serial#   serial# of the to be killed session
-- o p_inst_id   instance id of the to be killed session
-- o p_reason    textual description why the session has to be killed. if not
--               null, this will be logged to the alert file
--==============================================================================
procedure kill_session (
    p_sid     in number,
    p_serial# in number,
    p_inst_id in number   default null,
    p_reason  in varchar2 default null );

--==============================================================================
-- Procedure to clear the current stored error backtrace.
--==============================================================================
procedure clear_error_backtrace;

--==============================================================================
-- Function to get the current stored error backtrace in case
-- of an error. Storing the error backtrace is necessary, because as soon as an
-- exception is handled, dbms_utility.format_error_backtrace returns a
-- wrong result (bug# 13510548).
--==============================================================================
function get_error_backtrace return varchar2;

--==============================================================================
-- Function to get the last statement where parsing raised an error
--==============================================================================
function get_error_statement return varchar2;

--==============================================================================
function get_parallel_requests (
    p_client_info_like in varchar2 )
    return t_workspace_session_info_tab;

--==============================================================================
function get_parallel_requests (
    p_client_identifier in varchar2 )
    return t_workspace_session_info_tab;

--==============================================================================
-- O B S O L E T E
--
-- the following functions are only here to avoid invalid objects in old Apex
-- schemas and must not be used. They just throw runtime errors.
--==============================================================================
function get_userid( p_username in varchar2 ) return int;
function func_returning_cursor( p_sql in varchar2, p_user in varchar2 ) return number;
function valueof_vc( p_sql in varchar2, p_user in varchar2 ) return varchar2;
function valueof_num( p_sql in varchar2, p_user in varchar2 ) return number;
function valueof_date( p_sql in varchar2, p_user in varchar2 ) return date;
procedure parse_as_user (
        p_cursor    in integer,
        p_statement in sys.dbms_sql.varchar2s,
        p_username  in varchar2,
        p_lfflg     in boolean default FALSE,
        p_use_roles in boolean default FALSE);
    procedure run_ddl
        ( p_sql    in sys.dbms_sql.varchar2s,
        p_user   in varchar2 );

end wwv_dbms_sql;
/
show errors
