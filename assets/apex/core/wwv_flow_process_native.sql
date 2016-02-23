set define '^' verify off
prompt ...wwv_flow_process_native
create or replace package wwv_flow_process_native as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_process_native.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native process types.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      03/12/2010 - Created
--    pawolf      06/07/2011 - Added dispatcher
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    pawolf      04/02/2012 - Added p_plugin to APIs
--    pawolf      04/04/2012 - Renamed wwv_flow_native_process to wwv_flow_process_native
--    cneumuel    09/18/2013 - Added native PLSQL and CLOSE_WINDOW processes (feature #1281)
--    cneumuel    09/20/2013 - Added reset pagination processes (feature #1281)
--    cneumuel    09/30/2013 - Added form and tabform processes (feature #1281)
--                           - get_form_info: migrated code to query dml process info from wwv_flow_dml
--    cneumuel    10/04/2013 - Added user_preferences (split off from session_state), form_process_legacy, web_service_legacy (feature #1281)
--    cneumuel    10/11/2013 - In t_form_info, get_form_info: added columns for advisor (feature #1281)
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_form_info is record (
    -- general tabform and form info
    id                    number,
    table_owner           varchar2(4000),
    table_name            varchar2(4000),
    pk_column1            varchar2(4000),
    pk_column2            varchar2(4000),
    runtime_where_clause  varchar2(4000),
    row_version_column    varchar2(4000),
    -- form fetch/dml specific
    pk_item1              varchar2(4000),
    pk_item2              varchar2(4000),
    -- form dml process specific
    return_key_into_item1 varchar2(4000),
    return_key_into_item2 varchar2(4000),
    -- form pagination process specific
    order_column1         varchar2(4000),
    order_column2         varchar2(4000) );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
subtype t_type_name is varchar2(30);
c_plsql                 constant t_type_name := 'NATIVE_PLSQL';
c_send_email            constant t_type_name := 'NATIVE_SEND_EMAIL';
c_close_window          constant t_type_name := 'NATIVE_CLOSE_WINDOW';
c_session_state         constant t_type_name := 'NATIVE_SESSION_STATE';
c_user_preferences      constant t_type_name := 'NATIVE_USER_PREFERENCES';
c_tabform_add_rows      constant t_type_name := 'NATIVE_TABFORM_ADD_ROWS';
c_tabform_update        constant t_type_name := 'NATIVE_TABFORM_UPDATE';
c_tabform_delete        constant t_type_name := 'NATIVE_TABFORM_DELETE';
c_form_fetch            constant t_type_name := 'NATIVE_FORM_FETCH';
c_form_pagination       constant t_type_name := 'NATIVE_FORM_PAGINATION';
c_form_process          constant t_type_name := 'NATIVE_FORM_PROCESS';
c_form_process_legacy   constant t_type_name := 'NATIVE_FORM_PROCESS_LEGACY';
c_web_service           constant t_type_name := 'NATIVE_WEB_SERVICE';
c_web_service_legacy    constant t_type_name := 'NATIVE_WEB_SERVICE_LEGACY';
c_reset_pagination      constant t_type_name := 'NATIVE_RESET_PAGINATION';
c_parse_uploaded_data   constant t_type_name := 'NATIVE_PARSE_UPLOADED_DATA';
c_prepare_uploaded_data constant t_type_name := 'NATIVE_PREPARE_UPLOADED_DATA';
c_load_uploaded_data    constant t_type_name := 'NATIVE_LOAD_UPLOADED_DATA';

--==============================================================================
-- Dispatcher which actually calls the native process plug-in.
--==============================================================================
function execute_process (
    p_type        in varchar2,
    p_plugin      in wwv_flow_plugin_api.t_plugin,
    p_process_idx in binary_integer,
    p_process     in wwv_flow_plugin_api.t_process )
    return wwv_flow_plugin_api.t_process_exec_result;

--==============================================================================
-- Utility function to return attributes of a c_form_fetch or c_form_process
-- process.
--
-- Either p_page_id or p_process_id needs to be passed, all
-- other parameters are mandatory.
--
-- raises 'WWV_FLOW_NATIVE_ITEM.NO_DML_PROCESS_FOUND' if the process could not
-- be found.
--==============================================================================
function get_form_info (
    p_process_type      in varchar2, -- c_form_fetch or c_form_process
    p_security_group_id in number,
    p_application_id    in number,
    p_page_id           in number default null,
    p_process_id        in number default null )
    return t_form_info;

end wwv_flow_process_native;
/
show errors
