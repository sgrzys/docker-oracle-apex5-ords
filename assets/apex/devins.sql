Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      devins.sql
Rem
Rem    DESCRIPTION
Rem      This is the development installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by apexins.sql or apxdvins.sql.
Rem
Rem    NOTES
Rem      Ensure that all arguments (except image prefix) are entered in UPPERCASE.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    Arguments:
Rem      1 - LOG1      = Installation log file
Rem      2 - UPGRADE   = Upgrade flag (1 = NO, 2 = YES)
Rem      3 - APPUN     = APEX schema name
Rem      4 - TEMPTBL   = Temporary tablespace
Rem      5 - IMGPR     = Image prefix
Rem      6 - DATTS     = APEX tablespace
Rem      7 - FF_TBLS   = APEX files tablespace
Rem      8 - ADM_PWD   = APEX administrator password
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   06/26/2007 - Created
Rem      jstraub   09/14/2007 - Added calls to drop_private_synonyms and create_private_synonyms and removed spool off
Rem      jstraub   09/17/2007 - Removed 4155 from devins, moved to coreins
Rem      jkallman  11/21/2007 - Add wwv_flow_theme_19 and wwv_flow_theme_20
Rem      jstraub   11/26/2007 - Added running core_grants.sql
Rem      jkallman  12/13/2007 - Moved wwv_flow_theme_1-20.* to coreins.sql (dependencies in wwv_flow_theme_manager)
Rem      jstraub   12/18/2007 - Removed wwv_flow_hint.*, already compiled in coreins.sql (Bug 6651448)
Rem      jstraub   01/08/2008 - Added apex_ui_default_update.*
Rem      jstraub   01/11/2008 - Added apex_mig_projects_update.*
Rem      jstraub   01/11/2008 - Added mig_views.sql
Rem      jkallman  01/25/2008 - Removed compilation of creat_flow_api.*
Rem      jkallman  02/04/2008 - Add compilation of schema before grant_public_synonyms
Rem      jstraub   07/11/2008 - Added f4900.sql
Rem      jkallman  09/11/2008 - Add Forms Migration scripts
Rem      jkallman  10/11/2008 - Added f4200.sql
Rem      mhichwa   10/15/2008 - Mondernized prompts and comments to apex and not flows
Rem      hfarrell  02/19/2009 - Removed wwv_mig_frm_load.sql. Added wwv_mig_frm_load_xml.*, wwv_mig_frm_olb_load_xml.*, wwv_mig_frmmenu_load_xml.*, wwv_mig_rpt_load_xml.*
Rem      pawolf    03/27/2009 - Added Advisor files
Rem      jkallman  03/31/2009 - Added compile_schema before wwv_flow_upgrade.drop_private_synonyms
Rem      jstraub   05/13/2009 - Added wwv_flow_4000_ui.*, wwv_flow_4050_ui.*
Rem      pawolf    05/25/2009 - Added wwv_flow_search
Rem      pawolf    06/09/2009 - Removed wwv_flow_advisor
Rem      jkallman  06/11/2009 - Added compile of wwv_flow_assert before call to wwv_flow_upgrade.* (Bug 8399978)
Rem      jkallman  07/27/2009 - Added compile_schema before wwv_flow_upgrade.drop_private_synonyms
Rem      jkallman  07/27/2009 - Added wwv_flow_install_wizard
Rem      jkallman  08/03/2009 - Added wwv_flow_translation_utilities.plb
Rem      pawolf    08/26/2009 - Added wwv_flow_dictionary and wwv_flow_advisor
Rem      arayner   09/11/2009 - Added f4800.sql
Rem      arayner   09/11/2009 - Added f4600.sql
Rem      pawolf    09/21/2009 - Removed advisor_views.sql
Rem      jstraub   09/21/2009 - Added team_tab.sql, wwv_flow_team.*
Rem      pawolf    09/28/2009 - Added wwv_flow_plugin_f4000
Rem      pawolf    10/01/2009 - Added wwv_flow_f4000_plugins
Rem      jkallman  10/06/2009 - Added missing wwv_flow_workspace_reports.*
Rem      jkallman  12/01/2009 - Removed f4200.sql
Rem      pawolf    12/02/2009 - Added wwv_flow_f4000_p4150.*
Rem      jkallman  12/16/2009 - Added wwv_demo_tab.sql
Rem      pawolf    02/27/2010 - Added missing wwv_flow_team_api.*
Rem      pawolf    04/15/2010 - Added wwv_flow_team_gen_api
Rem      jstraub   06/10/2010 - Removed invoking endins.sql, moved to coreins.sql (bug 9797996)
Rem      jstraub   10/12/2010 - Moved wwv_flow_f4000_util.* and wwv_flow_plugin_f4000.* to coreins.sql (bug 10104409)
Rem      jkallman  03/21/2011 - Added f4850.sql
Rem      jkallman  04/08/2011 - Set internal cookie name after applications are installed
Rem      jkallman  04/12/2011 - Compile body of wwv_flow_assert, wwv_flow_security before calling wwv_flow_security.set_internal_cookie_name
Rem      jkallman  05/23/2011 - Remove wwv_flow_help.*
Rem      jkallman  07/02/2011 - Move wwv_flow_install_wizard to coreins.sql
Rem      hfarrell  07/05/2011 - Removed calls to collections_showcase.sql and .plb, as no longer required for Collections Showcase install
Rem                             Added apex_install_sample_apps.sql for installation of sample applications
Rem      hfarrell  07/06/2011 - Moved apex_install_sample_apps.sql call to end of file, due to dependency on existence of f4900 for sample Websheet apps
Rem      cbcho     10/24/2011 - Added entries to install packaged application objects
Rem      pawolf    01/26/2012 - Added apex_sys_all_views.sql (bug 13500701)
Rem      jkallman  01/27/2012 - Correct reference from sys_all_view.sql to sys_all_views.sql
Rem      pawolf    02/27/2012 - Renamed packages wwv_flow_advisor to wwv_flow_advisor_dev, wwv_flow_dictionary to wwv_flow_dictionary_dev and wwv_flow_search to wwv_flow_builder_search_dev
Rem      cneumuel  02/29/2012 - Removed calls to wwv_flow_upgrade.{drop_private_synonyms,create_private_synonyms}
Rem      pawolf    03/12/2012 - Added dev_views.sql
Rem      pawolf    03/12/2012 - Added wwv_flow_user_interface_dev.*
Rem      pawolf    03/13/2012 - Added wwv_flow_page_dev.* and wwv_flow_theme_dev.*
Rem      pawolf    03/16/2012 - Added wwv_flow_dev.* and wwv_flow_template_dev.*
Rem      pawolf    03/20/2012 - Moved wwv_flow_upgrade_app.* to devins.sql
Rem      pawolf    03/20/2012 - Added wwv_flow_calendar_dev.*
Rem      cbcho     03/30/2012 - Added wwv_flow_pkg_app_ui.*
Rem      cneumuel  04/03/2012 - Moved wwv_flow_pkg_app_install.plb and wwv_flow_pkg_app_ui.plb down
Rem      vuvarov   04/27/2012 - Removed copy_button, copy_item, copy_lov procedures
Rem      hfarrell  05/21/2012 - Resolved path to install_packaged_apps.sql script
Rem      pawolf    05/24/2012 - Added wwv_flow_grid_layout_dev.*
Rem      hfarrell  05/24/2012 - Moved invoking of wwv_flow_pkg_app_tab_load.sql to be after installation of Packaged Applications
Rem      hfarrell  05/25/2012 - Added wwv_flow_pkg_app_api.* (feature #922)
Rem      jkallman  05/30/2012 - Moved wwv_flow_pkg_app_tab.sql to coreins.sql
Rem      pawolf    06/21/2012 - Moved apex_sys_all_views.sql into coreins.sql (bug# 14227074)
Rem      pawolf    06/26/2012 - Moved wwv_flow_create_app_from_query.* and wwv_flow_authentication_dev.* to devins.sql
Rem      pawolf    07/04/2012 - Added wwv_flow_ui_type_dev.* (feature #827)
Rem      vuvarov   07/13/2012 - Moved apex_sys_all_views.sql back (bug 14227074)
Rem      jstraub   07/24/2012 - Moved application installs to appins.sql
Rem      cneumuel  07/31/2012 - Added wwv_flow_advisor_checks_api* (feature #514)
Rem      jstraub   08/22/2012 - Aligned timing start/stops
Rem      cneumuel  12/12/2012 - Removed wwv_flow_calendar_dev.* and wwv_flow_page_dev.*, since they are in coreins.sql
Rem      vuvarov   03/01/2013 - Removed core_grants.sql
Rem      pawolf    04/11/2013 - Removed package wwv_flow_theme_files and moved code to wwv_flow_theme_manager
Rem      pawolf    05/21/2013 - Added wwv_flow_property_dev.*
Rem      cneumuel  06/21/2013 - Added wwv_flow_authentication_f4900.*
Rem      cbcho     08/19/2013 - Added wwv_flow_pkg_app_parser.* (feature #1257)
Rem      cneumuel  11/20/2013 - Moved wwv_flow_team.sql before team_tab.sql
Rem      vuvarov   02/03/2014 - Removed wwv_flow_item_comps.sql
Rem      vuvarov   02/24/2014 - Moved wwv_flow_pkg_app_parser to coreins.sql
Rem      vuvarov   03/12/2014 - Removed duplicate wwv_flow_translation_utilities.{sql,plb}, commented out packages that are
Rem                             temporarily installed in coreins.sql
Rem      pawolf    04/23/2014 - Removed wwv_flow_f4000_p4150.*
Rem      cneumuel  05/23/2014 - Added wwv_flow_advisor_checks_int.* (feature #1432)
Rem      jkallman  06/10/2014 - Removed wwv_demo_tab.sql
Rem      cneumuel  07/14/2014 - Added wwv_flow_error_dev.* (bug #13019649)
Rem      vuvarov   08/08/2014 - Moved wwv_flow_cloud_db_services.* from coreins.sql
Rem      pmanirah  09/24/2014 - Added wwv_flow_css_calendar_dev.sql/plb
Rem      jstraub   06/15/2015 - Removed wwv_flow_drag_layout.* (bug 17780152)

set define '^'
set concat on
set concat .
set verify off

define LOG1      = '^1'
define UPGRADE   = '^2'
define APPUN     = '^3'
define TEMPTBL   = '^4'
define IMGPR     = '^5'
define DATTS     = '^6'
define FF_TBLS   = '^7'
define ADM_PWD   = '^8'
define PREFIX    = '^9'


set termout on

timing start "Development Installation"

alter session set current_schema = SYS;

prompt I.    O R A C L E   S Y S   I N S T A L L   P R O C E S S

@^PREFIX.core/dev_grants.sql


prompt ...CONNECT as the Oracle user who will own the APEX engine

alter session set current_schema = ^APPUN;

timing start "Development Package Specs"
prompt  III.   I N S T A L L   A P E X   P A C K A G E   S P E C S

@^PREFIX.core/wwv_flow_plsql_editor.sql
@^PREFIX.core/wwv_flow_model_api.sql
@^PREFIX.core/wwv_flow_image_generator.sql

prompt Installing SYS view wrappers
@^PREFIX.core/apex_sys_all_views.sql

prompt Installing Team Development objects
@^PREFIX.core/wwv_flow_team.sql
@^PREFIX.core/team_tab.sql
@^PREFIX.core/wwv_flow_team_api.sql
@^PREFIX.core/wwv_flow_team_gen_api.sql

prompt Installing Application Migration Workshop objects
@^PREFIX.core/wwv_mig_create_ddl.sql
@^PREFIX.core/wwv_mig_frm_create_ddl.sql
@^PREFIX.core/wwv_mig_exporter_ins.sql

@^PREFIX.core/mig_views.sql

prompt ...installing Application Migration Workshop package spec
@^PREFIX.core/wwv_mig_acc_load.sql
@^PREFIX.core/wwv_mig_frm_load_xml.sql
@^PREFIX.core/wwv_mig_frm_olb_load_xml.sql
@^PREFIX.core/wwv_mig_frm_update_apx_app.sql
@^PREFIX.core/wwv_mig_frm_utilities.sql
@^PREFIX.core/wwv_mig_frmmenu_load_xml.sql
@^PREFIX.core/wwv_mig_rpt_load_xml.sql

prompt ...install Application Migration Workshop package body
@^PREFIX.core/wwv_mig_acc_load.plb
@^PREFIX.core/wwv_mig_frm_load_xml.plb
@^PREFIX.core/wwv_mig_frm_olb_load_xml.plb
@^PREFIX.core/wwv_mig_frm_update_apx_app.plb
@^PREFIX.core/wwv_mig_frm_utilities.plb
@^PREFIX.core/wwv_mig_frmmenu_load_xml.plb
@^PREFIX.core/wwv_mig_rpt_load_xml.plb


prompt ...installing Packaged Application package spec
@^PREFIX.core/wwv_flow_pkg_app_install.sql
@^PREFIX.core/wwv_flow_pkg_app_ui.sql
@^PREFIX.core/wwv_flow_pkg_app_api.sql

@^PREFIX.core/wwv_flow_upgrade_app.sql
@^PREFIX.core/wwv_flow_translation_utilities.sql
@^PREFIX.core/copy.sql
@^PREFIX.core/seed.sql
@^PREFIX.core/sync.sql
@^PREFIX.core/layout.sql
@^PREFIX.core/wwv_lov_used_on_pages.sql
@^PREFIX.core/wwv_flow_query_builder.sql
@^PREFIX.core/wwv_flow_sw_object_feed.sql
@^PREFIX.core/wwv_flow_load_data.sql
@^PREFIX.core/wwv_flow_load_excel_data.sql
@^PREFIX.core/copy_metadata.sql
@^PREFIX.core/copyu.sql
@^PREFIX.core/wwv_flow_tab_mgr.sql
@^PREFIX.core/generate_ddl.sql
@^PREFIX.core/table_drill.sql
@^PREFIX.core/wwv_flow_download.sql
@^PREFIX.core/wwv_flow_copy_page.sql
@^PREFIX.core/generate_table_api.sql
@^PREFIX.core/wwv_flow_gen_hint.sql
@^PREFIX.core/wwv_flow_xliff.sql
@^PREFIX.core/wwv_flow_create_model_app.sql
@^PREFIX.core/apex_admin.sql
@^PREFIX.core/wwv_flow_data_quick_flow.sql
@^PREFIX.core/wwv_flow_session_mon.sql
@^PREFIX.core/wwv_flow_sw_page_calls.sql
@^PREFIX.core/wwv_flow_wiz_confirm.sql
@^PREFIX.core/wwv_flow_page_map.sql
@^PREFIX.core/wwv_flow_dataload_xml.sql
@^PREFIX.core/apex_ui_default_update.sql
@^PREFIX.core/apex_mig_projects_update.sql
@^PREFIX.core/wwv_flow_dictionary_dev.sql
@^PREFIX.core/wwv_flow_advisor_checks_api.sql
@^PREFIX.core/wwv_flow_advisor_checks_int.sql
@^PREFIX.core/wwv_flow_advisor_dev.sql
@^PREFIX.core/wwv_flow_builder_search_dev.sql
@^PREFIX.core/wwv_flow_f4000_plugins.sql
@^PREFIX.core/wwv_flow_4000_ui.sql
@^PREFIX.core/wwv_flow_4050_ui.sql
@^PREFIX.core/wwv_flow_workspace_reports.sql
@^PREFIX.core/wwv_flow_create_app_from_query.sql
@^PREFIX.core/wwv_flow_ui_type_dev.sql
@^PREFIX.core/wwv_flow_dev.sql
Rem TODO: Commented out temporarily while these packages are installed in coreins.sql
Rem @^PREFIX.core/wwv_flow_user_interface_dev.sql
Rem @^PREFIX.core/wwv_flow_theme_dev.sql
Rem @^PREFIX.core/wwv_flow_template_dev.sql
@^PREFIX.core/wwv_flow_grid_layout_dev.sql
@^PREFIX.core/wwv_flow_dynamic_action_dev.sql
@^PREFIX.core/wwv_flow_authentication_dev.sql
@^PREFIX.core/wwv_flow_authentication_f4900.sql
@^PREFIX.core/wwv_flow_error_dev.sql
@^PREFIX.core/wwv_flow_property_dev.sql
@^PREFIX.core/wwv_flow_cloud_db_services.sql
@^PREFIX.core/wwv_flow_css_calendar_dev.sql

prompt ...installing dev views
@^PREFIX.core/dev_views.sql

timing stop

timing start "Development Package Bodies"

@^PREFIX.core/wwv_flow_upgrade_app.plb
@^PREFIX.core/wwv_flow_plsql_editor.plb
@^PREFIX.core/wwv_flow_model_api.plb
@^PREFIX.core/wwv_flow_image_generator.plb
@^PREFIX.core/layout.plb
@^PREFIX.core/wwv_flow_query_builder.plb
@^PREFIX.core/wwv_flow_sw_object_feed.plb
@^PREFIX.core/wwv_flow_load_data.plb
@^PREFIX.core/wwv_flow_load_excel_data.plb
@^PREFIX.core/copy_metadata.plb
@^PREFIX.core/copyu.plb
@^PREFIX.core/wwv_flow_tab_mgr.plb
@^PREFIX.core/generate_ddl.plb
@^PREFIX.core/table_drill.plb
@^PREFIX.core/wwv_flow_download.plb
@^PREFIX.core/wwv_flow_copy_page.plb
@^PREFIX.core/generate_table_api.plb
@^PREFIX.core/wwv_flow_gen_hint.plb
@^PREFIX.core/wwv_flow_translation_utilities.plb
@^PREFIX.core/wwv_flow_xliff.plb
@^PREFIX.core/wwv_flow_create_model_app.plb
@^PREFIX.core/wwv_flow_data_quick_flow.plb
@^PREFIX.core/wwv_flow_session_mon.plb
@^PREFIX.core/wwv_flow_sw_page_calls.plb
@^PREFIX.core/wwv_flow_wiz_confirm.plb
@^PREFIX.core/wwv_flow_page_map.plb
@^PREFIX.core/wwv_flow_dataload_xml.plb
@^PREFIX.core/apex_ui_default_update.plb
@^PREFIX.core/apex_mig_projects_update.plb
@^PREFIX.core/wwv_flow_dictionary_dev.plb
@^PREFIX.core/wwv_flow_advisor_checks_api.plb
@^PREFIX.core/wwv_flow_advisor_checks_int.plb
@^PREFIX.core/wwv_flow_advisor_dev.plb
@^PREFIX.core/wwv_flow_builder_search_dev.plb
@^PREFIX.core/wwv_flow_f4000_plugins.plb
@^PREFIX.core/wwv_flow_4000_ui.plb
@^PREFIX.core/wwv_flow_4050_ui.plb
@^PREFIX.core/wwv_flow_team.plb
@^PREFIX.core/wwv_flow_team_api.plb
@^PREFIX.core/wwv_flow_team_gen_api.plb
@^PREFIX.core/wwv_flow_workspace_reports.plb
@^PREFIX.core/wwv_flow_create_app_from_query.plb
@^PREFIX.core/wwv_flow_ui_type_dev.plb
@^PREFIX.core/wwv_flow_dev.plb
Rem TODO: Commented out temporarily while these packages are installed in coreins.sql
Rem @^PREFIX.core/wwv_flow_user_interface_dev.plb
Rem @^PREFIX.core/wwv_flow_theme_dev.plb
Rem @^PREFIX.core/wwv_flow_template_dev.plb
@^PREFIX.core/wwv_flow_grid_layout_dev.plb
@^PREFIX.core/wwv_flow_dynamic_action_dev.plb
@^PREFIX.core/wwv_flow_authentication_dev.plb
@^PREFIX.core/wwv_flow_authentication_f4900.plb
@^PREFIX.core/wwv_flow_error_dev.plb
@^PREFIX.core/wwv_flow_property_dev.plb
@^PREFIX.core/wwv_flow_cloud_db_services.plb
@^PREFIX.core/wwv_flow_css_calendar_dev.plb

prompt ...install Packaged Application package body
@^PREFIX.core/wwv_flow_pkg_app_install.plb
@^PREFIX.core/wwv_flow_pkg_app_ui.plb
@^PREFIX.core/wwv_flow_pkg_app_api.plb

timing stop

timing stop
