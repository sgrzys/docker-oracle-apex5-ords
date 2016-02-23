set define '^' verify off

Rem  Copyright (c) Oracle Corporation 2011 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_pkg_app_tab.sql
Rem
Rem    DESCRIPTION
Rem      Packaged application object creation script.  Create tables, indexes, triggers.
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       cbcho    10/19/2011 - Created
Rem       msewtz   10/25/2011 - Added wwv_flow_pkg_app_map
Rem       cbcho    10/27/2011 - Added additional columns in wwv_flow_pkg_applications
Rem       msewtz   10/27/2011 - Updated creation of wwv_flow_pkg_app_map to use execute immidiate, because we don not drop this table when re-applying patch
Rem       jkallman 10/28/2011 - Ignore errors if tables to be dropped don't exist, correct syntax error in wwv_flow_pkg_applications
Rem       jkallman 10/28/2011 - Added purge to drop table statements
Rem       jkallman 10/28/2011 - Removed drop table statements and made create table and create index statement re-runnable
Rem       msewtz   04/13/2012 - Added min_db_version, application_locked and unlock_allowed to wwv_flow_pkg_applications
Rem       cneumuel 04/16/2012 - Added q'{}' quotes around execute immediate string for wwv_flow_pkg_applications
Rem       cneumuel 04/18/2012 - Added q'{}' quotes around execute immediate string for wwv_flow_pkg_app_map
Rem       msewtz   04/18/2012 - Removed defaults from wwv_flow_pkg_applications and wwv_flow_pkg_app_map
Rem       hfarrell 05/21/2012 - Updated wwv_flow_pkg_app_map to support Websheets: added installed_ws_id, foreign key wwv_flow_pkg_app_map_fk2
Rem       hfarrell 05/24/2012 - Added app_type to wwv_flow_pkg_applications to distinguish between Database and Websheet applications
Rem       hfarrell 05/29/2012 - Updated check constraint on wwv_flow_pkg_applications to modify statuses to AVAILABLE, COMING_SOON, HIDDEN
Rem       pmanirah 06/18/2012 - Added new index wwv_flow_pkg_app_map_idx2 on wwv_flow_pkg_app_map table
Rem       cbcho    06/22/2012 - Added wwv_flow_pkg_app_install_log (feature #992)
Rem       cbcho    07/02/2012 - Changed wwv_flow_pkg_app_install_log trigger to get log_seq using app_id and batch_key, added index on created_on
Rem       cneumuel 07/31/2012 - Added wwv_flow_pkg_app_uk3 on wwv_flow_pkg_applications.apex_websheet_id (feature #1011)
Rem       msewtz   11/13/2012 - Added change_log to wwv_flow_pkg_applications (bug 14643161)
Rem       hfarrell 02/25/2013 - Changed wwv_flow_pkg_app_map.application_locked to be NOT NULL (bug #16389474)
Rem       hfarrell 03/19/2013 - Added build_version, app_locked, installed_build_version to wwv_flow_pkg_app_install_log (bug #16500430)
Rem       hfarrell 03/19/2013 - Added view apex_pkg_app_install_log, associated comments, synonym and grant (bug #16500430)
Rem       hfarrell 04/02/2013 - Updated synonym to be created on view apex_pkg_app_install_log and not the table wwv_flow_pkg_app_install_log (bug #16500430)
Rem       cbcho    08/19/2013 - Added wwv_flow_pkg_app_stmts (feature #1257)
Rem       cbcho    08/22/2013 - Added created_on, created_by to wwv_flow_pkg_app_stmts (feature #1257)
Rem       cbcho    08/22/2013 - Added unique index on wwv_flow_pkg_app_stmts(app_id, stmt_number, line_number) (feature #1257)
Rem       jstraub  10/21/2013 - Changed SGID 11 references to 12
Rem       cbcho    02/18/2014 - Added app_group to wwv_flow_pkg_applications, added wwv_flow_pkg_app_files (feature #1380)
Rem       cbcho    02/20/2014 - Removed size_in_mb and added required_free_kb in wwv_flow_pkg_applications (feature #1380)
Rem       cbcho    02/27/2014 - Changed app_group to default to TEMPLATE (feature #1380)
Rem       cbcho    02/27/2014 - Renamed wwv_flow_pkg_applications table row_key to app_id number (feature #1380)
Rem       cbcho    03/03/2014 - Removed security_group_id from wwv_flow_pkg_app_files as it is not needed (feature #1380)
Rem       cbcho    03/13/2014 - Added file_id in wwv_flow_pkg_app_stmts with FK to wwv_flow_pkg_app_files with index (feature #1380)
Rem       cbcho    03/14/2014 - Added wwv_flow_pkg_app_map_uk1 in wwv_flow_pkg_app_map (feature #1399)
Rem       cbcho    03/18/2014 - Changed TEMPLATE to CUSTOM
Rem       cbcho    04/17/2014 - Added is_oracle_app virtual column in wwv_flow_pkg_applications (feature #1258)
Rem       cbcho    05/16/2014 - Removed on delete cascade of category_ids in wwv_flow_pkg_applications. This way pkg apps do not get deleted when category gets removed (decision from Vald and cbcho)
Rem       cneumuel 08/07/2014 - Moved grant on apex_pkg_app_install_log to wwv_flow_upgrade
Rem       jstraub  08/20/2015 - Added security_group_id column on wwv_flow_pkg_app_categories, wwv_flow_pkg_app_files, wwv_flow_pkg_app_images, wwv_flow_pkg_applications (bug 21673469)
Rem       hfarrell 08/25/2015 - Set security_group_id in triggers to 12, for internally installed packaged applications. Customer uploaded apps should use SGID 11.
Rem       jstraub  09/03/2015 - Removed wwv_flow_pkg_app_stmts_fk1 from wwv_flow_pkg_app_stmts (bug 21779781)

prompt ...create table wwv_flow_pkg_app_categories


begin
    execute immediate '
create table wwv_flow_pkg_app_categories (
   id                     number         not null,
   category_name          varchar2(255)  not null,
   category_desc          varchar2(4000),
   security_group_id      number,
   --
   created                date,
   created_by             varchar2(255),
   updated                date,
   updated_by             varchar2(255),
   --
   constraint wwv_flow_pkg_app_cats_pk
      primary key (id),
   constraint wwv_flow_pkg_app_cats_uk1
      unique (category_name)
   )
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/


create or replace trigger wwv_flow_pkg_app_cats_biu
   before insert or update on wwv_flow_pkg_app_categories
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
   if :new.security_group_id is null then
      :new.security_group_id := 12;
   end if;
end;
/


prompt ...create table wwv_flow_pkg_applications

begin
    execute immediate q'{
create table wwv_flow_pkg_applications (
   id                         number         not null,
   app_id                     number         not null,
   app_name                   varchar2(255)  not null,
   app_description            varchar2(4000),
   app_type                   varchar2(2)    default 'DB' not null,
   app_group                  varchar2(255)  default 'CUSTOM'
                                  constraint wwv_flow_pkg_app_group_ck
                                  check (app_group in ('PACKAGE','SAMPLE','CUSTOM')),
   is_oracle_app              varchar2(1) generated always as (
                              case when app_type = 'DB' and app_id between 5000 and 9000 then 'Y'
                              when app_type = 'WS' and app_group != 'CUSTOM' then 'Y'
                              else 'N'
                              end
                              ) virtual,
   tags                       varchar2(255),
   apex_application_id        number,
   apex_websheet_id           number,
   image_identifier           varchar2(255),
   app_status                 varchar2(30),
   app_display_version        varchar2(255),
   app_version_date           date,
   app_category_id_1          number,
   app_category_id_2          number,
   app_category_id_3          number,
   build_version              number,
   change_log                 varchar2(4000),
   unlock_allowed             varchar2(1)
                                  constraint wwv_flow_pkg_app_unlock_ok_ck
                                  check (unlock_allowed in ('Y','N')),
   app_page_count             number,
   app_object_count           number,
   app_object_prefix          varchar2(255),
   --
   required_free_kb           number,
   languages                  varchar2(500),
   released                   date,
   min_apex_version           varchar2(255),
   min_db_version             varchar2(255),
   provider_company           varchar2(255),
   provider_email             varchar2(255),
   provider_website           varchar2(255),
   security_group_id          number,
   --
   created                    date,
   created_by                 varchar2(255),
   updated                    date,
   updated_by                 varchar2(255),
   --
   constraint wwv_flow_pkg_app_pk
      primary key (id),
   constraint wwv_flow_pkg_app_uk1
      unique (apex_application_id),
   constraint wwv_flow_pkg_app_uk2
      unique (app_id),
   constraint wwv_flow_pkg_app_uk3
      unique (apex_websheet_id),
   constraint wwv_flow_pkg_app_fk1
      foreign key (app_category_id_1) references wwv_flow_pkg_app_categories (id),
   constraint wwv_flow_pkg_app_fk2
      foreign key (app_category_id_2) references wwv_flow_pkg_app_categories (id),
   constraint wwv_flow_pkg_app_fk3
      foreign key (app_category_id_3) references wwv_flow_pkg_app_categories (id),
   constraint wwv_flow_pkg_app_cc1
      check (app_status in ('AVAILABLE','COMING_SOON','HIDDEN'))
   )
}';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwv_flow_pkg_app_idx1 on wwv_flow_pkg_applications(app_category_id_1)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
begin
    execute immediate 'create index wwv_flow_pkg_app_idx2 on wwv_flow_pkg_applications(app_category_id_2)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
begin
    execute immediate 'create index wwv_flow_pkg_app_idx3 on wwv_flow_pkg_applications(app_category_id_3)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
create or replace trigger wwv_flow_pkg_app_biu
   before insert or update on wwv_flow_pkg_applications
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
   if :new.security_group_id is null then
      :new.security_group_id := 12;
   end if;
end;
/

prompt ...create table wwv_flow_pkg_app_images

begin
    execute immediate '
create table wwv_flow_pkg_app_images (
   id                         number   not null,
   app_id                     number   not null,
   title                      varchar2(1024),
   description                varchar2(4000),
   file_name                  varchar2(512),
   security_group_id          number,
   --
   created                    date,
   created_by                 varchar2(255),
   updated                    date,
   updated_by                 varchar2(255),
   --
   constraint wwv_flow_pkg_app_images_pk
      primary key (id),
   constraint wwv_flow_pkg_app_images_fk1
      foreign key (app_id) references wwv_flow_pkg_applications (id)
      on delete cascade
   )
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwv_flow_pkg_app_images_idx1 on wwv_flow_pkg_app_images(app_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_flow_pkg_app_images_biu
   before insert or update on wwv_flow_pkg_app_images
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
   if :new.security_group_id is null then
      :new.security_group_id := 12;
   end if;
end;
/

prompt ...create table wwv_flow_pkg_app_map

begin
    execute immediate q'{
create table wwv_flow_pkg_app_map (
   id                         number   not null,
   app_id                     number   not null,
   installed_app_id           number,
   installed_ws_id            number,
   installed_build_version    number   not null,
   application_locked         varchar2(1) not null
                                  constraint wwv_flow_pkg_app_locked_ck
                                  check (application_locked in ('Y','N')),
   security_group_id          number   not null,
   --
   created                    date,
   created_by                 varchar2(255),
   updated                    date,
   updated_by                 varchar2(255),
   --
   constraint wwv_flow_pkg_app_map_pk
      primary key (id),
   constraint wwv_flow_pkg_app_map_fk
      foreign key (installed_app_id) references wwv_flows (id)
      on delete cascade,
   constraint wwv_flow_pkg_app_map_fk2
      foreign key (installed_ws_id) references wwv_flow_ws_applications (id)
      on delete cascade,
   constraint wwv_flow_pkg_app_map_uk1
      unique (app_id, security_group_id)
   )
}';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwv_flow_pkg_app_map_idx on wwv_flow_pkg_app_map(installed_app_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwv_flow_pkg_app_map_idx2 on wwv_flow_pkg_app_map(installed_ws_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_flow_pkg_app_map_biu
   before insert or update on wwv_flow_pkg_app_map
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
   if :new.security_group_id is null then
      :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
   end if;
end;
/


prompt ...create table wwv_flow_pkg_app_install_log

begin
    execute immediate q'{
create table wwv_flow_pkg_app_install_log (
    id                      number
                            constraint wwv_flow_pai_log_pk
                            primary key,
    batch_key               varchar2(255) not null,
    app_id                  number not null,
    app_type                varchar2(255)
                            constraint wwv_flow_pai_log_app_type_ck
                            check (app_type in (
                            'DATABASE',
                            'WEBSHEET')),
    app_version             varchar2(255) not null,
    build_version           number,
    installed_build_version number,
    app_locked              varchar2(1),
    log_seq                 number not null,
    log_event               varchar2(4000),
    log_type                varchar2(255)
                            constraint wwv_flow_pai_log_type_ck
                            check (log_type in (
                            'INFORMATION',
                            'SUCCESS',
                            'WARNING',
                            'ERROR')),
    started                 timestamp with local time zone not null,
    ended                   timestamp with local time zone,
    err_msg                 varchar2(4000),
    created_on              date,
    created_by              varchar2(255),
    updated_on              date,
    updated_by              varchar2(255),
    security_group_id       number not null
    )
}';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwwv_flow_pai_log_idx1 on wwv_flow_pkg_app_install_log (batch_key)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwwv_flow_pai_log_idx2 on wwv_flow_pkg_app_install_log (created_on)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_flow_pkg_app_inst_log_t1
    before insert or update on wwv_flow_pkg_app_install_log
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.log_seq is null then
            select nvl(max(log_seq),0) + 1 into :new.log_seq
            from wwv_flow_pkg_app_install_log
            where app_id = :new.app_id
            and batch_key = :new.batch_key;
        end if;

        :new.started := localtimestamp;
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

prompt ...create view apex_pkg_app_install_log

create or replace view apex_pkg_app_install_log
as
select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.app_id                         application_id,
    t.app_name                       application_name,
    t.app_type                       application_type,
    t.app_description                application_description,
    f.security_group_id              workspace_id,
    --
    f.app_version                    application_version,
    f.build_version                  build_version,
    f.installed_build_version        installed_build_version,
    f.log_seq                        log_sequence,
    f.log_event                      log_event,
    f.log_type                       log_type,
    f.started                        start_time,
    f.ended                          end_time,
    f.err_msg                        error_message,
    f.created_by                     created_by,
    f.created_on                     created_on,
    f.updated_by                     updated_by,
    f.updated_on                     updated_on,
    f.id                             install_log_id
    --
from wwv_flow_pkg_applications t,
     wwv_flow_pkg_app_install_log f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.app_id              = t.app_id and
      t.app_type            = 'DB' and
      f.app_type            = 'DATABASE' and
     --
      (d.sgid != 0 or nvl(t.APP_STATUS,'x') not in ('COMING_SOON','HIDDEN')) and
      w.PROVISIONING_COMPANY_ID not in (0,12)
/

comment on table  apex_pkg_app_install_log                               is 'Identifies a collection of install log entries associated with packaged application installs and upgrades.';
comment on column apex_pkg_app_install_log.workspace                     is 'A work area mapped to one or more database schemas';
comment on column apex_pkg_app_install_log.workspace_display_name        is 'Display name for the workspace';
comment on column apex_pkg_app_install_log.application_id                is 'Application Primary Key, Unique over all workspaces';
comment on column apex_pkg_app_install_log.application_name              is 'Identifies the application';
comment on column apex_pkg_app_install_log.application_type              is 'Identifies the application type';
comment on column apex_pkg_app_install_log.application_description       is 'Displays a description of the application';
comment on column apex_pkg_app_install_log.workspace_id                  is 'Application Express Workspace Identifier, unique over all workspaces';
comment on column apex_pkg_app_install_log.application_version           is 'Identifies the application version';
comment on column apex_pkg_app_install_log.build_version                 is 'Identifies the build version of the application';
comment on column apex_pkg_app_install_log.installed_build_version       is 'Identifies the build version of the installed application';
comment on column apex_pkg_app_install_log.log_sequence                  is 'Identifies the sequence of the log message';
comment on column apex_pkg_app_install_log.log_event                     is 'Identifies the log event';
comment on column apex_pkg_app_install_log.log_type                      is 'Identifies the type of log message';
comment on column apex_pkg_app_install_log.start_time                    is 'Identifies the start time of the log event';
comment on column apex_pkg_app_install_log.end_time                      is 'Identifies the end time of the log event';
comment on column apex_pkg_app_install_log.error_message                 is 'Displays the error message for the log event';
comment on column apex_pkg_app_install_log.created_by                    is 'APEX developer who created the log event';
comment on column apex_pkg_app_install_log.created_on                    is 'Date of which this entry was created';
comment on column apex_pkg_app_install_log.updated_by                    is 'APEX developer who made last update';
comment on column apex_pkg_app_install_log.updated_on                    is 'Date of last update';
comment on column apex_pkg_app_install_log.install_log_id                is 'Identifies the unique ID for the log event';

prompt ...create table wwv_flow_pkg_app_files

begin
    execute immediate q'{
create table wwv_flow_pkg_app_files (
    id                         number not null
                               constraint wwv_flow_pkg_app_files_pk
                               primary key,
    app_id                     number not null
                               constraint wwv_flow_pkg_app_files_fk
                               references wwv_flow_pkg_applications(app_id)
                               on delete cascade,
    language                   varchar2(30),
    file_name                  varchar2(400),
    mime_type                  varchar2(255),
    file_charset               varchar2(128),
    blob_content               blob,
    security_group_id          number,
    --
    created                    date,
    created_by                 varchar2(255),
    updated                    date,
    updated_by                 varchar2(255)
    )
}';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwv_flow_pkg_app_files_idx on wwv_flow_pkg_app_files (app_id, file_name)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_flow_pkg_app_files_biu
   before insert or update on wwv_flow_pkg_app_files
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
   if :new.security_group_id is null then
      :new.security_group_id := 12;
   end if;
end;
/

prompt ...create table wwv_flow_pkg_app_stmts

begin
    execute immediate q'{
create table wwv_flow_pkg_app_stmts
(id                 number
                    constraint wwv_flow_pkg_app_stmts_pk
                    primary key,
app_id              number not null,   -- This is either databased application ID (apex_application_id) or Websheet ID (apex_websheet_id) in WWV_FLOW_PKG_APPLICATIONS.
file_id             number not null,
stmt_number         number not null,
line_number         number not null,   -- application export file line number, not the line number within each statements
is_runnable         varchar2(1) default 'N' not null
                    constraint wwv_flow_pkg_app_stmts_r_ck
                    check (is_runnable in ('Y','N')),
line_vc2            varchar2(4000),  -- if line <= 400 save it here
line_clob           clob,            -- if line > 4000 save it here,
created_on          date,
created_by          varchar2(255)
)
}';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create unique index wwv_flow_pkg_app_stmts_idx1 on wwv_flow_pkg_app_stmts(app_id, stmt_number, line_number) compress 2';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwv_flow_pkg_app_stmts_idx2 on wwv_flow_pkg_app_stmts(file_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_flow_pkg_app_stmts_biu
    before insert or update on wwv_flow_pkg_app_stmts
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/
