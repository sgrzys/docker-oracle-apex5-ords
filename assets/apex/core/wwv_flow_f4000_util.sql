set define '^' verify off
prompt ...wwv_flow_f4000_util
create or replace package wwv_flow_f4000_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2006 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_f4000_util
--
--    DESCRIPTION
--      Application Express logic
--
--      MODIFIED (MM/DD/YYYY)
--      mhichwa   06/16/2006 - Created
--      mhichwa   06/23/2006 - Added CREATE_LOGIN_PAGE2, create_auth_setup, POPULATE_LINK_COL, P327_CREATE_REPORT
--      mhichwa   06/23/2006 - Removed unused argument
--      mhichwa   01/09/2007 - Added create_list_entry_as_copy
--      mhichwa   01/09/2007 - Added show_workspace_images, show_standard_images
--      mhichwa   01/23/2007 - Added set flow page
--      mhichwa   01/23/2007 - Added show help link
--      mhichwa   02/02/2007 - Added procedure set_developer_preferences
--      rvallam   11/20/2007 - Added parameters to procedure P327_CREATE_REPORT
--      mhichwa   11/20/2007 - Added require_flow_id called from 4000:1
--      cbcho     11/20/2007 - Added region_src_changed, save_interactive_rpt_region
--      cbcho     11/20/2007 - Renamed region_src_changed to interactive_rpt_src_changed
--      mhichwa   11/27/2007 - Added show_popup_images
--      rvallam   12/17/2007 - Added print_label parameter to P327_CREATE_REPORT
--      rvallam   12/24/2007 - Added search parameters to P327_CREATE_REPORT
--      mhichwa   01/02/2008 - Added get_build_opt_util function
--      mhichwa   01/07/2008 - Added wwv_flow_f4000_util
--      jstraub   01/16/2008 - Moved is_valid_chart_query and is_valid_dial_chart_query from WWV_RENDER_CHART2 (Bug 6710044)
--      msewtz    01/24/2008 - Added is_valid_lov_query (bug 6707530)
--      jstraub   02/05/2008 - Added wrapper functions/procedures from sys.wwv_dbms_sql to be called from builder applications
--      mhichwa   02/19/2008 - Added function validate_blob_mask
--      mhichwa   02/19/2008 - Added function validate_form_blob_mask
--      mhichwa   02/20/2008 - Added p_source_type argument to validate_form_blob_mask function
--      mhichwa   02/20/2008 - Changed function name from validate_form_blob_mask to validate_form_dbsource
--      pawolf    07/23/2009 - Added check_sql
--      mhichwa   11/17/2009 - create procedure create_feedback_page 
--      mhichwa   11/24/2009 - added support for additional feedback attributes
--      pawolf    11/27/2009 - Added p_use_tree_for_p4150 to set_developer_preferences
--      pawolf    01/14/2010 - Enhanced check_sql
--      pawolf    03/05/2010 - Added validate_db_column
--      mhichwa   03/16/2010 - added get_show_tables_01
--      mhichwa   04/08/2010 - added attributes to create_feedback_page
--      hfarrell  04/09/2010 - Updated P327_CREATE_REPORT to include p_use_ui_defaults for attribute dictionary ui default values
--      hfarrell  02/01/2011 - Added function is_valid_list_query for Dynamic Lists (feature #602)
--      arayner   03/28/2011 - Added validate_da_compatible_button (feature #385)
--      pawolf    03/28/2011 - Removed PLUG_DISPLAY_ERROR_MESSAGE (feature# 544)
--      arayner   03/29/2011 - Extended validate_da_compatible_button procedure (feature #385)
--      hfarrell  04/05/2011 - Fix for bug 7048187: replaced all occurrences of varchar2s with varchar2a
--      arayner   04/12/2011 - Added validate_button_action (feature 385)
--      arayner   04/13/2011 - Added support for report query checking in validate_button_action (feature 667)
--      arayner   04/20/2011 - Added validate_button_style (feature 667)
--      arayner   04/21/2011 - Reauthoring of validate_button_action to now support working across all button action pages and clearing session state where appropriate (feature 667)
--      cneumuel  05/10/2011 - Added is_query_with_order_by (bug #12353172)
--      pawolf    05/19/2011 - Removed del_auth_scheme_conf (feature 581)
--      cneumuel  06/08/2011 - Moved login page creation to wwv_flow_wizard_api
--      pawolf    03/15/2012 - Added user_interface_id to p327_create_report and CREATE_LOGIN_PAGE2
--      pawolf    03/19/2012 - Changed code to only use new columns in wwv_flow_user_interfaces instead of the old columns in wwv_flow (feature# 827)
--      cneumuel  05/30/2012 - Remove obsolete create_auth_setup (bug #13253252)
--      cneumuel  08/09/2012 - In is_valid_lov_query: added p_owner, so wwv_flow_hint.is_valid_lov_query can be removed
--      arayner   01/22/2013 - Added validate_da_on_delete_button for improved validation when deleting buttons, to check for references in Dynamic Actions (bug #14530434)
--      pawolf    01/24/2013 - Changed interface of check_sql and is_validate_lov_query (bug #13950794)
--      hfarrell  05/27/2013 - Added p_page_mode to P327_CREATE_REPORT, create_feedback_page (feature #587)
--      cneumuel  11/29/2013 - page button migration (feature #1314)
--      hfarrell  01/27/2013 - In create_feedback_page, P327_CREATE_REPORT: added p_group_name (feature #1347)
--      msewtz    02/14/2014 - Added navigation list support to create report, IRR and form on table wizards
--      pawolf    06/20/2014 - Added p_escape_result to check_plsql and check_sql (EA2-10)
--      pawolf    10/03/2014 - In check_sql: added p_flow_id
--      hfarrell  10/13/2014 - In show_popup_images: added p_category
--      pawolf    10/27/2014 - Removed set_developer_preferences
--      pawolf    03/11/2015 - Added get_edit_icons (bug #20444680)
--
--------------------------------------------------------------------------------

function get_show_tables_01 
    return varchar2;

function validate_blob_mask (
   p_mask         in varchar2 default null,
   p_app_id       in number   default null)
   return varchar2
   ;

function validate_db_column (
    p_parsing_schema in varchar2,
    p_owner          in varchar2,
    p_table_name     in varchar2,
    p_column_name    in varchar2 )
    return varchar2;

function get_next_app_page (
    p_request      in varchar2 default null,
    p_current_app  in number   default null,
    p_current_page in number   default null)
    return number
    ;

function get_build_opt_util
    return varchar2
    ;

procedure show_popup_images (
    p_image_size    in number   default null,
    p_show          in varchar2 default null,
    p_category      in varchar2 default null)
    ;

function interactive_rpt_src_changed (
    p_flow_id    in number,
    p_region_id  in number,
    p_new_source in varchar2
    ) return boolean;

procedure save_interactive_rpt_region (
    p_region_id                in number,
    p_flow_id                  in number,
    p_plug_name                in varchar2 default null,
    p_region_name              in varchar2 default null,
    p_region_template          in number default null,
    p_display_seq              in number default null,
    p_display_column           in number default null,
    p_display_point            in varchar2 default null,
    p_region_source            in varchar2 default null,
    p_breadcrumb_template      in number default null,
    p_list_template            in number default null,
    p_required_role            in varchar2 default null,
    p_display_when_cond        in varchar2 default null,
    p_display_when_cond2       in varchar2 default null,
    p_display_cond_type        in varchar2 default null,
    p_region_header            in varchar2 default null,
    p_region_footer            in varchar2 default null,
    p_region_column_width      in varchar2 default null,
    p_customized               in varchar2 default null,
    p_customized_name          in varchar2 default null,
    p_requied_patch            in number   default null,
    p_url_text_begin           in varchar2 default null,
    p_url_text_end             in varchar2 default null,
    p_translate_title          in varchar2 default null,
    p_comment                  in varchar2 default null);

procedure require_flow_id
   ;

-- for popup pages to implement help links
procedure show_help_link (
   p_lang           in varchar2 default null,
   p_session_id     in varchar2 default null,
   p_application_id in varchar2 default null,
   p_page_id        in varchar2 default null)
   ;

-- application level process
procedure set_flow_page
;

-- page 4000.602
procedure copy_list (
    p_copy_from_list_id   in number,
    p_new_list_name       in varchar2)
    ;

-- page 4000.663
procedure copy_list_from_app (
    p_copy_from_app_id    in number,
    p_copy_from_list_id   in number,
    p_new_list_name       in varchar2,
    p_new_application_id  in number)
    ;


-- 4000.4651
procedure show_list_source (
   p_list_id        in number,
   p_application_id in number,
   p_session        in number)
   ;

-- 4000.4651
procedure show_region_tree_source (
   p_application    in number,
   p_id             in number,
   p_session        in number)
   ;

-- 4000.849
procedure create_feedback_page (
    p_page_id                    in number   default null,
    p_application_id             in number   default null,
    p_page_name                  in varchar2 default null,
    p_page_mode                  in varchar2 default null,
    p_group_name                 in varchar2 default null,
    p_user_interface_id          in number   default null,
    p_feedback_label             in varchar2 default null,
    p_feedback_type_label        in varchar2 default null,
    p_page_template_id           in varchar2 default null,
    p_region_template_id         in number   default null,
    p_label_template_id          in number   default null,
    p_component_selector_yn      in varchar2 default 'N',
    p_extra_attributes           in number   default 0,
    p_create_nav_bar_entry_yn    in varchar2 default 'N',
    p_nav_bar_entry_label        in varchar2 default null,
    p_enable_feedback_yn         in varchar2 default null);

-- 4000.4495
procedure CREATE_LOGIN_PAGE2 (
    P_FB_FLOW_ID                       in varchar2 default null,
    P_P826_LOGIN_PAGE                  in varchar2 default null,
    p_user_interface_id                in number );

-- 4000.12
procedure POPULATE_LINK_COL (
    P_P5_CREATE_JOINS                  in varchar2 default null,
    P_P4_MASTER_OWNER                  in varchar2 default null,
    P_P4_MASTER_TABLE                  in varchar2 default null,
    P_P5_DETAIL_OWNER                  in varchar2 default null,
    P_P5_DETAIL_TABLE                  in varchar2 default null );

-- 4000.327
procedure P327_CREATE_REPORT (
    p_f4000_p4701_tab_options          in varchar2 default null,
    p_f4000_p4701_tab_text             in varchar2 default null,
    p_f4000_p4701_tab_name             in varchar2 default null,
    p_fb_flow_id                       in varchar2 default null,
    p_f4000_p4701_flow_step_id         in varchar2 default null,
    p_f4000_p4701_page_name            in varchar2 default null,
    p_page_mode                        in varchar2 default null,
    p_group_name                       in varchar2 default null,
    p_p259_user_interface_id           in number   default null,
    p_f4000_p4701_report_sql           in varchar2 default null,
    p_p4796_report_template            in varchar2 default null,
    p_f4000_p4701_tab_set              in varchar2 default null,
    p_f4000_p4701_plug_template        in varchar2 default null,
    p_f4000_p4701_plug_name            in varchar2 default null,
    p_f4000_p4701_plug_column          in varchar2 default null,
    p_f4000_p4701_max_rows             in varchar2 default null,
    p_f4000_p4701_rpt_type             in varchar2 default null,
    p_p4701_breadcrumb_id              in varchar2 default null,
    p_p4701_breadcrumb_name            in varchar2 default null,
    p_nav_list_id                      in number   default null,
    p_nav_list_item_id                 in number   default null,
    p_nav_list_item_name               in varchar2 default null,
    p_nav_list_parent_item_id          in number   default null,
    p_nav_list_child_item_name         in varchar2 default null,    
    p_p4701_parent_id                  in varchar2 default null,
    p_f4000_p4795_query_options        in varchar2 default null,
    p_f4000_p4795_max_cols             in varchar2 default null,
    p_f4000_p4796_break_cols           in varchar2 default null,
    p_f4000_p4796_sorting              in varchar2 default null,
    p_f4000_p4796_csv_output           in varchar2 default null,
    p_f4000_p4796_csv_link_text        in varchar2 default null,
    p_f4000_p4796_print_output         in varchar2 default null,
    p_f4000_p4796_print_format         in varchar2 default null,
    p_f4000_p4796_print_label          in varchar2 default null,
    p_f4000_p4796_enable_search        in varchar2 default null,
    p_search_list                      in varchar2 default null,
    p_use_ui_defaults                  in varchar2 default null);

procedure create_list_entry_as_copy (
   p_id           in number,
   p_list_id      in number,
   p_new_sequence in number,
   p_new_text     in varchar2);

procedure show_standard_images (
   p_icon_size     in varchar2 default '64',
   p_search        in varchar2 default null,
   p_current_image in varchar2 default null,
   p_columns       in number default 3,
   p_show          in varchar2 default 'STANDARD')
   ;

procedure show_workspace_images (
   p_search        in varchar2 default null,
   p_current_icon  in varchar2 default null,
   p_columns       in number default 3)
   ;
procedure show_application_images (
   p_search        in varchar2 default null,
   p_current_icon  in varchar2 default null,
   p_columns       in number default 3)
   ;

function get_edit_icons (
   p_item_name in varchar2 )
   return varchar2;

function is_valid_chart_query (
    p_flow_id            in number,
    p_security_group_id  in number,
    p_query              in varchar2
  ) return varchar2;

function is_valid_dial_chart_query (
    p_flow_id            in number,
    p_security_group_id  in number,
    p_query              in varchar2
  ) return varchar2;

--==============================================================================
-- Validates a LOV query which has to contain two columns.
-- If p_parse_as_schema is null, it will default to
-- wwv_flow_security.flow_owner for FB_FLOW_ID
--==============================================================================
function is_valid_lov_query (
    p_query            in varchar2,
    p_parse_as_schema  in varchar2 default null,
    p_min_column_count in number default 2,
    p_max_column_count in number default 2 )
    return varchar2;

--==============================================================================
function is_valid_list_query (
    p_query       varchar2,
    p_query_type  varchar2
) return varchar2;

--==============================================================================
-- Return if p_query contains an order by clause at the end.
-- Used by validations on 4000:420, 4000:4651, 4000:4796 and 4000:831
--==============================================================================
function is_query_with_order_by (
    p_query       in varchar2 )
    return boolean;

/* Used to validate buttons are compatible with Dynamic Actions */
procedure validate_da_compatible_button (
    p_flow_id                   in number,
    p_workspace_id              in number,
    p_button_template_id        in number,
    p_button_cattributes        in varchar2,
    p_error_item_template_chk   in varchar2     default null,
    p_error_item_attribute_chk  in varchar2     default null,
    p_error_display_location    in varchar2
);

/* Used to validate action when button clicked properties */
procedure validate_button_action (
    p_page_item_prefix          in varchar2
);

/* Used to validate button style attributes */
procedure validate_button_style (
    p_style_item          in varchar2,
    p_tag_attr_item       in varchar2,
    p_image_item          in varchar2,
    p_image_attr_item     in varchar2,    
    p_template_item       in varchar2
);

/* Checks if a button is referenced by any Dynamic Actions in an application */
procedure validate_da_on_delete_button (
    p_flow_id             in number,
    p_button_id           in number,
    p_workspace_id        in number
);

function check_plsql (
    p_sql               in varchar2,
    p_flow_id           in number,
    p_security_group_id in number,
    p_escape_result     in boolean default true
) return varchar2;

--==============================================================================
-- Checks for a valid SQL statement
-- Returns the error text.
--==============================================================================
function check_sql (
    p_sql                 in varchar2,
    p_flow_id             in number   default nv('FB_FLOW_ID'),
    p_parse_as_schema     in varchar2 default null,
    p_min_column_count    in number,
    p_max_column_count    in number   default null,
    p_invalid_sql_error   in varchar2,
    p_column_count_error  in varchar2,
    p_column_name_invalid in varchar2 default null,
    p_column_not_unique   in varchar2 default null,
    p_escape_result       in boolean default true )
    return varchar2;

procedure run_block
     ( p_sql       in varchar2,
       p_user      in varchar2,
       p_use_roles in boolean default FALSE);

function select_num( p_sql in varchar2, p_user in varchar2 ) return number;

procedure run_ddl
     ( p_sql    in sys.dbms_sql.varchar2a,
       p_user   in varchar2 );

function countem( p_sql in varchar2,
                  p_user in varchar2 ) return varchar2;

end wwv_flow_f4000_util;
/
show errors
