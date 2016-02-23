set define off verify off
prompt ...wwv_flow_cdn
create or replace package wwv_flow_cdn as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012-2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_cdn.sql
--
--    DESCRIPTION
--      This package is responsible for gettings files from a
--      content delivery networks in the runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/05/2012 - Created
--      pawolf    07/16/2013 - Added c_library_jquery_ie to support different jQuery versions (feature# 1098)
--      cneumuel  01/27/2014 - Added get_all (feature #1065)
--      pawolf    01/25/2015 - Added get_base_url (bug #20414376)
--      cneumuel  01/26/2015 - Added modernizr (bug #20415862)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================
subtype t_library is varchar2(13);
c_library_jquery        constant t_library := 'jquery';
c_library_jquery_ie     constant t_library := 'jquery-ie';
c_library_jquery_ui     constant t_library := 'jquery-ui';
c_library_jquery_mobile constant t_library := 'jquery.mobile';
c_library_modernizr     constant t_library := 'modernizr';

c_file_type_js          constant varchar2(3)  := 'js';
c_file_type_css         constant varchar2(3)  := 'css';

--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Returns the URL for a 3rd party library which is stored on a CDN.
-- If the application hasn't specified to use a CDN, the files which ship
-- with APEX will be returned.
-- p_library:   Use one of the c_library_* constants
-- p_file_name: If no value is provided the main js/css file will be returned
-- p_file_type: Use one of the c_file_type_* constants
-- p_directory: Directory where the file p_file_name is located
-- p_version:   If no value is provided the version required by APEX will be used
--
-- Examples:
--
--   get_url (
--     p_library   => wwv_flow_cdn.c_library_jquery,
--     p_file_type => wwv_flow_cdn.c_file_type_js )
--
--   get_url (
--     p_library   => wwv_flow_cdn.c_library_jquery_ui,
--     p_file_name => 'jquery.ui.draggable',
--     p_file_type => wwv_flow_cdn.c_file_type_js )
--
--   get_url (
--     p_library   => wwv_flow_cdn.c_library_jquery_ui,
--     p_file_name => 'jquery.ui.datepicker-' || wwv_flow.g_browser_language,
--     p_file_type => wwv_flow_cdn.c_file_type_js,
--     p_directory => 'i18n/oracle/' )
--
--==============================================================================
function get_url (
    p_library   in varchar2,
    p_file_name in varchar2 default null,
    p_file_type in varchar2,
    p_directory in varchar2 default null,
    p_version   in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns the base URL for a 3rd party library which is stored on a CDN.
-- If the application hasn't specified to use a CDN, the files which ship
-- with APEX will be returned.
-- p_library:   Use one of the c_library_* constants
-- p_version:   If no value is provided the version required by APEX will be used
--
-- Examples:
--
--   get_base_url (
--     p_library => wwv_flow_cdn.c_library_jquery )
--
--==============================================================================
function get_base_url (
    p_library in varchar2,
    p_version in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns a space separated list of supported content delivery networks
--==============================================================================
function get_all
    return varchar2;

end wwv_flow_cdn;
/
show errors

set define '^'
