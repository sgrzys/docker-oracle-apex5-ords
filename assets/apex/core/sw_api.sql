set define '^' verify off
prompt ...wwv_flow_sw_api

create or replace package wwv_flow_sw_api
as
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      sw_api.sql
--
--    DESCRIPTION
--      SQL Workshop API
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--     cbcho    12/11/2001 - created
--     cbcho    10/01/2002 - Added more procedures to convert flow builder process to API call
--     cbcho    10/02/2002 - Added procedures and functions to convert flow builder process to API
--     cbcho    10/03/2002 - Added procedures to display inline error messages
--     msewtz   01/16/2002 - Created create_script_file function returning file ID
--     cbcho    05/13/2003 - Deprecated output_to_excel.  We will use report engine CVS export.
--     cbcho    07/23/2003 - Exposed function array_element to pkg. spec.
--     cbcho    07/25/2003 - Removed p_user from check_priv,create_record,update_record,delete_record (Bug 3035805)
--     cbcho    07/25/2003 - Added p_table_owner,p_synonym_name in create_record,update_record (Bug 3035805)
--     cbcho    07/28/2003 - Added p_synonym_name in delete_record (Bug 3035805)
--     cbcho    07/29/2003 - Added procedure get_success_msg (Bug 3030588)
--     cbcho    07/29/2003 - Added g_rowcnt (Bug 3030588)
--     jkallman 08/05/2003 - Added p_file_charset to save_file_attrib (Bug 3033761)
--     sspadafo 03/12/2004 - Added register_nls_lang procedure (Bug 2998081)
--     cbcho    01/17/2005 - Changed get_success_msg to function, and made it more generic
--     cbcho    01/17/2005 - Added p_print_msg paramater to run_sql to print msg from command processor
--     cbcho    01/27/2005 - Removed procedures delete_ctrl_file,delete_ctrl_file_detail,delete_parameter,delete_archive,create_ctrl_file,update_exec_seq,include_more_script_files,archive_file,create_parameter
--     cbcho    01/27/2005 - Removed create_script_from_collection,create_script_collection,update_script_collection
--     cbcho    01/27/2005 - Moved create_script_file function and procedure to wwv_flow_sw_script.sql
--     cbcho    01/27/2005 - Moved delete_file,save_file_attrib,update_script_file to wwv_flow_sw_script.sql
--     cbcho    02/15/2005 - Added run_sql_arr and changed run_sql to call run_sql_arr to run dynamic sql
--     skutz    02/16/2005 - Added get_binds and perform binds  needed for wwv_flow_render_query.get_report
--     cbcho    02/18/2005 - Removed create_statement, no references found in core nor builder
--     skutz    06/28/2005   added gen_row_md5 api
--                         -  added update_record api that takes md5 as input will call original if md5's match
--                         -  added delete_record api that takes md5 as input will call original if md5's match
--     sspadafo 09/05/2006 - Added valid_workspace_schema function (Bug 5510863)
--     sspadafo 12/13/2006 - Added procedure check_priv_object (Bug 5712255)
--     hfarrell 04/05/2011 - Fix for bug 7048187: replaced all occurrences of varchar2s with varchar2a
--     cneumuel 11/23/2011 - Removed format_col_value from spec (bug #13407459)
--     cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
--     cneumuel 05/21/2012 - Removed g_cursor, gen_query, register_nls_lang
--     cneumuel 10/13/2014 - Added anonymize_passwords to replace password in <identified> <by> PASSWORD with XXXXX (bug #18659455)
--                         - In save_history: use anonymize_passwords to not save clear text passwords
--
--------------------------------------------------------------------------------

empty_vc_arr    wwv_flow_global.vc_arr2;

g_raise_errors  boolean := false;
g_error_msg     varchar2(32767) := null;
g_success_msg   varchar2(32767) := null;
g_dbms_output   sys.dbms_output.chararr;

--
-- gives how many rows got updated, deleted, and inserted
--
g_rowcnt        number := 0;

--==============================================================================
function array_element(
    p_vcarr in wwv_flow_global.vc_arr2,
    p_index in number )
    return varchar2;

--==============================================================================
function valid_workspace_schema (
    p_schema in varchar2 )
    return varchar2;

--==============================================================================
procedure check_priv (
    p_schema in varchar2 );

--==============================================================================
procedure check_priv_object (
    p_application_id in number,
    p_schema         in varchar2,
    p_object         in varchar2 );

--==============================================================================
procedure display_error_msg (
    p_command in varchar2 default null );

--==============================================================================
procedure create_plan_table (
    p_schema in varchar2 );

--==============================================================================
procedure explain_plan (
    p_plan_id in number,
    p_sql     in varchar2,
    p_schema  in varchar2 );

--==============================================================================
-- utility procedure for save_history, to replace passwords in p_sql_cmd with
-- XXXXX
--==============================================================================
procedure anonymize_passwords (
    p_sql_cmd in out nocopy varchar2 );

--==============================================================================
procedure save_history (
    p_security_group_id in number,
    p_user              in varchar2,
    p_sql_cmd           in varchar2,
    p_schema            in varchar2 );

--==============================================================================
procedure run_sql_arr (
    p_sql             in sys.dbms_sql.varchar2a,
    p_schema          in varchar2,
    p_values          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_get_dbms_output in varchar2 default 'N' );

--==============================================================================
procedure run_sql (
    p_sql_cmd    in varchar2,
    p_schema     in varchar2,
    p_values     in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_print_msg  in varchar2 default 'N' );

--==============================================================================
procedure create_sw_qbe_collection (
    p_object_owner     varchar2,
    p_object_name      varchar2,
    p_column_ids       wwv_flow_global.vc_arr2,
    p_column_names     wwv_flow_global.vc_arr2,
    p_query_conditions wwv_flow_global.vc_arr2,
    p_data_types       wwv_flow_global.vc_arr2,
    p_comments         wwv_flow_global.vc_arr2,
    p_checked          wwv_flow_global.vc_arr2 );

--==============================================================================
procedure create_record (
    p_schema       in varchar2,
    p_table_owner  in varchar2,
    p_table_name   in varchar2,
    p_col_values   in wwv_flow_global.vc_arr2,
    p_synonym_name in varchar2 default null );

--==============================================================================
-- UPDATE_RECORD with md5 check calls original
--==============================================================================
procedure update_record (
    p_schema       in varchar2,
    p_table_owner  in varchar2,
    p_table_name   in varchar2,
    p_rowid        in varchar2,
    p_col_values   in wwv_flow_global.vc_arr2,
    p_synonym_name in varchar2 default null,
    p_md5_checksum   in varchar2 );

--==============================================================================
-- Original UPDATE_RECORD without md5 check
--==============================================================================
procedure update_record (
    p_schema       in varchar2,
    p_table_owner  in varchar2,
    p_table_name   in varchar2,
    p_rowid        in varchar2,
    p_col_values   in wwv_flow_global.vc_arr2,
    p_synonym_name in varchar2 default null );

--==============================================================================
procedure delete_record (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_rowid        in varchar2,
    p_synonym_name in varchar2 default null,
    p_md5_checksum in varchar2 );

--==============================================================================
procedure delete_record (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_rowid        in varchar2,
    p_synonym_name in varchar2 default null );

--==============================================================================
function get_binds(
    p_stmt   in varchar2 )
    return varchar2;

--==============================================================================
procedure perform_binds(
    p_cursor in number,
    p_stmt   in varchar2,
    p_values in wwv_flow_global.vc_arr2 default empty_vc_arr );

--==============================================================================
function gen_row_md5 (
    p_table_name in varchar2,
    p_owner      in varchar2,
    p_row_id     in varchar2 )
    return varchar2;

end wwv_flow_sw_api;
/
show error;
