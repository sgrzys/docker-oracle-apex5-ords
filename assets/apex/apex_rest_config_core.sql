Rem  Copyright (c) Oracle Corporation 2011 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_rest_config_core.sql
Rem
Rem    DESCRIPTION
Rem      This script creates the APEX_LISTENER and APEX_REST_PUBLIC_USER database users:
Rem        - The APEX_LISTENER user is used by Oracle REST Data Services to access the schema objects in the
Rem          APEX_XXXXXX schema containing resource templates and OAuth data. This user is NOT used for execution of
Rem          resource templates or APEX sessions.
Rem        - The APEX_REST_PUBLIC_USER user is used for the execution of resource templates or APEX sessions.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIRMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    cdivilly   09/07/2011 - Created
Rem    hfarrell   09/13/2011 - Updated grants to apex_listener to be limited to select, insert, update and delete
Rem    hfarrell   09/14/2011 - Renamed file from apex_listener to restconf.sql
Rem    cneumuel   09/14/2011 - Added grant execute on wwv_flow_listener
Rem    hfarrell   09/14/2011 - Updated references to APPUN
Rem    pawolf     09/16/2011 - Updated table names and added new grants and synonyms
Rem    hfarrell   09/20/2011 - Updated to reset password for user APEX_REST_PUBLIC_USER
Rem    hfarrell   09/20/2011 - Added grant connect session to APEX_REST_PUBLIC_USER-required by Colm
Rem    hfarrell   09/22/2011 - Updated the creation statement for APEX_LISTENER user to unlock account and remove trailing
Rem                            semi colon after statement
Rem    hfarrell   09/26/2011 - Added synonyms on the three views: wwv_flow_rt$apex_account_privs, wwv_flow_rt$idm_privs
Rem                            and wwv_flow_rt$services
Rem    hfarrell   09/27/2011 - Added call to wwv_flow_listener.install_seed_data for inserting SQL Developer seed data
Rem    hfarrell   10/14/2011 - Added grants and new synonym on new table wwv_flow_rt$user_sessions
Rem    hfarrell   10/20/2011 - Added DROP statements for users APEX_LISTENER and APEX_REST_PUBLIC_USER
Rem    pawolf     02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem    hfarrell   03/06/2012 - Added grant on ^APPUN..vc4000array to apex_listener - as added for cloud in dbpod_restful_conf.sql
Rem                            and associated synonym (bug 13819620)
Rem    hfarrell   06/05/2012 - Added explicit commit after creating SQL Developer seed data
Rem    hfarrell   06/05/2012 - Added setting of preference RESTFUL_SERVICES_ENABLED to Yes
Rem    vuvarov    06/05/2012 - Removed SQL Developer seed data
Rem    hfarrell   06/11/2012 - Added creation of RESTful Services and OAuth2 Client Developer user groups - for the Cloud they are created with SQL Developer seed data
Rem    hfarrell   06/22/2012 - Reposition alter session statement to before creation of RESTful user groups
Rem    hfarrell   07/12/2012 - Removed setting of system preference RESTFUL_SERVICES_ENABLED, as now available in default APEX install
Rem    hfarrell   07/16/2012 - Added pool_config synonym and select to APEX_LISTENER
Rem    hfarrell   09/11/2012 - Added synonym and associated grant on wwv_flow_rt$pending_approvals
Rem    jkallman   12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem    hfarrell   03/13/2013 - Added call to wwv_flow_listener.install_prereq_data for inserting SQL Dev client registration and user groups (bug #16483083)
Rem    hfarrell   03/13/2013 - Removed group creation statements, as now handled in install_prereq_data (bug #16483083)
Rem    cneumuel   03/19/2013 - Added wwv_flow_lsnr_workspaces, wwv_flow_lsnr_applications, wwv_flow_lsnr_entry_points (bug #16513444)
Rem    cneumuel   04/26/2013 - ^APPUN..vc4000array renamed to ^APPUN..wwv_flow_t_varchar2, but synonym stays the same, for compatibility
Rem    hfarrell   05/31/2013 - Added synonym and associated grants for wwv_flow_rt$privilege_groups (bug #16889920)
Rem    vuvarov    01/09/2014 - Allow REST user to proxy into APEX_PUBLIC_USER; install friendly URL web service (feature #1267)
Rem    hfarrell   03/03/2014 - Replaced references to APEX Listener with Oracle REST Data Services in comments and header information
Rem    jstraub    12/11/2014 - Removed dropping LISTENERUN and RESTUN, ignore errors if create user throws -01920 (bug 20145977)
Rem    hfarrell   01/22/2016 - Added grant on wwv_flow_pool_config to ORDS_METADATA; including 'with grant option' to ensure ORDS_METADATA can select pool_config synonym (bug #22232069,22588461)

set define '^'
set concat on
set concat .
set verify off
set autocommit off

define APPUN = 'APEX_050000'
define LISTENERUN = 'APEX_LISTENER'
define RESTUN = 'APEX_REST_PUBLIC_USER'
define PASSWD1 = '^1'
define PASSWD2 = '^2'

-- Retrieve Tablespace and Temporary Tablespace for APEX_PUBLIC_USER
column tbs new_value TBLS noprint
column tmp_tbs new_value TEMPTBL noprint
set termout off
select default_tablespace as tbs, temporary_tablespace as tmp_tbs
  from sys.dba_users
 where username = 'APEX_PUBLIC_USER';
set termout on

prompt ...create ^LISTENERUN. user
-- Create Listener user - password assigned and account unlocked
declare
    user_already_exists exception;
    pragma exception_init(user_already_exists,-01920);
begin
    execute immediate 'create user ^LISTENERUN. identified by "^PASSWD1" account unlock default tablespace ^TBLS temporary tablespace ^TEMPTBL';
exception
    when user_already_exists then
        null;
end;
/

prompt ...create ^RESTUN. user
-- Create REST user
declare
    user_already_exists exception;
    pragma exception_init(user_already_exists,-01920);
begin
    execute immediate 'create user ^RESTUN. identified by "^PASSWD2" account unlock default tablespace ^TBLS temporary tablespace ^TEMPTBL';
exception
    when user_already_exists then
        null;
end;
/


-- Allow REST user to proxy into APEX_PUBLIC_USER for built-in RESTful Services
alter user APEX_PUBLIC_USER grant connect through ^RESTUN.;

-- Ability to connect and interact with the tables referenced below
grant create session to ^LISTENERUN.;

-- Ability to connect and interact with the tables referenced below
grant create session to ^RESTUN.;

-- Used to map a tenant/workspace to its security_group_id, alternatively need view/pl_sql api to determine this
grant select on ^APPUN..wwv_flow_companies to ^LISTENERUN.;
grant select on ^APPUN..wwv_flow_lsnr_workspaces to ^LISTENERUN.;
grant select on ^APPUN..wwv_flow_lsnr_applications to ^LISTENERUN.;
grant select on ^APPUN..wwv_flow_lsnr_entry_points to ^LISTENERUN.;

-- Ability for APEX_LISTENER and ORDS_METADATA to select from wwv_flow_pool_config
begin
    for i in ( select username
                 from sys.dba_users
                where username in ('ORDS_METADATA', 'APEX_LISTENER'))
    loop
        execute immediate 'grant select on ^APPUN..wwv_flow_pool_config to '||i.username||case when i.username='ORDS_METADATA' then ' with grant option' end;
    end loop;
end;
/

-- resource template tables, full r/w access needed
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$privileges to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$modules to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$templates to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$handlers to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$parameters to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$clients to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$client_privileges to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$approvals to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$approval_privs to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$pending_approvals to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$user_sessions to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$privilege_groups to ^LISTENERUN.;

-- resource template tables and view with just read access
grant select on ^APPUN..wwv_flow_rt$services to ^LISTENERUN.;
grant select on ^APPUN..wwv_flow_rt$idm_privs to ^LISTENERUN.;
grant select on ^APPUN..wwv_flow_rt$apex_account_privs to ^LISTENERUN.;

-- package with Oracle REST Data Services specific utility functions
grant execute on ^APPUN..wwv_flow_listener to ^LISTENERUN.;

-- Synonyms to avoid coupling Oracle REST Data Services queries to a particular APEX_XXXXXX schema version
alter session set current_schema = ^LISTENERUN.;

create or replace synonym wwv_flow_companies for ^APPUN..wwv_flow_companies;
create or replace synonym wwv_flow_rt$privileges for ^APPUN..wwv_flow_rt$privileges;
create or replace synonym wwv_flow_rt$modules for ^APPUN..wwv_flow_rt$modules;
create or replace synonym wwv_flow_rt$templates for ^APPUN..wwv_flow_rt$templates;
create or replace synonym wwv_flow_rt$handlers for ^APPUN..wwv_flow_rt$handlers;
create or replace synonym wwv_flow_rt$parameters for ^APPUN..wwv_flow_rt$parameters;
create or replace synonym wwv_flow_rt$clients for ^APPUN..wwv_flow_rt$clients;
create or replace synonym wwv_flow_rt$client_privileges for ^APPUN..wwv_flow_rt$client_privileges;
create or replace synonym wwv_flow_rt$approvals for ^APPUN..wwv_flow_rt$approvals;
create or replace synonym wwv_flow_rt$approval_privs for ^APPUN..wwv_flow_rt$approval_privs;
create or replace synonym wwv_flow_listener for ^APPUN..wwv_flow_listener;
create or replace synonym wwv_flow_rt$services for ^APPUN..wwv_flow_rt$services;
create or replace synonym wwv_flow_rt$idm_privs for ^APPUN..wwv_flow_rt$idm_privs;
create or replace synonym wwv_flow_rt$apex_account_privs for ^APPUN..wwv_flow_rt$apex_account_privs;
create or replace synonym wwv_flow_rt$user_sessions for ^APPUN..wwv_flow_rt$user_sessions;
create or replace synonym wwv_flow_rt$pending_approvals for ^APPUN..wwv_flow_rt$pending_approvals;
create or replace synonym wwv_flow_rt$privilege_groups for ^APPUN..wwv_flow_rt$privilege_groups;
create or replace synonym vc4000array for ^APPUN..wwv_flow_t_varchar2;
create or replace synonym pool_config for ^APPUN..wwv_flow_pool_config;
create or replace synonym wwv_flow_lsnr_workspaces for ^APPUN..wwv_flow_lsnr_workspaces;
create or replace synonym wwv_flow_lsnr_applications for ^APPUN..wwv_flow_lsnr_applications;
create or replace synonym wwv_flow_lsnr_entry_points for ^APPUN..wwv_flow_lsnr_entry_points;

-- Install seed data (groups, built-in modules)
alter session set current_schema = ^APPUN.;
declare
    c_rest_parameter constant varchar2(255) := 'APEX_REST_PATH_PREFIX';
    c_path_prefix    constant varchar2(255) := 'r';
    c_sgid           constant number := 10;
begin
    wwv_flow_security.g_security_group_id := c_sgid;

    wwv_flow_listener.install_prereq_data();

    if wwv_flow_platform.get_preference( c_rest_parameter ) is null then
        -- Set the path prefix for built-in RESTful Services and install modules
        wwv_flow_platform.set_preference( c_rest_parameter, c_path_prefix );

    else
        -- If the path prefix is already set (for example, after an upgrade), create the built-in RESTful
        -- Services using the existing prefix.
        wwv_flow_listener.install_friendly_url_service();
    end if;

    commit;
end;
/
