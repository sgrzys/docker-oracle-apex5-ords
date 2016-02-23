Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_epg_config_cdb.sql
Rem
Rem    DESCRIPTION
Rem      This script will load the Application Express images into XDB and then configure
Rem      a DAD for use by Application Express in the Embedded PL/SQL Gateway in a multitenant
Rem      container database.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. Must be run locally to the database and the
Rem      ORACLE_HOME environment variable must be set.
Rem
Rem    Arguments:
Rem      Position 1: The path to the directory where the Application Express software exists on
Rem                  the filesystem.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 12.1.0.1 or later
Rem
Rem    Example:
Rem      sqlplus "sys/syspass as sysdba" @apex_epg_config_con.sql /u02/product/oracle/db_home1
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     jstraub    09/05/2012 - Created
Rem     vuvarov    04/05/2013 - Prefixed objects with schema names
Rem     jstraub    11/24/2014 - Adapted from apex_epg_config_con.sql

whenever sqlerror exit

column :xe_home new_value OH_HOME NOPRINT
variable xe_home varchar2(255)

set serverout on
begin
    -- Get ORACLE_HOME
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

prompt Performing installation in multitenant container database in the background.
prompt The installation progress is spooled into apex_epg_config_cdb*.log files.
prompt
prompt Please wait...
prompt

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b apex_epg_config_cdb apex_epg_config_nocdb.sql --p^1

prompt
prompt Installation completed. Log files for each container can be found in:
prompt
prompt apex_epg_config_cdb*.log
prompt
prompt You can quickly scan for ORA errors or compilation errors by using a utility
prompt like grep:
prompt
prompt grep ORA- *.log
prompt grep PLS- *.log
prompt
