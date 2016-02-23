set define '^'
set verify off
prompt ...wwv_flow_component


create or replace package wwv_flow_component
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2013 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_component.sql
--
--    DESCRIPTION
--      This package provides constants for the components of APEX.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      12/11/2013 - Init
--    pawolf      02/04/2013 - Added quick edit for IR and Classic Report columns (feature #1363)
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

c_comp_type_region             constant number := 5110;
c_comp_type_page_item          constant number := 5120;
c_comp_type_button             constant number := 5130;
c_comp_type_ir_column          constant number := 7040;
c_comp_type_classic_rpt_column constant number := 7320;
c_comp_type_tab_form_column    constant number := 7420;
--
end wwv_flow_component;
/
show errors
