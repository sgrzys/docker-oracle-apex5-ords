Rem  Copyright (c) Oracle Corporation 2011 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_rest_config_cdb.sql
Rem
Rem    DESCRIPTION
Rem      This script creates the APEX_LISTENER and APEX_REST_PUBLIC_USER database users:
Rem        - The APEX_LISTENER user is used by Oracle REST Data Services to access the schema objects in the
Rem          APEX_XXXXXX schema containing resource templates and OAuth data. This user is NOT used for execution of
Rem          resource templates or APEX sessions.
Rem        - The APEX_REST_PUBLIC_USER user is used for the execution of resource templates or APEX sessions.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. You will be prompted to enter passwords for both users. Must be run locally to the
Rem      database and the ORACLE_HOME environment variable must be set.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 12.1.0.1 or later
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    jstraub     08/19/2013 - Created for CDB installations
Rem    hfarrell    03/03/2014 - Replaced reference to APEX Listener with Oracle REST Data Services in header information
Rem    jstraub     12/01/2014 - Adapted from apex_rest_config_con.sql
Rem    jstraub     04/10/2015 - Changed to have catcon.pl prompt for passwords (bug 20689402)


set define '^'
set concat on
set concat .
set verify off
set autocommit off

define APPUN = 'APEX_050000'
define LISTENERUN = 'APEX_LISTENER'
define RESTUN = 'APEX_REST_PUBLIC_USER'

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

prompt
prompt Performing installation in multitenant container database in the background.
prompt The installation progress is spooled into apex_rest_config_cdb*.log files.
prompt
prompt Please wait...
prompt

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b apex_rest_config_cdb apex_rest_config_core.sql --P'Enter a password for the ^LISTENERUN. user' --P'Enter a password for the ^RESTUN. user'

prompt
prompt Installation completed. Log files for each container can be found in:
prompt
prompt    apex_rest_config_cdb*.log
prompt
prompt You can quickly scan for ORA errors or compilation errors by using a utility
prompt like grep:
prompt
prompt grep ORA- *.log
prompt grep PLS- *.log
prompt
