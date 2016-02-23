Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      runtime_grant_revoke.sql
Rem
Rem    DESCRIPTION
Rem      Removes unnecessary DBA system privileges for a runtime Oracle Application Express environment.
Rem
Rem
Rem    REQUIREMENTS
Rem      - Oracle database 10.2.0.3 or better
Rem      - PL/SQL Web Toolkit
Rem
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   11/26/2007 - Created
Rem      sspadafo  07/30/2008 - Added conditional block for revoke of alter user privilege
Rem      sspadafo  09/09/2008 - Fixed syntax error in execute immediate for 'revoke alter user ...'
Rem      jkallman  03/30/2010 - Removed conditional logic around revoke of alter user
Rem      jkallman  05/24/2011 - Removed revoke of create any context (no longer granted)
Rem      cneumuel  11/08/2011 - Formatted and sorted privileges
Rem      cneumuel  11/08/2011 - Revoked dbms_metadata, ku$_ddl, ku$_ddls, flashback on dual (bug #13354894)
Rem      hfarrell  02/08/2012 - Fix for bug 13695325 - wrapped an exception around revoke statements
Rem      cneumuel  02/08/2012 - Added revoke statements from apxdevrm.sql, execute revoke only if privilege is granted (bug #13695448)
Rem      jkallman  03/29/2012 - Added revoke of dba_rsrc_consumer_groups (Feature #757)
Rem      jkallman  04/17/2012 - Added and removed a number of grants, extending database monitor to use GV$ views (Feature #906)
Rem      vuvarov   03/01/2013 - Removed dba_tab_comments revoke statement (bug 16424193)
Rem      cneumuel  09/11/2014 - Revoked sys.v_$object_privilege, sys.v_$reserved_words, sys.v_$version (bug #19537903)
Rem      cneumuel  12/09/2014 - Removed sys.seg$ (bug #20130260)
Rem      cneumuel  12/10/2014 - Removed grant on dba_arguments instead of argument$ (bug #20130260)

prompt ...revoke development environment privileges from APEX

declare
    procedure revoke_sys_priv (
        p_privilege in varchar2)
    is
        l_has_priv number;
    begin
        select 1
          into l_has_priv
          from dba_sys_privs
         where grantee   = '^APPUN'
           and privilege = p_privilege;

        execute immediate 'revoke '||p_privilege||' from ^APPUN';
    exception
        when NO_DATA_FOUND then null;
    end revoke_sys_priv;
    procedure revoke_tab_priv (
        p_owner       in varchar2 default 'SYS',
        p_object_name in varchar2,
        p_privilege   in varchar2 )
    is
        l_has_priv number;
    begin
        select 1
          into l_has_priv
          from dba_tab_privs
         where grantee    = '^APPUN'
           and privilege  = p_privilege
           and owner      = p_owner
           and table_name = p_object_name;

        execute immediate 'revoke '||p_privilege||' on '||p_owner||'.'||p_object_name||' from ^APPUN';
    exception
        when NO_DATA_FOUND then null;
    end revoke_tab_priv;
begin
    revoke_sys_priv(p_privilege => 'ALTER DATABASE');
    revoke_sys_priv(p_privilege => 'ALTER USER');
    revoke_sys_priv(p_privilege => 'CREATE CLUSTER');
    revoke_sys_priv(p_privilege => 'CREATE DIMENSION');
    revoke_sys_priv(p_privilege => 'CREATE INDEXTYPE');
    revoke_sys_priv(p_privilege => 'CREATE MATERIALIZED VIEW');
    revoke_sys_priv(p_privilege => 'CREATE OPERATOR');
    revoke_sys_priv(p_privilege => 'CREATE PROCEDURE');
    revoke_sys_priv(p_privilege => 'CREATE ROLE');
    revoke_sys_priv(p_privilege => 'CREATE SEQUENCE');
    revoke_sys_priv(p_privilege => 'CREATE SYNONYM');
    revoke_sys_priv(p_privilege => 'CREATE TABLE');
    revoke_sys_priv(p_privilege => 'CREATE TABLESPACE');
    revoke_sys_priv(p_privilege => 'CREATE TRIGGER');
    revoke_sys_priv(p_privilege => 'CREATE TYPE');
    revoke_sys_priv(p_privilege => 'CREATE USER');
    revoke_sys_priv(p_privilege => 'CREATE VIEW');
    revoke_sys_priv(p_privilege => 'EXECUTE ANY PROCEDURE');

    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'DBMS_METADATA');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'KU$_DDL');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'KU$_DDLS');
    revoke_tab_priv(p_privilege => 'FLASHBACK' , p_object_name => 'DUAL');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'V_$VERSION');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'V_$RESERVED_WORDS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'V_$OBJECT_PRIVILEGE');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_DB_LINKS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_FEATURE_USAGE_STATISTICS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_PROFILES');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_TRIGGER_COLS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_COL_PRIVS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_RECYCLEBIN');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_ROLLBACK_SEGS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_SNAPSHOTS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_TYPES');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_IND_EXPRESSIONS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_RSRC_PLAN_DIRECTIVES');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_RSRC_CONSUMER_GROUPS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_ARGUMENTS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'OBJ$');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SYSSTAT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$MYSTAT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SESSION');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$LOCKED_OBJECT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SQL');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SQL_PLAN');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SESSION_WAIT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SESS_IO');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$OPEN_CURSOR');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$PROCESS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SESSION_LONGOPS');
end;
/
