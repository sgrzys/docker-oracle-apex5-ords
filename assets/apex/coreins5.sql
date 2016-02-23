Rem  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
Rem
Rem    NAME
Rem      coreins5.sql
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
Rem      1 - CDB_ROOT  = CDB installation into root
Rem      2 - UPGRADE   = Upgrade flag (1 = NO, 2 = YES)
Rem      3 - APPUN     = APEX schema name
Rem      4 - UFROM     = The prior APEX schema in an upgrade installation
Rem      5 - PREFIX    = The path to the file
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/20/2015 - Split from coreins.sql
Rem      jstraub   02/25/2015 - Added INSTALL_TYPE as a passed parameter
Rem      cneumuel  03/04/2015 - Moved revoke of select any table up before endins (which calls validate_apex) because it made objects invalid

set define '^'
set concat on
set concat .
set verify off
set autocommit off

define CDB_ROOT  = '^1'
define UPGRADE   = '^2'
define APPUN     = '^3'
define UFROM     = '^4'
define PREFIX    = '^5'
define INSTALL_TYPE = '^6'

alter session set current_schema = ^APPUN;
--

prompt ...Adjust Application Express (APEX) owner and version
update wwv_flows
   set owner = '^APPUN',
       flow_version = case when id in (4550) then '&PRODUCT_NAME.'
                           else '&PRODUCT_NAME. ' || wwv_flows_release
                      end
 where id between 4000 and 4999;

commit;

timing stop

revoke select any table from ^APPUN;

@^PREFIX.endins.sql

timing stop

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=false';
exception
    when invalid_alter_priv then
        null;
end;
/

prompt
prompt
prompt
prompt      Thank you for installing Oracle Application Express ^version.
prompt
prompt      Oracle Application Express is installed in the ^APPUN schema.
prompt
prompt      The structure of the link to the Application Express administration services is as follows:
prompt      http://host:port/pls/apex/apex_admin (Oracle HTTP Server with mod_plsql)
prompt      http://host:port/apex/apex_admin     (Oracle XML DB HTTP listener with the embedded PL/SQL gateway)
prompt      http://host:port/apex/apex_admin     (Oracle REST Data Services)
prompt
prompt      The structure of the link to the Application Express development interface is as follows:
prompt      http://host:port/pls/apex (Oracle HTTP Server with mod_plsql)
prompt      http://host:port/apex     (Oracle XML DB HTTP listener with the embedded PL/SQL gateway)
prompt      http://host:port/apex     (Oracle REST Data Services)
prompt

column global_name new_value gname
set termout off
select user global_name from sys.dual;
set termout on
set heading on
set feedback on
set sqlprompt '^gname> '
