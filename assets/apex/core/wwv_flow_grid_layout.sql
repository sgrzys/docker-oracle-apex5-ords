set define off
set verify off

prompt ...wwv_flow_grid_layout

create or replace package wwv_flow_grid_layout
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_grid_layout.sql
--
--    DESCRIPTION
--      This package is responsible for handling grid layouts in the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    05/15/2012 - Created
--      pawolf    05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
--      pawolf    05/24/2012 - Added p_grid_attributes to wwv_flow_grid_layout.init
--      pawolf    05/31/2012 - Continued work on grid layout (feature #936)
--      pawolf    05/23/2014 - In init: Changed p_is_always_rendered to be nullable and fallback to grid configuration (feature #1433)
--      pawolf    11/28/2014 - Added label_column_span (feature #1615)
--      pawolf    12/01/2014 - Optimized label column span handling (feature #1615)
--      pawolf    12/04/2014 - Added t_column.css_classes (feature #1466)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_grid_component is record (
    idx  binary_integer,
    name varchar2(255) );

type t_grid_components is table of t_grid_component index by pls_integer; -- index: seq increment

type t_column is record (
    no                pls_integer,
    column_span       pls_integer,
    row_span          pls_integer,
    label_column_span pls_integer,
    css_classes       varchar2(255),
    attributes        varchar2(255),
    components        t_grid_components,
    is_emitted        boolean := false );

type t_columns is table of t_column  index by pls_integer; -- index: seq increment

type t_row is record (
    cols           t_columns,
    is_emitted     boolean     := false,
    next_column_no pls_integer := 1 );

type t_rows is table of t_row index by pls_integer; -- index: seq increment

type t_grid is record (
    max_columns          pls_integer,
    attributes           varchar2(255),
    rows                 t_rows,
    has_to_be_rendered   boolean     := null,
    is_emitted           boolean     := false );

type t_grids is table of t_grid index by pls_integer; -- index: seq increment

type t_iterator is record (
    component_idx         binary_integer,
    component_column_span pls_integer,
    is_finished           boolean        := true,
    -- internal info
    grids                 t_grids,
    grid_idx              pls_integer,
    grid_row_idx          pls_integer,
    grid_column_idx       pls_integer,
    grid_component_idx    pls_integer,
    grid_template         wwv_flow_template.t_grid_template );

type t_component is record (
    name               varchar2(255),
    type               varchar2(10),
    original_idx       binary_integer,
    item_type          wwv_flow_step_items.display_as%type,
    is_ok_to_display   boolean,
    is_new_grid        boolean,
    is_new_row         boolean,
    is_new_column      boolean,
    column_no          pls_integer,
    column_span        pls_integer,
    row_span           pls_integer,
    label_column_span  pls_integer,
    column_css_classes varchar2(255),
    column_attributes  varchar2(255) );

type t_components is table of t_component index by pls_integer;

--==============================================================================
-- Global constants
--==============================================================================
c_component_type_region    constant varchar2(10) := 'REGION';
c_component_type_page_item constant varchar2(10) := 'PAGE_ITEM';
c_component_type_label     constant varchar2(10) := 'LABEL';
c_component_type_button    constant varchar2(10) := 'BUTTON';

c_null_iterator t_iterator;
c_empty_vc_arr2 wwv_flow_global.vc_arr2;

--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Parses the layout information of the passed components and calculates
-- the structure of the grids with it's rows and columns. This has to be the
-- first call before actually emitting the grid with emit_open or next_and_emit_close.
--
-- If the grid has completely been emitted, p_iterator.is_finished will be TRUE.
-- The next component which should be displayed is stored in p_iterator.component_idx
-- and is the array index which should be used to access the component in the
-- passed arrays.
--
-- declare
--     l_iterator wwv_flow_grid_layout.t_iterator;
-- begin
--     wwv_flow_grid_layout.init (
--         p_grid_template_id     => coalesce(wwv_flow.g_step_grid_template_id, wwv_flow.g_page_tmpl_grid_template_id),
--         p_emit_display_point   => p_process_point,
--         p_emit_parent_id       => null,
--         p_component_names      => wwv_flow.g_plug_name,
--         p_display_points       => wwv_flow.g_plug_display_point,
--         p_parent_ids           => wwv_flow.g_plug_parent_plug_id,
--         p_new_grids            => wwv_flow.g_plug_new_grid,
--         p_new_grid_rows        => wwv_flow.g_plug_new_grid_row,
--         p_new_grid_columns     => wwv_flow.g_plug_new_grid_column,
--         p_grid_display_columns => wwv_flow.g_plug_display_column,
--         p_grid_column_spans    => wwv_flow.g_plug_grid_column_span,
--         p_grid_column_attrs    => wwv_flow.g_plug_column_width,
--         p_iterator             => l_iterator );
-- 
--     while not l_iterator.is_finished
--     loop
--         if <<is ok to display>> then
--             wwv_flow_grid_layout.emit_open (
--                 p_iterator => l_iterator );
-- 
--             -- Show component
--             -- ... code ...
--         end if;
-- 
--         wwv_flow_grid_layout.next_and_emit_close (
--             p_iterator => l_iterator );
--     end loop;
-- end;
--
--==============================================================================
procedure init (
    p_grid_template          in            wwv_flow_template.t_grid_template,
    p_has_grid_support       in            boolean,
    p_max_fixed_grid_columns in            pls_integer,
    p_is_always_rendered     in            boolean      default null,
    p_grid_attributes        in            varchar2,
    p_components             in            t_components,
    p_iterator               in out nocopy t_iterator );

--==============================================================================
-- Call this procedure if a component should be rendered. It will automatically
-- take care that a grid, grid row and grid column is emitted if necessary.
--==============================================================================
procedure emit_open (
    p_iterator in out nocopy t_iterator );

--==============================================================================
-- This procedure has always to be called in the while loop to close an open grid,
-- grid row or grid column. It will also return the next component in
-- p_iterator.component_idx or set p_iterator.is_finished = TRUE if all components
-- have been processed.
--==============================================================================
procedure next_and_emit_close (
    p_iterator in out nocopy t_iterator );

--==============================================================================
-- Replaces the grid substitution variables in a label template.
--==============================================================================
procedure replace_label_template (
    p_iterator in            t_iterator,
    p_template in out nocopy varchar2 );

--==============================================================================
-- Replaces the grid substitution variables in a before item template.
--==============================================================================
procedure replace_before_item_template (
    p_iterator in            t_iterator,
    p_template in out nocopy varchar2 );
--
end wwv_flow_grid_layout;
/
show errors

set define '^'
