Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      apxldimg.sql
Rem
Rem    DESCRIPTION
Rem      This script will load Application Express images into XDB.
Rem
Rem    NOTES
Rem      This script should be run as SYS.
Rem
Rem    Arguments:
Rem      Position 1: The path to the directory where the Application Express software exists on
Rem                  the filesystem.
Rem
Rem    Example:
Rem      sqlplus "sys/syspass as sysdba" @apxldimg.sql /tmp
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     jstraub    05/22/2007 - Created
Rem     jkallman   06/26/2007 - Always upload doc_map.xml encoded as AL32UTF8
Rem     jstraub    08/27/2007 - Altered for 11g
Rem     jstraub    11/21/2007 - Added setting anonymous ACL for /images directory resources for 11g
Rem     jstraub    04/07/2008 - Corrected comments in the description
Rem     jkallman   01/09/2009 - Load all JA online help files with .xml extension as AL32UTF8 (Bug 7700562)
Rem     jkallman   01/09/2009 - Delete incorrectly encoded files in JA online help (Bug 7700562)
Rem     jkallman   07/01/2009 - Change JA16SJIS charset reference to AL32UTF8 to account for Japanese online help encoding
Rem     jkallman   04/08/2010 - Use only under_path in publish_folder, and then directly set ACL on parent.  Work around to bug 9321922.
Rem     jkallman   04/12/2010 - Rewrite logic of removal of incorrectly encoded toc.xml
Rem     vuvarov    04/05/2013 - Prefixed objects with schema names; added support for empty files
Rem     vuvarov    04/15/2013 - Reference script arguments only once
Rem     jstraub    02/03/2014 - Invoke apxldimg_core.sql
Rem     jstraub    11/24/2014 - Changed to call either apxldimg_cdb.sql or apxldimg_nocdb.sql
Rem     jstraub    12/05/2014 - Added dummy x parameter invoking comp_file to work around bug 20109294
Rem     jstraub    06/15/2015 - Changed to invoke apex_epg_config_* scripts (bug 21155439)


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