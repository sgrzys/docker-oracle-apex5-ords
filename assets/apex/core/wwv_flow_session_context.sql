set define '^' verify off
prompt ...wwv_flow_session_context.sql
create or replace package wwv_flow_session_context as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_session_context.sql
--
--    DESCRIPTION
--      Internal API for APEX$SESSION context attributes
--
--      Available context attributes, named after the v() pseudo items:
--
--      * WORKSPACE_ID ..... wwv_flow_security.g_security_group_id
--      * APP_SESSION ...... wwv_flow_security.g_instance
--      * APP_USER ......... wwv_flow_security.g_user
--
--      when any of the right hand side variables change,
--      wwv_flow_session_context APIs to synchronize the context attribute
--      values need to be called.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    07/24/2013 - Created
--    cneumuel    07/26/2013 - Added clear_context
--
--------------------------------------------------------------------------------

c_context constant varchar2(12) := 'APEX$SESSION';

--==============================================================================
-- set WORKSPACE_ID attribute
--==============================================================================
procedure set_workspace_id (
    p_workspace_id in number );

--==============================================================================
-- set SESSION attribute
--==============================================================================
procedure set_session_id (
    p_session_id in number );

--==============================================================================
-- set APP_USER attribute
--==============================================================================
procedure set_user (
    p_user in varchar2 );

--==============================================================================
-- clear the context
--==============================================================================
procedure clear_context;

end wwv_flow_session_context;
/
show err

