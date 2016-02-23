set define '^' verify off
prompt ...wwv_page_plugs
create or replace package wwv_flow_disp_page_plugs as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2007. All Rights Reserved.
--
--    DESCRIPTION
--      Render page plugs.
--
--    SECURITY
--      RESTRICTED, NO GRANTS, NOT A PUBLIC PACKAGE
--
--    NOTES
--      The flow ID and flow page ID's are obtained from global variables
--      (wwv_flow.g_flow_id and wwv_flow.g_flow_step_id)
--
--      The display_plug procedure displays a single plug (i.e. a portion
--      of a page.
--
--      The display_page_plugs procedure shows all plugs for the current
--      page by calling the display_plug procedure.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   01/12/2000 - Created
--      mhichwa   12/17/2000 - Changed g_last_template from varchar2 to number
--      mhichwa   07/26/2001 - Added comments
--      mhichwa   08/16/2002 - Added g_request_preserved boolean global for use with pagination
--      mhichwa   08/16/2002 - Added set_region_pagination and reset_region_pagination
--      msewtz    10/10/2002 - Added display_csv_report
--      mhichwa   12/26/2002 - Commented out g_store_page_part_called (bug 2728800)
--      msewtz    04/22/2004 - Changed display_csv_report procedure into more generic display_report (Feature: Printable PDF output of any report region)
--      msewtz    06/09/2004 - added get and set pagination data to support adding rows to reports
--      mhichwa   11/08/2006 - Added g_region_name global to support #REGION_STATIC_ID# substitution
--      pawolf    08/17/2009 - Added sub regions
--      pawolf    04/10/2012 - Added read only on page and region level (feature# 570)
--      pawolf    06/05/2012 - Continued work on grid layout (feature #936)
--      msewtz    08/09/2013 - Added render_list to spec (feature 1236)
--      hfarrell  08/26/2013 - In render_list: added p_region_static_id (feature #1201)
--      hfarrell  08/27/2013 - Backed out p_region_static_id from render_list
--      cneumuel  11/15/2013 - Moved list and breadcrumb to wwv_flow_region_native (feature #1312)
--      cneumuel  11/22/2013 - REGION_DISPLAY_SELECTOR, URL, HELP_TEXT migrated to native plugins (feature #1312)
--                           - Made is_ok_to_display_region public
--      cneumuel  12/06/2013 - moved display_report to wwv_flow_region_native.render_classic_report
--
--------------------------------------------------------------------------------

g_region_id        number;
g_region_static_id varchar2(255);

--==============================================================================
function is_ok_to_display_region (
    p_region_id          in number,
    p_required_patch     in varchar2 default null,
    p_security_scheme    in varchar2,
    p_display_when_type  in varchar2,
    p_display_when_cond  in varchar2,
    p_display_when_cond2 in varchar2,
    p_customized         in varchar2 )
    return boolean;

--==============================================================================
procedure get_pagination_data (
    p_region_id  in number,
    p_min_row    out number,
    p_max_row    out number,
    p_total_rows out number,
    p_add_rows   out number,
    p_has_state  out boolean );

--==============================================================================
procedure set_pagination_data (
    p_region_id  in number,
    p_min_row    in number default null,
    p_max_row    in number default null,
    p_total_rows in number default null,
    p_add_rows   in number default null,
    p_total_diff in number default null );

--==============================================================================
procedure set_region_pagination (
    p_region_pagination_type in varchar2,
    p_region_id in number,
    p_min_row   in out number,
    p_max_row   in out number );

--==============================================================================
procedure reset_region_pagination;

--==============================================================================
procedure reset_region_pagination (
    p_region_id in number );
--==============================================================================
procedure reset_pagination_by_page (
    p_flow_id in number,
    p_page_id in number );

--==============================================================================
procedure display_page_plugs (
    p_process_point     in varchar2,
    p_page_template_id  in number,
    p_grid_template     in wwv_flow_template.t_grid_template,
    p_page_is_read_only in boolean );

end wwv_flow_disp_page_plugs;
/
show errors
