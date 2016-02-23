Rem  Copyright (c) Oracle Corporation 1999 - 2006. All Rights Reserved.
Rem
Rem    NAME
Rem      apxremov1.sql
Rem
Rem    DESCRIPTION
Rem      Removes Application Express
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. You must exit the SQL*Plus session prior to running
Rem      apexins.sql
Rem
Rem    REQUIRENTS
Rem      Application Express
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   08/14/2006 - Created
Rem      jkallman  09/29/2006 - Adjusted APPUN to FLOWS_030000, add FLOWS_020200 to upgrade query
Rem      jstraub   02/14/2007 - Added call to wwv_flow_upgrade.drop_public_synonyms, and dropping APEX_PUBLIC_USER if not upgraded
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   08/29/2007 - Altered to completely remove Application Express per bug 6086891
Rem      jstraub   11/27/2007 - Added removing APEX_ADMINISTRATOR_ROLE if not an upgrade installation
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jstraub   01/29/2009 - Added removal of SYS owned objects specific to Application Express
Rem      jstraub   01/29/2009 - Moved XDB cleanup to block that only executes if not an upgrade from prior release
Rem      jstraub   01/30/2009 - Added dropping WWV_FLOW_KEY and WWV_FLOW_VAL_LIB
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      jkallman  03/18/2011 - Don't drop APEX DAD if it does not exist
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      hfarrell  07/19/2012 - Drop RESTful Services schemas APEX_LISTENER and APEX_REST_PUBLIC_USER if they exist
Rem      jstraub   08/23/2012 - Added prompt to exit the SQL*Plus session prior to running apexins.sql
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      cneumuel  12/19/2012 - Removed inconsistency with sqlplus substitution variables: wwv_flow_upgrade.flows_files_objects_remove was called with invalid syntax
Rem      jkallman  04/17/2013 - Added drop of WWV_FLOW_GV$SESSION
Rem      jstraub   06/13/2013 - Adapted for multitenant architecture
Rem      jstraub   07/31/2015 - Added p_drop_all => TRUE in call to drop_public_synonyms (bug 21531843)
Rem

set define '^'
prompt ...Removing Application Express

define UPGRADE = '1'
define APPUN = 'APEX_050000'
define IMGPR = '/i/'

alter session set current_schema = ^APPUN;

begin
    wwv_flow_upgrade.drop_public_synonyms(p_drop_all => TRUE);
end;
/

column foo2 new_val UPGRADE

select '2' foo2 from dba_users where username in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020100','FLOWS_020200','FLOWS_030000','FLOWS_030100','APEX_030200','APEX_040000','APEX_040100','APEX_040200');

begin
    if '^UPGRADE' = '1' then
        wwv_flow_upgrade.flows_files_objects_remove('^APPUN');
    end if;
end;
/

alter session set current_schema = SYS;

set serveroutput on
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin
    if dbms_registry.status('APEX') is null then
        dbms_output.put_line(chr(13)||chr(10));
        dbms_output.put_line('Error:');
        dbms_output.put_line('You can only use this script to remove Application Express');
        dbms_output.put_line(chr(13)||chr(10)||chr(13)||chr(10));
        execute immediate('invalid sql stmnt to force exit');
    end if;
end;
/
WHENEVER SQLERROR CONTINUE
