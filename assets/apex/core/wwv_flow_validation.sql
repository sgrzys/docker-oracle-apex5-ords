set define off
set verify off

prompt ...wwv_flow_validation

create or replace package wwv_flow_validation
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_validation.sql
--
--    DESCRIPTION
--      This package is responsible for handling validations.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    01/04/2011 - Created (feature# 542)
--      pawolf    02/28/2011 - Added new error handling (feature# 544)
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
-- Performs all validations (basic, predefined and custom validations).
-- This procedure has to be called during page processing.
--==============================================================================
procedure perform;

end wwv_flow_validation;
/
show errors

set define '^'
