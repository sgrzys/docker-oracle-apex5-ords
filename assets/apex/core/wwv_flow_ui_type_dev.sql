set define off
set verify off

prompt ...wwv_flow_ui_type_dev

create or replace package wwv_flow_ui_type_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_ui_type_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling UI types in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    07/04/2012 - Created
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
-- Returns TRUE if the specified Builder Feature is supported by the specified
-- UI type, otherwise returns FALSE.
--==============================================================================
function supports_feature (
    p_ui_type_id in number,
    p_name       in varchar2 )
    return boolean;
--
end wwv_flow_ui_type_dev;
/
show errors

set define '^'
