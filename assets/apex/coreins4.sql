Rem  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
Rem
Rem    NAME
Rem      coreins4.sql
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
Rem      jstraub   02/20/2015 - Split from coreins.sql
Rem      jstraub   02/25/2015 - Removed p_cdb_install parameter from call to enable_ws_constraints

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
--

set define '^'
begin
    if '^UPGRADE' = '2' Then
        sys.dbms_output.put_line('   -- Enabling ws constraints. -------');
        wwv_flow_upgrade.enable_ws_constraints(p_to => '^APPUN');
    end if;
end;
/
