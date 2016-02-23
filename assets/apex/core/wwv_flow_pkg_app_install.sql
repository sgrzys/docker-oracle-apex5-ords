set define '^' verify off
prompt ...wwv_flow_pkg_app_install
create or replace package wwv_flow_pkg_app_install as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011. All Rights Reserved.
--
--    NAME
--      wwv_flow_pkg_app_install.sql
--
--    DESCRIPTION
--      API to install packaged applications.
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    SCRIPT ARGUMENTS
--      NONE
--
--
--    RUNTIME DEPLOYMENT
--      YES
--
--    MODIFIED  (MM/DD/YYYY)
--    cbcho      10/21/2011 - Created
--    msewtz     04/17/2012 - Added unlock_db_app
--    hfarrell   05/21/2012 - Added install_websheet, deinstall_websheet
--    hfarrell   05/31/2012 - Added update_db_app (feature #921)
--    hfarrell   06/11/2012 - Added app_locking function
--    cbcho      07/03/2012 - Exposed start_log, end_log (feature #992)
--    cbcho      07/06/2012 - Added t_install_log, g_install_log (feature #992)
--    cbcho      07/09/2012 - Moved packaged application log logic to wwv_flow_pkg_app_log
--    cneumuel   07/31/2012 - install: install packaged app and configure authentication scheme (feature #1010)
--    hfarrell   01/28/2013 - Updated update_db_app to remove unrequired parameter p_schema (part of fix for bug #16213494)
--    cneumuel   02/06/2013 - In install_websheet: sets copied websheets's auth scheme now and supports NATIVE_CLOUD_IDM on the cloud (bug #16287458)
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# SAMPLE DATABASE APPLICATION PROCEDURES
--#
--##############################################################################

--==============================================================================
-- Unlock Database Application
-- p_id:     The ID of the Database application to be unlocked
--==============================================================================
procedure unlock_db_app (
	p_id in number);

--==============================================================================
-- Remove Database Application --
-- p_id:                The Database application ID to be deleted
-- p_supporting_objs:   Setting whether the Supporting Objects should also be deleted: Y or No
--==============================================================================
procedure deinstall_db_app (
  p_id                in number,
  p_supporting_objs   in varchar2 default 'Y');

--==============================================================================
-- Install Database Application
-- p_app_id:    The internal Database application ID for the packaged application
-- p_schema:    The schema the application is being installed to
-- p_id:        The application ID of the new application
--==============================================================================
procedure install_db_app (
  p_app_id            in number,
  p_schema            in varchar2,
  p_id                in number default wwv_flow_utilities.minimum_free_flow);

--==============================================================================
-- Update Database Application
-- p_app_id:    The internal Database application ID for the packaged application
-- p_id:        The application ID of the existing application being updated
--==============================================================================
procedure update_db_app (
  p_app_id            in number,
  p_id                in number);

--##############################################################################
--#
--# SAMPLE WEBSHEET APPLICATION PROCEDURES
--#
--##############################################################################

--==============================================================================
-- Deinstall Websheet Application
-- p_id:     The ID of the Websheet application to be unlocked
--==============================================================================
procedure deinstall_websheet (
	p_id                in number);

--==============================================================================
-- Install Websheet Application
-- p_app_id:      The internal Websheet application ID for the packaged application
-- p_auth_scheme: The authentication scheme for this websheet. Allowed values:
--                * NATIVE_APEX_ACCOUNTS
--                * NATIVE_CLOUD_IDM (only on the cloud)
-- p_id:          The application ID of the existing application being updated
--==============================================================================
procedure install_websheet (
    p_app_id      in number,
    p_auth_scheme in varchar2,
    p_id          in number default wwv_flow_utilities.minimum_free_flow);

--##############################################################################
--#
--# WIZARD API
--#
--##############################################################################

--==============================================================================
-- Install packaged application.
--
-- This procedure is executed by 4000:83, when a developer clicks on the INSTALL
-- button.
--
-- ARGUMENTS
-- * p_app_type:          DATABASE or WEBSHEET
-- * p_app_id:            The pre-defined packaged application
-- * p_schema:            The runtime schema for the new app
-- * p_auth_scheme:       The internal name of the new app's authentication
--                        plugin, NATIVE_CLOUD_IDM, NATIVE_APEX_ACCOUNTS, ...
-- * p_auth_attribute_xx: Authentication plugin attribute 1-15
--
-- RETURN VALUE
--   The newly installed application's id
--==============================================================================
function install (
    p_app_type          in varchar2,
    p_app_id            in number,
    p_schema            in varchar2,
    p_auth_scheme       in varchar2,
    p_auth_attribute_01 in varchar2 default null,
    p_auth_attribute_02 in varchar2 default null,
    p_auth_attribute_03 in varchar2 default null,
    p_auth_attribute_04 in varchar2 default null,
    p_auth_attribute_05 in varchar2 default null,
    p_auth_attribute_06 in varchar2 default null,
    p_auth_attribute_07 in varchar2 default null,
    p_auth_attribute_08 in varchar2 default null,
    p_auth_attribute_09 in varchar2 default null,
    p_auth_attribute_10 in varchar2 default null,
    p_auth_attribute_11 in varchar2 default null,
    p_auth_attribute_12 in varchar2 default null,
    p_auth_attribute_13 in varchar2 default null,
    p_auth_attribute_14 in varchar2 default null,
    p_auth_attribute_15 in varchar2 default null )
    return number;

--##############################################################################
--#
--# UTILITIES
--#
--##############################################################################

--==============================================================================
-- Create User
--==============================================================================
procedure create_user (
    p_username      in varchar2 default null,
    p_email         in varchar2 default null,
    p_password      in varchar2 default null);

--==============================================================================
function app_locking (
    p_app_id         in number,
    p_app_type       in varchar2
) return varchar2;

end wwv_flow_pkg_app_install;
/
show errors
