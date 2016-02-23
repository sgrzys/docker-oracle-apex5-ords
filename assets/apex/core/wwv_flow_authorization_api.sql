set define '^' verify off
prompt ...wwv_flow_authorization_api.sql
create or replace package wwv_flow_authorization_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_authorization_api.sql
--
--    DESCRIPTION
--      Public interface to the authorization subsystem.
--
--      This package contains public utility functions for controlling and
--      querying access rights to the application.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/02/2012 - Created
--    cneumuel    06/05/2012 - Added reset_cache, is_authorized
--    cneumuel    07/04/2013 - Added enable_dynamic_groups (feature #1233)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Reset authorization caches for the session and force a re-evaluation when
-- an authorization has to be checked next.
--
-- EXAMPLE
--   apex_util.reset_cache;
--==============================================================================
procedure reset_cache;

--==============================================================================
-- Determine if the current user passes the authorization with name
-- "p_authorization_name". For performance reasons, authorization results are
-- cached, so this function may not always evaluate the authorization when
-- called, but take the result out of the cache (see attribute "Evaluation
-- Point" in the authorization schemes).
--
-- ARGUMENTS
-- * p_authorization_name: The name of an authorization scheme in the
--                         application.
--
-- RETURNS
-- * TRUE if the authorization was successful
-- * FALSE if the authorization was not successful
--
-- EXAMPLE
--   Print the result of the authorization "User Is Admin".
--
--   begin
--       sys.htp.p('User Is Admin: '||
--                 case apex_authorization.is_authorized (
--                          p_authorization_name => 'User Is Admin' )
--                 when true  then 'YES'
--                 when false then 'NO'
--                 else            'null'
--                 end);
--   end;
--==============================================================================
function is_authorized (
    p_authorization_name in varchar2 )
    return boolean;

--==============================================================================
-- Enable groups in the current session. These groups do not have to be created
-- in the Application Express workspace repository, but can for example be
-- loaded from a LDAP repository. Enabling a group that exists in the workspace
-- repository and has other groups granted to it, also enables the granted
-- groups.
--
-- If Real Application Security (available with Oracle 12g) is enabled for the
-- authentication scheme, this enables all dynamic groups as RAS dynamic or
-- external groups (depending whether the group exists in
-- dba_xs_dynamic_roles).
--
-- This procedure can only be called during or right after authentication, e.g.
-- in a post-authentication procedure.
--
-- ARGUMENTS
-- * p_group_names:        table of group names
--
-- EXAMPLE
--   Enable the dynamic groups 'SALES' and 'HR', e.g. from within a post
--   authentication procedure.
--   
--   begin
--       apex_authorization.enable_dynamic_groups (
--           p_group_names => apex_t_varchar2('SALES', 'HR') );
--   end;
--
-- SEE ALSO
-- * View APEX_WORKSPACE_SESSION_GROUPS
-- * View APEX_WORKSPACE_GROUP_GROUPS
--==============================================================================
procedure enable_dynamic_groups (
    p_group_names in wwv_flow_t_varchar2 );

end wwv_flow_authorization_api;
/
show err

