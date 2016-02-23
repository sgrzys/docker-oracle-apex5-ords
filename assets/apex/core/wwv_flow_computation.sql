set define off verify off
prompt ...wwv_flow_computation
create or replace package wwv_flow_computation as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_computation.sql
--
--    DESCRIPTION
--      This package is responsible for handling computations.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    05/07/2012 - Created
--      vuvarov   02/03/2014 - Added get_computation_points (was standalone function wwv_flow_item_comps)
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
-- Performs all computations defined for the specified process point
--==============================================================================
procedure perform (
    p_process_point in varchar2 );

--==============================================================================
-- Returns a space-separated string of computation points where given
-- application item is being computed.
--==============================================================================
function get_computation_points ( p_flow_id   in number,
                                  p_item_name in varchar2 ) return varchar2;

end wwv_flow_computation;
/
show errors

set define '^'
