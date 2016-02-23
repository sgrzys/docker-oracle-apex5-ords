set define '^' verify off
prompt ...wwv_flow_api
create or replace package wwv_flow_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
--
--    NAME
--      api.sql
--
--    DESCRIPTION
--     Interface to creating APEX attributes.
--
--    NOTES
--      API to insert application metadata into the apex data dictionary
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  10/09/1999 - Created
--     mhichwa  10/20/1999 - Added 3 new args to create_template
--     mhichwa  10/21/1999 - Added create_report_page procedure
--     mhichwa  10/23/1999 - Added flow_image_prefix
--     mhichwa  10/25/1999 - Removed help_text from wwv_flows
--     mhichwa  11/15/1999 - Added create_list_of_values and named_lov
--     mhichwa  11/23/1999 - Added non_current_image and image_attributes for tabs
--     mhichwa  12/01/1999 - Added p_body_title
--     mhichwa  12/02/1999 - Added p_icon_image2,3 p_icon_height2,3 p_icon_width2,3
--     mhichwa  12/07/1999 - Added p_required_patch, p_tab_comment, p_tab_parent_page
--     mhichwa  12/07/1999 - Added create_patch procedure
--     mhichwa  12/09/1999 - Added create_toplevel_tab includes change to template
--     mhichwa  12/09/1999 - Change parent tab from number to varchar2, change name to parent_tabset
--     mhichwa  12/13/1999 - Added default_template_position
--     mhichwa  12/15/1999 - Added attribute5,6
--     mhichwa  12/16/1999 - Added p_display_condition to top level tabs
--     mhichwa  12/30/1999 - Added update_page procedure
--     mhichwa  01/09/2000 - Depricated initial_occurs and max_occurances
--     mhichwa  01/10/2000 - Added create_translation and remove_translation
--     mhichwa  01/13/2000 - Added plug pages and templates
--     mhichwa  01/20/2000 - Added p_error_template, p_authenticate, p_login_url
--     mhichwa  01/23/2000 - Added support for g_logout_url
--     mhichwa  01/24/2000 - Added support for g_public_url_prefix
--     mhichwa  01/24/2000 - Added p_where_clause, p_pagination_size, p_table_bgcolor, p_heading_bgcolor, p_table_bgcolors
--     mhichwa  01/26/2000 - Added p_item_plug_id and p_button_plug_id
--     mhichwa  01/28/2000 - Added create_default_flow
--     mhichwa  01/31/2000 - Added table_bgcolor, heading_bgcolor, font_size/face, plug_colspan, table_cattributes
--     mhichwa  01/31/2000 - Added p_plug_template to create_report_page
--     mhichwa  02/03/2000 - Added row_template support
--     mhichwa  02/12/2000 - Added p_TRANSLATE_TO_ID
--     mhichwa  02/15/2000 - Added flow_version
--     mhichwa  02/17/2000 - Added bugs
--     mhichwa  02/29/2000 - Added list text
--     mhichwa  03/04/2000 - Added create_dynamic_translation
--     mhichwa  03/06/2000 - Added update tab display_conditions
--     mhichwa  03/15/2000 - Changed create_patch to create_build_option
--     mhichwa  03/15/2000 - Added set_build_option, set_flow_
--     mhichwa  03/16/2000 - Added plug tempalte2 and template3
--     mhichwa  03/17/2000 - Added set_flow_process_sql procedure
--     mhichwa  04/20/2000 - Added set_icon_bar_item procedure to allow updates to existing flows
--     mhichwa  05/02/2000 - Added p_list_item_current_for_pages
--     mhichwa  05/03/2000 - Added row_template_before_rows, after_rows and table_attributes
--     mhichwa  05/16/2000 - Added p_process_when_button_id
--     mhichwa  05/17/2000 - Added set flow application owner
--     mhichwa  05/20/2000 - Added create_message
--     mhichwa  05/24/2000 - Added validation condition and validation condition type
--     mhichwa  05/30/2000 - Added list_template
--     mhichwa  05/31/2000 - Added plug query options
--     mhichwa  06/02/2000 - Added comments and set_ procedures
--     mhichwa  06/05/2000 - Added custom_authentication_process custom_authentication_page
--     mhichwa  06/07/2000 - Added list item desplay conditions
--     mhichwa  06/08/2000 - Added p_lov_translated
--     mhichwa  06/11/2000 - Added p_public_user
--     mhichwa  06/13/2000 - Added display when type
--     mhichwa  06/14/2000 - Added static lov
--     mhichwa  06/15/2000 - Added display_condition_type for tabs.
--     mhichwa  06/18/2000 - Added process_type
--     mhichwa  06/18/2000 - Added branch_when_button_id
--     mhichwa  07/03/2000 - Added plug_column_width
--     mhichwa  07/10/2000 - Added region table cattributes
--     mhichwa  08/16/2000 - Added source post computation
--     mhichwa  08/19/2000 - Added p_help_text
--     mhichwa  08/23/2000 - Added create image
--     mhichwa  09/04/2000 - Added create shortcut
--     mhichwa  09/19/2000 - Added flow_status and flow_unavailable_text
--     mhichwa  09/24/2000 - Added url begin with and end text
--     mhichwa  09/28/2000 - Added java_entry_point
--     mhichwa  10/13/2000 - Added plug_query_table_border
--     mhichwa  10/19/2000 - Added plug_query_headings_type
--     mhichwa  10/31/2000 - Added plug_caching
--     mhichwa  11/07/2000 - Added extra list item display condition
--     mhichwa  11/09/2000 - Added flow static names and values
--     mhichwa  11/16/2000 - Added set login url
--     mhichwa  11/21/2000 - Added p_computation_error_message
--     mhichwa  11/23/2000 - Added bug work log
--     mhichwa  11/30/2000 - Added flow status
--     mhichwa  12/01/2000 - Added support for list item current type
--     mhichwa  12/07/2000 - Added vpd
--     mhichwa  12/08/2000 - Added security group ID
--     mhichwa  12/08/2000 - Added computation_error_message
--     mhichwa  12/09/2000 - Added security schemes
--     mhichwa  12/15/2000 - Added compute when text (2) places
--     mhichwa  12/15/2000 - Added tab disp cond text
--     mhichwa  12/18/2000 - Added branch_condition_text
--     mhichwa  12/19/2000 - Added scheme_text
--     mhichwa  12/20/2000 - Added security scheme to create page item, tabs, navbar, list items, and buttons
--     mhichwa  12/22/2000 - Added flow id to set static sub strings
--     mhichwa  12/22/2000 - Added comments and caching to security scheme table
--     mhichwa  12/22/2000 - Added security scheme to create flow
--     mhichwa  12/22/2000 - Obsolete caching for security schemes
--     mhichwa  01/12/2001 - Added tag_attributes
--     mhichwa  01/16/2001 - Added 4 app tab attributes and flow level application tab set attribute
--     mhichwa  01/16/2001 - Added create applicationt tab set and application tabs api
--     mhichwa  01/17/2001 - Added process sql clob
--     mhichwa  01/18/2001 - Added remove icon bar item
--     mhichwa  01/24/2001 - Added configuration support
--     mhichwa  02/15/2001 - Added list item expand to list template
--     mhichwa  03/01/2001 - Added button_alignment
--     mhichwa  03/03/2001 - Added custom auth login url
--     mhichwa  03/08/2001 - Added global id flow attribute
--     mhichwa  03/15/2001 - Added create tree
--     mhichwa  04/10/2001 - Added button cattributes
--     mhichwa  04/18/2001 - Added plug ignore pagination
--     mhichwa  04/20/2001 - Added display_id to create flow
--     cbcho    05/17/2001 - Obsolete create_page_on_table
--     cbcho    05/24/2001 - Obsolete Create_Chart_page
--     cbcho    05/31/2001 - Obsolete create_report_page
--     cbcho    06/01/2001 - Obsolete page_exists
--     cbcho    06/01/2001 - Obsolete buttons_exist
--     mhichwa  06/06/2001 - added get application owner function
--     mhichwa  06/18/2001 - Added item default type
--     mhichwa  06/28/2001 - Added create flow argument names and made obsolete old style names
--     mhichwa  06/28/2001 - Improved documentation
--     mhichwa  06/28/2001 - Added allow_duplicate_submissions
--     mhichwa  07/06/2001 - Added plug_query_num_rows_item and plug_query_num_rows_type
--     mhichwa  07/18/2001 - Added scecurity scheme caching argument
--     mhichwa  07/20/2001 - p_flow_language_derived_from
--     mhichwa  07/31/2001 - Added error page template attribute
--     mhichwa  08/08/2001 - Added report template additional attributes
--     mhichwa  08/08/2001 - Improved comments
--     mhichwa  08/17/2001 - Added set credentials procedure
--     mhichwa  08/21/2001 - Added auto_tab attributes to create page procedure to facilitate new create page wizard in flows
--     mhichwa  08/22/2001 - Added support for global notifications to create flow
--     mhichwa  08/23/2001 - Added set global notification
--     mhichwa  08/27/2001 - Added set version procedure and g_is_compatable boolean global
--     mhichwa  08/27/2001 - Added set version procedure
--     mhichwa  10/02/2001 - Added debug flag to set version procedure
--     mhichwa  10/05/2001 - Added support for field templates
--     mhichwa  10/17/2001 - Added update report column attributes (create_region_rpt_cols)
--     mhichwa  10/18/2001 - Added create_page_help
--     mhichwa  10/19/2001 - Added auto create parent tabs
--     mhichwa  10/22/2001 - Extended comments on the create flow procedure.
--     mhichwa  10/24/2001 - Added flow and table alias attributes
--     mhichwa  10/24/2001 - Added page process condition 2 and proc cond type 2 to enahance declarative programming
--     mhichwa  10/25/2001 - Added validation 2 changed compatability date
--     mhichwa  10/29/2001 - Added p_target and p_id_offset arguments to create procedures
--     mhichwa  10/30/2001 - Added when button pressed validation condition
--     mhichwa  11/12/2001 - Added html page header argument to create page
--     mhichwa  11/13/2001 - Added p_button_comment
--     jstraub  11/16/2001 - Added support for list_countclicks_y_n and list_countclicks_cat in create_list_item
--     mhichwa  11/26/2001 - Added default region template attribute
--     mhichwa  11/27/2001 - Changed compatable version date
--     mhichwa  11/30/2001 - Added p_tab_name attributes to create default flow
--     mhichwa  12/03/2001 - Added page is public flag
--     jstraub  12/14/2001 - Added support for simple_chart to create_page_plug
--     mhichwa  12/14/2001 - Added security_scheme argument for proc comp branch and val.
--     mhichwa  12/17/2001 - Added charset argument to create flow
--     mhichwa  12/21/2001 - Added p_theme to create default flow procedure
--     mhichwa  01/23/2002 - Added reference_id to 5 template api procedures
--     mhichwa  02/11/2002 - Added p_process_is_stateful_y_n
--     mhichwa  02/13/2002 - Added validation attributes
--     cbcho    02/14/2002 - Added check_version, check_sgid in the spec
--     cbcho    02/14/2002 - Moved create_default_flow to wwv_flow_create_flow_api pkg.
--     mhichwa  02/18/2002 - Added tag attributes2
--     mhichwa  02/19/2002 - Added process when 2 columns to flow processing.
--     mhichwa  02/19/2002 - Added post element text.
--     cbcho    03/19/2002 - Added p_process_type to create_flow_process procedure
--     cbcho    04/04/2002 - Added reference_id to shortcuts, security_schemes and icon_bar_item procedures
--     mhichwa  04/04/2002 - CHanged compatibility date to 2002 04 01
--     cbcho    04/10/2002 - Added p_reference_id to create_list_of_values
--     mhichwa  05/01/2002 - added new apis for 3 menu tables
--     mhichwa  05/01/2002 - added popup lov template
--     mhichwa  05/01/2002 - Added new page plug argument
--     mhichwa  05/01/2002 - Added p_lov_display_extra argument
--     mhichwa  05/01/2002 - Added p offset and other arguments to new procedures
--     mhichwa  05/07/2002 - Changed compatable from version to 2002.05.01
--     mhichwa  05/08/2002 - Added button_condition2
--     mhichwa  05/08/2002 - Added plug_display_when_cond2
--     mhichwa  05/09/2002 - Added condition 2 to parent tabs
--     mhichwa  05/09/2002 - Added lov_disp_cond2
--     mhichwa  05/09/2002 - Added validation condition 2
--     mhichwa  05/09/2002 - Added display_when2 attribute to page items
--     mhichwa  05/29/2002 - Added before first and after last for row templates
--     mhichwa  07/17/2002 - Added create_button_template
--     mhichwa  08/08/2002 - Created web services api spec
--     mhichwa  08/09/2002 - Added plug_query_more_data
--     mhichwa  08/11/2002 - Added exact_substitutions_only
--     mhichwa  08/11/2002 - Set compatability version to 2002.08.01
--     mhichwa  08/15/2002 - Added 3 new arguments to lov templates
--     mhichwa  08/15/2002 - Extended create build option
--     mhichwa  08/16/2002 - Completed create_web_service
--     sspadafo 09/24/2002 - Added create_auth_setup
--     mhichwa  09/25/2002 - Added cAttributes_element to create page item
--     sspadafo 09/27/2002 - Added create entry_points,create entry_point_args,create page_branch_args
--     mhichwa  09/30/2002 - Added additional default template controls to create flow api call
--     mhichwa  09/30/2002 - Added support for HTML_PAGE_ONLOAD
--     mhichwa  10/01/2002 - Added support for plug_override_reg_pos
--     mhichwa  10/02/2002 - Added plug_customized
--     mhichwa  10/02/2002 - Added page_is_protected_y_n
--     mhichwa  10/11/2002 - Added 10 new attributes to support pagination and customized regions
--     mhichwa  10/13/2002 - Added support for new generic attributes table
--     mhichwa  10/25/2002 - Added read only condition attributes
--     mhichwa  11/07/2002 - Added procedure set_plug_query_heading
--     mhichwa  11/08/2002 - Added additional flow attributes 9 - 20
--     jkallman 11/22/2002 - Changed datatype of p_bug_projected_close_date and p_bug_close_date to date in create_bug
--     sspadafo 12/06/2002 - Added set_security_group_id for callers outside the flows context
--     sspadafo 12/28/2002 - Added g_id_offset global for use in export files (Bug 2729770)
--     sspadafo 12/28/2002 - Added procedures for DML issued during import of export files (Bug 2729770)
--     sspadafo 12/29/2002 - Added function get_security_group_id (Bug 2729770)
--     sspadafo 12/30/2002 - Changed procedure set_security_group_id to honor p_security_group_id for internal users (Bug 2729770)
--     sspadafo 01/06/2003 - Added procedure set_build_status_run_only (Bug 2739851)
--     mhichwa  01/27/2003 - Added p_process_item_name (bug 2769756)
--     sspadafo 02/04/2003 - Added rename_tabset procedure (Bug 2785676)
--     cbcho    02/12/2003 - Added p_tab_name in create_page to fix creating a page with a tab that reuses an existing tab bug(Bug 2785188)
--     sspadafo 02/23/2003 - Changes for template column name changes from varchar2 to number (Bug 2748399)
--     msewtz   03/25/2003 - Added plug_query_hit_highlighting to page_plugs
--     jstraub  04/08/2003 - Added p_translate_this_template parameters to template procedures
--     cbcho    04/18/2003 - Added create_chart_series_attr
--     cbcho    05/05/2003 - Added reference_id to create_page_item
--     jstraub  05/15/2003 - Added create_report_region and create_report_column procedures
--     jstraub  05/22/2003 - Changed default_sort_dir default to null from 0 in create_report_column
--     jstraub  05/29/2003 - added create_query_definition, create_query_object, create_query_column, create_query_condition (Bug 2861658)
--     jstraub  05/30/2003 - Added p_format_mask to create_page_item and p_return_key_into_item1 & 2 in create_page_process (Bug 2983469)
--     mhichwa  06/30/2003 - Changed g_compatable_from_version to 2003 05 30
--     msewtz   06/23/2003 - Added sorting image parameters to create_page_plugs (bug 3020226)
--     jstraub  07/17/2003 - Added p_lov_data_comment to create_static_lov_data in support of bug 3046017
--     jstraub  07/24/2003 - Changed g_compatable_from_version to 20030717
--     sspadafo 07/29/2003 - Add g_nls_numeric_chars variable (Bug 3070294)
--     sspadafo 11/07/2003 - Add create_language_map_noop (Bug 3231672)
--     sspadafo 11/08/2003 - Remove create_language_map_noop (Bug 3231672)
--     mhichwa  04/22/2004 - Added lov_template (bug 3588925)
--     mhichwa  05/18/2004 - Added support for default region templates by component type (bug 3633463)
--     mhichwa  05/19/2004 - Added 6 attributes to the wwv_flow_region_report_column table api
--     mhichwa  05/19/2004 - Added 4 attributes to the wwv_flow_row_templates table api
--     mhichwa  05/19/2004 - Added breadcrumb and side bar default region positions to page template API
--     klrice   05/21/2004 - Added call for calendar regions
--     mhichwa  05/26/2004 - Added p_default_listr_template
--     jstraub  05/28/2004 - Changed g_compatable_from_version to 20040704
--     skutz    06/02/2004 - Changed theme_id and theme_class_id to all template create apis except create_popup_lov_template
--     skutz    06/02/2004 - Added create_calendar_template api
--     klrice   06/04/2004 - Changed create_calendar api
--     klrice   06/04/2004 - Added display_type to cals
--     jstraub  06/08/2004 - Added create_ws_operations, create_ws_parameters, create_ws_process_parms_map
--     skutz    06/10/2004 - Added theme_id and theme_class_id to create_popup_lov_template
--     skutz    06/10/2004 - Added create_theme api
--     msewtz   06/11/2004 - added new report attributes to create_page_plugs and create_report_column
--     skutz    06/11/2004 - added wrapper api delete_theme to call wwv_flow_theme_manager.delete_theme for security in import
--     skutz    06/18/2004 - added p_database_action to create_page_button
--     klrice   06/21/2004 - added start_of_week and print_url
--     klrice   06/24/2004 - added display_item to calendar
--     mhichwa  07/08/2004 - added page group attributes
--     mhichwa  07/09/2004 - added support for p_column_link_attr
--     mhichwa  07/21/2004 - Added g_new_theme_id global
--     mhichwa  07/29/2004 - added p_navbar_entry
--     mhichwa  08/02/2004 - Added list_template_id to create region
--     mhichwa  08/02/2004 - Added logo_image logo_immage_attributes
--     msewtz   08/12/2004 - changed report sort indicators from blue to gray
--     mhichwa  08/31/2004 - added importing last updated by and on to fix home page sort issues bug 3865939
--     sspadafo 01/14/2005 - added sub list fields to wwv_flow_list_items, wwv_flow_list_item_templates
--     sspadafo 02/05/2005 - Added p_print_url_label to create_page_plug and create_report_region
--     sspadafo 02/08/2005 - Added page_protection_enabled_y_n to create_flow for URL tampering feature
--     sspadafo 02/19/2005 - Add p_template_translatable parameter to create_page_plug, create_calendar, create_report_region
--     sspadafo 02/19/2005 - Add p_day_link, p_item_link parameters to create_calendar
--     jkallman 02/22/2005 - Change p_template_translatable to p_translate_title in create_page_plug, create_calendar, create_report_region
--     sspadafo 02/25/2005 - Added p_protection_level to create_page, create_flow_item, and create_page_item
--     sspadafo 02/25/2005 - Added p_escape_on_http_input to create_page_item
--     sspadafo 02/25/2005 - Added p_column_link_checksum_type to create_report_columns
--     sspadafo 02/25/2005 - Added p_checksum_salt, p_checksum_salt_last_reset to create_flow
--     sspadafo 03/01/2005 - Changed create_flow p_checksum_salt_last_reset to varchar2
--     sspadafo 03/11/2005 - Changed g_compatable_from_version 2004.07.04 to 2005.05.01
--     sspadafo 05/12/2005 - Added plug_query_max_columns to create_page_plug and create_report_region
--     jkallman 05/12/2005 - Added csv_encoding to create_flow
--     cbcho    05/18/2005 - Added import_script
--     cbcho    05/18/2005 - Added g_varchar2_table,g_list_contents_only,g_import_script_files,g_import_script_status for import_script use
--     cbcho    05/26/2005 - Added empty_varchar2_table for script and image import (Bug 4391689)
--     sspadafo 06/07/2005 - Add g_fnd_user_password_action package variable
--     msewtz   06/29/2005 - Added default = 500 for wwv_flow_page_plug.query_row_count_max (bug 4444553)
--     madelfio 01/23/2006 - Added procedures for Install Wizard (create_install, create_install_script, create_install_check, create_install_build_option)
--     madelfio 01/26/2006 - Changed wwv_flow_install, wwv_flow_install_checks api, added stub for append_to_install_script
--     madelfio 02/03/2006 - Added create_or_replace_image
--     madelfio 02/06/2006 - Modified create_or_replace_image, renamed to create_or_remove_file
--     madelfio 02/09/2006 - Added required_free_kb, required_sys_privs, and required_names_available to wwv_flow_install
--     mhichwa  02/10/2006 - Added g_mode to facilitate patching
--     mhichwa  02/10/2006 - Removed comments no longer needed
--     madelfio 02/20/2006 - Added p_deinstall to append_to_install_script to support long deinstall scripts
--     madelfio 02/24/2006 - Changed g_compatable_from_version 2005.05.01 to 2006.02.24
--     madelfio 04/05/2005 - Added p_location to create_or_remove_file (Bug 5113546)
--     mhichwa  04/14/2006 - Added create app comment procedure
--     mhichwa  05/01/2006 - Added p_plug_column_width argument to create_calendar and create_report_region procedures (bug 5071333)
--     mhichwa  05/01/2006 - Added procedure set_region_column_width (bug 5071333)
--     mhichwa  05/23/2006 - Added procedures set_enable_app_debugging and set_home_link
--     mhichwa  06/05/2006 - Added CALENDAR_ICON CALENDAR_ICON_ATTR support for table wwv_flow_themes (bug 5279199)
--     mhichwa  06/05/2006 - Added set_theme_calendar_icon (bug 5279199)
--     mhichwa  06/12/2006 - Added page caching parameters
--     mhichwa  06/12/2006 - Added p_id attribute to set_theme_calendar_icon to preserve pk ID
--     mhichwa  06/12/2006 - Added p_created_by and p_created_on_yyyymmddhh24miss arguments to create_page procedure
--     msewtz   06/20/2006 - removed create_application_tab and create_application_tab_set (bug 5231754)
--     mhichwa  06/23/2006 - Added p_use_custom_item_layout and p_custom_item_layout to create_page_plugs
--     madelfio 06/23/2006 - Removed parameter p_theme_id in set_theme_calendar_icon (bug 5355141)
--     cbcho    11/02/2006 - Added create_flash_chart, create_flash_chart_series
--     mhichwa  11/08/2006 - Added p_region_name to create region in support of #REGION_STATIC_ID# substitution
--     cbcho    12/04/2006 - Added p_popup_icon2, p_popup_icon_attr2 to create_popup_lov_template
--     cbcho    12/05/2006 - Changed create_flash_chart, create_flash_chart_series to add new parameters
--     sspadafo 12/06/2006 - Removed obsolete procedure set_credentials
--     msewtz   12/13/2006 - Added create_report_layout
--     jstraub  12/13/2006 - Added p_wallet_path and p_wallet_pwd to create_flow
--     cbcho    12/20/2006 - Changed create_flash_chart to accept more parameters
--     mhichwa  12/29/2006 - Added procedure update_page_item
--     mhichwa  01/02/2007 - Added p_pre_element_text
--     cbcho    01/03/2007 - Changed create_flash_chart to accept more parameters
--     jstraub  01/03/2007 - Removed wallet parameters, moved to platform preference
--     cbcho    01/04/2007 - Added gradient_rotation,names_rotation,values_rotation to create_flash_chart
--     jstraub  01/05/2007 - Added new calendar template columns to create_calendar_template
--     madelfio 02/24/2006 - Changed g_compatable_from_version 2006.02.24 to 2007.01.08
--     cbcho    01/09/2007 - Added attribute01 - 05 in create_flash_chart
--     cbcho    01/10/2007 - Added prefix,postfix,decimal_sep,group_sep,decimal_place for x and y axis in create_flash_chart
--     jstraub  01/16/2007 - Added parameters to create_calendar for new wwv_flow_cals columns
--     cbcho    01/16/2007 - Added series_query_parse_opt in create_flash_chart_series
--     cbcho    01/16/2007 - Removed series_color,series_chart_type,display_attr from create_flash_chart_series
--     cbcho    01/18/2007 - Added flow_id to create_flash_chart_series
--     jstraub  01/22/2007 - Added p_date_type_column to create_calendar
--     jstraub  01/22/2007 - Added parameters to create_page_plug and create_region_rpt_cols to support new columns
--     jstraub  01/22/2007 - Moved pdf printing parameters from create_page_plug to create_report_region
--     jstraub  01/22/2007 - Added pdf printing parameters to create_page_plug (needed for wwv_flow_copy_page)
--     cbcho    01/23/2007 - Removed p_x_axis_decimal_sep,p_y_axis_decimal_sep from create_flash_chart
--     madelfio 01/25/2007 - Added upgrade messages and p_get_version_sql_script to create_install
--     madelfio 01/25/2007 - Added p_script_type to create_install_scripts
--     jstraub  01/26/2007 - Added p_reference_id, p_report_layout_comment to create_report_layout and added create_shared_query
--     jstraub  01/26/2007 - Added p_varchar2_table to create_report_layout to support export/import
--     jstraub  01/27/2007 - Changed p_report_template in create_report_layout back to varchar2
--     cbcho    02/02/2007 - Changed create_flash_chart to accept additional columns
--     mhichwa  02/05/2007 - Added prn allignment columns and sort null to create page plug
--     mhichwa  02/05/2007 - Added support for prn_border_color in support of msewtz functionality
--     jstraub  02/05/2007 - Added p_daily_month_title_format to create_calendar_template
--     cbackstr 02/14/2007 - added support to update item type for populated items on drag and drop page in update_page_item  (bug 5881771)
--     sspadafo 05/01/2007 - Added parameters to create_report_region, create_page_plug, create_calendar for region caching (Bug 6025383)
--     sspadafo 05/01/2007 - Added g_compatible_from_version_30 to hold version 3.0 date(Bug 6025383)
--     sspadafo 05/01/2007 - Added g_compatible_from_version_301 to hold version 3.0.1 date(Bug 6025383)
--     sspadafo 05/01/2007 - Changed g_compatable_from_version to '2007.05.25' for 3.0.1 patch to reflect API changes for region caching (Bug 6025383)
--     jstraub  08/29/2007 - Added p_restrict_to_user_list to create_flow (Bug 6360643)
--     jstraub  09/04/2007 - Added g_compatible_from_version_31 to hold version 3.1 date
--     madelfio 10/04/2007 - Added create_worksheet, create_worksheet_column and create_worksheet_col_group
--     jkallman 10/15/2007 - Added p_media_type to create_flow, p_media_type to create_page
--     cbcho    10/29/2007 - Removed show_detail_link,detail_link,display_detail_location from create_worksheet
--     cbcho    10/29/2007 - Added display_condition_type,display_condition,display_condition2,security_scheme to create_worksheet_column
--     madelfio 10/30/2007 - Removed unneccessary columns from worksheet tables
--     sathikum 10/31/2007 - added parameter to create_calendar for AJAX calendar support
--     cbcho    10/31/2007 - Added download_formats to create_worksheet
--     madelfio 11/01/2007 - Updated worksheet APIs
--     mhichwa  11/02/2007 - Add support for application groups
--     madelfio 11/02/2007 - Added no_data_found_message, sql_hint to worksheet api
--     cbcho    11/05/2007 - Removed distinct_value_filter, Added rpt_distinct_lov,rpt_lov,rpt_named_lov
--     mhichwa  11/06/2007 - Added p_application_group_name and p_application_group_comment
--     jkallman 11/19/2007 - Added p_date_format to create_flow
--     mhichwa  11/26/2007 - Added p_include_apex_css_js_yn
--     jstraub  11/28/2007 - Added p_heading_alignment, p_column_alignment, p_display_text_as, p_rpt_show_filter_lov, p_rpt_filter_date_ranges,
--                           p_is_sortable to create_worksheet_columns
--     mhichwa  11/28/2007 - Added p_runtime_where_clause,  p_theme_description
--     mhichwa  11/30/2007 - Added ajax enabled to create_page_plug and create_report_region
--     mhichwa  12/04/2007 - Added create_theme_image
--     jstraub  12/06/2007 - Added create_shared_query_stmnt
--     jstraub  12/10/2007 - Added p_prn_print_server_overwrite to create_page_plug and create_report_region
--     mhichwa  12/11/2007 - Added p_REGION_ATTRIBUTES aka REGION_ATTRIBUTES_SUBSTITUTION for create_report_region, create_page_plug, create_calendar
--     jstraub  12/12/2007 - Added p_prn_content_disposition, p_prn_document_header, p_prn_width_units to create_page_plug and create_report_region
--     jstraub  12/12/2007 - Added p_content_disposition and p_document_header to create_shared_query
--     cbcho    12/12/2007 - Added p_show_detail_link to created_worksheet
--     madelfio 12/12/2007 - Added several columns to create_worksheet_column
--     madelfio 12/12/2007 - Added several columns to create_worksheet
--     madelfio 12/14/2007 - Added p_show_control_break to create_worksheet
--     mhichwa  12/17/2007 - Added p_REPORT_ATTRIBUTES
--     madelfio 12/17/2007 - Added new columns to create_worksheet
--     madelfio 12/18/2007 - Added to wwv_flow_worksheets: show_nulls_as, download_format
--     madelfio 12/18/2007 - Added to wwv_flow_worksheet_columns: column_comment
--     madelfio 12/20/2007 - Added create procedures for worksheet_rpts, worksheet_conditions, worksheet_computation
--     madelfio 01/08/2008 - Added to wwv_flow_worksheet_rpts: count_columns_on_break
--     madelfio 01/08/2008 - Added to wwv_flow_worksheet_rpts: chart_sorting
--     jkallman 01/25/2008 - Reduced size of g_nls_numeric_chars (Bug 6710093)
--     madelfio 02/12/2008 - Added to wwv_flow_worksheet_computation: column_type
--     cbcho    04/02/2008 - Added create_app_from_query
--     cbcho    04/09/2008 - Added p_theme_type to create_app_from_query
--     cbcho    08/04/2008 - Added p_websheet_id to create_worksheet_column,create_worksheet_col_group,create_worksheet_computation,create_worksheet_condition,create_worksheet_rpt
--     mhichwa  08/22/2008 - Added support for icon_view and detail_view attributes in interactive reports aka worksheets
--     mhichwa  09/08/2008 - Added create_page_dynamic_action procedure
--     cbcho    09/19/2008 - Added p_view_mode to create_worksheet_rpt
--     mhichwa  10/10/2008 - Added support for quick picks
--     cbcho    10/23/2008 - Added create_worksheet_group_by
--     cbcho    11/17/2008 - Added p_show_help to create_worksheet(bug 7370368)
--     sspadafo 12/09/2008 - Added session timeout parameters to create_flow
--     mhichwa  12/18/2008 - Added publish_yn flag
--     sspadafo 12/22/2008 - Changed name of session timeout vars to reflect units in seconds in create_flow
--     jstraub  12/23/2008 - Added p_autocomplete_on_off to create_page
--     mhichwa  12/23/2008 - Added p_encrypt_session_state_yn
--     sspadafo 01/03/2009 - Added support for declarative secure cookie property in create_auth_setup
--     sspadafo 01/09/2009 - Changed value of default session timeout parameter to reflect units in seconds in create_flow
--     sspadafo 01/11/2009 - Added p_save_state_before_branch_yn to create_page_branch
--     sspadafo 01/11/2009 - Changed default value for p_save_state_before_branch_yn in create_page_branch to 'Y'
--     sspadafo 01/12/2009 - Changed g_compatable_from_version to '2009.01.13' as temporary value for 4.0
--     pawolf   04/22/2009 - Added attribute_xx for create_page_item, add custom item type
--     hfarrell 04/29/2009 - Added create_flash_chart5 and create_flash_chart5_series for AnyChart 5 integration
--     pawolf   04/29/2009 - Renamed custom item type tables to wwv_flow_plugins
--     pawolf   05/04/2009 - Added p_attribute_xx to update_page_item
--     pawolf   05/06/2009 - Added create_plugin_file
--     hfarrell 05/08/2009 - Updated create_flash_chart5 to remove unrequired columns for prefix,postfix, and attributes
--     sathikum 05/11/2009 - Added additional parameter P_END_DATE_ITEM for creating custom calendar
--     pawolf   05/14/2009 - Added subscription to plugins
--     pawolf   05/15/2009 - Added dynamic attributes to regions
--     hfarrell 05/19/2009 - Added p_chart_name to create_flash_chart5
--     pawolf   06/03/2009 - Renamed wwv_flow_plugin_attributes.attribute_level to attribute_scope
--     arayner  06/05/2009 - Added create_page_da_event and create_page_da_action procedures
--     arayner  06/05/2009 - Added p_flow_id parameter to create_page_da_action
--     pawolf   06/09/2009 - Added action_sequence for wwv_flow_page_da_actions
--     arayner  06/10/2009 - Added execute_on_page_init for wwv_flow_page_da_actions
--     hfarrell 06/15/2009 - Updated create_flash_chart5 to include new attributes for prefix, postfix, label & title fonts
--     hfarrell 06/23/2009 - Updated create_flash_chart5 to include gauge_labels_font attribute
--     jstraub  07/14/2009 - Added p_path to create_ws_parameters
--     pawolf   07/15/2009 - Added p_help_text to create_plugin
--     cbcho    07/20/2009 - Added p_allow_highlighting to create_worksheet_column
--     cbcho    07/20/2009 - Added p_show_notify to create_worksheet
--     pawolf   07/24/2009 - Added new columns to wwv_flow_plugins and wwv_flow_plugin_attributes
--     pawolf   07/27/2009 - Added new table wwv_flow_plugin_events
--     cbcho    07/27/2009 - Added create_worksheet_notify
--     cbcho    07/27/2009 - Removed p_session_id from create_worksheet_notify
--     jkallman 07/28/2009 - Added p_timestamp_format and p_timestamp_tz_format to create_flow
--     cbcho    07/30/2009 - Changed create_worksheet to default p_icon_view_enabled_yn,p_detail_view_enabled_yn to N
--     mhichwa  07/31/2009 - Added set_page_process_source
--     hfarrell 08/02/2009 - Added p_gantt_attr to create_flash_chart5 procedure
--     mhichwa  08/03/2009 - added include_in_reg_disp_sel_yn
--     arayner  08/14/2009 - Added new wait-icon columns to create_page_button and create_page_item
--     pawolf   08/18/2009 - Added columns for hierarchical regions
--     jkallman 08/28/2009 - Added auto_time_zone to create_flow
--     mhichwa  08/31/2009 - added ALLOW_FEEDBACK_YN to create_flow and region_image, region_image_attr to create_page_plug
--     hfarrell 08/31/2009 - Added p_series_type to create_flash_chart5_series and p_map_attr, p_map_source to create_flash_chart5
--     mhichwa  09/01/2009 - added sub_image_open, sub_image_close, then removed same
--     msewtz   09/15/2009 - Added associated_column to create_page_validation
--     msewtz   09/16/2009 - Added tabular_form_region_id to create_page_validation
--     arayner  09/18/2009 - Added create_page_da procedure
--     arayner  09/18/2009 - Moved create_page_da procedure to wwv_flow_wizard_api package
--     pawolf   09/24/2009 - Added create_plugin_attr_value procedure
--     pawolf   09/28/2009 - Added plug-in support for classic reports
--     pawolf   10/16/2009 - Added conditions to plugin attributes
--     sathikum 10/21/2009 - Added additional arguments to create_calendar_template for Custom Calendar support
--     pawolf   10/23/2009 - Added is_required to wwv_flow_step_items and wwv_flow_region_report_column
--     pawolf   10/27/2009 - Added default_error_display_location to wwv_flows
--     pawolf   10/28/2009 - Removed error_display_location from wwv_flow_plugins
--     jkallman 11/03/2009 - Add p_expr3 to create_worksheet_condition
--     jkallman 11/05/2009 - Added p_tz_dependent to create_worksheet_column
--     jkallman 11/17/2009 - Rename p_expr3 to p_time_zone in create_worksheet_condition
--     cbcho    11/18/2009 - Added p_report_alias,p_count_distnt_col_on_break to create_worksheet_rpt
--     mhichwa  11/20/2009 - added argument to procedure create_list_template
--     arayner  11/20/2009 - Added default_irr_template to create_flow and create_theme procedures
--     cbcho    11/20/2009 - Added allow_save_rpt_public, save_rpt_public_auth_scheme to create_worksheet
--     cbcho    11/25/2009 - Added allow_group_by, allow_hide to create_worksheet_column
--     hfarrell 12/07/2009 - Updated create_flash_chart5 and create_flash_chart5_region to include map undefined region and grid region color information
--     pawolf   12/14/2009 - Added new columns for javascript to wwv_flow_steps
--     arayner  12/17/2009 - Added default value to p_affected_elements_type parameter of create_da_page_action
--     cbcho    12/21/2009 - Removed p_user_id from create_worksheet_notify
--     pawolf   12/29/2009 - Added "standard_validations" to wwv_flow_step_items and wwv_flow_region_report_column
--     mhichwa  01/04/2010 - added p_report_column_width
--     pawolf   01/08/2010 - Added new columns to wwv_flow_plugins
--     jstraub  01/12/2010 - Added p_rest_enabled to create_report_region, create_calendar, create_page_plug
--     jstraub  01/12/2010 - Added p_soap_version to create_web_service
--     cbcho    01/14/2010 - Added p_email_subject to create_worksheet_notify
--     hfarrell 01/20/2010 - Added create_jstree for jsTree region
--     pawolf   01/20/2010 - Added escape_on_http_output to wwv_flow_step_items
--     sspadafo 01/20/2010 - Added create_ws_auth_setup
--     sspadafo 01/20/2010 - Added function create_ws_auth_setup
--     hfarrell 01/21/2010 - Updated create_jstree and create_jstree_region to include tree_template
--     cbcho    01/22/2010 - Added p_owner to create_worksheet_notify, p_show_rows_per_page to create_worksheet
--     hfarrell 01/22/2010 - Added hints to create_jstree
--     pawolf   01/27/2010 - Added Display Sequence to plug-in attributes
--     jkallman 01/29/2010 - Update g_compatable_from_version to 2010.01.29, remove unnecessary compatibility globals
--     pawolf   02/02/2010 - Added cascading lov columns to wwv_flow_step_items
--     pawolf   02/05/2010 - Renamed wwv_flow_plugins callout procedure columns
--     pawolf   02/11/2010 - Added columns button_execute_validations and always_execute
--     pawolf   02/19/2010 - Removed wwv_flow_plugin_attributes.is_stored_in_clob
--     pawolf   02/20/2010 - Added support for process plugins
--     pawolf   02/23/2010 - Added export/import for feedback
--     hfarrell 02/26/2010 - Updated create_jstree:removed unrequired column, added new columns for modifications to Tree Attributes page
--     hfarrell 02/26/2010 - Updated create_jstree: added show_hints, tree_has_focus, tree_hint_text and tree_click_action
--     jkallman 03/01/2010 - Change default display type of report columns to be ESCAPE_SC (Bug 5362969)
--     jstraub  03/02/2010 - Added p_form_qualified to create_ws_parameters
--     hfarrell 03/05/2010 - Fix for bug 5905923: updated create_flash_chart5 to add X & Y axis major_interval and minor_intervals
--     hfarrell 03/05/2010 - Updated create_flash_chart5_series to include missing parameters for action link
--     pawolf   03/05/2010 - Added migration for file item type
--     jkallman 03/18/2010 - Added support for plug_query_parse_override in create_page_plugs
--     arayner  03/18/2010 - Added null default to p_triggering_element_type parameter in create_page_da_event
--     arayner  03/22/2010 - Added null default to p_triggering_condition_type parameter in create_page_da_event
--     jkallman 03/22/2010 - Added p_plug_query_parse_override to create_report_region
--     sathikum 03/30/2010 - Added p_include_custom_cal to create_calendar
--     jstraub  03/30/2010 - Added p_ldap_use_ssl, p_ldap_use_exact_dn, p_ldap_search_filter to create_ws_auth_setup procedure and function
--     cbcho    04/06/2010 - Added procedures to create Websheet component
--     cbcho    04/08/2010 - Added p_show_group_by to create_worksheet, create_ws_worksheet
--     cbcho    04/08/2010 - Added create_ws_app_sug_objects
--     cbcho    04/13/2010 - Exposed check_sgid_for_ws_app_id
--     pawolf   04/14/2010 - Added stop_execution_on_error to wwv_flow_page_da_actions
--     cbcho    04/15/2010 - Changed create_worksheet_notify,create_ws_notify to populate status,notify_error
--     pawolf   04/17/2010 - Renamed lov_items_to_submit and lov_optimize_refresh to ajax_item_to_submit and ajax_optimize_refresh
--     pawolf   04/18/2010 - Added category to wwv_flow_plugins
--     pawolf   04/22/2010 - Added flow_id and page_id to wwv_flow_page_da_actions
--     jkallman 04/22/2010 - Change p_language_derived_from to p_territory in create_ws_app
--     arayner  04/23/2010 - Removed button show_wait related references from create_page_button and create_page_item
--     cbcho    04/30/2010 - Added  p_data_grid_form_seq to create_ws_column
--     hfarrell 05/10/2010 - Updated create_jstree to include p_selected_node for Selected Node Page Item attribute
--     pawolf   05/11/2010 - Removed EA2 to EA3 compatibility
--     jkallman 05/14/2010 - Update g_compatable to 2010.05.13
--     jkallman 08/27/2010 - Bug 6360643: Added p_restrict_to_user_list to set_flow_status
--     pawolf   12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--     sathikum 01/03/2011 - Added p_enable_drag_drop and p_enable_ajax_data_add to create_calendar (feature #520)
--     sathikum 01/14/2011 - added data_background_color and data_text_color(feature #520)
--     pawolf   01/14/2011 - Added tabular form support for processes and validations (feature# 542)
--     sathikum 01/21/2011 - Added column enable_ajax_data_edit (feature #520)
--     hfarrell 02/01/2011 - Added list_type and list_query to create_list (feature #602)
--     sathikum 02/15/2011 - Added p_enable_ajax_data_delete to create_calendar
--     hfarrell 02/15/2011 - Set default value STATIC for list_type in create_list
--     hfarrell 02/21/2011 - Added p_list_item_icon_alt_attribute to create_list_item
--     pawolf   02/22/2011 - Made "Save state before branch" obsolete (bug# 11795919)
--     arayner  02/23/2011 - Added p_triggering_button_id to create_page_da_event procedure (feature #385)
--     hfarrell 02/24/2011 - Added p_pie_attr to create_flash_chart5
--     pawolf   02/28/2011 - Added new error handling columns (feature# 544)
--     hfarrell 03/02/2011 - Updated create_flash_chart5 to set new p_pie_attr default
--     arayner  03/02/2011 - Added p_button_static_id to create_page_button (feature #385)
--     jstraub  03/02/2011 - Updated g_compatable_from_version to
--     pawolf   03/08/2011 - Added new error display location column to wwv_flow_step_processing and wwv_flow_processing (feature# 544)
--     msewtz   03/10/2011 - Added mobile_page_template to create_template (feature 586)
--     arayner  03/14/2011 - Added p_button_action to create_page_button (feature #385)
--     arayner  03/17/2011 - Converted tabs to spaces in recent create_page_button additions (feature #385)
--     pawolf   03/28/2011 - Removed PLUG_DISPLAY_ERROR_MESSAGE (feature# 544)
--     arayner  03/30/2011 - Added p_button_action and p_button_redirect_url to create_page_item (feature 385)
--     msewtz   03/31/2011 - Added p_render_form_as_table to create_page (feature 586)
--     msewtz   03/31/2011 - Added before_item and after_item to create_field_template (feature 586)
--     msewtz   03/31/2011 - Added use_as_row_header and column_field_template to create_report_columns (feature 586)
--     pawolf   04/06/2011 - Added ajax_items_to_submit and escape_on_http_output to wwv_flow_page_plugs (feature 505 and 649)
--     pawolf   04/06/2011 - Removed wwv_flow_worksheets.page_items_to_submit, it has been replaced by wwv_flow_page_plugs.ajax_items_to_submit (feature 505)
--     pawolf   04/08/2011 - Added "Substitute Attribute Values" (substitute_attributes) to plug-ins (feature 655)
--     msewtz   04/08/2011 - Removed p_render_form_as_table from create_page (feature 586)
--     msewtz   04/08/2011 - Added render_form_items_in_table to create_plug_template  (feature 586)
--     sathikum 04/11/2011 - Added primary_key_column, drag_drop_required_role, drag_drop_process_id and removed some parameteres from create_calendar (feature #520)
--     sathikum 04/14/2011 - Added item_link_primary_key_item, item_link_date_item (feature #520)
--     sathikum 04/18/2011 - Added item_link_open_in to create_calendar (feature #520)
--     pmanirah 04/20/2011 - Added create_load_table procedure (feature #545)
--     pmanirah 04/20/2011 - Added create_table_lookup procedure (feature #545)
--     pmanirah 04/20/2011 - Added create_table_rule procedure (feature #545)
--     hfarrell 05/05/2011 - Updated create_flash_chart5 to include two obsolete parameters p_x_axis_grid_spacing and p_y_axis_grid_spacing removed earlier in release, required for earlier app exports to work
--     msewtz   05/09/2011 - Added default mobile template columns to wwv_flow_themes
--     pawolf   05/10/2011 - Added "is hot button" (feature 702)
--     pawolf   05/11/2011 - Removed the default 28800 for p_max_session_length_sec (bug 12542441)
--     pawolf   05/13/2011 - Added plug-ins for authentication schemes (feature 581)
--     cbcho    05/13/2011 - Added p_show_reset_passwd_yn to create_ws_app (feature 620)
--     cneumuel 05/19/2011 - Added create_authentication: new API for plugin-based authentications (feature 581)
--     pawolf   05/19/2011 - Updated create_authentication (feature 581)
--     jkallman 05/25/2011 - Update create_translation to include column_id
--     cneumuel 05/26/2011 - Added plsql_code to create_authentication (feature 581)
--     cneumuel 05/26/2011 - Added p_invalid_session_function to create_plugin (feature 581)
--     cneumuel 05/30/2011 - Added migration of custom_auth_setups to plugin-based authentications (feature #581)
--     jkallman 06/01/2011 - Added p_date_time_format to create_flow (Feature 715)
--     jkallman 06/01/2011 - Add alternative_key1 and 2 to create_load_table_lookup
--     sathikum 06/02/2011 - added include_time_with_date to Calendar procedure (feature #520)
--     pmanirah 06/02/2011 - Added name, owner to the create_load_table and where_clause, lookup_owner to the create_load_table_lookup
--     cneumuel 06/17/2011 - Added p_browser_cache to create_flow and create_page (feature #726)
--     cneumuel 06/17/2011 - Added p_vpd_teardown_code to create_flow (feature #616)
--     cneumuel 06/20/2011 - Added correct defaults to p_browser_cache of create_flow and create_page (feature #726)
--     jkallman 07/05/2011 - Added p_translate_list_text_y_n to create_list_item
--     cneumuel 07/07/2011 - Added p_browser_frame to create_flow (feature #731)
--     pawolf   08/05/2011 - Added new column compatibility_mode to wwv_flows (bug# 12835127)
--     hfarrell 10/20/2011 - Added remove_restful_service, create_restful_module, create_restful_template, create_restful_handler, create_restful_priv, create_rs_priv_grp
--     hfarrell 10/26/2011 - Updated create_user_groups to set default value of p_group_name to null
--     pawolf   12/23/2011 - Added restricted_characters to wwv_flow_step_items (bug 13344998)
--     sathikum 01/13/2012 - Added procedure set_build_option_status (Bug# #13050595 )
--     pawolf   02/29/2012 - Added placeholder to wwv_flow_step_items (feature# 837)
--     pawolf   03/02/2012 - Added data model changes for several 4.2 features (feature# 778, 826, 819, 817, 816, 815, 823, 767, 825, 828, 829, 844)
--     hfarrell 05/02/2012 - Added data model changes for chart-related 4.2 feature #543 and 494: updated create_flash_chart5 and create_flash_chart5_series
--     pawolf   03/06/2012 - Renamed new css_classes to region_css_classes and tag_css_classes to be consistent with existing columns (feature# 815)
--     pawolf   03/07/2012 - Added new table wwv_flow_theme_styles (feature# 821)
--     pawolf   03/08/2012 - Added data model changes for UI type feature (feature# 827)
--     arayner  03/14/2012 - Added p_bind_delegate_to_selector to create_page_da_event (feature# 836)
--     pawolf   03/14/2012 - Removed display_row_template_id from wwv_flow_lists (feature# 873)
--     sathikum 03/15/2012 - Added parameters to create_calendar_template (feature #812)
--     pawolf   03/19/2012 - Changed code to only use new columns in wwv_flow_user_interfaces instead of the old columns in wwv_flow (feature# 827)
--     pawolf   03/21/2012 - Removed g_new_theme_id
--     pawolf   03/28/2012 - Added 10 more custom plug-in attributes to regions (feature# 890)
--     cbcho    03/28/2012 - Added p_email_from to create_worksheet (feature# 695)
--     hfarrell 03/29/2012 - Added p_required_patch to create_flash_chart5_series (feature #494)
--     cbcho    03/29/2012 - Added p_email_from to create_flow (feature# 695)
--     sathikum 03/30/2012 - Added additional columns to support Agenda Calendar feature (#812)
--     pawolf   03/30/2012 - Added new table wwv_flow_plugin_settings (feature# 895)
--     jkallman 04/02/2012 - Removed create_configuration_item, create_configuration
--     vuvarov  04/03/2012 - Added p_branch_name to create_page_branch() (feature #872)
--     pawolf   04/05/2012 - Added NONE as default transition for p_default_page_transition and p_default_popup_transition
--     pawolf   04/06/2012 - Added read only attributes to wwv_flow_steps and wwv_flow_page_plugs (feature# 570)
--     cneumuel 04/10/2012 - In create_flow: added p_authorize_public_pages_yn (bug #13940433)
--     cbcho    04/13/2012 - Added p_language, p_email_from to create_worksheet_notify (feature ##881)
--     sathikum 04/16/2012 - Added p_month_data_format,p_month_data_entry_format to create_calendar_template (feature #811)
--     sathikum 04/17/2012 - Added p_month_data_display_type to create_Calendar (feature #811)
--     cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
--     arayner  04/20/2012 - Added wait_for_result to wwv_flow_page_da_actions (feature #599)
--     arayner  04/23/2012 - Changed wait_for_result parameter of create_page_da_action to default to null, not Y (feature #599)
--     pawolf   04/25/2012 - Added column_data_types to wwv_flow_plugin_attributes (feature #918)
--     cbcho    04/25/2012 - Added icon_view_use_custom, icon_view_custom_link to wwv_flow_worksheets (feature #915)
--     cbcho    04/25/2012 - Added language, email_from to create_ws_notify, email_from to create_ws_worksheet (feature #695)
--     cbcho    04/27/2012 - Added email_from to create_ws_app (feature #695)
--     pawolf   04/30/2012 - Added series_ajax_items_to_submit to wwv_flow_flash_chart5_series (feature #741)
--     cneumuel 04/30/2012 - Added check_for_valid_flow_range in spec (bug #14008101)
--     cneumuel 05/02/2012 - Added p_deep_linking to create_flow, create_page (feature #878)
--     pawolf   05/08/2012 - Updated to be compatible with API change (from 2011.02.12 to 2012.01.01)
--     hfarrell 05/03/2012 - Updated remove_restful_service to allow for null value for p_id (associated with bug #14025353)
--     cneumuel 05/10/2012 - In create_ws_auth_setup: added p_ldap_username_escaping (bug #14047270)
--     pawolf   05/11/2012 - Added wwv_flow_page_plugs.plug_item_display_position (feature #278)
--     pawolf   05/14/2012 - Added grid templates (feature #936)
--     arayner  05/15/2012 - Added include_legacy_javascript to wwv_flows (feature #927)
--     arayner  05/15/2012 - Changed default to Y for include_legacy_javascript column in wwv_flows (feature #927)
--     pawolf   05/21/2012 - More changes for grid templates (feature #936)
--     pawolf   05/21/2012 - Added wwv_flow_theme_display_points (feature #936)
--     pawolf   05/21/2012 - More changes for grid templates (feature #936)
--     pawolf   05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
--     pmanirah 05/24/2012 - Added column_names_lov_id column and corresponding parameter to create_load_table procedure (feature #833)
--     arayner  05/28/2012 - Added wwv_flow_page_da_actions.affected_button_id (feature #678)
--     cneumuel 05/31/2012 - In create_flow_item: added p_scope (feature #897)
--     cbcho    05/31/2012 - Added post_import_process (feature #268)
--     pmanirah 05/31/2012 - Added p_is_use_version_col_on and p_version_column_name parameters to create_load_table (feature #903)
--     cbcho    06/04/2012 - Added internal_uid to create_worksheet, create_ws_worksheet (feature #268)
--     msewtz   06/05/2012 - Added default_header_template and default_footer_template to create_theme
--     pmanirah 06/08/2012 - Removed the parameter p_is_use_version_col_on (feature #903)
--     cneumuel 06/11/2012 - In create_flow: default p_authorize_public_pages_yn to N, but set to Y in body if import version is <= 4.1 (feature #621)
--     jkallman 06/11/2012 - Added get_build_option_status (#957)
--     pawolf   06/15/2012 - Added has_edit_links to wwv_flow_templates
--     pawolf   06/15/2012 - Added table wwv_flow_plug_tmpl_disp_points (feature #936)
--     sathikum 06/19/2012 - Added p_end_date_column to create_calendar (feature #814)
--     pawolf   06/20/2012 - Added global_page_id to wwv_flow_user_interfaces (feature #987)
--     pawolf   06/26/2012 - Added remove_application
--     cneumuel 06/26/2012 - Fixed typo in wwv_flow_ui_types.autodetect_js_function_body (feature #791)
--     pawolf   06/26/2012 - Removed create_app_from_query
--     pawolf   06/26/2012 - Added table wwv_flow_page_tmpl_disp_points (feature #936)
--     pawolf   07/04/2012 - Added Builder Feature configuration tables (feature #827)
--     cneumuel 07/05/2012 - Made get_default_ldap_escaping public (bug #14047270)
--     cneumuel 07/13/2012 - In create_flow: added p_ui_detection_css_urls (feature #791)
--                         - In create_flow: added p_html_escaping_mode (bug #14047702)
--     vuvarov  07/17/2012 - Added p_nls_sort and p_nls_comp to create_flow() (feature #978)
--     jkallman 08/08/2012 - Added p_template_translatable to create_translation (Bug 13801807)
--     cbcho    08/17/2012 - Added create_worksheet_category (bug 14509942)
--     pawolf   08/23/2012 - Restored create_app_from_query (bug# 14526535)
--     cbcho    08/23/2012 - Removed p_base_cat_id reference as it is obsolete
--     jstraub  11/09/2012 - Added numerous APIs for complete workspace export
--     jstraub  11/20/2012 - Added p_security_group_id to create_clickthru_log*, create_mail_log
--     jstraub  11/20/2012 - Changed p_attachment in create_mail_attachments to take in varchar2 table
--     jstraub  11/29/2012 - Added p_security_group_id to create_password_history and create_script
--     jstraub  11/29/2012 - Added created_by, created_on to create_sw_sql_cmds
--     jstraub  11/29/2012 - Added auditing columns back to workspace export api's
--     jstraub  12/04/2012 - Added p_security_group_id to create_user_access_log*
--     jstraub  12/04/2012 - Added auditing columns to create_ws_app_sug_objects
--     jstraub  12/06/2012 - Removed p_security_group_id from create_clickthru*, create_mail_log, create_password_history,
--                           create_user_access_log*
--     cneumuel 01/11/2013 - API changes to optimize export format (feature #985)
--     cneumuel 01/15/2013 - Added additional defaults to APIs (feature #985)
--     pawolf   01/21/2013 - Added support for nullable "Maximum Row Count" (p_plug_query_row_count_max) of classic reports (bug #14615770)
--     cneumuel 01/24/2013 - In create_report_columns, create_flash_chart_series, create_flash_chart5_series: changed default for p_flow_id, because it was set to the report's/chart's in the trigger (feature #985)
--     cbcho    02/05/2013 - Exposed check_sgid_for_app_id (bug #16238360)
--     cneumuel 02/22/2013 - Increased g_compatable_from_version (feature #985)
--                           In import_begin: added p_default_workspace_id, p_default_application_id, p_default_id_offset
--                           Set API version to 2013.01.01
--     pawolf   04/09/2013 - Added files_version to wwv_flow_plugins (feature #478)
--     pawolf   04/11/2013 - Added new table wwv_flow_theme_files and new columns file_prefix and files_version to wwv_flow_themes (feature #1162)
--     pawolf   04/16/2013 - Added files_version to wwv_flow_files (feature #1165)
--     cneumuel 04/17/2013 - In import_begin: added p_default_owner (feature #985)
--     pawolf   04/16/2013 - Added file_prefix to wwv_flow_files (feature #1165)
--     pawolf   04/18/2013 - Added wwv_flow_company_static_files and wwv_flow_static_files (feature #1169)
--     pawolf   04/22/2013 - Merged wwv_flow_html_repository, wwv_flow_css_repository and wwv_flow_image_repository into wwv_flow_company_static_files and wwv_flow_static_files (feature #1169)
--     pawolf   04/26/2013 - In create_or_remove_file: removed default of p_flow_id -> regression
--     hfarrell 05/22/2013 - Added p_page_mode, p_dialog_title, p_dialog_width, p_dialog_maxwidth, p_dialog_attributes to create_page procedure  (feature #587)
--     hfarrell 05/23/2013 - Added p_javascript_dialog_code to create_template (feature #587)
--     hfarrell 06/07/2013 - Added p_dialog_width and p_dialog_maxwidth to create_template (feature #587)
--     hfarrell 06/07/2013 - Renamed dialog_maxwidth to dialog_max_width in create_page and create_template, javascript_dialog_code to dialog_js_init_code in create_template
--     cneumuel 07/01/2013 - Added support for RAS sessions, dynamic roles and namespaces (feature #1152)
--     hfarrell 07/04/2013 - Added dialog_height to create_page and create_template (feature #587)
--     sathikum 07/10/2013 - Added p_escape_on_http_output to create_calendar (feature #1232)
--     hfarrell 07/31/2013 - Added extra_y_axis_min, extra_y_axis, max to create_flash_chart5 (feature #742)
--     msewtz   08/02/2013 - Added javascript_file_urls, javascript_code_onload, css_file_urls, inline_css to create_list_template (feature 1236)
--     msewtz   08/02/2013 - Added navigation_list_id to create_user_interface and create_flow (feature 1236)
--     msewtz   08/02/2013 - Added default_nav_list_template to create_theme (feature 1236)
--     msewtz   08/02/2013 - Added overwrite_navigation_list, navigation_list_id, navigation_list_template_id to create_page (feature 1236)
--     msewtz   08/02/2013 - Added navigation_type to create_theme to identify whether tabs or navigation lists are used by theme (feature 1236)
--     cbcho    08/16/2013 - Added stmt_vc2 to create_sw_stmts (feature #1257)
--     pawolf   08/20/2013 - Changed constraint of wwv_flow_step_items.begin_on_new_line and begin_on_new_field to Y and N
--     pawolf   08/20/2013 - Added is_common and supported_ui_types to wwv_flow_plugin_attributes (features# 1270 and 1271)
--     msewtz   08/20/2013 - Removed navigation_list_id from create_flow (feature 1236)
--     cneumuel 09/11/2013 - Added set_compatibility_mode as implementation of apex_util.set_compatibility_mode
--     hfarrell 09/17/2013 - Added p_dialog_css_classes, p_dialog_js_close_code to create_page, create_template (feature #1201 and #1204)
--     pawolf   09/18/2013 - Set a default value of 'N' for always_execute in wwv_flow_step_validations
--     cneumuel 09/30/2013 - In create_plugin_attribute: added lov*, set_text_case, null_text and legacy_values to wwv_flow_plugin_attributes (feature #1284)
--     hfarrell 09/30/2013 - In create_theme: added default_dialog_template (feature #587)
--     pawolf   10/08/2013 - Added parent_attribute_id to wwv_flow_plugin_attributes and renamed set_text_case to text_case
--     cneumuel 10/14/2013 - Default wwv_flow_worksheet_columns.display_as to TEXT
--                         - Default wwv_flow_step_items.{item_default_type,escape_on_http_output,show_quick_picks}
--     pawolf   10/16/2013 - Added is_legacy to wwv_flow_plugins and wwv_flow_plugin_attr_values
--                         - Added builder_js_function to wwv_flow_plugins
--     cbcho    10/16/2013 - Added p_show_pivot to create_worksheet, create_ws_worksheet (feature #536)
--                         - Added p_allow_pivot to create_worksheet_column, create_ws_column (feature #536)
--     cneumuel 10/23/2013 - In create_flow: added p_bookmark_checksum_function (feature #1290)
--     cbcho    10/23/2013 - Added create_worksheet_pivot* procedures (feature #536)
--     hfarrell 10/24/2013 - Added p_dialog_js_cancel_code to create_template (feature #1201 and #1204)
--     cbcho    11/06/2013 - Added create_ws_pivot, create_ws_pivot_agg, create_ws_pivot_sort to exp/imp from Websheet (feature #536)
--     cneumuel 11/15/2013 - In create_page_plug: added p_list_id, p_menu_id (feature #1312)
--     cneumuel 11/25/2013 - In create_page_button: page button migration (feature #1314)
--     cneumuel 12/02/2013 - Added get_calling_version
--     pawolf   12/04/2013 - Added missing not null constraints
--     pmanirah 12/05/2013 - Added a new parameter p_skip_validation to wwv_flow_load_tables (feature #1327)
--     cbcho    01/10/2014 - Added p_auto_install_sup_obj to post_import_process and import_end (feaure #1248)
--     cneumuel 01/13/2014 - In create_load_table: default p_skip_validation to 'N'
--     pawolf   01/14/2014 - Added table wwv_flow_combined_files (feature #1340)
--     pawolf   01/15/2014 - Added page_id to wwv_flow_combined_files (feature #1340)
--     cneumuel 01/22/2014 - In create_flow: added p_http_response_headers (feature #1065)
--     hfarrell 01/28/2014 - In create_page_item: added p_named_length - required by API call in wwv_flow_wizard_api.create_summary_page
--     cbcho    01/28/2014 - Added p_workspace_id to remove_application (feature #1344)
--     cneumuel 02/05/2014 - In create_page_item: default p_source_type to ALWAYS_NULL
--     cneumuel 02/10/2014 - Changed NATIVE_HTML region to NATIVE_STATIC
--     msewtz   02/11/2014 - Added before and after element attributes and help link attribute to wwv_flow_field_templates (feature 1377)
--     cneumuel 02/13/2014 - In create_flow,create_page: added p_rejoin_existing_sessions (feature #1047)
--     msewtz   02/17/2014 - Added region_sub_css_classes to create_page_plug
--     msewtz   02/17/2014 - Added error_template to create_field_template
--     msewtz   02/19/2014 - Added missing region_sub_css_classes references
--     pawolf   02/26/2014 - Removed wwv_flow_plugins.builder_js_function
--                         - Added wwv_flow_plugins.is_quick_pick and wwv_flow_plugin_attr_values.is_quick_pick
--                         - Added wwv_flow_plugin_attr_values.help_text
--                         - Added wwv_flow_plugin_attributes.examples
--     pawolf   02/28/2014 - Added wwv_flow_messages$.is_js_message
--     cneumuel 02/28/2014 - In create_flow: "basic" escaping for applications before APEX 4.2 (bug #18314817)
--     msewtz   03/12/2014 - Added icon_css_classes to buttons (wwv_flow_step_buttons and wwv_flow_step_items)
--     cneumuel 03/14/2014 - In create_flow: added runtime_api_usage (feature #1277)
--                         - Added check_api_use_allowed
--     pawolf   03/17/2014 - Added support for region columns (feature #1393)
--                         - Added javascript_file_urls and css_file_urls to wwv_flow_plugins (feature #1262)
--     msewtz   03/18/2014 - Added create_template_option (feature 1394)
--     msewtz   03/18/2014 - Added page_css_classes and template_options to create_page (feature 1394)
--     msewtz   03/18/2014 - Added region_template_options and component_template_options to create_region and create_report_region (feature 1394)
--     msewtz   03/18/2014 - Added item_css_classes and item_template_options to create_page_iten (feature 1394)
--     msewtz   03/18/2014 - Added button_template_options to create_page_button (feature 1394)
--     msewtz   03/21/2014 - added default_template_options to create_template
--     msewtz   03/21/2014 - added default_template_options to create_button_templates
--     msewtz   03/21/2014 - added default_template_options to create_plug_template
--     msewtz   03/21/2014 - added default_template_options to create_list_template
--     msewtz   03/21/2014 - added default_template_options to create_row_template
--     msewtz   03/21/2014 - added default_template_options to create_field_template
--     msewtz   03/21/2014 - added default_template_options to create_menu_template
--     msewtz   03/24/2014 - Added nav_list_template_options to wwv_flow_steps and wwv_flow_user_interfaces (feature #1394)
--     hfarrell 03/25/2014 - In create_page: added p_dialog_chained defaulting to 'Y' (feature #1199)
--     msewtz   03/27/2014 - Added template options for pages and nav lists to create_theme (feature 1394)
--     msewtz   04/01/2014 - Added icon CSS classes to regions (feature 1394)
--     msewtz   04/01/2014 - Added CSS icon attributes to themes (feature 1394)
--     msewtz   04/01/2014 - added default_template_options to create_template (feature 1394)
--     msewtz   04/01/2014 - added default_template_options to create_button_templates (feature 1394)
--     msewtz   04/01/2014 - added default_template_options to create_plug_template (feature 1394)
--     msewtz   04/01/2014 - added default_template_options to create_list_template (feature 1394)
--     msewtz   04/01/2014 - added default_template_options to create_row_template (feature 1394)
--     msewtz   04/01/2014 - added default_template_options to create_field_template (feature 1394)
--     msewtz   04/01/2014 - added default_template_options to create_menu_template (feature 1394)
--     cneumuel 04/04/2014 - In create_page_button: added parameters for item button migration (feature #1314)
--     jstraub  04/04/2014 - added create_install_object
--     cneumuel 04/17/2014 - In create_page: added p_cache_mode (feature #1401)
--     pmanirah 04/21/2014 - Added p_glv_new_column to create_page_tmpl_display_point and create_page_tmpl_display_point procedures
--     msewtz   03/27/2014 - Added template options groups (feature 1394)
--     cneumuel 04/24/2014 - In plug APIs: added p_plug_cache_depends_on_items (feature #1401)
--     jstraub  04/24/2014 - Added p_script_option to create_install_script
--     msewtz   04/29/2014 - Updated create_template_option, changed is_advanced to options (feature 1394)
--     pawolf   05/23/2014 - Removed wwv_flow_templates.has_edit_links
--                         - Added wwv_flow_templates.grid_always_emit (feature #1433)
--     pmanirah 06/02/2014 - Renamed p_glv_new_column to p_glv_new_row (feature #1210)
--     msewtz   07/10/2014 - Added theme roller columns to wwv_flow_theme_styles
--     msewtz   07/10/2014 - Removed template option defaults from wwv_flow_themes
--     msewtz   07/10/2014 - Added icon class colums to wwv_flow_themes
--     hfarrell 07/15/2014 - Added p_dialog_browser_frame to create_template
--     pawolf   07/22/2014 - Added wwv_flow_plugin_attributes.show_in_wizard
--                         - Renamed legacy column in plug-in and property tables to deprecated
--     pmanirah 07/23/2014 - Added default_dialog_btr_template to create_theme
--     cneumuel 07/24/2014 - added id: function that adds g_id_offset to a value
--     pawolf   07/25/2014 - Moved content_delivery_network, javascript_file_urls and include_legacy_javascript from wwv_flows into wwv_flow_user_interfaces (feature #1464)
--     davgale  08/06/2014 - Added navigation list positions to create_user_interface, create_theme, and create_page (feature 1470)
--     pawolf   08/08/2014 - Fixed rename of nav_list_position to navigation_list_position
--     pawolf   08/14/2014 - Added include_jquery_migrate to wwv_flow_user_interfaces (feature #1475)
--     cneumuel 09/17/2014 - In create_flow: default p_deep_linking to N, but always set it to Y for versions before 4.2, where the feature was introduced
--     pawolf   10/01/2014 - Added javascript_file_urls and css_file_urls to wwv_flow_themes (feature #1484)
--     hfarrell 10/14/2014 - Added navigation bar-related columns to create_user_interface: p_nav_bar_type, p_nav_bar_list_id, p_nav_bar_list_template_id, p_nav_bar_template_options (feature #1536)
--     hfarrell 10/16/2014 - In create_user_interface: set default for p_nav_bar_type
--     hfarrell 10/20/2014 - In create_theme: added p_default_navbar_list_template (feature #1536)
--     cneumuel 10/21/2014 - Added c_apex_5_0_beta (feature #1539)
--                         - In import_begin, set_version: added p_release
--     hfarrell 10/22/2014 - In create_theme: added p_nav_bar_type (feature #1536)
--     arayner  10/28/2014 - Obsolete wwv_flow_worksheet columns button_template, actions_menu_icon and finder_icon (feature #577)
--     hfarrell 11/04/2014 - In create_list_template: added new a01_label to a20_label columns to wwv_flow_list_templates (feature #1567)
--     cneumuel 11/07/2014 - Added get_version_identifier (feature #1153)
--                         - Removed 5.0 beta identifier - there is only 5.0 (feature #1539)
--     pawolf   11/11/2014 - Added wwv_flow_themes.custom_icon_prefix_class (feature #1574)
--     pawolf   11/12/2014 - Added wwv_flow_plugin_attributes.reference_scope (feature #1596)
--     pawolf   11/27/2014 - Added wwv_flow_step_items.grid_label_column_span and wwv_flow_templates.grid_default_label_col_span (feature #1615)
--                         - Added static_id and css_classes to wwv_flow_worksheet_columns (feature #1457)
--     arayner  11/28/2014 - Added fixed_header to create_worksheet, create_ws_worksheet and create_page_plug (feature #1534)
--     arayner  11/28/2014 - Removed fixed_header from create_page_plug, instead added it to create_report_region (feature #1534)
--     arayner  11/28/2014 - Updated fixed_header parameters to default to 'REGION' (feature #1534)
--     arayner  12/02/2014 - Added fixed_header back to create_page_plug with default null (feature #1534)
--     arayner  12/04/2014 - Added fixed_header_max_height to wwv_flow_worksheet and wwv_flow_page_plugs (feature #1534)
--     arayner  12/04/2014 - Corrected parameter names for fixed_header_max_height (feature #1534)
--     arayner  12/04/2014 - Made fixed_header_max_height number not varchar2 (feature #1534)
--     pawolf   12/04/2014 - Added grid_column_css_classes to wwv_flow_page_plugs, wwv_flow_step_items and wwv_flow_step_buttons (feature #1466)
--     hfarrell 12/11/2014 - In create_theme: added default_dialogr_template and default_dialogbtnr_template; removed default_dialog_btr_template (verified by pmanirah that it is not required)
--     pmanirah 12/15/2014 - Added two parameters to create_calendar: p_region_image, p_region_image (bug 19672864)
--     pawolf   12/18/2014 - In import_end: added p_is_component_import (features #1623 and #1624)
--     jstraub  01/09/2015 - Removed create_query_definition, create_query_object, create_query_column, create_query_condition
--     cneumuel 01/12/2015 - In create_theme_style: make p_css_file_urls default null
--     hfarrell 01/14/2015 - Reinstated create_query_definition, create_query_object, create_query_column, create_query_condition (bug #20356424)
--     cneumuel 01/16/2015 - In create_user_interface: make p_css_file_urls varchar2
--     cneumuel 03/03/2015 - In create_calendar: default p_item_link_open_in to 'W' (bug #20637295)
--
--------------------------------------------------------------------------------

--
c_default_query_row_count_max constant number := 500;
--
empty_vc_arr        wwv_flow_global.vc_arr2;
g_raise_errors      boolean := false;
g_id_offset         number := 0;
g_nls_numeric_chars varchar2(8);


-- Valid modes:
--   CREATE  - only insert
--   REMOVE  - only delete
--   REPLACE - delete and insert
g_mode              varchar2(255) := 'CREATE';

--==============================================================================
-- import versions
--
-- FOR NEW RELEASES: create a new c_apex_X_Y constant and point c_current to it.
--==============================================================================
subtype t_apex_version is pls_integer;
c_apex_4_0      constant t_apex_version    := 20100513;
c_apex_4_1      constant t_apex_version    := 20110212;
c_apex_4_2      constant t_apex_version    := 20120101;
c_apex_5_0      constant t_apex_version    := 20130101;
c_current       constant t_apex_version    := c_apex_5_0;
g_compatable_from_version     varchar2(10) := regexp_replace(c_current, '(....)(..)(..)', '\1.\2.\3');
g_is_compatable               boolean      := true;
--
--==============================================================================
empty_varchar2_table          sys.dbms_sql.varchar2_table;
g_varchar2_table              sys.dbms_sql.varchar2_table;
g_list_contents_only          boolean := false;
g_import_script_files         wwv_flow_global.vc_arr2;
g_import_script_status        wwv_flow_global.vc_arr2;
g_fnd_user_password_action    boolean := false;
--
--==============================================================================
-- globals that store the current import context. in addition to the ones
-- below, wwv_flow_api also uses wwv_flow.g_flow_id. see the default values of
-- create_% procedure parameters below.
--==============================================================================
g_lov_id                      number;
g_page_id                     number;
g_region_id                   number;
g_region_source               varchar2(32767);
g_worksheet_id                number;
g_list_id                     number;
g_menu_id                     number;

--##############################################################################
--#
--# SECURITY CHECKS
--#
--##############################################################################

--==============================================================================
procedure check_sgid;

--==============================================================================
procedure check_version;

--==============================================================================
procedure check_sgid_for_app_id (
    p_flow_id in number );

--==============================================================================
-- check whether the caller can use the API procedures. this procedure
-- implements checks for
-- * security group id
-- * version compatibility (disable with p_check_version => false)
-- * current app can use workspace api (enable with p_check_workspace => true)
-- * current app can edit app (enable by passing a value for p_flow_id)
--==============================================================================
procedure check_api_use_allowed (
    p_check_version   in boolean default true,
    p_check_workspace in boolean default null,
    p_flow_id         in number  default null );

--==============================================================================
procedure check_sgid_for_ws_app_id(
    p_websheet_application_id in number);

--==============================================================================
procedure check_for_valid_flow_range (
    p_flow_id in number );

--##############################################################################
--#
--# VERSIONING
--#
--##############################################################################

--==============================================================================
function get_version_identifier
    return varchar2;

--==============================================================================
-- This call is expected to be made before running and procedure within wwv_flow_api.
-- You are expected to inform the flows API which version of flows created your export.
-- All flow versions are in the form YYYY.MM.DD.
-- No API calls will work if the versions are incompatable.
-- An incompatable version is defined as the wwv_flow_api.g_compatable_from_version
-- (a static plsql package global that indicates from which date this api is good from)
-- is less then or equal to the calling version passed to this procedure.
--==============================================================================
procedure set_version (
    p_version_yyyy_mm_dd in varchar2,
    p_release            in varchar2 default null,
    p_debug              in varchar2 default 'YES');

--==============================================================================
-- return the export version of the file that we are currently importing and
-- where set_version() was called when executing the PL/SQL blocks.
--==============================================================================
function get_calling_version
    return t_apex_version;

--==============================================================================
function id (
    p_id in number )
    return number;

--##############################################################################
--#
--# REMOVING
--#
--##############################################################################
--
-- R E M O V E
--
procedure remove_flow (
    --
    -- This procedure deletes a row from the wwv_flows table
    -- which then cascades to all subordinate flow objects.
    --
    -- Run this procedure only from an application export file
    -- because it will make sure that translated apps will not be removed and
    -- saved IR's are stored in memory for later restore.
    --
    -- To delete an application and all it's translations, ... use remove_application
    -- instead.
    --
    p_id in number  default null )
    ;

procedure remove_application (
    --
    -- This procedure deletes an application and all it's child objects like
    -- pages, translated applications, ...
    --
    p_application_id in number,
    p_workspace_id   in number default wwv_flow_security.g_security_group_id );


procedure remove_page (
    --
    -- This procedure deletes a row from the pages table
    -- which then cascades to delete all subordinate meta
    -- data.
    --
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default null)
    ;

--##############################################################################
--#
--# CREATING
--#
--##############################################################################

procedure create_ui_type (
    p_name                        in varchar2,
    p_based_on_ui_type_name       in varchar2 default null,
    p_autodetect_js_file_urls     in varchar2 default null,
    p_autodetect_js_function_body in varchar2 default null,
    p_autodetect_plsql_func_body  in varchar2 default null );

procedure create_ui_type_feature (
    p_ui_type_name       in varchar2,
    p_builder_feature_id in number );

-------------------------------------------------
-- C R E A T E   F L O W   A T T R I B U T E S --
-------------------------------------------------

--
-- F L O W
--
procedure create_flow (
    --
    -- This procedure creates the description of a flow.
    -- A flow is made up of zero or more pages as well as
    -- other "flow level" attributes.
    --
    -- obsolete attributes
    --   P_SECURITY_GROUP_ID (derived from "set credentials" call)
    --   P_WEBDB_TEMPLATE (included for compatability replaced with p_default_page_template)
    --   P_WEBDB_LOGGING (included for compatability replaced with p_page_view_logging)
    --   P_PAGE_RANGE_MINIMUM (included so old flows will still create)
    --   P_PAGE_RANGE_MAXIMUM (included so old flows will still create)
    --
    -- new arguments not yet implemented
    --   P_GLOBAL_ID (will allow alternate flow ID reference... a synonym for a flow ID)


    p_id                        in number   default null,
    p_security_group_id         in number   default null, -- obsolete
    p_display_id                in number   default null,
    p_owner                     in varchar2 default null,
    p_name                      in varchar2 default null,
    p_alias                     in varchar2 default null,
    p_webdb_template            in varchar2 default null, -- obsolete
    p_default_page_template     in number   default null, -- obsolete
    p_home_link                 in varchar2 default null, -- obsolete
    p_box_width                 in varchar2 default null,
    p_webdb_logging             in varchar2 default null, -- obsolete
    p_page_view_logging         in varchar2 default null,
    p_flow_language             in varchar2 default null,
    p_flow_language_derived_from in varchar2 default null,
    p_date_format               in varchar2 default null,
    p_date_time_format          in varchar2 default null,
    p_timestamp_format          in varchar2 default null,
    p_timestamp_tz_format       in varchar2 default null,
    p_nls_sort                  in varchar2 default null,
    p_nls_comp                  in varchar2 default null,
    p_flow_image_prefix         in varchar2 default null,
    p_media_type                in varchar2 default null,
    p_printer_friendly_template in number   default null, -- obsolete
    p_default_region_template   in number   default null, -- obsolete
    p_default_label_template    in number   default null, -- obsolete
    p_default_report_template   in number   default null, -- obsolete
    p_default_list_template     in number   default null, -- obsolete
    p_default_menu_template     in number   default null, -- obsolete
    p_default_button_template   in number   default null, -- obsolete
    p_error_template            in number   default null, -- obsolete
    --
    p_default_chart_template    in number   default null, -- obsolete
    p_default_form_template     in number   default null, -- obsolete
    p_default_wizard_template   in number   default null, -- obsolete
    p_default_tabform_template  in number   default null, -- obsolete
    p_default_reportr_template  in number   default null, -- obsolete
    p_default_menur_template    in number   default null, -- obsolete
    p_default_listr_template    in number   default null, -- obsolete
    p_default_irr_template      in number   default null, -- obsolete
    --
    p_theme_id                  in number   default null, -- obsolete
    p_application_group         in number   default null,
    p_application_group_name    in varchar2 default null,
    p_application_group_comment in varchar2 default null,
    --
    p_documentation_banner      in varchar2 default null,
    p_authentication            in varchar2 default null,
    p_authentication_id         in number   default null,
    p_login_url                 in varchar2 default null, -- obsolete
    p_logout_url                in varchar2 default null,
    p_logo_image                in varchar2 default null,
    p_logo_image_attributes     in varchar2 default null,
    p_public_url_prefix         in varchar2 default null,
    p_public_user               in varchar2 default null,
    p_dbauth_url_prefix         in varchar2 default null,
    p_proxy_server              in varchar2 default null,
    p_cust_authentication_process in varchar2 default null,
    p_cust_authentication_page  in varchar2 default null,
    p_custom_auth_login_url     in varchar2 default null, -- obsolete
    p_flow_version              in varchar2 default null,
    p_page_range_minimum        in number   default null, -- obsolete; not in wwv_flows table
    p_page_range_maximum        in number   default null, -- obsolete; not in wwv_flows table
    p_flow_status               in varchar2 default null,
    p_flow_unavailable_text     in varchar2 default null,
    p_restrict_to_user_list     in varchar2 default null,
    p_build_status              in varchar2 default 'RUN_AND_BUILD',
    p_exact_substitutions_only  in varchar2 default null,
    p_browser_cache             in varchar2 default 'Y',
    p_browser_frame             in varchar2 default 'A',
    p_deep_linking              in varchar2 default 'N',
    p_http_response_headers     in varchar2 default null,
    p_vpd                       in varchar2 default null,
    p_vpd_teardown_code         in varchar2 default null,
    p_runtime_api_usage         in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_authorize_public_pages_yn in varchar2 default 'N',
    p_application_tab_set       in number   default null, -- obsolete; reused for debugging flag
    p_rejoin_existing_sessions  in varchar2 default null,
    p_substitution_string_01    in varchar2 default null,
    p_substitution_value_01     in varchar2 default null,
    p_substitution_string_02    in varchar2 default null,
    p_substitution_value_02     in varchar2 default null,
    p_substitution_string_03    in varchar2 default null,
    p_substitution_value_03     in varchar2 default null,
    p_substitution_string_04    in varchar2 default null,
    p_substitution_value_04     in varchar2 default null,
    p_substitution_string_05    in varchar2 default null,
    p_substitution_value_05     in varchar2 default null,
    p_substitution_string_06    in varchar2 default null,
    p_substitution_value_06     in varchar2 default null,
    p_substitution_string_07    in varchar2 default null,
    p_substitution_value_07     in varchar2 default null,
    p_substitution_string_08    in varchar2 default null,
    p_substitution_value_08     in varchar2 default null,
    p_substitution_string_09    in varchar2 default null,
    p_substitution_value_09     in varchar2 default null,
    p_substitution_string_10    in varchar2 default null,
    p_substitution_value_10     in varchar2 default null,
    p_substitution_string_11    in varchar2 default null,
    p_substitution_value_11     in varchar2 default null,
    p_substitution_string_12    in varchar2 default null,
    p_substitution_value_12     in varchar2 default null,
    p_substitution_string_13    in varchar2 default null,
    p_substitution_value_13     in varchar2 default null,
    p_substitution_string_14    in varchar2 default null,
    p_substitution_value_14     in varchar2 default null,
    p_substitution_string_15    in varchar2 default null,
    p_substitution_value_15     in varchar2 default null,
    p_substitution_string_16    in varchar2 default null,
    p_substitution_value_16     in varchar2 default null,
    p_substitution_string_17    in varchar2 default null,
    p_substitution_value_17     in varchar2 default null,
    p_substitution_string_18    in varchar2 default null,
    p_substitution_value_18     in varchar2 default null,
    p_substitution_string_19    in varchar2 default null,
    p_substitution_value_19     in varchar2 default null,
    p_substitution_string_20    in varchar2 default null,
    p_substitution_value_20     in varchar2 default null,
    p_required_roles              in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_global_notification         in varchar2 default null,
    p_global_id                   in number   default null,
    p_charset                     in varchar2 default null,
    p_page_protection_enabled_y_n in varchar2 default null,
    p_checksum_salt               in raw      default null,
    p_checksum_salt_last_reset    in varchar2 default null,
    p_bookmark_checksum_function  in varchar2 default null, -- MD5 for pre-5.0
    p_csv_encoding                in varchar2 default null,
    p_auto_time_zone              in varchar2 default null,
    p_content_delivery_network    in varchar2 default null, -- obsolete
    p_javascript_file_urls        in varchar2 default null, -- obsolete
    p_include_legacy_javascript   in varchar2 default 'Y',  -- obsolete
    p_ui_detection_css_urls       in varchar2 default null,
    p_error_handling_function     in varchar2 default null,
    p_default_error_display_loc   in varchar2 default 'INLINE_WITH_FIELD_AND_NOTIFICATION',
    p_max_session_length_sec      in number   default null,
    p_on_max_session_timeout_url  in varchar2 default null,
    p_max_session_idle_sec        in number   default null,
    p_on_max_idle_timeout_url     in varchar2 default null,
    p_compatibility_mode          in varchar2 default '4.0',
    p_html_escaping_mode          in varchar2 default null,
    p_email_from                  in varchar2 default null,
    --
    p_publish_yn                  in varchar2 default 'N',   -- apex 4.0
    p_allow_feedback_yn           in varchar2 default 'N',   -- apex 4.0
    --
    p_ui_type_name                in varchar2 default 'DESKTOP',
    p_file_prefix                 in varchar2 default null,
    p_files_version               in number   default 1,
    --
    p_last_updated_by             in varchar2 default null,
    p_last_upd_yyyymmddhh24miss   in varchar2 default null,
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME')
    ;

procedure set_application_name (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null)
    ;
procedure set_application_alias (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_alias                     in varchar2 default null)
    ;
procedure set_exact_subs (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_exact_substitutions       in varchar2 default null)
    ;
procedure set_security_scheme (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_security_scheme           in varchar2 default null)
    ;
procedure set_proxy_server (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_proxy_server              in varchar2 default null)
    ;
procedure set_page_prot_enabled_y_n (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_page_protection           in varchar2 default null)
    ;
procedure set_vpd (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_vpd                       in varchar2 default null)
    ;
procedure set_application_lock (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_locked_by                 in varchar2 default null)
    ;

procedure set_enable_app_debugging (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_debugging                 in varchar2 default null)
    ;
procedure set_global_notification (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_global_notification       in varchar2 default null)
    ;
procedure set_flow_authentication (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_authentication            in varchar2 default null)
    ;
procedure set_logout_url (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_logout_url                in varchar2 default null)
    ;
procedure set_logo_image (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_logo_image                in varchar2 default null,
    p_logo_image_attributes     in varchar2 default null)
    ;
procedure set_image_prefix (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_image_prefix              in varchar2 default null)
    ;
procedure set_logging (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_logging                   in varchar2 default null)
    ;
procedure set_application_owner (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_application_owner         in varchar2 default null)
    ;
function get_application_owner (
    p_flow_id                   in number )
    return varchar2
    ;
procedure set_public_url_prefix (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_public_url_prefix         in varchar2 default null)
    ;
procedure set_authenticated_url_prefix (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_authenticated_url_prefix  in varchar2 default null)
    ;
procedure create_build_option (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_build_option_name         in varchar2 default null,
    p_build_option_status       in varchar2 default null,
    p_build_option_comment      in varchar2 default null,
    --
    p_default_on_export         in varchar2 default null,
    p_attribute1                in varchar2 default null,
    p_attribute2                in varchar2 default null,
    p_attribute3                in varchar2 default null,
    p_attribute4                in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;
procedure set_build_option (
    p_id                        in number   default null,
    p_build_option_status       in varchar2 default null)
    ;
procedure set_static_sub_strings (
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_substitution_string_01      in varchar2 default null,
    p_substitution_value_01       in varchar2 default null,
    p_substitution_string_02      in varchar2 default null,
    p_substitution_value_02       in varchar2 default null,
    p_substitution_string_03      in varchar2 default null,
    p_substitution_value_03       in varchar2 default null,
    p_substitution_string_04      in varchar2 default null,
    p_substitution_value_04       in varchar2 default null,
    p_substitution_string_05      in varchar2 default null,
    p_substitution_value_05       in varchar2 default null,
    p_substitution_string_06      in varchar2 default null,
    p_substitution_value_06       in varchar2 default null,
    p_substitution_string_07      in varchar2 default null,
    p_substitution_value_07       in varchar2 default null,
    p_substitution_string_08      in varchar2 default null,
    p_substitution_value_08       in varchar2 default null)
    ;
procedure set_flow_status (
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_status               in varchar2,
    p_flow_status_message       in varchar2 default null,
    p_restrict_to_user_list     in varchar2 default null)
    ;

--==============================================================================
-- implementation of apex_util.set_compatibility_mode
--==============================================================================
procedure set_compatibility_mode (
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_compatibility_mode        in varchar2 );

procedure create_user_interface (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_ui_type_name                  in varchar2,
    p_display_name                  in varchar2,
    p_display_seq                   in number,
    p_use_auto_detect               in boolean,
    p_is_default                    in boolean,
    p_theme_id                      in number,
    p_home_url                      in varchar2 default null,
    p_login_url                     in varchar2 default null,
    p_global_page_id                in number   default null,
    p_navigation_list_id            in number   default null,
    p_navigation_list_position      in varchar2 default null,
    p_navigation_list_template_id   in number   default null,
    p_nav_list_template_options     in varchar2 default null,
    p_content_delivery_network      in varchar2 default null,
    p_css_file_urls                 in varchar2  default null,
    p_javascript_file_urls          in varchar2 default null,
    p_include_legacy_javascript     in boolean  default false,
    p_include_jquery_migrate        in boolean  default false,
    p_required_patch                in number   default null,
    p_nav_bar_type                  in varchar2 default 'NAVBAR',
    p_nav_bar_list_id               in number   default null,
    p_nav_bar_list_template_id      in number   default null,
    p_nav_bar_template_options      in varchar2 default null);

procedure create_combined_file (
    p_id                in number   default null,
    p_flow_id           in number   default wwv_flow.g_flow_id,
    p_user_interface_id in number,
    p_page_id           in number   default null,
    p_combined_file_url in varchar2,
    p_single_file_urls  in varchar2,
    p_required_patch    in number   default null );

procedure create_app_static_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob );

procedure create_workspace_static_file (
    p_id           in number   default null,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob );

--
-- S E C U R I T Y   S C H E M E S
--
procedure create_security_scheme (
    p_id                       in number   default null,
    p_security_group_id        in number   default null, -- obsolete
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_name                     in varchar2 default null,
    p_scheme_type              in varchar2 default null,
    p_attribute_01             in varchar2 default null,
    p_attribute_02             in varchar2 default null,
    p_attribute_03             in varchar2 default null,
    p_attribute_04             in varchar2 default null,
    p_attribute_05             in varchar2 default null,
    p_attribute_06             in varchar2 default null,
    p_attribute_07             in varchar2 default null,
    p_attribute_08             in varchar2 default null,
    p_attribute_09             in varchar2 default null,
    p_attribute_10             in varchar2 default null,
    p_attribute_11             in varchar2 default null,
    p_attribute_12             in varchar2 default null,
    p_attribute_13             in varchar2 default null,
    p_attribute_14             in varchar2 default null,
    p_attribute_15             in varchar2 default null,
    p_scheme                   in varchar2 default null, -- obsolete
    p_scheme_text              in varchar2 default null, -- obsolete
    p_caching                  in varchar2 default null,
    p_error_message            in varchar2 default null,
    p_reference_id             in number   default null,
    p_comments                 in varchar2 default null,
    --
    p_id_offset                in number   default 0,
    p_target                   in varchar2 default 'PRIME')
    ;

--
-- N A V I G A T I O N   B A R
--

procedure create_icon_bar (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_icon_bar_text             in varchar2 default null,
    p_icon_bar_table_width      in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_icon_bar_item (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_icon_sequence             in number   default null,
    p_icon_image                in varchar2 default null,
    p_icon_image2               in varchar2 default null,
    p_icon_image3               in varchar2 default null,
    p_icon_subtext              in varchar2 default null,
    p_icon_subtext2             in varchar2 default null,
    p_icon_subtext3             in varchar2 default null,
    p_icon_target               in varchar2 default null,
    p_icon_image_alt            in varchar2 default null,
    p_icon_height               in number   default null,
    p_icon_width                in number   default null,
    p_icon_height2              in number   default null,
    p_icon_width2               in number   default null,
    p_icon_height3              in number   default null,
    p_icon_width3               in number   default null,
    p_icon_bar_disp_cond        in varchar2 default null,
    p_icon_bar_disp_cond_type   in varchar2 default null,
    p_icon_bar_flow_cond_instr  in varchar2 default null,
    p_begins_on_new_line        in varchar2 default null,
    p_cell_colspan              in number   default null,
    p_onclick                   in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_reference_id              in number   default null,
    p_nav_entry_is_feedback_yn  in varchar2 default null,
    p_icon_bar_comment          in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure set_icon_bar_item (
    p_id                        in number,
    p_icon_sequence             in number   default null,
    p_icon_image                in varchar2 default null,
    p_icon_image2               in varchar2 default null,
    p_icon_image3               in varchar2 default null,
    p_icon_subtext              in varchar2 default null,
    p_icon_subtext2             in varchar2 default null,
    p_icon_subtext3             in varchar2 default null,
    p_icon_target               in varchar2 default null,
    p_icon_image_alt            in varchar2 default null,
    p_icon_height               in number   default null,
    p_icon_width                in number   default null,
    p_icon_height2              in number   default null,
    p_icon_width2               in number   default null,
    p_icon_height3              in number   default null,
    p_icon_width3               in number   default null,
    p_icon_bar_disp_cond        in varchar2 default null,
    p_icon_bar_disp_cond_type   in varchar2 default null,
    p_icon_bar_flow_cond_instr  in varchar2 default null,
    p_begins_on_new_line        in varchar2 default null,
    p_cell_colspan              in number   default null,
    p_required_patch            in number   default null,
    p_icon_bar_comment          in varchar2 default null)
    ;

procedure remove_icon_bar_item (
    p_id                        in number)
    ;

--
-- F L O W   P R O C E S S
--
procedure create_flow_process (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_process_sequence          in number   default null,
    p_process_point             in varchar2,
    p_process_type              in varchar2 default 'PLSQL',
    p_process_name              in varchar2 default null,
    p_process_sql               in varchar2 default null,
    p_process_sql_clob          in varchar2 default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_process_error_message     in varchar2 default null,
    p_error_display_location    in varchar2 default 'ON_ERROR_PAGE',
    p_process_when              in varchar2 default null,
    p_process_when_type         in varchar2 default null,
    p_process_when2             in varchar2 default null,
    p_process_when_type2        in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_process_item_name         in varchar2 default null,
    p_process_comment           in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure set_flow_process_sql (
    p_id                        in number   default null,
    p_process_sql               in varchar2 default null)
    ;


--
-- F L O W   I T E M S
--

procedure create_flow_item (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_scope                     in varchar2 default 'APP',
    p_data_type                 in varchar2 default 'VARCHAR',
    p_is_Persistent             in varchar2 default 'Y',
    p_required_patch            in number   default null,
    p_protection_level          in varchar2 default null,
    p_item_comment              in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

--
-- F L O W   C O M P U T A T I O N S
--
procedure create_flow_computation (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_computation_sequence      in number   default null,
    p_computation_item          in varchar2 default null,
    p_computation_point         in varchar2 default null,
    p_computation_item_type     in varchar2 default null,
    p_computation_type          in varchar2 default null,
    p_computation_processed     in varchar2 default null,
    p_computation               in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_computation_comment       in varchar2 default null,
    p_compute_when              in varchar2 default null,
    p_compute_when_type         in varchar2 default null,
    p_compute_when_text         in varchar2 default null,
    p_computation_error_message in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;




procedure create_tab (
    --
    -- Standard Tabs
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_tab_set                   in varchar2 default null,
    p_tab_sequence              in number   default null,
    p_tab_name                  in varchar2 default null,
    p_tab_image                 in varchar2 default null,
    p_tab_non_current_image     in varchar2 default null,
    p_tab_image_attributes      in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    p_tab_step                  in number   default null,
    p_tab_also_current_for_pages in varchar2 default null,
    p_tab_parent_tabset         in varchar2 default null,
    p_tab_plsql_condition       in varchar2 default null,
    p_display_condition_type    in varchar2 default null,
    p_tab_disp_cond_text        in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_tab_comment               in varchar2 default null,
    --
    p_auto_parent_tab_set       in varchar2 default null,
    p_auto_parent_tab_text      in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;
procedure update_tab_condition (
    p_id                        in number   default null,
    p_tab_plsql_condition       in varchar2 default null)
    ;
procedure update_tab_text (
    p_id                        in number   default null,
    p_tab_text                  in varchar2 default null)
    ;
procedure rename_tabset (
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_old_name                  in varchar2 default null,
    p_new_name                  in varchar2 default null)
    ;

procedure create_toplevel_tab (
    --
    -- Parent Tabs
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_tab_set                   in varchar2 default null,
    p_tab_sequence              in number   default null,
    p_tab_name                  in varchar2 default null,
    p_tab_image                 in varchar2 default null,
    p_tab_non_current_image     in varchar2 default null,
    p_tab_image_attributes      in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    p_tab_target                in varchar2 default null,
    p_current_on_tabset         in varchar2 default null,
    p_display_condition         in varchar2 default null,
    p_display_condition2        in varchar2 default null,
    p_display_condition_type    in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_tab_comment               in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;
procedure update_toplevel_tab (
    p_id                        in number   default null,
    p_display_condition         in varchar2 default null)
    ;


procedure set_toplevel_tab_target (
    p_id                        in number   default null,
    p_tab_target                in varchar2 default null)
    ;

procedure set_toplevel_tab_text (
    p_id                        in number   default null,
    p_tab_text                  in varchar2 default null)
    ;


--
-- L I S T S  O F  V A L U E S
--

procedure create_list_of_values (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_lov_name                  in varchar2 default null,
    p_lov_query                 in varchar2 default null,
    p_reference_id              in number   default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_static_lov_data (
    p_id                        in number   default null,
    p_lov_id                    in number   default g_lov_id,
    p_lov_disp_sequence         in number   default null,
    p_lov_disp_value            in varchar2 default null,
    p_lov_return_value          in varchar2 default null,
    p_lov_template              in varchar2 default null,
    p_lov_disp_cond_type        in varchar2 default null,
    p_lov_disp_cond             in varchar2 default null,
    p_lov_disp_cond2            in varchar2 default null,
    p_required_patch            in varchar2 default null,
    p_lov_data_comment          in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

--
-- I N S T A L L E R
--

procedure create_install (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_include_in_export_yn        in varchar2 default 'Y',
    p_welcome_message             in varchar2 default null,
    p_license_message             in varchar2 default null,
    p_configuration_message       in varchar2 default null,
    p_build_options_message       in varchar2 default null,
    p_validation_message          in varchar2 default null,
    p_install_message             in varchar2 default null,
    p_install_success_message     in varchar2 default null,
    p_install_failure_message     in varchar2 default null,
    p_upgrade_message             in varchar2 default null,
    p_upgrade_confirm_message     in varchar2 default null,
    p_upgrade_success_message     in varchar2 default null,
    p_upgrade_failure_message     in varchar2 default null,
    p_get_version_sql_query       in varchar2 default null,
    p_deinstall_message           in varchar2 default null,
    p_deinstall_success_message   in varchar2 default null,
    p_deinstall_failure_message   in varchar2 default null,
    p_deinstall_script_clob       in varchar2 default null,

    p_prompt_sub_string_01        in varchar2 default null,
    p_prompt_sub_string_02        in varchar2 default null,
    p_prompt_sub_string_03        in varchar2 default null,
    p_prompt_sub_string_04        in varchar2 default null,
    p_prompt_sub_string_05        in varchar2 default null,
    p_prompt_sub_string_06        in varchar2 default null,
    p_prompt_sub_string_07        in varchar2 default null,
    p_prompt_sub_string_08        in varchar2 default null,
    p_prompt_sub_string_09        in varchar2 default null,
    p_prompt_sub_string_10        in varchar2 default null,
    p_prompt_sub_string_11        in varchar2 default null,
    p_prompt_sub_string_12        in varchar2 default null,
    p_prompt_sub_string_13        in varchar2 default null,
    p_prompt_sub_string_14        in varchar2 default null,
    p_prompt_sub_string_15        in varchar2 default null,
    p_prompt_sub_string_16        in varchar2 default null,
    p_prompt_sub_string_17        in varchar2 default null,
    p_prompt_sub_string_18        in varchar2 default null,
    p_prompt_sub_string_19        in varchar2 default null,
    p_prompt_sub_string_20        in varchar2 default null,

    p_install_prompt_01           in varchar2 default null,
    p_install_prompt_02           in varchar2 default null,
    p_install_prompt_03           in varchar2 default null,
    p_install_prompt_04           in varchar2 default null,
    p_install_prompt_05           in varchar2 default null,
    p_install_prompt_06           in varchar2 default null,
    p_install_prompt_07           in varchar2 default null,
    p_install_prompt_08           in varchar2 default null,
    p_install_prompt_09           in varchar2 default null,
    p_install_prompt_10           in varchar2 default null,
    p_install_prompt_11           in varchar2 default null,
    p_install_prompt_12           in varchar2 default null,
    p_install_prompt_13           in varchar2 default null,
    p_install_prompt_14           in varchar2 default null,
    p_install_prompt_15           in varchar2 default null,
    p_install_prompt_16           in varchar2 default null,
    p_install_prompt_17           in varchar2 default null,
    p_install_prompt_18           in varchar2 default null,
    p_install_prompt_19           in varchar2 default null,
    p_install_prompt_20           in varchar2 default null,

    p_prompt_if_mult_auth_yn      in varchar2 default null,

    p_trigger_install_when_cond   in varchar2 default null,
    p_trigger_install_when_exp1   in varchar2 default null,
    p_trigger_install_when_exp2   in varchar2 default null,
    p_trigger_failure_message     in varchar2 default null,

    p_required_free_kb            in number   default null,
    p_required_sys_privs          in varchar2 default null,
    p_required_names_available    in varchar2 default null,

    p_last_updated_by             in varchar2 default null,
    p_last_updated_on             in date     default null,
    --
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME')
    ;

procedure create_install_script (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_security_group_id           in number   default null,
    p_install_id                  in number   default null,
    p_name                        in varchar2 default null,
    p_sequence                    in number   default null,
    p_script_type                 in varchar2 default null,
    p_script_option               in varchar2 default null,
    p_script_clob                 in varchar2 default null,
    p_condition_type              in varchar2 default null,
    p_condition                   in varchar2 default null,
    p_condition2                  in varchar2 default null,
    --
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME')
    ;

procedure create_install_object (
    p_id                               in number      default null,
    p_flow_id                          in number      default wwv_flow.g_flow_id,
    p_script_id                        in number      default null,
    p_object_owner                     in varchar2    default null,
    p_object_type                      in varchar2    default null,
    p_object_name                      in varchar2    default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null );

procedure append_to_install_script (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_script_clob                 in varchar2 default null,
    p_deinstall                   in boolean  default false)
    ;

procedure create_install_check (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_security_group_id           in number   default null,
    p_install_id                  in number   default null,
    p_name                        in varchar2 default null,
    p_sequence                    in number   default null,
    p_check_type                  in varchar2 default null,
    p_check_condition             in varchar2 default null,
    p_check_condition2            in varchar2 default null,
    p_failure_message             in varchar2 default null,

    p_condition_type              in varchar2 default null,
    p_condition                   in varchar2 default null,
    p_condition2                  in varchar2 default null,
    --
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME')
    ;

procedure create_install_build_option (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_security_group_id           in number   default null,
    p_install_id                  in number   default null,
    p_build_opt_id                in number   default null,
    --
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME')
    ;



--
-- P A G E
--
procedure create_page (
    --
    -- Creates a page identification.  The p_auto_ auto
    -- arguments are used to optionally create new
    -- tab sets and tab text.
    --
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_user_interface_id           in number   default null,
    p_tab_set                     in varchar2 default null,
    p_name                        in varchar2 default null,
    p_alias                       in varchar2 default null,
    p_page_mode                   in varchar2 default 'NORMAL',
    p_step_title                  in varchar2 default null,
    p_step_sub_title              in varchar2 default null,
    p_step_sub_title_type         in varchar2 default null,
    p_media_type                  in varchar2 default null,
    p_first_item                  in varchar2 default null,
    p_include_apex_css_js_yn      in varchar2 default 'Y',
    p_render_form_as_table        in varchar2 default null,
    p_welcome_text                in varchar2 default null,
    p_box_welcome_text            in varchar2 default null,
    p_box_footer_text             in varchar2 default null,
    p_footer_text                 in varchar2 default null,
    p_help_text                   in varchar2 default null,
    p_step_template               in number   default null,
    p_page_css_classes            in varchar2 default null,
    p_page_template_options       in varchar2 default null,
    p_box_image                   in varchar2 default null,
    p_required_role               in varchar2 default null,
    p_required_patch              in number   default null,
    p_allow_duplicate_submissions in varchar2 default 'Y',
    p_on_dup_submission_goto_url  in varchar2 default null,
    p_html_page_header            in varchar2 default null,
    p_html_page_onload            in varchar2 default null,
    p_javascript_file_urls        in varchar2 default null,
    p_javascript_code             in varchar2 default null,
    p_javascript_code_onload      in varchar2 default null,
    p_css_file_urls               in varchar2 default null,
    p_inline_css                  in varchar2 default null,
    p_page_is_protected_y_n       in varchar2 default null,
    p_page_is_public_y_n          in varchar2 default null,
    p_protection_level            in varchar2 default 'N',
    p_error_handling_function     in varchar2 default null,
    p_error_notification_text     in varchar2 default null,
    p_page_comment                in varchar2 default null,
    --
    p_dialog_title                in varchar2 default null,
    p_dialog_height               in varchar2 default null,
    p_dialog_width                in varchar2 default null,
    p_dialog_max_width            in varchar2 default null,
    p_dialog_attributes           in varchar2 default null,
    p_dialog_css_classes          in varchar2 default null,
    p_dialog_chained              in varchar2 default 'Y',
    --
    p_overwrite_navigation_list   in varchar2 default 'N',
    p_navigation_list_position    in varchar2 default null,
    p_navigation_list_id          in number   default null,
    p_navigation_list_template_id in number   default null,
    p_nav_list_template_options   in varchar2 default null,
    --
    p_tab_name                    in varchar2 default null,  -- current tab name
    --
    p_auto_tab_set                in varchar2 default null,
    p_auto_tab_text               in varchar2 default null,
    p_auto_parent_tab_set         in varchar2 default null,
    p_auto_parent_tab_text        in varchar2 default null,
    --
    p_autocomplete_on_off         in varchar2 default 'ON',
    p_page_transition             in varchar2 default null,
    p_popup_transition            in varchar2 default null,
    --
    p_browser_cache               in varchar2 default null,
    p_deep_linking                in varchar2 default null,
    p_rejoin_existing_sessions    in varchar2 default null,
    --
    p_read_only_when_type         in varchar2 default null,
    p_read_only_when              in varchar2 default null,
    p_read_only_when2             in varchar2 default null,
    --
    p_cache_mode                  in varchar2 default null,-- 5.0 replacement for p_cache_page_yn and p_cache_by_user_yn
    p_cache_page_yn               in varchar2 default 'N', -- pre 5.0
    p_cache_timeout_seconds       in number   default null,
    p_cache_by_user_yn            in varchar2 default null,-- pre 5.0
    p_cache_when_condition_type   in varchar2 default null,
    p_cache_when_condition_e1     in varchar2 default null,
    p_cache_when_condition_e2     in varchar2 default null,
    --
    p_group_id                    in number   default null,
    --
    p_last_updated_by             in varchar2 default null,
    p_last_upd_yyyymmddhh24miss   in varchar2 default null,
    --
    p_created_by                  in varchar2 default null,
    p_created_on_yyyymmddhh24miss in varchar2 default null,
    --
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME') ;

procedure create_page_group (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_group_name                  in varchar2 default null,
    p_group_desc                  in varchar2 default null,
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME') ;

procedure create_page_help (
    --
    -- Used to add up to 32767 bytes of page level help text to an existing page.
    -- P_ID identifies the page ID.
    --
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_help_text                   in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME') ;

procedure update_page (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_tab_set                     in varchar2 default null,
    p_name                        in varchar2 default null,
    p_step_title                  in varchar2 default null,
    p_step_sub_title              in varchar2 default null,
    p_step_sub_title_type         in varchar2 default null,
    p_welcome_text                in varchar2 default null,
    p_box_welcome_text            in varchar2 default null,
    p_box_footer_text             in varchar2 default null,
    p_footer_text                 in varchar2 default null,
    p_help_text                   in varchar2 default null,
    p_step_template               in varchar2 default null,
    p_box_image                   in varchar2 default null,
    p_required_role               in varchar2 default null,
    p_required_patch              in number   default null,
    p_page_comment                in varchar2 default null)
    ;


--
-- B U T T O N S
--
procedure create_page_button (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_flow_step_id               in number   default g_page_id,
    p_button_sequence            in number   default null,
    p_button_plug_id             in number   default null,
    p_button_name                in varchar2 default null,
    p_button_static_id           in varchar2 default null,
    p_button_template_id         in number   default null,
    p_button_template_options    in varchar2 default null,
    p_button_image               in varchar2 default null,
    p_button_is_hot              in varchar2 default 'N',
    p_button_image_alt           in varchar2 default null,
    p_button_position            in varchar2 default null,
    p_button_alignment           in varchar2 default 'RIGHT',
    p_button_redirect_url        in varchar2 default null,
    p_button_action              in varchar2 default null,
    p_button_execute_validations in varchar2 default 'Y',
    p_button_condition           in varchar2 default null,
    p_button_condition2          in varchar2 default null,
    p_button_condition_type      in varchar2 default null,
    p_button_image_attributes    in varchar2 default null,
    p_button_css_classes         in varchar2 default null,
    p_icon_css_classes           in varchar2 default null,
    p_button_cattributes         in varchar2 default null,
    p_request_source             in varchar2 default null,
    p_request_source_type        in varchar2 default null,
    p_pre_element_text           in varchar2 default null,
    p_post_element_text          in varchar2 default null,
    p_grid_column_attributes     in varchar2 default null,
    p_grid_column_css_classes    in varchar2 default null,
    p_grid_new_grid              in boolean  default false,
    p_grid_new_row               in varchar2 default null,
    p_grid_new_column            in varchar2 default null,
    p_grid_column_span           in number   default null,
    p_grid_row_span              in number   default null,
    p_grid_column                in number   default null,
    p_security_scheme            in varchar2 default null,
    p_required_patch             in number   default null,
    p_button_comment             in varchar2 default null,
    --
    p_id_offset                  in number   default 0,
    p_target                     in varchar2 default 'PRIME',
    p_database_action            in varchar2 default null )
    ;

--
-- B R A N C H
--
procedure create_page_branch (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default g_page_id,
    p_branch_name               in varchar2 default null,
    p_branch_action             in varchar2 default null,
    p_branch_point              in varchar2 default null,
    p_branch_type               in varchar2 default null,
    p_branch_when_button_id     in number   default null,
    p_branch_sequence           in number   default null,
    p_branch_condition_type     in varchar2 default null,
    p_branch_condition          in varchar2 default null,
    p_branch_condition_text     in varchar2 default null,
    p_save_state_before_branch_yn in varchar2 default 'N',
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_branch_comment            in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

--
-- B R A N C H   A R G S
--
procedure create_page_branch_args (
    p_id                        in number   default null,
    p_flow_step_branch_id       in number   default null,
    p_branch_arg_sequence       in number   default null,
    p_branch_arg_source_type    in varchar2 default null,
    p_branch_arg_source         in varchar2 default null,
    p_branch_arg_comment        in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;
--
-- P A G E   I T E M S
--
procedure create_page_item (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default g_page_id,
    p_name                      in varchar2 default null,
    p_name_length               in number   default null,
    p_data_type                 in varchar2 default 'VARCHAR',
    p_is_required               in boolean  default false,
    p_standard_validations      in varchar2 default null,
    p_accept_processing         in varchar2 default 'REPLACE_EXISTING',
    p_item_sequence             in number   default null,
    p_item_plug_id              in number   default null,
    p_use_cache_before_default  in varchar2 default 'YES',
    p_item_default              in varchar2 default null,
    p_item_default_type         in varchar2 default 'STATIC_TEXT_WITH_SUBSTITUTIONS',
    p_prompt                    in varchar2 default null,
    p_placeholder               in varchar2 default null,
    p_pre_element_text          in varchar2 default null,
    p_post_element_text         in varchar2 default null,
    p_format_mask               in varchar2 default null,
    p_source                    in varchar2 default null,
    p_source_type               in varchar2 default 'ALWAYS_NULL',
    p_source_post_computation   in varchar2 default null,
    p_display_as                in varchar2 default null,
    p_named_lov                 in varchar2 default null,
    p_lov                       in varchar2 default null,
    p_lov_columns               in number   default null, -- deprecated
    p_lov_display_extra         in varchar2 default null,
    p_lov_display_null          in varchar2 default 'NO',
    p_lov_null_text             in varchar2 default null,
    p_lov_null_value            in varchar2 default null,
    p_lov_translated            in varchar2 default 'N',
    p_lov_cascade_parent_items  in varchar2 default null,
    p_ajax_items_to_submit      in varchar2 default null,
    p_ajax_optimize_refresh     in varchar2 default null,
    p_cSize                     in number   default null,
    p_cMaxlength                in number   default null,
    p_cHeight                   in number   default null,
    p_cAttributes               in varchar2 default null,
    p_cAttributes_element       in varchar2 default null,
    p_tag_css_classes           in varchar2 default null,
    p_icon_css_classes           in varchar2 default null,
    p_tag_attributes            in varchar2 default null,
    p_tag_attributes2           in varchar2 default null,
    p_new_grid                  in boolean  default false,
    p_begin_on_new_line         in varchar2 default 'Y',
    p_begin_on_new_field        in varchar2 default 'Y',
    p_colspan                   in number   default null,
    p_rowspan                   in number   default null,
    p_grid_column               in number   default null,
    p_grid_label_column_span    in number   default null,
    p_grid_column_css_classes   in varchar2 default null,
    p_button_image              in varchar2 default null,
    p_button_image_attr         in varchar2 default null,
    p_label_alignment           in varchar2 default 'LEFT',
    p_field_alignment           in varchar2 default 'LEFT',
    p_field_template            in varchar2 default null,
    p_item_css_classes          in varchar2 default null,
    p_item_template_options     in varchar2 default null,
    p_display_when              in varchar2 default null,
    p_display_when2             in varchar2 default null,
    p_display_when_type         in varchar2 default null,
    p_is_Persistent             in varchar2 default 'Y',
    p_javascript                in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_item_comment              in varchar2 default null,
    p_help_text                 in varchar2 default null,
    --
    p_read_only_when            in varchar2 default null,
    p_read_only_when2           in varchar2 default null,
    p_read_only_when_type       in varchar2 default null,
    p_read_only_disp_attr       in varchar2 default null,
    --
    p_protection_level          in varchar  default 'N',
    p_escape_on_http_input      in varchar2 default null,
    p_escape_on_http_output     in varchar2 default 'Y',
    p_restricted_characters     in varchar2 default null,
    --
    p_encrypt_session_state_yn  in varchar2 default 'N',
    --
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    --
    p_show_quick_picks          in varchar2 default 'N',
    p_quick_pick_label_01       in varchar2 default null,
    p_quick_pick_value_01       in varchar2 default null,
    p_quick_pick_label_02       in varchar2 default null,
    p_quick_pick_value_02       in varchar2 default null,
    p_quick_pick_label_03       in varchar2 default null,
    p_quick_pick_value_03       in varchar2 default null,
    p_quick_pick_label_04       in varchar2 default null,
    p_quick_pick_value_04       in varchar2 default null,
    p_quick_pick_label_05       in varchar2 default null,
    p_quick_pick_value_05       in varchar2 default null,
    p_quick_pick_label_06       in varchar2 default null,
    p_quick_pick_value_06       in varchar2 default null,
    p_quick_pick_label_07       in varchar2 default null,
    p_quick_pick_value_07       in varchar2 default null,
    p_quick_pick_label_08       in varchar2 default null,
    p_quick_pick_value_08       in varchar2 default null,
    p_quick_pick_label_09       in varchar2 default null,
    p_quick_pick_value_09       in varchar2 default null,
    p_quick_pick_label_10       in varchar2 default null,
    p_quick_pick_value_10       in varchar2 default null,
    p_quick_pick_link_attr      in varchar2 default null,
    --
    p_reference_id              in number   default null,
    --
    p_button_execute_validations in varchar2 default 'Y',
    p_button_action              in varchar2 default null,
    p_button_redirect_url        in varchar2 default null,
    p_button_is_hot              in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME' )
    ;

--
-- P A G E   C O M P U T A T I O N S
--
procedure create_page_computation (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default g_page_id,
    p_computation_sequence      in number   default null,
    p_computation_item          in varchar2 default null,
    p_computation_point         in varchar2 default 'AFTER_SUBMIT',
    p_computation_item_type     in varchar2 default null,
    p_computation_type          in varchar2 default 'SQL_EXPRESSION',
    p_computation_processed     in varchar2 default 'REPLACE_EXISTING',
    p_computation               in varchar2 default null,
    p_computation_comment       in varchar2 default null,
    p_compute_when              in varchar2 default null,
    p_compute_when_type         in varchar2 default null,
    p_computation_error_message in varchar2 default null,
    p_compute_when_text         in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

--
-- P A G E   V A L I D A T I O N S
--
procedure create_page_validation (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default g_page_id,
    p_tabular_form_region_id    in number   default null,
    p_validation_name           in varchar2 default null,
    p_validation_sequence       in number   default null,
    p_validation                in varchar2 default null,
    p_validation2               in varchar2 default null,
    p_validation_type           in varchar2 default null,
    p_error_message             in varchar2 default null,
    p_always_execute            in varchar2 default 'N',
    p_validation_condition      in varchar2 default null,
    p_validation_condition2     in varchar2 default null,
    p_validation_condition_type in varchar2 default null,
    p_exec_cond_for_each_row    in varchar2 default null,
    p_only_for_changed_rows     in varchar2 default null,
    p_when_button_pressed       in varchar2 default null,
    p_associated_item           in number   default null,
    p_associated_column         in varchar2 default null,
    p_error_display_location    in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_validation_comment        in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;


---------------------------------
-- D Y N A M I C    A C T I O N S
--
procedure create_page_da_event (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default g_page_id,
    p_name                      in varchar2,
    p_event_sequence            in number,
    p_triggering_element_type   in varchar2 default null,
    p_triggering_region_id      in number   default null,
    p_triggering_button_id      in number   default null,
    p_triggering_element        in varchar2 default null,
    p_condition_page_item       in varchar2 default null,
    p_triggering_condition_type in varchar2 default null,
    p_triggering_expression     in varchar2 default null,
    p_bind_type                 in varchar2,
    p_bind_delegate_to_selector in varchar2 default null,
    p_bind_event_type           in varchar2,
    p_bind_event_type_custom    in varchar2 default null,
    p_bind_event_data           in varchar2 default null,
    p_display_when_type         in varchar2 default null,
    p_display_when_cond         in varchar2 default null,
    p_display_when_cond2        in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_da_event_comment          in varchar2 default null )
    ;

procedure create_page_da_action (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default g_page_id,
    p_event_id                  in number,
    p_event_result              in varchar2,
    p_action_sequence           in number,
    p_execute_on_page_init      in varchar2,
    p_stop_execution_on_error   in varchar2 default 'Y',
    p_wait_for_result           in varchar2 default null,
    p_action                    in varchar2,
    p_affected_elements_type    in varchar2 default null,
    p_affected_region_id        in number   default null,
    p_affected_button_id        in number   default null,
    p_affected_elements         in varchar2 default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_da_action_comment         in varchar2 default null )
    ;

------------------------------
-- P A G E   P R O C E S S E S
--
procedure create_page_process (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default g_page_id,
    p_process_sequence          in number   default null,
    p_process_point             in varchar2,
    p_process_type              in varchar2 default 'PLSQL',
    p_process_name              in varchar2 default null,
    p_region_id                 in number   default null,
    p_process_sql               in varchar2 default null,
    p_process_sql_clob          in varchar2 default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_process_error_message     in varchar2 default null,
    p_error_display_location    in varchar2 default 'ON_ERROR_PAGE',
    p_process_when_button_id    in number   default null,
    p_process_when              in varchar2 default null,
    p_process_when_type         in varchar2 default null,
    p_process_when2             in varchar2 default null,
    p_exec_cond_for_each_row    in varchar2 default 'N',
    p_only_for_changed_rows     in varchar2 default 'Y',
    p_process_when_type2        in varchar2 default null,
    p_process_success_message   in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_process_is_stateful_y_n   in varchar2 default 'N',
    p_return_key_into_item1     in varchar2 default null,
    p_return_key_into_item2     in varchar2 default null,
    p_process_item_name         in varchar2 default null,
    p_process_comment           in varchar2 default null,
    p_runtime_where_clause      in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure set_page_process_source (
    p_id                        in number default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default g_page_id,
    p_process_sql_clob          in varchar2 default null)
    ;

------------------------------------------------------------
-- T H E M E S
--

procedure create_theme(
    p_id                            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_theme_id                      in number default null,
    p_theme_name                    in varchar2,
    p_ui_type_name                  in varchar2 default 'DESKTOP',
    p_navigation_type               in varchar2 default 'T',
    p_nav_bar_type                  in varchar2 default 'NAVBAR',
    p_reference_id                  in number   default null,
    p_is_locked                     in boolean  default false,
    p_default_page_template         in number default null,
    p_default_dialog_template       in number default null,
    p_error_template                in number default null,
    p_printer_friendly_template     in number default null,
    p_breadcrumb_display_point      in varchar2 default null,
    p_sidebar_display_point         in varchar2 default null,
    p_login_template                in number default null,
    p_default_button_template       in number default null,
    p_default_region_template       in number default null,
    p_default_chart_template        in number default null,
    p_default_form_template         in number default null,
    p_default_reportr_template      in number default null,
    p_default_tabform_template      in number default null,
    p_default_wizard_template       in number default null,
    p_default_menur_template        in number default null,
    p_default_listr_template        in number default null,
    p_default_irr_template          in number default null,
    p_default_report_template       in number default null,
    p_default_label_template        in number default null,
    p_default_menu_template         in number default null,
    p_default_calendar_template     in number default null,
    p_default_list_template         in number default null,
    p_default_nav_list_template     in number default null,
    p_default_top_nav_list_temp     in number default null,
    p_default_side_nav_list_temp    in number default null,
    p_default_nav_list_position     in varchar2 default null,
    p_default_option_label          in number default null,
    p_default_required_label        in number default null,
    p_default_page_transition       in varchar2 default 'NONE',
    p_default_popup_transition      in varchar2 default 'NONE',
    p_default_navbar_list_template  in number default null,
    p_default_dialogr_template      in number default null,
    p_default_dialogbtnr_template   in number default null,
    p_calendar_icon                 in varchar2 default null,
    p_calendar_icon_attr            in varchar2 default null,
    p_custom_icon_classes           in varchar2 default null,
    p_custom_icon_prefix_class      in varchar2 default null,
    p_custom_library_file_urls      in varchar2 default null,
    p_icon_library                  in varchar2 default null,
    p_javascript_file_urls          in varchar2 default null,
    p_css_file_urls                 in varchar2 default null,
    p_mobile_login_template         in number default null,
    p_mobile_page_template          in number default null,
    p_mobile_region_template        in number default null,
    p_mobile_list_template          in number default null,
    p_mobile_report_template        in number default null,
    p_mobile_calendar_template      in number default null,
    p_mobile_button_template        in number default null,
    p_mobile_required_label         in number default null,
    p_mobile_optional_label         in number default null,
    p_default_header_template       in number default null,
    p_default_footer_template       in number default null,
    p_theme_description             in varchar2 default null,
    p_file_prefix                   in varchar2 default null,
    p_files_version                 in number   default 1);

procedure create_theme_image (
    p_id                          in number default null,
    p_flow_id                     in number default wwv_flow.g_flow_id,
    p_theme_id                    in number default null,
    p_varchar2_table              in sys.dbms_sql.varchar2_table default empty_varchar2_table,
    p_mimetype                    in varchar2 default null);

procedure delete_theme(
    p_flow_id       in number default wwv_flow.g_flow_id,
    p_theme_id      in number default null,
    p_import        in varchar2 default null);

procedure set_theme_calendar_icon (
    p_id            in number default null,
    p_flow_id       in number default wwv_flow.g_flow_id,
    p_calendar_icon in varchar2 default null,
    p_calendar_icon_attr in varchar2 default null);

procedure create_theme_style (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_theme_id                      in number,
    p_name                          in varchar2,
    p_css_file_urls                 in varchar2 default null,
    p_is_current                    in boolean,
    p_theme_roller_input_file_urls  in varchar2 default null,
    p_theme_roller_config           in clob     default null,
    p_theme_roller_output_file_url  in varchar2 default null,
    p_theme_roller_read_only        in boolean  default false,
    p_reference_id                  in number   default null,
    p_component_comment             in varchar2 default null );

procedure create_theme_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_theme_id     in number,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob,
    p_reference_id in number   default null );

procedure create_theme_display_point (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_theme_id               in number,
    p_name                   in varchar2,
    p_placeholder            in varchar2,
    p_has_grid_support       in boolean,
    p_max_fixed_grid_columns in number   default null,
    p_reference_id           in number   default null,
    p_component_comment      in varchar2 default null );

procedure create_template_opt_group (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_theme_id                  in number,
    p_name                      in varchar2,
    p_display_name              in varchar2,
    p_display_sequence          in varchar2,
    p_template_types            in varchar2 default null,
    p_help_text                 in varchar2 default null,
    p_null_text                 in varchar2 default null,
    p_is_advanced               in varchar2,
    p_reference_id              in number default null);

procedure create_template_option (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_theme_id                  in number,
    p_name                      in varchar2,
    p_display_name              in varchar2,
    p_display_sequence          in varchar2,
    p_page_template_id          in number   default null,
    p_region_template_id        in number   default null,
    p_report_template_id        in number   default null,
    p_breadcrumb_template_id    in number   default null,
    p_list_template_id          in number   default null,
    p_field_template_id         in number   default null,
    p_button_template_id        in number   default null,
    p_css_classes               in varchar2,
    p_group_id                  in number   default null,
    p_template_types            in varchar2 default null,
    p_help_text                 in varchar2 default null,
    p_is_advanced               in varchar2 default null,
    p_reference_id              in number default null);

------------------------------------------------------------
-- T E M P L A T E S
--
-- page template
--

procedure create_template (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_look                      in number   default null,
    p_is_popup                  in boolean  default false,
    p_javascript_file_urls      in varchar2 default null,
    p_javascript_code           in varchar2 default null,
    p_javascript_code_onload    in varchar2 default null,
    p_css_file_urls             in varchar2 default null,
    p_inline_css                in varchar2 default null,
    p_header_template           in varchar2 default null,
    p_footer_template           in varchar2 default null,
    p_success_message           in varchar2 default null,
    --
    p_current_tab               in varchar2 default null,
    p_current_tab_font_attr     in varchar2 default null,
    p_non_current_tab           in varchar2 default null,
    p_non_current_tab_font_attr in varchar2 default null,
    --
    p_current_image_tab         in varchar2 default null,
    p_non_current_image_tab     in varchar2 default null,
    --
    p_top_current_tab            in varchar2 default null,
    p_top_current_tab_font_attr  in varchar2 default null,
    p_top_non_curr_tab           in varchar2 default null,
    p_top_non_curr_tab_font_attr in varchar2 default null,
    --
    p_box                       in varchar2 default null,
    p_navigation_bar            in varchar2 default null,
    p_navbar_entry              in varchar2 default null,
    p_body_title                in varchar2 default null,
    p_notification_message      in varchar2 default null,
    p_attribute1                in varchar2 default null,
    p_attribute2                in varchar2 default null,
    p_attribute3                in varchar2 default null,
    p_attribute4                in varchar2 default null,
    p_attribute5                in varchar2 default null,
    p_attribute6                in varchar2 default null,
    --
    p_table_bgcolor             in varchar2 default null,
    p_heading_bgcolor           in varchar2 default null,
    p_table_cattributes         in varchar2 default null,
    p_font_size                 in varchar2 default null,
    p_font_face                 in varchar2 default null,
    --
    p_region_table_cattributes  in varchar2 default null,
    --
    p_app_tab_before_tabs       in varchar2 default null,
    p_app_tab_current_tab       in varchar2 default null,
    p_app_tab_non_current_tab   in varchar2 default null,
    p_app_tab_after_tabs        in varchar2 default null,
    --
    p_error_page_template       in varchar2 default null,
    --
    p_default_button_position   in varchar2 default null,
    p_required_patch            in number   default null,
    p_reference_id              in number   default null,
    p_translate_this_template   in varchar2 default 'N',
    p_mobile_page_template      in varchar2 default 'N', /* obsolete */
    p_template_comment          in varchar2 default null,
    p_breadcrumb_def_reg_pos    in varchar2 default null,
    p_sidebar_def_reg_pos       in varchar2 default null,
    --
    p_grid_type                      in varchar2 default 'TABLE',
    p_grid_max_columns               in number   default null,
    p_grid_always_use_max_columns    in boolean  default null,
    p_grid_has_column_span           in boolean  default null,
    p_grid_always_emit               in boolean  default null,
    p_grid_emit_empty_leading_cols   in boolean  default null,
    p_grid_emit_empty_trail_cols     in boolean  default null,
    p_grid_default_label_col_span    in number   default null,
    p_grid_template                  in varchar2 default null,
    p_grid_row_template              in varchar2 default null,
    p_grid_column_template           in varchar2 default null,
    p_grid_first_column_attributes   in varchar2 default null,
    p_grid_last_column_attributes    in varchar2 default null,
    p_grid_javascript_debug_code     in varchar2 default null,
    --
    p_dialog_js_init_code            in varchar2 default null,
    p_dialog_js_close_code           in varchar2 default null,
    p_dialog_js_cancel_code          in varchar2 default null,
    p_dialog_height                  in varchar2 default null,
    p_dialog_width                   in varchar2 default null,
    p_dialog_max_width               in varchar2 default null,
    p_dialog_css_classes             in varchar2 default null,
    p_dialog_browser_frame           in varchar2 default null,
    --
    p_has_edit_links                 in boolean  default true, /* Deprecated */
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME',
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options  in varchar2 default null)
    ;

procedure create_page_tmpl_display_point (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_page_template_id       in number,
    p_name                   in varchar2,
    p_placeholder            in varchar2,
    p_has_grid_support       in boolean,
    p_glv_new_row            in boolean  default true,
    p_max_fixed_grid_columns in number   default null,
    p_component_comment      in varchar2 default null );

procedure create_button_templates (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_template_name                 in varchar2 default null,
    p_template                      in clob     default null,
    p_hot_template                  in clob     default null,
    p_translate_this_template       in varchar2 default 'N',
    p_template_comment              in varchar2 default null,
    p_reference_id                  in number   default null,
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME',
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options  in varchar2 default null)
    ;

procedure create_plug_template (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_page_plug_template_name     in varchar2 default null,
    p_layout                      in varchar2 default 'TABLE',
    p_render_form_items_in_table  in varchar2 default null,  /* obsolete */
    p_template                    in varchar2 default null,
    p_template2                   in varchar2 default null,
    p_template3                   in varchar2 default null,
    p_sub_plug_header_template    in varchar2 default null,
    p_sub_plug_header_entry_templ in varchar2 default null,
    p_sub_plug_template           in varchar2 default null,
    p_plug_table_bgcolor          in varchar2 default null,
    p_plug_heading_bgcolor        in varchar2 default null,
    p_plug_font_size              in varchar2 default null,
    p_default_field_template_id   in number   default null,
    p_default_req_field_templ_id  in number   default null,
    p_default_label_alignment     in varchar2 default 'RIGHT',
    p_default_field_alignment     in varchar2 default 'LEFT',
    p_default_button_template_id  in number   default null,
    p_default_button_position     in varchar2 default null,
    p_reference_id                in number   default null,
    p_form_table_attr             in varchar2 default null,
    p_translate_this_template     in varchar2 default 'N',
    p_template_comment            in varchar2 default null,
    p_id_offset                   in number   default 0,
    p_target                      in varchar2 default 'PRIME',
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options  in varchar2 default null)
    ;

procedure set_plug_template_tab_attr (
    -- provides compatability with version 1.0.0
    p_id                            in number   default null,
    p_form_table_attr               in varchar2 default null,
    p_target                        in varchar2 default 'PRIME')
    ;

procedure create_plug_tmpl_display_point (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_plug_template_id       in number,
    p_name                   in varchar2,
    p_placeholder            in varchar2,
    p_has_grid_support       in boolean,
    p_glv_new_row            in boolean  default true,
    p_max_fixed_grid_columns in number   default null,
    p_component_comment      in varchar2 default null );

procedure create_list_template (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_list_template_name            in varchar2 default null,
    p_javascript_file_urls          in varchar2 default null,
    p_javascript_code_onload        in varchar2 default null,
    p_css_file_urls                 in varchar2 default null,
    p_inline_css                    in varchar2 default null,
    p_list_template_current         in varchar2 default null,
    p_list_template_noncurrent      in varchar2 default null,
    p_list_template_before_rows     in varchar2 default null,
    p_list_template_after_rows      in varchar2 default null,
    p_between_items                 in varchar2 default null,
    p_before_sub_list               in varchar2 default null,
    p_after_sub_list                in varchar2 default null,
    p_between_sub_list_items        in varchar2 default null,
    p_sub_list_item_current         in clob     default null,
    p_sub_list_item_noncurrent      in clob     default null,
    p_item_templ_curr_w_child       in clob     default null,
    p_item_templ_noncurr_w_child    in clob     default null,
    p_sub_templ_curr_w_child        in clob     default null,
    p_sub_templ_noncurr_w_child     in clob     default null,
    -- apex 4.0 mike
    p_f_list_template_noncurrent    in clob     default null,
    p_f_list_template_current       in clob     default null,
    p_f_item_template_curr_w_child  in clob     default null,
    p_fi_template_noncurr_w_child   in clob     default null,
    --
    p_reference_id                  in number   default null,
    p_translate_this_template       in varchar2 default 'N',
    p_list_template_comment         in varchar2 default null,
    --
    p_a01_label                     in varchar2 default null,
    p_a02_label                     in varchar2 default null,
    p_a03_label                     in varchar2 default null,
    p_a04_label                     in varchar2 default null,
    p_a05_label                     in varchar2 default null,
    p_a06_label                     in varchar2 default null,
    p_a07_label                     in varchar2 default null,
    p_a08_label                     in varchar2 default null,
    p_a09_label                     in varchar2 default null,
    p_a10_label                     in varchar2 default null,
    p_a11_label                     in varchar2 default null,
    p_a12_label                     in varchar2 default null,
    p_a13_label                     in varchar2 default null,
    p_a14_label                     in varchar2 default null,
    p_a15_label                     in varchar2 default null,
    p_a16_label                     in varchar2 default null,
    p_a17_label                     in varchar2 default null,
    p_a18_label                     in varchar2 default null,
    p_a19_label                     in varchar2 default null,
    p_a20_label                     in varchar2 default null,
    --
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME',
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options  in varchar2 default null)
    ;

procedure create_row_template (
    --
    -- Create a report template which defines HTML
    -- template control over report rows
    --
    p_id                            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_row_template_name             in varchar2 default null,
    p_row_template_type             in varchar2 default null,
    p_before_column_heading         in varchar2 default null, -- new 3.1
    p_column_heading_template       in varchar2 default null,
    p_column_heading_sort_asc_temp  in varchar2 default null,
    p_column_heading_sort_desc_tem  in varchar2 default null,
    p_column_heading_sort_temp      in varchar2 default null,
    p_after_column_heading          in varchar2 default null, -- new 3.1
    p_row_template1                 in varchar2 default null,
    p_row_template_condition1       in varchar2 default null,
    p_row_template_display_cond1    in varchar2 default null,
    p_row_template2                 in varchar2 default null,
    p_row_template_condition2       in varchar2 default null,
    p_row_template_display_cond2    in varchar2 default null,
    p_row_template3                 in varchar2 default null,
    p_row_template_condition3       in varchar2 default null,
    p_row_template_display_cond3    in varchar2 default null,
    p_row_template4                 in varchar2 default null,
    p_row_template_condition4       in varchar2 default null,
    p_row_template_display_cond4    in varchar2 default null,
    p_row_template_before_rows      in varchar2 default null,
    p_row_template_after_rows       in varchar2 default null,
    p_row_template_before_first     in varchar2 default null,
    p_row_template_after_last       in varchar2 default null,
    p_row_template_table_attr       in varchar2 default null,
    p_reference_id                  in number   default null,
    --
    p_pagination_template           in varchar2 default null,
    p_next_page_template            in varchar2 default null,
    p_previous_page_template        in varchar2 default null,
    p_next_set_template             in varchar2 default null,
    p_previous_set_template         in varchar2 default null,
    --
    p_row_style_mouse_over          in varchar2 default null,
    p_row_style_mouse_out           in varchar2 default null,
    p_row_style_checked             in varchar2 default null,
    p_row_style_unchecked           in varchar2 default null,
    --
    p_translate_this_template       in varchar2 default 'N',
    p_row_template_comment          in varchar2 default null,
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME',
    --
    p_theme_id                      in number   default null,
    p_theme_class_id                in number   default null,
    p_default_template_options      in varchar2 default null,
    p_preset_template_options       in varchar2 default null)
    ;

procedure create_row_template_patch (
    --
    -- This procedure extendes the create_row_template
    -- procedure.  It allows for compatability with version
    -- 1.0.0.
    --
    p_id                            in number,
    p_row_template_before_first     in varchar2 default null,
    p_row_template_after_last       in varchar2 default null,
    p_target                        in varchar2 default 'PRIME')
    ;

procedure create_field_template (
    --
    -- Create a field template which defines the display
    -- of a form field, for example a form page item label.
    -- Page lables do not require the use of a field template,
    -- the use of field templates is optional.
    -- Field templates are defined at the flow level and shared
    -- to all pages within a flow.
    --
    p_id                            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_template_name                 in varchar2 default null,
    p_template_body1                in varchar2 default null,
    p_template_body2                in varchar2 default null,
    p_before_item                   in varchar2 default null,
    p_after_item                    in varchar2 default null,
    p_before_element                in varchar2 default null,
    p_after_element                 in varchar2 default null,
    p_help_link                     in varchar2 default null,
    p_error_template                in varchar2 default null,
    p_on_error_before_label         in varchar2 default null,
    p_on_error_after_label          in varchar2 default null,
    p_reference_id                  in number   default null,
    p_translate_this_template       in varchar2 default 'N',
    p_template_comment              in varchar2 default null,
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME',
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options   in varchar2 default null)
    ;

procedure create_calendar_template (
    -- creates a calendar template
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_cal_template_name               in varchar2 default null,
    p_translate_this_template         in varchar2 default 'N',
    p_month_title_format              in varchar2 default null,
    p_day_of_week_format              in varchar2 default null,
    p_month_open_format               in varchar2 default null,
    p_month_close_format              in varchar2 default null,
    p_day_title_format                in varchar2 default null,
    p_day_open_format                 in varchar2 default null,
    p_day_close_format                in varchar2 default null,
    p_today_open_format               in varchar2 default null,
    p_weekend_title_format            in varchar2 default null,
    p_weekend_open_format             in varchar2 default null,
    p_weekend_close_format            in varchar2 default null,
    p_nonday_title_format             in varchar2 default null,
    p_nonday_open_format              in varchar2 default null,
    p_nonday_close_format             in varchar2 default null,
    p_week_title_format               in varchar2 default null,
    p_week_open_format                in varchar2 default null,
    p_week_close_format               in varchar2 default null,
    p_daily_title_format              in varchar2 default null,
    p_daily_open_format               in varchar2 default null,
    p_daily_close_format              in varchar2 default null,
    p_weekly_title_format             in varchar2 default null,
    p_weekly_day_of_week_format       in varchar2 default null,
    p_weekly_month_open_format        in varchar2 default null,
    p_weekly_month_close_format       in varchar2 default null,
    p_weekly_day_title_format         in varchar2 default null,
    p_weekly_day_open_format          in varchar2 default null,
    p_weekly_day_close_format         in varchar2 default null,
    p_weekly_today_open_format        in varchar2 default null,
    p_weekly_weekend_title_format     in varchar2 default null,
    p_weekly_weekend_open_format      in varchar2 default null,
    p_weekly_weekend_close_format     in varchar2 default null,
    p_weekly_time_open_format         in varchar2 default null,
    p_weekly_time_close_format        in varchar2 default null,
    p_weekly_time_title_format        in varchar2 default null,
    p_weekly_hour_open_format         in varchar2 default null,
    p_weekly_hour_close_format        in varchar2 default null,
    p_daily_day_of_week_format        in varchar2 default null,
    p_daily_month_title_format        in varchar2 default null,
    p_daily_month_open_format         in varchar2 default null,
    p_daily_month_close_format        in varchar2 default null,
    p_daily_day_title_format          in varchar2 default null,
    p_daily_day_open_format           in varchar2 default null,
    p_daily_day_close_format          in varchar2 default null,
    p_daily_today_open_format         in varchar2 default null,
    p_daily_time_open_format          in varchar2 default null,
    p_daily_time_close_format         in varchar2 default null,
    p_daily_time_title_format         in varchar2 default null,
    p_daily_hour_open_format          in varchar2 default null,
    p_daily_hour_close_format         in varchar2 default null,
    p_cust_month_title_format         in varchar2 default null,
    p_cust_day_of_week_format         in varchar2 default null,
    p_cust_month_open_format          in varchar2 default null,
    p_cust_month_close_format         in varchar2 default null,
    p_cust_week_title_format          in varchar2 default null,
    p_cust_week_open_format           in varchar2 default null,
    p_cust_week_close_format          in varchar2 default null,
    p_cust_day_title_format           in varchar2 default null,
    p_cust_day_open_format            in varchar2 default null,
    p_cust_day_close_format           in varchar2 default null,
    p_cust_today_open_format          in varchar2 default null,
    p_cust_daily_title_format         in varchar2 default null,
    p_cust_daily_open_format          in varchar2 default null,
    p_cust_daily_close_format         in varchar2 default null,
    p_cust_nonday_title_format        in varchar2 default null,
    p_cust_nonday_open_format         in varchar2 default null,
    p_cust_nonday_close_format        in varchar2 default null,
    p_cust_weekend_title_format       in varchar2 default null,
    p_cust_weekend_open_format        in varchar2 default null,
    p_cust_weekend_close_format       in varchar2 default null,
    p_cust_hour_open_format           in varchar2 default null,
    p_cust_hour_close_format          in varchar2 default null,
    p_cust_time_title_format          in varchar2 default null,
    p_cust_time_open_format           in varchar2 default null,
    p_cust_time_close_format          in varchar2 default null,
    p_cust_wk_month_title_format      in varchar2 default null,
    p_cust_wk_day_of_week_format      in varchar2 default null,
    p_cust_wk_month_open_format       in varchar2 default null,
    p_cust_wk_month_close_format      in varchar2 default null,
    p_cust_wk_week_title_format       in varchar2 default null,
    p_cust_wk_week_open_format        in varchar2 default null,
    p_cust_wk_week_close_format       in varchar2 default null,
    p_cust_wk_day_title_format        in varchar2 default null,
    p_cust_wk_day_open_format         in varchar2 default null,
    p_cust_wk_day_close_format        in varchar2 default null,
    p_cust_wk_today_open_format       in varchar2 default null,
    p_cust_wk_weekend_title_format    in varchar2 default null,
    p_cust_wk_weekend_open_format     in varchar2 default null,
    p_cust_wk_weekend_close_format    in varchar2 default null,
    p_cust_month_day_height_pix       in varchar2 default null,
    p_cust_month_day_height_per       in varchar2 default null,
    p_cust_week_day_width_pix         in varchar2 default null,
    p_cust_week_day_width_per         in varchar2 default null,
    p_agenda_format                   in varchar2 default null,
    p_agenda_past_day_format          in varchar2 default null,
    p_agenda_today_day_format         in varchar2 default null,
    p_agenda_future_day_format        in varchar2 default null,
    p_agenda_past_entry_format        in varchar2 default null,
    p_agenda_today_entry_format       in varchar2 default null,
    p_agenda_future_entry_format      in varchar2 default null,
    p_month_data_format               in varchar2 default null,
    p_month_data_entry_format         in varchar2 default null,
    p_reference_id                    in number   default null,
    p_id_offset                       in number   default 0,
    p_target                          in varchar2 default 'PRIME',
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null)
    ;

procedure create_report_layout (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_report_layout_name            in varchar2 default null,
    p_report_layout_type            in varchar2 default null,
    p_page_template                 in varchar2 default null,
    p_varchar2_table                in sys.dbms_sql.varchar2_table default empty_varchar2_table,
    p_xslfo_column_heading          in varchar2 default null,
    p_xslfo_column_template         in varchar2 default null,
    p_xslfo_column_template_width   in varchar2 default null,
    p_reference_id                  in number   default null,
    p_report_layout_comment         in varchar2 default null)
    ;

procedure create_shared_query (
    --
    -- For high fidelity printing with custom/uploaded templates
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_query_text                in varchar2 default null,
    p_xml_structure             in varchar2 default null,
    p_report_layout_id          in number   default null,
    p_format                    in varchar2 default null,
    p_format_item               in varchar2 default null,
    p_output_file_name          in varchar2 default null,
    p_content_disposition       in varchar2 default null,
    p_document_header           in varchar2 default null,
    p_xml_items                 in varchar2 default null)
    ;

procedure create_shared_query_stmnt (
    --
    -- For high fidelity printing with custom/uploaded templates
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_shared_query_id           in varchar2 default null,
    p_sql_statement             in varchar2 default null)
    ;

--
-- R E G I O N S  (PLUGS)
--

procedure create_page_plug (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default g_page_id,
    p_plug_name                     in varchar2 default null,
    p_region_name                   in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_template                 in number   default null,
    p_plug_display_sequence         in varchar2 default null,
    p_include_in_reg_disp_sel_yn    in varchar2 default 'N',
    p_region_css_classes            in varchar2 default null,
    p_icon_css_classes              in varchar2 default null,
    p_region_sub_css_classes        in varchar2 default null,
    p_region_template_options       in varchar2 default null,
    p_component_template_options    in varchar2 default null,
    p_region_attributes             in varchar2 default null,
    p_report_attributes             in varchar2 default null,
    p_escape_on_http_output         in varchar2 default 'N',
    p_plug_new_grid                 in boolean  default false,
    p_plug_new_grid_row             in boolean  default true,
    p_plug_new_grid_column          in boolean  default true,
    p_plug_grid_column_span         in number   default null,
    p_plug_grid_column_css_classes  in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_display_point            in varchar2 default null,
    p_plug_item_display_point       in varchar2 default 'ABOVE',
    p_plug_source                   in varchar2 default null,
    p_plug_source_type              in varchar2 default 'NATIVE_STATIC',
    p_list_id                       in number   default null,
    p_menu_id                       in number   default null,
    p_plug_display_error_message    in varchar2 default null, /* obsolete */
    p_plug_create_link_text         in varchar2 default null,
    p_plug_create_link_target       in varchar2 default null,
    p_plug_create_image             in varchar2 default null,
    p_plug_create_image_attributes  in varchar2 default null,
    p_plug_edit_link_text           in varchar2 default null,
    p_plug_edit_link_target         in varchar2 default null,
    p_plug_edit_image               in varchar2 default null,
    p_plug_edit_image_attributes    in varchar2 default null,
    p_plug_expand_link_text         in varchar2 default null,
    p_plug_expand_link_target       in varchar2 default null,
    p_plug_expand_image             in varchar2 default null,
    p_plug_expand_image_attributes  in varchar2 default null,
    p_plug_close_link_text          in varchar2 default null,
    p_plug_close_link_target        in varchar2 default null,
    p_plug_close_image              in varchar2 default null,
    p_plug_close_image_attributes   in varchar2 default null,
    p_plug_required_role            in varchar2 default null,
    p_plug_display_when_condition   in varchar2 default null,
    p_plug_display_when_cond2       in varchar2 default null,
    p_plug_display_condition_type   in varchar2 default null,
    --
    p_plug_read_only_when_type      in varchar2 default null,
    p_plug_read_only_when           in varchar2 default null,
    p_plug_read_only_when2          in varchar2 default null,
    --
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    p_plug_override_reg_pos         in varchar2 default null,
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    p_translate_title               in varchar2 default 'Y',
    p_ajax_enabled                  in varchar2 default null,
    p_ajax_items_to_submit          in varchar2 default null,
    p_rest_enabled                  in varchar2 default 'N',
    --
    p_region_image                  in varchar2 default null, -- mike 4.0 create_page_plug
    p_region_image_attr             in varchar2 default null,
    --
    p_plug_query_row_template       in number   default null,
    p_plug_query_max_columns        in number   default null,
    p_plug_query_headings           in varchar2 default null,
    p_plug_query_headings_type      in varchar2 default 'COLON_DELMITED_LIST',
    p_plug_query_num_rows           in number   default null,
    p_plug_query_hit_highlighting   in varchar2 default null,
    p_plug_query_options            in varchar2 default null,
    p_plug_query_format_out         in varchar2 default null,
    p_plug_query_show_nulls_as      in varchar2 default null,
    p_plug_query_col_allignments    in varchar2 default null,
    p_plug_query_break_cols         in varchar2 default null,
    p_plug_query_sum_cols           in varchar2 default null,
    p_plug_query_number_formats     in varchar2 default null,
    p_plug_query_table_border       in varchar2 default null,
    p_plug_column_width             in varchar2 default null,
    p_plug_query_no_data_found      in varchar2 default null,
    p_plug_query_more_data          in varchar2 default null,
    p_plug_ignore_pagination        in number   default null,
    p_plug_query_num_rows_item      in varchar2 default null,
    p_plug_query_num_rows_type      in varchar2 default null,
    p_plug_query_row_count_max      in number   default null,
    p_plug_query_asc_image          in varchar2 default null,
    p_plug_query_asc_image_attr     in varchar2 default null,
    p_plug_query_desc_image         in varchar2 default null,
    p_plug_query_desc_image_attr    in varchar2 default null,
    --
    p_plug_query_exp_filename       in varchar2 default null,
    p_plug_query_exp_separator      in varchar2 default null,
    p_plug_query_exp_enclosed_by    in varchar2 default null,
    p_plug_query_strip_html         in varchar2 default null,
    p_plug_query_parse_override     in varchar2 default null,
    --
    p_pagination_display_position   in varchar2 default null,
    p_report_total_text_format      in varchar2 default null,
    p_break_column_text_format      in varchar2 default null,
    p_break_before_row              in varchar2 default null,
    p_break_generic_column          in varchar2 default null,
    p_break_after_row               in varchar2 default null,
    p_break_type_flag               in varchar2 default null,
    p_break_repeat_heading_format   in varchar2 default null,
    p_csv_output                    in varchar2 default null,
    p_csv_output_link_text          in varchar2 default null,
    p_print_url                     in varchar2 default null,
    p_print_url_label               in varchar2 default null,
    --
    p_prn_output                    in varchar2 default null,
    p_prn_print_server_overwrite    in varchar2 default null,
    p_prn_template_id               in number   default null,
    p_prn_format                    in varchar2 default null,
    p_prn_format_item               in varchar2 default null,
    p_prn_output_show_link          in varchar2 default null,
    p_prn_output_link_text          in varchar2 default null,
    p_prn_output_file_name          in varchar2 default null,
    p_prn_content_disposition       in varchar2 default null,
    p_prn_document_header           in varchar2 default null,
    p_prn_units                     in varchar2 default null,
    p_prn_paper_size                in varchar2 default null,
    p_prn_width_units               in varchar2 default null,
    p_prn_width                     in number   default null,
    p_prn_height                    in number   default null,
    p_prn_orientation               in varchar2 default null,
    p_prn_page_header               in varchar2 default null,
    p_prn_page_header_font_color    in varchar2 default null,
    p_prn_page_header_font_family   in varchar2 default null,
    p_prn_page_header_font_weight   in varchar2 default null,
    p_prn_page_header_font_size     in varchar2 default null,
    p_prn_page_footer               in varchar2 default null,
    p_prn_page_footer_font_color    in varchar2 default null,
    p_prn_page_footer_font_family   in varchar2 default null,
    p_prn_page_footer_font_weight   in varchar2 default null,
    p_prn_page_footer_font_size     in varchar2 default null,
    p_prn_header_bg_color           in varchar2 default null,
    p_prn_header_font_color         in varchar2 default null,
    p_prn_header_font_family        in varchar2 default null,
    p_prn_header_font_weight        in varchar2 default null,
    p_prn_header_font_size          in varchar2 default null,
    p_prn_body_bg_color             in varchar2 default null,
    p_prn_body_font_color           in varchar2 default null,
    p_prn_body_font_family          in varchar2 default null,
    p_prn_body_font_weight          in varchar2 default null,
    p_prn_body_font_size            in varchar2 default null,
    p_prn_border_width              in number   default null,
    --
    p_shared_query_id               in number   default null,
    --
    p_plug_url_text_begin           in varchar2 default null,
    p_plug_url_text_end             in varchar2 default null,
    p_java_entry_point              in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default 'NOCACHE',
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    p_plug_cache_when_cond_type     in varchar2 default null,
    p_plug_cache_when_condition_e1  in varchar2 default null,
    p_plug_cache_when_condition_e2  in varchar2 default null,
    p_plug_cache_depends_on_items   in varchar2 default null,
    --
    p_plug_chart_font_size          in varchar2 default null,
    p_plug_chart_max_rows           in varchar2 default null,
    p_plug_chart_num_mask           in varchar2 default null,
    p_plug_chart_scale              in varchar2 default null,
    p_plug_chart_axis               in varchar2 default null,
    p_plug_chart_show_summary       in varchar2 default null,
    --
    p_menu_template_id              in number   default null,
    p_list_template_id              in number   default null,
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_use_custom_item_layout        in varchar2 default null,
    p_custom_item_layout            in varchar2 default null,
    --
    p_prn_page_header_alignment     in varchar2 default null,
    p_prn_page_footer_alignment     in varchar2 default null,
    p_prn_border_color              in varchar2 default null,
    p_sort_null                     in varchar2 default null,
    --
    p_fixed_header                  in varchar2 default null,
    p_fixed_header_max_height       in number   default null,
    --
    p_attribute_01                  in varchar2 default null,
    p_attribute_02                  in varchar2 default null,
    p_attribute_03                  in varchar2 default null,
    p_attribute_04                  in varchar2 default null,
    p_attribute_05                  in varchar2 default null,
    p_attribute_06                  in varchar2 default null,
    p_attribute_07                  in varchar2 default null,
    p_attribute_08                  in varchar2 default null,
    p_attribute_09                  in varchar2 default null,
    p_attribute_10                  in varchar2 default null,
    p_attribute_11                  in varchar2 default null,
    p_attribute_12                  in varchar2 default null,
    p_attribute_13                  in varchar2 default null,
    p_attribute_14                  in varchar2 default null,
    p_attribute_15                  in varchar2 default null,
    p_attribute_16                  in varchar2 default null,
    p_attribute_17                  in varchar2 default null,
    p_attribute_18                  in varchar2 default null,
    p_attribute_19                  in varchar2 default null,
    p_attribute_20                  in varchar2 default null,
    p_attribute_21                  in varchar2 default null,
    p_attribute_22                  in varchar2 default null,
    p_attribute_23                  in varchar2 default null,
    p_attribute_24                  in varchar2 default null,
    p_attribute_25                  in varchar2 default null,
    --
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME')
    ;

procedure set_region_column_width (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default g_page_id,
    p_plug_column_width             in varchar2 default null)
    ;

procedure create_report_region (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default g_page_id,
    p_name                          in varchar2 default null,
    p_region_name                   in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_template                      in number   default null,
    p_display_sequence              in varchar2 default null,
    p_include_in_reg_disp_sel_yn    in varchar2 default 'N',
    p_region_css_classes            in varchar2 default null,
    p_icon_css_classes              in varchar2 default null,
    p_region_sub_css_classes        in varchar2 default null,
    p_region_template_options       in varchar2 default null,
    p_component_template_options    in varchar2 default null,
    p_region_attributes             in varchar2 default null,
    p_report_attributes             in varchar2 default null,
    p_new_grid                      in boolean  default false,
    p_new_grid_row                  in boolean  default true,
    p_new_grid_column               in boolean  default true,
    p_grid_column_span              in number   default null,
    p_grid_column_css_classes       in varchar2 default null,
    p_display_column                in varchar2 default null,
    p_display_point                 in varchar2 default null,
    p_item_display_point            in varchar2 default 'ABOVE',
    p_source                        in varchar2 default null,
    p_source_type                   in varchar2 default null,
    p_display_error_message         in varchar2 default null, /* obsolete */
    p_required_role                 in varchar2 default null,
    p_display_when_condition        in varchar2 default null,
    p_display_when_cond2            in varchar2 default null,
    p_display_condition_type        in varchar2 default null,
    --
    p_read_only_when_type           in varchar2 default null,
    p_read_only_when                in varchar2 default null,
    p_read_only_when2               in varchar2 default null,
    --
    p_header                        in varchar2 default null,
    p_footer                        in varchar2 default null,
    p_override_reg_pos              in varchar2 default null,
    p_customized                    in varchar2 default null,
    p_customized_name               in varchar2 default null,
    p_translate_title               in varchar2 default 'Y',
    p_ajax_enabled                  in varchar2 default null,
    p_ajax_items_to_submit          in varchar2 default null,
    p_rest_enabled                  in varchar2 default 'N',
    p_region_image                  in varchar2 default null, -- mike 4.0 create_report_region
    p_region_image_attr             in varchar2 default null,
    p_fixed_header                  in varchar2 default 'PAGE',
    p_fixed_header_max_height       in number   default null,
    --
    p_query_row_template            in number   default null,
    p_plug_query_max_columns        in number   default null,
    p_query_headings                in varchar2 default null,
    p_query_headings_type           in varchar2 default 'COLON_DELMITED_LIST',
    p_query_num_rows                in number   default null,
    p_query_options                 in varchar2 default null,
    p_query_show_nulls_as           in varchar2 default null,
    p_query_break_cols              in varchar2 default null,
    p_query_no_data_found           in varchar2 default null,
    p_query_more_data               in varchar2 default null,
    p_ignore_pagination             in number   default null,
    p_query_num_rows_item           in varchar2 default null,
    p_query_num_rows_type           in varchar2 default null,
    p_query_row_count_max           in number   default null,
    --
    p_pagination_display_position   in varchar2 default null,
    p_report_total_text_format      in varchar2 default null,
    p_break_column_text_format      in varchar2 default null,
    p_break_before_row              in varchar2 default null,
    p_break_generic_column          in varchar2 default null,
    p_break_after_row               in varchar2 default null,
    p_break_type_flag               in varchar2 default null,
    p_break_repeat_heading_format   in varchar2 default null,
    p_csv_output                    in varchar2 default null,
    p_csv_output_link_text          in varchar2 default null,
    p_print_url                     in varchar2 default null,
    p_print_url_label               in varchar2 default null,
    --
    p_prn_output                    in varchar2 default null,
    p_prn_print_server_overwrite    in varchar2 default null,
    p_prn_template_id               in number   default null,
    p_prn_format                    in varchar2 default null,
    p_prn_format_item               in varchar2 default null,
    p_prn_output_show_link          in varchar2 default null,
    p_prn_output_link_text          in varchar2 default null,
    p_prn_output_file_name          in varchar2 default null,
    p_prn_content_disposition       in varchar2 default null,
    p_prn_document_header           in varchar2 default null,
    p_prn_units                     in varchar2 default null,
    p_prn_paper_size                in varchar2 default null,
    p_prn_width_units               in varchar2 default null,
    p_prn_width                     in number   default null,
    p_prn_height                    in number   default null,
    p_prn_orientation               in varchar2 default null,
    p_prn_page_header               in varchar2 default null,
    p_prn_page_header_font_color    in varchar2 default null,
    p_prn_page_header_font_family   in varchar2 default null,
    p_prn_page_header_font_weight   in varchar2 default null,
    p_prn_page_header_font_size     in varchar2 default null,
    p_prn_page_footer               in varchar2 default null,
    p_prn_page_footer_font_color    in varchar2 default null,
    p_prn_page_footer_font_family   in varchar2 default null,
    p_prn_page_footer_font_weight   in varchar2 default null,
    p_prn_page_footer_font_size     in varchar2 default null,
    p_prn_header_bg_color           in varchar2 default null,
    p_prn_header_font_color         in varchar2 default null,
    p_prn_header_font_family        in varchar2 default null,
    p_prn_header_font_weight        in varchar2 default null,
    p_prn_header_font_size          in varchar2 default null,
    p_prn_body_bg_color             in varchar2 default null,
    p_prn_body_font_color           in varchar2 default null,
    p_prn_body_font_family          in varchar2 default null,
    p_prn_body_font_weight          in varchar2 default null,
    p_prn_body_font_size            in varchar2 default null,
    p_prn_border_width              in number   default null,
    --
    p_shared_query_id               in number   default null,
    --
    p_query_asc_image               in varchar2 default 'arrow_down_gray_dark.gif',
    p_query_asc_image_attr          in varchar2 default 'width="13" height="12"',
    p_query_desc_image              in varchar2 default 'arrow_up_gray_dark.gif',
    p_query_desc_image_attr         in varchar2 default 'width="13" height="12"',
    --
    p_plug_query_exp_filename       in varchar2 default null,
    p_plug_query_exp_separator      in varchar2 default null,
    p_plug_query_exp_enclosed_by    in varchar2 default null,
    p_plug_query_strip_html         in varchar2 default null,
    p_plug_query_parse_override     in varchar2 default null,
    --
    p_required_patch                in varchar2 default null,
    p_comment                       in varchar2 default null,
    --
    p_plug_column_width             in varchar2 default null,
    --
    p_prn_page_header_alignment     in varchar2 default null,
    p_prn_page_footer_alignment     in varchar2 default null,
    p_prn_border_color              in varchar2 default null,
    p_sort_null                     in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default 'NOCACHE',
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    p_plug_cache_when_cond_type     in varchar2 default null,
    p_plug_cache_when_condition_e1  in varchar2 default null,
    p_plug_cache_when_condition_e2  in varchar2 default null,
    p_plug_cache_depends_on_items   in varchar2 default null,
    --
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME')
    ;

procedure create_report_columns(
    p_id                             in number default null,
    p_region_id                      in number default g_region_id,
    p_flow_id                        in number default null, -- defaults to region's flow id
    p_query_column_id                in number default null,
    p_form_element_id                in number default null,
    p_column_alias                   in varchar2 default null,
    p_column_display_sequence        in varchar2 default null,
    p_column_heading                 in varchar2 default null,
    p_use_as_row_header              in varchar2 default null,
    p_column_format                  in varchar2 default null,
    p_column_html_expression         in varchar2 default null,
    p_column_css_class               in varchar2 default null,
    p_column_css_style               in varchar2 default null,
    p_column_hit_highlight           in varchar2 default null,
    p_column_link                    in varchar2 default null,
    p_column_linktext                in varchar2 default null,
    p_column_link_attr               in varchar2 default null,
    p_column_alignment               in varchar2 default 'LEFT',
    p_heading_alignment              in varchar2 default 'CENTER',
    p_default_sort_column_sequence   in varchar2 default '0',
    p_default_sort_dir               in varchar2 default null,
    p_disable_sort_column            in varchar2 default 'Y',
    p_sum_column                     in varchar2 default 'N',
    p_hidden_column                  in varchar2 default 'N',
    p_display_when_cond_type         in varchar2 default null,
    p_display_when_condition         in varchar2 default null,
    p_display_when_condition2        in varchar2 default null,
    p_report_column_required_role    in varchar2 default null,
    p_security_group_id              in varchar2 default null,
    p_last_updated_by                in varchar2 default null,
    p_last_updated_on                in varchar2 default null,
    p_display_as                     in varchar2 default 'ESCAPE_SC',
    p_named_lov                      in varchar2 default null,
    p_inline_lov                     in varchar2 default null,
    p_lov_show_nulls                 in varchar2 default null,
    p_lov_null_text                  in varchar2 default null,
    p_lov_null_value                 in varchar2 default null,
    p_report_column_width            in varchar2 default null,
    p_column_width                   in varchar2 default null,
    p_column_height                  in varchar2 default null,
    p_css_classes                    in varchar2 default null,
    p_cattributes                    in varchar2 default null,
    p_cattributes_element            in varchar2 default null,
    p_column_field_template          in number   default null,
    p_is_required                    in boolean  default false,
    p_standard_validations           in varchar2 default null,
    --
    p_attribute_01                   in varchar2 default null,
    p_attribute_02                   in varchar2 default null,
    p_attribute_03                   in varchar2 default null,
    p_attribute_04                   in varchar2 default null,
    p_attribute_05                   in varchar2 default null,
    p_attribute_06                   in varchar2 default null,
    p_attribute_07                   in varchar2 default null,
    p_attribute_08                   in varchar2 default null,
    p_attribute_09                   in varchar2 default null,
    p_attribute_10                   in varchar2 default null,
    p_attribute_11                   in varchar2 default null,
    p_attribute_12                   in varchar2 default null,
    p_attribute_13                   in varchar2 default null,
    p_attribute_14                   in varchar2 default null,
    p_attribute_15                   in varchar2 default null,
    --
    p_pk_col_source_type             in varchar2 default null,
    p_pk_col_source                  in varchar2 default null,
    p_derived_column                 in varchar2 default null,
    --
    p_column_default                 in varchar2 default null,
    p_column_default_type            in varchar2 default null,
    p_lov_display_extra              in varchar2 default null,
    --
    p_include_in_export             in varchar2 default null,
    p_print_col_width               in varchar2 default null,
    p_print_col_align               in varchar2 default null,
    --
    p_ref_schema                     in varchar2 default null,
    p_ref_table_name                 in varchar2 default null,
    p_ref_column_name                in varchar2 default null,
    --
    p_column_link_checksum_type      in varchar2 default null,
    --
    p_column_comment                 in varchar2 default null,
    p_target                        in varchar2 default 'PRIME')
    ;

procedure create_query_definition(
    p_id                               in number default null,
    p_region_id                        in number default g_region_id,
    p_flow_id                          in number default wwv_flow.g_flow_id,
    p_reference_id                     in number default null)
    ;

procedure create_query_object(
    p_id                               in number default null,
    p_query_id                         in number default null,
    p_object_owner                     in varchar2 default null,
    p_object_name                      in varchar2 default null,
    p_object_alias                     in varchar2 default null)
    ;

procedure create_query_column(
    p_id                               in number default null,
    p_query_id                         in number default null,
    p_query_object_id                  in number default null,
    p_column_number                    in number default null,
    p_column_alias                     in varchar2 default null,
    p_column_sql_expression            in varchar2 default null,
    p_column_group_by_sequence         in varchar2 default null)
    ;

procedure create_query_condition(
    p_id                               in number default null,
    p_query_id                         in number default null,
    p_condition                        in varchar2 default null,
    p_cond_column                      in varchar2 default null,
    p_cond_id1                         in number default null,
    p_cond_id2                         in number default null,
    p_cond_root                        in varchar2 default null,
    p_operator                         in varchar2 default null)
    ;

procedure set_plug_source (
    p_id                            in number   default null,
    p_plug_source                   in varchar2 default null)
    ;

procedure set_plug_query_heading (
    p_id                            in number   default null,
    p_plug_query_heading            in varchar2 default null)
    ;

procedure create_chart_series_attr (
    p_id                            in number default null,
    p_region_id                     in number default g_region_id,
    p_series_id                     in number default null,
    p_a001                          in varchar2 default null,
    p_a002                          in varchar2 default null,
    p_a003                          in varchar2 default null,
    p_a004                          in varchar2 default null,
    p_a005                          in varchar2 default null,
    p_a006                          in varchar2 default null,
    p_a007                          in varchar2 default null,
    p_a008                          in varchar2 default null,
    p_a009                          in varchar2 default null,
    p_a010                          in varchar2 default null,
    p_a011                          in varchar2 default null,
    p_a012                          in varchar2 default null,
    p_a013                          in varchar2 default null,
    p_a014                          in varchar2 default null,
    p_a015                          in varchar2 default null,
    p_a016                          in varchar2 default null,
    p_a017                          in varchar2 default null,
    p_a018                          in varchar2 default null,
    p_a019                          in varchar2 default null,
    p_a020                          in varchar2 default null,
    p_a021                          in varchar2 default null,
    p_a022                          in varchar2 default null,
    p_a023                          in varchar2 default null,
    p_a024                          in varchar2 default null,
    p_a025                          in varchar2 default null,
    p_a026                          in varchar2 default null,
    p_a027                          in varchar2 default null,
    p_a028                          in varchar2 default null,
    p_a029                          in varchar2 default null,
    p_a030                          in varchar2 default null,
    p_a031                          in varchar2 default null,
    p_a032                          in varchar2 default null,
    p_a033                          in varchar2 default null,
    p_a034                          in varchar2 default null,
    p_a035                          in varchar2 default null,
    p_a036                          in varchar2 default null,
    p_a037                          in varchar2 default null,
    p_a038                          in varchar2 default null,
    p_a039                          in varchar2 default null,
    p_a040                          in varchar2 default null,
    p_a041                          in varchar2 default null,
    p_a042                          in varchar2 default null,
    p_a043                          in varchar2 default null,
    p_a044                          in varchar2 default null,
    p_a045                          in varchar2 default null,
    p_a046                          in varchar2 default null,
    p_a047                          in varchar2 default null,
    p_a048                          in varchar2 default null,
    p_a049                          in varchar2 default null,
    p_a050                          in varchar2 default null,
    --
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME')
    ;

procedure create_generic_attr (
    p_id                            in number   default null,
    p_region_id                     in number   default g_region_id,
    p_attribute_id                  in number   default null,
    p_attribute_value               in varchar2 default null,
    --
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME')
    ;

procedure create_region_rpt_cols (
    --
    -- Updatable report columns define attributes of regions
    -- of type UPDATABLE_SQL_QUERY.
    --
    p_id                            in number,
    p_FLOW_ID                       in number   default wwv_flow.g_flow_id,
    p_PLUG_ID                       in number   default g_region_id,
    p_COLUMN_SEQUENCE               in number,
    p_QUERY_COLUMN_NAME             in varchar2,
    p_DISPLAY_AS                    in varchar2 default null,
    p_NAMED_LOV                     in number   default null,
    p_INLINE_LOV                    in varchar2 default null,
    p_LOV_SHOW_NULLS                in varchar2 default null,
    p_LOV_NULL_TEXT                 in varchar2 default null,
    p_LOV_NULL_VALUE                in varchar2 default null,
    p_COLUMN_WIDTH                  in number   default null,
    p_COLUMN_HEIGHT                 in number   default null,
    p_CATTRIBUTES                   in varchar2 default null,
    p_COLUMN_COMMENT                in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_region_column(
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default g_page_id,
    p_region_id                 in number   default g_region_id,
    p_name                      in varchar2,
    p_data_type                 in varchar2 default 'VARCHAR',
    p_is_visible                in boolean  default true,
    p_display_sequence          in number,
    p_heading                   in varchar2 default null,
    p_heading_alignment         in varchar2 default null,
    p_value_alignment           in varchar2 default null,
    p_value_css_classes         in varchar2 default null,
    p_value_attributes          in varchar2 default null,
    p_format_mask               in varchar2 default null,
    --
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_attribute_16              in varchar2 default null,
    p_attribute_17              in varchar2 default null,
    p_attribute_18              in varchar2 default null,
    p_attribute_19              in varchar2 default null,
    p_attribute_20              in varchar2 default null,
    p_attribute_21              in varchar2 default null,
    p_attribute_22              in varchar2 default null,
    p_attribute_23              in varchar2 default null,
    p_attribute_24              in varchar2 default null,
    p_attribute_25              in varchar2 default null,
    --
    p_escape_on_http_output     in boolean  default null,
    p_display_condition_type    in varchar2 default null,
    p_display_condition         in varchar2 default null,
    p_display_condition2        in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_column_comment            in varchar2 default null );

procedure create_calendar (
    --
    -- create calendar and easy_calendar
    --
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default g_page_id,
    p_plug_name                     in varchar2 default null,
    p_region_name                   in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_template                 in number   default null,
    p_plug_display_sequence         in varchar2 default null,
    p_include_in_reg_disp_sel_yn    in varchar2 default 'N',
    p_region_css_classes            in varchar2 default null,
    p_region_attributes             in varchar2 default null,
    p_report_attributes             in varchar2 default null,
    p_plug_new_grid                 in boolean  default false,
    p_plug_new_grid_row             in boolean  default true,
    p_plug_new_grid_column          in boolean  default true,
    p_plug_grid_column_span         in number   default null,
    p_plug_grid_column_css_classes  in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_display_point            in varchar2 default null,
    p_plug_item_display_point       in varchar2 default 'ABOVE',
    p_plug_source                   in varchar2 default null,
    p_plug_source_type              in varchar2 default null,
    p_plug_display_error_message    in varchar2 default null, /* obsolete */
    p_plug_required_role            in varchar2 default null,
    p_plug_display_when_condition   in varchar2 default null,
    p_plug_display_when_cond2       in varchar2 default null,
    p_plug_display_condition_type   in varchar2 default null,
    --
    p_plug_read_only_when_type      in varchar2 default null,
    p_plug_read_only_when           in varchar2 default null,
    p_plug_read_only_when2          in varchar2 default null,
    --
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    p_plug_override_reg_pos         in varchar2 default null,
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    p_translate_title               in varchar2 default 'Y',
    p_rest_enabled                  in varchar2 default 'N',
    --
    p_region_image                  in varchar2 default null, -- bug 19672864
    p_region_image_attr             in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default 'NOCACHE',
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    p_plug_cache_when_cond_type     in varchar2 default null,
    p_plug_cache_when_condition_e1  in varchar2 default null,
    p_plug_cache_when_condition_e2  in varchar2 default null,
    p_plug_cache_depends_on_items   in varchar2 default null,
    p_escape_on_http_output         in varchar2 default 'N',
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_cal_id                        in number          default null,
    p_start_date                    in varchar2        default null,
    p_end_date                      in varchar2        default null,
    p_begin_at_start_of_interval    in varchar2        default 'Y',
    p_date_item                     in varchar2        default null,
    p_end_date_item                 in varchar2        default null,
    p_display_as                    in varchar2        default null,
    p_display_item                  in varchar2        default null,
    p_display_type                  in varchar2        default null,
    p_item_format                   in varchar2        default null,
    p_easy_sql_owner                in varchar2        default null,
    p_easy_sql_table                in varchar2        default null,
    p_date_column                   in varchar2        default null,
    p_end_date_column               in varchar2        default null,
    p_display_column                in varchar2        default null,
    p_template_id                   in number          default null,
    p_start_of_week                 in number          default null,
    p_day_link                      in varchar2        default null,
    p_item_link                     in varchar2        default null,
    p_start_time                    in varchar2        default null,
    p_end_time                      in varchar2        default null,
    p_time_format                   in varchar2        default null,
    p_week_start_day                in varchar2        default null,
    p_week_end_day                  in varchar2        default null,
    p_date_type_column              in varchar2        default null,
    p_calendar_type                 in varchar2        default null,
    p_include_custom_cal            in varchar2        default null,
    p_custom_cal_days               in number          default 3,
    p_primary_key_column            in varchar2        default null,
    p_drag_drop_required_role       in varchar2        default null,
    p_drag_drop_process_id          in number          default null,
    p_item_link_primary_key_item    in varchar2        default null,
    p_item_link_date_item           in varchar2        default null,
    p_item_link_open_in             in varchar2        default 'W',
    p_include_time_with_date        in varchar2        default 'N',
    p_data_background_color         in varchar2        default null,
    p_data_text_color               in varchar2        default null,
    p_agenda_cal_days_type          in varchar2        default 'MONTH',
    p_agenda_cal_days               in number          default 30,
    p_calendar_comments             in varchar2        default null,
    --
    p_plug_column_width             in varchar2 default null,
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME');
--
-- B U G
--

procedure create_bug (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default null,
    p_bug_description           in varchar2 default null,
    p_bug_priority              in varchar2 default null,
    p_bug_status_code           in varchar2 default null,
    p_bug_reported_by           in varchar2 default null,
    p_bug_reported_on           in date     default null,
    p_bug_assigned_to           in varchar2 default null,
    p_bug_assigned_on           in date     default null,
    p_bug_fix_in_version        in varchar2 default null,
    p_bug_projected_close_date  in date     default null,
    p_bug_close_date            in date     default null,
    p_bug_affected_files_or_mod in varchar2 default null,
    p_bug_text                  in varchar2 default null,
    p_bug_how_to_reproduce      in varchar2 default null,
    p_bug_workaround            in varchar2 default null,
    p_bug_additional_text       in varchar2 default null,
    p_bug_work_log              in varchar2 default null,
    p_bug_last_updated_by       in varchar2 default null,
    p_bug_last_updated_on       in date     default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;



--
-- L I S T S
--



procedure create_list (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_list_type                 in varchar2 default 'STATIC',
    p_list_query                in varchar2 default null,
    p_list_status               in varchar2 default null,
    p_list_displayed            in varchar2 default 'BY_DEFAULT',
    p_display_row_template_id   in number   default null, /* obsolete */
    p_required_patch            in number   default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;


procedure create_list_item (
    p_id                           in number   default null,
    p_list_id                      in number   default g_list_id,
    p_list_item_type               in varchar2 default 'LINK',
    p_list_item_status             in varchar2 default 'PUBLIC',
    p_item_displayed               in varchar2 default 'BY_DEFAULT',
    p_list_item_display_sequence   in number   default null,
    p_list_item_link_text          in varchar2 default null,
    p_list_item_link_target        in varchar2 default null,
    p_list_item_icon               in varchar2 default null,
    p_list_item_icon_attributes    in varchar2 default null,
    p_list_item_icon_alt_attribute in varchar2 default null,
    p_list_item_disp_cond_type     in varchar2 default null,
    p_list_item_disp_condition     in varchar2 default null,
    p_list_item_disp_cond_type2    in varchar2 default null,
    p_list_item_disp_condition2    in varchar2 default null,
    --
    p_list_item_icon_exp           in varchar2 default null,
    p_list_item_icon_exp_attr      in varchar2 default null,
    p_list_item_parent_id          in number default null,
    p_parent_list_item_id          in number default null,
    p_sub_item_count               in number default null,
    --
    p_list_countclicks_y_n         in varchar2 default 'N',
    p_list_countclicks_cat         in varchar2 default null,
    p_list_text_01                 in varchar2 default null,
    p_list_text_02                 in varchar2 default null,
    p_list_text_03                 in varchar2 default null,
    p_list_text_04                 in varchar2 default null,
    p_list_text_05                 in varchar2 default null,
    p_list_text_06                 in varchar2 default null,
    p_list_text_07                 in varchar2 default null,
    p_list_text_08                 in varchar2 default null,
    p_list_text_09                 in varchar2 default null,
    p_list_text_10                 in varchar2 default null,
    p_translate_list_text_y_n      in varchar2 default null,
    p_list_item_owner              in varchar2 default null,
    p_list_item_current_for_pages  in varchar2 default null,
    p_list_item_current_type       in varchar2 default null,
    p_security_scheme              in varchar2 default null,
    p_required_patch               in number   default null,
    --
    p_id_offset                    in number   default 0,
    p_target                       in varchar2 default 'PRIME')
    ;


procedure set_list_item_sequence (
    p_id                         in number   default null,
    p_item_sequence              in number   default null)
    ;

procedure set_list_item_link_text (
    p_id                         in number   default null,
    p_link_text                  in varchar2 default null)
    ;
procedure set_list_item_link_target (
    p_id                         in number   default null,
    p_link_target                in varchar2 default null)
    ;

--------------------------
-- C O M M E N T S
--
procedure create_app_comments (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_pages                      in varchar2 default null,
    p_app_comment                in varchar2 default null,
    p_comment_owner              in varchar2 default null,
    p_comment_flag               in varchar2 default null,
    p_app_version                in varchar2 default null,
    --
    p_created_by                 in varchar2 default null,
    p_created_on                 in varchar2 default null,
    p_updated_by                 in varchar2 default null,
    p_updated_on                 in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;


--------------------------
-- T R A N S L A T I O N S
--

procedure create_dynamic_translation (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_language                   in varchar2 default null,
    p_from                       in varchar2 default null,
    p_to                         in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_message (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_name                       in varchar2 default null,
    p_message_language           in varchar2 default 'en',
    p_message_text               in varchar2 default null,
    p_is_js_message              in boolean  default false,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;


procedure create_language_map (
    p_id                            in number   default null,
    p_primary_language_flow_id      in number   default wwv_flow.g_flow_id,
    p_translation_flow_id           in number   default null,
    p_translation_flow_language_cd  in varchar2 default null,
    p_translation_image_directory   in varchar2 default null,
    p_translation_comments          in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_translation (
    p_id                            in number default null,
    p_translated_flow_id            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_page_id                       in number default g_page_id,
    p_translate_column_id           in number default null,
    p_translate_to_id               in number default null,
    p_translate_from_id             in number default null,
    p_translate_to_lang_code        in varchar2 default null,
    p_translation_specific_to_item  in varchar2 default 'NO',
    p_translate_to_text             in varchar2 default null,
    p_translate_from_text           in varchar2 default null,
    p_template_translatable         in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure remove_translation (
    p_translated_flow_id            in number default null)
    ;

procedure remove_dyanamic_translation (
    p_flow_id            in number default wwv_flow.g_flow_id,
    p_language           in varchar2 default null)
    ;


procedure create_image (
    p_id                in number default null,
    p_flow_id           in number default wwv_flow.g_flow_id,
    p_image_name        in varchar2 default null,
    p_national_language in varchar2 default null,
    p_height            in number   default null,
    p_width             in number   default null,
    p_notes             in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_shortcut (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_shortcut_name              in varchar2 default null,
    p_shortcut_consideration_seq in number   default null,
    p_shortcut_type              in varchar2 default null,
    p_shortcut_condition_type1   in varchar2 default null,
    p_shortcut_condition1        in varchar2 default null,
    p_shortcut_condition_type2   in varchar2 default null,
    p_shortcut_condition2        in varchar2 default null,
    p_build_option               in number   default null,
    p_error_text                 in varchar2 default null,
    p_reference_id               in number default null,
    p_comments                   in varchar2 default null,
    p_shortcut                   in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;


procedure create_tree  (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_type                      in varchar2 default 'DYNAMIC',
    p_item                      in varchar2 default null,
    p_query                     in varchar2 default null,
    p_levels                    in number   default null,
    p_unexpanded_parent         in varchar2 default null,
    p_unexpanded_parent_last    in varchar2 default null,
    p_expanded_parent           in varchar2 default null,
    p_expanded_parent_last      in varchar2 default null,
    p_leaf_node                 in varchar2 default null,
    p_leaf_node_last            in varchar2 default null,
    p_name_link_anchor_tag      in varchar2 default null,
    p_name_link_not_anchor_tag  in varchar2 default null,
    p_indent_vertical_line      in varchar2 default null,
    p_indent_vertical_line_last in varchar2 default null,
    p_drill_up                  in varchar2 default null,
    p_before_tree               in varchar2 default null,
    p_after_tree                in varchar2 default null,
    p_level_1_template          in varchar2 default null,
    p_level_2_template          in varchar2 default null,
    --
    p_id_offset                 in number   default 0,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_jstree  (
    p_id                        in number default null,
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_page_id                   in number default g_page_id,
    p_region_id                 in number default g_region_id,
    p_tree_template             in varchar2 default null,
    p_tree_source               in varchar2 default null,
    p_tree_query                in varchar2 default null,
    p_tree_node_title           in varchar2 default null,
    p_tree_node_value           in varchar2 default null,
    p_tree_node_icon            in varchar2 default null,
    p_tree_node_link            in varchar2 default null,
    p_tree_node_hints           in varchar2 default null,
    p_tree_start_item           in varchar2 default null,
    p_tree_start_value          in varchar2 default null,
    p_tree_button_option        in varchar2 default null,
    p_show_node_link            in varchar2 default null,
    p_node_link_checksum_type   in varchar2 default null,
    p_tree_comment              in varchar2 default null,
    p_show_hints                in varchar2 default null,
    p_tree_has_focus            in varchar2 default null,
    p_tree_hint_text            in varchar2 default null,
    p_tree_click_action         in varchar2 default null,
    p_selected_node             in varchar2 default null)
    ;

--
-- P L U G I N S
--
procedure remove_plugin (
    p_flow_id     in number,
    p_plugin_type in varchar2,
    p_name        in varchar2 );

procedure create_plugin (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_plugin_type                  in varchar2,
    p_name                         in varchar2,
    p_display_name                 in varchar2,
    p_category                     in varchar2 default null,
    p_supported_ui_types           in varchar2 default 'DESKTOP',
    p_image_prefix                 in varchar2 default null,
    p_javascript_file_urls         in varchar2 default null,
    p_css_file_urls                in varchar2 default null,
    p_plsql_code                   in varchar2 default null,
    p_render_function              in varchar2 default null,
    p_ajax_function                in varchar2 default null,
    p_validation_function          in varchar2 default null,
    p_execution_function           in varchar2 default null,
    p_session_sentry_function      in varchar2 default null,
    p_invalid_session_function     in varchar2 default null,
    p_authentication_function      in varchar2 default null,
    p_post_logout_function         in varchar2 default null,
    p_builder_validation_function  in varchar2 default null,
    p_migration_function           in varchar2 default null,
    p_standard_attributes          in varchar2 default null,
    p_sql_min_column_count         in number   default null,
    p_sql_max_column_count         in number   default null,
    p_sql_examples                 in varchar2 default null,
    p_substitute_attributes        in boolean  default true,
    p_attribute_01                 in varchar2 default null, /* obsolete */
    p_attribute_02                 in varchar2 default null, /* obsolete */
    p_attribute_03                 in varchar2 default null, /* obsolete */
    p_attribute_04                 in varchar2 default null, /* obsolete */
    p_attribute_05                 in varchar2 default null, /* obsolete */
    p_attribute_06                 in varchar2 default null, /* obsolete */
    p_attribute_07                 in varchar2 default null, /* obsolete */
    p_attribute_08                 in varchar2 default null, /* obsolete */
    p_attribute_09                 in varchar2 default null, /* obsolete */
    p_attribute_10                 in varchar2 default null, /* obsolete */
    p_attribute_11                 in varchar2 default null, /* obsolete */
    p_attribute_12                 in varchar2 default null, /* obsolete */
    p_attribute_13                 in varchar2 default null, /* obsolete */
    p_attribute_14                 in varchar2 default null, /* obsolete */
    p_attribute_15                 in varchar2 default null, /* obsolete */
    p_reference_id                 in number   default null,
    p_subscribe_plugin_settings    in boolean  default true,
    p_is_quick_pick                in boolean  default false,
    p_is_deprecated                in boolean  default false,
    p_help_text                    in varchar2 default null,
    p_version_identifier           in varchar2 default null,
    p_about_url                    in varchar2 default null,
    p_plugin_comment               in varchar2 default null,
    p_files_version                in number   default 1 );

procedure create_plugin_attribute (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_plugin_id                    in number,
    p_attribute_scope              in varchar2,
    p_attribute_sequence           in number,
    p_display_sequence             in number   default null,
    p_prompt                       in varchar2,
    p_attribute_type               in varchar2,
    p_is_required                  in boolean,
    p_is_common                    in boolean  default true,
    p_show_in_wizard               in boolean  default true,
    p_default_value                in varchar2 default null,
    p_display_length               in number   default null,
    p_max_length                   in number   default null,
    p_min_value                    in number   default null,
    p_max_value                    in number   default null,
    p_unit                         in varchar2 default null,
    p_sql_min_column_count         in number   default null,
    p_sql_max_column_count         in number   default null,
    p_column_data_types            in varchar2 default null,
    p_supported_ui_types           in varchar2 default null,
    p_is_translatable              in boolean,
    p_parent_attribute_id          in number   default null,
    p_depending_on_attribute_id    in number   default null,
    p_depending_on_comp_prop_id    in number   default null,
    p_depending_on_condition_type  in varchar2 default null,
    p_depending_on_expression      in varchar2 default null,
    p_lov_type                     in varchar2 default null,
    p_lov_component_type_id        in number   default null,
    p_lov_component_type_scope     in varchar2 default null,
    p_lov_component_type_on_delete in varchar2 default null,
    p_reference_scope              in varchar2 default 'COMPONENT',
    p_text_case                    in varchar2 default null,
    p_null_text                    in varchar2 default null,
    p_deprecated_values            in varchar2 default null,
    p_examples                     in varchar2 default null,
    p_help_text                    in varchar2 default null,
    p_attribute_comment            in varchar2 default null );

procedure create_plugin_attr_value (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_plugin_attribute_id    in number,
    p_display_sequence       in number,
    p_display_value          in varchar2,
    p_return_value           in varchar2,
    p_is_quick_pick          in boolean  default false,
    p_is_deprecated          in boolean  default false,
    p_help_text              in varchar2 default null );

procedure create_plugin_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_id    in number,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob );

/* obsolete */
procedure create_plugin_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_id    in number,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in sys.dbms_sql.varchar2_table );

procedure create_plugin_event (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_id    in number,
    p_name         in varchar2,
    p_display_name in varchar2 );

procedure create_plugin_setting (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_type  in varchar2,
    p_plugin       in varchar2,
    p_attribute_01 in varchar2 default null,
    p_attribute_02 in varchar2 default null,
    p_attribute_03 in varchar2 default null,
    p_attribute_04 in varchar2 default null,
    p_attribute_05 in varchar2 default null,
    p_attribute_06 in varchar2 default null,
    p_attribute_07 in varchar2 default null,
    p_attribute_08 in varchar2 default null,
    p_attribute_09 in varchar2 default null,
    p_attribute_10 in varchar2 default null,
    p_attribute_11 in varchar2 default null,
    p_attribute_12 in varchar2 default null,
    p_attribute_13 in varchar2 default null,
    p_attribute_14 in varchar2 default null,
    p_attribute_15 in varchar2 default null );

--
-- RESTful Services Procedures
--
procedure remove_restful_service (
    p_id                in number default null,
    p_name              in varchar2);


procedure create_user_groups (
    p_id                in number,
    p_group_name        in varchar2,
    p_group_desc        in varchar2  default null,
    p_security_group_id in number    default null);

procedure create_restful_module (
    p_id                           in number   default null,
    p_name                         in varchar2,
    p_uri_prefix                   in varchar2 default null,
    p_parsing_schema               in varchar2 default null,
    p_origins_allowed              in varchar2 default null,
    p_items_per_page               in varchar2 default null,
    p_privilege_id                 in number default null,
    p_privilege_name               in varchar2 default null,
    p_status                       in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_template (
    p_id                           in number   default null,
    p_module_id                    in number,
    p_uri_template                 in varchar2,
    p_priority                     in number default null,
    p_etag_type                    in varchar2 default null,
    p_etag_query                   in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_handler (
    p_id                           in number   default null,
    p_template_id                  in number,
    p_source_type                  in varchar2,
    p_format                       in varchar2 default null,
    p_method                       in varchar2 default null,
    p_mimes_allowed                in varchar2 default null,
    p_items_per_page               in number default null,
    p_require_https                in varchar2 default null,
    p_privilege_id                 in number default null,
    p_source                       in clob default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_param (
    p_id                           in number   default null,
    p_handler_id                   in number,
    p_name                         in varchar2,
    p_bind_variable_name           in varchar2 default null,
    p_source_type                  in varchar2 default null,
    p_access_method                in varchar2 default null,
    p_param_type                   in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_priv (
    p_id                           in number,
    p_name                         in varchar2,
    p_label                        in varchar2,
    p_description                  in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number   default null,
    p_row_version_number           in number   default null);


procedure create_rs_priv_grp (
    p_id                           in number   default null,
    p_privilege_id                 in number   default null,
    p_privilege_name               in varchar2 default null,
    p_user_group_id                in number   default null,
    p_group_name                   in varchar2 default null,
    p_security_group_id            in number   default null,
    p_row_version_number           in number   default null);


procedure create_popup_lov_template (
    p_id                 in number   default null,
    p_security_group_id  in number   default null,
    p_flow_id            in number   default wwv_flow.g_flow_id,
    p_popup_icon         in varchar2 default null,
    p_popup_icon_attr    in varchar2 default null,
    p_popup_icon2        in varchar2 default null,
    p_popup_icon_attr2   in varchar2 default null,
    p_page_name          in varchar2 default null,
    p_page_title         in varchar2 default null,
    p_page_html_head     in varchar2 default null,
    p_page_body_attr     in varchar2 default null,
    p_before_field_text  in varchar2 default null,
    p_page_heading_text  in varchar2 default null,
    p_page_footer_text   in varchar2 default null,
    p_filter_width       in varchar2 default null,
    p_filter_max_width   in varchar2 default null,
    p_filter_text_attr   in varchar2 default null,
    p_find_button_text   in varchar2 default null,
    p_find_button_image  in varchar2 default null,
    p_find_button_attr   in varchar2 default null,
    p_close_button_text  in varchar2 default null,
    p_close_button_image in varchar2 default null,
    p_close_button_attr  in varchar2 default null,
    p_next_button_text   in varchar2 default null,
    p_next_button_image  in varchar2 default null,
    p_next_button_attr   in varchar2 default null,
    p_prev_button_text   in varchar2 default null,
    p_prev_button_image  in varchar2 default null,
    p_prev_button_attr   in varchar2 default null,
    p_after_field_text   in varchar2 default null,
    p_scrollbars         in varchar2 default null,
    p_resizable          in varchar2 default null,
    p_width              in varchar2 default null,
    p_height             in varchar2 default null,
    p_result_row_x_of_y  in varchar2 default null,
    p_result_rows_per_pg in varchar2 default null,
    p_before_result_set  in varchar2 default null,
    p_after_result_set   in varchar2 default null,
    p_when_no_data_found_message     in varchar2 default null,
    p_before_first_fetch_message     in varchar2 default null,
    p_minimum_characters_required    in number   default null,
    p_reference_id       in number   default null,
    p_translate_this_template        in varchar2 default 'N',
    --
    p_id_offset          in number   default 0,
    p_target             in varchar2 default 'PRIME',
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null)
    ;

procedure create_menu (
    p_id                       in number   default null,
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_name                     in varchar2 default null,
    p_security_group_id        in number   default null,
    --
    p_id_offset                in number   default 0,
    p_target                   in varchar2 default 'PRIME')
    ;

procedure create_menu_option (
    p_id                       in number   default null,
    p_parent_id                in number   default null,
    p_menu_id                  in number   default g_menu_id,
    p_option_sequence          in number   default 10,
    p_short_name               in varchar2 default null,
    p_long_name                in varchar2 default null,
    p_link                     in varchar2 default null,
    p_page_id                  in number   default null,
    p_also_current_for_pages   in varchar2 default null,
    p_display_when_cond_type   in varchar2 default null,
    p_display_when_condition   in varchar2 default null,
    p_display_when_condition2  in varchar2 default null,
    p_security_scheme          in varchar2 default null,
    p_required_patch           in number   default null,
    p_security_group_id        in number   default null,
    --
    p_id_offset                in number   default 0,
    p_target                   in varchar2 default 'PRIME')
    ;

procedure create_menu_template (
    p_id                       in number   default null,
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_name                     in varchar2 default null,
    p_before_first             in varchar2 default null,
    p_current_page_option      in varchar2 default null,
    p_non_current_page_option  in varchar2 default null,
    p_menu_link_attributes     in varchar2 default null,
    p_between_levels           in varchar2 default null,
    p_after_last               in varchar2 default null,
    p_max_levels               in number   default null,
    p_start_with_node          in varchar2 default null,
    p_translate_this_template  in varchar2 default 'N',
    p_template_comments        in varchar2 default null,
    p_security_group_id        in number   default null,
    p_reference_id             in number   default null,
    --
    p_id_offset                in number   default 0,
    p_target                   in varchar2 default 'PRIME',
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options   in varchar2 default null)
    ;



procedure create_web_service (
    p_id                       in number   default null,
    p_security_group_id        in number   default null,
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_name                     in varchar2 default null,
    p_url                      in varchar2 default null,
    p_action                   in varchar2 default null,
    p_proxy_override           in varchar2 default null,
    p_soap_version             in varchar2 default null,
    p_soap_envelope            in varchar2 default null,
    p_flow_items_comma_delimited in varchar2 default null,
    p_static_parm_01           in varchar2 default null,
    p_static_parm_02           in varchar2 default null,
    p_static_parm_03           in varchar2 default null,
    p_static_parm_04           in varchar2 default null,
    p_static_parm_05           in varchar2 default null,
    p_static_parm_06           in varchar2 default null,
    p_static_parm_07           in varchar2 default null,
    p_static_parm_08           in varchar2 default null,
    p_static_parm_09           in varchar2 default null,
    p_static_parm_10           in varchar2 default null,
    p_stylesheet               in varchar2 default null,
    p_reference_id             in number   default null,
    --
    p_id_offset                in number   default 0,
    p_target                   in varchar2 default 'PRIME')
    ;

procedure create_ws_operations (
    p_id                       in number   default null,
    p_ws_id                    in number   default null,
    p_name                     in varchar2 default null,
    p_input_message_name       in varchar2 default null,
    p_input_message_ns         in varchar2 default null,
    p_input_message_style      in varchar2 default null,
    p_output_message_name      in varchar2 default null,
    p_output_message_ns        in varchar2 default null,
    p_output_message_style     in varchar2 default null,
    p_header_message_name      in varchar2 default null,
    p_header_message_style     in varchar2 default null,
    p_soap_action              in varchar2 default null)
    ;

procedure create_ws_parameters (
    p_id                       in number   default null,
    p_ws_opers_id              in number   default null,
    p_name                     in varchar2 default null,
    p_input_or_output          in varchar2 default null,
    p_parm_type                in varchar2 default null,
    p_path                     in varchar2 default null,
    p_type_is_xsd              in varchar2 default null,
    p_form_qualified           in varchar2 default null,
    p_parent_id                in varchar2 default null)
    ;

procedure create_ws_process_parms_map (
    p_id                       in number   default null,
    p_parameter_id             in number   default null,
    p_process_id               in number   default null,
    p_map_type                 in varchar2 default null,
    p_parm_value               in varchar2 default null)
    ;

--##############################################################################
--#
--# AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- internal utility function, also needed for wwv_flow_upgrade
--==============================================================================
function get_default_ldap_escaping (
    p_edit_function in varchar2 )
    return varchar2;
--==============================================================================
-- legacy API for pre 4.1
--==============================================================================
procedure create_auth_setup(
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_description               in varchar2 default null,
    p_reference_id              in number   default null,
    p_page_sentry_function      in varchar2 default null,
    p_sess_verify_function      in varchar2 default null,
    p_invalid_session_page      in varchar2 default null,
    p_invalid_session_url       in varchar2 default null,
    p_pre_auth_process          in varchar2 default null,
    p_auth_function             in varchar2 default null,
    p_post_auth_process         in varchar2 default null,
    p_cookie_name               in varchar2 default null,
    p_cookie_path               in varchar2 default null,
    p_cookie_domain             in varchar2 default null,
    p_use_secure_cookie_yn      in varchar2 default null,
    p_ldap_host                 in varchar2 default null,
    p_ldap_port                 in varchar2 default null,
    p_ldap_string               in varchar2 default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_required_patch            in varchar2 default null,
    p_security_group_id         in number   default null,
    p_target                    in varchar2 default 'PRIME')
    ;
--
--==============================================================================
-- new API for plugin-based authentications (4.1+)
--==============================================================================
procedure create_authentication (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2,
    p_scheme_type               in varchar2,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_plsql_code                in varchar2 default null,
    p_verification_function     in varchar2 default null,
    p_invalid_session_type      in varchar2 default null,
    p_invalid_session_url       in varchar2 default null,
    p_logout_url                in varchar2 default null,
    p_pre_auth_process          in varchar2 default null,
    p_post_auth_process         in varchar2 default null,
    p_cookie_name               in varchar2 default null,
    p_cookie_path               in varchar2 default null,
    p_cookie_domain             in varchar2 default null,
    p_use_secure_cookie_yn      in varchar2 default null,
    p_ras_mode                  in number   default 0,
    p_ras_dynamic_roles         in varchar2 default null,
    p_ras_namespaces            in varchar2 default null,
    p_help_text                 in varchar2 default null,
    p_reference_id              in number   default null,
    p_comments                  in varchar2 default null,
    p_target                    in varchar2 default 'PRIME' );

--==============================================================================
-- websheet authentication
--==============================================================================
procedure create_ws_auth_setup(
    p_id                        in number   default null,
    p_websheet_application_id   in number   default null,
    p_name                      in varchar2 default null,
    p_description               in varchar2 default null,
    p_reference_id              in number   default null,
    p_page_sentry_function      in varchar2 default null,
    p_sess_verify_function      in varchar2 default null,
    p_invalid_session_page      in varchar2 default null,
    p_invalid_session_url       in varchar2 default null,
    p_pre_auth_process          in varchar2 default null,
    p_auth_function             in varchar2 default null,
    p_post_auth_process         in varchar2 default null,
    p_cookie_name               in varchar2 default null,
    p_cookie_path               in varchar2 default null,
    p_cookie_domain             in varchar2 default null,
    p_use_secure_cookie_yn      in varchar2 default null,
    p_ldap_host                 in varchar2 default null,
    p_ldap_port                 in varchar2 default null,
    p_ldap_use_ssl              in varchar2 default 'N',
    p_ldap_use_exact_dn         in varchar2 default 'Y',
    p_ldap_string               in varchar2 default null,
    p_ldap_search_filter        in varchar2 default null,
    p_ldap_edit_function        in varchar2 default null,
    p_ldap_username_escaping    in varchar2 default null,
    p_logout_url                in varchar2 default null,
    p_required_patch            in varchar2 default null,
    p_security_group_id         in number   default null,
    p_target                    in varchar2 default 'PRIME' );

function create_ws_auth_setup(
    p_id                        in number   default null,
    p_websheet_application_id   in number   default null,
    p_name                      in varchar2 default null,
    p_description               in varchar2 default null,
    p_reference_id              in number   default null,
    p_page_sentry_function      in varchar2 default null,
    p_sess_verify_function      in varchar2 default null,
    p_invalid_session_page      in varchar2 default null,
    p_invalid_session_url       in varchar2 default null,
    p_pre_auth_process          in varchar2 default null,
    p_auth_function             in varchar2 default null,
    p_post_auth_process         in varchar2 default null,
    p_cookie_name               in varchar2 default null,
    p_cookie_path               in varchar2 default null,
    p_cookie_domain             in varchar2 default null,
    p_use_secure_cookie_yn      in varchar2 default null,
    p_ldap_host                 in varchar2 default null,
    p_ldap_port                 in varchar2 default null,
    p_ldap_use_ssl              in varchar2 default 'N',
    p_ldap_use_exact_dn         in varchar2 default 'Y',
    p_ldap_string               in varchar2 default null,
    p_ldap_search_filter        in varchar2 default null,
    p_ldap_edit_function        in varchar2 default null,
    p_ldap_username_escaping    in varchar2 default null,
    p_logout_url                in varchar2 default null,
    p_required_patch            in varchar2 default null,
    p_security_group_id         in number   default null,
    p_target                    in varchar2 default 'PRIME')
    return number;

--##############################################################################
--#
--# FLASH CHARTS
--#
--##############################################################################

procedure create_flash_chart (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default g_page_id,
    p_region_id                  in number   default g_region_id,
    p_default_chart_type         in varchar2 default null,
    p_chart_title                in varchar2 default null,
    p_chart_width                in number   default null,
    p_chart_height               in number   default null,
    p_chart_animation            in varchar2 default null,
    p_display_attr               in varchar2 default null,
    p_dial_tick_attr             in varchar2 default null,
    p_margins                    in varchar2 default null,
    p_omit_label_interval        in number   default null,
    --
    p_bgtype                     in varchar2 default null,
    p_bgcolor1                   in varchar2 default null,
    p_bgcolor2                   in varchar2 default null,
    p_gradient_rotation          in number   default null,
    p_color_scheme               in varchar2 default null,
    p_custom_colors              in varchar2 default null,
    --
    p_x_axis_title               in varchar2 default null,
    p_x_axis_min                 in number   default null,
    p_x_axis_max                 in number   default null,
    p_x_axis_grid_spacing        in number   default null,
    p_x_axis_prefix              in varchar2 default null,
    p_x_axis_postfix             in varchar2 default null,
    p_x_axis_group_sep           in varchar2 default null,
    p_x_axis_decimal_place       in number   default null,
    --
    p_y_axis_title               in varchar2 default null,
    p_y_axis_min                 in number   default null,
    p_y_axis_max                 in number   default null,
    p_y_axis_grid_spacing        in number   default null,
    p_y_axis_prefix              in varchar2 default null,
    p_y_axis_postfix             in varchar2 default null,
    p_y_axis_group_sep           in varchar2 default null,
    p_y_axis_decimal_place       in number   default null,
    --
    p_async_update               in varchar2 default null,
    p_async_time                 in number   default null,
    --
    p_names_font                 in varchar2 default null,
    p_names_rotation             in number   default null,
    p_values_font                in varchar2 default null,
    p_values_rotation            in number   default null,
    p_hints_font                 in varchar2 default null,
    p_legend_font                in varchar2 default null,
    p_grid_labels_font           in varchar2 default null,
    p_chart_title_font           in varchar2 default null,
    p_x_axis_title_font          in varchar2 default null,
    p_y_axis_title_font          in varchar2 default null,
    --
    p_use_chart_xml              in varchar2 default null,
    p_chart_xml                  in varchar2 default null,
    p_attribute_01               in varchar2 default null,
    p_attribute_02               in varchar2 default null,
    p_attribute_03               in varchar2 default null,
    p_attribute_04               in varchar2 default null,
    p_attribute_05               in varchar2 default null,
    --
    p_id_offset                  in number   default 0,
    p_target                     in varchar2 default 'PRIME')
    ;

procedure create_flash_chart5 (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default g_page_id,
    p_region_id                  in number   default g_region_id,
    p_default_chart_type         in varchar2 default null,
    p_chart_title                in varchar2 default null,
    p_chart_rendering            in varchar2 default 'FLASH_PREFERRED',
    p_chart_name                 in varchar2 default null,
    p_chart_width                in number   default null,
    p_chart_height               in number   default null,
    p_chart_animation            in varchar2 default null,
    p_display_attr               in varchar2 default null,
    p_dial_tick_attr             in varchar2 default null,
    p_gantt_attr                 in varchar2 default null,
    p_pie_attr                   in varchar2 default 'Outside:::',
    p_map_attr                   in varchar2 default null,
    p_map_source                 in varchar2 default null,
    p_margins                    in varchar2 default null,
    p_omit_label_interval        in number   default null,
    --
    p_bgtype                     in varchar2 default null,
    p_bgcolor1                   in varchar2 default null,
    p_bgcolor2                   in varchar2 default null,
    p_gradient_rotation          in number   default null,
    p_grid_bgtype                in varchar2 default null,
    p_grid_bgcolor1              in varchar2 default null,
    p_grid_bgcolor2              in varchar2 default null,
    p_grid_gradient_rotation     in number   default null,
    p_color_scheme               in varchar2 default null,
    p_custom_colors              in varchar2 default null,
    p_map_undef_color_scheme     in varchar2 default null,
    p_map_undef_custom_colors    in varchar2 default null,
    --
    p_x_axis_title               in varchar2 default null,
    p_x_axis_min                 in number   default null,
    p_x_axis_max                 in number   default null,
    p_x_axis_grid_spacing        in number   default null,  -- obsolete
    p_x_axis_decimal_place       in number   default null,
    p_x_axis_prefix              in varchar2 default null,
    p_x_axis_postfix             in varchar2 default null,
    p_x_axis_label_rotation      in varchar2 default null,
    p_x_axis_label_font          in varchar2 default null,
    p_x_axis_major_interval      in number   default null,
    p_x_axis_minor_interval      in number   default null,
    --
    p_y_axis_title               in varchar2 default null,
    p_y_axis_min                 in number   default null,
    p_y_axis_max                 in number   default null,
    p_y_axis_grid_spacing        in number   default null,  -- obsolete
    p_y_axis_decimal_place       in number   default null,
    p_y_axis_prefix              in varchar2 default null,
    p_y_axis_postfix             in varchar2 default null,
    p_y_axis_label_rotation      in varchar2 default null,
    p_y_axis_label_font          in varchar2 default null,
    p_y_axis_major_interval      in number   default null,
    p_y_axis_minor_interval      in number   default null,
    --
    p_extra_y_axis_min           in number   default null,
    p_extra_y_axis_max           in number   default null,
    --
    p_async_update               in varchar2 default null,
    p_async_time                 in number   default null,
    --
    p_legend_title               in varchar2 default null,
    p_legend_title_font          in varchar2 default null,
    --
    p_names_font                 in varchar2 default null,
    p_names_rotation             in number   default null,
    p_values_font                in varchar2 default null,
    p_values_rotation            in number   default null,
    p_values_prefix              in varchar2 default null,
    p_values_postfix             in varchar2 default null,
    p_hints_font                 in varchar2 default null,
    p_legend_font                in varchar2 default null,
    p_grid_labels_font           in varchar2 default null,
    p_chart_title_font           in varchar2 default null,
    p_x_axis_title_font          in varchar2 default null,
    p_x_axis_title_rotation      in varchar2 default null,
    p_y_axis_title_font          in varchar2 default null,
    p_y_axis_title_rotation      in varchar2 default null,
    p_gauge_labels_font          in varchar2 default null,
    --
    p_use_chart_xml              in varchar2 default null,
    p_chart_xml                  in varchar2 default null,
    --
    p_id_offset                  in number   default 0,
    p_target                     in varchar2 default 'PRIME')
    ;

procedure create_flash_chart_series (
    p_id                           in number default null,
    p_chart_id                     in number default null,
    p_flow_id                      in number default null, -- defaults to chart's flow id
    p_series_seq                   in number default null,
    p_series_name                  in varchar2 default null,
    p_series_query                 in varchar2 default null,
    p_series_query_type            in varchar2 default null,
    p_series_query_parse_opt       in varchar2 default null,
    p_series_query_no_data_found   in varchar2 default null,
    p_series_query_row_count_max   in number default null,
    --
    p_id_offset                    in number   default 0,
    p_target                       in varchar2 default 'PRIME')
    ;

procedure create_flash_chart5_series (
    p_id                           in number   default null,
    p_chart_id                     in number   default null,
    p_flow_id                      in number   default null, -- defaults to chart's flow id
    p_series_seq                   in number   default null,
    p_series_name                  in varchar2 default null,
    p_series_query                 in varchar2 default null,
    p_series_type                  in varchar2 default null,
    p_series_required_role         in varchar2 default null,
    p_required_patch               in number   default null,
    p_series_query_type            in varchar2 default null,
    p_series_ajax_items_to_submit  in varchar2 default null,
    p_series_query_parse_opt       in varchar2 default null,
    p_series_query_no_data_found   in varchar2 default null,
    p_series_query_row_count_max   in number   default null,
    p_action_link                  in varchar2 default null,
    p_show_action_link             in varchar2 default null,
    p_action_link_checksum_type    in varchar2 default null,
    p_display_when_cond_type       in varchar2 default null,
    p_display_when_condition       in varchar2 default null,
    p_display_when_condition2      in varchar2 default null,
    --
    p_id_offset                    in number   default 0,
    p_target                       in varchar2 default 'PRIME')
    ;

procedure create_worksheet (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default g_page_id,
    p_region_id                  in number   default g_region_id,
    p_name                       in varchar2 default null,
    p_folder_id                  in number   default null,
    p_alias                      in varchar2 default null,
    p_report_id_item             in varchar2 default null,
    p_max_row_count              in varchar2 default null,
    p_max_row_count_message      in varchar2 default null,
    p_no_data_found_message      in varchar2 default null,
    p_max_rows_per_page          in varchar2 default null,
    p_search_button_label        in varchar2 default null,
    p_page_items_to_submit       in varchar2 default null, /* obsolete, is stored in wwv_flow_page_plugs.ajax_items_to_submit now */
    p_sort_asc_image             in varchar2 default null,
    p_sort_asc_image_attr        in varchar2 default null,
    p_sort_desc_image            in varchar2 default null,
    p_sort_desc_image_attr       in varchar2 default null,
    --
    p_sql_query                  in varchar2 default null,
    p_base_table_or_view         in varchar2 default null,
    p_base_pk1                   in varchar2 default null,
    p_base_pk2                   in varchar2 default null,
    p_base_pk3                   in varchar2 default null,
    p_sql_hint                   in varchar2 default null,
    --
    p_status                     in varchar2 default 'AVAILABLE_FOR_OWNER',
    --
    p_allow_report_saving        in varchar2 default 'Y',
    p_allow_save_rpt_public      in varchar2 default 'N',
    p_save_rpt_public_auth_scheme in varchar2 default null,
    p_allow_report_categories    in varchar2 default 'Y',
    p_show_nulls_as              in varchar2 default null,
    p_pagination_type            in varchar2 default null,
    p_pagination_display_pos     in varchar2 default null,
    p_button_template            in number   default null,  -- obsolete
    p_show_finder_drop_down      in varchar2 default 'Y',
    p_show_display_row_count     in varchar2 default 'N',
    p_show_search_bar            in varchar2 default 'Y',
    p_show_search_textbox        in varchar2 default 'Y',
    p_show_actions_menu          in varchar2 default 'Y',
    p_actions_menu_icon          in varchar2 default null,  -- obsolete
    p_finder_icon                in varchar2 default null,  -- obsolete
    p_report_list_mode           in varchar2 default null,
    p_fixed_header               in varchar2 default 'PAGE',
    p_fixed_header_max_height    in number   default null,
    --
    p_show_detail_link           in varchar2 default 'Y',
    p_show_select_columns        in varchar2 default 'Y',
    p_show_rows_per_page         in varchar2 default 'Y',
    p_show_filter                in varchar2 default 'Y',
    p_show_sort                  in varchar2 default 'Y',
    p_show_control_break         in varchar2 default 'Y',
    p_show_highlight             in varchar2 default 'Y',
    p_show_computation           in varchar2 default 'Y',
    p_show_aggregate             in varchar2 default 'Y',
    p_show_chart                 in varchar2 default 'Y',
    p_show_group_by              in varchar2 default 'Y',
    p_show_pivot                 in varchar2 default 'Y',
    p_show_notify                in varchar2 default 'N',
    p_show_calendar              in varchar2 default 'Y',
    p_show_flashback             in varchar2 default 'Y',
    p_show_reset                 in varchar2 default 'Y',
    p_show_download              in varchar2 default 'Y',
    p_show_help                  in varchar2 default 'Y',
    p_download_formats           in varchar2 default null,
    p_download_filename          in varchar2 default null,
    p_csv_output_separator       in varchar2 default null,
    p_csv_output_enclosed_by     in varchar2 default null,
    --
    p_email_from                 in varchar2 default null,
    --
    p_detail_link                in varchar2 default null,
    p_detail_link_text           in varchar2 default null,
    p_detail_link_attr           in varchar2 default null,
    p_detail_link_checksum_type  in varchar2 default null,
    p_detail_link_condition_type in varchar2 default null,
    p_detail_link_cond           in varchar2 default null,
    p_detail_link_cond2          in varchar2 default null,
    p_detail_link_auth_scheme    in varchar2 default null,
    --
    p_allow_exclude_null_values  in varchar2 default 'Y',
    p_allow_hide_extra_columns   in varchar2 default 'Y',
    --
    p_max_query_cost             in varchar2 default null,
    p_max_flashback              in varchar2 default null,
    p_worksheet_flags            in varchar2 default null,
    --
    p_icon_view_enabled_yn       in varchar2 default 'N',
    p_icon_view_use_custom       in varchar2 default 'N',
    p_icon_view_custom_link      in varchar2 default null,
    p_icon_view_link_column      in varchar2 default null,
    p_icon_view_img_src_column   in varchar2 default null,
    p_icon_view_label_column     in varchar2 default null,
    p_icon_view_img_attr_text    in varchar2 default null,
    p_icon_view_alt_text         in varchar2 default null,
    p_icon_view_title_text       in varchar2 default null,
    p_icon_view_columns_per_row  in number   default null,
    p_detail_view_enabled_yn     in varchar2 default 'N',
    p_detail_view_before_rows    in varchar2 default null,
    p_detail_view_for_each_row   in varchar2 default null,
    p_detail_view_after_rows     in varchar2 default null,
    --
    p_description                in varchar2 default null,
    p_owner                      in varchar2 default null,
    --
    p_internal_uid               in number default null,
    --
    p_id_offset                  in number   default 0,
    p_target                     in varchar2 default 'PRIME');

procedure create_worksheet_category (
    p_id                in number   default null,
    p_worksheet_id      in number   default g_worksheet_id,
    p_flow_id           in number   default wwv_flow.g_flow_id,
    p_application_user  in varchar2 default null,
    p_name              in varchar2 default null,
    p_display_sequence  in number   default null,
    --
    p_id_offset         in number   default 0,
    p_target            in varchar2 default 'PRIME');

procedure create_worksheet_column (
    p_id                      in number   default null,
    p_flow_id                 in number   default wwv_flow.g_flow_id,
    p_page_id                 in number   default g_page_id,
    p_worksheet_id            in number   default g_worksheet_id,
    p_websheet_id             in number   default null,
    --
    p_db_column_name          in varchar2 default null,
    p_display_order           in number   default null,
    p_group_id                in number   default null,
    p_column_identifier       in varchar2 default null,
    p_column_expr             in varchar2 default null,
    p_column_label            in varchar2 default null,
    p_report_label            in varchar2 default null,
    p_sync_form_label         in varchar2 default 'Y',
    --
    p_display_in_default_rpt  in varchar2 default 'Y',
    p_column_html_expression  in varchar2 default null,
    p_column_link             in varchar2 default null,
    p_column_linktext         in varchar2 default null,
    p_column_link_attr        in varchar2 default null,
    p_column_link_checksum_type in varchar2 default null,
    --
    p_is_sortable             in varchar2 default 'Y',
    p_allow_sorting           in varchar2 default 'Y',
    p_allow_filtering         in varchar2 default 'Y',
    p_allow_highlighting      in varchar2 default 'Y',
    p_allow_ctrl_breaks       in varchar2 default 'Y',
    p_allow_aggregations      in varchar2 default 'Y',
    p_allow_computations      in varchar2 default 'Y',
    p_allow_charting          in varchar2 default 'Y',
    p_allow_group_by          in varchar2 default 'Y',
    p_allow_pivot             in varchar2 default 'Y',
    p_allow_hide              in varchar2 default 'Y',
    --
    p_use_custom              in varchar2 default null,
    p_custom_filter           in varchar2 default null,
    p_base_column             in varchar2 default null,
    p_allow_filters           in varchar2 default null,
    --
    p_others_may_edit         in varchar2 default 'Y',
    p_others_may_view         in varchar2 default 'Y',
    --
    p_column_type             in varchar2 default null,
    p_display_as              in varchar2 default 'TEXT',
    p_display_text_as         in varchar2 default 'ESCAPE_SC',
    p_heading_alignment       in varchar2 default 'CENTER',
    p_column_alignment        in varchar2 default 'LEFT',
    p_max_length              in number   default null,
    p_display_width           in number   default null,
    p_display_height          in number   default null,
    --
    p_allow_null              in varchar2 default null,
    p_format_mask             in varchar2 default null,
    p_tz_dependent            in varchar2 default null,
    p_static_id               in varchar2 default null,
    p_css_classes             in varchar2 default null,
    p_fact_table_key          in varchar2 default null,
    p_dimension_table         in varchar2 default null,
    p_dimension_table_id      in varchar2 default null,
    p_dimension_table_value   in varchar2 default null,
    --
    p_rpt_distinct_lov        in varchar2 default null,
    p_rpt_lov                 in varchar2 default null,
    p_rpt_named_lov           in number   default null,
    p_rpt_show_filter_lov     in varchar2 default 'D',
    p_rpt_filter_date_ranges  in varchar2 default 'ALL',
    --
    p_static_lov              in varchar2 default null,
    p_lov_null_text           in varchar2 default null,
    p_lov_allow_new_values    in varchar2 default null,
    p_lov_is_distinct_values  in varchar2 default null,
    p_lov_num_columns         in number   default null,
    p_lov_id                  in number   default null,
    --
    p_computation_type        in varchar2 default null,
    p_computation_expr_1      in varchar2 default null,
    p_computation_expr_2      in varchar2 default null,
    --
    p_validation_type         in varchar2 default null,
    p_validation_expr_1       in varchar2 default null,
    p_validation_expr_2       in varchar2 default null,
    --
    p_display_condition_type  in varchar2 default null,
    p_display_condition       in varchar2 default null,
    p_display_condition2      in varchar2 default null,
    --
    p_default_value           in varchar2 default null,
    p_default_when            in varchar2 default null,
    p_help_text               in varchar2 default null,
    p_security_scheme         in varchar2 default null,
    p_column_flags            in varchar2 default null,
    p_column_comment          in varchar2 default null,
    --
    p_id_offset               in number   default 0,
    p_target                  in varchar2 default 'PRIME');

procedure create_worksheet_col_group (
    p_id                      in number   default null,
    p_flow_id                 in number   default wwv_flow.g_flow_id,
    p_worksheet_id            in number   default g_worksheet_id,
    p_websheet_id             in number   default null,
    p_name                    in varchar2 default null,
    p_description             in varchar2 default null,
    p_display_sequence        in number   default null,
    --
    p_id_offset               in number   default 0,
    p_target                  in varchar2 default 'PRIME');

procedure create_worksheet_rpt (
    p_id                      in number   default null,
    p_flow_id                 in number   default wwv_flow.g_flow_id,
    p_page_id                 in number   default g_page_id,
    p_worksheet_id            in number   default g_worksheet_id,
    p_websheet_id             in number   default null,
    p_session_id              in number   default null,
    p_base_report_id          in number   default null,
    p_application_user        in varchar2 default null,
    p_name                    in varchar2 default null,
    p_description             in varchar2 default null,
    p_report_seq              in number   default null,
    p_report_type             in varchar2 default null,
    p_report_alias            in varchar2 default null,
    p_status                  in varchar2 default null,
    p_category_id             in number   default null,
    p_autosave                in varchar2 default null,
    p_is_default              in varchar2 default null,
    --
    p_display_rows            in number   default null,
    p_view_mode               in varchar2 default null,
    p_report_columns          in varchar2 default null,
    --
    p_sort_column_1           in varchar2 default null,
    p_sort_direction_1        in varchar2 default null,
    p_sort_column_2           in varchar2 default null,
    p_sort_direction_2        in varchar2 default null,
    p_sort_column_3           in varchar2 default null,
    p_sort_direction_3        in varchar2 default null,
    p_sort_column_4           in varchar2 default null,
    p_sort_direction_4        in varchar2 default null,
    p_sort_column_5           in varchar2 default null,
    p_sort_direction_5        in varchar2 default null,
    p_sort_column_6           in varchar2 default null,
    p_sort_direction_6        in varchar2 default null,
    --
    p_break_on                in varchar2 default null,
    p_break_enabled_on        in varchar2 default null,
    p_control_break_options   in varchar2 default null,
    --
    p_sum_columns_on_break    in varchar2 default null,
    p_avg_columns_on_break    in varchar2 default null,
    p_max_columns_on_break    in varchar2 default null,
    p_min_columns_on_break    in varchar2 default null,
    p_median_columns_on_break in varchar2 default null,
    p_mode_columns_on_break   in varchar2 default null,
    p_count_columns_on_break  in varchar2 default null,
    p_count_distnt_col_on_break in varchar2 default null,
    --
    p_flashback_mins_ago      in varchar2 default null,
    p_flashback_enabled       in varchar2 default null,
    --
    p_chart_type              in varchar2 default null,
    p_chart_3d                in varchar2 default null,
    p_chart_label_column      in varchar2 default null,
    p_chart_label_title       in varchar2 default null,
    p_chart_value_column      in varchar2 default null,
    p_chart_aggregate         in varchar2 default null,
    p_chart_value_title       in varchar2 default null,
    p_chart_sorting           in varchar2 default null,
    --
    p_calendar_date_column    in varchar2 default null,
    p_calendar_display_column in varchar2 default null,
    --
    p_id_offset               in number   default 0,
    p_target                  in varchar2 default 'PRIME');

procedure create_worksheet_condition (
    p_id                    in number   default null,
    p_flow_id               in number   default wwv_flow.g_flow_id,
    p_page_id               in number   default g_page_id,
    p_worksheet_id          in number   default g_worksheet_id,
    p_websheet_id           in number   default null,
    p_report_id             in number   default null,
    p_name                  in varchar2 default null,
    p_condition_type        in varchar2 default null,
    p_allow_delete          in varchar2 default null,
    --
    p_column_name           in varchar2 default null,
    p_operator              in varchar2 default null,
    p_expr_type             in varchar2 default null,
    p_expr                  in varchar2 default null,
    p_expr2                 in varchar2 default null,
    p_time_zone             in varchar2 default null,
    p_condition_sql         in varchar2 default null,
    p_condition_display     in varchar2 default null,
    --
    p_enabled               in varchar2 default null,
    --
    p_highlight_sequence    in number   default null,
    p_row_bg_color          in varchar2 default null,
    p_row_font_color        in varchar2 default null,
    p_row_format            in varchar2 default null,
    p_column_bg_color       in varchar2 default null,
    p_column_font_color     in varchar2 default null,
    p_column_format         in varchar2 default null,
    --
    p_id_offset             in number   default 0,
    p_target                in varchar2 default 'PRIME');

procedure create_worksheet_computation (
    p_id                    in number   default null,
    p_flow_id               in number   default wwv_flow.g_flow_id,
    p_page_id               in number   default g_page_id,
    p_worksheet_id          in number   default g_worksheet_id,
    p_websheet_id           in number   default null,
    p_report_id             in number   default null,
    --
    p_db_column_name        in varchar2 default null,
    p_column_identifier     in varchar2 default null,
    p_computation_expr      in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_column_type           in varchar2 default null,
    --
    p_column_label          in varchar2 default null,
    p_report_label          in varchar2 default null,
    --
    p_id_offset             in number   default 0,
    p_target                in varchar2 default 'PRIME');

procedure create_worksheet_group_by (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default g_page_id,
    p_worksheet_id               in number   default g_worksheet_id,
    p_websheet_id                in number   default null,
    p_report_id                  in number   default null,
    --
    p_group_by_columns           in varchar2 default null,
    p_function_01                in varchar2 default null,
    p_function_column_01         in varchar2 default null,
    p_function_db_column_name_01 in varchar2 default null,
    p_function_label_01          in varchar2 default null,
    p_function_format_mask_01    in varchar2 default null,
    p_function_sum_01            in varchar2 default null,
    p_function_02                in varchar2 default null,
    p_function_column_02         in varchar2 default null,
    p_function_db_column_name_02 in varchar2 default null,
    p_function_label_02          in varchar2 default null,
    p_function_format_mask_02    in varchar2 default null,
    p_function_sum_02            in varchar2 default null,
    p_function_03                in varchar2 default null,
    p_function_column_03         in varchar2 default null,
    p_function_db_column_name_03 in varchar2 default null,
    p_function_label_03          in varchar2 default null,
    p_function_format_mask_03    in varchar2 default null,
    p_function_sum_03            in varchar2 default null,
    p_function_04                in varchar2 default null,
    p_function_column_04         in varchar2 default null,
    p_function_db_column_name_04 in varchar2 default null,
    p_function_label_04          in varchar2 default null,
    p_function_format_mask_04    in varchar2 default null,
    p_function_sum_04            in varchar2 default null,
    p_function_05                in varchar2 default null,
    p_function_column_05         in varchar2 default null,
    p_function_db_column_name_05 in varchar2 default null,
    p_function_label_05          in varchar2 default null,
    p_function_format_mask_05    in varchar2 default null,
    p_function_sum_05            in varchar2 default null,
    p_function_06                in varchar2 default null,
    p_function_column_06         in varchar2 default null,
    p_function_db_column_name_06 in varchar2 default null,
    p_function_label_06          in varchar2 default null,
    p_function_format_mask_06    in varchar2 default null,
    p_function_sum_06            in varchar2 default null,
    p_function_07                in varchar2 default null,
    p_function_column_07         in varchar2 default null,
    p_function_db_column_name_07 in varchar2 default null,
    p_function_label_07          in varchar2 default null,
    p_function_format_mask_07    in varchar2 default null,
    p_function_sum_07            in varchar2 default null,
    p_function_08                in varchar2 default null,
    p_function_column_08         in varchar2 default null,
    p_function_db_column_name_08 in varchar2 default null,
    p_function_label_08          in varchar2 default null,
    p_function_format_mask_08    in varchar2 default null,
    p_function_sum_08            in varchar2 default null,
    p_function_09                in varchar2 default null,
    p_function_column_09         in varchar2 default null,
    p_function_db_column_name_09 in varchar2 default null,
    p_function_label_09          in varchar2 default null,
    p_function_format_mask_09    in varchar2 default null,
    p_function_sum_09            in varchar2 default null,
    p_function_10                in varchar2 default null,
    p_function_column_10         in varchar2 default null,
    p_function_db_column_name_10 in varchar2 default null,
    p_function_label_10          in varchar2 default null,
    p_function_format_mask_10    in varchar2 default null,
    p_function_sum_10            in varchar2 default null,
    p_function_11                in varchar2 default null,
    p_function_column_11         in varchar2 default null,
    p_function_db_column_name_11 in varchar2 default null,
    p_function_label_11          in varchar2 default null,
    p_function_format_mask_11    in varchar2 default null,
    p_function_sum_11            in varchar2 default null,
    p_function_12                in varchar2 default null,
    p_function_column_12         in varchar2 default null,
    p_function_db_column_name_12 in varchar2 default null,
    p_function_label_12          in varchar2 default null,
    p_function_format_mask_12    in varchar2 default null,
    p_function_sum_12            in varchar2 default null,
    p_sort_column_01             in varchar2 default null,
    p_sort_direction_01          in varchar2 default null,
    p_sort_column_02             in varchar2 default null,
    p_sort_direction_02          in varchar2 default null,
    p_sort_column_03             in varchar2 default null,
    p_sort_direction_03          in varchar2 default null,
    p_sort_column_04             in varchar2 default null,
    p_sort_direction_04          in varchar2 default null,
    p_sort_column_05             in varchar2 default null,
    p_sort_direction_05          in varchar2 default null,
    p_sort_column_06             in varchar2 default null,
    p_sort_direction_06          in varchar2 default null,
    p_sort_column_07             in varchar2 default null,
    p_sort_direction_07          in varchar2 default null,
    p_sort_column_08             in varchar2 default null,
    p_sort_direction_08          in varchar2 default null,
    p_sort_column_09             in varchar2 default null,
    p_sort_direction_09          in varchar2 default null,
    p_sort_column_10             in varchar2 default null,
    p_sort_direction_10          in varchar2 default null,
    p_sort_column_11             in varchar2 default null,
    p_sort_direction_11          in varchar2 default null,
    p_sort_column_12             in varchar2 default null,
    p_sort_direction_12          in varchar2 default null,
    --
    p_id_offset                  in number   default 0,
    p_target                     in varchar2 default 'PRIME');

procedure create_worksheet_notify (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_worksheet_id           in number   default g_worksheet_id,
    p_websheet_id            in number   default null,
    p_report_id              in number   default null,
    p_owner                  in varchar2 default null,
    p_language               in varchar2 default null,
    p_email_from             in varchar2 default null,
    p_email_subject          in varchar2 default null,
    p_email_address          in varchar2 default null,
    p_start_date             in varchar2 default null,
    p_end_date               in varchar2 default null,
    p_end_day                in number   default null,
    p_end_day_unit           in varchar2 default null,
    p_offset_date            in varchar2 default null,
    p_notify_interval        in varchar2 default null,
    p_status                 in varchar2 default null,
    p_notify_error           in varchar2 default null,
    --
    p_id_offset              in number   default 0,
    p_target                 in varchar2 default 'PRIME');

procedure create_worksheet_pivot (
    p_id            in number   default null,
    p_flow_id       in number   default wwv_flow.g_flow_id,
    p_page_id       in number   default g_page_id,
    p_worksheet_id  in number   default g_worksheet_id,
    p_websheet_id   in number   default null,
    p_report_id     in number   default null,
    --
    p_pivot_columns in varchar2 default null,
    p_row_columns   in varchar2 default null,
    --
    p_id_offset     in number   default 0,
    p_target        in varchar2 default 'PRIME');

procedure create_worksheet_pivot_agg (
    p_id              in number   default null,
    p_pivot_id        in number   default null,
    p_display_seq     in number   default null,
    p_function_name   in varchar2 default null,
    p_column_name     in varchar2 default null,
    p_db_column_name  in varchar2 default null,
    p_column_label    in varchar2 default null,
    p_format_mask     in varchar2 default null,
    p_display_sum     in varchar2 default 'N',
    --
    p_id_offset       in number   default 0,
    p_target          in varchar2 default 'PRIME');

procedure create_worksheet_pivot_sort (
    p_id                in number   default null,
    p_pivot_id          in number   default null,
    p_sort_seq          in number   default null,
    p_sort_column_name  in varchar2 default null,
    p_sort_direction    in varchar2 default null,
    --
    p_id_offset         in number   default 0,
    p_target            in varchar2 default 'PRIME');

procedure create_entry_point(
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_page_reset                in varchar2 default null,
    p_entry_point_comment       in number   default null,
    p_security_group_id         in number   default null,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure create_entry_point_args(
    p_id                        in number   default null,
    p_flow_entry_point_id       in number   default null,
    p_entry_point_arg_sequence  in varchar2 default null,
    p_entry_point_arg_item_id   in varchar2 default null,
    p_entry_point_arg_comment   in number   default null,
    p_security_group_id         in number   default null,
    p_target                    in varchar2 default 'PRIME')
    ;

procedure set_security_group_id(
    p_security_group_id in number default null)
    --
    -- This procedure allows the caller to set wwv_flow_security.g_security_group_id
    -- to the security group id of the schema they are currently running in.
    --
    ;

function get_security_group_id
    --
    -- This function returns wwv_flow_security.g_security_group_id
    --
    return number
    ;

procedure update_owner(
    -----------------------------
    -- Change flow schema (owner)
    --
    p_flow_id in number   default wwv_flow.g_flow_id,
    p_owner   in varchar2 default null)
    ;

procedure set_build_status_run_only(
    ---------------------------------------
    -- Change flow build status to RUN_ONLY
    --
    p_flow_id in number default wwv_flow.g_flow_id)
    ;

procedure delete_template(
    ------------------------------------
    -- Delete template of specified type
    --
    p_type    in varchar2 default null,
    p_flow_id in number   default wwv_flow.g_flow_id,
    p_id      in number   default null)
    ;

procedure set_page_help_text(
    ----------------------------------
    -- select page help text into clob
    --
    p_flow_id       in number   default wwv_flow.g_flow_id,
    p_flow_step_id  in number   default null,
    p_text          in varchar2 default null)
    ;

procedure set_html_page_header(
    ------------------------------------
    -- select html page header into clob
    --
    p_flow_id       in number   default wwv_flow.g_flow_id,
    p_flow_step_id  in number   default null,
    p_text          in varchar2 default null)
    ;

procedure import_script (
    p_filename        in varchar2,
    p_varchar2_table  in sys.dbms_sql.varchar2_table,
    p_flow_id         in number default wwv_flow.g_flow_id,
    p_pathid          in number default null,
    p_name            in varchar2 default null,
    p_title           in varchar2 default null,
    p_mime_type       in varchar2 default null,
    p_dad_charset     in varchar2 default null,
    p_deleted_as_of   in date default null,
    p_content_type    in varchar2 default null,
    p_language        in varchar2 default null,
    p_description     in varchar2 default null,
    p_file_type       in varchar2 default null,
    p_file_charset    in varchar2 default null)
    ;

procedure create_script (
    p_id                in number  default null,
    p_flow_id           in number  default wwv_flow.g_flow_id,
    p_name              in varchar2 default null,
    p_pathid            in number default null,
    p_filename          in varchar2,
    p_title             in varchar2 default null,
    p_mime_type         in varchar2 default null,
    p_dad_charset       in varchar2 default null,
    p_created_by        in varchar2 default null,
    p_created_on        in date     default null,
    p_updated_by        in varchar2 default null,
    p_updated_on        in date     default null,
    p_deleted_as_of     in date default null,
    p_content_type      in varchar2 default null,
    p_blob_content      in sys.dbms_sql.varchar2_table,
    p_language          in varchar2 default null,
    p_description       in varchar2 default null,
    p_file_type         in varchar2 default null,
    p_file_charset      in varchar2 default null)
    ;

procedure update_page_item (
    p_flow_id              in number,
    p_page_id              in number,
    p_item_id              in number,
    p_new_sequence         in number,
    p_display_as           in varchar2,
    p_new_name             in varchar2,
    p_new_label            in varchar2,
    p_new_begin_new_line   in varchar2,
    p_new_begin_new_field  in varchar2,
    p_attribute_01         in varchar2,
    p_attribute_02         in varchar2,
    p_attribute_03         in varchar2,
    p_attribute_04         in varchar2,
    p_attribute_05         in varchar2,
    p_attribute_06         in varchar2,
    p_attribute_07         in varchar2,
    p_attribute_08         in varchar2,
    p_attribute_09         in varchar2,
    p_attribute_10         in varchar2,
    p_attribute_11         in varchar2,
    p_attribute_12         in varchar2,
    p_attribute_13         in varchar2,
    p_attribute_14         in varchar2,
    p_attribute_15         in varchar2
    );

procedure set_feedback_origin (
    p_identifier  in varchar2,
    p_import_into in varchar2 );

procedure import_feedback (
    p_id                        in number,
    p_feedback_id               in number   default null,
    p_feedback_comment          in varchar2,
    p_developer_comment         in varchar2 default null,
    p_public_response           in varchar2 default null,
    p_feedback_status           in number   default null,
    p_feedback_type             in number   default null,
    p_tags                      in varchar2 default null,
    p_application_id            in number   default null,
    p_application_name          in varchar2 default null,
    p_page_id                   in number   default null,
    p_page_name                 in varchar2 default null,
    p_page_last_updated_by      in varchar2 default null,
    p_page_last_updated_on      in date     default null,
    p_session_id                in varchar2 default null,
    p_apex_user                 in varchar2 default null,
    p_user_email                in varchar2 default null,
    p_logging_email             in varchar2 default null,
    p_logging_security_group_id in number   default null,
    p_logged_by_workspace_name  in varchar2 default null,
    p_application_version       in varchar2 default null,
    p_parsing_schema            in varchar2 default null,
    p_http_user_agent           in varchar2 default null,
    p_remote_addr               in varchar2 default null,
    p_remote_user               in varchar2 default null,
    p_http_host                 in varchar2 default null,
    p_server_name               in varchar2 default null,
    p_server_port               in varchar2 default null,
    p_screen_width              in varchar2 default null,
    p_screen_height             in varchar2 default null,
    p_session_state             in varchar2 default null,
    p_session_info              in varchar2 default null,
    p_label_01                  in varchar2 default null,
    p_label_02                  in varchar2 default null,
    p_label_03                  in varchar2 default null,
    p_label_04                  in varchar2 default null,
    p_label_05                  in varchar2 default null,
    p_label_06                  in varchar2 default null,
    p_label_07                  in varchar2 default null,
    p_label_08                  in varchar2 default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_created_by                in varchar2                 default null,
    p_created_on                in timestamp with time zone default null,
    p_updated_by                in varchar2                 default null,
    p_updated_on                in timestamp with time zone default null );

procedure import_feedback_followup (
    p_id          in number,
    p_feedback_id in number,
    p_follow_up   in varchar2,
    p_email       in varchar2,
    p_created_by  in varchar2                 default null,
    p_created_on  in timestamp with time zone default null,
    p_updated_by  in varchar2                 default null,
    p_updated_on  in timestamp with time zone default null );

procedure parse_file_source (
    p_source               in varchar2,
    p_db_column           out varchar2,
    p_mimetype_column     out varchar2,
    p_filename_column     out varchar2,
    p_last_updated_col    out varchar2,
    p_charset_column      out varchar2,
    p_content_disposition out varchar2,
    p_download_link_text  out varchar2 );

-------------------------------
-- Websheet Procedures
--
procedure create_ws_app (
    p_id                            in number default null,
    p_name                          in varchar2 default null,
    p_owner                         in varchar2 default null,
    p_description                   in varchar2 default null,
    p_status                        in varchar2 default null,
    p_date_format                   in varchar2 default null,
    p_language                      in varchar2 default null,
    p_territory                     in varchar2 default null,
    p_home_page_id                  in number default null,
    p_page_style                    in number default null,
    p_custom_css                    in varchar2 default null,
    p_auth_id                       in number default null,
    p_acl_type                      in varchar2 default null,
    p_login_url                     in varchar2 default null,
    p_logout_url                    in varchar2 default null,
    p_allow_sql_yn                  in varchar2 default null,
    p_show_peer_navigation_yn       in varchar2 default null,
    p_show_child_navigation_yn      in varchar2 default null,
    p_show_annotations_control_yn   in varchar2 default null,
    p_show_reset_passwd_yn          in varchar2 default null,
    p_allow_public_access_yn        in varchar2 default null,
    p_login_page_message            in varchar2 default null,
    p_logo_type                     in varchar2 default null,
    p_logo_text                     in varchar2 default null,
    p_logo_text_attributes          in varchar2 default null,
    p_varchar2_table                in sys.dbms_sql.varchar2_table,
    p_logo_image_filename           in varchar2 default null,
    p_logo_image_mimetype           in varchar2 default null,
    p_logo_image_charset            in varchar2 default null,
    p_logo_image_last_update        in date default null,
    p_logo_image_attributes         in varchar2 default null,
    p_logo_filepath                 in varchar2 default null,
    p_logo_filepath_attributes      in varchar2 default null,
    p_email_from                    in varchar2 default null,
    --
    p_id_offset                     in number   default 0,
    p_target                        in varchar2 default 'PRIME'
    );

procedure create_ws_app_sug_objects (
    p_id                 in number      default null,
    p_ws_app_id          in number      default null,
    p_object_name        in varchar2    default null,
    p_object_comment     in varchar2    default null,
    p_last_updated_by    in varchar2    default null,
    p_last_updated_on    in date        default null,
    p_created_by         in varchar2    default null,
    p_created_on         in date        default null);

procedure create_ws_worksheet (
    p_id                         in number   default null,
    p_flow_id                    in number   default 4900,
    p_page_id                    in number   default null,
    p_region_id                  in number   default null,
    p_name                       in varchar2 default null,
    p_folder_id                  in number   default null,
    p_alias                      in varchar2 default null,
    p_report_id_item             in varchar2 default null,
    p_max_row_count              in varchar2 default null,
    p_max_row_count_message      in varchar2 default null,
    p_no_data_found_message      in varchar2 default null,
    p_max_rows_per_page          in varchar2 default null,
    p_search_button_label        in varchar2 default null,
    p_page_items_to_submit       in varchar2 default null,
    p_sort_asc_image             in varchar2 default null,
    p_sort_asc_image_attr        in varchar2 default null,
    p_sort_desc_image            in varchar2 default null,
    p_sort_desc_image_attr       in varchar2 default null,
    --
    p_sql_query                  in varchar2 default null,
    p_base_table_or_view         in varchar2 default null,
    p_base_pk1                   in varchar2 default null,
    p_base_pk2                   in varchar2 default null,
    p_base_pk3                   in varchar2 default null,
    p_sql_hint                   in varchar2 default null,
    --
    p_status                     in varchar2 default null,
    --
    p_allow_report_saving        in varchar2 default null,
    p_allow_save_rpt_public      in varchar2 default null,
    p_save_rpt_public_auth_scheme in varchar2 default null,
    p_allow_report_categories    in varchar2 default null,
    p_show_nulls_as              in varchar2 default null,
    p_pagination_type            in varchar2 default null,
    p_pagination_display_pos     in varchar2 default null,
    p_button_template            in number   default null,  -- obsolete
    p_show_finder_drop_down      in varchar2 default null,
    p_show_display_row_count     in varchar2 default null,
    p_show_search_bar            in varchar2 default null,
    p_show_search_textbox        in varchar2 default null,
    p_show_actions_menu          in varchar2 default null,
    p_actions_menu_icon          in varchar2 default null,  -- obsolete
    p_finder_icon                in varchar2 default null,  -- obsolete
    p_report_list_mode           in varchar2 default null,
    p_fixed_header               in varchar2 default 'PAGE',
    p_fixed_header_max_height    in number   default null,
    --
    p_show_detail_link           in varchar2 default null,
    p_show_select_columns        in varchar2 default null,
    p_show_rows_per_page         in varchar2 default null,
    p_show_filter                in varchar2 default null,
    p_show_sort                  in varchar2 default null,
    p_show_control_break         in varchar2 default null,
    p_show_highlight             in varchar2 default null,
    p_show_computation           in varchar2 default null,
    p_show_aggregate             in varchar2 default null,
    p_show_chart                 in varchar2 default null,
    p_show_group_by              in varchar2 default null,
    p_show_pivot                 in varchar2 default null,
    p_show_notify                in varchar2 default null,
    p_show_calendar              in varchar2 default null,
    p_show_flashback             in varchar2 default null,
    p_show_reset                 in varchar2 default null,
    p_show_download              in varchar2 default null,
    p_show_help                  in varchar2 default null,
    p_download_formats           in varchar2 default null,
    p_download_filename          in varchar2 default null,
    p_csv_output_separator       in varchar2 default null,
    p_csv_output_enclosed_by     in varchar2 default null,
    p_email_from                 in varchar2 default null,
    --
    p_detail_link                in varchar2 default null,
    p_detail_link_text           in varchar2 default null,
    p_detail_link_attr           in varchar2 default null,
    p_detail_link_checksum_type  in varchar2 default null,
    p_detail_link_condition_type in varchar2 default null,
    p_detail_link_cond           in varchar2 default null,
    p_detail_link_cond2          in varchar2 default null,
    p_detail_link_auth_scheme    in varchar2 default null,
    --
    p_allow_exclude_null_values  in varchar2 default null,
    p_allow_hide_extra_columns   in varchar2 default null,
    --
    p_max_query_cost             in varchar2 default null,
    p_max_flashback              in varchar2 default null,
    p_worksheet_flags            in varchar2 default null,
    --
    p_icon_view_enabled_yn       in varchar2 default 'N',
    p_icon_view_use_custom       in varchar2 default 'N',
    p_icon_view_custom_link      in varchar2 default null,
    p_icon_view_link_column      in varchar2 default null,
    p_icon_view_img_src_column   in varchar2 default null,
    p_icon_view_label_column     in varchar2 default null,
    p_icon_view_img_attr_text    in varchar2 default null,
    p_icon_view_alt_text         in varchar2 default null,
    p_icon_view_title_text       in varchar2 default null,
    p_icon_view_columns_per_row  in number   default null,
    p_detail_view_enabled_yn     in varchar2 default 'N',
    p_detail_view_before_rows    in varchar2 default null,
    p_detail_view_for_each_row   in varchar2 default null,
    p_detail_view_after_rows     in varchar2 default null,
    --
    p_description                in varchar2 default null,
    p_owner                      in varchar2 default null,
    --
    p_internal_uid               in number default null,
    --
    p_id_offset                  in number   default 0,
    p_target                     in varchar2 default 'PRIME');

procedure create_ws_data_grid (
    p_id                     in number default null,
    p_ws_app_id              in number default null,
    p_worksheet_id           in number default null,
    p_status                 in varchar2 default null,
    p_publish_yn             in varchar2 default null,
    p_websheet_name          in varchar2 default null,
    p_websheet_alias         in varchar2 default null,
    p_websheet_type          in varchar2 default null,
    p_is_template            in varchar2 default null,
    p_ws_report_owner        in varchar2 default null,
    p_websheet_owner         in varchar2 default null,
    p_view_only_columns      in varchar2 default null,
    p_username_in_columns    in varchar2 default null,
    p_parent_column          in varchar2 default null,
    p_child_column           in varchar2 default null,
    p_row_pk1                in varchar2 default null,
    p_row_pk2                in varchar2 default null,
    p_row_pk3                in varchar2 default null,
    p_geo_url                in varchar2 default null,
    p_geo_proxy              in varchar2 default null,
    p_geo_addr_sep           in varchar2 default null,
    p_geo_resp_type          in varchar2 default null,
    p_geo_resp_ns            in varchar2 default null,
    p_geo_path_to_lat        in varchar2 default null,
    p_geo_path_to_long       in varchar2 default null,
    p_geo_resp_sep           in varchar2 default null,
    --
    p_id_offset              in number   default 0,
    p_target                 in varchar2 default 'PRIME');

procedure create_ws_column (
    p_id                      in number   default null,
    p_flow_id                 in number   default 4900,
    p_page_id                 in number   default null,
    p_worksheet_id            in number   default null,
    p_websheet_id             in number   default null,
    --
    p_db_column_name          in varchar2 default null,
    p_display_order           in number   default null,
    p_data_grid_form_seq      in number   default null,
    p_group_id                in number   default null,
    p_column_identifier       in varchar2 default null,
    p_column_expr             in varchar2 default null,
    p_column_label            in varchar2 default null,
    p_report_label            in varchar2 default null,
    p_sync_form_label         in varchar2 default 'Y',
    --
    p_display_in_default_rpt  in varchar2 default null,
    p_column_html_expression  in varchar2 default null,
    p_column_link             in varchar2 default null,
    p_column_linktext         in varchar2 default null,
    p_column_link_attr        in varchar2 default null,
    p_column_link_checksum_type in varchar2 default null,
    --
    p_is_sortable             in varchar2 default null,
    p_allow_sorting           in varchar2 default null,
    p_allow_filtering         in varchar2 default null,
    p_allow_highlighting      in varchar2 default null,
    p_allow_ctrl_breaks       in varchar2 default null,
    p_allow_aggregations      in varchar2 default null,
    p_allow_computations      in varchar2 default null,
    p_allow_charting          in varchar2 default null,
    p_allow_group_by          in varchar2 default null,
    p_allow_pivot             in varchar2 default null,
    p_allow_hide              in varchar2 default null,
    --
    p_use_custom              in varchar2 default null,
    p_custom_filter           in varchar2 default null,
    p_base_column             in varchar2 default null,
    p_allow_filters           in varchar2 default null,
    --
    p_others_may_edit         in varchar2 default null,
    p_others_may_view         in varchar2 default null,
    --
    p_column_type             in varchar2 default null,
    p_display_as              in varchar2 default null,
    p_display_text_as         in varchar2 default null,
    p_heading_alignment       in varchar2 default null,
    p_column_alignment        in varchar2 default null,
    p_max_length              in number   default null,
    p_display_width           in number   default null,
    p_display_height          in number   default null,
    --
    p_allow_null              in varchar2 default null,
    p_format_mask             in varchar2 default null,
    p_tz_dependent            in varchar2 default null,
    p_fact_table_key          in varchar2 default null,
    p_dimension_table         in varchar2 default null,
    p_dimension_table_id      in varchar2 default null,
    p_dimension_table_value   in varchar2 default null,
    --
    p_rpt_distinct_lov        in varchar2 default null,
    p_rpt_lov                 in varchar2 default null,
    p_rpt_named_lov           in number   default null,
    p_rpt_show_filter_lov     in varchar2 default null,
    p_rpt_filter_date_ranges  in varchar2 default null,
    --
    p_static_lov              in varchar2 default null,
    p_lov_null_text           in varchar2 default null,
    p_lov_allow_new_values    in varchar2 default null,
    p_lov_is_distinct_values  in varchar2 default null,
    p_lov_num_columns         in number   default null,
    p_lov_id                  in number   default null,
    --
    p_computation_type        in varchar2 default null,
    p_computation_expr_1      in varchar2 default null,
    p_computation_expr_2      in varchar2 default null,
    --
    p_validation_type         in varchar2 default null,
    p_validation_expr_1       in varchar2 default null,
    p_validation_expr_2       in varchar2 default null,
    --
    p_display_condition_type  in varchar2 default null,
    p_display_condition       in varchar2 default null,
    p_display_condition2      in varchar2 default null,
    --
    p_default_value           in varchar2 default null,
    p_default_when            in varchar2 default null,
    p_help_text               in varchar2 default null,
    p_security_scheme         in varchar2 default null,
    p_column_flags            in varchar2 default null,
    p_column_comment          in varchar2 default null,
    --
    p_id_offset               in number   default 0,
    p_target                  in varchar2 default 'PRIME');

procedure create_ws_col_group (
    p_id                      in number   default null,
    p_flow_id                 in number   default 4900,
    p_worksheet_id            in number   default null,
    p_websheet_id             in number   default null,
    p_name                    in varchar2 default null,
    p_description             in varchar2 default null,
    p_display_sequence        in number   default null,
    --
    p_id_offset               in number   default 0,
    p_target                  in varchar2 default 'PRIME');


procedure create_ws_rpt (
    p_id                      in number   default null,
    p_flow_id                 in number   default 4900,
    p_page_id                 in number   default null,
    p_worksheet_id            in number   default null,
    p_websheet_id             in number   default null,
    p_session_id              in number   default null,
    p_base_report_id          in number   default null,
    p_application_user        in varchar2 default null,
    p_name                    in varchar2 default null,
    p_description             in varchar2 default null,
    p_report_seq              in number   default null,
    p_report_type             in varchar2 default null,
    p_report_alias            in varchar2 default null,
    p_status                  in varchar2 default null,
    p_category_id             in number   default null,
    p_autosave                in varchar2 default null,
    p_is_default              in varchar2 default null,
    --
    p_display_rows            in number   default null,
    p_view_mode               in varchar2 default null,
    p_report_columns          in varchar2 default null,
    --
    p_sort_column_1           in varchar2 default null,
    p_sort_direction_1        in varchar2 default null,
    p_sort_column_2           in varchar2 default null,
    p_sort_direction_2        in varchar2 default null,
    p_sort_column_3           in varchar2 default null,
    p_sort_direction_3        in varchar2 default null,
    p_sort_column_4           in varchar2 default null,
    p_sort_direction_4        in varchar2 default null,
    p_sort_column_5           in varchar2 default null,
    p_sort_direction_5        in varchar2 default null,
    p_sort_column_6           in varchar2 default null,
    p_sort_direction_6        in varchar2 default null,
    --
    p_break_on                in varchar2 default null,
    p_break_enabled_on        in varchar2 default null,
    p_control_break_options   in varchar2 default null,
    --
    p_sum_columns_on_break    in varchar2 default null,
    p_avg_columns_on_break    in varchar2 default null,
    p_max_columns_on_break    in varchar2 default null,
    p_min_columns_on_break    in varchar2 default null,
    p_median_columns_on_break in varchar2 default null,
    p_mode_columns_on_break   in varchar2 default null,
    p_count_columns_on_break  in varchar2 default null,
    p_count_distnt_col_on_break in varchar2 default null,
    --
    p_flashback_mins_ago      in varchar2 default null,
    p_flashback_enabled       in varchar2 default null,
    --
    p_chart_type              in varchar2 default null,
    p_chart_3d                in varchar2 default null,
    p_chart_label_column      in varchar2 default null,
    p_chart_label_title       in varchar2 default null,
    p_chart_value_column      in varchar2 default null,
    p_chart_aggregate         in varchar2 default null,
    p_chart_value_title       in varchar2 default null,
    p_chart_sorting           in varchar2 default null,
    --
    p_calendar_date_column    in varchar2 default null,
    p_calendar_display_column in varchar2 default null,
    --
    p_id_offset               in number   default 0,
    p_target                  in varchar2 default 'PRIME');

procedure create_ws_condition (
    p_id                    in number   default null,
    p_flow_id               in number   default 4900,
    p_page_id               in number   default null,
    p_worksheet_id          in number   default null,
    p_websheet_id           in number   default null,
    p_report_id             in number   default null,
    p_name                  in varchar2 default null,
    p_condition_type        in varchar2 default null,
    p_allow_delete          in varchar2 default null,
    --
    p_column_name           in varchar2 default null,
    p_operator              in varchar2 default null,
    p_expr_type             in varchar2 default null,
    p_expr                  in varchar2 default null,
    p_expr2                 in varchar2 default null,
    p_time_zone             in varchar2 default null,
    p_condition_sql         in varchar2 default null,
    p_condition_display     in varchar2 default null,
    --
    p_enabled               in varchar2 default null,
    --
    p_highlight_sequence    in number   default null,
    p_row_bg_color          in varchar2 default null,
    p_row_font_color        in varchar2 default null,
    p_row_format            in varchar2 default null,
    p_column_bg_color       in varchar2 default null,
    p_column_font_color     in varchar2 default null,
    p_column_format         in varchar2 default null,
    --
    p_id_offset             in number   default 0,
    p_target                in varchar2 default 'PRIME');

procedure create_ws_computation (
    p_id                    in number   default null,
    p_flow_id               in number   default 4900,
    p_page_id               in number   default null,
    p_worksheet_id          in number   default null,
    p_websheet_id           in number   default null,
    p_report_id             in number   default null,
    --
    p_db_column_name        in varchar2 default null,
    p_column_identifier     in varchar2 default null,
    p_computation_expr      in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_column_type           in varchar2 default null,
    --
    p_column_label          in varchar2 default null,
    p_report_label          in varchar2 default null,
    --
    p_id_offset             in number   default 0,
    p_target                in varchar2 default 'PRIME');

procedure create_ws_group_by (
    p_id                         in number   default null,
    p_flow_id                    in number   default 4900,
    p_page_id                    in number   default null,
    p_worksheet_id               in number   default null,
    p_websheet_id                in number   default null,
    p_report_id                  in number   default null,
    --
    p_group_by_columns           in varchar2 default null,
    p_function_01                in varchar2 default null,
    p_function_column_01         in varchar2 default null,
    p_function_db_column_name_01 in varchar2 default null,
    p_function_label_01          in varchar2 default null,
    p_function_format_mask_01    in varchar2 default null,
    p_function_sum_01            in varchar2 default null,
    p_function_02                in varchar2 default null,
    p_function_column_02         in varchar2 default null,
    p_function_db_column_name_02 in varchar2 default null,
    p_function_label_02          in varchar2 default null,
    p_function_format_mask_02    in varchar2 default null,
    p_function_sum_02            in varchar2 default null,
    p_function_03                in varchar2 default null,
    p_function_column_03         in varchar2 default null,
    p_function_db_column_name_03 in varchar2 default null,
    p_function_label_03          in varchar2 default null,
    p_function_format_mask_03    in varchar2 default null,
    p_function_sum_03            in varchar2 default null,
    p_function_04                in varchar2 default null,
    p_function_column_04         in varchar2 default null,
    p_function_db_column_name_04 in varchar2 default null,
    p_function_label_04          in varchar2 default null,
    p_function_format_mask_04    in varchar2 default null,
    p_function_sum_04            in varchar2 default null,
    p_function_05                in varchar2 default null,
    p_function_column_05         in varchar2 default null,
    p_function_db_column_name_05 in varchar2 default null,
    p_function_label_05          in varchar2 default null,
    p_function_format_mask_05    in varchar2 default null,
    p_function_sum_05            in varchar2 default null,
    p_function_06                in varchar2 default null,
    p_function_column_06         in varchar2 default null,
    p_function_db_column_name_06 in varchar2 default null,
    p_function_label_06          in varchar2 default null,
    p_function_format_mask_06    in varchar2 default null,
    p_function_sum_06            in varchar2 default null,
    p_function_07                in varchar2 default null,
    p_function_column_07         in varchar2 default null,
    p_function_db_column_name_07 in varchar2 default null,
    p_function_label_07          in varchar2 default null,
    p_function_format_mask_07    in varchar2 default null,
    p_function_sum_07            in varchar2 default null,
    p_function_08                in varchar2 default null,
    p_function_column_08         in varchar2 default null,
    p_function_db_column_name_08 in varchar2 default null,
    p_function_label_08          in varchar2 default null,
    p_function_format_mask_08    in varchar2 default null,
    p_function_sum_08            in varchar2 default null,
    p_function_09                in varchar2 default null,
    p_function_column_09         in varchar2 default null,
    p_function_db_column_name_09 in varchar2 default null,
    p_function_label_09          in varchar2 default null,
    p_function_format_mask_09    in varchar2 default null,
    p_function_sum_09            in varchar2 default null,
    p_function_10                in varchar2 default null,
    p_function_column_10         in varchar2 default null,
    p_function_db_column_name_10 in varchar2 default null,
    p_function_label_10          in varchar2 default null,
    p_function_format_mask_10    in varchar2 default null,
    p_function_sum_10            in varchar2 default null,
    p_function_11                in varchar2 default null,
    p_function_column_11         in varchar2 default null,
    p_function_db_column_name_11 in varchar2 default null,
    p_function_label_11          in varchar2 default null,
    p_function_format_mask_11    in varchar2 default null,
    p_function_sum_11            in varchar2 default null,
    p_function_12                in varchar2 default null,
    p_function_column_12         in varchar2 default null,
    p_function_db_column_name_12 in varchar2 default null,
    p_function_label_12          in varchar2 default null,
    p_function_format_mask_12    in varchar2 default null,
    p_function_sum_12            in varchar2 default null,
    p_sort_column_01             in varchar2 default null,
    p_sort_direction_01          in varchar2 default null,
    p_sort_column_02             in varchar2 default null,
    p_sort_direction_02          in varchar2 default null,
    p_sort_column_03             in varchar2 default null,
    p_sort_direction_03          in varchar2 default null,
    p_sort_column_04             in varchar2 default null,
    p_sort_direction_04          in varchar2 default null,
    p_sort_column_05             in varchar2 default null,
    p_sort_direction_05          in varchar2 default null,
    p_sort_column_06             in varchar2 default null,
    p_sort_direction_06          in varchar2 default null,
    p_sort_column_07             in varchar2 default null,
    p_sort_direction_07          in varchar2 default null,
    p_sort_column_08             in varchar2 default null,
    p_sort_direction_08          in varchar2 default null,
    p_sort_column_09             in varchar2 default null,
    p_sort_direction_09          in varchar2 default null,
    p_sort_column_10             in varchar2 default null,
    p_sort_direction_10          in varchar2 default null,
    p_sort_column_11             in varchar2 default null,
    p_sort_direction_11          in varchar2 default null,
    p_sort_column_12             in varchar2 default null,
    p_sort_direction_12          in varchar2 default null,
    --
    p_id_offset                  in number   default 0,
    p_target                     in varchar2 default 'PRIME');


procedure create_ws_notify (
    p_id                     in number   default null,
    p_flow_id                in number   default 4900,
    p_worksheet_id           in number   default null,
    p_websheet_id            in number   default null,
    p_report_id              in number   default null,
    p_owner                  in varchar2 default null,
    p_language               in varchar2 default null,
    p_email_from             in varchar2 default null,
    p_email_subject          in varchar2 default null,
    p_email_address          in varchar2 default null,
    p_start_date             in varchar2 default null,
    p_end_date               in varchar2 default null,
    p_end_day                in number   default null,
    p_end_day_unit           in varchar2 default null,
    p_offset_date            in varchar2 default null,
    p_notify_interval        in varchar2 default null,
    p_status                 in varchar2 default null,
    p_notify_error           in varchar2 default null,
    --
    p_id_offset              in number   default 0,
    p_target                 in varchar2 default 'PRIME');

procedure create_ws_pivot (
    p_id            in number   default null,
    p_flow_id       in number   default 4900,
    p_page_id       in number   default null,
    p_worksheet_id  in number   default null,
    p_websheet_id   in number   default null,
    p_report_id     in number   default null,
    --
    p_pivot_columns in varchar2 default null,
    p_row_columns   in varchar2 default null,
    --
    p_id_offset     in number   default 0,
    p_target        in varchar2 default 'PRIME');

procedure create_ws_pivot_agg (
    p_id              in number   default null,
    p_pivot_id        in number   default null,
    p_display_seq     in number   default null,
    p_function_name   in varchar2 default null,
    p_column_name     in varchar2 default null,
    p_db_column_name  in varchar2 default null,
    p_column_label    in varchar2 default null,
    p_format_mask     in varchar2 default null,
    p_display_sum     in varchar2 default 'N',
    --
    p_id_offset       in number   default 0,
    p_target          in varchar2 default 'PRIME');

procedure create_ws_pivot_sort (
    p_id                in number   default null,
    p_pivot_id          in number   default null,
    p_sort_seq          in number   default null,
    p_sort_column_name  in varchar2 default null,
    p_sort_direction    in varchar2 default null,
    --
    p_id_offset         in number   default 0,
    p_target            in varchar2 default 'PRIME');

procedure create_ws_lov (
    p_id                  in number default null,
    p_worksheet_id        in number default null,
    p_websheet_id         in number default null,
    p_name                in varchar default null,
    --
    p_id_offset           in number   default 0,
    p_target              in varchar2 default 'PRIME'
    );

procedure create_ws_lov_entries (
    p_id                  in number default null,
    p_worksheet_id        in number default null,
    p_websheet_id         in number default null,
    p_lov_id              in number default null,
    p_display_sequence    in number default null,
    p_entry_text          in varchar2 default null,
    --
    p_id_offset           in number   default 0,
    p_target              in varchar2 default 'PRIME'
    );

procedure create_ws_col_validation (
    p_id                  in number default null,
    p_ws_app_id           in number default null,
    p_worksheet_id        in number default null,
    p_websheet_id         in number default null,
    p_validation_level    in varchar2 default null,
    p_validation_seq      in number default null,
    p_validation_name     in varchar2 default null,
    p_validation_type     in varchar2 default null,
    p_validation_expr1    in varchar2 default null,
    p_validation_expr2    in varchar2 default null,
    p_error_message       in varchar2 default null,
    --
    p_id_offset           in number   default 0,
    p_target              in varchar2 default 'PRIME'
    );

procedure create_ws_page (
    p_id                  in number default null,
    p_page_number         in number default null,
    p_ws_app_id           in number default null,
    p_parent_page_id      in number default null,
    p_name                in varchar2 default  null,
    p_upper_name          in varchar2 default  null,
    p_page_alias          in varchar2 default  null,
    p_owner               in varchar2 default  null,
    p_status              in varchar2 default  null,
    p_description         in varchar2 default  null,
    --
    p_id_offset           in number   default 0,
    p_target              in varchar2 default 'PRIME'
    );

procedure remove_ws_app (
    p_ws_app_id in number   default null);

procedure create_load_table(
   p_id                       in number    default null,
   p_flow_id                  in number    default wwv_flow.g_flow_id,
   p_name                     in varchar2,
   p_owner                    in varchar2,
   p_table_name               in varchar2,
   p_unique_column_1          in varchar2,
   p_is_uk1_case_sensitive    in varchar2,
   p_unique_column_2          in varchar2  default null,
   p_is_uk2_case_sensitive    in varchar2  default null,
   p_unique_column_3          in varchar2  default null,
   p_is_uk3_case_sensitive    in varchar2  default null,
   p_version_column_name      in varchar2  default null,
   p_column_names_lov_id      in number    default null,
   p_skip_validation          in varchar2  default 'N',
   p_wizard_page_ids          in varchar2  default null,
   p_comments                 in varchar2  default null);

procedure create_load_table_lookup(
   p_id                        in number    default null,
   p_flow_id                   in number    default wwv_flow.g_flow_id,
   p_load_table_id             in number,
   p_load_column_name          in varchar2,
   p_lookup_owner              in varchar2,
   p_lookup_table_name         in varchar2,
   p_key_column                in varchar2,
   p_display_column            in varchar2,
   p_alternative_key_column1     in varchar2  default null,
   p_alternative_display_column1 in varchar2  default null,
   p_alternative_key_column2     in varchar2  default null,
   p_alternative_display_column2 in varchar2  default null,
   p_where_clause              in varchar2 default null,
   p_insert_new_value          in varchar2  default 'N',
   p_error_message             in varchar2  default null);

procedure create_load_table_rule(
   p_id                        in number    default null,
   p_flow_id                   in number    default wwv_flow.g_flow_id,
   p_load_table_id             in number,
   p_load_column_name          in varchar2,
   p_rule_name                 in varchar2,
   p_rule_type                 in varchar2,
   p_rule_sequence             in number,
   p_rule_expression1          in varchar2  default null,
   p_rule_expression2          in varchar2  default null,
   p_error_message             in varchar2  default null);
--
-- Procedure to change the status of Build Options
-- p_app: The Application id
-- p_id: The Build Option Id
-- p_build_status: Status with possible values 'INCLUDE','EXCLUDE' (Both uppercase)
procedure set_build_option_status(
   p_application_id    in number,
   p_id                in number,
   p_build_status      in varchar2 );

--
-- Function to get the status of Build Options
-- p_application_id: The Application id
-- p_id:  The Build Option Id
--
function get_build_option_status(
   p_application_id   in number,
   p_id               in number )
return varchar2;

--
-- Function to get the status of Build Options
-- p_application_id: The Application id
-- p_build_option_name: Build Option Name
--
function get_build_option_status(
   p_application_id   in number,
   p_build_option_name in varchar2 )
return varchar2;


procedure post_import_process (
    p_flow_id              in number  default wwv_flow.g_flow_id,
    p_auto_install_sup_obj in boolean default false,
    p_is_component_import  in boolean default false );

-- Used by SQL Developer
procedure create_app_from_query (
    p_schema                     in varchar2,
    p_workspace_id               in number,
    p_application_name           in varchar2,
    p_authentication             in varchar2 default 'DATABASE ACCOUNT',
    p_application_id             out number,
    p_theme                      in number,
    p_theme_type                 in varchar2,
    p_sql                        in varchar2,
    p_page_name                  in varchar2 default 'Page 1',
    p_max_displayed_columns      in number default 30,
    p_group_name                 in varchar2 default null);

------------------------
-- Complete workspace export
--
procedure create_app_build_pref (
    p_id                               in number      default null,
    p_default_parsing_schema           in varchar2    default null,
    p_default_auth_scheme              in varchar2    default null,
    p_default_app_theme                in number      default null,
    p_default_tabs                     in varchar2    default null,
    p_default_proxy_server             in varchar2    default null,
    p_default_language                 in varchar2    default null,
    p_default_language_derived         in varchar2    default null,
    p_date_format                      in varchar2    default null,
    p_date_time_format                 in varchar2    default null,
    p_timestamp_format                 in varchar2    default null,
    p_timestamp_tz_format              in varchar2    default null,
    p_created_on                       in date        default null,
    p_created_by                       in varchar2    default null,
    p_updated_on                       in date        default null,
    p_updated_by                       in varchar2    default null );

procedure create_clickthru_log$ (
    p_clickdate                        in date        default null,
    p_category                         in varchar2    default null,
    p_id                               in number      default null,
    p_flow_user                        in varchar2    default null,
    p_ip                               in varchar2    default null );

procedure create_clickthru_log2$ (
    p_clickdate                        in date        default null,
    p_category                         in varchar2    default null,
    p_id                               in number      default null,
    p_flow_user                        in varchar2    default null,
    p_ip                               in varchar2    default null );

procedure create_data_load_bad_log (
    p_id                               in number      default null,
    p_load_id                          in number      default null,
    p_errm                             in varchar2    default null,
    p_data                             in varchar2    default null );

procedure create_data_load_unload (
    p_id                               in number      default null,
    p_platform                         in varchar2    default null,
    p_file_columns                     in varchar2    default null,
    p_data_type                        in varchar2    default null,
    p_data_schema                      in varchar2    default null,
    p_data_table                       in varchar2    default null,
    p_success_rows                     in number      default null,
    p_failed_rows                      in number      default null,
    p_data_id                          in number      default null,
    p_job_id                           in number      default null,
    p_created_on                       in date        default null,
    p_created_by                       in varchar2    default null,
    p_created_by_id                    in number      default null,
    p_enclosed_by                      in varchar2    default null,
    p_separator                        in varchar2    default null );

procedure create_mail_attachments (
    p_id                               in number      default null,
    p_mail_id                          in number      default null,
    p_filename                         in varchar2    default null,
    p_mime_type                        in varchar2    default null,
    p_inline                           in varchar2    default null,
    p_attachment                       in sys.dbms_sql.varchar2_table default wwv_flow_api.empty_varchar2_table,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null);

procedure create_mail_log (
    p_mail_to                          in varchar2    default null,
    p_mail_from                        in varchar2    default null,
    p_mail_replyto                     in varchar2    default null,
    p_mail_subj                        in varchar2    default null,
    p_mail_cc                          in varchar2    default null,
    p_mail_bcc                         in varchar2    default null,
    p_mail_send_error                  in varchar2    default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_mail_queue (
    p_id                               in number      default null,
    p_mail_to                          in varchar2    default null,
    p_mail_from                        in varchar2    default null,
    p_mail_replyto                     in varchar2    default null,
    p_mail_subj                        in varchar2    default null,
    p_mail_cc                          in varchar2    default null,
    p_mail_bcc                         in varchar2    default null,
    p_mail_body                        in clob        default null,
    p_mail_body_html                   in clob        default null,
    p_mail_send_count                  in number      default null,
    p_mail_send_error                  in varchar2    default null,
    p_includes_html                    in number      default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_model_pages (
    p_id                               in number      default null,
    p_model_id                         in number      default null,
    p_page_id                          in number      default null,
    p_parent_page_id                   in number      default null,
    p_display_sequence                 in number      default null,
    p_page_type                        in varchar2    default null,
    p_page_source                      in varchar2    default null,
    p_page_name                        in varchar2    default null,
    p_source                           in clob        default null,
    p_block_id                         in number      default null,
    p_report_id                        in number      default null,
    p_mig_comments                     in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_model_page_regions (
    p_id                               in number      default null,
    p_model_page_id                    in number      default null,
    p_region_id                        in number      default null,
    p_region_name                      in varchar2    default null,
    p_region_source                    in varchar2    default null,
    p_source                           in clob        default null,
    p_display_sequence                 in number      default null,
    p_report_implementation            in varchar2    default null,
    p_search_enabled                   in varchar2    default null,
    p_link_column                      in varchar2    default null,
    p_link_text                        in varchar2    default null,
    p_parent_link_from_column1         in varchar2    default null,
    p_parent_link_from_column2         in varchar2    default null,
    p_link_to_column1                  in varchar2    default null,
    p_link_to_column2                  in varchar2    default null,
    p_display_column                   in varchar2    default null,
    p_supp_info_column                 in varchar2    default null,
    p_report_filter                    in varchar2    default null,
    p_column_heading_sorting           in varchar2    default null,
    p_download_link                    in varchar2    default null,
    p_chart_title                      in varchar2    default null,
    p_chart_type                       in varchar2    default null,
    p_chart_rendering                  in varchar2    default null,
    p_x_axis_title                     in varchar2    default null,
    p_y_axis_title                     in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_model_page_cols (
    p_id                               in number      default null,
    p_model_region_id                  in number      default null,
    p_column_name                      in varchar2    default null,
    p_column_display_name              in varchar2    default null,
    p_column_sequence                  in number      default null,
    p_help_text                        in varchar2    default null,
    p_display_as_form                  in varchar2    default null,
    p_form_attribute_01                in varchar2    default null,
    p_form_attribute_02                in varchar2    default null,
    p_form_attribute_03                in varchar2    default null,
    p_form_attribute_04                in varchar2    default null,
    p_form_attribute_05                in varchar2    default null,
    p_form_attribute_06                in varchar2    default null,
    p_form_attribute_07                in varchar2    default null,
    p_form_attribute_08                in varchar2    default null,
    p_form_attribute_09                in varchar2    default null,
    p_form_attribute_10                in varchar2    default null,
    p_form_attribute_11                in varchar2    default null,
    p_form_attribute_12                in varchar2    default null,
    p_form_attribute_13                in varchar2    default null,
    p_form_attribute_14                in varchar2    default null,
    p_form_attribute_15                in varchar2    default null,
    p_display_as_tab_form              in varchar2    default null,
    p_datatype                         in varchar2    default null,
    p_alignment                        in varchar2    default null,
    p_display_width                    in number      default null,
    p_max_width                        in number      default null,
    p_height                           in number      default null,
    p_format_mask                      in varchar2    default null,
    p_hidden_column                    in varchar2    default null,
    p_sort_sequence                    in number      default null,
    p_sort_dir                         in number      default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_password_history (
    p_id                               in number      default null,
    p_user_id                          in number      default null,
    p_password                         in raw         default null,
    p_created                          in date        default null );

procedure create_pkg_app_map (
    p_id                               in number      default null,
    p_app_id                           in number      default null,
    p_installed_app_id                 in number      default null,
    p_installed_ws_id                  in number      default null,
    p_installed_build_version          in number      default null,
    p_app_locked                       in varchar2    default null,
    p_created                          in date        default null,
    p_created_by                       in varchar2    default null,
    p_updated                          in date        default null,
    p_updated_by                       in varchar2    default null );

procedure create_preferences$ (
    p_id                               in number      default null,
    p_user_id                          in varchar2    default null,
    p_preference_name                  in varchar2    default null,
    p_attribute_value                  in varchar2    default null );

procedure create_provision_serice_mod (
    p_id                               in number      default null,
    p_service_name                     in varchar2    default null,
    p_service_attribute_1              in varchar2    default null,
    p_service_attribute_2              in varchar2    default null,
    p_service_attribute_3              in varchar2    default null,
    p_service_attribute_4              in varchar2    default null,
    p_service_attribute_5              in varchar2    default null,
    p_service_attribute_6              in varchar2    default null,
    p_service_attribute_7              in varchar2    default null,
    p_service_attribute_8              in varchar2    default null,
    p_requested_on                     in date        default null,
    p_requested_by                     in varchar2    default null,
    p_last_status_change_on            in date        default null,
    p_last_status_change_by            in varchar2    default null,
    p_request_status                   in varchar2    default null,
    p_request_work_log                 in varchar2    default null,
    p_request_comments                 in varchar2    default null );

procedure create_qb_saved_cond (
    p_id                               in number      default null,
    p_col                              in varchar2    default null,
    p_alias                            in varchar2    default null,
    p_fv                               in varchar2    default null,
    p_fp                               in varchar2    default null,
    p_out                              in varchar2    default null,
    p_st                               in varchar2    default null,
    p_so                               in varchar2    default null,
    p_grp                              in varchar2    default null,
    p_con                              in varchar2    default null,
    p_ord                              in number      default null );

procedure create_qb_saved_join (
    p_id                               in number      default null,
    p_field1                           in varchar2    default null,
    p_field2                           in varchar2    default null,
    p_cond                             in varchar2    default null );

procedure create_qb_saved_query (
    p_id                               in number      default null,
    p_query_owner                      in varchar2    default null,
    p_title                            in varchar2    default null,
    p_qb_sql                           in clob        default null,
    p_description                      in varchar2    default null,
    p_query_type                       in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_qb_saved_tabs (
    p_id                               in number      default null,
    p_oid                              in number      default null,
    p_cnt                              in number      default null,
    p_top                              in varchar2    default null,
    p_left                             in varchar2    default null,
    p_tname                            in varchar2    default null );

procedure create_rt$approvals (
    p_id                               in number      default null,
    p_client_id                        in number      default null,
    p_user_name                        in varchar2    default null,
    p_status                           in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_rt$approval_privs (
    p_id                               in number      default null,
    p_approval_id                      in number      default null,
    p_privilege_id                     in number      default null,
    p_row_version_number               in number      default null );

procedure create_rt$clients (
    p_id                               in number      default null,
    p_name                             in varchar2    default null,
    p_description                      in varchar2    default null,
    p_auth_flow                        in varchar2    default null,
    p_apex_app_id                      in number      default null,
    p_response_type                    in varchar2    default null,
    p_client_id                        in varchar2    default null,
    p_client_secret                    in varchar2    default null,
    p_redirect_uri                     in varchar2    default null,
    p_support_email                    in varchar2    default null,
    p_about_url                        in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_rt$client_privileges (
    p_id                               in number      default null,
    p_client_id                        in number      default null,
    p_privilege_id                     in number      default null,
    p_row_version_number               in number      default null );

procedure create_rt$errors (
    p_id                               in number      default null,
    p_handler_id                       in number      default null,
    p_request_path                     in varchar2    default null,
    p_request_parameters               in varchar2    default null,
    p_parsed_schema                    in varchar2    default null,
    p_sql_error_code                   in number      default null,
    p_sql_error_message                in varchar2    default null );

procedure create_rt$pending_approvals (
    p_id                               in number      default null,
    p_approval_id                      in number      default null,
    p_client_state                     in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_rt$user_sessions (
    p_id                               in number      default null,
    p_approval_id                      in number      default null,
    p_apex_session_id                  in number      default null,
    p_bearer_token                     in varchar2    default null,
    p_refresh_token                    in varchar2    default null,
    p_token_expiry                     in timestamp   default null,
    p_refresh_expiry                   in timestamp   default null,
    p_client_state                     in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_sw_detail_results (
    p_id                               in number      default null,
    p_result_id                        in number      default null,
    p_file_id                          in number      default null,
    p_seq_id                           in number      default null,
    p_stmt_num                         in number      default null,
    p_stmt_text                        in clob        default null,
    p_result                           in clob        default null,
    p_result_size                      in number      default null,
    p_result_rows                      in number      default null,
    p_msg                              in varchar2    default null,
    p_success                          in varchar2    default null,
    p_failure                          in varchar2    default null,
    p_started                          in date        default null,
    p_start_time                       in number      default null,
    p_ended                            in date        default null,
    p_end_time                         in number      default null,
    p_run_complete                     in varchar2    default null,
    p_last_updated                     in date        default null );

procedure create_sw_results (
    p_id                               in number      default null,
    p_file_id                          in number      default null,
    p_job_id                           in number      default null,
    p_run_by                           in varchar2    default null,
    p_run_as                           in varchar2    default null,
    p_started                          in date        default null,
    p_start_time                       in number      default null,
    p_ended                            in date        default null,
    p_end_time                         in number      default null,
    p_status                           in varchar2    default null,
    p_run_comments                     in varchar2    default null );

procedure create_sw_sql_cmds (
    p_id                               in number      default null,
    p_command                          in clob        default null,
    p_parsed_schema                    in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null );

procedure create_sw_stmts (
    p_id                               in number      default null,
    p_file_id                          in number      default null,
    p_stmt_number                      in number      default null,
    p_src_line_number                  in number      default null,
    p_offset                           in number      default null,
    p_length                           in number      default null,
    p_stmt_class                       in number      default null,
    p_stmt_id                          in number      default null,
    p_isrunnable                       in varchar2    default null,
    p_stmt_vc2                         in varchar2    default null,
    p_stmt                             in clob        default null );

procedure create_user_access_log1$ (
    p_login_name                       in varchar2    default null,
    p_auth_method                      in varchar2    default null,
    p_app                              in number      default null,
    p_owner                            in varchar2    default null,
    p_access_date                      in date        default null,
    p_ip_address                       in varchar2    default null,
    p_remote_user                      in varchar2    default null,
    p_auth_result                      in number      default null,
    p_custom_status_text               in varchar2    default null );

procedure create_user_access_log2$ (
    p_login_name                       in varchar2    default null,
    p_auth_method                      in varchar2    default null,
    p_app                              in number      default null,
    p_owner                            in varchar2    default null,
    p_access_date                      in date        default null,
    p_ip_address                       in varchar2    default null,
    p_remote_user                      in varchar2    default null,
    p_auth_result                      in number      default null,
    p_custom_status_text               in varchar2    default null );

procedure create_models (
    p_id                               in number      default null,
    p_session_id                       in number      default null,
    p_flow_id                          in number      default wwv_flow.g_flow_id,
    p_owner                            in varchar2    default null,
    p_name                             in varchar2    default null,
    p_model_complete                   in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

function varchar2_to_blob(
    p_varchar2s                        in sys.dbms_sql.varchar2_table)
    return blob;

--==============================================================================
procedure import_begin (
    p_version_yyyy_mm_dd               in varchar2,
    p_release                          in varchar2    default null,
    p_default_workspace_id             in number,
    p_default_application_id           in number      default null,
    p_default_id_offset                in number      default null,
    p_default_owner                    in varchar2    default null );
--==============================================================================
procedure import_end (
    p_auto_install_sup_obj             in boolean     default false,
    p_is_component_import              in boolean     default false );

--
-- *** API Deprecated, use wwv_flow_api.create_app_static_file, create_workspace_static_file instead ***
--
procedure create_or_remove_file (
    p_name                      in varchar2,
    p_varchar2_table            in sys.dbms_sql.varchar2_table default empty_varchar2_table,
    p_mimetype                  in varchar2 default null,
    p_location                  in varchar2 default 'WORKSPACE',
    p_flow_id                   in number   default null,
    p_nlang                     in varchar2 default null,
    p_height                    in number   default null,
    p_width                     in number   default null,
    p_notes                     in varchar2 default '',
    p_mode                      in varchar2 default 'CREATE_OR_REPLACE',
    p_type                      in varchar2 default 'STATIC')
    ;

end wwv_flow_api;
/
show errors;
