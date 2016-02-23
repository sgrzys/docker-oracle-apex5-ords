set define '^'
set verify off
prompt ...create provisioning objects


Rem  Copyright (c) Oracle Corporation 2001-2011. All Rights Reserved.
Rem
Rem    NAME
Rem      provisioning_tables.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      project: is a way of grouping a service, it can be the same as a company
Rem      provision: the creation of a virtural private development environment
Rem
Rem    RUNTIME DEPLOYMENT: NO
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem      mhichwa  01/23/2001 - Created
Rem      mhichwa  02/23/2001 - Changed wwv_flow_provision_company columns
Rem      mhichwa  02/24/2001 - Changed index names, added indexes
Rem      mhichwa  02/25/2001 - Removed schema list column
Rem      mhichwa  02/26/2001 - Changed spelling of requested
Rem      mhichwa  02/27/2001 - Added not null column constraints and changed trigger.
Rem      mhichwa  02/28/2001 - Added provisioning work log
Rem      mhichwa  03/03/2001 - Added wwv_flow_provision_serice_mod
Rem      sleuniss 03/19/2001 - Fixed spelling errors
Rem      sdillon  03/21/2001 - Fixed spelling errors
Rem      sdillon  03/22/2001 - Added admin_id to provision company table, altered trigger/index
Rem      mhichwa  03/27/2001 - Added requested date to provision company table
Rem      sdillon  08/22/2001 - Changed order of inserts when auto provisioning to respect new ref integrity constraints.
Rem      tmuth    08/22/2001 - Named remaining pk constraints
Rem      mhichwa  06/25/2002 - Changed database provision sizing 2meg 5meg etc
Rem      jstraub  12/18/2002 - Removed unique from index wwv_flow_prov_company_SCHEMA
Rem      jkallman 11/25/2003 - Corrected display of Taiwan (Bug 3280214)
Rem      sspadafo 09/15/2005 - Removed not null from admin_first_name/last_name/email in wwv_flow_provision_company for xe
Rem      nagkrish 01/04/2007 - Added 'Accepted' project status to check constraint "CK_FLOW_PROV_PROJ_STATUS".
Rem      jkallman 01/08/2007 - Add table wwv_flow_workspace_req_size
Rem      jkallman 01/11/2007 - Added default_size to wwv_flow_workspace_req_size
Rem      jkallman 12/11/2007 - Added administrator notification to trigger wwv_biu_flow_prov_company
Rem      jkallman 02/24/2010 - Adjust sizes of workspace request sizes
Rem      jkallman 12/15/2010 - Added index wwv_flow_provision_comp_idx1
Rem      mhichwa  04/01/2010 - added columns to wwv_flow_provision_company
Rem      mhichwa  04/01/2010 - added table wwv_flow_provision_agreement
Rem      mhichwa  04/18/2011 - added wwv_flow_prov_signup_q
Rem      mhichwa  04/20/2011 - added agreement_enabled_yn and agreement_text
Rem      jkallman 05/09/2011 - Added column database_prealloc_size to wwv_flow_provision_company
Rem      jkallman 05/10/2011 - Changed column database_prealloc_size to database_initial_size in wwv_flow_provision_company
Rem      jkallman 05/11/2011 - Permit admin_userid to be nullable in wwv_flow_provision_company
Rem      msewtz   02/24/2014 - Added justifcation_requred to wwv_flow_prov_signup_q
Rem      hfarrell 05/20/2014 - In wwv_flow_provision_company: added workspace_type and associated check constraint; 
Rem                            In wwv_biu_flow_prov_company trigger: add default value for workspace_type (feature #1429)

--
-- Arguments:
--  1:  
--  2:
--  3:  Flow user


prompt ...wwv_flow_provision_serice_mod


create table wwv_flow_provision_serice_mod (
    id                           number
                                 constraint wwv_flowpk_prov_service_mod
                                 primary key,
    security_group_id            number not null,
    service_name                 varchar2(255)
                                 constraint wwv_flow_ck_service_name
                                 check (service_name in (
                                 'NEW_SCHEMA',
                                 'REMOVE_EXISTING_SERVICE',
                                 'REMOVE_EXISTING_SCHEMA',
                                 'CHANGE_DB_SIZE',
                                 'CHANGE_COMPANY_NAME',
                                 'CHANGE_END_SERVICE_DATE',
                                 'CHANGE_ADMIN_EMAIL',
                                 'CHANGE_ADMIN_NAME',
                                 'CHANGE_COMPANY_ADDRESS',
                                 'CHANGE_MAX_END_USERS',
                                 'CHANGE_MAX_PG_VIEWS_DAY')),
    service_attribute_1          varchar2(4000),
    service_attribute_2          varchar2(4000),
    service_attribute_3          varchar2(4000),
    service_attribute_4          varchar2(4000),
    service_attribute_5          varchar2(4000),
    service_attribute_6          varchar2(4000),
    service_attribute_7          varchar2(4000),
    service_attribute_8          varchar2(4000),
    requested_on                 date not null,
    requested_by                 varchar2(255),
    last_status_change_on        date,
    last_status_change_by        varchar2(255),
    request_status               varchar2(255)
                                 constraint wwv_flow_ck_prov_smod_status 
                                 check (request_status in (
                                 'IN_PROGRESS',
                                 'REQUESTED',
                                 'DECLINED',
                                 'APPROVED')),
    request_work_log             varchar2(4000),
    request_comments             varchar2(4000)
    )
/

create or replace trigger wwv_biu_flow_prov_comp_smod
    before insert or update on wwv_flow_provision_serice_mod
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.requested_on := sysdate;
        :new.requested_by := wwv_flow.g_user;
    end if;
    if updating then
        :new.last_status_change_on := sysdate;
        :new.last_status_change_by := wwv_flow.g_user;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    
    if inserting then
         wwv_flow_fnd_developer_api.admin_notify_change_request(
             p_workspace_id   => :new.security_group_id,
             p_admin_userid   => :new.requested_by );
    end if;
    
end;
/
show errors

create index wwv_flow_prov_company_mod_idx1 on wwv_flow_provision_serice_mod (security_group_id)
/

prompt ...wwv_flow_prov_signup_q

create table wwv_flow_prov_signup_q (
    id                           number
                                 constraint pk_wwv_flow_prov_signup_q
                                 primary key,
    --
    justification_required_yn    varchar2(1) 
                                 constraint wwv_flow_prov_signup_jr
                                 check (justification_required_yn in ('Y','N')), 
    agreement_enabled_yn         varchar2(1) 
                                 constraint wwv_flow_prov_signup_ae
                                 check (agreement_enabled_yn in ('Y','N')), 
    agreement_text               clob,
    --
    survey_enabled_yn            varchar2(1) 
                                 constraint wwv_flow_prov_signup_se
                                 check (survey_enabled_yn in ('Y','N')),
    pre_survey_text              varchar2(4000),
    post_survey_text             varchar2(4000),
    survey_question_01           varchar2(4000),
    survey_answer_01             varchar2(4000),
    survey_question_02           varchar2(4000),
    survey_answer_02             varchar2(4000),
    survey_question_03           varchar2(4000),
    survey_answer_03             varchar2(4000),
    survey_question_04           varchar2(4000),
    survey_answer_04             varchar2(4000),
    survey_question_05           varchar2(4000),
    survey_answer_05             varchar2(4000),
    survey_question_06           varchar2(4000),
    survey_answer_06             varchar2(4000),
    survey_question_07           varchar2(4000),
    survey_answer_07             varchar2(4000),
    survey_question_08           varchar2(4000),
    survey_answer_08             varchar2(4000),
    survey_question_09           varchar2(4000),
    survey_answer_09             varchar2(4000),
    survey_question_10           varchar2(4000),
    survey_answer_10             varchar2(4000),
    -- 
    created                      date,
    created_by                   varchar2(255),
    updated                      date,
    updated_by                   varchar2(255)
)
/

create or replace trigger wwv_flow_prov_signup_q_trig
    before insert or update on wwv_flow_prov_signup_q
    for each row
begin
    if inserting and :new.id is null then
       :new.id := 1;
    elsif inserting and :new.id != 1 then
       RAISE_APPLICATION_ERROR(-20000,'Only valid PK for table wwv_flow_prov_signup_q is 1');
    end if;

    if user <> 'SYS' then
        :new.updated := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
        if inserting then
           :new.created := sysdate;
           :new.created_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/
show errors

insert into wwv_flow_prov_signup_q (id, survey_enabled_yn, justification_required_yn) values (1,'N', 'Y');
commit;

prompt ...wwv_flow_provision_company

create table wwv_flow_provision_company (
    id                           number
                                 constraint pk_flow_prov_project_id
                                 primary key,
    security_group_id            number not null,
    company_name                 varchar2(255) not null,
    admin_first_name             varchar2(255),
    admin_last_name              varchar2(255),
    admin_title                  varchar2(255),
    admin_email                  varchar2(255),
    admin_phone                  varchar2(255),
    admin_id                     number,
    admin_userid                 varchar2(255),
    company_address              varchar2(255),
    city                         varchar2(255),
    state                        varchar2(255),
    zip                          varchar2(255),
    country                      varchar2(30),
    company_type                 varchar2(255),
    company_website              varchar2(255),
    number_of_employees          varchar2(255),
    company_phone                varchar2(255),
    company_fax                  varchar2(255),
    oracle_partner               varchar2(255) check (oracle_partner in ('YES','NO')),
    how_did_you_hear_about_us    varchar2(255),
    service_use_status           varchar2(30) check (service_use_status in ('FULL_USE','TRIAL')),
    database_size                number,
    database_initial_size        number,
    service_start_date           date,
    service_termination_date     date,
    schema_name                  varchar2(255) not null,
    estimated_end_users          number,
    page_views_per_day           number,
    --
    survey_question_01           varchar2(4000),
    survey_answer_01             varchar2(4000),
    survey_question_02           varchar2(4000),
    survey_answer_02             varchar2(4000),
    survey_question_03           varchar2(4000),
    survey_answer_03             varchar2(4000),
    survey_question_04           varchar2(4000),
    survey_answer_04             varchar2(4000),
    survey_question_05           varchar2(4000),
    survey_answer_05             varchar2(4000),
    survey_question_06           varchar2(4000),
    survey_answer_06             varchar2(4000),
    survey_question_07           varchar2(4000),
    survey_answer_07             varchar2(4000),
    survey_question_08           varchar2(4000),
    survey_answer_08             varchar2(4000),
    survey_question_09           varchar2(4000),
    survey_answer_09             varchar2(4000),
    survey_question_10           varchar2(4000),
    survey_answer_10             varchar2(4000),
    --
    agreement_acceptance_date    date,
    agreement_name               varchar2(4000),
    agreement_user_env           varchar2(4000),
    agreement_checksum           varchar2(255),
    --
    project_description          varchar2(4000),
    project_justification        varchar2(4000),
    project_approval_date        date,
    project_actual_begin_date    date,
    project_actual_end_date      date,
    project_status               varchar2(255)
                                 constraint ck_flow_prov_proj_status
                                 check (project_status in (
                                 'IN_PROGRESS',
                                 'REQUESTED',
                                 'ACCEPTED',
                                 'DECLINED',
                                 'APPROVED',
                                 'TERMINATION_IN_PROGRESS',
                                 'TERMINATION_IN_PROGRESS2',
                                 'TERMINATION_IN_PROGRESS3',
                                 'TERMINATION_IN_PROGRESS4',
                                 'TERMINATION_IN_PROGRESS5',
                                 'TERMINATION_IN_PROGRESS6',
                                 'TERMINATED')),
    work_log                     varchar2(4000),
    request_date                 date,
    workspace_type               varchar2(20) check (workspace_type in ('BUILDER','APPS'))
    )
/


create or replace trigger wwv_biu_flow_prov_company
    before insert or update on wwv_flow_provision_company
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting and :new.admin_id is null then
        :new.admin_id := wwv_flow_id.next_val;
    end if;
    if inserting and :new.security_group_id is null then
        :new.security_group_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.request_date := sysdate;
    end if;
    :new.company_name := upper(:new.company_name);
    :new.admin_userid := upper(:new.admin_userid);
    :new.schema_name  := upper(:new.schema_name);
    
    if :new.workspace_type is null then
        :new.workspace_type := 'BUILDER';
    end if;

    if inserting then
         wwv_flow_fnd_developer_api.admin_notify_new_request(
             p_workspace_name => :new.company_name,
             p_schema_name    => :new.schema_name,
             p_admin_userid   => :new.admin_userid,
             p_admin_email    => :new.admin_email );
    end if;
end;
/
show errors

create unique index wwv_flow_prov_company_name on wwv_flow_provision_company (company_name);
create index wwv_flow_prov_company_SCHEMA on wwv_flow_provision_company (SCHEMA_NAME);
create unique index wwv_flow_prov_company_sgid on wwv_flow_provision_company (security_group_id);
create unique index wwv_flow_prov_company_admin_id on wwv_flow_provision_company (admin_id);
create index wwv_flow_provision_comp_idx1 on wwv_flow_provision_company( project_status );




prompt ...wwv_flow_provision_company

create table wwv_flow_provision_agreement (
    id                           number
                                 constraint pk_flow_prov_agree_id
                                 primary key,
    agreement_name               varchar2(255) not null,
    agreement_text               clob not null,
    -- 
    created                      date,
    created_by                   varchar2(255),
    updated                      date,
    updated_by                   varchar2(255)
)
/


create or replace trigger wwv_flow_prov_agree_trig
    before insert or update on wwv_flow_provision_agreement
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if user <> 'SYS' then
        :new.updated := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
        if inserting then
           :new.created := sysdate;
           :new.created_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/
show errors



prompt ...wwv_flow_pick_page_views

create table wwv_flow_pick_page_views (
    id                 number 
                       constraint wwv_flow_pick_p_vs_pk
                       primary key,
    pg_views           number not null,
    pg_views_desc      varchar2(255) not null)
/

delete from  wwv_flow_pick_page_views;
insert into wwv_flow_pick_page_views values (1,1000,'Between 1 and 1,000 page views per day');
insert into wwv_flow_pick_page_views values (2,10000,'Between 1,000 and 10,000 page views per day');
insert into wwv_flow_pick_page_views values (3,100000,'Between 10,000 and 100,000 page views per day');
insert into wwv_flow_pick_page_views values (4,1000000,'Between 100,000 and 1,000,000 page views per day');
insert into wwv_flow_pick_page_views values (5,10000000,'More than 1,000,000 page views per day');
commit;


create table wwv_flow_pick_end_users (
    id                 number 
                       constraint wwv_flow_pick_e_usr_pk primary key,
    num_users          number not null,
    num_users_desc     varchar2(255) not null)
/
delete from wwv_flow_pick_end_users;
insert into wwv_flow_pick_end_users values (1,100,'Between 1 and 100 named end users');
insert into wwv_flow_pick_end_users values (2,1000,'Between 101 and 1,000 named end users');
insert into wwv_flow_pick_end_users values (3,10000,'Between 1,001 and 10,000 named end users');
insert into wwv_flow_pick_end_users values (4,100000,'More than 10,000 named end users');
commit;


create table wwv_flow_pick_database_size (
    id                 number 
                       constraint wwv_flow_pick_db_size_pk
                       primary key,
    db_size            varchar2(30)  not null,
    db_size_desc       varchar2(255) not null)
/


create table wwv_flow_workspace_req_size (
    id                 number,
    request_type       varchar2(1) not null
                       constraint wwv_flow_wksp_request_type
                       check (request_type in ('N','C')),
    req_size           varchar2(30)  not null,
    display            varchar2(1) not null
                       constraint wwv_flow_wksp_req_size_display
                       check (display in ('Y','N')),
    default_size       varchar2(1) not null
                       constraint wwv_flow_wksp_req_size_default
                       check (default_size in ('Y','N'))
)
/

alter table wwv_flow_workspace_req_size add constraint wwv_flow_workspace_req_size_pk primary key (id)
/


insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 1, 'N', 10, 'Y', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 2, 'N', 25, 'Y', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 3, 'N', 100, 'Y', 'Y')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 4, 'N', 500, 'Y', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 5, 'N', 2000, 'N', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 6, 'N', 5000, 'N', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 7, 'N', 10000, 'N', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 8, 'C', 10, 'Y', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 9, 'C', 25, 'Y', 'Y')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 10, 'C', 100, 'Y', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 11, 'C', 500, 'Y', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 12, 'C', 2000, 'N', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 13, 'C', 5000, 'N', 'N')
/
insert into wwv_flow_workspace_req_size (id, request_type, req_size, display, default_size) values( 14, 'C', 10000, 'N', 'N')
/
commit;



create table wwv_flow_company_types (
    id                 number 
                       constraint wwv_flow_company_types_pk
                       primary key,
    company_type       varchar2(30) not null,
    type_description   varchar2(255) not null)
/

delete from wwv_flow_company_types;

set feedback off;

insert into wwv_flow_company_types values (1,'ADV','Advertising');
insert into wwv_flow_company_types values (2,'AERO','Aerospace');
insert into wwv_flow_company_types values (3,'AGRI','Agriculture');
insert into wwv_flow_company_types values (4,'AUTO','Automotive');
insert into wwv_flow_company_types values (5,'BANK','Banking');
insert into wwv_flow_company_types values (6,'BIO','Biotechnology');
insert into wwv_flow_company_types values (7,'CHEM','Chemicals');
insert into wwv_flow_company_types values (8,'COMM','Communications');
insert into wwv_flow_company_types values (9,'CONS','Construction');
insert into wwv_flow_company_types values (10,'CPG','Consumer Products');
insert into wwv_flow_company_types values (11,'EDU','Education');
insert into wwv_flow_company_types values (12,'ENE','Energy/Utility');
insert into wwv_flow_company_types values (13,'ENT','Entertainment');
insert into wwv_flow_company_types values (14,'FOOD','Food Services');
insert into wwv_flow_company_types values (15,'GOVTFED','Government-Federal');
insert into wwv_flow_company_types values (16,'GOVTLOC','Government-Local');
insert into wwv_flow_company_types values (17,'HARD','Hardware');
insert into wwv_flow_company_types values (18,'HLTH','Healthcare');
insert into wwv_flow_company_types values (19,'INSURANCE','Insurance');
insert into wwv_flow_company_types values (20,'LEASE','Leasing');
insert into wwv_flow_company_types values (21,'LEGAL','Legal');
insert into wwv_flow_company_types values (22,'MFG','Manufacturing');
insert into wwv_flow_company_types values (23,'NETW','Networking');
insert into wwv_flow_company_types values (24,'NONP','Not for Profit');
insert into wwv_flow_company_types values (25,'OT','Other');
insert into wwv_flow_company_types values (26,'PROF','Professional Services');
insert into wwv_flow_company_types values (27,'REAL','Real Estate');
insert into wwv_flow_company_types values (28,'RET','Retail');
insert into wwv_flow_company_types values (29,'SOFT','Software');
insert into wwv_flow_company_types values (30,'TELE','Telecommunications');
insert into wwv_flow_company_types values (31,'TRV','Travel');
insert into wwv_flow_company_types values (32,'UNK','Unknown');
commit;


set feedback on;

create table wwv_flow_countries (
    country_id         varchar2(30)  primary key,
    country_Name       varchar2(255) not null)
/


delete from wwv_flow_countries;

set feedback off;

insert into wwv_flow_countries values ('AF','Afghanistan');
insert into wwv_flow_countries values ('AL','Albania');
insert into wwv_flow_countries values ('DZ','Algeria');
insert into wwv_flow_countries values ('AS','American Samoa');
insert into wwv_flow_countries values ('AD','Andorra');
insert into wwv_flow_countries values ('AO','Angola');
insert into wwv_flow_countries values ('AI','Anguilla');
insert into wwv_flow_countries values ('AQ','Antarctica');
insert into wwv_flow_countries values ('AG','Antigua and Barbuda');
insert into wwv_flow_countries values ('AR','Argentina');
insert into wwv_flow_countries values ('AM','Armenia');
insert into wwv_flow_countries values ('AW','Aruba');
insert into wwv_flow_countries values ('AU','Australia');
insert into wwv_flow_countries values ('AT','Austria');
insert into wwv_flow_countries values ('AZ','Azerbaijan');
insert into wwv_flow_countries values ('BS','Bahamas');
insert into wwv_flow_countries values ('BH','Bahrain');
insert into wwv_flow_countries values ('BD','Bangladesh');
insert into wwv_flow_countries values ('BB','Barbados');
insert into wwv_flow_countries values ('BY','Belarus');
insert into wwv_flow_countries values ('BE','Belgium');
insert into wwv_flow_countries values ('BZ','Belize');
insert into wwv_flow_countries values ('BJ','Benin');
insert into wwv_flow_countries values ('BM','Bermuda');
insert into wwv_flow_countries values ('BT','Bhutan');
insert into wwv_flow_countries values ('BO','Bolivia');
insert into wwv_flow_countries values ('BA','Bosnia and Herzegovina');
insert into wwv_flow_countries values ('BW','Botswana');
insert into wwv_flow_countries values ('BV','Bouvet Island');
insert into wwv_flow_countries values ('BR','Brazil');
insert into wwv_flow_countries values ('IO','British Indian Ocean Territory');
insert into wwv_flow_countries values ('BN','Brunei Darussalam');
insert into wwv_flow_countries values ('BG','Bulgaria');
insert into wwv_flow_countries values ('BF','Burkina Faso');
insert into wwv_flow_countries values ('BI','Burundi');
insert into wwv_flow_countries values ('KH','Cambodia');
insert into wwv_flow_countries values ('CM','Cameroon');
insert into wwv_flow_countries values ('CA','Canada');
insert into wwv_flow_countries values ('CV','Cape Verde');
insert into wwv_flow_countries values ('KY','Cayman Islands');
insert into wwv_flow_countries values ('CF','Central African Republic');
insert into wwv_flow_countries values ('TD','Chad');
insert into wwv_flow_countries values ('CL','Chile');
insert into wwv_flow_countries values ('CN','China');
insert into wwv_flow_countries values ('CX','Christmas Island');
insert into wwv_flow_countries values ('CC','Cocos (Keeling) Islands');
insert into wwv_flow_countries values ('CO','Colombia');
insert into wwv_flow_countries values ('KM','Comoros');
insert into wwv_flow_countries values ('CG','Congo');
insert into wwv_flow_countries values ('CK','Cook Islands');
insert into wwv_flow_countries values ('CR','Costa Rica');
insert into wwv_flow_countries values ('CI','Cote d''Ivoire');
insert into wwv_flow_countries values ('HR','Croatia');
insert into wwv_flow_countries values ('CU','Cuba');
insert into wwv_flow_countries values ('CY','Cyprus');
insert into wwv_flow_countries values ('CZ','Czech Republic');
insert into wwv_flow_countries values ('DK','Denmark');
insert into wwv_flow_countries values ('DJ','Djibouti');
insert into wwv_flow_countries values ('DM','Dominica');
insert into wwv_flow_countries values ('DO','Dominican Republic');
insert into wwv_flow_countries values ('TP','East Timor');
insert into wwv_flow_countries values ('EC','Ecuador');
insert into wwv_flow_countries values ('EG','Egypt');
insert into wwv_flow_countries values ('SV','El Salvador');
insert into wwv_flow_countries values ('GQ','Equatorial Guinea');
insert into wwv_flow_countries values ('ER','Eritrea');
insert into wwv_flow_countries values ('EE','Estonia');
insert into wwv_flow_countries values ('ET','Ethiopia');
insert into wwv_flow_countries values ('FK','Falkland Islands (Malvinas)');
insert into wwv_flow_countries values ('FO','Faroe Islands');
insert into wwv_flow_countries values ('FJ','Fiji');
insert into wwv_flow_countries values ('FI','Finland');
insert into wwv_flow_countries values ('FR','France');
insert into wwv_flow_countries values ('FX','France, Metropolitan');
insert into wwv_flow_countries values ('GF','French Guiana');
insert into wwv_flow_countries values ('PF','French Polynesia');
insert into wwv_flow_countries values ('TF','French Southern Territories');
insert into wwv_flow_countries values ('GA','Gabon');
insert into wwv_flow_countries values ('GM','Gambia');
insert into wwv_flow_countries values ('GE','Georgia');
insert into wwv_flow_countries values ('DE','Germany');
insert into wwv_flow_countries values ('GH','Ghana');
insert into wwv_flow_countries values ('GI','Gibraltar');
insert into wwv_flow_countries values ('GR','Greece');
insert into wwv_flow_countries values ('GL','Greenland');
insert into wwv_flow_countries values ('GD','Grenada');
insert into wwv_flow_countries values ('GP','Guadeloupe');
insert into wwv_flow_countries values ('GU','Guam');
insert into wwv_flow_countries values ('GT','Guatemala');
insert into wwv_flow_countries values ('GN','Guinea');
insert into wwv_flow_countries values ('GW','Guinea-Bissau');
insert into wwv_flow_countries values ('GY','Guyana');
insert into wwv_flow_countries values ('HT','Haiti');
insert into wwv_flow_countries values ('HM','Heard Island and McDonald Islands');
insert into wwv_flow_countries values ('HN','Honduras');
insert into wwv_flow_countries values ('HK','Hong Kong');
insert into wwv_flow_countries values ('HU','Hungary');
insert into wwv_flow_countries values ('IS','Iceland');
insert into wwv_flow_countries values ('IN','India');
insert into wwv_flow_countries values ('ID','Indonesia');
insert into wwv_flow_countries values ('IR','Iran (Islamic Republic of)');
insert into wwv_flow_countries values ('IQ','Iraq');
insert into wwv_flow_countries values ('IE','Ireland');
insert into wwv_flow_countries values ('IL','Israel');
insert into wwv_flow_countries values ('IT','Italy');
insert into wwv_flow_countries values ('JM','Jamaica');
insert into wwv_flow_countries values ('JP','Japan');
insert into wwv_flow_countries values ('JO','Jordan');
insert into wwv_flow_countries values ('KZ','Kazakhstan');
insert into wwv_flow_countries values ('KE','Kenya');
insert into wwv_flow_countries values ('KI','Kiribati');
insert into wwv_flow_countries values ('KP','Korea, Democratic People''s Republic of');
insert into wwv_flow_countries values ('KR','Korea, Republic of');
insert into wwv_flow_countries values ('KW','Kuwait');
insert into wwv_flow_countries values ('KG','Kyrgyzstan');
insert into wwv_flow_countries values ('LA','Lao People''s Democratic Republic');
insert into wwv_flow_countries values ('LT','Latin America');
insert into wwv_flow_countries values ('LV','Latvia');
insert into wwv_flow_countries values ('LB','Lebanon');
insert into wwv_flow_countries values ('LS','Lesotho');
insert into wwv_flow_countries values ('LR','Liberia');
insert into wwv_flow_countries values ('LY','Libyan Arab Jamahiriya');
insert into wwv_flow_countries values ('LI','Liechtenstein');
insert into wwv_flow_countries values ('LX','Lithuania');
insert into wwv_flow_countries values ('LU','Luxembourg');
insert into wwv_flow_countries values ('MO','Macau');
insert into wwv_flow_countries values ('MK','Macedonia');
insert into wwv_flow_countries values ('MG','Madagascar');
insert into wwv_flow_countries values ('MW','Malawi');
insert into wwv_flow_countries values ('MY','Malaysia');
insert into wwv_flow_countries values ('MV','Maldives');
insert into wwv_flow_countries values ('ML','Mali');
insert into wwv_flow_countries values ('MT','Malta');
insert into wwv_flow_countries values ('MH','Marshall Islands');
insert into wwv_flow_countries values ('MQ','Martinique');
insert into wwv_flow_countries values ('MR','Mauritania');
insert into wwv_flow_countries values ('MU','Mauritius');
insert into wwv_flow_countries values ('YT','Mayotte');
insert into wwv_flow_countries values ('MX','Mexico');
insert into wwv_flow_countries values ('FM','Micronesia (Federated States of)');
insert into wwv_flow_countries values ('MD','Moldova, Republic of');
insert into wwv_flow_countries values ('MC','Monaco');
insert into wwv_flow_countries values ('MN','Mongolia');
insert into wwv_flow_countries values ('MS','Montserrat');
insert into wwv_flow_countries values ('MA','Morocco');
insert into wwv_flow_countries values ('MZ','Mozambique');
insert into wwv_flow_countries values ('MM','Myanmar');
insert into wwv_flow_countries values ('NA','Namibia');
insert into wwv_flow_countries values ('NR','Nauru');
insert into wwv_flow_countries values ('NP','Nepal');
insert into wwv_flow_countries values ('NL','Netherlands');
insert into wwv_flow_countries values ('AN','Netherlands Antilles');
insert into wwv_flow_countries values ('NC','New Caledonia');
insert into wwv_flow_countries values ('NZ','New Zealand');
insert into wwv_flow_countries values ('NI','Nicaragua');
insert into wwv_flow_countries values ('NE','Niger');
insert into wwv_flow_countries values ('NG','Nigeria');
insert into wwv_flow_countries values ('NU','Niue');
insert into wwv_flow_countries values ('NF','Norfolk Island');
insert into wwv_flow_countries values ('MP','Northern Mariana Islands');
insert into wwv_flow_countries values ('NO','Norway');
insert into wwv_flow_countries values ('OM','Oman');
insert into wwv_flow_countries values ('PK','Pakistan');
insert into wwv_flow_countries values ('PW','Palau');
insert into wwv_flow_countries values ('PA','Panama');
insert into wwv_flow_countries values ('PG','Papua New Guinea');
insert into wwv_flow_countries values ('PY','Paraguay');
insert into wwv_flow_countries values ('PE','Peru');
insert into wwv_flow_countries values ('PH','Philippines');
insert into wwv_flow_countries values ('PN','Pitcairn');
insert into wwv_flow_countries values ('PL','Poland');
insert into wwv_flow_countries values ('PT','Portugal');
insert into wwv_flow_countries values ('PR','Puerto Rico');
insert into wwv_flow_countries values ('QA','Qatar');
insert into wwv_flow_countries values ('RE','Reunion');
insert into wwv_flow_countries values ('RO','Romania');
insert into wwv_flow_countries values ('RU','Russian Federation');
insert into wwv_flow_countries values ('RW','Rwanda');
insert into wwv_flow_countries values ('SH','Saint Helena');
insert into wwv_flow_countries values ('KN','Saint Kitts and Nevis');
insert into wwv_flow_countries values ('LC','Saint Lucia');
insert into wwv_flow_countries values ('PM','Saint Pierre and Miquelon');
insert into wwv_flow_countries values ('VC','Saint Vincent and the Grenadines');
insert into wwv_flow_countries values ('WS','Samoa');
insert into wwv_flow_countries values ('SM','San Marino');
insert into wwv_flow_countries values ('ST','Sao Tome and Principe');
insert into wwv_flow_countries values ('SA','Saudi Arabia');
insert into wwv_flow_countries values ('SN','Senegal');
insert into wwv_flow_countries values ('SC','Seychelles');
insert into wwv_flow_countries values ('SL','Sierra Leone');
insert into wwv_flow_countries values ('SG','Singapore');
insert into wwv_flow_countries values ('SK','Slovakia');
insert into wwv_flow_countries values ('SI','Slovenia');
insert into wwv_flow_countries values ('SB','Solomon Islands');
insert into wwv_flow_countries values ('SO','Somalia');
insert into wwv_flow_countries values ('ZA','South Africa');
insert into wwv_flow_countries values ('GS','South Georgia and the South Sandwich Island');
insert into wwv_flow_countries values ('ES','Spain');
insert into wwv_flow_countries values ('LK','Sri Lanka');
insert into wwv_flow_countries values ('SD','Sudan');
insert into wwv_flow_countries values ('SR','Suriname');
insert into wwv_flow_countries values ('SJ','Svalbard and Jan Mayen Islands');
insert into wwv_flow_countries values ('SZ','Swaziland');
insert into wwv_flow_countries values ('SE','Sweden');
insert into wwv_flow_countries values ('CH','Switzerland');
insert into wwv_flow_countries values ('SY','Syrian Arab Republic');
insert into wwv_flow_countries values ('TW','Taiwan');
insert into wwv_flow_countries values ('TJ','Tajikistan');
insert into wwv_flow_countries values ('TZ','Tanzania, United Republic of');
insert into wwv_flow_countries values ('TH','Thailand');
insert into wwv_flow_countries values ('TG','Togo');
insert into wwv_flow_countries values ('TK','Tokelau');
insert into wwv_flow_countries values ('TO','Tonga');
insert into wwv_flow_countries values ('TT','Trinidad and Tobago');
insert into wwv_flow_countries values ('TN','Tunisia');
insert into wwv_flow_countries values ('TR','Turkey');
insert into wwv_flow_countries values ('TM','Turkmenistan');
insert into wwv_flow_countries values ('TC','Turks and Caicos Islands');
insert into wwv_flow_countries values ('TV','Tuvalu');
insert into wwv_flow_countries values ('UG','Uganda');
insert into wwv_flow_countries values ('UA','Ukraine');
insert into wwv_flow_countries values ('AE','United Arab Emirates');
insert into wwv_flow_countries values ('GB','United Kingdom');
insert into wwv_flow_countries values ('US','United States');
insert into wwv_flow_countries values ('UM','United States Minor Outlying Islands');
insert into wwv_flow_countries values ('UY','Uruguay');
insert into wwv_flow_countries values ('UZ','Uzbekistan');
insert into wwv_flow_countries values ('VU','Vanuatu');
insert into wwv_flow_countries values ('VA','Vatican City State (Holy See)');
insert into wwv_flow_countries values ('VE','Venezuela');
insert into wwv_flow_countries values ('VN','Viet Nam');
insert into wwv_flow_countries values ('VG','Virgin Islands (British)');
insert into wwv_flow_countries values ('VI','Virgin Islands (U.S.)');
insert into wwv_flow_countries values ('WF','Wallis and Futuna Islands');
insert into wwv_flow_countries values ('EH','Western Sahara');
insert into wwv_flow_countries values ('YE','Yemen');
insert into wwv_flow_countries values ('YU','Yugoslavia');
insert into wwv_flow_countries values ('ZR','Zaire');
insert into wwv_flow_countries values ('ZM','Zambia');
insert into wwv_flow_countries values ('ZW','Zimbabwe');

set feedback on;

commit;

