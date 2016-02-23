set define off
set verify off

prompt ...wwv_flow_tabular_form

create or replace package wwv_flow_tabular_form
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2011. All Rights Reserved.
--
--    NAME
--      wwv_flow_tabular_form.sql
--
--    DESCRIPTION
--      This package is responsible for handling tabular forms.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    01/11/2011 - Created (feature# 542)
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
-- Function returns the number of submitted rows of the specified tabular form.
--==============================================================================
function get_row_count (
    p_tabular_form_region_id in number )
    return pls_integer;

--==============================================================================
-- Function returns the status (C=create, U=update, D=delete) of the specified
-- tabular form row. 
--==============================================================================
function get_row_status (
    p_tabular_form_region_id in number,
    p_row_num                in pls_integer )
    return varchar2;

--==============================================================================
-- Function returns TRUE if the row selector of the specified tabular form is
-- checked. Returns FALSE if it's not checked or the tabular form doesn't have
-- a row selector.
--==============================================================================
function is_row_selector_checked (
    p_tabular_form_region_id in number,
    p_row_num                in pls_integer )
    return boolean;

--==============================================================================
-- Function returns TRUE if the specified row has been created or modified.
-- Returns FALSE if the submitted values are still matching with the checksum.
--==============================================================================
function has_row_changed (
    p_tabular_form_region_id in number,
    p_row_num                in pls_integer )
    return boolean;

--==============================================================================
-- Function returns an array, indexed by column alias which contains the
-- column values of the specified tabular form row. This array can be used to
-- call set_component_values.
--
-- The "Row Selector" column is returned as "APEX$ROW_SELECTOR" and contains
-- the value X if checked.
-- The "Record Status" column is returned as "APEX$ROW_STATUS".
-- The current row is returns as "APEX$ROW_NUM".
--==============================================================================
function get_row_values (
    p_tabular_form_region_id in number,
    p_row_num                in pls_integer )
    return wwv_flow_global.vc_map;

--==============================================================================
-- Procedure which updates the tabular form wwv_flow.g_fxx arrays with the values
-- of the p_value_map. p_value_map is index by column alias.
--==============================================================================
procedure set_row_values (
    p_tabular_form_region_id in number,
    p_value_map              in wwv_flow_global.vc_map,
    p_row_num                in pls_integer );

--==============================================================================
-- Function returns the "id" of the HTML element for the specified column alias
-- and tabular form row. If p_column_alias is a non existing column or the
-- column has not been rendered this function will return NULL.
--==============================================================================
function get_html_element_id (
    p_tabular_form_region_id in number,
    p_column_alias           in varchar2,
    p_row_num                in pls_integer )
    return varchar2;

--==============================================================================
-- Function returns the heading for the specified column alias.
-- If p_column_alias is a non existing column or the column has not been
-- rendered this function will return NULL.
--==============================================================================
function get_column_heading (
    p_tabular_form_region_id in number,
    p_column_alias           in varchar2 )
    return varchar2;

--==============================================================================
-- Function returns TRUE if the specified page contains at least one tabular form.
--==============================================================================
function has_tabular_form (
    p_application_id    in number default nv('FB_FLOW_ID'),
    p_page_id           in number default nv('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default nv('WORKSPACE_ID') )
    return boolean;

end wwv_flow_tabular_form;
/
show errors

set define '^'
