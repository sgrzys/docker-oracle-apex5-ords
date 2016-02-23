set define '^' verify off
prompt ...wwv_flow_debug_api
create or replace package wwv_flow_debug_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2010-2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_debug_api.sql
--
--    PUBLIC NAME
--      apex_debug
--
--    DESCRIPTION
--      Debug logging for code instrumentation
--      Public part of debug API
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  01/26/2010 - Created
--     mhichwa  01/27/2010 - added log_page_session_state
--     mhichwa  02/12/2010 - added log_log_message
--     mhichwa  04/16/2010 - added debug purge procedures
--     arayner  08/26/2010 - Added overloaded version of remove_debug_by_age with correct parameter p_older_than_days spelling (bug 10062523)
--     arayner  09/06/2010 - Removed null defaults for both parameters of remove_debug_by_age (bug 10090373)
--     arayner  09/06/2010 - Removed null default for parameter p_application_id in remove_debug_by_app (bug 10090652)
--     arayner  09/06/2010 - Removed null defaults for both parameters of remove_debug_by_view (bug 10090699)
--     arayner  10/13/2010 - Removed g_debug_message_enabled global, debug flag now handled exclusively by by wwv_flow.g_debug (bug 10100985)
--     cneumuel 03/18/2011 - Added log_trace for internal engine tracing, reduced default log level to 4
--     cneumuel 04/04/2011 - Changed default log level back to 6
--     cneumuel 02/23/2012 - Added log_dbms_output: if debug is enabled, write dbms_output.get_lines into debug log
--     cneumuel 04/12/2012 - Added log,warn,enter,trace,tochar. Renamed from wwv_flow_debug_message to wwv_flow_debug.
--     cneumuel 04/13/2012 - Removed log (PLW-05004) and added message(),info() instead
--     cneumuel 04/18/2012 - Split into wwv_flow_debug and wwv_flow_debug_api
--     cneumuel 05/02/2012 - Added enable,disable as aliases for {enable,disable}_debug_messages
--     cneumuel 05/25/2012 - In warn: only log if wwv_flow.g_debug is set
--     cneumuel 05/30/2012 - Replaced p_argxx parameters with pxx.
--     cneumuel 05/31/2012 - added error. error and trace log if the user is logged into the builder
--     cneumuel 06/06/2012 - Cleaned up documentation
--     cneumuel 03/27/2013 - limit t_log_level to range 1 .. 9 (bug #9594010)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Constants for the supported debug levels
--==============================================================================
subtype t_log_level is pls_integer range 1 .. 9;
c_log_level_error        constant t_log_level := 1; -- critical error
c_log_level_warn         constant t_log_level := 2; -- less critical error
c_log_level_info         constant t_log_level := 4; -- default level if debugging is enabled (e.g. used by apex_application.debug)
c_log_level_app_enter    constant t_log_level := 5; -- application: messages when procedures/functions are entered
c_log_level_app_trace    constant t_log_level := 6; -- application: other messages within procedures/functions
c_log_level_engine_enter constant t_log_level := 8; -- apex engine: messages when procedures/functions are entered
c_log_level_engine_trace constant t_log_level := 9; -- apex engine: other messages within procedures/functions

--##############################################################################
--#
--# C O N F I G U R I N G   D E B U G   M O D E
--#
--##############################################################################

--==============================================================================
-- Enable debug mode
--
-- Turns on debug messaging at an integer level between 1 and 9, see
-- level 1 is most important
-- level 9 is least important
-- setting p_level to 3 would log any message at level 1, 2, or 3.
--
-- ARGUMENTS
-- * p_level: The debug level, from c_log_level_error (=1) to
--            c_log_level_engine_trace (=9).
--
-- EXAMPLES
--   apex_debug.enable;
--   apex_debug.enable(apex_debug.c_log_level_app_trace);
--==============================================================================
procedure enable (
    p_level           in t_log_level default c_log_level_info );

--==============================================================================
-- Turn off debug messaging.
--
-- The disable() procedure is a shorter alias for disable_debug_messages()
--
-- EXAMPLE
--   apex_debug.disable;
--==============================================================================
procedure disable;

--==============================================================================
-- DEPRECATED
--   use enable() instead
--==============================================================================
procedure enable_debug_messages (
    p_level           in t_log_level default c_log_level_info );

--==============================================================================
-- DEPRECATED
--   use disable() instead
--==============================================================================
procedure disable_debug_messages;

--##############################################################################
--#
--# O U T P U T
--#
--##############################################################################

--==============================================================================
-- Log a formatted debug message, general version.
--
-- ARGUMENTS
-- * p_message:     The debug message. Occurrences of '%s' will
--                  be replaced by p0 to p19, like in
--                  utl_lms.format_message and C's sprintf.
--                  '%%' represents the special character '%'.
--                  Occurrences of '%<n>' will be replaced by p<n>.
-- * p0..p19:       Substitution strings for '%s' placeholders.
-- * p_max_length:  The p<n> values will be truncated to this length
-- * p_level:       The log level for the message, default c_log_level_info.
-- * p_force:       If true, this generates a debug message even if the page is
--                  not rendered in debug mode or p_level is greater than the
--                  configured debug messaging (via the URL or via the enable
--                  procedure).
--
-- EXAMPLE
--   apex_debug.message('the value of %s + %s equals %s', 3, 5, 'eight');
--
-- SEE ALSO
--   error(), warn(), info(), trace(), enter()
--==============================================================================
procedure message (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p10          in varchar2    default null,
    p11          in varchar2    default null,
    p12          in varchar2    default null,
    p13          in varchar2    default null,
    p14          in varchar2    default null,
    p15          in varchar2    default null,
    p16          in varchar2    default null,
    p17          in varchar2    default null,
    p18          in varchar2    default null,
    p19          in varchar2    default null,
    p_max_length in pls_integer default 1000,
    p_level      in t_log_level default c_log_level_info,
    p_force      in boolean     default false );

--==============================================================================
-- Log message at level c_log_level_error.
--
-- This procedure always logs, even if debug mode is turned off.
--
-- ARGUMENTS
-- * p_message:     The debug message. Occurrences of '%s' will
--                  be replaced by p0 to p19, like in
--                  utl_lms.format_message and C's sprintf.
--                  '%%' represents the special character '%'.
--                  Occurrences of '%<n>' will be replaced by p<n>.
-- * p0..p9:        Substitution strings for '%s' placeholders.
-- * p_max_length:  The p<n> values will be truncated to this length
--
-- EXAMPLE
--   apex_debug.error('Critical error %s', sqlerrm);
--
-- SEE ALSO
--   message(), warn(), info(), trace(), enter()
--==============================================================================
procedure error (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );

--==============================================================================
-- Log message at level c_log_level_warn.
--
-- This procedure always logs if a developer session exists, even if debug mode
-- is turned off.
--
-- ARGUMENTS
-- * p_message:     The debug message. Occurrences of '%s' will
--                  be replaced by p0 to p19, like in
--                  utl_lms.format_message and C's sprintf.
--                  '%%' represents the special character '%'.
--                  Occurrences of '%<n>' will be replaced by p<n>.
-- * p0..p9:        Substitution strings for '%s' placeholders.
-- * p_max_length:  The p<n> values will be truncated to this length
--
-- EXAMPLE
--   apex_debug.warn('Soft constraint %s violated: %s', 4711, sqlerrm);
--
-- SEE ALSO
--   message(), error(), info(), trace(), enter()
--==============================================================================
procedure warn (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );

--==============================================================================
-- Log message at level c_log_level_info
--
-- ARGUMENTS
-- * p_message:     The debug message. Occurrences of '%s' will
--                  be replaced by p0 to p19, like in
--                  utl_lms.format_message and C's sprintf.
--                  '%%' represents the special character '%'.
--                  Occurrences of '%<n>' will be replaced by p<n>.
-- * p0..p9:        Substitution strings for '%s' placeholders.
-- * p_max_length:  The p<n> values will be truncated to this length
--
-- EXAMPLE
--   apex_debug.info('Important: %s', 'fnord');
--
-- SEE ALSO
--   message(), error(), warn(), trace(), enter()
--==============================================================================
procedure info (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );

--==============================================================================
-- Log message at level c_log_level_app_trace.
--
-- ARGUMENTS
-- * p_message:     The debug message. Occurrences of '%s' will
--                  be replaced by p0 to p19, like in
--                  utl_lms.format_message and C's sprintf.
--                  '%%' represents the special character '%'.
--                  Occurrences of '%<n>' will be replaced by p<n>.
-- * p0..p9:        Substitution strings for '%s' placeholders.
-- * p_max_length:  The p<n> values will be truncated to this length
--
-- EXAMPLE
--   apex_debug.trace('Low-level information: %s+%s=%s', 1, 2, 3);
--
-- SEE ALSO
--   message(), error(), warn(), info(), enter()
--==============================================================================
procedure trace (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );

--==============================================================================
-- Log message at level c_log_level_app_enter.
--
-- Use enter() to log the routine name and it's arguments at the beginning of a
-- procedure/function.
--
-- ARGUMENTS
-- * p_routine_name:     name of the procedure/function
-- * p_namexx/p_valuexx: procedure/function parameter name and value
-- * p_max_length:       The p_valuexx values will be truncated to this length
--
-- EXAMPLE
--   procedure foo (
--       p_widget_id       in number,
--       p_additional_data in varchar2,
--       p_emp_rec         in emp%rowtype )
--   is
--   begin
--       apex_debug.enter('foo',
--           'p_widget_id'      , p_widget_id,
--           'p_additional_data', p_additional_data,
--           'p_emp_rec.id'     , p_emp_rec.id );
--       ....do something....
--   end foo;
--
-- SEE ALSO
--   message(), error(), warn(), info(), trace()
--==============================================================================
procedure enter (
    p_routine_name     in varchar2,
    p_name01           in varchar2    default null,
    p_value01          in varchar2    default null,
    p_name02           in varchar2    default null,
    p_value02          in varchar2    default null,
    p_name03           in varchar2    default null,
    p_value03          in varchar2    default null,
    p_name04           in varchar2    default null,
    p_value04          in varchar2    default null,
    p_name05           in varchar2    default null,
    p_value05          in varchar2    default null,
    p_name06           in varchar2    default null,
    p_value06          in varchar2    default null,
    p_name07           in varchar2    default null,
    p_value07          in varchar2    default null,
    p_name08           in varchar2    default null,
    p_value08          in varchar2    default null,
    p_name09           in varchar2    default null,
    p_value09          in varchar2    default null,
    p_name10           in varchar2    default null,
    p_value10          in varchar2    default null,
    p_value_max_length in pls_integer default 1000 );

--==============================================================================
-- Log the session's item values.
--
-- ARGUMENTS
-- * p_page_id: identifies a page within the current applicaiton and workspace
--              context
-- * p_enabled: messages will be logged when logging is enabled, setting a
--              value of true will log
-- * p_level:   identifies the level of the log message, 1 is most important,
--              9 is least important, integer value
--==============================================================================
procedure log_page_session_state (
    p_page_id in number      default null,
    p_enabled in boolean     default false,
    p_level   in t_log_level default c_log_level_app_trace );

--==============================================================================
-- Write the contents of dbms_output.get_lines to the debug log.
--
-- This procedure copies messages of legacy applications which use dbms_output
-- into the debug log.
--
-- EXAMPLE
--   sys.dbms_output.put_line('some data');
--   sys.dbms_output.put_line('other data');
--   apex_debug.log_dbms_output;
--==============================================================================
procedure log_dbms_output;

--==============================================================================
-- Log a debug message
--
-- ARGUMENTS
-- * p_message: upto 4000 bytes of message
-- * p_enabled: messages will be logged when logging is enabled, setting a
--              value of true will log
-- * p_level:   identifies the level of the log message, 1 is most important, 9
--              is least important, integer value
--
-- DEPRECATED
--   use error(), warn(), message(), info(), enter() or trace() instead.
--==============================================================================
procedure log_message (
    p_message in varchar2    default null,
    p_enabled in boolean     default false,
    p_level   in t_log_level default c_log_level_app_trace );

--==============================================================================
-- DEPRECATED
--   use error(), warn(), message(), info(), enter() or trace() instead.
--==============================================================================
procedure log_long_message (
    p_message in varchar2    default null,
    p_enabled in boolean     default false,
    p_level   in t_log_level default c_log_level_app_trace );

--##############################################################################
--#
--# U T I L I T I E S
--#
--##############################################################################

--==============================================================================
-- Convert a boolean to a varchar2.
--==============================================================================
function tochar (
    p_value in boolean )
    return varchar2;

--##############################################################################
--#
--# M A N A G I N G   T H E   L O G
--#
--##############################################################################

--==============================================================================
-- remove_session_messages
--
-- Delete from the apex debug message log all data for a given session in your
-- workspace defaults to your current session.
--==============================================================================
procedure remove_session_messages(
    p_session         in number default null);

procedure remove_debug_by_app (
    p_application_id  in number);

procedure remove_debug_by_age (
    p_application_id  in number,
    p_older_than_days in number);

procedure remove_debug_by_view (
    p_application_id  in number,
    p_view_id         in number);

--==============================================================================
-- DEPRECATED
--   use remove_debug_by_age() version above instead
--==============================================================================
procedure remove_debug_by_age (
    p_application_id  in number,
    p_older_then_days in number);

end wwv_flow_debug_api;
/
show errors
