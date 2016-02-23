Rem
Rem $Header: wwv_mig_frm_create_ddl.sql 06-March-2008.11:44:01
Rem
Rem wwv_mig_frm_create_ddl.sql
Rem
Rem Copyright (c) 2001, 2005, 2007, 2008 Oracle Corporation.  All rights reserved.
Rem
Rem    NAME
Rem      wwv_mig_frm_create_ddl.sql - Create objects
Rem
Rem    DESCRIPTION
Rem     This will create the Schema needed for the migration of Forms to APEX.
Rem Each "create table" will be followed by:
Rem
Rem     *  A trigger that generates id, create_on, created_by
Rem        last_updated_on and last_updated_by fields.
Rem     *  An index for the foreign key of that table.
Rem
Rem    NOTES
Rem     Draft Version
Rem
Rem    MODIFIED     (MM/DD/YY)   Comments
Rem    ashiverm     06/03/2008 - Created
Rem    hfarrell     07/03/3008 - Added wwv_mig_frm_blk_items.lovname and wwv_mig_frm_rev_blk_items.lovname holding name of LOV associated with Block item
Rem    hfarrell     07/03/2008 - Added wwv_mig_frm_rev_lov and wwv_mig_frm_rev_lovcolmaps revision tables
Rem    ashiverm     07/18/2008 - Added attributes for forms in block items
Rem    hfarrell     07/23/2008 - Added liststyle attribute to wwv_mig_frm_blk_items, used to identify the style of list or LOV used in the original application
Rem    hfarrell     08/07/2008 - Added attribute 'comment' to wwv_mig_frm_blocks, wwv_mig_frm_blk_items, and wwv_mig_frm_windows tables
Rem    hfarrell     08/07/2008 - Renamed 'comment' to 'item_comment' in wwv_mig_frm_blocks, wwv_mig_frm_blk_items, and wwv_mig_frm_windows tables, to correspond with changes Ashish had applied to wwv_mig_frm_load.plb
Rem    hfarrell     08/07/2008 - Updated ProgramUnitText and TriggerText columns from varchar2(4000) to CLOB in wwv_mig_frm_programunit, wwv_mig_frm_blk_triggers, wwv_mig_frm_blk_item_triggers, and wwv_mig_frm_triggers
Rem    jkallman     08/08/2008 - Add missing / after some triggers
Rem    hfarrell     08/08/2008 - Added missing column to wwv_mig_fr_blk_items, wwv_mig_frm_blk_item_radio, and wwv_mig_frm_cnvs_graphics table
Rem    hfarrell     08/19/2008 - Added attribute 'editname' to wwv_mig_frm_blk_items
Rem    hfarrell     08/25/2008 - Added Tracking columns to each non-revision table: applicability,percent_complete,priority,assignee,notes,tags
Rem    hfarrell     08/27/2008 - Renamed Tracking columns applicability, percent_complete to applicable, complete
Rem    hfarrell     08/27/2008 - Updated wwv_mig_frm_formmodules table with new columns:VerticalToolbarCanvas,HorizontalToolbarCanvas,formmodule_Comment,InitializeMenu,MenuRole,FirstNavigationBlockName,SavepointMode,
Rem                              ValidationUnit,RecordVisualAttributeGroupName,MouseNavigationLimit,Use3dControls,CursorMode
Rem    ashiverm     08/28/2008 - Added columns in wwv_mig_frm_canvas, wwv_mig_frm_triggers, wwv_mig_frm_propertyclass, wwv_mig_frm_recordgroups, wwv_mig_frm_visualattributes, wwv_mig_frm_windows, wwv_mig_frm_lov, wwv_mig_frm_alerts, wwv_mig_frm_blocks for various forms attributes
Rem    hfarrell     09/08/2008 - Added attributes to wwv_mig_frm_editor table: parenttype, parentname, parentmodule, editor_comment, bottom_title, parent_module_type
Rem    ashiverm     09/08/2008 - Added columns in wwv_mig_frm_blk_items, wwv_mig_frm_cnvs_graphics, wwv_mig_frm_recordgroupcolumn table
Rem    hfarrell     09/09/2008 - Added new tables wwv_mig_project_components and wwv_mig_project_triggers for maintaining tracking information
Rem    ashiverm     09/15/2008 - 1. Changed following columns:
Rem                                     wwv_mig_frm_blocks.item_comment(varchar2) -> wwv_mig_frm_blocks.block_comment(clob)
Rem                                     wwv_mig_frm_formmodules.formmodule_comment(varchar2) -> wwv_mig_frm_formmodules.formmodule_comment(clob)
Rem                                     wwv_mig_frm_blk_items.item_comment(varchar2) -> wwv_mig_frm_blk_items.item_comment(clob)
Rem                                     wwv_mig_frm_editor.editor_comment(varchar2) -> wwv_mig_frm_editor.editor_comment(clob)
Rem                                     wwv_mig_frm_editor.parent_module_type(varchar2) -> wwv_mig_frm_editor.parentmoduletype(varchar2)
Rem                                     wwv_mig_frm_editor.bottom_title(varchar2) -> wwv_mig_frm_editor.bottomtitle(varchar2)
Rem                                     wwv_mig_frm_windows.item_comment(varchar2) -> wwv_mig_frm_windows.window_comment(clob)
Rem                              2. Added following tables: wwv_mig_frm_xmltagtablemap, wwv_mig_frm_attachedlibrary, wwv_mig_frm_moduleparameter, wwv_mig_frm_objectgroup, wwv_mig_frm_objectgroupchild, wwv_mig_frm_cnvg_compoundtext, wwv_mig_frm_cpdtxt_textsegment
Rem    ashiverm     09/16/2008 - Added insert statement for wwv_mig_frm_xmltagtablemap table
Rem    hfarrell     09/16/2008 - Renamed constraint on wwv_mig_frm_moduleparameter from wwv_mig_frm_atlib_sel_for_app to wwv_mig_frm_mp_sel_for_app to avoid duplicate constraint names error
Rem    ashiverm     09/16/2008 - Added a column wwv_mig_frm_recordgroups.RecordGroup_Comment(clob)
Rem    hfarrell     09/17/2008 - Added missing insert statement to wwv_mig_frm_xmltagtablemap table for the WWV_MIG_FRM_EDITOR table
Rem    jkallman     09/19/2008 - Remove creation of index wwv_mig_frm_xmlmap_sg_id_idx, remove security_group_id reference from trigger wwv_biu_mig_frm_xmltagtablemap
Rem    hfarrell     09/30/2008 - Added columns to the wwv_mig_frm_blocks table: enhanced_query, custom_query, use_query
Rem    hfarrell     09/30/2008 - Added table wwv_mig_plsql_libs, to hold the converted text files for PLLs associated with Forms application
Rem    hfarrell     10/02/2008 - Added column original_query to wwv_mig_frm_blocks table, to hold the original query syntax
Rem    hfarrell     10/08/2008 - Added tables for Oracle Reports information: wwv_mig_rpts, wwv_mig_report, wwv_mig_report_data, wwv_mig_report_datasource, wwv_mig_report_datasrc_select
Rem    hfarrell     10/08/2008 - Added table wwv_mig_rpt_xmlstagtablemap to hold Oracle Reports to map all the nodes of the Reports xml file with the corresponding reports table name
Rem    hfarrell     10/09/2008 - Added additional Oracle Reports tables:wwv_mig_rpt_datasrc_grp, wwv_mig_rpt_grp_dataitem, wwv_mig_rpt_grp_dataitem_desc, wwv_mig_rpt_grp_dataitem_priv, wwv_mig_rpt_grp_summary
Rem                              Renamed wwv_mig_report_data to wwv_mig_rpt_data;wwv_mig_report_datasource to wwv_mig_rpt_datasrc;wwv_mig_report_datasrc_select to wwv_mig_rpt_datasrc_select
Rem    hfarrell     10/16/2008 - Added CDATA column to wwv_mig_rpt_datasrc_select and wwv_mig_rpt_grp_dataitem_priv tables, to hold Oracle Reports SQL query.
Rem                              Removed extra newline in wwv_mig_rpt_grp_dataitem_desc create table statement.
Rem    hfarrell     10/17/2008 - Added tables for Oracle Forms Menus: wwv_mig_frm_menus, wwv_mig_frm_menu_modules, wwv_mig_frm_menumoduleroles,wwv_mig_frm_menu_menumodules
Rem    hfarrell     10/20/2008 - Added additional tables for Oracle Forms Menus
Rem    ashiverm     10/21/2008 - Added wwv_mig_frm_rev_blk_items.lov_query(clob)
Rem    ashiverm     10/21/2008 - Added tables for Oracle Forms' ObjectLibrary (*_olb.xml files)
Rem    ashiverm     10/23/2008 - Updated wwv_mig_frm_olb_xmltagtablemap.parent_id = 31 (from 32) where id = 34
Rem                                      wwv_mig_frm_olb_xmltagtablemap.parent_id = 21 (from 25) where id = 29
Rem                                      wwv_mig_frm_olb_xmltagtablemap.table_name = 'WWV_MIG_OLB_BLK_DATASOURCECOL' (from 'WWV_MIG_OLB_BLK_DSC') where id = 22
Rem    hfarrell     10/23/2008 - Added missing indexes on the following tables: wwv_mig_project_triggers, wwv_mig_project_components, wwv_mig_rpt_xmltagtablemap, wwv_mig_frm_xmltagtablemap,wwv_mig_menu_xmltagtablemap, wwv_mig_frm_olb_xmltagtablemap
Rem    ashiverm     10/24/2008 - Updated wwv_mig_frm_olb_xmltagtablemap.parent_id = 3 (from 2) where id = 16
Rem    ashiverm     10/29/2008 - Added table wwv_mig_frm_blk_dsa
Rem                              Added columns to following tables:
Rem                                 wwv_mig_frm_alerts, wwv_mig_olb_olt_alert,
Rem                                 wwv_mig_frm_attachedlibrary,
Rem                                 wwv_mig_frm_blocks, wwv_mig_olb_block, wwv_mig_olb_olt_block,
Rem                                 wwv_mig_frm_canvas, wwv_mig_olb_canvas, wwv_mig_olb_olt_canvas,
Rem                                 wwv_mig_frm_cnvg_compoundtext, wwv_mig_olb_t_tp_gg_cpdtxt, wwv_mig_olb_t_tp_ggg_cpdtxt, wwv_mig_olb_t_tp_gggg_cpdtxt, wwv_mig_olb_t_tp_ggggg_cpdtxt, wwv_mig_olb_cg_compoundtext,
Rem                                 wwv_mig_frm_blk_dsc, wwv_mig_olb_blk_datasourcecol,
Rem                                 wwv_mig_frm_editor,
Rem                                 wwv_mig_frm_formmodules,
Rem                                 wwv_mig_frm_lov, wwv_mig_frm_lovcolumnmapping,
Rem                                 wwv_mig_frm_blk_items, wwv_mig_olb_blk_item, wwv_mig_olb_olt_item, wwv_mig_olb_olt_blk_item, wwv_mig_frm_blk_item_radio,
Rem                                 wwv_mig_frm_cnvs_graphics, wwv_mig_olb_cnvs_graphics, wwv_mig_olb_olt_graphics, wwv_mig_olb_olt_tabpg_graphics, wwv_mig_olb_t_tp_g_graphics, wwv_mig_olb_t_tp_gg_graphics, wwv_mig_olb_t_tp_ggg_graphics, wwv_mig_olb_t_tp_gggg_graphics
Rem                                 wwv_mig_frm_moduleparameter,
Rem                                 wwv_mig_frm_objectgroup, wwv_mig_olb_olt_objectgroup, wwv_mig_frm_objectgroupchild, wwv_mig_olb_olt_ob_objgrpchild,
Rem                                 wwv_mig_olb_objectlibrary, wwv_mig_olb_objectlibrarytab,
Rem                                 wwv_mig_frm_programunit, wwv_mig_frm_menus_programunit, wwv_mig_olb_programunit,
Rem                                 wwv_mig_frm_recordgroups, wwv_mig_frm_recordgroupcolumn,
Rem                                 wwv_mig_frm_blk_relations,
Rem                                 wwv_mig_frm_cnvs_tabpage, wwv_mig_olb_olt_tabpage,
Rem                                 wwv_mig_frm_cpdtxt_textsegment, wwv_mig_olb_t_tp_gg_ct_txtsgt, wwv_mig_olb_t_tp_ggg_ct_txtsgt, wwv_mig_olb_t_tp_gggg_ct_txtsgt, wwv_mig_olb_t_tp_ggggg_ct_txtsgt, wwv_mig_olb_cg_ct_textsegment,
Rem                                 wwv_mig_frm_triggers, wwv_mig_frm_blk_item_triggers, wwv_mig_frm_blk_triggers, wwv_mig_olb_olt_blk_item_trigr, wwv_mig_olb_blk_item_trigger, wwv_mig_olb_blk_trigger,
Rem                                 wwv_mig_frm_visualattributes, wwv_mig_olb_visualattribute, wwv_mig_olb_olt_visualattrbute,
Rem                                 wwv_mig_frm_windows, wwv_mig_olb_window, wwv_mig_olb_olt_window
Rem                              Updated wwv_mig_frm_menu.menu_comment(varchar2(4000) to clob)
Rem                                      wwv_mig_frm_menu_menuitem.menuitem_comment(varchar2(4000) to clob)
Rem                                      wwv_mig_frm_menu_programunit.programunit_comment(varchar2(4000) to clob)
Rem                              Removed table wwv_mig_frm_errors
Rem    ashiverm     10/31/2008 - Added tables wwv_mig_frm_fmb_menu, wwv_mig_frm_report
Rem                              Added insert statements in wwv_mig_frm_xmltagtablemap for wwv_mig_frm_blk_dsa, wwv_mig_frm_fmb_menu, wwv_mig_frm_report
Rem                              Added columns to following tables: wwv_mig_frm_menu, wwv_mig_frm_menu_menuitem, wwv_mig_frm_menus_menumodules
Rem    jkallman     10/31/2008 - Removed duplicate columns from table wwv_mig_frm_blk_item_radio, wwv_mig_frm_menu
Rem    ashiverm     11/28/2008 - Added table wwv_mig_generated_applications to store associated applications for any Forms project
Rem                              Removed the tab characters before wwv_mig_frm_menu table creation lines
Rem    ashiverm     12/01/2008 - Updated wwv_mig_frm_blocks, wwv_mig_frm_blk_items, wwv_mig_frm_rev_blocks, wwv_mig_frm_rev_blk_items tables' created_on(date) -> created_on(timestamp), and same is modified in respective triggers
Rem    ashiverm     12/01/2008 - Added column wwv_mig_frm_blk_items.ShowPalette(varchar2(4000)) as newly found attribute in one of CPD file (arrf207_fmb.xml) which was not present in the XSD file
Rem    hfarrell     12/05/2008 - Updated wwv_mig_frm_blocks to set default values of 'true' on deletedallowed, insertallowed and updateallowed columns, to display correct values on pg 4400:77
Rem    ashiverm     12/08/2008 - Added tables: wwv_mig_frm_fmb_menu_menuitem, wwv_mig_frm_fmb_menuitem_role; and added these tables' entry into wwv_mig_frm_xmltagtablemap table
Rem                              Updated wwv_mig_frm_blk_item_lie and wwv_mig_olb_blk_item_lie, changed column name from lie_index to ListItemElement_index
Rem    ashiverm     12/08/2008 - Updated table wwv_mig_frm_menuitem_role renamed column menuitemrole_value to value
Rem    hfarrell     12/18/2008 - Updated table wwv_mig_frm_blocks to set default value on showscrollbar column to 'false'
Rem    sathikum     01/07/2009 - Updated table wwv_mig_frm_lov to set default value of 'false' to filterbeforedisplay ,autoselect ,autoposition  , autodisplay, autorefresh, autoskip, smartclass, autocolumnwidth
Rem    jkallman     01/11/2009 - Corrected type in wwv_mig_frm_lov
Rem    sathikum     01/13/2009 - Fix #7688593 added default value 'false' to wwv_mig_frm_canvas, wwv_mig_frm_coordinates & wwv_mig_frm_windows
Rem    sathikum     01/15/2009 - Modified columns whose value in UI is based on LOV to have a default value of 'false'
Rem    hfarrell     01/28/2009 - Fix for bug 7688593: updated the following columns to apply default values, and avoid square brackets being displayed where the page item uses an LOV:
Rem                              wwv_mig_frm_blk_items: databaseitem, required, mousenavigate, keyboardnavigable.
Rem                              wwv_mig_frm_canvas: subclassobjectgroup.
Rem                              wwv_mig_frm_menu_menuitem: subclasssubobject,DisplayNoPriv, Enabled, SmartClass, visible.
Rem                              wwv_mig_frm_fmb_menu_menuitem: subclasssubobject, DisplayNoPriv, Enabled, SmartClass, Visible.
Rem    hfarrell     02/02/2009 - Added foreign key indexes on wwv_mig_generated_applications application_id and project_id
Rem    hfarrell     02/16/2009 - Latest version of file copied from 3.2 branch in SVN.
Rem    cneumuel     04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem    cneumuel     06/10/2014 - triggers to check workspace file limits: wwv_aiu_mig_forms, wwv_aiu_mig_plsql_Libs, wwv_aiu_mig_rpts, wwv_aiu_mig_frm_menus, wwv_aiu_mig_olb (feature #1198)

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET DEFINE '^'
SET VERIFY OFF

REM ****************************************************************************

/* already existing table; modified to include database_schema, and excluded projectid
--------------------------------------------------------------------------------
-- Create a table Details to hold migration project details
-- eg., project name
--------------------------------------------------------------------------------
create table wwv_mig_projects (
    id                              number
                                        constraint wwv_mig_projects_pk primary key,
    security_group_id               number not null
                                        constraint wwv_mig_projects_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    migration_name                  varchar2(400) not null,
    migration_type                  varchar2(100)
                                        constraint valid_mig_type
                                        check (migration_type in ('access', 'forms')),
    description                     varchar2(4000),
    database_schema                 varchar2(100),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400),
                                        constraint wwv_mig_projects_uk
                                        unique (migration_name, security_group_id)
)
/

create or replace trigger wwv_biu_mig_projects
    before insert or update on wwv_mig_projects
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_projects_sg_id_idx on wwv_mig_projects (security_group_id);
*/
-----------------------------------------------------------------------------------

--
-- Associated applications for any Forms project
--
create table wwv_mig_generated_applications (
    id                              number
                                        constraint wwv_mig_gen_app_pk primary key,
    security_group_id               number not null
                                        constraint wwv_mig_gen_app_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    project_id                      number not null
                                        constraint wwv_mig_gen_app_proj_id_fk
                                        references wwv_mig_projects(id) on delete cascade,
    application_id                  number
                                        constraint wwv_mig_gen_app_flow_id_fk
                                        references wwv_flows(id) on delete cascade,
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_gen_applications
    before insert or update on wwv_mig_generated_applications
    for each row
begin
    --insert unique primary key for id
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_gen_app_flow_id_idx on wwv_mig_generated_applications (security_group_id);
create index wwv_mig_gen_app_app_id_idx on wwv_mig_generated_applications (application_id);
create index wwv_mig_gen_app_proj_id_idx on wwv_mig_generated_applications (project_id);
-----------------------------------------------------------------------------------

--
-- wwv_mig_frm_xmltagtablemap is created to map all the nodes of the forms fmb xml file
-- with the corresponding forms table name with the hierarchy of DOM structure
--
create table wwv_mig_frm_xmltagtablemap (
    id                              number
                                        constraint wwv_mig_frm_xmltagtablemap_pk primary key,
    tag_name                        varchar2(30),
    parent_id                       number
                                        constraint wwv_mig_frm_xmltagtablemap_fk
                                        references wwv_mig_frm_xmltagtablemap(id) on delete cascade,
    table_name                      varchar2(128)
                                        constraint wwv_mig_frm_xttm_table_name_uk unique,
    foreign_key_name                varchar2(128),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_xmltagtablemap
    before insert or update on wwv_mig_frm_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_xmltag_id_idx on wwv_mig_frm_xmltagtablemap (parent_id);
-----------------------------------------------------------------------------------------------------------------------
--
-- wwv_mig_rpt_xmlstagtablemap is created to map all the nodes of the Reports xml file
-- with the corresponding reports table name with the hierarchy of DOM structure
--
create table wwv_mig_rpt_xmltagtablemap (
    id                              number
                                        constraint wwv_mig_rpt_xmltagtablemap_pk primary key,
    tag_name                      varchar2(30),
    parent_id                     number
                                        constraint wwv_mig_rpt_xmltagtablemap_fk
                                        references wwv_mig_rpt_xmltagtablemap(id) on delete cascade,
    table_name                    varchar2(128)
                                        constraint wwv_mig_rpt_xttm_table_name_uk unique,
    foreign_key_name              varchar2(128),
--
    created_on                    date,
    created_by                    varchar2(400),
    last_updated_on               date,
    last_updated_by               varchar2(400)
)
/

create or replace trigger wwv_biu_mig_rpt_xmltagtablemap
    before insert or update on wwv_mig_rpt_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_rpt_xmltag_id_idx on wwv_mig_rpt_xmltagtablemap (parent_id);
-------------------------------------------------------------------------------
-- WWV_MIG_PROJECT_COMPONENTS
--
create table wwv_mig_project_components (
     id                                        number constraint wwv_mig_proj_comp_pk primary key,
     project_id                                number not null constraint wwv_mig_proj_comp_fk
                                               references wwv_mig_projects(id)
                                               on delete cascade,
     security_group_id                         number not null constraint wwv_mig_proj_comp_fk2
                                               references wwv_flow_companies(provisioning_company_id)
                                               on delete cascade,
     component                                 varchar2(1000),
     applicable                                varchar2(1),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_proj_comp_uk1
                                               unique (id,project_id,security_group_id)
)
/

create or replace trigger wwv_biu_mig_proj_comps
    before insert or update on wwv_mig_project_components
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_proj_comp_pj_id_idx on wwv_mig_project_components (project_id);
create index wwv_mig_proj_comp_sg_id_idx on wwv_mig_project_components (security_group_id);

-- WWV_MIG_PROJECT_TRIGGERS
--
create table wwv_mig_project_triggers (
     id                                        number constraint wwv_mig_proj_trig_pk primary key,
     project_id                                number not null constraint wwv_mig_proj_trig_fk
                                               references wwv_mig_projects(id)
                                               on delete cascade,
     security_group_id                         number not null constraint wwv_mig_proj_trig_fk2
                                               references wwv_flow_companies(provisioning_company_id)
                                               on delete cascade,
     trigger_name                              varchar2(1000),
     form_level                                varchar2(1),
     block_level                               varchar2(1),
     item_level                                varchar2(1),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_proj_trig_uk1
                                               unique (id,project_id,security_group_id)
)
/

create or replace trigger wwv_biu_mig_proj_trigs
    before insert or update on wwv_mig_project_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_proj_trig_pj_id_idx on wwv_mig_project_triggers (project_id);
create index wwv_mig_proj_trig_sg_id_idx on wwv_mig_project_triggers (security_group_id);

-- WWV_MIG_FORMS
--
create table wwv_mig_forms (
    id                              number
                                        constraint wwv_mig_forms_pk primary key,
    project_id                      number not null
                                        constraint wwv_mig_forms_project_id_fk
                                        references wwv_mig_projects(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_forms_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    description                     varchar2(4000),
    file_name                       varchar2(255),
    file_mime_type                  varchar2(255),
    file_content                    blob,
    xml_content                     sys.xmltype,
    file_char_set                   varchar2(255),
    file_updated_on                 date,
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                     varchar2(1) default 'Y',
    complete                       varchar2(1) default 'N',
    priority                       number(1,0) default 3,
    assignee                       varchar2(255),
    notes                          varchar2(4000),
    tags                           varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400),
                                        constraint wwv_mig_forms_uk
                                        unique (file_name, project_id)
)
/

create or replace trigger wwv_biu_mig_forms
    before insert or update on wwv_mig_forms
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/
prompt ...trigger wwv_aiu_mig_forms
create or replace trigger wwv_aiu_mig_forms
    after insert or update on wwv_mig_forms
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/


create index wwv_mig_forms_project_id_idx on wwv_mig_forms (project_id);
create index wwv_mig_forms_sg_id_idx on wwv_mig_forms (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_PLSQL_LIBS
create table wwv_mig_plsql_libs (
    id                              number
                                        constraint wwv_mig_plls_pk primary key,
    project_id                      number not null
                                        constraint wwv_mig_plls_project_id_fk
                                        references wwv_mig_projects(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_plls_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    description                     varchar2(4000),
    file_name                       varchar2(255),
    file_mime_type                  varchar2(255),
    file_content                    blob,
    file_char_set                   varchar2(255),
    xml_content                     sys.xmltype,
    file_updated_on                 date,
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_pll_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                     varchar2(1) default 'Y',
    complete                       varchar2(1) default 'N',
    priority                       number(1,0) default 3,
    assignee                       varchar2(255),
    notes                          varchar2(4000),
    tags                           varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400),
                                        constraint wwv_mig_plls_uk
                                        unique (file_name, project_id)
)
/

create or replace trigger wwv_biu_mig_plls
    before insert or update on wwv_mig_plsql_libs
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/
prompt ...trigger wwv_aiu_mig_plsql_libs
create or replace trigger wwv_aiu_mig_plsql_Libs
    after insert or update on wwv_mig_plsql_libs
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/


create index wwv_mig_pll_project_id_idx on wwv_mig_plsql_libs (project_id);
create index wwv_mig_pll_sg_id_idx on wwv_mig_plsql_libs (security_group_id);

-----------------------------------------------------------------------------------------------------------------------

-- table for Module tag of fmb file
create table wwv_mig_frm_modules (
    id                              number
                                        constraint wwv_mig_frm_modules_pk primary key,
    file_id                         number not null
                                        constraint wwv_mig_frm_modules_file_id_fk
                                        references wwv_mig_forms(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_modules_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    version                         varchar2(255),
    xmlns                           varchar2(255),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_mdl_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_modules
    before insert or update on wwv_mig_frm_modules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_module_file_id_idx on wwv_mig_frm_modules (file_id);
create index wwv_mig_frm_modules_sg_id_idx on wwv_mig_frm_modules (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule tag of fmb file
create table wwv_mig_frm_formmodules (
    id                              number
                                        constraint wwv_mig_frm_formmodules_pk primary key,
    module_id                       number not null
                                        constraint wwv_mig_frm_frmmdl_mdl_id_fk
                                        references wwv_mig_frm_modules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_frmmdl_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    title                           varchar2(4000),
    consolewindow                   varchar2(4000),
    menumodule                      varchar2(4000),
    runtimecomp                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    verticaltoolbarcanvas           varchar2(4000),
    horizontaltoolbarcanvas         varchar2(4000),
    formmodule_comment              clob,
    initializemenu                  varchar2(4000),
    menurole                        varchar2(4000),
    firstnavigationblockname        varchar2(4000),
    savepointmode                   varchar2(4000),
    validationunit                  varchar2(4000),
    recordvisualattributegroupname  varchar2(4000),
    mousenavigationlimit            varchar2(4000),
    use3dcontrols                   varchar2(4000),
    cursormode                      varchar2(4000),
--
    InteractionMode                 varchar2(4000),
    IsolationMode                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    MaximumQueryTime                varchar2(4000),
    MaximumRecordsFetched           varchar2(4000),
    NewdeferReqEnf                  varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    HelpBookTitle                   varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_frmmdl_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_formmodules
    before insert or update on wwv_mig_frm_formmodules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_frmmdl_mdl_id_idx on wwv_mig_frm_formmodules (module_id);
create index wwv_mig_frm_frmmdl_sg_id_idx on wwv_mig_frm_formmodules (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> AttachedLibrary tag of fmb file
create table wwv_mig_frm_attachedlibrary (
    id                              number
                                        constraint wwv_mig_frm_attachedlibrary_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_atlib_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_atlib_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    LibraryLocation                 varchar2(4000),
    LibrarySource                   varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    AttachedLibrary_Comment         clob,
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_atlib_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_atachedlibrary
    before insert or update on wwv_mig_frm_attachedlibrary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_atlib_frmdl_id_idx on wwv_mig_frm_attachedlibrary (formmodule_id);
create index wwv_mig_frm_atlib_sg_id_idx on wwv_mig_frm_attachedlibrary (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> ModuleParameter tag of fmb file
create table wwv_mig_frm_moduleparameter (
    id                              number
                                        constraint wwv_mig_frm_moduleparameter_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_mdlpr_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_mdlpr_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    MaximumLength                   varchar2(4000),
    ParameterInitializeValue        varchar2(4000),
    ParameterDataType               varchar2(4000),
--
    dirtyinfo                       varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_mp_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_modulparameter
    before insert or update on wwv_mig_frm_moduleparameter
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_mdlpr_frmdl_id_idx on wwv_mig_frm_moduleparameter (formmodule_id);
create index wwv_mig_frm_mdlpr_sg_id_idx on wwv_mig_frm_moduleparameter (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Menu tag of fmb file
create table wwv_mig_frm_fmb_menu (
    id                              number
                                        constraint wwv_mig_frm_menu_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_menu_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_menu_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    BottomTitle                     varchar2(4000),
    menu_comment                    clob,
    DirtyInfo                       varchar2(4000),
    Name                            varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentName                      varchar2(4000),
    ParentType                      varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    SubTitle                        varchar2(4000),
    TearOffMenu                     varchar2(4000),
    Title                           varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_menu_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_fmb_menu
    before insert or update on wwv_mig_frm_fmb_menu
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_menu_frmdl_id_idx on wwv_mig_frm_fmb_menu (formmodule_id);
create index wwv_mig_frm_menu_sg_id_idx on wwv_mig_frm_fmb_menu (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Menu -> MenuItem tag of fmb file
create table wwv_mig_frm_fmb_menu_menuitem (
    id                              number
                                        constraint wwv_mig_fmb_menu_menuitem_pk primary key,
    menu_id                         number not null
                                        constraint wwv_mig_fmb_menuitem_menuid_fk
                                        references wwv_mig_frm_fmb_menu(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_fmb_menuitem_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    label                           varchar2(4000),
    visibleinmenu                   varchar2(4000) default 'true',
    submenuname                     varchar2(4000),
    iconinmenu                      varchar2(4000) default 'false',
    iconfilename                    varchar2(4000),
    fontsize                        varchar2(4000),
    dirtyinfo                       varchar2(4000),
    fontname                        varchar2(4000),
    menuitem_comment                clob,
    parentmodule                    varchar2(4000),
    magicitem                       varchar2(4000) default 'Cut',
    parentmoduletype                varchar2(4000),
    menuitemtype                    varchar2(4000) default 'Plain',
    fontspacing                     varchar2(4000),
    parenttype                      varchar2(4000),
    keyboardaccelerator             varchar2(4000),
    rolecount                       varchar2(4000),
    hint                            varchar2(4000),
    parentsourcelevel1objectname    varchar2(4000),
    parentname                      varchar2(4000),
    fontweight                      varchar2(4000),
    menuitemradiogroup              varchar2(4000),
    fontstyle                       varchar2(4000),
    commandtype                     varchar2(4000) default 'Null',
    parentsourcelevel1objecttype    varchar2(4000),
    menuitemcode                    clob,
    subclasssubobject               varchar2(4000) default 'false',
    visibleinverticalmenutoolbar    varchar2(4000) default 'false',
    visibleinhorizontalmenutoolbar  varchar2(4000) default 'false',
    CommandText                     varchar2(4000),
    DisplayNoPriv                   varchar2(4000) default 'false',
    Enabled                         varchar2(4000) default 'true',
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000) default 'false',
    Visible                         varchar2(4000) default 'true',
    VisualAttributeName             varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_fmb_menuitem_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_fmb_menuitem
    before insert or update on wwv_mig_frm_fmb_menu_menuitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_fmb_menuitem_menuid_ix on wwv_mig_frm_fmb_menu_menuitem (menu_id);
create index wwv_mig_fmb_menuitem_sgid_idx on wwv_mig_frm_fmb_menu_menuitem (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Menu -> MenuItem -> MenuItemRole tag of fmb file
create table wwv_mig_frm_fmb_menuitem_role (
    id                              number
                                        constraint wwv_mig_frm_fmb_mnuitm_role_pk primary key,
    menuitem_id                     number not null
                                        constraint wwv_mig_fmb_mnuitemrl_mitm_fk
                                        references wwv_mig_frm_fmb_menu_menuitem(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_fmb_mnuitemrl_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    menuitemrole_index              varchar2(4000),
    value                           varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_fmb_mnuitmrl_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_fmb_mnuitemrl
    before insert or update on wwv_mig_frm_fmb_menuitem_role
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_fmb_mnuitemrl_mitm_idx on wwv_mig_frm_fmb_menuitem_role (menuitem_id);
create index wwv_mig_fmb_mnuitemrl_sgid_idx on wwv_mig_frm_fmb_menuitem_role (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Report tag of fmb file
create table wwv_mig_frm_report (
    id                              number
                                        constraint wwv_mig_frm_report_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_rpt_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rpt_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    CommMode                        varchar2(4000),
    DataSourceBlock varchar2(4000),
    DirtyInfo   varchar2(4000),
    ExecuteMode varchar2(4000),
    Filename    varchar2(4000),
    Name    varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    QueryName   varchar2(4000),
    report_Comment clob,
    ReportDestinationFormat varchar2(4000),
    ReportDestinationName   varchar2(4000),
    ReportDestinationType   varchar2(4000),
    ReportParameters    varchar2(4000),
    ReportServer    varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_report_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'N',
    complete                        varchar2(1) default 'Y',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_report
    before insert or update on wwv_mig_frm_report
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_rpt_frmdl_id_idx on wwv_mig_frm_report (formmodule_id);
create index wwv_mig_frm_rpt_sg_id_idx on wwv_mig_frm_report (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> ObjectGroup tag of fmb file
create table wwv_mig_frm_objectgroup (
    id                              number
                                        constraint wwv_mig_frm_objectgroup_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_objgp_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_objgp_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
--
    dirtyinfo                       varchar2(4000),
    ObjectGroupType                 varchar2(4000),
    objectgroup_comment             clob,
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000)   default 'false',
    Subclassobjectgroup             varchar2(4000)   default 'false',
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_objgp_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_objectgroup
    before insert or update on wwv_mig_frm_objectgroup
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_objgp_frmdl_id_idx on wwv_mig_frm_objectgroup (formmodule_id);
create index wwv_mig_frm_objgp_sg_id_idx on wwv_mig_frm_objectgroup (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> ObjectGroup -> ObjectGroupChild tag of fmb file
create table wwv_mig_frm_objectgroupchild (
    id                              number
                                        constraint wwv_mig_frm_objgroupchild_pk primary key,
    objectgroup_id                  number not null
                                        constraint wwv_mig_frm_objgpc_objgp_id_fk
                                        references wwv_mig_frm_objectgroup(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_objgpc_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    SubclassSubObject               varchar2(4000),
    Type                            varchar2(4000),
--
    dirtyinfo                       varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_objgpc_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_objgroupchild
    before insert or update on wwv_mig_frm_objectgroupchild
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_objgc_objgp_id_idx on wwv_mig_frm_objectgroupchild (objectgroup_id);
create index wwv_mig_frm_objgpc_sg_id_idx on wwv_mig_frm_objectgroupchild (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Coordinate tag of fmb file
create table wwv_mig_frm_coordinates (
    id                              number
                                        constraint wwv_mig_frm_coordinates_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_crdnt_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_crdnt_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    realunit                        varchar2(4000),
    coordinatesystem                varchar2(4000),
    charactercellwidth              varchar2(4000),
    charactercellheight             varchar2(4000),
    defaultfontscaling              varchar2(4000)  default 'false',
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_crdnt_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_coordinates
    before insert or update on wwv_mig_frm_coordinates
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_crdt_frmmdl_id_idx on wwv_mig_frm_coordinates (formmodule_id);
create index wwv_mig_frm_crdnt_sg_id_idx on wwv_mig_frm_coordinates (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Alert tag of fmb file
create table wwv_mig_frm_alerts (
    id                              number
                                        constraint wwv_mig_frm_alerts_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_alrt_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_alrt_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    alertstyle                      varchar2(4000),
    alertmessage                    varchar2(4000),
    button1label                    varchar2(4000),
    button2label                    varchar2(4000),
    visualattributename             varchar2(4000),
    dirtyinfo                       varchar2(4000)   default 'false',
    Title                           varchar2(4000),
    Button3Label                    varchar2(4000),
    DefaultAlertButton              varchar2(4000),
--
    SmartClass                      varchar2(4000)   default 'false',
    SubclassObjectGroup             varchar2(4000)   default 'false',
    FontName                        varchar2(4000),
    FontSize                        varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontStyle                       varchar2(4000),
    FontWeight                      varchar2(4000),
    LanguageDirection               varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    BackColor                       varchar2(4000),
    alert_Comment                   clob,
    FillPattern                     varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_alerts_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_alerts
    before insert or update on wwv_mig_frm_alerts
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_alrt_frmmdl_id_idx on wwv_mig_frm_alerts (formmodule_id);
create index wwv_mig_frm_alrt_sg_id_idx on wwv_mig_frm_alerts (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Trigger tag of fmb file
create table wwv_mig_frm_triggers (
    id                              number
                                        constraint wwv_mig_frm_trg_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_trg_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_trg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    triggertext                     clob,
    dirtyinfo                       varchar2(4000),
    FireInQuery                     varchar2(4000),
    ExecuteHierarchy                varchar2(4000),
    DisplayInKeyboardHelp           varchar2(4000),
    KeyboardHelpText                varchar2(4000),
    TriggerStyle                    varchar2(4000),
--
    trigger_Comment                 clob,
    Hide    varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentSourceLevel2ObjectName    varchar2(4000),
    ParentSourceLevel2ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TriggerInternalType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_trg_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_triggers
    before insert or update on wwv_mig_frm_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

     -- default tracking info
     --mike
     if inserting or updating then
        if :new.applicable is null then
            :new.applicable := 'Y';
        end if;
        if sys.dbms_lob.getlength(:new.triggertext) = 0 then
           :new.applicable := 'N';
        end if;
        if :new.triggertext is null or :new.triggertext = 'exit_form;' then
           :new.applicable := 'N';
        end if;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_trg_frmmdl_id_idx on wwv_mig_frm_triggers (formmodule_id);
create index wwv_mig_frm_trg_sg_id_idx on wwv_mig_frm_triggers (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block tag of fmb file
create table wwv_mig_frm_blocks (
    id                              number
                                        constraint wwv_mig_frm_blocks_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_blk_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_blk_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    block_comment                   clob,
    querydatasourcename             varchar2(4000),
    querydatasourcetype             varchar2(4000),
    enforcedprimarykey              varchar2(4000),
    singlerecord                    varchar2(4000),
    databaseblock                   varchar2(4000),
    updateallowed                   varchar2(4000) default 'true',
    insertallowed                   varchar2(4000) default 'true',
    recordsdisplaycount             varchar2(4000),
    backcolor                       varchar2(4000),
    recordvisualattributegroupname  varchar2(4000),
    scrollbartabpagename            varchar2(4000),
    scrollbarxposition              varchar2(4000),
    scrollbaryposition              varchar2(4000),
    showscrollbar                   varchar2(4000) default 'false',
    scrollbarlength                 varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    scrollbarcanvasname             varchar2(4000),
    dirtyinfo                       varchar2(4000),
    VisualAttributeName             varchar2(4000),
    DMLDataName                     varchar2(4000),
    DMLDataType                     varchar2(4000),
    DeleteAllowed                   varchar2(4000) default 'true',
    QueryAllowed                    varchar2(4000),
    RecordOrientation               varchar2(4000),
    EnforcedColumnSecurity          varchar2(4000),
    LockMode                        varchar2(4000),
    KeyMode                         varchar2(4000),
    NavigationStyle                 varchar2(4000),
    RecordsFetchedCount             varchar2(4000),
    RecordsBufferedCount            varchar2(4000),
    PreviousNavigationBlockName     varchar2(4000),
    NextNavigationBlockName         varchar2(4000),
    WhereClause                     varchar2(4000),
    OrderByClause                   varchar2(4000),
    ScrollbarOrientation            varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FillPattern                     varchar2(4000),
--
    DMLReturnValue                  varchar2(4000),
    IncludeRefitem                  varchar2(4000),
    PrecompSummary                  varchar2(4000),
    QueryAllRecords                 varchar2(4000),
    ReverseDirection                varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    UpdateChangedColumns            varchar2(4000),
    DMLArraySize                    varchar2(4000),
    LanguageDirection               varchar2(4000),
    MaximumQueryTime                varchar2(4000),
    MaximumRecordsFetched           varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    alias                           varchar2(4000),
    DeleteProcedureName             varchar2(4000),
    UpdateProcedureName             varchar2(4000),
    InsertProcedureName             varchar2(4000),
    LockProcedureName               varchar2(4000),
    OptionHint                      varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_blk_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    enhanced_query                  clob,
    use_query                       varchar2(30)
                                      constraint use_query_option
                                      check (use_query in ('CUSTOM', 'ENHANCED','ORIGINAL','NONE')),
    custom_query                    clob,
    original_query                  clob,
--
    created_on                      timestamp,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blocks
    before insert or update on wwv_mig_frm_blocks
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_blk_frmmdl_id_idx on wwv_mig_frm_blocks (formmodule_id);
create index wwv_mig_frm_blk_sg_id_idx on wwv_mig_frm_blocks (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> Item tag of fmb file
create table wwv_mig_frm_blk_items (
    id                              number
                                        constraint wwv_mig_frm_blk_items_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_frm_bi_blk_id_fk
                                        references wwv_mig_frm_blocks(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_bi_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    item_comment                    clob,
    label                           varchar2(4000),
    item_prompt                     varchar2(4000),
    itemtype                        varchar2(4000),
    lovname                         varchar2(4000),
    liststyle                       varchar2(4000),
    databaseitem                    varchar2(4000) default 'true',
    justification                   varchar2(4000),
    required                        varchar2(4000) default 'false',
    treeallowempbranch              varchar2(4000),
    checkedvalue                    varchar2(4000),
    uncheckedvalue                  varchar2(4000),
    initializevalue                 varchar2(4000),
    formatmask                      varchar2(4000),
    tabpagename                     varchar2(4000),
    columnname                      varchar2(4000),
    multiline                       varchar2(4000),
    maximumlength                   varchar2(4000),
    bevel                           varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    fontname                        varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fontspacing                     varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    fillpattern                     varchar2(4000),
    mousenavigate                   varchar2(4000) default 'true',
    keyboardnavigable               varchar2(4000) default 'true',
    nextnavigationitemname          varchar2(4000),
    showhorizontalscrollbar         varchar2(4000),
    showverticalscrollbar           varchar2(4000),
    compressionquality              varchar2(4000),
    canvasname                      varchar2(4000),
    dirtyinfo                       varchar2(4000),
    autohint                        varchar2(4000),
    caserestriction                 varchar2(4000),
    checkboxothervalues             varchar2(4000),
    concealdata                     varchar2(4000),
    datatype                        varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    enabled                         varchar2(4000),
    hint                            varchar2(4000),
    insertallowed                   varchar2(4000),
    itemsdisplay                    varchar2(4000),
    lockrecord                      varchar2(4000),
    queryallowed                    varchar2(4000),
    querylength                     varchar2(4000),
    rendered                        varchar2(4000),
    updateallowed                   varchar2(4000),
    validatefromlist                varchar2(4000),
    visible                         varchar2(4000),
    visualattributename             varchar2(4000),
    editname                        varchar2(4000),
    IconFilename                    varchar2(4000),
    Iconic                          varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    DisplayQuality                  varchar2(4000),
    PrimaryKey                      varchar2(4000),
    OtherValues                     varchar2(4000),
    WrapStyle                       varchar2(4000),
    FixedLength                     varchar2(4000),
    EditXPosition                   varchar2(4000),
    EditYPosition                   varchar2(4000),
    UpdateIfNull                    varchar2(4000),
    LovXPosition                    varchar2(4000),
    LovYPosition                    varchar2(4000),
    SizingStyle                     varchar2(4000),
    CaseInsensitiveQuery            varchar2(4000),
    KeepCursorPosition              varchar2(4000),
    AutoSkip                        varchar2(4000),
    ListElementCount                varchar2(4000),
    DefaultButton                   varchar2(4000),
    RecordVisualAttributeGroupName  varchar2(4000),
    SynchronizedItemName            varchar2(4000),
    PromptFontSize                  varchar2(4000),
    PromptFontName                  varchar2(4000),
    PromptFontSpacing               varchar2(4000),
    PromptFontWeight                varchar2(4000),
    PromptFontStyle                 varchar2(4000),
    PromptAlign                     varchar2(4000),
    PromptAlignOffset               varchar2(4000),
    PromptAttachmentOffset          varchar2(4000),
    PromptAttachmentEdge            varchar2(4000),
    PromptJustification             varchar2(4000),
    PromptForegroundColor           varchar2(4000),
    LowestAllowedValue              varchar2(4000),
    HighestAllowedValue             varchar2(4000),
    CopyValueFromItem               varchar2(4000),
    PromptDisplayStyle              varchar2(4000),
    LanguageDirection               varchar2(4000),
    ReadingOrder                    varchar2(4000),
    SummaryItemName                 varchar2(4000),
--
    AccessKey   varchar2(4000),
    AudioChannels   varchar2(4000),
    CalculateMode   varchar2(4000),
    CommMode    varchar2(4000),
    item_Compress    varchar2(4000),
    DataLengthSemantics varchar2(4000),
    DataSourceBlock varchar2(4000),
    DataSourceXAxis varchar2(4000),
    DataSourceYAxis varchar2(4000),
    ExecuteMode varchar2(4000),
    Filename    varchar2(4000),
    Formula varchar2(4000),
    HelpBookTopic   varchar2(4000),
    ImageDepth  varchar2(4000),
    ImageFormat varchar2(4000),
    ImplementationClass varchar2(4000),
    InitializeKeyboardDirection varchar2(4000),
    KeyboardState   varchar2(4000),
    OleActionStyle  varchar2(4000),
    OleClass    varchar2(4000),
    OleInPlaceAction    varchar2(4000),
    OleInsideOutSupport varchar2(4000),
    OlePopupMenuItems   varchar2(4000),
    OleResizStyle   varchar2(4000),
    OleShowPopupMenu    varchar2(4000),
    OleShowTenantTypeType   varchar2(4000),
    OleTenantTypeAspect varchar2(4000),
    OleTenantTypeType   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    PopupMenuName   varchar2(4000),
    PreviousNavigationItemName  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptReadingOrder  varchar2(4000),
    PromptVisualAttributeName   varchar2(4000),
    QueryName   varchar2(4000),
    QueryOnly   varchar2(4000),
    RecordGroupName varchar2(4000),
    ShowFastForward varchar2(4000),
    ShowPlay    varchar2(4000),
    ShowRecord  varchar2(4000),
    ShowRewind  varchar2(4000),
    ShowSlider  varchar2(4000),
    ShowTime    varchar2(4000),
    ShowVolume  varchar2(4000),
    SmartClass  varchar2(4000),
    SoundFormat varchar2(4000),
    SoundQuality    varchar2(4000),
    SubclassSubObject   varchar2(4000),
    SummaryBlockName    varchar2(4000),
    SummaryFunction varchar2(4000),
    Tooltip varchar2(4000),
    TooltipVisualAttributeGroup varchar2(4000),
    TreeDataQuery   varchar2(4000),
    TreeMultiSelect varchar2(4000),
    TreeShowLines   varchar2(4000),
    TreeShowSymbol  varchar2(4000),
    UpdateCommit    varchar2(4000),
    UpdateQuery varchar2(4000),
    ShowPalette varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_bi_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      timestamp,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_items
    before insert or update on wwv_mig_frm_blk_items
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_bi_blk_id_idx on wwv_mig_frm_blk_items (block_id);
create index wwv_mig_frm_bi_sg_id_idx on wwv_mig_frm_blk_items (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> Item -> Trigger tag of fmb file
create table wwv_mig_frm_blk_item_triggers (
    id                              number
                                        constraint wwv_mig_frm_blk_item_trg_pk primary key,
    item_id                        number not null
                                        constraint wwv_mig_frm_bi_trg_item_id_fk
                                        references wwv_mig_frm_blk_items(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_bi_trg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    triggertext                     clob,
    dirtyinfo                       varchar2(4000),
--
    FireInQuery                     varchar2(4000),
    ExecuteHierarchy                varchar2(4000),
    DisplayInKeyboardHelp           varchar2(4000),
    KeyboardHelpText                varchar2(4000),
    TriggerStyle                    varchar2(4000),
    trigger_Comment                 clob,
    Hide    varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentSourceLevel2ObjectName    varchar2(4000),
    ParentSourceLevel2ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TriggerInternalType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_bitrg_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_item_trg
    before insert or update on wwv_mig_frm_blk_item_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

     -- default tracking info
     --mike
     if inserting or updating then
        if :new.applicable is null then
            :new.applicable := 'Y';
        end if;
        if sys.dbms_lob.getlength(:new.triggertext) = 0 then
           :new.applicable := 'N';
        end if;
        if :new.triggertext is null or :new.triggertext = 'exit_form;' then
           :new.applicable := 'N';
        end if;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_bi_trg_item_id_idx on wwv_mig_frm_blk_item_triggers (item_id);
create index wwv_mig_frm_bi_trg_sg_id_idx on wwv_mig_frm_blk_item_triggers (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> Item -> ListItemElement tag of fmb file
create table wwv_mig_frm_blk_item_lie (
    id                              number
                                        constraint wwv_mig_frm_blk_item_lie_pk primary key,
    item_id                        number not null
                                        constraint wwv_mig_frm_bi_lie_item_id_fk
                                        references wwv_mig_frm_blk_items(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_bi_lie_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ListItemElement_index           varchar2(4000),
    value                           varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_bil_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_item_lie
    before insert or update on wwv_mig_frm_blk_item_lie
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_bi_lie_item_id_idx on wwv_mig_frm_blk_item_lie (item_id);
create index wwv_mig_frm_bi_lie_sg_id_idx on wwv_mig_frm_blk_item_lie (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> Item -> RadioButton tag of fmb file
create table wwv_mig_frm_blk_item_radio (
    id                              number
                                        constraint wwv_mig_frm_blk_item_radio_pk primary key,
    item_id                        number not null
                                        constraint wwv_mig_frm_bir_item_id_fk
                                        references wwv_mig_frm_blk_items(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_bir_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    label                           varchar2(4000),
    accesskey                       varchar2(4000),
    radiobuttonvalue                varchar2(4000),
    backcolor                       varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    dirtyinfo                       varchar2(4000),
    FontName                        varchar2(4000),
    FontWeight                      varchar2(4000),
    FontSpacing                     varchar2(4000),
--
    RadioButton_Comment             clob,
    DistanceBetweenRecords          varchar2(4000),
    Enabled varchar2(4000),
    FillPattern varchar2(4000),
    FontSize    varchar2(4000),
    FontStyle   varchar2(4000),
    ForegroundColor varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentSourceLevel2ObjectName    varchar2(4000),
    ParentSourceLevel2ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    RadioButton_Prompt  varchar2(4000),
    PromptAlign varchar2(4000),
    PromptAlignOffset   varchar2(4000),
    PromptAttachmentEdge    varchar2(4000),
    PromptAttachmentOffset  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptDisplayStyle  varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptFontName  varchar2(4000),
    PromptFontSize  varchar2(4000),
    PromptFontSpacing   varchar2(4000),
    PromptFontStyle varchar2(4000),
    PromptFontWeight    varchar2(4000),
    PromptForegroundColor   varchar2(4000),
    PromptJustification varchar2(4000),
    PromptReadingOrder  varchar2(4000),
    PromptVisualAttributeName   varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassSubObject   varchar2(4000),
    Visible varchar2(4000),
    VisualAttributeName varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_bir_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_item_radio
    before insert or update on wwv_mig_frm_blk_item_radio
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_bir_item_id_idx on wwv_mig_frm_blk_item_radio (item_id);
create index wwv_mig_frm_bir_sg_id_idx on wwv_mig_frm_blk_item_radio (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> DataSourceArgument tag of fmb file
create table wwv_mig_frm_blk_dsa (
    id                              number
                                        constraint wwv_mig_frm_blk_dsa_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_frm_blk_dsa_blk_id_fk
                                        references wwv_mig_frm_blocks(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_blk_dsa_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    type                            varchar2(4000),
    dsaname                         varchar2(4000),
    dsatype                         varchar2(4000),
    dsamode                         varchar2(4000),
    dsavalue                        varchar2(4000),
    dsatypename                     varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_blkdsa_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_dsa
    before insert or update on wwv_mig_frm_blk_dsa
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_blk_dsa_blk_id_idx on wwv_mig_frm_blk_dsa (block_id);
create index wwv_mig_frm_blk_dsa_sg_id_idx on wwv_mig_frm_blk_dsa (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> DataSourceColumn tag of fmb file
create table wwv_mig_frm_blk_dsc (
    id                              number
                                        constraint wwv_mig_frm_blk_dsc_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_frm_blk_dsc_blk_id_fk
                                        references wwv_mig_frm_blocks(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_blk_dsc_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    type                            varchar2(4000),
    dscname                         varchar2(4000),
    dsctype                         varchar2(4000),
    dscscale                        varchar2(4000),
    dscmandatory                    varchar2(4000),
    dscprecision                    varchar2(4000),
    dscnochildren                   varchar2(4000),
    dsclength                       varchar2(4000),
--
    DSCParentName                   varchar2(4000),
    DSCTypeName                     varchar2(4000),
    subclasssubobject               varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_blkdsc_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_dsc
    before insert or update on wwv_mig_frm_blk_dsc
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_blk_dsc_blk_id_idx on wwv_mig_frm_blk_dsc (block_id);
create index wwv_mig_frm_blk_dsc_sg_id_idx on wwv_mig_frm_blk_dsc (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> Trigger tag of fmb file
create table wwv_mig_frm_blk_triggers (
    id                              number
                                        constraint wwv_mig_frm_blk_trg_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_frm_blk_trg_blk_id_fk
                                        references wwv_mig_frm_blocks(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_blk_trg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    triggertext                     clob,
    dirtyinfo                       varchar2(4000),
--
    FireInQuery                     varchar2(4000),
    ExecuteHierarchy                varchar2(4000),
    DisplayInKeyboardHelp           varchar2(4000),
    KeyboardHelpText                varchar2(4000),
    TriggerStyle                    varchar2(4000),
    trigger_Comment                 clob,
    Hide    varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentSourceLevel2ObjectName    varchar2(4000),
    ParentSourceLevel2ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TriggerInternalType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_blktrg_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_triggers
    before insert or update on wwv_mig_frm_blk_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

     -- default tracking info
     --mike
     if inserting or updating then
        if :new.applicable is null then
            :new.applicable := 'Y';
        end if;
        if sys.dbms_lob.getlength(:new.triggertext) = 0 then
           :new.applicable := 'N';
        end if;
        if :new.triggertext is null or :new.triggertext = 'exit_form;' then
           :new.applicable := 'N';
        end if;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_blk_trg_blk_id_idx on wwv_mig_frm_blk_triggers (block_id);
create index wwv_mig_frm_blk_trg_sg_id_idx on wwv_mig_frm_blk_triggers (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Block -> Relation tag of fmb file
create table wwv_mig_frm_blk_relations (
    id                              number
                                        constraint wwv_mig_frm_blk_rel_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_frm_blk_rel_blk_id_fk
                                        references wwv_mig_frm_blocks(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_blk_rel_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    relationtype                    varchar2(4000),
    autoquery                       varchar2(4000),
    deleterecord                    varchar2(4000),
    detailblock                     varchar2(4000),
    joincondition                   varchar2(4000),
    preventmasterlessoperations     varchar2(4000),
    deferred                        varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    relation_Comment                clob,
    DetailItemref                   varchar2(4000),
    subclasssubobject               varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_blkrel_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_blk_relations
    before insert or update on wwv_mig_frm_blk_relations
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_blk_rel_blk_id_idx on wwv_mig_frm_blk_relations (block_id);
create index wwv_mig_frm_blk_rel_sg_id_idx on wwv_mig_frm_blk_relations (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Canvas tag of fmb file
create table wwv_mig_frm_canvas (
    id                              number
                                        constraint wwv_mig_frm_canvas_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_canvs_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_canvs_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    bevel                           varchar2(4000),
    canvastype                      varchar2(4000),
    visible                         varchar2(4000)   default 'false',
    tabattachmentedge               varchar2(4000),
    tabstyle                        varchar2(4000),
    raiseonenter                    varchar2(4000)   default 'false',
    displayviewport                 varchar2(4000)   default 'false',
    foregroundcolor                 varchar2(4000),
    backcolor                       varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    viewportwidth                   varchar2(4000),
    viewportheight                  varchar2(4000),
    viewportypositiononcanvas       varchar2(4000),
    viewportxpositiononcanvas       varchar2(4000),
    dirtyinfo                       varchar2(4000),
    windowname                      varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    ViewportXPosition               varchar2(4000),
    ViewportYPosition               varchar2(4000),
    FillPattern                     varchar2(4000),
    VisualAttributeName             varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
--
    SubclassObjectGroup             varchar2(4000) default 'false',
    LanguageDirection               varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    TabActionStyle                  varchar2(4000),
    TabWidthStyle                   varchar2(4000),
    Canvas_comment                  clob,
    HelpBookTopic                   varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PopupMenuName                   varchar2(4000),
    SmartClass                      varchar2(4000)   default 'false',
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_cnvs_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_canvas
    before insert or update on wwv_mig_frm_canvas
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_cnvs_frmmdl_id_idx on wwv_mig_frm_canvas (formmodule_id);
create index wwv_mig_frm_canvs_sg_id_idx on wwv_mig_frm_canvas (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Canvas -> Graphics tag of fmb file
create table wwv_mig_frm_cnvs_graphics (
    id                              number
                                        constraint wwv_mig_frm_cnvs_graphics_pk primary key,
    canvas_id                       number not null
                                        constraint wwv_mig_frm_cg_cnvs_id_fk
                                        references wwv_mig_frm_canvas(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_cg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
--
    AllowExpansion  varchar2(4000),
    AllowMultiLinePrompts   varchar2(4000),
    AllowStartAttachmentPrompts varchar2(4000),
    AllowTopAttachmentPrompts   varchar2(4000),
    ClipHeight  varchar2(4000),
    ClipWidth   varchar2(4000),
    ClipXPosition   varchar2(4000),
    ClipYPosition   varchar2(4000),
    Closed  varchar2(4000),
    DisplayQuality  varchar2(4000),
    Dither  varchar2(4000),
    FrameAlign  varchar2(4000),
    FrameTitleAlign varchar2(4000),
    FrameTitleBackColor varchar2(4000),
    FrameTitleFillPattern   varchar2(4000),
    FrameTitleFontName  varchar2(4000),
    FrameTitleFontSize  varchar2(4000),
    FrameTitleFontSpacing   varchar2(4000),
    FrameTitleFontStyle varchar2(4000),
    FrameTitleFontWeight    varchar2(4000),
    FrameTitleForegroundColor   varchar2(4000),
    FrameTitleVisualAttributeName   varchar2(4000),
    ImageDepth  varchar2(4000),
    ImageFilename   varchar2(4000),
    ImageFormat varchar2(4000),
    InternalEndAngle    varchar2(4000),
    InternalStartAngle  varchar2(4000),
    MaximumObjs varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    ScrollbarAlign  varchar2(4000),
    Shrinkwrap  varchar2(4000),
    SingleObjectAlign   varchar2(4000),
    SmartClass  varchar2(4000),
    StartPromptAlign    varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TabPageName varchar2(4000),
    TitleReadingOrder   varchar2(4000),
    TopPromptAlign  varchar2(4000),
    TopPromptOffset varchar2(4000),
    UpdateLayout    varchar2(4000),
    VerticalFill    varchar2(4000),
    VerticalObjectOffset    varchar2(4000),
    VisualAttributeName varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_cnvgrp_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_cnvs_graphics
    before insert or update on wwv_mig_frm_cnvs_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_cg_cnvs_id_idx on wwv_mig_frm_cnvs_graphics (canvas_id);
create index wwv_mig_frm_cg_id_idx on wwv_mig_frm_cnvs_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Canvas -> Graphics -> CompoundText tag of fmb file
create table wwv_mig_frm_cnvg_compoundtext (
    id                              number
                                        constraint wwv_mig_frm_cnvg_cpdtxt_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_frm_cpdtxt_grphs_id_fk
                                        references wwv_mig_frm_cnvs_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_cpdtxt_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_cpdtxt_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_cnvg_cpdtxt
    before insert or update on wwv_mig_frm_cnvg_compoundtext
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_cpdtxt_gphs_id_idx on wwv_mig_frm_cnvg_compoundtext (graphics_id);
create index wwv_mig_frm_cpdtxt_sg_id_idx on wwv_mig_frm_cnvg_compoundtext (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Canvas -> Graphics -> CompoundText -> TextSegment tag of fmb file
create table wwv_mig_frm_cpdtxt_textsegment (
    id                              number
                                        constraint wwv_mig_frm_cpdtxt_txtsegmt_pk primary key,
    compoundtext_id                 number not null
                                        constraint wwv_mig_frm_txtsgmt_cpd_id_fk
                                        references wwv_mig_frm_cnvg_compoundtext(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_txtsgmt_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
    Text                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_txtsgt_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_cpdtxt_txtsgmt
    before insert or update on wwv_mig_frm_cpdtxt_textsegment
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_txtsgmt_cpd_id_idx on wwv_mig_frm_cpdtxt_textsegment (compoundtext_id);
create index wwv_mig_frm_txtsgmt_sg_id_idx on wwv_mig_frm_cpdtxt_textsegment (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Canvas -> TabPage tag of fmb file
create table wwv_mig_frm_cnvs_tabpage (
    id                              number
                                        constraint wwv_mig_frm_cnvs_tabpage_pk primary key,
    canvas_id                       number not null
                                        constraint wwv_mig_frm_ctp_cnvs_id_fk
                                        references wwv_mig_frm_canvas(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_ctp_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    label                           varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    BackColor   varchar2(4000),
    tabpage_Comment varchar2(4000),
    Enabled varchar2(4000),
    FillPattern varchar2(4000),
    ForegroundColor varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassSubObject   varchar2(4000),
    Visible varchar2(4000),
    VisualAttributeName varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_cnvtp_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_cnvs_tabpage
    before insert or update on wwv_mig_frm_cnvs_tabpage
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_ctp_cnvs_id_idx on wwv_mig_frm_cnvs_tabpage (canvas_id);
create index wwv_mig_frm_ctp_sg_id_idx on wwv_mig_frm_cnvs_tabpage (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Editor tag of fmb file
create table wwv_mig_frm_editor (
    id                              number
                                        constraint wwv_mig_frm_editor_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_edtr_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_edtr_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    title                           varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    dirtyinfo                       varchar2(4000),
    parenttype                      number,
    parentname                      varchar2(4000),
    parentmodule                    varchar2(4000),
    parentmoduletype                varchar2(4000),
    editor_comment                  clob,
    bottomtitle                     varchar2(4000),
--
    ShowHorizontalScrollbar         varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    backcolor                       varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    WrapStyle                       varchar2(4000),
    fillpattern                     varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    VisualAttributeName             varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_edtr_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_editor
    before insert or update on wwv_mig_frm_editor
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_edtr_frmmdl_id_idx on wwv_mig_frm_editor (formmodule_id);
create index wwv_mig_frm_edtr_sg_id_idx on wwv_mig_frm_editor (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> LOV tag of fmb file
create table wwv_mig_frm_lov (
    id                              number
                                        constraint wwv_mig_frm_lov_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_lov_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_lov_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    title                           varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    recordgroupname                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    AutoPosition                    varchar2(4000) default 'false',
    VisualAttributeName             varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
--
    AutoColumnWidth varchar2(4000)   default 'false',
    AutoDisplay varchar2(4000)       default 'false',
    AutoRefresh varchar2(4000)       default 'false',
    AutoSelect  varchar2(4000)       default 'false',
    AutoSkip    varchar2(4000)       default 'false',
    BackColor   varchar2(4000),
    lov_Comment varchar2(4000),
    FillPattern varchar2(4000),
    FilterBeforeDisplay varchar2(4000) default 'false',
    FontName    varchar2(4000),
    FontSize    varchar2(4000),
    FontSpacing varchar2(4000),
    FontStyle   varchar2(4000),
    FontWeight  varchar2(4000),
    ForegroundColor varchar2(4000),
    LanguageDirection   varchar2(4000),
    ListType    varchar2(4000),
    OldLovText  varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass  varchar2(4000)      default 'false',
    SubclassObjectGroup varchar2(4000) default 'false',
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_lov_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_lov
    before insert or update on wwv_mig_frm_lov
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_lov_frmmdl_id_idx on wwv_mig_frm_lov (formmodule_id);
create index wwv_mig_frm_lov_sg_id_idx on wwv_mig_frm_lov (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> LOV -> LOVColumnMapping tag of fmb file
create table wwv_mig_frm_lovcolumnmapping (
    id                              number
                                        constraint wwv_mig_frm_lovcm_pk primary key,
    lov_id                          number not null
                                        constraint wwv_mig_frm_lvcm_frmmdl_id_fk
                                        references wwv_mig_frm_lov(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_lvcm_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    title                           varchar2(4000),
    returnitem                      varchar2(4000),
    displaywidth                    varchar2(4000),
    dirtyinfo                       varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_lcmp_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_lovcolmapping
    before insert or update on wwv_mig_frm_lovcolumnmapping
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_lvcm_frmmdl_id_idx on wwv_mig_frm_lovcolumnmapping (lov_id);
create index wwv_mig_frm_lvcm_sg_id_idx on wwv_mig_frm_lovcolumnmapping (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> ProgramUnit tag of fmb file
create table wwv_mig_frm_programunit (
    id                              number
                                        constraint wwv_mig_frm_programunit_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_pgut_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_pgut_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    programunittext                 clob,
    programunittype                 varchar2(4000),
--
    programunit_comment             clob,
    SubclassObjectGroup             varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000)   default 'false',
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_pgunt_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_programunit
    before insert or update on wwv_mig_frm_programunit
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_pgut_frmmdl_id_idx on wwv_mig_frm_programunit (formmodule_id);
create index wwv_mig_frm_pgut_sg_id_idx on wwv_mig_frm_programunit (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> PropertyClass tag of fmb file
create table wwv_mig_frm_propertyclass (
    id                              number
                                        constraint wwv_mig_frm_propcls_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_ppcl_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_ppcl_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    itemtype                        varchar2(4000),
    justification                   varchar2(4000),
    bevel                           varchar2(4000),
    visualattributename             varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    fontname                        varchar2(4000),
    fontspacing                     varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fillpattern                     varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_pptcls_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    Title                           varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    InheritMenu                     varchar2(4000),
    MoveAllowed                     varchar2(4000),
    HorizontalToolbarCanvasName     varchar2(4000),
    XPosition                       varchar2(4000),
    YPosition                       varchar2(4000),
    IconFilename                    varchar2(4000),
    WindowStyle                     varchar2(4000),
    HideOnExit                      varchar2(4000),
    ClearAllowed                    varchar2(4000),
    MinimizeAllowed                 varchar2(4000),
    DistanceBetweenRecords          varchar2(4000),
    Visible                         varchar2(4000),
    Iconic                          varchar2(4000),
    QueryAllowed                    varchar2(4000),
    AutoHint                        varchar2(4000),
    Enabled                         varchar2(4000),
    MouseNavigate                   varchar2(4000),
    DefaultButton                   varchar2(4000),
    ViewportXPosition               varchar2(4000),
    ViewportYPosition               varchar2(4000),
    ViewportWidth                   varchar2(4000),
    RaiseOnEnter                    varchar2(4000),
    CanvasType                      varchar2(4000),
    WindowName                      varchar2(4000),
    ResizeAllowed                   varchar2(4000),
    Modal                           varchar2(4000),
    KeyboardNavigable               varchar2(4000),
    ViewportHeight                  varchar2(4000),
    ViewportXPositionOnCanvas       varchar2(4000),
    ViewportYPositionOnCanvas       varchar2(4000),
    MaximizeAllowed                 varchar2(4000),
    ListStyle                       varchar2(4000),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_propertyclass
    before insert or update on wwv_mig_frm_propertyclass
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_ppcl_frmmdl_id_idx on wwv_mig_frm_propertyclass (formmodule_id);
create index wwv_mig_frm_ppcl_sg_id_idx on wwv_mig_frm_propertyclass (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> RecordGroup tag of fmb file
create table wwv_mig_frm_recordgroups (
    id                              number
                                        constraint wwv_mig_frm_recgp_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_recgp_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_recgrp_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    recordgroupquery                varchar2(4000),
    dirtyinfo                       varchar2(4000),
    RecordGroupType                 varchar2(4000),
    RecordGroup_Comment             clob,
--
    RecordGroupFetchSize            varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000)   default 'false',
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_recgrp_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_recordgroups
    before insert or update on wwv_mig_frm_recordgroups
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_rcgp_frmmdl_id_idx on wwv_mig_frm_recordgroups (formmodule_id);
create index wwv_mig_frm_recgrp_sg_id_idx on wwv_mig_frm_recordgroups (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> RecordGroup -> RecordGroupColumn tag of fmb file
create table wwv_mig_frm_recordgroupcolumn (
    id                              number
                                        constraint wwv_mig_frm_rgc_pk primary key,
    recordgroup_id                  number not null
                                        constraint wwv_mig_frm_rgc_recgp_id_fk
                                        references wwv_mig_frm_recordgroups(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rgc_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    columndatatype                  varchar2(4000),
    maximumlength                   varchar2(4000),
    DirtyInfo                       varchar2(4000),
--
    ColumnValuesCount               varchar2(4000),
    DataLengthSemantics             varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_rgc_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_recgrpcolumn
    before insert or update on wwv_mig_frm_recordgroupcolumn
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_rgc_recgp_id_idx on wwv_mig_frm_recordgroupcolumn (recordgroup_id);
create index wwv_mig_frm_rgc_sg_id_idx on wwv_mig_frm_recordgroupcolumn (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> VisualAttribute tag of fmb file
create table wwv_mig_frm_visualattributes (
    id                              number
                                        constraint wwv_mig_frm_visat_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_visat_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_visat_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    fontname                        varchar2(4000),
    fontspacing                     varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fillpattern                     varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
--
    VisualAttribute_comment         clob,
    FrameTitleBackColor varchar2(4000),
    FrameTitleFillPattern   varchar2(4000),
    FrameTitleFontName  varchar2(4000),
    FrameTitleFontSize  varchar2(4000),
    FrameTitleFontSpacing   varchar2(4000),
    FrameTitleFontStyle varchar2(4000),
    FrameTitleFontWeight    varchar2(4000),
    FrameTitleForegroundColor   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptFontName  varchar2(4000),
    PromptFontSize  varchar2(4000),
    PromptFontSpacing   varchar2(4000),
    PromptFontStyle varchar2(4000),
    PromptFontWeight    varchar2(4000),
    PromptForegroundColor   varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    VisualAttributeType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_visat_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_visualattr
    before insert or update on wwv_mig_frm_visualattributes
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_vsat_frmmdl_id_idx on wwv_mig_frm_visualattributes (formmodule_id);
create index wwv_mig_frm_visat_sg_id_idx on wwv_mig_frm_visualattributes (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for Module -> FormModule -> Window tag of fmb file
create table wwv_mig_frm_windows (
    id                              number
                                        constraint wwv_mig_frm_window_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_wndow_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_wndow_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    window_comment                  clob,
    title                           varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    resizeallowed                   varchar2(4000)   default 'false',
    visualattributename             varchar2(4000),
    modal                           varchar2(4000)   default 'false',
    hideonexit                      varchar2(4000)   default 'false',
    windowstyle                     varchar2(4000),
    maximizeallowed                 varchar2(4000)   default 'false',
    minimizeallowed                 varchar2(4000)   default 'false',
    dirtyinfo                       varchar2(4000),
    PrimaryCanvas                   varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    MinimizeTitle                   varchar2(4000),
    MoveAllowed                     varchar2(4000),
    HorizontalToolbarCanvasName     varchar2(4000),
    XPosition                       varchar2(4000),
    YPosition                       varchar2(4000),
    IconFilename                    varchar2(4000),
    ClearAllowed                    varchar2(4000),
--
    BackColor   varchar2(4000),
    Bevel   varchar2(4000),
    FillPattern varchar2(4000),
    FontName    varchar2(4000),
    FontSize    varchar2(4000),
    FontSpacing varchar2(4000),
    FontStyle   varchar2(4000),
    FontWeight  varchar2(4000),
    ForegroundColor varchar2(4000),
    HelpBookTopic   varchar2(4000),
    InheritMenu varchar2(4000)     default 'false',
    LanguageDirection   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000)   default 'false',
    SubclassObjectGroup varchar2(4000)   default 'false',
    VerticalToolbarCanvasName   varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_frm_window_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
--  Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_windows
    before insert or update on wwv_mig_frm_windows
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_wndw_frmmdl_id_idx on wwv_mig_frm_windows (formmodule_id);
create index wwv_mig_frm_wndow_sg_id_idx on wwv_mig_frm_windows (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- Revision Tables
------------------

--
-- wwv_mig_frm_rev_apex_app table to hold APEX generated app information
--
create table wwv_mig_frm_rev_apex_app (
    id                              number
                                        constraint wwv_mig_frm_rev_apex_app_pk primary key,
    project_id                      number not null
                                        constraint wwv_mig_frm_rev_apex_app_fk
                                        references wwv_mig_projects(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rev_apxapp_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    flow_id                         number(11) not null,
    page_id                         number not null,
    list_template_name              varchar2(400),
    list_item_type                  varchar2(100),
    list_item_icon                  varchar2(400),
    owner                           varchar2(400),
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create index wwv_mig_frm_revapxap_prjid_idx on wwv_mig_frm_rev_apex_app(project_id);
create index wwv_mig_frm_revapxap_sgid_idx on wwv_mig_frm_rev_apex_app(security_group_id);

create or replace trigger wwv_biu_mig_frm_rev_apex_app
    before insert or update on  wwv_mig_frm_rev_apex_app
    for each row
begin
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- last updated
    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
end;
/
-----------------------------------------------------------------------------------

create table wwv_mig_frm_rev_formmodules (
    id                              number
                                        constraint wwv_mig_frm_rev_formmodules_pk primary key,
    formmodule_id                   number not null
                                        constraint wwv_mig_frm_rev_frmmdl_id_fk
                                        references wwv_mig_frm_formmodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rev_fmdl_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    title                           varchar2(4000),
    consolewindow                   varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_rev_frmmdl_sel
                                        check (select_for_app in ('Y', 'N')),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_rev_formmodule
    before insert or update on wwv_mig_frm_rev_formmodules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_rev_frmmdl_id_idx on wwv_mig_frm_rev_formmodules (formmodule_id);
create index wwv_mig_frm_rev_fmdl_sg_id_idx on wwv_mig_frm_rev_formmodules (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

create table wwv_mig_frm_rev_blocks (
    id                              number
                                        constraint wwv_mig_frm_rev_blocks_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_frm_rev_blocks_id_fk
                                        references wwv_mig_frm_blocks(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rev_blk_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    querydatasourcename             varchar2(4000),
    querydatasourcetype             varchar2(4000),
    enforcedprimarykey              varchar2(4000),
    singlerecord                    varchar2(4000),
    databaseblock                   varchar2(4000),
    updateallowed                   varchar2(4000),
    insertallowed                   varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_rev_blk_sel
                                        check (select_for_app in ('Y', 'N')),
--
    created_on                      timestamp,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_rev_blocks
    before insert or update on wwv_mig_frm_rev_blocks
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_rev_blocks_id_idx on wwv_mig_frm_rev_blocks (block_id);
create index wwv_mig_frm_rev_blk_sg_id_idx on wwv_mig_frm_rev_blocks (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

create table wwv_mig_frm_rev_blk_items (
    id                              number
                                        constraint wwv_mig_frm_rev_blk_items_pk primary key,
    item_id                         number not null
                                        constraint wwv_mig_frm_rev_bi_item_id_fk
                                        references wwv_mig_frm_blk_items(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rev_bi_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    label                           varchar2(4000),
    item_prompt                     varchar2(4000),
    itemtype                        varchar2(4000),
    lovname                         varchar2(4000),
    lov_query                       clob,
    liststyle                       varchar2(4000),
    databaseitem                    varchar2(4000),
    justification                   varchar2(4000),
    required                        varchar2(4000),
    checkedvalue                    varchar2(4000),
    uncheckedvalue                  varchar2(4000),
    initializevalue                 varchar2(4000),
    formatmask                      varchar2(4000),
    tabpagename                     varchar2(4000),
    columnname                      varchar2(4000),
    multiline                       varchar2(4000),
    maximumlength                   varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_rev_bi_sel
                                        check (select_for_app in ('Y', 'N')),
--
    created_on                      timestamp,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_rev_blk_items
    before insert or update on wwv_mig_frm_rev_blk_items
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_rev_bi_item_id_idx on wwv_mig_frm_rev_blk_items (item_id);
create index wwv_mig_frm_rev_bi_sg_id_idx on wwv_mig_frm_rev_blk_items (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
create table wwv_mig_frm_rev_lov (
    id                              number
                                        constraint wwv_mig_frm_rev_lov_pk primary key,
    lov_id                          number not null
                                        constraint wwv_mig_frm_rev_lov_id_fk
                                        references wwv_mig_frm_lov(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rev_lov_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                            varchar2(4000),
    title                           varchar2(4000),
    recordgroupname                 varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_lov_select
                                        check (select_for_app in ('Y','N')),
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_rev_lov
    before insert or update on wwv_mig_frm_rev_lov
    for each row
begin
    -- insert unique primary key for id
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/


create index wwv_mig_frm_rev_lov_id_idx on wwv_mig_frm_rev_lov (lov_id);
create index wwv_mig_frm_rev_lov_sg_idx on wwv_mig_frm_rev_lov (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
create table wwv_mig_frm_rev_lovcolmaps (
    id                              number
                                        constraint wwv_mig_frm_rev_lcm_pk primary key,
    colmap_id                          number not null
                                        constraint wwv_mig_frm_rev_lcm_id_fk
                                        references wwv_mig_frm_lovcolumnmapping(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_frm_rev_lcm_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                            varchar2(4000),
    title                           varchar2(4000),
    returnitem                      varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_frm_lcm_select
                                        check (select_for_app in ('Y','N')),
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_frm_rev_lcm
    before insert or update on wwv_mig_frm_rev_lovcolmaps
    for each row
begin
    -- insert unique primary key for id
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_frm_rev_lcm_id_idx on wwv_mig_frm_rev_lovcolmaps (colmap_id);
create index wwv_mig_frm_rev_lcm_sg_idx on wwv_mig_frm_rev_lovcolmaps (security_group_id);

-----------------------------------------------------------------------------------------------------------------------
--Oracle Reports Tables
--
-- WWV_MIG_RPTS - Parent Table for Oracle Reports Metadata
--
create table wwv_mig_rpts (
    id                              number
                                        constraint wwv_mig_rpts_pk primary key,
    project_id                      number not null
                                        constraint wwv_mig_rpts_project_id_fk
                                        references wwv_mig_projects(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_rpts_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    description                     varchar2(4000),
    file_name                       varchar2(255),
    file_mime_type                  varchar2(255),
    file_content                    blob,
    xml_content                     sys.xmltype,
    file_char_set                   varchar2(255),
    file_updated_on                 date,
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_rpts_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                     varchar2(1) default 'Y',
    complete                       varchar2(1) default 'N',
    priority                       number(1,0) default 3,
    assignee                       varchar2(255),
    notes                          varchar2(4000),
    tags                           varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400),
                                        constraint wwv_mig_rpts_uk
                                        unique (file_name, project_id)
)
/

create or replace trigger wwv_biu_mig_rpts
    before insert or update on wwv_mig_rpts
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/
prompt ...trigger wwv_aiu_mig_rpts
create or replace trigger wwv_aiu_mig_rpts
    after insert or update on wwv_mig_rpts
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/


create index wwv_mig_rpts_project_id_idx on wwv_mig_rpts (project_id);
create index wwv_mig_rpts_sg_id_idx on wwv_mig_rpts (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_REPORT
--
create table wwv_mig_report (
    id                              number
                                        constraint wwv_mig_rep_pk primary key,
    file_id                         number not null
                                        constraint wwv_mig_rep_file_id_fk
                                        references wwv_mig_rpts(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_rep_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    dtdversion                      varchar2(20),
    name                            varchar2(4000),
    title                           varchar2(4000),
    beforeparameterformtrigger      varchar2(4000),
    afterparameterformtrigger       varchar2(4000),
    beforereporttrigger             varchar2(4000),
    betweenpagestrigger             varchar2(4000),
    afterreporttrigger              varchar2(4000),
    unitofmeasurement               varchar2(10) default 'inch'
                                        constraint wwv_mig_rep_unit_measure
                                        check (unitofmeasurement in ('inch','centimeter','point')),
    previewertitle                  varchar2(4000),
    designincharacterunits          varchar2(4000) default 'no'
                                        constraint wwv_mig_rep_designunit
                                        check (designincharacterunits in ('yes','no')),
    xmltag                          varchar2(4000),
    xmltagattrs                     varchar2(4000),
    xmlprologtype                   varchar2(4000),
    xmlprologvalue                  varchar2(4000),
    xmlprologtext                   varchar2(4000),
    xmlprologfile                   varchar2(4000),
    author                          varchar2(4000),
-- Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_rep_select_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_report
    before insert or update on wwv_mig_report
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_rep_file_id_idx on wwv_mig_report (file_id);
create index wwv_mig_rep_sg_id_idx on wwv_mig_report (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_DATA
--
create table wwv_mig_rpt_data (
    id                              number
                                        constraint wwv_mig_repdata_pk primary key,
    report_id                       number not null
                                        constraint wwv_mig_repdata_id_fk
                                        references wwv_mig_report(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_repdata_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_repdata_select_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_repdata
    before insert or update on wwv_mig_rpt_data
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_repdata_file_id_idx on wwv_mig_rpt_data (report_id);
create index wwv_mig_repdata_sg_id_idx on wwv_mig_rpt_data (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_RPT_DATASRC
--
create table wwv_mig_rpt_datasrc (
    id                                  number
                                        constraint wwv_mig_repsrc_pk primary key,
    data_id                             number not null
                                        constraint wwv_mig_repsrc_id_fk
                                        references wwv_mig_rpt_data(id) on delete cascade,
    security_group_id                   number not null
                                        constraint wwv_mig_repsrc_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                                varchar2(4000),
    defaultgroupname                    varchar2(4000),
    maxRows                             varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_repsrc_select_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_repsrc
    before insert or update on wwv_mig_rpt_datasrc
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_repsrc_file_id_idx on wwv_mig_rpt_datasrc (data_id);
create index wwv_mig_repsrc_sg_id_idx on wwv_mig_rpt_datasrc (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_RPT_DATASRC_SELECT
--
create table wwv_mig_rpt_datasrc_select (
    id                              number
                                     constraint wwv_mig_select_pk primary key,
    datasrc_id                      number not null
                                     constraint wwv_mig_select_id_fk
                                     references wwv_mig_rpt_datasrc(id) on delete cascade,
    security_group_id               number not null
                                     constraint wwv_mig_select_sg_id_fk
                                     references wwv_flow_companies(provisioning_company_id) on delete cascade,
    canparse                        varchar2(10) default 'yes'
                                     constraint wwv_mig_select_parse
                                     check (canparse in ('yes','no')),
    externalqueryfile               varchar2(4000),
    cdata                           clob,
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_select_select_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_select
    before insert or update on wwv_mig_rpt_datasrc_select
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_select_file_id_idx on wwv_mig_rpt_datasrc_select (datasrc_id);
create index wwv_mig_select_sg_id_idx on wwv_mig_rpt_datasrc_select (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_RPT_DATASRC_GRP
--
create table wwv_mig_rpt_datasrc_grp (
    id                                  number
                                        constraint wwv_mig_grp_pk primary key,
    datasrc_id                          number not null
                                        constraint wwv_mig_grp_id_fk
                                        references wwv_mig_rpt_datasrc(id) on delete cascade,
    security_group_id                   number not null
                                        constraint wwv_mig_grp_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                                varchar2(4000),
    fillcolor                           varchar2(4000),
    linecolor                           varchar2(4000),
    formattrigger                       clob,
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_grp_select_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp
    before insert or update on wwv_mig_rpt_datasrc_grp
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_file_id_idx on wwv_mig_rpt_datasrc_grp (datasrc_id);
create index wwv_mig_grp_sg_id_idx on wwv_mig_rpt_datasrc_grp (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_GRP_DATAITEM
--
create table wwv_mig_rpt_grp_dataitem (
    id                                  number
                                          constraint wwv_mig_grp_dataitem_pk primary key,
    group_id                            number not null
                                          constraint wwv_mig_grp_dataitem_id_fk
                                          references wwv_mig_rpt_datasrc_grp(id) on delete cascade,
    security_group_id                   number not null
                                          constraint wwv_mig_grp_item_sg_id_fk
                                          references wwv_flow_companies(provisioning_company_id) on delete cascade,
    itemid_readonly                     varchar2(10),
    name                                varchar2(1000),
    datatype                            varchar2(10) default 'number'
                                          constraint wwv_mig_grp_item_type
                                          check (datatype in ('character','number',
                                                              'date','graphic',
                                                              'long','raw',
                                                              'longRaw','vchar2',
                                                              'vchar','rowid',
                                                              'mlabel','ref',
                                                              'object','collect',
                                                              'blob','clob',
                                                              'nclob','bfile','unknown' )),
    oracledatatype                     varchar2(20)   default 'character',
    javadatatype                       varchar2(20)   default 'null',
    width                              varchar2(4000) default '10',
    columnorder                        varchar2(1000),
    label                              varchar2(4000),
    defaultwidth                       varchar2(4000),
    defaultheight                      varchar2(4000),
    valueifnull                        varchar2(4000),
    inputmask                          varchar2(4000),
    sourcecolumn                       varchar2(4000),
    readfromfile                       varchar2(3)   default 'no'
                                         constraint wwv_mig_grp_item_read
                                         check (readfromfile in ('yes','no')),
    fileformat                         varchar2(15) default 'text'
                                         constraint wwv_mig_grp_fileformat
                                         check (fileformat in ('text','image',
                                                               'CGM','OracleDrawing',
                                                               'OracleImage','sound',
                                                               'video','OLE2','imageURL')),
    breakorder                         varchar2(10) default 'ascending'
                                         constraint wwv_mig_grp_breakorder
                                         check (breakorder in ('none','ascending','descending')),
    plsqlrefid_readonly                varchar2(4000),
    columnFlags                        varchar2(4000),
    defaultLabel                       varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_grpitem_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_item
    before insert or update on wwv_mig_rpt_grp_dataitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_item_id_idx on wwv_mig_rpt_grp_dataitem (group_id);
create index wwv_mig_grpitem_sg_id_idx on wwv_mig_rpt_grp_dataitem (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_RPT_GRP_DATAITEM_DESC
--
create table wwv_mig_rpt_grp_dataitem_desc (
    id                                  number
                                          constraint wwv_mig_grp_itemdesc_pk primary key,
    item_id                             number not null
                                          constraint wwv_mig_grp_itemdesc_id_fk
                                          references wwv_mig_rpt_grp_dataitem(id) on delete cascade,
    security_group_id                   number not null
                                          constraint wwv_mig_grp_itemdesc_sg_id_fk
                                          references wwv_flow_companies(provisioning_company_id) on delete cascade,
    alias                               varchar2(4000),
    expression                          varchar2(4000),
    descriptiveexpression               varchar2(4000),
    datadescriptor_order                varchar2(4000),
    datatype                            varchar2(10) default 'number'
                                          constraint wwv_mig_grp_itemdesc_type
                                          check (datatype in('character','number',
                                                             'date','graphic',
                                                             'long','raw',
                                                             'longRaw','vchar2',
                                                             'vchar','rowid',
                                                             'mlabel','ref','object',
                                                             'collect','blob','clob',
                                                             'nclob','bfile','unknown')),
    oracledatatype                      varchar2(4000) default 'character',
    width                               varchar2(4000),
    scale                               varchar2(4000),
    precision                           varchar2(4000),
    refdescendant                       varchar2(3) default 'no'
                                          constraint wwv_mig_grp_itemdesc_desc
                                          check (refdescendant in('yes','no')),
    relationoperands                    varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_itemdesc_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_itemdesc
    before insert or update on wwv_mig_rpt_grp_dataitem_desc
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_itemdesc_id_idx on wwv_mig_rpt_grp_dataitem_desc (item_id);
create index wwv_mig_grp_itemdesc_sg_id_idx on wwv_mig_rpt_grp_dataitem_desc (security_group_id);
---------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_GRP_DATAITEM_PRIV
--
create table wwv_mig_rpt_grp_dataitem_priv (
    id                              number
                                      constraint wwv_mig_grp_itempriv_pk primary key,
    item_id                         number not null
                                      constraint wwv_mig_grp_itempriv_id_fk
                                      references wwv_mig_rpt_grp_dataitem(id) on delete cascade,
    security_group_id               number not null
                                      constraint wwv_mig_grp_itempriv_sg_id_fk
                                      references wwv_flow_companies(provisioning_company_id) on delete cascade,
    sqldatatype                     varchar2(4000),
    adtName                         varchar2(4000),
    schemaname                      varchar2(4000),
    refexpanded                     varchar2(30) default 'no'
                                      constraint wwv_mig_rpt_grp_itempriv_ref
                                      check (refexpanded in ('yes','no')),
    displaywithparentcolumn         varchar2(3) default 'no'
                                      constraint wwv_mig_rpt_grp_itempriv_dis
                                      check (displaywithparentcolumn in ('yes','no')),
    parentcolumn                    varchar2(4000),
    cdata                           clob,
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_itempriv_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_itempriv
    before insert or update on wwv_mig_rpt_grp_dataitem_priv
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_itempriv_id_idx on wwv_mig_rpt_grp_dataitem_priv (item_id);
create index wwv_mig_grp_itempriv_sg_id_idx on wwv_mig_rpt_grp_dataitem_priv (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_GRP_SUMMARY
--
create table wwv_mig_rpt_grp_summary (
    id                                  number
                                          constraint wwv_mig_grp_sum_pk primary key,
    group_id                            number not null
                                          constraint wwv_mig_grp_sum_id_fk
                                          references wwv_mig_rpt_datasrc_grp(id) on delete cascade,
    security_group_id                   number not null
                                          constraint wwv_mig_grp_sum_sg_id_fk
                                          references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                                varchar2(4000),
    source                              varchar2(4000),
    function                            varchar2(15) default 'sum'
                                          constraint wwv_mig_grp_sum_func
                                          check (function in ('sum','average','median',
                                                              'minimum','maximum','count',
                                                              'first','last','percentOfTotal',
                                                              'percentile','stdDeviation','variance')),
    width                               varchar2(4000) default '10',
    scale                               varchar2(4000) default '0',
    precision                           varchar2(4000) default '0',
    compute                             varchar2(4000),
    reset                               varchar2(4000),
    productOrder                        varchar2(4000),
    valueIfNull                         varchar2(4000),
    readFromFile                        varchar2(3) default 'no'
                                          constraint wwv_mig_grp_sum_read
                                          check (readfromfile in ('yes','no')),
    fileFormat                          varchar2(15) default 'text'
                                          constraint wwv_mig_grp_sum_format
                                          check (fileformat in ('text','image','CGM',
                                                                'OracleDrawing','OracleImage',
                                                                'sound','video','OLE2','imageURL')),
    nullval                             varchar2(4000),
    defaultWidth                        varchar2(4000),
    defaultHeight                       varchar2(4000),
    columnFlags                         varchar2(4000),
    defaultLabel                        varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_grpsum_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_sum
    before insert or update on wwv_mig_rpt_grp_summary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_sum_id_idx on wwv_mig_rpt_grp_summary (group_id);
create index wwv_mig_grpsum_sg_id_idx on wwv_mig_rpt_grp_summary (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_GRP_FORMULA
--
create table wwv_mig_rpt_grp_formula (
    id                                  number
                                          constraint wwv_mig_grp_form_pk primary key,
    group_id                            number not null
                                          constraint wwv_mig_grp_form_id_fk
                                          references wwv_mig_rpt_datasrc_grp(id) on delete cascade,
    security_group_id                   number not null
                                          constraint wwv_mig_grp_form_sg_id_fk
                                          references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                                varchar2(4000),
    source                              varchar2(4000),
    datatype                            varchar2(10) default 'number'
                                          constraint wwv_mig_rpt_grp_form_type
                                          check (datatype in ('number','character','date')),
    valueifnull                         varchar2(4000),
    valueifnullformatmask               varchar2(4000),
    breakorder                          varchar2(15) default 'ascending'
                                          constraint wwv_mig_rpt_grp_form_brk
                                          check (breakorder in ('none','ascending','descending')),
    productorder                        varchar2(4000),
    readfromfile                        varchar2(3) default 'no'
                                          constraint wwv_mig_rpt_grp_form_fle
                                          check (readfromfile in ('yes','no')),
    fileformat                          varchar2(20) default 'text'
                                          constraint wwv_mig_rpt_grp_form_fmt
                                          check (fileformat in ('text','image','CGM',
                                                                'OracleDrawing','OracleImage',
                                                                'sound','video','OLE2','imageURL')),
    width                               varchar2(4000) default '10',
    scale                               varchar2(4000) default '0',
    precision                           varchar2(4000) default '0',
    templatesection                     varchar2(10) default 'none'
                                          constraint wwv_mig_rpt_grp_temp
                                          check (templatesection in ('none','header','main','trailer')),
    defaultwidth                        varchar2(4000),
    defaultheight                       varchar2(4000),
    columnflags                         varchar2(4000),
    defaultlabel                        varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_grpform_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_form
    before insert or update on wwv_mig_rpt_grp_formula
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_form_id_idx on wwv_mig_rpt_grp_formula (group_id);
create index wwv_mig_grpform_sg_id_idx on wwv_mig_rpt_grp_formula (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_GRP_ROWDELIMITER
--
create table wwv_mig_rpt_grp_rowdelim (
    id                                  number
                                          constraint wwv_mig_grp_row_pk primary key,
    group_id                            number not null
                                          constraint wwv_mig_grp_row_id_fk
                                          references wwv_mig_rpt_datasrc_grp(id) on delete cascade,
    security_group_id                   number not null
                                          constraint wwv_mig_grp_row_sg_id_fk
                                          references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                                varchar2(4000),
    formattrigger                       varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_grprow_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_row
    before insert or update on wwv_mig_rpt_grp_rowdelim
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_row_id_idx on wwv_mig_rpt_grp_rowdelim (group_id);
create index wwv_mig_grprow_sg_id_idx on wwv_mig_rpt_grp_rowdelim (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_GRP_FILTER
--
create table wwv_mig_rpt_grp_filter (
    id                              number
                                     constraint wwv_mig_grp_fltr_pk primary key,
    group_id                        number not null
                                     constraint wwv_mig_grp_fltr_id_fk
                                     references wwv_mig_rpt_datasrc_grp(id) on delete cascade,
    security_group_id               number not null
                                    constraint wwv_mig_grp_fltr_sg_id_fk
                                     references wwv_flow_companies(provisioning_company_id) on delete cascade,
    type                            varchar2(5) default'first'
                                     constraint wwv_mig_grp_fltr_type
                                     check (type in ('plsql','first','last')),
    plsqlfilter                     varchar2(4000),
    numberofrecords                 varchar2(4000),
    --  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_fltr_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_filter
    before insert or update on wwv_mig_rpt_grp_filter
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_fltr_id_idx on wwv_mig_rpt_grp_filter (group_id);
create index wwv_mig_grpfltr_sg_id_idx on wwv_mig_rpt_grp_filter (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_GRP_FIELD
--
create table wwv_mig_rpt_grp_field (
    id                              number
                                     constraint wwv_mig_grp_fld_pk primary key,
    group_id                        number not null
                                     constraint wwv_mig_grp_fld_id_fk
                                     references wwv_mig_rpt_datasrc_grp(id) on delete cascade,
    security_group_id               number not null
                                    constraint wwv_mig_grp_fld_sg_id_fk
                                     references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                            varchar2(4000),
    source                          varchar2(4000),
    pageNumber                      varchar2(4000),
    minWidowLines                   varchar2(4000),
    label                           varchar2(4000),
    display                         varchar2(4000),
    width                           varchar2(4000),
    visible                         varchar2(3) default 'yes'
                                      constraint wwv_mig_rpt_grp_fld_vis
                                      check (visible in ('yes','no')),
    hyperlink                       varchar2(4000),
    formatMask                      varchar2(4000),
    nullValue                       varchar2(4000),
    spacing                         varchar2(4000),
    currency                        varchar2(4000),
    tsep                            varchar2(4000),
    linkdest                        varchar2(4000),
    breakOrder                      varchar2(15)
                                      constraint wwv_mig_rpt_grp_fld_brk
                                      check (breakorder in ('none','ascending','descending')),
    font                            varchar2(4000),
    fontSize                        varchar2(4000),
    fontStyle                       varchar2(10) default 'regular'
                                      constraint wwv_mig_rpt_grp_fld_st
                                      check (fontstyle in ('regular','italic','bold','boldItalic')),
    fontEffect                      varchar2(20) default 'regular'
                                      constraint wwv_mig_rpt_grp_fld_ef
                                      check (fonteffect in ('regular','strikeout','underline','strikeoutUnderline')),
    lineColor                       varchar2(4000),
    fillColor                       varchar2(4000),
    textColor                       varchar2(4000),
    alignment                       varchar2(10) default 'start'
                                      constraint wwv_mig_rpt_grp_fld_align
                                      check (alignment in ('start','left','center','right','end','flush')),
    formatTrigger                   varchar2(4000),
    templateSection                 varchar2(10) default 'none'
                                       constraint wwv_mig_rpt_grp_fld_temp
                                       check (templatesection in ('none','header','main','trailer')),
    --  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_fld_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_grp_field
    before insert or update on wwv_mig_rpt_grp_field
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_grp_fld_id_idx on wwv_mig_rpt_grp_field (group_id);
create index wwv_mig_grpfld_sg_id_idx on wwv_mig_rpt_grp_field (security_group_id);
-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_DATA_SUMMARY
--
create table wwv_mig_rpt_data_summary (
    id                                  number
                                          constraint wwv_mig_repsum_pk primary key,
    data_id                             number not null
                                        constraint wwv_mig_repsum_id_fk
                                        references wwv_mig_rpt_data(id) on delete cascade,
    security_group_id                   number not null
                                        constraint wwv_mig_repsum_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    name                                varchar2(4000),
    source                              varchar2(4000),
    function                            varchar2(15) default 'sum'
                                          constraint wwv_mig_repsum_func
                                          check (function in ('sum','average','median',
                                                              'minimum','maximum','count',
                                                              'first','last','percentOfTotal',
                                                              'percentile','stdDeviation','variance')),
    width                               varchar2(4000) default '10',
    scale                               varchar2(4000) default '0',
    precision                           varchar2(4000) default '0',
    compute                             varchar2(4000),
    reset                               varchar2(4000),
    productOrder                        varchar2(4000),
    valueIfNull                         varchar2(4000),
    readFromFile                        varchar2(3) default 'no'
                                          constraint wwv_mig_repsum_read
                                          check (readfromfile in ('yes','no')),
    fileFormat                          varchar2(15) default 'text'
                                          constraint wwv_mig_repsum_format
                                          check (fileformat in ('text','image','CGM',
                                                                'OracleDrawing','OracleImage',
                                                                'sound','video','OLE2','imageURL')),
    nullval                             varchar2(4000),
    defaultWidth                        varchar2(4000),
    defaultHeight                       varchar2(4000),
    columnFlags                         varchar2(4000),
    defaultLabel                        varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_repsum_select_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_rpt_datasum
    before insert or update on wwv_mig_rpt_data_summary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_rpt_datasum_id_idx on wwv_mig_rpt_data_summary (data_id);
create index wwv_mig_rpt_datasum_sg_id_idx on wwv_mig_rpt_data_summary (security_group_id);

-----------------------------------------------------------------------------------------------------------------------
-- WWV_MIG_RPT_REPORTPRIVATE
--
create table wwv_mig_rpt_reportprivate (
    id                              number
                                        constraint wwv_mig_rptpriv_pk primary key,
    report_id                       number not null
                                        constraint wwv_mig_rptpriv_id_fk
                                        references wwv_mig_report(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_rptpriv_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
    defaultReportType               varchar2(4000),
    versionFlags                    varchar2(4000),
    versionFlags2                   varchar2(4000),
    lastModified                    varchar2(4000),
    charPromptMustSplit             varchar2(4000),
    charPromptMaySplit              varchar2(4000),
    minFieldResizeRate              varchar2(4000),
    minFontPoints                   varchar2(4000),
    templateName                    varchar2(4000),
    isCustomName                    varchar2(4000),
    mailText                        varchar2(4000),
    textTokenfile                   varchar2(4000),
    imageTokenfile                  varchar2(4000),
    sectionTitle                    varchar2(4000),
--  Tracking information
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_rptpriv_select_for_app
                                        check (select_for_app in ('Y', 'N')),
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_rptpriv
    before insert or update on wwv_mig_rpt_reportprivate
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_rptpriv_file_id_idx on wwv_mig_rpt_reportprivate (report_id);
create index wwv_mig_rptpriv_sg_id_idx on wwv_mig_rpt_reportprivate (security_group_id);
-----------------------------------------------------------------------------------------

--Oracle Forms Menus Tables
--
-- WWV_MIG_FRM_MENUS
--
create table wwv_mig_frm_menus (
    id                              number
                                        constraint wwv_mig_menus_pk primary key,
    project_id                      number not null
                                        constraint wwv_mig_menus_project_id_fk
                                        references wwv_mig_projects(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_menus_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    description                     varchar2(4000),
    file_name                       varchar2(255),
    file_mime_type                  varchar2(255),
    file_content                    blob,
    xml_content                     sys.xmltype,
    file_char_set                   varchar2(255),
    file_updated_on                 date,
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_mnu_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                     varchar2(1) default 'Y',
    complete                       varchar2(1) default 'N',
    priority                       number(1,0) default 3,
    assignee                       varchar2(255),
    notes                          varchar2(4000),
    tags                           varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400),
                                        constraint wwv_mig_menus_uk
                                        unique (file_name, project_id)
)
/

create or replace trigger wwv_biu_mig_menus
    before insert or update on wwv_mig_frm_menus
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/
prompt ...trigger wwv_aiu_mig_frm_menus
create or replace trigger wwv_aiu_mig_frm_menus
    after insert or update on wwv_mig_frm_menus
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/


create index wwv_mig_menus_project_id_idx on wwv_mig_frm_menus (project_id);
create index wwv_mig_menus_sg_id_idx on wwv_mig_frm_menus (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_MENU_MODULES
create table wwv_mig_frm_menus_modules (
    id                              number
                                        constraint wwv_mig_mnu_modules_pk primary key,
    file_id                         number not null
                                        constraint wwv_mig_mnu_modules_file_id_fk
                                        references wwv_mig_frm_menus(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_mnu_modules_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    version                         varchar2(255),
    xmlns                           varchar2(255),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_mnu_mdl_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnu_modules
    before insert or update on wwv_mig_frm_menus_modules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_mnu_module_file_id_idx on wwv_mig_frm_menus_modules (file_id);
create index wwv_mig_mnu_modules_sg_id_idx on wwv_mig_frm_menus_modules (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_MENU_MENUMODULES
create table wwv_mig_frm_menus_menumodules (
    id                              number
                                        constraint wwv_mig_mnu_mnumodules_pk primary key,
    module_id                       number not null
                                        constraint wwv_mig_mnu_mnumdl_mdl_id_fk
                                        references wwv_mig_frm_menus_modules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_mnu_mnumdl_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    dirtyinfo                       varchar2(4000),
    rolecount                       varchar2(4000),
    mainmenu                        varchar2(4000),
    startupcode                     clob,
    menudirectory                   varchar2(4000),
    menumodule_comment              clob,
    usesecurity                     varchar2(4000) default 'false',
    sharelibrary                    varchar2(4000) default 'true',
    menufilename                    varchar2(4000),
--
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_mnu_mnumdl_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnu_mnumodules
    before insert or update on wwv_mig_frm_menus_menumodules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_mnu_mnumdl_mdl_id_idx on wwv_mig_frm_menus_menumodules (module_id);
create index wwv_mig_mnu_mnumdl_sg_id_idx on wwv_mig_frm_menus_menumodules (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_MENU_MENUMODULEROLES
create table wwv_mig_frm_menusmoduleroles (
    id                              number
                                        constraint wwv_mig_mmodrole_pk primary key,
    menumodule_id                   number not null
                                        constraint wwv_mig_mmodrole_id_fk
                                        references wwv_mig_frm_menus_menumodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_mmodrole_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    menumodulerole_index            varchar2(4000),
    menumodulerole_value            varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_mmodrole_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnu_modroles
    before insert or update on wwv_mig_frm_menusmoduleroles
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_mnu_modrole_id_idx on wwv_mig_frm_menusmoduleroles (menumodule_id);
create index wwv_mig_mnu_modrole_sg_id_idx on wwv_mig_frm_menusmoduleroles (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_FRM_MENU
create table wwv_mig_frm_menu (
    id                              number
                                        constraint wwv_mig_mnu_pk primary key,
    menumodule_id                   number not null
                                        constraint wwv_mig_mnu_id_fk
                                        references wwv_mig_frm_menus_menumodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_mnu_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    parenttype                      varchar2(4000),
    dirtyinfo                       varchar2(4000),
    parentname                      varchar2(4000),
    tearoffmenu                     varchar2(4000) default 'false',
    parentmodule                    varchar2(4000),
    menu_comment                    clob,
    parentmoduletype                varchar2(4000),
--
    BottomTitle                     varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    SubTitle                        varchar2(4000),
    Title                           varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_mnu_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnu
    before insert or update on wwv_mig_frm_menu
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_mnu_id_idx on wwv_mig_frm_menu (menumodule_id);
create index wwv_mig_mnu_sg_id_idx on wwv_mig_frm_menu (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_FRM_MENU_MENUITEM
create table wwv_mig_frm_menu_menuitem (
    id                              number
                                        constraint wwv_mig_mnuitem_pk primary key,
    menu_id                         number not null
                                        constraint wwv_mig_mnuitem_id_fk
                                        references wwv_mig_frm_menu(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_mnuitem_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    label                           varchar2(4000),
    visibleinmenu                   varchar2(4000) default 'true',
    submenuname                     varchar2(4000),
    iconinmenu                      varchar2(4000) default 'false',
    iconfilename                    varchar2(4000),
    fontsize                        varchar2(4000),
    dirtyinfo                       varchar2(4000),
    fontname                        varchar2(4000),
    menuitem_comment                clob,
    parentmodule                    varchar2(4000),
    magicitem                       varchar2(4000) default 'Cut',
    parentmoduletype                varchar2(4000),
    menuitemtype                    varchar2(4000) default 'Plain',
    fontspacing                     varchar2(4000),
    parenttype                      varchar2(4000),
    keyboardaccelerator             varchar2(4000),
    rolecount                       varchar2(4000),
    hint                            varchar2(4000),
    parentsourcelevel1objectname    varchar2(4000),
    parentname                      varchar2(4000),
    fontweight                      varchar2(4000),
    menuitemradiogroup              varchar2(4000),
    fontstyle                       varchar2(4000),
    commandtype                     varchar2(4000) default 'Null',
    parentsourcelevel1objecttype    varchar2(4000),
    menuitemcode                    clob,
    subclasssubobject               varchar2(4000) default 'false',
    visibleinverticalmenutoolbar    varchar2(4000) default 'false',
    visibleinhorizontalmenutoolbar  varchar2(4000) default 'false',
--
    CommandText                     varchar2(4000),
    DisplayNoPriv                   varchar2(4000) default 'false',
    Enabled                         varchar2(4000) default 'true',
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000) default 'false',
    Visible                         varchar2(4000) default 'true',
    VisualAttributeName             varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_mnuitem_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnuitem
    before insert or update on wwv_mig_frm_menu_menuitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_mnuitem_id_idx on wwv_mig_frm_menu_menuitem (menu_id);
create index wwv_mig_mnuitem_sg_id_idx on wwv_mig_frm_menu_menuitem (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_FRM_MENU_MENUITEM_ROLE
create table wwv_mig_frm_menuitem_role (
    id                              number
                                        constraint wwv_mig_mnuitemrole_pk primary key,
    menuitem_id                     number not null
                                        constraint wwv_mig_mnuitemrole_id_fk
                                        references wwv_mig_frm_menu_menuitem(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_mnuitemrole_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    menuitemrole_index              varchar2(4000),
    menuitemrole_value              varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_mnuitemrl_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnuitemrl
    before insert or update on wwv_mig_frm_menuitem_role
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_mnuitemrl_id_idx on wwv_mig_frm_menuitem_role (menuitem_id);
create index wwv_mig_mnuitemrl_sg_id_idx on wwv_mig_frm_menuitem_role (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- WWV_MIG_FRM_MENUS_PROGRAMUNIT
create table wwv_mig_frm_menus_programunit (
    id                              number
                                        constraint wwv_mig_mnuprogunit_pk primary key,
    menumodule_id                   number not null
                                        constraint wwv_mig_mnu_progunit_id_fk
                                        references wwv_mig_frm_menus_menumodules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_mnuprogunit_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    programunittype                 varchar2(4000),
    programunittext                 clob,
    programunit_comment             clob,
--
    SubclassObjectGroup             varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_mnupu_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnu_progunit
    before insert or update on wwv_mig_frm_menus_programunit
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_mnupu_id_idx on wwv_mig_frm_menus_programunit (menumodule_id);
create index wwv_mig_mnupu_sg_id_idx on wwv_mig_frm_menus_programunit (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- wwv_mig_menu_xmlstagtablemap is created to map all the nodes of the Reports xml file
-- with the corresponding reports table name with the hierarchy of DOM structure
--
create table wwv_mig_menu_xmltagtablemap (
    id                              number
                                        constraint wwv_mig_menu_xmltagtablemap_pk primary key,
    tag_name                      varchar2(30),
    parent_id                     number
                                        constraint wwv_mig_mnu_xmltagtablemap_fk
                                        references wwv_mig_menu_xmltagtablemap(id) on delete cascade,
    table_name                    varchar2(128)
                                        constraint wwv_mig_mnu_table_name_uk unique,
    foreign_key_name              varchar2(128),
--
    created_on                    date,
    created_by                    varchar2(400),
    last_updated_on               date,
    last_updated_by               varchar2(400)
)
/

create or replace trigger wwv_biu_mig_mnu_xmltagtablemap
    before insert or update on wwv_mig_menu_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_menu_xmltag_id_idx on wwv_mig_menu_xmltagtablemap (parent_id);

--
-- Insert statement for wwv_mig_frm_xmltagtablemap table
--
BEGIN

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (1, 'Module', NULL, 'WWV_MIG_FRM_MODULES', 'FILE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (2, 'FormModule', 1, 'WWV_MIG_FRM_FORMMODULES', 'MODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (3, 'Alert', 2, 'WWV_MIG_FRM_ALERTS', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (4, 'Block', 2, 'WWV_MIG_FRM_BLOCKS', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (5, 'Canvas', 2, 'WWV_MIG_FRM_CANVAS', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (6, 'Coordinate', 2, 'WWV_MIG_FRM_COORDINATES', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (7, 'LOV', 2, 'WWV_MIG_FRM_LOV', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (8, 'ProgramUnit', 2, 'WWV_MIG_FRM_PROGRAMUNIT', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (9, 'PropertyClass', 2, 'WWV_MIG_FRM_PROPERTYCLASS', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (10, 'RecordGroup', 2, 'WWV_MIG_FRM_RECORDGROUPS', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (11, 'Trigger', 2, 'WWV_MIG_FRM_TRIGGERS', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (12, 'VisualAttribute', 2, 'WWV_MIG_FRM_VISUALATTRIBUTES', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (13, 'Window', 2, 'WWV_MIG_FRM_WINDOWS', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (14, 'Item', 4, 'WWV_MIG_FRM_BLK_ITEMS', 'BLOCK_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (15, 'Trigger', 14, 'WWV_MIG_FRM_BLK_ITEM_TRIGGERS', 'ITEM_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (16, 'ListItemElement', 14, 'WWV_MIG_FRM_BLK_ITEM_LIE', 'ITEM_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (17, 'RadioButton', 14, 'WWV_MIG_FRM_BLK_ITEM_RADIO', 'ITEM_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (18, 'DataSourceColumn', 4, 'WWV_MIG_FRM_BLK_DSC', 'BLOCK_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (19, 'Trigger', 4, 'WWV_MIG_FRM_BLK_TRIGGERS', 'BLOCK_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (20, 'Relation', 4, 'WWV_MIG_FRM_BLK_RELATIONS', 'BLOCK_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (21, 'Graphics', 5, 'WWV_MIG_FRM_CNVS_GRAPHICS', 'CANVAS_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (22, 'TabPage', 5, 'WWV_MIG_FRM_CNVS_TABPAGE', 'CANVAS_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (23, 'LOVColumnMapping', 7, 'WWV_MIG_FRM_LOVCOLUMNMAPPING', 'LOV_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (24, 'RecordGroupColumn', 10, 'WWV_MIG_FRM_RECORDGROUPCOLUMN', 'RECORDGROUP_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (25, 'AttachedLibrary', 2, 'WWV_MIG_FRM_ATTACHEDLIBRARY', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (26, 'ModuleParameter', 2, 'WWV_MIG_FRM_MODULEPARAMETER', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (27, 'ObjectGroup', 2, 'WWV_MIG_FRM_OBJECTGROUP', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (28, 'ObjectGroupChild', 27, 'WWV_MIG_FRM_OBJECTGROUPCHILD', 'OBJECTGROUP_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (29, 'CompoundText', 21, 'WWV_MIG_FRM_CNVG_COMPOUNDTEXT', 'GRAPHICS_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (30, 'TextSegment', 29, 'WWV_MIG_FRM_CPDTXT_TEXTSEGMENT', 'COMPOUNDTEXT_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (31, 'Editor', 2, 'WWV_MIG_FRM_EDITOR', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (32, 'Menu', 2, 'WWV_MIG_FRM_FMB_MENU', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (33, 'Report', 2, 'WWV_MIG_FRM_REPORT', 'FORMMODULE_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (34, 'DataSourceArgument', 4, 'WWV_MIG_FRM_BLK_DSA', 'BLOCK_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (35, 'MenuItem', 32, 'WWV_MIG_FRM_FMB_MENU_MENUITEM', 'MENU_ID');

INSERT INTO wwv_mig_frm_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (36, 'MenuItemRole', 35, 'WWV_MIG_FRM_FMB_MENUITEM_ROLE', 'MENUITEM_ID');
-----------------------------------------------------------------------------------------------
-- Insert statement for wwv_mig_rpt_xmltagtablemap table
--
INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (1,'report', NULL, 'WWV_MIG_REPORT', 'FILE_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (2,'data',1,'WWV_MIG_RPT_DATA','REPORT_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (3,'dataSource',2,'WWV_MIG_RPT_DATASRC','DATA_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (4,'select',3,'WWV_MIG_RPT_DATASRC_SELECT','DATASRC_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (5,'group',3,'WWV_MIG_RPT_DATASRC_GRP','DATASRC_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (6,'dataItem',5,'WWV_MIG_RPT_GRP_DATAITEM','GROUP_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (7,'dataDescriptor',6,'WWV_MIG_RPT_GRP_DATAITEM_DESC','ITEM_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (8,'dataItemPrivate',6,'WWV_MIG_RPT_GRP_DATAITEM_PRIV','ITEM_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (9,'formula',5,'WWV_MIG_RPT_GRP_FORMULA','GROUP_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (10,'summary',5,'WWV_MIG_RPT_GRP_SUMMARY','GROUP_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (11,'rowDelimiter',5,'WWV_MIG_RPT_GRP_ROWDELIM','GROUP_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (12,'field',5,'WWV_MIG_RPT_GRP_FIELD','GROUP_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (13,'filter',5,'WWV_MIG_RPT_GRP_FILTER','GROUP_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (14,'summary',2,'WWV_MIG_RPT_DATA_SUMMARY','DATA_ID');

INSERT INTO wwv_mig_rpt_xmltagtablemap(id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (15,'reportPrivate',1,'WWV_MIG_RPT_REPORTPRIVATE','REPORT_ID');

--
-- Insert statement for wwv_mig_menu_xmltagtablemap table
--
INSERT INTO wwv_mig_menu_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (1, 'Module', NULL, 'WWV_MIG_FRM_MENUS_MODULES', 'FILE_ID');

INSERT INTO wwv_mig_menu_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (2, 'MenuModule', 1, 'WWV_MIG_FRM_MENUS_MENUMODULES', 'MODULE_ID');

INSERT INTO wwv_mig_menu_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (3, 'MenuModuleRole', 2, 'WWV_MIG_FRM_MENUSMODULEROLES', 'MENUMODULE_ID');

INSERT INTO wwv_mig_menu_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (4, 'ProgramUnit', 2, 'WWV_MIG_FRM_MENUS_PROGRAMUNIT', 'MENUMODULE_ID');

INSERT INTO wwv_mig_menu_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (5, 'Menu', 2, 'WWV_MIG_FRM_MENU', 'MENUMODULE_ID');

INSERT INTO wwv_mig_menu_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (6, 'MenuItem', 5, 'WWV_MIG_FRM_MENU_MENUITEM', 'MENU_ID');

INSERT INTO wwv_mig_menu_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (7, 'MenuItemRole', 6, 'WWV_MIG_FRM_MENUITEM_ROLE', 'MENUITEM_ID');

COMMIT;
END;
/
-----------------------------------------------------------------------------------------------------------------------

--
-- Tables for ObjectLibrary i.e. *.olb files converted to *_olb.xml using FROMS2XML conversion utility
--

--
-- wwv_mig_frm_olb_xmltagtablemap is created to map all the nodes of the forms olb xml file
-- with the corresponding object library table name with the hierarchy of DOM structure
--
create table wwv_mig_frm_olb_xmltagtablemap (
    id                              number
                                        constraint wwv_mig_olb_xmltagtablemap_pk primary key,
    tag_name                        varchar2(30),
    parent_id                       number
                                        constraint wwv_mig_olb_xmltagtablemap_fk
                                        references wwv_mig_frm_olb_xmltagtablemap(id) on delete cascade,
    table_name                      varchar2(128)
                                        constraint wwv_mig_olb_xttm_table_name_uk unique,
    foreign_key_name                varchar2(128),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_xmltagtablemap
    before insert or update on wwv_mig_frm_olb_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_xmltag_id_idx on wwv_mig_frm_olb_xmltagtablemap (parent_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- Main table for ObjectLibrary to hold xml (*_olb.xml) file
--
create table wwv_mig_olb (
    id                              number
                                        constraint wwv_mig_olb_pk primary key,
    project_id                      number not null
                                        constraint wwv_mig_olb_project_id_fk
                                        references wwv_mig_projects(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    description                     varchar2(4000),
    file_name                       varchar2(255),
    file_mime_type                  varchar2(255),
    file_content                    blob,
    xml_content                     sys.xmltype,
    file_char_set                   varchar2(255),
    file_updated_on                 date,
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400),
                                        constraint wwv_mig_olb_uk
                                        unique (file_name, project_id)
)
/

create or replace trigger wwv_biu_mig_olb
    before insert or update on wwv_mig_olb
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/
prompt ...trigger wwv_aiu_mig_olb
create or replace trigger wwv_aiu_mig_olb
    after insert or update on wwv_mig_olb
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/


create index wwv_mig_olb_project_id_idx on wwv_mig_olb (project_id);
create index wwv_mig_olb_sg_id_idx on wwv_mig_olb (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for Module tag of olb file
--
create table wwv_mig_olb_modules (
    id                              number
                                        constraint wwv_mig_olb_modules_pk primary key,
    file_id                         number not null
                                        constraint wwv_mig_olb_modules_file_id_fk
                                        references wwv_mig_olb(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_modules_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    version                         varchar2(255),
    xmlns                           varchar2(255),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_mdl_select_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_modules
    before insert or update on wwv_mig_olb_modules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_module_file_id_idx on wwv_mig_olb_modules (file_id);
create index wwv_mig_olb_modules_sg_id_idx on wwv_mig_olb_modules (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for Modul -> ObjectLibrary tag of olb file
--
create table wwv_mig_olb_objectlibrary (
    id                              number
                                        constraint wwv_mig_olb_objectlibrary_pk primary key,
    module_id                       number not null
                                        constraint wwv_mig_olb_objlib_mdl_id_fk
                                        references wwv_mig_olb_modules(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_objlib_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    Name                            varchar2(4000),
    ObjectCount                     varchar2(4000),
--
    dirtyinfo                       varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    objectlibrary_comment           clob,
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_objlib_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_objectlibrary
    before insert or update on wwv_mig_olb_objectlibrary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_objlib_mdl_id_idx on wwv_mig_olb_objectlibrary (module_id);
create index wwv_mig_olb_objlib_sg_id_idx on wwv_mig_olb_objectlibrary (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab tag of olb file
--
create table wwv_mig_olb_objectlibrarytab (
    id                              number
                                        constraint wwv_mig_olb_objlibtab_pk primary key,
    objectlibrary_id                number not null
                                        constraint wwv_mig_olb_olt_objlib_id_fk
                                        references wwv_mig_olb_objectlibrary(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    Name                            varchar2(4000),
    ObjectCount                     varchar2(4000),
    Label                           varchar2(4000),
--
    dirtyinfo                       varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    objectlibrarytab_comment        clob,
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_olt_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_objlibtab
    before insert or update on wwv_mig_olb_objectlibrarytab
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_objlib_id_idx on wwv_mig_olb_objectlibrarytab (objectlibrary_id);
create index wwv_mig_olb_olt_sg_id_idx on wwv_mig_olb_objectlibrarytab (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Block tag of olb file
--
create table wwv_mig_olb_block (
    id                              number
                                        constraint wwv_mig_olb_block_pk primary key,
    objectlibrary_id                number not null
                                        constraint wwv_mig_olb_block_objlib_id_fk
                                        references wwv_mig_olb_objectlibrary(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_block_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    block_comment                   clob,
    querydatasourcename             varchar2(4000),
    querydatasourcetype             varchar2(4000),
    enforcedprimarykey              varchar2(4000),
    singlerecord                    varchar2(4000),
    databaseblock                   varchar2(4000),
    updateallowed                   varchar2(4000),
    insertallowed                   varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    backcolor                       varchar2(4000),
    recordvisualattributegroupname  varchar2(4000),
    scrollbartabpagename            varchar2(4000),
    scrollbarxposition              varchar2(4000),
    scrollbaryposition              varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarlength                 varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    scrollbarcanvasname             varchar2(4000),
    dirtyinfo                       varchar2(4000),
    VisualAttributeName             varchar2(4000),
    DMLDataName                     varchar2(4000),
    DMLDataType                     varchar2(4000),
    DeleteAllowed                   varchar2(4000),
    QueryAllowed                    varchar2(4000),
    RecordOrientation               varchar2(4000),
    EnforcedColumnSecurity          varchar2(4000),
    LockMode                        varchar2(4000),
    KeyMode                         varchar2(4000),
    NavigationStyle                 varchar2(4000),
    RecordsFetchedCount             varchar2(4000),
    RecordsBufferedCount            varchar2(4000),
    PreviousNavigationBlockName     varchar2(4000),
    NextNavigationBlockName         varchar2(4000),
    WhereClause                     varchar2(4000),
    OrderByClause                   varchar2(4000),
    ScrollbarOrientation            varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FillPattern                     varchar2(4000),
--
    DMLReturnValue                  varchar2(4000),
    IncludeRefitem                  varchar2(4000),
    PrecompSummary                  varchar2(4000),
    QueryAllRecords                 varchar2(4000),
    ReverseDirection                varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    UpdateChangedColumns            varchar2(4000),
    DMLArraySize                    varchar2(4000),
    LanguageDirection               varchar2(4000),
    MaximumQueryTime                varchar2(4000),
    MaximumRecordsFetched           varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    alias                           varchar2(4000),
    DeleteProcedureName             varchar2(4000),
    UpdateProcedureName             varchar2(4000),
    InsertProcedureName             varchar2(4000),
    LockProcedureName               varchar2(4000),
    OptionHint                      varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_block_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_block
    before insert or update on wwv_mig_olb_block
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_block_objlibid_idx on wwv_mig_olb_block (objectlibrary_id);
create index wwv_mig_olb_block_sg_id_idx on wwv_mig_olb_block (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Canvas tag of olb file
--
create table wwv_mig_olb_canvas (
    id                              number
                                        constraint wwv_mig_olb_canvas_pk primary key,
    objectlibrary_id                number not null
                                        constraint wwv_mig_olb_canvs_objlib_id_fk
                                        references wwv_mig_olb_objectlibrary(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_canvas_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    bevel                           varchar2(4000),
    canvastype                      varchar2(4000),
    visible                         varchar2(4000),
    tabattachmentedge               varchar2(4000),
    tabstyle                        varchar2(4000),
    raiseonenter                    varchar2(4000),
    displayviewport                 varchar2(4000),
    foregroundcolor                 varchar2(4000),
    backcolor                       varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    viewportwidth                   varchar2(4000),
    viewportheight                  varchar2(4000),
    viewportypositiononcanvas       varchar2(4000),
    viewportxpositiononcanvas       varchar2(4000),
    dirtyinfo                       varchar2(4000),
    windowname                      varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    ViewportXPosition               varchar2(4000),
    ViewportYPosition               varchar2(4000),
    FillPattern                     varchar2(4000),
    VisualAttributeName             varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
--
    SubclassObjectGroup             varchar2(4000),
    LanguageDirection               varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    TabActionStyle                  varchar2(4000),
    TabWidthStyle                   varchar2(4000),
    Canvas_comment                  clob,
    HelpBookTopic                   varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PopupMenuName                   varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_canvas_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_canvas
    before insert or update on wwv_mig_olb_canvas
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_canvs_objlibid_idx on wwv_mig_olb_canvas (objectlibrary_id);
create index wwv_mig_olb_canvas_sg_id_idx on wwv_mig_olb_canvas (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ProgramUnit tag of olb file
--
create table wwv_mig_olb_programunit (
    id                              number
                                        constraint wwv_mig_olb_programunit_pk primary key,
    objectlibrary_id                number not null
                                        constraint wwv_mig_olb_pu_objlib_id_fk
                                        references wwv_mig_olb_objectlibrary(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_pu_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    programunittext                 clob,
    programunittype                 varchar2(4000),
--
    programunit_comment             clob,
    SubclassObjectGroup             varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_pu_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_programunit
    before insert or update on wwv_mig_olb_programunit
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_pu_objlibid_idx on wwv_mig_olb_programunit (objectlibrary_id);
create index wwv_mig_olb_pu_sg_id_idx on wwv_mig_olb_programunit (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> PropertyClass tag of olb file
--
create table wwv_mig_olb_propertyclass (
    id                              number
                                        constraint wwv_mig_olb_propertyclass_pk primary key,
    objectlibrary_id                number not null
                                        constraint wwv_mig_olb_pc_objlib_id_fk
                                        references wwv_mig_olb_objectlibrary(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_pc_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    itemtype                        varchar2(4000),
    justification                   varchar2(4000),
    bevel                           varchar2(4000),
    visualattributename             varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    fontname                        varchar2(4000),
    fontspacing                     varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fillpattern                     varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    Title                           varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    InheritMenu                     varchar2(4000),
    MoveAllowed                     varchar2(4000),
    HorizontalToolbarCanvasName     varchar2(4000),
    XPosition                       varchar2(4000),
    YPosition                       varchar2(4000),
    IconFilename                    varchar2(4000),
    WindowStyle                     varchar2(4000),
    HideOnExit                      varchar2(4000),
    ClearAllowed                    varchar2(4000),
    MinimizeAllowed                 varchar2(4000),
    DistanceBetweenRecords          varchar2(4000),
    Visible                         varchar2(4000),
    Iconic                          varchar2(4000),
    QueryAllowed                    varchar2(4000),
    AutoHint                        varchar2(4000),
    Enabled                         varchar2(4000),
    MouseNavigate                   varchar2(4000),
    DefaultButton                   varchar2(4000),
    ViewportXPosition               varchar2(4000),
    ViewportYPosition               varchar2(4000),
    ViewportWidth                   varchar2(4000),
    RaiseOnEnter                    varchar2(4000),
    CanvasType                      varchar2(4000),
    WindowName                      varchar2(4000),
    ResizeAllowed                   varchar2(4000),
    Modal                           varchar2(4000),
    KeyboardNavigable               varchar2(4000),
    ViewportHeight                  varchar2(4000),
    ViewportXPositionOnCanvas       varchar2(4000),
    ViewportYPositionOnCanvas       varchar2(4000),
    MaximizeAllowed                 varchar2(4000),
    ListStyle                       varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_pc_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_propertyclass
    before insert or update on wwv_mig_olb_propertyclass
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_pc_objlibid_idx on wwv_mig_olb_propertyclass (objectlibrary_id);
create index wwv_mig_olb_pc_sg_id_idx on wwv_mig_olb_propertyclass (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> VisualAttribute tag of olb file
--
create table wwv_mig_olb_visualattribute (
    id                              number
                                        constraint wwv_mig_olb_visualattribute_pk primary key,
    objectlibrary_id                number not null
                                        constraint wwv_mig_olb_va_objlib_id_fk
                                        references wwv_mig_olb_objectlibrary(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_va_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    fontname                        varchar2(4000),
    fontspacing                     varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fillpattern                     varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
--
    VisualAttribute_comment         clob,
    FrameTitleBackColor varchar2(4000),
    FrameTitleFillPattern   varchar2(4000),
    FrameTitleFontName  varchar2(4000),
    FrameTitleFontSize  varchar2(4000),
    FrameTitleFontSpacing   varchar2(4000),
    FrameTitleFontStyle varchar2(4000),
    FrameTitleFontWeight    varchar2(4000),
    FrameTitleForegroundColor   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptFontName  varchar2(4000),
    PromptFontSize  varchar2(4000),
    PromptFontSpacing   varchar2(4000),
    PromptFontStyle varchar2(4000),
    PromptFontWeight    varchar2(4000),
    PromptForegroundColor   varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    VisualAttributeType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_va_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_visualattrbute
    before insert or update on wwv_mig_olb_visualattribute
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_va_objlibid_idx on wwv_mig_olb_visualattribute (objectlibrary_id);
create index wwv_mig_olb_va_sg_id_idx on wwv_mig_olb_visualattribute (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Window tag of olb file
--
create table wwv_mig_olb_window (
    id                              number
                                        constraint wwv_mig_olb_window_pk primary key,
    objectlibrary_id                number not null
                                        constraint wwv_mig_olb_wndow_objlib_id_fk
                                        references wwv_mig_olb_objectlibrary(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_window_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    window_comment                  clob,
    title                           varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    resizeallowed                   varchar2(4000),
    visualattributename             varchar2(4000),
    modal                           varchar2(4000),
    hideonexit                      varchar2(4000),
    windowstyle                     varchar2(4000),
    maximizeallowed                 varchar2(4000),
    minimizeallowed                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    PrimaryCanvas                   varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    MinimizeTitle                   varchar2(4000),
    MoveAllowed                     varchar2(4000),
    HorizontalToolbarCanvasName     varchar2(4000),
    XPosition                       varchar2(4000),
    YPosition                       varchar2(4000),
    IconFilename                    varchar2(4000),
    ClearAllowed                    varchar2(4000),
--
    BackColor   varchar2(4000),
    Bevel   varchar2(4000),
    FillPattern varchar2(4000),
    FontName    varchar2(4000),
    FontSize    varchar2(4000),
    FontSpacing varchar2(4000),
    FontStyle   varchar2(4000),
    FontWeight  varchar2(4000),
    ForegroundColor varchar2(4000),
    HelpBookTopic   varchar2(4000),
    InheritMenu varchar2(4000),
    LanguageDirection   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    VerticalToolbarCanvasName   varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_window_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_window
    before insert or update on wwv_mig_olb_window
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_wndow_objlibid_idx on wwv_mig_olb_window (objectlibrary_id);
create index wwv_mig_olb_window_sg_id_idx on wwv_mig_olb_window (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

-- table for ObjectLibrary -> ObjectLibraryTab -> Alert tag of olb file
--
create table wwv_mig_olb_olt_alert (
    id                              number
                                        constraint wwv_mig_olb_olt_alert_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_olt_alrt_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_alert_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    alertstyle                      varchar2(4000),
    alertmessage                    varchar2(4000),
    button1label                    varchar2(4000),
    button2label                    varchar2(4000),
    visualattributename             varchar2(4000),
    dirtyinfo                       varchar2(4000),
    Title                           varchar2(4000),
    Button3Label                    varchar2(4000),
    DefaultAlertButton              varchar2(4000),
--
    SmartClass                      varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    FontName                        varchar2(4000),
    FontSize                        varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontStyle                       varchar2(4000),
    FontWeight                      varchar2(4000),
    LanguageDirection               varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    BackColor                       varchar2(4000),
    alert_Comment                   varchar2(4000),
    FillPattern                     varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_olt_alrt_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_alert
    before insert or update on wwv_mig_olb_olt_alert
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_alrt_oltid_idx on wwv_mig_olb_olt_alert (objectlibrarytab_id);
create index wwv_mig_olb_olt_alert_sgid_idx on wwv_mig_olb_olt_alert (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> Block tag of olb file
--
create table wwv_mig_olb_olt_block (
    id                              number
                                        constraint wwv_mig_olb_t_block_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_t_block_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_block_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    block_comment                   clob,
    querydatasourcename             varchar2(4000),
    querydatasourcetype             varchar2(4000),
    enforcedprimarykey              varchar2(4000),
    singlerecord                    varchar2(4000),
    databaseblock                   varchar2(4000),
    updateallowed                   varchar2(4000),
    insertallowed                   varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    backcolor                       varchar2(4000),
    recordvisualattributegroupname  varchar2(4000),
    scrollbartabpagename            varchar2(4000),
    scrollbarxposition              varchar2(4000),
    scrollbaryposition              varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarlength                 varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    scrollbarcanvasname             varchar2(4000),
    dirtyinfo                       varchar2(4000),
    VisualAttributeName             varchar2(4000),
    DMLDataName                     varchar2(4000),
    DMLDataType                     varchar2(4000),
    DeleteAllowed                   varchar2(4000),
    QueryAllowed                    varchar2(4000),
    RecordOrientation               varchar2(4000),
    EnforcedColumnSecurity          varchar2(4000),
    LockMode                        varchar2(4000),
    KeyMode                         varchar2(4000),
    NavigationStyle                 varchar2(4000),
    RecordsFetchedCount             varchar2(4000),
    RecordsBufferedCount            varchar2(4000),
    PreviousNavigationBlockName     varchar2(4000),
    NextNavigationBlockName         varchar2(4000),
    WhereClause                     varchar2(4000),
    OrderByClause                   varchar2(4000),
    ScrollbarOrientation            varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FillPattern                     varchar2(4000),
--
    DMLReturnValue                  varchar2(4000),
    IncludeRefitem                  varchar2(4000),
    PrecompSummary                  varchar2(4000),
    QueryAllRecords                 varchar2(4000),
    ReverseDirection                varchar2(4000),
    SubclassObjectGroup             varchar2(4000),
    UpdateChangedColumns            varchar2(4000),
    DMLArraySize                    varchar2(4000),
    LanguageDirection               varchar2(4000),
    MaximumQueryTime                varchar2(4000),
    MaximumRecordsFetched           varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    alias                           varchar2(4000),
    DeleteProcedureName             varchar2(4000),
    UpdateProcedureName             varchar2(4000),
    InsertProcedureName             varchar2(4000),
    LockProcedureName               varchar2(4000),
    OptionHint                      varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_t_block_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_block
    before insert or update on wwv_mig_olb_olt_block
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_block_oltid_idx on wwv_mig_olb_olt_block (objectlibrarytab_id);
create index wwv_mig_olb_t_block_sg_id_idx on wwv_mig_olb_olt_block (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> Canvas tag of olb file
--
create table wwv_mig_olb_olt_canvas (
    id                              number
                                        constraint wwv_mig_olb_olt_canvas_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_t_canvas_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_canvas_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    bevel                           varchar2(4000),
    canvastype                      varchar2(4000),
    visible                         varchar2(4000),
    tabattachmentedge               varchar2(4000),
    tabstyle                        varchar2(4000),
    raiseonenter                    varchar2(4000),
    displayviewport                 varchar2(4000),
    foregroundcolor                 varchar2(4000),
    backcolor                       varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    viewportwidth                   varchar2(4000),
    viewportheight                  varchar2(4000),
    viewportypositiononcanvas       varchar2(4000),
    viewportxpositiononcanvas       varchar2(4000),
    dirtyinfo                       varchar2(4000),
    windowname                      varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    ViewportXPosition               varchar2(4000),
    ViewportYPosition               varchar2(4000),
    FillPattern                     varchar2(4000),
    VisualAttributeName             varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
--
    SubclassObjectGroup             varchar2(4000),
    LanguageDirection               varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    TabActionStyle                  varchar2(4000),
    TabWidthStyle                   varchar2(4000),
    Canvas_comment                  clob,
    HelpBookTopic                   varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PopupMenuName                   varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_t_canvas_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_canvas
    before insert or update on wwv_mig_olb_olt_canvas
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_canvas_oltid_idx on wwv_mig_olb_olt_canvas (objectlibrarytab_id);
create index wwv_mig_olb_t_canvas_sg_id_idx on wwv_mig_olb_olt_canvas (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> Graphics tag of olb file
--
create table wwv_mig_olb_olt_graphics (
    id                              number
                                        constraint wwv_mig_olb_olt_graphics_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_t_grphcs_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_graphcs_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_t_grphcs_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_graphics
    before insert or update on wwv_mig_olb_olt_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_grphcs_oltid_idx on wwv_mig_olb_olt_graphics (objectlibrarytab_id);
create index wwv_mig_olb_t_grphcs_sg_id_idx on wwv_mig_olb_olt_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> Item tag of olb file
--
create table wwv_mig_olb_olt_item (
    id                              number
                                        constraint wwv_mig_olb_olt_item_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_olt_item_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_item_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    item_comment                    clob,
    label                           varchar2(4000),
    item_prompt                     varchar2(4000),
    itemtype                        varchar2(4000),
    lovname                         varchar2(4000),
    liststyle                       varchar2(4000),
    databaseitem                    varchar2(4000),
    justification                   varchar2(4000),
    required                        varchar2(4000),
    treeallowempbranch              varchar2(4000),
    checkedvalue                    varchar2(4000),
    uncheckedvalue                  varchar2(4000),
    initializevalue                 varchar2(4000),
    formatmask                      varchar2(4000),
    tabpagename                     varchar2(4000),
    columnname                      varchar2(4000),
    multiline                       varchar2(4000),
    maximumlength                   varchar2(4000),
    bevel                           varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    fontname                        varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fontspacing                     varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    fillpattern                     varchar2(4000),
    mousenavigate                   varchar2(4000),
    keyboardnavigable               varchar2(4000),
    nextnavigationitemname          varchar2(4000),
    showhorizontalscrollbar         varchar2(4000),
    showverticalscrollbar           varchar2(4000),
    compressionquality              varchar2(4000),
    canvasname                      varchar2(4000),
    dirtyinfo                       varchar2(4000),
    autohint                        varchar2(4000),
    caserestriction                 varchar2(4000),
    checkboxothervalues             varchar2(4000),
    concealdata                     varchar2(4000),
    datatype                        varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    enabled                         varchar2(4000),
    hint                            varchar2(4000),
    insertallowed                   varchar2(4000),
    itemsdisplay                    varchar2(4000),
    lockrecord                      varchar2(4000),
    queryallowed                    varchar2(4000),
    querylength                     varchar2(4000),
    rendered                        varchar2(4000),
    updateallowed                   varchar2(4000),
    validatefromlist                varchar2(4000),
    visible                         varchar2(4000),
    visualattributename             varchar2(4000),
    editname                        varchar2(4000),
    IconFilename                    varchar2(4000),
    Iconic                          varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    DisplayQuality                  varchar2(4000),
    PrimaryKey                      varchar2(4000),
    OtherValues                     varchar2(4000),
    WrapStyle                       varchar2(4000),
    FixedLength                     varchar2(4000),
    EditXPosition                   varchar2(4000),
    EditYPosition                   varchar2(4000),
    UpdateIfNull                    varchar2(4000),
    LovXPosition                    varchar2(4000),
    LovYPosition                    varchar2(4000),
    SizingStyle                     varchar2(4000),
    CaseInsensitiveQuery            varchar2(4000),
    KeepCursorPosition              varchar2(4000),
    AutoSkip                        varchar2(4000),
    ListElementCount                varchar2(4000),
    DefaultButton                   varchar2(4000),
    RecordVisualAttributeGroupName  varchar2(4000),
    SynchronizedItemName            varchar2(4000),
    PromptFontSize                  varchar2(4000),
    PromptFontName                  varchar2(4000),
    PromptFontSpacing               varchar2(4000),
    PromptFontWeight                varchar2(4000),
    PromptFontStyle                 varchar2(4000),
    PromptAlign                     varchar2(4000),
    PromptAlignOffset               varchar2(4000),
    PromptAttachmentOffset          varchar2(4000),
    PromptAttachmentEdge            varchar2(4000),
    PromptJustification             varchar2(4000),
    PromptForegroundColor           varchar2(4000),
    LowestAllowedValue              varchar2(4000),
    HighestAllowedValue             varchar2(4000),
    CopyValueFromItem               varchar2(4000),
    PromptDisplayStyle              varchar2(4000),
    LanguageDirection               varchar2(4000),
    ReadingOrder                    varchar2(4000),
    SummaryItemName                 varchar2(4000),
--
    AccessKey   varchar2(4000),
    AudioChannels   varchar2(4000),
    CalculateMode   varchar2(4000),
    CommMode    varchar2(4000),
    item_Compress    varchar2(4000),
    DataLengthSemantics varchar2(4000),
    DataSourceBlock varchar2(4000),
    DataSourceXAxis varchar2(4000),
    DataSourceYAxis varchar2(4000),
    ExecuteMode varchar2(4000),
    Filename    varchar2(4000),
    Formula varchar2(4000),
    HelpBookTopic   varchar2(4000),
    ImageDepth  varchar2(4000),
    ImageFormat varchar2(4000),
    ImplementationClass varchar2(4000),
    InitializeKeyboardDirection varchar2(4000),
    KeyboardState   varchar2(4000),
    OleActionStyle  varchar2(4000),
    OleClass    varchar2(4000),
    OleInPlaceAction    varchar2(4000),
    OleInsideOutSupport varchar2(4000),
    OlePopupMenuItems   varchar2(4000),
    OleResizStyle   varchar2(4000),
    OleShowPopupMenu    varchar2(4000),
    OleShowTenantTypeType   varchar2(4000),
    OleTenantTypeAspect varchar2(4000),
    OleTenantTypeType   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    PopupMenuName   varchar2(4000),
    PreviousNavigationItemName  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptReadingOrder  varchar2(4000),
    PromptVisualAttributeName   varchar2(4000),
    QueryName   varchar2(4000),
    QueryOnly   varchar2(4000),
    RecordGroupName varchar2(4000),
    ShowFastForward varchar2(4000),
    ShowPlay    varchar2(4000),
    ShowRecord  varchar2(4000),
    ShowRewind  varchar2(4000),
    ShowSlider  varchar2(4000),
    ShowTime    varchar2(4000),
    ShowVolume  varchar2(4000),
    SmartClass  varchar2(4000),
    SoundFormat varchar2(4000),
    SoundQuality    varchar2(4000),
    SubclassSubObject   varchar2(4000),
    SummaryBlockName    varchar2(4000),
    SummaryFunction varchar2(4000),
    Tooltip varchar2(4000),
    TooltipVisualAttributeGroup varchar2(4000),
    TreeDataQuery   varchar2(4000),
    TreeMultiSelect varchar2(4000),
    TreeShowLines   varchar2(4000),
    TreeShowSymbol  varchar2(4000),
    UpdateCommit    varchar2(4000),
    UpdateQuery varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_olt_item_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_item
    before insert or update on wwv_mig_olb_olt_item
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_item_oltid_idx on wwv_mig_olb_olt_item (objectlibrarytab_id);
create index wwv_mig_olb_olt_item_sg_id_idx on wwv_mig_olb_olt_item (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> Menu tag of olb file
--
create table wwv_mig_olb_olt_menu (
    id                              number
                                        constraint wwv_mig_olb_olt_menu_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_olt_menu_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_menu_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_olt_menu_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_menu
    before insert or update on wwv_mig_olb_olt_menu
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_menu_oltid_idx on wwv_mig_olb_olt_menu (objectlibrarytab_id);
create index wwv_mig_olb_olt_menu_sg_id_idx on wwv_mig_olb_olt_menu (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> ObjectGroup tag of olb file
--
create table wwv_mig_olb_olt_objectgroup (
    id                              number
                                        constraint wwv_mig_olb_olt_objgrp_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_t_objgrp_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_objgrp_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    Name                            varchar2(4000),
    ObjectGroupType                 varchar2(4000),
--
    objectgroup_comment             clob,
    dirtyinfo                       varchar2(4000),
    ParentModuleType                varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentFilename                  varchar2(4000),
    ParentFilepath                  varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
    SmartClass                      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_t_objgrp_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_objgrp
    before insert or update on wwv_mig_olb_olt_objectgroup
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_objgrp_oltid_idx on wwv_mig_olb_olt_objectgroup (objectlibrarytab_id);
create index wwv_mig_olb_t_objgrp_sg_id_idx on wwv_mig_olb_olt_objectgroup (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for Report tag of olb file
--
create table wwv_mig_olb_olt_report (
    id                              number
                                        constraint wwv_mig_olb_olt_report_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_t_report_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_report_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    Name                            varchar2(4000),
    ExecuteMode                     varchar2(4000),
    Filename                        varchar2(4000),
    ReportDestinationType           varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_t_report_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_report
    before insert or update on wwv_mig_olb_olt_report
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_report_oltid_idx on wwv_mig_olb_olt_report (objectlibrarytab_id);
create index wwv_mig_olb_t_report_sg_id_idx on wwv_mig_olb_olt_report (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> TabPage tag of olb file
--
create table wwv_mig_olb_olt_tabpage (
    id                              number
                                        constraint wwv_mig_olb_olt_tabpage_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_t_tabpage_oltid_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_tabpage_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    label                           varchar2(4000),
--
    dirtyinfo   varchar2(4000),
    BackColor   varchar2(4000),
    tabpage_Comment varchar2(4000),
    Enabled varchar2(4000),
    FillPattern varchar2(4000),
    ForegroundColor varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassSubObject   varchar2(4000),
    Visible varchar2(4000),
    VisualAttributeName varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_t_tabpag_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_tabpage
    before insert or update on wwv_mig_olb_olt_tabpage
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_tabpag_oltid_idx on wwv_mig_olb_olt_tabpage (objectlibrarytab_id);
create index wwv_mig_olb_t_tabpag_sg_id_idx on wwv_mig_olb_olt_tabpage (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> VisualAttribute tag of olb file
--
create table wwv_mig_olb_olt_visualattrbute (
    id                              number
                                        constraint wwv_mig_olb_olt_va_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_olt_va_olt_id_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_va_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    fontname                        varchar2(4000),
    fontspacing                     varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fillpattern                     varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
--
    VisualAttribute_comment         clob,
    FrameTitleBackColor varchar2(4000),
    FrameTitleFillPattern   varchar2(4000),
    FrameTitleFontName  varchar2(4000),
    FrameTitleFontSize  varchar2(4000),
    FrameTitleFontSpacing   varchar2(4000),
    FrameTitleFontStyle varchar2(4000),
    FrameTitleFontWeight    varchar2(4000),
    FrameTitleForegroundColor   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptFontName  varchar2(4000),
    PromptFontSize  varchar2(4000),
    PromptFontSpacing   varchar2(4000),
    PromptFontStyle varchar2(4000),
    PromptFontWeight    varchar2(4000),
    PromptForegroundColor   varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    VisualAttributeType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_olt_va_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_va
    before insert or update on wwv_mig_olb_olt_visualattrbute
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_va_oltid_idx on wwv_mig_olb_olt_visualattrbute (objectlibrarytab_id);
create index wwv_mig_olb_olt_va_sg_id_idx on wwv_mig_olb_olt_visualattrbute (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibraryTab -> Window tag of olb file
--
create table wwv_mig_olb_olt_window (
    id                              number
                                        constraint wwv_mig_olb_olt_window_pk primary key,
    objectlibrarytab_id             number not null
                                        constraint wwv_mig_olb_olt_wndow_oltid_fk
                                        references wwv_mig_olb_objectlibrarytab(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_wndow_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    window_comment                  clob,
    title                           varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    resizeallowed                   varchar2(4000),
    visualattributename             varchar2(4000),
    modal                           varchar2(4000),
    hideonexit                      varchar2(4000),
    windowstyle                     varchar2(4000),
    maximizeallowed                 varchar2(4000),
    minimizeallowed                 varchar2(4000),
    dirtyinfo                       varchar2(4000),
    PrimaryCanvas                   varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    ShowVerticalScrollbar           varchar2(4000),
    ShowHorizontalScrollbar         varchar2(4000),
    MinimizeTitle                   varchar2(4000),
    MoveAllowed                     varchar2(4000),
    HorizontalToolbarCanvasName     varchar2(4000),
    XPosition                       varchar2(4000),
    YPosition                       varchar2(4000),
    IconFilename                    varchar2(4000),
    ClearAllowed                    varchar2(4000),
--
    BackColor   varchar2(4000),
    Bevel   varchar2(4000),
    FillPattern varchar2(4000),
    FontName    varchar2(4000),
    FontSize    varchar2(4000),
    FontSpacing varchar2(4000),
    FontStyle   varchar2(4000),
    FontWeight  varchar2(4000),
    ForegroundColor varchar2(4000),
    HelpBookTopic   varchar2(4000),
    InheritMenu varchar2(4000),
    LanguageDirection   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    VerticalToolbarCanvasName   varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_olt_wndw_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_window
    before insert or update on wwv_mig_olb_olt_window
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_window_oltid_idx on wwv_mig_olb_olt_window (objectlibrarytab_id);
create index wwv_mig_olb_t_window_sg_id_idx on wwv_mig_olb_olt_window (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Block -> Item tag of olb file
--
create table wwv_mig_olb_blk_item (
    id                              number
                                        constraint wwv_mig_olb_blk_item_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_olb_blk_item_blk_id_fk
                                        references wwv_mig_olb_block(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_blk_item_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    item_comment                    clob,
    label                           varchar2(4000),
    item_prompt                     varchar2(4000),
    itemtype                        varchar2(4000),
    lovname                         varchar2(4000),
    liststyle                       varchar2(4000),
    databaseitem                    varchar2(4000),
    justification                   varchar2(4000),
    required                        varchar2(4000),
    treeallowempbranch              varchar2(4000),
    checkedvalue                    varchar2(4000),
    uncheckedvalue                  varchar2(4000),
    initializevalue                 varchar2(4000),
    formatmask                      varchar2(4000),
    tabpagename                     varchar2(4000),
    columnname                      varchar2(4000),
    multiline                       varchar2(4000),
    maximumlength                   varchar2(4000),
    bevel                           varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    fontname                        varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fontspacing                     varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    fillpattern                     varchar2(4000),
    mousenavigate                   varchar2(4000),
    keyboardnavigable               varchar2(4000),
    nextnavigationitemname          varchar2(4000),
    showhorizontalscrollbar         varchar2(4000),
    showverticalscrollbar           varchar2(4000),
    compressionquality              varchar2(4000),
    canvasname                      varchar2(4000),
    dirtyinfo                       varchar2(4000),
    autohint                        varchar2(4000),
    caserestriction                 varchar2(4000),
    checkboxothervalues             varchar2(4000),
    concealdata                     varchar2(4000),
    datatype                        varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    enabled                         varchar2(4000),
    hint                            varchar2(4000),
    insertallowed                   varchar2(4000),
    itemsdisplay                    varchar2(4000),
    lockrecord                      varchar2(4000),
    queryallowed                    varchar2(4000),
    querylength                     varchar2(4000),
    rendered                        varchar2(4000),
    updateallowed                   varchar2(4000),
    validatefromlist                varchar2(4000),
    visible                         varchar2(4000),
    visualattributename             varchar2(4000),
    editname                        varchar2(4000),
    IconFilename                    varchar2(4000),
    Iconic                          varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    DisplayQuality                  varchar2(4000),
    PrimaryKey                      varchar2(4000),
    OtherValues                     varchar2(4000),
    WrapStyle                       varchar2(4000),
    FixedLength                     varchar2(4000),
    EditXPosition                   varchar2(4000),
    EditYPosition                   varchar2(4000),
    UpdateIfNull                    varchar2(4000),
    LovXPosition                    varchar2(4000),
    LovYPosition                    varchar2(4000),
    SizingStyle                     varchar2(4000),
    CaseInsensitiveQuery            varchar2(4000),
    KeepCursorPosition              varchar2(4000),
    AutoSkip                        varchar2(4000),
    ListElementCount                varchar2(4000),
    DefaultButton                   varchar2(4000),
    RecordVisualAttributeGroupName  varchar2(4000),
    SynchronizedItemName            varchar2(4000),
    PromptFontSize                  varchar2(4000),
    PromptFontName                  varchar2(4000),
    PromptFontSpacing               varchar2(4000),
    PromptFontWeight                varchar2(4000),
    PromptFontStyle                 varchar2(4000),
    PromptAlign                     varchar2(4000),
    PromptAlignOffset               varchar2(4000),
    PromptAttachmentOffset          varchar2(4000),
    PromptAttachmentEdge            varchar2(4000),
    PromptJustification             varchar2(4000),
    PromptForegroundColor           varchar2(4000),
    LowestAllowedValue              varchar2(4000),
    HighestAllowedValue             varchar2(4000),
    CopyValueFromItem               varchar2(4000),
    PromptDisplayStyle              varchar2(4000),
    LanguageDirection               varchar2(4000),
    ReadingOrder                    varchar2(4000),
    SummaryItemName                 varchar2(4000),
--
    AccessKey   varchar2(4000),
    AudioChannels   varchar2(4000),
    CalculateMode   varchar2(4000),
    CommMode    varchar2(4000),
    item_Compress    varchar2(4000),
    DataLengthSemantics varchar2(4000),
    DataSourceBlock varchar2(4000),
    DataSourceXAxis varchar2(4000),
    DataSourceYAxis varchar2(4000),
    ExecuteMode varchar2(4000),
    Filename    varchar2(4000),
    Formula varchar2(4000),
    HelpBookTopic   varchar2(4000),
    ImageDepth  varchar2(4000),
    ImageFormat varchar2(4000),
    ImplementationClass varchar2(4000),
    InitializeKeyboardDirection varchar2(4000),
    KeyboardState   varchar2(4000),
    OleActionStyle  varchar2(4000),
    OleClass    varchar2(4000),
    OleInPlaceAction    varchar2(4000),
    OleInsideOutSupport varchar2(4000),
    OlePopupMenuItems   varchar2(4000),
    OleResizStyle   varchar2(4000),
    OleShowPopupMenu    varchar2(4000),
    OleShowTenantTypeType   varchar2(4000),
    OleTenantTypeAspect varchar2(4000),
    OleTenantTypeType   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    PopupMenuName   varchar2(4000),
    PreviousNavigationItemName  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptReadingOrder  varchar2(4000),
    PromptVisualAttributeName   varchar2(4000),
    QueryName   varchar2(4000),
    QueryOnly   varchar2(4000),
    RecordGroupName varchar2(4000),
    ShowFastForward varchar2(4000),
    ShowPlay    varchar2(4000),
    ShowRecord  varchar2(4000),
    ShowRewind  varchar2(4000),
    ShowSlider  varchar2(4000),
    ShowTime    varchar2(4000),
    ShowVolume  varchar2(4000),
    SmartClass  varchar2(4000),
    SoundFormat varchar2(4000),
    SoundQuality    varchar2(4000),
    SubclassSubObject   varchar2(4000),
    SummaryBlockName    varchar2(4000),
    SummaryFunction varchar2(4000),
    Tooltip varchar2(4000),
    TooltipVisualAttributeGroup varchar2(4000),
    TreeDataQuery   varchar2(4000),
    TreeMultiSelect varchar2(4000),
    TreeShowLines   varchar2(4000),
    TreeShowSymbol  varchar2(4000),
    UpdateCommit    varchar2(4000),
    UpdateQuery varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_blk_item_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_blk_item
    before insert or update on wwv_mig_olb_blk_item
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_blk_item_blkid_idx on wwv_mig_olb_blk_item (block_id);
create index wwv_mig_olb_blk_item_sg_id_idx on wwv_mig_olb_blk_item (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Block -> Item -> ListItemElement tag of olb file
--
create table wwv_mig_olb_blk_item_lie (
    id                              number
                                        constraint wwv_mig_olb_blk_itm_lie_pk primary key,
    item_id                         number not null
                                        constraint wwv_mig_olb_bil_item_id_fk
                                        references wwv_mig_olb_blk_item(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_bil_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ListItemElement_index           varchar2(4000),
    value                           varchar2(4000),
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_bil_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_blk_item_lie
    before insert or update on wwv_mig_olb_blk_item_lie
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_bil_itm_id_idx on wwv_mig_olb_blk_item_lie (item_id);
create index wwv_mig_olb_bil_sg_id_idx on wwv_mig_olb_blk_item_lie (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Block -> Item -> Trigger tag of olb file
--
create table wwv_mig_olb_blk_item_trigger (
    id                              number
                                        constraint wwv_mig_olb_blk_itm_trg_pk primary key,
    item_id                         number not null
                                        constraint wwv_mig_olb_bit_item_id_fk
                                        references wwv_mig_olb_blk_item(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_bit_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    triggertext                     clob,
    dirtyinfo                       varchar2(4000),
    FireInQuery                     varchar2(4000),
    ExecuteHierarchy                varchar2(4000),
    DisplayInKeyboardHelp           varchar2(4000),
    KeyboardHelpText                varchar2(4000),
    TriggerStyle                    varchar2(4000),
--
    trigger_Comment                 clob,
    Hide    varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentSourceLevel2ObjectName    varchar2(4000),
    ParentSourceLevel2ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TriggerInternalType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_bit_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_bi_trigger
    before insert or update on wwv_mig_olb_blk_item_trigger
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_bit_item_id_idx on wwv_mig_olb_blk_item_trigger (item_id);
create index wwv_mig_olb_bit_sg_id_idx on wwv_mig_olb_blk_item_trigger (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Block -> DataSourceColumn tag of olb file
--
create table wwv_mig_olb_blk_datasourcecol (
    id                              number
                                        constraint wwv_mig_olb_blk_dsc_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_olb_blk_dsc_blk_id_fk
                                        references wwv_mig_olb_block(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_blk_dsc_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    type                            varchar2(4000),
    dscname                         varchar2(4000),
    dsctype                         varchar2(4000),
    dscscale                        varchar2(4000),
    dscmandatory                    varchar2(4000),
    dscprecision                    varchar2(4000),
    dscnochildren                   varchar2(4000),
    dsclength                       varchar2(4000),
--
    DSCParentName                   varchar2(4000),
    DSCTypeName                     varchar2(4000),
    subclasssubobject               varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_blk_dsc_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_blk_dsc
    before insert or update on wwv_mig_olb_blk_datasourcecol
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_blk_dsc_blk_id_idx on wwv_mig_olb_blk_datasourcecol (block_id);
create index wwv_mig_olb_blk_dsc_sg_id_idx on wwv_mig_olb_blk_datasourcecol (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Block -> Trigger tag of olb file
--
create table wwv_mig_olb_blk_trigger (
    id                              number
                                        constraint wwv_mig_olb_blk_trigger_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_olb_blk_trgr_blk_id_fk
                                        references wwv_mig_olb_block(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_blk_trgr_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    triggertext                     clob,
    dirtyinfo                       varchar2(4000),
    FireInQuery                     varchar2(4000),
    ExecuteHierarchy                varchar2(4000),
    DisplayInKeyboardHelp           varchar2(4000),
    KeyboardHelpText                varchar2(4000),
    TriggerStyle                    varchar2(4000),
--
    trigger_Comment                 clob,
    Hide    varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentSourceLevel2ObjectName    varchar2(4000),
    ParentSourceLevel2ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TriggerInternalType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_blk_trgr_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_blk_trigger
    before insert or update on wwv_mig_olb_blk_trigger
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_blk_trg_blk_id_idx on wwv_mig_olb_blk_trigger (block_id);
create index wwv_mig_olb_blk_trg_sg_id_idx on wwv_mig_olb_blk_trigger (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Canvas -> Graphics tag of olb file
--
create table wwv_mig_olb_cnvs_graphics (
    id                              number
                                        constraint wwv_mig_olb_cnvs_graphics_pk primary key,
    canvas_id                       number not null
                                        constraint wwv_mig_olb_cg_cnvs_id_fk
                                        references wwv_mig_olb_canvas(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_cg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
--
    AllowExpansion  varchar2(4000),
    AllowMultiLinePrompts   varchar2(4000),
    AllowStartAttachmentPrompts varchar2(4000),
    AllowTopAttachmentPrompts   varchar2(4000),
    ClipHeight  varchar2(4000),
    ClipWidth   varchar2(4000),
    ClipXPosition   varchar2(4000),
    ClipYPosition   varchar2(4000),
    Closed  varchar2(4000),
    DisplayQuality  varchar2(4000),
    Dither  varchar2(4000),
    FrameAlign  varchar2(4000),
    FrameTitleAlign varchar2(4000),
    FrameTitleBackColor varchar2(4000),
    FrameTitleFillPattern   varchar2(4000),
    FrameTitleFontName  varchar2(4000),
    FrameTitleFontSize  varchar2(4000),
    FrameTitleFontSpacing   varchar2(4000),
    FrameTitleFontStyle varchar2(4000),
    FrameTitleFontWeight    varchar2(4000),
    FrameTitleForegroundColor   varchar2(4000),
    FrameTitleVisualAttributeName   varchar2(4000),
    ImageDepth  varchar2(4000),
    ImageFilename   varchar2(4000),
    ImageFormat varchar2(4000),
    InternalEndAngle    varchar2(4000),
    InternalStartAngle  varchar2(4000),
    MaximumObjs varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    ScrollbarAlign  varchar2(4000),
    Shrinkwrap  varchar2(4000),
    SingleObjectAlign   varchar2(4000),
    SmartClass  varchar2(4000),
    StartPromptAlign    varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TabPageName varchar2(4000),
    TitleReadingOrder   varchar2(4000),
    TopPromptAlign  varchar2(4000),
    TopPromptOffset varchar2(4000),
    UpdateLayout    varchar2(4000),
    VerticalFill    varchar2(4000),
    VerticalObjectOffset    varchar2(4000),
    VisualAttributeName varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_cg_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_cnvs_graphics
    before insert or update on wwv_mig_olb_cnvs_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_cg_cnvs_id_idx on wwv_mig_olb_cnvs_graphics (canvas_id);
create index wwv_mig_olb_cg_sg_id_idx on wwv_mig_olb_cnvs_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> Block -> Item tag of olb file
--
create table wwv_mig_olb_olt_blk_item (
    id                              number
                                        constraint wwv_mig_olb_olt_blk_item_pk primary key,
    block_id                        number not null
                                        constraint wwv_mig_olb_olt_bi_blk_id_fk
                                        references wwv_mig_olb_olt_block(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_bi_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    item_comment                    clob,
    label                           varchar2(4000),
    item_prompt                     varchar2(4000),
    itemtype                        varchar2(4000),
    lovname                         varchar2(4000),
    liststyle                       varchar2(4000),
    databaseitem                    varchar2(4000),
    justification                   varchar2(4000),
    required                        varchar2(4000),
    treeallowempbranch              varchar2(4000),
    checkedvalue                    varchar2(4000),
    uncheckedvalue                  varchar2(4000),
    initializevalue                 varchar2(4000),
    formatmask                      varchar2(4000),
    tabpagename                     varchar2(4000),
    columnname                      varchar2(4000),
    multiline                       varchar2(4000),
    maximumlength                   varchar2(4000),
    bevel                           varchar2(4000),
    backcolor                       varchar2(4000),
    foregroundcolor                 varchar2(4000),
    fontname                        varchar2(4000),
    fontstyle                       varchar2(4000),
    fontsize                        varchar2(4000),
    fontweight                      varchar2(4000),
    fontspacing                     varchar2(4000),
    height                          varchar2(4000),
    width                           varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    fillpattern                     varchar2(4000),
    mousenavigate                   varchar2(4000),
    keyboardnavigable               varchar2(4000),
    nextnavigationitemname          varchar2(4000),
    showhorizontalscrollbar         varchar2(4000),
    showverticalscrollbar           varchar2(4000),
    compressionquality              varchar2(4000),
    canvasname                      varchar2(4000),
    dirtyinfo                       varchar2(4000),
    autohint                        varchar2(4000),
    caserestriction                 varchar2(4000),
    checkboxothervalues             varchar2(4000),
    concealdata                     varchar2(4000),
    datatype                        varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    enabled                         varchar2(4000),
    hint                            varchar2(4000),
    insertallowed                   varchar2(4000),
    itemsdisplay                    varchar2(4000),
    lockrecord                      varchar2(4000),
    queryallowed                    varchar2(4000),
    querylength                     varchar2(4000),
    rendered                        varchar2(4000),
    updateallowed                   varchar2(4000),
    validatefromlist                varchar2(4000),
    visible                         varchar2(4000),
    visualattributename             varchar2(4000),
    editname                        varchar2(4000),
    IconFilename                    varchar2(4000),
    Iconic                          varchar2(4000),
    ParentType                      varchar2(4000),
    ParentName                      varchar2(4000),
    ParentModule                    varchar2(4000),
    ParentModuleType                varchar2(4000),
    DisplayQuality                  varchar2(4000),
    PrimaryKey                      varchar2(4000),
    OtherValues                     varchar2(4000),
    WrapStyle                       varchar2(4000),
    FixedLength                     varchar2(4000),
    EditXPosition                   varchar2(4000),
    EditYPosition                   varchar2(4000),
    UpdateIfNull                    varchar2(4000),
    LovXPosition                    varchar2(4000),
    LovYPosition                    varchar2(4000),
    SizingStyle                     varchar2(4000),
    CaseInsensitiveQuery            varchar2(4000),
    KeepCursorPosition              varchar2(4000),
    AutoSkip                        varchar2(4000),
    ListElementCount                varchar2(4000),
    DefaultButton                   varchar2(4000),
    RecordVisualAttributeGroupName  varchar2(4000),
    SynchronizedItemName            varchar2(4000),
    PromptFontSize                  varchar2(4000),
    PromptFontName                  varchar2(4000),
    PromptFontSpacing               varchar2(4000),
    PromptFontWeight                varchar2(4000),
    PromptFontStyle                 varchar2(4000),
    PromptAlign                     varchar2(4000),
    PromptAlignOffset               varchar2(4000),
    PromptAttachmentOffset          varchar2(4000),
    PromptAttachmentEdge            varchar2(4000),
    PromptJustification             varchar2(4000),
    PromptForegroundColor           varchar2(4000),
    LowestAllowedValue              varchar2(4000),
    HighestAllowedValue             varchar2(4000),
    CopyValueFromItem               varchar2(4000),
    PromptDisplayStyle              varchar2(4000),
    LanguageDirection               varchar2(4000),
    ReadingOrder                    varchar2(4000),
    SummaryItemName                 varchar2(4000),
--
    AccessKey   varchar2(4000),
    AudioChannels   varchar2(4000),
    CalculateMode   varchar2(4000),
    CommMode    varchar2(4000),
    item_Compress    varchar2(4000),
    DataLengthSemantics varchar2(4000),
    DataSourceBlock varchar2(4000),
    DataSourceXAxis varchar2(4000),
    DataSourceYAxis varchar2(4000),
    ExecuteMode varchar2(4000),
    Filename    varchar2(4000),
    Formula varchar2(4000),
    HelpBookTopic   varchar2(4000),
    ImageDepth  varchar2(4000),
    ImageFormat varchar2(4000),
    ImplementationClass varchar2(4000),
    InitializeKeyboardDirection varchar2(4000),
    KeyboardState   varchar2(4000),
    OleActionStyle  varchar2(4000),
    OleClass    varchar2(4000),
    OleInPlaceAction    varchar2(4000),
    OleInsideOutSupport varchar2(4000),
    OlePopupMenuItems   varchar2(4000),
    OleResizStyle   varchar2(4000),
    OleShowPopupMenu    varchar2(4000),
    OleShowTenantTypeType   varchar2(4000),
    OleTenantTypeAspect varchar2(4000),
    OleTenantTypeType   varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    PopupMenuName   varchar2(4000),
    PreviousNavigationItemName  varchar2(4000),
    PromptBackColor varchar2(4000),
    PromptFillPattern   varchar2(4000),
    PromptReadingOrder  varchar2(4000),
    PromptVisualAttributeName   varchar2(4000),
    QueryName   varchar2(4000),
    QueryOnly   varchar2(4000),
    RecordGroupName varchar2(4000),
    ShowFastForward varchar2(4000),
    ShowPlay    varchar2(4000),
    ShowRecord  varchar2(4000),
    ShowRewind  varchar2(4000),
    ShowSlider  varchar2(4000),
    ShowTime    varchar2(4000),
    ShowVolume  varchar2(4000),
    SmartClass  varchar2(4000),
    SoundFormat varchar2(4000),
    SoundQuality    varchar2(4000),
    SubclassSubObject   varchar2(4000),
    SummaryBlockName    varchar2(4000),
    SummaryFunction varchar2(4000),
    Tooltip varchar2(4000),
    TooltipVisualAttributeGroup varchar2(4000),
    TreeDataQuery   varchar2(4000),
    TreeMultiSelect varchar2(4000),
    TreeShowLines   varchar2(4000),
    TreeShowSymbol  varchar2(4000),
    UpdateCommit    varchar2(4000),
    UpdateQuery varchar2(4000),
--
    select_for_app                  varchar2(1) default 'Y' not null
                                        constraint wwv_mig_olb_olt_bi_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_blk_item
    before insert or update on wwv_mig_olb_olt_blk_item
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_bi_blkid_idx on wwv_mig_olb_olt_blk_item (block_id);
create index wwv_mig_olb_olt_bi_sg_id_idx on wwv_mig_olb_olt_blk_item (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> Canvas -> Graphics tag of olb file
--
create table wwv_mig_olb_olt_cnvs_graphics (
    id                              number
                                        constraint wwv_mig_olb_t_cnvs_graphics_pk primary key,
    canvas_id                       number not null
                                        constraint wwv_mig_olb_olt_cg_cnvs_id_fk
                                        references wwv_mig_olb_olt_canvas(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_cg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
--
    AllowExpansion  varchar2(4000),
    AllowMultiLinePrompts   varchar2(4000),
    AllowStartAttachmentPrompts varchar2(4000),
    AllowTopAttachmentPrompts   varchar2(4000),
    ClipHeight  varchar2(4000),
    ClipWidth   varchar2(4000),
    ClipXPosition   varchar2(4000),
    ClipYPosition   varchar2(4000),
    Closed  varchar2(4000),
    DisplayQuality  varchar2(4000),
    Dither  varchar2(4000),
    FrameAlign  varchar2(4000),
    FrameTitleAlign varchar2(4000),
    FrameTitleBackColor varchar2(4000),
    FrameTitleFillPattern   varchar2(4000),
    FrameTitleFontName  varchar2(4000),
    FrameTitleFontSize  varchar2(4000),
    FrameTitleFontSpacing   varchar2(4000),
    FrameTitleFontStyle varchar2(4000),
    FrameTitleFontWeight    varchar2(4000),
    FrameTitleForegroundColor   varchar2(4000),
    FrameTitleVisualAttributeName   varchar2(4000),
    ImageDepth  varchar2(4000),
    ImageFilename   varchar2(4000),
    ImageFormat varchar2(4000),
    InternalEndAngle    varchar2(4000),
    InternalStartAngle  varchar2(4000),
    MaximumObjs varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    ScrollbarAlign  varchar2(4000),
    Shrinkwrap  varchar2(4000),
    SingleObjectAlign   varchar2(4000),
    SmartClass  varchar2(4000),
    StartPromptAlign    varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TabPageName varchar2(4000),
    TitleReadingOrder   varchar2(4000),
    TopPromptAlign  varchar2(4000),
    TopPromptOffset varchar2(4000),
    UpdateLayout    varchar2(4000),
    VerticalFill    varchar2(4000),
    VerticalObjectOffset    varchar2(4000),
    VisualAttributeName varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_olt_cg_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_cnv_grphcs
    before insert or update on wwv_mig_olb_olt_cnvs_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_cg_cnvs_id_idx on wwv_mig_olb_olt_cnvs_graphics (canvas_id);
create index wwv_mig_olb_olt_cg_sg_id_idx on wwv_mig_olb_olt_cnvs_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> Menu -> MenuItem tag of olb file
--
create table wwv_mig_olb_olt_menu_menuitem (
    id                              number
                                        constraint wwv_mig_olb_olt_menu_mitem_pk primary key,
    menu_id                         number not null
                                        constraint wwv_mig_olb_olt_mmi_menu_id_fk
                                        references wwv_mig_olb_olt_menu(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_mmi_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    MagicItem                       varchar2(4000),
    Label                           varchar2(4000),
    MenuItemType                    varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_olt_mmi_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_m_menuitem
    before insert or update on wwv_mig_olb_olt_menu_menuitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_mmi_menuid_idx on wwv_mig_olb_olt_menu_menuitem (menu_id);
create index wwv_mig_olb_olt_mmi_sg_id_idx on wwv_mig_olb_olt_menu_menuitem (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> ObjectGroup -> ObjectGroupChild tag of olb file
--
create table wwv_mig_olb_olt_ob_objgrpchild (
    id                              number
                                        constraint wwv_mig_olb_olt_ob_ogchild_pk primary key,
    objectgroup_id                       number not null
                                        constraint wwv_mig_olb_olt_ob_ogc_obid_fk
                                        references wwv_mig_olb_olt_objectgroup(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_ob_ogc_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    Name                            varchar2(4000),
    Type                            varchar2(4000),
--
    SubclassSubObject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
    PersistentClientInfoLength      varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ogc_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_ob_obchild
    before insert or update on wwv_mig_olb_olt_ob_objgrpchild
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_obogc_obid_idx on wwv_mig_olb_olt_ob_objgrpchild (objectgroup_id);
create index wwv_mig_olb_olt_obogc_sgid_idx on wwv_mig_olb_olt_ob_objgrpchild (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics tag of olb file
--
create table wwv_mig_olb_olt_tabpg_graphics (
    id                              number
                                        constraint wwv_mig_olb_olt_tabpg_grphs_pk primary key,
    tabpage_id                      number not null
                                        constraint wwv_mig_olb_olt_tpg_tp_id_fk
                                        references wwv_mig_olb_olt_tabpage(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_tpg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_olt_tpg_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_tp_graphcs
    before insert or update on wwv_mig_olb_olt_tabpg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_tpg_tp_id_idx on wwv_mig_olb_olt_tabpg_graphics (tabpage_id);
create index wwv_mig_olb_olt_tpg_sg_id_idx on wwv_mig_olb_olt_tabpg_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics tag of olb file
--
create table wwv_mig_olb_t_tp_g_graphics (
    id                              number
                                        constraint wwv_mig_olb_t_tp_g_graphics_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_t_tp_gg_g_id_fk
                                        references wwv_mig_olb_olt_tabpg_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_tp_gg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_t_tp_gg_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_t_tp_g_graphcs
    before insert or update on wwv_mig_olb_t_tp_g_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_tp_gg_g_id_idx on wwv_mig_olb_t_tp_g_graphics (graphics_id);
create index wwv_mig_olb_t_tp_gg_sg_id_idx on wwv_mig_olb_t_tp_g_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> CompoundText tag of olb file
--
create table wwv_mig_olb_t_tp_gg_cpdtxt (
    id                              number
                                        constraint wwv_mig_olb_t_tp_gg_cpdtxt_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_t_tp_gg_ct_g_id_fk
                                        references wwv_mig_olb_t_tp_g_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_tp_gg_ct_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_t_tp_gg_ct_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_t_tp_gg_ct
    before insert or update on wwv_mig_olb_t_tp_gg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_tp_gg_ct_gid_idx on wwv_mig_olb_t_tp_gg_cpdtxt (graphics_id);
create index wwv_mig_olb_t_tp_ggct_sgid_idx on wwv_mig_olb_t_tp_gg_cpdtxt (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Canvas -> Graphics -> Graphics -> CompoundText -> TextSegment tag of olb file
--
create table wwv_mig_olb_t_tp_gg_ct_txtsgt (
    id                              number
                                        constraint wwv_mig_olb_t_tp_gg_ct_tsgt_pk primary key,
    compoundtext_id                 number not null
                                        constraint wwv_mig_olb_ttpggctts_ctid_fk
                                        references wwv_mig_olb_t_tp_gg_cpdtxt(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttpggctts_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
    Text                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttpggctts_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_ttpggctts
    before insert or update on wwv_mig_olb_t_tp_gg_ct_txtsgt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttpggctts_ctid_idx on wwv_mig_olb_t_tp_gg_ct_txtsgt (compoundtext_id);
create index wwv_mig_olb_ttpggctts_sgid_idx on wwv_mig_olb_t_tp_gg_ct_txtsgt (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics tag of olb file
--
create table wwv_mig_olb_t_tp_gg_graphics (
    id                              number
                                        constraint wwv_mig_olb_t_tp_gg_graphcs_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_t_tp_ggg_g_id_fk
                                        references wwv_mig_olb_t_tp_g_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_tp_ggg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_t_tp_ggg_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_t_tp_gg_grphcs
    before insert or update on wwv_mig_olb_t_tp_gg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_tp_ggg_g_id_idx on wwv_mig_olb_t_tp_gg_graphics (graphics_id);
create index wwv_mig_olb_t_tp_ggg_sg_id_idx on wwv_mig_olb_t_tp_gg_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> CompoundText tag of olb file
--
create table wwv_mig_olb_t_tp_ggg_cpdtxt (
    id                              number
                                        constraint wwv_mig_olb_t_tp_ggg_cpdtxt_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_ttp_ggg_ct_gid_fk
                                        references wwv_mig_olb_t_tp_gg_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttp_gggct_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_t_tp_ggg_ct_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_t_tp_ggg_ct
    before insert or update on wwv_mig_olb_t_tp_ggg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttp_ggg_ct_gid_idx on wwv_mig_olb_t_tp_ggg_cpdtxt (graphics_id);
create index wwv_mig_olb_ttp_gggct_sgid_idx on wwv_mig_olb_t_tp_ggg_cpdtxt (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> CompoundText -> TextSegment tag of olb file
--
create table wwv_mig_olb_t_tp_ggg_ct_txtsgt (
    id                              number
                                        constraint wwv_mig_olb_t_tp_ggg_ct_tst_pk primary key,
    compoundtext_id                 number not null
                                        constraint wwv_mig_olb_ttpgggctts_ctid_fk
                                        references wwv_mig_olb_t_tp_ggg_cpdtxt(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttpgggctts_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
    Text                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttpgggctts_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_ttpgggctts
    before insert or update on wwv_mig_olb_t_tp_ggg_ct_txtsgt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttpgggctts_ctid_ix on wwv_mig_olb_t_tp_ggg_ct_txtsgt (compoundtext_id);
create index wwv_mig_olb_ttpgggctts_sgid_ix on wwv_mig_olb_t_tp_ggg_ct_txtsgt (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> Graphics tag of olb file
--
create table wwv_mig_olb_t_tp_ggg_graphics (
    id                              number
                                        constraint wwv_mig_olb_t_tp_ggg_grphcs_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_t_tp_gggg_g_id_fk
                                        references wwv_mig_olb_t_tp_gg_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_t_tp_gggg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttpgggg_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_t_tp_gggg
    before insert or update on wwv_mig_olb_t_tp_ggg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_t_tp_gggg_g_id_idx on wwv_mig_olb_t_tp_ggg_graphics (graphics_id);
create index wwv_mig_olb_t_tp_gggg_sgid_idx on wwv_mig_olb_t_tp_ggg_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> Graphics -> CompoundText tag of olb file
--
create table wwv_mig_olb_t_tp_gggg_cpdtxt (
    id                              number
                                        constraint wwv_mig_olb_t_tp_gggg_ct_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_ttpggggct_g_id_fk
                                        references wwv_mig_olb_t_tp_ggg_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttpggggct_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttpggggct_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_ttpggggct
    before insert or update on wwv_mig_olb_t_tp_gggg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttpggggct_g_id_idx on wwv_mig_olb_t_tp_gggg_cpdtxt (graphics_id);
create index wwv_mig_olb_ttpggggct_sgid_idx on wwv_mig_olb_t_tp_gggg_cpdtxt (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> Graphics -> CompoundText -> TextSegment tag of olb file
--
create table wwv_mig_olb_t_tp_gggg_ct_txsgt (
    id                              number
                                        constraint wwv_mig_olb_ttpggggct_txsgt_pk primary key,
    compoundtext_id                 number not null
                                        constraint wwv_mig_olb_ttpggggcts_ctid_fk
                                        references wwv_mig_olb_t_tp_gggg_cpdtxt(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttp4gctts_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
    Text                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttpggggctts_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_ttpggggctts
    before insert or update on wwv_mig_olb_t_tp_gggg_ct_txsgt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttp4gcts_ct_id_idx on wwv_mig_olb_t_tp_gggg_ct_txsgt (compoundtext_id);
create index wwv_mig_olb_ttp4gcts_sg_id_idx on wwv_mig_olb_t_tp_gggg_ct_txsgt (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics tag of olb file
--
create table wwv_mig_olb_t_tp_gggg_graphics (
    id                              number
                                        constraint wwv_mig_olb_t_tp_gggg_grphs_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_ttpggggg_g_id_fk
                                        references wwv_mig_olb_t_tp_ggg_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttpggggg_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    layoutstyle                     varchar2(4000),
    layoutdatablockname             varchar2(4000),
    frametitle                      varchar2(4000),
    bevel                           varchar2(4000),
    width                           varchar2(4000),
    height                          varchar2(4000),
    graphicstype                    varchar2(4000),
    graphicstext                    varchar2(4000),
    graphicsfontname                varchar2(4000),
    graphicsfontsize                varchar2(4000),
    graphicsfontstyle               varchar2(4000),
    graphicsfontweight              varchar2(4000),
    graphicsfontcolor               varchar2(4000),
    graphicsfontspacing             varchar2(4000),
    graphicsfontcolorcode           varchar2(4000),
    edgepattern                     varchar2(4000),
    edgeforegroundcolor             varchar2(4000),
    backcolor                       varchar2(4000),
    horizontalmargin                varchar2(4000),
    verticalmargin                  varchar2(4000),
    internallinewidth               varchar2(4000),
    horizontalobjectoffset          varchar2(4000),
    cornerradiusy                   varchar2(4000),
    cornerradiusx                   varchar2(4000),
    xposition                       varchar2(4000),
    yposition                       varchar2(4000),
    joinstyle                       varchar2(4000),
    startpromptoffset               varchar2(4000),
    showscrollbar                   varchar2(4000),
    scrollbarwidth                  varchar2(4000),
    distancebetweenrecords          varchar2(4000),
    frametitlespacing               varchar2(4000),
    frametitleoffset                varchar2(4000),
    edgebackcolor                   varchar2(4000),
    fillpattern                     varchar2(4000),
    dirtyinfo                       varchar2(4000),
    recordsdisplaycount             varchar2(4000),
    InternalRotationAngle           varchar2(4000),
    CapStyle                        varchar2(4000),
    DashStyle                       varchar2(4000),
    ArrowStyle                      varchar2(4000),
    ForegroundColor                 varchar2(4000),
    VerticalJustification           varchar2(4000),
    HorizontalJustification         varchar2(4000),
    BoundingBoxScalable             varchar2(4000),
    FontScaleable                   varchar2(4000),
    FixedBoundingBox                varchar2(4000),
    LineSpacing                     varchar2(4000),
    CustomSpacing                   varchar2(4000),
    LanguageDirection               varchar2(4000),
    VerticalOrigin                  varchar2(4000),
    HorizontalOrigin                varchar2(4000),
    WrapText                        varchar2(4000),
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttpggggg_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_t_tp_ggggg
    before insert or update on wwv_mig_olb_t_tp_gggg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttpggggg_g_id_idx on wwv_mig_olb_t_tp_gggg_graphics (graphics_id);
create index wwv_mig_olb_ttpggggg_sg_id_idx on wwv_mig_olb_t_tp_gggg_graphics (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> Graphics -> Graphics -> CompoundText tag of olb file
--
create table wwv_mig_olb_t_tp_ggggg_cpdtxt (
    id                              number
                                        constraint wwv_mig_olb_t_tp_ggggg_ct_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_ttpgggggct_g_id_fk
                                        references wwv_mig_olb_t_tp_gggg_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttpgggggct_sgid_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttpgggggct_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_ttpgggggct
    before insert or update on wwv_mig_olb_t_tp_ggggg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttpgggggct_gid_idx on wwv_mig_olb_t_tp_ggggg_cpdtxt (graphics_id);
create index wwv_mig_olb_ttpgggggct_sgid_ix on wwv_mig_olb_t_tp_ggggg_cpdtxt (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> Graphics -> CompoundText -> TextSegment tag of olb file
--
create table wwv_mig_olb_t_tp_ggggg_ct_txst (
    id                              number
                                        constraint wwv_mig_olb_ttpgggggct_txst_pk primary key,
    compoundtext_id                 number not null
                                        constraint wwv_mig_olb_ttp5gcts_ct_id_fk
                                        references wwv_mig_olb_t_tp_ggggg_cpdtxt(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_ttp5gcts_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
    Text                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_ttp5gctts_sfa
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_ttp5gctts
    before insert or update on wwv_mig_olb_t_tp_ggggg_ct_txst
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_ttp5gcts_ct_id_ix on wwv_mig_olb_t_tp_ggggg_ct_txst (compoundtext_id);
create index wwv_mig_olb_ttp5gcts_sg_id_ix on wwv_mig_olb_t_tp_ggggg_ct_txst (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> ObjectLibraryTab -> Block -> Item -> Trigger tag of olb file
--
create table wwv_mig_olb_olt_blk_item_trigr (
    id                              number
                                        constraint wwv_mig_olb_olt_blk_itm_trg_pk primary key,
    item_id                         number not null
                                        constraint wwv_mig_olb_olt_bit_item_id_fk
                                        references wwv_mig_olb_olt_blk_item(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_olt_bit_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    triggertext                     clob,
    dirtyinfo                       varchar2(4000),
    FireInQuery                     varchar2(4000),
    ExecuteHierarchy                varchar2(4000),
    DisplayInKeyboardHelp           varchar2(4000),
    KeyboardHelpText                varchar2(4000),
    TriggerStyle                    varchar2(4000),
--
    trigger_Comment                 clob,
    Hide    varchar2(4000),
    ParentFilename  varchar2(4000),
    ParentFilepath  varchar2(4000),
    ParentModule    varchar2(4000),
    ParentModuleType    varchar2(4000),
    ParentName  varchar2(4000),
    ParentSourceLevel1ObjectName    varchar2(4000),
    ParentSourceLevel1ObjectType    varchar2(4000),
    ParentSourceLevel2ObjectName    varchar2(4000),
    ParentSourceLevel2ObjectType    varchar2(4000),
    ParentType  varchar2(4000),
    PersistentClientInfoLength  varchar2(4000),
    SmartClass  varchar2(4000),
    SubclassObjectGroup varchar2(4000),
    SubclassSubObject   varchar2(4000),
    TriggerInternalType varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_olt_bit_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_olt_bi_trigger
    before insert or update on wwv_mig_olb_olt_blk_item_trigr
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_olt_bit_itm_id_idx on wwv_mig_olb_olt_blk_item_trigr (item_id);
create index wwv_mig_olb_olt_bit_sg_id_idx on wwv_mig_olb_olt_blk_item_trigr (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Canvas -> Graphics -> CompoundText tag of olb file
--
create table wwv_mig_olb_cg_compoundtext (
    id                              number
                                        constraint wwv_mig_olb_cg_compoundtext_pk primary key,
    graphics_id                     number not null
                                        constraint wwv_mig_olb_cg_ct_grphs_id_fk
                                        references wwv_mig_olb_cnvs_graphics(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_cg_ct_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_cg_ct_sel_for_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_cg_compoundtxt
    before insert or update on wwv_mig_olb_cg_compoundtext
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_cg_ct_gphs_id_idx on wwv_mig_olb_cg_compoundtext (graphics_id);
create index wwv_mig_olb_cg_ct_sg_id_idx on wwv_mig_olb_cg_compoundtext (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- table for ObjectLibrary -> Canvas -> Graphics -> CompoundText -> TextSegment tag of olb file
--
create table wwv_mig_olb_cg_ct_textsegment (
    id                              number
                                        constraint wwv_mig_olb_cg_ct_txtsegmnt_pk primary key,
    compoundtext_id                 number not null
                                        constraint wwv_mig_olb_cg_ct_ts_ct_id_fk
                                        references wwv_mig_olb_cg_compoundtext(id) on delete cascade,
    security_group_id               number not null
                                        constraint wwv_mig_olb_cg_ct_ts_sg_id_fk
                                        references wwv_flow_companies(provisioning_company_id) on delete cascade,
--
    name                            varchar2(4000),
    ForegroundColor                 varchar2(4000),
    FontSpacing                     varchar2(4000),
    FontWeight                      varchar2(4000),
    FontStyle                       varchar2(4000),
    FontSize                        varchar2(4000),
    FontName                        varchar2(4000),
    Text                            varchar2(4000),
--
    subclasssubobject               varchar2(4000),
    dirtyinfo                       varchar2(4000),
--
    select_for_app                  varchar2(1) default 'N' not null
                                        constraint wwv_mig_olb_cg_ct_ts_sel_f_app
                                        check (select_for_app in ('Y', 'N')),
-- Tracking information
    applicable                      varchar2(1) default 'Y',
    complete                        varchar2(1) default 'N',
    priority                        number(1,0) default 3,
    assignee                        varchar2(255),
    notes                           varchar2(4000),
    tags                            varchar2(4000),
--
    created_on                      date,
    created_by                      varchar2(400),
    last_updated_on                 date,
    last_updated_by                 varchar2(400)
)
/

create or replace trigger wwv_biu_mig_olb_cg_ct_txtsgmnt
    before insert or update on wwv_mig_olb_cg_ct_textsegment
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

create index wwv_mig_olb_cg_ct_ts_ct_id_idx on wwv_mig_olb_cg_ct_textsegment (compoundtext_id);
create index wwv_mig_olb_cg_ct_ts_sg_id_idx on wwv_mig_olb_cg_ct_textsegment (security_group_id);
-----------------------------------------------------------------------------------------------------------------------

--
-- Insert statement for wwv_mig_frm_olb_xmltagtablemap table
--
BEGIN

INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (1, 'Module', NULL, 'WWV_MIG_OLB_MODULES', 'FILE_ID');

INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (2, 'ObjectLibrary', 1, 'WWV_MIG_OLB_OBJECTLIBRARY', 'MODULE_ID');


-- (level 3) within ObjectLibrary
INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (3, 'ObjectLibraryTab', 2, 'WWV_MIG_OLB_OBJECTLIBRARYTAB', 'OBJECTLIBRARY_ID');

    -- (level 4) within ObjectLibrary -> ObjectLibraryTab
    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (10, 'Alert', 3, 'WWV_MIG_OLB_OLT_ALERT', 'OBJECTLIBRARYTAB_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (11, 'Block', 3, 'WWV_MIG_OLB_OLT_BLOCK', 'OBJECTLIBRARYTAB_ID');

        -- (level 5) within ObjectLibrary -> ObjectLibraryTab -> Block
        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
        VALUES (25, 'Item', 11, 'WWV_MIG_OLB_OLT_BLK_ITEM', 'BLOCK_ID');

            -- (level 6) within ObjectLibrary -> ObjectLibraryTab -> Block -> Item
            INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
            VALUES (32, 'Trigger', 25, 'WWV_MIG_OLB_OLT_BLK_ITEM_TRIGR', 'ITEM_ID');


    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (12, 'Canvas', 3, 'WWV_MIG_OLB_OLT_CANVAS', 'OBJECTLIBRARYTAB_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (13, 'Graphics', 3, 'WWV_MIG_OLB_OLT_GRAPHICS', 'OBJECTLIBRARYTAB_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (14, 'Item', 3, 'WWV_MIG_OLB_OLT_ITEM', 'OBJECTLIBRARYTAB_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (15, 'Menu', 3, 'WWV_MIG_OLB_OLT_MENU', 'OBJECTLIBRARYTAB_ID');

        -- (level 5) within ObjectLibrary -> ObjectLibraryTab -> Menu
        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
        VALUES (26, 'MenuItem', 15, 'WWV_MIG_OLB_OLT_MENU_MENUITEM', 'MENU_ID');


    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (16, 'ObjectGroup', 3, 'WWV_MIG_OLB_OLT_OBJECTGROUP', 'OBJECTLIBRARYTAB_ID');

        -- (level 5) within ObjectLibrary -> ObjectLibraryTab -> ObjectGroup
        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
        VALUES (27, 'ObjectGroupChild', 16, 'WWV_MIG_OLB_OLT_OB_OBJGRPCHILD', 'OBJECTGROUP_ID');


    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (17, 'Report', 3, 'WWV_MIG_OLB_OLT_REPORT', 'OBJECTLIBRARYTAB_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (18, 'TabPage', 3, 'WWV_MIG_OLB_OLT_TABPAGE', 'OBJECTLIBRARYTAB_ID');

        -- (level 5) within ObjectLibrary -> ObjectLibraryTab -> TabPage
        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
        VALUES (28, 'Graphics', 18, 'WWV_MIG_OLB_OLT_TABPG_GRAPHICS', 'TABPAGE_ID');

            -- (level 6) within ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics
            INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
            VALUES (33, 'Graphics', 28, 'WWV_MIG_OLB_T_TP_G_GRAPHICS', 'GRAPHICS_ID');

                -- (level 7) within ObjectLibrary -> Canvas -> Graphics -> Graphics
                INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                VALUES (35, 'CompoundText', 33, 'WWV_MIG_OLB_T_TP_GG_CPDTXT', 'GRAPHICS_ID');

                    -- (level 8) within ObjectLibrary -> Canvas -> Graphics -> Graphics -> CompoundText
                    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                    VALUES (37, 'TextSegment', 35, 'WWV_MIG_OLB_T_TP_GG_CT_TXTSGT', 'COMPOUNDTEXT_ID');

                -- (level 7) within ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics
                INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                VALUES (36, 'Graphics', 33, 'WWV_MIG_OLB_T_TP_GG_GRAPHICS', 'GRAPHICS_ID');

                    -- (level 8) within ObjectLibrary -> Canvas -> Graphics -> Graphics -> Graphics
                    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                    VALUES (38, 'CompoundText', 36, 'WWV_MIG_OLB_T_TP_GGG_CPDTXT', 'GRAPHICS_ID');

                        -- (level 9) within ObjectLibrary -> Canvas -> Graphics -> Graphics -> Graphics -> CompoundText
                        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                        VALUES (40, 'TextSegment', 38, 'WWV_MIG_OLB_T_TP_GGG_CT_TXTSGT', 'COMPOUNDTEXT_ID');

                    -- (level 8) within ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics
                    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                    VALUES (39, 'Graphics', 36, 'WWV_MIG_OLB_T_TP_GGG_GRAPHICS', 'GRAPHICS_ID');

                        -- (level 9) within ObjectLibrary -> Canvas -> Graphics -> Graphics -> Graphics -> Graphics
                        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                        VALUES (41, 'CompoundText', 39, 'WWV_MIG_OLB_T_TP_GGGG_CPDTXT', 'GRAPHICS_ID');

                            -- (level 10) within ObjectLibrary -> Canvas -> Graphics -> Graphics -> Graphics -> Graphics -> CompoundText
                            INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                            VALUES (43, 'TextSegment', 41, 'WWV_MIG_OLB_T_TP_GGGG_CT_TXSGT', 'COMPOUNDTEXT_ID');

                        -- (level 9) within ObjectLibrary -> ObjectLibraryTab -> TabPage -> Graphics -> Graphics -> Graphics -> Graphics
                        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                        VALUES (42, 'Graphics', 39, 'WWV_MIG_OLB_T_TP_GGGG_GRAPHICS', 'GRAPHICS_ID');

                            -- (level 10) within ObjectLibrary -> Canvas -> Graphics -> Graphics -> Graphics -> Graphics -> Graphics
                            INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                            VALUES (44, 'CompoundText', 42, 'WWV_MIG_OLB_T_TP_GGGGG_CPDTXT', 'GRAPHICS_ID');

                                -- (level 11) within ObjectLibrary -> Canvas -> Graphics -> Graphics -> Graphics -> Graphics -> Graphics -> CompoundText
                                INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
                                VALUES (45, 'TextSegment', 44, 'WWV_MIG_OLB_T_TP_GGGGG_CT_TXST', 'COMPOUNDTEXT_ID');


    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (19, 'VisualAttribute', 3, 'WWV_MIG_OLB_OLT_VISUALATTRBUTE', 'OBJECTLIBRARYTAB_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (20, 'Window', 3, 'WWV_MIG_OLB_OLT_WINDOW', 'OBJECTLIBRARYTAB_ID');

-- (level 3) within ObjectLibrary
INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (4, 'Block', 2, 'WWV_MIG_OLB_BLOCK', 'OBJECTLIBRARY_ID');

    -- (level 4) within ObjectLibrary -> Block
    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (21, 'Item', 4, 'WWV_MIG_OLB_BLK_ITEM', 'BLOCK_ID');

        -- (level 5) within ObjectLibrary -> Block -> Item
        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
        VALUES (29, 'ListItemElement', 21, 'WWV_MIG_OLB_BLK_ITEM_LIE', 'ITEM_ID');

        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
        VALUES (30, 'Trigger', 21, 'WWV_MIG_OLB_BLK_ITEM_TRIGGER', 'ITEM_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (22, 'DataSourceColumn', 4, 'WWV_MIG_OLB_BLK_DATASOURCECOL', 'BLOCK_ID');

    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (23, 'Trigger', 4, 'WWV_MIG_OLB_BLK_TRIGGER', 'BLOCK_ID');


-- (level 3) within ObjectLibrary
INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (5, 'Canvas', 2, 'WWV_MIG_OLB_CANVAS', 'OBJECTLIBRARY_ID');

    -- (level 4) within ObjectLibrary -> Canvas
    INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
    VALUES (24, 'Graphics', 5, 'WWV_MIG_OLB_CNVS_GRAPHICS', 'CANVAS_ID');

        -- (level 5) within ObjectLibrary -> Canvas -> Graphics
        INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
        VALUES (31, 'CompoundText', 24, 'WWV_MIG_OLB_CG_COMPOUNDTEXT', 'GRAPHICS_ID');

            -- (level 6) within ObjectLibrary -> Canvas -> Graphics -> CompoundText
            INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
            VALUES (34, 'TextSegment', 31, 'WWV_MIG_OLB_CG_CT_TEXTSEGMENT', 'COMPOUNDTEXT_ID');

-- (level 3) within ObjectLibrary
INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (6, 'ProgramUnit', 2, 'WWV_MIG_OLB_PROGRAMUNIT', 'OBJECTLIBRARY_ID');

-- (level 3) within ObjectLibrary
INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (7, 'PropertyClass', 2, 'WWV_MIG_OLB_PROPERTYCLASS', 'OBJECTLIBRARY_ID');

-- (level 3) within ObjectLibrary
INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (8, 'VisualAttribute', 2, 'WWV_MIG_OLB_VISUALATTRIBUTE', 'OBJECTLIBRARY_ID');

-- (level 3) within ObjectLibrary
INSERT INTO wwv_mig_frm_olb_xmltagtablemap (id, tag_name, parent_id, table_name, foreign_key_name)
VALUES (9, 'Window', 2, 'WWV_MIG_OLB_WINDOW', 'OBJECTLIBRARY_ID');

END;
/
-----------------------------------------------------------------------------------------------------------------------

