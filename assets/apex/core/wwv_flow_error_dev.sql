set define '^' verify off
prompt ...wwv_flow_error_dev.sql
create or replace package wwv_flow_error_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_error_dev.sql
--
--    DESCRIPTION
--      Error handler for development environment
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    07/14/2014 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- error handler for internal apps
--==============================================================================
function internal_error_handler (
    p_error in wwv_flow_error_api.t_error )
    return wwv_flow_error_api.t_error_result;

end wwv_flow_error_dev;
/
show err

