set define '^' verify off
prompt ...wwv_flow_lock
create or replace package wwv_flow_lock as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_lock.sql
--
--    DESCRIPTION
--      This package contains the code related to locks.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cbcho       07/17/2014 - Created
--    cbcho       07/23/2014 - Added steal_lock
--
--------------------------------------------------------------------------------

function script_locked (
    p_flow_id    in number,
    p_script_id  in number
    ) return boolean;

function script_locked_by_user (
    p_flow_id    in number,
    p_script_id  in number
    ) return boolean;

function user_can_edit_script (
    p_flow_id        in number,
    p_script_id      in number,
    p_override       in boolean default false) return boolean;

procedure lock_script (
    p_flow_id   in number,
    p_script_id in varchar2,
    p_comment   in varchar2 default null);

procedure unlock_script (
    p_id        in number,
    p_flow_id   in number);

procedure steal_lock (
    p_flow_id   in number,
    p_script_id in varchar2,
    p_comment   in varchar2 default null);

procedure update_script_lock_comment (
    p_id        in number,
    p_flow_id   in number,
    p_comment   in varchar2);

procedure display_script_lock_info (
    p_flow_id   in number,
    p_script_id in number);

end wwv_flow_lock;
/
show errors
