set define '^' verify off
prompt ...wwv_flow_session
create or replace package wwv_flow_session as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011. All Rights Reserved.
--
--    NAME
--      wwv_flow_session.sql
--
--    DESCRIPTION
--      This package is resonsible for session management
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    04/14/2011 - Created
--    cneumuel    05/18/2011 - Added get_builder_cookie_name, get_by_cookie_name, builtin_cookie_sentry, removed get_by_hashed_id
--    cneumuel    10/25/2011 - Added update_security_group_id (bug #13101596)
--    cneumuel    12/22/2011 - Added global item state handling (bug #13528522)
--    cneumuel    02/10/2012 - Added generate_unique_hashed_id,update_hashed_id (bug #13707875)
--    cneumuel    04/05/2012 - Moved is_global_item_name,set_global_item_value,get_global_item_value to wwv_flow_session_state (feature #897)
--    cneumuel    04/05/2012 - Moved wwv_flow_data handling code to wwv_flow_session_state (feature #897)
--    cneumuel    05/09/2012 - Removed dead code: update_cookie_session_id
--    cneumuel    05/31/2012 - Added get_builder_session_id
--    cneumuel    06/04/2012 - Moved c_session_time_item_name to spec
--    cneumuel    05/31/2013 - Added get_executed_process_point, set_executed_process_point. Removed set_session_fired_for_flow, unset_session_fired_for_flow (feature #861)
--    cneumuel    06/03/2013 - In create_or_reuse_session: remove p_raise_error_if_not_exists, initialize session globals.
--                           - Added init_lang_from_session
--    cneumuel    06/07/2013 - session process points ON_NEW_INSTANCE and AFTER_LOGIN can run independently (feature #861)
--    cneumuel    06/14/2013 - session data model changes; get_hashed_id->get_cookie_value, generate_unique_hashed_id->generate_unique_cookie_value, update_hashed_id->update_cookie_value (feature #1149)
--    cneumuel    06/24/2013 - Added attach_preliminary (feature #1152)
--    cneumuel    07/08/2013 - Removed is_existing, added check_integrity
--    cneumuel    09/11/2013 - added get_screen_reader_mode, set_screen_reader_mode, get_high_contrast_mode, set_high_contrast_mode
--    cneumuel    02/07/2014 - Added delete_sessions_by_app: delete sessions that were used with the given application (bug #18102945)
--    cneumuel    05/09/2014 - Added get_crypto_salt to replace wwv_flow_security.g_crypto_salt
--    cneumuel    05/13/2014 - In update_user: added p_workspace_user_id, which updates wwv_flow_sessions$.workspace_user_id (bug #18693823)
--    cneumuel    03/12/2015 - Added can_be_used. In do_check_integrity, set_g_current_session: use can_be_used to check for integrity (bug #20692933)
--
--------------------------------------------------------------------------------
--
subtype t_session_record is wwv_flow_sessions$%rowtype;
--
x_session_does_not_exist exception;

subtype t_session_process_point is pls_integer range 1..3;
c_pp_on_new_instance constant t_session_process_point := 1;
c_pp_after_login     constant t_session_process_point := 2;
c_pp_both            constant t_session_process_point := 3;

--
--
--==============================================================================
-- return the cookie name used for builder authentication
--==============================================================================
function get_builder_cookie_name
    return varchar2;
--
--==============================================================================
-- return the session id of the builder session if the user is logged in to
-- the builder with the same workspace
--==============================================================================
function get_builder_session_id
    return number;
--
--==============================================================================
-- session integrity is required to access session information and session
-- state. this function checks whether the session and security group id
-- settings match, logs integrity errors and returns false if any were found.
--==============================================================================
function can_be_used
    return boolean;
--
--==============================================================================
-- raise an error if can_be_used is false
--==============================================================================
procedure check_integrity;
--
--==============================================================================
-- return the current session's cookie_value
--==============================================================================
function get_cookie_value
    return varchar2;
--
--==============================================================================
-- return the current session by g_instance or an empty record if g_instance is
-- not a valid session id. If p_check_sgid is true then the returned session
-- has to have the current security group id set.
--==============================================================================
function get_current
    return t_session_record;
--
--==============================================================================
-- return the session by reading the cookie or an empty record.
--==============================================================================
function get_by_cookie_name (
    p_cookie_name          in varchar2 )
    return t_session_record;
--
--==============================================================================
-- return the current session's crypto salt
--==============================================================================
function get_crypto_salt
    return wwv_flow_sessions$.crypto_salt%type;

--==============================================================================
-- try to establish a valid session and user by comparing the given cookie's
-- values with the current session id. if that fails, compare with the builder
-- cookie's values.
--
-- this is the core of the default session sentry if nothing else is specified
-- in the authentication scheme.
--
-- on success, this sets
--   - wwv_flow.g_instance
--   - wwv_flow_security.g_instance
--   - wwv_flow.g_user
--==============================================================================
function builtin_cookie_sentry (
    p_cookie_name          in varchar2 )
    return boolean;
--
--
--
--==============================================================================
-- generate a new unique session id
--==============================================================================
function generate_unique_session_id
    return number;
--
--==============================================================================
-- generate a new unique value for the session cookie
--==============================================================================
function generate_unique_cookie_value
    return varchar2;
--
--==============================================================================
-- create a new session
--==============================================================================
procedure create_new (
    p_generate_id             in boolean  default true,
    p_save_new_instance_fired in boolean  default false,
    p_authentication_result   in varchar2 default null );
--
--==============================================================================
-- try to attach to the current session/g_instance, if security group id and
-- user match. initialize session globals, like authorization cache and language
-- flags.
--
-- returns:
--   - true if session can be used
--   - false if session can not be used
--==============================================================================
procedure create_or_reuse_session;
--
--==============================================================================
-- attach to the session with id p_id. initialize session globals.
--==============================================================================
procedure attach_preliminary (
    p_id in number default wwv_flow.g_instance );
--
--==============================================================================
-- deletes session with id p_id
--==============================================================================
procedure delete_session (
    p_id in number default wwv_flow_security.g_instance );

--==============================================================================
-- deletes sessions that were used with the given application. this api is used
-- when deleting an application.
--==============================================================================
procedure delete_sessions_by_app (
    p_application_id    in number,
    p_security_group_id in number );

--==============================================================================
-- saves p_new_username and p_authentication_result into
-- wwv_flow_sessions$ for the current session id.
-- raises x_session_does_not_exist if session record for current g_instance and
-- g_security_group_id does not exit.
--==============================================================================
procedure update_user (
    p_username              in wwv_flow_sessions$.username%type,
    p_workspace_user_id     in wwv_flow_sessions$.workspace_user_id%type default null,
    p_authentication_result in wwv_flow_sessions$.authentication_result%type default wwv_flow_security.auth_normal,
    p_security_group_id     in number default wwv_flow_security.g_security_group_id,
    p_old_security_group_id in number default wwv_flow_security.g_security_group_id );
--
--==============================================================================
-- saves p_new_security_group_id into wwv_flow_sessions$.security_group_id for
-- the current session id. raises x_session_does_not_exist if session record
-- for current g_instance and g_security_group_id does not exit.
--==============================================================================
procedure update_security_group_id (
    p_new_security_group_id in number );
--
--==============================================================================
-- creates a new cookie_value and saves it in the current session.
-- a new cookie_value is required after login, to avoid session fixation problems.
--==============================================================================
function update_cookie_value
    return varchar2;

--==============================================================================
-- find the last session process point that has executed for the current
-- application:
--
--   null                 if no process point has yet been executed
--   c_pp_on_new_instance if ON_NEW_INSTANCE has been executed
--   c_pp_after_login     if AFTER_LOGIN has been executed
--   c_pp_both            if both ON_NEW_INSTANCE and AFTER_LOGIN have been executed
--==============================================================================
function get_executed_process_point
    return t_session_process_point;

--==============================================================================
-- set the last session process point that has executed for the current
-- application
--==============================================================================
procedure set_executed_process_point (
    p_process_point  in t_session_process_point,
    p_application_id in number default wwv_flow_security.g_flow_id );

--==============================================================================
-- set language, time zone and territory in wwv_flow_lang, based on current
-- session
--==============================================================================
procedure init_lang_from_session;

--==============================================================================
-- see apex_util.set_session_lifetime_seconds
--==============================================================================
procedure set_session_lifetime_seconds(
    p_seconds in number );

--==============================================================================
-- see apex_util.set_session_max_idle_seconds
--==============================================================================
procedure set_session_max_idle_seconds(
    p_seconds  in number );
--
--==============================================================================
-- Check for session timeout if application gets executed via "show", based on
-- 1. maximum allowed session life
-- 2. maximum allowed session idle time
--==============================================================================
procedure check_session_timeout_show;
--
--==============================================================================
-- Check for session timeout if application gets executed via "accept", based on
-- 1. maximum allowed session life
-- 2. maximum allowed session idle time
--==============================================================================
procedure check_session_timeout_accept;

--==============================================================================
function get_screen_reader_mode
      return varchar2;

--==============================================================================
procedure set_screen_reader_mode (
    p_mode in varchar2 );

--==============================================================================
function get_high_contrast_mode
      return varchar2;

--==============================================================================
procedure set_high_contrast_mode (
    p_mode in varchar2 );

end wwv_flow_session;
/
show err
