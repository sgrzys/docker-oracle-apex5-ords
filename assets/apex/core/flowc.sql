set define '^' verify off
prompt ...wwv_flow_cache
create or replace package wwv_flow_cache as
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    DESCRIPTION
--      Flow cache management package.
--
--    NOTES
--      This package contains procedures and functions that
--      maintain and manipulate the flow session cache.
--
--    SECURITY
--      Requires Oracle user executing procedure be granted WWV_FLOW_BUILDER role.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa    08/04/1999 - Created
--      mhichwa    01/02/1999 - Added purge_oldest_sessions
--      mhichwa    02/15/2000 - Added g_purged_sessions
--      mhichwa    03/03/2000 - Added show_session_state
--      mhichwa    03/06/2000 - Removed grant to role (flow role not longer exists)
--      mhichwa    09/28/2001 - Added security group id and comments
--      mhichwa    05/06/2002 - Added p_report_results
--      tmuth      05/23/2002 - Added rebuild_indexes and compute_stats
--      tmuth      05/23/2002 - Added purge_n_rebuild to call:purge_sessions,rebuild_indexes,compute_stats
--      mhichwa    10/20/2002 - Added set_flow_builder_state
--      jstraub    12/01/2011 - Removed purge_oldest_sessions, obsolete
--      jstraub    04/09/2012 - Added purge_oldest_sessions back, used on page 4050:66
--      cneumuel   03/05/2013 - Moved set_flow_builder_state from wwv_flow_cache to wwv_flow_dev
--                            - Removed purge_duplicate_sessions, show_session_state, rebuild_indexes, compute_stats, purge_n_rebuild, set_fb_flow_page_id
--
--------------------------------------------------------------------------------

--==============================================================================
-- Purge flow session state tables to avoid keeping session
-- state no longer needed.  To avoid too much activity this
-- procedure allows you to set a maximum number of sessions
-- you would like to purge.
--
-- Used on 4050:66
--==============================================================================
procedure purge_oldest_sessions (
    p_num_sessions_to_purge     in number default 1000,
    p_purge_sess_older_then_hrs in number default 12,
    p_security_group_id         in number default null);

--==============================================================================
-- Purge flow session state tables to avoid keeping session
-- state no longer needed.  Purge all sessions older then a certain
-- age.  May result in a very large number of delete transactions.
-- Commit is performed between delete commands.
--
-- Used in wwv_flow_admin_api and the ORACLE_APEX_PURGE_SESSIONS job
--==============================================================================
procedure purge_sessions (
    p_purge_sess_older_then_hrs in number default 12,
    p_security_group_id         in number default null,
    p_report_results            in varchar2 default 'NO');

end wwv_flow_cache;
/
show errors
