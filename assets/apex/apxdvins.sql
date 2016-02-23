Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      apxdvins.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @apxdvins
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   07/11/2007 - Created
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   09/14/2007 - Added spool off and SQL prompt ending
Rem      jstraub   12/20/2007 - Added logic to exit if not connected as SYSDBA
Rem      jstraub   02/08/2008 - Added alter session set nls_length_semantics = byte
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jkallman  06/01/2009 - Added DB version check
Rem      jkallman  06/08/2009 - Removed DB version check
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jkallman  06/08/2012 - Change NLS_LENGTH_SEMANTICS = CHAR (Feature 770)
Rem      vuvarov   07/13/2012 - Use apxprereq.sql to check prerequisites
Rem      jstraub   07/24/2012 - Added invoking appins.sql
Rem      jstraub   08/14/2012 - Removed exit
Rem      jstraub   08/16/2012 - Made exit conditional
Rem      jkallman  08/16/2012 - Reverted NLS_LENGTH_SEMANTICS = CHAR modifications
Rem      jstraub   08/22/2012 - Aligned timing start/stops
Rem      jkallman  11/08/2012 - Avoid multiple bind variables in same block (Bug 12381658)
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      arayner   01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)
Rem      vuvarov   08/13/2013 - Adjust application owner and version (bug 17305899)
Rem      jstraub   11/24/2014 - Changed to call either apxdvins_cdb.sql or apxdvins_nocdb.sql

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
        l_script_name := 'apxdvins_cdb.sql';
    elsif '^CDB' = 'YES' and '^META_LINK' = 'METADATA LINK' then
        l_script_name := 'apxdvins_cdb.sql';
    else
        l_script_name := 'apxdvins_nocdb.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;

@@^comp_file