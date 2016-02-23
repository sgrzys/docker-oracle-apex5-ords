set define '^' verify off
prompt ...wwv_flow_page_cache_api
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2006 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_page_cache_api
--
--    DESCRIPTION
--      Application Express page caching logic
--
--    MODIFIED  (MM/DD/YYYY)
--      mhichwa  06/09/2006 - Created
--      mhichwa  06/12/2006 - Modified
--      mhichwa  06/16/2006 - Added purge_stale, get_date_cached
--      mhichwa  12/21/2006 - Added display_region
--      mhichwa  12/27/2006 - Added purge region cache procedures
--      mhichwa  12/28/2006 - Added function verify_cache_condition
--      mhichwa  12/28/2006 - Added procedure purge_regions_by_id
--      mhichwa  01/02/2007 - Added purge_regions_by_name, purge_regions_by_page
--      mhichwa  01/05/2007 - Added purge_stale_regions procedure, added functions count_stale_regions, count_stale_pages
--      mhichwa  01/10/2007 - Added chart caching procedures and function
--      cbcho    01/24/2007 - Changed lob_replace to take p_with with null value
--      madelfio 02/15/2007 - Updated chart caching APIs and added chart_region_exists function
--      sspadafo 04/27/2007 - Added overloaded version of function get_date_cached for regions (Bug 5996963)
--      jkallman 04/14/2008 - Correct implementation of purge_all (remove parameter) (Bug 6963877)
--      cneumuel 04/15/2014 - Removed lob_replace, chart_region_exists, count_stale_pages, purge_all, purge_stale_regions, purge_chart_cache_by_app, purge_chart_cache_by_region (feature #1401)
--                          - Added purge_by_session, after_region_rendered, after_page_rendered
--      cneumuel 04/22/2014 - Added purge_all again. it is used by reset_image_prefix_core.sql
--      cneumuel 04/25/2014 - In display_chart_region, cache_chart_region: added p_depends_on_items (feature #1401)
--      cneumuel 04/28/2014 - Removed purge_by_session, added p_session_id to other purge procedures (feature #1401)
--      cneumuel 04/28/2014 - In purge_by_page, purge_regions_by_app, purge_regions_by_page, purge_regions_by_id: added p_session_id (feature #1401)
--                          - Removed purge_by_session
--
--------------------------------------------------------------------------------
create or replace package wwv_flow_page_cache_api as

--==============================================================================
-- enum type for cache mode in
-- - wwv_flow_steps.cache_mode
-- - wwv_flow_page_plugs.plug_caching
--==============================================================================
subtype t_cache_mode is wwv_flow_steps.cache_mode%type;
c_cache_mode_nocache constant t_cache_mode := 'NOCACHE';
c_cache_mode_user    constant t_cache_mode := 'USER';
c_cache_mode_session constant t_cache_mode := 'SESSION';
c_cache_mode_cache   constant t_cache_mode := 'CACHE';

--##############################################################################
--#
--# PAGE CACHE
--#
--##############################################################################

--==============================================================================
-- render the page from the cache. returns true if the cache could be used and
-- false, otherwise. in that case, the caller needs to run after_page_rendered
-- at the end of manual page rendering, so the page output can be saved in the
-- cache, if necessary.
--==============================================================================
function display_page
    return boolean;

--==============================================================================
-- if cacheable output is available, save it in the cache.
--==============================================================================
procedure after_page_rendered;

--==============================================================================
-- Deletes all entries in the cache, for all workspaces and applications
--
-- SEE ALSO
-- * utilities/reset_image_prefix_core.sql
--==============================================================================
procedure purge_all;

--==============================================================================
-- Deletes all cached pages and regions for the specified application
-- that have passed their timeout.  When you select to have a page or
-- region be cached, you can specify an active time period.  Once that
-- has passed, that cache will not be used.  This removes those
-- unusable pages and regions from the cache.
--
-- SEE ALSO htmldb_util.cache_purge_stale
--==============================================================================
procedure purge_stale (
    p_application    in number);
    
--==============================================================================
-- Purges all cached pages and regions for a given application.
--
-- SEE ALSO htmldb_util.cache_purge_by_application
--==============================================================================
procedure purge_by_application (
   p_application   in number);
   
--==============================================================================
-- Purges all cached pages and regions for a given application and page.
-- If p_user_name is supplied, only that user's cached pages and regions
-- will be purged.
--
-- SEE ALSO htmldb_util.cache_purge_by_page, wwv_flow_page_api.purge_cache
--==============================================================================
procedure purge_by_page (
    p_application  in number,
    p_page         in number,
    p_user_name    in varchar2 default null,
    p_session_id   in number   default null );
   
--==============================================================================
function get_date_cached (
    p_application  in number,
    p_page         in number)
    return date;

--##############################################################################
--# 
--# REGION CACHE
--#
--##############################################################################
   
--==============================================================================
-- render the region from the cache. this returns true if the cache could be
-- used and false otherwise. if the cache could not be used, the caller
-- must render the region and run after_region_rendered() afterwards.
--==============================================================================
function display_region (
    p_application_id in number,
    p_region         in out nocopy wwv_flow.t_plug )
    return boolean;

--==============================================================================
-- this procedure must be called after the region has been rendered, when the
-- cache was not used. it emits an end tag that later gets used to extract the
-- region output and save it in the cache.
--==============================================================================
procedure after_region_rendered (
    p_region         in out nocopy wwv_flow.t_plug );

--==============================================================================
function count_stale_regions (
    p_application    in number)
    return number;

--==============================================================================
procedure purge_regions_by_app (
    p_application in number,
    p_session_id  in number default null );

--==============================================================================
procedure purge_regions_by_id (
    p_application in number,
    p_region_id   in number,
    p_session_id  in number default null );

--==============================================================================
procedure purge_expired_regions (
    p_application in number);

--==============================================================================
procedure purge_regions_by_name (
    p_application  in number,
    p_page_id      in number,
    p_region_name  in varchar2);
     
--==============================================================================
procedure purge_regions_by_page (
    p_application  in number,
    p_page_id      in number,
    p_session_id   in number default null );

--==============================================================================
function get_date_cached (
    p_application  in number,
    p_page         in number,    
    p_region_name  in varchar2)
    return date;   
   
--##############################################################################
--#
--# CHART REGION CACHE
--#
--# Chart regions are excluded from the normal region cache, see display_plug()
--# in wwv_flow_disp_page_plugs. Instead, the caching happens in ajax() of
--# wwv_flow_flash_chart5.
--#
--##############################################################################

--==============================================================================
-- fetch xml from cache table
--==============================================================================
function display_chart_region (
    p_application_id   in number,
    p_page_id          in number,
    p_region_id        in number,
    p_depends_on_items in varchar2,
    p_cache_mode       in t_cache_mode )
    return boolean;

--==============================================================================
-- save xml to cache table
--==============================================================================
procedure cache_chart_region (
    p_application_id   in number,
    p_page_id          in number,
    p_region_id        in number,
    p_depends_on_items in varchar2,
    p_cache_mode       in t_cache_mode );

end wwv_flow_page_cache_api;
/
show errors
