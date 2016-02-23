set define '^' verify off
prompt ...wwv_flow_advisor_checks_api.sql
create or replace package wwv_flow_advisor_checks_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_advisor_checks_api.sql
--
--    DESCRIPTION
--      Public advisor checks
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    07/31/2012 - Created
--    cneumuel    03/18/2014 - Added add_result, insecure_application_defaults
--    cneumuel    05/22/2014 - Added deprecated_attributes (feature #1432)
--    cneumuel    07/22/2014 - Added new security checks: authorization, browser_security, session_state_protection (feature #1408)
--    cneumuel    08/14/2014 - Added sql_injection
--
--------------------------------------------------------------------------------

--==============================================================================
-- Data types and global for advisor check results
--==============================================================================
type t_check_result is record (
    apex_view_name varchar2(30),
    pk_value       varchar2(255),
    column_name    varchar2(30),
    message_code   varchar2(30),
    parameter_1    varchar2(4000 char),
    parameter_2    varchar2(4000 char) );
type t_check_results is table of t_check_result;

g_check_results t_check_results;

--##############################################################################
--#
--# UTILITIES
--#
--##############################################################################

--==============================================================================
procedure add_result (
    p_apex_view_name varchar2,
    p_pk_value       varchar2,
    p_column_name    varchar2,
    p_message_code   varchar2,
    p_parameter_1    varchar2 default null,
    p_parameter_2    varchar2 default null );

--##############################################################################
--#
--# CHECK FUNCTIONS
--#
--# All checks must share the same interface and store their findings in
--# wwv_flow_advisor_checks_api.g_check_results:
--#
--# procedure xxxx (
--#     p_application_id in number,
--#     p_page_id        in number default null );
--#
--# They have to be registered in apex_install_data.sql
--#
--##############################################################################

--==============================================================================
procedure ajax_items_with_ssp (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure insecure_application_defaults (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure authorization (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure browser_security (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure session_state_protection (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure deprecated_attributes (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure sql_injection (
    p_application_id in number,
    p_page_id        in number default null );

end wwv_flow_advisor_checks_api;
/
show err

