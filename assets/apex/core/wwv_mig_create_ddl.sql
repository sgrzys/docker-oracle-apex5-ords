Rem
Rem $Header: Access_Exporter_Schema.sql 01-September-2005.11:44:01 
Rem
Rem Access_Exporter_Schema.sql
Rem
Rem Copyright (c) 2001, 2005, 2007 Oracle Corporation.  All rights reserved.  
Rem
Rem    NAME
Rem      WWV_MIG_CREATE_DDL.sql - Create objects 
Rem
Rem    DESCRIPTION
Rem     This will create the Schema needed for the migration of Access to HTMLDB.
Rem	Each "create table" will be followed by:
Rem
Rem		*  A trigger that generates id, create_on, created_by
Rem		   updated_on and updated_by fields.
Rem		*  An index for the foreign key of that table.
Rem
Rem    NOTES
Rem     Draft Version
Rem
Rem    CREATED by MTG  - 15/09/05
Rem
Rem    MODIFIED     (DD/MM/YY) Comments
Rem     snandava    15/09/2005 - Created 
Rem	    snandava    29/09/2005 - Added comments for every table 
Rem     snandava    18/10/2005 - Removed the Created by/Created on columns
Rem     snandava    18/10/2005 - Removed the last updated by and last updated columns
Rem     snandava    19/10/2005 - Changed the prefix "wwv_flow_.." to "wwv_mig_.."
Rem     snandava    19/10/2005 - Added the "owner" column in forms and reports tables
Rem     snandava    19/10/2005 - Removed the "isLinked" column for clarity.
Rem     snandava    20/10/2005 - Removed the "_flow_" from the trigger name
Rem     snandava    27/10/2005 - Made changes to reflect the export file
Rem     snandava    30/11/2005 - Removed the dependency on the wwv_mig_acc_load 
Rem     ddaly       13/12/2005 - Added table wwv_mig_exporter
Rem     snandava    15/12/2005 - Renamed id to project_id in all tables
Rem     snandava    15/12/2005 - Added a new filed id, which will be primary key
Rem     snandava    15/12/2005 - Changed the trigger to cater for id, created above
Rem     snandava    22/12/2005 - Added a new table wwv_mig_rev_tables 
Rem     ddaly       19/01/2006 - Move inserts to wwv_mig_exporter to wwv_mig_exporter_ins.sql
Rem	    hfarrell    20/01/2006 - Added the "database_schema" column in wwv_mig_access table
Rem	    hfarrell    06/02/2006 - Changed wwv_mig_acc_queries.qrysql datatype from varchar2 to CLOB
Rem     hfarrell    25/04/2006 - Changed wwv_mig_rev_tables definition. Added wwv_mig_rev_queries table.
Rem     hfarrell    25/04/2006 - Added public synonym for "wwv_mig_rev_queries" and "wwv_mig_rev_tables"
Rem     hfarrell    21/06/2006 - Added "wwv_mig_rev_reports" procedure and removed grants to public and public synonyms
Rem                              on wwv_mig_rev_tables and wwv_mig_rev_queries
Rem     hfarrell    28/08/2006 - Added new table wwv_mig_rev_forms
Rem     hfarrell    31/08/2006 - Updated wwv_mig_rev_reports, added source_syntax column, to hold SQL Query syntax
Rem                              Updated wwv_mig_rev_forms, added source_syntax column, to hold SQL Query syntax
Rem     hfarrell    05/09/2006 - Updated wwv_mig_rev_reports, added source_status column, to hold status of SQL Query
Rem                              Updated wwv_mig_rev_forms, added source_status column, to hold status of SQL Query
Rem     hfarrell    20/09/2006 - Updated tables and triggers to include CREATED_ON, CREATED_BY, LAST_UPDATED_ON and
Rem                              LAST_UPDATED_BY columns
Rem     hfarrell    28/09/2006 - Updated wwv_mig_rev_forms, added parent_formid to associate subform with its parent form
Rem     hfarrell    09/10/2006 - Added wwv_mig_rev_apexapp, to hold home page navigation information
Rem     hfarrell    22/10/2006 - Removed blank line from ww_mig_acc_rpt_perms create statement
Rem     hfarrell    22/10/2006 - Added mig_type column to wwv_mig_rev_forms table
Rem     hfarrell    11/11/2006 - Updated all tables with columns of varchar2(64) and varchara2(100), increased size 
Rem                              of varchar2 columns to hold more application information.
Rem     hfarrell    08/01/2007 - Updated tables with missing indexes on foreign keys
Rem     hfarrell    21/08/2007 - Bug 6355102: Increased the varchar2 column size on all tables
Rem     hfarrell    26/10/2007 - Added wwv_mig_reserved_words table for use during check for collision managed object names
Rem     hfarrell    25/01/2008 - Added AUDIT reserved word, to keep in sync with MIGRATION_RESERVED_WORDS table from SQL Developer Build 5157 
Rem     hfarrell    28/08/2008 - Updated wwv_mig_projects to remove project_id; updated wwv_mig_acc_fk to reference wwv_mig_projects.id
Rem                              Removed setting of ID from wwv_biu_mig_acc_project trigger
Rem     hfarrell    28/08/2008 - Added database_schema, app_flag, and generated_application_id to wwv_mig_projects table
Rem     hfarrell    12/10/2009 - Updated insert statements for wwv_mig_reserved_words to include addition words from SQL Developer release 2.1


SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET DEFINE '^'
SET VERIFY off

REM ****************************************************************************

--------------------------------------------------------------------------------
-- Create a table Details to hold migration project details 
-- eg., projectid, proejct name
--------------------------------------------------------------------------------

 create table wwv_mig_projects 
   (
     id                                        number constraint wwv_mig_proj_pk primary key,
     migration_name                            varchar2(400) not null,
     security_group_id                         number not null constraint wwv_mig_proj_fk 
                                               references wwv_flow_companies(provisioning_company_id) 
                                               on delete cascade,
     migration_type                            varchar2(100)
                                               constraint valid_mig_type
                                               check (migration_type in ('access','forms')),
     description                               varchar2(2000),
     database_schema                           varchar2(400),
     app_flag                                  varchar2(1) default 'N' 
                                               constraint wwv_mig_proj_app_flag
                                               check (app_flag in ('Y','N')),
     generated_application_id                  number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_proj_uk1
                                               unique (migration_name,security_group_id)              
   );


create or replace trigger wwv_biu_mig_acc_project
    before insert or update on wwv_mig_projects 
    for each row
begin

    -- vpd
    --
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
     end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;
end;
/
 
create index wwv_mig_projects_idx1 on wwv_mig_projects (security_group_id);
 
--------------------------------------------------------------------------
-- Create a table to hold general properties of the mdb file.  If an Access 
-- Project mdb file has external links to other mdb files, islinked='y'
-- and linkdbid must be mentioned
--------------------------------------------------------------------------

create table wwv_mig_access 
   (
     id                                        number constraint wwv_mig_access_pk primary key, 
     project_id                                number not null,
     security_group_id                         number,
     dbid                                      number not null unique,
     dbname                                    varchar2(400),
     dbsize                                    varchar2(100),
     dbpathname                                varchar2(1000),
     dbuser                                    varchar2(400),
     dbpassword                                varchar2(400),
     database_schema			       varchar2(400),
     isappdb                                   number(1),
     isattacheddb                              number(1),
     convertdb                                 number(1),
     jetversion                                float,
     accessversion                             varchar2(400),
     build                                     number,
     collatingorder                            number(10),
     querytimeout                              number(10),
     startupform                               varchar2(1000),
     startupshowstatusbar                      number(3),
     linkdbid                                  number,
     date_created                              date,
     date_modified                             date,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_fk foreign key(project_id)
                                               references wwv_mig_projects(id) on delete cascade,
                                               constraint wwv_mig_access_uk1 unique(project_id, dbid)
   );

create or replace trigger wwv_biu_mig_acc_main
    before insert or update on wwv_mig_access
    for each row
begin


     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    -- vpd
    --
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
     end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;
end;
/

create index wwv_mig_acc_idx1 on wwv_mig_access(project_id);

--------------------------------------------------------------------------
-- Create Exporter table to hold details about the exporters for
-- Microsoft Access. The exporters are located in the following
-- directory: /i/access_migration/
--------------------------------------------------------------------------

create table wwv_mig_exporter 
   (
     id                                        number constraint wwv_mig_exporter_pk primary key,
     security_group_id                         number not null constraint wwv_mig_exporter_fk 
                                               references wwv_flow_companies(provisioning_company_id), 
     filename                                  varchar2(2000) not null,
     description                               varchar2(1000),
     access_version                            number,
     exporter_version                          varchar2(100)
   );


create index wwv_mig_exporter_idx1 on wwv_mig_exporter (security_group_id);

--------------------------------------------------------------------------
-- Create Forms table to hold the main contents of the form.
-- All forms of one access file will refer a common dbid
--------------------------------------------------------------------------
create table  wwv_mig_acc_forms 
(
     id                                        number constraint wwv_mig_acc_form_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     formid                                    number(11,0) not null, 
     formname                                  varchar2(400), 
     afterdelconfirm                           varchar2(1000), 
     afterinsert                               varchar2(1000), 
     afterupdate                               varchar2(4000), 
     allowadditions                            number(1,0), 
     allowdeletions                            number(1,0), 
     allowedits                                number(1,0), 
     allowediting                              number(1,0), 
     allowfilters                              number(1,0), 
     allowupdating                             number(1,0), 
     autocenter                                number(1,0), 
     autoresize                                number(1,0), 
     backcolor                                 number(11,0), 
     beforedelconfirm                          varchar2(4000),
     beforeinsert                              varchar2(4000), 
     beforeupdate                              varchar2(4000), 
     borderstyle                               number(5,0), 
     formcaption                               varchar2(4000), 
     closebutton                               number(1,0), 
     controlbox                                number(1,0), 
     count                                     number(11,0), 
     currentview                               number(1,0), 
     cycle                                     number(1,0), 
     dataentry                                 number(1,0), 
     datasheetbackcolor                        number(11,0), 
     datasheetcellseffect                      number(11,0), 
     datasheetfontheight                       number(11,0), 
     datasheetfontitalic                       number(1,0), 
     datasheetfontname                         varchar2(1000), 
     datasheetfontunderline                    number(1,0), 
     datasheetfontweight                       number(11,0), 
     datasheetforecolor                        number(11,0), 
     datasheetgridlinesbehavior                number(11,0), 
     datasheetgridlinescolor                   number(11,0), 
     defaultediting                            number(11,0), 
     defaultview                               number(1,0), 
     dividinglines                             number(1,0), 
     fastlaserprinting                         number(1,0), 
     filter                                    varchar2(4000), 
     filteron                                  number(1,0), 
     frozencolumns                             number(11,0), 
     gridx                                     number(11,0), 
     gridy                                     number(11,0), 
     hasmodule                                 number(1,0), 
     helpcontextid                             number(11,0), 
     helpfile                                  varchar2(4000), 
     hwnd                                      number(11,0), 
     insideheight                              number(11,0), 
     insidewidth                               number(11,0), 
     keypreview                                number(1,0), 
     layoutforprint                            number(1,0), 
     logicalpagewidth                          number(11,0), 
     maxbutton                                 number(1,0), 
     menubar                                   varchar2(4000), 
     minbutton                                 number(1,0), 
     minmaxbuttons                             number(1,0), 
     modal                                     number(1,0), 
     navigationbuttons                         number(1,0), 
     onactivate                                varchar2(4000), 
     onapplyfilter                             varchar2(4000), 
     onclick                                   varchar2(4000), 
     onclose                                   varchar2(4000), 
     oncurrent                                 varchar2(4000), 
     ondblclick                                varchar2(4000), 
     ondeactivate                              varchar2(4000), 
     ondelete                                  varchar2(4000), 
     onerror                                   varchar2(4000), 
     onfilter                                  varchar2(4000), 
     ongotfocus                                varchar2(4000), 
     onkeydown                                 varchar2(4000), 
     onkeypress                                varchar2(4000), 
     onkeyup                                   varchar2(4000), 
     onload                                    varchar2(4000), 
     onlostfocus                               varchar2(4000), 
     onmousedown                               varchar2(4000), 
     onmousemove                               varchar2(4000), 
     onmouseup                                 varchar2(4000), 
     onopen                                    varchar2(4000), 
     onresize                                  varchar2(4000), 
     ontimer                                   varchar2(4000), 
     onunload                                  varchar2(4000), 
     openargs                                  varchar2(4000), 
     orderby                                   varchar2(4000), 
     orderbyon                                 number(1,0), 
     painting                                  number(1,0), 
     palettesource                             varchar2(4000), 
     picture                                   varchar2(4000), 
     picturealignment                          number(1,0), 
     picturesizemode                           number(1,0), 
     picturetiling                             number(1,0), 
     picturetype                               number(1,0), 
     popup                                     number(1,0), 
     recordlocks                               number(1,0), 
     recordselectors                           number(1,0), 
     recordsettype                             number(1,0), 
     recordsource                              varchar2(4000), 
     rowheight                                 number(11,0), 
     scrollbars                                number(1,0), 
     shortcutmenu                              number(1,0), 
     shortcutmenubar                           varchar2(4000), 
     showgrid                                  number(1,0), 
     tag                                       varchar2(4000), 
     timerinterval                             number(11,0), 
     toolbar                                   varchar2(4000), 
     viewsallowed                              number(1,0), 
     visible                                   number(1,0), 
     whatsthisbutton                           number(1,0), 
     width                                     number(11,0), 
     windowheight                              number(11,0), 
     windowwidth                               number(11,0),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_frm_dbid_fk
                                               foreign key (project_id,dbid) references
                                               wwv_mig_access(project_id,dbid)on delete cascade,
                                               constraint wwv_mig_acc_forms_uk1
                                               unique(project_id,dbid,formid)
   );

create or replace trigger wwv_biu_mig_acc_frm
    before insert or update on wwv_mig_acc_forms
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_frm_idx2  on wwv_mig_acc_forms(dbid);

create index wwv_mig_acc_frm_idx3 on wwv_mig_acc_forms (project_id,dbid);

--------------------------------------------------------------------------
-- Create forms control table to hold the control details for each form.
-- All control details for one form will refer a common formid. 
--------------------------------------------------------------------------

create table  wwv_mig_acc_forms_controls 
   (
     id                                        number  constraint wwv_mig_frms_ctl_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     formid                                    number (11,0),
     controlid                                 number(11,0) not null,
     controlname                               varchar2(400),
     controltype                               number(11,0),
     eventprocprefix                           varchar2(4000),
     inselection                               number(11,0),
     left                                      number,
     parent                                    varchar2(4000),
     section                                   number(11,0),
     tag                                       varchar2(4000),
     top                                       number(11,0),
     visible                                   number(1),
     backcolor                                 number(11,0),
     backstyle                                 number(11,0),
     boundcolumn                               number,
     ctrlcaption                               varchar2(4000),
     columncount                               number,
     columnheads                               varchar2(4000),
     columnwidths                              varchar2(4000),
     controlsource                             varchar2(4000),
     controltiptext                            varchar2(4000),
     defaultvalue                              varchar2(4000),
     displaywhen                               number(11,0),
     enabled                                   number(1),
     fontbold                                  number(11,0),
     fontitalic                                number(11,0),
     fontname                                  varchar2(1000),
     fontsize                                  number(11,0),
     fontunderline                             number(1),
     fontwheight                               number,
     forecolor                                 number, 
     format                                    varchar2(4000),
     height                                    number(11,0),
     helpcontextid                             number(11,0),
     limittolist                               number(11,0),
     linkchildfields                           varchar2(4000),
     linkmasterfields                          varchar2(4000),
     listrows                                  number,
     multirow                                  number(11,0),
     onchange                                  varchar2(4000),
     onclick                                   varchar2(4000),
     ondblclick                                varchar2(4000),
     onkeydown                                 varchar2(4000),
     onkeypress                                varchar2(4000),
     onkeyup                                   varchar2(4000),
     onmousedown                               varchar2(4000),
     onmousemove                               varchar2(4000),
     onmouseup                                 varchar2(4000),
     optionvalue                               number,
     pageindex                                 number,
     picture                                   varchar2(4000),
     picturealignment                          number,
     pictureresizemode                         number,
     picturetiling                             number,
     picturetype                               number,
     rowsource                                 varchar2(4000),
     rowsourcetype                             varchar2(4000),
     shortcutmenubar                           varchar2(4000),
     sourceobject                              varchar2(4000),
     statusbartext                             varchar2(4000),
     style                                     number,
     tabfixedheight                            number(11,0),
     tabfixedwidth                             number(11,0),
     tabindex                                  number(11,0),
     tabstop                                   number(11,0),
     textalign                                 number(11,0),
     textfontcharset                           number(11,0),
     width                                     number(11,0),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_frm_ctl_fk  
                                               foreign key (project_id,dbid,formid) references
                                               wwv_mig_acc_forms(project_id,dbid,formid)
                                               on delete cascade
   );

create or replace trigger wwv_biu_mig_acc_frm_ctl
    before insert or update on wwv_mig_acc_forms_controls
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_form_ctl_idx1 on wwv_mig_acc_forms_controls(formid);

create index wwv_mig_acc_form_ctl_idx2 on wwv_mig_acc_forms_controls(project_id,dbid,formid);

--------------------------------------------------------------------------
-- Create a table to hold form module details.
-- All modules that refer one form will have a common formid
--------------------------------------------------------------------------

create table  wwv_mig_acc_forms_modules
(
     id                                        number constraint wwv_mig_acc_frm_mdl_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     moduleid                                  number(11,0)  not null,
     formid                                    number(11,0),
     modulename                                varchar2(1000),
     countofdeclarationlines                   number(11,0),
     countoflines                              number(11,0),
     lines                                     clob,
     moduletype                                number(11,0),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_frm_mdl_fk 
                                               foreign key (project_id,dbid,formid) references
                                               wwv_mig_acc_forms(project_id,dbid,formid)
                                               on delete cascade
);


create index wwv_mig_acc_form_mdl_idx1 on wwv_mig_acc_forms_modules(formid);

create index wwv_mig_acc_form_mdl_idx2 on wwv_mig_acc_forms_modules(project_id,dbid,formid);

create or replace trigger wwv_biu_mig_acc_frm_mdl
    before insert or update on wwv_mig_acc_forms_modules
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 

--------------------------------------------------------------------------
-- This table exist to ensure that permissions for users and groups
-- for each form are unique. 
--------------------------------------------------------------------------

create table  wwv_mig_acc_forms_perm
(
     id                                        number constraint wwv_mig_acc_form_perm_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     permissionid                              number(11,0) not null,
     formid                                    number(11,0),
     userid                                    number(11,0),
     permission                                number(11,0),
     permission_desc                           varchar2(1000),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_frm_fk
                                               foreign key (project_id,dbid,formid) references
                                               wwv_mig_acc_forms(project_id,dbid,formid)
                                               on delete cascade
);

create index wwv_mig_acc_form_prm_idx1 on wwv_mig_acc_forms_perm(formid);

create index wwv_mig_acc_form_prm_idx2 on wwv_mig_acc_forms_perm(project_id,dbid,formid);

create or replace trigger wwv_biu_mig_acc_frm_perm
    before insert or update on wwv_mig_acc_forms_perm
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 


--------------------------------------------------------------------------
-- Create a table to hold Report Details
-- All report details of one mdb file have a common dbid reference
--------------------------------------------------------------------------

create table wwv_mig_acc_reports
   (
     id                                        number constraint wwv_mig_acc_reports_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null, 
     reportid                                  number(11,0) not null, 
     repname                                   varchar2(1000),
     backcolor                                 number(11,0),
     repcaption                                varchar2(1000),
     count                                     number,
     dategrouping                              number(11,0),     
     fastlaserprinting                         number(11,0),
     filter                                    varchar2(4000),
     filteron                                  number(11,0),
     gridx                                     number(11,0),
     gridy                                     number(11,0),
     grpkeeptogether                           number(11,0),
     hasmodule                                 number(1),
     helpcontextid                             number(11,0),
     helpfile                                  varchar2(4000),
     hwnd                                      number(11,0),
     layoutforprint                            number(11,0),
     logicalpagewidth                          number(11,0),
     maxbutton                                 number(11,0),
     menubar                                   varchar2(4000),
     minbutton                                 number(11,0),
     onactivate                                varchar2(4000),
     onclose                                   varchar2(4000),
     ondeactivate                              varchar2(4000),
     onerror                                   varchar2(4000),
     onnodata                                  varchar2(4000),
     onopen                                    varchar2(4000),
     onpage                                    varchar2(4000),
     orderby                                   varchar2(4000),
     orderbyon                                 varchar2(4000),
     pagefooter                                number,
     pageheader                                number,
     painting                                  number,
     palettesource                             varchar2(1000),
     picture                                   varchar2(1000),
     picturealignment                          number(11,0),
     picturesizemode                           number(11,0),
     picturetiling                             number(11,0),
     picturetype                               number(11,0),
     recordlocks                               number(11,0),
     recordsource                              varchar2(2000),
     shortcutmenubar                           varchar2(4000),
     tag                                       varchar2(4000),
     toolbar                                   varchar2(4000),
     visible                                   number(11,0),
     width                                     number(11,0),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_reports_fk
                                               foreign key (project_id, dbid) references wwv_mig_access
                                               (project_id,dbid)  on delete cascade,
                                               constraint wwv_mig_acc_reports_uk1
                                               unique (project_id,dbid,reportid)
   );

create or replace trigger wwv_biu_mig_acc_rpt_grp
    before insert or update on wwv_mig_acc_reports
    for each row
begin
    

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_rpt_idx2  on wwv_mig_acc_reports(dbid);

create index wwv_mig_acc_rpt_idx3  on wwv_mig_acc_reports(project_id, dbid);

--------------------------------------------------------------------------
-- Create a table to hold the report control details.
-- All details pertaining to one report will have a common reportid.
--------------------------------------------------------------------------

create table wwv_mig_acc_rpts_controls
(
     id                                        number constraint wwv_flow_rep_ctl_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     reportid                                  number(11,0), 
     controlid                                 number(11,0) not null,
     controlname                               varchar2(1000),
     controltype                               number(11,0),
     eventprocprefix                           varchar2(1000),
     inselection                               number(11,0),
     left                                      number(11,0),
     parent                                    varchar2(1000),
     section                                   number,
     tag                                       varchar2(4000),
     top                                       number,
     visible                                   number,
     backcolor                                 number(11,0),
     backstyle                                 number, 
     boundcolumn                               number,
     ctrlcaption                               varchar2(4000),
     columncount                               number,
     columnheads                               varchar2(4000),
     columnwidths                              varchar2(4000),
     controlsource                             varchar2(4000),
     controltiptext                            varchar2(4000),
     defaultvalue                              varchar2(4000),
     displaywhen                               number(11,0),
     enabled                                   number(11,0),
     fontbold                                  number(11,0),
     fontitalic                                number,
     fontname                                  varchar2(1000),
     fontsize                                  number(11,0),
     fontunderline                             number,
     fontwheight                               number(11,0),
     forecolor                                 number(11,0),
     format                                    varchar2(4000),
     height                                    number(11,0),
     helpcontextid                             number(11,0),
     limittolist                               number(11,0),
     linkchildfields                           varchar2(4000),
     linkmasterfields                          varchar2(4000),
     listrows                                  number,
     multirow                                  number,
     onchange                                  varchar2(4000),
     onclick                                   varchar2(4000),
     ondblclick                                varchar2(4000),
     onkeydown                                 varchar2(4000),
     onkeypress                                varchar2(4000),
     onkeyup                                   varchar2(4000),
     onmousedown                               varchar2(4000),
     onmousemove                               varchar2(4000),
     onmouseup                                 varchar2(4000),
     optionvalue                               number(11,0),
     pageindex                                 number(11,0),
     picture                                   varchar2(1000),
     picturealignment                          number(11,0),
     pictureresizemode                         number,
     picturetiling                             number,
     picturetype                               number(11,0),
     rowsource                                 varchar2(4000),
     rowsourcetype                             varchar2(4000),
     shortcutmenubar                           varchar2(4000),
     sourceobject                              varchar2(4000),
     statusbartext                             varchar2(4000),
     style                                     number(11,0),
     tabfixedheight                            number(11,0),
     tabfixedwidth                             number(11,0),
     tabindex                                  number(11,0),
     tabstop                                   number(11,0),
     textalign                                 number,
     textfontcharset                           number(11,0),
     width                                     number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_rep_ctl_fk 
                                               foreign key (project_id,dbid,reportid) references
                                               wwv_mig_acc_reports(project_id,dbid,reportid)
                                               on delete cascade
   );

create or replace trigger wwv_biu_mig_acc_rpt_ctl
    before insert or update on wwv_mig_acc_rpts_controls
    for each row
begin
    

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_rep_ctl_idx1 on  wwv_mig_acc_rpts_controls(reportid);

create index wwv_mig_acc_rep_ctl_idx2 on  wwv_mig_acc_rpts_controls(project_id,dbid,reportid);

--------------------------------------------------------------------------
-- Create a table to hold the report module details.
-- All details pertaining to one report will refer a common reportid.
--------------------------------------------------------------------------

create table wwv_mig_acc_rpts_modules
   (
     id                                        number constraint wwv_mig_acc_rep_pk primary key,
     project_id                                number,
     security_group_id                         number, 
     dbid                                      number not null,
     moduleid                                  number(11,0) not null,
     reportid                                  number(11,0),
     modulename                                varchar2(1000),
     countofdeclarationlines                   number(11,0),
     countoflines                              number(11,0),
     lines                                     clob,
     moduletype                                number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint accforms_accreportmodule_fk
                                               foreign key (project_id,dbid,reportid) references
                                               wwv_mig_acc_reports(project_id,dbid,reportid)
                                               on delete cascade
   );

create or replace trigger wwv_biu_mig_acc_rpt_mdl
    before insert or update on wwv_mig_acc_rpts_modules
    for each row
begin
    

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 

create index wwv_mig_acc_rpt_mdl_idx1  on wwv_mig_acc_rpts_modules(reportid);

create index wwv_mig_acc_rpt_mdl_idx2  on wwv_mig_acc_rpts_modules(project_id,dbid,reportid);

--------------------------------------------------------------------------
-- This table ensures that all permissions for users and groups refer to
-- one common report. 
--------------------------------------------------------------------------

create table  wwv_mig_acc_rpt_perms
   (
     id                                        number constraint wwv_mig_acc_rep_perm_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     permissionid                              number(11,0) not null,
     reportid                                  number (11,0),
     userid                                    number(11,0),
     permission                                number(11,0),
     permission_desc                           varchar2(1000),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_rpt_fk
                                               foreign key (project_id,dbid,reportid) references
                                               wwv_mig_acc_reports(project_id,dbid,reportid)
                                               on delete cascade
   );

create or replace trigger wwv_biu_mig_acc_rpt_perm
    before insert or update on wwv_mig_acc_rpt_perms
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_rpt_perm_idx1 on wwv_mig_acc_rpt_perms(reportid);

create index wwv_mig_acc_rpt_perm_idx2 on wwv_mig_acc_rpt_perms(project_id,dbid,reportid);

--------------------------------------------------------------------------
--  Create table to hold the table details of each access table.
--  All tables refering to one mdb file will have a common dbid.
--------------------------------------------------------------------------

create table wwv_mig_acc_tables
   (
     id                                        number constraint wwv_flow_acc_tbl_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     tblid                                     number(11) not null,
     tblname                                   varchar2(400),
     primarykey                                number(1),
     cnvtablestruct                            number(1),
     cnvmovedata                               number(1),
     cnvri                                     number(1),
     cnvvalidation                             number(1),
     cnvdefault                                number(1),
     cnvaddtimestamp                           number(1),
     attachtablebacktoaccess                   number(1),
     savepassword                              number(1),
     cnvmakeupdateable                         number(1),
     retainlocalcopy                           number(1),
     syncwithserver                            number(1),
     ownerid                                   number(11),
     validationtext                            varchar2(4000),
     validationrule                            varchar2(4000),
     numberofrows                              number(11),
     cachingtable                              number(1),
     description                               varchar2(4000),
     attributes                                number(11,0),
     conflicttable                             number(11,0),
     datecreated                               date,
     lastupdated                               date,
     recordcount                               number,
     orderbyon                                 number(1),
     replicafilter                             number(11,0),
     sourcetablename                           varchar2(1000),
     updatable                                 number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_tbl_dbid_fk
                                               foreign key (project_id, dbid) references
                                               wwv_mig_access(project_id, dbid)
                                               on delete cascade,
                                               constraint wwv_mig_acc_tables_uk1
                                               unique(project_id,dbid,tblid)
   );

create or replace trigger wwv_biu_mig_acc_table
    before insert or update on wwv_mig_acc_tables
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_tbl_idx1  on wwv_mig_acc_tables(dbid);

create index wwv_mig_acc_tbl_idx2  on wwv_mig_acc_tables(project_id, dbid);

--------------------------------------------------------------------------
-- Create a table to hold the column details of each access table.
--------------------------------------------------------------------------

create table wwv_mig_acc_columns
(
     id                                        number constraint wwv_mig_acc_col_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     colid                                     number(11) not null,
     tblid                                     number(11), 
     colname                                   varchar2(400),
     coltype                                   number(3),
     coltypedesc                               varchar2(2000),
     colautoincr                               number(1),
     nextcountervalue                          number(11),
     maxlengthsource                           number(11),
     avglengthsource                           number(11),
     coltextsize                               number(5),
     allowzerolength                           number(1),
     defaultvalue                              varchar2(4000),
     colrequired                               number(1),
     colcollatingorder                         number(11),
     colordposition                            number(3),
     validationrule                            varchar2(4000),
     validationtext                            varchar2(4000),
     columndescription                         varchar2(4000),
     columnhidden                              number,
     columnorder                               number,
     columnwidth                               number(11,0),
     decimalplaces                             number,
     foreignname                               varchar2(1000),
     validateonset                             number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_col_dbid_fk 
                                               foreign key (project_id,dbid,tblid) references
                                               wwv_mig_acc_tables(project_id,dbid,tblid) 
                                               on delete cascade
   );

create or replace trigger wwv_biu_mig_acc_column
    before insert or update on wwv_mig_acc_columns
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_col_idx1  on wwv_mig_acc_columns(dbid);

create index wwv_mig_acc_col_idx2  on wwv_mig_acc_columns(project_id,dbid,tblid);

--------------------------------------------------------------------------
-- Create a table to hold the index tables pertaining to each access table
--------------------------------------------------------------------------

create table wwv_mig_acc_indexes
   (
     id                                        number constraint wwv_mig_acc_idx_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     indid                                     number(11) not null,
     tblid                                     number(11), 
     indname                                   varchar2(1000),
     cnvindex                                  number(1),
     isprimary                                 number(1),
     isunique                                  number(1),
     isforeign                                 number(1),
     ignorenulls                               number(1),
     isrequired                                number(1),
     distinctcount                             number,
     isclustered                               number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_ind_dbid_fk 
                                               foreign key (project_id,dbid,tblid) references
                                               wwv_mig_acc_tables(project_id,dbid,tblid)
                                               on delete cascade,
                                               constraint wwv_mig_acc_indexes_uk1
                                               unique(project_id,dbid,tblid,indid)
   );

create or replace trigger wwv_biu_mig_acc_index
    before insert or update on wwv_mig_acc_indexes
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_index_idx1  on wwv_mig_acc_indexes(dbid);

create index wwv_mig_acc_index_idx2  on wwv_mig_acc_indexes(project_id,dbid,tblid);


--------------------------------------------------------------------------
-- This table holds the index_column details of each index defined above.
--------------------------------------------------------------------------

create table wwv_mig_acc_indexes_cols
   (
     id                                        number constraint wwv_mig_acc_idx_col_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     indcolid                                  number(11) not null,
     indid                                     number(11),
     colid                                     number(11),
     colorder                                  number(11),
     tblid                                     number(11),
     colname                                   varchar2(400),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_ind_col_fk
                                               foreign key (project_id,dbid,tblid,indid) references
                                               wwv_mig_acc_indexes(project_id,dbid,tblid,indid)
                                               on delete cascade
);

create or replace trigger wwv_biu_mig_acc_idx_col
    before insert or update on wwv_mig_acc_indexes_cols
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

create index wwv_mig_acc_idx_col_idx1  on wwv_mig_acc_indexes_cols(indid);

create index wwv_mig_acc_idx_col_idx2  on wwv_mig_acc_indexes_cols(project_id,dbid,tblid,indid);

--------------------------------------------------------------------------
--  This table holds the users and groups permission details 
--  for each access table.
--------------------------------------------------------------------------

create table  wwv_mig_acc_tab_perm
   (
     id                                        number constraint wwv_mig_acc_tab_perm_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     permissionid                              number(11,0) not null,
     tblid                                     number (11,0),
     userid                                    number(11,0),
     permission                                number(11,0),
     permission_desc                           varchar2(1000),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_tab_fk
                                               foreign key (project_id,dbid,tblid) references
                                               wwv_mig_acc_tables(project_id,dbid,tblid)
                                               on delete cascade
   );

create or replace trigger wwv_biu_mig_acc_tab_perm
    before insert or update on wwv_mig_acc_tab_perm
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

create index wwv_mig_acc_tab_perm_idx1 on wwv_mig_acc_tab_perm(tblid);

create index wwv_mig_acc_tab_perm_idx2 on wwv_mig_acc_tab_perm(project_id,dbid,tblid);

--------------------------------------------------------------------------
-- Create a table to hold the query details each query will have a foreign
-- key reference to the wwv_mig_access table's dbid.  Thus all 
-- queries pertaining to one access mdb are grouped together
--------------------------------------------------------------------------

create table wwv_mig_acc_queries
(
      id                                       number constraint wwv_mig_acc_tab_qry_pk primary key,
      project_id                               number,
      security_group_id                        number,
      dbid                                     number not null,
      qryid                                    number  not null,
      qrytype                                  varchar2(400),
      qryname                                  varchar2(400),
      qrysql                                   clob,
      datecreated                              date,
      query_lastupdated                        date,
      maxrecords                               number,
      odbctimeout                              number,
      returnsrecords                           varchar2(1000),
      updatable                                varchar2(1000),
      date_created                             date,
      date_modified                            date,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint  wwv_mig_acc_qry_dbid_fk
                                               foreign key (project_id, dbid)
                                               references  wwv_mig_access(project_id, dbid)
                                               on delete cascade,
                                               constraint  wwv_mig_acc_qry_uk1 
                                               unique(project_id, dbid, qryid)
);

create or replace trigger wwv_biu_mig_acc_queries
    before insert or update on wwv_mig_acc_queries
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

create index wwv_mig_acc_qry_idx1 on wwv_mig_acc_queries(dbid);

create index wwv_mig_acc_qry_idx2 on wwv_mig_acc_queries(project_id, dbid);

--------------------------------------------------------------------------
-- Create a table that holds the constraint details so that all details
-- pertaining to one access mdb file are grouped.
--------------------------------------------------------------------------

create table wwv_mig_acc_relations
(
     id                                        number constraint wwv_mig_acc_tab_rel_pk primary key ,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     relid                                     number not null,
     relname                                   varchar2(400),
     parenttblid                               number,
     childtblid                                number,
     isunique                                  number,
     isenforced                                number,
     isinherited                               number,
     isupdatecascade                           number,
     isdeletecascade                           number,
     cnvrelation                               number,
     date_created                              date,
     date_modified                             date,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint  wwv_mig_acc_rel_dbid_fk
                                               foreign key (project_id, dbid) references
                                               wwv_mig_access(project_id, dbid)
                                               on delete cascade,
                                               constraint wwv_mig_acc_relations_uk1
                                               unique (project_id,dbid,relid)
);

create or replace trigger wwv_biu_mig_acc_rel
    before insert or update on wwv_mig_acc_relations
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_rel_idx2  on wwv_mig_acc_relations(dbid);

create index wwv_mig_acc_rel_idx3  on wwv_mig_acc_relations(project_id, dbid);

--------------------------------------------------------------------------
--Create a table to hold the relation column details of each table
--All relation column details pertaining to one relation are commonly 
--grouped by relid. 
--------------------------------------------------------------------------

create table wwv_mig_acc_relation_cols
(
     id                                        number constraint wwv_mig_acc_relcol_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     relcolid                                  number not null,
     relid                                     number,
     parentcolid                               number,
     childcolid                                number,
     relcolname                                varchar2(400),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint  wwv_mig_acc_relcol_fk
                                               foreign key (project_id,dbid,relid) references
                                               wwv_mig_acc_relations(project_id,dbid,relid)
                                               on delete cascade
);

create or replace trigger wwv_biu_mig_acc_rel_col
    before insert or update on wwv_mig_acc_relation_cols
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_accrelcol_idx1  on wwv_mig_acc_relation_cols(relid);

create index wwv_mig_accrelcol_idx2  on wwv_mig_acc_relation_cols(project_id,dbid,relid);

--------------------------------------------------------------------------
-- Create a table to hold the access user details. 
--------------------------------------------------------------------------

create table wwv_mig_acc_users
   (
     id                                        number constraint wwv_mig_acc_users_pk primary key ,
     project_id                                number, 
     security_group_id                         number,
     dbid                                      number not null,
     userid                                    number  not null,
     username                                  varchar2(400),
     date_created                              date,
     date_modified                             date,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_accusrsfk foreign key (project_id,dbid)
                                               references wwv_mig_access (project_id, dbid) on delete cascade,
                                               constraint wwv_mig_acc_users_uk1 
                                               unique (project_id, dbid,userid)
   );


create or replace trigger wwv_biu_mig_acc_users
    before insert or update on wwv_mig_acc_users
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_acc_users_idx1  on wwv_mig_acc_users(dbid);

create index wwv_mig_acc_users_idx2  on wwv_mig_acc_users(project_id, dbid);

--------------------------------------------------------------------------
-- Create a table to hold the access group's details.
--------------------------------------------------------------------------

create table wwv_mig_acc_groups
   (
     id                                        number constraint wwv_mig_acc_groups_pk primary key,
     project_id                                number, 
     security_group_id                         number,
     dbid                                      number not null,
     groupid                                   number  not null,
     grpname                                   varchar2(400),
     date_created                              date,
     date_modified                             date,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_groups_fk foreign key (project_id,dbid)
                                               references wwv_mig_access(project_id, dbid) on delete cascade,
                                               constraint wwv_mig_acc_groups_uk1
                                               unique (project_id, dbid, groupid)
   );

create or replace trigger wwv_biu_mig_acc_groups
    before insert or update on wwv_mig_acc_groups
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

create index wwv_mig_acc_groups_idx1  on wwv_mig_acc_groups(dbid);


--------------------------------------------------------------------------
-- Create a table to hold the access and group permission details and
-- link it to the main access table. The wwv_mig_acc_users and
-- wwv_mig_acc_groups table will have a reference to this table.
--------------------------------------------------------------------------

create table wwv_mig_acc_grpsmembers
   (
     id                                        number constraint wwv_mig_accgrpmbr_pk primary key,
     project_id                                number, 
     security_group_id                         number,
     dbid                                      number not null,
     grpmbrid                                  number not null,
     userid                                    number not null,
     groupid                                   number not null,
     date_created                              date,
     date_modified                             date,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_accgrpsmbr_usr_fk foreign key
                                               (project_id, dbid,userid)
                                               references wwv_mig_acc_users
                                               (project_id, dbid,userid) on delete cascade,
                                               constraint wwv_mig_accgrpsmbr_grp_fk foreign key
                                               (project_id, dbid, groupid)
                                               references wwv_mig_acc_groups
                                               (project_id, dbid, groupid) on delete cascade
   );



create or replace trigger wwv_biu_mig_accgrpsmbrs
    before insert or update on wwv_mig_acc_grpsmembers
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 
create index wwv_mig_accgrpsmbrs_idx1  on wwv_mig_acc_grpsmembers(dbid);

create index wwv_mig_accgrpsmbrs_idx2  on wwv_mig_acc_grpsmembers(project_id, dbid,userid);

create index wwv_mig_accgrpsmbrs_idx3  on wwv_mig_acc_grpsmembers(project_id, dbid, groupid);

--------------------------------------------------------------------------
-- Create a table to hold Modules Details
-- All Modules details of one mdb file have a common dbid reference
--------------------------------------------------------------------------

create table wwv_mig_acc_modules
   (
     id                                        number constraint wwv_mig_acc_modules_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null, 
     moduleid                                  number(11,0) not null,
     modulename                                varchar2(400),
     countofdeclarationlines                   number,
     countoflines                              number,
     lines                                     clob,
     moduletype                                number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_modules foreign key (project_id, dbid)
                                               references  wwv_mig_access(project_id,dbid) on delete cascade,
                                               constraint wwv_mig_acc_modules_uk1
                                               unique(project_id,dbid,moduleid)
   );

create or replace trigger wwv_biu_mig_acc_modules
    before insert or update on wwv_mig_acc_modules
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

create index wwv_mig_acc_rmdl_idx2  on wwv_mig_acc_modules(dbid);

create index wwv_mig_acc_rmdl_idx3  on wwv_mig_acc_modules(project_id,dbid);

create table  wwv_mig_acc_modules_perm
(
     id                                        number constraint wwv_mig_acc_mdl_perm_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     moduleid                                  number(11,0),
     userid                                    number(11,0),
     permissionid                              number(11,0) not null,
     permission                                number(11,0),
     permission_desc                           varchar2(1000),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_acc_mdl_fk
                                               foreign key (project_id,dbid,moduleid)
                                               references wwv_mig_acc_modules(project_id,dbid,moduleid)
                                               on delete cascade
);

create index wwv_mig_acc_mdl_prm_idx1 on wwv_mig_acc_modules_perm(moduleid);

create index wwv_mig_acc_mdl_prm_idx2 on wwv_mig_acc_modules_perm(project_id,dbid,moduleid);

create or replace trigger wwv_biu_mig_acc_mdl_perm
    before insert or update on wwv_mig_acc_modules_perm
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/
 

--------------------------------------------------------------------------
--   This table holds the page related details of the access mdb file 
--------------------------------------------------------------------------


create table  wwv_mig_acc_pages
   (
     id                                        number constraint wwv_mig_acc_page_pk primary key,
     project_id                                number,
     security_group_id                         number,
     dbid                                      number not null,
     pageid                                    number(11,0) not null,
     pagename                                  varchar2(400),
     datecreated                               date,
     datemodified                              date,
     pagetype                                  number,
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint  wwv_mig_acc_page_fk
                                               foreign key (project_id,dbid) references
                                               wwv_mig_access(project_id,dbid)
                                               on delete cascade
   );


create or replace trigger wwv_biu_mig_acc_pages
    before insert or update on wwv_mig_acc_pages
    for each row
begin
    
    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- 
    -- last updated
    -- 
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/


create index wwv_mig_acc_page_idx1 on wwv_mig_acc_pages(dbid);

create index wwv_mig_acc_page_idx2 on wwv_mig_acc_pages(project_id,dbid);


--Review Phase
--The following tables will cater for the "Review Phase"
--The look up table will be 'y' if it is look up table else 'n'
--the 'relation' field' will be 'y' if a relation exists else 'n'
--The status field holds if a table is valid, ignore, not_found etc.,


create table wwv_mig_rev_tables
   (
     id                                        number constraint wwv_flow_rev_tbl_pk primary key,
     project_id				       number,
     dbid				       number,
     tblid                                     number(11) not null,
     security_group_id                         number,
     primarykey_name                           varchar2(400),
     orig_table_name			       varchar2(400),
     mig_table_name			       varchar2(400),
     owner				       varchar2(400),
     status                                    varchar2(400),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_rev_tbl_fk
                                               foreign key (project_id,dbid,tblid) references
                                               wwv_mig_acc_tables(project_id,dbid,tblid) 
                                               on delete cascade                                               
   );

create unique index wwv_mig_rev_tbl_uk1 on wwv_mig_rev_tables(project_id, dbid, tblid);

create or replace trigger wwv_biu_wwv_mig_rev_tables
    before insert or update on  wwv_mig_rev_tables
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;    
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
   
    --    
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/




create table wwv_mig_rev_queries
   (
     id                                        number constraint wwv_flow_rev_qry_pk primary key,
     project_id				       number,
     dbid				       number,
     qryid                                     number(11) not null,
     security_group_id                         number,
     orig_qry_name			       varchar2(400),
     mig_view_name			       varchar2(400),
     orig_sql				       clob,
     mig_sql                                   clob,
     owner				       varchar2(400),
     status                                    varchar2(400),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_rev_qry_fk
                                               foreign key (project_id,dbid,qryid) references
                                               wwv_mig_acc_queries(project_id,dbid,qryid) 
                                               on delete cascade                                               
   );

create unique index wwv_mig_rev_qry_uk1 on wwv_mig_rev_queries(project_id, dbid, qryid);

create or replace trigger wwv_biu_wwv_mig_rev_queries
    before insert or update on  wwv_mig_rev_queries
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;    
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
   
    --    
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/



create table wwv_mig_rev_reports
   (
     id                                        number constraint wwv_flow_rev_rpt_pk primary key,
     project_id				                   number,
     dbid				       number,
     reportid                                     number(11) not null,
     security_group_id                         number,
     report_name	             	       varchar2(400),
     source_name			       varchar2(400),
     source_type			       varchar2(400),
     source_syntax                             varchar2(4000),
     source_status                             varchar2(10),
     owner				       varchar2(400),
     status                                    varchar2(400),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_rev_rpt_fk
                                               foreign key (project_id,dbid,reportid) references
                                               wwv_mig_acc_reports(project_id,dbid,reportid) 
                                               on delete cascade                                               
   );

create unique index wwv_mig_rev_rpt_uk1 on wwv_mig_rev_reports(project_id, dbid, reportid);

create or replace trigger wwv_biu_wwv_mig_rev_reports
    before insert or update on  wwv_mig_rev_reports
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;    
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
   
    --    
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/


create table wwv_mig_rev_forms
   (
     id                                        number constraint wwv_flow_rev_frm_pk primary key,
     project_id				                   number,
     dbid				       number,
     formid                                    number(11) not null,
     parent_formid                             number(11),
     security_group_id                         number,
     form_name	             		       varchar2(400),
     source_name			       varchar2(400),
     source_type			       varchar2(400),
     source_syntax                             varchar2(4000),
     source_status                             varchar2(10),
     owner				       varchar2(400),
     status                                    varchar2(400),
     mig_type                                  varchar2(100),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_rev_frm_fk
                                               foreign key (project_id,dbid,formid) references
                                               wwv_mig_acc_forms(project_id,dbid,formid) 
                                               on delete cascade                                               
   );

create unique index wwv_mig_rev_frm_uk1 on wwv_mig_rev_forms(project_id, dbid, formid);

create or replace trigger wwv_biu_wwv_mig_rev_forms
    before insert or update on  wwv_mig_rev_forms
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;    
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
   
    --    
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/


--
-- wwv_mig_rev_apexapp table to hold APEX generated app information
-- 
create table wwv_mig_rev_apexapp
   (
     id                                        number constraint wwv_flow_rev_apex_pk primary key,
     project_id                                number not null,
     dbid                                      number not null,
     flow_id                                   number(11) not null,
     security_group_id                         number not null,
     page_id				       number not null,
     list_template_name                        varchar2(400),
     list_item_type			       varchar2(100),
     list_item_icon                            varchar2(400),
     owner                                     varchar2(400),
     created_on                                date,
     created_by                                varchar2(400),
     last_updated_on                           date,
     last_updated_by                           varchar2(400),
                                               constraint wwv_mig_rev_apex_fk
                                               foreign key (project_id,dbid) references
                                               wwv_mig_access(project_id,dbid)
                                               on delete cascade
   );

create index wwv_mig_rev_apexapp_idx1 on wwv_mig_rev_apexapp(project_id,dbid);

create or replace trigger wwv_biu_wwv_mig_rev_apex
    before insert or update on  wwv_mig_rev_apexapp
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/


--------------------------------------------------------------------------------
-- Create a table wwv_mig_reserved_words to hold reserved words check for during 
-- object name collision management by Oracle SQL Developer Migration Workbench
--------------------------------------------------------------------------------

CREATE TABLE wwv_mig_reserved_words
(
  KEYWORD VARCHAR2(40) NOT NULL
);

--
-- Populate wwv_mig_reserved_words with reserved words to be checked for
--
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('SHARE');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('LEVEL');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('RAW');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('DROP');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('BETWEEN');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('FROM');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('DESC');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('OPTION');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('PRIOR');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('LONG');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('THEN');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('DEFAULT');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ALTER');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('IS');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('INTO');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('MINUS');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('INTEGER');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('NUMBER');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('GRANT');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('IDENTIFIED');                     
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ALL');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('TO');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ORDER');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ON');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('FLOAT');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('DATE');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('HAVING');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('CLUSTER');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('NOWAIT');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('RESOURCE');                       
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ANY');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('TABLE');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('INDEX');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('FOR');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('UPDATE');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('WHERE');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('CHECK');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('SMALLINT');                       
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('WITH');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('DELETE');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('BY');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ASC');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('REVOKE');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('LIKE');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('SIZE');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('RENAME');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('NOCOMPRESS');                     
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('NULL');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('GROUP');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('VALUES');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('AS');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('IN');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('VIEW');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('EXCLUSIVE');                      
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('COMPRESS');                       
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('SYNONYM');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('SELECT');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('INSERT');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('EXISTS');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('NOT');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('TRIGGER');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ELSE');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('CREATE');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('INTERSECT');                      
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('PCTFREE');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('DISTINCT');                       
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('CONNECT');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('SET');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('MODE');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('OF');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('UNIQUE');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('VARCHAR2');                       
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('VARCHAR');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('LOCK');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('OR');                             
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('CHAR');                           
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('DECIMAL');                        
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('UNION');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('PUBLIC');                         
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('AND');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('START');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('USER');                            
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('VALIDATE');                          
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('COMMENT');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('UID');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('YEAR');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ROWNUM');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('AUDIT');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('ACCESS');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('FILE');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('OFFLINE');
INSERT INTO wwv_mig_reserved_words(KEYWORD) VALUES ('SESSION');
COMMIT;