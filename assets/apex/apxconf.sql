Rem  Copyright (c) Oracle Corporation 1999 - 2006. All Rights Reserved.
Rem
Rem    NAME
Rem      apxconf.sql
Rem
Rem    DESCRIPTION
Rem      Used to perform the final configuration steps for Oracle Application Express,
Rem      including setting the XDB HTTP listener port and Application Express ADMIN password.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle 11g
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   11/02/2006 - Created
Rem      jstraub   01/19/2007 - Moved setting allow-repository-anonymous-access from apex_epg_config.sql
Rem      jstraub   02/22/2007 - Removed setting allow-repository-anonymous-access, no longer needed because of /i/ servlet
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   09/04/2007 - Added HIDE to PASSWD accept (Bug 6370075)
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      cneumuel  08/16/2012 - Use apxchpwd.sql to change the password (bug #13449050)
Rem

set define '&'

set verify off

column port new_val HTTPPORT

select decode(xdb.dbms_xdb.gethttpport,0,8080,xdb.dbms_xdb.gethttpport) port from dual;

prompt Enter values below for the XDB HTTP listener port and the password for the Application Express ADMIN user.
prompt Default values are in brackets [ ].
prompt Press Enter to accept the default value.
prompt
prompt

whenever sqlerror exit

-- change password (asks for password)
@@apxchpwd

accept HTTPPORT CHAR default &HTTPPORT prompt 'Enter a port for the XDB HTTP listener [&HTTPPORT] '

prompt ...changing HTTP Port

set serveroutput on
declare
    l_port  number;
begin
    l_port := to_number('&HTTPPORT');
    xdb.dbms_xdb.sethttpport(l_port);
    commit;
exception when others then
    sys.dbms_output.put_line('***********************************');
    sys.dbms_output.put_line('* Invalid port number...          *');
    sys.dbms_output.put_line('***********************************');
    raise;
end;
/
