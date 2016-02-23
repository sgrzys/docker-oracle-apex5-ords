set define off verify off
prompt ...wwv_flow_region
create or replace package wwv_flow_region as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012-2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_region.sql
--
--    DESCRIPTION
--      This package is responsible for handling regions in the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/12/2012 - Created
--      cneumuel  04/08/2014 - Added set_component, clear_component, init, is_ok_to_display, is_read_only (feature #1314)
--      cneumuel  04/28/2014 - In purge_cache: added p_current_session_only (feature #1401)
--
--------------------------------------------------------------------------------

--==============================================================================
-- make wwv_flow.g_plugs(p_region_idx) the current component. this procedure
-- should be used instead of the more generic wwv_flow.set_component, because
-- it performs additional initialization.
--==============================================================================
procedure set_component (
    p_region in wwv_flow.t_plug );

--==============================================================================
-- clean up after region specific code that has been initiated with
-- set_component().
--==============================================================================
procedure clear_component;

--==============================================================================
-- initialize p_region before rendering. this configures references between the
-- region and it's parent and initializes subcomponents of the region (items,
-- buttons, sub-regions) if it can be displayed.
--
-- ARGUMENTS
-- * p_parent_region_idx  index of p_region's parent region in wwv_flow.g_plugs
-- * p_region             the region
--==============================================================================
procedure init (
    p_parent_region_idx in pls_integer,
    p_region            in out nocopy wwv_flow.t_plug );

--==============================================================================
-- return whether the region can be displayed
--==============================================================================
function is_ok_to_display (
    p_region in out nocopy wwv_flow.t_plug )
    return boolean;

--==============================================================================
-- return whether the region is read-only.
--
-- ARGUMENTS
-- * p_region              the region
-- * p_parent_is_read_only read-only status of the parent region (for
--                         sub-regions) or the page (for top level regions).
--                         if null, the parent's read only status is computed
--                         by looking up the parent region's or page's status.
--==============================================================================
function is_read_only (
    p_region              in out nocopy wwv_flow.t_plug,
    p_parent_is_read_only in boolean default null )
    return boolean;

--==============================================================================
-- Returns TRUE if the current region is rendered read only and FALSE if not.
-- If the function is called from a context where no region is currently
-- processed it will return NULL.
--
-- The current region is the one that has been configured by calling
-- set_component().
--==============================================================================
function is_read_only return boolean;

--==============================================================================
-- Purge the region cache of the specified application, page and region.
--
-- Parameters:
--   p_application_id Id of the application where the region caches should be purged.
--   p_page_id        Id of the page where the region caches should be purged.
--                    If no value is specified all regions of the specified application
--                    will be purged.
--   p_region_id      Id of a specific region on a page which should be purged.
--                    If no value is specified all regions of the specified page
--                    will be purged.
--   p_current_session_only If true, only purges cache for the current session.
--==============================================================================
procedure purge_cache (
    p_application_id       in number,
    p_page_id              in number default null,
    p_region_id            in number default null,
    p_current_session_only in boolean default false );

--==============================================================================
-- Resets all global variables.
-- Note: Always call this procedure if the current page/region changes!
--==============================================================================
procedure reset;

--
end wwv_flow_region;
/
show errors

set define '^'
