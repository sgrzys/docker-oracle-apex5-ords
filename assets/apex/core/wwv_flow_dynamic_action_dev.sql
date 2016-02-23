set define off
set verify off

prompt ...wwv_flow_dynamic_action_dev

create or replace package wwv_flow_dynamic_action_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_dynamic_action_dev.sql
--
--    DESCRIPTION
--      This package is resonsible for handling dynamic actions in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/20/2012 - Moved procedures from wwv_flow_dynamic_action.*
--
--------------------------------------------------------------------------------

--==============================================================================
-- Returns whether the Dynamic Action being created requires an Affected 
-- Element
--==============================================================================
function requires_affected_element (
    p_da_implementation varchar2,
    p_flow_id           number,
    p_std_true_action   varchar2,
    p_adv_true_action   varchar2,
    p_adv_false_action  varchar2 ) 
    return boolean;

end wwv_flow_dynamic_action_dev;
/
show errors

set define '^'
