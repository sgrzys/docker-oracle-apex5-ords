set define off
set verify off

prompt ...wwv_flow_team_gen_api

create or replace package wwv_flow_team_gen_api
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2010. All Rights Reserved.
--
--    NAME
--      wwv_flow_team_gen_api.sql
--
--    DESCRIPTION
--      Exports all team development related data of a workspace.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/09/2010 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================


--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- Export data of all team development components of the current workspace into
-- a SQL script with all settings for SQL*Plus.
-- p_format can be DOS or UNIX.
--==============================================================================
procedure export_script (
    p_format in varchar2 default 'UNIX' );

--==============================================================================
-- Export data of all team development components of the current workspace, but
-- just the actual API calls.
-- p_format can be DOS or UNIX.
--==============================================================================
procedure export (
    p_format in varchar2 default 'UNIX' );

end wwv_flow_team_gen_api;
/
show errors

set define '^'
