set define off
set verify off

prompt ...wwv_flow_javascript
create or replace package wwv_flow_javascript as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_javascript.sql
--
--    DESCRIPTION
--      This package contains utility functions for creating or interacting with javascript.
--
--    MODIFIED   (MM/DD/YYYY)
--    cbackstr    05/30/2008 - Created
--    cbackstr    06/24/2008 - Added function standard_javascript
--    pwolf       03/04/2009 - Added new procedure add_library and add_onload_code
--    pwolf       03/07/2009 - Moved wwv_flow.add_code/emit_code to wwv_flow_javascript
--    pwolf       06/09/2009 - Added new utility functions
--    pawolf      07/29/2009 - Added p_skip_extension to add_library
--    pawolf      09/03/2009 - Modified escape to use hex for single quote and quote
--    arayner     09/10/2009 - Fixed an issue with the escape function, function declaration had been shifted into a comment line
--    pawolf      12/09/2009 - Added add_value and add_attribute for date
--    arayner     02/09/2010 - Added has_code_buffered function to determine if the buffer is populated
--    pawolf      04/27/2010 - Bug# 9557775: Fixed escaping to not use hex values
--    pawolf      05/03/2010 - Bug# 9557775: correct escaping of " back to use hex code to avoid problems with HTML tag attributes
--    pawolf      05/18/2010 - Bug# 9602440: Added caching for JavaScript code
--    pawolf      12/03/2010 - Changed APEX version identifier to _4_1
--    pawolf      04/19/2011 - Added p_key to add_library
--    pawolf      04/21/2011 - Added add_apex_library and modified interface of add_library
--    jkallman    04/25/2011 - Moved c_apex_version from package body to package spec
--    arayner     10/13/2011 - Bug# 12760234: Added p_check_to_add_minified parameter to add_library
--    arayner     10/14/2011 - Bug# 12760234: Added additional comments to add_apex_library to explain a minified version of the file must be available
--    arayner     03/06/2012 - Added escaping of < and > to their unicode equivalent in escape function
--    pawolf      04/05/2012 - Added support for content delivery networks (feature #819)
--    pawolf      05/03/2012 - Added p_ie_condition to add_library (feature 930)
--    pawolf      05/08/2012 - Added p_emit_immediately to different APIs
--    pawolf      06/03/2013 - Added reset
--    pawolf      01/14/2014 - Added add_apex_ui_library
--    pawolf      03/10/2015 - Added add_jquery
--
--------------------------------------------------------------------------------
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
-- Adds the script tag to load an APEX javascript library from the /i/libraries/apex/
-- directory. If a library has already been added, it will not be added a second time.
-- Note: You must ensure the library being added also has a minified version, because
-- this procedure internally calls add_library with p_check_to_add_minified set to true.
--
-- Parameter:
--   p_name: has to be specified without version, .min and .js
--==============================================================================
procedure add_apex_library (
    p_name in varchar2 );
--
--==============================================================================
-- Adds the script tag to load an APEX javascript library from the /i/apex_ui/js/
-- directory. If a library has already been added, it will not be added a second time.
-- Note: You must ensure the library being added also has a minified version, because
-- this procedure internally calls add_library with p_check_to_add_minified set to true.
--
-- Parameter:
--   p_name: has to be specified without version, .min and .js
--==============================================================================
procedure add_apex_ui_library (
    p_name in varchar2 );
--
--==============================================================================
-- Adds the script tag to load a list of URLs specified in p_urls.
-- The URLs specified in p_urls can contain the placeholder #MIN# which will
-- get replaced by .min or an empty string depending if the page is viewed
-- in debug mode or not.
--
-- Parameter:
--   p_urls:             list of urls delimited by a new line
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add_library_urls (
    p_urls             in varchar2,
    p_emit_immediately in boolean  default false );
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
-- Emits code which has been added to the internal buffer.
--==============================================================================
procedure emit_code (
    p_type in varchar2 );
--
--==============================================================================
-- Escapes a text so that it can be used in JavaScript without problems.
-- Replaces \ with \\, / with \/, " with \u0022, ' with \u0027, tab with \t,
-- chr(10) with \n, < with \u003c, > with \u003e.
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
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the number, if p_value is NULL the value null is returned.
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in number,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns a JavaScript boolean (true, false, null)
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in boolean,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the date as a javascript object, if p_value is NULL the value null is returned.
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in date,
    p_add_comma in boolean := true )
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
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
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
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
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
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
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
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns
--   apex.jQuery('#<p_dom_id>', apex.gPageContext$)
-- where p_dom_id is properly CSS selector and JavaScript literal escaped.
--==============================================================================
function add_jquery (
    p_dom_id in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns
--   apex.jQuery('<p_selector', apex.gPageContext$)
-- where p_selector is properly JavaScript literal escaped.
--==============================================================================
function add_jquery (
    p_selector in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns true or false, depending on whether any entries exist for all, or a
-- defined type.
-- If p_type is null, all types are checked (INLINE and ONLOAD)
-- If p_type is not null, only types of type p_type are checked.
--==============================================================================
function has_code_buffered (
    p_type      in varchar2 default null )
    return boolean;
--
--==============================================================================
-- Returns a script tag with all the standard JavaScript files required by APEX.
--==============================================================================
function standard_javascript
    return varchar2;
--
--==============================================================================
-- Adds a javascript code snippets into an internal buffer which is emitted by
-- the call to emit_code later in the page rendering.
-- If an entry with this same type and key exits it will be ignored.
-- If p_key is null the snippet will always be added to the buffer.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 'abc');
--   p_key:  name of the key. eg: APEX_WIDGET
--   p_type: name of the code type. eg: ONLOAD, INLINE, LINK
--==============================================================================
procedure add_code (
    p_code             in varchar2,
    p_type             in varchar2,
    p_key              in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Saves the buffered JavaScript code in the page/region cache table wwv_flow_page_code_cache.
-- If p_region_id is specified, only the JavaScript code for that region is saved.
--==============================================================================
procedure save_in_cache (
    p_page_cache_id in number,
    p_region_id     in number default null );
--
--==============================================================================
-- Clears the buffered JavaScript code.
--==============================================================================
procedure reset;
--
end wwv_flow_javascript;
/
show errors

set define '^'
