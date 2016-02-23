set define '^' verify off
prompt ...wwv_flow
create or replace package wwv_flow_conditions as 
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2002-2013. All Rights Reserved.
--
--    NAME
--      flowcon.sql
--
--    DESCRIPTION
--      Flow conditions
--
--    SECURITY
--      Internal function available only to the flows user.
--
--    RUNTIME DEPLOYMENT: YES
--
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   05/01/2002 - Created
--      mhichwa   11/30/2007 - Changed comments
--      pawolf    04/10/2012 - Added is_read_only (feature# 570)
--      cneumuel  07/18/2013 - Added p_raise_internal_error to standard_condition
--
--------------------------------------------------------------------------------

--==============================================================================
function standard_condition (
    p_condition_type       in varchar2 default null,
    p_condition            in varchar2 default null,
    p_condition2           in varchar2 default null,
    p_raise_internal_error in boolean default true )
    return boolean;

--==============================================================================
function is_read_only (
    p_condition_type      in varchar2,
    p_expression1         in varchar2,
    p_expression2         in varchar2,
    p_parent_is_read_only in boolean  default null )
    return boolean;

end wwv_flow_conditions;
/
show errors
