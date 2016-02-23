Rem  Copyright (c) Oracle Corporation 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ws_install_data.sql
Rem
Rem    DESCRIPTION
Rem      Insert APEX$ lookup table data during APEX installation
Rem
Rem    NOTE
Rem      When adding APEX$ DDL, make sure to add to all of the following tables:
Rem          wwv_flow_ws_tables (Table DDL with constraints)
Rem          wwv_flow_ws_tab_columns (Column information, no DDL)
Rem          wwv_flow_ws_indexes (Index information with DDL)
Rem          wwv_flow_ws_constraints (Constraint information, no DDL)
Rem          wwv_flow_ws_triggerss (Trigger information with trigger body, no DDL)
Rem
Rem    IMPORTANT: If DDL lengh > 4000, DDL cannot exceed 255 chars per line.
Rem               When DDL > 4000, install uses varchar2 255 array to execute DDL.
Rem
Rem
Rem    MODIFIED     (MM/DD/YYYY)
Rem      cbcho       01/29/2010 - Created
Rem      jkallman    02/03/2010 - Modified trigger APEX$_ACL to upper username
Rem      cbcho       02/03/2010 - Added image_attributes column to apex$_ws_files
Rem      cbcho       02/03/2010 - Added image_alias column, unique index on the column to apex$_ws_files
Rem      cbcho       02/03/2010 - Changed apex$_ws_files trigger to auto populate image_alias
Rem      jkallman    02/04/2010 - Added support for apex$_ws_webpg_section_history
Rem      jkallman    02/05/2010 - Include column list in all INSERT statements, add statements for wwv_flow_ws_ind_columns
Rem      cbcho       02/05/2010 - Added ws_app_id column to apex$_ws_webpg_sections,apex$_ws_rows,apex$_ws_history,apex$_ws_webpg_section_history
Rem      cbcho       02/05/2010 - Renamed websheet_id to data_grid_id, changed index to create composite index, changed history tables to insert ws_app_id
Rem      jkallman    02/08/2010 - Added LAST_CONTENT_UPDATE to trigger on apex$_ws_files
Rem      jkallman    02/10/2010 - Revised trigger apex$_ws_webpg_sections_t1 to insert only one row for all changes
Rem      cbcho       02/11/2010 - Changed apex$_ws_rows to populate column name with user defined column label
Rem      cbcho       02/11/2010 - Changed apex$_ws_rows trigger to populate history for all 50 string,number,date columns
Rem      cbcho       02/12/2010 - Changed apex$_ws_rows trigger to initialize column label array to prevent no_data_found error
Rem      cbcho       02/17/2010 - Changed apex$_ws_rows trigger to use local datagrid_logging to insert into history table
Rem      jkallman    02/18/2010 - Added column content_upper to apex$_ws_webpg_sections, modified apex$_ws_webpg_sections_t1
Rem      jkallman    02/23/2010 - Added support for search_clob in apex$_ws_rows_t1
Rem      cbcho       04/09/2010 - Added data_section_style to apex$_ws_webpg_sections
Rem      jkallman    06/01/2010 - Modify mime_type of apex$_ws_files to be varchar2(255)
Rem      cbcho       07/30/2010 - Changed create table statements to create varchar2 columns in byte semantics (bug 9946654)
Rem      cbcho       02/11/2011 - Added PLSQL in apex$_ws_webpg_section_type_ck
Rem      cbcho       06/01/2011 - Added nav_order_by, change_count apex$_ws_webpg_section. Changed apex$_ws_webpg_section trigger to populate change_count. (feature 546, bug 12326441)
Rem      cbcho       06/14/2011 - Changed apex$_ws_webpg_section trigger to do nvl around :old.change_count to 0 (bug 12326441)
Rem      jstraub     10/27/2011 - Wrapped v('APP_USER') with nvl where missing (bug 13261856)
Rem      cneumuel    04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem      cbcho       06/07/2012 - Added show_add_row, show_edit_row, show_search, max_row_count in apex$_ws_webpg_section (feature #900)
Rem      cbcho       04/08/2014 - Added insert to wwv_flow_ws_sequences and changed APEX$_WS_ROWS_T1 trigger ddl to use the seq to populate unique_value (feature #614)
Rem      cbcho       04/09/2014 - Added apex$_ws_rows_uk1 unique constraint (feature #614)

set define '^'
prompt ...Application Express Websheet installation data

prompt
prompt ...insert into wwv_flow_ws_sequences
prompt
delete from wwv_flow_ws_sequences;
insert into wwv_flow_ws_sequences( id,sequence_name,ddl ) values ( 1,'APEX$_WS_SEQ',
'create sequence apex$_ws_seq  minvalue 100 maxvalue 999999999999999999999999999 increment by 1 start with 100 cache 20 noorder nocycle' );

prompt
prompt ...insert into wwv_flow_ws_tables
prompt
delete from wwv_flow_ws_tables;
insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values (1,'APEX$_ACL',10,10,'Y','Y',
     'create table apex$_acl ('||chr(10)||
     'id                      number not null'||chr(10)||
     '                        constraint apex$_acl_pk'||chr(10)||
     '                        primary key,'||chr(10)||
     'ws_app_id               number not null,'||chr(10)||
     'username                varchar2(255 byte) not null,'||chr(10)||
     'priv                    varchar2(1 byte) not null'||chr(10)||
     '                        constraint apex$_acl_priv_ck'||chr(10)||
     '                        check (priv in (''R'',''C'',''A'')),'||chr(10)||
     --
     'created_on              date          not null,'||chr(10)||
     'created_by              varchar2(255 byte) not null,'||chr(10)||
     'updated_on              date,'||chr(10)||
     'updated_by              varchar2(255 byte)'||chr(10)||
     ')');

insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(2,'APEX$_WS_WEBPG_SECTIONS',20,20,'Y','Y',
     'create table apex$_ws_webpg_sections ('||chr(10)||
     'id                      number not null'||chr(10)||
     '                        constraint apex$_ws_webpg_sections_pk'||chr(10)||
     '                        primary key,'||chr(10)||
     'ws_app_id               number not null,'||chr(10)||
     'webpage_id              number,'||chr(10)||
     'display_sequence        number,'||chr(10)||
     'section_type            varchar2(30 byte) not null'||chr(10)||
     '                        constraint apex$_ws_webpg_section_type_ck'||chr(10)||
     '                        check (section_type in (''TEXT'',''DATA'',''CHART'',''NAV_PAGE'',''NAV_SECTION'',''PLSQL'')),'||chr(10)||
     'title                   varchar2(4000 byte),'||chr(10)||
     'content                 clob,'||chr(10)||
     'content_upper           clob,'||chr(10)||
     'nav_start_webpage_id    number,'||chr(10)||
     'nav_max_level           number,'||chr(10)||
     'nav_order_by            varchar2(255 byte),'||chr(10)||
     'nav_include_link        varchar2(1 byte)'||chr(10)||
     '                        constraint apex$_ws_webpg_section_link_ck'||chr(10)||
     '                        check (nav_include_link in (''Y'',''N'')),'||chr(10)||
     --
     'data_grid_id            number,'||chr(10)||
     'report_id               number,'||chr(10)||
     'data_section_style      number,'||chr(10)||
     'show_add_row            varchar2(1 byte) default ''N'' constraint apex$_ws_webpg_section_ar_ck'||chr(10)||
     '                        check (show_add_row in (''Y'',''N'')),'||chr(10)||
     'show_edit_row           varchar2(1 byte) default ''N'' constraint apex$_ws_webpg_section_er_ck'||chr(10)||
     '                        check (show_edit_row in (''Y'',''N'')),'||chr(10)||
     'show_search             varchar2(1 byte) default ''Y'' constraint apex$_ws_webpg_section_ser_ck'||chr(10)||
     '                        check (show_search in (''Y'',''N'')),'||chr(10)||
     'max_row_count           number,'||chr(10)||   
     -- chart section
     'chart_type              varchar2(255 byte),'||chr(10)||
     'chart_3d                varchar2(1 byte)'||chr(10)||
     '                        constraint apex$_ws_webpg_section_3d_ck'||chr(10)||
     '                        check (chart_3d in (''Y'',''N'')),'||chr(10)||
     'chart_label             varchar2(255 byte),'||chr(10)||
     'label_axis_title        varchar2(255 byte),'||chr(10)||
     'chart_value             varchar2(255 byte),'||chr(10)||
     'value_axis_title        varchar2(255 byte),'||chr(10)||
     'chart_aggregate         varchar2(255 byte),'||chr(10)||
     'chart_sorting           varchar2(255 byte),'||chr(10)||
     --
     'change_count            number,'||chr(10)||
     --
     'created_on              date          not null,'||chr(10)||
     'created_by              varchar2(255 byte) not null,'||chr(10)||
     'updated_on              date,'||chr(10)||
     'updated_by              varchar2(255 byte)'||chr(10)||
     ')');

declare
  l_ddl clob;
begin
  l_ddl := 'create table apex$_ws_rows ('||chr(10)||
     '    id                 number    not null'||chr(10)||
     '                       constraint apex$_ws_rows_pk'||chr(10)||
     '                       primary key,'||chr(10)||
     '    ws_app_id          number not null,'||chr(10)||
     '    data_grid_id       number not null,'||chr(10)||
     '    unique_value       varchar2(255 byte),'||chr(10)||
     '    tags               varchar2(4000 byte),'||chr(10)||
     '    parent_row_id      number,'||chr(10)||
     '    owner              varchar2(255 byte),'||chr(10)||
     '    geocode            varchar2(512 byte),'||chr(10)||
     '    load_order         number,'||chr(10)||
     '    change_count       number,'||chr(10)||
     '    created_on         date          not null,'||chr(10)||
     '    created_by         varchar2(255 byte) not null,'||chr(10)||
     '    updated_on         date,'||chr(10)||
     '    updated_by         varchar2(255 byte),'||chr(10)||
     '    c001               varchar2(4000 byte),'||chr(10)||
     '    c002               varchar2(4000 byte),'||chr(10)||
     '    c003               varchar2(4000 byte),'||chr(10)||
     '    c004               varchar2(4000 byte),'||chr(10)||
     '    c005               varchar2(4000 byte),'||chr(10)||
     '    c006               varchar2(4000 byte),'||chr(10)||
     '    c007               varchar2(4000 byte),'||chr(10)||
     '    c008               varchar2(4000 byte),'||chr(10)||
     '    c009               varchar2(4000 byte),'||chr(10)||
     '    c010               varchar2(4000 byte),'||chr(10)||
     '    c011               varchar2(4000 byte),'||chr(10)||
     '    c012               varchar2(4000 byte),'||chr(10)||
     '    c013               varchar2(4000 byte),'||chr(10)||
     '    c014               varchar2(4000 byte),'||chr(10)||
     '    c015               varchar2(4000 byte),'||chr(10)||
     '    c016               varchar2(4000 byte),'||chr(10)||
     '    c017               varchar2(4000 byte),'||chr(10)||
     '    c018               varchar2(4000 byte),'||chr(10)||
     '    c019               varchar2(4000 byte),'||chr(10)||
     '    c020               varchar2(4000 byte),'||chr(10)||
     '    c021               varchar2(4000 byte),'||chr(10)||
     '    c022               varchar2(4000 byte),'||chr(10)||
     '    c023               varchar2(4000 byte),'||chr(10)||
     '    c024               varchar2(4000 byte),'||chr(10)||
     '    c025               varchar2(4000 byte),'||chr(10)||
     '    c026               varchar2(4000 byte),'||chr(10)||
     '    c027               varchar2(4000 byte),'||chr(10)||
     '    c028               varchar2(4000 byte),'||chr(10)||
     '    c029               varchar2(4000 byte),'||chr(10)||
     '    c030               varchar2(4000 byte),'||chr(10)||
     '    c031               varchar2(4000 byte),'||chr(10)||
     '    c032               varchar2(4000 byte),'||chr(10)||
     '    c033               varchar2(4000 byte),'||chr(10)||
     '    c034               varchar2(4000 byte),'||chr(10)||
     '    c035               varchar2(4000 byte),'||chr(10)||
     '    c036               varchar2(4000 byte),'||chr(10)||
     '    c037               varchar2(4000 byte),'||chr(10)||
     '    c038               varchar2(4000 byte),'||chr(10)||
     '    c039               varchar2(4000 byte),'||chr(10)||
     '    c040               varchar2(4000 byte),'||chr(10)||
     '    c041               varchar2(4000 byte),'||chr(10)||
     '    c042               varchar2(4000 byte),'||chr(10)||
     '    c043               varchar2(4000 byte),'||chr(10)||
     '    c044               varchar2(4000 byte),'||chr(10)||
     '    c045               varchar2(4000 byte),'||chr(10)||
     '    c046               varchar2(4000 byte),'||chr(10)||
     '    c047               varchar2(4000 byte),'||chr(10)||
     '    c048               varchar2(4000 byte),'||chr(10)||
     '    c049               varchar2(4000 byte),'||chr(10)||
     '    c050               varchar2(4000 byte),'||chr(10)||
     '    n001               number,'||chr(10)||
     '    n002               number,'||chr(10)||
     '    n003               number,'||chr(10)||
     '    n004               number,'||chr(10)||
     '    n005               number,'||chr(10)||
     '    n006               number,'||chr(10)||
     '    n007               number,'||chr(10)||
     '    n008               number,'||chr(10)||
     '    n009               number,'||chr(10)||
     '    n010               number,'||chr(10)||
     '    n011               number,'||chr(10)||
     '    n012               number,'||chr(10)||
     '    n013               number,'||chr(10)||
     '    n014               number,'||chr(10)||
     '    n015               number,'||chr(10)||
     '    n016               number,'||chr(10)||
     '    n017               number,'||chr(10)||
     '    n018               number,'||chr(10)||
     '    n019               number,'||chr(10)||
     '    n020               number,'||chr(10)||
     '    n021               number,'||chr(10)||
     '    n022               number,'||chr(10)||
     '    n023               number,'||chr(10)||
     '    n024               number,'||chr(10)||
     '    n025               number,'||chr(10)||
     '    n026               number,'||chr(10)||
     '    n027               number,'||chr(10)||
     '    n028               number,'||chr(10)||
     '    n029               number,'||chr(10)||
     '    n030               number,'||chr(10)||
     '    n031               number,'||chr(10)||
     '    n032               number,'||chr(10)||
     '    n033               number,'||chr(10)||
     '    n034               number,'||chr(10)||
     '    n035               number,'||chr(10)||
     '    n036               number,'||chr(10)||
     '    n037               number,'||chr(10)||
     '    n038               number,'||chr(10)||
     '    n039               number,'||chr(10)||
     '    n040               number,'||chr(10)||
     '    n041               number,'||chr(10)||
     '    n042               number,'||chr(10)||
     '    n043               number,'||chr(10)||
     '    n044               number,'||chr(10)||
     '    n045               number,'||chr(10)||
     '    n046               number,'||chr(10)||
     '    n047               number,'||chr(10)||
     '    n048               number,'||chr(10)||
     '    n049               number,'||chr(10)||
     '    n050               number,'||chr(10)||
     '    d001               date,'||chr(10)||
     '    d002               date,'||chr(10)||
     '    d003               date,'||chr(10)||
     '    d004               date,'||chr(10)||
     '    d005               date,'||chr(10)||
     '    d006               date,'||chr(10)||
     '    d007               date,'||chr(10)||
     '    d008               date,'||chr(10)||
     '    d009               date,'||chr(10)||
     '    d010               date,'||chr(10)||
     '    d011               date,'||chr(10)||
     '    d012               date,'||chr(10)||
     '    d013               date,'||chr(10)||
     '    d014               date,'||chr(10)||
     '    d015               date,'||chr(10)||
     '    d016               date,'||chr(10)||
     '    d017               date,'||chr(10)||
     '    d018               date,'||chr(10)||
     '    d019               date,'||chr(10)||
     '    d020               date,'||chr(10)||
     '    d021               date,'||chr(10)||
     '    d022               date,'||chr(10)||
     '    d023               date,'||chr(10)||
     '    d024               date,'||chr(10)||
     '    d025               date,'||chr(10)||
     '    d026               date,'||chr(10)||
     '    d027               date,'||chr(10)||
     '    d028               date,'||chr(10)||
     '    d029               date,'||chr(10)||
     '    d030               date,'||chr(10)||
     '    d031               date,'||chr(10)||
     '    d032               date,'||chr(10)||
     '    d033               date,'||chr(10)||
     '    d034               date,'||chr(10)||
     '    d035               date,'||chr(10)||
     '    d036               date,'||chr(10)||
     '    d037               date,'||chr(10)||
     '    d038               date,'||chr(10)||
     '    d039               date,'||chr(10)||
     '    d040               date,'||chr(10)||
     '    d041               date,'||chr(10)||
     '    d042               date,'||chr(10)||
     '    d043               date,'||chr(10)||
     '    d044               date,'||chr(10)||
     '    d045               date,'||chr(10)||
     '    d046               date,'||chr(10)||
     '    d047               date,'||chr(10)||
     '    d048               date,'||chr(10)||
     '    d049               date,'||chr(10)||
     '    d050               date,'||chr(10)||
     '    clob001            clob,'||chr(10)||
     '    search_clob        clob,'||chr(10)||
     '    constraint apex$_ws_rows_uk1 unique (ws_app_id, data_grid_id, unique_value)'||chr(10)||
     '    )' ||chr(10)||
     '    lob (search_clob) store as (enable storage in row)';

    insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(3,'APEX$_WS_ROWS',30,100,'Y','Y',l_ddl);
end;
/

insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(4,'APEX$_WS_HISTORY',40,40,'N','N',
     'create table apex$_ws_history ('||chr(10)||
     '    row_id              number not null,'||chr(10)||
     '    ws_app_id           number not null,'||chr(10)||
     '    data_grid_id        number not null,'||chr(10)||
     '    column_name         varchar2(255 byte),'||chr(10)||
     '    old_value           varchar2(4000 byte),'||chr(10)||
     '    new_value           varchar2(4000 byte),'||chr(10)||
     '    application_user_id varchar2(255 byte),'||chr(10)||
     '    change_date         date)'||chr(10));

--
-- annotations tables
--
insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(5,'APEX$_WS_NOTES',50,50,'Y','Y',
     'create table apex$_ws_notes ('||chr(10)||
     '    id                  number'||chr(10)||
     '                        constraint apex$_ws_notes_pk'||chr(10)||
     '                        primary key,'||chr(10)||
     '    ws_app_id           number not null,'||chr(10)||
     '    data_grid_id        number,'||chr(10)||
     '    row_id              number'||chr(10)||
     '                        constraint apex$_ws_notes_fk'||chr(10)||
     '                        references apex$_ws_rows(id)'||chr(10)||
     '                        on delete cascade,'||chr(10)||
     '    webpage_id          number,'||chr(10)||
     '    component_level     varchar2(30 byte)'||chr(10)||
     '                        constraint apex$_ws_notes_cl_ck'||chr(10)||
     '                        check (component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')),'||chr(10)||
     '    content             clob,'||chr(10)||
     '    created_on          date          not null,'||chr(10)||
     '    created_by          varchar2(255 byte) not null,'||chr(10)||
     '    updated_on          date,'||chr(10)||
     '    updated_by          varchar2(255 byte))');

insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(6,'APEX$_WS_LINKS',60,60,'Y','Y',
     'create table apex$_ws_links ('||chr(10)||
     '    id                  number'||chr(10)||
     '                        constraint apex$_ws_links_pk'||chr(10)||
     '                        primary key,'||chr(10)||
     '    ws_app_id           number not null,'||chr(10)||
     '    data_grid_id        number,'||chr(10)||
     '    row_id              number'||chr(10)||
     '                        constraint apex$_ws_links_fk'||chr(10)||
     '                        references apex$_ws_rows(id)'||chr(10)||
     '                        on delete cascade,'||chr(10)||
     '    webpage_id          number,'||chr(10)||
     '    component_level     varchar2(30 byte)'||chr(10)||
     '                        constraint apex$_ws_links_cl_ck'||chr(10)||
     '                        check (component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')),'||chr(10)||
     '    tags                varchar2(4000 byte),'||chr(10)||
     '    show_on_homepage    varchar2(1 byte)'||chr(10)||
     '                        constraint apex$_ws_links_sh_ck'||chr(10)||
     '                        check (show_on_homepage in (''Y'',''N'')),'||chr(10)||
     '    link_name           varchar2(255 byte)  not null,'||chr(10)||
     '    url                 varchar2(4000 byte) not null,'||chr(10)||
     '    link_description    varchar2(4000 byte),'||chr(10)||
     '    display_sequence    number,'||chr(10)||
     '    created_on          date          not null,'||chr(10)||
     '    created_by          varchar2(255 byte) not null,'||chr(10)||
     '    updated_on          date,'||chr(10)||
     '    updated_by          varchar2(255 byte))');

insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(7,'APEX$_WS_TAGS',70,70,'Y','Y',
     'create table apex$_ws_tags ('||chr(10)||
     '    id                  number'||chr(10)||
     '                        constraint apex$_ws_tags_pk'||chr(10)||
     '                        primary key,'||chr(10)||
     '    ws_app_id           number not null,'||chr(10)||
     '    data_grid_id        number,'||chr(10)||
     '    row_id              number'||chr(10)||
     '                        constraint apex$_ws_tags_fk'||chr(10)||
     '                        references apex$_ws_rows(id)'||chr(10)||
     '                        on delete cascade,'||chr(10)||
     '    webpage_id          number,'||chr(10)||
     '    component_level     varchar2(30 byte)'||chr(10)||
     '                        constraint apex$_ws_tags_cl_ck'||chr(10)||
     '                        check (component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')),'||chr(10)||
     '    tag                 varchar2(4000 byte),'||chr(10)||
     '    created_on          date          not null,'||chr(10)||
     '    created_by          varchar2(255 byte) not null,'||chr(10)||
     '    updated_on          date,'||chr(10)||
     '    updated_by          varchar2(255 byte))');

insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(8,'APEX$_WS_FILES',80,80,'Y','Y',
     'create table apex$_ws_files ('||chr(10)||
     '    id                  number'||chr(10)||
     '                        constraint apex$_ws_files_pk'||chr(10)||
     '                        primary key,'||chr(10)||
     '    ws_app_id           number not null,'||chr(10)||
     '    data_grid_id        number,'||chr(10)||
     '    row_id              number'||chr(10)||
     '                        constraint apex$_ws_files_fk'||chr(10)||
     '                        references apex$_ws_rows(id)'||chr(10)||
     '                        on delete cascade,'||chr(10)||
     '    webpage_id          number,'||chr(10)||
     '    component_level     varchar2(30 byte)'||chr(10)||
     '                        constraint apex$_ws_files_cl_ck'||chr(10)||
     '                        check (component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')),'||chr(10)||
     '    name                varchar2(255 byte) not null,'||chr(10)||
     '    image_alias         varchar2(255 byte),'||chr(10)||
     '    image_attributes    varchar2(255 byte),'||chr(10)||
     '    content             blob,'||chr(10)||
     '    content_last_update date,'||chr(10)||
     '    mime_type           varchar2(255 byte)  not null,'||chr(10)||
     '    content_charset     varchar2(255 byte),'||chr(10)||
     '    content_filename    varchar2(500 byte),'||chr(10)||
     '    description         varchar2(4000 byte),'||chr(10)||
     '    created_on          date          not null,'||chr(10)||
     '    created_by          varchar2(255 byte) not null,'||chr(10)||
     '    updated_on          date,'||chr(10)||
     '    updated_by          varchar2(255 byte))');


insert into wwv_flow_ws_tables(id,table_name,install_seq,drop_seq,has_triggers,has_constraints,ddl) values(9,'APEX$_WS_WEBPG_SECTION_HISTORY',90,90,'N','N',
     'create table apex$_ws_webpg_section_history ('||chr(10)||
     '    section_id           number not null,'||chr(10)||
     '    ws_app_id            number not null,'||chr(10)||
     '    webpage_id           number not null,'||chr(10)||
     '    old_display_sequence number,'||chr(10)||
     '    new_display_sequence number,'||chr(10)||
     '    old_title            varchar2(4000 byte),'||chr(10)||
     '    new_title            varchar2(4000 byte),'||chr(10)||
     '    old_content          clob,'||chr(10)||
     '    new_content          clob,'||chr(10)||
     '    application_user_id varchar2(255 byte) not null,'||chr(10)||
     '    change_date         date not null)'||chr(10));


prompt
prompt ...insert into wwv_flow_ws_tab_columns
prompt
delete from wwv_flow_ws_tab_columns;

-- APEX$_ACL
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(1,'APEX$_ACL','ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(2,'APEX$_ACL','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(3,'APEX$_ACL','USERNAME','VARCHAR2','255','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(4,'APEX$_ACL','PRIV','VARCHAR2','1','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(5,'APEX$_ACL', 'CREATED_ON','DATE','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(6,'APEX$_ACL','CREATED_BY','VARCHAR2','255','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(7,'APEX$_ACL','UPDATED_ON','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(8,'APEX$_ACL','UPDATED_BY','VARCHAR2','255','Y');

-- APEX$_WS_WEBPG_SECTIONS
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(9,'APEX$_WS_WEBPG_SECTIONS','ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(10,'APEX$_WS_WEBPG_SECTIONS','WEBPAGE_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(11,'APEX$_WS_WEBPG_SECTIONS','DISPLAY_SEQUENCE','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(12,'APEX$_WS_WEBPG_SECTIONS','SECTION_TYPE','VARCHAR2','30','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(13,'APEX$_WS_WEBPG_SECTIONS','TITLE','VARCHAR2','4000','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(14,'APEX$_WS_WEBPG_SECTIONS','CONTENT','CLOB','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(15,'APEX$_WS_WEBPG_SECTIONS','CONTENT_UPPER','CLOB','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(16,'APEX$_WS_WEBPG_SECTIONS','NAV_START_WEBPAGE_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(17,'APEX$_WS_WEBPG_SECTIONS','NAV_MAX_LEVEL','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(18,'APEX$_WS_WEBPG_SECTIONS','NAV_INCLUDE_LINK','VARCHAR2','1','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(19,'APEX$_WS_WEBPG_SECTIONS','DATA_GRID_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(20,'APEX$_WS_WEBPG_SECTIONS','REPORT_ID','NUMBER','','Y');

insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(21,'APEX$_WS_WEBPG_SECTIONS','CHART_TYPE','VARCHAR2','255','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(22,'APEX$_WS_WEBPG_SECTIONS','CHART_3D','VARCHAR2','1','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(23,'APEX$_WS_WEBPG_SECTIONS','CHART_LABEL','VARCHAR2','255','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(24,'APEX$_WS_WEBPG_SECTIONS','LABEL_AXIS_TITLE','VARCHAR2','255','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(25,'APEX$_WS_WEBPG_SECTIONS','CHART_VALUE','VARCHAR2','255','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(26,'APEX$_WS_WEBPG_SECTIONS','VALUE_AXIS_TITLE','VARCHAR2','255','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(27,'APEX$_WS_WEBPG_SECTIONS','CHART_AGGREGATE','VARCHAR2','255','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(28,'APEX$_WS_WEBPG_SECTIONS','CHART_SORTING','VARCHAR2','255','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(29,'APEX$_WS_WEBPG_SECTIONS','CREATED_ON','DATE','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(30,'APEX$_WS_WEBPG_SECTIONS','CREATED_BY','VARCHAR2','255','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(31,'APEX$_WS_WEBPG_SECTIONS','UPDATED_ON','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(32,'APEX$_WS_WEBPG_SECTIONS','UPDATED_BY','VARCHAR2','255','Y');

-- APEX$_WS_ROWS
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(33,'APEX$_WS_ROWS','DATA_GRID_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(34,'APEX$_WS_ROWS','UNIQUE_VALUE','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(35,'APEX$_WS_ROWS','TAGS','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(36,'APEX$_WS_ROWS','PARENT_ROW_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(37,'APEX$_WS_ROWS','OWNER','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(38,'APEX$_WS_ROWS','GEOCODE','VARCHAR2',512,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(39,'APEX$_WS_ROWS','LOAD_ORDER','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(40,'APEX$_WS_ROWS','CHANGE_COUNT','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(41,'APEX$_WS_ROWS','CREATED_ON','DATE','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(42,'APEX$_WS_ROWS','CREATED_BY','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(43,'APEX$_WS_ROWS','UPDATED_ON','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(44,'APEX$_WS_ROWS','UPDATED_BY','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(45,'APEX$_WS_ROWS','C001','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(46,'APEX$_WS_ROWS','C002','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(47,'APEX$_WS_ROWS','C003','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(48,'APEX$_WS_ROWS','C004','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(49,'APEX$_WS_ROWS','C005','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(50,'APEX$_WS_ROWS','C006','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(51,'APEX$_WS_ROWS','C007','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(52,'APEX$_WS_ROWS','C008','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(53,'APEX$_WS_ROWS','C009','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(54,'APEX$_WS_ROWS','C010','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(55,'APEX$_WS_ROWS','C011','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(56,'APEX$_WS_ROWS','C012','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(57,'APEX$_WS_ROWS','C013','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(58,'APEX$_WS_ROWS','C014','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(59,'APEX$_WS_ROWS','C015','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(60,'APEX$_WS_ROWS','C016','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(61,'APEX$_WS_ROWS','C017','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(62,'APEX$_WS_ROWS','C018','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(63,'APEX$_WS_ROWS','C019','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(64,'APEX$_WS_ROWS','C020','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(65,'APEX$_WS_ROWS','C021','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(66,'APEX$_WS_ROWS','C022','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(67,'APEX$_WS_ROWS','C023','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(68,'APEX$_WS_ROWS','C024','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(69,'APEX$_WS_ROWS','C025','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(70,'APEX$_WS_ROWS','C026','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(71,'APEX$_WS_ROWS','C027','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(72,'APEX$_WS_ROWS','C028','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(73,'APEX$_WS_ROWS','C029','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(74,'APEX$_WS_ROWS','C030','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(75,'APEX$_WS_ROWS','C031','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(76,'APEX$_WS_ROWS','C032','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(77,'APEX$_WS_ROWS','C033','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(78,'APEX$_WS_ROWS','C034','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(79,'APEX$_WS_ROWS','C035','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(80,'APEX$_WS_ROWS','C036','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(81,'APEX$_WS_ROWS','C037','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(82,'APEX$_WS_ROWS','C038','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(83,'APEX$_WS_ROWS','C039','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(84,'APEX$_WS_ROWS','C040','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(85,'APEX$_WS_ROWS','C041','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(86,'APEX$_WS_ROWS','C042','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(87,'APEX$_WS_ROWS','C043','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(88,'APEX$_WS_ROWS','C044','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(89,'APEX$_WS_ROWS','C045','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(90,'APEX$_WS_ROWS','C046','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(91,'APEX$_WS_ROWS','C047','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(92,'APEX$_WS_ROWS','C048','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(93,'APEX$_WS_ROWS','C049','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(94,'APEX$_WS_ROWS','C050','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(95,'APEX$_WS_ROWS','N001','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(96,'APEX$_WS_ROWS','N002','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(97,'APEX$_WS_ROWS','N003','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(98,'APEX$_WS_ROWS','N004','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(99,'APEX$_WS_ROWS','N005','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(100,'APEX$_WS_ROWS','N006','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(101,'APEX$_WS_ROWS','N007','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(102,'APEX$_WS_ROWS','N008','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(103,'APEX$_WS_ROWS','N009','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(104,'APEX$_WS_ROWS','N010','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(105,'APEX$_WS_ROWS','N011','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(106,'APEX$_WS_ROWS','N012','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(107,'APEX$_WS_ROWS','N013','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(108,'APEX$_WS_ROWS','N014','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(109,'APEX$_WS_ROWS','N015','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(110,'APEX$_WS_ROWS','N016','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(111,'APEX$_WS_ROWS','N017','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(112,'APEX$_WS_ROWS','N018','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(113,'APEX$_WS_ROWS','N019','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(114,'APEX$_WS_ROWS','N020','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(115,'APEX$_WS_ROWS','N021','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(116,'APEX$_WS_ROWS','N022','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(117,'APEX$_WS_ROWS','N023','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(118,'APEX$_WS_ROWS','N024','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(119,'APEX$_WS_ROWS','N025','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(120,'APEX$_WS_ROWS','N026','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(121,'APEX$_WS_ROWS','N027','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(122,'APEX$_WS_ROWS','N028','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(123,'APEX$_WS_ROWS','N029','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(124,'APEX$_WS_ROWS','N030','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(125,'APEX$_WS_ROWS','N031','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(126,'APEX$_WS_ROWS','N032','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(127,'APEX$_WS_ROWS','N033','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(128,'APEX$_WS_ROWS','N034','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(129,'APEX$_WS_ROWS','N035','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(130,'APEX$_WS_ROWS','N036','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(131,'APEX$_WS_ROWS','N037','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(132,'APEX$_WS_ROWS','N038','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(133,'APEX$_WS_ROWS','N039','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(134,'APEX$_WS_ROWS','N040','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(135,'APEX$_WS_ROWS','N041','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(136,'APEX$_WS_ROWS','N042','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(137,'APEX$_WS_ROWS','N043','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(138,'APEX$_WS_ROWS','N044','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(139,'APEX$_WS_ROWS','N045','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(140,'APEX$_WS_ROWS','N046','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(141,'APEX$_WS_ROWS','N047','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(142,'APEX$_WS_ROWS','N048','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(143,'APEX$_WS_ROWS','N049','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(144,'APEX$_WS_ROWS','N050','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(145,'APEX$_WS_ROWS','D001','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(146,'APEX$_WS_ROWS','D002','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(147,'APEX$_WS_ROWS','D003','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(148,'APEX$_WS_ROWS','D004','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(149,'APEX$_WS_ROWS','D005','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(150,'APEX$_WS_ROWS','D006','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(151,'APEX$_WS_ROWS','D007','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(152,'APEX$_WS_ROWS','D008','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(153,'APEX$_WS_ROWS','D009','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(154,'APEX$_WS_ROWS','D010','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(155,'APEX$_WS_ROWS','D011','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(156,'APEX$_WS_ROWS','D012','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(157,'APEX$_WS_ROWS','D013','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(158,'APEX$_WS_ROWS','D014','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(159,'APEX$_WS_ROWS','D015','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(160,'APEX$_WS_ROWS','D016','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(161,'APEX$_WS_ROWS','D017','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(162,'APEX$_WS_ROWS','D018','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(163,'APEX$_WS_ROWS','D019','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(164,'APEX$_WS_ROWS','D020','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(165,'APEX$_WS_ROWS','D021','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(166,'APEX$_WS_ROWS','D022','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(167,'APEX$_WS_ROWS','D023','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(168,'APEX$_WS_ROWS','D024','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(169,'APEX$_WS_ROWS','D025','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(170,'APEX$_WS_ROWS','D026','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(171,'APEX$_WS_ROWS','D027','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(172,'APEX$_WS_ROWS','D028','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(173,'APEX$_WS_ROWS','D029','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(174,'APEX$_WS_ROWS','D030','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(175,'APEX$_WS_ROWS','D031','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(176,'APEX$_WS_ROWS','D032','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(177,'APEX$_WS_ROWS','D033','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(178,'APEX$_WS_ROWS','D034','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(179,'APEX$_WS_ROWS','D035','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(180,'APEX$_WS_ROWS','D036','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(181,'APEX$_WS_ROWS','D037','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(182,'APEX$_WS_ROWS','D038','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(183,'APEX$_WS_ROWS','D039','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(184,'APEX$_WS_ROWS','D040','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(185,'APEX$_WS_ROWS','D041','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(186,'APEX$_WS_ROWS','D042','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(187,'APEX$_WS_ROWS','D043','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(188,'APEX$_WS_ROWS','D044','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(189,'APEX$_WS_ROWS','D045','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(190,'APEX$_WS_ROWS','D046','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(191,'APEX$_WS_ROWS','D047','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(192,'APEX$_WS_ROWS','D048','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(193,'APEX$_WS_ROWS','D049','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(194,'APEX$_WS_ROWS','D050','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(195,'APEX$_WS_ROWS','CLOB001','CLOB','','Y');

-- APEX$_WS_HISTORY
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(196,'APEX$_WS_HISTORY','ROW_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(197,'APEX$_WS_HISTORY','DATA_GRID_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(198,'APEX$_WS_HISTORY','COLUMN_NAME','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(199,'APEX$_WS_HISTORY','OLD_VALUE','VARCHAR2',4000, 'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(200,'APEX$_WS_HISTORY','NEW_VALUE','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(201,'APEX$_WS_HISTORY','APPLICATION_USER_ID','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(202,'APEX$_WS_HISTORY','CHANGE_DATE','DATE','','Y');

-- APEX$_WS_NOTES
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(203,'APEX$_WS_NOTES','ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(204,'APEX$_WS_NOTES','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(205,'APEX$_WS_NOTES','DATA_GRID_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(206,'APEX$_WS_NOTES','ROW_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(207,'APEX$_WS_NOTES','WEBPAGE_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(208,'APEX$_WS_NOTES','COMPONENT_LEVEL','VARCHAR2',30,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(209,'APEX$_WS_NOTES','CONTENT','CLOB','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(210,'APEX$_WS_NOTES','CREATED_ON','DATE','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(211,'APEX$_WS_NOTES','CREATED_BY','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(212,'APEX$_WS_NOTES','UPDATED_ON','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(213,'APEX$_WS_NOTES','UPDATED_BY','VARCHAR2',255,'Y');

-- APEX$_WS_LINKS
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(214,'APEX$_WS_LINKS','ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(215,'APEX$_WS_LINKS','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(216,'APEX$_WS_LINKS','DATA_GRID_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(217,'APEX$_WS_LINKS','ROW_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(218,'APEX$_WS_LINKS','WEBPAGE_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(219,'APEX$_WS_LINKS','COMPONENT_LEVEL','VARCHAR2',30,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(220,'APEX$_WS_LINKS','TAGS','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(221,'APEX$_WS_LINKS','SHOW_ON_HOMEPAGE','VARCHAR2',1,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(222,'APEX$_WS_LINKS','LINK_NAME','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(223,'APEX$_WS_LINKS','URL','VARCHAR2',4000,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(224,'APEX$_WS_LINKS','LINK_DESCRIPTION','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(225,'APEX$_WS_LINKS','DISPLAY_SEQUENCE','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(226,'APEX$_WS_LINKS','CREATED_ON','DATE','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(227,'APEX$_WS_LINKS','CREATED_BY','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(228,'APEX$_WS_LINKS','UPDATED_ON','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(229,'APEX$_WS_LINKS','UPDATED_BY','VARCHAR2',255,'Y');

--APEX$_WS_TAGS
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(230,'APEX$_WS_TAGS','ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(231,'APEX$_WS_TAGS','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(232,'APEX$_WS_TAGS','DATA_GRID_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(233,'APEX$_WS_TAGS','ROW_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(234,'APEX$_WS_TAGS','WEBPAGE_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(235,'APEX$_WS_TAGS','COMPONENT_LEVEL','VARCHAR2',30,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(236,'APEX$_WS_TAGS','TAG','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(237,'APEX$_WS_TAGS','CREATED_ON','DATE','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(238,'APEX$_WS_TAGS','CREATED_BY','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(239,'APEX$_WS_TAGS','UPDATED_ON','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(240,'APEX$_WS_TAGS','UPDATED_BY','VARCHAR2',255,'Y');

-- APEX$_WS_FILES
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(241,'APEX$_WS_FILES','ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(242,'APEX$_WS_FILES','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(243,'APEX$_WS_FILES','DATA_GRID_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(244,'APEX$_WS_FILES','ROW_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(245,'APEX$_WS_FILES','WEBPAGE_ID','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(246,'APEX$_WS_FILES','COMPONENT_LEVEL','VARCHAR2',30,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(247,'APEX$_WS_FILES','NAME','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(248,'APEX$_WS_FILES','CONTENT','BLOB','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(249,'APEX$_WS_FILES','CONTENT_LAST_UPDATE','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(250,'APEX$_WS_FILES','MIME_TYPE','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(251,'APEX$_WS_FILES','CONTENT_CHARSET','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(252,'APEX$_WS_FILES','CONTENT_FILENAME','VARCHAR2',500,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(253,'APEX$_WS_FILES','DESCRIPTION','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(254,'APEX$_WS_FILES','CREATED_ON','DATE','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(255,'APEX$_WS_FILES','CREATED_BY','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(256,'APEX$_WS_FILES','UPDATED_ON','DATE','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(257,'APEX$_WS_FILES','UPDATED_BY','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(258,'APEX$_WS_FILES','IMAGE_ALIAS','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(259,'APEX$_WS_FILES','IMAGE_ATTRIBUTES','VARCHAR2',255,'Y');

-- APEX$_WS_WEBPG_SECTION_HISTORY
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(260,'APEX$_WS_WEBPG_SECTION_HISTORY','SECTION_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(261,'APEX$_WS_WEBPG_SECTION_HISTORY','WEBPAGE_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(262,'APEX$_WS_WEBPG_SECTION_HISTORY','OLD_DISPLAY_SEQUENCE','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(263,'APEX$_WS_WEBPG_SECTION_HISTORY','NEW_DISPLAY_SEQUENCE','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(264,'APEX$_WS_WEBPG_SECTION_HISTORY','OLD_TITLE','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(265,'APEX$_WS_WEBPG_SECTION_HISTORY','NEW_TITLE','VARCHAR2',4000,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(266,'APEX$_WS_WEBPG_SECTION_HISTORY','OLD_CONTENT','CLOB','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(267,'APEX$_WS_WEBPG_SECTION_HISTORY','NEW_CONTENT','CLOB','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(268,'APEX$_WS_WEBPG_SECTION_HISTORY','APPLICATION_USER_ID','VARCHAR2',255,'N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(269,'APEX$_WS_WEBPG_SECTION_HISTORY','CHANGE_DATE','DATE','','N');

-- addtional columns to add
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(270,'APEX$_WS_WEBPG_SECTIONS','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(271,'APEX$_WS_ROWS','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(272,'APEX$_WS_HISTORY','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(273,'APEX$_WS_WEBPG_SECTION_HISTORY','WS_APP_ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(274,'APEX$_WS_ROWS','ID','NUMBER','','N');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(275,'APEX$_WS_ROWS','SEARCH_CLOB','CLOB','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(276,'APEX$_WS_WEBPG_SECTIONS','DATA_SECTION_STYLE','NUMBER','','Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(277,'APEX$_WS_WEBPG_SECTIONS','NAV_ORDER_BY','VARCHAR2',255,'Y');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(278,'APEX$_WS_WEBPG_SECTIONS','CHANGE_COUNT','NUMBER','','Y');
-- additional columns added in 4.2
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable,data_default ) values(279,'APEX$_WS_WEBPG_SECTIONS','SHOW_ADD_ROW','VARCHAR2',1,'Y','''N''');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable,data_default ) values(280,'APEX$_WS_WEBPG_SECTIONS','SHOW_EDIT_ROW','VARCHAR2',1,'Y','''N''');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable,data_default ) values(281,'APEX$_WS_WEBPG_SECTIONS','SHOW_SEARCH','VARCHAR2',1,'Y','''Y''');
insert into wwv_flow_ws_tab_columns( id,table_name,column_name,data_type,data_length,nullable ) values(282,'APEX$_WS_WEBPG_SECTIONS','MAX_ROW_COUNT','NUMBER','','Y');

prompt
prompt ...insert into wwv_flow_ws_indexes
prompt
delete from wwv_flow_ws_indexes;
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(1,'APEX$_ACL','APEX$_ACL_IDX1',
    'create index apex$_acl_idx1 on apex$_acl(ws_app_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(2,'APEX$_WS_ROWS','APEX$_WS_ROWS_IDX',
    'create index apex$_ws_rows_idx on apex$_ws_rows(ws_app_id,data_grid_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(3,'APEX$_WS_HISTORY','APEX$_WS_HISTORY_IDX',
     'create index apex$_ws_history_idx on apex$_ws_history (ws_app_id,data_grid_id,row_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(4,'APEX$_WS_NOTES','APEX$_WS_NOTES_IDX1',
    'create index apex$_ws_notes_idx1 on apex$_ws_notes(ws_app_id,data_grid_id,row_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(5,'APEX$_WS_NOTES','APEX$_WS_NOTES_IDX2',
    'create index apex$_ws_notes_idx2 on apex$_ws_notes(ws_app_id,webpage_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(7,'APEX$_WS_LINKS','APEX$_WS_LINKS_IDX1',
    'create index apex$_ws_links_idx1 on apex$_ws_links (ws_app_id,data_grid_id,row_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(8,'APEX$_WS_LINKS','APEX$_WS_LINKS_IDX2',
    'create index apex$_ws_links_idx2 on apex$_ws_links (ws_app_id,webpage_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(10,'APEX$_WS_TAGS','APEX$_WS_TAGS_IDX1',
    'create index apex$_ws_tags_idx1 on apex$_ws_tags (ws_app_id,data_grid_id,row_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(11,'APEX$_WS_TAGS','APEX$_WS_TAGS_IDX2',
    'create index apex$_ws_tags_idx2 on apex$_ws_tags (ws_app_id,webpage_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(13,'APEX$_WS_FILES','APEX$_WS_FILES_IDX1',
    'create index apex$_ws_files_idx1 on apex$_ws_files (ws_app_id,data_grid_id,row_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(14,'APEX$_WS_FILES','APEX$_WS_FILES_IDX2',
    'create index apex$_ws_files_idx2 on apex$_ws_files (ws_app_id,webpage_id)');
insert into wwv_flow_ws_indexes( id,table_name,index_name,ddl )  values(16,'APEX$_WS_WEBPG_SECTION_HISTORY','APEX$_WS_WEBPG_SECHIST_IDX1',
    'create index apex$_ws_webpg_sechist_idx1 on apex$_ws_webpg_section_history (ws_app_id,webpage_id,section_id)');



prompt
prompt ...insert into wwv_flow_ws_ind_columns
prompt
delete from wwv_flow_ws_ind_columns;
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(1,'APEX$_ACL_IDX1','APEX$_ACL','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(2,'APEX$_WS_FILES_IDX1','APEX$_WS_FILES','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(3,'APEX$_WS_FILES_IDX1','APEX$_WS_FILES','DATA_GRID_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(4,'APEX$_WS_FILES_IDX1','APEX$_WS_FILES','ROW_ID',3);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(5,'APEX$_WS_FILES_IDX2','APEX$_WS_FILES','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(6,'APEX$_WS_FILES_IDX2','APEX$_WS_FILES','WEBPAGE_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(7,'APEX$_WS_HISTORY_IDX','APEX$_WS_HISTORY','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(8,'APEX$_WS_HISTORY_IDX','APEX$_WS_HISTORY','DATA_GRID_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(9,'APEX$_WS_HISTORY_IDX','APEX$_WS_HISTORY','ROW_ID',3);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(10,'APEX$_WS_LINKS_IDX1','APEX$_WS_LINKS','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(11,'APEX$_WS_LINKS_IDX1','APEX$_WS_LINKS','DATA_GRID_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(12,'APEX$_WS_LINKS_IDX1','APEX$_WS_LINKS','ROW_ID',3);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(13,'APEX$_WS_LINKS_IDX2','APEX$_WS_LINKS','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(14,'APEX$_WS_LINKS_IDX2','APEX$_WS_LINKS','WEBPAGE_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(15,'APEX$_WS_NOTES_IDX1','APEX$_WS_NOTES','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(16,'APEX$_WS_NOTES_IDX1','APEX$_WS_NOTES','DATA_GRID_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(17,'APEX$_WS_NOTES_IDX1','APEX$_WS_NOTES','ROW_ID',3);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(18,'APEX$_WS_NOTES_IDX2','APEX$_WS_NOTES','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(19,'APEX$_WS_NOTES_IDX2','APEX$_WS_NOTES','WEBPAGE_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(20,'APEX$_WS_ROWS_IDX','APEX$_WS_ROWS','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(21,'APEX$_WS_ROWS_IDX','APEX$_WS_ROWS','DATA_GRID_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(22,'APEX$_WS_TAGS_IDX1','APEX$_WS_TAGS','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(23,'APEX$_WS_TAGS_IDX1','APEX$_WS_TAGS','DATA_GRID_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(24,'APEX$_WS_TAGS_IDX1','APEX$_WS_TAGS','ROW_ID',3);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(25,'APEX$_WS_TAGS_IDX2','APEX$_WS_TAGS','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(26,'APEX$_WS_TAGS_IDX2','APEX$_WS_TAGS','WEBPAGE_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(27,'APEX$_WS_WEBPG_SECHIST_IDX1','APEX$_WS_WEBPG_SECTION_HISTORY','WS_APP_ID',1);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(28,'APEX$_WS_WEBPG_SECHIST_IDX1','APEX$_WS_WEBPG_SECTION_HISTORY','WEBPAGE_ID',2);
insert into wwv_flow_ws_ind_columns(id,index_name,table_name,column_name,column_position)
    values(29,'APEX$_WS_WEBPG_SECHIST_IDX1','APEX$_WS_WEBPG_SECTION_HISTORY','SECTION_ID',3);

prompt
prompt ...insert into wwv_flow_ws_constraints
prompt
delete from wwv_flow_ws_constraints;
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(1,'APEX$_ACL','APEX$_ACL_PK','P','ID',null,null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(2,'APEX$_ACL','APEX$_ACL_PRIV_CK','C','PRIV','priv in (''R'',''C'',''A'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(3,'APEX$_WS_WEBPG_SECTIONS','APEX$_WS_WEBPG_SECTIONS_PK','P','ID',null,null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(4,'APEX$_WS_WEBPG_SECTIONS','APEX$_WS_WEBPG_SECTION_TYPE_CK','C','SECTION_TYPE','section_type in (''TEXT'',''DATA'',''CHART'',''NAV_PAGE'',''NAV_SECTION'',''PLSQL'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(5,'APEX$_WS_WEBPG_SECTIONS','APEX$_WS_WEBPG_SECTION_LINK_CK','C','NAV_INCLUDE_LINK','nav_include_link in (''Y'',''N'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(6,'APEX$_WS_WEBPG_SECTIONS','APEX$_WS_WEBPG_SECTION_3D_CK','C','CHART_3D','chart_3d in (''Y'',''N'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(7,'APEX$_WS_ROWS','APEX$_WS_ROWS_PK','P','ID',null,null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(8,'APEX$_WS_NOTES','APEX$_WS_NOTES_PK','P','ID',null,null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(9,'APEX$_WS_NOTES','APEX$_WS_NOTES_FK','R','ROW_ID',null,'APEX$_WS_ROWS','ID','CASCADE');
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(10,'APEX$_WS_NOTES','APEX$_WS_NOTES_CL_CK','C','COMPONENT_LEVEL','component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(11,'APEX$_WS_LINKS','APEX$_WS_LINKS_PK','P','ID',null,null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(12,'APEX$_WS_LINKS','APEX$_WS_LINKS_FK','R','ROW_ID',null,'APEX$_WS_ROWS','ID','CASCADE');
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(13,'APEX$_WS_LINKS','APEX$_WS_LINKS_CL_CK','C','COMPONENT_LEVEL','component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(14,'APEX$_WS_LINKS','APEX$_WS_LINKS_SH_CK','C','SHOW_ON_HOMEPAGE','show_on_homepage in (''Y'',''N'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(15,'APEX$_WS_TAGS','APEX$_WS_TAGS_PK','P','ID',null,null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(16,'APEX$_WS_TAGS','APEX$_WS_TAGS_FK','R','ROW_ID',null,'APEX$_WS_ROWS','ID','CASCADE');
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(17,'APEX$_WS_TAGS','APEX$_WS_TAGS_CL_CK','C','COMPONENT_LEVEL','component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(18,'APEX$_WS_FILES','APEX$_WS_FILES_PK','P','ID',null,null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(19,'APEX$_WS_FILES','APEX$_WS_FILES_FK','R','ROW_ID',null,'APEX$_WS_ROWS','ID','CASCADE');
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(20,'APEX$_WS_FILES','APEX$_WS_FILES_CL_CK','C','COMPONENT_LEVEL','component_level in (''WEBSHEET'',''ROW'',''WORKSPACE'',''WEBPAGE'')',null,null,null);
-- new constraint added in 4.2
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(21,'APEX$_WS_WEBPG_SECTIONS','APEX$_WS_WEBPG_SECTION_AR_CK','C','SHOW_ADD_ROW','show_add_row in (''Y'',''N'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(22,'APEX$_WS_WEBPG_SECTIONS','APEX$_WS_WEBPG_SECTION_ER_CK','C','SHOW_EDIT_ROW','show_edit_row in (''Y'',''N'')',null,null,null);
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(23,'APEX$_WS_WEBPG_SECTIONS','APEX$_WS_WEBPG_SECTION_SER_CK','C','SHOW_SEARCH','show_search in (''Y'',''N'')',null,null,null);
-- new constraint added in 5.0
insert into wwv_flow_ws_constraints( id,table_name,constraint_name,constraint_type,column_name,search_condition,r_table_name,r_column_name,delete_rule ) values(24,'APEX$_WS_ROWS','APEX$_WS_ROWS_UK1','U','WS_APP_ID, DATA_GRID_ID, UNIQUE_VALUE',null,null,null,null);

prompt
prompt ...insert into wwv_flow_ws_triggers
prompt
delete from wwv_flow_ws_triggers;
insert into wwv_flow_ws_triggers( id,trigger_name,trigger_type,triggering_event,table_name,trigger_body) values(1,'APEX$_ACL_T1','BEFORE EACH ROW','INSERT OR UPDATE','APEX$_ACL',
    'begin'||chr(10)||
    '    --'||chr(10)||
    '    -- maintain pk and timestamps'||chr(10)||
    '    --'||chr(10)||
    '    :new.username := upper(:new.username);'||chr(10)||
    '    if inserting and :new.id is null then'||chr(10)||
    '        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from sys.dual;'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting then'||chr(10)||
    '        :new.created_on := sysdate;'||chr(10)||
    '        :new.created_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    end if;'||chr(10)||
    'end;');
insert into wwv_flow_ws_triggers( id,trigger_name,trigger_type,triggering_event,table_name,trigger_body) values(2,'APEX$_WS_WEBPG_SECTIONS_T1','BEFORE EACH ROW','INSERT OR UPDATE','APEX$_WS_WEBPG_SECTIONS',
    'declare'||chr(10)||
    '    l_sequence_changed varchar2(1) := ''N'';'||chr(10)||
    '    l_title_changed varchar2(1) := ''N'';'||chr(10)||
    '    l_content_changed varchar2(1) := ''N'';'||chr(10)||
    '    procedure clob_upper( p_content in clob, p_content_upper in out nocopy clob)'||chr(10)||
    '    is'||chr(10)||
    '    l_buf varchar2(32767);'||chr(10)||
    '    l_off number;'||chr(10)||
    '    l_amt number;'||chr(10)||
    '    begin'||chr(10)||
    '    if p_content is not null then'||chr(10)||
    '        l_amt := 8000;'||chr(10)||
    '        l_off := 1;'||chr(10)||
    '         sys.dbms_lob.trim( p_content_upper, 0);'||chr(10)||
    '         begin'||chr(10)||
    '             loop'||chr(10)||
    '                 sys.dbms_lob.read( p_content, l_amt, l_off, l_buf );'||chr(10)||
    '                 l_buf := upper( l_buf );'||chr(10)||
    '                 sys.dbms_lob.writeappend( p_content_upper, length(l_buf), l_buf);'||chr(10)||
    '                 l_off := l_off + l_amt;'||chr(10)||
    '                 l_amt := 8000;'||chr(10)||
    '             end loop;'||chr(10)||
    '         exception'||chr(10)||
    '             when no_data_found then null;'||chr(10)||
    '         end;'||chr(10)||
    '     end if;'||chr(10)||
    'end clob_upper;'||chr(10)||
    'begin'||chr(10)||
    '    --'||chr(10)||
    '    -- maintain pk and timestamps'||chr(10)||
    '    --'||chr(10)||
    '    if inserting and :new.id is null then'||chr(10)||
    '        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from sys.dual;'||chr(10)||
    '    end if;'||chr(10)||
    '    if :new.section_type = ''NAV_PAGE'' then'||chr(10)||
    '        if :new.nav_include_link is null then'||chr(10)||
    '            :new.nav_include_link := ''Y'';'||chr(10)||
    '        end if;'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting and :new.content is not null then'||chr(10)||
    '        sys.dbms_lob.createtemporary( :new.content_upper, false, sys.dbms_lob.call );'||chr(10)||
    '        clob_upper( :new.content, :new.content_upper );'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        if :new.content_upper is null then'||chr(10)||
    '            sys.dbms_lob.createtemporary( :new.content_upper, false, sys.dbms_lob.call );'||chr(10)||
    '        end if;'||chr(10)||
    '        clob_upper( :new.content, :new.content_upper );'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting then'||chr(10)||
    '        :new.created_on := sysdate;'||chr(10)||
    '        :new.created_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.change_count := 0;'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.change_count := nvl(:old.change_count,0) + 1;'||chr(10)||
    '        if nvl(:old.display_sequence,-999) != nvl(:new.display_sequence,-999) then'||chr(10)||
    '            l_sequence_changed := ''Y'';'||chr(10)||
    '        end if;'||chr(10)||
    '        if nvl(:old.title,''jKKwZk'') != nvl(:new.title,''jKKwZk'') then'||chr(10)||
    '            l_title_changed := ''Y'';'||chr(10)||
    '        end if;'||chr(10)||
    '        if sys.dbms_lob.compare(:new.content,:old.content) != 0 or nvl(length(:new.content),0) != nvl(length(:old.content),0) then'||chr(10)||
    '            l_content_changed := ''Y'';'||chr(10)||
    '        end if;'||chr(10)||
    '        if l_sequence_changed = ''Y'' or l_title_changed = ''Y'' or l_content_changed = ''Y'' then'||chr(10)||
    '            insert into apex$_ws_webpg_section_history (section_id, ws_app_id, webpage_id, old_display_sequence, new_display_sequence,'||chr(10)||
    '            old_title, new_title, old_content, new_content, change_date, application_user_id)'||chr(10)||
    '            values (:new.id, :new.ws_app_id, :new.webpage_id,'||chr(10)||
    '                    decode(l_sequence_changed,''Y'',:old.display_sequence,null), decode(l_sequence_changed,''Y'',:new.display_sequence,null),'||chr(10)||
    '                    decode(l_title_changed,''Y'',:old.title,null), decode(l_title_changed,''Y'',:new.title,null),'||chr(10)||
    '                    decode(l_content_changed,''Y'',:old.content,null), decode(l_content_changed,''Y'',:new.content,null), sysdate, nvl(v(''APP_USER''),user));'||chr(10)||
    '        end if;'||chr(10)||
    '    end if;'||chr(10)||
    'end;');



declare
    l_ddl clob;
begin
    l_ddl :=  'declare'||chr(10)||
    '    l_tag_list apex_application_global.vc_arr2;'||chr(10)||
    '    type col_arr is table of varchar2(32767) index by varchar2(255);'||chr(10)||
    '    la_col_label col_arr;'||chr(10)||
    '    procedure datagrid_logging( '||chr(10)||
    '        p_row_id       in number,'||chr(10)||
    '        p_ws_app_id    in number,'||chr(10)||
    '        p_data_grid_id in number,'||chr(10)||
    '        p_col_name     in varchar2,'||chr(10)||
    '        p_type         in varchar2,'||chr(10)||
    '        p_old_c        in varchar2 default null,'||chr(10)||
    '        p_new_c        in varchar2 default null,'||chr(10)||
    '        p_old_d        in date default null,'||chr(10)||
    '        p_new_d        in date default null,'||chr(10)||
    '        p_old_n        in number default null,'||chr(10)||
    '        p_new_n        in number default null)'||chr(10)||
    '    is'||chr(10)||
    '    begin'||chr(10)||
    '        case p_type'||chr(10)||
    '        when ''C'' then'||chr(10)||
    '          if (p_old_c is null and p_new_c is not null) or (p_old_c is not null and p_new_c is null) or (p_old_c != p_new_c) then'||chr(10)||
    '              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value, new_value, change_date, application_user_id)'||chr(10)||
    '              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_c, p_new_c, sysdate, nvl(v(''APP_USER''),user));'||chr(10)||
    '          end if;'||chr(10)||
    '        when ''D'' then'||chr(10)||
    '          if (p_old_d is null and p_new_d is not null) or (p_old_d is not null and p_new_d is null) or (p_old_d != p_new_d) then'||chr(10)||
    '              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value,  new_value, change_date, application_user_id)'||chr(10)||
    '              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_d, p_new_d, sysdate, nvl(v(''APP_USER''),user));'||chr(10)||
    '        	  end if;'||chr(10)||
    '        when ''N'' then'||chr(10)||
    '          if (p_old_n is null and p_new_n is not null) or (p_old_n is not null and p_new_n is null) or (p_old_n != p_new_n) then'||chr(10)||
    '              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value,  new_value, change_date, application_user_id)'||chr(10)||
    '              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_n, p_new_n, sysdate, nvl(v(''APP_USER''),user));'||chr(10)||
    '          end if;'||chr(10)||
    '        end case;'||chr(10)||
    '    end datagrid_logging;'||chr(10)||
    '    procedure wa( p_c in out nocopy clob, p_buf in varchar2 )'||chr(10)||
    '    is'||chr(10)||
    '    l_lf varchar2(2) := unistr(''\000a'');'||chr(10)||
    '    begin'||chr(10)||
    '    if p_buf is not null then sys.dbms_lob.writeappend( p_c, length(p_buf||l_lf), upper(p_buf)||l_lf); end if;'||chr(10)||
    '    end wa;'||chr(10)||
    'begin'||chr(10)||
    '    --'||chr(10)||
    '    -- maintain pk and timestamps'||chr(10)||
    '    --'||chr(10)||
    '    if inserting then'||chr(10)||
    '        if :new.id is null then'||chr(10)||
    '            select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from sys.dual;'||chr(10)||
    '        end if;'||chr(10)||
    '        '||chr(10)||
    '        -- manintain readable row key'||chr(10)||
    '        if :new.unique_value is null then'||chr(10)||
    '            :new.unique_value := apex_util.compress_int(apex$_ws_seq.nextval);'||chr(10)||
    '        end if;'||chr(10)||
    '        '||chr(10)||
    '        :new.created_on := sysdate;'||chr(10)||
    '        :new.created_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.load_order from sys.dual;'||chr(10)||
    '        :new.change_count := 0;'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.change_count := :old.change_count + 1;'||chr(10)||
    '    end if;'||chr(10)||
    '    --'||chr(10)||
    '    -- inserting remove chr 13'||chr(10)||
    '    --'||chr(10)||
    '    if instr(:new.c001,chr(13)) > 0 then :new.c001 := replace(:new.c001,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c002,chr(13)) > 0 then :new.c002 := replace(:new.c002,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c003,chr(13)) > 0 then :new.c003 := replace(:new.c003,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c004,chr(13)) > 0 then :new.c004 := replace(:new.c004,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c005,chr(13)) > 0 then :new.c005 := replace(:new.c005,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c006,chr(13)) > 0 then :new.c006 := replace(:new.c006,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c007,chr(13)) > 0 then :new.c007 := replace(:new.c007,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c008,chr(13)) > 0 then :new.c008 := replace(:new.c008,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c009,chr(13)) > 0 then :new.c009 := replace(:new.c009,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c010,chr(13)) > 0 then :new.c010 := replace(:new.c010,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c011,chr(13)) > 0 then :new.c011 := replace(:new.c011,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c012,chr(13)) > 0 then :new.c012 := replace(:new.c012,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c013,chr(13)) > 0 then :new.c013 := replace(:new.c013,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c014,chr(13)) > 0 then :new.c014 := replace(:new.c014,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c015,chr(13)) > 0 then :new.c015 := replace(:new.c015,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c016,chr(13)) > 0 then :new.c016 := replace(:new.c016,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c017,chr(13)) > 0 then :new.c017 := replace(:new.c017,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c018,chr(13)) > 0 then :new.c018 := replace(:new.c018,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c019,chr(13)) > 0 then :new.c019 := replace(:new.c019,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c020,chr(13)) > 0 then :new.c020 := replace(:new.c010,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c021,chr(13)) > 0 then :new.c021 := replace(:new.c001,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c022,chr(13)) > 0 then :new.c022 := replace(:new.c002,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c023,chr(13)) > 0 then :new.c023 := replace(:new.c003,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c024,chr(13)) > 0 then :new.c024 := replace(:new.c004,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c025,chr(13)) > 0 then :new.c025 := replace(:new.c005,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c026,chr(13)) > 0 then :new.c026 := replace(:new.c006,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c027,chr(13)) > 0 then :new.c027 := replace(:new.c007,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c028,chr(13)) > 0 then :new.c028 := replace(:new.c008,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c029,chr(13)) > 0 then :new.c029 := replace(:new.c009,chr(23),null); end if;'||chr(10)||
    '    if instr(:new.c030,chr(13)) > 0 then :new.c030 := replace(:new.c030,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c031,chr(13)) > 0 then :new.c031 := replace(:new.c031,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c032,chr(13)) > 0 then :new.c032 := replace(:new.c032,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c033,chr(13)) > 0 then :new.c033 := replace(:new.c033,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c034,chr(13)) > 0 then :new.c034 := replace(:new.c034,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c035,chr(13)) > 0 then :new.c035 := replace(:new.c035,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c036,chr(13)) > 0 then :new.c036 := replace(:new.c036,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c037,chr(13)) > 0 then :new.c037 := replace(:new.c037,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c038,chr(13)) > 0 then :new.c038 := replace(:new.c038,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c039,chr(13)) > 0 then :new.c039 := replace(:new.c039,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c040,chr(13)) > 0 then :new.c040 := replace(:new.c040,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c041,chr(13)) > 0 then :new.c041 := replace(:new.c041,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c042,chr(13)) > 0 then :new.c042 := replace(:new.c042,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c043,chr(13)) > 0 then :new.c043 := replace(:new.c043,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c044,chr(13)) > 0 then :new.c044 := replace(:new.c044,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c045,chr(13)) > 0 then :new.c045 := replace(:new.c045,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c046,chr(13)) > 0 then :new.c046 := replace(:new.c046,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c047,chr(13)) > 0 then :new.c047 := replace(:new.c047,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c048,chr(13)) > 0 then :new.c048 := replace(:new.c048,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c049,chr(13)) > 0 then :new.c049 := replace(:new.c049,chr(13),null); end if;'||chr(10)||
    '    if instr(:new.c050,chr(13)) > 0 then :new.c050 := replace(:new.c050,chr(13),null); end if;'||chr(10)||
    '    if :new.search_clob is null then'||chr(10)||
    '        sys.dbms_lob.createtemporary( :new.search_clob, false, sys.dbms_lob.session );'||chr(10)||
    '    else'||chr(10)||
    '        sys.dbms_lob.trim( :new.search_clob, 0 );'||chr(10)||
    '    end if;'||chr(10)||
    '    wa(:new.search_clob,:new.c001);wa(:new.search_clob,:new.c002);wa(:new.search_clob,:new.c003);'||chr(10)||
    '    wa(:new.search_clob,:new.c004);wa(:new.search_clob,:new.c005);wa(:new.search_clob,:new.c006);'||chr(10)||
    '    wa(:new.search_clob,:new.c007);wa(:new.search_clob,:new.c008);wa(:new.search_clob,:new.c009);'||chr(10)||
    '    wa(:new.search_clob,:new.c010);wa(:new.search_clob,:new.c011);wa(:new.search_clob,:new.c012);'||chr(10)||
    '    wa(:new.search_clob,:new.c013);wa(:new.search_clob,:new.c014);wa(:new.search_clob,:new.c015);'||chr(10)||
    '    wa(:new.search_clob,:new.c016);wa(:new.search_clob,:new.c017);wa(:new.search_clob,:new.c018);'||chr(10)||
    '    wa(:new.search_clob,:new.c019);wa(:new.search_clob,:new.c020);wa(:new.search_clob,:new.c021);'||chr(10)||
    '    wa(:new.search_clob,:new.c022);wa(:new.search_clob,:new.c023);wa(:new.search_clob,:new.c024);'||chr(10)||
    '    wa(:new.search_clob,:new.c025);wa(:new.search_clob,:new.c026);wa(:new.search_clob,:new.c027);'||chr(10)||
    '    wa(:new.search_clob,:new.c028);wa(:new.search_clob,:new.c029);wa(:new.search_clob,:new.c030);'||chr(10)||
    '    wa(:new.search_clob,:new.c031);wa(:new.search_clob,:new.c032);wa(:new.search_clob,:new.c033);'||chr(10)||
    '    wa(:new.search_clob,:new.c034);wa(:new.search_clob,:new.c035);wa(:new.search_clob,:new.c036);'||chr(10)||
    '    wa(:new.search_clob,:new.c037);wa(:new.search_clob,:new.c038);wa(:new.search_clob,:new.c039);'||chr(10)||
    '    wa(:new.search_clob,:new.c040);wa(:new.search_clob,:new.c041);wa(:new.search_clob,:new.c042);'||chr(10)||
    '    wa(:new.search_clob,:new.c043);wa(:new.search_clob,:new.c044);wa(:new.search_clob,:new.c045);'||chr(10)||
    '    wa(:new.search_clob,:new.c046);wa(:new.search_clob,:new.c047);wa(:new.search_clob,:new.c048);'||chr(10)||
    '    wa(:new.search_clob,:new.c049);wa(:new.search_clob,:new.c050);'||chr(10)||
    '    --'||chr(10)||
    '    -- history'||chr(10)||
    '    --'||chr(10)||
    '    if updating then'||chr(10)||
    '       -- initialize column label array'||chr(10)||
    '       for i in 1..50'||chr(10)||
    '       loop'||chr(10)||
    '           la_col_label(''C''||to_char(i,''FM009'')) := null;'||chr(10)||
    '           la_col_label(''N''||to_char(i,''FM009'')) := null;'||chr(10)||
    '           la_col_label(''D''||to_char(i,''FM009'')) := null;'||chr(10)||
    '       end loop;'||chr(10)||
    '       -- get column label array'||chr(10)||
    '       for c1 in (select column_alias, report_label '||chr(10)||
    '                  from apex_ws_data_grid_col'||chr(10)||
    '                  where data_grid_id = :new.data_grid_id)'||chr(10)||
    '       loop'||chr(10)||
    '           la_col_label(c1.column_alias) := c1.report_label;'||chr(10)||
    '       end loop;'||chr(10)||
    '       -- strings'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C001''),''C'',:old.c001,:new.c001);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C002''),''C'',:old.c002,:new.c002);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C003''),''C'',:old.c003,:new.c003);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C004''),''C'',:old.c004,:new.c004);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C005''),''C'',:old.c005,:new.c005);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C006''),''C'',:old.c006,:new.c006);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C007''),''C'',:old.c007,:new.c007);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C008''),''C'',:old.c008,:new.c008);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C009''),''C'',:old.c009,:new.c009);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C010''),''C'',:old.c010,:new.c010);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C011''),''C'',:old.c011,:new.c011);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C012''),''C'',:old.c012,:new.c012);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C013''),''C'',:old.c013,:new.c013);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C014''),''C'',:old.c014,:new.c014);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C015''),''C'',:old.c015,:new.c015);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C016''),''C'',:old.c016,:new.c016);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C017''),''C'',:old.c017,:new.c017);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C018''),''C'',:old.c018,:new.c018);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C019''),''C'',:old.c019,:new.c019);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C020''),''C'',:old.c020,:new.c020);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C021''),''C'',:old.c021,:new.c021);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C022''),''C'',:old.c022,:new.c022);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C023''),''C'',:old.c023,:new.c023);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C024''),''C'',:old.c024,:new.c024);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C025''),''C'',:old.c025,:new.c025);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C026''),''C'',:old.c026,:new.c026);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C027''),''C'',:old.c027,:new.c027);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C028''),''C'',:old.c028,:new.c028);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C029''),''C'',:old.c029,:new.c029);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C030''),''C'',:old.c030,:new.c030);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C031''),''C'',:old.c031,:new.c031);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C032''),''C'',:old.c032,:new.c032);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C033''),''C'',:old.c033,:new.c033);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C034''),''C'',:old.c034,:new.c034);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C035''),''C'',:old.c035,:new.c035);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C036''),''C'',:old.c036,:new.c036);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C037''),''C'',:old.c037,:new.c037);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C038''),''C'',:old.c038,:new.c038);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C039''),''C'',:old.c039,:new.c039);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C040''),''C'',:old.c040,:new.c040);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C041''),''C'',:old.c041,:new.c041);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C042''),''C'',:old.c042,:new.c042);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C043''),''C'',:old.c043,:new.c043);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C044''),''C'',:old.c044,:new.c044);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C045''),''C'',:old.c045,:new.c045);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C046''),''C'',:old.c046,:new.c046);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C047''),''C'',:old.c047,:new.c047);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C048''),''C'',:old.c048,:new.c048);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C049''),''C'',:old.c049,:new.c049);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''C050''),''C'',:old.c050,:new.c050);'||chr(10)||
    '       -- numbers'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N001''),''N'',null,null,null,null,:old.n001,:new.n001);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N002''),''N'',null,null,null,null,:old.n002,:new.n002);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N003''),''N'',null,null,null,null,:old.n003,:new.n003);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N004''),''N'',null,null,null,null,:old.n004,:new.n004);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N005''),''N'',null,null,null,null,:old.n005,:new.n005);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N006''),''N'',null,null,null,null,:old.n006,:new.n006);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N007''),''N'',null,null,null,null,:old.n007,:new.n007);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N008''),''N'',null,null,null,null,:old.n008,:new.n008);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N009''),''N'',null,null,null,null,:old.n009,:new.n009);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N010''),''N'',null,null,null,null,:old.n010,:new.n010);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N011''),''N'',null,null,null,null,:old.n011,:new.n011);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N012''),''N'',null,null,null,null,:old.n012,:new.n012);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N013''),''N'',null,null,null,null,:old.n013,:new.n013);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N014''),''N'',null,null,null,null,:old.n014,:new.n014);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N015''),''N'',null,null,null,null,:old.n015,:new.n015);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N016''),''N'',null,null,null,null,:old.n016,:new.n016);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N017''),''N'',null,null,null,null,:old.n017,:new.n017);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N018''),''N'',null,null,null,null,:old.n018,:new.n018);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N019''),''N'',null,null,null,null,:old.n019,:new.n019);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N020''),''N'',null,null,null,null,:old.n020,:new.n020);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N021''),''N'',null,null,null,null,:old.n021,:new.n021);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N022''),''N'',null,null,null,null,:old.n022,:new.n022);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N023''),''N'',null,null,null,null,:old.n023,:new.n023);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N024''),''N'',null,null,null,null,:old.n024,:new.n024);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N025''),''N'',null,null,null,null,:old.n025,:new.n025);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N026''),''N'',null,null,null,null,:old.n026,:new.n026);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N027''),''N'',null,null,null,null,:old.n027,:new.n027);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N028''),''N'',null,null,null,null,:old.n028,:new.n028);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N029''),''N'',null,null,null,null,:old.n029,:new.n029);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N030''),''N'',null,null,null,null,:old.n030,:new.n030);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N031''),''N'',null,null,null,null,:old.n031,:new.n031);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N032''),''N'',null,null,null,null,:old.n032,:new.n032);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N033''),''N'',null,null,null,null,:old.n033,:new.n033);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N034''),''N'',null,null,null,null,:old.n034,:new.n034);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N035''),''N'',null,null,null,null,:old.n035,:new.n035);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N036''),''N'',null,null,null,null,:old.n036,:new.n036);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N037''),''N'',null,null,null,null,:old.n037,:new.n037);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N038''),''N'',null,null,null,null,:old.n038,:new.n038);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N039''),''N'',null,null,null,null,:old.n039,:new.n039);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N040''),''N'',null,null,null,null,:old.n040,:new.n040);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N041''),''N'',null,null,null,null,:old.n041,:new.n041);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N042''),''N'',null,null,null,null,:old.n042,:new.n042);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N043''),''N'',null,null,null,null,:old.n043,:new.n043);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N044''),''N'',null,null,null,null,:old.n044,:new.n044);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N045''),''N'',null,null,null,null,:old.n045,:new.n045);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N046''),''N'',null,null,null,null,:old.n046,:new.n046);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N047''),''N'',null,null,null,null,:old.n047,:new.n047);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N048''),''N'',null,null,null,null,:old.n048,:new.n048);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N049''),''N'',null,null,null,null,:old.n049,:new.n049);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''N050''),''N'',null,null,null,null,:old.n050,:new.n050);'||chr(10)||
    '       -- dates'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D001''),''D'',null,null,:old.d001,:new.d001);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D002''),''D'',null,null,:old.d002,:new.d002);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D003''),''D'',null,null,:old.d003,:new.d003);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D004''),''D'',null,null,:old.d004,:new.d004);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D005''),''D'',null,null,:old.d005,:new.d005);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D006''),''D'',null,null,:old.d006,:new.d006);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D007''),''D'',null,null,:old.d007,:new.d007);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D008''),''D'',null,null,:old.d008,:new.d008);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D009''),''D'',null,null,:old.d009,:new.d009);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D010''),''D'',null,null,:old.d010,:new.d010);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D011''),''D'',null,null,:old.d011,:new.d011);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D012''),''D'',null,null,:old.d012,:new.d012);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D013''),''D'',null,null,:old.d013,:new.d013);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D014''),''D'',null,null,:old.d014,:new.d014);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D015''),''D'',null,null,:old.d015,:new.d015);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D016''),''D'',null,null,:old.d016,:new.d016);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D017''),''D'',null,null,:old.d017,:new.d017);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D018''),''D'',null,null,:old.d018,:new.d018);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D019''),''D'',null,null,:old.d019,:new.d019);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D020''),''D'',null,null,:old.d020,:new.d020);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D021''),''D'',null,null,:old.d021,:new.d021);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D022''),''D'',null,null,:old.d022,:new.d022);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D023''),''D'',null,null,:old.d023,:new.d023);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D024''),''D'',null,null,:old.d024,:new.d024);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D025''),''D'',null,null,:old.d025,:new.d025);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D026''),''D'',null,null,:old.d026,:new.d026);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D027''),''D'',null,null,:old.d027,:new.d027);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D028''),''D'',null,null,:old.d028,:new.d028);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D029''),''D'',null,null,:old.d029,:new.d029);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D030''),''D'',null,null,:old.d030,:new.d030);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D031''),''D'',null,null,:old.d031,:new.d031);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D032''),''D'',null,null,:old.d032,:new.d032);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D033''),''D'',null,null,:old.d033,:new.d033);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D034''),''D'',null,null,:old.d034,:new.d034);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D035''),''D'',null,null,:old.d035,:new.d035);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D036''),''D'',null,null,:old.d036,:new.d036);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D037''),''D'',null,null,:old.d037,:new.d037);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D038''),''D'',null,null,:old.d038,:new.d038);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D039''),''D'',null,null,:old.d039,:new.d039);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D040''),''D'',null,null,:old.d040,:new.d040);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D041''),''D'',null,null,:old.d041,:new.d041);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D042''),''D'',null,null,:old.d042,:new.d042);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D043''),''D'',null,null,:old.d043,:new.d043);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D044''),''D'',null,null,:old.d044,:new.d044);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D045''),''D'',null,null,:old.d045,:new.d045);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D046''),''D'',null,null,:old.d046,:new.d046);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D047''),''D'',null,null,:old.d047,:new.d047);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D048''),''D'',null,null,:old.d048,:new.d048);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D049''),''D'',null,null,:old.d049,:new.d049);'||chr(10)||
    '       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label(''D050''),''D'',null,null,:old.d050,:new.d050);'||chr(10)||
    '    end if;'||chr(10)||
    '    --'||chr(10)||
    '    -- set owner'||chr(10)||
    '    --'||chr(10)||
    '    if :new.owner is null then'||chr(10)||
    '        :new.owner := :new.created_by;'||chr(10)||
    '    end if;'||chr(10)||
    'end;';

    insert into wwv_flow_ws_triggers( id,trigger_name,trigger_type,triggering_event,table_name,trigger_body) values(3,'APEX$_WS_ROWS_T1','BEFORE EACH ROW','INSERT OR UPDATE','APEX$_WS_ROWS',l_ddl);
end;
/

insert into wwv_flow_ws_triggers( id,trigger_name,trigger_type,triggering_event,table_name,trigger_body) values(4,'APEX$_WS_NOTES_T1','BEFORE EACH ROW','INSERT OR UPDATE','APEX$_WS_NOTES',
    'begin'||chr(10)||
    '    --'||chr(10)||
    '    -- maintain pk and timestamps'||chr(10)||
    '    --'||chr(10)||
    '    if inserting and :new.id is null then'||chr(10)||
    '        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from sys.dual;'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting then'||chr(10)||
    '        :new.created_on := sysdate;'||chr(10)||
    '        :new.created_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    end if;'||chr(10)||
    'end;');
insert into wwv_flow_ws_triggers( id,trigger_name,trigger_type,triggering_event,table_name,trigger_body) values(5,'APEX$_WS_LINKS_T1','BEFORE EACH ROW','INSERT OR UPDATE','APEX$_WS_LINKS',
    'begin'||chr(10)||
    '    --'||chr(10)||
    '    -- maintain pk and timestamps'||chr(10)||
    '    --'||chr(10)||
    '    if inserting and :new.id is null then'||chr(10)||
    '        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from sys.dual;'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting then'||chr(10)||
    '        :new.created_on := sysdate;'||chr(10)||
    '        :new.created_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    end if;'||chr(10)||
    'end;');
insert into wwv_flow_ws_triggers( id,trigger_name,trigger_type,triggering_event,table_name,trigger_body) values(6,'APEX$_WS_TAGS_T1','BEFORE EACH ROW','INSERT OR UPDATE','APEX$_WS_TAGS',
    'begin'||chr(10)||
    '    --'||chr(10)||
    '    -- maintain pk and timestamps'||chr(10)||
    '    --'||chr(10)||
    '    if inserting and :new.id is null then'||chr(10)||
    '        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from sys.dual;'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting then'||chr(10)||
    '        :new.created_on := sysdate;'||chr(10)||
    '        :new.created_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '    end if;'||chr(10)||
    'end;');
insert into wwv_flow_ws_triggers( id,trigger_name,trigger_type,triggering_event,table_name,trigger_body) values(7,'APEX$_WS_FILES_T1','BEFORE EACH ROW','INSERT OR UPDATE','APEX$_WS_FILES',
    'begin'||chr(10)||
    '    --'||chr(10)||
    '    -- maintain pk and timestamps'||chr(10)||
    '    --'||chr(10)||
    '    if inserting and :new.id is null then'||chr(10)||
    '        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from sys.dual;'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting and :new.image_alias is null then'||chr(10)||
    '        :new.image_alias := :new.name;'||chr(10)||
    '    end if;'||chr(10)||
    '    if inserting then'||chr(10)||
    '        :new.created_on := sysdate;'||chr(10)||
    '        :new.created_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        :new.content_last_update := sysdate;'||chr(10)||
    '    elsif updating then'||chr(10)||
    '        :new.updated_on := sysdate;'||chr(10)||
    '        :new.updated_by := nvl(v(''APP_USER''),user);'||chr(10)||
    '        if nvl(length(:new.content),0) <> nvl(length(:old.content),0) then'||chr(10)||
    '            :new.content_last_update := sysdate;'||chr(10)||
    '        end if;'||chr(10)||
    '    end if;'||chr(10)||
    'end;');

commit;
