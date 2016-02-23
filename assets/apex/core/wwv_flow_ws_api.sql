set define '^' verify off
prompt ...wwv_flow_ws_api
create or replace package wwv_flow_ws_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2008 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_ws_api.sql
--
--    DESCRIPTION
--      API to manage Websheet applications.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      cbcho     04/17/2008 - Created
--      cbcho     05/15/2008 - Added WebSheet specific procedures from wwv_flow_worksheet_standard
--      cbcho     05/22/2008 - Added get_item_value function
--      cbcho     05/22/2008 - Added delete pseudo column procedures
--    madelfio    05/22/2008 - Added create_websheet
--      cbcho     06/03/2008 - Added save_websheet_security,save_row_security,delete_row_security
--      cbcho     07/01/2008 - Added get_websheet_attr
--      cbcho     07/22/2008 - Changed save_column_group to accept p_columns
--      cbcho     07/28/2008 - Changed to add_tags to accept more parameters
--      cbcho     07/29/2008 - Added delete_column_group
--      cbcho     08/15/2008 - Added save_notification, do_notify, do_notify_todos
--      cbcho     08/18/2008 - Added p_notify to save_notification
--      arayner   08/21/2008 - Added get_filtered_columns procedure
--      cbcho     08/29/2008 - Added p_start_date and p_end_date to do_notify
--      cbcho     09/02/2008 - Added change_column_type and g_column_change_in_progress
--      cbcho     09/03/2008 - Added delete_column_validation
--      cbcho     09/11/2008 - Added p_validation_error to save_column_validation
--      cbcho     09/16/2008 - Changed do_notify
--      cbcho     09/17/2008 - Changed websheet_name_exists, exposed get_websheet_name
--      cbcho     04/11/2009 - Changed websheet to get tables from user workspace
--      cbcho     04/23/2009 - Added p_websheet_id to the procedures needed
--      cbcho     04/30/2009 - Added create_history_collection
--      cbcho     05/15/2009 - Exposed col_val_arr_t, col_arr
--      cbcho     05/22/2009 - Changed add_link
--      cbcho     05/28/2009 - Obsoleted get_cell,convert_column,seed_hr_data,create_ws_cols_and_hr_data,update_row
--      cbcho     07/20/2009 - Added allow_highlighting in create_worksheet_column
--      cbcho     08/04/2009 - Removed save_notification, do_notify
--      cbcho     08/07/2009 - Added get_utilization_num
--      cbcho     08/14/2009 - Changed add_note to update if p_note_id passed
--      cbcho     09/02/2009 - Added create_webpage, save_webpage_section
--      cbcho     09/04/2009 - Added get_next_webpg_section_seq, create_ws_app
--      cbcho     09/11/2009 - Added delete_webpage, delete_ws_app
--      cbcho     09/18/2009 - Added logic to fetch and save navigation and data section
--      cbcho     09/25/2009 - Added split_ws_rpt_link_url, build_ws_rpt_link_url
--      cbcho     09/29/2009 - Added p_ws_app_id to add_link, add_note, add_tags
--      cbcho     10/05/2009 - Added edit_ws_report_attr
--      cbcho     10/05/2009 - Added ws_rpt_src_changed,change_ws_rpt_query,save_ws_rpt_query
--      cbcho     10/06/2009 - Added p_type to websheet_name_exists
--      cbcho     11/10/2009 - Added chart parameters to save_webpage_section
--      cbcho     11/23/2009 - Added p_tz_dependent to create_worksheet_column
--      cbcho     11/25/2009 - Added allow_group_by,allow_hide to create_worksheet_column
--      cbcho     12/04/2009 - Added procedure to create collection to query note, attachment, tags from websheet application
--      cbcho     12/11/2009 - Changed save_webpage_section to create chart
--      cbcho     12/14/2009 - Added fetch_chart_section
--      cbcho     12/17/2009 - Added p_report_id to save_webpage_section
--      cbcho     12/23/2009 - Changed fetch_data_section, save_webpage_section to use saved report settings
--      jstraub   01/26/2010 - Added p_acl_type to create_ws_app
--      cbcho     01/26/2010 - Added p_ws_app_id,p_websheet_id to save_column_validation
--      jstraub   01/26/2010 - Added add_acl_entry, delete_acl_entry and create_acl_collection
--      arayner   01/29/2010 - Added get_item_help function to return help text
--      cbcho     02/01/2010 - Added get_attachment_info, get_tag_info, get_note_info
--      cbcho     02/03/2010 - Changed get_attachment_info to get image_alias, image_attributes
--      cbcho     02/07/2010 - Changed save_webpage_section,process_row to populate ws_app_id
--      jkallman  02/08/2010 - Removed save_row_security, delete_row_security
--      cbcho     02/08/2010 - Added alias_exists, get_ws_report_attr
--      cbcho     02/09/2010 - Added alias parameter to create_webpage,create_ws_report,create_websheet
--      jstraub   02/09/2010 - Added p_validation_error out parameter to process_row to support validations
--      sbkenned  02/09/2010 - Changed create_ws_report to pass back report ids
--      jkallman  02/10/2010 - Added create_sec_history_collection
--      jkallman  02/10/2020 - Added p_max_row_count to create_history_collection, create_sec_history_collection
--      jkallman  02/10/2010 - Make p_webpage_id default null in create_sec_history_collection
--      cbcho     02/12/2010 - Changed create_ws_app to accept section_title and content
--      jstraub   02/12/2010 - Added inline_date_picker_options
--      cbcho     02/12/2010 - Changed display_create_ws_app_confirm to accept p_section_title
--      arayner   02/15/2010 - Added p_validation_count to process_row
--      cbcho     02/16/2010 - Added g_canonical_date_format, g_canonical_ts_format
--      arayner   02/17/2010 - Added p_ajax_mode parameter to process_row procedure
--      jkallman  02/18/2010 - Added p_max_row_count to create_acl_collection, create_attachment_collection, create_note_collection, create_tag_collection
--      cbcho     02/18/2010 - Added get_dbms_sql_cursor to parse cursor from one place
--      mhichwa   02/18/2010 - Added create_search_collection
--      mhichwa   02/19/2010 - Added show_page_900_footer
--      mhichwa   02/21/2010 - Added create_pg_sec_collection procedure
--      mhichwa   02/21/2010 - Added get_logo
--      cbcho     02/23/2010 - Added move_section_to_new_page, move_section_to_existing_page
--      mhichwa   02/23/2010 - added get_section_name
--      cbcho     02/23/2010 - Added p_new_section_sequence to move_section_to_new_page, move_section_to_existing_page
--      mhichwa   02/24/2010 - added get_file_count, row count, file count, tag count and get_file_size
--      mhichwa   03/03/2010 - added create_tag_collection
--      cbcho     03/05/2010 - Removed save_websheet_attr
--      jstraub   03/16/2010 - Added function get_ws_app_id
--      cbcho     03/17/2010 - Added function get_data_grid_id
--      sbkenned  03/23/2010 - Added create_section_collection (for Sections popup)
--      cbcho     03/29/2010 - added save_section_seq_title
--      cbcho     04/07/2010 - Added get_page_count, get_report_count, get_datagrid_count
--      cbcho     04/08/2010 - Added p_websheet_id in save_lov
--      sbkenned  04/15/2010 - Added get_acl_table
--      cbcho     04/15/2010 - Added p_data_section_style in fetch_data_section,save_webpage_section
--      cbcho     04/18/2010 - Added get_link_info
--      jkallman  04/22/2010 - Added g_dml_date_format
--      cbcho     04/22/2010 - Added p_ws_app_id to copy_websheet
--      cbcho     04/23/2010 - Removed create_template
--      cbcho     04/24/2010 - Added g_edit_row_collection_name
--      cbcho     04/28/2010 - Added send_page_email
--      cbcho     04/29/2010 - Added p_display_order to save_column_properties
--      cbcho     04/30/2010 - Removed create_websheet, added create_data_grid_from_cp_paste, create_data_grid_from_scratch
--      cbcho     04/30/2010 - Removed create_worksheet, create_worksheet_column,create_worksheet_col_group as this is added in wwv_flow_api as create_ws_*
--      cbcho     05/05/2010 - Removed obsolete function test_converting_column
--      cbcho     05/05/2010 - Removed run_sql from the sepc (bug 9674995)
--      cbcho     05/12/2010 - Added copy_page, is_app_home_page
--      cbcho     12/17/2010 - Changed add_column to pass p_app_user to populate CURRENT_USER (bug 9826628)
--      cbcho     02/18/2011 - Removed show_page_900_footer
--      cbcho     02/23/2011 - Added fetch_section_content, print_section_content (bug 11800835)
--      cbcho     02/25/2011 - Changed process_row to accept f01, f02 array only (bug 10636907)
--      cbcho     03/02/2011 - Exposed run_block, added check_plsql
--      cbcho     03/23/2011 - Changed print_section_content to allow null p_section_id to use in create text section page
--      cbcho     04/07/2011 - Changed copy_page to add p_new_page_id
--      cbcho     05/11/2011 - Added update_page_timestamp
--      cbcho     05/13/2011 - Added show_reset_password (feature 620)
--      cbcho     05/17/2011 - Removed obsolete print_section_content and added get_section_clob, changed create_data_grid_from_cp_paste to accept p_app_id, p_collection_name
--      cbcho     05/24/2011 - Changed delete_webpage_section to accept p_ws_app_id
--      cbcho     05/31/2011 - Removed obsolete get_filtered_columns procedure
--      cbcho     06/01/2011 - Changed fetch_nav_section, save_webpage_section to output and accept p_nav_order_by (feature 546)
--      cbcho     06/02/2011 - Added p_nav_order_by_dir to fetch_nav_section, save_webpage_section
--      cbcho     06/07/2011 - Changed p_worksheet_id to websheet_name_exists (bug 12628617)
--      cbcho     06/13/2011 - Added check_section_lost_update
--      cbcho     06/14/2011 - Changed check_section_lost_update to accept input values (bug 12326441)
--      cbcho     06/16/2011 - Added duplicate_found_in_array function (bug 12666807)
--      cbcho     06/17/2011 - Added ws_error_handling (bug 9790601)
--      cbcho     06/24/2011 - Added p33_fetch_blob_format (bug 12681008)
--      cbcho     07/08/2011 - Added get_home_page_id (bug 12730154)
--      cbcho     11/08/2011 - Added admin_exists, create_acl_user, create_cloud_websheet to create websheet for cloud within application 4000
--      cbcho     12/02/2011 - Added p_authentication to create_cloud_websheet
--      pawolf    02/27/2012 - Moved public APIs of wwv_flow_error to wwv_flow_error_api
--      cbcho     03/13/2012 - Added p_page_id to create_section_collection (bug 13841391)
--      cbcho     05/22/2012 - Added function max_col_limit_reached to call from 4900:91 validation (bug 13572161)
--      cbcho     05/30/2012 - Changed add_column to save group_id
--      cbcho     06/12/2012 - Changed save_webpage_section, fetch_data_section to accept p_max_row_count and p_show_option (feature #900)
--      cbcho     06/21/2012 - Added get_page_alias, get_data_grid_alias (feature #950)
--      cbcho     07/05/2012 - Added p_allow_sql_yn in create_cloud_websheet (feature #990)
--      cbcho     09/04/2012 - Removed obsolete display_column_filter_lov
--      cbcho     11/09/2012 - Exposed is_alphanumeric (bug 14628640)
--      cbcho     10/11/2013 - Added allow_pivot (feature #536)
--      cbcho     12/12/2013 - Added overloaded procedure add_note to output validation error (bug #17880584)
--      arayner   03/27/2014 - Moved get_lov_json from wwv_flow_worksheet_ajax package to wwv_flow_ws_api package
--      cneumuel  01/30/2015 - In get_utilization_num: only query APEX$_WS_FILES if websheet schema exists. Removed unused variables.
--      cbcho     02/05/2015 - Changed alias_exists to accept p_id
--
--------------------------------------------------------------------------------

g_canonical_date_format varchar2(100) := 'RRRR-MM-DD"T"hh24:mi:ss';
g_canonical_ts_format   varchar2(100) := 'RRRR-MM-DD"T"hh24:mi:ss.xff';
g_dml_date_format       varchar2(100) := 'YYYYMMDDHH24MISS';

g_edit_row_collection_name  varchar2(255) := 'APEX$_WS_ROWS_EDIT_ROW';

empty_vc_arr wwv_flow_global.vc_arr2;
type col_val_arr_t is table of varchar2(32767) index by varchar2(32767);
type col_arr is table of col_val_arr_t index by binary_integer;

g_column_change_in_progress  boolean := false;

function get_data_grid_alias (
    p_ws_app_id     in number,
    p_data_grid_id  in number) return varchar2;
    
function get_page_alias (
    p_ws_app_id    in number,
    p_page_id      in number) return varchar2;
    
function ws_error_handling (
    p_error in wwv_flow_error_api.t_error )
    return wwv_flow_error_api.t_error_result;

function is_alphanumeric (
    p_str        in varchar2)
    return boolean;
        
function check_section_lost_update (    
    p_ws_app_id             in number,
    p_page_id               in number,
    p_section_id            in number,
    p_change_count          in number,
    --    
    p_section_type          in varchar2 default null,
    p_display_seq           in number default null,
    p_title                 in varchar2 default null,
    p_content               in varchar2 default null,
    p_nav_start_webpage_id  in number default null,
    p_nav_max_level         in number default null,
    p_nav_order_by          in varchar2 default null,
    p_nav_order_by_dir      in varchar2 default null,
    p_nav_include_link      in varchar2 default null,
    --
    p_clob_item_name        in varchar2 default null,
    --   
    p_data_grid_id          in number default null,
    p_report_id             in number default null,
    p_data_section_style    in number default null,
    --
    p_chart_type            in varchar2 default null,
    p_chart_3d              in varchar2 default null,
    p_chart_label           in varchar2 default null,
    p_label_axis_title      in varchar2 default null,
    p_chart_value           in varchar2 default null,
    p_value_axis_title      in varchar2 default null,
    p_chart_aggregate       in varchar2 default null,
    p_chart_sorting         in varchar2 default null    
    ) return varchar2;    

function get_section_clob ( 
    p_item_name        in varchar2,
    p_section_id       in number default null)
    return clob;
    
function show_reset_password (
    p_ws_app_id    in number)
    return boolean;

function get_home_page_id (
    p_ws_app_id    in number) return number;
        
function is_app_home_page (
    p_ws_app_id    in number,
    p_webpage_id   in number)
    return boolean;
    
function get_logo (
	p_ws_app_id         in number,
	p_security_group_id in number)
	return varchar2;

function get_dbms_sql_cursor(
    p_query  in varchar2,
    p_values in wwv_flow_global.vc_arr2 default empty_vc_arr)
    return integer;

function alias_exists (
    p_ws_app_id    in number,
    p_alias        in varchar2,
    p_alias_type   in varchar2,
    p_worksheet_id in number default null,
    p_page_id      in number default null,
    p_id           in number default null) return boolean;

function annotation_exists (
    p_ws_app_id      in number) return boolean;

function page_annotation_exists (
    p_ws_app_id       in number,
    p_webpage_id      in number,
    p_annotation_type in varchar2) return boolean;

function get_next_webpg_section_seq (
    p_webpage_id       in number)  return number;

function get_utilization_num (
    p_workspace_id     in number default null,
    p_type             in varchar2 default null) return number;
 
function duplicate_found_in_array (    
    p_array in wwv_flow_global.vc_arr2) return boolean;
    
function get_data_grid_id (
    p_worksheet_id     in number) return number;

function get_ws_app_id (
    p_worksheet_id      in number) return number;

function get_websheet_name (
    p_worksheet_id     in number) return varchar2;

function websheet_name_exists (
    p_ws_app_id     in number,
    p_name          in varchar2,
    p_type          in varchar2 default 'DATA',
    p_worksheet_id  in number default null) return boolean;

function get_item_value (
    p_item_name in varchar2
    ) return varchar2;

function max_col_limit_reached (
    p_worksheet_id   in number,
    p_column_type    in varchar2) return boolean;
    
function get_condition_display (
    p_column_name       in varchar2 default null,
    p_column_label      in varchar2 default null,
    p_operator          in varchar2 default null,
    p_expr              in varchar2 default null,
    p_expr2             in varchar2 default null,
    p_condition_display in varchar2 default null) return varchar2;

procedure update_page_timestamp (    
    p_page_id   in number,
    p_ws_app_id in number);
    
procedure run_block (
    p_sql        in varchar2);

function check_plsql (
    p_sql               in varchar2
    ) return varchar2;
        
procedure run_query (
    p_sql        in varchar2,
    p_values     in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_max_row    in number default null,
    p_col_vals   out col_arr);

procedure save_checked (
        p_worksheet_id   in number);

procedure delete_rows (
    p_websheet_id      in number,
    p_rows             in varchar2 default 'SELECTED',
    p_selected_rows    in varchar2 default null,
    p_confirm          in varchar2 default null,
    p_validation_error out varchar2);

procedure delete_row (
    p_websheet_id   in number,
    p_row_id        in number);

procedure process_row (
        p_ws_app_id         in  number,
        p_worksheet_id      in  number,
        p_websheet_id       in  number,
        p_row_id            in  number,
        f01                 in  wwv_flow_global.vc_arr2 default empty_vc_arr,
        f02                 in  wwv_flow_global.vc_arr2 default empty_vc_arr,
        p_validation_error  out varchar2,
        p_validation_count  out number,
        p_ajax_mode         in  boolean                 default false );

----------
-- Sharing
--
procedure share_ws_with_individuals (
        p_worksheet_id in number,
        p_person_list in varchar2,
        p_allow_select in varchar2,
        p_allow_insert in varchar2,
        p_allow_update in varchar2,
        p_allow_delete in varchar2);

--
-- inline updates
--
procedure update_cell (
    p_worksheet_id     in number,
    p_websheet_id      in number,
    p_row_id           in number,
    p_column_name      in varchar2,
    p_new_value        in varchar2 default null,
    p_change_count     in number default null,
    p_validation_error out varchar2);

procedure save_websheet_properties (
    p_ws_app_id        in number,
    p_worksheet_id     in number,
    p_name             in varchar2 default null,
    p_alias            in varchar2 default null,
    p_description      in varchar2 default null,
    p_row_pk1          in varchar2 default null,
    p_row_pk2          in varchar2 default null,
    p_row_pk3          in varchar2 default null,
    p_publish          in varchar2 default null,
    p_validation_error out varchar2
    );

procedure save_column_properties (
    p_worksheet_id      in number,
    p_websheet_id       in number,
    p_app_user          in varchar2 default null,
    p_db_column_name    in varchar2 default null,
    p_display_order     in varchar2 default null,
    p_group_id          in number default null,
    p_display_as        in varchar2 default null,
    p_lov_id            in varchar2 default null,
    p_lov_name          in varchar2 default null,
    p_lov_entries       in varchar2 default null,
    p_label             in varchar2 default null,
    p_format_mask       in varchar2 default null,
    p_value_required    in varchar2 default null,
    p_heading_alignment in varchar2 default null,
    p_column_alignment  in varchar2 default null,
    p_default_type      in varchar2 default null,
    p_default_text      in varchar2 default null,
    p_width             in number default null,
    p_max_width         in number default null,
    p_height            in number default null,
    p_help_text         in varchar2 default null,
    p_validation_error  out varchar2
    );

procedure add_column (
    p_worksheet_id     in number,
    p_websheet_id      in number,
    p_app_user         in varchar2 default null,
    p_report_id        in number default null,
    p_column_name      in varchar2 default null,
    p_group_id         in number default null,
    p_column_type      in varchar2 default null,
    p_display_as       in varchar2 default null,
    p_lov_id           in varchar2 default null,
    p_lov_name         in varchar2 default null,
    p_lov_entries      in varchar2 default null,
    p_value_required   in varchar2 default null,
    p_default_type     in varchar2 default null,
    p_default_text     in varchar2 default null,
    p_validation_error out varchar2
    );

procedure remove_column (
    p_worksheet_id     in number,
    p_columns          in varchar2 default null,
    p_confirm          in varchar2 default null,
    p_validation_error out varchar2
    );

procedure delete_lov (
    p_worksheet_id     in number,
    p_lov_id           in number default null,
    p_validation_error out varchar2
    );

procedure save_lov (
    p_worksheet_id     in number,
    p_websheet_id      in number,
    p_lov_id           in number default null,
    p_lov_name         in varchar2 default null,
    p_lov_entries      in varchar2 default null,
    p_validation_error out varchar2
    );

procedure save_column_group (
    p_worksheet_id     in number,
    p_websheet_id      in number,
    p_group_id         in number default null,
    p_seq              in number default null,
    p_group_name       in varchar2 default null,
    p_description      in varchar2 default null,
    p_columns          in varchar2 default null,
    p_validation_error out varchar2
    );

procedure delete_column_group (
    p_worksheet_id     in number,
    p_group_id         in number);

procedure copy_page (
    p_ws_app_id        in number,
    p_webpage_id       in number,
    p_new_name         in varchar2 default null,
    --
    p_new_page_id      out number);
    
procedure copy_websheet (
    p_ws_app_id        in number,
    p_worksheet_id     in number,
    p_websheet_id      in number,   
    p_new_name         in varchar2 default null,
    p_validation_error out varchar2
    );

procedure delete_websheet (
    p_worksheet_id     in number,
    p_websheet_id      in number,
    p_websheet_type    in varchar2 default 'DATA',
    p_confirm          in varchar2 default null,
    p_validation_error out varchar2);

procedure set_column_value (
    p_websheet_id      in number,
    p_db_column_name   in varchar2 default null,
    p_new_value        in varchar2 default null,
    p_rows             in varchar2 default 'SELECTED',
    p_selected_rows    in varchar2 default null,
    p_validation_error out varchar2);

procedure replace_column_value (
    p_websheet_id       in number,
    p_rows              in varchar2 default null,
    p_db_column_names   in varchar2 default null,
    p_find_what         in varchar2 default null,
    p_replace_with      in varchar2 default null,
    p_selected_rows     in varchar2 default null,
    p_validation_error  out varchar2);

procedure fill_column_value (
    p_websheet_id        in number,
    p_db_column_name     in varchar2 default null,
    p_validation_error   out varchar2);

procedure add_note (
    p_ws_app_id        in number default null,
    p_note_id          in number default null,
    p_websheet_id      in number default null,
    p_row_id           in number default null,
    p_webpage_id       in number default null,
    p_component_level  in varchar2 default null,
    p_content          in varchar2 default null);
    
procedure add_note (
    p_ws_app_id        in number default null,
    p_note_id          in number default null,
    p_websheet_id      in number default null,
    p_row_id           in number default null,
    p_webpage_id       in number default null,
    p_component_level  in varchar2 default null,
    p_content          in varchar2 default null,
    -- out
    p_validation_error out varchar2);

procedure add_link (
    p_link_id          in number default null,
    p_ws_app_id        in number default null,
    p_websheet_id      in number default null,
    p_row_id           in number default null,
    p_component_level  in varchar2 default null,
    p_link_name        in varchar2 default null,
    p_url              in varchar2 default null,
    p_link_description in varchar2 default null,
    p_display_sequence in number default null,
    p_validation_error out varchar2);

procedure add_tags (
    p_ws_app_id       in number default null,
    p_webpage_id      in number default null,
    p_websheet_id     in number default null,
    p_row_id          in number default null,
    p_component_level in varchar2 default null,
    p_tag             in varchar2 default null);

procedure add_acl_entry (
    p_ws_app_id       in number default null,
    p_acl_id          in number default null,
    p_username        in varchar2 default null,
    p_priv            in varchar2 default null);

procedure delete_note (
    p_note_id   in number);

procedure delete_link (
    p_link_id in number);

procedure delete_tag (
    p_tag_id         in number,
    p_websheet_id    in number default null,
    p_row_id         in number default null
    );

procedure delete_acl_entry (
    p_acl_id         in number);

procedure get_websheet_attr (
    p_worksheet_id        in number,
    p_app_user            in varchar2 default null,
    p_base_report_id      in number default null,
    p_status              out varchar2,
    p_view_only_columns   out varchar2,
    p_username_in_columns out varchar2,
    p_parent_column       out varchar2,
    p_child_column        out varchar2);

procedure save_column_validation (
    p_ws_app_id        in number,
    p_worksheet_id     in number,
    p_websheet_id      in number default null,
    p_validation_id    in number default null,
    p_validation_level in varchar2 default null,
    p_name             in varchar2 default null,
    p_seq              in number default null,
    p_type             in varchar2 default null,
    p_expr1            in varchar2 default null,
    p_expr2            in varchar2 default null,
    p_error_message    in varchar2 default null,
    p_validation_error out varchar2
    );

procedure delete_column_validation (
    p_worksheet_id     in number,
    p_validation_id    in number default null
    );

procedure change_column_type (
    p_worksheet_id         in number,
    p_websheet_id          in number,
    p_old_db_column_name   in varchar2,
    p_new_column_type      in varchar2,
    p_format_mask_to_use   in varchar2 default null);

procedure create_history_collection (
    p_worksheet_id  in number,
    p_websheet_id   in number,
    p_max_row_count in number default null
    );

procedure create_link_collection (
    p_ws_app_id    in number,
    p_max_row_count in number default null
    );

procedure get_link_info (
    p_ws_app_id       in number,
    p_id              in number,
    p_component_level out varchar2,
    p_webpage_id      out number,
    p_worksheet_id    out number,
    p_websheet_id     out number,
    p_row_id          out number,
    p_link_name       out varchar2,
    p_url             out varchar2,      
    p_created_on      out date,
    p_created_by      out varchar2,
    p_updated_on      out date,
    p_updated_by      out varchar2
    );
    
procedure create_acl_collection (
    p_ws_app_id     in number,
    p_max_row_count in number default null
    );

procedure create_attachment_collection (
    p_ws_app_id     in number,
    p_max_row_count in number default null
    );

procedure create_sec_history_collection (
    p_ws_app_id     in number,
    p_webpage_id    in number default null,
    p_max_row_count in number default null
    );

procedure create_search_collection (
    p_search                in varchar2 default null,
    p_security_group_id     in number   default null,
    p_ws_app_id             in number   default null,
    p_max_row_count         in number   default null,
    p_searchable_components in varchar2 default null,
    p_app_session           in varchar2 default '0'
    );

procedure create_pg_sec_collection (
    p_security_group_id     in number   default null,
    p_ws_app_id             in number   default null,
    p_page_id               in number   default null,
    p_app_session           in varchar2 default '0'
    );

procedure create_section_collection (
    p_security_group_id     in number   default null,
    p_ws_app_id             in number   default null,
    p_page_id               in number   default null
    );

procedure get_attachment_info (
    p_ws_app_id        in number,
    p_id               in number,
    p_component_level  out varchar2,
    p_webpage_id       out number,
    p_worksheet_id     out number,
    p_websheet_id      out number,
    p_row_id           out number,
    p_name             out varchar2,
    p_image_alias      out varchar2,
    p_image_attributes out varchar2,
    p_description      out varchar2,
    p_created_on       out date,
    p_created_by       out varchar2,
    p_updated_on       out date,
    p_updated_by       out varchar2
    );

procedure create_note_collection (
    p_ws_app_id     in number,
    p_max_row_count in number default null
    );

procedure get_note_info (
    p_ws_app_id       in number,
    p_id              in number,
    p_component_level out varchar2,
    p_webpage_id      out number,
    p_worksheet_id    out number,
    p_websheet_id     out number,
    p_row_id          out number,
    p_note            out varchar2,
    p_created_on      out date,
    p_created_by      out varchar2,
    p_updated_on      out date,
    p_updated_by      out varchar2
    );

procedure create_tag_collection (
    p_ws_app_id     in number,
    p_max_row_count in number default null
    );

procedure get_tag_info (
    p_ws_app_id       in number,
    p_id              in number,
    p_component_level out varchar2,
    p_webpage_id      out number,
    p_worksheet_id    out number,
    p_websheet_id     out number,
    p_row_id          out number,
    p_tag             out varchar2,
    p_created_on      out date,
    p_created_by      out varchar2,
    p_updated_on      out date,
    p_updated_by      out varchar2
    );

procedure create_webpage (
    p_webpage_id      in number default null,
    p_ws_app_id       in number default null,
    p_name            in varchar2 default null,
    p_page_alias      in varchar2 default null,
    p_description     in varchar2 default null,
    p_parent_page_id  in number default null,
    p_section_title   in varchar2 default null,
    p_section_content in varchar2 default null);

procedure fetch_note (
    p_note_id     in  number,
    -- out
    p_content     out varchar2);

procedure fetch_tag (
    p_webpage_id  in number,
    --
    p_tags        out varchar2);

procedure fetch_data_section (
    p_section_id           in number,
    p_section_type         in varchar2,
    -- out
    p_display_seq          out number,
    p_title                out varchar2,
    --
    p_worksheet_id         out number,
    p_websheet_type        out varchar2,
    p_websheet_id          out number,
    p_websheet_name        out varchar2,
    p_report_id            out number,
    p_data_section_style   out number,
    p_change_count         out number,
    p_max_row_count        out number,
    p_show_option          out varchar2
    );

procedure fetch_chart_section (
    p_section_id           in number,
    p_section_type         in varchar2,
    -- out
    p_display_seq          out number,
    p_title                out varchar2,
    --
    p_worksheet_id         out number,
    p_websheet_type        out varchar2,
    p_websheet_id          out number,
    p_websheet_name        out varchar2,
    p_report_id            out number,
    p_report_columns       out varchar2,
    --
    p_chart_type           out varchar2,
    p_chart_3d             out varchar2,
    p_chart_label          out varchar2,
    p_label_axis_title     out varchar2,
    p_chart_value          out varchar2,
    p_value_axis_title     out varchar2,
    p_chart_aggregate      out varchar2,
    p_chart_sorting        out varchar2,
    p_change_count         out number
    );

procedure fetch_section_info (
    p_section_id       in number,
    -- out
    p_display_seq      out number,
    p_title            out varchar2,
    p_change_count     out number
    );

function fetch_section_content (
    p_section_id       in number    
    ) return clob;    

procedure fetch_nav_section (
    p_section_id           in number,
    p_section_type         in varchar2,
    -- out
    p_display_seq          out number,
    p_title                out varchar2,
    p_nav_start_webpage_id out number,
    p_nav_max_level        out number,
    p_nav_order_by         out varchar2,
    p_nav_order_by_dir     out varchar2,
    p_nav_include_link     out varchar2,
    p_change_count         out number);

procedure save_webpage_section (
    p_section_id            in number default null,
    p_ws_app_id             in number default null,
    p_webpage_id            in number default null,
    p_section_type          in varchar2 default null,
    p_display_seq           in number default null,
    p_title                 in varchar2 default null,
    p_content               in varchar2 default null,
    p_nav_start_webpage_id  in number default null,
    p_nav_max_level         in number default null,
    p_nav_order_by          in varchar2 default null,
    p_nav_order_by_dir      in varchar2 default null,
    p_nav_include_link      in varchar2 default null,
    --
    p_clob_item_name        in varchar2 default null,
    --
    p_data_grid_id          in number default null,
    p_report_id             in number default null,
    p_data_section_style    in number default null,
    p_max_row_count         in number default null,
    p_show_option           in varchar2 default null,
    --
    p_chart_type            in varchar2 default null,
    p_chart_3d              in varchar2 default null,
    p_chart_label           in varchar2 default null,
    p_label_axis_title      in varchar2 default null,
    p_chart_value           in varchar2 default null,
    p_value_axis_title      in varchar2 default null,
    p_chart_aggregate       in varchar2 default null,
    p_chart_sorting         in varchar2 default null
    );

procedure save_section_seq_title (
    p_section_id            in number default null, 
    p_ws_app_id             in number default null,
    p_webpage_id            in number default null,    
    p_display_seq           in number default null,
    p_title                 in varchar2 default null    
    );
    
procedure delete_webpage_section (
    p_section_id       in number default null,
    p_section_type     in varchar2 default null,
    p_ws_app_id        in number default null,
    p_webpage_id       in number default null);

procedure move_section_to_new_page (
    p_ws_app_id             in number,
    p_section_id            in number,
    p_old_page_id           in number,
    p_new_page_name         in varchar2,
    p_new_page_alias        in varchar2 default null,
    p_new_parent_page_id    in number default null,
    p_new_section_sequence  in number default null
    );

procedure move_section_to_existing_page (
    p_ws_app_id             in number,
    p_section_id            in number,
    p_old_page_id           in number,
    p_new_page_id           in number,
    p_new_section_sequence  in number default null
    );

procedure display_create_ws_app_confirm(
    p_ws_app_id      in number,
    p_name           in varchar2,
    p_description    in varchar2 default null,
    p_section_title  in varchar2 default null
    );
    
procedure create_ws_app (
    p_ws_app_id       in number default null,
    p_name            in varchar2 default null,
    p_description     in varchar2 default null,
    p_acl_type        in varchar2 default 'DEFAULT',
    p_section_title   in varchar2 default null,
    p_section_content in varchar2 default null,
    --
    p_flow_id        in number default null
    );

function admin_exists (
    p_ws_app_id   in number) return boolean;
    
procedure create_acl_user (
    p_ws_app_id     in number,
    p_method        in varchar2 default null,
    p_username      in varchar2 default null,
    p_email         in varchar2 default null,
    p_password      in varchar2 default null
    );
    
procedure create_cloud_websheet (
    p_ws_app_id        in number default null,
    p_websheet_name    in varchar2 default null,
    p_authentication   in varchar2 default null,
    p_owner            in varchar2 default null,
    p_allow_sql_yn     in varchar2 default 'N',
    p_include_gs       in varchar2 default 'Y'
    );
    
procedure add_ws_page (
    p_page_type       in varchar2,
    p_page_name       in varchar2,
    p_parent_page_id  in number default null,
    p_ws_report_owner in varchar2 default null,
    p_ws_report_table in varchar2 default null);

procedure delete_webpage (
    p_ws_app_id   in number,
    p_webpage_id  in number);

procedure delete_ws_app (
    p_ws_app_id   in number);

procedure create_ws_report (
    p_report_id    in  number   default null,
    p_ws_app_id    in  number   default null,
    p_flow_id      in  number   default null,
    p_schema       in  varchar2 default null,
    p_source_type  in  varchar2 default null,
    p_report_name  in  varchar2 default null,
    p_report_alias in  varchar2 default null,
    p_table_name   in  varchar2 default null,
    p_query        in  varchar2 default null,
    p_worksheet_id out number,
    p_websheet_id  out number);

procedure split_ws_rpt_link_url (
    p_url               in varchar2,
    --
    p_websheet_id       out number,
    p_reset_ir          out varchar2,
    p_clear_ir          out varchar2,
    p_column1           out varchar2,
    p_operator1         out varchar2,
    p_value1            out varchar2,
    p_column2           out varchar2,
    p_operator2         out varchar2,
    p_value2            out varchar2,
    p_column3           out varchar2,
    p_operator3         out varchar2,
    p_value3            out varchar2
    );

function build_ws_rpt_link_url (
    p_ws_app_id         in number,
    p_websheet_id       in number,
    p_reset_ir          in varchar2 default null,
    p_clear_ir          in varchar2 default null,
    p_column1           in varchar2 default null,
    p_operator1         in varchar2 default null,
    p_value1            in varchar2 default null,
    p_column2           in varchar2 default null,
    p_operator2         in varchar2 default null,
    p_value2            in varchar2 default null,
    p_column3           in varchar2 default null,
    p_operator3         in varchar2 default null,
    p_value3            in varchar2 default null
    ) return varchar2;

procedure edit_ws_report_attr (
    p_worksheet_id              in number,
    p_websheet_id               in number,
    p_websheet_name             in varchar2,
    p_websheet_alias            in varchar2,
    p_max_row_count             in number default null,
    p_max_row_count_message     in varchar2 default null,
    p_no_data_found_message     in varchar2 default null,
    p_base_pk1                  in varchar2 default null,
    p_show_nulls_as             in varchar2 default null,
    p_pagination_type           in varchar2 default null,
    p_show_detail_link          in varchar2 default null,
    p_detail_link               in varchar2 default null,
    p_detail_link_text          in varchar2 default null,
    p_detail_link_attr          in varchar2 default null,
    p_allow_exclude_null_values in varchar2 default null,
    p_allow_hide_extra_columns  in varchar2 default null
    );

procedure edit_ws_rpt_column_attr (
    p_worksheet_id           in number,
    p_column_id              in number,
    p_display_text_as        in varchar2 default null,
    p_column_label           in varchar2 default null,
    p_report_label           in varchar2 default null,
    p_sync_form_label        in varchar2 default null,
    p_format_mask            in varchar2 default null,
    p_heading_alignment      in varchar2 default null,
    p_column_alignment       in varchar2 default null,
    p_allow_sorting          in varchar2 default null,
    p_allow_filtering        in varchar2 default null,
    p_allow_ctrl_breaks      in varchar2 default null,
    p_allow_aggregations     in varchar2 default null,
    p_allow_computations     in varchar2 default null,
    p_allow_charting         in varchar2 default null,
    p_allow_group_by         in varchar2 default null,
    p_allow_pivot            in varchar2 default null,
    p_allow_hide             in varchar2 default null,
    p_allow_filters          in varchar2 default null,
    p_allow_highlighting     in varchar2 default null,
    p_rpt_show_filter_lov    in varchar2 default null,
    p_rpt_lov                in varchar2 default null,
    p_column_link            in varchar2 default null,
    p_column_linktext        in varchar2 default null,
    p_column_link_attr       in varchar2 default null);

function ws_rpt_src_changed (
    p_worksheet_id    in number,
    p_websheet_id     in number,
    p_new_owner       in varchar2,
    p_new_source      in varchar2
    ) return boolean;

procedure change_ws_rpt_query (
    p_worksheet_id    in number,
    p_websheet_id     in number,
    p_new_owner       in varchar2,
    p_new_source      in varchar2 default null
    );

procedure save_ws_rpt_query (
    p_flow_id        in number,
    p_worksheet_id   in number,
    p_websheet_id    in number,
    p_owner          in varchar2 default null,
    p_query          in varchar2 default null
    );

function get_item_help (
    p_db_column_name    in varchar2,
    p_workspace_id      in number,
    p_worksheet_id      in number
    ) return varchar2;

procedure get_ws_report_attr (
    p_websheet_id  in number,
    p_name         out varchar2,
    p_alias        out varchar2);

function inline_date_picker_options(
    p_worksheet_id      in varchar,
    p_date              in varchar,
    p_column            in varchar )
return varchar2;

function get_section_name (
	p_section_id   in number)
	return varchar2
	;

function get_page_count (
    p_ws_app_id    in number)
    return number;
    
function get_report_count (
    p_ws_app_id    in number)
    return number;
    
function get_datagrid_count (
    p_ws_app_id    in number)
    return number;
    
function get_file_count (
	p_ws_app_id    in number)
	return number
	;
function get_file_size (
	p_ws_app_id   in number)
	return number
	;

function get_section_count (
	p_ws_app_id   in number)
	return number;

function get_note_count (
	p_ws_app_id   in number)
	return number;

function get_tag_count (
	p_ws_app_id   in number)
	return number;
	
function get_datagrid_row_count (
	p_ws_app_id   in number)
	return number;

function get_acl_table 
    return clob;

procedure send_page_email (
    p_ws_app_id   in number,
    p_webpage_id  in number,
    p_to          in varchar2 default null,
    p_subject     in varchar2 default null,
    p_body        in varchar2 default null
    );

procedure create_data_grid_from_cp_paste (
    p_app_id            in number,
    p_ws_app_id         in number,
    p_name              in varchar2,
    p_alias             in varchar2 default null,
    p_headings_included in varchar2 default null,
    p_collection_name   in varchar2 default null,
    p_worksheet_id      out number,
    p_websheet_id       out number
    );
        
procedure create_data_grid_from_scratch (
    p_ws_app_id     in number,
    p_name          in varchar2,
    p_alias         in varchar2 default null,
    p_column_order  in varchar2 default null,
    p_worksheet_id  out number,
    p_websheet_id   out number
    );

procedure p33_fetch_blob_format (
    p_format_mask         in varchar2,
    --
    p_type                out varchar2,
    p_blob_table          out varchar2,
    p_blob_column         out varchar2,
    p_pk1_column          out varchar2,
    p_pk2_column          out varchar2,
    p_mimetype_column     out varchar2,
    p_filename_column     out varchar2,
    p_last_upd_column     out varchar2,
    p_charset_column      out varchar2,
    p_content_disposition out varchar2,
    p_download_text       out varchar2
    );

procedure get_lov_json(
    p_worksheet_id   in varchar2,
    p_db_column_name in varchar2 default null
    );              
    
    
end  wwv_flow_ws_api;
/
show errors
