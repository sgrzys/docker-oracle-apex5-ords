set define off verify off
prompt ...wwv_flow
create or replace package wwv_flow as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      flow.sql
--
--    DESCRIPTION
--      Application Express rendering engine package specification.
--
--    SECURITY
--      Publicly executable.
--
--    NOTES
--      This program shows and accepts application express pages.
--      The application express engine is also known as the flows engine.
--      Frequently called from the procedure f.
--
--    RUNTIME DEPLOYMENT: YES
--
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   08/04/1999 - Created
--      mhichwa   09/30/1999 - Removed g_show_reset global
--      mhichwa   10/09/1999 - Added g_last_query_text global for error reporting
--      mhichwa   10/09/1999 - Removed g_success_procedure, g_success_url
--      mhichwa   10/09/1999 - Removed g_step_sub_title_font_color
--      mhichwa   10/14/1999 - Added 10 extra inputs v26 ... v35
--      mhichwa   10/21/1999 - Added t01..t35 to allow 32k for textareas
--      mhichwa   10/21/1999 - Moved g_flow_schema_owner to spec from body
--      mhichwa   10/23/1999 - Added flow_language and flow_image_prefix
--      mhichwa   10/26/1999 - Added pagination globals flow_current_min_row, max_row, rows_fetched
--      mhichwa   11/08/1999 - Added g_current_tab, and g_non_current_tab, g_box, g_navigation_bar
--      mhichwa   11/23/1999 - Added g_tab_non_current_image, g_tab_image_attributes
--      mhichwa   11/30/1999 - Added g_template_success_message
--      mhichwa   11/30/1999 - Changed paint_buttons from a procedure to a function
--      mhichwa   12/01/1999 - Added g_body_title variable, g_current_image_tab, g_non_current_image_tab
--      mhichwa   12/06/1999 - Added g_message, attribute1,2,3,4
--      mhichwa   12/09/1999 - Added g_top level tab attributes and g_tab_target
--      mhichwa   12/13/1999 - Changed g_message to g_notification_message, added g_notification
--      mhichwa   12/13/1999 - Added g_default_button_position
--      mhichwa   12/15/1999 - Added display_condition to toplevel_tab: g_tab_parent_display_cond
--      mhichwa   12/19/1999 - Added g_before_header_branch_occured global
--      mhichwa   12/19/1999 - Added g_tab_also_current_for_pages global
--      mhichwa   01/08/2000 - Added g_translated_flow_id and g_translated_page_id
--      mhichwa   01/09/2000 - Depricated initial_occurs and max_occurances
--      mhichwa   01/12/2000 - Added page plug globals
--      mhichwa   01/20/2000 - Added g_error_template, g_user, g_authentication, g_login_url
--      mhichwa   01/21/2000 - Added g_session_cookie
--      mhichwa   01/21/2000 - Depricated g_session_last_changed_set
--      mhichwa   01/23/2000 - Added logout_url
--      mhichwa   01/24/2000 - Added g_public_url_prefix
--      mhichwa   01/24/2000 - Added an extra 5 input arguments making total of 40
--      mhichwa   01/25/2000 - Added 10 more input arguments
--      mhichwa   01/26/2000 - Externalized paint_formOpen, find_value_for functions and g_ok_to_cache_sql variable
--      mhichwa   01/26/2000 - Added g_item_plug_id, g_plug_id and g_button_plug_id
--      mhichwa   01/31/2000 - Added g_heading_bgcolor,g_font_size,g_font_face,g_table_bgcolor,tattr
--      mhichwa   01/31/2000 - Added g_plug_heading_bgcolor,table_bgcolor,font_size,header,footer
--      mhichwa   02/02/2000 - Change g_box from varchar2(4000) to varchar2(32767)
--      mhichwa   02/20/2000 - Added g_cookie_session_id global
--      mhichwa   02/21/2000 - Added g_popup_filter global
--      mhichwa   02/23/2000 - Added g_page_document_1 global
--      mhichwa   03/02/2000 - Added g_tab_plsql_condtion global
--      mhichwa   03/04/2000 - Renamed draw_box_open, close to draw_body_open, close
--      mhichwa   03/08/2000 - Added g_flow_version
--      mhichwa   03/09/2000 - Added g_user_known_as
--      mhichwa   03/16/2000 - Added button_redirect_url
--      mhichwa   03/22/2000 - Added p_perform_oracle_substitutions
--      mhichwa   04/26/2000 - Added g_page_text_generated
--      mhichwa   05/03/2000 - Added f01 - f10
--      mhichwa   05/07/2000 - Moved f01 before p_t41 (allows f01 to be 98 arg, not 108 arg)
--      mhichwa   05/08/2000 - Reversed above
--      mhichwa   05/08/2000 - Add g_subscriber_id
--      mhichwa   05/16/2000 - Added g_process_when_button_id
--      mhichwa   05/22/2000 - Added g_icon_onclick
--      mhichwa   05/23/2000 - Removed drop package
--      mhichwa   05/24/2000 - obsoleted g_icon_bar_ and g_page_document_1 added comments, reordered fields
--      mhichwa   05/26/2000 - Added wwv_flow.g_rownum per thoechst request
--      mhichwa   05/30/2000 - Added g_dbauth_url_prefix, g_proxy_server
--      mhichwa   05/30/2000 - Added update_cache_with_write
--      mhichwa   06/02/2000 - Added g_step_first_item
--      mhichwa   06/03/2000 - Added lov_null_text null_value
--      mhichwa   06/09/2000 - Added g_item_lov_translated
--      mhichwa   06/11/2000 - Added g_plug_display_when_cond_type g_public_user
--      mhichwa   06/12/2000 - Added g_current_user
--      mhichwa   06/13/2000 - Added g_item_display_when_type
--      mhichwa   06/15/2000 - Added g_tab_parent_display_cond_ty g_tab_plsql_condition_type
--      mhichwa   06/18/2000 - Added g_process_type
--      mhichwa   06/18/2000 - Added g_branch_when_button_id
--      mhichwa   07/03/2000 - Added g_plug_column_width
--      mhichwa   07/10/2000 - Added g_region_table_cattributes
--      mhichwa   08/16/2000 - Added g_item_source_post_computation
--      mhichwa   08/19/2000 - Extended help procedure
--      mhichwa   08/21/2000 - Added additional help procedure arguments.
--      mhichwa   09/03/2000 - Changed formatting of page help text.
--      mhichwa   09/19/2000 - Added g_flow_status
--      mhichwa   10/25/2000 - Added p 51 ... 60
--      mhichwa   10/30/2000 - Added page cache update alt api
--      mhichwa   10/30/2000 - Added fetch_item
--      mhichwa   11/09/2000 - Added p_trace
--      mhichwa   11/21/2000 - Added g_computation_id
--      mhichwa   12/07/2000 - Added g_vpd
--      mhichwa   12/15/2000 - Added g_tab_disp_cond_text and g_compute_when_text
--      mhichwa   12/18/2000 - Removed g_subscriber_id and g_session_created_*
--      mhichwa   12/20/2000 - Removed g_item_javascript and added g_item_security_scheme
--      mhichwa   12/20/2000 - Added p_component argument to public role check function
--      mhichwa   12/20/2000 - Added g_button_security_scheme, g_icon_security_scheme, g_tab_security_scheme
--      mhichwa   12/20/2000 - Added g_tab_security_scheme
--      mhichwa   12/22/2000 - Added g_security_scheme for flow level security schemes
--      mhichwa   12/22/2000 - Added reset security check cache
--      mhichwa   01/05/2001 - Added public security check
--      mhichwa   01/12/2001 - Added g item tag_attributes
--      mhichwa   01/16/2001 - Added g application_tab set
--      mhichwa   01/17/2001 - Added f11 - f20
--      mhichwa   01/27/2001 - Return company name function
--      mhichwa   02/11/2001 - Added two functions to get sequence and unique ids
--      mhichwa   02/14/2001 - Added sdillon code to insert into temp table values from strings
--      mhichwa   03/01/2001 - Added g button alignment
--      sdillon   03/02/2001 - Added g_job for jobs which are submitted to wwv_flow_job
--      mhichwa   03/03/2001 - Removed references to carot 3, added comments
--      mhichwa   03/03/2001 - Added public syn
--      mhichwa   03/04/2001 - Added get_custom_auth_login_url
--      mhichwa   03/15/2001 - Added no data found global
--      mhichwa   03/21/2001 - Added g user id
--      mhichwa   04/09/2001 - Added p company to show and accept procedures
--      mhichwa   04/10/2001 - Added button c attributes
--      mhichwa   04/17/2001 - Added total row global to enhance pagination
--      mhichwa   04/23/2001 - Added rejoin sessions variable
--      mhichwa   05/14/2001 - Removed g item accept processing global var
--      mhichwa   06/01/2001 - Added checksum function and md5 checksum show and accept arguments
--      mhichwa   06/04/2001 - Added assignment of md5 checksum to flow global.
--      mhichwa   06/04/2001 - Added get_sgid function to return sec grp id for use in views on obj dollar table
--      mhichwa   06/18/2001 - Added g item default type
--      mhichwa   06/18/2001 - Added api to clear user session state (clear user cache)
--      mhichwa   06/18/2001 - Improved documentation
--      mhichwa   07/20/2001 - Added g_flow_language_derived_from
--      mhichwa   08/13/2001 - Added x 01 through x 20 as input items that are to be ignored.  For use with local javascript.
--      mhichwa   08/23/2001 - Added global notification
--      mhichwa   08/24/2001 - Added a global for g_last_tab_pressed
--      mhichwa   08/27/2001 - Added last tab pressed argument to show procedure
--      mhichwa   08/27/2001 - Extended documentation of flows procedure
--      mhichwa   10/02/2001 - Edited comments for show procedure
--      mhichwa   10/15/2001 - Added flow checksum fcs accept argument
--      mhichwa   10/19/2001 - Added header and footer template globals
--      mhichwa   10/24/2001 - Added process when 2 and process when 2 type to extend declarative prog on page processes
--      mhichwa   11/08/2001 - Added g_error_message_override
--      mhichwa   11/12/2001 - Added g_head (wwv_flow_steps.html_page_header)
--      mhichwa   12/10/2001 - Added set_g_nls_date_format
--      mhichwa   12/12/2001 - Added g_process_security_scheme
--      mhichwa   12/17/2001 - Added g_flow_charset
--      mhichwa   12/18/2001 - Added g_branch_security_scheme
--      mhichwa   12/19/2001 - Added g_current_parent_tab_text
--      mhichwa   02/11/2002 - Added 2 stateful process procedures and one function (sspadafore design)
--      mhichwa   02/13/2002 - Added validation global (g_validation_ids_in_error)
--      mhichwa   02/14/2002 - Added another validation global (g_inline_validation_error_cnt)
--      mhichwa   02/14/2002 - Added tag_attributes2
--      mhichwa   02/19/2002 - Added post element text
--      mhichwa   03/05/2002 - Added process_sql_clob
--      sspadafo  03/18/2002 - Added fetch_flow_item function
--      mhichwa   03/18/2002 - Added g_page_submitted global variable
--      jkallman  03/28/2002 - Added definition of vc_long_arr
--      mhichwa   04/04/2002 - Removed obsolete icon bar attributes
--      mhichwa   04/17/2002 - Fixed inline notifications of type function returning err text by adding addtional global
--      mhichwa   05/01/2002 - Added lov_display_extra g_item_lov_display_extra support
--      mhichwa   05/07/2002 - Maded look static 1, and obsolete
--      mhichwa   05/08/2002 - Added 5 more arguments (now 65 are supported)
--      mhichwa   05/08/2002 - Added button condition 2
--      mhichwa   05/09/2002 - Added g_tab_parent_display_cond2
--      mhichwa   05/09/2002 - Added g_item_display_when2
--      mhichwa   05/09/2002 - Added g_company_images and g_flow_images
--      mhichwa   05/09/2002 - Added g_shortcut_name and g_shortcut_id
--      mhichwa   05/10/2002 - Remove obsolete globals
--      mhichwa   06/05/2002 - Added p_survey_map and g_survey_map
--      sspadafo  06/22/2002 - Added g_list_mgr_cnt global
--      cbcho     07/01/2002 - Added g_footer_len, g_footer_end, g_end_tag_printed global variables
--      mhichwa   07/08/2002 - Added g_f21..g_f40 and g_plug_form_tab_attr
--      sspadafo  07/10/2002 - Added clear_flow_cache, clear_page_cache, clear_page_caches procedures
--      mhichwa   08/08/2002 - Added g_flow_alias
--      mhichwa   08/09/2002 - Added plug_query_more_data
--      mhichwa   08/11/2002 - Added exact_substitutions_only
--      mhichwa   09/24/2002 - Added plug_customized
--      mhichwa   09/25/2002 - Added g_item_cattributes_element
--      msewtz    09/26/2002 - Added g_fsp_region_id for multiple region sorting
--      mhichwa   09/30/2002 - Added g_page_onload
--      mhichwa   10/07/2002 - Increased input args from 65 to 100.
--      mhichwa   10/25/2002 - Added g_item_read_only_when g_item_read_only_when_type g_item_read_only_disp_attr
--      mhichwa   10/25/2002 - Removed support for application tabs
--      mhichwa   10/29/2002 - Added g_unique_page_id
--      mhichwa   10/29/2002 - Changed some numbers into pls_integers
--      msewtz    10/31/2002 - Added g_plug_position to indicate top and bottom position for button conditions
--      tmuth     11/01/2002 - Removed reference to ^3, now using select user... technique
--      mhichwa   11/08/2002 - Changed comments
--      jkallman  11/21/2002 - Added g_nls_decimal_separator, set_g_nls_decimal_separator
--      mhichwa   11/21/2002 - Added map1 map2 and map3
--      mhichwa   11/25/2002 - Changed map1 to an array
--      mhichwa   11/25/2002 - Added map2 and map3 array
--      msewtz    12/04/2002 - Added constant g_browser_version and function get_browser_version
--      jkallman  12/27/2002 - Removed end_page_processing
--      sspadafo  12/27/2002 - Added g_db_session_branch_targets for before header branching (Bug 2729768)
--      sspadafo  12/28/2002 - Added g_branch_to_page_accept_count for recursion limiting (Bug 2729767)
--      sspadafo  01/06/2003 - Expose function replace_cgi_env (bug 2737645)
--      mhichwa   01/27/2003 - Added g_process_item_name (bug 2769756)
--      sspadafo  02/07/2003 - Added g_in_process boolean to prevent show from being called from page process (Bug 2776207)
--      sspadafo  02/23/2003 - Changes for template column name changes from varchar2 to number (Bug 2748399)
--      msewtz    02/26/2004 - Added g_pagination_buttons_painted to determine whether or not pagination buttons are painted (bug 2823270)
--      jstraub   03/10/2003 - Replaced select user with select sys_context( 'userenv', 'current_schema') for FLOW_OWNER
--      mhichwa   03/11/2003 - Added global g_edit_cookie_session_id which replace body local var (bug 2845535)
--      mhichwa   03/14/2003 - Added global g_form_painted boolean (bug 2851819)
--      mhichwa   03/18/2003 - Added comments to globals, no bug filed
--      mhichwa   03/18/2003 - Added pk array values for use in inline edits (bug 2845535)
--      mhichwa   03/30/2003 - Added g_print_success_message
--      jkallman  04/08/2003 - Added reset_g_nls_decimal_separator (Bug 2894573)
--      sspadafo  04/26/2003 - Removed refs to g_computation_item_type for page and flow computations (Bug 2770974)
--      mhichwa   05/02/2003 - Improved 508 compliance, added g_nls_edit, bug 2772858
--      mhichwa   05/22/2003 - Added returning globals to enhanced dml support, bug 2965281
--      mhichwa   05/22/2003 - Added process globals to identify items to return keys to, bug 2965281
--      tmuth     07/09/2003 - Fixed HTML per bug 3040191
--      sspadafo  07/12/2003 - Increase size of g_footer_end (Bug 3044360)
--      sspadafo  07/30/2003 - Add clear_app_cache as equivalent of clear_flow_cache (Bug 3077346)
--      sspadafo  07/30/2003 - Add fetch_app_item as equivalent of fetch_flow_item (Bug 3077346)
--      sspadafo  08/23/2003 - Add g_build_status (Bug 3101165)
--      msewtz    02/04/2003 - Added Tablar From Globals for handling popup items in tabular forms (bug 3268062)
--      mhichwa   05/26/2004 - Added g_template_navbar_entry global.
--      jkallman  05/25/2004 - Remove references to ^FLOW_OWNER
--      sspadafo  06/09/2004 - Add save_in_substitution_cache procedure, remove update_cache procedure (Bug 3674771)
--      sspadafo  06/09/2004 - Remove find_value_for function (Bug 3677443)
--      mhichwa   06/14/2004 - Added g_flow_theme_id global
--      mhichwa   06/17/2004 - Added function get_translated_app_id return number function
--      jkallman  06/18/2004 - Added get_nls_group_separator
--      jkallman  07/14/2004 - Added reset_g_nls_date_format
--      mhichwa   08/02/2004 - Added g_logo_image and g_logo_image_attributes
--      mhichwa   08/02/2004 - Added g_plug_list_template_id
--      jkallman  08/16/2004 - Added g_base_href, set_base_href, reset_base_href, get_base_href
--      mhichwa   09/15/2004 - Removed obsolete wwv_flow.g_step_box_image, bug 3892054
--      mhichwa   09/15/2004 - Remove obsolete substitutions g_attribute 1 - 6, bug 3892054
--      mhichwa   09/15/2004 - Remove obsolete substitution g_look, bug 3892054
--      mhichwa   09/15/2004 - Remove static link substitutions, bug 3892054
--      jkallman  01/05/2004 - Adjust g_flow_schema_owner
--      sspadafo  01/31/2005 - Increase g_logout_url to vc4000 (Bug 4155342)
--      sspadafo  02/08/2005 - Added globals for URL tampering feature
--      sspadafo  02/21/2005 - Added g_protected_item_internal_flag
--      sspadafo  03/08/2005 - Added g_substitution_item_filter and g_item_escape_on_http_input arrays
--      jkallman  09/14/2005 - Adjust g_flow_schema_owner to FLOWS_020100
--      jkallman  01/23/2006 - Adjust g_flow_schema_owner to FLOWS_020200
--      sspadafo  03/07/2006 - Added g_ex_context_authentication boolean (inspired by Bug 5028808)
--      mhichwa   03/17/2006 - Added g_arg_name and g_arg_value to optimize mod plsql performance
--      mhichwa   03/20/2006 - Improved commments
--      mhichwa   03/22/2006 - Improved xhtml
--      mhichwa   04/10/2006 - Removed obsolete function convert_display_id_to_flow_id
--      sspadafo  04/22/2006 - Added g_use_zero_sid for zero session ID feature
--      sspadafo  04/23/2006 - Added g_public_page_ids, g_public_auth_scheme for zero session ID feature
--      mhichwa   06/01/2006 - Added g_sqlerrm global to log errors encountered during execution of applications
--      mhichwa   06/02/2006 - Inititialize g_sqlerrm
--      mhichwa   06/05/2006 - Removed obsolete and commented out code
--      mhichwa   06/06/2006 - Added globals for error component name and type
--      mhichwa   06/09/2006 - Added g_cache page global to support page caching wwv_flow_steps.cache_page_yn
--      mhichwa   06/09/2006 - Added get_page_alias function for use in determining if you are a login page
--      mhichwa   06/09/2006 - Added is_custom_auth_page function
--      mhichwa   06/11/2006 - Added g_cache_mode global so cache mode can be logged to activity log
--      mhichwa   06/14/2006 - Improved code comments
--      sspadafo  06/22/2006 - Changed g_flow_schema_owner to constant to prevent alteration
--      jkallman  09/29/2006 - Adjust g_flow_schema_owner to FLOWS_030000
--      jstraub   12/13/2006 - Added g_wallet_path and g_wallet_pwd for SSL (HTTPS) support
--      mhichwa   12/21/2006 - Added g_plug_caching global to support page caching, referenced from meta.plb
--      mhichwa   12/21/2006 - Added g_cached_regions global
--      mhichwa   01/02/2006 - Added g_item_pre_element_text
--      mhichwa   01/02/2006 - Added g_cached_region_count global to track the number of regions rendered from cached representations
--      mhichwa   01/03/2006 - Added g_remote_addr
--      jstraub   01/03/2006 - Removed wallet globals, moved to platform preference
--      rvallam   01/08/2007 - Added a new global g_is_item_shuttle for checking if display_as is shuttle
--      rvallam   01/08/2007 - Global added for shuttle - g_is_item_shuttle removed, not needed.
--      jkallman  01/26/2007 - Added g_item_format_mask
--      mhichwa   01/30/2007 - Added support for region static id
--      sspadafo  07/31/2007 - Added f01..f20 parameters to show procedure
--      cbcho     08/02/2007 - Adjust g_flow_schema_owner to flows_030100
--      sspadafo  08/07/2007 - Added new globals g_widget_name, g_x01..g_x10, g_clob_01; added input params to show: p_widget_name, x01..x10, p_clob_01 for AJAX requests
--      cbackstr  09/25/2007 - Changed show to include p_widget_mod,p_widget_action,p_widget_action_mod and map to g_widget_mod,g_widget_action,g_widget_action_mod
--      cbackstr  10/09/2007 - Changed show to include g_widget_num_return
--      jkallman  10/15/2007 - Added globals g_media_type and g_step_media_type
--      jkallman  11/19/2007 - Added global g_date_format
--      mhichwa   11/26/2007 - Added g_include_apex_css_js_yn
--      mhichwa   11/29/2007 - Added g_proc_runtime_where_clause
--      sspadafo  12/03/2007 - Removed g_protected_item_ids, g_protected_item_internal_flag
--      mhichwa   12/10/2007 - Removed g_step_box_footer_text global also changed meta.plb, gen_api_pkg.plb and flow.plb
--      mhichwa   12/10/2007 - Removed g_box_width global
--      mhichwa   12/13/2007 - Added g_plug_att_sub
--      sspadafo  01/21/2008 - Changed type of g_unique_page_id from pls_integer to number to accommodate IDs larger than 2**31-1
--      sspadafo  01/23/2008 - Added overloaded version of trim_sql (Bug 6754391)
--      mhichwa   01/25/2008 - Added exec count global
--      jkallman  02/26/2008 - Removed fetch_item and fetch_value from specification
--      sspadafo  04/03/2008 - Added p_ignore_01..p_ignore_10 parameters to accept (Bug 6912467)
--      jkallman  07/08/2008 - Changed FLOWS_030100 references to FLOWS_040000
--      jkallman  07/31/2008 - Added procedures emit_javascript, add_javascript and g_javascript variable
--      jkallman  08/01/2008 - Added types codeEntry, codeType, global var g_code and procedures add_code and emit_code
--      cbackstr  08/05/2008 - made paint_trailing_javascript callable so it can be used in other packages.
--      mhichwa   09/11/2008 - Added g_http_head_attr global to facilitate apex listner
--      mhichwa   09/12/2008 - Added function get_application_id and get_page_id to optimize views that need to return current app and pg
--      mhichwa   09/12/2008 - Added function get_session_id and function get_security_group_id
--      jkallman  10/02/2008 - Changed FLOWS_040000 references to APEX_040000
--      mhichwa   10/10/2008 - Added g_item_quick_pick_yn
--      mhichwa   11/1/2008  - Added g_application_info
--      sspadafo  12/05/2008 - Added session timeout globals
--      jkallman  12/17/1008 - Change default valut of p_before_region_html in procedure help()
--      jkallman  12/18/2008 - Added vc_assoc_arr, g_deferred_session_val_ids and g_deferred_session_values in support of Bug xxxx
--      sspadafo  12/22/2008 - Changed name of timeout vars to reflect units in seconds
--      jstraub   12/23/2008 - Added g_autocomplete_on_off
--      mhichwa   12/23/2008 - Added g_substitution_item_encrypted to support session state encryption
--      sspadafo  12/31/2008 - Added g_item_encrypted to support session state encryption
--      sspadafo  12/31/2008 - Added g_substitution_item_value_enc, g_item_values_encrypted, g_fetch_encrypted to allow value encryption in URLs
--      sspadafo  01/06/2009 - Added g_disable_browser_caching
--      sspadafo  01/11/2009 - Added g_save_state_before_branch_yn array and g_save_state_before_branch scalar
--      sspadafo  02/04/2009 - Added g_column_values array to take the place of wwv_flow_dml.g_column_values
--      jkallman  02/11/2009 - Added g_dml_* variables from corresponding variables in wwv_flow_dml
--      pawolf    03/09/2009 - Moved wwv_flow.add_code/emit_code to wwv_flow_javascript
--      pawolf    03/13/2009 - Moved deprecated functions/procedures to the bottom of the file
--      pawolf    04/01/2009 - Added custom item types
--      pawolf    04/09/2009 - Added g_validation_displ_location
--      mhichwa   07/07/2009 - Added g_listener and p_listener to communicate with apex listner for actions such as xls parsing
--      sspadafo  07/08/2009 - Changed spelling of new accept parameter p_listner to p_listener
--      pawolf    07/09/2009 - Added add_validation_error
--      jkallman  07/28/2009 - Added globals g_timestamp_format, g_timestamp_tz_format, g_nls_timestamp_format, g_nls_timestamp_tz_format
--      jkallman  08/03/2009 - Added global g_localtimestamp
--      jkallman  08/04/2009 - Renamed global g_localtimestamp to g_systimestamp_gmt
--      pawolf    08/17/2009 - Added parent_plug_id for regions
--      arayner   08/21/2009 - Added globals g_button_show_wait and g_button_wait_message
--      jkallman  08/28/2009 - Add p_time_zone to show
--      jkallman  08/28/2009 - Added global g_auto_time_zone
--      jkallman  08/31/2009 - Added p_time_zone to accept
--      mhichwa   08/31/2009 - Added g_plug_image global to support region images
--      msewtz    09/16/2009 - Added fmap to accept to support mapping tabular form fxx arrays to report columns
--      pawolf    10/23/2009 - Added g_item_is_required
--      pawolf    10/28/2009 - Added g_default_error_display_loc
--      mhichwa   11/05/2009 - Added g_plug_image_attr
--      mhichwa   11/18/2009 - Added  g_icon_is_feedback
--      mhichwa   11/19/2009 - added p_lang to flow.show and accept
--      jstraub   12/10/2009 - Added convert_page_alias_to_id to spec
--      pawolf    12/14/2009 - Added new columns for javascript to wwv_flow_steps
--      msewtz    12/17/2009 - Updated tabular form validations to perform #COLUMN_HEADER# substituion on validation message and include row number
--      mhichwa   12/17/2009 - increased size of g_listener from 100 to 200
--      mhichwa   12/23/2009 - added g_current_region_id global, to allow general access to the current region ID
--      pawolf    12/29/2009 - Added g_item_standard_validations
--      msewtz    01/07/2010 - Added fhdr to accept to include tabular form column headers
--      msewtz    01/07/2010 - Update tabular form validation error messages to use fhdr arrays to substitute column headers
--      pawolf    01/20/2010 - Added escape_on_http_output to wwv_flow_step_items
--      arayner   01/20/2010 - Added g_widget_view_mode global and p_widget_view_mode parameter to show to handle new way of setting IRR view mode
--      pawolf    01/21/2010 - Added g_item_type_features
--      jkallman  01/29/2010 - Added function get_elapsed_time
--      pawolf    02/02/2010 - Added cascading lov columns to wwv_flow_step_items
--      pawolf    02/15/2010 - Added "Execute Validations" feature
--      pawolf    02/18/2010 - Removed LOV_COLUMNS
--      pawolf    02/20/2010 - Added support for process plugins
--      sspadafo  03/02/2010 - Moved g_in_accept boolean from package body (Bug 5765184)
--      jkallman  03/02/2010 - Added g_edition
--      pawolf    03/16/2010 - Removed g_list_managers
--      jkallman  03/18/2010 - Added g_plug_query_parse_override
--      pawolf    04/01/2010 - Changed p_listener to an array
--      cbcho     04/01/2010 - Added g_ws_app_id
--      msewtz    04/08/2010 - Added tabular form globals
--      pawolf    04/17/2010 - Renamed lov_items_to_submit and lov_optimize_refresh to ajax_item_to_submit and ajax_optimize_refresh
--      jkallman  04/22/2010 - Added p_territory to show and accept
--      arayner   04/23/2010 - Added g_item_plain_label global
--      arayner   04/23/2010 - Removed g_button_show_wait and g_button_wait_message globals
--      jkallman  05/18/2010 - Added g_workspace_delete_in_progress (Bug 9652683)
--      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
--      pawolf    11/25/2010 - Removed not necessary global variables of branches (Bug 10197557)
--      pawolf    12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--      pawolf    01/04/2011 - Added support for component specific values (feature# 542)
--      arayner   03/03/2011 - Added g_button_static_id global (feature #385)
--      arayner   03/03/2011 - Added g_button_html_id global (feature #385)
--      pawolf    03/08/2011 - Added new error display location column to wwv_flow_step_processing and wwv_flow_processing (feature# 544)
--      msewtz    03/10/2011 - Added g_mobile_mode to page template globals (feature 586)
--      arayner   03/16/2011 - Added g_button_action global and removed g_button_html_id global as this is not required (feature #385)
--      pawolf    02/28/2011 - Added new error handling (feature# 544)
--      pawolf    03/28/2011 - Removed g_plug_display_error_message (feature# 544)
--      pawolf    03/29/2011 - Enhanced procedure description of stop_apex_engine (feature# 639)
--      msewtz    03/30/2011 - Added g_item_before_item_text and g_item_after_item_text to allow for custom HTML when form not rendered as table (feature 586)
--      msewtz    03/30/2011 - Added g_render_form_items_in_table, used while rendering form items to determine whether to put them in table grid  (feature 586)
--      pawolf    04/07/2011 - Added p_fsp_region_id, p_pg_min_row, p_pg_max_rows and p_pg_rows_fetched to show procedure to allow AJAX calls with a "POST" (feature #505)
--      msewtz    04/08/2011 - Removed g_render_form_items_in_table, moved to region templates and region rendering (feature 586)
--      arayner   04/11/2011 - Added g_item_button_action and g_item_button_redirect_url globals (feature 380)
--      cneumuel  04/18/2011 - Made get_home_link_url public
--      pawolf    05/10/2011 - Added "is hot button" (feature 702)
--      jkallman  06/01/2011 - Added g_date_time_format (feature 715)
--      cneumuel  06/17/2011 - Replaced g_disable_browser_caching with g_browser_cache (feature #726)
--      cneumuel  06/17/2011 - Added support for vpd teardown code (feature #616)
--      cneumuel  06/20/2011 - Renamed variables for db session init/cleanup in wwv_flow (feature #616)
--      cneumuel  07/07/2011 - Added g_browser_frame (feature #731)
--      pawolf    08/05/2011 - Added compatibility_mode (bug# 12835127)
--      pawolf    11/30/2011 - Added trim_nl_sp_tab to public interface (bug# 13076709)
--      pawolf    01/24/2011 - Added p_arg_checksums and p_page_checksum to accept (bug 12790216)
--      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
--      pawolf    02/23/2012 - Changed accept to support up to 110 page items
--      pawolf    02/28/2012 - Added placeholder attribute for page items (feature# 837)
--      pawolf    03/02/2012 - Added css_classes for page items and buttons (feature# 815)
--      pawolf    03/05/2012 - Added css_classes for regions (feature# 815)
--      pawolf    03/06/2012 - Added content delivery network (feature# 819)
--      cneumuel  03/07/2012 - Changed type of g_content_delivery_network to varchar2(20) because of dependency problems during install
--      jkallman  03/15/2012 - Changed accept to support up to 200 page items
--      pawolf    03/19/2012 - Changed code to only use new columns in wwv_flow_user_interfaces instead of the old columns in wwv_flow (feature# 827)
--      pawolf    03/22/2012 - Removed get_current_flow_sgid, Renamed convert_flow_alias_to_id to get_application_id and moved convert_page_alias_to_id to wwv_flow_page
--      pawolf    04/05/2012 - Added support for page and popup transitions (feature #826)
--      cneumuel  04/10/2012 - Moved g_deferred_session_val_ids,g_deferred_session_values into wwv_flow_session_state (feature #897)
--      pawolf    04/10/2012 - Added read only on page and region level (feature# 570)
--      vuvarov   04/11/2012 - Added global for branch names (feature #872)
--      pawolf    04/12/2012 - Removed g_is_read_only and g_plug_is_read_only
--      jkallman  05/03/2012 - Added c_max_size_vc2
--      pawolf    05/03/2012 - Added javascript file urls, css file urls and inline css (feature #816 and #817)
--      arayner   05/04/2012 - Added procedure set_ppr_query_session_state, required by new classic report Ajax handling in wwv_render_report3 (feature #599)
--      pawolf    05/07/2012 - Added g_error_page_template
--      pawolf    05/08/2012 - Moved render code of page into wwv_flow_page
--      pawolf    05/08/2012 - Added new g_page_tmpl_* globals (feature# 816 and 817)
--      pawolf    05/11/2012 - Added Item Display Point (feature #278)
--      pawolf    05/14/2012 - Added grid templates (feature #936)
--      arayner   05/15/2012 - Added g_include_legacy_javascript (feature #927)
--      cneumuel  05/16/2012 - Added g_clob_column_values (bug #14079243)
--      pawolf    05/19/2012 - Added g_step_grid_template_id (feature #936)
--      pawolf    05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
--      cneumuel             - removed {set,get,clear}_component_values
--      pawolf    05/29/2012 - Changed c_current_compatibility_mode to 4.2
--      pawolf    06/01/2012 - Removed render_form_items_in_table
--      pawolf    06/05/2012 - Continued work on grid layout (feature #936)
--      cneumuel  06/14/2012 - Removed g_remote_addr
--      pawolf    06/15/2012 - Added has_edit_links to wwv_flow_templates
--      pawolf    06/18/2012 - Added APP_EMAIL substitution (feature# 695)
--      pawolf    06/20/2012 - Added global page support (feature #987)
--      vuvarov   07/19/2012 - Added g_nls_sort and g_nls_comp (feature #978)
--      hfarrell  08/16/2012 - Added parameters j and XMLCallDate to procedure show for Flash chart support (bug #14496908)
--      hfarrell  08/16/2012 - Changed paramater XMLCallDate in show from number to varchar2 to be consistent with htmldb_util.flash2
--      jkallman  12/17/2012 - Change APEX_040200 references to APEX_050000
--      cneumuel  01/11/2013 - Added LF constant for export/import (feature #985)
--      pawolf    04/08/2013 - Moved wwv_flow_security.g_page_checksum* variables into wwv_flow.show
--      pawolf    04/12/2013 - Added resolve_friendly_url (feature #478)
--      pawolf    04/12/2013 - Added population of wwv_flow.g_theme_file_prefix (feature #1162)
--      hfarrell  05/31/2013 - Added g_page_tmpl_is_popup, g_page_tmpl_js_dialog_code, g_page_mode, g_dialog_attributes, g_dialog_width, g_dialot_maxwidth, g_dialog_title (feature #587)
--      cneumuel  06/03/2013 - Removed g_sessionCnt, g_roleCnt
--      hfarrell  06/07/2013 - Added g_page_tmpl_dialog_width and g_page_tmpl_dialog_maxwidth (feature #587)
--      hfarrell  06/07/2013 - Renamed g_page_tmpl_js_dialog_code to g_page_tmpl_dialog_js_code and g_page_tmpl_dialog_maxwidth to g_page_tmpl_dialog_max_width, and g_dialog_maxwidth to g_dialog_max_width
--      hfarrell  06/20/2013 - Added g_dialog_height (feature # 587)
--      hfarrell  06/26/2013 - Added g_page_tmpl_dialog_height (feature #587)
--      hfarrell  07/01/2013 - Added g_default_dialog_page_template (feature #1200)
--      hfarrell  07/19/2013 - In show: added p_dialog_cs (feature #1200)
--      msewtz    08/09/2013 - Added g_navigation_list_id, g_navigation_list_template_id (feature 1236)
--      hfarrell  09/12/2013 - Added g_page_tmpl_dialog_close_js (feature #1201)
--      hfarrell  09/16/2013 - Added g_dialog_css_classes (feature #1204)
--      hfarrell  09/17/2013 - Added g_page_tmpl_dialog_css, g_page_tmpl_dialog_close_js (feature #1204)
--      hfarrell  10/24/2013 - Added g_page_tmpl_dialog_cancel_js (feature #1201)
--      cneumuel  11/08/2013 - Removed g_http_head_attr (feature #1065)
--      cneumuel  11/15/2013 - Replaced g_plug_% with table of records, to support migration of regions to native plugins (feature #1312)
--      hfarrell  11/22/2013 - Added g_branch_page_mode, g_branch_page_id and g_branch_flow_id for dialog page branch processing
--      cneumuel  11/28/2013 - page button migration (feature #1314)
--      cneumuel  11/29/2013 - page button migration makes image attributes obsolete (feature #1314)
--      pawolf    12/12/2013 - Added page_id to item, button and plug record structure
--      cneumuel  02/10/2014 - Added CR constant
--      msewtz    02/11/2014 - Added before and after element attributes and help link attribute for item globals (feature 1377)
--      msewtz    02/17/2014 - Added region_sub_css_classes to g_plugs (feature 1383)
--      cneumuel  02/20/2014 - Made g_rejoin_existing_sessions varchar2(1) (feature #1047)
--      cneumuel  02/21/2014 - Removed g_public_page_ids, g_public_page_aliases, g_protected_page_ids, g_protected_page_aliases,
--                           - g_ex_context_authentication, g_cookie_session_id, g_authentication, g_session_cookie, g_required_roles
--      cneumuel  02/28/2014 - move substitution cache variable from wwv_flow.g_use_cached_substitution_val to wwv_flow_session_state.g_substitution_item_not_loaded
--      pawolf    03/03/2014 - Added js_messages (feature #1279)
--      msewtz    03/12/2014 - Added icon CSS classes for buttons
--      pawolf    03/15/2014 - Added plug_query_headings* to t_plug
--      msewtz    03/25/2014 - Added template options to t_plug (feature 1394)
--      msewtz    03/28/2014 - Added template options to t_button (feature 1394)
--      cneumuel  04/04/2014 - Removed g_itemCnt, g_plugCnt, g_buttonCnt.
--                           - In t_button: added columns for item button migration (feature #1314)
--                           - Replace g_item_NN tables with g_items, a table of t_items.
--                           - Added t_region_component, t_plug.components, g_page_components
--      msewtz    04/04/2014 - Added item_css_classes and item_template_options to t_items
--      msewtz    04/04/2014 - Added default_template_options to t_items
--      msewtz    04/04/2014 - Aded page css classes, page template options  
--      cneumuel  04/07/2014 - In t_button: added request_name (feature #1314)
--                           - Removed g_current_region_id
--                           - In t_plug:  added is_read_only, idx, parent_idx
--      cneumuel  04/10/2014 - Added t_region_component and t_region_components as replacement for the object types (feature #1314)
--      cneumuel  04/15/2014 - Removed unused g_step_sub_title, g_step_sub_title_type, g_spell_check_required and g_cached_regions
--                           - renamed g_cache to g_page_cache_mode and added additional page cache attributes (feature #1401)
--                           - In t_plug: added additional region cache attributes
--      msewtz    04/17/2014 - Added icon_css_classes to t_plug (feature 1394)
--      jkallman  04/17/2014 - Added g_page_alias (feature #1317)
--      cneumuel  04/24/2014 - In t_plug: added plug_cache_depends_on_items (feature #1401)
--      pawolf    05/23/2014 - Removed g_page_tmpl_has_edit_links
--      hfarrell  05/26/2014 - Added function apps_only_workspace (feature #1429)
--      cneumuel  05/30/2014 - In t_plug: added item_sequence_before, item_sequence_after (feature #1401)
--      hfarrell  07/04/2014 - In accept: added p_dialog_cs, required for dialog page support
--      pawolf    07/08/2014 - Changed c_current_compatibility_mode to 5.0
--      hfarrell  07/14/2014 - Added set_dialog_browser_frame procedure
--      hfarrell  07/15/2014 - Moved set_dialog_browser_frame to wwv_flow_page
--      cneumuel  07/17/2014 - Removed g_stepCnt. In show,accept: fetch_step_info is a procedure
--      pawolf    08/13/2014 - Added #APPLICATION_CSS# (feature #1474)
--      pawolf    08/13/2014 - Added #TOP_GLOBAL_NAVIGATION_LIST# and #SIDE_GLOBAL_NAVIGATION_LIST# (feature #1236)
--      pawolf    08/14/2014 - Added include_jquery_migrate to wwv_flow_user_interfaces (feature #1475)
--      hfarrell  10/15/2014 - Added navigation bar globals: g_nav_bar_type, g_nav_bar_list_id, g_nav_bar_list_template_id, g_nav_bar_template_options (feature #1536)
--      pawolf    10/21/2014 - t_item: added label_id (feature #1503)
--      cneumuel  10/30/2014 - Removed g_arg_values_delimited, added g_url_checksum_src (bug #17750471)
--      cneumuel  11/03/2014 - moved g_url_checksum_src from wwv_flow to wwv_flow_security
--      cneumuel  11/05/2014 - Added g_processes, g_branches, g_computations: metadata now uses table of record
--      pawolf    11/28/2014 - Added grid_label_column_span to t_item (feature #1615)
--      pawolf    12/05/2014 - Added grid_column_css_classes to regions, page items and buttons (feature #1466)
--      pawolf    12/09/2014 - Added g_shared_components_scn (feature #1624)
--      pawolf    01/20/2015 - In js_messages: added p_builder (bug #20184648)
--      pawolf    02/24/2015 - Added #FAVICONS# page template substitution (bug #20482545)
--      cneumuel  05/05/2015 - g_edition, g_flow_owner: long identifier support (bug #21031940)
--
--------------------------------------------------------------------------------

----------------------------------------------------------------------------
-- F L O W   G L O B A L    V A R I A B L E S
--

    -------------------------
    -- flow public data types
    --
    type flow_vc_arr is table of varchar2(32767) index by binary_integer;
    empty_flow_vc_arr flow_vc_arr;
    --
    empty_vc_arr wwv_flow_global.vc_arr2;
    type vc_long_arr is table of varchar2(32767) index by binary_integer;

    empty_vc_long_arr vc_long_arr;

    type clob_arr      is table of clob index by binary_integer;
    type vc_assoc_arr  is table of varchar2(32767) index by varchar2(255);
    type num_assoc_arr is table of number index by varchar2(255);

    type t_component is record (
        type varchar2(30), /* APEX dictionary view name of the component where an error occurred. For example APEX_APPLICATION_PAGE_PROC */
        id   number,       /* Internal component id which triggered the error. The id is always the id of the primary application  */
        name varchar2(255) /* Name of the component which triggered the error like the process name */
        );

    -------------------------------------
    -- Globals for generic and public use
    --
    g_image_prefix                 varchar2(255) := wwv_flow_global.g_image_prefix;
    g_company_images               varchar2(255);
    g_flow_images                  varchar2(255);
    g_theme_file_prefix            varchar2(255);
    g_id                           number;
    g_notification                 varchar2(32767);
    g_global_notification          varchar2(4000);
    g_value                        varchar2(32767);
    g_sysdate                      date;
    g_systimestamp_gmt             timestamp;
    g_boolean                      boolean := false;
    g_excel_format                 boolean := false;
    g_error_message_override       varchar2(4000);         -- if set programmatically overrides process error messages
    g_unique_page_id               number;
    g_form_painted                 boolean := false;
    g_print_success_message        varchar2(4000);
    g_return_key_1                 varchar2(4000);          -- used to return keys from dml operations
    g_return_key_2                 varchar2(4000);          -- used to return keys from dml operations
    g_base_href                    varchar2(4000);          -- BASE HREF for APEX references
    g_exec_count                   pls_integer := 0;
    g_edition                      wwv_flow_global.t_dbms_id;

    CR                             constant varchar2(1) default unistr('\000d');
    LF                             constant varchar2(1) default unistr('\000a');
    ---------------------
    -- translated strings
    g_nls_edit                     varchar2(255) := 'Edit';

    ----------------------------------------------------
    -- Optimization and performance feedback information
    --
    g_form_count                   pls_integer := 0;
    g_package_instantiated         number;
    g_ok_to_cache_sql              boolean := false;
    g_page_text_generated          boolean := false;
    g_import_in_progress           boolean := false;
    g_workspace_delete_in_progress boolean := false;
    g_cached_region_count          pls_integer := 0;

    -----------------------------------
    -- Debug and error page information
    --
    g_debug                        boolean := false;        -- identifies if flow is running in debug mode
    g_unrecoverable_error          boolean := false;        -- NOTE: This global variable is deprecated,
                                                            -- use apex_application.stop_apex_engine instead!
    g_last_query_text              varchar2(32767);         -- if set is the last user sql query executed
    g_in_accept                    boolean := false;        -- set by accept procedure so other packages can take action based on show or accept processing

    -----------------------------------------------------
    -- code to run after authentication and at the end of show/accept processing
    --
    g_db_session_init_code               varchar2(4000);
    g_db_session_cleanup_code            varchar2(4000);

    ----------------------------------------
    -- Authentication and login, logout info
    --
    g_current_user                 varchar2(255);
    g_user                         varchar2(255);         -- corresponds to username used to login
    g_user_id                      number;                -- alternate primary key that identifies a user by number
    g_user_known_as                varchar2(255);
    g_flow_schema_owner            constant varchar2(30)  := 'APEX_050000'; -- the owner of Oracle Application Express
    g_login_url                    varchar2(255);
    g_logout_url                   varchar2(4000);
    g_logo_image                   varchar2(500);
    g_logo_image_attributes        varchar2(4000);
    g_security_scheme              varchar2(255);
    g_use_zero_sid                 boolean := false;
    g_public_auth_scheme           boolean := false;

    -----------------------------
    -- Optimistic Locking Globals
    --
    g_md5_checksum                 varchar2(255) := '0';

    ------------------
    -- spatial globals
    --
    g_map1                         wwv_flow_global.vc_arr2;
    g_map2                         wwv_flow_global.vc_arr2;
    g_map3                         wwv_flow_global.vc_arr2;

    ---------------------
    -- Pagination Globals
    --
    g_rownum                       pls_integer := 0;
    g_flow_current_min_row         pls_integer := 1;
    g_flow_current_max_rows        pls_integer := 10;
    g_flow_current_rows_fetched    pls_integer := 0;
    g_flow_total_row_count         pls_integer := 0;
    g_pagination_buttons_painted   boolean := false;

    ---------------------
    -- Tabular Form Globals
    --
    g_item_idx_offset              number := 0;
    g_rownum_offset                number := 0;
    g_fmap                         num_assoc_arr;
    g_fhdr                         wwv_flow_global.vc_arr2;

    ---------------------
    -- Sorting Globals
    --
    g_fsp_region_id                number := 0;

    ----------------------------
    -- Translation (NLS) Globals
    --
    g_flow_language                varchar2(255);          -- language flow written in (primary language)
    g_flow_language_derived_from   varchar2(30);           -- how the language preference of the user is determined
    g_browser_language             varchar2(255);          -- users language preference (set using lang_derived_from method)
    g_browser_version              varchar2(255);          -- browser version
    g_translated_flow_id           number;                 -- flow ID for translated flow
    g_translated_page_id           number;                 -- page ID for translated flow, e.g. page_id.trans_flow_id
    g_translated_global_page_id    number;                 -- global page id for translated flow. e.g. page_id.trans_flow_id
    g_nls_date_format              varchar2(255);          -- current database date format from nls_session_parameters table.
    g_nls_timestamp_format         varchar2(255);          -- current database timestamp with time zone format from nls_session_parameters table.
    g_nls_timestamp_tz_format      varchar2(255);          -- current database timestamp with time zone format from nls_session_parameters table.
    g_nls_decimal_separator        varchar2(10);           -- current database session decimal separator (derived from NLS_NUMERIC_CHARACTERS)
    g_nls_group_separator          varchar2(10);           -- current database session numeric group separator (derived from NLS_NUMERIC_CHARACTERS)
    g_nls_sort                     varchar2(255);          -- NLS_SORT value for the current application
    g_nls_comp                     varchar2(255);          -- NLS_COMP value for the current application


    -----------------
    -- Fetch Counters
    --
    g_flowCnt                      pls_integer := 0;      -- flow info found, 1 = yes, 0 = no
    g_iconbarCnt                   pls_integer := 0;      -- nav bar icon count
    g_tabCnt                       pls_integer := 0;      -- standard tab count
    g_branchCnt                    pls_integer;           -- branch count
    g_computationCnt               pls_integer;           -- computations count
    g_validationCnt                pls_integer;           -- validations count
    g_list_mgr_cnt                 pls_integer := 0;      --

    ----------------------
    -- Session Information
    --
    g_new_instance                 boolean := false;

    -------------------
    -- Websheet Information
    --
    g_ws_app_id                   number;                   -- wwv_flow_ws_application pk

    -------------------
    -- Flow Information
    --
    g_flow_id                      number;                  -- flow pk
    g_flow_theme_id                number;                  -- current theme for flow
    g_flow_alias                   varchar2(255);           -- flow alphanumeric alias
    g_flow_step_id                 number;                  -- page pk
    g_page_alias                   varchar2(255);           -- page alias
    g_instance                     number;                  -- flow session
    g_edit_cookie_session_id       number;                  -- flow builder session
    g_page_submitted               number;                  -- set when page posted
    g_exact_substitutions_only     varchar2(1);             -- Y or N
    g_arg_names                    wwv_flow_global.vc_arr2; -- array of item names
    g_arg_values                   wwv_flow_global.vc_arr2; -- array of item values
    g_flow_name                    varchar2(255);           -- name of flow
    g_flow_charset                 varchar2(255);           -- used in html header
    g_date_format                  varchar2(255);           -- Application default date format
    g_date_time_format             varchar2(255);           -- Application date time format
    g_timestamp_format             varchar2(255);           -- Application default timestamp format
    g_timestamp_tz_format          varchar2(255);           -- Application default timestamp with time zone format
    g_flow_owner                   wwv_flows.owner%type;    -- for secure use wwv_flow_security.g_parse_as_schema
    g_home_link                    varchar2(4000);          -- home page for this flow
    --g_box_width                    varchar2(30);            -- obsolete ?
    g_default_page_template        varchar2(255);           --
    g_default_dialog_page_template varchar2(255);           -- Application Theme default dialog page template
    g_printer_friendly_template    varchar2(255);           --
    g_error_template               varchar2(255);           --
    g_webdb_logging                varchar2(30);            -- YES (insert entries into a log table), NO (do not do inserts)

    g_application_info             varchar2(4000);          -- apex 4.0 log this text in the apex log

    g_public_url_prefix            varchar2(255);           --
    g_public_user                  varchar2(255);           -- identifies public user name
    g_dbauth_url_prefix            varchar2(255);           --
    g_proxy_server                 varchar2(255);           -- used for some regions of type url and web services
    g_media_type                   varchar2(255);           -- Media Type used in Content-Type HTTP header
    g_flow_version                 varchar2(255);           --
    g_flow_status                  varchar2(30);            -- controls availability of flow
    g_build_status                 varchar2(30);            --
    g_rejoin_existing_sessions     varchar2(1);             -- wwv_flows.rejoin_existing_sessions
    g_request                      varchar2(4000);          -- method of submitting page
    g_sqlerrm                      varchar2(4000);          -- unexpected sql error message to be logged into log tables
    g_err_comp_type                varchar2(255);           -- sqlerrm_component_type identifies what type of component caused the error
    g_err_comp_name                varchar2(255);           -- sqlerrm_component_name identifies the name of the component that raised the error
    g_cache_mode                   varchar2(1) := 'D';      -- R = rendered from cache, C = Cache Created, D = Dynamic
    g_auto_time_zone               varchar2(1);             -- automatic time zone (Y or N)
    g_default_error_display_loc    varchar2(40);            -- default error display location for validations
    g_javascript_file_urls         varchar2(4000);          -- application javascript file URLs #APPLICATION_JAVASCRIPT#
    g_content_delivery_network     varchar2(20);            -- content delivery network which should be used
    g_include_legacy_javascript    boolean := false;        -- should the legacy javascript functions be included?
    g_include_jquery_migrate       boolean := false;        -- should the jQuery Migrate plug-in be included?
    g_css_file_urls                varchar2(4000);          -- application css file URLs #APPLICATION_CSS#
    g_email_from                   varchar2(255);
    g_favicons                     varchar2(4000);          -- favicons of the application currently stored in APP_FAVICONS substitution variable
    g_global_page_id               number;
    g_shared_components_scn        number;

    ------------
    -- shortcuts
    --
    g_shortcut_name                wwv_flow_global.vc_arr2;
    g_shortcut_id                  wwv_flow_global.vc_arr2;

    -------------------
    -- Page Information
    --
    g_popup_filter                 varchar2(4000);          --
    g_printer_friendly             boolean := false;        -- if true use printer friendly page template
    g_first_field_displayable      boolean := false;        --
    g_step_name                    varchar2(255);           -- page name
    g_step_user_interface_id       number;                  -- page user interface id
    g_step_tab_set                 varchar2(255);           -- page current tab set
    g_step_title                   varchar2(255);           -- page title typically becomes html page title
    g_step_media_type              varchar2(255);           -- Media Type used in Content-Type HTTP header
    g_step_first_item              varchar2(255);           -- name of item to put cursor in
    g_step_welcome_text            varchar2(4000);          -- wwv_flow_steps.welcome_text displayed after page template header
    g_step_box_welcome_text        varchar2(4000);          -- wwv_flow_steps.box_welcome_text displayed before #BOX_BODY# in page template body
    g_step_footer_text             varchar2(4000);          -- wwv_flow_steps.footer_text displayed before showing page template footer
    g_step_template                varchar2(255);           -- page template
    g_page_css_classes             varchar2(255);           -- page css classes
    g_page_template_options        varchar2(255);           -- page template options
    g_step_required_role           varchar2(255);           -- priv required to view page
    g_allow_duplicate_submissions  varchar2(3);             -- Y or N
    g_head                         varchar2(32767);         -- page header for CSS, etc. #HEAD#
    g_page_onload                  varchar2(32767);         -- allows control over #ONLOAD# in page template
    g_step_javascript_file_urls    varchar2(4000);          -- page specific javascript file URLs #PAGE_JAVASCRIPT#
    g_javascript_code              varchar2(32767);         -- page specific javascript #PAGE_JAVASCRIPT#
    g_javascript_code_onload       varchar2(32767);         -- javascript code execute onload
    g_step_css_file_urls           varchar2(4000);          -- page specific CSS file URLs #PAGE_CSS#
    g_step_inline_css              varchar2(32767);         -- page specific inline CSS #PAGE_CSS#
    g_autocomplete_on_off          varchar2(3);             -- should autocomplete="off" be included in form tag
    g_page_cache_mode              wwv_flow_steps.cache_mode%type;-- page cache mode
    g_page_cache_timeout_seconds   wwv_flow_steps.cache_timeout_seconds%type;
    g_page_cache_when_cond_type    wwv_flow_steps.cache_when_condition_type%type;
    g_page_cache_when_cond_e1      wwv_flow_steps.cache_when_condition_e1%type;
    g_page_cache_when_cond_e2      wwv_flow_steps.cache_when_condition_e2%type;
    g_include_apex_css_js_yn       varchar2(1);             -- Y is default, N does not include standard apex css and js files for mobile devices
    g_browser_cache                boolean;                 -- If false (the default) this sends the cache-control: no-store http response in wwv_flow.show
    g_browser_frame                varchar2(1);             -- If D, send X-Frame-Options:DENY header, if S, send X-Frame-Options:SAMEORIGIN header
    g_compatibility_mode           number;                  -- Compatibility Mode which contains a version number is used to determine how the runtime engine should behave when the application is executed
    g_page_transition              varchar2(20);            -- transition which is used for navigating to a new page or submitting the page
    g_popup_transition             varchar2(20);            -- transition which is used to open a popup
    g_read_only_when_type          varchar2(255);
    g_read_only_when               varchar2(4000);
    g_read_only_when2              varchar2(4000);
    g_page_mode                    varchar2(20);
    g_dialog_height                varchar2(20);
    g_dialog_width                 varchar2(20);
    g_dialog_max_width             varchar2(20);
    g_dialog_title                 varchar2(255);
    g_dialog_css_classes           varchar2(255);
    g_dialog_attributes            varchar2(4000);

    g_navigation_list_id           number;
    g_navigation_list_position     wwv_flow_user_interfaces.navigation_list_position%type;
    g_navigation_list_template_id  number;
    g_nav_list_template_options    wwv_flow_user_interfaces.nav_list_template_options%type;
    
    g_nav_bar_type                 wwv_flow_user_interfaces.nav_bar_type%type;              -- Navigation Bar Type: Render either as a List or a Navigation Bar
    g_nav_bar_list_id              number;                                                  -- Navigation Bar List ID: where type is set to List
    g_nav_bar_list_template_id     number;                                                  -- Navigation Bar List Template ID: where type is set to List
    g_nav_bar_template_options     wwv_flow_user_interfaces.nav_bar_template_options%type;  -- Navigation Bar List Template Options: where type is set to List

    -- Do only use this constant for the parameter p_compatibility_mode in wwv_flow_api.create_flow!
    -- It's a string and would result in NLS errors if you compare it against g_compatibility_mode
    c_current_compatibility_mode   constant varchar2(3) := '5.0';

    -------------------
    -- Page Button info
    --
    type t_button is record (
        id                       wwv_flow_step_buttons.id%type                      ,
        page_id                  wwv_flow_step_buttons.flow_step_id%type            ,
        button_name              wwv_flow_step_buttons.button_name%type             ,
        button_plug_id           wwv_flow_step_buttons.button_plug_id%type          ,
        button_template_id       wwv_flow_step_buttons.button_template_id%type      ,
        button_template_options  wwv_flow_step_buttons.button_template_options%type ,
        button_is_hot            wwv_flow_step_buttons.button_is_hot%type           ,
        button_label             wwv_flow_step_buttons.button_image_alt%type        ,
        button_position          wwv_flow_step_buttons.button_position%type         ,
        button_sequence          wwv_flow_step_buttons.button_sequence%type         ,
        button_alignment         wwv_flow_step_buttons.button_alignment%type        ,
        button_css_classes       wwv_flow_step_buttons.button_css_classes%type      ,
        icon_css_classes         wwv_flow_step_buttons.icon_css_classes%type        ,
        button_redirect_url      wwv_flow_step_buttons.button_redirect_url%type     ,
        button_action            wwv_flow_step_buttons.button_action%type           ,
        button_condition         wwv_flow_step_buttons.button_condition%type        ,
        button_condition2        wwv_flow_step_buttons.button_condition2%type       ,
        button_condition_type    wwv_flow_step_buttons.button_condition_type%type   ,
        button_cattributes       wwv_flow_step_buttons.button_cattributes%type      ,
        security_scheme          wwv_flow_step_buttons.security_scheme%type         ,
        button_static_id         wwv_flow_step_buttons.button_static_id%type        ,
        request_source           wwv_flow_step_buttons.request_source%type          ,
        request_source_type      wwv_flow_step_buttons.request_source_type%type     ,
        pre_element_text         wwv_flow_step_buttons.pre_element_text%type        ,
        post_element_text        wwv_flow_step_buttons.post_element_text%type       ,
        grid_column_attributes   wwv_flow_step_buttons.grid_column_attributes%type  ,
        grid_new_grid            wwv_flow_step_buttons.grid_new_grid%type           ,
        grid_new_row             wwv_flow_step_buttons.grid_new_row%type            ,
        grid_new_column          wwv_flow_step_buttons.grid_new_column%type         ,
        grid_column_span         wwv_flow_step_buttons.grid_column_span%type        ,
        grid_row_span            wwv_flow_step_buttons.grid_row_span%type           ,
        grid_column              wwv_flow_step_buttons.grid_column%type             ,
        grid_column_css_classes  wwv_flow_step_buttons.grid_column_css_classes%type ,
        --
        -- attributes that are not directly set via base table fields
        --
        is_ok_to_display         boolean,                     -- result of conditional display computation
        request_name             varchar2(32767) );           -- submit request name
    type t_buttons is table of t_button index by pls_integer;
    g_buttons t_buttons;
    g_default_button_position    varchar2(30);

    -----------------
    -- Navigation Bar
    --
    g_icon_id                    wwv_flow_global.n_arr;       -- pk of nav bar icon
    g_icon_image                 wwv_flow_global.vc_arr2;     -- name of image
    g_icon_subtext               wwv_flow_global.vc_arr2;     -- entry label
    g_icon_is_feedback           wwv_flow_global.n_arr;       -- 1 = is feedback, 0 = not feedback
    g_icon_target                wwv_flow_global.vc_arr2;     --
    g_icon_image_alt             wwv_flow_global.vc_arr2;     --
    g_icon_height                wwv_flow_global.vc_arr2;     --
    g_icon_width                 wwv_flow_global.vc_arr2;     --
    g_icon_free_text             wwv_flow_global.vc_arr2;     --
    g_icon_bar_disp_cond         wwv_flow_global.vc_arr2;     --
    g_icon_bar_disp_cond_type    wwv_flow_global.vc_arr2;     --
    g_icon_bar_flow_cond_instr   wwv_flow_global.vc_arr2;     --
    g_icon_begins_on_new_line    wwv_flow_global.vc_arr2;     --
    g_icon_colspan               wwv_flow_global.vc_arr2;     --
    g_icon_onclick               wwv_flow_global.vc_arr2;     --
    g_icon_security_scheme       wwv_flow_global.vc_arr2;     --

    --------------------------
    -- tab and parent tab info
    --
    g_tab_id                     wwv_flow_global.n_arr;       -- std tab: pk
    g_tab_set                    wwv_flow_global.vc_arr2;     -- std tab: name of tab "collection"
    g_tab_step                   wwv_flow_global.vc_arr2;     -- std tab: page
    g_tab_name                   wwv_flow_global.vc_arr2;     -- std tab: name of tab, not the display text
    g_tab_image                  wwv_flow_global.vc_arr2;     -- std tab: optional image name
    g_tab_non_current_image      wwv_flow_global.vc_arr2;     -- std tab: optional image name
    g_tab_image_attributes       wwv_flow_global.vc_arr2;     -- std tab: attributes for images
    g_tab_text                   wwv_flow_global.vc_arr2;     -- std tab: display text of tab
    g_tab_target                 wwv_flow_global.vc_arr2;     --
    g_tab_parent_id              wwv_flow_global.n_arr;       -- parent tab pk
    g_tab_parent_tabset          wwv_flow_global.vc_arr2;     -- parent tab tabset
    g_tab_parent_display_cond    wwv_flow_global.vc_arr2;     -- parent tab display condition
    g_tab_parent_display_cond2   wwv_flow_global.vc_arr2;     -- parent tab display condition2
    g_tab_parent_display_cond_ty wwv_flow_global.vc_arr2;     -- parent tab display condition type
    g_tab_parent_security_scheme wwv_flow_global.vc_arr2;     -- parent tab security scheme
    g_tab_current_on_tabset      wwv_flow_global.vc_arr2;     -- parent tab current for this standard tab set
    g_tab_also_current_for_pages wwv_flow_global.vc_arr2;     -- std tab: also current for comma delimited page list
    g_tab_plsql_condition        wwv_flow_global.vc_arr2;     --
    g_tab_plsql_condition_type   wwv_flow_global.vc_arr2;     --
    g_tab_disp_cond_text         wwv_flow_global.vc_arr2;     --
    g_tab_security_scheme        wwv_flow_global.vc_arr2;     -- sec scheme
    g_last_tab_pressed           varchar2(255);               -- when branching to a tab, this global is set
    g_current_parent_tab_text    varchar2(255);               -- text of the current parent tab set

    ----------------------------
    -- page template information
    --
    g_current_tab                varchar2(4000);                --
    g_current_tab_font_attr      varchar2(255);                 --
    g_non_current_tab            varchar2(4000);                --
    g_non_current_tab_font_attr  varchar2(255);                 --
    g_current_image_tab          varchar2(4000);                --
    g_non_current_image_tab      varchar2(4000);                --
    g_top_current_tab            varchar2(4000);                --
    g_top_current_tab_font_attr  varchar2(255);                 --
    g_top_non_curr_tab           varchar2(4000);                --
    g_top_non_curr_tab_font_attr varchar2(255);                 --
    g_header_template            varchar2(32767);               -- page template header
    g_box                        varchar2(32767);               -- page template body
    g_footer_template            varchar2(32767);               -- page template footer
    g_page_tmpl_def_templ_opt    varchar2(32767);               -- page template default template options
    g_footer_len                 pls_integer;                   --
    g_footer_end                 varchar2(32767);               --
    g_end_tag_printed            boolean         default true;  -- used to position edit links
    g_template_navigation_bar    varchar2(4000);                --
    g_template_navbar_entry      varchar2(4000);                -- defines a navigation bar occurance
    g_template_success_message   varchar2(4000);                -- success message page sub template
    g_body_title                 varchar2(4000);                --
    g_notification_message       varchar2(32767);               -- notification message page sub template
    g_error_page_template        varchar2(32767);               -- error page template
    g_mobile_mode                boolean         default false; -- render page in mobile mode when using mobile page template

    g_heading_bgcolor            varchar2(255);                 -- obsolete ?
    g_table_bgcolor              varchar2(255);                 -- obsolete ?
    g_table_cattributes          varchar2(255);                 -- obsolete ?
    g_region_table_cattributes   varchar2(255);                 -- obsolete ?
    g_font_size                  varchar2(255);                 -- obsolete ?
    g_font_face                  varchar2(255);                 -- obsolete ?
    g_page_tmpl_dialog_css       varchar2(255);
    g_page_tmpl_css_file_urls    varchar2(4000);
    g_page_tmpl_inline_css       varchar2(32767);
    g_page_tmpl_js_file_urls     varchar2(4000);
    g_page_tmpl_js_code          varchar2(32767);
    g_page_tmpl_js_code_onload   varchar2(32767);
    g_page_tmpl_dialog_js_code   varchar2(32767);
    g_page_tmpl_dialog_close_js  varchar2(32767);
    g_page_tmpl_dialog_cancel_js varchar2(32767);
    g_page_tmpl_is_popup         boolean         default false;
    g_page_tmpl_dialog_height    varchar2(20)    default null;
    g_page_tmpl_dialog_width     varchar2(20)    default null;
    g_page_tmpl_dialog_max_width varchar2(20)    default null;

    ------------
    -- item info
    --
    type t_item is record (
        id                        wwv_flow_step_items.id%type                       ,
        page_id                   wwv_flow_step_items.flow_step_id%type             ,
        name                      wwv_flow_step_items.name%type                     ,
        is_persistent             wwv_flow_step_items.is_persistent%type            ,
        is_required               wwv_flow_step_items.is_required%type              ,
        item_sequence             wwv_flow_step_items.item_sequence%type            ,
        item_plug_id              wwv_flow_step_items.item_plug_id%type             ,
        item_default              wwv_flow_step_items.item_default%type             ,
        item_default_type         wwv_flow_step_items.item_default_type%type        ,
        prompt                    wwv_flow_step_items.prompt%type                   ,
        plain_label               wwv_flow_step_items.prompt%type                   ,
        label_id                  varchar2( 261 )                                   , -- 261=length of name + _label
        placeholder               wwv_flow_step_items.placeholder%type              ,
        before_item_text          wwv_flow_field_templates.before_item%type         ,
        after_item_text           wwv_flow_field_templates.after_item%type          ,
        before_element_text       wwv_flow_field_templates.before_element%type      ,
        after_element_text        wwv_flow_field_templates.after_element%type       ,
        help_template             wwv_flow_field_templates.help_link%type           ,
        error_template            wwv_flow_field_templates.error_template%type      ,
        pre_element_text          wwv_flow_step_items.pre_element_text%type         ,
        post_element_text         wwv_flow_step_items.post_element_text%type        ,
        format_mask               wwv_flow_step_items.format_mask%type              ,
        item_css_classes          wwv_flow_step_items.item_css_classes%type         ,
        item_template_options     wwv_flow_step_items.item_template_options%type    ,
        default_template_options  wwv_flow_step_items.item_template_options%type    ,
        source                    wwv_flow_step_items.source%type                   ,
        source_type               wwv_flow_step_items.source_type%type              ,
        source_post_computation   wwv_flow_step_items.source_post_computation%type  ,
        display_as                wwv_flow_step_items.display_as%type               ,
        lov                       wwv_flow_step_items.lov%type                      ,
        lov_display_extra         wwv_flow_step_items.lov_display_extra%type        ,
        lov_display_null          wwv_flow_step_items.lov_display_null%type         ,
        lov_null_text             wwv_flow_step_items.lov_null_text%type            ,
        lov_null_value            wwv_flow_step_items.lov_null_value%type           ,
        lov_translated            wwv_flow_step_items.lov_translated%type           ,
        lov_cascade_parent_item   wwv_flow_step_items.lov_cascade_parent_items%type ,
        ajax_items_to_submit      wwv_flow_step_items.ajax_items_to_submit%type     ,
        ajax_optimize_refresh     wwv_flow_step_items.ajax_optimize_refresh%type    ,
        --
        csize                     wwv_flow_step_items.csize%type                    ,
        cmaxlength                wwv_flow_step_items.cmaxlength%type               ,
        cHeight                   wwv_flow_step_items.cHeight%type                  ,
        cattributes               wwv_flow_step_items.cattributes%type              ,
        cattributes_element       wwv_flow_step_items.cattributes_element%type      ,
        tag_css_classes           wwv_flow_step_items.tag_css_classes%type          ,
        tag_attributes            wwv_flow_step_items.tag_attributes%type           ,
        tag_attributes2           wwv_flow_step_items.tag_attributes2%type          ,
        --
        new_grid                  wwv_flow_step_items.new_grid%type                 ,
        begin_on_new_line         wwv_flow_step_items.begin_on_new_line%type        ,
        begin_on_new_field        wwv_flow_step_items.begin_on_new_field%type       ,
        colspan                   wwv_flow_step_items.colspan%type                  ,
        rowspan                   wwv_flow_step_items.rowspan%type                  ,
        grid_column               wwv_flow_step_items.grid_column%type              ,
        grid_label_column_span    wwv_flow_step_items.grid_label_column_span%type   ,
        grid_column_css_classes   wwv_flow_step_items.grid_column_css_classes%type  ,
        --
        label_alignment           wwv_flow_step_items.label_alignment%type          ,
        display_when              wwv_flow_step_items.display_when%type             ,
        display_when2             wwv_flow_step_items.display_when2%type            ,
        display_when_type         wwv_flow_step_items.display_when_type%type        ,
        --
        use_cache_before_def      wwv_flow_step_items.use_cache_before_default%type ,
        field_alignment           wwv_flow_step_items.field_alignment%type          ,
        security_scheme           wwv_flow_step_items.security_scheme%type          ,
        read_only_when            wwv_flow_step_items.read_only_when%type           ,
        read_only_when2           wwv_flow_step_items.read_only_when2%type          ,
        read_only_when_type       wwv_flow_step_items.read_only_when_type%type      ,
        read_only_disp_attr       wwv_flow_step_items.read_only_disp_attr%type      ,
        escape_on_http_input      wwv_flow_step_items.escape_on_http_input%type     ,
        escape_on_http_output     wwv_flow_step_items.escape_on_http_output%type    ,
        encrypted                 wwv_flow_step_items.encrypt_session_state_yn%type ,
        quick_pick_yn             wwv_flow_step_items.show_quick_picks%type         ,
        attribute_01              wwv_flow_step_items.attribute_01%type             ,
        attribute_02              wwv_flow_step_items.attribute_02%type             ,
        attribute_03              wwv_flow_step_items.attribute_03%type             ,
        attribute_04              wwv_flow_step_items.attribute_04%type             ,
        attribute_05              wwv_flow_step_items.attribute_05%type             ,
        attribute_06              wwv_flow_step_items.attribute_06%type             ,
        attribute_07              wwv_flow_step_items.attribute_07%type             ,
        attribute_08              wwv_flow_step_items.attribute_08%type             ,
        attribute_09              wwv_flow_step_items.attribute_09%type             ,
        attribute_10              wwv_flow_step_items.attribute_10%type             ,
        attribute_11              wwv_flow_step_items.attribute_11%type             ,
        attribute_12              wwv_flow_step_items.attribute_12%type             ,
        attribute_13              wwv_flow_step_items.attribute_13%type             ,
        attribute_14              wwv_flow_step_items.attribute_14%type             ,
        attribute_15              wwv_flow_step_items.attribute_15%type             ,
        --
        is_ok_to_display          boolean );
    type t_items is table of t_item index by pls_integer;

    g_items                       t_items;
    g_item_type_features          wwv_flow_global.vc_map; -- indexed by item type name

    --------------
    -- branch info
    --
    type t_branch is record (
        id                          wwv_flow_step_branches.id%type                          ,
        branch_name                 wwv_flow_step_branches.branch_name%type                 ,
        branch_action               wwv_flow_step_branches.branch_action%type               ,
        branch_point                wwv_flow_step_branches.branch_point%type                ,
        branch_type                 wwv_flow_step_branches.branch_type%type                 ,
        branch_condition            wwv_flow_step_branches.branch_condition%type            ,
        branch_condition_text       wwv_flow_step_branches.branch_condition_text%type       ,
        branch_condition_type       wwv_flow_step_branches.branch_condition_type%type       ,
        branch_when_button_id       wwv_flow_step_branches.branch_when_button_id%type       ,
        save_state_before_branch_yn wwv_flow_step_branches.save_state_before_branch_yn%type ,
        security_scheme             wwv_flow_step_branches.security_scheme%type );
    type t_branches is table of t_branch index by pls_integer;

    g_branches                      t_branches;
    g_branch_has_occured            boolean := false;
    g_branch_flow_id                number;
    g_branch_page_id                number;
    g_branch_page_mode              varchar2(10);

    ---------------
    -- process info
    --
    type t_process is record (
        id                           wwv_flow_step_processing.id%type                      ,
        process_sequence             wwv_flow_step_processing.process_sequence%type        ,
        process_name                 wwv_flow_step_processing.process_name%type            ,
        process_sql                  varchar2(32767)                                       ,
        process_point                wwv_flow_step_processing.process_point%type           ,
        region_id                    wwv_flow_step_processing.region_id%type               ,
        process_type                 wwv_flow_step_processing.process_type%type            ,
        process_component_name       varchar2(30)                                          , -- APEX_APPLICATION_PROCESSES or APEX_APPLICATION_PAGE_PROCESS
        process_error_message        wwv_flow_step_processing.process_error_message%type   ,
        error_display_location       wwv_flow_step_processing.error_display_location%type  ,
        process_success_message      wwv_flow_step_processing.process_success_message%type ,
        process_when                 wwv_flow_step_processing.process_when%type            ,
        process_when_type            wwv_flow_step_processing.process_when_type%type       ,
        process_when2                wwv_flow_step_processing.process_when2%type           ,
        process_when_button_id       wwv_flow_step_processing.process_when_button_id%type  ,
        security_scheme              wwv_flow_step_processing.security_scheme%type         ,
        only_for_changed_rows        wwv_flow_step_processing.only_for_changed_rows%type   ,
        exec_cond_for_each_row       wwv_flow_step_processing.exec_cond_for_each_row%type  ,
        process_is_stateful_y_n      wwv_flow_step_processing.process_is_stateful_y_n%type ,
        item_name                    wwv_flow_step_processing.item_name%type               ,
        attribute_01                 wwv_flow_step_processing.attribute_01%type            ,
        attribute_02                 wwv_flow_step_processing.attribute_02%type            ,
        attribute_03                 wwv_flow_step_processing.attribute_03%type            ,
        attribute_04                 wwv_flow_step_processing.attribute_04%type            ,
        attribute_05                 wwv_flow_step_processing.attribute_05%type            ,
        attribute_06                 wwv_flow_step_processing.attribute_06%type            ,
        attribute_07                 wwv_flow_step_processing.attribute_07%type            ,
        attribute_08                 wwv_flow_step_processing.attribute_08%type            ,
        attribute_09                 wwv_flow_step_processing.attribute_09%type            ,
        attribute_10                 wwv_flow_step_processing.attribute_10%type            ,
        attribute_11                 wwv_flow_step_processing.attribute_11%type            ,
        attribute_12                 wwv_flow_step_processing.attribute_12%type            ,
        attribute_13                 wwv_flow_step_processing.attribute_13%type            ,
        attribute_14                 wwv_flow_step_processing.attribute_14%type            ,
        attribute_15                 wwv_flow_step_processing.attribute_15%type );
    type t_processes is table of t_process index by pls_integer;

    g_processes                     t_processes;
    g_in_process                    boolean := false;

    ---------------------
    -- region (plug) info
    --
    subtype t_region_component_type_id is pls_integer range 1 .. 3;
    c_region_component_item        constant t_region_component_type_id := 1;
    c_region_component_button      constant t_region_component_type_id := 2;
    c_region_component_region      constant t_region_component_type_id := 3;
    type t_region_component is record (
        display_point                  varchar2(255)              , -- e.g. 'BODY'
        display_sequence               number                     , -- e.g. wwv_flow_step_items.item_sequence
        component_id                   number                     , -- e.g. wwv_flow_step_items.id
        type_id                        t_region_component_type_id , -- a wwv_flow.t_region_component
        idx                            pls_integer                  -- index of the component within the component array ,
    );                                                              -- e.g. index of an item in wwv_flow.g_items
    type t_region_components is table of t_region_component index by pls_integer;

    type t_plug is record (
        id                             wwv_flow_page_plugs.id%type                             ,
        page_id                        wwv_flow_page_plugs.page_id%type                        ,
        plug_name                      wwv_flow_page_plugs.plug_name%type                      ,
        parent_plug_id                 wwv_flow_page_plugs.parent_plug_id%type                 ,
        plug_template                  wwv_flow_page_plugs.plug_template%type                  ,
        plug_new_grid                  wwv_flow_page_plugs.plug_new_grid%type                  ,
        plug_new_grid_row              wwv_flow_page_plugs.plug_new_grid_row%type              ,
        plug_new_grid_column           wwv_flow_page_plugs.plug_new_grid_column%type           ,
        plug_display_column            wwv_flow_page_plugs.plug_display_column%type            ,
        plug_grid_column_span          wwv_flow_page_plugs.plug_grid_column_span%type          ,
        plug_grid_column_css_classes   wwv_flow_page_plugs.plug_grid_column_css_classes%type   ,
        plug_display_sequence          wwv_flow_page_plugs.plug_display_sequence%type          ,
        plug_display_point             wwv_flow_page_plugs.plug_display_point%type             ,
        plug_item_display_point        wwv_flow_page_plugs.plug_item_display_point%type        ,
        plug_source                    varchar2(32767)                                         ,
        plug_source_type               wwv_flow_page_plugs.plug_source_type%type               ,
        list_template_id               wwv_flow_page_plugs.list_template_id%type               ,
        list_id                        wwv_flow_page_plugs.list_id%type                        ,
        menu_id                        wwv_flow_page_plugs.menu_id%type                        ,
        --
        plug_header                    wwv_flow_page_plugs.plug_header%type                    ,
        plug_footer                    wwv_flow_page_plugs.plug_footer%type                    ,
        --
        plug_required_role             wwv_flow_page_plugs.plug_required_role%type             ,
        plug_display_when_condition    wwv_flow_page_plugs.plug_display_when_condition%type    ,
        plug_display_when_cond2        wwv_flow_page_plugs.plug_display_when_cond2%type        ,
        plug_display_condition_type    wwv_flow_page_plugs.plug_display_condition_type%type    ,
        plug_column_width              wwv_flow_page_plugs.plug_column_width%type              ,
        plug_customized                wwv_flow_page_plugs.plug_customized%type                ,
        plug_query_no_data_found       wwv_flow_page_plugs.plug_query_no_data_found%type       ,
        plug_query_more_data           wwv_flow_page_plugs.plug_query_more_data%type           ,
        plug_query_parse_override      wwv_flow_page_plugs.plug_query_parse_override%type      ,
        plug_query_num_rows            wwv_flow_page_plugs.plug_query_num_rows%type            ,
        plug_query_num_rows_item       wwv_flow_page_plugs.plug_query_num_rows_item%type       ,
        plug_query_headings_type       wwv_flow_page_plugs.plug_query_headings_type%type       ,
        plug_query_headings            wwv_flow_page_plugs.plug_query_headings%type            ,
        ajax_items_to_submit           wwv_flow_page_plugs.ajax_items_to_submit%type           ,
        escape_on_http_output          wwv_flow_page_plugs.escape_on_http_output%type          ,
        plug_caching                   wwv_flow_page_plugs.plug_caching%type                   ,
        plug_cache_when                wwv_flow_page_plugs.plug_cache_when%type                ,
        plug_cache_expression1         wwv_flow_page_plugs.plug_cache_expression1%type         ,
        plug_cache_expression2         wwv_flow_page_plugs.plug_cache_expression2%type         ,
        plug_cache_depends_on_items    wwv_flow_page_plugs.plug_cache_depends_on_items%type    ,
        plug_static_id                 varchar2(32767)                                         ,
        region_css_classes             wwv_flow_page_plugs.region_css_classes%type             ,
        icon_css_classes               wwv_flow_page_plugs.icon_css_classes%type               ,
        region_sub_css_classes         wwv_flow_page_plugs.region_sub_css_classes%type         ,
        region_template_options        wwv_flow_page_plugs.region_template_options%type        ,
        component_template_options     wwv_flow_page_plugs.component_template_options%type     ,
        region_attributes_substitution wwv_flow_page_plugs.region_attributes_substitution%type ,
        region_image                   wwv_flow_page_plugs.region_image%type                   ,
        region_image_attr              wwv_flow_page_plugs.region_image_attr%type              ,
        plug_read_only_when_type       wwv_flow_page_plugs.plug_read_only_when_type%type       ,
        plug_read_only_when            wwv_flow_page_plugs.plug_read_only_when%type            ,
        plug_read_only_when2           wwv_flow_page_plugs.plug_read_only_when2%type           ,
        --
        attribute_01                   wwv_flow_page_plugs.attribute_01%type                   ,
        attribute_02                   wwv_flow_page_plugs.attribute_02%type                   ,
        attribute_03                   wwv_flow_page_plugs.attribute_03%type                   ,
        attribute_04                   wwv_flow_page_plugs.attribute_04%type                   ,
        attribute_05                   wwv_flow_page_plugs.attribute_05%type                   ,
        attribute_06                   wwv_flow_page_plugs.attribute_06%type                   ,
        attribute_07                   wwv_flow_page_plugs.attribute_07%type                   ,
        attribute_08                   wwv_flow_page_plugs.attribute_08%type                   ,
        attribute_09                   wwv_flow_page_plugs.attribute_09%type                   ,
        attribute_10                   wwv_flow_page_plugs.attribute_10%type                   ,
        attribute_11                   wwv_flow_page_plugs.attribute_11%type                   ,
        attribute_12                   wwv_flow_page_plugs.attribute_12%type                   ,
        attribute_13                   wwv_flow_page_plugs.attribute_13%type                   ,
        attribute_14                   wwv_flow_page_plugs.attribute_14%type                   ,
        attribute_15                   wwv_flow_page_plugs.attribute_15%type                   ,
        attribute_16                   wwv_flow_page_plugs.attribute_16%type                   ,
        attribute_17                   wwv_flow_page_plugs.attribute_17%type                   ,
        attribute_18                   wwv_flow_page_plugs.attribute_18%type                   ,
        attribute_19                   wwv_flow_page_plugs.attribute_19%type                   ,
        attribute_20                   wwv_flow_page_plugs.attribute_20%type                   ,
        attribute_21                   wwv_flow_page_plugs.attribute_21%type                   ,
        attribute_22                   wwv_flow_page_plugs.attribute_22%type                   ,
        attribute_23                   wwv_flow_page_plugs.attribute_23%type                   ,
        attribute_24                   wwv_flow_page_plugs.attribute_24%type                   ,
        attribute_25                   wwv_flow_page_plugs.attribute_25%type                   ,
        --
        -- attributes that are not directly set via base table fields, but
        -- populated some time during page processing
        --
        is_read_only                   boolean                                                 , -- result of read only computation
        is_ok_to_display               boolean                                                 , -- result of conditional display computation
        save_in_cache                  boolean                                                 , -- should the render result be saved in the cache?
        item_sequence_before           pls_integer                                             , -- value of counter for items before rendering this region
        item_sequence_after            pls_integer                                             , -- value of counter for items after rendering this region
        protected_items_in_region      pls_integer                                             , -- number of protected items that have been rendered in this region
        idx                            pls_integer                                             , -- index in g_plugs
        parent_idx                     pls_integer                                             , -- index of parent region in g_plugs
        --
        components                     t_region_components );
    type t_plugs is table of t_plug index by pls_integer;

    g_plugs                        t_plugs;
    g_page_components              t_region_components;
    g_plug_position                varchar2(255);

    -------------------
    -- computation info
    --
    type t_computation is record (
        id                          wwv_flow_step_computations.id%type                    ,
        computation_sequence        wwv_flow_step_computations.computation_sequence%type  ,
        computation_item            wwv_flow_step_computations.computation_item%type      ,
        computation_point           wwv_flow_step_computations.computation_point%type     ,
        computation_type            wwv_flow_step_computations.computation_type%type      ,
        computation_component_type  varchar2(30)                                          ,
        computation_processed       wwv_flow_step_computations.computation_processed%type ,
        computation                 wwv_flow_step_computations.computation%type           ,
        compute_when                wwv_flow_step_computations.compute_when%type          ,
        compute_when_text           wwv_flow_step_computations.compute_when_text%type     ,
        compute_when_type           wwv_flow_step_computations.compute_when_type%type     ,
        security_scheme             wwv_flow_step_computations.security_scheme%type );
    type t_computations is table of t_computation index by pls_integer;

    g_computations                t_computations;
    g_computation_result_vc       varchar2(32767);
    g_computation_result_vc_arr   wwv_flow_global.vc_arr2;
    g_computation_result_num      number;

    --------------
    -- Validations
    --
    g_column_ids_in_error         wwv_flow_global.vc_arr2;
    -- if g_execute_validations is programmatically set before the validations
    -- are evaluated then this flag will determin if built-in validations and the
    -- validations defined for the page are evaluated. If set to NULL, the
    -- "Execute Validations" flag for buttons and select lists/radio groups will
    -- be evaluated
    g_execute_validations         boolean default null;

    --------------------------------------------
    -- Global input values for updatable reports
    --
    g_f01             wwv_flow_global.vc_arr2;
    g_f02             wwv_flow_global.vc_arr2;
    g_f03             wwv_flow_global.vc_arr2;
    g_f04             wwv_flow_global.vc_arr2;
    g_f05             wwv_flow_global.vc_arr2;
    g_f06             wwv_flow_global.vc_arr2;
    g_f07             wwv_flow_global.vc_arr2;
    g_f08             wwv_flow_global.vc_arr2;
    g_f09             wwv_flow_global.vc_arr2;
    g_f10             wwv_flow_global.vc_arr2;
    g_f11             wwv_flow_global.vc_arr2;
    g_f12             wwv_flow_global.vc_arr2;
    g_f13             wwv_flow_global.vc_arr2;
    g_f14             wwv_flow_global.vc_arr2;
    g_f15             wwv_flow_global.vc_arr2;
    g_f16             wwv_flow_global.vc_arr2;
    g_f17             wwv_flow_global.vc_arr2;
    g_f18             wwv_flow_global.vc_arr2;
    g_f19             wwv_flow_global.vc_arr2;
    g_f20             wwv_flow_global.vc_arr2;
    g_f21             wwv_flow_global.vc_arr2;
    g_f22             wwv_flow_global.vc_arr2;
    g_f23             wwv_flow_global.vc_arr2;
    g_f24             wwv_flow_global.vc_arr2;
    g_f25             wwv_flow_global.vc_arr2;
    g_f26             wwv_flow_global.vc_arr2;
    g_f27             wwv_flow_global.vc_arr2;
    g_f28             wwv_flow_global.vc_arr2;
    g_f29             wwv_flow_global.vc_arr2;
    g_f30             wwv_flow_global.vc_arr2;
    g_f31             wwv_flow_global.vc_arr2;
    g_f32             wwv_flow_global.vc_arr2;
    g_f33             wwv_flow_global.vc_arr2;
    g_f34             wwv_flow_global.vc_arr2;
    g_f35             wwv_flow_global.vc_arr2;
    g_f36             wwv_flow_global.vc_arr2;
    g_f37             wwv_flow_global.vc_arr2;
    g_f38             wwv_flow_global.vc_arr2;
    g_f39             wwv_flow_global.vc_arr2;
    g_f40             wwv_flow_global.vc_arr2;
    g_f41             wwv_flow_global.vc_arr2;
    g_f42             wwv_flow_global.vc_arr2;
    g_f43             wwv_flow_global.vc_arr2;
    g_f44             wwv_flow_global.vc_arr2;
    g_f45             wwv_flow_global.vc_arr2;
    g_f46             wwv_flow_global.vc_arr2;
    g_f47             wwv_flow_global.vc_arr2;
    g_f48             wwv_flow_global.vc_arr2;
    g_f49             wwv_flow_global.vc_arr2;
    g_f50             wwv_flow_global.vc_arr2;
    g_fcs             wwv_flow_global.vc_arr2;
    g_fcud            wwv_flow_global.vc_arr2;
    g_frowid          wwv_flow_global.vc_arr2;
    g_survey_map      varchar2(32767);

    --------------------------------------------
    -- Global input variables for AJAX utilities
    --
    g_widget_name       varchar2(255);
    g_widget_mod        varchar2(255);
    g_widget_action     varchar2(255);
    g_widget_action_mod	varchar2(255);
    g_widget_num_return	varchar2(255);
    g_widget_view_mode  varchar2(255);

    g_x01             varchar2(32767);
    g_x02             varchar2(32767);
    g_x03             varchar2(32767);
    g_x04             varchar2(32767);
    g_x05             varchar2(32767);
    g_x06             varchar2(32767);
    g_x07             varchar2(32767);
    g_x08             varchar2(32767);
    g_x09             varchar2(32767);
    g_x10             varchar2(32767);
    g_clob_01         clob;

    ------------------------------------
    -- Session Timeout
    --

    g_max_session_length_sec        number;
    g_max_session_idle_sec          number;

    ----------------------------------------------------------------------------
    -- Global array of form item values fetched by automated row fetch processes
    -- and other globals previously in wwv_flow_dml
    --
    g_column_values             wwv_flow.flow_vc_arr;
    g_clob_column_values        wwv_flow.clob_arr;
    g_dml_blob                  blob;
    g_dml_validation_count      pls_integer := 0;
    g_dml_mimetype              varchar2(255);
    g_dml_filename              varchar2(400);
    g_dml_charset               varchar2(255);
    g_dml_last_updated_date     date;
    g_dml_clob_text             clob;
    g_dml_varchar32767_text     varchar2(32767);
    g_dml_rowid                 varchar2(255);
    g_dml_blob_length           number := 0;

    ---------------------------
    -- To test URL encryption 4.0
    --
    g_item_values_encrypted boolean := false;
    g_fetch_encrypted       boolean := false;

    -----------------------------
    -- Stop APEX Engine
    -----------------------------
    c_stop_apex_engine_no constant pls_integer := -20876;
    e_stop_apex_engine    exception;
    pragma exception_init(e_stop_apex_engine, -20876);

    ---------------------------
    -- Maximum DB VARCHAR2 size
    --
$if sys.dbms_db_version.ver_le_10_2 $then
    c_max_size_vc2 constant number := 4000;
$elsif sys.dbms_db_version.ver_le_11_1 $then
    c_max_size_vc2 constant number := 4000;
$elsif sys.dbms_db_version.ver_le_11_2 $then
    c_max_size_vc2 constant number := 4000;
$else
    c_max_size_vc2 constant number := 32767;
$end

----------------------------------------------------------------------------
-- S H O W
--
-- This procedure is the entry point for the display of application express pages.
--
--
-- p_request              -- Request which can be the tab pressed, the button pressed, an
--                           arbitrary value etc.
-- p_instance             -- Flow Session ID, must be numeric.
-- p_flow_id              -- Flow ID, must be numeric.
-- p_flow_step_id         -- Page ID, must be numeric (for example: 1)
-- p_debug                -- If "YES" then flows will display debug messages.
-- p_arg_names            -- Comma seperated list of flow item names.  Item names should
--                           have corresponding (p_arg_values) values.  For example:
--                           p_arg_names => 'A,B,C'
--                           p_arg_values=> '1,2,3'
--                           This assumes that a flow or page item called A, B, and C
--                           exists.  When called a value of 1 will be assigned to A,
--                           2 to B, etc.
-- p_arg_values           -- Comma seperated list of values that corresponds to a
--                           comma seperated list of names (p_arg_names).  The session
--                           state for the flow items identified will be set to these
--                           values.
-- p_arg_name             -- use when passing one item name, itentifies a single item name
-- p_arg_value            -- use when passing one item value, identifies a single item value
-- p_clear_cache          -- Comma seperated list of pages (e.g. 2,3,4).
--                           Sets to null the values of any flow item declared for a
--                           list of pages.
-- p_box_border           -- obsolete
-- p_printer_friendly     -- If "YES" then show page using printer friendly template.
--                           Do not generate tabs or nav bar icons.
-- p_trace                -- If "YES", generate trace file for debugging and performance tuning
-- p_company              -- ID of company (security group id) must be numeric
-- p_md5_checksum         -- checksum to prevent lost updates
-- p_last_button_pressed  -- facilitates reference to :flow_last_button_pressed
-- p_dialog_cs            -- check sum for modal dialog page to allow use of iframe when Embed in Frame security setting is DENY

procedure show (
    p_request             in varchar2   default null,
    p_instance            in varchar2   default null,
    p_flow_id             in varchar2   default null,
    p_flow_step_id        in varchar2   default null,
    p_debug               in varchar2   default 'NO',
    p_arg_names           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_arg_values          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_clear_cache         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_box_border          in varchar2   default '0',
    p_printer_friendly    in varchar2   default 'NO',
    p_trace               in varchar2   default 'NO',
    p_company             in number     default null,
    p_md5_checksum        in varchar2   default '0',
    p_last_button_pressed in varchar2   default null,
    p_arg_name            in varchar2   default null,
    p_arg_value           in varchar2   default null,
    f01                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f02                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f03                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f04                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f05                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f06                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f07                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f08                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f09                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f10                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f11                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f12                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f13                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f14                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f15                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f16                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f17                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f18                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f19                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f20                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_widget_name         in varchar2   default null,
    p_widget_mod          in varchar2   default null,
    p_widget_action       in varchar2   default null,
    p_widget_action_mod   in varchar2   default null,
    p_widget_num_return   in varchar2   default null,
    p_widget_view_mode    in varchar2   default null,
    p_fsp_region_id       in number     default null,
    p_pg_min_row          in number     default null,
    p_pg_max_rows         in number     default null,
    p_pg_rows_fetched     in number     default null,
    p_time_zone           in varchar2   default null,
    x01                   in varchar2   default null,
    x02                   in varchar2   default null,
    x03                   in varchar2   default null,
    x04                   in varchar2   default null,
    x05                   in varchar2   default null,
    x06                   in varchar2   default null,
    x07                   in varchar2   default null,
    x08                   in varchar2   default null,
    x09                   in varchar2   default null,
    x10                   in varchar2   default null,
    p_clob_01             in clob       default null,
    p_lang                in varchar2   default null,
    p_territory           in varchar2   default null,
    p_cs                  in varchar2   default null,
    j                     in varchar2   default null,
    XMLCallDate           in varchar2   default null,
    p_dialog_cs           in varchar2   default null)
    ;


----------------------------------------------------------------------------
-- A C C E P T
--
-- This procedure accepts virtually every flow page.
-- Reference show procedure for input argument descriptions.
--
--
--
--

procedure accept (
    p_request       in varchar2   default null,
    p_instance      in varchar2   default null,
    p_flow_id       in varchar2   default null,
    p_company       in number     default null,
    p_flow_step_id  in varchar2   default null,
    p_arg_names     in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_arg_values    in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_arg_checksums in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_page_checksum in varchar2                default null,
    p_accept_processing in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v01           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v02           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v03           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v04           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v05           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v06           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v07           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v08           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v09           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v10           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v11           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v12           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v13           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v14           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v15           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v16           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v17           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v18           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v19           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v20           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v21           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v22           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v23           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v24           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v25           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v26           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v27           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v28           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v29           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v30           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v31           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v32           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v33           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v34           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v35           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v36           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v37           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v38           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v39           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v40           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v41           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v42           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v43           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v44           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v45           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v46           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v47           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v48           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v49           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v50           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v51           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v52           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v53           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v54           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v55           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v56           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v57           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v58           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v59           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v60           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v61           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v62           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v63           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v64           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v65           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v66           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v67           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v68           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v69           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v70           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v71           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v72           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v73           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v74           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v75           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v76           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v77           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v78           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v79           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v80           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v81           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v82           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v83           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v84           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v85           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v86           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v87           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v88           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v89           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v90           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v91           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v92           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v93           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v94           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v95           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v96           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v97           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v98           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v99           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v100          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v101          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v102          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v103          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v104          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v105          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v106          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v107          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v108          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v109          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v110          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v111          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v112          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v113          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v114          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v115          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v116          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v117          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v118          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v119          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v120          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v121          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v122          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v123          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v124          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v125          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v126          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v127          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v128          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v129          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v130          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v131          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v132          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v133          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v134          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v135          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v136          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v137          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v138          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v139          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v140          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v141          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v142          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v143          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v144          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v145          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v146          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v147          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v148          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v149          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v150          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v151          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v152          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v153          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v154          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v155          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v156          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v157          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v158          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v159          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v160          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v161          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v162          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v163          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v164          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v165          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v166          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v167          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v168          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v169          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v170          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v171          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v172          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v173          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v174          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v175          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v176          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v177          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v178          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v179          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v180          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v181          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v182          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v183          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v184          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v185          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v186          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v187          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v188          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v189          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v190          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v191          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v192          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v193          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v194          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v195          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v196          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v197          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v198          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v199          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_v200          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_t01           in varchar2   default null,
    p_t02           in varchar2   default null,
    p_t03           in varchar2   default null,
    p_t04           in varchar2   default null,
    p_t05           in varchar2   default null,
    p_t06           in varchar2   default null,
    p_t07           in varchar2   default null,
    p_t08           in varchar2   default null,
    p_t09           in varchar2   default null,
    p_t10           in varchar2   default null,
    p_t11           in varchar2   default null,
    p_t12           in varchar2   default null,
    p_t13           in varchar2   default null,
    p_t14           in varchar2   default null,
    p_t15           in varchar2   default null,
    p_t16           in varchar2   default null,
    p_t17           in varchar2   default null,
    p_t18           in varchar2   default null,
    p_t19           in varchar2   default null,
    p_t20           in varchar2   default null,
    p_t21           in varchar2   default null,
    p_t22           in varchar2   default null,
    p_t23           in varchar2   default null,
    p_t24           in varchar2   default null,
    p_t25           in varchar2   default null,
    p_t26           in varchar2   default null,
    p_t27           in varchar2   default null,
    p_t28           in varchar2   default null,
    p_t29           in varchar2   default null,
    p_t30           in varchar2   default null,
    p_t31           in varchar2   default null,
    p_t32           in varchar2   default null,
    p_t33           in varchar2   default null,
    p_t34           in varchar2   default null,
    p_t35           in varchar2   default null,
    p_t36           in varchar2   default null,
    p_t37           in varchar2   default null,
    p_t38           in varchar2   default null,
    p_t39           in varchar2   default null,
    p_t40           in varchar2   default null,
    p_t41           in varchar2   default null,
    p_t42           in varchar2   default null,
    p_t43           in varchar2   default null,
    p_t44           in varchar2   default null,
    p_t45           in varchar2   default null,
    p_t46           in varchar2   default null,
    p_t47           in varchar2   default null,
    p_t48           in varchar2   default null,
    p_t49           in varchar2   default null,
    p_t50           in varchar2   default null,
    p_t51           in varchar2   default null,
    p_t52           in varchar2   default null,
    p_t53           in varchar2   default null,
    p_t54           in varchar2   default null,
    p_t55           in varchar2   default null,
    p_t56           in varchar2   default null,
    p_t57           in varchar2   default null,
    p_t58           in varchar2   default null,
    p_t59           in varchar2   default null,
    p_t60           in varchar2   default null,
    p_t61           in varchar2   default null,
    p_t62           in varchar2   default null,
    p_t63           in varchar2   default null,
    p_t64           in varchar2   default null,
    p_t65           in varchar2   default null,
    p_t66           in varchar2   default null,
    p_t67           in varchar2   default null,
    p_t68           in varchar2   default null,
    p_t69           in varchar2   default null,
    p_t70           in varchar2   default null,
    p_t71           in varchar2   default null,
    p_t72           in varchar2   default null,
    p_t73           in varchar2   default null,
    p_t74           in varchar2   default null,
    p_t75           in varchar2   default null,
    p_t76           in varchar2   default null,
    p_t77           in varchar2   default null,
    p_t78           in varchar2   default null,
    p_t79           in varchar2   default null,
    p_t80           in varchar2   default null,
    p_t81           in varchar2   default null,
    p_t82           in varchar2   default null,
    p_t83           in varchar2   default null,
    p_t84           in varchar2   default null,
    p_t85           in varchar2   default null,
    p_t86           in varchar2   default null,
    p_t87           in varchar2   default null,
    p_t88           in varchar2   default null,
    p_t89           in varchar2   default null,
    p_t90           in varchar2   default null,
    p_t91           in varchar2   default null,
    p_t92           in varchar2   default null,
    p_t93           in varchar2   default null,
    p_t94           in varchar2   default null,
    p_t95           in varchar2   default null,
    p_t96           in varchar2   default null,
    p_t97           in varchar2   default null,
    p_t98           in varchar2   default null,
    p_t99           in varchar2   default null,
    p_t100          in varchar2   default null,
    p_t101          in varchar2   default null,
    p_t102          in varchar2   default null,
    p_t103          in varchar2   default null,
    p_t104          in varchar2   default null,
    p_t105          in varchar2   default null,
    p_t106          in varchar2   default null,
    p_t107          in varchar2   default null,
    p_t108          in varchar2   default null,
    p_t109          in varchar2   default null,
    p_t110          in varchar2   default null,
    p_t111          in varchar2   default null,
    p_t112          in varchar2   default null,
    p_t113          in varchar2   default null,
    p_t114          in varchar2   default null,
    p_t115          in varchar2   default null,
    p_t116          in varchar2   default null,
    p_t117          in varchar2   default null,
    p_t118          in varchar2   default null,
    p_t119          in varchar2   default null,
    p_t120          in varchar2   default null,
    p_t121          in varchar2   default null,
    p_t122          in varchar2   default null,
    p_t123          in varchar2   default null,
    p_t124          in varchar2   default null,
    p_t125          in varchar2   default null,
    p_t126          in varchar2   default null,
    p_t127          in varchar2   default null,
    p_t128          in varchar2   default null,
    p_t129          in varchar2   default null,
    p_t130          in varchar2   default null,
    p_t131          in varchar2   default null,
    p_t132          in varchar2   default null,
    p_t133          in varchar2   default null,
    p_t134          in varchar2   default null,
    p_t135          in varchar2   default null,
    p_t136          in varchar2   default null,
    p_t137          in varchar2   default null,
    p_t138          in varchar2   default null,
    p_t139          in varchar2   default null,
    p_t140          in varchar2   default null,
    p_t141          in varchar2   default null,
    p_t142          in varchar2   default null,
    p_t143          in varchar2   default null,
    p_t144          in varchar2   default null,
    p_t145          in varchar2   default null,
    p_t146          in varchar2   default null,
    p_t147          in varchar2   default null,
    p_t148          in varchar2   default null,
    p_t149          in varchar2   default null,
    p_t150          in varchar2   default null,
    p_t151          in varchar2   default null,
    p_t152          in varchar2   default null,
    p_t153          in varchar2   default null,
    p_t154          in varchar2   default null,
    p_t155          in varchar2   default null,
    p_t156          in varchar2   default null,
    p_t157          in varchar2   default null,
    p_t158          in varchar2   default null,
    p_t159          in varchar2   default null,
    p_t160          in varchar2   default null,
    p_t161          in varchar2   default null,
    p_t162          in varchar2   default null,
    p_t163          in varchar2   default null,
    p_t164          in varchar2   default null,
    p_t165          in varchar2   default null,
    p_t166          in varchar2   default null,
    p_t167          in varchar2   default null,
    p_t168          in varchar2   default null,
    p_t169          in varchar2   default null,
    p_t170          in varchar2   default null,
    p_t171          in varchar2   default null,
    p_t172          in varchar2   default null,
    p_t173          in varchar2   default null,
    p_t174          in varchar2   default null,
    p_t175          in varchar2   default null,
    p_t176          in varchar2   default null,
    p_t177          in varchar2   default null,
    p_t178          in varchar2   default null,
    p_t179          in varchar2   default null,
    p_t180          in varchar2   default null,
    p_t181          in varchar2   default null,
    p_t182          in varchar2   default null,
    p_t183          in varchar2   default null,
    p_t184          in varchar2   default null,
    p_t185          in varchar2   default null,
    p_t186          in varchar2   default null,
    p_t187          in varchar2   default null,
    p_t188          in varchar2   default null,
    p_t189          in varchar2   default null,
    p_t190          in varchar2   default null,
    p_t191          in varchar2   default null,
    p_t192          in varchar2   default null,
    p_t193          in varchar2   default null,
    p_t194          in varchar2   default null,
    p_t195          in varchar2   default null,
    p_t196          in varchar2   default null,
    p_t197          in varchar2   default null,
    p_t198          in varchar2   default null,
    p_t199          in varchar2   default null,
    p_t200          in varchar2   default null,
    f01             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f02             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f03             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f04             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f05             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f06             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f07             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f08             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f09             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f10             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f11             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f12             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f13             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f14             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f15             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f16             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f17             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f18             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f19             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f20             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f21             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f22             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f23             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f24             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f25             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f26             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f27             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f28             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f29             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f30             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f31             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f32             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f33             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f34             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f35             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f36             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f37             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f38             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f39             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f40             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f41             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f42             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f43             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f44             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f45             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f46             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f47             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f48             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f49             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f50             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fcs             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fmap            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fhdr            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fcud            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    frowid          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    x01             in varchar2   default null,
    x02             in varchar2   default null,
    x03             in varchar2   default null,
    x04             in varchar2   default null,
    x05             in varchar2   default null,
    x06             in varchar2   default null,
    x07             in varchar2   default null,
    x08             in varchar2   default null,
    x09             in varchar2   default null,
    x10             in varchar2   default null,
    x11             in varchar2   default null,
    x12             in varchar2   default null,
    x13             in varchar2   default null,
    x14             in varchar2   default null,
    x15             in varchar2   default null,
    x16             in varchar2   default null,
    x17             in varchar2   default null,
    x18             in varchar2   default null,
    x19             in varchar2   default null,
    x20             in varchar2   default null,
    p_listener      in wwv_flow_global.vc_arr2 default empty_vc_arr, -- used to communicate with apex listner
    p_map1          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_map2          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_map3          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_survey_map    in varchar2   default null,
    p_flow_current_min_row      in varchar2 default '1',
    p_flow_current_max_rows     in varchar2 default '10',
    p_flow_current_rows_fetched in varchar2 default '0',
    p_debug                     in varchar2 default 'NO',
    p_trace                     in varchar2 default 'NO',
    p_md5_checksum              in varchar2 default '0',
    p_page_submission_id        in varchar2 default null,
    p_time_zone                 in varchar2 default null,
    p_ignore_01     in varchar2 default null,
    p_ignore_02     in varchar2 default null,
    p_ignore_03     in varchar2 default null,
    p_ignore_04     in varchar2 default null,
    p_ignore_05     in varchar2 default null,
    p_ignore_06     in varchar2 default null,
    p_ignore_07     in varchar2 default null,
    p_ignore_08     in varchar2 default null,
    p_ignore_09     in varchar2 default null,
    p_ignore_10     in varchar2 default null,
    p_lang          in varchar2 default null,
    p_territory     in varchar2 default null,
    p_dialog_cs     in varchar2 default null)
    ;

----------------------------------------------------------------------------
-- Returns all text messages of the APEX Runtime Engine and the specified
-- application which are marked as JavaScript messages.
--
procedure js_messages (
    p_app_id  in number,
    p_lang    in varchar2,
    p_version in varchar2,
    p_builder in varchar2 default 'N' );

----------------------------------------------------------------------------
-- H E L P   S Y S T E M
--

procedure help (
    --
    -- Returns Page and Column level help from flow builder meta data
    -- repository.
    --
    -- Arguments:
    --    p_flow_id        = flow ID
    --    p_flow_step_id   = page ID
    --    p_show_item_help = YES (include item level help), NO do not show item level help
    --
    p_request        in varchar2 default null,
    p_flow_id        in varchar2 default null,
    p_flow_step_id   in varchar2 default null,
    p_show_item_help in varchar2 default 'YES',
    p_show_regions   in varchar2 default 'YES',
    --
    p_before_page_html     in varchar2 default '<p>',
    p_after_page_html      in varchar2 default null,
    p_before_region_html   in varchar2 default null,
    p_after_region_html    in varchar2 default '</td></tr></table></p>',
    p_before_prompt_html   in varchar2 default '<p><b>',
    p_after_prompt_html    in varchar2 default '</b></p>:&nbsp;',
    p_before_item_html     in varchar2 default null,
    p_after_item_html      in varchar2 default null)
    ;







----------------------------------------------------------------------------
-- U T I L I T I E S
--

function do_substitutions (
    --
    -- Perform substitutions of ampersand prefixed flow items with
    -- current flow session state for current user and current session.
    --
    p_string                       in varchar2 default null,
    p_sub_type                     in varchar2 default 'SQL',
    p_perform_oracle_substitutions in boolean default false )
    return varchar2
    ;

function trim_sql (
    --
    -- Given a SQL statement , trim trailing and leading
    -- white spaces.  Optionally perform session state substitutions
    -- as well as ensuring the statement ends in a semicolon.
    --
    p_sql               in varchar2 default null,
    p_ends_in_semicolon in boolean default false,
    p_do_substitutions  in boolean default true)
    return varchar2
    ;

function trim_sql (
    --
    -- This function gets a SQL statement ready for execution
    -- Function is overloaded; p_owner may be provided in order to cause package global
    -- to be temporarily replaced with the value of p_owner in package state during
    -- the execution of this function and until its return to the caller.
    --
    p_sql               in varchar2 default null,
    p_ends_in_semicolon in boolean default false,
    p_do_substitutions  in boolean default true,
    p_owner             in varchar2)
    return varchar2
    ;

function trim_nl_sp_tab (
    -- This function removes all whitespace, tab, and new line characters at the begin and end of the input string
    p_string varchar2 )
    return varchar2;

procedure set_g_nls_date_format
    ;

procedure reset_g_nls_date_format
    ;


procedure set_g_nls_decimal_separator
    ;

procedure reset_g_nls_decimal_separator
    ;

function get_nls_decimal_separator return varchar2
    ;

function get_nls_group_separator return varchar2
    ;

function get_translated_app_id return number
    ;

procedure set_g_base_href
    ;

procedure reset_g_base_href
    ;

function get_g_base_href return varchar2
    ;

function get_page_alias return varchar2
    ;

function is_custom_auth_page return boolean
    ;

function get_application_id return number
    ;

function get_page_id return number
    ;

function get_session_id return number
    ;

function get_security_group_id return number
    ;

function is_pressed_button (
    p_button_id in number )
    return boolean;

----------------------------------------------------------------------------
-- E R R O R   H A N D L I N G
--
--==============================================================================
-- Returns the number of inline validation errors.
-- Note: That's a compatibility wrapper,
--       use wwv_flow_error.get_validation_error_count instead.
--==============================================================================
function g_inline_validation_error_cnt return pls_integer;

--==============================================================================
-- Signals the APEX engine to stop further processing and immediately exit so
-- that no additional HTML code is added to the HTTP buffer.
--
-- Note: This procedure will internally raise the exception e_stop_apex_engine.
--       You have to reraise that exception if you use a WHEN OTHERS exception
--       handler!
--
-- Example:
--
-- owa_util.redirect_url('http://apex.oracle.com');
-- apex_application.stop_apex_engine;
--
-- Complex example with a when others exception handler:
--
-- begin
--     ... code which can raise an exception ...
--     owa_util.redirect_url('http://apex.oracle.com');
--     apex_application.stop_apex_engine;
-- exception
--     when apex_application.e_stop_apex_engine then
--         raise; -- reraise the stop APEX engine exception
--     when others then
--         ...; -- code to handle the exception
-- end;
--
--==============================================================================
procedure stop_apex_engine;

----------------------------------------
-- I N T E R N A L     U T I L I T I E S
--
-- Internal utilities used by the flow engine runtime
-- that are not intened and are not useful to the
-- flows programmer.
--

procedure set_component (
    p_type in varchar2,
    p_id   in number   default null,
    p_name in varchar2 default null );

function get_component return t_component;

procedure clear_component;

function paint_formOpen
    -- Return the HTML form open tag given current flow state.
    return varchar2
    ;


function get_form_close_tag return varchar2;

function paint_buttons (
    -- Given current flows context draw (omit the HTML) for
    -- buttons given a position and region ID.
    p_position in varchar2 default 'TOP',
    p_plug_id  in varchar2 default '0')
    return varchar2
    ;

procedure s (
    p in varchar2 default null)
    ;

----------------------------------------------------------------------------
-- D E B U G G I N G
--
procedure debug (
    -- Given a string this will result in the generation of a debug entry
    p_string         in varchar2 default null)
    ;


function get_elapsed_time
    -- Get the elapsed time from package instantiation
    return number;




----------------------------------------------------------------------------
-- S E S S I O N   S T A T E   M A N A G E M E N T
--
-- The following routines can be called to read and write session state.
--
--
--
--

function get_next_session_id
    -- Get integer ID values, session ID is a sequence, unique ID is a sequence
    -- with a random number which produces a virtual global unique ID.
    return number
    ;

function get_unique_id
    -- Return a number which is virually globally unique.
    return number
    ;

procedure clear_page_cache (
    -- Reset all cached items for a given page to null
    p_flow_page_id in number default null)
    ;

procedure clear_page_caches (
    -- Reset all cached items for pages in array to null
    p_flow_page_id in wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;

procedure clear_flow_cache (
    -- For the current session remove session state for the given flow.
    -- Requires g_instance to be set to the current flows session.
    p_flow_id in varchar2 default null)
    ;

procedure clear_app_cache (
    -- For the current session remove session state for the given flow.
    -- Requires g_instance to be set to the current flows session.
    p_app_id in varchar2 default null)
    ;

procedure clear_user_cache
    -- For the current users session remove session state and flow system preferences.
    -- Run this procedure if you reuse session IDs and want to run flows without
    -- the benifit of existing session state.  Requires g_instance to be set to the
    -- current flows session.
    ;

function find_item_id (
    -- Given a flow page or flow level items name return its numeric identifier.
    p_name in varchar2 default null)
    return number
    ;

function find_item_name (
    -- Given a flow page or flow level items numeric identifier return the items name.
    p_id in number default null)
    return varchar2
    ;

procedure update_cache_with_write (
    -- For the current session update an items cached value.  This update is persistent
    -- for the life of the flow session, unless the session state is cleared or updated.
    p_name    in varchar2 default null,
    p_value   in varchar2 default null)
    ;

procedure reset_security_check
    -- Security checks are cached to increase performance, this procedure allows you to
    -- undo the caching and thus require all security checks to be revalidated for the
    -- current user.  Use this routine if you allow a user to change "responcibilities"
    -- within an application, thus changing their authentication scheme.
    ;

function public_role_check (
    p_role      in varchar2 default null,
    p_component in varchar2 default null)
    return boolean
    ;

function public_security_check (
    -- Given the name of a flow security scheme determine if the current user
    -- passes the security check.
    p_security_scheme in varchar2)
    return boolean
    ;

function fetch_flow_item(
    -- Given a flow-level item name, locate item in current or specified
    -- flow and current or specified session and return item value.
    p_item         in varchar2,
    p_flow         in number default null,
    p_instance     in number default null)
    return varchar2
    ;

function fetch_app_item(
    -- Given a flow-level item name, locate item in current or specified
    -- flow and current or specified session and return item value.
    p_item         in varchar2,
    p_app          in number default null,
    p_instance     in number default null)
    return varchar2
    ;

------------------------------------------------------------------
-- V I R T U A L   P R I V A T E   D A T A B A S E   S U P P O R T
--
-- flows are owned by companies which are identified by a security
-- group ID.  The flow meta data repository is "sliced up" by
-- the security group id (sgid).
--

function get_sgid return number
    -- Given the current users context return the security group ID.
    ;
function get_browser_version return varchar2;
     -- return browser versiob

function get_company_name return varchar2
    -- Given the current users context return the company name.
    ;

function apps_only_workspace return boolean;

------------------------------------------------------------------
-- Stateful processes
--

function process_state(
    p_process_id in number)
    return varchar2
    ;

procedure reset_page_process(
    p_process_id in number)
    ;

procedure reset_page_processess(
    p_page_id in number)
    ;


------------------------------------------------------------------
-- A U T H E N T I C A T I O N
--

function get_custom_auth_login_url return varchar2
    -- for use with custom authentication
    ;

function replace_cgi_env(
    p_in varchar2)
    return varchar2
    ;

function get_home_link_url return varchar2
    -- internal use only
    ;

--==============================================================================
-- Public procedure used as "Path Alias Procedure" (see http://download.oracle.com/docs/cd/A97335_02/apps.102/a90099/feature.htm#1007126
-- to translate a friendly URL of APEX into a related wwv_flow.show or
-- wwv_flow_file_mgr.get_file call.
--==============================================================================
procedure resolve_friendly_url (
    p_path in varchar2 );

------------------------------------------------------------------
-- Deprecated, obsolete procedures and functions.
-- Don't use them anymore!
--

procedure null_page_cache (
    p_flow_page_id in number default null)
    ;

procedure null_step_cache (
    p_flow_step_id in number default null)
    ;

procedure null_page_caches (
    p_flow_page_id in wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;

procedure null_step_caches (
    p_flow_step_id in wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;

procedure show_error_message (
    p_message  in varchar2 default 'Error',
    p_footer   in varchar2 default null,
    p_query    in varchar2 default null)
    ;

function get_application_id (
    p_application_id_or_alias in varchar2,
    p_security_group_id       in number   default null )
    return number;

procedure set_ppr_query_session_state (p_region_id in number);

end wwv_flow;
/
show errors

set define '^'
