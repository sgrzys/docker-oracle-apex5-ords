Rem  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
Rem
Rem    NAME
Rem      coreins7.sql
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
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/25/2015 - Split from coreins.sql

set define '^'
set concat on
set concat .
set verify off
set autocommit off

define CDB_ROOT  = '^1'
define UPGRADE   = '^2'
define APPUN     = '^3'
define UFROM     = '^4'

alter session set current_schema = ^APPUN;
alter package sys.wwv_dbms_sql compile body;
alter package wwv_flow_assert compile body;

begin
    if '^UPGRADE' = '2' then
        wwv_flow_upgrade.init('^UFROM');
        for t in 1..wwv_flow_upgrade.g_tabs.count loop
            wwv_flow_upgrade.enable_constraints(p_owner_name=>'^APPUN',p_object_name=>wwv_flow_upgrade.g_tabs(t));
        end loop;

        for t in 1..wwv_flow_upgrade.g_tabs.count loop
            wwv_flow_upgrade.enable_triggers(p_owner_to=>'^APPUN', p_table_name=>wwv_flow_upgrade.g_tabs(t));
        end loop;
    end if;
end;
/
