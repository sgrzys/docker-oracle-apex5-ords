set define off verify off
prompt ...wwv_flow_dev
create or replace package wwv_flow_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012-2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling an application in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/16/2012 - Created
--      cneumuel  03/05/2013 - Moved set_flow_builder_state from wwv_flow_cache to wwv_flow_dev
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
-- Returns the run URL for the specified application.
--==============================================================================
function get_run_url (
    p_application_id in number )
    return varchar2;
--
--==============================================================================
-- utility procedure on 4000:1 (set flow, page, and run link)
--==============================================================================
procedure set_flow_builder_state;
--
end wwv_flow_dev;
/
show errors

set define '^'
