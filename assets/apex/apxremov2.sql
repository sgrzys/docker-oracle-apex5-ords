Rem  Copyright (c) Oracle Corporation 1999 - 2006. All Rights Reserved.
Rem
Rem    NAME
Rem      apxremov2.sql
Rem
Rem    DESCRIPTION
Rem      Removes Application Express
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. You must exit the SQL*Plus session prior to running
Rem      apexins.sql
Rem
Rem    REQUIRENTS
Rem      Application Express
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   08/14/2006 - Created
Rem      jkallman  09/29/2006 - Adjusted APPUN to FLOWS_030000, add FLOWS_020200 to upgrade query
Rem      jstraub   02/14/2007 - Added call to wwv_flow_upgrade.drop_public_synonyms, and dropping APEX_PUBLIC_USER if not upgraded
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   08/29/2007 - Altered to completely remove Application Express per bug 6086891
Rem      jstraub   11/27/2007 - Added removing APEX_ADMINISTRATOR_ROLE if not an upgrade installation
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jstraub   01/29/2009 - Added removal of SYS owned objects specific to Application Express
Rem      jstraub   01/29/2009 - Moved XDB cleanup to block that only executes if not an upgrade from prior release
Rem      jstraub   01/30/2009 - Added dropping WWV_FLOW_KEY and WWV_FLOW_VAL_LIB
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      jkallman  03/18/2011 - Don't drop APEX DAD if it does not exist
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      hfarrell  07/19/2012 - Drop RESTful Services schemas APEX_LISTENER and APEX_REST_PUBLIC_USER if they exist
Rem      jstraub   08/23/2012 - Added prompt to exit the SQL*Plus session prior to running apexins.sql
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      cneumuel  12/19/2012 - Removed inconsistency with sqlplus substitution variables: wwv_flow_upgrade.flows_files_objects_remove was called with invalid syntax
Rem      jkallman  04/17/2013 - Added drop of WWV_FLOW_GV$SESSION
Rem      jstraub   06/13/2013 - Adapted for multitenant architecture
Rem      cneumuel  05/05/2014 - Removed WWV_FLOW_GV$SESSION
Rem      jstraub   11/24/2014 - Added setting "_oracle_script" to allow for dropping users when installed locally in a PDB
Rem      jstraub   08/06/2015 - Removed any remaining public synonyms from APPUN
Rem

set define '^'

define UPGRADE = '1'
define APPUN = 'APEX_050000'
define IMGPR = '/i/'

alter session set current_schema = SYS;

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
exception
    when invalid_alter_priv then
        null;
end;
/

-- Drop any remaining public synonyms from APPUN
declare
    l_sql varchar2(4000);
begin
    for c1 in (select synonym_name from sys.dba_synonyms where owner='PUBLIC' and table_owner='^APPUN') loop
        l_sql := 'drop public synonym '||sys.dbms_assert.simple_sql_name(c1.synonym_name);
        execute immediate l_sql;
    end loop;
end;
/

column foo2 new_val UPGRADE

select '2' foo2 from dba_users where username in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020100','FLOWS_020200','FLOWS_030000','FLOWS_030100','APEX_030200','APEX_040000','APEX_040100','APEX_040200');

-- Remove FLOWS SCHEMA
drop user ^APPUN cascade;

-- Remove FLOWS_FILES and APEX_PUBLIC_USER SCHEMA if no other versions exist

begin
    if '^UPGRADE' = '1' then
        execute immediate 'drop user FLOWS_FILES cascade';
        execute immediate 'drop user APEX_PUBLIC_USER cascade';
        execute immediate 'drop role APEX_ADMINISTRATOR_ROLE';
    end if;
end;
/

-- Remove APEX_LISTENER and APEX_REST_PUBLIC_USER RESTful Services schema
begin
    if '^UPGRADE' = '1' then
        execute immediate 'drop user APEX_LISTENER cascade';
    end if;
exception when others then
    null;
end;
/

begin
    if '^UPGRADE' = '1' then
        execute immediate 'drop user APEX_REST_PUBLIC_USER cascade';
    end if;
exception when others then
    null;
end;
/


-- XDB Cleanup
declare
    cfg XMLType;
    l_dad_list dbms_epg.varchar2_table;
begin

    if '^UPGRADE' = '1' then

        if dbms_xdb.existsresource('/i/') then
          dbms_xdb.deleteresource('/i/', dbms_xdb.delete_recursive_force);
        end if;

        if dbms_xdb.existsresource('/images/') then
          dbms_xdb.deleteresource('/images/',dbms_xdb.delete_recursive_force);
        end if;

        dbms_epg.get_dad_list( l_dad_list );
        for i in 1..l_dad_list.count loop
            if upper(l_dad_list(i)) = 'APEX' then
                dbms_epg.drop_dad('APEX');
            end if;
        end loop;

        cfg := dbms_xdb.cfg_get();

        if cfg.existsNode('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-mappings/servlet-mapping/servlet-name[text()="PublishedContentServlet"]') = 1 then
            cfg := cfg.deleteXML('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-mappings/servlet-mapping/servlet-name[text()="PublishedContentServlet"]/..');
        end if;

        if cfg.existsNode('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-list/servlet/servlet-name[text()="PublishedContentServlet"]') = 1 then
            cfg := cfg.deleteXML('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-list/servlet/servlet-name[text()="PublishedContentServlet"]/..');
        end if;

        dbms_xdb.cfg_update(cfg);
        commit;
        dbms_xdb.cfg_refresh;

    end if;

end;
/

-- Remove SYS owned objects

begin
    if '^UPGRADE' = '1' then
        execute immediate 'drop procedure validate_apex';
        execute immediate 'drop package WWV_FLOW_VAL';
        execute immediate 'drop package WWV_DBMS_SQL';
        execute immediate 'drop package WWV_FLOW_KEY';
        execute immediate 'drop library WWV_FLOW_VAL_LIB';
    end if;
end;
/

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=false';
exception
    when invalid_alter_priv then
        null;
end;
/

prompt ...Application Express Removed
prompt
prompt ********************************************************************
prompt ** You must exit this SQL*Plus session before running apexins.sql **
prompt ********************************************************************
