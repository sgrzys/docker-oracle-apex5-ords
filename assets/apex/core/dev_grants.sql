set define '^' verify off
prompt dev_grants.sql

Rem  Copyright (c) Oracle Corporation 2007 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      dev_grants.sql
Rem
Rem    DESCRIPTION
Rem      System and object grants for Application Express development installation
Rem
Rem    NOTES
Rem
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    RUNTIME DEPLOYMENT: No
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  07/09/2007 - Created
Rem      jstraub   07/10/2007 - Moved grants to dba_users, sys.users$, v$database, dba_source, dba_cons_columns,
Rem                             dba_constraints, dba_views, dba_errors, dba_col_comments to core_grants.sql
Rem      jkallman  01/30/2008 - Remove grant of v_$sesstat and v_$sql_plan - moved to core_grants.sql
Rem      sspadafo  07/20/2008 - Remove grant of execute any procedure (Bug 7225208, 7229026)
Rem      jkallman  08/07/2008 - Move grant on sys.dba_free_space from dev_grants.sql to core_grant.sql (Bug 7308558)
Rem      jkallman  08/27/2008 - Restore grant of execute any procedure (Bug 7340942)
Rem      sspadafo  11/03/2008 - Added grant select on sys.dba_arguments, sys.dba_procedures (Bug 7270054)
Rem      sspadafo  11/03/2008 - Remove grant of execute any procedure (Bug 7270054)
Rem      sspadafo  11/04/2008 - Changed grant of select on sys.dba_arguments to a block that do this conditionally based on db version and also creates a private synonym for sys.dba_arguments (Bug 7270054)
Rem      sspadafo  11/15/2008 - Fix quoting problem in "where owner = ^APPUN"
Rem      sspadafo  11/16/2008 - Change condition for sys.dba_arguments check to exclude XE because the view does not exist in XE (Bug 7270054)
Rem      jkallman  11/17/2008 - Move grant on sys.dba_triggers, sys.dba_dependencies from dev_grants.sql to core_grants.sql
Rem      sspadafo  12/02/2008 - Change logic for dealing with sys.dba_arguments view and synonym (Bug 7270054)
Rem      jkallman  10/05/2009 - Move grant on dba_indexes from dev_grants.sql to core_grants.sql
Rem      jkallman  03/16/2010 - Moved grant on v_$sql to core_grants.sql, added grant on sys.dba_ind_expressions
Rem      jkallman  03/30/2010 - Removed grant of alter system
Rem      jkallman  04/26/2010 - Moved grant on sys.dba_synonyms to core_grants.sql (needed for SSO)
Rem      jkallman  02/14/2011 - Added grants on gv_$session and gv_$process
Rem      cneumuel  07/25/2011 - Added grant flashback on dual (bug #12749610)
Rem      cneumuel  11/08/2011 - Formatted and sorted privileges
Rem      cneumuel  11/08/2011 - Added additional grants (Bug 13354894)
Rem      cneumuel  12/19/2011 - Added additional grants (Bug 13354894)
Rem      cneumuel  01/30/2012 - Added grants for apex_sys_all% views (bug 13500701)
Rem      jkallman  03/29/2012 - Added grant on dba_rsrc_consumer_groups (Feature #757)
Rem      jkallman  04/17/2012 - Added and removed a number of grants, extending database monitor to use GV$ views (Feature #906)
Rem      pawolf    01/30/2013 - Added diana, diutil, pidl and v$reserved_words to support autocomplete in code editor
Rem      cneumuel  01/31/2013 - added _ in sys.v_$reserved_words
Rem      vuvarov   03/01/2013 - Removed dba_tab_comments grant (bug 16424193)
Rem      cneumuel  01/13/2014 - Moved grant on dba_types to core_grants.sql
Rem      cneumuel  05/05/2014 - Moved grant on gv_$session to core_grants.sql
Rem      cneumuel  09/11/2014 - Added grant on sys.v_$object_privilege (bug #19537903)
Rem      cneumuel  12/04/2014 - Remove code for dba_arguments (bug #20130260)
Rem      cneumuel  12/09/2014 - Removed sys.seg$ (bug #20130260)
Rem      cneumuel  12/10/2014 - Added grant on dba_arguments instead of argument$ (bug #20130260)

prompt ...grant APEX owner development privileges

grant execute   on sys.dbms_metadata                  to ^APPUN;
grant execute   on sys.diana                          to ^APPUN;
grant execute   on sys.diutil                         to ^APPUN;
grant execute   on sys.ku$_ddls                       to ^APPUN;
grant execute   on sys.ku$_ddl                        to ^APPUN;
grant execute   on sys.pidl                           to ^APPUN;
grant execute   on xdb.dbms_xmldom                    to ^APPUN;
grant execute   on xdb.dbms_xmlparser                 to ^APPUN;
grant flashback on dual                               to ^APPUN;
grant select    on dba_rollback_segs                  to ^APPUN;
grant select    on sys.all_constraints                to ^APPUN with grant option;
grant select    on sys.all_dependencies               to ^APPUN with grant option;
grant select    on sys.all_objects                    to ^APPUN with grant option;
grant select    on sys.all_synonyms                   to ^APPUN with grant option;
grant select    on sys.dba_arguments                  to ^APPUN;
grant select    on sys.dba_col_privs                  to ^APPUN;
grant select    on sys.dba_db_links                   to ^APPUN;
grant select    on sys.dba_ind_expressions            to ^APPUN;
grant select    on sys.dba_procedures                 to ^APPUN;
grant select    on sys.dba_profiles                   to ^APPUN;
grant select    on sys.dba_rsrc_consumer_groups       to ^APPUN;
grant select    on sys.dba_rsrc_plan_directives       to ^APPUN;
grant select    on sys.dba_snapshots                  to ^APPUN;
grant select    on sys.dba_trigger_cols               to ^APPUN;
grant select    on sys.dba_types                      to ^APPUN;
grant select    on sys.gv_$locked_object              to ^APPUN;
grant select    on sys.gv_$mystat                     to ^APPUN;
grant select    on sys.gv_$open_cursor                to ^APPUN;
grant select    on sys.gv_$process                    to ^APPUN;
grant select    on sys.gv_$session_longops            to ^APPUN;
grant select    on sys.gv_$session_wait               to ^APPUN;
grant select    on sys.gv_$sess_io                    to ^APPUN;
grant select    on sys.gv_$sql_plan                   to ^APPUN;
grant select    on sys.gv_$sql                        to ^APPUN;
grant select    on sys.gv_$statname                   to ^APPUN;
grant select    on sys.gv_$sysstat                    to ^APPUN;
grant select    on sys.obj$                           to ^APPUN;
grant select    on sys.user_constraints               to ^APPUN;
grant select    on sys.user_objects                   to ^APPUN;
grant select    on sys.user_source                    to ^APPUN;
grant select    on sys.user_tab_columns               to ^APPUN;
grant select    on sys.v_$object_privilege            to ^APPUN;
grant select    on sys.v_$reserved_words              to ^APPUN;
grant select    on sys.v_$version                     to ^APPUN;

begin
    -- Grant select on sys.dba_recyclebin.  Silently fail if it does not exist
    execute immediate 'grant select on sys.dba_recyclebin to ^APPUN';
exception
    when others then
        null;
end;
/

begin
    -- Grant select on sys.dba_feature_usage_statistics.  Silently fail if it does not exist
    execute immediate 'grant select on sys.dba_feature_usage_statistics to ^APPUN';
exception
    when others then
        null;
end;
/

prompt ...done grant APEX owner development privileges
