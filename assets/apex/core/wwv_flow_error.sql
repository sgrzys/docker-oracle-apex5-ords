set define off
set verify off

prompt ...wwv_flow_error

create or replace package wwv_flow_error
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2011. All Rights Reserved.
--
--    NAME
--      wwv_flow_error.sql
--
--    DESCRIPTION
--      This package is responsible for handling errors.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    02/15/2011 - Created (feature# 544)
--      pawolf    03/31/2011 - Improved the apex_error_handling_example
--      pawolf    04/20/2011 - Renamed wwv_flow_plugin.c_inline_in_notifiction to c_inline_in_notification
--      arayner   05/27/2011 - Added get_aria_error_attributes function that returns ARIA attributes for an item that has errors (feature 422)
--      pawolf    06/24/2011 - Moved g_painting_error_page to package spec
--      pawolf    11/23/2011 - Added p_ignore_ora_error to add_error and raise_internal_error (bug# 13014776)
--      pawolf    12/21/2011 - Added clear/set_error_backtrace to get a correct error backtrace (bug 13510548)
--      pawolf    12/22/2011 - Removed clear/set_error_backtrace and moved it to wwv_dbms_sql
--      pawolf    02/27/2012 - Moved public APIs to wwv_flow_error_api
--      pawolf    02/27/2012 - Moved public constants and types to wwv_flow_error_api
--      pawolf    07/18/2012 - Added get_internal_error (bug# 13078212)
--      cneumuel  08/01/2012 - In get_internal_error: default p_escape_placeholders to false, to prevent double escaping (bug # 13078212)
--      cneumuel  06/26/2013 - Added raise_masked_internal_error: raises APEX.ERROR.INTERNAL and saves details in debug log
--      pawolf    12/18/2014 - Added e_mutating_table
--      cneumuel  05/05/2015 - Added render_exception_inline (bug #20034145)
--
--------------------------------------------------------------------------------


--==============================================================================
-- Global constants
--==============================================================================

-- used by raise_internal_error
c_internal_error_no constant pls_integer := -20987;
e_internal_error    exception;
pragma exception_init(e_internal_error, -20987);
-- used by trigger.sql
e_mutating_table    exception;
pragma exception_init(e_mutating_table, -4091);

--==============================================================================
-- Global variables
--==============================================================================
g_painting_error_page boolean := false; -- TRUE if we are currently painting the
                                        -- error page to avoid recursions

--==============================================================================
-- Adds an error message onto the error stack.
-- Note: This procedure has to be called before APEX has performed the
--       last validation/process, otherwise it will not take the error into account
--       when the inline errors are displayed.
--==============================================================================
procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2, -- use constants "used for display_location"
    p_ignore_ora_error in boolean  default false );

procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2,
    p_page_item_name   in varchar2,
    p_ignore_ora_error in boolean  default false );

procedure add_error (
    p_error_code          in varchar2, -- name of a "Text Message"
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default true,
    p_additional_info     in varchar2 default null,
    p_display_location    in varchar2, -- use constants "used for display_location"
    p_page_item_name      in varchar2,
    p_ignore_ora_error    in boolean  default false );

procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2, -- use constants "used for display_location"
    p_region_id        in number,
    p_column_alias     in varchar2 default null,
    p_row_num          in number,
    p_ignore_ora_error in boolean  default false );

procedure add_error (
    p_error_code          in varchar2, -- name of a "Text Message"
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default true,
    p_additional_info     in varchar2 default null,
    p_display_location    in varchar2, -- use constants "used for display_location"
    p_region_id           in number,
    p_column_alias        in varchar2 default null,
    p_row_num             in number,
    p_ignore_ora_error    in boolean  default false );

--==============================================================================
-- Writes the data of the error to the debug output.
--==============================================================================
procedure debug_error (
    p_error in wwv_flow_error_api.t_error );

--==============================================================================
-- Function returns TRUE if (inline) errors have occurred and FALSE if
-- no error has occurred.
--==============================================================================
function have_errors_occurred return boolean;

--==============================================================================
-- Function returns the number of errors on the stack.
--==============================================================================
function get_error_count return pls_integer;

--==============================================================================
-- Returns a string containing the relevant ARIA attributes for an item that 
-- has errors, only when running in screen reader mode.
--==============================================================================
function get_aria_error_attributes (
    p_item_name in varchar2 )
    return varchar2;

--==============================================================================
-- Function returns TRUE if for that page items errors have occurred.
--==============================================================================
function has_page_item_errors (
    p_page_item_name in varchar2 )
    return boolean;

--==============================================================================
-- Function returns TRUE if for that tabular form row errors have occurred.
--==============================================================================
function has_tabular_form_row_errors (
    p_tabular_form_region_id in number,
    p_row_num                in pls_integer )
    return boolean;

--==============================================================================
-- Function returns TRUE if for that tabular form column and row errors have occurred.
--==============================================================================
function has_tabular_form_column_errors (
    p_tabular_form_region_id in number,
    p_column_alias           in varchar2,
    p_row_num                in pls_integer )
    return boolean;

--==============================================================================
-- Procedure called from wwv_flow.show which will make the necessary adjustments
-- to the page item labels and the error stack if inline errors
-- have occurred during "Page Processing".
--==============================================================================
procedure prepare_inline_error_output;

--==============================================================================
-- Procedure to show an APEX engine error on the error page.
-- p_error_code is the name of a system message.
-- p_overwrite_internal_error can be used to remove a previously raised internal
-- error from the error stack and display the current one. If set to FALSE,
-- the previous more specific error will always be displayed.
--==============================================================================
procedure raise_internal_error (
    p_error_code               in varchar2,
    p0                         in varchar2 default null,
    p1                         in varchar2 default null,
    p2                         in varchar2 default null,
    p3                         in varchar2 default null,
    p4                         in varchar2 default null,
    p5                         in varchar2 default null,
    p6                         in varchar2 default null,
    p7                         in varchar2 default null,
    p8                         in varchar2 default null,
    p9                         in varchar2 default null,
    p_escape_placeholders      in boolean  default true,
    p_additional_info          in varchar2 default null,
    p_overwrite_internal_error in boolean  default false,
    p_ignore_ora_error         in boolean  default false );

--==============================================================================
-- Procedure to show an APEX engine error on the error page.
-- p_overwrite_internal_error can be used to remove a previously raised internal
-- error from the error stack and display the current one. If set to FALSE,
-- the previous more specific error will always be displayed.
--==============================================================================
procedure raise_internal_error (
    p_error_message            in varchar2,
    p_additional_info          in varchar2 default null,
    p_overwrite_internal_error in boolean  default false,
    p_ignore_ora_error         in boolean  default false );

--==============================================================================
-- Procedure to raise APEX.ERROR.INTERNAL, which just shows that an internal
-- error happened, together with a debug message id.
-- Details about the error are emitted as debug messages with warning level, by
-- substituting p0-p9 in p_error_message, like wwv_flow_debug.warn does.
-- p_overwrite_internal_error can be used to remove a previously raised internal
-- error from the error stack and display the current one. If set to FALSE,
-- the previous more specific error will always be displayed.
--==============================================================================
procedure raise_masked_internal_error (
    p_error_message            in varchar2,
    p0                         in varchar2 default null,
    p1                         in varchar2 default null,
    p2                         in varchar2 default null,
    p3                         in varchar2 default null,
    p4                         in varchar2 default null,
    p5                         in varchar2 default null,
    p6                         in varchar2 default null,
    p7                         in varchar2 default null,
    p8                         in varchar2 default null,
    p9                         in varchar2 default null,
    p_escape_placeholders      in boolean  default true,
    p_additional_info          in varchar2 default null,
    p_overwrite_internal_error in boolean  default false,
    p_ignore_ora_error         in boolean  default false );

--==============================================================================
-- Function to get an APEX engine error message which is internally calling
-- the application error handling function to modify the message if necessary.
--==============================================================================
function get_internal_error (
    p_error_code          in varchar2,
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default false,
    p_ignore_ora_error    in boolean  default false )
    return varchar2;

--==============================================================================
-- Returns TRUE if the current ORA error is our "Internal Error" reraise exception.
-- Always returns FALSE if p_overwrite_internal_error = TRUE or if it's not our
-- reraise exception.
--
-- The reason for not just using WHEN e_internal_error or SQLCODE = c_internal_error_no
-- is that a customer could have also used that error no for his custom error
-- messages.
--==============================================================================
function is_internal_error_on_stack (
    p_overwrite_internal_error in boolean default false )
    return boolean;

--==============================================================================
-- Returns TRUE if the current ORA error is our "Stop APEX Engine" reraise
-- exception, otherwise returns FALSE.
--
-- The reason for not just using WHEN e_stop_apex_engine or SQLCODE = c_stop_apex_engine
-- is that a customer could have also used that error no for his custom error
-- messages.
--==============================================================================
function is_stop_apex_engine_on_stack return boolean;

--==============================================================================
-- Paint sqlerrm with htp and log it. The "Stop APEX Engine" error is ignored.
-- Use this procedure to emit the error but continue with request processing.
--
-- PARAMETERS
-- * p_template Use this optional parameter to embed the error message in HTML
--              markup. The substitution parameter #MESSAGE# gets replaced with
--              the error message.
--==============================================================================
procedure render_exception_inline (
    p_template in varchar2 default null );

end wwv_flow_error;
/
show errors

set define '^'
