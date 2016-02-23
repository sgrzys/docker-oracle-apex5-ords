Rem  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
Rem
Rem    NAME
Rem      apxdbmig.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIRENTS
Rem      - Oracle Database 12c
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
Rem      jstraub   06/19/2007 - Set allow-repository-anonymous-access back to false for XE upgrade (Bug 6140708)
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   02/26/2008 - Removed reference to coreins2.sql, added check for FLOWS_020100 to normal prior version check
Rem      jstraub   03/03/2008 - Adapted for 11.2 upgrade/downgrade
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jstraub   09/09/2008 - Changed reference from apex_epg_config.sql to apex_epg_config_core.sql
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jstraub   12/04/2008 - Added alter view statements for bug 7284151
Rem      jstraub   01/30/2009 - Added check for newer version
Rem      jstraub   02/03/2009 - Fixed typo in new version check
Rem      jstraub   10/27/2009 - Moved storing of apxset.sql to $ORACLE_HOME/rdbms/log (Bug 7422107)
Rem      jstraub   10/15/2010 - Moved inserting into wwv_flow_upgrade_progress and recompiling to conditional block (bug 10203473)
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      jstraub   10/27/2011 - Changed newer version check for 4.1
Rem      jstraub   11/28/2011 - Reverted changes prior to removing support for downgrade
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jstraub   03/12/2012 - Added whenever sqlerror continue prior to invoking apex_epg_config_core
Rem      jstraub   04/16/2012 - Added granting inherit privileges when APEX version already at or above version in this database release (bug 13790852)
Rem      jstraub   07/31/2012 - Drop &APPUN and re-run APEX upgrade if database is upgraded again and APEX not VALID (bug 14133579)
Rem      jkallman  11/08/2012 - Avoid multiple bind variables in same block (Bug 12381658)
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      arayner   01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)
Rem      jstraub   02/03/2014 - Remove IMGUPG
Rem      jstraub   05/09/2014 - Remove invoking apex_epg_config_core (Bug 17767646)
Rem      jstraub   07/24/2014 - Fixed logic on when to drop &APPUN if re-upgrading
Rem      jstraub   07/30/2014 - Updated newer version check for 5.0
Rem      jstraub   04/22/2015 - Adapted for 12.2
Rem      jstraub   04/24/2015 - Removed compiling wwv_flow_months_month*, objects no longer exist
Rem      jstraub   05/27/2015 - Moved storing apxset.sql to ORACLE_BASE_HOME (bug 21142498)
Rem      jstraub   06/12/2015 - Drop orphaned UFROM in event of plugged in PDB and upgrade (bug 21103867)
Rem      jstraub   07/24/2015 - Drop orphaned PUBLIC synonyms (LRG 17440248)
Rem      jstraub   08/06/2015 - Moved dropping orphaned public synonyms of UFROM
Rem

WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
EXECUTE dbms_registry.check_server_instance;
WHENEVER SQLERROR CONTINUE

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
                where username in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020100','FLOWS_020200','FLOWS_030000','FLOWS_030100','APEX_030200','APEX_040000','APEX_040100','APEX_040200') ) loop
        l_script_name := '?/apex/coreins.sql';
        exit;
    end loop;
    :script_name := l_script_name;
end;
/


--
-- check if this version is already installed, if so set script back to null1.sql
--
declare
  already_revoked exception;
  pragma exception_init(already_revoked,-01927);

  procedure revoke_inherit_privilege(user in varchar2) as
  begin
    execute immediate 'revoke inherit privileges on user '||user||' from PUBLIC';
  exception
    when already_revoked then
      null;
  end;
begin
    for c1 in (select null
                 from dba_users
                where username = '&APPUN' ) loop
        if nvl(dbms_registry.status('APEX'),'x') not in ('VALID','UPGRADED') and
           nvl(dbms_registry.get_progress_value('APEX','APEX_UPGRADE'),'x') = '&APPUN' then
            --the initial upgrade of APEX failed, and the database upgrade is being re-run
            execute immediate 'drop user &APPUN cascade';
        else
            :script_name := '?/apex/core/null1.sql';
            revoke_inherit_privilege('&APPUN');
            revoke_inherit_privilege('APEX_PUBLIC_USER');
            revoke_inherit_privilege('FLOWS_FILES');
            execute immediate 'grant inherit any privileges to &APPUN';
        end if;
        exit;
    end loop;
end;
/

--
-- check if newer version is already installed, if so set script back to null1.sql
--
declare
  already_revoked exception;
  pragma exception_init(already_revoked,-01927);
  l_script_name varchar2(100);

  procedure revoke_inherit_privilege(user in varchar2) as
  begin
    execute immediate 'revoke inherit privileges on user '||user||' from PUBLIC';
  exception
    when already_revoked then
      null;
  end;

begin
    begin
        for c1 in (select to_number(replace(nvl(dbms_registry.version('APEX'),0),'.',null)) v from dual) loop
            if c1.v > 5000001 then
                l_script_name := '?/apex/core/null1.sql';
                revoke_inherit_privilege('&APPUN');
                revoke_inherit_privilege('APEX_PUBLIC_USER');
                revoke_inherit_privilege('FLOWS_FILES');
                execute immediate 'grant inherit any privileges to &APPUN';
            end if;
            exit;
        end loop;
    exception when others then
        l_script_name := '?/apex/core/null1.sql';
    end;
    if l_script_name is not null then
        :script_name := l_script_name;
    end if;
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

variable xe_tbs varchar2(30)
variable xe_ff_tbs varchar2(30)
variable xe_tmp_tbs varchar2(30)
variable xe_pwd varchar2(30)

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

begin
    if :script_name != '?/apex/core/null1.sql' and nvl(sys.dbms_registry.version('APEX'),'x') != 'x' then -- update registry progress
        dbms_registry.set_progress_value('APEX','APEX_UPGRADE','&APPUN');
    end if;
end;
/

@&comp_file x &UPGRADE &APPUN &TEMPTBL &IMGPR &DATTS &FF_TBLS &ADM_PWD &PREFIX &INSTALL_TYPE

set define '&'

begin
    if :script_name != '?/apex/core/null1.sql' then
        :script_name := '?/apex/coreins2.sql';
    end if;
end;
/

select :script_name from dual;

@&comp_file NO &UPGRADE &APPUN &UFROM

set define '&'

begin
    if :script_name != '?/apex/core/null1.sql' then
        :script_name := '?/apex/coreins3.sql';
    end if;
end;
/

select :script_name from dual;

@&comp_file NO &UPGRADE &APPUN &UFROM &INSTALL_TYPE &PREFIX &ADM_PWD

set define '&'

begin
    if :script_name != '?/apex/core/null1.sql' then
        :script_name := '?/apex/coreins4.sql';
    end if;
end;
/

select :script_name from dual;

@&comp_file NO &UPGRADE &APPUN &UFROM

set define '&'

begin
    if :script_name != '?/apex/core/null1.sql' then
        :script_name := '?/apex/coreins5.sql';
    end if;
end;
/

select :script_name from dual;

@&comp_file NO &UPGRADE &APPUN &UFROM &PREFIX &INSTALL_TYPE

whenever sqlerror continue

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

set define '&'

begin
    if :script_name != '?/apex/core/null1.sql' then
        execute immediate 'alter session set current_schema = &APPUN';
        execute immediate 'insert into wwv_flow_upgrade_progress values (0,sysdate,0,''&UFROM'',null,''/images'')';
        execute immediate 'alter package wwv_flow_utilities compile body';

        --Clean up any remaining public synonyms owned by &UFROM
        declare
            l_sql varchar2(4000);
        begin
            for c1 in (select synonym_name from sys.dba_synonyms where owner='PUBLIC' and table_owner='&UFROM') loop
                l_sql := 'drop public synonym '||sys.dbms_assert.simple_sql_name(c1.synonym_name);
                execute immediate l_sql;
            end loop;
        end;

        --Detect if this was a PDB that was upgraded, and &UFROM is orphaned
        declare
            orphaned_ufrom exception;
            pragma exception_init(orphaned_ufrom,-65047);
        begin
            execute immediate 'declare l_id number; begin l_id := &UFROM..wwv_flow.get_unique_id; end;';
        exception when orphaned_ufrom then
            --Need to drop the orphaned APEX schema in the PDB
            execute immediate 'drop user &UFROM cascade';
        end;
    end if;
end;
/

alter session set current_schema = SYS;

-- Restore session variables
@&OBH_HOME/rdbms/log/apxset.sql
