set define '^' verify off
prompt ...wwv_flow_item_help
create or replace package wwv_flow_item_help as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2002 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_item_help.sql
--
--    DESCRIPTION
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    SCRIPT ARGUMENTS
--      none
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    rmattama    02/26/2002 - Created
--    sspadafo    07/04/2002 - Completed session id parameter passing from page to get_help_text function
--    mhichwa     12/10/2002 - Changed default color
--    sspadafo    08/17/2003 - Add p_session to get_label (Bug 3099500)
--    sspadafo    03/08/2006 - Removed get_help_text and get_label functions from spec (Bug 4922130)
--    pawolf      09/17/2009 - Added show_plugin_attribute_help
--    pawolf      06/02/2010 - Bug# 9707750: Add output options JSON and HTML to show_help
--    pawolf      07/19/2010 - Bug# 9840005: Add output options JSON and HTML to show_plugin_attribute_help
--    pawolf      04/27/2011 - Made get_help_text a public function (feature 679)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Shows the defined help text of an page item.
--==============================================================================
procedure show_help (
    p_item_id           in varchar2 default null,
    p_session           in varchar2 default null,
    p_close_button_name in varchar2 default 'Close',
    p_title_bgcolor     in varchar2 default '#cccccc;',
    p_page_bgcolor      in varchar2 default '#FFFFFF',
    p_output_format     in varchar2 default 'HTML' );

--==============================================================================
-- Shows the defined help text of a plug-in attribute.
--==============================================================================
procedure show_plugin_attribute_help (
    p_application_id     in number,
    p_builder_page_id    in number,
    p_session_id         in varchar2,
    p_plugin_type        in varchar2,
    p_plugin_name        in varchar2,
    p_attribute_scope    in varchar2,
    p_attribute_sequence in number,
    p_output_format      in varchar2 default 'JSON' );

--==============================================================================
-- Returns the help text of a page item.
-- Note: p_item_id has to be the language specific id of the page item.
--==============================================================================
function get_help_text (
    p_item_id in number )
    return varchar2;

end wwv_flow_item_help;
/
show errors
