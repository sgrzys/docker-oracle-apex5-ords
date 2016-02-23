Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      mig_views.sql
Rem
Rem    DESCRIPTION
Rem      data dictionary views of migrations meta data
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    hfarrell    07/17/2007 - Created
Rem    hfarrell    07/19/2007 - Added APEX_MIGRATION_ACC_PROJECTS view.
Rem    hfarrell    07/20/2007 - Updated APEX_MIGRATION_ACC_PROJECTS to include count of MS Access objects contained in each project.
Rem    hfarrell    07/20/2007 - Added APEX_MIGRATION_ACC_FORMS, APEX_MIGRATION_ACC_RPTS
Rem    hfarrell    07/26/2007 - Changed view names to follow naming convention of views in apex_views.sql e.g APEX_MIGRATION_<name>
Rem    jkallman    08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem    hfarrell    01/11/2008 - Added APEX_MIGRATION_REV_FORMS, APEX_MIGRATION_REV_REPORTS, APEX_MIGRATION_REV_TABLES, APEX_MIGRATION_REV_QUERIES,
Rem                             APEX_MIGRATION_ACC_TABLES,APEX_MIGRATION_ACC_QUERIES
Rem    jkallman    01/11/2008 - Corrected invalid comments on columns of view APEX_MIGRATION_REV_TABLES and APEX_MIGRATION_ACC_TABLES 
Rem    jkallman    07/08/2008 - Changed FLOWS_030100 references to FLOWS_040000
Rem    hfarrell    10/09/2008 - Replaced references to wwv_mig_projects.project_id with wwv_mig_projects.id
Rem    jkallman    10/02/2008 - Changed FLOWS_040000 references to APEX_040000
Rem    jkallman    11/22/2010 - Change APEX_040000 references to APEX_040100
Rem    sathikum    02/24/2011 - Modified all the conditions of APEX_ prefixed views (feature #608)
Rem    sathikum    12/07/2011 - Fixed #13426740 modified APEX_ views
Rem    cneumuel    04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem    cneumuel    08/05/2014 - Removed grants to public

set define '^'

prompt creating migration dictionary views

--------------------------------------------
-- M I G R A T I O N  P R O J E C T S
--
prompt ...APEX_MIGRATION_PROJECTS views

create or replace view APEX_MIGRATION_PROJECTS as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name, 
     --
   d.description                                   description, 
     --
        a.dbpathname                                    accdb_pathname, 
     --
        a.jetversion                                    jetversion,
     --
        d.migration_type                                migration_type,
     --
        a.accessversion                                 accessversion, 
     --
        d.created_by                                    project_owner, 
     --
        s.schema                                        schema, 
     --
        w.short_name                                    workspace, 
     --
        w.provisioning_company_id                       workspace_id,
     --
        d.last_updated_on                               last_modified_on, 
     -- 
        d.last_updated_by                               last_modified_by
     --
from    
        wwv_mig_access a,
     -- 
        wwv_flow_company_schemas s,
     -- 
        wwv_mig_projects d,
     -- 
        wwv_flow_companies w,
     -- 
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     -- 
where 
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid = w.PROVISIONING_COMPANY_ID) 
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.PROVISIONING_COMPANY_ID, a.project_id
/

comment on table  APEX_MIGRATION_PROJECTS                                is 'Available Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_PROJECTS.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_PROJECTS.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_PROJECTS.description                    is 'A brief description of the migration project';
comment on column APEX_MIGRATION_PROJECTS.accdb_pathname                 is 'Identifies full path name and location of the Microsoft Access database the migration project is based on';
comment on column APEX_MIGRATION_PROJECTS.jetversion                     is 'Version of Microsoft Jet for MS Access associated with captured Microsoft Access database';
comment on column APEX_MIGRATION_PROJECTS.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_PROJECTS.accessversion                  is 'Version of Microsoft Access database captured, which the migration project is based on';
comment on column APEX_MIGRATION_PROJECTS.project_owner                  is 'Identifies the Apex User Name who created and owns the Migration Project';
comment on column APEX_MIGRATION_PROJECTS.schema                         is 'Identified the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_PROJECTS.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_PROJECTS.workspace_id                   is 'Primary key that identifies the workspace';
comment on column APEX_MIGRATION_PROJECTS.last_modified_on               is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_PROJECTS.last_modified_by               is 'Identifies the APEX User Name who last modified the Migration Project';

--------------------------------------------
-- A C C E S S  P R O J E C T S
--
prompt ...APEX_MIGRATION_ACC_PROJECTS views

create or replace view APEX_MIGRATION_ACC_PROJECTS as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.description                                   description,
     --
        d.migration_type                                migration_type,
     --
        d.created_by                                    project_owner,
     --
        a.dbpathname                                    accdb_pathname,
     --
       (select count(*) from wwv_mig_acc_tables
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              tables,
     --
       (select count(*) from wwv_mig_acc_queries
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              queries,
     --
       (select count(*) from wwv_mig_acc_forms
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              forms,
     --
       (select count(*) from wwv_mig_acc_reports
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              reports,
     --
       (select count(*) from wwv_mig_acc_pages
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              pages,
     --
       (select count(*) from wwv_mig_acc_modules
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              modules,
     --
       (select count(*) from wwv_mig_acc_relations
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              relations,
     --
        a.jetversion                                    jetversion,
     --
        a.accessversion                                 accessversion, 
     --
        a.dbname                                        dbname,
     --
        a.dbid                                          dbid,
     --
        a.dbsize                                        dbsize,
     --
        a.isappdb                                       isappdb,
     --
        a.isattacheddb                                  isattacheddb,
     --
        a.startupform                                   startupform,
     --
        a.linkdbid                                      linkdbid,
     --
        a.created_by                                    created_by,
     --
        d.last_updated_on                               last_modified_on,
     --
        d.last_updated_by                               last_modified_by,
     --
        s.schema                                        schema,
     --
        w.short_name                                    workspace,
     --
        w.provisioning_company_id                       workspace_id
from    
        wwv_mig_access a,
     -- 
        wwv_flow_company_schemas s,
     -- 
        wwv_mig_projects d,
     -- 
        wwv_flow_companies w,
     -- 
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
where 
       (s.schema  = cu  
 or    (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid = w.PROVISIONING_COMPANY_ID) 
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     w.provisioning_company_id = a.security_group_id 
and     w.provisioning_company_id = s.security_group_id
order by w.PROVISIONING_COMPANY_ID, a.project_id
/

comment on table  APEX_MIGRATION_ACC_PROJECTS                                is 'Available Application Express (Apex) Application Migrations MS Access Migration Projects';
comment on column APEX_MIGRATION_ACC_PROJECTS.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_ACC_PROJECTS.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_ACC_PROJECTS.description                    is 'A brief description of the migration project';
comment on column APEX_MIGRATION_ACC_PROJECTS.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_ACC_PROJECTS.tables                         is 'Number of tables in the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.queries                        is 'Number of queries in the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.forms                          is 'Number of forms in the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.reports                        is 'Number of reports in the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.modules                        is 'Number of modules in the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.relations                      is 'Number of relationships in the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.project_owner                  is 'Identifies the Apex User Name who created and owns the Migration Project';
comment on column APEX_MIGRATION_ACC_PROJECTS.accdb_pathname                 is 'Identifies full path name and location of the Microsoft Access database the migration project is based on';
comment on column APEX_MIGRATION_ACC_PROJECTS.jetversion                     is 'Version of Microsoft Jet for MS Access associated with captured Microsoft Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.accessversion                  is 'Version of Microsoft Access database captured, which the migration project is based on';
comment on column APEX_MIGRATION_ACC_PROJECTS.dbname                         is 'Identifies the name of the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.dbsize                         is 'Identifies the size of the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.isappdb                        is 'Identifies whether the MS Access database is a single or parent database';
comment on column APEX_MIGRATION_ACC_PROJECTS.isattacheddb                   is 'Identifies whether the MS Access database is attached to a parent database';
comment on column APEX_MIGRATION_ACC_PROJECTS.startupform                    is 'Identifies the name of the startup form in the MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.linkdbid                       is 'Identifies the unique number of the MS Access database that this parent database is linked to';
comment on column APEX_MIGRATION_ACC_PROJECTS.created_by                     is 'Identifies the name of the user who created the original MS Access database';
comment on column APEX_MIGRATION_ACC_PROJECTS.schema                         is 'Identifies the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_ACC_PROJECTS.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_ACC_PROJECTS.workspace_id                   is 'Primary key that identifies the workspace';
comment on column APEX_MIGRATION_ACC_PROJECTS.last_modified_on               is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_ACC_PROJECTS.last_modified_by               is 'Identifies the APEX User Name who last modified the Migration Project';

--------------------------------------------
-- A C C E S S  T A B L E S
--
prompt ...APEX_MIGRATION_ACC_TABLES view

create or replace view APEX_MIGRATION_ACC_TABLES as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.tblid                                         table_id,
     --
        f.tblname                                       table_name,
     --
        f.validationtext                                validation_text,
     --
        f.validationrule                                validation_rule,
     --
        f.numberofrows                                  number_ofrows,
     --
        f.description                                   description,
     --
        f.sourcetablename                               source_tablename,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema, 
     --
   w.short_name                                    workspace, 
     --
   w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_acc_tables f,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where 
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid = w.PROVISIONING_COMPANY_ID) 
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.tblid, f.dbid
/

comment on table  APEX_MIGRATION_ACC_TABLES                                is 'Available Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_ACC_TABLES.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_ACC_TABLES.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_ACC_TABLES.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_ACC_TABLES.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_ACC_TABLES.table_id                       is 'Identifies the unique number of the original MS Access table';
comment on column APEX_MIGRATION_ACC_TABLES.table_name                     is 'Identifies the name of the original MS Access table';
comment on column APEX_MIGRATION_ACC_TABLES.validation_text                is 'Identifies the validation text associated with the original MS Access table';
comment on column APEX_MIGRATION_ACC_TABLES.validation_rule                is 'Identifies the validation rule associated with the original MS Access table';
comment on column APEX_MIGRATION_ACC_TABLES.number_ofrows                  is 'Identifies the number of rows of data in the original MS Access table';
comment on column APEX_MIGRATION_ACC_TABLES.description                    is 'A brief description of the Microsoft Access table';
comment on column APEX_MIGRATION_ACC_TABLES.source_tablename               is 'Identifies the date the source Microsoft Access table was created on';
comment on column APEX_MIGRATION_ACC_TABLES.created_on                     is 'Identifies the name of the user who created the original MS Access database';
comment on column APEX_MIGRATION_ACC_TABLES.created_by                     is 'Identifies the name of the user who created the original MS Access database';
comment on column APEX_MIGRATION_ACC_TABLES.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_ACC_TABLES.last_updated_by                is 'Identifies the APEX User Name who last modified the Migration Project';

--------------------------------------------
-- A C C E S S  F O R M S
--
prompt ...APEX_MIGRATION_ACC_FORMS views

create or replace view APEX_MIGRATION_ACC_FORMS as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.formid                                       form_id,
     --
        f.formname                                     form_name,
     --
        f.formcaption                                  form_caption,
     --
        f.gridx                                        gridx,
     --
        f.gridy                                        gridy,
     --
        f.hasmodule                                    has_module,
     --
        f.insideheight                                 inside_height,
     --
        f.insidewidth                                  inside_width,
     --
        f.logicalpagewidth                             logical_pagewidth,
     --
        f.modal                                        modal,
     --
        f.popup                                        popup,
     --
        f.recordsource                                 recordsource,
     --
        f.tag                                          tag,
     --
        f.visible                                      visible,
     --
        f.width                                        width,
     --
        f.created_on                                   created_on,
     --
        f.created_by                                   created_by,
     --
        a.last_updated_on                              last_updated_on,
     --
        a.last_updated_by                              last_updated_by,
     --
        decode(a.startupform, f.formname, a.startupform, null) startupform,
     --
   s.schema                                        schema, 
     --
   w.short_name                                    workspace, 
     --
   w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_acc_forms f,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid = w.PROVISIONING_COMPANY_ID) 
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.formid, f.dbid
/

comment on table  APEX_MIGRATION_ACC_FORMS                                is 'Available MS Access forms in the Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_ACC_FORMS.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_ACC_FORMS.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_ACC_FORMS.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_ACC_FORMS.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.form_id                        is 'Identifies the unique number of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.form_name                      is 'Identifies the name of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.form_caption                   is 'A text description associated with a form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.gridx                          is 'Identifies the horizontal division of the alignment grid of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.gridy                          is 'Identifies the vertical division of the alignment grid of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.has_module                     is 'Identifies whether the form has an associated VB module';
comment on column APEX_MIGRATION_ACC_FORMS.inside_height                  is 'A number representing the height of a form window';
comment on column APEX_MIGRATION_ACC_FORMS.inside_width                   is 'A number representing the width of a form window';
comment on column APEX_MIGRATION_ACC_FORMS.logical_pagewidth              is 'A number representing the width of the printable page less the margins of a form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.modal                          is 'Identifies whether a form is modal and needs to be closed before moving focus elsewhere';
comment on column APEX_MIGRATION_ACC_FORMS.popup                          is 'Identifies whether a form is a pop-up form';
comment on column APEX_MIGRATION_ACC_FORMS.recordsource                   is 'Identifies the recordsource of the form: a table, query, SQL query or null';
comment on column APEX_MIGRATION_ACC_FORMS.tag                            is 'Stores an extra information on a form';
comment on column APEX_MIGRATION_ACC_FORMS.visible                        is 'Identifies whether the form is visible and should be displayed';
comment on column APEX_MIGRATION_ACC_FORMS.width                          is 'Identifies the width of the form';
comment on column APEX_MIGRATION_ACC_FORMS.created_on                     is 'Date the form was created in the original MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.created_by                     is 'Identidies the MS Access User Name who created the original MS Access form';
comment on column APEX_MIGRATION_ACC_FORMS.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_ACC_FORMS.last_updated_by                is 'Identifies the APEX User Name who last modified the MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.startupform                    is 'Identifies the name of the startup form in the MS Access database';
comment on column APEX_MIGRATION_ACC_FORMS.schema                         is 'Identifies the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_ACC_FORMS.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_ACC_FORMS.workspace_id                   is 'Primary key that identifies the workspace';


--------------------------------------------
-- A C C E S S  R E P O R T S
--
prompt ...APEX_MIGRATION_ACC_RPTS views

create or replace view APEX_MIGRATION_ACC_RPTS as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        r.reportid                                      report_id,
     --
        r.repname                                       report_name,
     --
        r.repcaption                                    report_caption,
     --
        r.gridx                                         gridx,
     --
        r.gridy                                         gridy,
     --
        r.hasmodule                                     has_module,
     --
        r.pagefooter                                    page_footer,
     --
        r.pageheader                                    page_header,
     --
        r.recordsource                                  recordsource,
     --
        r.tag                                           tag,
     --
        r.visible                                       visible,
     --
        r.width                                         width,
     --
        r.created_on                                    created_on,
     --
        r.created_by                                    created_by,
     --
        a.last_updated_on                              last_updated_on,
     --
        a.last_updated_by                              last_updated_by,
     --
        s.schema                                        schema,
     --
        w.short_name                                    workspace,
     --
        w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_acc_reports r,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where 
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid = w.PROVISIONING_COMPANY_ID)    
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     r.security_group_id = a.security_group_id
and     r.project_id = a.project_id
and     r.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, r.project_id, r.reportid, r.dbid
/

comment on table  APEX_MIGRATION_ACC_RPTS                                is 'Available MS Access report in the Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_ACC_RPTS.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_ACC_RPTS.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_ACC_RPTS.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_ACC_RPTS.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.report_id                      is 'Identifies the unique number of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.report_name                    is 'Identifies the name of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.report_caption                 is 'A text description associated with a form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.gridx                          is 'Identifies the horizontal division of the alignment grid of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.gridy                          is 'Identifies the vertical division of the alignment grid of the form in the original MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.has_module                     is 'Identifies whether the form has an associated VB module';
comment on column APEX_MIGRATION_ACC_RPTS.page_footer                    is 'Identfies the positioning of page footer in relation to the report footer';
comment on column APEX_MIGRATION_ACC_RPTS.page_header                    is 'Identfies the positioning of page header in relation to the report header';
comment on column APEX_MIGRATION_ACC_RPTS.recordsource                   is 'Identifies the recordsource of the form: a table, query, SQL query or null';
comment on column APEX_MIGRATION_ACC_RPTS.tag                            is 'Stores an extra information on a form';
comment on column APEX_MIGRATION_ACC_RPTS.visible                        is 'Identifies whether the form is visible and should be displayed';
comment on column APEX_MIGRATION_ACC_RPTS.width                          is 'Identifies the width of the form';
comment on column APEX_MIGRATION_ACC_RPTS.created_on                     is 'Date the form was created in the original MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.created_by                     is 'Identidies the MS Access User Name who created the original MS Access report';
comment on column APEX_MIGRATION_ACC_RPTS.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_ACC_RPTS.last_updated_by                is 'Identifies the APEX User Name who last modified the MS Access database';
comment on column APEX_MIGRATION_ACC_RPTS.schema                         is 'Identifies the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_ACC_RPTS.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_ACC_RPTS.workspace_id                   is 'Primary key that identifies the workspace';

--------------------------------------------
-- A C C E S S  Q U E R I E S
--
prompt ...APEX_MIGRATION_ACC_QUERIES views

create or replace view APEX_MIGRATION_ACC_QUERIES as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.qryid                                         query_id,
     --
        f.qrytype                                       query_type,
     --
        f.qryname                                       query_name,
     --
        f.qrysql                                        query_sql,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema, 
     --
   w.short_name                                    workspace, 
     --
   w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_acc_queries f,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)    
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.qryid, f.dbid
/

comment on table  APEX_MIGRATION_ACC_QUERIES                                is 'Available MS Access report in the Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_ACC_QUERIES.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_ACC_QUERIES.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_ACC_QUERIES.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_ACC_QUERIES.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_ACC_QUERIES.query_id                       is 'Identifies the unique number of the query in the original MS Access database';
comment on column APEX_MIGRATION_ACC_QUERIES.query_type                     is 'Identifies the type of the query in the original MS Access database';
comment on column APEX_MIGRATION_ACC_QUERIES.query_name                     is 'Identifies the name of the query in the original MS Access database';
comment on column APEX_MIGRATION_ACC_QUERIES.query_sql                      is 'Identifies the SQL syntax of the query in the original MS Access database';
comment on column APEX_MIGRATION_ACC_QUERIES.created_on                     is 'Date the QUERY was created in the original MS Access database';
comment on column APEX_MIGRATION_ACC_QUERIES.created_by                     is 'Identidies the MS Access User Name who created the original MS Access query';
comment on column APEX_MIGRATION_ACC_QUERIES.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_ACC_QUERIES.last_updated_by                is 'Identifies the APEX User Name who last modified the MS Access database';
comment on column APEX_MIGRATION_ACC_QUERIES.schema                         is 'Identifies the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_ACC_QUERIES.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_ACC_QUERIES.workspace_id                   is 'Primary key that identifies the workspace';

--------------------------------------------
-- R E V I S I O N   T A B L E S
--
prompt ...APEX_MIGRATION_REV_FORMS views

create or replace view APEX_MIGRATION_REV_FORMS as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.formid                                        form_id,
     --
        f.parent_formid                                 parent_formid,
     --
        f.form_name                                     form_name,
     --
        f.source_name                                   source_name,
     --
        f.source_type                                   source_type,
     --
        f.source_syntax                                 source_syntax,
     --
        f.source_status                                 source_status,
     --
        f.owner                                         owner,
     --
        f.status                                        status,
     --
        f.mig_type                                      mig_type,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema, 
     --
   w.short_name                                    workspace, 
     --
   w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_rev_forms f,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)  
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.formid, f.dbid
/

comment on table  APEX_MIGRATION_REV_FORMS                                is 'Available MS Access forms in the Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_REV_FORMS.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_REV_FORMS.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_REV_FORMS.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_REV_FORMS.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_REV_FORMS.form_id                        is 'Identifies the unique number of the form in the original MS Access database';
comment on column APEX_MIGRATION_REV_FORMS.parent_formid                  is 'Identifies the unique number of the parent or master form in the original MS Access database';
comment on column APEX_MIGRATION_REV_FORMS.form_name                      is 'Identifies the name of the form in the original MS Access database';
comment on column APEX_MIGRATION_REV_FORMS.source_name                    is 'Identifies the name of the source associated with the original MS Access form';
comment on column APEX_MIGRATION_REV_FORMS.source_type                    is 'Identifies the type of source associated with the original MS Access form: table, query, SQL query';
comment on column APEX_MIGRATION_REV_FORMS.source_syntax                  is 'Identifies the syntax of the source associated with the original MS Access form';
comment on column APEX_MIGRATION_REV_FORMS.source_status                  is 'Identifies the status of the source object: valid or invalid';
comment on column APEX_MIGRATION_REV_FORMS.owner                          is 'Identifies the owner of the original MS Access form';
comment on column APEX_MIGRATION_REV_FORMS.status                         is 'Identifies the status of form: exclude or include in the migration process';
comment on column APEX_MIGRATION_REV_FORMS.mig_type                       is 'Identifies the type of object the form may be migrated to: form, reportandform, tabular form';
comment on column APEX_MIGRATION_REV_FORMS.created_on                     is 'Date the form was created in the original MS Access database';
comment on column APEX_MIGRATION_REV_FORMS.created_by                     is 'Identidies the MS Access User Name who created the original MS Access form';
comment on column APEX_MIGRATION_REV_FORMS.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_REV_FORMS.last_updated_by                is 'Identifies the APEX User Name who last modified the MS Access database';
comment on column APEX_MIGRATION_REV_FORMS.schema                         is 'Identifies the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_REV_FORMS.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_REV_FORMS.workspace_id                   is 'Primary key that identifies the workspace';

--------------------------------------------
-- R E V I S I O N   R E P O R T S
--
prompt ...APEX_MIGRATION_REV_RPTS views

create or replace view APEX_MIGRATION_REV_RPTS as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        r.reportid                                      report_id,
     --
        r.report_name                                   report_name,
     --
        r.source_name                                   source_name,
     --
        r.source_type                                   source_type,
     --
        r.source_syntax                                 source_syntax,
     --
        r.source_status                                 source_status,
     --
        r.owner                                         owner,
     --
        r.status                                        status,
     --
        r.created_on                                    created_on,
     --
        r.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
        s.schema                                        schema,
     --
        w.short_name                                    workspace,
     --
        w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_rev_reports r,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where 
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)  
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     r.security_group_id = a.security_group_id
and     r.project_id = a.project_id
and     r.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, r.project_id, r.reportid, r.dbid
/

comment on table  APEX_MIGRATION_REV_RPTS                                is 'Available MS Access report in the Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_REV_RPTS.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_REV_RPTS.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_REV_RPTS.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_REV_RPTS.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_REV_RPTS.report_id                      is 'Identifies the unique number of the report in the original MS Access database';
comment on column APEX_MIGRATION_REV_RPTS.report_name                    is 'Identifies the name of the report in the original MS Access database';
comment on column APEX_MIGRATION_REV_RPTS.source_name                    is 'Identifies the name of the source object associated with the original MS Access report';
comment on column APEX_MIGRATION_REV_RPTS.source_type                    is 'Identifies the type of source object associated with the original MS Access report';
comment on column APEX_MIGRATION_REV_RPTS.source_syntax                  is 'Identifies the syntax of the source object associated with the original MS Access report';
comment on column APEX_MIGRATION_REV_RPTS.source_status                  is 'Identifies the status of the source object: valid or invalid';
comment on column APEX_MIGRATION_REV_RPTS.owner                          is 'Identfies the owner of the original MS Access report';
comment on column APEX_MIGRATION_REV_RPTS.status                         is 'Identfies the status of the report object: exclude or include in the migration process';
comment on column APEX_MIGRATION_REV_RPTS.created_on                     is 'Date the report was created in the original MS Access database';
comment on column APEX_MIGRATION_REV_RPTS.created_by                     is 'Identidies the MS Access User Name who created the original MS Access report';
comment on column APEX_MIGRATION_REV_RPTS.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_REV_RPTS.last_updated_by                is 'Identifies the APEX User Name who last modified the MS Access database';
comment on column APEX_MIGRATION_REV_RPTS.schema                         is 'Identifies the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_REV_RPTS.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_REV_RPTS.workspace_id                   is 'Primary key that identifies the workspace';

--------------------------------------------
-- R E V I S I O N  Q U E R I E S
--
prompt ...APEX_MIGRATION_REV_QUERIES views

create or replace view APEX_MIGRATION_REV_QUERIES as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.qryid                                         query_id,
     --
        f.orig_qry_name                                 orig_qry_name,
     --
        f.mig_view_name                                 mig_view_name,
     --
        f.orig_sql                                      orig_sql,
     --
        f.mig_sql                                       mig_sql,
     --
        f.owner                                         owner,
     --
        f.status                                        status,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema, 
     --
   w.short_name                                    workspace, 
     --
   w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_rev_queries f,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)  
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.qryid, f.dbid
/

comment on table  APEX_MIGRATION_REV_QUERIES                                is 'Available MS Access report in the Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_REV_QUERIES.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_REV_QUERIES.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_REV_QUERIES.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_REV_QUERIES.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_REV_QUERIES.query_id                       is 'Identifies the unique number of the query in the original MS Access database';
comment on column APEX_MIGRATION_REV_QUERIES.orig_qry_name                  is 'Identifies the name of the original MS Access query';
comment on column APEX_MIGRATION_REV_QUERIES.mig_view_name                  is 'Identifies the name of the migrated view associated with the MS Access query';
comment on column APEX_MIGRATION_REV_QUERIES.orig_sql                       is 'Identifies the SQL syntax of the original query in the original MS Access database';
comment on column APEX_MIGRATION_REV_QUERIES.mig_sql                        is 'Identifies the SQL syntax of the migrated view';
comment on column APEX_MIGRATION_REV_QUERIES.owner                          is 'Identifies the owner of the MS Access database';
comment on column APEX_MIGRATION_REV_QUERIES.status                         is 'Identifies the status of the migrated view: valid or invalid';
comment on column APEX_MIGRATION_REV_QUERIES.created_on                     is 'Date the QUERY was created in the original MS Access database';
comment on column APEX_MIGRATION_REV_QUERIES.created_by                     is 'Identidies the MS Access User Name who created the original MS Access query';
comment on column APEX_MIGRATION_REV_QUERIES.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_REV_QUERIES.last_updated_by                is 'Identifies the APEX User Name who last modified the MS Access database';
comment on column APEX_MIGRATION_REV_QUERIES.schema                         is 'Identifies the name of database schema associated with the Migration Project';
comment on column APEX_MIGRATION_REV_QUERIES.workspace                      is 'A work area mapped to one or more database schemas';
comment on column APEX_MIGRATION_REV_QUERIES.workspace_id                   is 'Primary key that identifies the workspace';

--------------------------------------------
-- R E V I S I O N  T A B L E S
--
prompt ...APEX_MIGRATION_REV_TABLES view

create or replace view APEX_MIGRATION_REV_TABLES as
select  
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.tblid                                         table_id,
     --
        f.orig_table_name                               orig_table_name,
     --
        f.mig_table_name                                mig_table_name,
     --
        f.owner                                         owner,
     --
        f.status                                        status,
     --
        f.primarykey_name                               primarykey_name,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema, 
     --
   w.short_name                                    workspace, 
     --
   w.provisioning_company_id                       workspace_id
     --
from    
        wwv_mig_access a,
     --
        wwv_mig_rev_tables f,
     --
        wwv_flow_company_schemas s, 
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu  
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' 
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)  
and     w.PROVISIONING_COMPANY_ID != 0 
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.tblid, f.dbid
/

comment on table  APEX_MIGRATION_REV_TABLES                                is 'Available Application Express (Apex) Application Migrations Migration Projects';
comment on column APEX_MIGRATION_REV_TABLES.project_id                     is 'Primary key that identifies the migration project';
comment on column APEX_MIGRATION_REV_TABLES.project_name                   is 'Identifies name of the migration project';
comment on column APEX_MIGRATION_REV_TABLES.migration_type                 is 'Identifies the type of Migration Project';
comment on column APEX_MIGRATION_REV_TABLES.dbid                           is 'Identifies the unique number of the original MS Access database';
comment on column APEX_MIGRATION_REV_TABLES.table_id                       is 'Identifies the unique number of the original MS Access table';
comment on column APEX_MIGRATION_REV_TABLES.orig_table_name                is 'Identifies the name of the original MS Access table';
comment on column APEX_MIGRATION_REV_TABLES.mig_table_name                 is 'Identifies the name of the migrated table associated with the MS Access table';
comment on column APEX_MIGRATION_REV_TABLES.owner                          is 'Identifies the owner of the original MS Access table';
comment on column APEX_MIGRATION_REV_TABLES.status                         is 'Identifies the status of the migrated table: valid or invalid based upon existence of a primary key on the table';
comment on column APEX_MIGRATION_REV_TABLES.primarykey_name                is 'Identifies the name of the primary key';
comment on column APEX_MIGRATION_REV_TABLES.created_on                     is 'Identifies the name of the user who created the original MS Access database';
comment on column APEX_MIGRATION_REV_TABLES.created_by                     is 'Identifies the name of the user who created the original MS Access database';
comment on column APEX_MIGRATION_REV_TABLES.last_updated_on                is 'Date of most recent changes to the Migration Project';
comment on column APEX_MIGRATION_REV_TABLES.last_updated_by                is 'Identifies the APEX User Name who last modified the Migration Project';
