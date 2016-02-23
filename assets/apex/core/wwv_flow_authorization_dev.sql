set define '^' verify off
prompt ...wwv_flow_authorization_dev.sql
create or replace package wwv_flow_authorization_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_authorization_dev.sql
--
--    DESCRIPTION
--      Internal builder utility package for authorization schemes
--
--      copy:                           copy authorization from one app to another app
--      get_authorization_in_other_app: get / create authorization of app b that matches authorization in app a
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    02/05/2013 - Created
--    cneumuel    02/06/2013 - Added copy(), which previously was in wwv_flow_copy_util, to fix a dependency problem.
--
--------------------------------------------------------------------------------

--==============================================================================
-- Copy authorization from one app to another app
--
-- ARGUMENTS
--   * p_from_application_id:   id of app to copy from
--   * p_from_authorization_id: id of authorization to copy from
--   * p_to_application_id:     id of app to copy to
--   * p_to_authorization_name: name of authorization to copy to
--   o p_to_authorization_id:   id of authorization to copy to
--   o p_subscribe:             if true, subscribe authorization (default: false)
--==============================================================================
procedure copy (
    p_from_application_id   in number,
    p_from_authorization_id in number,
    p_to_application_id     in varchar2,
    p_to_authorization_name in varchar2,
    p_to_authorization_id   in number default null,
    p_subscribe             in boolean default false );

--==============================================================================
-- Compute the equivalent of an authorization in a source application to a
-- target application. If the target app does not have an authorization with
-- the same name, the source authorization is copied.
--
-- ARGUMENTS
--   * p_from_authorization:  authorization value (security_scheme) in p_from_application_id
--   * p_from_application_id: application id of p_from_authorization
--   * p_to_application_id:   application id of target authorization
--
-- RETURNS
--   Authorization value (security_scheme) in dest app that is the equivalent
--   of src authorization in src app.
--
-- SEE ALSO
--   * wwv_flow_f4000_util.copy_list_from_app
--==============================================================================
function get_authorization_in_other_app (
    p_from_authorization   in varchar2,
    p_from_application_id  in number,
    p_to_application_id    in number )
    return varchar2;

end wwv_flow_authorization_dev;
/
show err

