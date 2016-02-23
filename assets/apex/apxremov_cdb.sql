Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      apxremov_cdb.sql
Rem
Rem    DESCRIPTION
Rem      Removes Application Express in a multitenant container database.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. Must be run locally to the database and the
Rem      ORACLE_HOME environment variable must be set.
Rem      You must exit the SQL*Plus session prior to running apexins_con.sql
Rem
Rem    REQUIRENTS
Rem      - Oracle Database 12.1.0.1 or later
Rem
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   09/05/2012 - Created
Rem      jstraub   06/17/2013 - Updated to call scripts separately that drop object and then drop schemas
Rem      jstraub   06/30/2014 - Changed references from installation to de-installation
Rem      jstraub   11/21/2014 - Adapted from apxremov_con.sql

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

prompt Performing de-installation in multitenant container database in the background.
prompt The de-installation progress is spooled into apxremov*_cdb*.log files.
prompt
prompt Please wait...
prompt

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b apxremov1_cdb apxremov1.sql
host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b apxremov2_cdb apxremov2.sql

prompt
prompt De-installation completed. Log files for each container can be found in:
prompt
prompt apxremov*_cdb*.log
prompt
prompt You can quickly scan for ORA errors or compilation errors by using a utility
prompt like grep:
prompt
prompt grep ORA- *.log
prompt grep PLS- *.log
prompt
