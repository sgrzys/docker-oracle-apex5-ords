set define '^' verify off
prompt ...wwv_flow_forms
create or replace package wwv_flow_forms as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    DESCRIPTION
--      Flow form rendering engine package specification.
--
--    SECURITY
--
--    INTERNATIONALIZATION
--
--    NOTES
--      This program generates HTML form fields, this package is a utility package to wwv_flow.
--
--    RUNTIME DEPLOYMENT: YES
--
--    SCRIPT ARGUMENTS
--      none
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   01/26/2000 - Created
--      mhichwa   05/14/2000 - Added g_current_item_sequence function increment_item_sequence
--      mhichwa   12/05/2001 - Added g_i
--      mhichwa   02/20/2002 - Added g_current_form_element
--      tmuth     10/14/2002 - Added g_current_x
--      sspadafo  08/31/2006 - Increased size of g_current_form_element to 256 (Bug 5503306)
--      pawolf    04/02/2009 - Added get_element as public function
--      pawolf    08/17/2009 - Added parameter p_plug_form_tab_attr
--      msewtz    04/08/2011 - Added p_render_form_items_in_table to display_positional_form  (feature 586)
--      pawolf    04/27/2011 - Added current_subs as public API (feature 679)
--      pawolf    06/01/2011 - Added get_default_value (feature 629)
--      pawolf    04/10/2012 - Added read only on page and region level (feature# 570)
--      cneumuel  05/24/2012 - Removed display_template_form (dead code)
--      pawolf    05/31/2012 - Continued work on grid layout (feature #936)
--      pawolf    06/05/2012 - Continued work on grid layout (feature #936)
--      pawolf    06/15/2012 - Added region display points support (feature# #936)
--      pawolf    06/27/2012 - Added page display points support (feature #936)
--      cneumuel  08/08/2012 - Moved g_current_form_element to package body
--      cneumuel  04/04/2014 - Item based button to page button migration (feature #1314)
--                           - Removed init_form; added init_button, init_item
--                           - moved wwv_flow_forms.init_button to wwv_flow_button.init
--      cneumuel  04/07/2014 - Changed init_item to procedure
--      cneumuel  05/30/2014 - Added get_current_item_sequence, set_current_item_sequence (feature #1401)
--      pawolf    01/12/2015 - Added p_page_dp_has_grid_support handling (bug #18704296)
--
--------------------------------------------------------------------------------

g_i                     int := 0; -- index of wwv_flow.g_item_cattributes

--==============================================================================
-- Returns the current value of the item sequence, which is responsible for
-- getting distinct names for HTML input elements.
--
-- SEE ALSO
--   set_current_item_sequence, get_html_page_item_name
--==============================================================================
function get_current_item_sequence
    return pls_integer;

--==============================================================================
-- Sets the current value of the item sequence, which is responsible for
-- getting distinct names for HTML input elements.
--
-- ARGUMENTS
--   p_sequence      item sequence. must be between 0 and 200.
--
-- SEE ALSO
--   get_current_item_sequence, get_html_page_item_name
--==============================================================================
procedure set_current_item_sequence (
    p_sequence in pls_integer );

--==============================================================================
-- Returns the name attribute which has to be used for the HTML input element if
-- you want that the value of the element is stored in session state when the
-- page is submitted. If you use a HTML input element which returns multiple
-- values (eg. select list with multiple="multiple") you have
-- to set p_is_multi_value.
--
-- SEE ALSO
--   get_current_item_sequence, set_current_item_sequence
--==============================================================================
function get_html_page_item_name (
    p_is_multi_value in boolean := false )
    return varchar2;

--==============================================================================
-- Set the page item/button request value
--==============================================================================
procedure determine_component_value (
    p_id                      in number,
    p_use_cache_before_def    in varchar2,
    p_display_as              in varchar2,
    p_name                    in varchar2,
    p_attribute_01            in varchar2,
    p_is_persistent           in varchar2,
    p_source_type             in varchar2,
    p_source                  in varchar2,
    p_source_post_computation in varchar2,
    p_default_type            in varchar2,
    p_default                 in varchar2,
    p_escape_on_http_input    in varchar2,
    p_encrypted               in varchar2 );

--==============================================================================
-- initialize p_item.is_ok_to_display and item session state.
--==============================================================================
procedure init_item (
    p_item in out nocopy wwv_flow.t_item );

--==============================================================================
procedure emit_form (
    p_region_id                in number,
    p_region_components        in wwv_flow.t_region_components,
    p_page_template_id         in number,
    p_page_dp_has_grid_support in boolean,
    p_region_template_id       in number,
    p_max_fixed_grid_columns   in pls_integer,
    p_grid_template            in wwv_flow_template.t_grid_template,
    p_grid_attributes          in varchar2,
    p_region_is_read_only      in boolean );

--==============================================================================
function current_subs (
    p_text    in varchar2,
    p_i       in number                              default wwv_flow_forms.g_i,
    p_type_id in wwv_flow.t_region_component_type_id default wwv_flow.c_region_component_item )
    return varchar2;

--==============================================================================
function get_display_value (
    p_default_type in varchar2,
    p_default      in varchar2 )
    return varchar2;

end wwv_flow_forms;
/
show errors
