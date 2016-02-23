Rem  Copyright (c) Oracle Corporation 1999 - 2006. All Rights Reserved.
Rem
Rem    NAME
Rem      apxxemig.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIRENTS
Rem      - Oracle 11g
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   06/29/2006 - Created
Rem      jstraub   07/24/2006 - Removed moving /i/ to new directory and moved it to apex_epg_config.sql
Rem      jstraub   08/14/2006 - Adapted for 11g upgrade install
Rem      jstraub   02/07/2007 - Added exiting if APPUN schema is detected (bug 5852905)
Rem      jstraub   02/08/2007 - Removed WHENEVER SQLERROR statements and changed to determine proper script to run, or null1.sql
Rem      jstraub   02/19/2007 - Added store set apxset.sql to save SQL*Plus setting prior to running APEX scripts, and added check to ensure EDITION is XE
Rem      jstraub   04/10/2007 - Added replace at the end of store command to avoid SP2-0605 error
Rem      jstraub   04/10/2007 - Added INSTALL_TYPE parameter for use with dynamically setting WHENEVER SQLERROR exit in coreins
Rem      jstraub   05/14/2007 - Added grants in case the DB that is upgraded is 9.2 (bug 6051833)
Rem      jstraub   05/31/2007 - Copied from apxdbmig.sql for XE to 10.2.0.3 upgrade
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   01/15/2008 - Broke dependency on coreins2.sql and moved XE specific logic to apxxemig.sql
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jstraub   10/27/2009 - Moved storing of apxset.sql to $ORACLE_HOME/rdbms/log (Bug 7422107)
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jkallman  11/08/2012 - Avoid multiple bind variables in same block (Bug 12381658)
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      arayner   01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)


WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
-- If you are calling this script manually, and it is not called by the normal upgrade process,
-- you must comment the following line
EXECUTE dbms_registry.check_server_instance;
WHENEVER SQLERROR CONTINUE

column :xe_home new_value OH_HOME NOPRINT
variable xe_home varchar2(255)

begin
-- get oracle_home
    dbms_system.get_env('ORACLE_HOME',:xe_home);
end;
/

select :xe_home from dual;

-- save session settings
store set &OH_HOME/rdbms/log/apxset.sql replace

prompt . ORACLE
prompt .
prompt . Application Express Installation.
prompt ...................................

define UPGRADE = '2'

define INSTALL_TYPE = 'INTERNAL'

define APPUN = 'APEX_050000'
define IMGPR = '/i/'

COLUMN :script_name NEW_VALUE comp_file NOPRINT
VARIABLE script_name VARCHAR2(50)

--
-- non - XE
--
declare
    l_script_name varchar2(100);
begin
    -- intialize the script to do nothing
    l_script_name := '?/apex/core/null1.sql';
    -- Check if there is a prior version, non-XE
    for c1 in (select null
                 from dba_users
                where username in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020200','FLOWS_030000','FLOWS_030100') ) loop
        l_script_name := '?/apex/coreins.sql';
        exit;
    end loop;
    :script_name := l_script_name;
end;
/

--
-- XE
--
declare
    p_edition varchar2 (128);
begin
    execute immediate
      'select edition from registry$ WHERE cid=''CATPROC'''
    into p_edition;

    if p_edition = 'XE' then
    -- it is XE
        :script_name := '?/apex/coreins.sql';
    end if;
exception when others then null; -- it is not XE
end;
/

--
-- check if this version is already installed, if so set script back to null1.sql
--
begin
    for c1 in (select null
                 from dba_users
                where username = '&APPUN' ) loop
        :script_name := '?/apex/core/null1.sql';
        exit;
    end loop;
end;
/

set termout off
define UFROM     = 'FLOWS_010500'
column foo_usr new_val UFROM
select username foo_usr from
(select username, 2 weight from dba_users where username in ('APEX_040200','APEX_040100','APEX_040000','APEX_030200')
union
select username, 1 weight from dba_users where username in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020100','FLOWS_020200','FLOWS_030000','FLOWS_030100')
order by 2 desc, 1 desc) x where rownum = 1;

set termout on

column :xe_tbs new_value DATTS NOPRINT
column :xe_ff_tbs new_value FF_TBLS NOPRINT
column :xe_tmp_tbs new_value TEMPTBL NOPRINT
column :xe_pwd new_value ADM_PWD NOPRINT
column :xe_home new_value OH_HOME NOPRINT

variable xe_tbs varchar2(30)
variable xe_ff_tbs varchar2(30)
variable xe_tmp_tbs varchar2(30)
variable xe_pwd varchar2(30)
variable xe_home varchar2(255)

begin
    for c1 in (select default_tablespace dt, temporary_tablespace tt
                 from dba_users
                where username = '&UFROM' ) loop

        :xe_tbs := c1.dt;
        :xe_tmp_tbs := c1.tt;

    end loop;

    for c1 in (select default_tablespace dt
                 from dba_users
                where username = 'FLOWS_FILES' ) loop

        :xe_ff_tbs := c1.dt;

    end loop;

    :xe_pwd := dbms_random.string('X',30);

end;
/

select :xe_tbs from dual;
select :xe_tmp_tbs from dual;
select :xe_ff_tbs from dual;
select :xe_pwd from dual;

define PREFIX     = '?/apex/'

select :script_name from dual;

@&comp_file x &UPGRADE &APPUN &TEMPTBL &IMGPR &DATTS &FF_TBLS &ADM_PWD &PREFIX

alter package WWV_FLOW_UTILITIES compile body;

alter session set current_schema = SYS;

-- perform grants in case this is an upgrade from 9.2
begin
    -- Grant execute on SYS.dbms_crypto.  Silently fail if it does not exist
    execute immediate 'grant execute on SYS.dbms_crypto to ^APPUN';
exception
    when others then
        null;
end;
/

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

begin
-- get oracle_home
    dbms_system.get_env('ORACLE_HOME',:xe_home);
    if :script_name != '?/apex/core/null1.sql' then
        :script_name := '?/apex/apex_epg_config.sql';
    end if;
end;
/

select :xe_home from dual;
select :script_name from dual;

set define '&'

@&comp_file &OH_HOME

--XE specific login upgrade

set define '^'

alter session set current_schema = ^APPUN;

begin
    -- Add a column to wwv_flow_fnd_user for XE to EE upgrade
    execute immediate 'alter table WWV_FLOW_FND_USER add (LOGGED_IN_SINCE_UPGRADE VARCHAR2(1))';
end;
/

begin
    wwv_flow_security.g_security_group_id := 10;

    update wwv_flow_step_processing
       set required_patch = null,
           process_when_type = 'FUNCTION_BODY',
           process_when = 'return wwv_flow_utilities.db_version_is_at_least(''10.1'');'
     where flow_id between 4300 and 4309
       and trunc(flow_step_id) = 17
       and id between 184026726681659973 and 184026726681659973+1;

    update wwv_flow_step_processing
       set required_patch = null,
           process_when_type = 'FUNCTION_BODY',
           process_when = 'return not wwv_flow_utilities.db_version_is_at_least(''10.1'');'
     where flow_id between 4300 and 4309
       and trunc(flow_step_id) = 17
       and id between 7873510163151423 and 7873510163151423+1;

    commit;
end;
/

declare
   l_sgid number;
begin
   -- delete workspaces associated with restricted schema(s) but not have any applications
   for c1 in (select a.security_group_id
              from wwv_flow_company_schemas a,
                 (select a.schema "SCHEMA" from wwv_flow_restricted_schemas a,
                     wwv_flow_rschema_exceptions b where b.schema_id (+)= a.id) b
              where a.schema = b.schema
              and a.security_group_id not in (select security_group_id from wwv_flows) )
   loop
      l_sgid := c1.security_group_id;
      wwv_flow_provisioning.terminate_service_by_sgid(l_sgid);
      wwv_flow_provisioning.delete_provision_request(l_sgid);
   end loop;

   -- set workspace request status to APPROVED
   update wwv_flow_provision_company
      set project_status = 'APPROVED';

   wwv_flow_security.g_security_group_id := 10;

   update WWV_FLOW_FND_USER set LOGGED_IN_SINCE_UPGRADE = 'N'
    where WWV_FLOW_FND_USER.USER_NAME IN (
               select WWV_FLOW_COMPANIES.SHORT_NAME from WWV_FLOW_COMPANIES)
           and WWV_FLOW_FND_USER.USER_NAME IN (
               SELECT DBA_USERS.USERNAME FROM DBA_USERS)
           and WWV_FLOW_FND_USER.SECURITY_GROUP_ID IN (
               SELECT WWV_FLOW_COMPANIES.PROVISIONING_COMPANY_ID FROM WWV_FLOW_COMPANIES);

end;
/

@?/apex/core/wwv_flow_login_xe_upgrade.sql
@?/apex/core/wwv_flow_login_xe_upgrade.plb

alter session set current_schema = SYS;

-- Restore session variables
@?/rdbms/log/apxset.sql
