set define off
set verify off

prompt ...wwv_flow_page_dev

create or replace package wwv_flow_page_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_page_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling pages in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/13/2012 - Created
--      pawolf    03/19/2012 - Added get_template_id
--      pawolf    06/20/2012 - Added global page support (feature #987)
--      pawolf    11/13/2012 - Added is_global_page (bug #14744294)
--      hfarrell  11/21/2013 - Added get_page_mode (feature #587)
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
-- Returns the name of the UI type for which the specified page has been designed
-- for.
--==============================================================================
function get_ui_type (
    p_application_id in number,
    p_page_id        in number )
    return varchar2;

--==============================================================================
-- Returns TRUE if the specified page has been designed for Desktop browsers.
--==============================================================================
function is_desktop_ui (
    p_application_id in number,
    p_page_id        in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified page has been designed for
-- jQuery Mobile (Smartphone, Tablet or Phonegap) browsers.
--==============================================================================
function is_jqm_ui (
    p_application_id in number,
    p_page_id        in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified page has been designed for
-- jQuery Mobile Smartphones browsers.
--==============================================================================
function is_jqm_smartphone_ui (
    p_application_id in number,
    p_page_id        in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified page has been designed for
-- jQuery Mobile Tablet browsers.
--==============================================================================
function is_jqm_tablet_ui (
    p_application_id in number,
    p_page_id        in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified page is the global page of the user interface
-- referenced by that page.
--==============================================================================
function is_global_page (
    p_application_id in number,
    p_page_id        in number )
    return boolean;

--==============================================================================
-- Returns the theme id which is used by the specified page.
--==============================================================================
function get_theme_id (
    p_application_id in number,
    p_page_id        in number )
    return number;

--==============================================================================
-- Returns the page template used by the specified page. If the page
-- doesn't have a page template specified, the default page template of the
-- theme will be returned.
--==============================================================================
function get_template_id (
    p_application_id in number,
    p_page_id        in number )
    return number;

--==============================================================================
-- Returns the user interface id used by the specified page.
--==============================================================================
function get_user_interface_id (
    p_application_id in number,
    p_page_id        in number )
    return number;
--

--==============================================================================
-- Given a page_id and the application id, return the
-- page mode: NORMAL, MODAL or NON_MODAL.
--==============================================================================
function get_page_mode (
    p_application_id        in number,
    p_page_id               in number)
    return varchar2;

end wwv_flow_page_dev;
/
show errors

set define '^'
