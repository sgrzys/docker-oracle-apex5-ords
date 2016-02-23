set define off verify off
prompt ...wwv_flow_region_api
create or replace package wwv_flow_region_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_region_api.sql
--
--    DESCRIPTION
--      This package is the public API for handling regions.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/12/2012 - Created
--      cneumuel  04/28/2014 - In purge_cache: added p_current_session_only (feature #1401)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Returns TRUE if the current region is rendered read only and FALSE if not.
-- If the function is called from a context where no region is currently
-- processed it will return NULL. This function can for example be used in
-- conditions of a region or it's underlying items and buttons.
--
-- EXAMPLE
--   return apex_region.is_read_only;
--==============================================================================
function is_read_only return boolean;

--==============================================================================
-- Purge the region cache of the specified application, page and region.
--
-- PARAMETERS
-- * p_application_id       id of the application where the region caches should
--                          be purged. defaults to the current application.
-- * p_page_id              id of the page where the region caches should be
--                          purged. if no value is specified (which is the
--                          default) all regions of the application will be
--                          purged.
-- * p_region_id            id of a specific region on a page. if no value is
--                          specified all regions of the specified page will be
--                          purged.
-- * p_current_session_only specify true if you only want to purge entries that
--                          where saved for the current session. defaults to
--                          false.
--
-- EXAMPLE
--   Purge session specific region cache for the whole application.
--
--   begin
--       apex_region.purge_cache (
--           p_current_session_only => true );
--   end;
--==============================================================================
procedure purge_cache (
    p_application_id       in number default wwv_flow.g_flow_id,
    p_page_id              in number default null,
    p_region_id            in number default null,
    p_current_session_only in boolean default false );

end wwv_flow_region_api;
/
show errors
set define '^'
