Rem  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      catapx.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem
Rem    Arguments:
Rem     Position 1: Password for APEX Admin account, application DB user, and files DB user
Rem     Position 2: Name of tablespace for Application Express application user
Rem     Position 3: Name of tablespace for Application Express files user
Rem     Position 4: Name of temporary tablespace or tablespace group
Rem     Position 5: Virtual directory for APEX images
Rem     Position 6: The TNS connect string to the database, if local install, use none or NONE
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @catapx password SYSAUX SYSAUX TEMP /i/ none
Rem
Rem    2)With connect string
Rem      sqlplus "sys/syspass@10g as sysdba" @catapx password SYSAUX SYSAUX TEMP /i/ 10g
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  09/10/2004 - Created
Rem      jstraub   10/25/2004 - Changed the name of the log file to end in .log and include date/time
Rem      jkallman  01/04/2005 - Adjusted APPUN to FLOWS_020000
Rem      jduan     07/07/2005 - Modify for upgrade to 2.0
Rem      jkallman  09/14/2005 - Adjusted APPUN to FLOWS_020100
Rem      jkallman  09/22/2005 - Add substitution variable XE
Rem      jkallman  01/23/2006 - Adjusted APPUN to FLOWS_020200
Rem      jkallman  02/28/2006 - Copied from original htmldbins.sql
Rem      jstraub   06/27/2006 - Added exit logic if XE
Rem      jstraub   08/11/2006 - Adapted for 11g install
Rem      jstraub   08/25/2006 - Replaced xe_home with HOME
Rem      jkallman  09/29/2006 - Adjusted APPUN to FLOWS_030000
Rem      jstraub   04/10/2007 - Removed XE check to make consistent with apexins
Rem      jstraub   04/10/2007 - Added INSTALL_TYPE parameter for use with dynamically setting WHENEVER SQLERROR exit in coreins
Rem      jstraub   08/01/2007 - Generate random password
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   04/01/2008 - Adapted for 11.2 installation, added IMGUPG and compile wwv_flow_utilities body before apex_epg_config
Rem      jkallman  07/08/2008 - Adjusted APPUN to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jstraub   11/10/2008 - Changed reference from apex_epg_config to apex_epg_config_core (lrg 3573827)
Rem      jstraub   03/24/2009 - Added spool off, removed from coreins.sql for catupgrd
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      arayner   01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)
Rem      jstraub   02/03/2014 - Removed IMGUPG
Rem      jstraub   04/22/2015 - Removed configuring EPG, adapted for 12.2
Rem      jstraub   05/14/2015 - Added back setting define to ampersand


set define '^'
set concat on
set concat .
set verify off
set termout off
spool off
set termout on

define DATTS        = '^2'
define FF_TBLS      = '^3'
define TEMPTBL      = '^4'
define IMGPR        = '^5'
define CONN_STR     = '^6'

define APPUN        = 'APEX_050000'
define PREFIX       = '?/apex/'
define DB_VERSION   = '10'
define INSTALL_TYPE = 'INTERNAL'


column foo3 new_val LOG1
select 'install'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' foo3 from sys.dual;

define LOG2 = ^LOG1.english.log
define LOG3 = ^LOG1.english.bad
spool ^LOG1

prompt . ORACLE
prompt .
prompt . Application Express Installation.
prompt ...................................

column foo new_val LINK
select decode(upper('^CONN_STR'),'NONE',chr(32),'@'||'^CONN_STR') foo from sys.dual;

define UPGRADE = '1'
column foo2 new_val UPGRADE

select '2' foo2 from sys.dba_users where (username in ('APEX_040200','APEX_040100','APEX_040000','APEX_030200','FLOWS_030100','FLOWS_030000','FLOWS_020200','FLOWS_020100','FLOWS_020000','FLOWS_010600','FLOWS_010500')) and rownum = 1;

column :rnd_pwd new_value ADM_PWD NOPRINT
variable rnd_pwd varchar2(30)

begin
    :rnd_pwd := dbms_random.string('X',30);
end;
/

select :rnd_pwd from sys.dual;

@?/apex/coreins.sql ^LOG1 ^UPGRADE ^APPUN ^TEMPTBL ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX ^INSTALL_TYPE
@?/apex/coreins2.sql NO ^UPGRADE ^APPUN ^UFROM
@?/apex/coreins3.sql NO ^UPGRADE ^APPUN ^UFROM ^INSTALL_TYPE ^PREFIX ^ADM_PWD
@?/apex/coreins4.sql NO ^UPGRADE ^APPUN ^UFROM
@?/apex/coreins5.sql NO ^UPGRADE ^APPUN ^UFROM ^PREFIX ^INSTALL_TYPE

set define '&'

spool off
