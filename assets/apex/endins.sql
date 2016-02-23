Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      endins.sql
Rem
Rem    DESCRIPTION
Rem      This is the end of installation script that prompts with structure of Application Express links
Rem      and performs component validation.
Rem
Rem    REQUIREMENTS
Rem      - Oracle database 10.2.0.3 or better
Rem      - PL/SQL Web Toolkit
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   07/10/2007 - Created
Rem      mhichwa   10/21/2008 - Added printing of time
Rem      vuvarov   08/13/2013 - Added APEX build number
Rem      jstraub   07/10/2014 - Do not call validate_apex in the event of a database upgrade
Rem      jstraub   02/17/2015 - Moved "Thank you for installing" prompts to end of coreins.sql


column flow_version new_val version
set termout off
select wwv_flows_release as flow_version from sys.dual where rownum = 1;
set termout on

begin
for c1 in (select value
             from sys.v_$parameter
            where name = 'job_queue_processes') loop
    sys.dbms_output.put_line('JOB_QUEUE_PROCESSES: '|| c1.value);
    exit;
end loop;
end;
/

alter session set current_schema = SYS;

prompt
prompt      Performing Application Express component validation - please wait...
prompt
timing start "Validate Installation"
declare
   l_time date;
begin
    select sysdate into l_time from sys.dual;
    sys.dbms_output.put_line('Completing registration process. '||to_char(l_time,'HH24:MI:SS'));
    if '^UPGRADE' = '1' then
       sys.dbms_registry.loaded('APEX','^version');
    elsif '^UPGRADE' = '2' then
        if sys.dbms_registry.status('APEX') = 'UPGRADING' then
            sys.dbms_registry.upgraded('APEX','^version');
        else --it has never been registered, so register it now
            sys.dbms_registry.loaded('APEX','^version');
        end if;
    end if;
    select sysdate into l_time from sys.dual;
    sys.dbms_output.put_line('Validating installation.  '||to_char(l_time,'HH24:MI:SS'));
    if '^INSTALL_TYPE' = 'INTERNAL' and '^UPGRADE' = '2' then
        null;
    else
        sys.validate_apex;
    end if;
end;
/
timing stop

alter session set current_schema = ^APPUN;
