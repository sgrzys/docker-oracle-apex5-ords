set define '^'
set verify off
prompt ...wwv_flow_wiz_confirm

Rem NAME
Rem      wwv_flow_wiz_confirm.sql
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     cbcho      03/22/2006 - Created
Rem     cbcho      04/07/2006 - Added more procedures to move large PL/SQL region
Rem     cbcho      06/02/2006 - Added copy_page_other_app(Bug 5262612)
Rem     mhichwa    11/06/2006 - Add create page zero procedure
Rem     cbcho      11/09/2006 - Added create_flash_chart
Rem     cbcho      01/08/2006 - Added migrate_svg_to_flash
Rem     cbcho      10/30/2006 - Added create_dynamic_query
Rem     cbcho      11/20/2007 - Added change_interactive_rpt_region
Rem     sathikum   11/28/2007 - Added display_type to create_monthly_calendar
Rem     mhichw a   12/10/2007 - Changed comments
Rem     rvallam    13/10/2007 - Added new parameters to create_sql_report for printing,CSV and search options.
Rem     cbcho      12/17/2007 - Changed create_query_and_update to remove form tab info, and add p_rpt_implementation
Rem     sspadafo   01/03/2009 - Added support for declarative secure cookie property in create_auth_scheme
Rem     hfarrell   07/04/2009 - Added migrate_flash_to_flash5
Rem     hfarrell   03/18/2010 - Updated create_tree and generate_tree_region_query call to add p_start_item and p_start_value
Rem     hfarrell   03/19/2010 - Updated create_tree and generate_tree_region_query call to add p_tooltip and p_icon
Rem     mhichwa    04/21/2011 - added p_show_title_message argument to create_application
Rem     jstraub    04/21/2011 - added p_rv to create_form_on_table and create_query_and_update
Rem     pmanirah   04/25/2011 - Added create_data_load_wizard procedure
Rem     hfarrell   05/16/2011 - Added create_app_from_template and create_instant_application (feature #661)
Rem     hfarrell   05/17/2011 - Updated create_app_from_template to include additional information for display in Application Temlate create wizard (feature #661)
Rem     pmanirah   06/02/2011 - Updated create_data_load_wizard to include the p_name parameter
Rem     pmanirah   06/02/2011 - Removed p_table_name parameter from create_data_load_wizard
Rem     hfarrell   06/14/2011 - Updated create_app_from_template to add parameter p_app_type
Rem     pawolf     06/15/2011 - Added create_region_plugin_page (feature# 724)
Rem     hfarrell   06/16/2011 - Updated create_app_from_template to change p_app_type default from FLOW to DATABASE
Rem     pmanirah   06/17/2011 - Updated create_data_load_wizard by adding a new parameter p_exists to differenticate the first time and recreation of pages
Rem     pawolf     03/13/2012 - Removed some parameters from create_page (feature# 827)
Rem     msewtz     03/29/2012 - updated create_application procedure to show updated theme information (feature #784)
Rem     hfarrell   04/20/2012 - Renamed migrate_svg_to_flash to migrate_svg_to_html5, migrate_flash_to_flash5 to migrate_flash_chart, and added migrate_html_to_html5
Rem     hfarrell   05/16/2012 - Added create_success_page, to tie in with wizard changes for 4.2
Rem     cbcho      06/08/2012 - Added  create_warning_page
Rem     pawolf     06/21/2012 - Added global page support (feature #987)
Rem     msewtz     02/14/2014 - Added navigation list support to create report, IRR and form on table wizards
Rem     hfarrell   04/17/2014 - Removed migrate_flash_chart (feature #1345)
Rem     msewtz     06/13/2014 - Added navigation list to create app wizard confirm
Rem     msewtz     07/18/2014 - Added subscribe theme to create app wizard confirm
Rem     pmanirah   07/25/2014 - Added more parameters to create_region_plugin_page procedure
Rem     pawolf     08/12/2014 - Removed p_tab_options from create_acl
Rem     pawolf     08/12/2014 - Removed tab information from a number of APIs
Rem     hfarrell   11/25/2014 - In copy_page & copy_page_other_app: added support for navigation menu parameters (bug #19949042)
Rem     pmanirah   01/05/2015 - Added more parameters to create_region_plugin_page procedure

create or replace package wwv_flow_wiz_confirm as
--  Copyright (c) Oracle Corporation 2006-2011. All Rights Reserved.
--
--    DESCRIPTION
--     This package displays wizard confirmation pages.
--
--
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--

procedure copy_application (
    p_old_app_id      in number default null,
    p_old_app_name    in varchar2 default null,
    p_new_app_id      in number default null,
    p_new_app_name    in varchar2 default null,
    p_copy_deployment in varchar2 default 'N'
    );

procedure create_application (
    p_application_id      in number   default null,
    p_application         in varchar2 default null,
    p_application_name    in varchar2 default null,
    p_schema              in varchar2 default null,
    p_language            in varchar2 default null,
    p_authentication      in varchar2 default null,
    p_create_tabs         in varchar2 default null,
    p_navigation_type     in varchar2 default null,
    p_shared_components   in varchar2 default null,
    p_copy_options        in varchar2 default null,
    p_copy_from_theme_id  in number   default null,
    p_theme_app_id        in number   default null,
    p_show_title_message  in varchar2 default 'Y',
    p_subscribe_theme     in varchar2 default 'N'
);

procedure create_form_on_ws_rpt (
    p_flow_id            in number default null,
    p_region_template    in number default null,
    p_region_template2   in number default null,
    p_report_template    in number default null,
    p_page_id            in number default null,
    p_page_name          in varchar2 default null,
    p_region_name        in varchar2 default null,
    p_region_name2       in varchar2 default null,
    p_ws_id              in number default null,
    p_operation_id       in number default null,
    p_collection_name    in varchar2 default null,
    p_array              in number default null);

procedure create_standard_tab (
    p_flow_id                      in number default null,
    p_new_parent_tabset            in varchar2 default null,
    p_new_parent_tab_text          in varchar2 default null,
    p_parent_tab_set               in varchar2 default null,
    p_tab_set_choice               in varchar2 default null,
    p_tab_set                      in varchar2 default null,
    p_new_tab_display_text         in varchar2 default null,
    p_tab_sequence                 in varchar2 default null,
    p_current_page                 in varchar2 default null,
    p_current_image                in varchar2 default null,
    p_non_current_page             in varchar2 default null,
    p_image_attributes             in varchar2 default null,
    p_display_condition            in varchar2 default null,
    p_condition_type               in varchar2 default null,
    p_display_condition_text       in varchar2 default null,
    p_build_option                 in varchar2 default null);


procedure create_acl (
    p_flow_id     in number default null,
    p_page_id     in number default null );


procedure create_query_and_update (
    p_flow_id            in number default null,
    p_columns            in varchar2 default null,
    p_rpt_select_list   in varchar2 default null,
    p_insert             in varchar2 default null,
    p_update             in varchar2 default null,
    p_delete             in varchar2 default null,
    p_rpt_page_id        in number default null,
    p_rpt_page_name      in varchar2 default null,
    p_rpt_implementation in varchar2 default null,
    p_form_page_id       in number default null,
    p_form_page_name     in varchar2 default null,
    p_table_owner        in varchar2 default null,
    p_table_name         in varchar2 default null,
    p_pk1                in varchar2 default null,
    p_pk2                in varchar2 default null,
    p_rv                 in varchar2 default null,
    p_where_clause       in varchar2 default null);

procedure create_tree (
    p_flow_id          in number default null,
    p_region_template  in number default null,
    p_start_option     in varchar2 default null,
    p_owner            in varchar2 default null,
    p_table_name       in varchar2 default null,
    p_id               in varchar2 default null,
    p_pid              in varchar2 default null,
    p_name             in varchar2 default null,
    p_start_item       in varchar2 default null,
    p_start_value      in varchar2 default null,
    p_link_option      in varchar2 default null,
    p_link_page_id     in number default null,
    p_link_item        in varchar2 default null,
    p_where            in varchar2 default null,
    p_order_by         in varchar2 default null,
    p_page_id          in number default null,
    p_page_name        in varchar2 default null,
    p_region_name      in varchar2 default null,
    p_tree_name        in varchar2 default null,
    p_tree_type        in varchar2 default null,
    p_max_levels       in number default null,
    p_tooltip          in varchar2 default null,
    p_icon             in varchar2 default null);

procedure create_structured_report (
    p_flow_id         in number default null,
    p_report_template in number default null,
    p_region_template in number default null,
    p_sorting         in varchar2 default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_name     in varchar2 default null );

procedure  create_demo_app (
    p_schema   in varchar2 default null,
    p_demo_app in varchar2 default null);

procedure create_sql_report (
    p_flow_id                   in number default null,
    p_page_id                   in number default null,
    p_region_template           in number default null,
    p_report_template           in number default null,
    p_region_name               in varchar2 default null,
    p_region_column             in varchar2 default null,
    p_col_headings              in varchar2 default null,
    p_max_columns               in varchar2 default null,
    p_max_rows                  in varchar2 default null,
    p_break_cols                in varchar2 default null,
    p_csv_output                in varchar2 default null,
    p_csv_text                  in varchar2 default null,
    p_print_output              in varchar2 default null,
    p_print_label               in varchar2 default null,
    p_print_format              in varchar2 default null,
    p_enable_sorting            in varchar2 default null,
    p_enable_search             in varchar2 default null);

procedure create_page (
    p_flow_id    in number default null,
    p_page_id    in number default null,
    p_page_name  in varchar2 default null,
    p_page_title in varchar2 default null );

procedure create_global_page (
    p_flow_id              in number default null) ;

procedure copy_page_other_app (
    p_flow_id_from             in number   default null,
    p_page_id_from             in number   default null,
    p_flow_id_to               in number   default null,
    p_page_id_to               in number   default null,
    p_page_name_to             in varchar2 default null,
    p_navigation_type          in varchar2 default null,
    --
    p_tab_options              in varchar2 default null,
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_breadcrumb_id            in number   default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_breadcrumb        in varchar2 default null
    );

procedure create_form_on_table (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_columns         in varchar2 default null,
    p_region_template in number default null,
    p_insert          in varchar2 default null,
    p_update          in varchar2 default null,
    p_delete          in varchar2 default null,
    p_region_name     in varchar2 default null,
    p_schema          in varchar2 default null,
    p_table_name      in varchar2 default null,
    p_pk1             in varchar2 default null,
    p_pk2             in varchar2 default null,
    p_rv              in varchar2 default null);

procedure create_wizard (
    p_flow_id              in number default null,
    p_region_template      in number default null,
    p_info_region          in varchar2 default null,
    p_info_region_template in number default null,
    p_default_info_text    in varchar2 default null,
    p_cancel               in varchar2 default null,
    p_finish               in varchar2 default null,
    p_previous             in varchar2 default null,
    p_next                 in varchar2 default null,
    p_cancel_branch        in varchar2 default null,
    p_finish_branch        in varchar2 default null);

procedure create_breadcrumb_region (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_region_type     in varchar2 default null,
    p_region_template in number default null,
    p_menu_template   in number default null,
    p_menu_template2  in number default null,
    p_parent_menu     in number default null,
    p_menu_text       in varchar2 default null,
    p_display_point   in varchar2 default null);

procedure copy_page (
    p_flow_id                  in number   default null,
    p_navigation_type          in varchar2 default null,
    --
    p_tab_options              in varchar2 default null,
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_copy_to_page_id          in number   default null,
    p_copy_to_page_name        in varchar2 default null);

procedure create_auth_scheme (
    p_invalid_sess_target     in varchar2 default null,
    p_invalid_session_url     in varchar2 default null,
    p_invalid_session_page    in varchar2 default null,
    p_name                    in varchar2 default null,
    p_pg_sentry_function      in varchar2 default null,
    p_session_verify_function in varchar2 default null,
    p_pre_auth_process        in varchar2 default null,
    p_auth_type               in varchar2 default null,
    p_auth_function           in varchar2 default null,
    p_ldap_host               in varchar2 default null,
    p_ldap_port               in varchar2 default null,
    p_ldap_string             in varchar2 default null,
    p_ldap_username_edit      in varchar2 default null,
    p_post_auth_process       in varchar2 default null,
    p_cookie_name             in varchar2 default null,
    p_cookie_path             in varchar2 default null,
    p_cookie_domain           in varchar2 default null,
    p_use_secure_cookie_yn    in varchar2 default null,
    p_logout_url              in varchar2 default null);

procedure regular_exp;

procedure create_master_detail (
    p_flow_id      in number default null,
    p_master_owner in varchar2 default null,
    p_master_table in varchar2 default null,
    p_detail_owner in varchar2 default null,
    p_detail_table in varchar2 default null,
    p_master_sort  in varchar2 default null,
    p_layout       in varchar2 default null,
    p_include_master_rpt in varchar2 default 'Y');

procedure create_form_on_ws (
    p_flow_id            in number default null,
    p_region_template_id in number default null,
    p_page_id            in number default null,
    p_page_name          in varchar2 default null,
    p_region_name        in varchar2 default null,
    p_ws_id              in number default null,
    p_operation_id       in number default null);

procedure create_html_chart (
    p_flow_id     in number default null,
    p_region_id   in number default null,
    p_page_id     in number default null,
    p_page_name   in varchar2 default null,
    p_region_name in varchar2 default null,
    p_chart_sql   in varchar2 default null,
    p_axis        in varchar2 default null,
    p_scale       in varchar2 default null,
    p_chart_type  in varchar2 default null,
    p_num_mask    in varchar2 default null);

procedure create_monthly_calendar (
    p_flow_id     in number default null,
    p_region_id   in number default null,
    p_page_id     in number default null,
    p_page_name   in varchar2 default null,
    p_region_name in varchar2 default null,
    p_owner       in varchar2 default null,
    p_table       in varchar2 default null,
    p_date_col    in varchar2 default null,
    p_display     in varchar2 default null,
    p_select_rpt_type in varchar2 default null,
    p_display_type in varchar2 default null);

procedure create_tabular_form (
    p_flow_id      in number default null,
    p_page_id      in number default null,
    p_page_name    in varchar2 default null,
    p_region_title in varchar2 default null,
    p_owner        in varchar2 default null,
    p_table_name   in varchar2 default null,
    p_pk1          in varchar2 default null,
    p_pk2          in varchar2 default null,
    p_columns      in varchar2 default null,
    p_upd_cols     in varchar2 default null);

procedure delete_list_region_warning (
    p_flow_id            in number default null,
    p_session_id         in number default null,
    p_region_id          in number default null,
    p_region_source_type in varchar2 default null);

procedure create_form_on_sp (
    p_flow_id            in number default null,
    p_page_id            in number default null,
    p_page_name          in varchar2 default null,
    p_region_template_id in number default null,
    p_region_name        in varchar2 default null,
    p_owner              in varchar2 default null,
    p_procedure          in varchar2 default null);

procedure create_svg_chart (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_template in number default null,
    p_region_name     in varchar2 default null,
    p_chart_type      in varchar2 default null);

procedure create_flash_chart (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_template in number default null,
    p_region_name     in varchar2 default null,
    p_chart_type      in varchar2 default null);

procedure create_form_on_query (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_template in number default null,
    p_region_name     in varchar2 default null,
    p_query           in varchar2 default null);

procedure select_rpt_template (
    p_theme         in number default null,
    p_checked_items in varchar2 default null);

procedure create_summary_page (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_name     in varchar2 default null,
    p_region_template in varchar2 default null);
    
procedure create_success_page (
    p_success_msg     in varchar2 default null);
    
procedure create_warning_page (
    p_title           in varchar2 default null,
    p_warning_msg     in varchar2 default null);

procedure migrate_svg_to_html5 (
    p_flow_id         in number,
    p_page_id         in number,
    p_region_id       in number);
    
procedure structured_query_condition;

procedure create_dynamic_query (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_template in number default null,
    p_region_name     in varchar2 default null );

procedure create_region_plugin_page (
    p_flow_id         in number,
    p_page_id         in number,
    p_page_name       in varchar2,
    p_region_name     in varchar2,
    p_fm_page_id      in number default null,
    p_fm_page_name    in varchar2 default null,
    p_table_owner     in varchar2 default null,
    p_new_page_id     in number default null,
    p_new_page_name   in varchar2 default null,
    p_table_name      in varchar2 default null );

procedure change_interactive_rpt_region (
    p_flow_id         in number,
    p_region_id       in number,
    p_region_source   in varchar2 default null);
    
procedure migrate_html_to_html5 (
    p_flow_id         in number,
    p_page_id         in number,
    p_region_id       in number);

procedure create_data_load_wizard(
    p_flow_id               in number default null,
    --
    p_name                  in varchar2,
    p_owner                 in varchar2 default null,
    p_table_name            in varchar2 default null,
    p_exists                in varchar2 default 'no',
    --
    p_region_template       in number default null,
    --
    p_page_label_step_1     in varchar2,
    p_page_label_step_2     in varchar2,
    p_page_label_step_3     in varchar2,
    p_page_label_step_4     in varchar2,
    --
    p_page_step_1           in number,
    p_page_step_2           in number,
    p_page_step_3           in number,
    p_page_step_4           in number,
    --
    p_page_next_label       in varchar2 default 'NEXT',
    p_page_previous_label   in varchar2 default 'PREVIOUS',
    p_page_cancel_label     in varchar2 default 'CANCEL',
    p_page_cancel_branch	in varchar2 default '1',
    p_page_submit_label     in varchar2 default 'SUBMIT',
    p_page_submit_branch	in varchar2 default '1');

procedure create_app_from_template (
    p_old_app_id         in number default null,
    p_old_app_name       in varchar2 default null,
    p_new_app_id         in number default null,
    p_new_app_name       in varchar2 default null,
    p_schema             in varchar2 default null,
    p_language           in varchar2 default null,
    p_authentication     in varchar2 default null,
    p_create_tabs        in varchar2 default null,
    p_shared_components  in varchar2 default null,
    p_copy_options       in varchar2 default null,
    p_theme              in varchar2 default null,
    p_theme_id           in number   default null,
    p_copy_deployment    in varchar2 default 'N',
    p_install_deployment in varchar2 default 'N',
    p_app_type           in varchar2 default 'DATABASE'
    );
    
procedure create_instant_application (
    p_application_id      in number   default null,
    p_application         in varchar2 default null,
    p_application_name    in varchar2 default null,
    p_schema              in varchar2 default null,
    p_language            in varchar2 default null,
    p_authentication      in varchar2 default null,
    p_create_tabs         in varchar2 default null,
    p_shared_components   in varchar2 default null,
    p_copy_options        in varchar2 default null,
    p_theme               in varchar2 default null,
    p_theme_id            in number   default null,
    p_show_title_message  in varchar2 default 'Y');
    
   
end wwv_flow_wiz_confirm;
/
show errors
