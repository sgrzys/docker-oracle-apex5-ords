Rem  Copyright (c) Oracle Corporation 2004 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      load_trans.sql
Rem
Rem    DESCRIPTION
Rem      This script installs translation for Application Express full development or runtime only environment.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - NLS_LANG environment variable must be set to AL32UTF8 character set. For example: AMERICAN_AMERICA.AL32UTF8
Rem
Rem    ARGUMENTS
Rem      Position 1: Name of the supported language. Use quotes for languages that contain space (note that quotes may
Rem                  need to be escaped in OS command prompt).
Rem
Rem      Example:
Rem        sqlplus "sys/syspass as sysdba" @load_trans.sql GERMAN
Rem        sqlplus "sys/syspass as sysdba" @load_trans.sql \"BRAZILIAN PORTUGUESE\"
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   09/14/2004 - Created
Rem      jstraub   09/27/2004 - Added alter session set current_schema
Rem      jkallman  01/04/2005 - Adjusted schema to FLOWS_020000
Rem      jkallman  09/14/2005 - Adjusted schema to FLOWS_020100
Rem      jkallman  01/23/2006 - Adjusted schema to FLOWS_020200
Rem      jkallman  09/29/2006 - Adjusted schema to FLOWS_030000
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jkallman  07/08/2008 - Change FLOWS_030100 references to FLOWS_040000
Rem      jkallman  10/02/2008 - Change FLOWS_040000 references to APEX_040000
Rem      jkallman  11/22/2010 - Change APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      vuvarov   08/25/2014 - Added parameter validation and support for runtime-only instances


set define '^' verify off serverout on
whenever sqlerror exit sql.sqlcode

alter session set current_schema = APEX_050000;

define NLS_LANGUAGE = '^1'
var env_prefix varchar2(255)
var lang_abbr  varchar2(255)

set feedback off
declare
    c_lang constant varchar2(255) := upper( trim( '^NLS_LANGUAGE.' ) );
begin
    :env_prefix := 'rt';
    for c1 in ( select null
                  from wwv_flows
                 where id = 4000 )
    loop
        :env_prefix := 'load';
    end loop;

    for c1 in ( select l.nls_language, l.lang_id
                  from wwv_flow_languages l
                 where l.nls_language = c_lang
                   and l.lang_id in ( select translation_flow_language_code
                                        from wwv_flow_language_map
                                       where primary_language_flow_id = 4411 ) )
    loop
        sys.dbms_output.put_line( 'Installing Application Express translation - ' || c1.nls_language );
        :lang_abbr := c1.lang_id;
        return;
    end loop;

    raise_application_error( -20001, 'Unsupported language specified: ' || wwv_flow_assert.enquote_literal( c_lang ) );
end;
/
whenever sqlerror continue
set feedback on

set termout off
column thescript new_val LANG_SCRIPT noprint
select 'builder/' || :lang_abbr || '/' || :env_prefix || '_' || :lang_abbr || '.sql' as thescript
  from sys.dual;
set termout on

prompt
@@^LANG_SCRIPT.
