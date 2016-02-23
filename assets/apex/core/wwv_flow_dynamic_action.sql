set define off
set verify off

prompt ...wwv_flow_dynamic_action

create or replace package wwv_flow_dynamic_action
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    NAME
--      wwv_flow_dynamic_action.sql
--
--    DESCRIPTION
--      This package is resonsible for handling dynamic actions in the
--      runtime engine.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      arayner   06/04/2009 - Created
--      arayner   06/04/2009 - Added get_json function that returns a JSON representation of dynamic action metadata.
--      pawolf    06/08/2009 - Added plugin support
--      pawolf    07/23/2009 - Added new record type for rendering
--      arayner   10/06/2009 - Added get_opposite_actions function
--      arayner   12/11/2009 - Removed get_opposite_actions function, no longer needed
--      arayner   06/20/2011 - Bug# 12673405: Added requires_affected_element
--      arayner   01/04/2012 - Added is_affected_region_valid function (bug 13441441)
--      pawolf    03/20/2012 - Moved requires_affected_element to wwv_flow_dynamic_action_dev and is_affected_region_valid to api.plb
--
--------------------------------------------------------------------------------

--==============================================================================
-- Public types
--==============================================================================
type t_browser_attributes is record (
    javascript_function varchar2(32767),
    ajax_identifier     varchar2(255),
    attribute_01        wwv_flow_page_da_actions.attribute_01%type,
    attribute_02        wwv_flow_page_da_actions.attribute_02%type,
    attribute_03        wwv_flow_page_da_actions.attribute_03%type,
    attribute_04        wwv_flow_page_da_actions.attribute_04%type,
    attribute_05        wwv_flow_page_da_actions.attribute_05%type,
    attribute_06        wwv_flow_page_da_actions.attribute_06%type,
    attribute_07        wwv_flow_page_da_actions.attribute_07%type,
    attribute_08        wwv_flow_page_da_actions.attribute_08%type,
    attribute_09        wwv_flow_page_da_actions.attribute_09%type,
    attribute_10        wwv_flow_page_da_actions.attribute_10%type );

--==============================================================================
-- includes the necessary Javascript code into the HTML page
-- to handle the defined dynamic actions of the current page.
--==============================================================================
procedure render;

end wwv_flow_dynamic_action;
/
show errors

set define '^'
