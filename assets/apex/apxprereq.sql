Rem  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      apxprereq.sql
Rem
Rem    DESCRIPTION
Rem      This script checks prerequisites for Application Express full development
Rem      environment installation and runtime only installation. It should not be
Rem      invoked directly.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem
Rem    Arguments:
Rem     Position 1: Installation type (MANUAL, RUNTIME, etc)
Rem     Position 2: Name of Application Express schema
Rem     Position 3: Name of tablespace for Application Express application user
Rem     Position 4: Name of tablespace for Application Express files user
Rem     Position 5: Name of temporary tablespace or tablespace group
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      vuvarov   06/26/2012 - Created
Rem      vuvarov   07/13/2012 - Exclude existing installation and tablespace checks for apxdvins.sql
Rem      jkallman  08/01/2012 - Set NLS_LENGTH_SEMANTICS = BYTE if 10.2XE
Rem      jkallman  08/16/2012 - Reverted NLS_LENGTH_SEMANTICS = BYTE modifications
Rem      jstraub   09/03/2013 - Changed version already installed check to use sys.dba_registry (bug 16205047)




set define '^'
set concat on
set concat .
set verify off
set termout off
set termout on

define INSTALL_TYPE = '^1'
define APPUN        = '^2'
define DATTS        = '^3'
define FFTS         = '^4'
define TEMPTS       = '^5'

whenever sqlerror exit
set serveroutput on


prompt ... Checking prerequisites (^INSTALL_TYPE)
prompt .

Rem  Check SYSDBA Privilege
begin
    for c1 in (
        select null
          from sys.dual
         where not exists (select null
                             from sys.session_privs
                            where privilege = 'SYSDBA')
    ) loop
        sys.dbms_output.put_line('Error: Application Express installation requires a connection with the SYSDBA privilege.');
        execute immediate 'bogus statement to force exit';
    end loop;
end;
/

Rem  Check for proper DB version
declare
    l_version number;
    l_edition varchar2(30) := 'notXE';
begin
    execute immediate
        'select to_number(replace(version, ''.'', null)) from sys.registry$ where cid = ''CATPROC'''
        into l_version;

    if l_version = 102010 then
        begin
            execute immediate
                'select edition from sys.registry$ WHERE cid = ''CATPROC'''
                into l_edition;
        exception
            when others then
                null;
        end;
    end if;

    if l_version < 102030 and l_edition != 'XE' then
        dbms_output.put_line('Error: Application Express installation requires database version 10.2.0.3 or later, or XE.');
        execute immediate 'bogus statement to force exit';
    end if;
end;
/

Rem  Check if this Application Express version is already installed (except when converting between Full Dev and Runtime)
declare
    c_install_type constant varchar2(30) := '^INSTALL_TYPE.';
begin
    if c_install_type not in ('ADD_DEV') then
        for c1 in (
            select null from sys.dba_registry where comp_id = 'APEX' and schema = upper('^APPUN')
        ) loop
            dbms_output.put_line('Error: This version of Application Express is already installed (^APPUN).');
            execute immediate 'bogus statement to force exit';
        end loop;
    end if;
end;
/

Rem  Check for PL/SQL Web Toolkit
declare
    l_xx varchar2(1000);
begin
    execute immediate
        'begin :a := sys.owa_util.get_version(); end;'
        using out l_xx;
exception
    when others then
        dbms_output.put_line('Error: Application Express installation requires the PL/SQL Web Toolkit.');
        raise;
end;
/

Rem  Check for XDB
begin
    for c1 in (
        select null
          from sys.dual
         where not exists (select null
                             from sys.dba_registry
                            where comp_id = 'XDB'
                              and status = 'VALID')
    ) loop
        dbms_output.put_line('Error: Application Express installation requires the Oracle XML Database database component.');
        execute immediate 'bogus statement to force exit';
    end loop;
end;
/

Rem  Check that tablespaces passed in exist (except when converting between Full Dev and Runtime)
declare
    c_install_type constant varchar2(30) := '^INSTALL_TYPE.';

    procedure check_tbs(
        p_tablespace  in varchar2,
        p_check_group in varchar2 default 'N')
    is
    begin
        for c1 in (
            select null
              from sys.dual
             where not exists (select null
                                 from sys.dba_tablespaces
                                where tablespace_name = upper(p_tablespace)
                                union all
                               select null
                                 from sys.dba_tablespace_groups
                                where group_name = upper(p_tablespace)
                                  and p_check_group = 'Y')
        ) loop
            dbms_output.put_line('Error: The tablespace ' || p_tablespace || ' does not exist.');
            execute immediate 'bogus statement to force exit';
        end loop;
    end check_tbs;
begin
    if c_install_type not in ('ADD_DEV') then
        check_tbs('^DATTS');
        check_tbs('^FFTS');
        check_tbs('^TEMPTS', 'Y');
    end if;
end;
/

prompt .
prompt ... Prerequisite checks passed.
prompt .

whenever sqlerror continue
