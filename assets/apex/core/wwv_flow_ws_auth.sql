set define '^'
set verify off
prompt ...wwv_flow_ws_auth


create or replace package wwv_flow_ws_auth
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    NAME
--      wwv_flow_ws_auth.sql
--
--    DESCRIPTION
--      This package is resonsible for handling Websheet security.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      04/08/2009 - Created
--    cbcho       04/22/2009 - Deprecated all procedure related to projects since Websheet will not have projects
--    jkallman    02/05/2010 - Removed all workgroup and other unnecessary procedures
--
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------

--
--==============================================================================
-- Called from VPD to set the teamspace schema which is assigned to the
-- workspace.
--==============================================================================
procedure init_schema;

--==============================================================================
-- xxx
--==============================================================================
function guid return number;
    

--
--
end wwv_flow_ws_auth;
/
show errors
