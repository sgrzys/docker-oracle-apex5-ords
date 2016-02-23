set define '^'
set verify off
set serveroutput on size 1000000
prompt ...wwv_flow_gen_hint


Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem    cbcho    04/10/2003 - Bug 2882452: Created
Rem    sbkenned 06/21/2004 - Made changes to comments
Rem    sbkenned 06/22/2004 - Added g_id_offset
Rem    sbkenned 01/13/2010 - Added export_attr_dict
Rem    jstraub  02/08/2013 - Added p_include_script_header to export and export_attr_dict


create or replace package wwv_flow_gen_hint
is	
-------------------------------------------------------------------------
-- Copyright (c) Oracle Corporation 2000 - 2010. All Rights Reserved.  --
--                                                                     --
-- DESCRIPTION                                                         --
-- Generate API calls to create User Interface Defaults for            --
-- table(s) in a schema and the attribute dictionary                                              --
--                                                                     --
-------------------------------------------------------------------------


g_id_offset    number := 0;
g_mime_shown   boolean := false;



procedure export (
    -- This procedure exports User Interface Defaults, Table Dictionary
    --
    -- p_schema.........Schema name    
    -- p_format.........Output format UNIX, DOS
    -- p_commit.........Generate a commit statement at end of script (YES or NO)
    --
    p_schema                in varchar2,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES',
    p_include_script_header in boolean  default true
    );


procedure export_attr_dict ( 
    -- This procedure exports User Interface Defaults, Attribute Dictionary
    --    
    -- p_format.........Output format UNIX, DOS
    -- p_commit.........Generate a commit statement at end of script (YES or NO)
    -- 
    p_format                in varchar2 default 'UNIX', 
    p_commit                in varchar2 default 'YES',
    p_include_script_header in boolean  default true
    );


end wwv_flow_gen_hint;
/
show error
