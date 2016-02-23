set define '^'
set verify off

prompt wwv_flow_plsql_editor.sql

Rem    MODIFIED   (MM/DD/YYYY)
Rem     msewtz     02/21/2005 - Created
Rem     msewtz     07/13/2005 - added object type to compile function
Rem     hfarrell   04/05/2011 - Fix for bug 7048187: replaced all occurrences of varchar2s with varchar2a
Rem     cneumuel   04/17/2012 - Prefix sys objects with schema (bug #12338050)

create or replace package wwv_flow_plsql_editor as


    -----------------------------------------------------------------------------------------------
    -- get_lines
    -- p_code: CLOB containing PL/SQL code  
    
    function get_lines (
        p_code CLOB
    ) return sys.dbms_sql.varchar2a;  

    
    -----------------------------------------------------------------------------------------------
    -- compile
    -- p_owner:       parse as schema name
    -- p_object_name: PL/SQL object name
    -- p_code:        PL/SQL code
    
    function compile (
        p_owner       varchar2,
        p_object_name varchar2,
        p_object_type varchar2,        
        p_code        clob
    ) return varchar2;

    
end;
/
