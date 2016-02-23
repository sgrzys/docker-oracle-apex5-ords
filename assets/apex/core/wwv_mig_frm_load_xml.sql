SET DEFINE '^'
SET VERIFY OFF
PROMPT ...wwv_mig_frm_load_xml.sql

Rem  Copyright (c) Oracle Corporation 2003 - 2008. All Rights Reserved.
Rem
Rem     NAME
Rem         wwv_mig_frm_load_xml.sql
Rem
Rem     DESCRIPTION
Rem         Load Forms tables through XMLDOM method
Rem
Rem     MODIFIED  (MM/DD/YYYY)
Rem     ashiverm   09/15/2008 - Created
Rem     hfarrell   09/30/2008 - Moved global variables and display_load_confirm and display_load_info functions from original loading package, wwv_mig_frm_load.sql
Rem     hfarrell   10/15/2008 - Added function is_valid_forms_xml, to check uploaded file is a valid Forms Module XML file 
Rem     hfarrell   10/17/2008 - Changed comment on is_valid_forms_xml function to refer to <FormModule> tag instead of <Module> tag
Rem     hfarrell   02/19/2009 - Copied from 3.2 branch

CREATE OR REPLACE PACKAGE wwv_mig_frm_load_xml
AS
    g_security_grp_id           number := 10;
    g_xmlns                     varchar2(255)   := 'xmlns="http://xmlns.oracle.com/Forms"';
    g_project_id                number := 0;
    g_file_id                   number := 0;
    g_sqlerr                    varchar2(4000)  := null;

    TYPE col_name_arr IS TABLE OF VARCHAR2(30) INDEX BY VARCHAR2(30);

-- Get all the attributes of xml file which are associated with input table's column names
-- as mapped in wwv_mig_frm_xmltagtablemap table
FUNCTION get_forms_column_name (
    p_table_name                VARCHAR2
) RETURN col_name_arr;

-- create function to check for the <FormModule> tag in the export file
FUNCTION is_valid_forms_xml (
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

END wwv_mig_frm_load_xml;
/
SHOW ERRORS
/

