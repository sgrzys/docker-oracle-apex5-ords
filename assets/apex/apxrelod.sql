Rem  Copyright (c) Oracle Corporation 1999 - 2011. All Rights Reserved.
Rem
Rem    NAME
Rem      apxrelod.sql
Rem
Rem    DESCRIPTION
Rem      This reload script should be used placed in the Oracle Home that is downgraded to
Rem      under a directory named apex.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   01/03/2008 - Created
Rem      jstraub   01/03/2008 - Updated owner to FLOWS_030100
Rem      jstraub   03/03/2008 - Adapted for downgrades to versions prior to 11.1.0.6
Rem      jstraub   03/18/2009 - Added grant to ctx_ddl for downgrade/upgrade reload
Rem      jstraub   03/20/2009 - Made grant dynamic so it could be run by multiple versions
Rem      jstraub   10/27/2009 - Moved storing of apxset.sql to $ORACLE_HOME/rdbms/log (Bug 7422107)
Rem      jkallman  05/23/2011 - Removed block which grants execute on ctx_ddl
Rem      jstraub   04/25/2012 - Added back block to grant execute on ctx_ddl (lrg 6945731)

WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
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

declare
    l_apex_schema varchar2(30);
begin
    l_apex_schema := dbms_registry.schema('APEX');
    if l_apex_schema in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020100','FLOWS_020200',
                         'FLOWS_030000','FLOWS_030100','APEX_030200','APEX_040000') then
        execute immediate 'grant execute on ctx_ddl to '||l_apex_schema||' with grant option';
    end if;
end;
/

EXECUTE validate_apex;

-- Restore session variables
@?/rdbms/log/apxset.sql
