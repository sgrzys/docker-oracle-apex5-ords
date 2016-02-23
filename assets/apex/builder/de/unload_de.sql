Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      unload_de.sql
Rem
Rem    DESCRIPTION
Rem      Deinstall German version of Application Express applications.  This script will be used to remove
Rem      the German version of Application Express applications from an existing Application Express instance.
Rem
Rem    NOTES
Rem      To be run from SQL*Plus as the Application Express owner or current_schema set to Application Express owner.
Rem 
Rem    REQUIREMENTS
Rem      Requires connection to the target database as the Application Express owner (APEX_XXXXXX) or
Rem      connection as SYS and issuing 'ALTER SESSION SET CURRENT_SCHEMA = APEX_XXXXXX'.
Rem
Rem    ARGUMENTS
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   09/01/2004 - Created
Rem      jkallman   09/23/2005 - Added XE and 4200
Rem      jkallman   09/29/2005 - Remove 4200
Rem      jkallman   01/15/2007 - Added 4400
Rem      jkallman   03/26/2010 - Added 4600, 4800 and 4900
Rem      jkallman   06/13/2011 - Added 4850
Rem      arayner    01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)
Rem      jkallman   01/27/2014 - Added 4750
Rem      jkallman   06/10/2014 - Removed 4600

prompt . ORACLE
prompt .
prompt . Application Express German Language Deinstall
prompt ..............................................................


set define '^'
set concat on
set concat .
set verify off
set termout on

declare
    l_applications dbms_sql.number_table;
    l_offset       number := 3;
begin
    l_applications(l_applications.count+1)  := 4000;
    l_applications(l_applications.count+1)  := 4050;
    l_applications(l_applications.count+1)  := 4155;
    l_applications(l_applications.count+1)  := 4300;
    l_applications(l_applications.count+1)  := 4350;
    l_applications(l_applications.count+1)  := 4400;
    l_applications(l_applications.count+1)  := 4411;
    l_applications(l_applications.count+1)  := 4500;
    l_applications(l_applications.count+1)  := 4550;
    l_applications(l_applications.count+1)  := 4700;
    l_applications(l_applications.count+1)  := 4750;        
    l_applications(l_applications.count+1)  := 4800;
    l_applications(l_applications.count+1)  := 4850;    
    l_applications(l_applications.count+1)  := 4900;    
    --
    wwv_flow_security.g_security_group_id := 10;
    for i in 1..l_applications.count loop
        wwv_flow_api.remove_flow( l_applications(i) + l_offset );
        commit;
    end loop;
    --
end;
/

