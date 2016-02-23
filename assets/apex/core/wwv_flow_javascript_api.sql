set define off
set verify off

prompt ...wwv_flow_javascript_api
create or replace package wwv_flow_javascript_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_javascript_api.sql
--
--    DESCRIPTION
--      This package contains utility functions for creating or interacting with javascript.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      02/27/2012 - Created
--    pawolf      04/05/2012 - Added support for content delivery networks (feature #819)
--    pawolf      05/03/2012 - Added p_ie_condition to add_library (feature 930)
--    pawolf      07/16/2013 - Added c_library_jquery_ie to support different jQuery versions (feature# 1098)
--
--------------------------------------------------------------------------------
--
--
--==============================================================================
-- Global constants
--==============================================================================
c_library_jquery        constant varchar2(20) := 'jquery';
c_library_jquery_ie     constant varchar2(20) := 'jquery-ie';
c_library_jquery_ui     constant varchar2(20) := 'jquery-ui';
c_library_jquery_mobile constant varchar2(20) := 'jquery.mobile';
--
--
--==============================================================================
-- Adds the script tag to load a javascript library.
-- If a library has already been added, it will not be added a second time.
-- Parameter:
--   p_name:           has to be specified without .js
--   p_directory:      has to have a trailing slash
--   p_version:        version identifier which should be added to the library name (optional)
--   p_check_to_add_minified: 
--                     if true, the API will test if it is appropriate to add '.min' extension.
--                     this will be added on APEX Production instances, that are not running debug mode (optional)
--   p_skip_extension: if true the extension .js is NOT added (optional)
--   p_ie_condition:   condition which should be used as Internet Explorer condition (optional)
--   p_key:            is used to identify if the library has already been loaded (optional),
--                     if not specified the key will default to p_directory||p_name||p_version
--==============================================================================
procedure add_library (
    p_name                  in varchar2,
    p_directory             in varchar2,
    p_version               in varchar2 default null,
    p_check_to_add_minified in boolean  default false,
    p_skip_extension        in boolean  default false,
    p_ie_condition          in varchar2 default null,
    p_key                   in varchar2 default null );
--
--==============================================================================
-- Adds the script tag to load a 3rd party javascript library file (supported
-- libraries: jQuery, jQueryUI) and will also take into account the specified
-- Content Delivery Network for the application.
--
-- If a library has already been added, it will not be added a second time.
--
-- Parameter:
--   p_library:   Use one of the c_library_* constants
--   p_file_name: Has to be specified without version, .min and .js
--   p_directory: Directory where the file p_file_name is located (optional)
--   p_version:   If no value is provided then the same version APEX ships
--                will be used (optional)
--
-- Examples:
--
--   add_3rd_party_library_file (
--     p_library   => c_library_jquery_ui,
--     p_file_name => 'jquery.ui.draggable' )
--
--   add_3rd_party_library_file (
--     p_library   => c_library_jquery_ui,
--     p_file_name => 'jquery.ui.datepicker-' || wwv_flow.g_browser_language,
--     p_directory => 'i18n/oracle/' )
--
--==============================================================================
procedure add_3rd_party_library_file (
    p_library   in varchar2,
    p_file_name in varchar2,
    p_directory in varchar2 default null,
    p_version   in varchar2 default null );
--
--==============================================================================
-- Adds a javascript code snippets to the HTML output which is executed at the
-- onload event.
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 'abc');
--   p_key:  name of the key. eg: APEX_WIDGET
--==============================================================================
procedure add_onload_code (
    p_code in varchar2,
    p_key  in varchar2 default null );
--
--==============================================================================
-- Adds a code snippet which is included inline into the HTML output
-- eg. You can use this procedure to add new functions or global
--     variable declarations.
-- Note: if you want to execute code, you should use add_onload_code
--
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 123);
--   p_key:  identifier for the code snippet. If specified and a code snippet with
--           the same name has already been added the new code snippet will be ignored.
--==============================================================================
procedure add_inline_code (
    p_code in varchar2,
    p_key  in varchar2 default null );
--
--==============================================================================
-- Escapes a text so that it can be used in JavaScript without problems.
-- Replaces \ with \\, / with \/, " with \u0022, ' with \u0027, tab with \t,
-- chr(10) with \n.
--==============================================================================
function escape (
    p_text in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns the escaped text surrounded by double quotes. eg: "That\'s a test"
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in varchar2,
    p_add_comma in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns the number, if p_value is NULL the value null is returned.
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in number,
    p_add_comma in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns a JavaScript boolean (true, false, null)
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in boolean,
    p_add_comma in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns the date as a javascript object, if p_value is NULL the value null is returned.
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in date,
    p_add_comma in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and its escaped text surrounded by double quotes.
-- eg: test:"That\'s a test"
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in varchar2,
    p_omit_null in boolean default true,
    p_add_comma in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and its number, if p_value is NULL the value null is
-- returned. eg. test:123 or test:null
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in number,
    p_omit_null in boolean default true,
    p_add_comma in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and a JavaScript boolean (true, false, null)
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in boolean,
    p_omit_null in boolean default true,
    p_add_comma in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and its date, if p_value is NULL the value null is
-- returned. eg. test:new Date(2009,0,1) or test:null
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in date,
    p_omit_null in boolean default true,
    p_add_comma in boolean default true )
    return varchar2;
--
--
end wwv_flow_javascript_api;
/
show errors

set define '^'
