set define '^'
set verify off
prompt ...wwv_mig_frm_utilities

Rem  Copyright (c) Oracle Corporation 2003 - 2008. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_mig_frm_utilities.plb
Rem
Rem    DESCRIPTION
Rem
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem    hfarrell   09/11/2008 - Created
Rem    hfarrell   09/12/2008 - Added procedures set_component_defaults and set_trigger_defaults, to set applicability defaults in Create Migration Project wizard (4400:18)
Rem    hfarrell   09/12/2008 - Added procedure create_apex_pages, a process moved from the Generate Application wizard, pg 4400:62
Rem    hfarrell   09/12/2008 - Added procedures set_formtrig_applicability, set_blktrig_applicability, and set_itemtrig_applicability
Rem    hfarrell   09/15/2008 - Added function is_table_or_view, moved from wwv_mig_frm_update_apx_app package
Rem    ashiverm   09/16/2008 - Added procedure load_frm_revision_tables to load revision tables
Rem    hfarrell   09/18/2008 - Updated set_component_defaults and set_trigger_defaults to add parameter security_group_id
Rem    hfarrell   09/29/2008 - Added function get_block_mapping, to identify the type of region(s)a block is mapped to during migration
Rem    hfarrell   10/10/2008 - Added function create_apex_report_pages, to generate Interactive Report Pages for Oracle Reports
Rem    hfarrell   10/23/2008 - Added function is_table_related, to check for relation between tables prior to generating MASTERDETAIL pages
Rem    sathikum   10/29/2008 - Added procedure trigger_query_to_lov and functions trigger_get_primary_key, trigger_parse_block_sql all are used for POST-QUERY parsing
Rem    hfarrell   10/30/2008 - Added procedure set_block_inclusion, to exclude blocks without databasesources from migration
Rem    sathikum   11/11/2008 - Added replace_string function just a alternate for regexp_replace in 9i database
Rem    hfarrell   11/25/2008 - Added function is_related_block, to identify blocks with relationships and use for selecting blocks to exclude from migration process
Rem    sathikum   12/10/2008 - Added function is_valid_datasource to check for valid Database block datasource 
Rem    sathikum   12/17/2008 - Added function is_valid_query to check for valid query being passed
Rem    sathikum   12/18/2008 - added wwv_flow_assert and user validation in is_valid_query and removed Schema as a argument
Rem    sathikum   12/23/2008 - added function get_parameter_name and parse_lov_query both functions are used for transform to APEX friendly LOV Query.
Rem    sathikum   12/29/2008 - modified function parse_lov_query to create Application items for the Parameterized LOV Query.
Rem    hfarrell   02/16/2009 - Latest version of file copied from 3.2 branch in SVN.
Rem    sathikum   26/03/2009 - Fix #8358834 modified trigger_parse_block_sql to check for valid table name
Rem    hfarrell   11/19/2013 - Updated create_apex_pages and create_apex_report_pages to add p_ui_type_id for Mobile application generation (bug #15842381)
Rem                            Added update_model_pages to modify pre-populated model tables with accurate information to reflect selected user interface
Rem    hfarrell   11/28/2014 - In is_valid_query: added p_schema; in is_valid_datasource: removed p_security_group_id (bug #18920306)

CREATE OR REPLACE PACKAGE wwv_mig_frm_utilities
AS
--
--  Copyright (c) Oracle Corporation 2000 - 2008. All Rights Reserved.
--
--    DESCRIPTION
--      Forms Migrations utility package.
--
--      Includes:
--      1. Component Applicability Setting Utilities
--
--    NOTES
--      This package contains utility functions for the Application Migrations Forms Migrations service.
--
--

-- SET_COMPONENT_APPLICABILITY
-- Sets the Applicability for all components within a Migration Project
-- of the specified component type, taken from the WWV_MIG_PROJECT_COMPONENTS table.
-- For example, where p_component_name is 'ALERTS', the applicable column for all alerts within the Migration Project
-- will be updated with the 'ALERTS' applicable value, taken from wwv_mig_project_components.applicable.
--
PROCEDURE set_component_applicability (
    p_component_name                    IN  VARCHAR2,
    p_project_id                        IN  NUMBER,
    p_security_group_id                 IN  NUMBER
);

-- SET_COMPONENT_DEFAULTS
-- Set the default Component Applicability settings on creation of a new Migration Project
PROCEDURE set_component_defaults(
    p_project_id                        IN NUMBER,
    p_security_group_id                 IN  NUMBER
);

-- SET_TRIGGER_DEFAULTS
-- Set the default Trigger Applicability settings on creation of a new Migration Project
PROCEDURE set_trigger_defaults(
    p_project_id                        IN NUMBER,
    p_security_group_id                 IN  NUMBER
);

-- Update Model Pages For User Interface Settings
-- e.g. Reports should be Classic for Mobile, otherwise Interactive
--      Navigation region should be List View for Mobile, otherwise a Horizontal images list
procedure update_model_pages(
   p_model_id           in number,
   p_project_id         in number,
   p_flow_id            in number,
   p_security_group_id  in number,
   p_is_jqm             in boolean default false
   );

function is_related_block(
    p_block_name        varchar2,
    p_project_id        number,
    p_security_group_id number
) return boolean;

-- CREATE_APEX_PAGES
-- Create pages for selected blocks in an Oracle Forms Migration project.  Used on
-- pg 4400:62 of Generate Application Wizard
PROCEDURE create_apex_pages(
   p_project_id                         in number,
   p_security_group_id                  in number,
   p_schema                             in varchar2,
   p_model_id                           in number,
   p_is_jqm                             in boolean default false
);

-- CREATE_APEX_REPORT_PAGES
-- Create pages for selected Oracle Reports in an Oracle Forms Migration project.  Used on
-- pg 4400:62 of Generate Application Wizard
PROCEDURE create_apex_report_pages(
   p_project_id                         IN NUMBER,
   p_security_group_id                  IN NUMBER,
   p_schema                             IN VARCHAR2,
   p_model_id                           IN NUMBER,
   p_is_jqm                             IN BOOLEAN
);

-- SET_FORMTRIG_APPLICABILITY
-- Sets the Applicability for all form-level triggers within a Migration Project
-- using the default settings from the WWV_MIG_PROJECT_TRIGGERS table.
-- For example, where p_trigger_name is 'KEY-EXIT', the applicable column for all KEY-EXIT form-level triggers
-- within the Migration Project will be updated with the 'KEY-EXIT' applicable value, taken from wwv_mig_project_triggers.form_level.
--
PROCEDURE set_formtrig_applicability (
    p_project_id                        IN  NUMBER,
    p_security_group_id                 IN  NUMBER
);

-- SET_BLKTRIG_APPLICABILITY
-- Sets the Applicability for all block-level triggers within a Migration Project
-- using the default settings from the WWV_MIG_PROJECT_TRIGGERS table.
-- For example, where p_trigger_name is 'KEY-EXIT', the applicable column for all KEY-EXIT block-level triggers
-- within the Migration Project will be updated with the 'KEY-EXIT' applicable value, taken from wwv_mig_project_triggers.form_level.
--
PROCEDURE set_blktrig_applicability (
    p_project_id                        IN  NUMBER,
    p_security_group_id                 IN  NUMBER
);

-- SET_ITEMTRIG_APPLICABILITY
-- Sets the Applicability for all item-level triggers within a Migration Project
-- using the default settings from the WWV_MIG_PROJECT_TRIGGERS table.
-- For example, where p_trigger_name is 'KEY-EXIT', the applicable column for all KEY-EXIT item-level triggers
-- within the Migration Project will be updated with the 'KEY-EXIT' applicable value, taken from wwv_mig_project_triggers.form_level.
--
PROCEDURE set_itemtrig_applicability (
    p_project_id                        IN  NUMBER,
    p_security_group_id                 IN  NUMBER
);

--
-- Load into Revision tables
--
PROCEDURE load_frm_revision_tables (
    p_file_id           IN      NUMBER
);

-- IS_TABLE_OR_VIEW
-- Identifies the type of the datasource object passed in.
-- Returns 'T' for a Table and 'V' for a View
function is_table_or_view(
    p_owner             in varchar2,
    p_object_name       in varchar2 ) return varchar2
    ;


-- SET_COMPONENT_DEFAULTS
-- Set the default Component Applicability settings on creation of a new Migration Project
function get_block_mapping (
    p_project_id        IN NUMBER,
    p_security_group_id IN NUMBER,
    p_block_id          IN NUMBER,
    p_schema            IN VARCHAR2) return varchar2
    ;

-- IS_TABLE_RELATED
-- Identifies the relationship between two tables passed in.
-- Returns 'true' for a Relationship and 'false' for no relationship
function is_table_related(
    p_owner             in varchar2,
    p_master_table      in varchar2,
    p_detail_table      in varchar2) return boolean
    ;

-- Procedures & Functions related to Trigger Query Parsing - expecially POST-QUERY to ITEM LOV conversion
function trigger_get_primary_key(
    p_sql in varchar2, 
    p_alias in varchar2 := null ) return varchar2
    ;
procedure trigger_query_to_lov(
    p_project_id number, 
    p_block_id number)
    ;

function trigger_parse_block_sql(
    p_project_id number, 
    p_block_id number,
    p_schema varchar2) return varchar2
    ;
    
procedure set_block_inclusion(
    p_file_id             number,
    p_project_id          number,
    p_security_group_id   number
);

function replace_string(
    p_source_str in varchar2, 
    p_search_start_str in varchar2,
    p_search_end_str in varchar2, 
    p_replace_str in varchar2 ) return varchar2 
    ;

function is_valid_datasource(
    p_project_id in number,
    p_schema in varchar2) return boolean
    ;
    
function is_valid_query(
    p_query  in varchar2,
    p_schema in varchar2
    ) return boolean
    ;

function get_parameter_name(
    p_name in varchar2
    ) return varchar2
    ;

function parse_lov_query(
    p_query in varchar2,
    p_security_group_id in number default null
    ) return varchar2     
    ;
    
end wwv_mig_frm_utilities;
/

show errors
/

