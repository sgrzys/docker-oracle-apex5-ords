set define off verify off
prompt ...wwv_flow_button
create or replace package wwv_flow_button as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--     wwv_flow_button.plb
--
--    DESCRIPTION
--     This package is responsible for handling buttons.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--     arayner  03/03/2011 - Created
--     arayner  03/17/2011 - (Retrospective comment) Added render_native_button and get_button_redirect_url functions (feature #385) 
--     arayner  03/17/2011 - Reworked render_native_button function parameters (feature #385)
--     arayner  03/17/2011 - Changed render_native_button parameter p_button_id to p_button_static_id (feature #385)
--     arayner  03/31/2011 - Added constants for available actions (feature 385)
--     arayner  04/01/2011 - Added constant for JAVASCRIPT action (feature 385)
--     arayner  04/11/2011 - Improvements to render_native_button (feature 385)
--     arayner  04/11/2011 - In render_native_button, changed p_button_image_alt parameter name to p_button_label (feature 385)
--     arayner  04/12/2011 - Added procedure version of render_native_button that just prints out the button code to the buffer (feature 385)
--     arayner  04/12/2011 - render_native_button now handles all necessary substitution and escaping for button properties, also added overloaded procedure with the same name to just print straight to HTTP buffer (feature 385)
--     arayner  04/14/2011 - Added constant for REPORT action (feature 667)
--     arayner  05/11/2011 - Changed p_button_cattributes parameter name to p_button_attributes in render_native_button function and procedure (feature 667)
--     pawolf   03/06/2012 - Added CSS classes support for buttons (feature# 815)
--     cneumuel 11/28/2013 - Page button migration (feature #1314)
--     pawolf   12/12/2013 - Added p_id to interfaces
--     pawolf   12/12/2013 - Added p_page_id to render_native_button
--     arayner  01/13/2014 - Retrospective comment: Added redirect to app logic
--     msewtz   03/12/2014 - Added icon css classes to buttons
--     msewtz   03/28/2014 - Added button template options (feature 1394)
--     cneumuel 04/04/2014 - Removed obsolete render_native_button procedure (feature #1314)
--                         - Renamed render_native_button to render, moved wwv_flow_forms.init_button to wwv_flow_button.init
--     cneumuel 04/07/2014 - Changed init to procedure. Added is_ok_to_display and set_component (feature #1314)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================
subtype t_action is wwv_flow_step_buttons.button_action%type;
c_action_submit         constant t_action := 'SUBMIT';
c_action_redirect_url   constant t_action := 'REDIRECT_URL';
c_action_redirect_page  constant t_action := 'REDIRECT_PAGE';
c_action_redirect_app   constant t_action := 'REDIRECT_APP';
c_action_defined_by_da  constant t_action := 'DEFINED_BY_DA';
c_action_javascript     constant t_action := 'JAVASCRIPT';
c_action_report         constant t_action := 'REPORT';
c_action_reset          constant t_action := 'RESET';
c_action_next_page      constant t_action := 'NEXT_PAGE';
c_action_previous_page  constant t_action := 'PREVIOUS_PAGE';


--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- initialize non-database columns of p_button. if the button has a
-- request_source_type, init() computes the value and saves it in transient
-- session state, for compatibility with pre 5.0 code.
--
-- this procedure computes private_is_ok_to_display if request_source_type is
-- not null, because computing the source value can be expensive.
--==============================================================================
procedure init (
    p_button               in out nocopy wwv_flow.t_button );

--==============================================================================
-- return whether the button can be displayed. if the button is not yet
-- initialized, this function performs the initialization as a side effect.
--
-- always use this function instead of accessing p_button.private_is_ok_to_display.
--==============================================================================
function is_ok_to_display (
    p_button               in out nocopy wwv_flow.t_button )
    return boolean;

--==============================================================================
-- put the button on top of the component stack
--==============================================================================
procedure set_component (
    p_button               in wwv_flow.t_button );

--==============================================================================
-- Function returning the HTML for an APEX page button
--==============================================================================
function render (
    p_idx          in pls_integer,
    p_button       in wwv_flow.t_button )
    return varchar2;

--==============================================================================
-- Function that returns the button redirect_url, based on button attributes
--==============================================================================
function get_button_redirect_url (
    p_button_action in varchar2,
    p_clear_page    in varchar2,
    p_clear_cache   in varchar2,
    p_page_id       in varchar2,
    p_request       in varchar2,
    p_arg_names     in varchar2,
    p_arg_values    in varchar2,
    p_url_target    in varchar2 )
    return varchar2;


end wwv_flow_button;
/
show errors

set define '^'
