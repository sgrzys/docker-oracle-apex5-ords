set define off
set verify off

prompt ...wwv_flow_meta_util

create or replace package wwv_flow_meta_util
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    NAME
--      wwv_flow_meta_util.sql
--
--    DESCRIPTION
--      Private utility methods used by the engine at runtime.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      sspadafo  06/09/2009 - Created
--      pwolf     06/10/2009 - Moved functions from wwv_flow_meta_data to wwv_flow_meta_util
--      pawolf    01/23/2010 - Added p_no_order_by to format_lov_query
--      pawolf    11/25/2010 - Bug# 10197557: added default value for is_ok_to_display
--      pawolf    02/02/2011 - Added parameter p_use_template to format_lov_query (bug 13640940)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Function returns true if the passed authorization and
-- display condition of a component are ok to display.
--==============================================================================
function is_ok_to_display (
    p_security_scheme    in varchar2 default null,
    p_display_when_type  in varchar2,
    p_display_when_cond  in varchar2,
    p_display_when_cond2 in varchar2,
    p_component          in varchar2 default null )
    return boolean;

--==============================================================================
-- Function returns true if the passed build option, authorization and
-- display condition of a component are ok to display.
--==============================================================================
function is_ok_to_display (
    p_required_patch     in number,
    p_security_scheme    in varchar2 default null,
    p_display_when_type  in varchar2,
    p_display_when_cond  in varchar2,
    p_display_when_cond2 in varchar2,
    p_component          in varchar2 default null )
    return boolean;

--==============================================================================
-- Function returns true if the passed build option of a component is one which
-- can be used.
--==============================================================================
function is_valid_build_option (
    p_required_patch in number )
    return boolean;

--==============================================================================
-- LOV helper
--==============================================================================
function format_lov_query (
    p_lov          in varchar2,
    p_display_as   in varchar2,
    p_no_order_by  in boolean default false,
    p_use_template in boolean default false )
    return varchar2;

end wwv_flow_meta_util;
/
show errors

set define '^'
