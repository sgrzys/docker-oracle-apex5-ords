set define off
set verify off

prompt ...wwv_flow_user_interface_dev

create or replace package wwv_flow_user_interface_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_user_interface_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling user interfaces in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/12/2012 - Created
--      pawolf    03/19/2012 - Added supports_breadcrumbs APIs
--      pawolf    04/19/2012 - Added new APIs
--      pawolf    06/20/2012 - Added global page support (feature #987)
--      pawolf    07/04/2012 - Added supports_feature (feature #827)
--      hfarrell  02/26/2014 - Added supports_tabs (feature #1236)
--      hfarrell  11/10/2014 - Added dialog_page_template_exists (bug #19866717)
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
-- Returns the name of the UI type for which the specified user interface has
-- been designed for.
--==============================================================================
function get_ui_type (
    p_application_id    in number,
    p_user_interface_id in number )
    return varchar2;

--==============================================================================
-- Returns TRUE if the specified user interface has been designed for Desktop browsers.
--==============================================================================
function is_desktop_ui (
    p_application_id    in number,
    p_user_interface_id in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified user interface has been designed for
-- jQuery Mobile (Smartphone, Tablet or Phonegap) browsers.
--==============================================================================
function is_jqm_ui (
    p_application_id    in number,
    p_user_interface_id in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified user interface has been designed for
-- jQuery Mobile Smartphones browsers.
--==============================================================================
function is_jqm_smartphone_ui (
    p_application_id    in number,
    p_user_interface_id in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified user interface has been designed for
-- jQuery Mobile Tablet browsers.
--==============================================================================
function is_jqm_tablet_ui (
    p_application_id    in number,
    p_user_interface_id in number )
    return boolean;

--==============================================================================
-- Returns the current theme id of the specified user interface.
--==============================================================================
function get_current_theme_id (
    p_application_id    in number,
    p_user_interface_id in number )
    return number;

--==============================================================================
-- Returns the global page id of the specified user interface.
--==============================================================================
function get_global_page_id (
    p_application_id    in number,
    p_user_interface_id in number )
    return number;

--==============================================================================
-- Returns TRUE if the theme of the specified user interface has a default
-- breadcrumb template and templates are available.
--==============================================================================
function supports_breadcrumbs (
    p_application_id    in number,
    p_user_interface_id in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified Builder Feature is supported by the
-- UI type specified by the user interface, otherwise returns FALSE.
--==============================================================================
function supports_feature (
    p_user_interface_id in number,
    p_name              in varchar2 )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified user interface supports tabs in the 
-- given application, otherwise returns FALSE.
--==============================================================================    
function supports_tabs (
    p_application_id    in number,
    p_user_interface_id in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified application theme has a dialog page template.
--==============================================================================
function dialog_page_template_exists (
    p_user_interface_id in number,
    p_application_id    in number )
    return boolean;

end wwv_flow_user_interface_dev;
/
show errors

set define '^'
