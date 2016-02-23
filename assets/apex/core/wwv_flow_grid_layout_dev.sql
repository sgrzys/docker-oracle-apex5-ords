set define off
set verify off

prompt ...wwv_flow_grid_layout_dev

create or replace package wwv_flow_grid_layout_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_grid_layout_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling grid layouts in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    05/23/2012 - Created
--      pawolf    05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
--      pawolf    05/31/2012 - Continued work on grid layout (feature #936)
--      pawolf    06/01/2012 - Added uses_table
--      pawolf    06/01/2012 - Added has_grid_column_attributes
--      pawolf    06/05/2012 - Added grid support for sub regions (feature #936)
--      pawolf    06/18/2012 - Added region display points support (feature# #936)
--      pawolf    12/02/2014 - Added handling for label column span (feature #1615)
--      pawolf    12/05/2014 - Added has_column_css to t_grid (feature #1466)
--      pawolf    01/12/2015 - Removed public api of get (bug #18704296)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_grid is record (
    has_grid_support         boolean,
    has_page_dp_grid_support boolean,
    uses_table               boolean,
    has_new_grid             boolean,
    has_column_span          boolean,
    has_column_css           boolean,
    has_column_attrs         boolean,
    has_label_column_span    boolean,
    max_columns              pls_integer );

--==============================================================================
-- Global constants
--==============================================================================

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- This procedure gets information about the used grid and stores them in the
-- Builder page items xxx_GRID_HAS_GRID_SUPPORT, xxx_GRID_HAS_NEW_GRID,
-- xxx_GRID_HAS_COLUMN_SPAN and xxx_GRID_MAX_COLUMNS.
-- It's for example used on page 4000:4651, 4000:374, ...
--==============================================================================
procedure set_helper_items (
    p_application_id    in number,
    p_page_id           in number,
    p_display_point     in varchar2,
    p_is_sub_region     in boolean,
    p_parent_region_id  in number,
    p_label_template_id in number default null,
    p_item_prefix       in varchar2 );
--
--==============================================================================
-- This procedure resets the page items used to store grid information of a
-- component to default values if the current display point doesn't support
-- a grid. The following page items are affected: xxx_NEW_GRID, xxx_NEW_GRID_ROW,
-- xxx_GRID_DISPLAY_COLUMN, xxx_NEW_GRID_COLUMN, xxx_GRID_COLUMN_ATTR
--==============================================================================
procedure cleanup_grid_items (
    p_application_id    in number,
    p_page_id           in number,
    p_display_point     in varchar2,
    p_is_sub_region     in boolean,
    p_parent_region_id  in number,
    p_label_template_id in number default null,
    p_item_prefix       in varchar2 );
--
end wwv_flow_grid_layout_dev;
/
show errors

set define '^'
