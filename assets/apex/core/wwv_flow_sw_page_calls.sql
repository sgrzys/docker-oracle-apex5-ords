set define '^'
set verify off
set serveroutput on size 1000000
prompt ...wwv_flow_sw_page_calls


Rem  Copyright (c) Oracle Corporation 2001 - 2005. All Rights Reserved.
Rem  
Rem    NAME
Rem      wwv_flow_sw_page_calls.sql
Rem      
Rem    DESCRIPTION
Rem      
Rem    NOTES
Rem    
Rem    Arguments:
Rem
Rem     
Rem    RUNTIME DEPLOYMENT: YES
Rem    
Rem    MODIFIED  (MM/DD/YYYY)
Rem     skutz    05/25/2005    created

create or replace package wwv_flow_sw_page_calls
is

procedure edit_row (p_object_name in varchar2,p_ob_schema in varchar2,p_id in varchar2);
procedure do_compile(p_object_name in varchar2,p_object_owner in varchar2,p_object_type in varchar2);
procedure disable_index(p_object_name in varchar2,p_object_owner in varchar2,p_object_type in varchar2);
procedure rebuild_index(p_object_name in varchar2,p_object_owner in varchar2,p_object_type in varchar2);
procedure disable_trigger(p_object_name in varchar2,p_object_owner in varchar2,p_object_type in varchar2);
procedure enable_trigger(p_object_name in varchar2,p_object_owner in varchar2,p_object_type in varchar2);
procedure sql_results(p_sql_command2 in varchar2, p_bind_vals in varchar2, p_schema in varchar2);
function restore_object(p_object_name in varchar2,p_object_owner in varchar2,p_object_type in varchar2) return varchar2;
function purge_object(p_object_name in varchar2,p_object_owner in varchar2,p_object_type in varchar2) return varchar2;
function purge_recyclebin(p_object_owner in varchar2) return varchar2;
function run_ddl (p_pk1 in varchar2,p_pk_type in varchar2,p_pk2 in varchar2,p_name in varchar2,
                       p_ob_schema in varchar2, p_pk1_name in varchar2,p_sequence in varchar2) return varchar2;
function test_dblink(p_sql in varchar2,p_ob_schema in varchar2) return varchar2;
procedure update_comment(p_owner in varchar2,p_table_name in varchar2,p_table_comment in varchar2);

end wwv_flow_sw_page_calls;
/
show error

