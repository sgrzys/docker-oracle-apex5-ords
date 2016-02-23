set define '^' verify off
prompt ...wwv_flow_login
create or replace package wwv_flow_login as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    DESCRIPTION
--      Logic to login in builder
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    mhichwa     09/23/2004 - Created
--    sspadafo    09/15/2005 - Added xe_login
--    sspadafo    09/27/2005 - Add authenticate, user_is_dba functions
--    cneumuel    04/13/2011 - Add builder_sso_login
--    cneumuel    04/18/2011 - Formatting and header docs
--    cneumuel    09/08/2011 - In builder: added p_login_token
--    cneumuel    04/02/2012 - Added get_workspace_name, removed authenticate, moved user_is_dba to wwv_flow_security
--                           - In builder, administrator: code has been moved to wwv_flow_f4000_plugins.internal_authenticate
--    cneumuel    06/20/2013 - Added change_password_and_log_in (bug #16989871)
--
--------------------------------------------------------------------------------

--==============================================================================
-- return the workspace name with which builder() was called or 'INTERNAL' if
-- administrator() was called.
--==============================================================================
function get_workspace_name
    return varchar2;

--==============================================================================
-- login to p_workspace as p_username with p_password (4550:1, normal builder login)
--==============================================================================
procedure builder (
    p_workspace   in varchar2,
    p_username    in varchar2,
    p_password    in varchar2 default null );

--==============================================================================
-- login to INTERNAL as p_username (4550:10, instance admin login)
--==============================================================================
procedure administrator (
    p_username  in varchar2,
    p_password  in varchar2);

--==============================================================================
-- update the user's password and call builder/administrator (depending on the
-- workspace) to log in.
--==============================================================================
procedure change_password_and_log_in (
    p_workspace_id in number,
    p_username     in varchar2,
    p_new_password in varchar2 );

end wwv_flow_login;
/
show errors
