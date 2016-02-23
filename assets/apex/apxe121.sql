Rem Copyright (c) 2008, Oracle. All rights reserved.
Rem
Rem    NAME
Rem      apxe121.sql
Rem
Rem    DESCRIPTION
Rem      Runs downgrade actions for Application Express.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIRENTS
Rem      Application Express
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/26/2008 - Created for 11.2 downgrade
Rem      jstraub   04/14/2008 - Changed logic to revert images directory to prior release, only if resource exists (lrg 3366866)
Rem      jstraub   05/08/2008 - Added call to validate_apex since there is no apxrelod script for 10.1 and 10.2 (lrg 3398351)
Rem      jkallman  10/02/2008 - Change FLOWS_030100 references to APEX_040000
Rem      jstraub   12/08/2008 - Changed current_schema to ^UFROM prior to wwv_flow_upgrade.switch_schemas (lrg 3702914)
Rem      jstraub   03/18/2009 - Removed call to validate_apex per component script guidelines, already in apxrelod.sql
Rem      jstraub   10/27/2009 - Moved storing of apxset.sql to $ORACLE_HOME/rdbms/log (Bug 7422107)
Rem      jstraub   05/12/2011 - Adapted for downgrade from 12.1 to 11.2
Rem      jstraub   10/20/2011 - Changed APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jstraub   03/20/2012 - Changed current_schema in call to wwv_flow_upgrade.switch_schemas to fix 12c issue
Rem      jstraub   04/30/2012 - Added changes to support downgrade from 12c
Rem      jstraub   04/29/2014 - Removed reverting images directory during downgrade, (lrg 11817918)
Rem      jstraub   04/29/2014 - Added changes to support downgrade from 12.2
Rem      jstraub   05/07/2014 - Changed APEX_040200 references to APEX_050000
Rem      cneumuel  05/12/2014 - Added create view for sys.wwv_flow_gv$session which was introduced in 4.2.2 and removed in 5.0
Rem      cneumuel  07/02/2014 - Renamed apexvalidate.sql to core/validate_apex.sql
Rem      jstraub   08/11/2014 - Fixed issue for downgrade when APEX was not upgraded
Rem      jstraub   05/06/2015 - Removed invoking validate_apex passing UFROM
Rem      jstraub   05/27/2015 - Moved storing apxset.sql to ORACLE_BASE_HOME (bug 21142498)
Rem      jstraub   06/12/2015 - Detect condition when PDB was upgraded and UFROM is orphaned or doesn't exist
Rem      jstraub   06/28/2015 - Fixed syntax error in execution of create_jobs
Rem      jstraub   08/06/2015 - Call switch_schemas from UFROM and clean up APPUN orphaned public synonyms (bug 21393970)
Rem      jstraub   08/13/2015 - Fixed issue with l_sql declaration
Rem      jstraub   09/29/2015 - Call wwv_flow_upgrade.drop_public_synonyms prior to switch_schemas (RTI 14465271)


column :b_home new_value OBH_HOME NOPRINT
variable b_home varchar2(255)

begin
-- get oracle_base_home
    sys.dbms_system.get_obh(:b_home);
end;
/

select :b_home from dual;

-- save session settings
store set &OBH_HOME/rdbms/log/apxset.sql replace

set define '^'
set concat on
set concat .

define APPUN = 'APEX_050000'


-- find the version upgraded from and the prior images directory

alter session set current_schema = ^APPUN;

column :foo_user new_val UFROM NOPRINT
variable foo_user varchar2(50)
column :image_dir new_val IMGDIR NOPRINT
variable image_dir varchar2(4000)


begin
    :foo_user := 'APEX_050000';
    for c1 in (select upgrade_action, upgrade_command
                 from wwv_flow_upgrade_progress
                where upgrade_id = 0 and upgrade_sequence = 0 ) loop
        :foo_user := c1.upgrade_action;
        :image_dir := c1.upgrade_command;
    end loop;
end;
/

select :foo_user from dual;

--Detect condition when PDB was upgraded and UFROM is orphaned or doesn't exist
declare
    orphaned_ufrom  exception;
    pragma exception_init(orphaned_ufrom,-65047);
    l_fnd           boolean := false;
begin
    for c1 in (select username
                 from sys.dba_users
                where username = '^UFROM' ) loop
        l_fnd := true;
        execute immediate 'declare l_id number; begin l_id := ^UFROM..wwv_flow.get_unique_id; end;';
    end loop;
    if not l_fnd then
        :foo_user := 'APEX_050000';
    end if;
exception when orphaned_ufrom then
    :foo_user := 'APEX_050000';
end;
/

select :foo_user from dual;
select :image_dir from dual;

begin
    if '^UFROM' != '^APPUN' then
        sys.dbms_registry.downgrading(comp_id => 'APEX', old_schema=> '^UFROM');
    end if;
end;
/

declare
    l_sql varchar2(4000);

    procedure ddl(p_sql in varchar2)
    is
    begin
        execute immediate p_sql;
    end ddl;

begin
    if '^UFROM' != '^APPUN' then
        --Remove jobs from ^APPUN
        wwv_flow_upgrade.remove_jobs;
        wwv_flow_upgrade.drop_public_synonyms(p_drop_all => true);

        l_sql := 'begin ^UFROM..wwv_flow_upgrade.switch_schemas(''^APPUN'',''^UFROM''); end;';
        ddl(l_sql);
    end if;
    --
    if '^UFROM' = 'APEX_040200' then
        ddl(q'~
            create or replace force view sys.wwv_flow_gv$session (
                inst_id,
                sid,
                serial#,
                username,
                is_active_1,
                client_info,
                client_identifier,
                action,
                last_call_et
            ) as select
                s.inst_id,
                s.indx,
                s.ksuseser,
                s.ksuudlna,
                bitand(s.ksuseidl,11),
                s.ksusecli,
                s.ksuseclid,
                s.ksuseact,
                s.ksusectm
            from sys.x$ksuse s~');
    end if;
end;
/

begin
    if '^UFROM' != '^APPUN' then
        execute immediate 'begin ^UFROM..wwv_flow_upgrade.create_jobs(''^UFROM''); end;';
    end if;
end;
/

alter session set current_schema = SYS;

declare
    l_version varchar2(255);
begin
    if '^UFROM' != '^APPUN' then
        execute immediate 'select ^UFROM..wwv_flows_release from sys.dual' into l_version;
        sys.dbms_registry.downgraded('APEX',l_version);
    end if;
end;
/

set define '&'

-- Restore session variables
@&OBH_HOME/rdbms/log/apxset.sql
