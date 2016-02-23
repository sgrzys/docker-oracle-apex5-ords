Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      apexins_nocdb.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem
Rem
Rem      DO NOT RUN THIS SCRIPT DIRECTLY. It is invoked by apexins.sql.
Rem
Rem    Arguments:
Rem     Position 1: Name of tablespace for Application Express application user
Rem     Position 2: Name of tablespace for Application Express files user
Rem     Position 3: Name of temporary tablespace or tablespace group
Rem     Position 4: Virtual directory for APEX images
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @apexins SYSAUX SYSAUX TEMP /i/
Rem
Rem    2)With connect string
Rem      sqlplus "sys/syspass@10g as sysdba" @apexins SYSAUX SYSAUX TEMP /i/
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
Rem      jstraub   08/11/2006 - Changed calling coreins with new prefix parameter
Rem      jkallman  09/29/2006 - Adjusted APPUN to FLOWS_030000
Rem      jkallman  02/15/2007 - Remove XE check
Rem      jstraub   02/21/2007 - Removed 6th positional connect parameter
Rem      jstraub   04/10/2007 - Added INSTALL_TYPE parameter for use with dynamically setting WHENEVER SQLERROR exit in coreins
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   08/16/2007 - Removed password as positional parameter and made random
Rem      jstraub   09/14/2007 - Updated comments to reflect correct number of arguments and updated examples
Rem      jstraub   12/19/2007 - Added logic to exit if not connected as SYSDBA
Rem      jstraub   01/10/2008 - Added prerequisite checks for XDB and CONTEXT
Rem      jstraub   02/08/2008 - Added alter session set nls_length_semantics = byte
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      mhichwa   10/15/2008 - Changed comments, no functional changes
Rem      jstraub   02/18/2009 - Added version already installed to prerequisite checks
Rem      jstraub   03/24/2009 - Added spool off, removed from coreins.sql for catupgrd
Rem      jkallman  06/01/2009 - Added DB version check
Rem      jkallman  06/08/2009 - Removed DB version check
Rem      jstraub   07/14/2010 - Added DB version check
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      jkallman  05/23/2011 - Removed prerequisite check for Oracle Text
Rem      jstraub   12/05/2011 - Added checks for tablespace arguments
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jstraub   04/16/2012 - Changed temporary tablespace check to include tablespace groups (bug 13857152)
Rem      jkallman  06/08/2012 - Change NLS_LENGTH_SEMANTICS = CHAR (Feature 770)
Rem      vuvarov   06/26/2012 - Call apxprereq.sql to check installation prerequisites (bug 14211939)
Rem      jstraub   08/09/2012 - Changed length of rnd_pwd to 60, causing buffer to small in some instances
Rem      jstraub   08/14/2012 - Removed exit
Rem      jstraub   08/16/2012 - Made exit conditional
Rem      jkallman  08/16/2012 - Reverted NLS_LENGTH_SEMANTICS = CHAR modifications
Rem      jkallman  11/08/2012 - Avoid multiple bind variables in same block (Bug 12381658)
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      arayner   01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)
Rem      jstraub   02/20/2015 - Modified to call coreins[2345].sql (bug 20381781)
Rem      jstraub   02/25/2015 - Added passing INSTALL_TYPE to coreins.sql and coreins5.sql (bug 20381781)
Rem      jstraub   02/26/2016 - Pass NO as first position parameter to coreins[2345].sql


alter session set nls_length_semantics = byte;

set define '^'
set concat on
set concat .
set verify off
set termout off
spool off
set termout on

define DATTS        = '^1'
define FF_TBLS      = '^2'
define TEMPTBL      = '^3'
define IMGPR        = '^4'

define APPUN        = 'APEX_050000'
define PREFIX       = '@'
define DB_VERSION   = '10'
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

@@coreins.sql ^LOG1 ^UPGRADE ^APPUN ^TEMPTBL ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX ^INSTALL_TYPE
@@coreins2.sql NO ^UPGRADE ^APPUN ^UFROM
@@coreins3.sql NO ^UPGRADE ^APPUN ^UFROM ^INSTALL_TYPE ^PREFIX ^ADM_PWD
@@coreins4.sql NO ^UPGRADE ^APPUN ^UFROM
@@coreins5.sql NO ^UPGRADE ^APPUN ^UFROM ^PREFIX ^INSTALL_TYPE

spool off

COLUMN :script_name NEW_VALUE comp_file NOPRINT
VARIABLE script_name VARCHAR2(50)

declare
    l_script_name varchar2(100);
begin
    if wwv_flow_global.g_12c then
        l_script_name := 'core/null1.sql';
    else
        l_script_name := 'apxexit.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;

@@^comp_file

