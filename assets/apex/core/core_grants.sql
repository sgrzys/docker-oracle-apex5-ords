set define '^' verify off
prompt core_grants.sql

Rem  Copyright (c) Oracle Corporation 2007 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      core_grants.sql
Rem
Rem    DESCRIPTION
Rem      System and object grants for Application Express core (runtime) installation
Rem
Rem    NOTES
Rem
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    RUNTIME DEPLOYMENT: Yes
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  07/09/2007 - Created
Rem      jstraub   07/10/2007 - Added grants to dba_users, sys.users$, v$database, dba_source, dba_cons_columns,
Rem                             dba_constraints, dba_views, dba_errors, dba_col_comments
Rem      jstraub   11/26/2007 - Added set termout on after select_catalog_role grant
Rem      jkallman  01/30/2008 - Add grants on sys.v_$sql_plan and sys.v_$sesstat
Rem      jkallman  01/31/2008 - Remove grant on sys.dbms_sys_sql
Rem      sspadafo  07/20/2008 - Remove "with grant option" from grant select on sys.user$ (Bug 7225208, 7229057)
Rem      sspadafo  07/20/2008 - Remove grant select catalog_role (Bug 7225208, 7229036)
Rem      sspadafo  07/30/2008 - Remove unnecessary set termout off/set termout on statements
Rem      jkallman  08/07/2008 - Move grant on sys.dba_free_space from dev_grants.sql to core_grant.sql (Bug 7308558)
Rem      jstraub   08/14/2008 - Added grant on DBMS_JOB
Rem      sspadafo  11/02/2008 - Added grant select on sys.dba_arguments, sys.dba_procedures (Bug 7270054)
Rem      sspadafo  11/03/2008 - Removed grant select on sys.dba_arguments, sys.dba_procedures, moved to dev_grants.sql (Bug 7270054)
Rem      jkallman  11/17/2008 - Move grant on sys.dba_triggers, sys.dba_dependencies from dev_grants.sql to core_grants.sql
Rem      jkallman  11/21/2008 - Added grant on sys.v_$instance
Rem      sspadafo  05/17/2009 - Removed "with grant option" from grant execute on sys.dbms_lob (Bug 8417472)
Rem      sspadafo  05/17/2009 - Added grants to APPUN for dbms_random, dbms_obfuscation_toolkit (Bug 8466721)
Rem      jkallman  10/05/2009 - Move grant on dba_indexes from dev_grants.sql to core_grants.sql
Rem      jkallman  11/23/2009 - Added grant on dbms_scheduler
Rem      jkallman  03/16/2010 - Added grant on sys.v_$object_dependency, v_$sql
Rem      jkallman  03/16/2010 - Removed grant on sys.all_triggers
Rem      jkallman  03/19/2010 - Remove grants on all sys.all_ views
Rem      jkallman  03/22/2010 - Added grant for sys.dba_tab_comments
Rem      jkallman  04/01/2010 - Added grants on sys.v_$backup and sys.dba_ts_quotas
Rem      jkallman  04/26/2010 - Added grant on sys.dba_synonyms (needed for SSO)
Rem      jkallman  05/20/2010 - Changed grant of connect to create session (Bug 9734443)
Rem      cneumuel  04/08/2011 - Remove grants of CREATE ANY CONTEXT and DBMS_RLS (Bug 12339881)
Rem      jkallman  05/11/2011 - Remove grant on utl_file, add grant on utl_url
Rem      jkallman  05/23/2011 - Remove grants on ctx_doc and ctx_ddl
Rem      jkallman  07/21/2011 - Added grant on sys.dbms_stats
Rem      jkallman  09/19/2011 - Added grant on sys.dbms_sql
Rem      jkallman  11/07/2011 - Added 4 missing grants (Bug 13354894)
Rem      cneumuel  11/08/2011 - Formatted and sorted privileges
Rem      cneumuel  11/08/2011 - Added additional grants (Bug 13354894)
Rem      cneumuel  11/08/2011 - Revoked resource role, since all sys privs are already granted to APPUN (Bug 13354894)
Rem      jkallman  12/01/2011 - Added grant on sys.v_$encryption_wallet
Rem      cneumuel  12/19/2011 - Added additional grants (Bug 13354894)
Rem      jkallman  01/06/2012 - Change grant on v_$enryption_wallet to be dynamic, did not exist on 10.2xe
Rem      cneumuel  01/27/2012 - Added grant on all_users and all_col_comments (used in apex dictionary views) with grant option, because of cloud lockdown
Rem      jkallman  02/02/2012 - Added grant on v_$dblink
Rem      jkallman  04/11/2012 - Changed grant on user_rsrc_consumer_group_privs to dba_rsrc_consumer_group_privs
Rem      jkallman  04/19/2012 - Removed a number of grants, only necessary for development (Feature #906)
Rem      cneumuel  05/24/2012 - grant select on gv_$instance instead of v_$instance (feature #940)
Rem      cneumuel  02/26/2013 - grant select on sys.wwv_flow_gv$session (bug #15893138)
Rem      vuvarov   03/01/2013 - Removed dba_tab_comments grant (bug 16424193)
Rem      pawolf    04/24/2013 - Added xdb.dbms_xdb used by wwv_flow_file_api
Rem      jstraub   06/07/2013 - Added grants for 12c data redaction
Rem      jstraub   06/20/2013 - Removed with grant option from redaction grants
Rem      cneumuel  07/01/2013 - Added grants for 12c real application security (feature #1152)
Rem      cneumuel  07/04/2013 - Added grant for dba_xs_dynamic_roles and v_$xs_session_roles (feature #1152)
Rem      cneumuel  08/26/2013 - Changed ASSIGN_USER grant to APPUN because RAS now uses current_user for check, not logon user (bug #17047479)
Rem      cneumuel  09/12/2013 - Added dba_xs_ns_templates (feature #1152)
Rem      cneumuel  10/09/2013 - Added dba_tab_cols
Rem      cneumuel  01/13/2014 - Added dba_types, dba_coll_types
Rem      cneumuel  05/05/2014 - Removed wwv_flow_gv$session, added grant on gv_$session
Rem      cneumuel  05/15/2014 - Added utl_i18n
Rem      cneumuel  07/02/2014 - Added utl_compress, xmltype, user_dependencies, user_tables, getlong, sys_nt_collect, sys_stub_for_purity_analysis, xml_schema_name_present, xqsequence, utl_call_stack,
Rem                           - dbms_xs_nsattr, dbms_xs_nsattrlist, dbms_xs_sessions, xs$name_list
Rem      cneumuel  07/22/2014 - grant EXEMPT REDACTION POLICY to APEX schema (bug #19247024)
Rem      cneumuel  07/23/2014 - in ddl: catch and ignore ora-00990 (missing or invalid privilege)
Rem      cneumuel  08/08/2014 - Added dual
Rem      cneumuel  09/29/2014 - Added RAS privilege SET_DYNAMIC_ROLES
Rem      cneumuel  10/24/2014 - Added dba_tab_identity_cols
Rem      cneumuel  11/07/2014 - Added dba_network_acls, dba_network_acl_privileges, dba_registry (feature #1153)
Rem      cneumuel  12/05/2014 - Removed user$ and ts$ (bug #20130260)
Rem      cneumuel  12/09/2014 - Added dba_roles (bug #20130260)
Rem      cneumuel  08/11/2015 - Added dba_proxies (bug #21609698)
Rem      jstraub   09/09/2015 - Added dba_scheduler_jobs (bug 21812064)

prompt ...grant APEX owner core privileges

--
-- tab (object) privs
--
grant execute on sys.dbms_application_info          to ^APPUN;
grant execute on sys.dbms_assert                    to ^APPUN;
grant execute on sys.dbms_db_version                to ^APPUN;
grant execute on sys.dbms_flashback                 to ^APPUN;
grant execute on sys.dbms_job                       to ^APPUN;
grant execute on sys.dbms_ldap                      to ^APPUN;
grant execute on sys.dbms_ldap_utl                  to ^APPUN;
grant execute on sys.dbms_lob                       to ^APPUN;
grant execute on sys.dbms_lock                      to ^APPUN;
grant execute on sys.dbms_obfuscation_toolkit       to ^APPUN;
grant execute on sys.dbms_output                    to ^APPUN;
grant execute on sys.dbms_random                    to ^APPUN;
grant execute on sys.dbms_registry                  to ^APPUN;
grant execute on sys.dbms_scheduler                 to ^APPUN;
grant execute on sys.dbms_session                   to ^APPUN;
grant execute on sys.dbms_sql                       to ^APPUN;
grant execute on sys.dbms_stats                     to ^APPUN;
grant execute on sys.dbms_types                     to ^APPUN;
grant execute on sys.dbms_utility                   to ^APPUN;
grant execute on sys.dbms_xmlgen                    to ^APPUN;
grant execute on sys.htf                            to ^APPUN;
grant execute on sys.htp                            to ^APPUN;
grant execute on sys.owa_cookie                     to ^APPUN;
grant execute on sys.owa_custom                     to ^APPUN;
grant execute on sys.owa                            to ^APPUN;
grant execute on sys.owa_util                       to ^APPUN;
grant execute on sys.utl_compress                   to ^APPUN;
grant execute on sys.utl_encode                     to ^APPUN;
grant execute on sys.utl_http                       to ^APPUN;
grant execute on sys.utl_i18n                       to ^APPUN;
grant execute on sys.utl_lms                        to ^APPUN;
grant execute on sys.utl_raw                        to ^APPUN;
grant execute on sys.utl_smtp                       to ^APPUN;
grant execute on sys.utl_url                        to ^APPUN;
grant execute on sys.wpg_docload                    to ^APPUN;
grant execute on sys.xmltype                        to ^APPUN;
grant execute on xdb.dbms_xdb                       to ^APPUN;
grant select  on sys.all_col_comments               to ^APPUN with grant option;
grant select  on sys.all_scheduler_jobs             to ^APPUN;
grant select  on sys.all_tab_columns                to ^APPUN;
grant select  on sys.all_tab_comments               to ^APPUN;
grant select  on sys.all_users                      to ^APPUN with grant option;
grant select  on sys.all_views                      to ^APPUN;
grant select  on sys.dba_col_comments               to ^APPUN;
grant select  on sys.dba_coll_types                 to ^APPUN;
grant select  on sys.dba_cons_columns               to ^APPUN;
grant select  on sys.dba_constraints                to ^APPUN;
grant select  on sys.dba_data_files                 to ^APPUN;
grant select  on sys.dba_data_files                 to ^APPUN;
grant select  on sys.dba_dependencies               to ^APPUN;
grant select  on sys.dba_errors                     to ^APPUN;
grant select  on sys.dba_extents                    to ^APPUN;
grant select  on sys.dba_free_space                 to ^APPUN;
grant select  on sys.dba_ind_columns                to ^APPUN;
grant select  on sys.dba_indexes                    to ^APPUN;
grant select  on sys.dba_jobs                       to ^APPUN;
grant select  on sys.dba_lock                       to ^APPUN;
grant select  on sys.dba_network_acls               to ^APPUN;
grant select  on sys.dba_network_acl_privileges     to ^APPUN;
grant select  on sys.dba_objects                    to ^APPUN;
grant select  on sys.dba_proxies                    to ^APPUN;
grant select  on sys.dba_registry                   to ^APPUN;
grant select  on sys.dba_role_privs                 to ^APPUN;
grant select  on sys.dba_roles                      to ^APPUN;
grant select  on sys.dba_scheduler_jobs             to ^APPUN;
grant select  on sys.dba_segments                   to ^APPUN;
grant select  on sys.dba_sequences                  to ^APPUN;
grant select  on sys.dba_source                     to ^APPUN;
grant select  on sys.dba_synonyms                   to ^APPUN;
grant select  on sys.dba_sys_privs                  to ^APPUN;
grant select  on sys.dba_tab_columns                to ^APPUN;
grant select  on sys.dba_tab_cols                   to ^APPUN;
grant select  on sys.dba_tablespaces                to ^APPUN;
grant select  on sys.dba_tables                     to ^APPUN;
grant select  on sys.dba_tab_privs                  to ^APPUN;
grant select  on sys.dba_triggers                   to ^APPUN;
grant select  on sys.dba_ts_quotas                  to ^APPUN;
grant select  on sys.dba_types                      to ^APPUN;
grant select  on sys.dba_users                      to ^APPUN;
grant select  on sys.dba_views                      to ^APPUN;
grant select  on sys.dual                           to ^APPUN;
grant select  on sys.nls_database_parameters        to ^APPUN;
grant select  on sys.nls_session_parameters         to ^APPUN;
grant select  on sys.user_dependencies              to ^APPUN;
grant select  on sys.user_role_privs                to ^APPUN;
grant select  on sys.user_tables                    to ^APPUN;
grant select  on sys.dba_rsrc_consumer_group_privs  to ^APPUN;
grant select  on sys.user_sys_privs                 to ^APPUN;
grant select  on sys.gv_$session                    to ^APPUN;
grant select  on sys.gv_$backup                     to ^APPUN;
grant select  on sys.v_$database                    to ^APPUN;
grant select  on sys.gv_$instance                   to ^APPUN;
grant select  on sys.v_$object_dependency           to ^APPUN;
grant select  on sys.v_$parameter                   to ^APPUN;
grant select  on sys.gv_$sesstat                    to ^APPUN;
grant select  on sys.v_$timer                       to ^APPUN;
grant select  on sys.v_$dblink                      to ^APPUN;

declare
    e_missing_privilege  exception;
    pragma exception_init(e_missing_privilege, -990);
    e_table_does_not_exist exception;
    pragma exception_init(e_table_does_not_exist, -942);
    e_proc_does_not_exist  exception;
    pragma exception_init(e_proc_does_not_exist, -4042);
    procedure ddl (
        p_sql                  in varchar2 )
    is
    begin
        execute immediate p_sql;
    exception when e_missing_privilege
                or e_table_does_not_exist
                or e_proc_does_not_exist
    then
        null;
    end ddl;
    procedure grant_system_privilege (
        priv_name in varchar2,
        user_name in varchar2 default '^APPUN' )
    is
    begin
        $if sys.dbms_db_version.version >= 12 $then
        sys.xs_admin_util.grant_system_privilege (
            priv_name => priv_name,
            user_name => user_name );
        $else
        null;
        $end
    exception when others then null;
    end;
begin
    --
    -- Grant select on sys.v_$encryption_wallet
    --
    ddl(p_sql => 'grant select  on sys.v_$encryption_wallet to ^APPUN');
    --
    -- Grant execute on sys.dbms_crypto
    --
    ddl(p_sql => 'grant execute on sys.dbms_crypto to ^APPUN');
    ddl(p_sql => 'grant execute on sys.getlong to ^APPUN');
    ddl(p_sql => 'grant execute on sys.sys_nt_collect to ^APPUN');
    ddl(p_sql => 'grant execute on sys.sys_stub_for_purity_analysis to ^APPUN');
    --
    -- Xmltype dependencies
    --
    ddl(p_sql => 'grant execute on sys.xml_schema_name_present to ^APPUN');
    ddl(p_sql => 'grant execute on sys.xqsequence to ^APPUN');
    --
    -- Redaction, 12c and above
    --
    ddl(p_sql => 'grant select on sys.redaction_policies to ^APPUN');
    ddl(p_sql => 'grant select on sys.redaction_columns to ^APPUN');
    ddl(p_sql => 'grant select on sys.redaction_values_for_type_full to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_redact to ^APPUN');
    ddl(p_sql => 'grant exempt redaction policy to ^APPUN');
    --
    -- Call Stack, 12c and above
    --
    ddl(p_sql => 'grant execute on sys.utl_call_stack to ^APPUN');
    --
    -- Real Application Security, 12c and above
    --
    ddl(p_sql => 'grant select on sys.dba_xs_dynamic_roles to ^APPUN');
    ddl(p_sql => 'grant select on sys.dba_xs_ns_templates to ^APPUN');
    ddl(p_sql => 'grant select on sys.v_$xs_session_roles  to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_xs_nsattr to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_xs_nsattrlist to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_xs_sessions to ^APPUN');
    ddl(p_sql => 'grant execute on sys.xs$name_list to ^APPUN');
    -- for dbms_xs_sessions.create_session
    grant_system_privilege (
        priv_name => 'CREATE_SESSION',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.set_inactivity_timeout
    grant_system_privilege (
        priv_name => 'MODIFY_SESSION',
        user_name => '^APPUN' );
    -- for attach via dbms_sys_sql
    grant_system_privilege (
        priv_name => 'ATTACH_SESSION',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.destroy_session
    grant_system_privilege (
        priv_name => 'TERMINATE_SESSION',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.assign_user
    grant_system_privilege (
        priv_name => 'ASSIGN_USER',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.assign_user
    grant_system_privilege (
        priv_name => 'SET_DYNAMIC_ROLES',
        user_name => '^APPUN' );
    --
    -- identity columns
    --
    ddl(p_sql => 'grant select on sys.dba_tab_identity_cols to ^APPUN');
end;
/
set termout on

--
-- sys privs
--
grant alter database           to ^APPUN;
grant alter session            to ^APPUN;
grant alter user               to ^APPUN;
grant create cluster           to ^APPUN with admin option;
grant create dimension         to ^APPUN with admin option;
grant create indextype         to ^APPUN with admin option;
grant create materialized view to ^APPUN with admin option;
grant create operator          to ^APPUN with admin option;
grant create procedure         to ^APPUN with admin option;
grant create public synonym    to ^APPUN;
grant create role              to ^APPUN;
grant create sequence          to ^APPUN with admin option;
grant create session           to ^APPUN with admin option;
grant create snapshot          to ^APPUN with admin option;
grant create synonym           to ^APPUN with admin option;
grant create tablespace        to ^APPUN;
grant create table             to ^APPUN with admin option;
grant create trigger           to ^APPUN with admin option;
grant create type              to ^APPUN with admin option;
grant create user              to ^APPUN;
grant create view              to ^APPUN with admin option;
grant drop   public synonym    to ^APPUN;
grant drop tablespace          to ^APPUN;
grant drop user                to ^APPUN;

begin
    for c1 in (select null
                 from v$instance
                where version like '1%') loop
        execute immediate 'grant create job to ^APPUN with admin option';
        exit;
    end loop;
end;
/


prompt ...done grant APEX owner core privileges
