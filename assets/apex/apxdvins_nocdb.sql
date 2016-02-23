Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      apxdvins_nocdb.sql
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
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   07/11/2007 - Created
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   09/14/2007 - Added spool off and SQL prompt ending
Rem      jstraub   12/20/2007 - Added logic to exit if not connected as SYSDBA
Rem      jstraub   02/08/2008 - Added alter session set nls_length_semantics = byte
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jkallman  06/01/2009 - Added DB version check
Rem      jkallman  06/08/2009 - Removed DB version check
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jkallman  06/08/2012 - Change NLS_LENGTH_SEMANTICS = CHAR (Feature 770)
Rem      vuvarov   07/13/2012 - Use apxprereq.sql to check prerequisites
Rem      jstraub   07/24/2012 - Added invoking appins.sql
Rem      jstraub   08/14/2012 - Removed exit
Rem      jstraub   08/16/2012 - Made exit conditional
Rem      jkallman  08/16/2012 - Reverted NLS_LENGTH_SEMANTICS = CHAR modifications
Rem      jstraub   08/22/2012 - Aligned timing start/stops
Rem      jkallman  11/08/2012 - Avoid multiple bind variables in same block (Bug 12381658)
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      arayner   01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)
Rem      vuvarov   08/13/2013 - Adjust application owner and version (bug 17305899)
Rem      jstraub   11/24/2014 - Adapted from apxdvins.sql
Rem      jstraub   12/01/2015 - Moved wwv_flow_upgrade.[drop|create|grant]_public_synonyms from appins.sql (bug 22105151)
Rem      jstraub   12/02/2015 - Added invoking core_grants.sql (bug 22073489)


alter session set nls_length_semantics = byte;

set define '^'
set concat on
set concat .
set verify off
set termout off
spool off
set termout on

define DATTS        = 'x'
define FF_TBLS      = 'x'
define TEMPTBL      = 'x'

define APPUN        = 'APEX_050000'
define PREFIX       = '@'
define DB_VERSION   = '10'
define INSTALL_TYPE = 'ADD_DEV'
define ADM_PWD      = 'x'


column foo3 new_val LOG1
select 'installdev'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' foo3 from sys.dual;

define LOG2 = ^LOG1.english.log
define LOG3 = ^LOG1.english.bad
spool ^LOG1

prompt . ORACLE
prompt .
prompt . Application Express Installation (DEV).
prompt .........................................
prompt .

Rem  Check prerequisites. Installation will not continue if prerequisites are not met.
@@apxprereq.sql ^INSTALL_TYPE ^APPUN ^DATTS ^FF_TBLS ^TEMPTBL

@^PREFIX.core/core_grants.sql

define UPGRADE = '1'
column foo2 new_val UPGRADE

select '2' foo2 from sys.dba_users where (username in ('APEX_040200','APEX_040100','APEX_040000','APEX_030200','FLOWS_030100','FLOWS_030000','FLOWS_020200','FLOWS_020100','FLOWS_020000','FLOWS_010600','FLOWS_010500')) and rownum = 1;

column :img_prefix new_value IMGPR NOPRINT
variable img_prefix varchar2(30)
begin
    :img_prefix := ^APPUN..wwv_flow_global.g_image_prefix;
end;
/
select :img_prefix from sys.dual;

@@devins.sql ^LOG1 ^UPGRADE ^APPUN ^TEMPTBL ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX

begin
    wwv_flow_upgrade.drop_public_synonyms();
end;
/

begin
    wwv_flow_upgrade.create_public_synonyms('^APPUN');
end;
/

begin
    sys.dbms_utility.compile_schema( '^APPUN', false );
end;
/

begin
    wwv_flow_upgrade.grant_public_synonyms('^APPUN');
end;
/

@@appins.sql

prompt ...Adjust Application Express (APEX) owner and version
update wwv_flows
   set owner = '^APPUN',
       flow_version = case when id in (4550) then '&PRODUCT_NAME.'
                           else '&PRODUCT_NAME. ' || wwv_flows_release
                      end
 where id between 4000 and 4999;

commit;

spool off

column global_name new_value gname
set termout off
select user global_name from sys.dual;
set termout on
set heading on
set feedback on
set sqlprompt '^gname> '

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
