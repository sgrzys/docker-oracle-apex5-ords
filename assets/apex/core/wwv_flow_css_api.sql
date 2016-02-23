set define off
set verify off

prompt ...wwv_flow_css_api
create or replace package wwv_flow_css_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_css_api.sql
--
--    DESCRIPTION
--      This package contains utility functions for adding CSS styles to the HTTP output.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      02/27/2012 - Created
--    pawolf      04/05/2012 - Added support for content delivery networks (feature #819)
--    pawolf      05/03/2012 - Added p_media_query and p_ie_condition to add_file (feature 930)
--    pawolf      04/22/2013 - Deprecated APIs (feature ##1169)
--    pawolf      05/05/2015 - In add_file: added p_key parameter (bug #21031849)
--
--------------------------------------------------------------------------------
--
--
--==============================================================================
-- Global constants
--==============================================================================
c_library_jquery        constant varchar2(20) := 'jquery';
c_library_jquery_ui     constant varchar2(20) := 'jquery-ui';
c_library_jquery_mobile constant varchar2(20) := 'jquery.mobile';
--
--
--==============================================================================
-- This procedure adds the link tag to load a CSS file.
-- If a file has already been added, it will not be added a second time.
-- Parameter:
--   p_name:           has to be specified without .js
--   p_directory:      has to have a trailing slash
--   p_version:        version identifier which should be added to the library name (optional)
--   p_skip_extension: if true the extension .css is NOT added (optional)
--   p_media_query:    value which should be set as media query (optional)
--   p_ie_condition:   condition which should be used as Internet Explorer condition (optional)
--   p_key:            is used to identify if the file has already been loaded (optional),
--                     if not specified the key will default to the generated URL
--==============================================================================
procedure add_file (
    p_name           in varchar2,
    p_directory      in varchar2 default wwv_flow.g_image_prefix||'css/',
    p_version        in varchar2 default null,
    p_skip_extension in boolean  default false,
    p_media_query    in varchar2 default null,
    p_ie_condition   in varchar2 default null,
    p_key            in varchar2 default null );
--
--==============================================================================
-- This procedure adds the link tag to load a 3rd party css file (supported
-- libraries: jQuery, jQueryUI, jQueryMobile) and will also take into account
-- the specified Content Delivery Network for the application.
--
-- If a library has already been added, it will not be added a second time.
--
-- Parameter:
--   p_library:     Use one of the c_library_* constants
--   p_file_name:   Has to be specified without version, .min and .css
--   p_directory:   Directory where the file p_file_name is located (optional)
--   p_version:     If no value is provided then the same version APEX ships
--                  will be used (optional)
--   p_media_query: value which should be set as media query (optional)
--
-- Examples:
--
--   add_3rd_party_library_file (
--     p_library   => c_library_jquery_ui,
--     p_file_name => 'jquery.ui.accordion' )
--
--==============================================================================
procedure add_3rd_party_library_file (
    p_library     in varchar2,
    p_file_name   in varchar2,
    p_directory   in varchar2 default null,
    p_version     in varchar2 default null,
    p_media_query in varchar2 default null );
--
--==============================================================================
-- Adds a CSS style snippet which is included inline into the HTML output
-- eg. You can use this procedure to add new css style declarations.
--
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_style: CSS style snippet. eg: #test { color:#fff }
--   p_key:   identifier for the style snippet. If specified and a style snippet with
--            the same name has already been added the new style snippet will be ignored.
--==============================================================================
procedure add (
    p_css in varchar2,
    p_key in varchar2 default null );
--
--==============================================================================
-- *** API Deprecated, use wwv_flow_api.create_app_static_file and create_workspace_static_file instead ***
--==============================================================================
function new_css_repository_record (
    p_name                  in out varchar2,
    p_varchar2_table            in sys.dbms_sql.varchar2_table,
    p_mimetype                  in varchar2,
    p_flow_id                   in number,
    p_notes                     in varchar2 )
    return number
    ;
--
--==============================================================================
-- *** API Deprecated ***
--==============================================================================
procedure remove_css (
    p_css_name in varchar2,
    p_flow_id  in number   default null );
--
end wwv_flow_css_api;
/
show errors

set define '^'
