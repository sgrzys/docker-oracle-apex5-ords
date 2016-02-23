Rem  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
Rem
Rem    NAME
Rem      apexins_cdb_upg.sql
Rem
Rem    DESCRIPTION
Rem      This script upgrades Application Express in a multitenant container database.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. Must be run locally to the database and the
Rem      ORACLE_HOME environment variable must be set.
Rem
Rem      DO NOT RUN THIS SCRIPT DIRECTLY. It is invoked by apexins.sql.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 12.1.0.1 or later
Rem
Rem    Arguments:
Rem     Position 1: Name of tablespace for Application Express application user
Rem     Position 2: Name of tablespace for Application Express files user
Rem     Position 3: Name of temporary tablespace or tablespace group
Rem     Position 4: Virtual directory for APEX images
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   09/05/2012 - Created
Rem      jstraub   11/24/2014 - Adapted from apexins_con.sql
Rem      jstraub   02/23/2015 - Modified to call coreins[235].sql directly (bug 20381781)
Rem      jstraub   02/25/2015 - Added calling coreins[67].sql and pass INSTALL_TYPE to coreins.sql and coreins5.sql (bug 20381781)
Rem      jstraub   03/11/2015 - Adapted for upgrade of CDB

set define '^'
set concat on
set concat .
set verify off
set termout off
spool off
set termout on

whenever sqlerror exit

column :xe_home new_value OH_HOME NOPRINT
variable xe_home varchar2(255)

set serverout on
begin
-- get oracle_home
    sys.dbms_system.get_env('ORACLE_HOME',:xe_home);
    if length(:xe_home) = 0 then
        sys.dbms_output.put_line(lpad('-',80,'-'));
        raise_application_error (
            -20001,
            'Oracle Home environment variable not set' );
    end if;
end;
/
whenever sqlerror continue

set termout off
select :xe_home from sys.dual;
set termout on

alter session set nls_length_semantics = byte;

define DATTS        = '^1'
define FF_TBLS      = '^2'
define TEMPTBL      = '^3'
define IMGPR        = '^4'

define APPUN        = 'APEX_050000'
define PREFIX       = '@'
define INSTALL_TYPE = 'MANUAL'


column foo3 new_val LOG1
select 'install'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' as foo3 from sys.dual;

define LOG2 = ^LOG1.english.log
define LOG3 = ^LOG1.english.bad
spool ^LOG1

prompt . ORACLE
prompt .
prompt . Application Express (APEX) Installation.
prompt ..........................................
prompt .

Rem  Check prerequisites. Installation will not continue if prerequisites are not met.
@@apxprereq.sql ^INSTALL_TYPE ^APPUN ^DATTS ^FF_TBLS ^TEMPTBL

set termout off
define UPGRADE = '1'
column foo2 new_val UPGRADE

select '2' as foo2 from sys.dba_users where (username in ('APEX_040200','APEX_040100','APEX_040000','APEX_030200','FLOWS_030100','FLOWS_030000','FLOWS_020200','FLOWS_020100','FLOWS_020000','FLOWS_010600','FLOWS_010500')) and rownum = 1;

column :rnd_pwd new_value ADM_PWD NOPRINT
variable rnd_pwd varchar2(60)

begin
    :rnd_pwd := sys.dbms_random.string('X',30);
end;
/

select :rnd_pwd from sys.dual;

define UFROM     = '^APPUN'
column foo_usr new_val UFROM

select username foo_usr from
(select username, 2 weight from sys.dba_users where username in ('APEX_040200','APEX_040100','APEX_040000','APEX_030200')
union
select username, 1 weight from sys.dba_users where username in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020100','FLOWS_020200','FLOWS_030000','FLOWS_030100')
order by 2 desc, 1 desc) x where rownum = 1;

set termout on

prompt Performing installation in multitenant container database in the background.
prompt The installation progress is spooled into apexins_cdb*.log files.
prompt
prompt Please wait...
prompt

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b coreins coreins.sql --p^LOG1 --p^UPGRADE --p^APPUN --p^TEMPTBL --p^IMGPR --p^DATTS --p^FF_TBLS --p^ADM_PWD --p^PREFIX --p^INSTALL_TYPE

--disable all constraints and triggers before copying metadata
host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b coreins6 coreins6.sql --p^CDB_ROOT --p^UPGRADE --p^APPUN --p^UFROM

--copy metadata
host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b coreins2 coreins2.sql --p^CDB_ROOT --p^UPGRADE --p^APPUN --p^UFROM

--enable most constraints
host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b coreins7 coreins7.sql --p^CDB_ROOT --p^UPGRADE --p^APPUN --p^UFROM

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b coreins3 coreins3.sql --p^CDB_ROOT --p^UPGRADE --p^APPUN --p^UFROM --p^INSTALL_TYPE --p^PREFIX --p^ADM_PWD

--enable remaining constraints
host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b coreins4 coreins4.sql --p^CDB_ROOT --p^UPGRADE --p^APPUN --p^UFROM

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b coreins5 coreins5.sql --p^CDB_ROOT --p^UPGRADE --p^APPUN --p^UFROM --p^PREFIX --p^INSTALL_TYPE

spool off

prompt
prompt Installation completed. Log files for each container can be found in:
prompt
prompt apexins_cdb*.log
prompt
prompt You can quickly scan for ORA errors or compilation errors by using a utility
prompt like grep:
prompt
prompt grep ORA- *.log
prompt grep PLS- *.log
prompt
