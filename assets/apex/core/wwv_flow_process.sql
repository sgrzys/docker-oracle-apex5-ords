set define off verify off
prompt ...wwv_flow_process
create or replace package wwv_flow_process as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_process.sql
--
--    DESCRIPTION
--      This package is responsible for handling processes.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    01/04/2011 - Created (feature# 542)
--      cneumuel  06/05/2014 - In has_stateful_process_run, set_stateful_process_run, perform_process: use session state of type wwv_flow_meta_data.c_process_scope for stateful process run state, instead of creating an application item
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================
e_error_occurred exception;

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- get the process state of a stateful process. this returns true if has run or
-- false if it has not run yet.
--==============================================================================
function has_stateful_process_run (
    p_process_id in number )
    return boolean;

--==============================================================================
-- set stateful process state
--==============================================================================
procedure set_stateful_process_run (
    p_process_id in number,
    p_run        in boolean );

--==============================================================================
-- Performs all processes defined for the specified process point
--==============================================================================
procedure perform (
    p_process_point in varchar2 );

--==============================================================================
-- Adds a process error message to the error stack and raises e_error_occurred
-- afterwards. This procedure is public, because it's also used by wwv_flow_item.mru*
--==============================================================================
procedure add_error_message (
    p_process_error    in varchar2,
    p_error            in varchar2,
    p_display_location in varchar2 );

--==============================================================================
procedure add_error_message (
    p_error_code       in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p5                 in varchar2 default null,
    p6                 in varchar2 default null,
    p7                 in varchar2 default null,
    p8                 in varchar2 default null,
    p9                 in varchar2 default null,
    p_display_location in varchar2 );

--==============================================================================
procedure add_error_message (
    p_process_error    in varchar2,
    p_error            in varchar2,
    p_display_location in varchar2,
    p_region_id        in number,
    p_row_num          in number );

--==============================================================================
procedure add_error_message (
    p_error_code       in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p5                 in varchar2 default null,
    p6                 in varchar2 default null,
    p7                 in varchar2 default null,
    p8                 in varchar2 default null,
    p9                 in varchar2 default null,
    p_display_location in varchar2,
    p_region_id        in number,
    p_row_num          in number );

end wwv_flow_process;
/
show errors

set define '^'
