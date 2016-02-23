set define off verify off
prompt ...wwv_flow_user_interface
create or replace package wwv_flow_user_interface as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_user_interface.sql
--
--    DESCRIPTION
--      This package is responsible for handling user interfaces by the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/09/2012 - Created
--      pawolf    03/15/2012 - Added new APIs
--      pawolf    04/19/2012 - Added new APIs
--      pawolf    06/20/2012 - Added global page support (feature #987)
--      cneumuel  06/26/2012 - Use wwv_flow_ui_type constants instead of strings for ui types (feature #791)
--      cneumuel  07/03/2012 - Added detect_user_interface (feature #791)
--      msewtz    08/09/2013 - Added get_navigation_list_id (feature 1236)
--      hfarrell  11/10/2014 - Added dialog_page_template_exists (bug #19866717)
--      pawolf    01/13/2015 - Removed dialog_page_template_exists and moved logic to wwv_flow_user_interface_dev
--
--------------------------------------------------------------------------------

--==============================================================================
-- Result of detect_user_interface
--==============================================================================
type t_ui_detection_result is record (
    user_interface_id     wwv_flow_user_interfaces.id%type,
    login_url             wwv_flow_user_interfaces.login_url%type,
    home_url              wwv_flow_user_interfaces.home_url%type,
    client_detection_html varchar2(32767) );

--
--==============================================================================
-- Returns the name of the UI type for which the specified user interface has
-- been designed for. If p_user_interface_id is not specified then the
-- user interface of the current page will be used.
--==============================================================================
function get_ui_type (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return wwv_flow_ui_type.t_name;
--
--==============================================================================
-- Returns TRUE if the specified user interface has been designed for
-- Desktop browsers. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function is_desktop_ui (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified user interface has been designed for
-- jQuery Mobile (Smartphone, Tablet or Phonegap) browsers. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function is_jqm_ui (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified user interface has been designed for
-- jQuery Mobile Smartphone browsers. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function is_jqm_smartphone_ui (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified user interface has been designed for
-- jQuery Mobile Tablet browsers. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function is_jqm_tablet_ui (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return boolean;
--
--==============================================================================
-- Returns the home URL of the specified user interface. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function get_home_url (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the login URL of the specified user interface. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function get_login_url (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the theme id of the specified user interface. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function get_theme_id (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the global page id of the specified user interface. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function get_global_page_id (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the navigation list id of the specified user interface. If p_user_interface_id
-- is not specified then the user interface of the current page will be used.
--==============================================================================
function get_navigation_list_id (
    p_user_interface_id in number default wwv_flow.g_step_user_interface_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--==============================================================================
-- Determine the user interface for the given application.
--
-- Returns a user_interface_id if the UI could be detected on the server (either
-- because there is only one UI or because server-side detection succeeded) or
-- a html code to do client-side detection.
--==============================================================================
function detect_user_interface (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return t_ui_detection_result;

end wwv_flow_user_interface;
/
show errors

set define '^'
