Rem  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
Rem
Rem    NAME
Rem      coreins3.sql
Rem
Rem    DESCRIPTION
Rem      This is a primary installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by apexins.sql, the primary installation script for APEX.
Rem
Rem    NOTES
Rem      Ensure that all arguments (except image prefix) are entered in UPPERCASE.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    Arguments:
Rem      1 - CDB_ROOT       = CDB installation into root
Rem      2 - UPGRADE        = Upgrade flag (1 = NO, 2 = YES)
Rem      3 - APPUN          = APEX schema name
Rem      4 - UFROM          = The prior APEX schema in an upgrade installation
Rem      5 - INSTALL_TYPE   = Full development environment or runtime only
Rem      6 - PREFIX         = The path to the file
Rem      7 - ADM_PWD        = Random passwords
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/20/2015 - Split from coreins.sql
Rem      cneumuel  02/23/2015 - Moved restricted schema initialization to coreins3.sql (bug #20569037)
Rem                           - Added restricted schemas.
Rem      jstraub   12/01/2015 - Moved wwv_flow_upgrade.[drop|create|grant]_public_synonyms from appins.sql (bug 22105151)


set define '^'
set concat on
set concat .
set verify off
set autocommit off

define CDB_ROOT     = '^1'
define UPGRADE      = '^2'
define APPUN        = '^3'
define UFROM        = '^4'
define INSTALL_TYPE = '^5'
define PREFIX       = '^6'
define ADM_PWD      = '^7'

alter session set current_schema = ^APPUN;
alter package sys.wwv_dbms_sql compile body;
alter package wwv_flow_assert compile body;

begin
if '^UPGRADE' = '2' Then
    sys.dbms_output.put_line('   -- Switching Builder to new schema -------');
    wwv_flow_upgrade.set_environment('^INSTALL_TYPE');
    wwv_flow_upgrade.switch_schemas('^UFROM','^APPUN');
    commit;
end if;
end;
/

alter package sys.wwv_dbms_sql compile body;
alter package wwv_flow_assert compile body;

begin
if '^UPGRADE' = '2' Then
    sys.dbms_output.put_line('   -- Migrating SQL Workshop metadata -------');
    wwv_flow_upgrade.sw_cleanup('^UFROM','^APPUN');
    commit;
end if;
end;
/

alter package sys.wwv_dbms_sql compile body;
alter package wwv_flow_assert compile body;
alter package wwv_flow_api compile body;
alter package wwv_flow_utilities compile body;
alter package wwv_flow compile body;


begin
if '^UPGRADE' = '2' Then
    sys.dbms_output.put_line('   -- Upgrading new schema. -------');
    wwv_flow_upgrade.upgrade_to_050000(p_owner => '^APPUN', p_from => '^UFROM');
    commit;
end if;
end;
/

alter package sys.wwv_dbms_sql compile body;
alter package wwv_flow_assert compile body;

begin
if '^UPGRADE' = '2' Then
    sys.dbms_output.put_line('   -- Copying preferences to new schema. -------');
    wwv_flow_upgrade.copy_prefs('^UFROM','^APPUN');
    commit;
end if;
end;
/

alter package sys.wwv_dbms_sql compile body;
alter package wwv_flow_assert compile body;

begin
if '^UPGRADE' = '2' Then
    sys.dbms_output.put_line('   -- Upgrading Websheet objects. -------');
    wwv_flow_upgrade.upgrade_ws_to_050000(p_from => '^UFROM');
end if;
end;
/

alter session set current_schema = SYS;
alter session set current_schema = ^APPUN;

timing start "Recompiling ^APPUN schema"
begin
    dbms_utility.compile_schema( '^APPUN',FALSE );
end;
/
timing stop

--
-- Configure RESTful services for this instance if APEX_LISTENER exists
--
column thescript  new_val script
set termout off
select decode(has_rest, 1, 'apex_rest_config_core.sql', 'core/null1.sql') thescript
  from ( select count(*) has_rest
           from sys.dba_users
          where username = 'APEX_LISTENER' );
set termout on
@^PREFIX.^script ^ADM_PWD ^ADM_PWD

Begin
If '^UPGRADE' = '2' Then
    for c1 in (select count(1) counter from WWV_FLOW_UPGRADE_PROGRESS where upgrade_error is not null) loop
       if c1.counter > 0 then
            sys.dbms_output.put_line('ERRORS EXIST!!!');
            sys.dbms_output.put_line('...There are ' || c1.counter || ' errors in the log table! To review errors:');
            sys.dbms_output.put_line('select upgrade_command, upgrade_error from ^APPUN..WWV_FLOW_UPGRADE_PROGRESS');
            sys.dbms_output.put_line('where upgrade_error is not null order by upgrade_date;');
            sys.dbms_output.put_line('');
        else
            sys.dbms_output.put_line('Upgrade completed successfully no errors encountered.');
        end if;
    end loop;
    sys.dbms_output.put_line('');
    sys.dbms_output.put_line('');
    sys.dbms_output.put_line('   -- Upgrade is complete -----------------------------------------');
End if;
end;
/
timing stop

timing start "Install Internal Applications"
prompt  VIII.   I N S T A L L    O R A C L E   A P E X   A P P L I C A T I O N S
set define '^'
show define

prompt ...Initialize the table of Oracle default schema names
declare
    l_schemas wwv_flow_t_varchar2;
begin
    l_schemas := wwv_flow_t_varchar2 (
                     'ANONYMOUS',
                     'APEX_LISTENER', 'APEX_PUBLIC_USER', 'APEX_REST_PUBLIC_USER',
                     'APPQOSSYS',
                     'AUDSYS',
                     'AURORA$JIS$UTILITY$', 'AURORA$ORB$UNAUTHENTICATED',
                     'AVSYS',
                     'CTXSYS',
                     'DBSNMP',
                     'DIP',
                     'DMSYS',
                     'DVF', 'DVSYS',
                     'EXFSYS',
                     'FLOWS_FILES',
                     'GSMADMIN_INTERNAL', 'GSMCATUSER', 'GSMUSER',
                     'HTMLDB_PUBLIC_USER',
                     'LBACSYS',
                     'MDDATA', 'MDSYS',
                     'MGMT_VIEW',
                     'ODM', 'ODM_MTR',
                     'OE',
                     'OJVMSYS',
                     'OLAPSYS',
                     'ORACLE_OCM',
                     'ORDDATA', 'ORDPLUGINS', 'ORDSYS',
                     'OSE$HTTP$ADMIN',
                     'OUTLN',
                     'PERFSTAT',
                     'PM',
                     'QS', 'QS_ADM', 'QS_CB', 'QS_CBADM', 'QS_CS', 'QS_ES', 'QS_OS', 'QS_WS',
                     'REMOTE_SCHEDULER_AGENT',
                     'RMAN',
                     'SH',
                     'SI_INFORMTN_SCHEMA',
                     'SPATIAL_CSW_ADMIN_USR', 'SPATIAL_WFS_ADMIN_USR',
                     'SYS', 'SYSBACKUP', 'SYSDG', 'SYSKM', 'SYSMAN', 'SYSRAC', 'SYSTEM', 'SYS$UMF',
                     'TSMSYS',
                     'WKPROXY', 'WKSYS', 'WK_TEST',
                     'WMSYS',
                     'XDB',
                     'XS$NULL' );
    if not wwv_flow_global.g_xe then
        l_schemas.extend;
        l_schemas(l_schemas.count) := 'SCOTT';
    end if;

    insert into wwv_flow_restricted_schemas (
           schema )
    select schema
      from ( select s.column_value schema
               from table(l_schemas) s
           ) s
     where not exists ( select null
                          from wwv_flow_restricted_schemas s2
                         where s2.schema = s.schema );
end;
/

column foo new_val script
set termout off
select decode('^INSTALL_TYPE','MANUAL','apxsqler.sql','RUNTIME','apxsqler.sql','core/null1.sql') foo from sys.dual;
set termout on
@^PREFIX.^script

set define '^'

prompt ...Page Designer metadata install
-- PD meta data are referenced by plug-ins, that's why we always have to install them.
-- We skip the creation of system messages, because they will be loaded by f4411.sql
@^PREFIX.core/apex_install_pe_data.sql NO

prompt ...Internal messages
@^PREFIX.builder/f4411.sql

set define '^'

@^PREFIX.builder/f4155.sql

set define '^'


--
-- Load internal themes
--
@^PREFIX.core/themes/apex_install_internal_themes.sql

set define '^'

begin
    sys.dbms_utility.compile_schema( '^APPUN', false );
end;
/

alter package wwv_flow_assert compile body;

begin
    wwv_flow_upgrade.drop_public_synonyms();
end;
/

alter package wwv_flow_assert compile body;

begin
    wwv_flow_upgrade.create_public_synonyms('^APPUN');
end;
/

alter package wwv_flow_assert compile body;

begin
    sys.dbms_utility.compile_schema( '^APPUN', false );
end;
/

alter package wwv_flow_assert compile body;

begin
    wwv_flow_upgrade.grant_public_synonyms('^APPUN');
end;
/

alter package wwv_flow_assert compile body;
alter package wwv_flow_security compile body;

prompt ...Applications install if necessary
column foo new_val script
set termout off
select decode('^INSTALL_TYPE','RUNTIME','core/null1.sql','appins.sql') foo from sys.dual;
set termout on
@^PREFIX.^script
