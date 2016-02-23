set define off verify off
prompt ...wwv_flow_page
create or replace package wwv_flow_page as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_page.sql
--
--    DESCRIPTION
--      This package is responsible for handling pages the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    02/29/2012 - Created
--      pawolf    03/20/2012 - Added trace information
--      pawolf    03/22/2012 - Added get_page_id
--      pawolf    03/29/2012 - Changed get_page_id to raise an error if the specified page doesn't exists
--      pawolf    04/10/2012 - Added read only on page and region level (feature# 570)
--      pawolf    04/11/2012 - Changed is_read_only handling and added reset
--      pawolf    04/08/2012 - Moved code from flow.plb to render a page
--      hfarrell  04/17/2013 - Moved get_page_mode from flowu.sql (feature #587)
--      hfarrell  07/19/2013 - Added dialog_checksum (feature #1200)
--      hfarrell  07/25/2013 - Updated dialog_checksum to remove p_checksum_salt
--      hfarrell  07/31/2013 - Renamed dialog_checksum to get_dialog_checksum, and changed signature to use p_application_id and p_page_id. Added constant values c_page_mode_xxxx for page mode options
--      hfarrell  09/18/2013 - Added get_dialog_close_code (feature #1201)
--      pawolf    10/24/2013 - Changed get_dialog_close_code
--                           - Added emit_dialog_close_html
--      hfarrell  10/25/2013 - Added get_dialog_cancel_code (feature #1201)
--      hfarrell  11/15/2013 - Removed parameter p_target from get_dialog_cancel_code
--      hfarrell  11/21/2013 - Added parameter p_security_group_id to get_page_mode
--      hfarrell  11/22/2013 - Added emit_dialog_error_html
--      cneumuel  02/13/2014 - replaced get_page_mode with more generic get_page_info (feature #1047)
--      hfarrell  02/17/2014 - Added get_user_interface_id (feature #1376)
--      cneumuel  02/20/2014 - In t_page_info, get_page_info: added page_is_public_y_n, deep_linking, user_interface_id (feature #1047)
--      cneumuel  02/21/2014 - In t_page_info, get_page_info: added protection_level
--      cneumuel  03/11/2014 - In get_page_template_id, get_user_interface_id: use get_page_info.
--                           - In get_page_info: use function result cache. single record cache for standard edition.
--      cneumuel  03/13/2014 - In get_page_info: result_cache in implementation function only
--      hfarrell  03/15/2014 - Added get_dialog_close_js
--      hfarrell  03/20/2014 - Extended get_dialog_close_js to include p_rejoin_public_only
--      hfarrell  03/24/2014 - Removed get_dialog_close_js: logic moved to wwv_flow_utilities.prepare_url
--      cneumuel  03/25/2014 - In t_page_info, get_page_info: add dialog attributes for prepare_url
--      cneumuel  04/28/2014 - In purge_cache: added p_current_session_only (feature #1401)
--      hfarrell  07/03/2014 - In emit_dialog_close_html: added new boolean parameter p_wrap, default is true
--      cneumuel  07/08/2014 - Added t_protection_level (feature #1453)
--      hfarrell  07/14/2014 - In t_page_info: added dialog_browser_frame
--      hfarrell  07/15/2014 - Removed emit_dialog_error_html - unrequired; Moved set_dialog_browser_frame from wwv_flow to here
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
subtype t_page_mode        is wwv_flow_steps.page_mode%type;

subtype t_protection_level is wwv_flow_steps.protection_level%type;
c_protection_unrestricted  constant t_protection_level := 'N';
c_protection_checksum      constant t_protection_level := 'C';
c_protection_no_arguments  constant t_protection_level := 'U';
c_protection_no_url_access constant t_protection_level := 'D';

type t_page_info is record (
    id                       wwv_flow_steps.id%type,
    flow_id                  wwv_flow_steps.flow_id%type,
    security_group_id        wwv_flow_steps.security_group_id%type,
    alias                    wwv_flow_steps.alias%type,
    page_is_public_y_n       wwv_flow_steps.page_is_public_y_n%type,
    protection_level         t_protection_level,
    deep_linking             wwv_flow_steps.deep_linking%type,
    rejoin_existing_sessions wwv_flow_steps.rejoin_existing_sessions%type,
    page_mode                t_page_mode,
    user_interface_id        wwv_flow_steps.user_interface_id%type,
    page_template_id         wwv_flow_steps.step_template%type,
    theme_id                 wwv_flow_user_interfaces.theme_id%type,
    ui_type_name             wwv_flow_ui_types.name%type,
    step_title               wwv_flow_steps.step_title%type,
    -- dialog columns, used in prepare_url
    dialog_js_init_code      wwv_flow_templates.dialog_js_init_code%type,
    dialog_browser_frame     wwv_flow_templates.dialog_browser_frame%type,
    dialog_height            wwv_flow_steps.dialog_height%type,
    dialog_width             wwv_flow_steps.dialog_width%type,
    dialog_max_width         wwv_flow_steps.dialog_max_width%type,
    dialog_attributes        wwv_flow_steps.dialog_attributes%type,
    dialog_title             wwv_flow_steps.dialog_title%type,
    dialog_css_classes       wwv_flow_steps.dialog_css_classes%type,
    dialog_chained           wwv_flow_steps.dialog_chained%type);

--==============================================================================
-- Global constants
--==============================================================================
c_page_mode_normal   constant t_page_mode := 'NORMAL';
c_page_mode_modal    constant t_page_mode := 'MODAL';
c_page_mode_nonmodal constant t_page_mode := 'NON_MODAL';

--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Returns the name of the UI type for which the current page has been designed
-- for.
--==============================================================================
function get_ui_type (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;

--==============================================================================
-- Returns TRUE if the current page has been designed for Desktop browsers.
--==============================================================================
function is_desktop_ui (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;

--==============================================================================
-- Returns TRUE if the current page has been designed for
-- jQuery Mobile (Smartphone, Tablet or Phonegap) browsers.
--==============================================================================
function is_jqm_ui (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;

--==============================================================================
-- Returns TRUE if the current page has been designed for
-- jQuery Mobile Smartphones browsers.
--==============================================================================
function is_jqm_smartphone_ui (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;

--==============================================================================
-- Returns TRUE if the current page has been designed for
-- jQuery Mobile Tablet browsers.
--==============================================================================
function is_jqm_tablet_ui (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;

--==============================================================================
-- Returns the theme id which is used by the specified page.
--==============================================================================
function get_theme_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

--==============================================================================
-- Returns the id of the page templates which should be used by the current page.
-- If the page itself doesn't have an assigned page template, the theme default
-- will be used.
--==============================================================================
function get_page_template_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

--==============================================================================
-- Returns the user interface id which is used by the specified page.
--==============================================================================
function get_user_interface_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

--==============================================================================
-- Returns the dialog JavaScript close code of the page template which is used
-- by the current page. If the page itself doesn't have an assigned dialog close
-- code defined, the theme default will be used.
--==============================================================================
function get_dialog_close_code (
    p_target in varchar2 )
    return varchar2;
    
--==============================================================================
-- Emits the dialog JavaScript close code of the page template which should be used by the current page.
-- If the page itself doesn't have an assigned dialog close code defined, the theme default
-- will be used.
--==============================================================================
procedure emit_dialog_close_html (
    p_target in varchar2,
    p_wrap   in boolean default true);

--==============================================================================
-- Returns the dialog JavaScript cancel code of the page template which is used
-- by the current page. If the page itself doesn't have an assigned dialog cancel
-- code defined, the theme default will be used.
--==============================================================================
function get_dialog_cancel_code return varchar2;

--==============================================================================
-- Purge the cache of the specified application, page and optional for
-- the specified user. If the user isn't specified, all cached versions of
-- that page are purged.
--==============================================================================
procedure purge_cache (
    p_application_id in number,
    p_page_id        in number,
    p_user_name      in varchar2 default null,
    p_current_session_only in boolean default false );

--==============================================================================
-- Returns the id of the specified page alias. If the parameter p_page_id_or_alias
-- is a numeric value. The function also checks if the specified page exists.
--==============================================================================
function get_page_id (
    p_application_id   in number default wwv_flow_security.g_flow_id,
    p_page_id_or_alias in varchar2 )
    return number;

--==============================================================================
-- Returns TRUE if the current page should be rendered read only and FALSE if not.
--==============================================================================
function is_read_only return boolean;

--==============================================================================
-- Given a page_id and the application id, return page info:
-- * page mode - NORMAL, MODAL or NON_MODAL
-- * rejoin_existing_sessions
--==============================================================================
function get_page_info (
    p_application_id    in number,
    p_page_id           in number,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return t_page_info;

--==============================================================================
-- Given an application id and page id, return the checksum for a dialog page
--==============================================================================
function get_dialog_checksum (
    p_application_id in number default wwv_flow_security.g_flow_id,
    p_page_id        in number default wwv_flow.g_flow_step_id)
    return varchar2;

--==============================================================================
-- Set the browser frame for Dialog Page
--==============================================================================
procedure set_dialog_browser_frame;

--==============================================================================
-- Render the current page
--==============================================================================
procedure render;

--==============================================================================
-- Renders the error page with the specified values in p_error.
--==============================================================================
procedure render_error_page (
    p_error in wwv_flow_error_api.t_error );

--==============================================================================
-- Resets all global variables.
-- Note: Always call this procedure if the current page changes!
--==============================================================================
procedure reset;
--
end wwv_flow_page;
/
show errors

set define '^'
