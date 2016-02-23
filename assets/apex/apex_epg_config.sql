Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_epg_config.sql
Rem
Rem    DESCRIPTION
Rem      This script will load the Application Express images into XDB and then configure
Rem      a DAD for use by Application Express in the Embedded PL/SQL Gateway.
Rem
Rem    NOTES
Rem      This script should be run as SYS.
Rem
Rem    Arguments:
Rem      Position 1: The path to the directory where the Application Express software exists on
Rem                  the filesystem.
Rem
Rem    Example:
Rem      sqlplus "sys/syspass as sysdba" @apex_epg_config.sql /tmp
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     jstraub    09/09/2008 - Created to support OTN and DB distributions, moved logic to apex_epg_config_core.sql
Rem     jstraub    02/03/2014 - Added PREFIX
Rem     jstraub    11/24/2014 - Changed to call either apex_epg_config_cdb.sql or apex_epg_config_nocdb.sql
Rem     jstraub    12/05/2014 - Added dummy x parameter invoking comp_file to work around bug 20109294


set define '^'
set concat on
set concat .
set verify off

@@apxpreins.sql

COLUMN :script_name NEW_VALUE comp_file NOPRINT
VARIABLE script_name VARCHAR2(50)

declare
    l_script_name varchar2(100);
begin
    if '^CDB_ROOT' = 'YES' then
        l_script_name := 'apex_epg_config_cdb.sql';
    elsif '^CDB' = 'YES' and '^META_LINK' = 'METADATA LINK' then
        l_script_name := 'apex_epg_config_cdb.sql';
    else
        l_script_name := 'apex_epg_config_nocdb.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;

@@^comp_file ^1 x