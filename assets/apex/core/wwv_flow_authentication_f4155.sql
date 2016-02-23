set define '^' verify off
prompt ...wwv_flow_authentication_f4155.sql
create or replace package wwv_flow_authentication_f4155 as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_authentication_f4155.sql
--
--    DESCRIPTION
--      Authentication for application 4155
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/17/2013 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Internal login application authentication plugin
--
-- Check if session can be used.
--==============================================================================
function session_sentry (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

end wwv_flow_authentication_f4155;
/
show err

