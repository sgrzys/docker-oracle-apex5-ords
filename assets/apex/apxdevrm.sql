Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      apxdevrm.sql
Rem
Rem    DESCRIPTION
Rem      This is the development environment removal script for Oracle Application Express.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   06/26/2007 - Created
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100,
Rem                             augmented application removal to include translated versions
Rem      jstraub   09/18/2007 - Removed 4155 from internal application removal
Rem      jkallman  11/21/2007 - Add drop of wwv_flow_theme_19 and wwv_flow_theme_20
Rem      jstraub   11/26/2007 - Added running runtime_grant_revoke.sql
Rem      jstraub   12/14/2007 - Removed dropping theme packages since they moved to coreins.sql
Rem      jkallman  01/30/2008 - Remove revoke of v_$sesstat, v_$sql_plan
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  09/08/2008 - Delete removal of package wwv_flow_create_flow_api (made obsolete)
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jkallman  07/23/2009 - Add drop of package wwv_flow_install_wizard as well as delete incorrect revocation of select on dba_triggers and dba_dependencies
Rem      jstraub   09/21/2009 - Added drop of team development objects
Rem      jkallman  10/05/2009 - Remove revoke on dba_indexes
Rem      jstraub   12/03/2009 - Removed dropping of wwv_flow_feedback objects
Rem      jstraub   12/03/2009 - Added dropping tables wwv_flow_team_files, wwv_flow_todo_list_items, wwv_flow_todo_list
Rem      jstraub   12/03/2009 - Added dropping views wwv_flow_feature_cols, wwv_flow_feature_def_st_codes, apex_team_bugs, apex_team_milestones, apex_team_todos
Rem      jstraub   12/03/2009 - Added dropping packages wwv_flow_dictionary, wwv_flow_advisor, wwv_flow_search, wwv_flow_f4000_plugins, wwv_flow_4000_ui,
Rem                             wwv_flow_4050_ui, wwv_flow_workspace_reports, wwv_flow_f4000_p4150
Rem      jkallman  12/16/2009 - Added drop of demo table wwv_demo_emp, wwv_demo_dept
Rem      jkallman  03/16/2010 - Removed revoke of v_$sql, added revoke on sys.dba_ind_expressions
Rem      jkallman  03/30/2010 - Removed revoke of alter system
Rem      jkallman  04/14/2010 - Added 4600,4800,4900 to list of apps to remove, disable workspace purge
Rem      pawolf    04/15/2010 - Added wwv_flow_team_gen_api
Rem      jstraub   10/12/2010 - Removed dropping of wwv_flow_todo_list_items, wwv_flow_todo_list, wwv_flow_task_priorities
Rem      jstraub   10/12/2010 - Removed dropping wwv_flow_f4000_util, wwv_flow_team_tags (bug 10104409)
Rem      jstraub   10/12/2010 - Added dropping apex_team_features view (bug 10104409)
Rem      jstraub   10/13/2010 - Added turning off the recycle bin (bug 10104409)
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      jkallman  02/14/2011 - Added revoke on gv_$process and gv_$session
Rem      jkallman  03/09/2011 - Removed the revoke on sys.dba_synonyms (Bug 11850633)
Rem      jkallman  05/23/2011 - Removed drop of wwv_flow_help
Rem      jkallman  06/13/2011 - Added remove of 4850
Rem      jkallman  07/02/2011 - Removed drop of wwv_flow_install_wizard
Rem      jkallman  09/26/2011 - Removed revoke on sys.dba_free_space and removed drop of wwv_flow_collections_showcase (Bug 12991953)
Rem      cbcho     10/24/2011 - Removed drop of packaged application objects
Rem      cneumuel  02/08/2012 - Moved revoke statements to core/runtime_grant_revoke.sql (bug #13695448)
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      pawolf    02/27/2012 - Renamed packages wwv_flow_advisor to wwv_flow_advisor_dev, wwv_flow_dictionary to wwv_flow_dictionary_dev and wwv_flow_search to wwv_flow_builder_search_dev
Rem      cbcho     03/30/2012 - Added remove of wwv_flow_pkg_app_ui
Rem      vuvarov   04/27/2012 - Removed drop of wwv_flow_copy_{lov,page_item,button} procedures
Rem      pawolf    06/26/2012 - Moved wwv_flow_create_app_from_query.* and wwv_flow_authentication_dev.* to devins.sql
Rem      pawolf    07/04/2012 - Added wwv_flow_ui_type_dev.* (feature #827)
Rem      vuvarov   07/13/2012 - Remove public synonyms (bug 12962378); remove apex_sys_* views; don't remove
Rem                             wwv_flow_pkg_app_* tables
Rem      cneumuel  07/31/2012 - Remove wwv_flow_advisor_checks_api (feature #514)
Rem      jstraub   08/14/2012 - Removed exit
Rem      jstraub   08/16/2012 - Made exit conditional
Rem      jkallman  11/08/2012 - Avoid multiple bind variables in same block (Bug 12381658)
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      pawolf    04/11/2012 - Removed package wwv_flow_theme_files and moved code to wwv_flow_theme_manager
Rem      jkallman  01/27/2014 - Added remove of 4750
Rem      vuvarov   02/03/2014 - Removed function wwv_flow_item_comps
Rem      pawolf    04/23/2014 - Removed wwv_flow_f4000_p4150.*
Rem      cneumuel  05/23/2014 - Added remove of wwv_flow_advisor_checks_int (feature #1432)
Rem      jkallman  06/10/2014 - Removed 4600, removed drop of wwv_demo_emp & wwv_demo_dept
Rem      cneumuel  06/11/2014 - Run view.sql, because runtime only views may be different from development views (wwv_flow_company_filestats_dev) (feature #1198)
Rem      jstraub   11/21/2014 - Changed to call either apxdevrm_cdb.sql or apxdevrm_nocdb.sql


set define '^'
set concat on
set concat .
set verify off

@@apxpreins.sql

COLUMN :script_name NEW_VALUE comp_file NOPRINT
VARIABLE script_name VARCHAR2(50)

declare
    l_script_name varchar2(100);
begin
    if '^CDB_ROOT' = 'YES' then
        l_script_name := 'apxdevrm_cdb.sql';
    elsif '^CDB' = 'YES' and '^META_LINK' = 'METADATA LINK' then
        l_script_name := 'apxdevrm_cdb.sql';
    else
        l_script_name := 'apxdevrm_nocdb.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;

@@^comp_file