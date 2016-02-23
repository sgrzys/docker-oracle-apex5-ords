set define '^' verify off
prompt ...wwv_flow_upgrade.sql
create or replace package wwv_flow_upgrade as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_upgrade
--
--    DESCRIPTION
--      This package facilitates flows upgrades.
--      Follow the following steps to upgrade:
--      1. Install a new version of flows into a "new flows" schema.
--      2. Login to sqlplus as the "new flows" user.
--      3. exec wwv_flow_upgrade.copy_flow_meta_data('FLOWS1','FLOWS2')
--         assume flows1 is the old schema and flows2 is the new schema.
--      4. Review the upgrade log (see example query)
--      5. exec wwv_flow_upgrade.recreate_public_synonyms('FLOWS2')
--
--    NOTES
--      Example Log Query:
--         column upgrade_sequence format 9999
--         column upgrade_action format a44 wrapped
--         column upgrade_error format a50 wrapped
--         column upgrade_command format a50 wrapped
--         set linesize 160
--         set pagesize 1000
--         select upgrade_sequence, upgrade_action, upgrade_error, upgrade_command
--         from   wwv_flow_upgrade_progress
--         order by upgrade_id desc, upgrade_sequence desc
--
--      Example Log Query 2:
--         column upgrade_sequence format 9999
--         column upgrade_action format a44 wrapped
--         column upgrade_error format a50 wrapped
--         column upgrade_command format a50 wrapped
--         set linesize 160
--         set pagesize 1000
--         select upgrade_sequence, upgrade_action, upgrade_error, upgrade_command
--         from   wwv_flow_upgrade_progress
--         order by upgrade_id desc, upgrade_sequence
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa    07/03/2001 - Created
--      mhichwa    07/20/2001 - Enhanced
--      mhichwa    07/23/2001 - Added re-create public synonyms
--      mhichwa    07/27/2001 - Enhanced package documentation
--      mhichwa    07/27/2001 - Added upgrade command column
--      tmuth      08/13/2001 - Added increment session procedure
--      jstraub    09/28/2001 - Added drop_public_synonyms, create_public_synonyms, grant_public_synonyms
--                              and rewrote recreate_public_synonyms to call drop, create, & grant
--      tmuth      10/01/2001 - Added create and remove jobs procedures to manage dbms_jobs
--      tmuth      10/01/2001 - Added switch_schemas
--      tmuth      10/08/2001 - Added flows_files_objects_create and flows_files_objects_remove
--      tmuth      11/30/2001 - Set termout off for drop table
--      mhichwa    03/21/2002 - Changed comments
--      mhichwa    04/15/2002 - Exposed copy table routine
--      mhichwa    04/16/2002 - Removed exposed copy table routine
--      mhichwa    04/16/2002 - Exposed copy table routine
--      tmuth      05/01/2002 - Added copy_prefs and associcated globals
--      tmuth      11/25/2002 - Added item_attributes
--      sspadafo   02/27/2003 - Added to_template_id function (Bug 2823578)
--      jstraub    06/17/2004 - Added upgrade_to_010600 to support upgrade from 1.5.*
--      jstraub    08/27/2004 - Added template_name_cleanup (Bug 3858934)
--      cbcho      06/02/2005 - Added sw_cleanup procedure
--      cbcho      06/13/2005 - Added p_to argument to sw_cleanup
--      jduan      07/07/2005 - Modify for upgrade to 2.0
--      jkallman   08/02/2005 - Add p_from parameter to upgrade_to_020000
--      jduan      02/10/2006 - Change upgrade_to_020000 to upgrade_to_020200
--      jkallman   09/29/2006 - Change upgrade_to_020200 to upgrade_to_030000
--      jstraub    03/07/2007 - Removed wwv_flow_upgrade_progress ddl
--      msewtz     05/09/2007 - Added report_column_cleanup (bug 6029855)
--      jkallman   08/02/2007 - Rename update_to_030000 to upgrade_to_030100
--      jstraub    09/14/2007 - Added drop_private_synonyms and create_private_synonyms to support runtime
--      jstraub    01/07/2008 - Moved g_tabs and g_synonyms to package body (Bug 6707950)
--      jstraub    01/07/2008 - Removed copy_table from spec to make private (Bug 6707950)
--      jkallman   08/02/2007 - Rename upgrade_to_030100 to upgrade_to_040000
--      pawolf     01/14/2011 - Renamed upgrade_to_040000 to upgrade_to_040100
--      cbcho      03/02/2011 - Added upgrade_ws_to_040100
--      cbcho      06/02/2011 - Changed upgrade_ws_to_040100 to accept p_from
--      pawolf     02/21/2012 - Changed 040100 references to 040200
--      cneumuel   02/29/2012 - Refactoring of synonyms/grants.
--      vuvarov    07/13/2012 - Added set_environment(); made g_seq and g_upgrade_id private
--      jstraub    08/16/2012 - Added enable_ws_constraints
--      jkallman   12/17/2012 - Add support for APEX 5.0 and earlier versions
--      jstraub    10/09/2013 - Added move_template_app
--      jstraub    10/17/2013 - Added move_template_ws_app
--      jstraub    10/31/2013 - Removed move_template*_app
--      hfarrell   04/16/2014 - Added upgrate_wwv_flow_flash_chart (feature #1345)
--      cneumuel   11/06/2014 - In copy_prefs: copy created_on/last_updated_on (feature #1153)
--      jstraub    02/20/2015 - Moved g_tabs, init, disable_constraints, disable_triggers,
--                              enable_constraints, enable_triggers (bug 20381781)
--      jstraub    02/20/2015 - Added p_cdb_install to copy_flow_meta_data and enable_ws_constraints (bug 20381781)
--      jstraub    02/25/2015 - Removed p_cdb_install from enable_ws_constraints
--
--------------------------------------------------------------------------------

type d_arr   is table of date            index by binary_integer;

g_version_from         varchar2(255);
g_version_to           varchar2(255);
g_f                    number;
c                      number;
p                      number;
i                      number;
g_row_cnt              number := 0;
g_session_seq1         number := 0;
g_session_seq2         number := 0;
g_pref_name            wwv_flow.flow_vc_arr;
g_pref_value           wwv_flow.flow_vc_arr;
g_pref_desc            wwv_flow.flow_vc_arr;
g_pref_created_on      d_arr;
g_pref_last_updated_on d_arr;
g_tabs                 wwv_flow.flow_vc_arr;

procedure increment_session(
    p_old_schema        in varchar2,
    p_new_schema        in varchar2)
    ;

procedure log (
   p_action  in varchar2,
   p_error   in varchar2 default null,
   p_command in varchar2 default null)
   ;

procedure init (
    p_owner in varchar2)
    ;

procedure disable_triggers (
    --
    -- Disable all triggers to prevent unwanted changes when
    -- moving data from schema to schema.
    --
    p_owner_to         in varchar2 default null,
    p_table_name       in varchar2)
    ;

procedure enable_triggers (
    --
    -- Enable all triggers to ensure a functioning flows environment.
    --
    p_owner_to         in varchar2 default null,
    p_table_name       in varchar2)
    ;

procedure disable_constraints (
   p_owner_name        in varchar2,
   p_object_name       in varchar2)
   ;

procedure enable_constraints (
   p_owner_name        in varchar2,
   p_object_name       in varchar2)
   ;

procedure set_environment (
    p_environment_type in varchar2 default null )
    ;

procedure drop_public_synonyms (
    p_drop_all in boolean default false )
   --
   -- drop public synonyms to flow objects
   --
   -- sqlplus example:
   --    exec wwv_flow_upgrade.drop_public_synonyms;
   --
   ;

procedure create_public_synonyms (
   --
   -- create public synonyms only without dropping or granting
   -- sqlplus example:
   --    exec wwv_flow_upgrade.create_public_synonyms('FLOWS2')
   --
   p_owner_to          in varchar2)
   ;

procedure grant_public_synonyms (
   --
   -- issue grants to public synonyms only without dropping or creating
   -- sqlplus example:
   --    exec wwv_flow_upgrade.grant_public_synonyms('FLOWS2')
   --
   p_owner_to          in varchar2)
   ;


procedure recreate_public_synonyms (
   --
   -- create all needed public synonyms for a flows environment.
   --
   -- sqlplus example:
   --    exec wwv_flow_upgrade.recreate_public_synonyms('FLOWS2')
   --
   p_owner_to          in varchar2)
   ;

procedure copy_flow_meta_data (
   --
   -- Copy flows meta data from once schema to another.
   --
   -- sqlplus example:
   --    exec wwv_flow_upgrade.copy_flow_meta_data('FLOWS1','FLOWS2')
   --
   p_owner_from        in varchar2,
   p_owner_to          in varchar2,
   p_cdb_install       in varchar2 default 'NO')
   ;

procedure remove_meta_data (
   --
   -- Remove meta data that is not owned by the internal user.
   -- WARNING running this procedure could remove your flows data!
   -- Without flow meta data you have not flows.
   --
   p_schema in varchar2)
   ;

procedure purge_log
   --
   -- delete all entries in the flow upgrade log
   --
   ;

procedure remove_jobs
    --
    -- Remove all of the standard dbms_jobs for a schema
    ;

procedure create_jobs(
    --
    -- Create all of the standard dbms_jobs for a given schema
    p_owner     in varchar2)
    ;

procedure flows_files_objects_create(
    --
    -- Create the proper grants and synonyms for the flows_files schema
    -- used for file upload / download
    p_flow_owner    in varchar2,
    p_owner         in varchar2 default 'FLOWS_FILES'
    )
    ;

procedure flows_files_objects_remove(
    --
    -- Remove the proper grants and synonyms for the flows_files schema
    -- used for file upload / download
    p_flow_owner    in varchar2,
    p_owner         in varchar2 default 'FLOWS_FILES'
    )
    ;

procedure meta_cleanup(
    p_from      in varchar2,
    P_to        in varchar2);

procedure report_column_cleanup;

procedure template_name_cleanup(
    p_owner     in varchar2);

procedure switch_schemas(
    --
    -- This procedure should be run after an additional copy of flows is installed,
    -- as it is the final step in the upgrade process.
    -- Once this procedure is run, you will be running in the new version of flows.
    -- This will:
    --     1.  Remove all old dbms_jobs
    --     2.  Create all new dbms_jobs
    --     3.  Drop All public synonyms
    --     4.  Create all new public synonyms
    --     5.  Perform all necessary grants on public synoyms
    p_from      in varchar2,
    P_to        in varchar2)
    ;


procedure copy_prefs (
    --
    -- Copys old preferences from schema1.WWV_FLOW_PLATFORM_PREFS
    -- to schema2.WWV_FLOW_PLATFORM_PREFS
    --
    p_owner_from        in varchar2,
    p_owner_to          in varchar2)
    ;
function to_template_id(
  p_in varchar2)
  return number;

procedure upgrade_to_050000(
    p_owner             in varchar2,
    p_from              in varchar2)
    ;

procedure upgrade_ws_to_050000(
    p_from              in varchar2)
    ;

procedure upgrade_wwv_flow_flash_chart (
    p_flash_chart in wwv_flow_flash_charts%rowtype );

procedure sw_cleanup (
    p_from    in varchar2,
    p_to      in varchar2)
    ;

procedure enable_ws_constraints (
    p_to      in varchar2 )
    ;

end wwv_flow_upgrade;
/
show errors
