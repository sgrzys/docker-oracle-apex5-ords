set define '^' verify off
prompt ...create flow triggers

Rem  Copyright (c) Oracle Corporation 2001 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      trigger.sql
Rem
Rem    DESCRIPTION
Rem      Flow tiggers creation script.
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jstraub  02/28/2001 - Created
Rem       mhichwa  03/01/2001 - Added set security group id
Rem       cbcho    03/01/2001 - Added SQL Workshop set security group id
Rem       mhichwa  03/03/2001 - Added DATA_LOADER to initial provisioning
Rem       mhichwa  03/04/2001 - Added wwv_biu_flow_platform_pres
Rem       cbcho    03/13/2001 - Modified wwv_biu_flow_sw_stats trigger
Rem       cbcho    03/13/2001 - Added SQL Workshop - Control File table triggers
Rem       mhichwa  03/13/2001 - Added triggers for tree tables
Rem       mhichwa  03/19/2001 - Added comments
Rem       mhichwa  03/26/2001 - Added triggers
Rem       sleuniss 03/28/2001 - Added  security group id to import_export trigger
Rem       mhichwa  04/03/2001 - Added trim white space to flows, page processes, conditions, branches
Rem       mhichwa  04/04/2001 - Added to trigger on wwv flow to set global id
Rem       cbcho    04/10/2001 - Added trigger for wwv_flow_sw_archives table
Rem       cbcho    04/10/2001 - Changed wwv_flow_sw_archives table trigger
Rem       mhichwa  04/11/2001 - Removed flow tree state table
Rem       sdillon  04/18/2001 - Modified wwv_flows_biu_image_repo for shadow upper_image_name
Rem       mhichwa  04/18/2001 - changed name of platform pres to prefs
Rem       mhichwa  04/18/2001 - Added prompt to aid in debugging
Rem       sdillon  05/04/2001 - Changed image_repos trigger to update image_tag column
Rem       sdillon  05/15/2001 - Added css_repos trigger
Rem       sdillon  05/22/2001 - Changed COMPANY_IMAGE to COMPANY_IMAGES, FLOW_IMAGE to FLOW_IMAGES
Rem       sdillon  05/24/2001 - Added html_repos trigger
Rem       mhichwa  06/07/2001 - added sgid to preferences trigger
Rem       mhichwa  06/17/2001 - added update of last updated on and by columns
Rem       mhichwa  06/18/2001 - extened capabilities of last updated functionality
Rem       mhichwa  06/26/2001 - Changed trigger on flow developers table to expand admin to all privs.
Rem       mhichwa  06/26/2001 - Added global file inserted boolean set to trigger on flow file objects.
Rem       mhichwa  08/13/2001 - Added comment to trigger on sessions table
Rem       mhichwa  08/21/2001 - Merged apps tab.sql
Rem       mhichwa  08/21/2001 - Merged db auth tables.sql
Rem       mhichwa  08/21/2001 - Removed reference to FLOWS schema and replaced with carot 3
Rem       mhichwa  08/22/2001 - Updated trigger on security schemes to remove trailing whitespace.
Rem       mhichwa  08/23/2001 - Added create index statements provided by tmuth to avoid unindexed foreign keys
Rem       jstraub  08/24/2001 - Added :new.security_group_id to wwv_biu_flow_platform_prefs trigger
Rem       mhichwa  10/04/2001 - Added trigger on new field template table
Rem       tmuth    10/05/2001 - Removed trigger on wwv_flow_file_objects$, now in flows_files_new.sql
Rem       mhichwa  10/09/2001 - Added collections
Rem       mhichwa  10/16/2001 - Added trigger for updatable report column attributes table
Rem       mhichwa  10/24/2001 - Added upper alias to page and flow table triggers
Rem       jstraub  10/29/2001 - Added triggers for runtime distribution tables
Rem       mhichwa  11/13/2001 - Extended branch types
Rem       cbcho    11/27/2001 - Modified  wwv_biu_fnd_user to insert or update upper(allow_access_to_schemas) value
Rem       tmuth    11/27/2001 - Added XML import/export triggers
Rem       mhichwa  12/05/2001 - Changed sequence on population of id for flow sessions $ table per Scott.Spadafore instructions
Rem       cbcho    02/05/2002 - Removed remove white trailing space on process_sql column from wwv_flow_processing and wwv_flow_step_processing triggers
Rem       jkallman 02/07/2002 - Set collection_changed flag for wwv_flow_collections$, update MD5 computation in wwv_biu_flow_coll_members
Rem       mhichwa  03/07/2002 - Changed trigger on wwv flow steps to accomidate id2 column
Rem       msewtz   03/14/2002 - Added trigger for wwv_flow_xml_upload table
Rem       mhichwa  04/04/2002 - Removed wwv_flow_icon_bar_attributes
Rem       mhichwa  04/16/2002 - Removed inserts into wwv_flow_company_schemas for PEOPLE, SCHEDULER, etc schemas
Rem       jkallman 04/29/2002 - Set flow_id in trigger wwv_biu_flow_collection
Rem       mhichwa  04/29/2002 - Added trigger on new table wwv_flow_popup_lov_template
Rem       mhichwa  04/30/2002 - Added menu triggers for 3 new menu tables
Rem       jstraub  07/08/2002 - Added wwv_flows_version$ trigger
Rem       cbcho    07/12/2002 - Changed trigger on wwv_flow_mail_queue to populate timestamp column with sysdate
Rem       mhichwa  07/17/2002 - Added wwv_biu_button_template trigger
Rem       mhichwa  07/31/2002 - Added setting of alias in wwv_flow table to ensure it is not null
Rem       sspadafo 09/24/2002 - Added custom_auth_setups trigger
Rem       sspadafo 09/27/2002 - Added wwv_flow_entry_points,wwv_flow_entry_point_args,wwv_flow_step_branch_args triggers
Rem       mhichwa  10/11/2002 - Added generic table trigger
Rem       mhichwa  10/21/2002 - Fixed trigger for generic table
Rem       tmuth    11/01/2002 - Removed reference to ^3, now using select user... technique
Rem       cbcho    12/04/2002 - Obsoleted 3 DEVELOPER_ROLEs (BROWSE:USER_MANAGER:DB_MONITOR) from wwv_flow_developers trigger
Rem       mhichwa  12/12/2002 - Modified trigger on tabs to set last updated by
Rem       jstraub  02/26/2003 - bug 2823889, added raise_application_error in wwv_biu_flow_companies if
Rem                             provisioning_company_id = 20 and short_name != 'ORACLE'
Rem       sspadafo 03/06/2003 - Add trigger to populate session_id hashed in wwv_flow_sessions$ (Bug 2837566)
Rem       jstraub  03/10/2003 - Replaced select user with select sys_context( 'userenv', 'current_schema') for FLOW_OWNER
Rem       jstraub  03/12/2003 - Replaced inserts into wwv_flow_languages with list derrived from IE 6.0 languages
Rem                             and attempted to map to NLS_LANGUAGE and NLS_TERRITORY in Globalization Support Guide
Rem       jstraub  03/17/2003 - Added setting trans_flow_lang_code_root in trigger wwv_biu_flow_lang_map
Rem       jstraub  03/25/2003 - Moved wwv_biu_flow_web_services from wstab.sql
Rem       jstraub  03/25/2003 - Removed trigger on wwv_flow_dynamic_pages, table obsolete & removed from tab.sql
Rem       sspadafo 04/01/2003 - Add delete triggers and biu logic to delete wwv_flow_compound_conditions rows (Bug 2860487)
Rem       sspadafo 04/03/2003 - Adjust shortcuts trigger for null consideration_seq (Bug 2887077)
Rem       sspadafo 04/03/2003 - Remove unneeded trigger wwv_bd_flows (Bug 2860487)
Rem       sspadafo 04/03/2003 - Adjust wwv_flow_list_of_values_data triggers for wwv_flow_compound_conditions (Bug 2860487)
Rem       cbcho    04/10/2003 - Added wwv_biu_flow_hnt_table_info, wwv_biu_flow_hnt_column_info triggers (Bug 2882452)
Rem       jkallman 04/14/2003 - Modify trigger wwv_biu_flow_translatable_text to set default value for template_translatable
Rem       cbcho    04/15/2003 - Added wwv_biu_flow_chart_ser_attr (Bug 2722911)
Rem       jkallman 04/24/2003 - Added derivation of flow_id in trigger wwv_biu_flow_menu_options
Rem       msewtz   04/28/2003 - Added wwv_biu_flow_region_report_filter
Rem       msewtz   04/28/2003 - Added wwv_biu_flow_region_report_column
Rem       msewtz   04/28/2003 - Added wwv_biu_flow_query_condition
Rem       msewtz   04/28/2003 - Added wwv_biu_flow_query_column
Rem       msewtz   04/28/2003 - Added wwv_biu_flow_query_object
Rem       msewtz   04/28/2003 - Added wwv_biu_flow_query_definition
Rem       cbcho    04/29/2003 - Added Sharons wwv_biu_wwv_flow_hnt_procedure and wwv_biu_wwv_flow_hnt_argument
Rem       jkallman 05/02/2003 - Corrected typo in wwv_bd_flowstepcomputations
Rem       sspadafo 05/04/2003 - Change wwv_biu_flow_sessions to call function to set hashed session id
Rem       jkallman 05/06/2003 - Reviewed and replaced with system messages
Rem       jstraub  05/07/2003 - Added population of operator if null in wwv_biu_flow_query_condition
Rem       jkallman 05/08/2003 - Added derivation of flow_id in trigger wwv_biu_flow_lists_of_valuesd
Rem       mhichwa  05/12/2003 - Extended trigger on report columns to maintain flow id, bug 2861658
Rem       jkallman 05/15/2003 - Convert to lowercase the flow_language of wwv_flows
Rem       jstraub  05/29/2003 - Removed triggers on wwv_flow_xml_mapping, wwv_flow_xml_structure and wwv_flow_xml_upload, bug 2972214
Rem       sspadafo 06/29/2003 - Add delete trigger on wwv_flow_items, expand delete trigger on wwv_flow_step_items
Rem                           - for cascade delete to flow_computations and flow_step_computations (Bug 3029349)
Rem       sspadafo 06/30/2003 - Cascade update to flow/page computations when flow or page item name changes (Bug 3029349)
Rem       jstraub  07/24/2003 - Removed trigger on wwv_flow_bugs, bug 3037774
Rem       jkallman 08/01/2003 - Reduce list of wwv_flow_languages (Bug 3029420)
Rem       jkallman 08/04/2003 - Add nls_sort values to wwv_flow_languages (Bug 3032142)
Rem       jstraub  08/04/2003 - Moved trigger that populates trans_flow_lang_code_root of wwv_flow_languages to before insert statements
Rem       jstraub  08/04/2003 - Fixed above, moved populating trans_flow_lang_code_root out of block that detects if import in progress
Rem       sspadafo 08/18/2003 - Create default page alias in wwv_biu_flow_steps (Bug 3039513)
Rem       sspadafo 08/19/2003 - Undo last change to set default page alias in wwv_biu_flow_steps (Bug 3039513)
Rem       jstraub  10/16/2003 - Altered wwv_biu_flow_steps so last_updated_on and by are populated when using create flow wizard (Bug 3185170)
Rem       msewtz   03/29/2004 - replaced company and flow image prefixes with workspace and app prefixes in wwv_flows_biu_image_repo (Bug 3426926)
Rem       mhichwa  04/06/2004 - Changed trigger on page components to update page last updated on and by (bug 3557419)
Rem       jkallman 04/19/2004 - Remove MD5 computation from trigger wwv_biu_flow_coll_members
Rem       mhichwa  04/29/2004 - Add kris.rice calendar table and template triggers bug 360246
Rem       jstraub  05/03/2004 - Added triggers for tables for improved web services feature
Rem       msewtz   05/18/2004 - Updated biu_wwv_flow_hnt_table_info trigger
Rem       msewtz   05/18/2004 - Updated wwv_flow_hnt_column_info trigger
Rem       msewtz   05/18/2004 - Added biu_wwv_flow_hnt_lov_data trigger
Rem       mhichwa  05/24/2004 - Added lock history
Rem       jkallman 05/27/2004 - Remove references to ^FLOW_OWNER
Rem       mhichwa  06/01/2004 - Added on delete row trigger to wwv_flow_lock_page table.  This will log unlock of pages.
Rem       sspadafo 06/06/2004 - Add triggers and indexes for tables wwv_flow_roles, wwv_flow_local_users, wwv_flow_user_roles
Rem       sspadafo 06/07/2004 - Revise triggers and indexes for tables wwv_flow_roles, wwv_flow_local_users, wwv_flow_user_roles
Rem       sspadafo 06/07/2004 - Remove triggers and indexes for tables wwv_flow_roles, wwv_flow_local_users, wwv_flow_user_roles
Rem       jkallman 06/08/2004 - Add sgid to wwv_biu_wwv_flow_mail_queue, add trigger wwv_biu_wwv_flow_mail_log
Rem       jkallman 06/09/2004 - Add en-gb to wwv_flow_languages (Bug 3565884)
Rem       jkallman 06/10/2004 - Rename duplicate object names for triggers (Bug 3256811)
Rem       mhichwa  06/10/2004 - Add trigger on wwv_flow_themes table
Rem       sspadafo 06/10/2004 - Add mistakenly deleted trigger on wwv_flow_fnd_group_users (Bug 3684355)
Rem       skutz    06/15/2004 - Add audit trigger and update (to sync wwv_flows) on wwv_flow_themes table
Rem       jkallman 06/17/2004 - Remove trigger wwv_biu_flowthemes_audit (Bug 3699509)
Rem       sspadafo 06/18/2004 - Add action to trigger for wwv_flow_fnd_user.web_password_raw
Rem       mhichwa  07/08/2004 - Add trigger for wwv_flow_page_groups table
Rem       jkallman 07/14/2004 - Added triggers for tables wwv_flow_online_help and wwv_flow_online_help_ja
Rem       mhichwa  08/06/2004 - Set wwv_flow.g_import_in_progress := true when cascading last updated on to page
Rem       mhichwa  08/06/2004 - Edited trigger on wwv_flow_step_items to cascade to flow to set last updated
Rem       jstraub  08/09/2004 - Changed WWV_DICTIONARY$ to WWV_FLOW_DICTIONARY$
Rem       sspadafo 09/08/2004 - Incorporate wwv_flow_audit.g_cascade into page component triggers to cascade audit columns to application (wwv_flows)
Rem       jkallman 09/27/2004 - Lower message_language for wwv_flow_messages$
Rem       sspadafo 01/14/2005 - Added wwv_flow_biu_qb_saved_qry
Rem       sspadafo 01/17/2005 - Changed wwv_flow_biu_qb_saved_qry for rename of owner column to query_owner
Rem       cbcho    01/27/2005 - Removed triggers wwv_biu_flow_sw_parameters,wwv_biu_flow_sw_stats,wwv_biu_flow_sw_detail_stats,wwv_biu_flow_sw_ctrl_files,wwv_biu_flow_sw_ctrl_file_det,wwv_biu_flow_sw_ctrlfile_stats,wwv_biu_flow_sw_archives
Rem       cbcho    01/27/2005 - Added triggers wwv_biu_flow_sw_binds,wwv_biu_flow_sw_results,wwv_biu_flow_sw_detail_results
Rem       skutz    01/17/2005 - Changed wwv_flow_biu_qb_saved_qry to wwv_flow_bi_qb_saved_qry and modified for insert only
Rem       sspadafo 01/28/2005 - Added index for wwv_flow_biu_qb_saved_qry, triggers for wwv_flow_qb_saved_cond, wwv_flow_qb_saved_join, wwv_flow_qb_saved_tabs
Rem       cbcho    01/31/2005 - Changed wwv_biu_flow_sw_results not to insert run_by
Rem       cbcho    02/18/2005 - Removed wwv_biu_flow_sw_statements
Rem       jkallman 02/21/2005 - Add wwv_biu_flow_sw_stmts from CJones
Rem       sspadafo 02/22/2005 - Set display_type in wwv_bi_flowcals (Kris)
Rem       sspadafo 02/27/2005 - Set checksum_salt_last_reset in wwv_biu_flows
Rem       sspadafo 03/05/2005 - Added triggers on wwv_flow_models, wwv_flow_model_pages, wwv_flow_model_page_cols (msewtz)
Rem       sspadafo 03/17/2005 - Change :new.computation_type := 'SQL_EXPRESSION'; to use standard speling for default value for wwv_biu_computations and wwv_biu_step_computations
Rem       skutz    03/23/2005 - Added trigger wwv_flow_sc_trans_bi
Rem       sspadafo 04/05/2005 - Revised triggers on wwv_flow_models, wwv_flow_model_pages, wwv_flow_model_page_cols (msewtz)
Rem       sspadafo 04/05/2005 - Revised wwv_flow_bi_qb_saved_qry (skutz)
Rem       jkallman 05/12/2005 - Augment list of wwv_flow_languages, add nls_windows_charset values
Rem       jkallman 05/13/2005 - Correct territory for Afrkiaans in wwv_flow_languages
Rem       jkallman 05/16/2005 - Add support for Zulu with nls_windows_charset of AL32UTF8
Rem       sspadafo 06/07/2005 - Remove action from trigger for wwv_flow_fnd_user.web_password_raw (Bug 4023590)
Rem       sspadafo 06/07/2005 - Restore action in trigger for wwv_flow_fnd_user using new wwv_flow_api.g_fnd_user_password_action boolean (Bug 4023590)
Rem       jkallman 06/23/2005 - Altered trigger wwv_flow_bi_qb_saved_qry, updated created_by assignment
Rem       sspadafo 07/06/2005 - Added wwv_flow_restricted_schema_biu, wwv_flow_rschema_exceptions_biu (Bug 4296276)
Rem       sspadafo 07/13/2005 - Set wwv_flows last_updated_on, last_updated_by only if user <> 'SYS' so the columns dont change during an upgrade (Bug 3963331)
Rem       sspadafo 07/13/2005 - Changed triggers on wwv_flow_page_generic_attr and wwv_flow_region_chart_ser_attr to cascade audit trail up to wwv_flow_steps (Bug 4434944)
Rem       sspadafo 11/30/2005 - Change trigger on wwv_flow_sessions$ to compute and insert wwv_flow_security.g_crypto_salt into ip_address column on session creation (Bug 4690231)
Rem       sspadafo 11/30/2005 - Add check for null :old.checksum_salt in wwv_flows trigger when updating
Rem       jkallman 12/03/2005 - Remove triggers associated with runtime distribution
Rem       madelfio 01/23/2006 - Added triggers associated with install wizard (wwv_biu_install_*)
Rem       jkallman 01/26/2006 - Add support of mail_reply in wwv_biu_flow_mail_queue
Rem       jkallman 02/15/2006 - Modify wwv_biu_flow_mail_queue to initialize mail_send_count
Rem       mhichwa  03/07/2006 - Add on delete trigger for wwv_flow_sessions$ to track last_login date by workspace
Rem       mhichwa  04/14/2006 - Add trigger wwv_flow_app_comments_t1
Rem       sspadafo 04/26/2006 - Changed wwv_flow_biu_sessions trigger to use wwv_flow_utilities.db_version_is_at_least function (Bug 4773656)
Rem       sspadafo 04/26/2006 - Changed wwv_flow_biu_sessions trigger to use wwv_flow_security.crypto_randombytes function for pre-10.1.0.3 (Bug 4773656)
Rem       mhichwa  06/12/2006 - Add wwv_flow_page_cache table trigger, wwv_biu_flow_page_cache
Rem       mhichwa  06/12/2006 - Extended wwv_biu_flow_steps trigger to capture new created_on and created_by columns
Rem       msewtz   06/14/2006 - updated wwv_biu_flow_steps to always set created_by and created_on when inserting, even if new.id is not null
Rem       msewtz   06/20/2006 - removed wwv_flow_application_tab and ...tab_set triggers (bug 5231754)
Rem       sspadafo 11/26/2006 - set account_expiry to null on insert in wwv_biu_fnd_user; fixed end statements in several triggers ending in "end wwv_biu_fnd_user"
Rem       cbcho    12/05/2006 - Added triggers for wwv_flow_flash_charts, wwv_flow_flash_chart_series tables
Rem       jkallman 12/07/2006 - Remove unconditional setting of :new.security_group_id in wwv_biu_flows and wwv_biu_flow_collection (Bug 5682340)
Rem       mhichwa  12/12/2006 - Added trigger biu_wwv_flow_prt_templ and biu_wwv_flow_shared_queries
Rem       msewtz   12/13/2006 - Renamed biu_wwv_flow_prt_templ to biu_wwv_flow_report_layouts
Rem       mhichwa  12/19/2006 - Improved wwv_flow_page_cache trigger
Rem       mhichwa  01/03/2007 - Added :new.remote_addr := wwv_flow.g_remote_addr
Rem       jkallman 01/17/2007 - Moved triggers from tab.sql
Rem       cbcho    01/18/2007 - Added to populate flow_id in wwv_flow_flash_chart_series
Rem       jkallman 01/23/2007 - Move insert into wwv_flow_languages to apex_install_data.sql
Rem       cbcho    01/24/2007 - Changed wwv_flow_page_plugs,wwv_flow_flash_charts,wwv_flow_flash_series triggers to trim chr(13) from clob column
Rem       mhichwa  01/25/2007 - changed trigger on cache table to always set sgid
Rem       cbcho    01/30/2007 - Changed wwv_flow_flash_charts trigger to cascade update columns to page and application level
Rem       cbcho    02/01/2007 - Changed wwv_flow_flash_chart_series trigger to cascade update to flash chart, page and application level
Rem       madelfio 02/12/2007 - Added last updated logic for wwv_flow_install and child tables (Bug 5878569)
Rem       sspadafo 02/13/2007 - Remove condition on "cascade update to application" section of wwv_biu_flow_steps (Bug 5876235)
Rem       mhichwa  02/22/2007 - Changed wwv_biu_flow_page_cache trigger to record the applications owner sgid not the curr sgid
Rem       sspadafo 02/23/2007 - Changed wwv_biu_fnd_user for 3.0 password format (Bugs 5613085,5597269)
Rem       madelfio 08/16/2007 - Added triggers for apex worksheet tables
Rem       jstraub  08/23/2007 - Added wwv_flow_worksheet_cat_trig
Rem       jstraub  08/24/2007 - Added display_sequence logic to wwv_flow_worksheet_cat_trig
Rem       madelfio 09/05/2007 - Converted all calls to wwv_flow_worksheet_standard.next_val to wwv_flow_id.next_val
Rem       madelfio 09/07/2007 - Updated trigger on wwv_flow_worksheet_conditions to use new column name "enabled"
Rem       madelfio 09/12/2007 - Updated trigger on wwv_flow_worksheets to set alias column if it is null
Rem       madelfio 09/17/2007 - Added logic for report_list_mode column in wwv_flow_worksheets_trig
Rem       madelfio 09/24/2007 - Updated for wwv_flow_worksheet_rpts flashback columns
Rem       madelfio 10/03/2007 - Added trigger for wwv_flow_worksheet_computation table
Rem       jkallman 10/04/2007 - Added trigger wwv_biu_flow_mail_att on wwv_flow_mail_attachments
Rem       madelfio 10/06/2007 - Added defaults for wwv_flow_worksheets
Rem       madelfio 10/09/2007 - Added repeat_control_break_headers column to wwv_flow_worksheets
Rem       madelfio 10/11/2007 - Updated default display rows for dynamic query regions
Rem       jstraub  10/11/2007 - Added wwv_flow_ws_lov_ents_trig
Rem       jkallman 10/12/2007 - Remove references to worksheet_version_id in wwv_flow_worksheets_trig
Rem       jstraub  10/16/2007 - Added wwv_flow_worksheet_seq and used to populate load_order in wwv_flow_worksheet_row_trig
Rem       mhichwa  10/24/2007 - Added trigger on wwv_flow_application_groups
Rem       madelfio 10/26/2007 - Updated worksheet triggers to populate new not null columns: report_seq and allow_delete
Rem       madelfio 10/30/2007 - Removed repeat_control_break_headers from wwv_flow_worksheets trigger
Rem       madelfio 11/01/2007 - Removed population of worksheet alias
Rem       madelfio 11/05/2007 - Changed distinct_value_filter to rpt_distinct_lov
Rem       msewtz   11/21/2007 - Added biu_wwv_flow_sqry_sql
Rem       jstraub  11/28/2007 - Added defaults for new columns in wwv_flow_worksheet_col_trig and wwv_flow_worksheet_rpts_trig
Rem       madelfio 12/03/2007 - Removed default value for wwv_flow_worksheets.break_on
Rem       cbcho    12/07/2007 - Changed wwv_flow_worksheet_columns trigger to update display_text_as to 'ESCAPE_SC'
Rem       hfarrell 12/10/2007 - Added trigger wwv_flow_model_page_regions on table wwv_flow_model_page_regions
Rem       madelfio 12/10/2007 - Updated worksheet triggers for new columns, cascade changes
Rem       madelfio 12/11/2007 - Fixed error with rpt_distinct_lov always defaulting to 'Y'
Rem       madelfio 12/14/2007 - Added show_control_break to wwv_flow_worksheets
Rem       madelfio 12/18/2007 - New default for wwv_flow_worksheet_columns.rpt_show_filter_lov
Rem       cbcho    01/07/2008 - Changed trigger on wwv_flow_worksheet_columns to set column heading alignment to CENTER
Rem       madelfio 01/09/2008 - Added logic with g_delete_in_progress to avoid mutating table errors
Rem       jstraub  01/18/2008 - Added population of flow_id in wwv_flow_worksheet_cat_trig
Rem       madelfio 03/31/2008 - Updated wwv_flow_worksheet_col_trig to not set column_identifier unless it is null (bug 6875685)
Rem       madelfio 05/28/2008 - Updated triggers for worksheet tags
Rem       jstraub  07/01/2008 - Added websheet and workgroup triggers
Rem       mhichwa  07/23/2008 - Replaced WWV_FLOW_WORKSHEET_ROW_TRIG with a version that maintains row change history
Rem       mhichwa  07/23/2008 - Added triggers for workgroup links, docs, and stickies
Rem       mhichwa  07/23/2008 - Changed names of tables to use proper ws_proj prefix
Rem       cbcho    07/25/2008 - Added to populate change_count in wwv_flow_worksheet_rows (jstraub change)
Rem       mhichwa  07/24/2008 - Added setting of websheet_owner is websheet_attr table trigger
Rem       cbcho    07/25/2008 - Removed *ws_proj_* triggers, added triggers for wwv_flow_ws_links,wwv_flow_ws_notes,wwv_flow_ws_docs
Rem       cbcho    07/28/2008 - Added trigger for wwv_flow_ws_tags
Rem       cbcho    08/04/2008 - Removed trigger for wwv_flow_worksheet_stick,wwv_flow_worksheet_links,wwv_flow_worksheet_docs,wwv_flow_worksheet_tags
Rem       jstraub  08/05/2008 - Removed trigger on wwv_flow_worksheet_privs, table obsoleted
Rem       jstraub  08/06/2008 - Removed security_group_id from triggers on wwv_flow_worksheet_history, lovs, lov_entries, and rows
Rem       cbcho    08/18/2008 - Added to call wwv_flow_ws_api.do_notify when wwv_flow_worksheet_rows get updated
Rem       cbcho    08/18/2008 - Added trigger for wwv_flow_ws_notify and wwv_flow_ws_notify_todo
Rem       mhichwa  08/18/2008 - Maintain created on and by in wwv_biu_flows
Rem       mhichwa  08/28/2008 - for wwv_flows table default debugging - new.application_tab_set := 0 - to no
Rem       cbcho    09/02/2008 - Changed wwv_flow_worksheet_rows trigger to call do_notify when not wwv_flow_ws_api.g_column_change_in_progress
Rem       mhichwa  09/08/2008 - Added dynamic actions trigger
Rem       cbcho    09/16/2008 - Removed wwv_flow_ws_api.do_notify from wwv_flow_worksheet_rows trigger
Rem       cbcho    09/16/2008 - Removed trigger for wwv_flow_ws_notify_todo
Rem       cbcho    09/16/2008 - Changed wwv_flow_worksheet_rows trigger to update parent when not wwv_flow.g_import_in_progress
Rem       cbcho    10/06/2008 - Changed wwv_flow_worksheets and wwv_flow_worksheet_columns trigger to default show_group_by, allow_group_by to 'Y'
Rem       cbcho    10/09/2008 - Changed wwv_flow_worksheet_computation trigger to populate is_group_by_computation, changed wwv_flow_worksheet_rpts trigger to populate is_group_by_report
Rem       cbcho    10/17/2008 - Added wwv_flow_worksheet_group_by trigger
Rem       cbcho    10/17/2008 - Removed is_group_by_computation,is_group_by_report
Rem       sspadafo 01/24/2009 - Created wwv_aiu_fnd_user to insert into wwv_flow_password_history
Rem       sspadafo 01/29/2009 - Fix wwv_biu_fnd_user to save password in wwv_flow_fnd_user_api global
Rem       sbkenned 03/12/2009 - Added biu_wwv_flow_hnt_groups to support new wwv_flow_hnt_groups table
Rem       sbkenned 03/23/2009 - Renamed all triggers to follow new naming scheme, table_name_t1
Rem       pawolf   03/25/2009 - Added tables for APEX Advisor
Rem       pawolf   04/03/2009 - Added triggers for custom item types
Rem       cbcho    04/22/2009 - Removed trigger for wwv_flow_ws_projects
Rem       jkallman 04/24/2009 - Support COM.ORACLE.APEX.APPLICATIONS with SGID=20 for wwv_flow_companies
Rem       pawolf   04/28/2009 - Renamed custom item type tables to wwv_flow_plugins
Rem       pawolf   05/05/2009 - Added wwv_flow_standard_item_types
Rem       pawolf   05/06/2009 - Added wwv_flow_plugin_files
Rem       jkallman 05/15/2009 - Properly set created_by and created_on in trigger wwv_flow_language_map_t1
Rem       jkallman 05/19/2009 - Revise wwv_flow_sessions_t2 to delete from wwv_flow_debug and wwv_flow_worksheet_rpts (Bug 8530955)
Rem       hfarrell 05/20/2009 - Added triggers for AnyChart 5 tables: wwv_flow_flash_charts_5, wwv_flow_flash_charts_5_dash, wwv_flow_flash_chart5_series
Rem       hfarrell 05/20/2009 - Updated trigger wwv_flow_flash_5_dash_t1 to change table updated with last_updated_on and last_updated_by information
Rem       hfarrell 05/20/2009 - Updated trigger wwv_flow_flash_5_dash_t1 to remove update of wwv_flow_steps table
Rem       cbcho    05/28/2009 - Removed trigger for wwv_flow_worksheet_rows,wwv_flow_ws_notes,wwv_flow_ws_links,wwv_flow_ws_tags,wwv_flow_ws_files,wwv_flow_ws_notify
Rem       cbcho    05/28/2009 - Changed trigger on wwv_flow_worksheet_lovs,wwv_flow_worksheet_lov_entries,wwv_flow_ws_col_validations,wwv_flow_ws_row_security to populate security_group_id
Rem       cbcho    05/28/2009 - Added trigger for wwv_flow_worksheet_notify
Rem       arayner  06/05/2009 - Added triggers for 3 new dynamic action tables
Rem       pawolf   06/15/2009 - Always set createed_on when a plugin file is created
Rem       arayner  06/24/2009 - Added trigger for wwv_flow_standard_dyn_act_opp table
Rem       cbcho    07/10/2009 - Changed wwv_flow_worksheet trigger to pre-populate show_notify
Rem       cbcho    07/15/2009 - Changed wwv_flow_worksheet_columns trigger to pre-populate allow_highlighting
Rem       pawolf   07/27/2009 - Added trigger for wwv_flow_plugin_events
Rem       mhichwa  07/31/2009 - Improved trigger wwv_flow_translatable_text_t1 by adding created on and created by columns
Rem       mhichwa  07/31/2009 - Added trigger for table  wwv_flow_workspace_summary
Rem       mhichwa  07/31/2009 - Added wwv_flow_developer_log
Rem       mhichwa  08/21/2009 - Added support for wwv_flow_news
Rem       mhichwa  08/24/2009 - Added wwv_flow_tasks
Rem       jkallman 08/24/2009 - Modified trigger wwv_flow_sessions_t1 to trim session_time_zone
Rem       mhichwa  08/24/2009 - Modified trigger on wwv_flow_tasks
Rem       mhichwa  08/25/2009 - Added events, improved tasks
Rem       mhichwa  08/26/2009 - added features
Rem       mhichwa  08/27/2009 - added support for bugs
Rem       mhichwa  08/27/2009 - added support for feedback
Rem       cbcho    09/01/2009 - Added trigger for table wwv_flow_ws_webpages
Rem       mhichwa  09/01/2009 - added table wwv_flow_feature_progress trigger
Rem       mhichwa  09/02/2009 - Added trigger on feature history table
Rem       cbcho    09/03/2009 - Added trigger on wwv_flow_ws_applications
Rem       mhichwa  09/03/2009 - Log event id in wwv_flow_features_t1
Rem       cbcho    09/03/2009 - Changed trigger on wwv_flow_ws_applications to populate status
Rem       arayner  09/04/2009 - Changed last updated logic in wwv_flow_page_da_actions_t1 trigger
Rem       cbcho    09/04/2009 - Changed wwv_flow_ws_applications to populate status to 'AVAILABLE' if null
Rem       mhichwa  09/04/2009 - improved features trigger
Rem       mhichwa  09/08/2009 - added support for justification column
Rem       mhichwa  09/08/2009 - added wwv_flow_teamdev_tag_cloud
Rem       cbcho    09/10/2009 - Changed trigger on wwv_flow_ws_webpages,wwv_flow_ws_websheet_attr to cascade update to wwv_flow_ws_applications
Rem       mhichwa  09/11/2009 - added support for tags
Rem       mhichwa  09/14/2009 - reworked tag management, added tag support for todo, link, and bug
Rem       pawolf   09/16/2009 - Avoided cascading update for wwv_flow_step_items and wwv_flow_step_buttons
Rem       mhichwa  09/17/2009 - added status columns, removed qa columns, added effort and module to features
Rem       jstraub  09/21/2009 - Moved team development triggers to team_tab.sql
Rem       arayner  09/22/2009 - Added wwv_flow_da_stnd_events_t1
Rem       pawolf   09/24/2009 - Added trigger for wwv_flow_plugin_attr_values
Rem       jstraub  11/02/2009 - Removed trigger wwv_flow_dictionary_t1
Rem       cbcho    11/05/2009 - Changed wwv_flow_worksheet_rtps to populate report_alias for base reports
Rem       cbcho    11/06/2009 - Changed wwv_flow_worksheet_rtps to null out report_alias if it is notification or websheet data section
Rem       mhichwa  11/11/2009 - added trigger for wwv_flow_validations
Rem       cbcho    11/12/2009 - Changed wwv_flow_worksheet_rpts trigger to set status to PUBLIC if it is default report and status was set to PRIVATE
Rem       pawolf   11/16/2009 - Fixed installation error in Oracle XE
Rem       cbcho    11/18/2009 - Changed wwv_flow_worksheets trigger to populate allow_save_rpt_public
Rem       arayner  11/20/2009 - Added default_irr_template column in relevant updates to wwv_flows
Rem       cbcho    11/25/2009 - Changed wwv_flow_worksheet_columns trigger to populate allow_hide
Rem       jstraub  12/03/2009 - Added trigger wwv_flow_feedback_t1
Rem       arayner  12/11/2009 - Dropped trigger wwv_flow_da_stnd_actions_t1, no longer needed
Rem       arayner  12/11/2009 - Dropped trigger wwv_flow_da_stnd_act_opp_t1, no longer needed
Rem       sbkenned 12/15/2009 - Added wwv_flow_hnt_column_dict & wwv_flow_hnt_col_dict_syn to support new UI Defaults Attribute Dictionary
Rem       mhichwa  12/28/2009 - improved trigger for wwv_flow_feedback, capture feedback_id which is a number incremented by workspace
Rem       mhichwa  12/29/2009 - changed logic in create trigger for wwv_flow_feedback
Rem       mhichwa  12/30/2009 - added wwv_flow_feedback_fup_t1 trigger
Rem       sbkenned 01/15/2010 - updated wwv_flow_hnt_col_dict_syn_t1 and wwv_flow_hnt_column_dict_t1 to allow for import
Rem       sspadafo 01/20/2010 - Added trigger wwv_flow_ws_auth_setups_t1
Rem       hfarrell 01/21/2010 - Added trigger wwv_flow_treeregion_t1 for wwv_flow_tree_regions table
Rem       cbcho    01/21/2010 - Changed wwv_flow_worksheets trigger to populate SHOW_ROWS_PER_PAGE
Rem       cbcho    01/22/2010 - Changed wwv_flow_worksheet_notify trigger to populate owner
Rem       jkallman 02/04/2010 - Add upper_name to wwv_flow_ws_webpages_t1
Rem       jkallman 02/05/2010 - Remove all workgroup related DDL
Rem       jkallman 02/08/2010 - Removed triggers wwv_flow_folders_t1, wwv_flow_web_pages_t1, wwv_flow_web_pg_regions_t1, wwv_flow_web_pg_list_entries_t1
Rem       cbcho    02/08/2010 - Changed wwv_flow_ws_websheeet_attr, wwv_flow_ws_webpages to populate alias
Rem       cbcho    02/08/2010 - Changed wwv_flow_ws_websheeet_attr, wwv_flow_ws_webpages alias to upper
Rem       jkallman 02/11/2010 - Replace all occurrences of apex_application.g_user with wwv_flow.g_user
Rem       pawolf   02/23/2010 - Modified wwv_flow_feedback to use timestamps
Rem       sspadafo 03/05/2010 - Changed on delete triggers on flow_items and flow_step_items to not delete corresponding computations during component import (wwv_flow_api.g_mode = 'REPLACE') (Bug 8466092)
Rem       jkallman 03/10/2010 - Set allow_public_access_yn in trigger wwv_flow_ws_applications_t1
Rem       jkallman 03/11/2010 - Set allow_to_be_purged_yn in trigger wwv_flow_companies_t1
Rem       mhichwa  03/15/2010 - added trigger wwv_flow_ws_app_wl_t1
Rem       cbcho    03/16/2010 - added trigger wwv_flow_ws_app_wl_t2, changed wwv_flow_ws_app_wl_t1 to update app_whitelist_last_changed for any update
Rem       cbcho    03/16/2010 - added trigger for wwv_flow_ws_sql_val_cache table
Rem       cbcho    03/17/2010 - Changed wwv_flow_ws_app_whitelist trigger to upper object and schema name
Rem       jkallman 03/18/2010 - Add check for plug_query_parse_override in trigger wwv_flow_page_plugs_t1
Rem       cbcho    03/19/2010 - Changed wwv_flow_worksheets trigger to disable show_notify, allow_save_rpt_public by default
Rem       jkallman 03/23/2010 - Removed optional named schema from wwv_flow_ws_app_wl_t1
Rem       cbcho    03/24/2010 - Removed trigger to update update app_whitelist_last_changed, removed wwv_flow_ws_sql_val_cache table trigger
Rem       sbkenned 03/24/2010 - Added trigger for wwv_flow_ws_app_sug_objects (will be replacing wwv_flow_ws_app_whitelist)
Rem       sbkenned 03/30/2010 - Removed trigger for wwv_flow_ws_app_whitelist (table being dropped)
Rem       sbkenned 03/31/2010 - Added after delete trigger on team_feedback
Rem       jkallman 03/31/2010 - Removed db_version dependent code from wwv_flow_sessions_t1
Rem       pawolf   04/01/2010 - Fixed mutating trigger problem in wwv_flow_step_buttons
Rem       jkallman 04/05/2010 - Added triggers for purge tables
Rem       cbcho    04/06/2010 - Changed Websheet table trigger to cascade update the parent if not wwv_flow.g_import_in_progress
Rem       jkallman 05/13/2010 - Added trigger wwv_flow_authorized_urls_t1 (Bug 9708920)
Rem       pawolf   05/18/2010 - Bug# 9602440: Added caching of JavaScript and CSS code
Rem       jkallman 05/18/2010 - Added trigger wwv_flow_companies_t2 and wwv_flow_companies_t3, modified trigger wwv_flow_feedback_t2 (Bug 9652683)
Rem       jstraub  10/12/2010 - Changed wwv_flow_feedback_t1 to reference wwv_flow_utilities.wwv_flow_team_tag_sync instead of wwv_flow_team (bug 10104409)
Rem       mhichwa  12/27/2010 - added triggers for database services
Rem       mhichwa  01/10/2011 - added trigger biu_wwv_flow_rt$ws_prefs
Rem       cneumuel 02/02/2011 - Added plugin support for authorization (feature 580)
Rem       pawolf   02/08/2011 - Added multibyte support for page items (feature 224)
Rem       cneumuel 02/11/2011 - Moved index on wwv_flow_developers to tab.sql (feature 580)
Rem       pawolf   02/08/2011 - Changed trigger wwv_flows_t1 to set webdb_log based on platform preference APPLICATION_ACTIVITY_LOGGING (feature 617)
Rem       cbcho    02/24/2011 - Changed wwv_flow_worksheet_rpts trigger to clean out invalid chart_aggregate value of '0' (bug 10399772)
Rem       jkallman 03/31/2011 - Modify wwv_flow_companies_t1 to set display_name to short_name if display_name is null
Rem       pawolf   04/08/2011 - Added "Substitute Attribute Values" (substitute_attributes) to plug-ins (feature 655)
Rem       jkallman 04/11/2011 - Modify wwv_flow_dynamic_trans_t1 to populate missing audit columns
Rem       jkallman 04/12/2011 - Modify wwv_flow_companies_t1 to trim workspace name, wwv_flow_fnd_user_t1 to trim user_name (Bug 12346303)
Rem       jkallman 04/12/2011 - Removed trigger on obsolete table wwv_flow_platform_pref
Rem       jkallman 04/12/2011 - Removed triggers on wwv_flow_rt$_ tables (contained in db_webservices_tab.sql)
Rem       pmanirah 04/19/2011 - Added triggers for data loading (feature 545)
Rem       cneumuel 04/21/2011 - Moved crypto functions from wwv_flow_security to wwv_flow_crypto
Rem       jkallman 04/28/2011 - Added trigger wwv_flow_file_purge_log_t1
Rem       jkallman 05/02/2011 - Changed trigger to wwv_flow_auto_file_del_log_t1
Rem       jkallman 05/11/2011 - Removed trigger wwv_flow_db_auth_t1
Rem       cbcho    05/13/2011 - Changed wwv_flow_ws_applications trigger to set show_reset_passwd_yn to Y if null (feaure 620)
Rem       jkallman 05/13/2011 - Set account_status, created_on, assigned_on in wwv_flow_companies_t1
Rem       cneumuel 05/16/2011 - Added wwv_flow_authentications_t1 (feature 581)
Rem       cbcho    05/20/2011 - Added trigger for wwv_flow_ws_data_grid_q (feaure 611)
Rem       jstraub  05/24/2011 - Removed references to wwv_flow_compound_conditions
Rem       pmanirah 06/03/2011 - Changed triggers wwv_flow_loadtab_rules_t1 and wwv_flow_loadtab_lookups_t1
Rem       cneumuel 06/06/2011 - Remved wwv_flow_custom_auth_setups_t1 (feature 581)
Rem       hfarrell 06/16/2011 - Added insert statement to wwv_flow_company_schemas table for SGID 11 (feature #661 - specifically Websheets component)
Rem       jkallman 06/19/2011 - Provide default value for browser_cache in wwv_flows_t1 and wwv_flow_steps_t1
Rem       cneumuel 06/20/2011 - Removed default values for browser_cache in wwv_flows_t1 and wwv_flow_steps_t1
Rem       arayner  08/01/2011 - Rewrote logic in trigger wwv_flow_step_buttons_t1 (Bug 12819688)
Rem       jkallman 08/02/2011 - Added space after table name in creation of index wwv_flow_template_prefe_fkidx (Bug 11061801)
Rem       cneumuel 10/27/2011 - In wwv_flow_companies_t1: always convert group_name to uppercase (bug #13101596)
Rem       cneumuel 11/09/2011 - In wwv_flow_companies_t1: renamed group_name to cloud_group_name, convert cloud_service_name to uppercase
Rem       jstraub  12/01/2011 - Removed trigger wwv_flow_purged_sessions_t1 (bug 13452726)
Rem       cneumuel 01/04/2012 - In wwv_flow_companies_t1. upper(host_prefix) (bug 13101596)
Rem       pawolf   01/10/2012 - Changed wwv_flow_collection_t1 to append instance_no to id (bug# 13562656)
Rem       pawolf   02/29/2012 - Added HTML5 date picker (feature# 840)
Rem       pawolf   03/07/2012 - Added new table wwv_flow_theme_styles (feature# 821)
Rem       pawolf   03/08/2012 - Added data model changes for UI type feature (feature# 827)
Rem       pawolf   03/19/2012 - Changed code to only use new columns in wwv_flow_user_interfaces instead of the old columns in wwv_flow (feature# 827)
Rem       pawolf   03/30/2012 - Added new table wwv_flow_plugin_settings (feature# 895)
Rem       jkallman 04/02/2012 - Removed obsolete triggers wwv_flow_alternate_config_t1, wwv_flow_alt_config_detail_t1, wwv_flow_standard_css_t1 and wwv_flow_standard_js_t1
Rem       vuvarov  04/05/2012 - Remove session state in wwv_flow_step_items_t1 in case of item name change (bug #13926762)
Rem       cneumuel 04/12/2012 - In wwv_flow_step_items_t1: replace delete with call to wwv_flow_session_state.clear_all_state_for_id
Rem       cneumuel 04/12/2012 - In wwv_flow_sessions_t2: remove obsolete table wwv_flow_debug
Rem       cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem       vuvarov  05/01/2012 - Update updated_on/by for LOV definition when LOV static values are updated
Rem       pawolf   05/14/2012 - Added grid templates (feature #936)
Rem       cneumuel 05/16/2012 - Added wwv_flow_ws_app_and_auth_trg (feature #808)
Rem       pawolf   05/21/2012 - Added wwv_flow_theme_display_points (feature #936)
Rem       pawolf   05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
Rem       cneumuel 05/29/2012 - In wwv_flow_collection_t1: prepend instance id instead of appending it (feature #940)
Rem       pawolf   06/01/2012 - Removed defaulting of colspan and rowspan
Rem       cbcho    06/04/2012 - Changed wwv_flow_worksheets trigger to populate internal_uid with :new.id when inserting (feature #268)
Rem       cneumuel 06/14/2012 - in wwv_flow_sessions_t1: use wwv_flow_cgi.get_remote_addr instead of wwv_flow.g_remote_addr
Rem       pawolf   06/15/2012 - Added table wwv_flow_plug_tmpl_disp_points (feature #936)
Rem       cneumuel 06/15/2012 - In wwv_flow_sessions_t1: use wwv_flow_security.get_client_ip_address, wwv_flow_session.generate_unique_hashed_id
Rem       pawolf   06/22/2012 - Added wwv_flow_steps_t2 to clear global page id
Rem       pawolf   06/26/2012 - Removed wwv_flow_steps_t2 and put the logic into wwv_flow_user_interfaces_t1
Rem       pawolf   06/26/2012 - Added table wwv_flow_page_tmpl_disp_points (feature #936)
Rem       pawolf   07/04/2012 - Added Builder Feature configuration tables (feature #827)
Rem       hfarrell 07/16/2012 - Modify wwv_flow_companies_t1 to set path_prefix to short_name (feature #863) - will need to revisit to tighten list of allowed characters in path_prefix
Rem       hfarrell 07/18/2012 - Updated wwv_flow_companies_t1 to restrict allowed characters in path_prefix and also handle collisions (feature #863)
Rem       hfarrell 07/18/2012 - Updated wwv_flow_companies_t1 to handle setting of path_prefix for both insert and update
Rem       hfarrell 07/30/2012 - Updated wwv_flows_t1 to modify setting of application alias and remove duplicate logic for setting of alias (bug #14361218)
Rem       jkallman 08/03/2012 - Trim default_date_format in wwv_flow_fnd_user_t1
Rem       cneumuel 08/22/2012 - In wwv_flows_t1: reset owner back to first workspace schema if it is not a workspace schema (bug #14525335)
Rem                           - In wwv_flow_ws_applications_t1: reset owner back to workspace's websheet schema if it is not a workspace schema (bug #14525335)
Rem       arayner  08/24/2012 - In wwv_flow_user_interface_t1 added logic to prevent updating global_page_id to null, in the case where an import is taking place (bug #14532258)
Rem       hfarrell 11/08/2012 - Removed trigger wwv_flow_flash_5_dash_t1 for removed table wwv_flow_flash_5_dash (bug #15830211)
Rem       pawolf   12/12/2012 - Reset wwv_flows.flow_image_prefix to null if it's equal to the instance setting (bug #15969515)
Rem       jkallman 02/01/2013 - Always set SGID to 10 for wwv_flow_platform_prefs (Bug 16270085)
Rem       jstraub  02/08/2013 - Modified wwv_flow_sw_sql_cmds_t1 to not set created_ columns if not wwv_flow.g_import_in_progress
Rem       pawolf   04/09/2013 - Moved wwv_flow_biw_appbldpref from tab.sql to trigger.sql and moved create index statements to tab.sql
Rem       pawolf   04/09/2013 - Added files_version to wwv_flow_plugins
Rem       pawolf   04/11/2013 - Added new table wwv_flow_theme_files and new column files_version to wwv_flow_themes (feature #1162)
Rem       pawolf   04/12/2013 - Fixed security_group_id assignment in wwv_flow_plugin_files_t1 and wwv_flow_theme_files_t1
Rem       pawolf   04/16/2013 - Added files_version to wwv_flow_companies and wwv_flow_files (feature #1165)
Rem       cneumuel 04/17/2013 - In wwv_flows_t1, wwv_flow_steps_t1: do not update wwv_flows.updated_by if g_import_in_progress (feature #985)
Rem       pawolf   04/18/2013 - Added wwv_flow_company_static_files and wwv_flow_static_files (feature #1169)
Rem       pawolf   04/23/2013 - Removed wwv_flow_image/css/html_repository tables (feature #1169)
Rem       cneumuel 06/17/2013 - Removed wwv_flow_sessions_t1, code is now centralized in wwv_flow_session.create_new (feature #1149)
Rem       cneumuel 07/01/2013 - In wwv_flow_sessions_t2: delete RAS session (feature #1152)
Rem       cneumuel 07/04/2013 - Moved create index statements to tab.sql
Rem       cneumuel 07/05/2013 - Moved wwv_flow_ws_app_and_auth_trg instead of trigger from trigger.sql to view.sql
Rem       pawolf   08/20/2013 - Changed constraint of wwv_flow_step_items.begin_on_new_line and begin_on_new_field to Y and N
Rem       cneumuel 08/29/2013 - In wwv_flow_companies_t1: avoid character ranges in regexp (bug #17375236)
Rem       cbcho    09/13/2013 - Added wwv_flow_worksheet_pivot and its detail table trigger (feature #536)
Rem       jstraub  10/09/2013 - Added inserting wwv_flow.g_flow_schema_owner into wwv_flow_company_schemas for SGID 12
Rem       cbcho    10/11/2013 - Changed wwv_flow_worksheets and wwv_flow_worksheet_columns trigger to default show_pivot, allow_pivot to 'Y' (feature #536)
Rem       cneumuel 10/15/2013 - dropped wwv_flow_fnd_function, wwv_flow_fnd_global, wwv_flow_fnd_user_t2
Rem                           - in wwv_flow_fnd_user_t1: added password history logic from wwv_flow_fnd_user_t2
Rem                           - in wwv_flow_fnd_user_t1: use wwv_flow_security.hash_password instead of duplicated password hashing logic
Rem       cneumuel 10/18/2013 - in wwv_flow_fnd_user_t1: hash_password has been moved from wwv_flow_security to wwv_flow_crypto
Rem       cneumuel 10/22/2013 - In wwv_flow_fnd_user_t1: default PASSWORD_HASH_FUNCTION to wwv_flow_crypto.c_hash_best
Rem       jstraub  10/21/2012 - in wwv_flows_t1, changed SGID 11 reference to 12
Rem       cneumuel 10/24/2013 - replace dbms_obfuscation_toolkit with wwv_flow_crypto
Rem       cneumuel 11/08/2013 - In wwv_flow_collection_t1, wwv_flow_collection_members_t1: use wwv_flow_collection_int.get_security_group_id (bug #17623103)
Rem       cneumuel 12/16/2013 - html and plsql region migration to native plugins (feature #1312)
Rem       jkallman 01/08/2014 - Added trigger wwv_flow_language_map_t2, to cleanup orphaned entries in wwv_flows_reserved
Rem       pawolf   01/14/2014 - Added wwv_flow_combined_files (feature #1340)
Rem       pawolf   01/16/2014 - Always set BODY as display point for sub regions (bug #17493903)
Rem       cneumuel 02/10/2014 - Changed NATIVE_HTML region to NATIVE_STATIC
Rem       jkallman 03/11/2014 - Removed trigger on wwv_flow_developer_log
Rem       msewtz   03/11/2014 - Added wwv_flow_theme_css_classes (feature 1289)
Rem       msewtz   03/13/2014 - Replaced trigger on wwv_flow_theme_css_classes with trigger on wwv_flow_template_options (feature 1394)
Rem       pawolf   03/17/2014 - Added support for region columns (feature #1393)
Rem       jstraub  03/24/2014 - Added wwv_flow_install_objects_t1
Rem       hfarrell 04/08/2014 - Added setting of bookmark_checksum_function in wwv_flows_t1
Rem       cneumuel 04/15/2014 - In wwv_flow_page_cache_t1: simplified page cache data model (feature #1401)
Rem                           - Use replace() instead of wwv_flow_page_cache_api.lob_replace
Rem       msewtz   04/23/2014 - Added wwv_flow_template_opt_grp_t1  (feature 1394)
Rem       msewtz   05/01/2014 - Removed update of wwv_flow_themes in template option and option group tables
Rem       cneumuel 05/20/2014 - In wwv_flow_sessions_t2: remove temp files, made trigger AFTER delete instead of BEFORE (bug #15844363)
Rem       jkallman 06/04/2014 - Modify triggers on wwv_flow_mail_queue to populate created column, change semantics of
Rem                             last_updated_by on wwv_flow_mail_queue, only populate upon insert
Rem       cneumuel 06/10/2014 - triggers to check workspace file limits: wwv_flow_comp_stat_files_t2, wwv_flow_themes_t2, wwv_flow_static_files_t2, wwv_flow_mail_attachments_t2, wwv_flow_collection_members_t1, wwv_flow_plugin_files_t2 (feature #1198)
Rem       cneumuel 06/11/2014 - removed workspace file limits check for wwv_flow_collection_members$ and wwv_flow_mail_attachments (feature #1198)
Rem       cneumuel 06/25/2014 - In wwv_flow_companies_t1: sanitize path_prefix on insert/update (bug #19050885)
Rem       cbcho    07/09/2014 - Changed wwv_flow_worksheet_rpts trigger to increase display_rows from 15 to 50
Rem       cbcho    07/18/2014 - Added trigger for wwv_flow_lock_script and wwv_flow_lock_script_log tables (feature #1449)
Rem       vuvarov  09/04/2014 - Populate created_on/created_by in wwv_flow_web_services_t1
Rem       pawolf   09/12/2014 - Fixed wwv_flow_themes_t2 to only fire if THEME_IMAGE has been changed
Rem       cneumuel 09/30/2014 - Removed wwv_flow_collection_members_t1: wwv_flow_collection package sets all values
Rem       hfarrell 10/08/2014 - In wwv_flows_t1: update wwv_flows.updated_by, updated_on, created_on, created_by if g_import_in_progress - requested by DPeake
Rem       cneumuel 10/10/2014 - In wwv_flow_sessions_t2: use wwv_flow_session_ras.destroy_session for deleting the RAS session
Rem       cneumuel 11/06/2014 - In wwv_flow_platform_prefs_t1: set created_on, last_updated_on (feature #1153)
Rem       pawolf   12/08/2014 - Added wwv_flows.shared_components_scn and wwv_flow_steps.page_components_scn (feature #1623 and #1624)
Rem       cneumuel 12/12/2014 - In wwv_flow_platform_prefs_t1: always set last_updated_on unless it is set during insert (feature #1153)
Rem       arayner  12/16/2014 - In wwv_flow_page_da_events_t1, populate triggering_condition_type (bug #9733317)
Rem       pawolf   12/18/2014 - Modified triggers to also set wwv_flows.shared_components_scn and wwv_flow_steps.page_components_scn for deletes (feature #1623 and #1624)
Rem       jstraub  01/09/2015 - Removed wwv_flow_query_definition_t1, wwv_flow_query_object_t1, wwv_flow_query_column_t1, wwv_flow_query_condition_t1
Rem       cneumuel 01/16/2015 - In wwv_flow_step_items_t1: do not clear session state on import/upgrade
Rem       cneumuel 01/23/2015 - In wwv_flows_t1: use wwv_flow_platform.g_checksum_hash_function (bug #20384628)
Rem       cneumuel 01/27/2015 - In wwv_flow_authorized_urls_t1: use sh1 for hashing instead of md5 (bug #20384628)
Rem       cneumuel 02/04/2015 - In wwv_flow_fnd_user_t1: added password version (bug #20462973)
Rem       cneumuel 02/09/2015 - In wwv_flow_fnd_user_t1:  removed web_password_hash_function, it is encoded in web_password_version (bug #20462973)
Rem       pawolf   02/10/2015 - In wwv_flow_ws_rpts_t1: updated IR audit columns if a primary or alternative reports is getting added/changed (bug #20508641)
Rem       pawolf   02/24/2015 - In wwv_flow_lock_page_t1: added update of wwv_flow_steps.page_components_scn, merged wwv_flow_lock_page_t2 into trigger (bug #20504626) 
Rem       arayner  03/11/2015 - In wwv_flow_messages_t1: added logic to synchronise client-side flag for messages defined in 4411 with client-side flag set to 'Y' (bug #20529571)
Rem       arayner  03/11/2015 - In wwv_flow_messages_t1: removed unrequired l_client_side_count variable, added with previous commit (bug #20529571)
Rem       hfarrell 07/24/2015 - In wwv_flow_step_items_t1: repositioned setting of :new.security_group_id before query setting :new.lov (bug #21488152)
Rem       pawolf   08/12/2015 - In wwv_flows_t1: changed wwv_flow.g_image_prefix to wwv_flow_global.g_image_prefix (bug #21618837)
Rem       cneumuel 11/13/2015 - In wwv_flow_worksheet_notify_t1: do not cascade up if g_notify_in_progress (bug #22202236)

prompt ...trigger wwv_flow_platform_prefs_t1

create or replace trigger wwv_flow_platform_prefs_t1
    before insert or update on wwv_flow_platform_prefs
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.created_on is null then
            :new.created_on := sysdate;
        end if;
    end if;
    :new.security_group_id := 10;
    if updating or :new.last_updated_on is null then
        :new.last_updated_on := sysdate;
    end if;
end;
/

prompt ...trigger wwv_flow_biw_appbldpref

create or replace trigger wwv_flow_biw_appbldpref
before insert or update on  wwv_flow_app_build_pref
for each row
begin
  if inserting and :new.id is null then
     :new.id := wwv_flow_id.next_val;
  end if;
  if inserting then
     :new.created_on := sysdate;
     :new.created_by := v('USER');
  end if;
  if updating then
     :new.updated_on := sysdate;
     :new.updated_by := v('USER');
  end if;
  if :new.security_group_id is null then
     :new.security_group_id := wwv_flow_security.g_security_group_id;
  end if;
end;
/


prompt ...trigger wwv_flow_companies_t1

create or replace trigger wwv_flow_companies_t1
    before insert or update on wwv_flow_companies
    for each row
declare
begin
    if :new.provisioning_company_id = 20 and :new.short_name not in ('ORACLE','COM.ORACLE.APEX.APPLICATIONS') then
        raise_application_error(-20001,wwv_flow_lang.system_message('TRIGGER.SGID_RESERVED'));
    end if;
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.allow_to_be_purged_yn is null then
        :new.allow_to_be_purged_yn := 'Y';
    end if;
    :new.short_name := trim(upper(:new.short_name));
    if :new.display_name is null then
        :new.display_name := :new.short_name;
    end if;
    if inserting then
        :new.created_on := sysdate;
        if :new.account_status is null then
            :new.account_status := 'AVAILABLE';
        elsif :new.account_status = 'ASSIGNED' then
            :new.assigned_on := sysdate;
        end if;
    elsif updating then
        if :new.account_status = 'ASSIGNED' and nvl(:old.account_status,'AVAILABLE') = 'AVAILABLE' then
            :new.assigned_on := sysdate;
        end if;
    end if;
    :new.cloud_group_name   := upper(:new.cloud_group_name);
    :new.cloud_service_name := upper(:new.cloud_service_name);
    :new.host_prefix        := upper(:new.host_prefix);
    if :new.path_prefix is null then
        :new.path_prefix := wwv_flow_security.get_sanitized_path_prefix (
                                p_security_group_id => :new.provisioning_company_id,
                                p_path_prefix       => :new.short_name );
    elsif inserting
          or :old.path_prefix is null
          or :old.path_prefix <> :new.path_prefix
    then
        :new.path_prefix := wwv_flow_security.get_sanitized_path_prefix (
                                p_security_group_id => :new.provisioning_company_id,
                                p_path_prefix       => :new.path_prefix );
    end if;
end;
/

create or replace trigger wwv_flow_companies_t2
    before delete on wwv_flow_companies
    for each row
begin
    wwv_flow.g_workspace_delete_in_progress := true;
end;
/

create or replace trigger wwv_flow_companies_t3
    after delete on wwv_flow_companies
    for each row
begin
    wwv_flow.g_workspace_delete_in_progress := false;
end;
/


prompt ...trigger wwv_flow_company_schemas_t1

create or replace trigger wwv_flow_company_schemas_t1
    before insert or update on wwv_flow_company_schemas
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.schema := upper(:new.schema);
end;
/


--
-- create company schema mappings
--

prompt ...set sgid = 10


begin
   wwv_flow_security.g_security_group_id := 10;
end;
/

begin
    insert into wwv_flow_company_schemas (security_group_id,schema) values (10,wwv_flow.g_flow_schema_owner);
commit;
end;
/

begin
    insert into wwv_flow_company_schemas (security_group_id,schema) values (11,wwv_flow.g_flow_schema_owner);
commit;
end;
/

begin
    insert into wwv_flow_company_schemas (security_group_id,schema) values (12,wwv_flow.g_flow_schema_owner);
commit;
end;
/

prompt ...trigger wwv_flow_comp_stat_files_t1

create or replace trigger wwv_flow_comp_stat_files_t1
    before insert or update on wwv_flow_company_static_files
    for each row
declare
    l_files_version_increment number;
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- audit
    -- Note: always set change attributes so that the caching of files works
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;
    --
    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
    --
    if not wwv_flow.g_import_in_progress then

        if deleting then
            l_files_version_increment := 0;
        else
            l_files_version_increment := 1;
        end if;

        update wwv_flow_companies
           set files_version = files_version + l_files_version_increment
         where provisioning_company_id = :new.security_group_id;
    end if;
end;
/

prompt ...trigger wwv_flow_comp_stat_files_t2
create or replace trigger wwv_flow_comp_stat_files_t2
    after insert or update on wwv_flow_company_static_files
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/

prompt ...trigger wwv_flow_ui_types_t1

create or replace trigger wwv_flow_ui_types_t1
    before insert or update on wwv_flow_ui_types
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/


prompt ...trigger wwv_flow_ui_type_features_t1

create or replace trigger wwv_flow_ui_type_features_t1
    before insert or update on wwv_flow_ui_type_features
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/


--==============================================================================
prompt ...trigger wwv_flows_t1

create or replace trigger wwv_flows_t1
    before insert or update on wwv_flows
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    :new.webdb_logging := case nvl(wwv_flow_platform.get_preference('APPLICATION_ACTIVITY_LOGGING'), 'U') /* U=Use Application Settings */
                            when 'A' /* Always */ then 'YES'
                            when 'N' /* Never  */ then 'NO'
                            else                       nvl(:new.webdb_logging, 'YES')
                          end;

    if nvl(wwv_flow_platform.get_preference('APPLICATION_ACTIVITY_LOGGING'), 'U') = 'O' /* O=Off for New and Packaged Applications */
       and wwv_flow_security.g_security_group_id = 12 and (:new.id between 7000 and 8000 or :new.id = 8950) then
        --
        :new.webdb_logging := 'NO';
    end if;

    -- Cleanup the application image prefix if it's equal to the instance image prefix or the /i/ default
    -- This will allow easier migration of applications between APEX instances which have different image prefixes (bug #15969515)
    if :new.flow_image_prefix in ( '/i/', wwv_flow_global.g_image_prefix ) then
        :new.flow_image_prefix := null;
    end if;

    -- default debugging to no
    if inserting and :new.application_tab_set is null then
        :new.application_tab_set := 0; -- sets debugging off
    end if;
    :new.flow_language          := lower(:new.flow_language);
    :new.substitution_string_01 := upper(:new.substitution_string_01);
    :new.substitution_string_02 := upper(:new.substitution_string_02);
    :new.substitution_string_03 := upper(:new.substitution_string_03);
    :new.substitution_string_04 := upper(:new.substitution_string_04);
    :new.substitution_string_05 := upper(:new.substitution_string_05);
    :new.substitution_string_06 := upper(:new.substitution_string_06);
    :new.substitution_string_07 := upper(:new.substitution_string_07);
    :new.substitution_string_08 := upper(:new.substitution_string_08);
    if :new.build_status is null then
       :new.build_status := 'RUN_AND_BUILD';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- owner
    --
    :new.owner := upper(:new.owner);
    if inserting or :new.owner <> nvl(:old.owner, :new.owner) then
        for i in ( select min(case when schema = :new.owner then schema end) over () found_schema,
                          schema first_schema
                     from wwv_flow_company_schemas
                    where security_group_id = :new.security_group_id )
        loop
            if i.found_schema is null then
                wwv_flow_debug.trace (
                    'owner "%s" not found, reverting to "%s"',
                    :new.owner,
                    i.first_schema );
                :new.owner := i.first_schema;
            else
                wwv_flow_debug.trace (
                    'accepting owner change to "%s"',
                    i.found_schema );
            end if;
            exit;
        end loop;
    end if;
    --
    if inserting and :new.global_id is null then
        :new.global_id := wwv_flow_id.next_val;
    end if;
    --
    -- trim white space
    --
    for i in 1..10 loop
        :new.CUSTOM_AUTHENTICATION_PROCESS  := rtrim(:new.CUSTOM_AUTHENTICATION_PROCESS );
        :new.CUSTOM_AUTHENTICATION_PROCESS  := rtrim(:new.CUSTOM_AUTHENTICATION_PROCESS ,chr(10));
        :new.CUSTOM_AUTHENTICATION_PROCESS  := rtrim(:new.CUSTOM_AUTHENTICATION_PROCESS ,chr(13));
    end loop;

    :new.alias := upper(:new.alias);

    if :new.alias is null then
        :new.alias := 'F_'||:new.id;
    end if;

    if :new.bookmark_checksum_function is null then
        :new.bookmark_checksum_function := coalesce (
                                               wwv_flow_platform.g_checksum_hash_function,
                                               wwv_flow_crypto.c_hash_best );
    end if;

    if inserting then
        :new.created_on      := nvl(:new.created_on, sysdate);
        :new.created_by      := nvl(:new.created_by, nvl(wwv_flow.g_user,user));
        :new.last_updated_on := nvl(:new.last_updated_on, :new.created_on);
        :new.last_updated_by := nvl(:new.last_updated_by, :new.created_by);
    end if;

    if not wwv_flow.g_import_in_progress then
        if updating
           and ( :old.checksum_salt is null
                 or :new.checksum_salt <> :old.checksum_salt)
        then
            :new.checksum_salt_last_reset := sysdate;
        end if;
        --
        -- last updated
        --
        if user <> 'SYS' then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/

--==============================================================================
prompt ...trigger wwv_flow_app_comments_t1

create or replace trigger wwv_flow_app_comments_t1
    before insert or update on wwv_flow_app_comments
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- clean up whitespace in pages
    --
    for i in 1..10 loop
    	  :new.pages := replace(:new.pages,'  ',' ');
    end loop;
    :new.pages := trim(:new.pages);
    :new.pages := replace(:new.pages,':',',');
    :new.pages := replace(:new.pages,' ',',');
    :new.pages := replace(:new.pages,',,',', ');
    :new.pages := rtrim(:new.pages,',');
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        update wwv_flows
        set last_updated_on = sysdate,
            last_updated_by = wwv_flow.g_user
        where id = :new.flow_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_user_interface_t1

create or replace trigger wwv_flow_user_interface_t1
    before insert or update or delete on wwv_flow_user_interfaces
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- The FK to wwv_flow_steps is defined to automatically set to NULL
        -- if the related record in wwv_flow_steps is deleted. We need to handle
        -- 2 cases related to this:

        -- Firstly, we want to prevent this from setting the global_page_id to NULL,
        -- in the case where a page import is being performed, which inhrenently
        -- deletes the page and would otherwise cause the constraint to set global_page_id
        -- to NULL (bug #14532258).
        -- Note: Application import is not affected by this, because the entire
        -- flow is deleted, which cascade deletes down through all the dependent
        -- objects. Then the application is just re-created in the normal way,
        -- from afresh.
        if updating and :new.global_page_id is null and wwv_flow.g_import_in_progress then
            :new.global_page_id := :old.global_page_id;
        end if;

        -- Secondly, because the FK uses flow_id and global_page_id, the required
        -- flow_id would be set to NULL as well which we don't want.
        if updating and :new.flow_id is null then
            :new.flow_id := :old.flow_id;
        end if;


        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_combined_files_t1

create or replace trigger wwv_flow_combined_files_t1
    before insert or update or delete on wwv_flow_combined_files
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_security_schemes_t1

create or replace trigger wwv_flow_security_schemes_t1
    before insert or update or delete on wwv_flow_security_schemes
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_template_prefs_t1

create or replace trigger wwv_flow_template_prefs_t1
    before insert or update on wwv_flow_template_preferences
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_banner_t1

create or replace trigger wwv_flow_banner_t1
    before insert or update on wwv_flow_banner
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_languages_t1

create or replace trigger wwv_flow_languages_t1
    before insert or update on wwv_flow_languages
    for each row
begin
    :new.lang_id_upper := upper(:new.lang_id);
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/


prompt ...trigger wwv_flow_language_map_t1

create or replace trigger wwv_flow_language_map_t1
    before insert or update or delete on wwv_flow_language_map
    for each row
begin
    if inserting or updating then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.trans_flow_lang_code_root := substr(:new.translation_flow_language_code,1,2);
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.primary_language_flow_id, :old.primary_language_flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_language_map_t2

create or replace trigger wwv_flow_language_map_t2
    before delete on wwv_flow_language_map
    for each row
begin
    --
    -- cascade delete from wwv_flows_reserved
    --
    if nvl(wwv_flow_api.g_mode,'x') != 'REPLACE' then
        delete from wwv_flows_reserved
          where id = :old.translation_flow_id
            and (permanent_security_group_id is null or permanent_security_group_id = :old.security_group_id);
    end if;
end;
/





prompt ...trigger wwv_flow_translatable_text_t1

create or replace trigger wwv_flow_translatable_text_t1
    before insert or update or delete on wwv_flow_translatable_text$
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.template_translatable is null then
            :new.template_translatable := 'N';
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_dynamic_trans_t1

create or replace trigger wwv_flow_dynamic_trans_t1
    before insert or update or delete on WWV_FLOW_DYNAMIC_TRANSLATIONS$
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_page_cache_t1

create or replace trigger wwv_flow_page_cache_t1
    before insert or update on wwv_flow_page_cache
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
        :new.cached_on := sysdate;
        :new.cached_by := wwv_flow.g_user;
        if :new.language is null then
           :new.language  := upper(substr(wwv_flow.g_flow_language,1,2));
        end if;
    end if;

    --
    -- vpd
    --
    --:new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    :new.security_group_id := nvl(wwv_flow_security.g_curr_flow_security_group_id,0);
end;
/

prompt ...trigger wwv_flow_page_code_cache_t1

create or replace trigger wwv_flow_page_code_cache_t1
    before insert or update on wwv_flow_page_code_cache
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_templates_t1

create or replace trigger wwv_flow_templates_t1
    before insert or update or delete on wwv_flow_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_page_tmpl_dp_t1

create or replace trigger wwv_flow_page_tmpl_dp_t1
    before insert or update or delete on wwv_flow_page_tmpl_disp_points
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_templates
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.page_template_id, :old.page_template_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_field_templates_t1

create or replace trigger wwv_flow_field_templates_t1
    before insert or update or delete on wwv_flow_field_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_required_roles_t1

create or replace trigger wwv_flow_required_roles_t1
    before insert or update on wwv_flow_required_roles
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_icon_bar_t1

create or replace trigger wwv_flow_icon_bar_t1
    before insert or update or delete on wwv_flow_icon_bar
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_processing_t1

create or replace trigger wwv_flow_processing_t1
    before insert or update or delete on wwv_flow_processing
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_validations_t1

create or replace trigger wwv_flow_validations_t1
    before insert or update or delete on wwv_flow_validations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end wwv_flow_validations_t1;
/


prompt ...trigger wwv_flow_items_t1

create or replace trigger wwv_flow_items_t1
    before insert or update or delete on wwv_flow_items
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -----------------
        -- default values
        --
        if :new.data_type is null then
            :new.data_type := 'VARCHAR';
        end if;
        :new.name_length := length(:new.name);
        :new.name := upper(:new.name);
        if :new.is_Persistent is null then
            :new.is_Persistent := 'Y';
        end if;

        --
        -- name
        --
        :new.name := upper(:new.name);

        --
        -- cascade to computations
        --
        if updating and :new.name != upper(:old.name) then
            begin
                update wwv_flow_computations
                    set computation_item = :new.name
                    where flow_id = :new.flow_id
                    and upper(computation_item) = upper(:old.name);
                --
                update wwv_flow_step_computations
                    set computation_item = :new.name
                    where flow_id = :new.flow_id
                    and upper(computation_item) = upper(:old.name);
            exception when others then null;
            end;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_items_t2

create or replace trigger wwv_flow_items_t2
    before delete on wwv_flow_items
    for each row
begin
    --
    -- cascade delete flow and step computations referencing item
    --
    if nvl(wwv_flow_api.g_mode,'x') != 'REPLACE' then
        begin
            delete wwv_flow_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
            delete wwv_flow_step_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_computations_t1

create or replace trigger wwv_flow_computations_t1
    before insert or update or delete on wwv_flow_computations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.computation_point is null then
           :new.computation_point := 'AFTER_SUBMIT';
        end if;
        if :new.computation_processed is null then
           :new.computation_processed := 'REPLACE_EXISTING';
        end if;
        if :new.computation_type is null then
           :new.computation_type := 'SQL_EXPRESSION';
        end if;

        --
        -- set name
        --
        :new.computation_item := upper(:new.computation_item);

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_tabs_t1

create or replace trigger wwv_flow_tabs_t1
    before insert or update or delete on wwv_flow_tabs
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.tab_also_current_for_pages :=
           replace(replace(replace(:new.tab_also_current_for_pages,':',','),' ',','),'|',',');
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/



prompt ...trigger wwv_flow_toplevel_tabs_t1

create or replace trigger wwv_flow_toplevel_tabs_t1
    before insert or update or delete on wwv_flow_toplevel_tabs
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/




prompt ...trigger wwv_flow_lists_of_values_t1

create or replace trigger wwv_flow_lists_of_values_t1
    before insert or update or delete on wwv_flow_lists_of_values$
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.lov_query is null then
           :new.lov_query := '.'||:new.id||'.';
        elsif :new.lov_query = '.' then
           :new.lov_query := '.'||:new.id||'.';
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_lists_of_valuesd_t1

create or replace trigger wwv_flow_lists_of_valuesd_t1
    before insert or update or delete on wwv_flow_list_of_values_data
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.lov_return_value is null then
           :new.lov_return_value := :new.lov_disp_value;
        end if;
        if :new.lov_disp_value is null then
           :new.lov_disp_value := :new.lov_return_value;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_lists_of_values$
                        where id = :new.lov_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_lists_of_values$
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.lov_id, :old.lov_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors



prompt ...trigger wwv_flow_trees_t1

create or replace trigger wwv_flow_trees_t1
    before insert or update or delete on  wwv_flow_trees
    for each row
begin
    if inserting or updating then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_treeregion_t1

create or replace trigger wwv_flow_treeregion_t1
    before insert or update or delete on  wwv_flow_tree_regions
    for each row
begin
    if inserting or updating then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_steps_t1

create or replace trigger wwv_flow_steps_t1
    before insert or update or delete on wwv_flow_steps
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if (inserting or updating) and :new.id2 is null then
            :new.id2 := wwv_flow_id.next_val;
        end if;
        if :new.step_sub_title_type is null then
            :new.step_sub_title_type := 'TEXT_WITH_SUBSTITUTIONS';
        end if;

        :new.alias := upper(:new.alias);

        -- Used by Page Designer to detect a change on the page
        :new.page_components_scn := sys.dbms_flashback.get_system_change_number;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_step_buttons_t1

create or replace trigger wwv_flow_step_buttons_t1
    before insert or update or delete on wwv_flow_step_buttons
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- Check the button name doesn't conflict with a tab name in the same application.
        -- Never do this during an import / or upgrade
        if not wwv_flow.g_import_in_progress then
            -- Then check on inserting, or on updating (but only if the button name has changed)
            if inserting or (updating and :old.button_name <> :new.button_name) then
                -- Finally, check if the button action is one that could submit with a REQUEST equal to the button name
                if :new.button_action is not null and :new.button_action in ('SUBMIT','REDIRECT_URL','DEFINED_BY_DA') then
                    for c1 in (select tab_name
                                 from wwv_flow_tabs
                                where flow_id = :new.flow_id
                                  and tab_name = :new.button_name)
                    loop
                        raise_application_error (-20001,wwv_flow_lang.system_message('TRIGGER.BUTTON_TAB_NAMES_NOT_EQUAL'));
                        exit;
                    end loop;
                end if;
            end if;
        end if;

        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.button_condition  := rtrim(:new.button_condition );
            :new.button_condition  := rtrim(:new.button_condition ,chr(10));
            :new.button_condition  := rtrim(:new.button_condition ,chr(13));
        end loop;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_step_branches_t1

create or replace trigger wwv_flow_step_branches_t1
    before insert or update or delete on wwv_flow_step_branches
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.branch_condition_type = 'REQUEST_IS_NUMERIC' then
            :new.branch_condition := 'Numeric Check.';
        end if;
        if :new.branch_condition_type = '%null%' then
           :new.branch_condition_type := null;
        end if;
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.branch_condition  := rtrim(:new.branch_condition );
            :new.branch_condition  := rtrim(:new.branch_condition ,chr(10));
            :new.branch_condition  := rtrim(:new.branch_condition ,chr(13));
        end loop;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_step_branch_args_t1

create or replace trigger wwv_flow_step_branch_args_t1
    before insert or update on wwv_flow_step_branch_args
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/


prompt ...trigger wwv_flow_step_items_t1

create or replace trigger wwv_flow_step_items_t1
    before insert or update or delete on wwv_flow_step_items
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -----------------
        -- default values
        --
        if :new.begin_on_new_line is null then
            :new.begin_on_new_line := 'Y';
        end if;
        if :new.begin_on_new_field is null then
            :new.begin_on_new_field := 'Y';
        end if;
        if :new.label_alignment is null then
            :new.label_alignment := 'LEFT';
        end if;
        if :new.field_alignment is null then
            :new.field_alignment := 'LEFT';
        end if;
        if :new.lov_display_null is null then
            :new.lov_display_null := 'NO';
        end if;
        if :new.accept_processing is null then
            :new.accept_processing := 'REPLACE_EXISTING';
        end if;
        if :new.is_Persistent is null then
            :new.is_Persistent := 'Y';
        end if;
        -- maintain the length of the item name
        :new.name_length := length(:new.name);
        -- force field into upper case and make sure that some special characters are replaced
        -- Note: keep in sync with wwv_flow_builder.is_valid_item_name and get_valid_item_name
        :new.name := replace (
                         replace (
                             translate(trim(upper(:new.name)), ' :&,.+?%''"', '__________'),
                             '_#',
                             '_H' ),
                         '#',
                         '_H' );
        --
        -- remove trailing whitespace from source column
        :new.source := rtrim(rtrim(ltrim(:new.source)),chr(13)||chr(10));
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        --
        -- Populate LOV column for named list of values
        --
        if replace(:new.named_lov,'%null%') is not null then
            begin
            select replace(lov_query,chr(13),null) into :new.lov
              from wwv_flow_lists_of_values$
             where flow_id = :new.flow_id and lov_name = :new.named_lov
               and security_group_id = :new.security_group_id;
            exception when others then null;
            end;
        end if;
        --
        -- A HTML5 date picker should always use the format required by the browser.
        --
        if :new.display_as = wwv_flow_native_item.c_date_picker_html5 then
            if :new.attribute_01 = 'DATE' then
                :new.format_mask := wwv_flow_native_item.c_browser_date_format_mask;
            else
                :new.format_mask := wwv_flow_native_item.c_browser_datetime_format_mask;
            end if;
        end if;
        --
        -- cascade to computations, remove session state
        --
        if updating and :new.name != upper(:old.name) then
            begin
                update wwv_flow_computations
                   set computation_item = :new.name
                 where flow_id = :new.flow_id
                   and security_group_id = :new.security_group_id
                   and upper(computation_item) = upper(:old.name);
                --
                update wwv_flow_step_computations
                   set computation_item = :new.name
                 where flow_id = :new.flow_id
                   and security_group_id = :new.security_group_id
                   and upper(computation_item) = upper(:old.name);
            exception when others then null;
            end;

            if not wwv_flow.g_import_in_progress then
                -- Remove existing session state to avoid issues with logic that accesses session state by
                -- item name and not by item ID. Note that the developer who is changing this item may not be
                -- the only one with existing session state for it (therefore, we don't constrain to flow_instance).
                wwv_flow_session_state.clear_all_state_for_id (
                    p_item_id        => :new.id,
                    p_application_id => :new.flow_id );
            end if;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_step_items_t2

create or replace trigger wwv_flow_step_items_t2
    before delete on wwv_flow_step_items
    for each row
begin
    --
    -- cascade delete flow and step computations referencing item
    --
    if nvl(wwv_flow_api.g_mode,'x') != 'REPLACE' then
        begin
            delete wwv_flow_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
            delete wwv_flow_step_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
    --
    -- cascade update to page
    --
    begin
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :old.flow_id and
           id = :old.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    exception when others then null;
    end;
end;
/


prompt ...trigger wwv_flow_step_item_help_t1

create or replace trigger wwv_flow_step_item_help_t1
    before insert or update or delete on wwv_flow_step_item_help
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_step_items
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_item_id, :old.flow_item_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_step_computations_t1

create or replace trigger wwv_flow_step_computations_t1
    before insert or update or delete on wwv_flow_step_computations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.computation_point is null then
           :new.computation_point := 'AFTER_SUBMIT';
        end if;
        if :new.computation_processed is null then
           :new.computation_processed := 'REPLACE_EXISTING';
        end if;
        if :new.computation_type is null then
           :new.computation_type := 'SQL_EXPRESSION';
        end if;
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.compute_when  := rtrim(:new.compute_when );
            :new.compute_when  := rtrim(:new.compute_when ,chr(10));
            :new.compute_when  := rtrim(:new.compute_when ,chr(13));
        end loop;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_step_validations_t1

create or replace trigger wwv_flow_step_validations_t1
    before insert or update or delete on wwv_flow_step_validations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.validation_condition := rtrim( :new.validation_condition, ' '||chr(10)||chr(13) );
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.validation  := rtrim(:new.validation );
            :new.validation  := rtrim(:new.validation ,chr(10));
            :new.validation  := rtrim(:new.validation ,chr(13));
        end loop;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_step_processing_t1

create or replace trigger wwv_flow_step_processing_t1
    before insert or update or delete on wwv_flow_step_processing
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_button_templates_t1

create or replace trigger wwv_flow_button_templates_t1
    before insert or update or delete on wwv_flow_button_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_cals_t1

create or replace trigger wwv_flow_cals_t1
   before insert or update or delete on wwv_flow_cals
   for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- Default the display type
        --
        if :new.display_type is null then
            :new.display_type := 'COL';
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plug_id, :old.plug_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_cal_templates_t1

create or replace trigger wwv_flow_cal_templates_t1
    before insert or update or delete on wwv_flow_cal_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_themes_t1

create or replace trigger wwv_flow_themes_t1
         before insert or update or delete on wwv_flow_themes
         for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
           :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
prompt ...trigger wwv_flow_themes_t2
create or replace trigger wwv_flow_themes_t2
    after insert or update on wwv_flow_themes
begin
    if inserting or updating('THEME_IMAGE') then
        wwv_flow_file_api.check_workspace_limits;
    end if;
end;
/

prompt ...trigger wwv_flow_theme_styles_t1

create or replace trigger wwv_flow_theme_styles_t1
    before insert or update or delete on wwv_flow_theme_styles
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_theme_disp_points_t1

create or replace trigger wwv_flow_theme_disp_points_t1
    before insert or update or delete on wwv_flow_theme_display_points
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/



prompt ...trigger wwv_flow_theme_files_t1

create or replace trigger wwv_flow_theme_files_t1
    before insert or update or delete on wwv_flow_theme_files
    for each row
declare
    l_files_version_increment number;
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- audit
        -- Note: always set change attributes so that the caching of files works
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        if deleting then
            l_files_version_increment := 0;
        else
            l_files_version_increment := 1;
        end if;
        --
        begin
            update wwv_flow_themes
               set files_version   = files_version + l_files_version_increment,
                   last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_template_opt_groupsp_t1

create or replace trigger wwv_flow_template_opt_grp_t1
    before insert or update or delete on wwv_flow_template_opt_groups
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_template_options_t1

create or replace trigger wwv_flow_template_options_t1
    before insert or update or delete on wwv_flow_template_options
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_page_plug_templ_t1

create or replace trigger wwv_flow_page_plug_templ_t1
    before insert or update or delete on wwv_flow_page_plug_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plug_tmpl_dp_t1

create or replace trigger wwv_flow_plug_tmpl_dp_t1
    before insert or update or delete on wwv_flow_plug_tmpl_disp_points
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plug_templates
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plug_template_id, :old.plug_template_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_row_templates_t1

create or replace trigger wwv_flow_row_templates_t1
    before insert or update or delete on wwv_flow_row_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.row_template_before_rows is null then
           :new.row_template_before_rows := ' ';
        end if;
        if :new.row_template_after_rows is null then
           :new.row_template_after_rows := ' ';
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_list_templates_t1

create or replace trigger wwv_flow_list_templates_t1
    before insert or update or delete on wwv_flow_list_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.list_template_before_rows is null then
           :new.list_template_before_rows := ' ';
        end if;
        if :new.list_template_after_rows is null then
           :new.list_template_after_rows := ' ';
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_page_plugs_t1

create or replace trigger wwv_flow_page_plugs_t1
    before insert or update or delete on wwv_flow_page_plugs
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.plug_source_type is null then
            :new.plug_source_type := 'NATIVE_STATIC';
        end if;
        if :new.plug_query_row_template is not null then
            :new.plug_query_format_out := 'TEMPLATE';
        end if;
        -- Always set BODY as display point for sub regions (bug #17493903)
        if :new.parent_plug_id is not null then
            :new.plug_display_point := 'BODY';
        end if;
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition );
            :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition ,chr(10));
            :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition ,chr(13));
        end loop;

        if :new.plug_source is not null then
            :new.plug_source := replace (
                                    :new.plug_source,
                                    wwv_flow.CR,
                                    null );
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        --
        if :new.security_group_id <> 10 and :new.plug_query_parse_override is not null then
           :new.plug_query_parse_override := null;
        end if;
        --
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.page_id, :old.page_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_region_columns_t1

create or replace trigger wwv_flow_region_columns_t1
    before insert or update or delete on wwv_flow_region_columns
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_pg_generic_attr_t1

create or replace trigger wwv_flow_pg_generic_attr_t1
    before insert or update on wwv_flow_page_generic_attr
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        for c1 in (select flow_id, page_id from wwv_flow_page_plugs
                   where id = :new.region_id
                   and security_group_id = :new.security_group_id) loop
            update wwv_flow_steps set
               last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
            where
               flow_id = c1.flow_id and
               id = c1.page_id and
               security_group_id = :new.security_group_id;
        end loop;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

prompt ...trigger wwv_flow_sessions_t2

create or replace trigger wwv_flow_sessions_t2
   after delete on wwv_flow_sessions$
   for each row
begin
    delete from wwv_flow_worksheet_rpts where session_id = :old.id;
    --
    delete from wwv_flow_file_objects$ where session_id = :old.id;
    --
    update wwv_flow_companies
       set last_login = trunc(:old.created_on)
     where provisioning_company_id = :old.security_group_id
       and (last_login < trunc(:old.created_on) or last_login is null);
    --
    if :old.ras_sessionid is not null then
        wwv_flow_session_ras.destroy_session (
            p_sessionid => :old.ras_sessionid );
    end if;
end;
/

prompt ...trigger wwv_flow_preferences_t1

create or replace trigger wwv_flow_preferences_t1
    before insert or update on wwv_flow_preferences$
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
end;
/

prompt ...trigger wwv_flow_messages_t1

create or replace trigger wwv_flow_messages_t1
    before insert or update or delete on wwv_flow_messages$
    for each row
begin
    if inserting or updating then
        if inserting then
            if :new.id is null then
                :new.id := wwv_flow_id.next_val;
            end if;
        end if;
        :new.name := upper(:new.name);
        :new.message_language := lower(:new.message_language);
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        
        -- Client-side flag synchronisation with 4411 (bug #20529571)
        if :new.flow_id <> 4411 and :new.is_js_message = 'N' then
            if :new.name in (
                'APEX.ACTIONS.TOGGLE',
                'APEX.ACTIVE_STATE',
                'APEX.COMPLETED_STATE',
                'APEX.DIALOG.CLOSE',
                'APEX.ICON_LIST.GRID_DIM',
                'APEX.MENU.OVERFLOW_LABEL',
                'APEX.PROCESSING',
                'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL',
                'APEX.WAIT_UNTIL_PAGE_LOADED',
                'APEXIR_AGGREGATE',
                'APEXIR_ALL',
                'APEXIR_APPLY',
                'APEXIR_CANCEL',
                'APEXIR_CHART',
                'APEXIR_COMPUTE',
                'APEXIR_CONTROL_BREAK',
                'APEXIR_DELETE',
                'APEXIR_DELETE_DEFAULT_REPORT',
                'APEXIR_DELETE_REPORT',
                'APEXIR_DOWNLOAD',
                'APEXIR_FILTER',
                'APEXIR_FLASHBACK',
                'APEXIR_FORMAT',
                'APEXIR_GROUP_BY',
                'APEXIR_GROUP_BY_SORT',
                'APEXIR_HELP',
                'APEXIR_HIGHLIGHT',
                'APEXIR_NEW_CATEGORY_LABEL',
                'APEXIR_PIVOT',
                'APEXIR_PIVOT_SORT',
                'APEXIR_RENAME_DEFAULT_REPORT',
                'APEXIR_RENAME_REPORT',
                'APEXIR_RESET',
                'APEXIR_ROWS_PER_PAGE',
                'APEXIR_SAVE_DEFAULT_REPORT',
                'APEXIR_SAVE_REPORT',
                'APEXIR_SAVE_REPORT_DEFAULT',
                'APEXIR_SEARCH_COLUMN',
                'APEXIR_SELECT_COLUMNS',
                'APEXIR_SEND',
                'APEXIR_SORT',
                'APEXIR_SUBSCRIPTION',
                'MAXIMIZE' )
            then
                :new.is_js_message := 'Y';
            end if;               
        end if;
        
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_patches_t1

create or replace trigger wwv_flow_patches_t1
    before insert or update or delete on wwv_flow_patches
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_developers_t1

create or replace trigger wwv_flow_developers_t1
    before insert or update on wwv_flow_developers
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.user_id is null then
            :new.user_id := :new.id;
        end if;
    end if;
    :new.userid := upper(:new.userid);
    --
    -- set admin privs
    --
    if instr(:new.DEVELOPER_ROLE,'ADMIN') > 0 then
       :new.DEVELOPER_ROLE := 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
end;
/

prompt ...set security group id = 10

begin
   wwv_flow_security.g_security_group_id := 10;
end;
/


prompt ...trigger wwv_flow_lists_t1

create or replace trigger wwv_flow_lists_t1
    before insert or update or delete on wwv_flow_lists
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.list_status is null then
            :new.list_status := 'PERSONAL';
        end if;
        if :new.list_displayed is null then
            :new.list_displayed := 'BY_DEFAULT';
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_list_items_t1

create or replace trigger wwv_flow_list_items_t1
    before insert or update or delete on wwv_flow_list_items
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.list_item_owner is not null then
            :new.list_item_owner := user;
        end if;
        for c1 in (select flow_id from wwv_flow_lists where id = :new.list_id) loop
            :new.flow_id := c1.flow_id;
            exit;
        end loop;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_lists
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.list_id, :old.list_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_shared_queries_t1

create or replace trigger wwv_flow_shared_queries_t1
  before insert or update or delete on wwv_flow_shared_queries
  for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_sqry_sql_stmts_t1

create or replace trigger wwv_flow_sqry_sql_stmts_t1
  before insert or update or delete on wwv_flow_shared_qry_sql_stmts
  for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_report_layouts_t1

create or replace trigger wwv_flow_report_layouts_t1
  before insert or update or delete on wwv_flow_report_layouts
  for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_static_files_t1

create or replace trigger wwv_flow_static_files_t1
    before insert or update or delete on wwv_flow_static_files
    for each row
declare
    l_files_version_increment number;
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        if deleting then
            l_files_version_increment := 0;
        else
            l_files_version_increment := 1;
        end if;
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   files_version         = files_version + l_files_version_increment,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
prompt ...trigger wwv_flow_static_files_t2
create or replace trigger wwv_flow_static_files_t2
    after insert or update on wwv_flow_static_files
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/



prompt ...trigger wwv_flow_lov_values_t1

create or replace trigger wwv_flow_lov_values_t1
    before insert or update on wwv_flow_lov_values
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.list_owner is null then
        :new.list_owner := nvl(wwv_flow.g_user, user);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_eff_userid_map_t1

create or replace trigger wwv_flow_eff_userid_map_t1
    before insert or update on wwv_flow_effective_userid_map
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/
show errors

prompt ...wwv_flow_shortcuts_t1

create or replace trigger wwv_flow_shortcuts_t1
    before insert or update or delete on wwv_flow_shortcuts
    for each row
begin
    if inserting or updating then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        :new.shortcut_consideration_seq := nvl(:new.shortcut_consideration_seq,1);
        :new.shortcut_name := upper(:new.shortcut_name);
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_shortcut_um_t1

create or replace trigger wwv_flow_shortcut_um_t1
    before insert or update on wwv_flow_shortcut_usage_map
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_mail_queue_t1

create or replace trigger wwv_flow_mail_queue_t1
    before insert or update on wwv_flow_mail_queue
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.mail_send_count is null then
            :new.mail_send_count := 0;
        end if;
        if :new.mail_message_created is null then
            :new.mail_message_created := sysdate;
        end if;
        if :new.last_updated_by is null then
            :new.last_updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
    :new.last_updated_on := sysdate;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_mail_log_t1

create or replace trigger wwv_flow_mail_log_t1
    before insert on wwv_flow_mail_log
    for each row
begin
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_mail_attachments_t1

create or replace trigger wwv_flow_mail_attachments_t1
    before insert or update on wwv_flow_mail_attachments
    for each row
declare
  l_maximum_size_mb integer;
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    :new.last_updated_on := sysdate;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);

    --
    -- If a maximum attachment size is specified in system preferences, then ensure
    -- that this attachment does not exceed the maximum size.
    --
    l_maximum_size_mb := wwv_flow_platform.get_preference('EMAIL_ATTACHMENT_MAX_SIZE_MB');
    if l_maximum_size_mb is not null then
        if sys.dbms_lob.getlength(:new.attachment)/1024/1024 > l_maximum_size_mb then
            raise_application_error (-20023,
                wwv_flow_lang.system_message('WWV_FLOW_MAIL.ADD_ATTACHMENT.ATTACHMENT_EXCEEDS_MAXIMUM_SIZE',
                    round(sys.dbms_lob.getlength(:new.attachment)/1024/1024), l_maximum_size_mb));
        end if;
    end if;


    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

prompt ...trigger wwv_flow_sw_binds_t1

create or replace trigger wwv_flow_sw_binds_t1
    before insert or update on wwv_flow_sw_binds
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_sw_results_t1

create or replace trigger wwv_flow_sw_results_t1
    before insert or update on wwv_flow_sw_results
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.started := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_sw_detail_results_t1

create or replace trigger wwv_flow_sw_detail_results_t1
    before insert or update on wwv_flow_sw_detail_results
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.started := sysdate;
    elsif updating then
    	  :new.last_updated := sysdate;
    end if;
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_sw_sql_cmds_t1

create or replace trigger wwv_flow_sw_sql_cmds_t1
    before insert or update on wwv_flow_sw_sql_cmds
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting and not wwv_flow.g_import_in_progress then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

prompt ...trigger wwv_flow_import_export_t1

create or replace trigger wwv_flow_import_export_t1
    before insert or update on wwv_flow_import_export
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


----------------------------
--  U S E R   T A B L E E S
--

prompt ...trigger wwv_flow_fnd_user_t1

create or replace trigger wwv_flow_fnd_user_t1
    before insert or update on wwv_flow_fnd_user
    for each row
declare
    procedure generate_hashed_password
    is
        l_today date := trunc(sysdate);
        l_found number;
    begin
        --
        -- hash the plain text password and clear legacy password columns
        --
        :new.web_password_version       := wwv_flow_crypto.get_current_password_version;
        :new.web_password2              := wwv_flow_crypto.hash_password (
                                               p_password          => :new.web_password,
                                               p_version           => :new.web_password_version,
                                               p_security_group_id => :new.security_group_id,
                                               p_user_name         => :new.user_name,
                                               p_user_id           => :new.user_id );
        :new.web_password               := null;
        :new.web_password_raw           := null;
        --
        -- save new password in history, but prevent duplicates
        --
        if updating then
            select count(1)
              into l_found
              from wwv_flow_password_history
             where security_group_id          = :new.security_group_id
               and user_id                    = :new.user_id
               and password                   = :new.web_password2
               and nvl(password_version, '*') = nvl(:new.web_password_version, '*')
               and created                    = l_today;
        else
            l_found := 0;
        end if;

        if l_found = 0 then
            insert into wwv_flow_password_history (
                id,
                user_id,
                password,
                password_version,
                created,
                security_group_id )
            values (
                wwv_flow_id.next_val,
                :new.user_id,
                :new.web_password2,
                :new.web_password_version,
                l_today,
                :new.security_group_id );
        end if;
    end generate_hashed_password;
begin
    if inserting then
        :new.user_id        := coalesce(:new.user_id, wwv_flow_id.next_val);
        :new.creation_date  := sysdate;
        :new.created_by     := coalesce(wwv_flow.g_user, user);
        :new.account_expiry := coalesce(:new.account_expiry, sysdate);
    end if;

    :new.start_date              := coalesce(:new.start_date, sysdate);
    :new.end_date                := coalesce(:new.end_date, :new.start_date + (365*20));
    :new.user_name               := trim(upper(:new.user_name));
    :new.allow_access_to_schemas := upper(:new.allow_access_to_schemas);
    :new.default_date_format     := trim(:new.default_date_format);
    :new.last_updated_by         := coalesce(wwv_flow.g_user, user);
    :new.last_update_date        := sysdate;
    :new.security_group_id       := coalesce(:new.security_group_id, wwv_flow_security.g_security_group_id, 0);
    --
    -- the insert/update APIs pass clear text passwords in the WEB_PASSWORD
    -- column. in this case, we apply the newest hashing algorithm and safe the
    -- hashed value instead of the clear text.
    --
    if :new.web_password is not null then
        generate_hashed_password;
        if updating then
            :new.account_expiry := sysdate;
        end if;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_fnd_user_groups_t1

create or replace trigger wwv_flow_fnd_user_groups_t1
    before insert or update on wwv_flow_fnd_user_groups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/
show errors

prompt ...trigger wwv_flow_fnd_group_users_t1

create or replace trigger wwv_flow_fnd_group_users_t1
    before insert or update on wwv_flow_fnd_group_users
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

------------------------
-- C O L L E C T I O N S
--
prompt ...trigger wwv_flow_collection_t1

create or replace trigger wwv_flow_collection_t1
    before insert or update on wwv_flow_collections$
    for each row
declare
    c_instance_id_shift constant number := 100000000000000;
begin
    :new.user_id           := wwv_flow.g_user;
    :new.session_id        := v('SESSION');
    :new.collection_name   := upper(:new.collection_name);
    :new.flow_id           := v('FLOW_ID');

    if inserting then
        if :new.id is null then
            --
            -- Prepend two digit instance number to support partitioning of
            -- session data (bug# 13562656)
            --
            :new.id := (to_number(sys_context('USERENV', 'INSTANCE'))-1)*c_instance_id_shift+
                       greatest (
                           mod(wwv_flow_id.next_val,
                               c_instance_id_shift),
                           1 );
        end if;
        :new.created_on         := coalesce(:new.created_on, sysdate);
        :new.collection_changed := coalesce(upper(:new.collection_changed), 'N');
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_collection_int.get_security_group_id;
    end if;
end;
/

------------------------------
-- Updatable Report Attributes
--

prompt ...trigger wwv_flow_reg_upd_rpt_cols_t1

create or replace trigger wwv_flow_reg_upd_rpt_cols_t1
    before insert or update on wwv_flow_region_upd_rpt_cols
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_popup_lov_template_t1
create or replace trigger wwv_flow_popup_lov_template_t1
    before insert or update or delete on wwv_flow_popup_lov_template
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


------------------------------------
--   M E N U S
--

prompt ...trigger wwv_flow_menus_t1

create or replace trigger wwv_flow_menus_t1
    before insert or update or delete on wwv_flow_menus
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_menu_options_t1

create or replace trigger wwv_flow_menu_options_t1
    before insert or update or delete on wwv_flow_menu_options
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_menus
                        where id = :new.menu_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_menus
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.menu_id, :old.menu_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/



prompt ...trigger wwv_flow_menu_templates_t1

create or replace trigger wwv_flow_menu_templates_t1
    before insert or update or delete on wwv_flow_menu_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_version_t1

create sequence wwv_flow_version_seq
/

create or replace trigger wwv_flow_version_t1
    before insert on wwv_flow_version$
    for each row
begin
    select wwv_flow_version_seq.nextval,
           sysdate
      into :new.seq,
           :new.date_applied
      from sys.dual;
end;
/


prompt ...trigger wwv_flow_authentications_t1

create or replace trigger wwv_flow_authentications_t1
    before insert or update or delete on wwv_flow_authentications
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_auth_setups_t1

create or replace trigger wwv_flow_ws_auth_setups_t1
    before insert or update on wwv_flow_ws_custom_auth_setups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...trigger wwv_flow_entry_points_t1

create or replace trigger wwv_flow_entry_points_t1
    before insert or update or delete on wwv_flow_entry_points
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_entry_point_args_t1

create or replace trigger wwv_flow_entry_point_args_t1
    before insert or update on wwv_flow_entry_point_args
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/


prompt ...trigger wwv_flow_web_services_t1
create or replace trigger wwv_flow_web_services_t1
    before insert or update or delete on wwv_flow_shared_web_services
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_operations_t1

create or replace trigger wwv_flow_ws_operations_t1
    before insert or update or delete on wwv_flow_ws_operations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_shared_web_services
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.ws_id, :old.ws_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_parameters_t1

create or replace trigger wwv_flow_ws_parameters_t1
    before insert or update or delete on wwv_flow_ws_parameters
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ws_operations
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.ws_opers_id, :old.ws_opers_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_parms_map_t1

create or replace trigger wwv_flow_ws_parms_map_t1
    before insert or update or delete on wwv_flow_ws_process_parms_map
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_step_processing
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.process_id, :old.process_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_lock_page_t1

create or replace trigger wwv_flow_lock_page_t1
    before insert or update or delete on wwv_flow_lock_page
    for each row
begin
    if inserting or updating then
        --
        -- ID
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- vpd
        --
        if :new.security_group_id is null then
            :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
        end if;
        --
        -- last updated
        --
        if not wwv_flow.g_import_in_progress then
            :new.LOCKED_ON := sysdate;
        end if;
    end if;

    --
    -- maintain log
    --
    if inserting then
        insert into wwv_flow_lock_page_log
            (lock_id,lock_flow,lock_page,action,developer,lock_comment)
        values
            (:new.id,:new.flow_id,:new.object_id,'LOCK',:new.locked_by,:new.lock_comment);
    elsif updating then
        insert into wwv_flow_lock_page_log
            (lock_id,lock_flow,lock_page,action,developer,lock_comment)
        values
            (:new.id,:new.flow_id,:new.object_id,'UPDATE',:new.locked_by,:new.lock_comment);
    elsif deleting then
        insert into wwv_flow_lock_page_log (
           lock_id,lock_flow,lock_page,ACTION,ACTION_DATE,DEVELOPER,lock_comment)
           values (
           :old.id, :old.flow_id, :old.object_id,'UNLOCK',sysdate,v('USER'),:old.lock_comment);
    end if;

    if not wwv_flow.g_import_in_progress then
        -- Perform a "dummy" update on page to increase the page_components_scn to avoid caching issues in Page Designer
        -- Ignore mutating table error which is raised if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = last_updated_on,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.object_id, :old.object_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_lock_page_log_t1

create or replace trigger wwv_flow_lock_page_log_t1
    before insert or update on wwv_flow_lock_page_log
    for each row
begin
    --
    -- ID
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.action_date := sysdate;
    end if;
end;
/



prompt ...trigger wwv_flow_hnt_table_info_t1

create or replace trigger wwv_flow_hnt_table_info_t1
    before insert or update on wwv_flow_hnt_table_info
    for each row
begin
    if inserting and :new.table_id is null then
        :new.table_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_groups_t1

create or replace trigger wwv_flow_hnt_groups_t1
    before insert or update on wwv_flow_hnt_groups
    for each row
begin
    if inserting and :new.group_id is null then
        :new.group_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_col_info_t1

create or replace trigger wwv_flow_hnt_col_info_t1
    before insert or update on wwv_flow_hnt_column_info
    for each row
begin
    if inserting and :new.column_id is null then
        :new.column_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_lov_data_t1

create or replace trigger wwv_flow_hnt_lov_data_t1
    before insert or update on wwv_flow_hnt_lov_data
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_procedure_info_t1

create or replace trigger wwv_flow_hnt_procedure_info_t1
    before insert or update on wwv_flow_hnt_procedure_info
    for each row
begin
    if :new.procedure_id is null then
        :new.procedure_id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    elsif updating then
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_hnt_argument_info_t1

create or replace trigger wwv_flow_hnt_argument_info_t1
    before insert or update on  wwv_flow_hnt_argument_info
    for each row
begin
    if :new.argument_id is null then
        :new.argument_id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    elsif updating then
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_hnt_column_dict_t1

create or replace trigger wwv_flow_hnt_column_dict_t1
    before insert or update on wwv_flow_hnt_column_dict
    for each row
begin
    :new.column_name := upper(:new.column_name);

    if inserting and :new.column_id is null then
        :new.column_id := wwv_flow_id.next_val;
    elsif updating
        and :old.column_name != :new.column_name then
        begin
            update wwv_flow_hnt_col_dict_syn
               set syn_name = :new.column_name
             where column_id = :old.column_id
               and syn_name = :old.column_name
               and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

create or replace trigger wwv_flow_hnt_column_dict_t2
    after insert on wwv_flow_hnt_column_dict
    for each row
begin
    if not wwv_flow.g_import_in_progress then
        insert into wwv_flow_hnt_col_dict_syn
           (column_id, syn_name)
        values
           (:new.column_id, :new.column_name);
    end if;
end;
/


prompt ...trigger wwv_flow_hnt_col_dict_syn_t1

create or replace trigger wwv_flow_hnt_col_dict_syn_t1
    before insert or update on wwv_flow_hnt_col_dict_syn
    for each row
begin

    :new.syn_name := upper(:new.syn_name);

    if inserting and :new.syn_id is null then
        :new.syn_id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/


prompt ...trigger wwv_flow_chart_ser_attr_t1

create or replace trigger wwv_flow_chart_ser_attr_t1
    before insert or update or delete on wwv_flow_region_chart_ser_attr
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_reg_report_column_t1

create or replace trigger wwv_flow_reg_report_column_t1
    before insert or update or delete on wwv_flow_region_report_column
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- sync flow id for translations
        --
        if :new.flow_id is null then
             for c1 in (select flow_id
                         from wwv_flow_page_plugs
                         where id = :new.region_id) loop
                 :new.flow_id := c1.flow_id;
                 exit;
             end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_reg_report_filter_t1

create or replace trigger wwv_flow_regreport_filter_t1
    before insert or update on wwv_flow_region_report_filter
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/


prompt ...trigger wwv_flow_page_groups_t1

create or replace trigger wwv_flow_page_groups_t1
    before insert or update or delete on wwv_flow_page_groups
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end wwv_flow_pg_groups;
/


prompt ...trigger wwv_flow_online_help_t1

create or replace trigger wwv_flow_online_help_t1
    before insert on wwv_flow_online_help
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/


prompt ...trigger wwv_flow_online_help_ja_t1

create or replace trigger wwv_flow_online_help_ja_t1
    before insert on wwv_flow_online_help_ja
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/


prompt ...trigger wwv_flow_qb_saved_qry_t1

create or replace trigger wwv_flow_qb_saved_qry_t1
    before insert on wwv_flow_qb_saved_query
    for each row
begin
    :new.id                 := nvl(:new.id,wwv_flow_id.next_val);
    :new.query_owner        := nvl(:new.query_owner,wwv_flow_user_api.get_default_schema);
    :new.created_by         := nvl(:new.created_by,wwv_flow.g_user);
    :new.created_on         := nvl(:new.created_on,sysdate);
    :new.last_updated_by    := wwv_flow.g_user;
    :new.last_updated_on    := sysdate;
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
end;
/


prompt ...trigger wwv_flow_qb_saved_cond_t1

create or replace trigger wwv_flow_qb_saved_cond_t1
    before insert on wwv_flow_qb_saved_cond
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_qb_saved_join_t1

create or replace trigger wwv_flow_qb_saved_join_t1
    before insert on wwv_flow_qb_saved_join
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_qb_saved_tabs_t1

create or replace trigger wwv_flow_qb_saved_tabs_t1
    before insert on wwv_flow_qb_saved_tabs
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_sw_stmts_t1

create or replace trigger wwv_flow_sw_stmts_t1
    before insert or update on wwv_flow_sw_stmts
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_collection_int.get_security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_models_t1

create or replace trigger wwv_flow_models_t1
    before insert or update on wwv_flow_models
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_model_pages_t1

create or replace trigger wwv_flow_model_pages_t1
    before insert or update on wwv_flow_model_pages
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_model_page_regions_t1

create or replace trigger wwv_flow_model_page_regions_t1
    before insert or update on wwv_flow_model_page_regions
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_model_page_cols_t1

create or replace trigger wwv_flow_model_page_cols_t1
    before insert or update on wwv_flow_model_page_cols
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_sc_trans_t1

CREATE OR REPLACE TRIGGER wwv_flow_sc_trans_t1
    before insert or update on wwv_flow_sc_trans
    for each row
declare
  l_tid number;
begin
    -- set security group id if null
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- set t_id as I need to amintain the order of transactions as they occured
    if inserting and :new.transaction_id is null then
        select nvl(max(transaction_id),0)+1 into l_tid from wwv_flow_sc_trans where session_id = :new.session_id;
        :new.transaction_id := l_tid;
        :new.transaction_status := 'N';
        :new.created_on := sysdate;
    else
        :new.updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_restricted_schema_t1

CREATE OR REPLACE TRIGGER wwv_flow_restricted_schema_t1
    before insert or update on wwv_flow_restricted_schemas
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    else
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/


prompt ...trigger wwv_flow_rschema_exception_t1

CREATE OR REPLACE TRIGGER wwv_flow_rschema_exception_t1
    before insert or update on wwv_flow_rschema_exceptions
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    else
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/


prompt ...trigger wwv_flow_install_t1

create or replace trigger wwv_flow_install_t1
    before insert or update or delete on wwv_flow_install
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;
        --
        :new.prompt_substitution_01_yn := nvl(:new.prompt_substitution_01_yn, 'N');
        :new.prompt_substitution_02_yn := nvl(:new.prompt_substitution_02_yn, 'N');
        :new.prompt_substitution_03_yn := nvl(:new.prompt_substitution_03_yn, 'N');
        :new.prompt_substitution_04_yn := nvl(:new.prompt_substitution_04_yn, 'N');
        :new.prompt_substitution_05_yn := nvl(:new.prompt_substitution_05_yn, 'N');
        :new.prompt_substitution_06_yn := nvl(:new.prompt_substitution_06_yn, 'N');
        :new.prompt_substitution_07_yn := nvl(:new.prompt_substitution_07_yn, 'N');
        :new.prompt_substitution_08_yn := nvl(:new.prompt_substitution_08_yn, 'N');
        :new.prompt_substitution_09_yn := nvl(:new.prompt_substitution_09_yn, 'N');
        :new.prompt_substitution_10_yn := nvl(:new.prompt_substitution_10_yn, 'N');
        :new.prompt_substitution_11_yn := nvl(:new.prompt_substitution_11_yn, 'N');
        :new.prompt_substitution_12_yn := nvl(:new.prompt_substitution_12_yn, 'N');
        :new.prompt_substitution_13_yn := nvl(:new.prompt_substitution_13_yn, 'N');
        :new.prompt_substitution_14_yn := nvl(:new.prompt_substitution_14_yn, 'N');
        :new.prompt_substitution_15_yn := nvl(:new.prompt_substitution_15_yn, 'N');
        :new.prompt_substitution_16_yn := nvl(:new.prompt_substitution_16_yn, 'N');
        :new.prompt_substitution_17_yn := nvl(:new.prompt_substitution_17_yn, 'N');
        :new.prompt_substitution_18_yn := nvl(:new.prompt_substitution_18_yn, 'N');
        :new.prompt_substitution_19_yn := nvl(:new.prompt_substitution_19_yn, 'N');
        :new.prompt_substitution_20_yn := nvl(:new.prompt_substitution_20_yn, 'N');
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_install_scripts_t1

create or replace trigger wwv_flow_install_scripts_t1
    before insert or update or delete on wwv_flow_install_scripts
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;

        if :new.install_id is null then
           for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
              :new.install_id := c1.id;
           end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_install
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.install_id, :old.install_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_install_objects_t1

create or replace trigger wwv_flow_install_objects_t1
    before insert or update or delete on wwv_flow_install_objects
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_install_scripts
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.script_id, :old.script_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_install_checks_t1

create or replace trigger wwv_flow_install_checks_t1
    before insert or update or delete on wwv_flow_install_checks
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;

        if :new.install_id is null then
           for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
              :new.install_id := c1.id;
           end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_install
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.install_id, :old.install_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_install_build_opt_t1

create or replace trigger wwv_flow_install_build_opt_t1
    before insert or update or delete on wwv_flow_install_build_opt
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;

        if :new.install_id is null then
           for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
              :new.install_id := c1.id;
           end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_install
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.install_id, :old.install_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_lock_script_t1

create or replace trigger wwv_flow_lock_script_t1
    before insert or update on wwv_flow_lock_script
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.locked_by := nvl(wwv_flow.g_user,user);
        :new.locked_on := sysdate;
    end if;
    --
    -- maintain log
    --
    if inserting then
        insert into wwv_flow_lock_script_log
            (flow_id, lock_id, script_id, action, lock_comment)
        values
            (:new.flow_id, :new.id, :new.script_id, 'LOCK', :new.lock_comment);
    end if;
    if updating then
        insert into wwv_flow_lock_script_log
            (flow_id, lock_id, script_id, action, lock_comment)
        values
            (:new.flow_id, :new.id, :new.script_id, 'UPDATE', :new.lock_comment);
    end if;
end;
/


prompt ...trigger wwv_flow_lock_script_t2

create or replace trigger wwv_flow_lock_script_t2
    before delete on wwv_flow_lock_script
    for each row
begin
    insert into wwv_flow_lock_script_log
        (flow_id, lock_id, script_id, action, lock_comment)
    values
        (:old.flow_id, :old.id, :old.script_id, 'UNLOCK', :old.lock_comment);
end;
/


prompt ...trigger wwv_flow_lock_script_log_t1

create or replace trigger wwv_flow_lock_script_log_t1
    before insert or update on wwv_flow_lock_script_log
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.locked_by := nvl(wwv_flow.g_user,user);
        :new.action_date := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_flash_charts_t1

create or replace trigger wwv_flow_flash_charts_t1
    before insert or update or delete on wwv_flow_flash_charts
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.chart_xml is not null then
            :new.chart_xml := replace (
                                  :new.chart_xml,
                                  wwv_flow.CR,
                                  null );
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_flash_chart_series_t1

create or replace trigger wwv_flow_flash_chart_series_t1
    before insert or update or delete on wwv_flow_flash_chart_series
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_flash_charts
                        where id = :new.chart_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
        end if;

        if :new.series_query is not null then
            :new.series_query := replace (
                                     :new.series_query,
                                     wwv_flow.CR,
                                     null );
        end if;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_flash_charts
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.chart_id, :old.chart_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_flash_charts_5_t1

create or replace trigger wwv_flow_flash_charts_5_t1
    before insert or update or delete on wwv_flow_flash_charts_5
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.chart_xml is not null then
            :new.chart_xml := replace (
                                  :new.chart_xml,
                                  wwv_flow.CR,
                                  null );
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_flash_5_series_t1

create or replace trigger wwv_flow_flash_5_series_t1
    before insert or update or delete on wwv_flow_flash_chart5_series
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_flash_charts_5
                        where id = :new.chart_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
        end if;

        if :new.series_query is not null then
            :new.series_query := replace (
                                     :new.series_query,
                                     wwv_flow.CR,
                                     null );
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_flash_charts_5
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.chart_id, :old.chart_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_standard_icons_t1

create or replace trigger wwv_flow_standard_icons_t1
    before insert or update on wwv_flow_standard_icons
    for each row
begin
    if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
    end if;
end;
/



prompt ...trigger wwv_flow_std_item_types_t1

create or replace trigger wwv_flow_std_item_types_t1
    before insert or update on wwv_flow_standard_item_types
    for each row
begin
    if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
    end if;
end;
/


--------------------------------------------
-- W E B S H E E T S

prompt ...trigger wwv_flow_ws_websheet_attr_t1

create or replace trigger wwv_flow_ws_websheet_attr_t1
    before insert or update on wwv_flow_ws_websheet_attr
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        if :new.websheet_owner is null then
           :new.websheet_owner := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    -- populate websheet alias
    if :new.websheet_alias is null then
        select wwv_seq.nextval
        into :new.websheet_alias
        from sys.dual;
    else
        :new.websheet_alias := upper(:new.websheet_alias);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_applications set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

--==============================================================================
prompt ...trigger wwv_flow_ws_applications_t1

create or replace trigger wwv_flow_ws_applications_t1
    before insert or update on wwv_flow_ws_applications
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    if :new.allow_public_access_yn is null then
        :new.allow_public_access_yn := 'N';
    end if;

    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;
    if inserting or :new.owner <> nvl(:old.owner, :new.owner) then
        for i in ( select min(case when schema = :new.owner then schema end) over () found_schema,
                          nvl (
                              min(case when is_apex$_schema = 'Y' then schema end) over (),
                              schema ) first_schema
                     from wwv_flow_company_schemas
                    where security_group_id = :new.security_group_id )
        loop
            if i.found_schema is null then
                wwv_flow_debug.trace (
                    'owner "%s" not found, reverting to "%s"',
                    :new.owner,
                    i.first_schema );
                :new.owner := i.first_schema;
            else
                wwv_flow_debug.trace (
                    'accepting owner change to "%s"',
                    i.found_schema );
                :new.owner := i.found_schema;
            end if;
            exit;
        end loop;
    end if;
    --
    -- set status
    --
    if :new.status is null then
        :new.status := 'AVAILABLE';
    end if;

    if :new.show_reset_passwd_yn is null then
        :new.show_reset_passwd_yn := 'Y';
    end if;

end;
/

--==============================================================================
prompt ...trigger wwv_flow_ws_app_so_t1

create or replace trigger wwv_flow_ws_app_so_t1
    before insert or update on wwv_flow_ws_app_sug_objects
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if substr(:new.object_name,1,1) != '"' then
        :new.object_name := upper(:new.object_name);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_applications set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_webpages_t1

create or replace trigger wwv_flow_ws_webpages_t1
    before insert or update on wwv_flow_ws_webpages
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.upper_name := upper(:new.name);

    -- populate page alias
    if :new.page_alias is null then
        select wwv_seq.nextval
        into :new.page_alias
        from sys.dual;
    else
        :new.page_alias := upper(:new.page_alias);
    end if;

    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_applications set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_col_val_t1

create or replace trigger wwv_flow_ws_col_val_t1
    before insert or update on wwv_flow_ws_col_validations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_websheet_attr set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.websheet_id and
            ws_app_id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_data_grid_q_t1

create or replace trigger wwv_flow_ws_data_grid_q_t1
    before insert or update on wwv_flow_ws_data_grid_q
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if :new.db_obj_found is null then
        :new.db_obj_found := 'N';
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

----------------------
-- W O R K S H E E T S

prompt ...trigger wwv_flow_worksheets_t1

create or replace trigger wwv_flow_worksheets_t1
    before insert or update or delete on wwv_flow_worksheets
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;


        if inserting and :new.internal_uid is null then
            :new.internal_uid := :new.id;
        end if;
        --
        -- set owner
        --
        if :new.owner is null then
            :new.owner := :new.created_by;
        end if;
        --
        -- set status
        --
        if :new.status is null then
            :new.status := 'AVAILABLE_FOR_OWNER';
        end if;
        --
        -- by default, reports show up as TABS
        --
        if inserting and :new.report_list_mode is null then
            :new.report_list_mode := 'TABS';
        end if;

        :new.SHOW_SELECT_COLUMNS       := nvl(:new.SHOW_SELECT_COLUMNS,'Y');
        :new.SHOW_ROWS_PER_PAGE        := nvl(:new.SHOW_ROWS_PER_PAGE,'Y');
        :new.SHOW_FILTER               := nvl(:new.SHOW_FILTER,'Y');
        :new.SHOW_CONTROL_BREAK        := nvl(:new.SHOW_CONTROL_BREAK,'Y');
        :new.SHOW_SORT                 := nvl(:new.SHOW_SORT,'Y');
        :new.SHOW_HIGHLIGHT            := nvl(:new.SHOW_HIGHLIGHT,'Y');
        :new.SHOW_AGGREGATE            := nvl(:new.SHOW_AGGREGATE,'Y');
        :new.SHOW_NOTIFY               := nvl(:new.SHOW_NOTIFY,'N');
        :new.SHOW_CHART                := nvl(:new.SHOW_CHART,'Y');
        :new.SHOW_GROUP_BY             := nvl(:new.SHOW_GROUP_BY,'Y');
        :new.SHOW_PIVOT                := nvl(:new.SHOW_PIVOT,'Y');
        :new.SHOW_CALENDAR             := nvl(:new.SHOW_CALENDAR,'Y');
        :new.SHOW_FLASHBACK            := nvl(:new.SHOW_FLASHBACK,'Y');
        :new.SHOW_RESET                := nvl(:new.SHOW_RESET,'Y');
        :new.SHOW_DOWNLOAD             := nvl(:new.SHOW_DOWNLOAD,'Y');
        :new.SHOW_COMPUTATION          := nvl(:new.SHOW_COMPUTATION,'Y');
        :new.SHOW_HELP                 := nvl(:new.SHOW_HELP,'Y');
        :new.SHOW_DETAIL_LINK          := nvl(:new.SHOW_DETAIL_LINK,'Y');
        :new.ALLOW_REPORT_SAVING       := nvl(:new.ALLOW_REPORT_SAVING,'Y');
        :new.ALLOW_SAVE_RPT_PUBLIC     := nvl(:new.ALLOW_SAVE_RPT_PUBLIC,'N');
        :new.ALLOW_REPORT_CATEGORIES   := nvl(:new.ALLOW_REPORT_CATEGORIES,'Y');
        :new.ALLOW_EXCLUDE_NULL_VALUES := nvl(:new.ALLOW_EXCLUDE_NULL_VALUES,'Y');
        :new.ALLOW_HIDE_EXTRA_COLUMNS  := nvl(:new.ALLOW_HIDE_EXTRA_COLUMNS,'Y');

        :new.SHOW_FINDER_DROP_DOWN     := nvl(:new.SHOW_FINDER_DROP_DOWN,'Y');
        :new.SHOW_DISPLAY_ROW_COUNT    := nvl(:new.SHOW_DISPLAY_ROW_COUNT,'N');
        :new.SHOW_SEARCH_BAR           := nvl(:new.SHOW_SEARCH_BAR,'Y');
        :new.SHOW_SEARCH_TEXTBOX       := nvl(:new.SHOW_SEARCH_TEXTBOX,'Y');
        :new.SHOW_ACTIONS_MENU         := nvl(:new.SHOW_ACTIONS_MENU,'Y');

        --
        -- maintain column values
        --
        if :new.flow_id is null then
           :new.flow_id := wwv_flow.g_flow_id;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress and :new.flow_id != 4900 then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress and coalesce( :new.region_id, :old.region_id ) is not null and :old.flow_id != 4900 then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_worksheets_t2

create or replace trigger wwv_flow_worksheets_t2
    before delete on wwv_flow_worksheets
begin
    wwv_flow_worksheet.g_delete_in_progress := true;
end;
/


prompt ...trigger wwv_flow_worksheets_t3

create or replace trigger wwv_flow_worksheets_t3
    after delete on wwv_flow_worksheets
begin
    wwv_flow_worksheet.g_delete_in_progress := false;
end;
/


prompt ...trigger wwv_flow_ws_categories_t1

create or replace trigger wwv_flow_ws_categories_t1
    before insert or update or delete on wwv_flow_worksheet_categories
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- display sequence
        --
        if inserting and :new.display_sequence is null then
            select nvl(max(display_sequence),0) + 1 into :new.display_sequence
              from wwv_flow_worksheet_categories
             where worksheet_id = :new.worksheet_id;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_col_groups_t1

create or replace trigger wwv_flow_ws_col_groups_t1
    before insert or update or delete on wwv_flow_worksheet_col_groups
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.display_sequence is null then
            :new.display_sequence := 10;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
            --
            if :new.flow_id = 4900 then
                update wwv_flow_ws_websheet_attr
                   set updated_on = sysdate,
                       updated_by = wwv_flow.g_user
                 where id                = :new.websheet_id
                   and security_group_id = :new.security_group_id;
            end if;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_lovs_t1

create or replace trigger wwv_flow_ws_lovs_t1
    before insert or update on wwv_flow_worksheet_lovs
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- update stamps
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- Update parent timestamp.
    -- This table is used on for Websheet, so update wwv_flow_ws_websheet_attr.
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_websheet_attr set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.websheet_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_lov_entries_t1

create or replace trigger wwv_flow_ws_lov_entries_t1
    before insert or update on wwv_flow_worksheet_lov_entries
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    --
    --
    if :new.display_sequence is null then
       :new.display_sequence := 10;
    end if;
    --
    -- update stamps
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_lovs
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.lov_id;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ws_columns_t1

create or replace trigger wwv_flow_ws_columns_t1
    before insert or update or delete on wwv_flow_worksheet_columns
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- default values
        --
        if :new.report_label is null then
            :new.report_label := :new.column_label;
        elsif :new.column_label is null then
            :new.column_label := :new.report_label;
        end if;

        if :new.is_sortable is null then
            :new.is_sortable := 'Y';
        end if;

        :new.allow_sorting      := nvl(:new.allow_sorting,'Y');
        :new.allow_filtering    := nvl(:new.allow_filtering,'Y');
        :new.allow_highlighting := nvl(:new.allow_highlighting,'Y');
        :new.allow_ctrl_breaks  := nvl(:new.allow_ctrl_breaks,'Y');
        :new.allow_aggregations := nvl(:new.allow_aggregations,'Y');
        :new.allow_computations := nvl(:new.allow_computations,'Y');
        :new.allow_charting     := nvl(:new.allow_charting,'Y');
        :new.allow_group_by     := nvl(:new.allow_group_by,'Y');
        :new.allow_pivot        := nvl(:new.allow_pivot,'Y');
        :new.allow_hide         := nvl(:new.allow_hide,'Y');

        if :new.display_text_as is null then
            :new.display_text_as := 'ESCAPE_SC';
        end if;
        if :new.heading_alignment is null then
            :new.heading_alignment := 'CENTER';
        end if;
        if :new.column_alignment is null then
            :new.column_alignment := 'LEFT';
        end if;
        if :new.rpt_show_filter_lov is null then
            :new.rpt_show_filter_lov := 'D';
        end if;
        if :new.rpt_filter_date_ranges is null then
            :new.rpt_filter_date_ranges := 'ALL';
        end if;

        --
        -- security columns
        --
        if :new.others_may_edit is null then
           :new.others_may_edit := 'Y';
        end if;
        if :new.others_may_view is null then
           :new.others_may_view := 'Y';
        end if;

        -- maintain distinct_value_filter
        if :new.display_as = 'TEXTAREA' and :new.rpt_distinct_lov is null then
           :new.rpt_distinct_lov := 'N';
        elsif :new.rpt_distinct_lov is null then
           :new.rpt_distinct_lov := 'Y';
        end if;

        -- use for prototype to get next available col, alter logic later to fill gaps
        if inserting and :new.db_column_name is null then
            :new.db_column_name := wwv_flow_worksheet_standard.get_next_db_column_name(:new.worksheet_id, :new.column_type);
        end if;
        if inserting and :new.display_order is null then
            :new.display_order := wwv_flow_worksheet_standard.get_next_display_order_number(:new.worksheet_id);
        end if;
        if inserting and :new.column_identifier is null then
           :new.column_identifier := wwv_flow_worksheet_standard.get_next_identifier(:new.worksheet_id);
        end if;
        --
        -- sync column headings
        --
        if :new.sync_form_label is null then
           :new.sync_form_label := 'Y';
        end if;
        if :new.sync_form_label = 'Y' then
           :new.column_label := :new.report_label;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress and not wwv_flow_worksheet.g_delete_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
            --
            if :new.flow_id = 4900 then
                update wwv_flow_ws_websheet_attr
                   set updated_on = sysdate,
                       updated_by = wwv_flow.g_user
                 where id                = :new.websheet_id
                   and security_group_id = :new.security_group_id;
            end if;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_rpts_t1

create or replace trigger wwv_flow_ws_rpts_t1
    before insert or update on wwv_flow_worksheet_rpts
    for each row
declare
    l_col_type varchar2(30);
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    if :new.application_user is null then
        :new.application_user := v('APP_USER');
    end if;
    if :new.status is null then
       :new.status := 'PRIVATE';
    end if;
    if :new.display_rows is null then
       :new.display_rows := 50;
    end if;
    if :new.flashback_enabled is null then
       :new.flashback_enabled := 'N';
    end if;
    if :new.report_seq is null then
       :new.report_seq := 10;
    end if;
    if :new.is_default is null then
        :new.is_default := 'N';
    end if;
    if :new.is_default = 'Y' and :new.status = 'PRIVATE' then
        :new.status := 'PUBLIC';
    end if;

    if :new.status = 'PRIVATE' then
        :new.report_alias := null;
    else
        -- populate report alias for base reports
        if :new.report_alias is null and :new.session_id is null then
            select wwv_seq.nextval
            into :new.report_alias
            from sys.dual;
        end if;
    end if;

    -- bug 10399772
    if :new.chart_aggregate = '0' then
        :new.chart_aggregate := null;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
    --
    if not wwv_flow.g_import_in_progress and :new.status <> 'PRIVATE' then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_conditions_t1

create or replace trigger wwv_flow_ws_conditions_t1
    before insert or update on wwv_flow_worksheet_conditions
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.enabled is null then
        :new.enabled := 'Y';
    end if;
    if inserting and :new.allow_delete is null then
        :new.allow_delete := 'Y';
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    if not wwv_flow.g_import_in_progress then
        --
        -- update parent timestamp
        --
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_computation_t1

create or replace trigger wwv_flow_ws_computation_t1
    before insert or update on wwv_flow_worksheet_computation
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if :new.db_column_name is null then
        :new.db_column_name := wwv_flow_worksheet_standard.get_next_computed_column_name(:new.worksheet_id, :new.report_id);
    end if;

    if :new.column_identifier is null then
        :new.column_identifier := wwv_flow_worksheet_standard.get_next_computed_identifier(:new.worksheet_id, :new.report_id);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_group_by_t1

create or replace trigger wwv_flow_ws_group_by_t1
    before insert or update on wwv_flow_worksheet_group_by
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if :new.function_01 is not null and :new.function_column_01 is not null then
        :new.function_db_column_name_01 := nvl(:new.function_db_column_name_01,'APXWS_GBFC_01');
    end if;
    if :new.function_02 is not null and :new.function_column_02 is not null then
        :new.function_db_column_name_02 := nvl(:new.function_db_column_name_02,'APXWS_GBFC_02');
    end if;
    if :new.function_03 is not null and :new.function_column_03 is not null then
        :new.function_db_column_name_03 := nvl(:new.function_db_column_name_03,'APXWS_GBFC_03');
    end if;
    if :new.function_04 is not null and :new.function_column_04 is not null then
        :new.function_db_column_name_04 := nvl(:new.function_db_column_name_04,'APXWS_GBFC_04');
    end if;
    if :new.function_05 is not null and :new.function_column_05 is not null then
        :new.function_db_column_name_05 := nvl(:new.function_db_column_name_05,'APXWS_GBFC_05');
    end if;
    if :new.function_06 is not null and :new.function_column_06 is not null then
        :new.function_db_column_name_06 := nvl(:new.function_db_column_name_06,'APXWS_GBFC_06');
    end if;
    if :new.function_07 is not null and :new.function_column_07 is not null then
        :new.function_db_column_name_07 := nvl(:new.function_db_column_name_07,'APXWS_GBFC_07');
    end if;
    if :new.function_08 is not null and :new.function_column_08 is not null then
        :new.function_db_column_name_08 := nvl(:new.function_db_column_name_08,'APXWS_GBFC_08');
    end if;
    if :new.function_09 is not null and :new.function_column_09 is not null then
        :new.function_db_column_name_09 := nvl(:new.function_db_column_name_09,'APXWS_GBFC_09');
    end if;
    if :new.function_10 is not null and :new.function_column_10 is not null then
        :new.function_db_column_name_10 := nvl(:new.function_db_column_name_10,'APXWS_GBFC_10');
    end if;
    if :new.function_11 is not null and :new.function_column_11 is not null then
        :new.function_db_column_name_11 := nvl(:new.function_db_column_name_11,'APXWS_GBFC_11');
    end if;
    if :new.function_12 is not null and :new.function_column_12 is not null then
        :new.function_db_column_name_12 := nvl(:new.function_db_column_name_12,'APXWS_GBFC_12');
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

prompt ...trigger wwv_flow_worksheet_notify_t1

create or replace trigger wwv_flow_worksheet_notify_t1
    before insert or update on wwv_flow_worksheet_notify
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress
       and not wwv_flow_worksheet.g_notify_in_progress
    then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_pivot_t1

create or replace trigger wwv_flow_ws_pivot_t1
    before insert or update on wwv_flow_worksheet_pivot
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_pivot_agg_t1

create or replace trigger wwv_flow_ws_pivot_agg_t1
    before insert or update on wwv_flow_worksheet_pivot_agg
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_pivot
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.pivot_id;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_pivot_sort_t1

create or replace trigger wwv_flow_ws_pivot_sort_t1
    before insert or update on wwv_flow_worksheet_pivot_sort
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_pivot
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.pivot_id;
    end if;
end;
/


prompt ...trigger wwv_flow_app_groups_t1

create or replace trigger wwv_flow_app_groups_t1
    before insert or update on wwv_flow_application_groups
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
end;
/


prompt ...trigger wwv_flow_dict_views_t1

create or replace trigger wwv_flow_dict_views_t1
    before insert or update on wwv_flow_dictionary_views
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_adv_cat_t1

create or replace trigger wwv_flow_adv_cat_t1
    before insert or update on wwv_flow_advisor_categories
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_adv_chk_t1

create or replace trigger wwv_flow_adv_chk_t1
    before insert or update on wwv_flow_advisor_checks
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_adv_chk_msg_t1

create or replace trigger wwv_flow_adv_chk__msg_t1
    before insert or update on wwv_flow_advisor_check_msgs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_plugins_t1

create or replace trigger wwv_flow_plugins_t1
    before insert or update or delete on wwv_flow_plugins
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- set name
        :new.name := upper(:new.name);

        -- not set by "Create Plug-In" on 4000:4410 that's why we have to default it
        :new.substitute_attributes := nvl(:new.substitute_attributes, 'Y');
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_attributes_t1

create or replace trigger wwv_flow_plugin_attributes_t1
    before insert or update or delete on wwv_flow_plugin_attributes
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- delete values when it's no select list anymore
        if updating and :old.attribute_type = 'SELECT LIST' and :new.attribute_type <> 'SELECT LIST' then
            delete wwv_flow_plugin_attr_values
             where plugin_attribute_id = :old.id;
        end if;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_attr_values_t1

create or replace trigger wwv_flow_plugin_attr_values_t1
    before insert or update or delete on wwv_flow_plugin_attr_values
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_plugin_attributes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_attribute_id, :old.plugin_attribute_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_files_t1

create or replace trigger wwv_flow_plugin_files_t1
    before insert or update or delete on wwv_flow_plugin_files
    for each row
declare
    l_files_version_increment number;
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        -- audit
        -- Note: always set change attributes so that the caching of files works
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        if deleting then
            l_files_version_increment := 0;
        else
            l_files_version_increment := 1;
        end if;
        --
        begin
            update wwv_flow_plugins
               set files_version   = files_version + l_files_version_increment,
                   last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
prompt ...trigger wwv_flow_plugin_files_t2
create or replace trigger wwv_flow_plugin_files_t2
    after insert or update on wwv_flow_plugin_files
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/



prompt ...trigger wwv_flow_plugin_events_t1

create or replace trigger wwv_flow_plugin_events_t1
    before insert or update or delete on wwv_flow_plugin_events
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        :new.name := lower(:new.name);
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_plugin_settings_t1

create or replace trigger wwv_flow_plugin_settings_t1
    before insert or update or delete on wwv_flow_plugin_settings
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_da_stnd_events_t1

create or replace trigger wwv_flow_da_stnd_events_t1
    before insert or update on wwv_flow_standard_events
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/



prompt ...trigger wwv_flow_page_da_events_t1

create or replace trigger wwv_flow_page_da_events_t1
    before insert or update or delete on wwv_flow_page_da_events
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;


        -- Populate triggering_condition_type when event type, or selection type only support
        -- a condition type of js_expression, and where triggering_expression is not null (bug #9733317)
        if :new.triggering_expression is not null then
            if   :new.bind_event_type in ( 'apexbeforepagesubmit', 'unload', 'resize', 'ready', 'orientationchange' )
              or :new.triggering_element_type in ( 'REGION', 'BUTTON' )
            then
                :new.triggering_condition_type := 'JAVASCRIPT_EXPRESSION';
            end if;
        elsif :new.triggering_condition_type not in ( 'NULL', 'NOT_NULL' ) then
            :new.triggering_condition_type := null;
        end if;

        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.page_id, :old.page_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_page_da_actions_t1

create or replace trigger wwv_flow_page_da_actions_t1
    before insert or update or delete on wwv_flow_page_da_actions
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            -- for the wwv_flow_page_da_actions table
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_da_events
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.event_id, :old.event_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/




prompt ...trigger wwv_flow_workspace_summary_t1

create or replace trigger wwv_flow_workspace_summary_t1
    before insert or update on wwv_flow_workspace_summary
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/


prompt ...trigger wwv_flow_feedback_t1

create or replace trigger  wwv_flow_feedback_t1
before insert or update on wwv_flow_feedback
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        if nvl(:new.APPLICATION_ID,0) >= 4000 and nvl(:new.application_id,0) <= 4999 then
           :new.security_group_id := 10;
        else
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;

    if :new.logging_security_group_id is null then
       :new.logging_security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if :new.logged_by_workspace_name is null then
       for c1 in (select short_name from WWV_FLOW_COMPANIES where PROVISIONING_COMPANY_ID = :new.logging_security_group_id) loop
           :new.logged_by_workspace_name := c1.short_name;
       end loop;
    end if;

    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_by := wwv_flow.g_user;
            :new.created_on := current_timestamp;
        end if;
       :new.updated_by := wwv_flow.g_user;
       :new.updated_on := current_timestamp;
    end if;

    -- set feedback ID
	if :new.feedback_id is null and inserting and :new.application_id is not null then
	    select nvl(max(feedback_id),0) + 1 into :new.feedback_id
	    from wwv_flow_feedback
	    where security_group_id = (select security_group_id from wwv_flows where id = :new.application_id);
	end if;
	--
	-- TAG
	--
	wwv_flow_utilities.wwv_flow_team_tag_sync (
	       p_component_type    => 'FEEDBACK',
	       p_component_id      => :new.id,
	       p_new_tags          => rtrim(trim(:new.TAGS),','),
	       p_security_group_id => :new.security_group_id);

end wwv_flow_feedback_t1;
/
show errors
ALTER TRIGGER  wwv_flow_feedback_T1 ENABLE
/


create or replace trigger wwv_flow_feedback_t2
after delete on wwv_flow_feedback
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
	      delete from wwv_flow_team_tags where component_id = :old.id;
	  end if;
end wwv_flow_feedback_t2;
/


create or replace trigger  wwv_flow_feedback_fup_t1
before insert or update on wwv_flow_feedback_followup
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting and not wwv_flow.g_import_in_progress then
       :new.created_by := coalesce(:new.created_by, wwv_flow.g_user, user);
       :new.created_on := coalesce(:new.created_on, current_timestamp);
       :new.updated_by := coalesce(:new.updated_by, wwv_flow.g_user, user);
       :new.updated_on := coalesce(:new.updated_on, current_timestamp);
    elsif updating and not wwv_flow.g_import_in_progress then
       :new.updated_by := coalesce(wwv_flow.g_user, user);
       :new.updated_on := current_timestamp;
    end if;
end wwv_flow_feedback_fup_t1;
/
show errors
ALTER TRIGGER  wwv_flow_feedback_fup_T1 ENABLE
/



create or replace trigger wwv_purge_workspaces_trg1
    before insert or update on wwv_purge_workspaces
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
        --
        if :new.status is null then
            :new.status := 'NEW';
        end if;
        --
        :new.created_ts := systimestamp;
        :new.updated_ts := :new.created_ts;
    else
        :new.updated_ts := systimestamp;
    end if;

end;
/

create or replace trigger wwv_purge_log_trg1
    before insert on wwv_purge_log
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/


create or replace trigger wwv_purge_emails_trg1
    before insert on wwv_purge_emails
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/

create or replace trigger wwv_purge_workspace_resp_trg1
    before insert on wwv_purge_workspace_responses
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/


create or replace trigger wwv_purge_datafiles_trg1
    before insert on wwv_purge_datafiles
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
    if :new.status is null then
        :new.status := 'NOT_EVAL';
    end if;
end;
/


create or replace trigger wwv_purge_schemas_trg1
    before insert on wwv_purge_schemas
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
    if :new.status is null then
        :new.status := 'NOT_EVAL';
    end if;
end;
/



prompt ...trigger wwv_flow_authorized_urls_t1

create or replace trigger wwv_flow_authorized_urls_t1
    before insert or update on wwv_flow_authorized_urls
    for each row
begin
    -- normalize the case of the entire URL
    :new.url := trim(lower(:new.url));
    if :new.url is not null then
        :new.url_md5 := wwv_flow_crypto.hash_raw (
                            p_src      => :new.url,
                            p_function => wwv_flow_crypto.c_hash_sh1 );
    end if;

    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := :new.created_on;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    --
    -- last updated
    --
    if updating then
        :new.last_updated_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
end;
/

prompt ...trigger wwv_flow_load_tables_t1

create or replace trigger wwv_flow_load_tables_t1
    before insert or update or delete on wwv_flow_load_tables
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_loadtab_lookups_t1

create or replace trigger wwv_flow_loadtab_lookups_t1
    before insert or update or delete on wwv_flow_load_table_lookups
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_load_tables
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.load_table_id, :old.load_table_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_loadtab_rules_t1

create or replace trigger wwv_flow_loadtab_rules_t1
    before insert or update or delete on wwv_flow_load_table_rules
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_load_tables
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.load_table_id, :old.load_table_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

create or replace trigger wwv_flow_auto_file_del_log_t1
    before insert on wwv_flow_auto_file_delete_log
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    :new.deleted_on := sysdate;
end;
/

prompt ...done create triggers
