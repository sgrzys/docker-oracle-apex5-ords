set define off
set verify off

prompt ...wwv_flow_css
create or replace package wwv_flow_css as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_css.sql
--
--    DESCRIPTION
--      This package contains utility functions for adding CSS styles to the HTTP output.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      01/04/2010 - Created
--    pawolf      05/18/2010 - Bug# 9602440: Added caching for CSS code
--    pawolf      12/03/2010 - Changed APEX version identifier to _4_1
--    pawolf      04/05/2012 - Added support for content delivery networks (feature #819)
--    pawolf      05/03/2012 - Added p_media_query and p_ie_condition to add_file (feature 930)
--    pawolf      05/08/2012 - Added p_emit_immediately to different APIs
--    pawolf      06/03/2013 - Added reset
--    pawolf      01/14/2013 - Added add_apex_file, add_apex_ui_file and add_app_ui_file
--    msewtz      04/17/2014 - Added add_jqm_ui_file
--    pawolf      06/18/2014 - Removed apex_app_file, add_apex_ui_file and add_jqm_ui_file from public API
--    pawolf      05/05/2015 - In add_file: added p_key parameter (bug #21031849)
--
--------------------------------------------------------------------------------
--
--
--==============================================================================
-- This procedure adds the link tag to load a CSS file.
-- If a file has already been added, it will not be added a second time.
-- Parameter:
--   p_name:             has to be specified without .js
--   p_directory:        has to have a trailing slash
--   p_version:          version identifier which should be added to the library name (optional)
--   p_skip_extension:   if true the extension .css is NOT added (optional)
--   p_media_query:      value which should be set as media query (optional)
--   p_ie_condition:     condition which should be used as Internet Explorer condition (optional)
--   p_emit_immediately: TRUE if the URLs should immediately be written to the HTTP buffer (optional)
--   p_key:              is used to identify if the file has already been loaded (optional),
--                       if not specified the key will default to the generated URL
--==============================================================================
procedure add_file (
    p_name             in varchar2,
    p_directory        in varchar2 default wwv_flow.g_image_prefix||'css/',
    p_version          in varchar2 default null,
    p_skip_extension   in boolean  default false,
    p_media_query      in varchar2 default null,
    p_ie_condition     in varchar2 default null,
    p_emit_immediately in boolean  default false,
    p_key              in varchar2 default null );
--
--==============================================================================
-- This procedure adds the link tag to load a 3rd party css file (supported
-- libraries: jQuery, jQueryUI, jQueryMobile) and will also take into account
-- the specified Content Delivery Network for the application.
--
-- If a library has already been added, it will not be added a second time.
--
-- Parameter:
--   p_library:          Use one of the c_library_* constants
--   p_file_name:        Has to be specified without version, .min and .css
--   p_directory:        Directory where the file p_file_name is located (optional)
--   p_version:          If no value is provided then the same version APEX ships
--                       will be used (optional)
--   p_media_query:      value which should be set as media query (optional)
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--
-- Examples:
--
--   add_3rd_party_library_file (
--     p_library   => c_library_jquery_ui,
--     p_file_name => 'jquery.ui.accordion' )
--
--==============================================================================
procedure add_3rd_party_library_file (
    p_library          in varchar2,
    p_file_name        in varchar2,
    p_directory        in varchar2 default null,
    p_version          in varchar2 default null,
    p_media_query      in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Adds the link tag to load a list of URLs specified in p_urls.
-- The URLs specified in p_urls can contain the placeholder #MIN# which will
-- get replaced by .min or an empty string depending if the page is viewed
-- in debug mode or not.
--
-- Parameter:
--   p_urls:             list of urls delimited by a new line
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add_file_urls (
    p_urls             in varchar2,
    p_emit_immediately in boolean default false );
--
--==============================================================================
-- Adds a CSS style snippet which is included inline into the HTML output
-- eg. You can use this procedure to add new css style declarations.
--
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_style:            CSS style snippet. eg: #test { color:#fff }
--   p_key:              identifier for the style snippet. If specified and a style snippet with
--                       the same name has already been added the new style snippet will be ignored. (optional)
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add (
    p_css              in varchar2,
    p_key              in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Adds a CSS style snippet into an internal buffer which is emitted by
-- the call to emit later in the page rendering.
--
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_style:            CSS style snippet. eg: .test { color:#fff }
--   p_key:              identifier for the style snippet. If specified and a style snippet with
--                       the same name has already been added the new style snippet will be ignored.
--   p_type:             name of the style type. eg: INLINE, LINK
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add (
    p_css              in varchar2,
    p_type             in varchar2,
    p_key              in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Emits CSS style snippets which have been added to the internal buffer.
--==============================================================================
procedure emit;
--
--==============================================================================
-- Returns the standard CSS files of APEX. If wwv_flow.g_include_apex_css_js_yn
-- is set to no, nothing is returned
--==============================================================================
function get_standard_files return varchar2;
--
--==============================================================================
-- Saves the buffered CSS code in the page/region cache table wwv_flow_page_code_cache.
-- If p_region_id is specified, only the CSS code for that region is saved.
--==============================================================================
procedure save_in_cache (
    p_page_cache_id in number,
    p_region_id     in number default null );
--
--==============================================================================
-- Clears the buffered CSS code.
--==============================================================================
procedure reset;
--
end wwv_flow_css;
/
show errors

set define '^'
