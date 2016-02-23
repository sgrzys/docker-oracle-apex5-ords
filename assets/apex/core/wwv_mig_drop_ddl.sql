Rem
Rem $Header: Access_Exporter_Schema.sql 01-September-2005.11:44:01
Rem
Rem Access_Exporter_Schema.sql
Rem
Rem Copyright (c) 2001, 2005, Oracle Corporation.  All rights reserved.
Rem
Rem    NAME
Rem      WWV_FLOW_MIG_DROP_DDL.sql - Create objects
Rem
Rem    DESCRIPTION
Rem     This will clean the Schema that was used for creating the schema needed
Rem     to migrate Access to HTMLDB.
Rem
Rem    NOTES
Rem     Draft Version
Rem
Rem    CREATED by MTG  - 15/09/05
Rem
Rem    MODIFIED     (MM/DD/YY) Comments
Rem     snandava       15/09/2005 - Created
Rem     snandava       18/10/2005 - Added drop statements for additional tables
Rem     ddaly          13/12/2005 - Added drop statement for wwv_mig_exporter
Rem     snandava       22/12/2005 - Added drop statement for wwv_mig_rev_tables
Rem     hfarrell       25/04/2006 - Added drop statement for wwv_mig_rev_queries
Rem                                       Added drop statement for public synonyms
Rem                                       Added drop statement for procedure wwv_mig_acc_util
Rem     hfarrell       21/06/2006 - Added "wwv_mig_rev_reports" procedure and dropped public synonyms
Rem     hfarrell       28/08/2006 - Added drop statement for wwv_mig_rev_forms
Rem     hfarrell       09/10/2006 - Added drop statement for wwv_mig_rev_apexapp
Rem     jstraub        16/11/2006 - Added drop statement for synonym wwv_mig_acc_load, remove system messages, and 4500 region, list
Rem     jstraub        21/11/2006 - Added dropping 4400 to support as a removal script
Rem     jkallman       08/02/2007 - Remove any deletes from 4500 and 4411, as this will be called from devremov.sql
Rem     hfarrell       26/10/2007 - Added drop statement for wwv_mig_reserved_words
Rem     hfarrell       23/10/2008 - Added drop statements for Forms Migrations tables
Rem     hfarrell       23/10/2008 - Added drop package statement for Object Libraries package wwv_mig_frm_olb_load_xml
Rem     ashiverm       27/10/2008 - Updated table name from wwv_mig_olb_cg_compounttext to wwv_mig_olb_cg_compoundtext (t to d, in compound)
Rem                                         wwv_mig_olb_olt_visualattribute to wwv_mig_olb_olt_visualattrbute
Rem                                         wwv_mig_olb_olt_windows to wwv_mig_olb_olt_window
Rem     ashiverm       31/10/2008 - Added drop statement for wwv_mig_frm_blk_dsa, wwv_mig_frm_fmb_menu, wwv_mig_frm_report
Rem                                 Updated table name from wwv_mig_frm_blk_desc to wwv_mig_frm_blk_dsc
Rem                                 Removed more than one occurance of following tables: wwv_mig_frm_blocks, wwv_mig_frm_formmodules, wwv_mig_frm_lov, wwv_mig_frm_lovcolmaps (this table doesn't exist)
Rem     ashiverm       10/12/2008 - Added drop statement for following tables wwv_mig_generated_applications, wwv_mig_frm_fmb_menu_menuitem, wwv_mig_frm_fmb_menuitem_role
Rem     hfarrell       02/02/2009 - Added drop statement for the following tables: wwv_mig_frm_rev_formmodules, wwv_mig_frm_rev_blocks, wwv_mig_frm_lov, wwv_mig_frm_rev_lovcolmaps
Rem     hfarrell       02/16/2009 - Latest version of file copied from 3.2 branch in SVN.
Rem     jkallman       07/27/2009 - Add missing drop of migration views, package apex_mig_projects_update
Rem     vuvarov        07/13/2012 - Removed drop of wwv_mig_acc_load public synonym


SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO OFF

REM **************************************************************************
REM DROP TABLE STATEMENTS FOR ACCESS MIGRATIONS
drop table wwv_mig_projects cascade constraints;
drop table wwv_mig_access cascade constraints;
drop table wwv_mig_exporter cascade constraints;
drop table wwv_mig_acc_forms cascade constraints;
drop table wwv_mig_acc_forms_modules cascade constraints;
drop table wwv_mig_acc_reports cascade constraints;
drop table wwv_mig_acc_tab_perm cascade constraints;
drop table wwv_mig_acc_queries cascade constraints;
drop table wwv_mig_acc_relations cascade constraints;
drop table wwv_mig_acc_groups cascade constraints;
drop table wwv_mig_acc_users cascade constraints;
drop table wwv_mig_acc_modules cascade constraints;
drop table wwv_mig_acc_modules_perm cascade constraints;
drop table wwv_mig_acc_forms_controls cascade constraints;
drop table wwv_mig_acc_relation_cols cascade constraints;
drop table wwv_mig_acc_rpts_controls cascade constraints;
drop table wwv_mig_acc_rpts_modules cascade constraints;
drop table wwv_mig_acc_rpt_perms cascade constraints;
drop table wwv_mig_acc_tables cascade constraints;
drop table wwv_mig_acc_columns cascade constraints;
drop table wwv_mig_acc_forms_perm cascade constraints;
drop table wwv_mig_acc_indexes cascade constraints;
drop table wwv_mig_acc_indexes_cols cascade constraints;
drop table wwv_mig_acc_pages cascade constraints;
drop table wwv_mig_acc_grpsmembers cascade constraints;
drop table wwv_mig_rev_tables cascade constraints;
drop table wwv_mig_rev_queries cascade constraints;
drop table wwv_mig_rev_reports cascade constraints;
drop table wwv_mig_rev_forms cascade constraints;
drop table wwv_mig_rev_apexapp cascade constraints;
drop table wwv_mig_reserved_words cascade constraints;

REM DROP TABLE STATEMENTS FOR FORMS MIGRATIONS
drop table wwv_mig_generated_applications cascade constraints;
drop table wwv_mig_forms cascade constraints;
drop table wwv_mig_frm_alerts cascade constraints;
drop table wwv_mig_frm_attachedlibrary cascade constraints;
drop table wwv_mig_frm_blocks cascade constraints;
drop table wwv_mig_frm_blk_items cascade constraints;
drop table wwv_mig_frm_blk_item_lie cascade constraints;
drop table wwv_mig_frm_blk_item_radio cascade constraints;
drop table wwv_mig_frm_blk_item_triggers cascade constraints;
drop table wwv_mig_frm_blk_relations cascade constraints;
drop table wwv_mig_frm_blk_triggers cascade constraints;
drop table wwv_mig_frm_blk_dsc cascade constraints;
drop table wwv_mig_frm_blk_dsa cascade constraints;
drop table wwv_mig_frm_canvas cascade constraints;
drop table wwv_mig_frm_cnvs_graphics cascade constraints;
drop table wwv_mig_frm_cnvg_compoundtext cascade constraints;
drop table wwv_mig_frm_cnvs_tabpage cascade constraints;
drop table wwv_mig_frm_coordinates cascade constraints;
drop table wwv_mig_frm_cpdtxt_textsegment cascade constraints;
drop table wwv_mig_frm_editor cascade constraints;
drop table wwv_mig_frm_fmb_menu cascade constraints;
drop table wwv_mig_frm_fmb_menu_menuitem cascade constraints;
drop table wwv_mig_frm_fmb_menuitem_role cascade constraints;
drop table wwv_mig_frm_formmodules cascade constraints;
drop table wwv_mig_frm_lov cascade constraints;
drop table wwv_mig_frm_lovcolumnmapping cascade constraints;
drop table wwv_mig_frm_menu cascade constraints;
drop table wwv_mig_frm_menu_menuitem cascade constraints;
drop table wwv_mig_frm_menuitem_role cascade constraints;
drop table wwv_mig_frm_menus cascade constraints;
drop table wwv_mig_frm_menus_menumodules cascade constraints;
drop table wwv_mig_frm_menus_modules cascade constraints;
drop table wwv_mig_frm_menus_programunit cascade constraints;
drop table wwv_mig_frm_menusmoduleroles cascade constraints;
drop table wwv_mig_frm_moduleparameter cascade constraints;
drop table wwv_mig_frm_modules cascade constraints;
drop table wwv_mig_frm_objectgroup cascade constraints;
drop table wwv_mig_frm_objectgroupchild cascade constraints;
drop table wwv_mig_frm_olb_xmltagtablemap cascade constraints;
drop table wwv_mig_frm_programunit cascade constraints;
drop table wwv_mig_frm_propertyclass cascade constraints;
drop table wwv_mig_frm_recordgroupcolumn cascade constraints;
drop table wwv_mig_frm_recordgroups cascade constraints;
drop table wwv_mig_frm_report cascade constraints;
drop table wwv_mig_frm_rev_apex_app cascade constraints;
drop table wwv_mig_frm_rev_blk_items cascade constraints;
drop table wwv_mig_frm_rev_blocks cascade constraints;
drop table wwv_mig_frm_rev_formmodules cascade constraints;
drop table wwv_mig_frm_rev_lov cascade constraints;
drop table wwv_mig_frm_rev_lovcolmaps cascade constraints;
drop table wwv_mig_frm_triggers cascade constraints;
drop table wwv_mig_frm_visualattributes cascade constraints;
drop table wwv_mig_frm_windows cascade constraints;
drop table wwv_mig_frm_xmltagtablemap cascade constraints;
drop table wwv_mig_menu_xmltagtablemap cascade constraints;
drop table wwv_mig_olb cascade constraints;
drop table wwv_mig_olb_blk_datasourcecol cascade constraints;
drop table wwv_mig_olb_blk_item cascade constraints;
drop table wwv_mig_olb_blk_item_lie cascade constraints;
drop table wwv_mig_olb_blk_item_trigger cascade constraints;
drop table wwv_mig_olb_blk_trigger cascade constraints;
drop table wwv_mig_olb_block cascade constraints;
drop table wwv_mig_olb_canvas cascade constraints;
drop table wwv_mig_olb_cg_compoundtext cascade constraints;
drop table wwv_mig_olb_cg_ct_textsegment cascade constraints;
drop table wwv_mig_olb_cnvs_graphics cascade constraints;
drop table wwv_mig_olb_modules cascade constraints;
drop table wwv_mig_olb_objectlibrary cascade constraints;
drop table wwv_mig_olb_objectlibrarytab cascade constraints;
drop table wwv_mig_olb_olt_alert cascade constraints;
drop table wwv_mig_olb_olt_blk_item cascade constraints;
drop table wwv_mig_olb_olt_blk_item_trigr cascade constraints;
drop table wwv_mig_olb_olt_block cascade constraints;
drop table wwv_mig_olb_olt_canvas cascade constraints;
drop table wwv_mig_olb_olt_cnvs_graphics cascade constraints;
drop table wwv_mig_olb_olt_graphics cascade constraints;
drop table wwv_mig_olb_olt_item cascade constraints;
drop table wwv_mig_olb_olt_menu cascade constraints;
drop table wwv_mig_olb_olt_menu_menuitem cascade constraints;
drop table wwv_mig_olb_olt_ob_objgrpchild cascade constraints;
drop table wwv_mig_olb_olt_objectgroup cascade constraints;
drop table wwv_mig_olb_olt_report cascade constraints;
drop table wwv_mig_olb_olt_tabpage cascade constraints;
drop table wwv_mig_olb_olt_tabpg_graphics cascade constraints;
drop table wwv_mig_olb_olt_visualattrbute cascade constraints;
drop table wwv_mig_olb_olt_window cascade constraints;
drop table wwv_mig_olb_programunit cascade constraints;
drop table wwv_mig_olb_propertyclass cascade constraints;
drop table wwv_mig_olb_t_tp_g_graphics cascade constraints;
drop table wwv_mig_olb_t_tp_gg_cpdtxt cascade constraints;
drop table wwv_mig_olb_t_tp_gg_ct_txtsgt cascade constraints;
drop table wwv_mig_olb_t_tp_gg_graphics cascade constraints;
drop table wwv_mig_olb_t_tp_ggg_cpdtxt cascade constraints;
drop table wwv_mig_olb_t_tp_ggg_ct_txtsgt cascade constraints;
drop table wwv_mig_olb_t_tp_ggg_graphics cascade constraints;
drop table wwv_mig_olb_t_tp_gggg_cpdtxt cascade constraints;
drop table wwv_mig_olb_t_tp_gggg_ct_txsgt cascade constraints;
drop table wwv_mig_olb_t_tp_gggg_graphics cascade constraints;
drop table wwv_mig_olb_t_tp_ggggg_cpdtxt cascade constraints;
drop table wwv_mig_olb_t_tp_ggggg_ct_txst cascade constraints;
drop table wwv_mig_olb_visualattribute cascade constraints;
drop table wwv_mig_olb_window cascade constraints;
drop table wwv_mig_plsql_libs cascade constraints;
drop table wwv_mig_project_components cascade constraints;
drop table wwv_mig_project_triggers cascade constraints;
drop table wwv_mig_report cascade constraints;
drop table wwv_mig_rpt_data cascade constraints;
drop table wwv_mig_rpt_data_summary cascade constraints;
drop table wwv_mig_rpt_datasrc cascade constraints;
drop table wwv_mig_rpt_datasrc_grp cascade constraints;
drop table wwv_mig_rpt_datasrc_select cascade constraints;
drop table wwv_mig_rpt_grp_dataitem cascade constraints;
drop table wwv_mig_rpt_grp_dataitem_desc cascade constraints;
drop table wwv_mig_rpt_grp_dataitem_priv cascade constraints;
drop table wwv_mig_rpt_grp_field cascade constraints;
drop table wwv_mig_rpt_grp_filter cascade constraints;
drop table wwv_mig_rpt_grp_formula cascade constraints;
drop table wwv_mig_rpt_grp_rowdelim cascade constraints;
drop table wwv_mig_rpt_grp_summary cascade constraints;
drop table wwv_mig_rpt_reportprivate cascade constraints;
drop table wwv_mig_rpt_xmltagtablemap cascade constraints;
drop table wwv_mig_rpts cascade constraints;

REM **************************************************************************
REM DROP PACKAGE STATEMENTS
drop package wwv_mig_acc_load;
drop package wwv_mig_frm_update_apx_app;
drop package wwv_mig_frm_utilities;
drop package wwv_mig_frm_load_xml;
drop package wwv_mig_frmmenu_load_xml;
drop package wwv_mig_rpt_load_xml;
drop package wwv_mig_frm_olb_load_xml;
drop package apex_mig_projects_update;

REM **************************************************************************
REM DROP VIEW STATEMENTS
drop view apex_migration_projects;
drop view apex_migration_acc_projects;
drop view apex_migration_acc_tables;
drop view apex_migration_acc_forms;
drop view apex_migration_acc_rpts;
drop view apex_migration_acc_queries;
drop view apex_migration_rev_forms;
drop view apex_migration_rev_rpts;
drop view apex_migration_rev_queries;
drop view apex_migration_rev_tables;
