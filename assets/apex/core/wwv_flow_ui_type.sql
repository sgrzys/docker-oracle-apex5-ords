set define '^' verify off
prompt ...wwv_flow_ui_type.sql
create or replace package wwv_flow_ui_type as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_ui_type.sql
--
--    DESCRIPTION
--      Internal utility package for UI types.
--
--    SEE ALSO
--      Package wwv_flow_user_interface
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    06/26/2012 - Created
--    cneumuel    06/27/2012 - detect: extend server-side device detection (feature #791)
--    cneumuel    12/04/2012 - added detect(p_user_agent), to support device analysis on aria
--
--------------------------------------------------------------------------------

subtype t_name is wwv_flow_ui_types.name%type;
c_desktop                 constant t_name := 'DESKTOP';
c_jqm_smartphone          constant t_name := 'JQM_SMARTPHONE';
c_jqm_tablet              constant t_name := 'JQM_TABLET';
c_phonegap_jqm_smartphone constant t_name := 'PHONEGAP_JQM_SMARTPHONE';
c_phonegap_jqm_tablet     constant t_name := 'PHONEGAP_JQM_TABLET';

--==============================================================================
-- Try to detect the ui type for a given user agent value
--==============================================================================
function detect (
    p_user_agent in varchar2 )
    return t_name;
--==============================================================================
-- Try to detect the ui type, based on the user agent http header value.
--==============================================================================
function detect
    return t_name;

end wwv_flow_ui_type;
/
show err

