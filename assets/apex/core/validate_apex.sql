set define '^' verify off
prompt ...validate_apex
create or replace procedure validate_apex as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2009. All Rights Reserved.
--
--    NAME
--      validate_apex.sql
--
--    SYNOPSIS
--      @validate_apex x x APEX_050000
--
--    DESCRIPTION
--      This procedure checks that the objects in the APEX application schema
--      are valid.
--
--    NOTES
--      Assumes the SYS user is connected. Call with 3 parameters, the 3rd has
--      to be the APEX schema.
--
--    REQUIREMENTS
--      - Oracle 10g
--
--    MODIFIED   (MM/DD/YYYY)
--      jstraub   06/21/2006 - Created, borrowed almost exclusively from CTXSYS, thanks gkaminag
--      jstraub   06/22/2006 - Broke out validate procedure into a package
--      jstraub   06/29/2006 - Turned back into standalone procedure on advice from rburns
--      jstraub   01/30/2007 - Excluded wwv_flow_custom_auth_sso (Bug 5852920)
--      jstraub   01/31/2007 - Changed query on all objects to improve performance
--      jstraub   07/13/2007 - Removed WWV_FLOW_DATA_LOAD and WWV_FLOW_XLIFF from existance check to support runtime
--      jstraub   02/01/2008 - Removed check for WWV_EXECUTE_IMMEDIATE and added check for WWV_DBMS_SQL
--      mhichwa   10/13/2008 - added logging to account for time
--      mhichwa   10/13/2008 - Replacing carrot 3 with APEX_040000
--      mhichwa   10/14/2008 - Enhanced logging, display numbers of objects installed by object type
--      mhichwa   10/14/2008 - Removed duplicate dot after Compile objects that are invalid
--      mhichwa   10/15/2008 - Added accounting for the number of procedures loaded
--      mhichwa   10/15/2008 - Report all errors for compilation and existance not just first error
--      mhichwa   10/18/2008 - Re-instated carrot 3 subs
--      sspadafo  10/23/2008 - Added wwv_flow_assert calls (Bug 7426240)
--      sspadafo  10/23/2008 - Prefixed wwv_flow_assert with APEX_040000. (Bug 7426240)
--      sspadafo  10/23/2008 - Undo previous two changes; added local function simple_sql_name and use as alternative to assert (Bug 7426240)
--      sspadafo  10/23/2008 - Replace APEX_040000 references with caret-3 (Bug 7426240)
--      jkallman  06/09/2009 - Correct typos of 'Regristry'
--      jstraub   06/07/2011 - Replaced references to local simple_sql_name with dbms_assert.enquote_name
--      cneumuel  07/02/2014 - Report missing direct grants. prefix sys objects with schema. optimize compilation code.
--      cneumuel  07/02/2014 - Renamed apexvalidate.sql to core/validate_apex.sql
--      cneumuel  08/08/2014 - Emit ORA-20001: for error messages, to make it easier to spot them in hudson
--      cneumuel  08/14/2014 - use utl_recomp instead of execute immediate and emit compile errors
--      cneumuel  09/12/2014 - Ignore XDB.X$% in missing grants (12gR2)
--      cneumuel  01/20/2015 - Ignore SYS.XMLSEQUENCETYPE in missing grants (11gXE)
--      cneumuel  02/23/2015 - In missing grants check for XMLSEQUENCETYPE, use referenced_OWNER = SYS, not referenced_name
--      cneumuel  04/03/2015 - In missing privlileges check, grant SYS privileges and INHERIT privileges if missing
--      jstraub   04/23/2015 - Added DBMS_STATS_INTERNAL in check for SYS grants
--      jstraub   05/07/2015 - Added DBMS_METADATA in check for SYS grants
--      jstraub   05/13/2015 - Added DBMS_CRYPTO in check for SYS grants
--      cneumuel  06/22/2015 - Added dbms_assert calls around parameters for dynamic code (lrg problem 17042191)
--      cneumuel  06/25/2015 - Added DBMS_CRYPTO_STATS_INT (project 49581)
--      cneumuel  07/27/2015 - Added DBMS_CRYPTO_INT (project 49581)
--      jstraub   07/27/2015 - Changed DBMS_CRYPTO_INT to DBMS_CRYPTO_INTERNAL
--
--------------------------------------------------------------------------------
    l_type#              binary_integer;
    l_owner#             binary_integer;
    l_ltype              varchar2(30) := 'FIRST';
    l_status             binary_integer;
    l_compile_sql        varchar2(2000);
    l_obj_found          boolean;
    --
    l_obj_count          pls_integer := 0;
    l_obj_compile_count  pls_integer := 0;
    l_package_count      pls_integer := 0;
    l_table_count        pls_integer := 0;
    l_function_count     pls_integer := 0;
    l_package_body_count pls_integer := 0;
    l_sequence_count     pls_integer := 0;
    l_trigger_count      pls_integer := 0;
    l_index_count        pls_integer := 0;
    l_view_count         pls_integer := 0;
    l_library_count      pls_integer := 0;
    l_type_count         pls_integer := 0;
    l_type_body_count    pls_integer := 0;
    l_operator_count     pls_integer := 0;
    l_indextype_count    pls_integer := 0;
    l_procedure_count    pls_integer := 0;
    --
    l_invalid_object_cnt pls_integer := 0;
    l_exists_failure_cnt pls_integer := 0;

    INVALID_OBJECT_NAME EXCEPTION;
    PRAGMA EXCEPTION_INIT(INVALID_OBJECT_NAME, -44002);

--------------------------------------------------------------------------------
    procedure p (
        p_message in varchar2 )
    is
    begin
        sys.dbms_output.put_line (p_message);
    end p;
--------------------------------------------------------------------------------
    procedure error (
        p_message in varchar2 )
    is
    begin
        p('ORA-20001: '||p_message);
    end error;
--------------------------------------------------------------------------------
    procedure log_action (
        p_message in varchar2 )
    is
    begin
        p (
            '...'||
            p_message||' '||
            to_char(sysdate,'HH24:MI:SS') );
    end log_action;
--------------------------------------------------------------------------------
    procedure check_key_objects_exist (
        p_schema  in varchar2,
        p_objects in sys.dbmsoutput_linesarray )
    is
    begin
        for i in ( select o.column_value
                     from table(p_objects) o
                    where not exists ( select null
                                         from sys.dba_objects
                                        where owner = p_schema
                                          and object_name = o.column_value ))
        loop
            error('FAILED Existence check for '||p_schema||'.'||i.column_value);
            l_exists_failure_cnt := l_exists_failure_cnt + 1;
            if l_exists_failure_cnt = 1 then
                sys.dbms_registry.invalid('APEX');
                log_action('DBMS registry set to invalid for APEX');
            end if;

        end loop;
    end check_key_objects_exist;
--------------------------------------------------------------------------------
    procedure ddl (
        p_ddl in varchar2 )
    is
    begin
        log_action(p_ddl);
        execute immediate p_ddl;
    end ddl;
--------------------------------------------------------------------------------
begin
    log_action('Starting validation');
    --
    -- init logging env
    --
    select user#
      into l_owner#
      from sys.user$
     where name = '^3';
    log_action('Database user "'||user||'", database schema "^3", user# "'||l_owner#||'"');
    --
    -- log missing direct grants
    --
    for c1 in ( select distinct
                       d.owner,
                       d.referenced_owner,
                       d.referenced_name,
                       d.referenced_type
                  from dba_dependencies d
                 where d.owner = '^3'
                   and d.referenced_owner not in (d.owner, 'PUBLIC')
                   and d.referenced_name  not in ('STANDARD',
                                                  'DBMS_STANDARD',
                                                  'PLITBLM')
                   and not (    d.referenced_owner = 'XDB'
                            and d.referenced_name  like 'X$%' )
                   and not (    d.referenced_owner = 'SYS'
                            and d.referenced_name  = 'XMLSEQUENCETYPE' )
                   and not exists ( select null
                                      from dba_tab_privs p
                                     where d.referenced_owner = p.owner
                                       and d.referenced_name  = p.table_name
                                       and d.owner            = p.grantee )
                 order by 1, 2,3 )
    loop
        if c1.referenced_owner = 'SYS'
           and c1.referenced_name in ( 'DBA_TAB_IDENTITY_COLS',
                                       'DBA_XS_DYNAMIC_ROLES',
                                       'V_$XS_SESSION_ROLES' )
        then
            ddl('grant select on '||sys.dbms_assert.enquote_name(c1.referenced_owner)||'.'||sys.dbms_assert.enquote_name(c1.referenced_name)||' to ^3');
        elsif c1.referenced_owner = 'SYS'
           and c1.referenced_name in ( 'DBMS_XS_NSATTR',
                                       'DBMS_XS_NSATTRLIST',
                                       'DBMS_STATS_INTERNAL',
                                       'DBMS_CRYPTO_INTERNAL',
                                       'DBMS_CRYPTO_STATS_INT',
                                       'DBMS_METADATA',
                                       'DBMS_CRYPTO',
                                       'DIANA',
                                       'DIUTIL',
                                       'GETLONG',
                                       'KU$_DDL',
                                       'KU$_DDLS',
                                       'UTL_CALL_STACK',
                                       'UTL_TCP',
                                       'XS$NAME_LIST' )
        then
            ddl('grant execute on '||sys.dbms_assert.enquote_name(c1.referenced_owner)||'.'||sys.dbms_assert.enquote_name(c1.referenced_name)||' to ^3');
        else
            error('MISSING GRANT: grant '||
                case when c1.referenced_type in ('TABLE', 'VIEW') then 'select' else 'execute' end||
                ' on "'||c1.referenced_owner||'"."'||c1.referenced_name||
                '" to "^3"');
        end if;
    end loop;
    --
    -- check missing sys privileges
    --
    for i in ( select name
                 from sys.system_privilege_map m
                where name in ( 'INHERIT ANY PRIVILEGES' )
                  and not exists ( select null
                                     from sys.dba_sys_privs p
                                    where p.grantee = '^3'
                                      and p.privilege = m.name ))
    loop
        ddl('grant '||sys.dbms_assert.enquote_name(i.name)||' to ^3');
    end loop;
    --
    -- recompile any invalid objects in apex schema
    --
    sys.utl_recomp.recomp_parallel (
        schema => '^3' );
    --
    -- compute stats per object type and set invalid status in dbms_registry if
    -- invalid objects remain after recompiling
    --
    for c1 in ( select object_name, object_type, status
                  from sys.dba_objects
                 where owner        = '^3'
                   and object_type not in 'SYNONYM'
                   and object_type not like 'LOB%'
                 order by case object_type
                          when 'PACKAGE'      then 1
                          when 'PACKAGE BODY' then 3
                          when 'TYPE BODY'    then 3
                          else 2
                          end,
                          object_name )
    loop
        l_obj_count := l_obj_count + 1;
        if c1.object_type = 'TABLE'        then l_table_count        := l_table_count        + 1; end if;
        if c1.object_type = 'FUNCTION'     then l_function_count     := l_function_count     + 1; end if;
        if c1.object_type = 'PACKAGE'      then l_package_count      := l_package_count      + 1; end if;
        if c1.object_type = 'PACKAGE BODY' then l_package_body_count := l_package_body_count + 1; end if;
        if c1.object_type = 'SEQUENCE'     then l_sequence_count     := l_sequence_count     + 1; end if;
        if c1.object_type = 'TRIGGER'      then l_trigger_count      := l_trigger_count      + 1; end if;
        if c1.object_type = 'INDEX'        then l_index_count        := l_index_count        + 1; end if;
        if c1.object_type = 'VIEW'         then l_view_count         := l_view_count         + 1; end if;
        if c1.object_type = 'TYPE'         then l_type_count         := l_type_count         + 1; end if;
        if c1.object_type = 'TYPE BODY'    then l_type_body_count    := l_type_body_count    + 1; end if;
        if c1.object_type = 'LIBRARY'      then l_library_count      := l_library_count      + 1; end if;
        if c1.object_type = 'OPERATOR'     then l_operator_count     := l_operator_count     + 1; end if;
        if c1.object_type = 'INDEXTYPE'    then l_indextype_count    := l_indextype_count    + 1; end if;
        if c1.object_type = 'PROCEDURE'    then l_procedure_count    := l_procedure_count    + 1; end if;
        --
        -- Log objects that are invalid
        --
        if c1.status <> 'VALID' then
            error('COMPILE ERROR: "'||c1.object_type||'" "'||c1.object_name);
            for l_err in ( select line, position, text
                             from dba_errors
                            where owner = '^3'
                              and name  = c1.object_name
                              and type  = c1.object_type
                            order by line, position )
            loop
                p('...'||rpad(l_err.line||'/'||l_err.position, 8)||' '||l_err.text);
            end loop;
            l_invalid_object_cnt := l_invalid_object_cnt + 1;
            if l_invalid_object_cnt = 1 then
                sys.dbms_registry.invalid('APEX');
                log_action('DBMS registry set to invalid for APEX');
            end if;
        end if;
    end loop;

    p ('...'||l_package_count||' packages');
    p ('...'||l_package_body_count||' package bodies');
    p ('...'||l_table_count||' tables');
    p ('...'||l_function_count||' functions');
    p ('...'||l_procedure_count||' procedures');
    p ('...'||l_sequence_count||' sequences');
    p ('...'||l_trigger_count||' triggers');
    p ('...'||l_index_count||' indexes');
    p ('...'||l_view_count||' views');
    p ('...'||l_library_count||' libraries');
    p ('...'||l_type_count||' types');
    p ('...'||l_type_body_count||' type bodies');
    p ('...'||l_operator_count||' operators');
    p ('...'||l_indextype_count||' index types');
    --
    -- check for the existence of key objects
    --
    log_action('Begin key object existence check');

    check_key_objects_exist (
        p_schema  => '^3',
        p_objects => sys.dbmsoutput_linesarray ( 'WWV_FLOW_COLLECTIONS$',
                                                 'WWV_FLOW_COMPANIES',
                                                 'WWV_FLOW_FND_USER',
                                                 'WWV_FLOW_ITEMS',
                                                 'WWV_FLOW_LISTS',
                                                 'WWV_FLOW_MAIL_QUEUE',
                                                 'WWV_FLOW_MESSAGES$',
                                                 'WWV_FLOW_PAGE_PLUGS',
                                                 'WWV_FLOW_STEP_ITEMS',
                                                 'WWV_FLOW_STEP_PROCESSING',
                                                 'WWV_FLOW_STEP_VALIDATIONS',
                                                 'WWV_FLOW_STEPS',
                                                 'WWV_FLOW_SW_STMTS',
                                                 'WWV_FLOWS',
                                                 'WWV_FLOW_DML',
                                                 'WWV_FLOW_ITEM',
                                                 'WWV_FLOW_LANG',
                                                 'WWV_FLOW_LOG',
                                                 'WWV_FLOW_MAIL',
                                                 'WWV_FLOW_SVG',
                                                 'WWV_FLOW_SW_PARSER',
                                                 'WWV_FLOW_SW_UTIL',
                                                 'WWV_FLOW_UTILITIES',
                                                 'F',
                                                 'P',
                                                 'Z',
                                                 'V' ));
    check_key_objects_exist (
        p_schema  => 'SYS',
        p_objects => sys.dbmsoutput_linesarray('WWV_DBMS_SQL') );

    log_action('Completed key object existence check');

    if l_exists_failure_cnt = 0 and l_invalid_object_cnt = 0 then
        log_action('Setting DBMS Registry');
        sys.dbms_registry.valid('APEX');
        log_action('Setting DBMS Registry Complete');
    end if;
    --
    log_action('Exiting validate');
exception when others then
    sys.dbms_registry.invalid('APEX');
    error('Error in validation: '||sqlerrm);
    p(sys.dbms_utility.format_error_backtrace);
end validate_apex;
/
show errors
