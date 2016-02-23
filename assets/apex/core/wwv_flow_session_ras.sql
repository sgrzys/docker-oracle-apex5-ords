set define '^' verify off
prompt ...wwv_flow_session_ras.sql
create or replace package wwv_flow_session_ras as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_session_ras.sql
--
--    DESCRIPTION
--      Internal API for Real Application Security session integration
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    07/16/2013 - Created
--    cneumuel    07/17/2013 - Removed dependencies on wwv_flow_session, wwv_flow_sessions$ and wwv_flow_authentications
--    cneumuel    08/26/2013 - made create_session private and renamed assign_user to create_session_and_assign_user, to create the session on assign because RAS does not support nested calls (feature #1152)
--    cneumuel    10/10/2014 - Added destroy_session, for after delete trigger on wwv_flow_sessions$
--
--------------------------------------------------------------------------------

subtype t_sessionid        is raw(16);
subtype t_mode             is pls_integer range 0..2;
subtype t_dynamic_roles_v2 is varchar2(4000);
subtype t_namespaces_v2    is varchar2(4000);

c_mode_disabled            constant t_mode := 0;
c_mode_external            constant t_mode := 1;
c_mode_internal            constant t_mode := 2;

--==============================================================================
-- return whether RAS is enabled at instance level
--==============================================================================
function is_enabled_for_instance
    return boolean;

--==============================================================================
-- return whether RAS is enabled for the request
--==============================================================================
function is_enabled
    return boolean;

--==============================================================================
-- initialize RAS mode globals, based on authentication scheme
--==============================================================================
procedure init_authentication_globals (
    p_mode                 in t_mode,
    p_dynamic_roles        in t_dynamic_roles_v2,
    p_namespaces           in t_namespaces_v2 );

--==============================================================================
-- return dynamic roles that were previously set with init_authentication_globals
--==============================================================================
function get_dynamic_roles
    return wwv_flow_t_varchar2;

--==============================================================================
-- makes p_sessionid the current RAS session
--==============================================================================
procedure init_session (
    p_sessionid            in t_sessionid );

--==============================================================================
-- return the current RAS session
--==============================================================================
function get_session
    return t_sessionid;

--==============================================================================
-- set inactivity timeout in the current RAS session, based on APEX session
--==============================================================================
procedure set_inactivity_timeout (
    p_apex_idle_timeout_on in date,
    p_apex_life_timeout_on in date );

--==============================================================================
-- assign user to the current RAS session
--==============================================================================
function create_session_and_assign_user (
    p_username             in varchar2 )
    return t_sessionid;

--==============================================================================
-- destroy RAS session, called from wwv_flow_sessions$ delete trigger
--==============================================================================
procedure destroy_session (
    p_sessionid            in t_sessionid );

--==============================================================================
-- return whether the given role is active in the RAS session
--==============================================================================
function is_role_enabled (
    p_role_name            in varchar2 )
    return boolean;

end wwv_flow_session_ras;
/
show err

