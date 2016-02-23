set define '^' verify off
prompt ...wwv_mig_frmmenu_load_xml.sql
create or replace package wwv_mig_frmmenu_load_xml as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2008 - 2015. All Rights Reserved.
--
--     NAME
--         wwv_mig_frmmenu_load_xml.sql
--
--     DESCRIPTION
--         Load Forms tables through XMLDOM method
--
--     MODIFIED  (MM/DD/YYYY)
--     hfarrell   10/20/2008 - Created - based on wwv_mig_frm_load_xml.sql
--     hfarrell   02/19/2009 - Copied from 3.2 branch
--     cneumuel   05/11/2015 - long identifiers (bug #21031940)
--
--------------------------------------------------------------------------------

    g_security_grp_id           number := 10;
    g_xmlns                     varchar2(255)   := 'xmlns="http://xmlns.oracle.com/Forms"';
    g_project_id                number := 0;
    g_file_id                   number := 0;
    g_sqlerr                    varchar2(4000)  := null;

    TYPE col_name_arr IS TABLE OF sys.user_tab_columns.column_name%type INDEX BY sys.user_tab_columns.column_name%type;

-- Get all the attributes of xml file which are associated with input table's column names
-- as mapped in wwv_mig_frm_xmltagtablemap table
FUNCTION get_menus_column_name (
    p_table_name                VARCHAR2
) RETURN col_name_arr;

-- create function to check for the <MenuModule> tag in the export file
FUNCTION is_valid_menu_xml (
       p_file_id             in number,
       p_project_id          in number,
       p_security_group_id   in number)
   return boolean;

-- Load all the forms' table, based on the input Node Element & parent Tag name
PROCEDURE load_all_nodes (
    p_file_id           IN      NUMBER
);

-- Display Loaded File confirmation on Wizard Confirmation Page
procedure display_load_confirm (
    p_project_id                in      number,
    p_date_time_format          in      varchar2
);

-- Display Loaded File information on Wizard Confirmation Page
procedure display_load_info (
    p_project_id                in      number,
    p_date_time_format          in      varchar2
);

END wwv_mig_frmmenu_load_xml;
/
SHOW ERRORS
/

