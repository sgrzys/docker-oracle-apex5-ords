Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      reset_image_prefix_con.sql
Rem
Rem    DESCRIPTION
Rem      Reset the image prefix used in an Application Express installation in a multitenant
Rem      container database.
Rem
Rem    NOTES
Rem      - This utility should be run via SQL*Plus and connected as SYS to a 12c CDB.
Rem      - This utility will also recompile the entire Application Express schema
Rem
Rem      - This utility should not be run on an active Application Express instance.
Rem        If need be, the database should be started in RESTRICT mode. It may also
Rem        require a restart after running this script.
Rem
Rem    Arguments:
Rem      None - The user will be prompted for the updated image prefix
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   02/27/2007 - Created
Rem      jkallman   12/04/2007 - Updated with FLOWS_030100
Rem      jkallman   04/14/2008 - Add call to wwv_flow_page_cache_api.purge_all (Bug 6963877)
Rem      jkallman   07/08/2008 - Updated with FLOWS_040000
Rem      jkallman   10/02/2008 - Changed FLOWS_040000 references to APEX_040000
Rem      jkallman   11/22/2010 - Changed APEX_040000 references to APEX_040100
Rem      pawolf     10/19/2012 - Changed APEX_040100 references to APEX_040200 (bug 14785456)
Rem      pawolf     12/12/2012 - Removed updating of image prefix for internal apps (bug #15969515)
Rem      jstraub    08/26/2013 - Created for CDB installations


set define '&'
set concat on
set concat .
set verify off
set termout on

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

accept IMGPRE CHAR default '/i/' prompt 'Enter the Application Express image prefix [/i/] '

prompt
prompt Performing installation in multitenant container database in the background.
prompt The installation progress is spooled into reset_image_prefix_con*.log files.
prompt
prompt Please wait...
prompt

host &OH_HOME/perl/bin/perl -I &OH_HOME/rdbms/admin &OH_HOME/rdbms/admin/catcon.pl -b reset_image_prefix_con reset_image_prefix_core.sql --p&IMGPRE

prompt
prompt Installation completed. Log files for each container can be found in:
prompt
prompt reset_image_prefix_con*.log
prompt
prompt You can quickly scan for ORA errors or compilation errors by using a utility
prompt like grep:
prompt
prompt grep ORA- *.log
prompt grep PLS- *.log
prompt
