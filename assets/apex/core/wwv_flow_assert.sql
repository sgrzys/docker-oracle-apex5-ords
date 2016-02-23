set define '^' verify off
prompt ...wwv_flow_assert
create or replace package wwv_flow_assert as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2007 - 2008. All Rights Reserved.
--
--    NAME
--      wwv_flow_assert.sql
--
--    DESCRIPTION
--      Project-specific and interim substitute for DBMS_ASSERT
--
--    MODIFIED   (MM/DD/YYYY)
--      sspadafo  01/05/2008 - Created
--      sspadafo  01/07/2008 - Added sql_query_start
--      sspadafo  01/15/2008 - Added functions where_clause_start, function_body_start,
--      sspadafo  01/15/2008 - Added procedure verify_parsing_schema
--      sspadafo  01/15/2008 - Added function sql_or_function_start
--      sspadafo  01/15/2008 - Added procedure versions of functions
--      sspadafo  01/15/2008 - Added comments
--      sspadafo  01/16/2008 - Added function and procedure null_or_simple_sql_name
--      sspadafo  01/16/2008 - Added overloaded versions of noop
--      sspadafo  05/18/2009 - Added functions normal_sql_name, null_or_normal_sql_name
--      sspadafo  05/18/2009 - Sync changes from deferred 3.2 work (Bug 8352574)
--      jstraub   05/06/2010 - Added noop with p_value in clob
--      cneumuel  05/30/2011 - Added enquote_name and enquote_literal
--      cneumuel  01/16/2013 - Added dml_result
--      cneumuel  03/18/2013 - Added desupported_api
--      cneumuel  03/25/2013 - Removed get_first_token. added no_dynamic_sql (bug #16002408)
--      cneumuel  07/12/2013 - Added user_schema
--      cneumuel  02/26/2015 - Removed obsolete schema_name (bug #16210811)
--
--------------------------------------------------------------------------------

INVALID_SCHEMA_NAME exception;
    pragma exception_init(invalid_schema_name, -44001);
INVALID_OBJECT_NAME exception;
    pragma exception_init(invalid_object_name, -44002);
INVALID_SQL_NAME exception;
    pragma exception_init(invalid_sql_name, -44003);

--==============================================================================
-- Purpose: dummy check to prevent reporting by SQL injection tool
-- Example: if wwv_flow_assert.noop(p_value => <some parameter>) then null; end if;
-- Notes:   Use sparingly, as a last resort when you are absolutely sure of the safety of not checking the input value
--==============================================================================
function noop(
    p_value in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: dummy check to prevent reporting by SQL injection tool
-- Example: wwv_flow_assert.noop(p_value => <some parameter>);
-- Notes:   Use sparingly, as a last resort when you are absolutely sure of the safety of not checking the input value
--==============================================================================
procedure noop(
    p_value in varchar2);

--==============================================================================
-- Purpose: dummy check to prevent reporting by SQL injection tool
-- Example: wwv_flow_assert.noop(p_value => <some parameter>);
-- Notes:   Use sparingly, as a last resort when you are absolutely sure of the safety of not checking the input value
--==============================================================================
procedure noop(
    p_value in clob);


--==============================================================================
-- Purpose: dummy check to prevent reporting by SQL injection tool
-- Example: if wwv_flow_assert.noop(p_value => <some parameter>) then null; end if;
-- Notes:   Use sparingly, as a last resort when you are absolutely sure of the safety of not checking the input value
--      :   Overloaded
--==============================================================================
function noop(
    p_value in wwv_flow_global.vc_arr2)
    return wwv_flow_global.vc_arr2;

--==============================================================================
-- Purpose: dummy check to prevent reporting by SQL injection tool
-- Example: wwv_flow_assert.noop(p_value => <some parameter>);
-- Notes:   Use sparingly, as a last resort when you are absolutely sure of the safety of not checking the input value
--      :   Overloaded
--==============================================================================
procedure noop(
    p_value in wwv_flow_global.vc_arr2);

--==============================================================================
-- Purpose: check for valid identifier
-- Example: if wwv_flow_assert.simple_sql_name(p_name => <some parameter>) then null; end if;
-- Notes  : input name may be enclosed in double quotes; length is checked
--==============================================================================
function simple_sql_name(
    p_name in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: check for valid identifier
-- Example: wwv_flow_assert.simple_sql_name(p_name => <some parameter>);
-- Notes  : input name may be enclosed in double quotes; length is checked
--==============================================================================
procedure simple_sql_name(
    p_name in varchar2);

--==============================================================================
-- Purpose: check for null or valid identifier
-- Example: if wwv_flow_assert.simple_sql_name(p_name => <some parameter>) then null; end if;
-- Notes  : input name may be enclosed in double quotes; length is checked
--==============================================================================
function null_or_simple_sql_name(
    p_name in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: check for null or valid identifier
-- Example: wwv_flow_assert.simple_sql_name(p_name => <some parameter>);
-- Notes  : input name may be enclosed in double quotes; length is checked
--==============================================================================
procedure null_or_simple_sql_name(
    p_name in varchar2);

--==============================================================================
-- Purpose: check for valid identifier
-- Example: if wwv_flow_assert.simple_sql_name(p_name => <some parameter>) then null; end if;
-- Notes  : input name assumed to be in "normal" format and must not be enclosed in double quotes; length is checked
--==============================================================================
function normal_sql_name(
    p_name in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: check for null or valid identifier
-- Example: if wwv_flow_assert.null_or_normal_sql_name(p_name => <some parameter>) then null; end if;
-- Notes  : input name assumed to be in "normal" format and must not be enclosed in double quotes; length is checked
--==============================================================================
function null_or_normal_sql_name(
    p_name in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: check that p_query does not contain dynamic sql (execute immediate, dbms_sql, etc.)
-- Example: wwv_flow_assert.no_dynamic_sql(q'{begin execute immediate 'grant dba to scott'; end;}');
-- Notes  : Function raises an exception if dynamic sql is encountered.
--==============================================================================
procedure no_dynamic_sql (
    p_query in varchar2 );

--==============================================================================
-- Purpose: check that first token is 'SELECT' or 'WITH'
-- Example: if wwv_flow_assert.sql_query_start(p_query => <some parameter>) then null; end if;
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
function sql_query_start(
    p_query in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: check that first token is 'SELECT' or 'WITH'
-- Example: wwv_flow_assert.sql_query_start(p_query => <some parameter>);
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
procedure sql_query_start(
    p_query in varchar2);

--==============================================================================
-- Purpose: check that first token is 'WHERE'
-- Example: if wwv_flow_assert.where_clause_start(p_query => <some parameter>) then null; end if;
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
function where_clause_start (
    p_query              in varchar2 )
    return varchar2;

--==============================================================================
-- Purpose: check that first token is 'WHERE'
-- Example: wwv_flow_assert.where_clause_start(p_query => <some parameter>);
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
procedure where_clause_start (
    p_query              in varchar2 );

--==============================================================================
-- Purpose: check that first token is 'DECLARE' or 'BEGIN'
-- Example: if wwv_flow_assert.function_body_start(p_query => <some parameter>) then null; end if;
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
function function_body_start(
    p_query in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: check that first token is 'DECLARE' or 'BEGIN'
-- Example: wwv_flow_assert.function_body_start(p_query => <some parameter>);
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
procedure function_body_start(
    p_query in varchar2);

--==============================================================================
-- Purpose: check that first token is 'SELECT' or 'WITH' or DECLARE' or 'BEGIN'
-- Example: if wwv_flow_assert.sql_or_function_start(p_query => <some parameter>) then null; end if;
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
function sql_or_function_start (
    p_query in varchar2)
    return varchar2;

--==============================================================================
-- Purpose: check that first token is 'SELECT' or 'WITH' or DECLARE' or 'BEGIN'
-- Example: wwv_flow_assert.sql_or_function_start(p_query => <some parameter>);
-- Notes:   Function ignores case of input and trims leading whitespace and left parentheses
--==============================================================================
procedure sql_or_function_start(
    p_query in varchar2);

--==============================================================================
-- Purpose: check that parsing schema is allowed to parse in current security group ID (wwv_flow_security.g_security_group_id)
-- Example: if wwv_flow_assert.verify_parsing_schema(p_schema => <some parameter>) then null; end if;
-- Notes:   Schema name, if provided, may not be double-quoted
--==============================================================================
procedure verify_parsing_schema(
    p_schema in varchar2 default wwv_flow_security.g_parse_as_schema);

--==============================================================================
-- Purpose: check that parsing schema is allowed to parse in current security group ID (wwv_flow_security.g_security_group_id)
-- Example: wwv_flow_assert.verify_parsing_schema(p_schema => <some parameter>);
-- Notes:   Schema name, if provided, may not be double-quoted
--==============================================================================
function verify_parsing_schema(
    p_schema in varchar2 default wwv_flow_security.g_parse_as_schema)
    return varchar2;

--==============================================================================
-- wrapper around dbms_assert.enquote_name that does not capitalize p_str.
-- this is the behaviour we always want in APEX.
--==============================================================================
function enquote_name (
    p_str in varchar2 )
    return varchar2;

--==============================================================================
-- wrapper around dbms_assert.enquote_literal that supports single quotes
-- within p_str (enhancement request 9777721)
--==============================================================================
function enquote_literal (
    p_str in varchar2 )
    return varchar2;

--==============================================================================
-- Raise an internal error if sql%rowcount is not what was expected
--
-- EXAMPLE
--   wwv_flow_debug.trace('updating EMP...');
--   update EMP
--      set sal=4711
--    where ename=:APP_USER;
--   wwv_flow_assert.dml_result(p_for => 'EMP.SAL');
--
-- ARGUMENTS
-- * p_for:          An optional string that describes the dml target.
-- * p_rowcount:     The expected value of sql%rowcount, defaults to 1.
--==============================================================================
procedure dml_result (
    p_for      in varchar2       default null,
    p_rowcount in binary_integer default 1 );

--==============================================================================
-- Raise an internal error for desupported PL/SQL APIs.
--
-- EXAMPLE
--   procedure desupported_in_apex_5
--   is
--   begin
--       wwv_flow_assert.desupported_api (
--           p_required_version_older_than => 5,
--           p_api_name                    => 'desupported_in_apex_5' );
--       ...code for older versions...
--   end desupported_in_apex_5;
--
-- ARGUMENTS
-- * p_api_name:                    The name of the desupported API
-- * p_required_version_older_than: Raise an error if the compatibility mode is
--                                  newer than this value, emit a deprecation
--                                  warning debug message otherwise.
--==============================================================================
procedure desupported_api (
    p_api_name                    in varchar2,
    p_required_version_older_than in number );

--==============================================================================
-- Ensure that the given schema is valid for the user's session workspace. If
-- not, raise an internal error.
--
-- This procedure can be used to check that builder DDL and DML is valid in the
-- session workspace schema.
--
-- ARGUMENTS
-- * p_schema:                      The schema to check
--==============================================================================
procedure user_schema (
    p_schema                      in varchar2 );

end wwv_flow_assert;
/
show errors

