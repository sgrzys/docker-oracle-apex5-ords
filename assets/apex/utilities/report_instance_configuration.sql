set define '^' verify off
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      report_instance_configuration.sql
--
--    DESCRIPTION
--      Report that displays APEX instance configuration
--
--      This report has to be run as a DBA
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/16/2014 - Created
--    cneumuel    11/06/2014 - Added instance administrators, SSO package version info, change date for instance params (feature #1153)
--    cneumuel    11/07/2014 - Added package version identifiers (feature #1153)
--    cneumuel    11/11/2014 - Added db charset and apex builder translation info (feature #1153)
--    vuvarov     11/11/2014 - Added Multitenant info
--    cneumuel    11/20/2014 - Added shared_servers, ,dispatchers job_queue_processes, aq_tm_processes,
--                           - server time zone, XDB ports and anonymous access
--    cneumuel    11/27/2014 - Added constraint statistics
--    cneumuel    12/09/2014 - Added date in report header. on 12c, print PDBs with APEX installed if it is not in CDB$ROOT
--    cneumuel    12/11/2014 - If in CDB$ROOT, exit when APEX is installed locally. If in PDB, exit when APEX is installed in CDB$ROOT.
--
--------------------------------------------------------------------------------

set serveroutput on size unlimited
set lines 140 pages 50
set feed off tab off

set termout off
col SYSDATE_ noprint new_value SYSDATE
select to_char(sysdate, 'yyyy-mm-dd hh24:mi') SYSDATE_
  from dual
/
set termout on

prompt ================================================================================
prompt
prompt Oracle Application Express Instance Configuration               ^SYSDATE.
prompt
prompt ================================================================================
prompt

prompt Database Information
prompt ====================
prompt
declare
    l_value   varchar2(4000);
    l_xdb_cfg sys.xmltype;
    l_xdb_httpconfig varchar2(80) := '/xdbconfig/sysconfig/protocolconfig/httpconfig';
    procedure p(p_name in varchar2, p_value in varchar2)
    is
    begin
        sys.dbms_output.put_line(rpad(p_name, 21)||p_value);
    end p;
    function xdbval(p_xpath in varchar2)
        return varchar2
    is
        l_extract sys.xmltype;
    begin
        l_extract := l_xdb_cfg.extract (
                         xpath => p_xpath );
        if l_extract is not null then
            return l_extract.getstringval;
        else
            return null;
        end if;
    end xdbval;
begin
    p('Parameter','Value');
    p(lpad('-',20,'-'),lpad('-',59,'-'));
    --
    -- general server parameters
    --
    p('Server Host',sys_context('userenv', 'server_host'));
    p('Database Name', sys_context('userenv', 'db_name'));
    p('Instance Name', sys_context('userenv', 'instance_name'));
    select banner
      into l_value
      from sys.v_$version
     where banner like 'Oracle Database%'
       and rownum = 1;
    p('Version', l_value);
    --
    -- database system parameters
    --
    for l_db in ( select name, value
                    from sys.v_$parameter
                   where name in ( 'enable_pluggable_database',
                                   'shared_servers',
                                   'dispatchers',
                                   'job_queue_processes',
                                   'aq_tm_processes' )
                   order by 1 ) 
    loop
        case l_db.name
        when 'enable_pluggable_database' then
            p('Multitenant', case l_db.value
                             when 'TRUE' then 'Enabled (connected to '||
                                              sys_context('USERENV', 'CON_NAME')||')'
                             when 'FALSE' then 'Disabled'
                             else 'Not supported'
                             end );
        when 'shared_servers' then
            p('Shared Servers', l_db.value);
        when 'dispatchers' then
            p('Dispatchers', l_db.value);
        when 'job_queue_processes' then
            p('Job Queue Processes', l_db.value);
        when 'aq_tm_processes' then
            p('AQ TM Processes', l_db.value);
        end case;
    end loop;
    select value
      into l_value
      from sys.nls_database_parameters
     where parameter = 'NLS_CHARACTERSET';
    --
    -- NLS parameters
    --
    p('DB Character Set', l_value);
    p('Server Time Zone', to_char(systimestamp, 'TZH:TZM'));
    --
    -- XDB/EPG parameters
    --
    l_xdb_cfg := xdb.dbms_xdb.cfg_get;
    p ( 'XDB HTTP Port',
        xdbval(l_xdb_httpconfig||'/http-port/text()'));
    p ( 'XDB HTTPS Port',
        xdbval(l_xdb_httpconfig||'/http2-port/text()'));
    p ( 'XDB Anonymous Access',
        nvl(xdbval(l_xdb_httpconfig||'/allow-repository-anonymous-access/text()'),
            'false') );
end;
/

prompt
prompt Registry Information
prompt ====================
col schema       for a21 head "Instance Schema"
col APEX_SCHEMA_ noprint new_value APEX_SCHEMA
col version      for a11 head "Version"
col status       for a8  head "Status"
select schema,
       schema APEX_SCHEMA_,
       version,
       status
  from sys.dba_registry
 where comp_id = 'APEX'
/
whenever sqlerror exit failure
declare
    l_in_pdb boolean := false;
begin
$if sys.dbms_db_version.version >= 12 $then
    if sys_context('USERENV','CON_NAME') = 'CDB$ROOT' then
        --
        -- if running in Root, APEX must not be installed in PDBs
        --
        for c1 in (select c.name,
                          r.version
                     from sys.cdb_registry  r,
                          sys.v_$containers c,
                          sys.cdb_objects   o
                    where c.con_id      =  r.con_id
                      and o.con_id      =  c.con_id
                      and o.owner       =  r.schema
                      and c.name        <> 'CDB$ROOT'
                      and r.comp_id     =  'APEX'
                      and o.object_type =  'TABLE'
                      and o.object_name =  'WWV_FLOWS'
                      and o.sharing     =  'NONE'
                    order by c.con_id )
        loop
            sys.dbms_output.put_line (
                'Application Express version '||c1.version||
                ' found in PDB '||c1.name );
            l_in_pdb := true;
        end loop;
        if l_in_pdb then
            raise_application_error (
                -20001,
                'Application Express is not installed in the Root container' );
        end if;
    else
        --
        -- if running in PDB, APEX must not be installed in Root
        --
        for c1 in (select sharing
                     from sys.dba_objects
                    where object_type =  'TABLE'
                      and owner       =  '^APEX_SCHEMA'
                      and object_name =  'WWV_FLOWS'
                      and sharing     <> 'NONE' )
        loop
            raise_application_error (
                -20001,
                'Application Express is installed in the Root container' );
        end loop;
    end if;
$end
    if nvl(length('^APEX_SCHEMA'),0) = 0 then
        raise_application_error (
            -20001,
            'Could not determine Application Express schema' );
    end if;
end;
/
whenever sqlerror continue
alter session set current_schema=^APEX_SCHEMA
/

prompt
prompt All Application Express Schemas
prompt ===============================

col username for a21 head "Schema"
col account_status for a16 head "Account Status"
col env_type for a27 head "Type"
col schema_info for a15 head "Info"
set define '&'
select u.username,
       u.account_status,
       case when u.username = 'FLOWS_FILES' then 'APEX File Repository'
            when u.username = 'APEX_REST_PUBLIC_USER' then 'REST Run User'
            when u.username = 'APEX_LISTENER' then 'REST Admin User'
            when u.username = 'ANONYMOUS' then 'APEX Run User (EPG)'
            when u.username = 'APEX_PUBLIC_USER' then 'APEX Run User (ORDS, OHS)'
            when u.username = 'HTMLDB_PUBLIC_USER' then 'APEX Run User (old)'
            when f.num_apps = 0 then 'APEX Instance (Runtime)'
            else 'APEX Instance (Development)'
       end env_type,
       case when u.username = '&APEX_SCHEMA' then 'Current - '||languages
            when u.username = 'HTMLDB_PUBLIC_USER' then 'Old (remove)'
            when regexp_like(u.username , '^(FLOWS|APEX)_[[:digit:]]+') then 'Old (remove)'
       end schema_info
  from sys.dba_users u,
       ( select max(level) num_apps,
                ltrim(max(sys_connect_by_path(flow_language,',')), ',') languages
           from &APEX_SCHEMA..wwv_flows f
          start with f.id = 4000
          connect by f.id = prior f.id+1 and f.id <= 4009 ) f
 where u.username in ('APEX_PUBLIC_USER','ANONYMOUS',
                      'APEX_REST_PUBLIC_USER','APEX_LISTENER',
                      'FLOWS_FILES',
                      'FLOWS_010500','FLOWS_010600',
                      'FLOWS_020000','FLOWS_020100','FLOWS_020200',
                      'FLOWS_030000','FLOWS_030100', 'FLOWS_030200')
    or regexp_like(u.username, '^APEX_[[:digit:]]{6}$')
 order by 3, 1
/
set define '^'

prompt
prompt Objects in ^APEX_SCHEMA
prompt ======================
col object_type for a30 head "Type"
col table_name for a30 head "Table"
col status for a10 head "Status"
col cnt for 99990 head "Count"
col last_ddl for a10 head "Last DDL"
select status,
       object_type,
       count(*) cnt,
       to_char(max(last_ddl_time),'yyyy-mm-dd') last_ddl
  from sys.dba_objects
 where owner = '^APEX_SCHEMA'
 group by status,
          object_type
 order by 1, 2
/
col object_name for a30 head "Invalid Object"
select object_name,
       object_type
  from sys.dba_objects
 where owner  = '^APEX_SCHEMA'
   and status = 'INVALID'
 order by 1,2
/
col trigger_name for a30 head "Disabled Trigger"
select trigger_name,
       table_name,
       status
  from sys.dba_triggers
 where owner = '^APEX_SCHEMA'
   and status <> 'ENABLED'
 order by 1,2
/
prompt
prompt Constraints in ^APEX_SCHEMA
prompt ==========================
col owner for a11 head "Owner"
col constraint_type for a4 head "Type"
col status for a10 head "Status"
col cnt for 99990 head "Count"
select owner,
       constraint_type,
       status,
       count(*) cnt
  from sys.dba_constraints
 where owner   in ( '^APEX_SCHEMA',
                    'FLOWS_FILES' )
 group by owner,
          constraint_type,
          status
 order by 1,2,3
/
col constraint_name for a30 head "Disabled Constraint"
select owner,
       constraint_name,
       table_name,
       status
  from sys.dba_constraints
 where owner in ( '^APEX_SCHEMA',
                  'FLOWS_FILES' )
   and status <> 'ENABLED'
 order by 1,2
/
prompt
prompt Constraints in other schemas referencing APEX
prompt =============================================
col owner for a30   head "Referencing Owner"
col constraint_name head "Referencing Constraint"
col r_owner for a11 head "APEX Schema"
col r_constraint_name for a30 head "APEX Constraint"
select owner,
       constraint_name,
       r_owner,
       r_constraint_name,
       status
  from sys.dba_constraints
 where r_owner in ( '^APEX_SCHEMA',
                    'FLOWS_FILES' )
   and owner not in ( '^APEX_SCHEMA',
                      'FLOWS_FILES' )
order by 1,2
/

prompt
prompt Versioned APIs
prompt ==============
prompt
declare
    l_ver varchar2(4000);
    l_idx pls_integer := 1;
begin
    for l_obj in ( select owner,
                          object_name
                     from sys.dba_procedures
                    where owner in ('^APEX_SCHEMA', 'SYS')
                      and object_name like 'WWV%'
                      and procedure_name = 'GET_VERSION_IDENTIFIER'
                    order by 1,2 )
    loop
        if l_idx = 1 then
            sys.dbms_output.put_line('Owner       Object Name                    Version Identifier');
            sys.dbms_output.put_line('----------- ------------------------------ -------------------------------------');
        end if;

        execute immediate 'begin :1 := '||sys.dbms_assert.enquote_name(l_obj.owner)||
                          '.'||sys.dbms_assert.enquote_name(l_obj.object_name)||
                          '.get_version_identifier; end;'
                    using out l_ver;
        if l_ver like '$Id:%' then
            --
            -- extract version number and date in
            -- Id: custom_auth_sso_902.plb 48385 2014-11-04 14:06:24Z devname
            --
            l_ver := regexp_substr (
                         srcstr => l_ver,
                         pattern => ' \d+ \d+-\d+-\d+ \d+:\d+:\d+' );
        else
            l_ver := null;
        end if;
        sys.dbms_output.put_line (
            rpad(l_obj.owner,12)||
            rpad(l_obj.object_name,31)||
            ltrim(l_ver) );
        l_idx := l_idx + 1;
    end loop;
end;
/

prompt
prompt Single Sign-On (OSSO)
prompt =====================
prompt
begin
    for i in ( select ( select user_id
                          from sys.dba_users
                         where username = '^APEX_SCHEMA' ) apex_user_id,
                      ( select count(*)
                          from sys.dba_objects
                         where owner = '^APEX_SCHEMA'
                           and object_name = 'WWV_FLOW_CUSTOM_AUTH_SSO' ) apex_osso_pkg,
                      ( select table_owner
                          from sys.dba_synonyms
                         where owner in ('PUBLIC', '^APEX_SCHEMA')
                           and synonym_name = 'WWSEC_ENABLER_CONFIG_INFO$' ) tbl_owner,
                      ( select table_owner
                          from sys.dba_synonyms
                         where owner in ('PUBLIC', '^APEX_SCHEMA')
                           and synonym_name = 'WWSEC_SSO_ENABLER_PRIVATE' ) pkg_owner
                 from sys.dual )
    loop
        if i.apex_osso_pkg = 2 then
            sys.dbms_output.put_line('- WWV_FLOW_CUSTOM_AUTH_SSO is installed');
        else
            sys.dbms_output.put_line('- WWV_FLOW_CUSTOM_AUTH_SSO is not installed');
        end if;
        if i.tbl_owner is not null then
            sys.dbms_output.put_line('- Synonym WWSEC_ENABLER_CONFIG_INFO$ exists for object in '||i.tbl_owner);
        else
            sys.dbms_output.put_line('- Synonym WWSEC_ENABLER_CONFIG_INFO$ does not exist');
        end if;
        if i.pkg_owner = i.tbl_owner then
            sys.dbms_output.put_line('- Synonym WWSEC_SSO_ENABLER_PRIVATE exists for object in '||i.tbl_owner);
        elsif i.pkg_owner is not null then
            sys.dbms_output.put_line('- Synonym WWSEC_SSO_ENABLER_PRIVATE exists for object in DIFFERENT SCHEMA '||i.tbl_owner);
        else
            sys.dbms_output.put_line('- Synonym WWSEC_SSO_ENABLER_PRIVATE does not exist');
        end if;

        for j in ( select ( select min(privilege)
                              from sys.dba_tab_privs
                             where owner      = i.tbl_owner
                               and table_name = 'WWSEC_ENABLER_CONFIG_INFO$'
                               and privilege  = 'SELECT'
                               and grantee in ('PUBLIC', '^APEX_SCHEMA') ) tbl_priv,
                          ( select min(privilege)
                              from sys.dba_tab_privs
                             where owner      = i.tbl_owner
                               and table_name = 'WWSEC_SSO_ENABLER_PRIVATE'
                               and privilege  = 'EXECUTE'
                               and grantee in ('PUBLIC', '^APEX_SCHEMA') ) pkg_priv
                     from sys.dual )
        loop
            if i.tbl_owner is not null and j.tbl_priv is not null then
                sys.dbms_output.put_line('- SELECT on WWSEC_ENABLER_CONFIG_INFO$ has been granted');
            else
                sys.dbms_output.put_line('- SELECT on WWSEC_ENABLER_CONFIG_INFO$ has NOT been granted');
            end if;
            if i.pkg_owner is not null and j.pkg_priv is not null then
                sys.dbms_output.put_line('- EXECUTE on WWSEC_SSO_ENABLER_PRIVATE has been granted');
            else
                sys.dbms_output.put_line('- EXECUTE on WWSEC_SSO_ENABLER_PRIVATE has NOT been granted');
            end if;
        end loop;
    end loop;
end;
/

prompt
prompt Network ACLs for ^APEX_SCHEMA
prompt ============================
col acl for a48 head "ACL"
col host for a20 head "Host"
col privilege for a10 head "Privilege"
select a.acl,
       a.host,
       p.privilege
  from sys.dba_network_acls a,
       sys.dba_network_acl_privileges p
 where a.acl       = p.acl
   and p.principal = '^APEX_SCHEMA'
 order by a.acl, a.host, p.privilege
/

prompt
prompt Authorized URLs
prompt ===============
col url for a40 head "URL"
col short_name for a39 head "Authorized for Workspace"
select u.url,
       w.short_name
  from wwv_flow_companies w,
       wwv_flow_authorized_urls u
 where w.provisioning_company_id = u.security_group_id
 order by 1,2
/

prompt
prompt Workspace Schema Restrictions And Exceptions
prompt ============================================

col schema for a30 head "Restricted Schema"
col workspace_name for a49 head "Exception for Workspace"
select a.schema,
       b.workspace_name
  from wwv_flow_restricted_schemas a,
       wwv_flow_rschema_exceptions b
 where b.schema_id (+)= a.id
 order by a.schema, b.workspace_name
/

prompt
prompt Instance Parameters
prompt ===================

col name for a39 head "Name"
col value for a40 head "Value"
col last_updated_on for a10 head "Updated On"
select name,
       case when name in ('SMTP_PASSWORD', 'WALLET_PWD') then '- redacted -'
            else value
       end value,
       to_char(last_updated_on, 'yyyy-mm-dd') last_updated_on
  from wwv_flow_platform_prefs
 order by name
/

prompt
prompt Instance Administrators
prompt =======================
col user_name     for a30 head "User Name"
col email_address for a40 head "Email Address"
col last_login    for a10 head "Last Login"
col is_locked     for a7  head "Locked?"
select user_name,
       email_address,
       to_char(last_login,'yyyy-mm-dd') last_login,
       case when account_locked='Y' then 'Yes' else 'No' end is_locked
  from wwv_flow_fnd_user
 where security_group_id = 10
 order by 1
/

prompt
prompt ================================================================================
prompt
