set define '^'
set verify off
prompt ...create team development objects


Rem  Copyright (c) Oracle Corporation 1999 - 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      team_tab.sql
Rem
Rem    DESCRIPTION
Rem      Team development object creation script.  create tables, views,
Rem      sequences, Indexes
Rem
Rem
Rem    RUNTIME DEPLOYMENT: NO
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jstraub  09/21/2009 - Created, moved from tab.sql
Rem       arayner  09/23/2009 - Added wwv_flow_todo_list and wwv_flow_todo_list_items tables and triggers
Rem       mhichwa  09/23/2009 - removed _impact_yn columns from wwv_flow_features table, as these will not be used
Rem       mhichwa  09/23/2009 - added view wwv_flow_feature_cols
Rem       arayner  09/24/2009 - Added unique constraints on wwv_flow_todo_list and wwv_flow_todo_list_items tables
Rem       arayner  09/24/2009 - Added item_scope column to wwv_flow_todo_list_items
Rem       arayner  09/24/2009 - Added sequence column to wwv_flow_todo_list_items
Rem       mhichwa  09/25/2009 - Added 0 to wwv_flow_feedback_status view
Rem       mhichwa  09/28/2009 - added feature component yn flags for preferences
Rem       mhichwa  09/30/2009 - added table wwv_flow_team_files, added foreign keys to tasks,events,feedback, and bugs
Rem       jkallman 10/05/2009 - Move wwv_flow_team_files down in the file to avoid error when creating fk constraint for objects which arent created yet
Rem       mhichwa  10/06/2009 - Changed indexes for bugs table to ensure proper uniqueness, i2, i3, i4 changed.
Rem       mhichwa  10/20/2009 - added view for todo status
Rem       mhichwa  10/23/2009 - Added start date
Rem       mhichwa  10/27/2009 - changed trigger wwv_flow_feedback_t1 to log feedback on internal into internal schema
Rem       mhichwa  10/27/2009 - added column logging_security_group_id to track sgid that logged request
Rem       mhichwa  10/28/2009 - tweaked trigger wwv_flow_features_t1 to get around invalid number errors
Rem       mhichwa  10/29/2009 - added selectable_from_features_yn
Rem       mhichwa  11/03/2009 - put logging_security_group id in the proper table, moved from features to feedback
Rem       mhichwa  11/03/2009 - added  wwv_flow_features_par_feat_fk foreign key
Rem       mhichwa  11/04/2009 - prevent storing bug relase as percent null percent
Rem       mhichwa  11/04/2009 - improved trigger on tasks table
Rem       mhichwa  11/10/2009 - changed estimated_effort_in_days to estimated_effort_in_hours for tasks aka to dos
Rem       mhichwa  11/17/2009 - added synonym and grant for wwv_flow_feedback_types
Rem       mhichwa  11/25/2009 - added attribute 01 to 08 for feedback to support application specific feedback
Rem       mhichwa  11/25/2009 - added logging_email to feedback
Rem       mhichwa  11/26/2009 - added indexes to feedback table
Rem       mhichwa  11/30/2009 - moved team dev views to team_tab.sql as team dev view are not needed for runtime only operation
Rem       jstraub  12/03/2009 - Moved out wwv_flow_feedback objects to tab.sql, trigger.sql and apex_views.sql
Rem       mhichwa  12/05/2009 - removed column estimated effort in days from todo view, column is not needed or used
Rem       mhichwa  12/18/2009 - added publishable_description and publishable_yn
Rem       mhichwa  12/21/2009 - indexed unindexed foreign keys
Rem       jkallman 12/21/2009 - Correct names of misnamed unindexed foreign keys
Rem       mhichwa  12/21/2009 - made wwv_flow_bugs_idx3 not unique
Rem       mhichwa  12/30/2009 - do not set todo status to 10 percent on assignment, allow 0 percent
Rem       mhichwa  12/30/2009 - changed zero status to not started from unassigned
Rem       mhichwa  02/22/2010 - added not required to doc status view
Rem       jkallman 02/25/2010 - Replace all occurrences of apex_application.g_user with the correct wwv_flow.g_user
Rem       mhichwa  03/17/2010 - wwv_flow_task_priorities removed
Rem       jkallman 04/01/2010 - Moved wwv_flow_team_tags to tab.sql
Rem       arayner  04/06/2010 - Removed wwv_flow_todo_list and wwv_flow_todo_list_items tables and corresponding triggers
Rem       sbkenned 04/16/2010 - modified wwv_flow_tasks to put all columns in create (rather than having alter table statements)
Rem       sbkenned 04/29/2010 - added comments to team dev views
Rem       jkallman 05/18/2010 - Added wwv_flow.g_workspace_delete_in_progress to triggers wwv_flow_bugs_t2, wwv_flow_features_t2, wwv_flow_links_t2,
Rem                             wwv_flow_events_t2, wwv_flow_tasks_t2 (Bug 9652683)
Rem       jkallman 11/09/2010 - Normalized case and trimmed assignees in triggers wwv_flow_tasks_t1 and wwv_flow_features_t1 (Bug 10098045)
Rem       jkallman 11/22/2010 - Change APEX_040000 references to APEX_040100
Rem       sathikum 02/24/2011 - Modified views condition (feature #608)
Rem       sathikum 12/07/2011 - Fixed #13426740 modified APEX_ views
Rem       pawolf   02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem       cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem       jkallman 12/17/2012 - Change APEX_040200 references to APEX_050000
Rem       cneumuel 08/01/2014 - In apex_team_bugs, apex_team_milestones, apex_team_todos, apex_team_features: added sys.dual in from clause (bug #19306482)
Rem       cneumuel 08/04/2014 - In apex_team_bugs, apex_team_milestones, apex_team_todos, apex_team_features: use wwv_flow_current_sgid instead of sys.dual (bug #19306482)
Rem       cneumuel 08/05/2014 - Removed grants to public
Rem       pawolf   11/26/2014 - Added application_id and page_id to existing indexes

--
-- News
--

create table wwv_flow_news
(
  id                       number,
   news_text                varchar2(200),
  security_group_id        number not null
                           constraint wwv_news_fk
                           references wwv_flow_companies(provisioning_company_id)
                           on delete cascade,
   created_by               varchar2(255) not null,
   created_on               date not null,
   last_updated_by          varchar2(255),
   last_updated_on          date,
   constraint               wwv_news_pk primary key (id) enable
)
/

create unique index wwv_flow_news_idx1 on wwv_flow_news(security_group_id, id);


----------------------------------
-- T E A M   D E V E L O P M E N T
--

create table  wwv_flow_links (
   id                                number,
   link_name                         varchar2(255) not null enable,
   link_target                       varchar2(4000) not null enable,
   link_category                     varchar2(255),
   link_desc                         varchar2(4000),
   tags                              varchar2(4000),
   security_group_id                 number not null
                                     constraint wwv_links_fk
                                    references wwv_flow_companies(provisioning_company_id)
                                    on delete cascade,
   created_by                        varchar2(255) not null enable,
   created_on                        date not null enable,
   updated_by                        varchar2(255),
   updated_on                        date,
   constraint wwv_flow_links_pk      primary key (id) enable
)
/

create index wwv_flow_links_idx1 on wwv_flow_links (security_group_id)
/


--
-- bugs
--
create or replace view wwv_flow_bug_status_codes as
select 10 id, wwv_flow_lang.system_message('ENTERED') the_name from sys.dual union all
select 20 id, wwv_flow_lang.system_message('CONFIRMED') the_name from sys.dual union all
select 30 id, wwv_flow_lang.system_message('ASSIGNED') the_name from sys.dual union all
select 40 id, wwv_flow_lang.system_message('IN_PROGRESS') the_name from sys.dual union all
select 80 id, wwv_flow_lang.system_message('FIXED_IN_DEVELOPMENT') the_name from sys.dual union all
select 90 id, wwv_flow_lang.system_message('CONFIRMED_BY_QA') the_name from sys.dual union all
select 100 id, wwv_flow_lang.system_message('COMPLETE') the_name from sys.dual union all
select 200 id, wwv_flow_lang.system_message('DUPLICATE') the_name from sys.dual union all
select 300 id, wwv_flow_lang.system_message('NOT_FEASIBLE_TO_FIX') the_name from sys.dual union all
select 0 id, wwv_flow_lang.system_message('NOT_A_BUG') the_name from sys.dual
/


create or replace view wwv_flow_bug_severity as
select 1 id, wwv_flow_lang.system_message('PRODUCTION_DOWN') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('NO_WORKAROUND_AVAILABLE') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('SIGNIFICANT_IMPACT') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('MODERATE_IMPACT') the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('MINIMAL_IMPACT') the_name from sys.dual union all
select 0 id, wwv_flow_lang.system_message('UNKNOWN') the_name from sys.dual
/

create or replace view wwv_flow_bug_priority as
select 1 id, wwv_flow_lang.system_message('ASAP') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('BY_NEXT_PATCH') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('BY_NEXT_RELEASE') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('NOT_PRORITIZED') the_name from sys.dual
/

create table wwv_flow_bugs (
  id                          number,
  bug_id                      number,
  product                     varchar2(255),
  product_version             varchar2(255),
  assigned_to                 varchar2(255),
  component                   varchar2(255),
  bug_severity                number,
  bug_status                  number,
  priority                    number,
  fix_by_release              varchar2(255),
  tags                        varchar2(4000),
  estimated_fix_date          date,
  actual_fix_date             date,
  --
  bug_title                   varchar2(255),
  bug_description             clob,
  --
  reported_platform           varchar2(255),
  reported_browser            varchar2(255),
  reported_operating_system   varchar2(255),
  --
  application_id              number,
  page_id                     number,
  impact                      varchar2(4000),
  --
  feature_id                  number,
  target_milestone_id         number,
  task_id                     number,
  --
  duplicate_of_bug            number,
  --
  customer_name               varchar2(255),
  customer_issue              clob,
  --
  security_group_id                 number not null
                                   constraint wwv_flow_bug_fk
                                    references wwv_flow_companies(provisioning_company_id)
                                    on delete cascade,
   created_by                        varchar2(255) not null enable,
   created_on                        date not null enable,
   updated_by                        varchar2(255),
   updated_on                        date,
   constraint wwv_flow_bug_pk        primary key (id) enable
)
/

create index wwv_flow_bugs_idx1 on wwv_flow_bugs (security_group_id, application_id, page_id)
/
create unique index wwv_flow_bugs_idx2 on wwv_flow_bugs (security_group_id, bug_id)
/
create index wwv_flow_bugs_idx3 on wwv_flow_bugs (security_group_id, feature_id)
/
create index wwv_flow_bugs_idx4 on wwv_flow_bugs (created_on)
/


--
-- Events aka milestones
--

create table  wwv_flow_events (
   id                                number,
   event_id                          number,
   event_name                        varchar2(255) not null enable,
   event_date                        date,
   event_type                        varchar2(255),
   release                           varchar2(255),
   event_desc                        clob,
   tags                              varchar2(4000),
   event_owner                       varchar2(255),
   selectable_from_features_yn       varchar2(1),
   security_group_id                 number not null
                                     constraint wwv_events_fk
                                    references wwv_flow_companies(provisioning_company_id)
                                    on delete cascade,
   created_by                        varchar2(255) not null enable,
   created_on                        date not null enable,
   updated_by                        varchar2(255),
   updated_on                        date,
   constraint wwv_flow_events_pk     primary key (id) enable
)
/

create index wwv_flow_events_idx1 on wwv_flow_events (security_group_id)
/
create index wwv_flow_events_idx2 on wwv_flow_events (event_date)
/
create index wwv_flow_events_idx3 on wwv_flow_events (event_id)
/


create or replace view wwv_flow_feature_desirability
as
select 1 id, wwv_flow_lang.system_message('MARQUEE_FEATURE')      the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('HIGHLY_DESIRABLE')     the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('DESIRABLE')   the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('NOT_DESIRABLE')        the_name from sys.dual
/

create or replace view wwv_flow_feature_priorities
as
select 1 id, wwv_flow_lang.system_message('ASAP') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('PRIORITIZED') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('NORMAL_PRIORITY') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('LOW_PRIORITY') the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('NOT_PRIORITIZED') the_name from sys.dual
/


create or replace view wwv_flow_feature_docstatus
as
select 0 id, wwv_flow_lang.system_message('NO_STATUS')        the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NOT_STARTED')      the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('RESEARCHING')      the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('NEED_INFORMATION') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('WRITING')          the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('REVIEWING')        the_name from sys.dual union all
select 6 id, wwv_flow_lang.system_message('COMPLETED')        the_name from sys.dual union all
select 7 id, wwv_flow_lang.system_message('ARCHIVED')         the_name from sys.dual union all
select 10 id, wwv_flow_lang.system_message('NOT_REQUIRED')    the_name from sys.dual
/

create or replace view wwv_flow_feature_teststat
as
select 0 id, wwv_flow_lang.system_message('NO_STATUS')        the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NOT_STARTED')      the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('RESEARCHING')      the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('WRITING')          the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('REVIEWING')        the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETED')        the_name from sys.dual
/

create or replace view wwv_flow_feature_secstat
as
select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual
/


create or replace view wwv_flow_feature_accstat
as
select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual
/

create or replace view wwv_flow_feature_globstat
as
select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual
/

create or replace view wwv_flow_feature_uistat
as
select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual
/

create table wwv_flow_features (
    id                                number not null,
    feature_id                        number,
    feature_name                      varchar2(255) not null,
    feature_owner                     varchar2(255),
    feature_contributor               varchar2(255),
    focus_area                        varchar2(255),
    release                           varchar2(255),
    feature_desc                      clob,
    justification                     varchar2(4000),
    feature_tags                      varchar2(4000),
    feature_priority                  number,
    feature_status                    number,
    feature_desirability              number,
    due_date                          date,
    start_date                        date,
    module                            varchar2(255),
    estimated_effort_in_hours         number,
    --
    publishable_yn                    varchar2(1),
    publishable_description           varchar2(4000),
    --
    globalization_impact              varchar2(4000),
    globalization_assignee            varchar2(255),
    globalization_status              number,
    --
    user_interface_impact             varchar2(4000),
    user_interface_assignee           varchar2(255),
    user_interface_status             number,
    --
    doc_impact                        varchar2(4000),
    doc_status                        number,
    doc_writer                        varchar2(255),
    --
    testing_impact                    varchar2(4000),
    testing_assignee                  varchar2(255),
    testing_status                    number,
    --
    security_impact                   varchar2(4000),
    security_assignee                 varchar2(255),
    security_status                   number,
    --
    accessibility_impact              varchar2(4000),
    accessibility_assignee            varchar2(255),
    accessibility_status              number,
    --
    application_id                    number,
    parent_feature_id                 number,
    event_id                          number,
    --
   security_group_id                 number not null
                                       constraint wwv_features_fk
                                      references wwv_flow_companies(provisioning_company_id)
                                      on delete cascade,
   created_by                        varchar2(255) not null enable,
   created_on                        date not null enable,
   updated_by                        varchar2(255),
   updated_on                        date,
   constraint wwv_flow_features_pk   primary key (id) enable
)
/

create index wwv_flow_features_idx1 on wwv_flow_features (security_group_id, application_id, module)
/
create index wwv_flow_features_idx2 on wwv_flow_features (updated_on)
/
create index wwv_flow_features_idx3 on wwv_flow_features (due_date)
/
create index wwv_flow_features_idx4 on wwv_flow_features (parent_feature_id)
/
create index wwv_flow_features_idx5 on wwv_flow_features (feature_owner)
/
create index wwv_flow_features_idx6 on wwv_flow_features (feature_contributor)
/
create unique index wwv_flow_features_idx7 on wwv_flow_features (security_group_id, feature_id)
/

ALTER TABLE wwv_flow_features ADD CONSTRAINT wwv_flow_features_par_feat_fk FOREIGN KEY (parent_feature_id) REFERENCES wwv_flow_features (id);



create table wwv_flow_feature_history (
    id                     number,
    feature_id             number
                           constraint wwv_flow_feature_hist_fk
                           references wwv_flow_features (id)
                           on delete cascade,
    column_name            varchar2(255),
    column_data_type       varchar2(255),
    old_value_varchar2     varchar2(4000),
    new_value_varchar2     varchar2(4000),
    old_value_clob         clob,
    new_value_club         clob,
    security_group_id      number
                           constraint wwv_flow_feature_hist_wg_fk
                           references wwv_flow_companies(provisioning_company_id)
                           on delete cascade,
    created_by             varchar2(255),
    created_on             date,
    constraint wwv_flow_feature_hist_pk primary key (id) enable
)
/

create index wwv_flow_feature_hist_idx1 on wwv_flow_feature_history(security_group_id)
/
create index wwv_flow_feature_hist_idx2 on wwv_flow_feature_history(created_on)
/
create index wwv_flow_feature_hist_idx3 on wwv_flow_feature_history(created_by)
/
create index wwv_flow_feature_hist_idx4 on wwv_flow_feature_history(feature_id)
/

create table wwv_flow_feature_progress (
    id                     number,
    feature_id             number
                           constraint wwv_flow_feature_prog_fk
                           references wwv_flow_features (id)
                           on delete cascade,
    progress_note          varchar2(4000),
    security_group_id      number
                           constraint wwv_flow_feature_prog_wg_fk
                           references wwv_flow_companies(provisioning_company_id)
                           on delete cascade,
    created_by             varchar2(255),
    created_on             date,
    updated_by             varchar2(255),
    updated_on             date,
    constraint wwv_flow_feature_prog_pk primary key (id) enable
)
/

create index wwv_flow_feature_progress_idx1 on wwv_flow_feature_progress(security_group_id)
/
create index wwv_flow_feature_progress_idx2 on wwv_flow_feature_progress(feature_id)
/


create table  wwv_flow_tasks (
    id                         number,
    friendly_id                number,
    assigned_to                varchar2(255),
    contributor                varchar2(255),
    task_name                  varchar2(255) not null enable,
    description                clob,
    task_status                number,
    task_category              varchar2(255),
    task_tags                  varchar2(4000),
    start_date                 date,
    due_date                   date,
    date_completed             date,
    application_id             number,
    page_id                    number,
    websheet_id                number,
    product_version            varchar2(255),
    ref_component_type         varchar2(30),
    customer_details           varchar2(4000),
    event_id                   number,
    feature_id                 number,
    parent_task_id             number,
    task_group                 varchar2(255),
    estimated_effort_in_hours  number,
    release                    varchar2(255),
    --
    security_group_id      NUMBER
                           constraint wwv_flow_tasks_fk
                           references wwv_flow_companies(provisioning_company_id)
                           on delete cascade,
    CREATED_BY             VARCHAR2(255),
    CREATED_ON             DATE,
    UPDATED_BY             VARCHAR2(255),
    UPDATED_ON             DATE,
    CONSTRAINT wwv_flow_TASKS_PK PRIMARY KEY (ID) ENABLE
)
/

create index  wwv_flow_tasks_idx1 on  wwv_flow_tasks (security_group_id, application_id, page_id)
/
create index  wwv_flow_tasks_idx2 on  wwv_flow_tasks (updated_on)
/
create index  wwv_flow_tasks_idx3 on  wwv_flow_tasks (friendly_id, security_group_id)
/


create table wwv_flow_task_progress (
    id                     number,
    task_id                number
                           constraint wwv_flow_task_prog_fk
                           references wwv_flow_tasks (id)
                           on delete cascade,
    progress_note          varchar2(4000),
    security_group_id      number
                           constraint wwv_flow_task_prog_wg_fk
                           references wwv_flow_companies(provisioning_company_id)
                           on delete cascade,
    created_by             varchar2(255),
    created_on             date,
    updated_by             varchar2(255),
    updated_on             date,
    constraint wwv_flow_tasks_prog_pk primary key (id) enable
)
/

create index wwv_flow_task_progress_idx1 on wwv_flow_task_progress(security_group_id)
/
create index wwv_flow_task_progress_idx2 on wwv_flow_task_progress(task_id)
/


create table wwv_flow_task_defaults (
    id                     number,
    default_release        varchar2(255),
    default_assignee       varchar2(255),
    default_priority       number,
    show_all_or_open       varchar2(30),
    enable_feature_ui_yn   varchar2(1),
    enable_feature_test_yn varchar2(1),
    enable_feature_doc_yn  varchar2(1),
    enable_feature_glob_yn varchar2(1),
    enable_feature_sec_yn  varchar2(1),
    enable_feature_acc_yn  varchar2(1),
    --
    security_group_id      number
                           constraint wwv_flow_task_def_wg_fk
                           references wwv_flow_companies(provisioning_company_id)
                           on delete cascade,
    created_by             varchar2(255),
    created_on             date,
    updated_by             varchar2(255),
    updated_on             date,
    constraint wwv_flow_tasks_def_pk primary key (id) enable
)
/

create unique index wwv_flow_task_defaults_idx1 on wwv_flow_task_defaults(security_group_id)
/

create or replace view wwv_flow_feature_def_st_codes
as
select 0   pct_complete, wwv_flow_lang.system_message('NOT_STARTED')                  status_name from sys.dual union all
select 10  pct_complete, wwv_flow_lang.system_message('UNDER_CONSIDERATION')          status_name from sys.dual union all
select 20  pct_complete, wwv_flow_lang.system_message('APPROVED')                     status_name from sys.dual union all
select 30  pct_complete, wwv_flow_lang.system_message('ASSIGNED')                     status_name from sys.dual union all
select 40  pct_complete, wwv_flow_lang.system_message('WORK_INITIATED')               status_name from sys.dual union all
select 50  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 60  pct_complete, wwv_flow_lang.system_message('SIGNIFICANT_PROGRESS')         status_name from sys.dual union all
select 70  pct_complete, wwv_flow_lang.system_message('DEMONSTRABLE')                 status_name from sys.dual union all
select 80  pct_complete, wwv_flow_lang.system_message('FUNCTIONALLY_COMPLETE')        status_name from sys.dual union all
select 90  pct_complete, wwv_flow_lang.system_message('INTEGRATION_COMPLETE')         status_name from sys.dual union all
select 100 pct_complete, wwv_flow_lang.system_message('COMPLETE')                     status_name from sys.dual
/

create or replace view wwv_flow_task_def_status_codes
as
select 0   pct_complete, wwv_flow_lang.system_message('NOT_STARTED')                  status_name from sys.dual union all
select 10  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 20  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 30  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 40  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 50  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 60  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 70  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 80  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 90  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 100 pct_complete, wwv_flow_lang.system_message('COMPLETE')                     status_name from sys.dual
/


create table wwv_flow_teamdev_tag_cloud (
    id                     number,
    tag                    varchar2(255),
    feature_id             number constraint wwv_flow_teamdev_tc_f
                                  references wwv_flow_features (id)
                                  on delete cascade,
    task_id                number constraint wwv_flow_teamdev_tc_t
                                  references wwv_flow_tasks (id)
                                  on delete cascade,
    bug_id                 number constraint wwv_flow_teamdev_tc_b
                                  references wwv_flow_bugs
                                  on delete cascade,
    --
    security_group_id      number
                           constraint wwv_flow_task_tc_fk
                           references wwv_flow_companies(provisioning_company_id)
                           on delete cascade,
    created_by             varchar2(255),
    created_on             date,
    updated_by             varchar2(255),
    updated_on             date,
    constraint wwv_flow_teamdev_tc_pk primary key (id) enable
)
/

create unique index wwv_flow_teamdev_tc_idx1 on wwv_flow_teamdev_tag_cloud(security_group_id)
/
create unique index wwv_flow_teamdev_tc_idx2 on wwv_flow_teamdev_tag_cloud(tag)
/
create unique index wwv_flow_teamdev_tc_idx3 on wwv_flow_teamdev_tag_cloud(feature_id)
/
create unique index wwv_flow_teamdev_tc_idx4 on wwv_flow_teamdev_tag_cloud(task_id)
/
create unique index wwv_flow_teamdev_tc_idx5 on wwv_flow_teamdev_tag_cloud(bug_id)
/


create table wwv_flow_team_files (
  id                                 number,
  security_group_id                  number not null
                                    constraint wwv_flow_team_files_fk
                                     references wwv_flow_companies(provisioning_company_id)
                                     on delete cascade,
  file_type                          varchar2(30)
                                     constraint wwv_flow_team_file_tp
                                     check (file_type in ('FEATURE','TODO','BUG','MILESTONE','FEEDBACK')),
  feature_id                         number
                                     constraint wwv_flow_team_files_fk1
                                     references wwv_flow_features (id)
                                     on delete cascade,
  task_id                            number
                                     constraint wwv_flow_team_files_fk2
                                     references wwv_flow_tasks
                                     on delete cascade,
  event_id                           number
                                     constraint wwv_flow_team_files_fk3
                                     references wwv_flow_events
                                     on delete cascade,
  feedback_id                        number
                                     constraint wwv_flow_team_files_fk4
                                     references wwv_flow_feedback
                                     on delete cascade,
  bug_id                             number
                                     constraint wwv_flow_team_files_fk5
                                     references wwv_flow_feedback
                                     on delete cascade,
  file_name                          varchar2(1000),
  file_mime_type                     varchar2(255),
  file_character_set                 varchar2(255),
  file_last_update                   date,
  created_on                         date,
  created_by                         date,
   constraint wwv_flow_team_files_pk  primary key (id) enable
  )
/

create index wwv_flow_team_files_idx1 on wwv_flow_team_files (security_group_id);
create index wwv_flow_team_files_idx2 on wwv_flow_team_files (feature_id);
create index wwv_flow_team_files_idx3 on wwv_flow_team_files (task_id);
create index wwv_flow_team_files_idx4 on wwv_flow_team_files (event_id);
create index wwv_flow_team_files_idx5 on wwv_flow_team_files (feedback_id);
create index wwv_flow_team_files_idx6 on wwv_flow_team_files (bug_id);



create or replace view wwv_flow_feature_cols as
select 'FEATURE_NAME' cname, wwv_flow_lang.system_message('FEATURE_NAME') cmessage from sys.dual union all
select 'FEATURE_OWNER' cname, wwv_flow_lang.system_message('FEATURE_OWNER') cmessage from sys.dual union all
select 'FOCUS_AREA' cname, wwv_flow_lang.system_message('FOCUS_AREA') cmessage from sys.dual union all
select 'RELEASE ' cname, wwv_flow_lang.system_message('RELEASE ') cmessage from sys.dual union all
select 'FEATURE_DESC' cname, wwv_flow_lang.system_message('FEATURE_DESC') cmessage from sys.dual union all
select 'GLOBALIZATION_IMPACT' cname, wwv_flow_lang.system_message('GLOBALIZATION_IMPACT') cmessage from sys.dual union all
select 'DOC_IMPACT' cname, wwv_flow_lang.system_message('DOC_IMPACT') cmessage from sys.dual union all
select 'TESTING_IMPACT' cname, wwv_flow_lang.system_message('TESTING_IMPACT') cmessage from sys.dual union all
select 'SECURITY_IMPACT' cname, wwv_flow_lang.system_message('SECURITY_IMPACT') cmessage from sys.dual union all
select 'ACCESSIBILITY_IMPACT' cname, wwv_flow_lang.system_message('ACCESSIBILITY_IMPACT') cmessage from sys.dual union all
select 'FEATURE_TAGS' cname, wwv_flow_lang.system_message('FEATURE_TAGS') cmessage from sys.dual union all
select 'FEATURE_PRIORITY' cname, wwv_flow_lang.system_message('FEATURE_PRIORITY') cmessage from sys.dual union all
select 'FEATURE_STATUS' cname, wwv_flow_lang.system_message('FEATURE_STATUS') cmessage from sys.dual union all
select 'APPLICATION_ID' cname, wwv_flow_lang.system_message('APPLICATION_ID') cmessage from sys.dual union all
select 'FEATURE_DESIRABILITY' cname, wwv_flow_lang.system_message('FEATURE_DESIRABILITY') cmessage from sys.dual union all
select 'PARENT_FEATURE_ID' cname, wwv_flow_lang.system_message('PARENT_FEATURE_ID') cmessage from sys.dual union all
select 'DUE_DATE' cname, wwv_flow_lang.system_message('DUE_DATE') cmessage from sys.dual union all
select 'START_DATE' cname, wwv_flow_lang.system_message('START_DATE') cmessage from sys.dual union all
select 'EVENT_ID' cname, wwv_flow_lang.system_message('EVENT_ID') cmessage from sys.dual union all
select 'DOC_STATUS' cname, wwv_flow_lang.system_message('DOC_STATUS') cmessage from sys.dual union all
select 'USER_INTERFACE_IMPACT' cname, wwv_flow_lang.system_message('USER_INTERFACE_IMPACT') cmessage from sys.dual union all
select 'DOC_WRITER' cname, wwv_flow_lang.system_message('DOC_WRITER') cmessage from sys.dual union all
select 'FEATURE_CONTRIBUTOR' cname, wwv_flow_lang.system_message('FEATURE_CONTRIBUTOR') cmessage from sys.dual union all
select 'JUSTIFICATION' cname, wwv_flow_lang.system_message('JUSTIFICATION') cmessage from sys.dual union all
select 'GLOBALIZATION_ASSIGNEE' cname, wwv_flow_lang.system_message('GLOBALIZATION_ASSIGNEE') cmessage from sys.dual union all
select 'USER_INTERFACE_ASSIGNEE' cname, wwv_flow_lang.system_message('USER_INTERFACE_ASSIGNEE') cmessage from sys.dual union all
select 'TESTING_ASSIGNEE' cname, wwv_flow_lang.system_message('TESTING_ASSIGNEE') cmessage from sys.dual union all
select 'SECURITY_ASSIGNEE' cname, wwv_flow_lang.system_message('SECURITY_ASSIGNEE') cmessage from sys.dual union all
select 'ACCESSIBILITY_ASSIGNEE' cname, wwv_flow_lang.system_message('ACCESSIBILITY_ASSIGNEE') cmessage from sys.dual union all
select 'TESTING_STATUS' cname, wwv_flow_lang.system_message('TESTING_STATUS') cmessage from sys.dual union all
select 'MODULE' cname, wwv_flow_lang.system_message('MODULE  ') cmessage from sys.dual union all
select 'ESTIMATED_EFFORT_IN_HOURS' cname, wwv_flow_lang.system_message('ESTIMATED_EFFORT_IN_HOURS') cmessage from sys.dual union all
select 'SECURITY_STATUS' cname, wwv_flow_lang.system_message('SECURITY_STATUS') cmessage from sys.dual union all
select 'ACCESSIBILITY_STATUS' cname, wwv_flow_lang.system_message('ACCESSIBILITY_STATUS') cmessage from sys.dual union all
select 'GLOBALIZATION_STATUS' cname, wwv_flow_lang.system_message('GLOBALIZATION_STATUS') cmessage from sys.dual union all
select 'USER_INTERFACE_STATUS' cname, wwv_flow_lang.system_message('USER_INTERFACE_STATUS') cmessage from sys.dual
/



--
-- team development triggers
--

prompt ...trigger wwv_flow_team_tags

create or replace trigger  wwv_flow_team_tags_t1
before insert or update on wwv_flow_team_tags
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.tag := upper(:new.tag);
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end wwv_flow_team_tags_t1;
/
ALTER TRIGGER wwv_flow_team_tags_t1 ENABLE
/


prompt ...trigger wwv_flow_bugs_t1

create or replace trigger  wwv_flow_bugs_t1
before insert or update on wwv_flow_bugs
for each row
begin
     if :new.fix_by_release = '%'||'null%' then
        :new.fix_by_release := null;
     end if;
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
    :new.assigned_to := trim(lower(:new.assigned_to));

    --
    -- TAG
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'BUG',
        p_component_id      => :new.id,
        p_new_tags          => :new.TAGS,
        p_security_group_id => :new.security_group_id);

    --
    -- friendly id
    --
    if :new.bug_id is null and (inserting or updating) then
       select nvl(max(bug_id),0) + 1 into :new.bug_id from wwv_flow_bugs where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
    end if;

end wwv_flow_bugs_t1;
/
ALTER TRIGGER  wwv_flow_bugs_T1 ENABLE
/

prompt ...trigger wwv_flow_bugs_t2

create or replace trigger wwv_flow_bugs_t2
after delete on wwv_flow_bugs
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_bugs_t2;
/
alter trigger  wwv_flow_bugs_t2 enable
/



prompt ...trigger wwv_flow_features_t1

create or replace trigger  wwv_flow_features_t1
before insert or update on wwv_flow_features
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;

    :new.feature_owner := trim(lower(:new.feature_owner));
    :new.feature_contributor := trim(lower(:new.feature_contributor));
    :new.globalization_assignee := trim(lower(:new.globalization_assignee));
    :new.user_interface_assignee := trim(lower(:new.user_interface_assignee));
    :new.testing_assignee := trim(lower(:new.testing_assignee));
    :new.security_assignee := trim(lower(:new.security_assignee));
    :new.accessibility_assignee := trim(lower(:new.accessibility_assignee));


    if updating then

    if nvl(:old.FEATURE_NAME,'1') != nvl(:new.FEATURE_NAME,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_NAME','VARCHAR2',:old.FEATURE_NAME,:new.FEATURE_NAME);
    end if;
    if nvl(:old.FEATURE_OWNER,'1') != nvl(:new.FEATURE_OWNER,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_OWNER','VARCHAR2',:old.FEATURE_OWNER,:new.FEATURE_OWNER);
    end if;
    if nvl(:old.FEATURE_CONTRIBUTOR,'1') != nvl(:new.FEATURE_CONTRIBUTOR,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_CONTRIBUTOR','VARCHAR2',:old.FEATURE_CONTRIBUTOR,:new.FEATURE_CONTRIBUTOR);
    end if;
    --
    if nvl(:old.ESTIMATED_EFFORT_IN_HOURS,'1') != nvl(:new.ESTIMATED_EFFORT_IN_HOURS,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ESTIMATED_EFFORT_IN_HOURS','NUMBER',:old.ESTIMATED_EFFORT_IN_HOURS,:new.ESTIMATED_EFFORT_IN_HOURS);
    end if;
    if nvl(:old.MODULE,'1') != nvl(:new.MODULE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'MODULE','VARCHAR2',:old.MODULE,:new.MODULE);
    end if;
    --
    if nvl(:old.DOC_STATUS,0) != nvl(:new.DOC_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'DOC_STATUS','NUMBER',:old.DOC_STATUS,:new.DOC_STATUS);
    end if;
    if nvl(:old.DOC_WRITER,'1') != nvl(:new.DOC_WRITER,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'DOC_WRITER','VARCHAR2',:old.DOC_WRITER,:new.DOC_WRITER);
    end if;
    --
    if nvl(:old.JUSTIFICATION,'1') != nvl(:new.JUSTIFICATION,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'JUSTIFICATION','VARCHAR2',:old.JUSTIFICATION,:new.JUSTIFICATION);
    end if;
    if nvl(:old.FEATURE_TAGS,'1') != nvl(:new.FEATURE_TAGS,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_TAGS','VARCHAR2',:old.FEATURE_TAGS,:new.FEATURE_TAGS);
    end if;
    --
    --
    if nvl(:old.USER_INTERFACE_IMPACT,'1') != nvl(:new.USER_INTERFACE_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'USER_INTERFACE_IMPACT','VARCHAR2',:old.USER_INTERFACE_IMPACT,:new.USER_INTERFACE_IMPACT);
    end if;
    if nvl(:old.USER_INTERFACE_ASSIGNEE,'1') != nvl(:new.USER_INTERFACE_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'USER_INTERFACE_ASSIGNEE','VARCHAR2',:old.USER_INTERFACE_ASSIGNEE,:new.USER_INTERFACE_ASSIGNEE);
    end if;
    if nvl(:old.USER_INTERFACE_STATUS,0) != nvl(:new.USER_INTERFACE_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'USER_INTERFACE_STATUS','NUMBER',:old.USER_INTERFACE_STATUS,:new.USER_INTERFACE_STATUS);
    end if;
    --
    --
    if nvl(:old.GLOBALIZATION_IMPACT,'1') != nvl(:new.GLOBALIZATION_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'GLOBALIZATION_IMPACT','VARCHAR2',:old.GLOBALIZATION_IMPACT,:new.GLOBALIZATION_IMPACT);
    end if;
    if nvl(:old.GLOBALIZATION_ASSIGNEE,'1') != nvl(:new.GLOBALIZATION_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'GLOBALIZATION_ASSIGNEE','VARCHAR2',:old.GLOBALIZATION_ASSIGNEE,:new.GLOBALIZATION_ASSIGNEE);
    end if;
    if nvl(:old.GLOBALIZATION_STATUS,0) != nvl(:new.GLOBALIZATION_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'GLOBALIZATION_STATUS','NUMBER',:old.GLOBALIZATION_STATUS,:new.GLOBALIZATION_STATUS);
    end if;
    --
    if nvl(:old.TESTING_IMPACT,'1') != nvl(:new.TESTING_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'TESTING_IMPACT','VARCHAR2',:old.TESTING_IMPACT,:new.TESTING_IMPACT);
    end if;
    if nvl(:old.TESTING_ASSIGNEE,'1') != nvl(:new.TESTING_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'TESTING_ASSIGNEE','VARCHAR2',:old.TESTING_ASSIGNEE,:new.TESTING_ASSIGNEE);
    end if;
    if nvl(:old.TESTING_STATUS,0) != nvl(:new.TESTING_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'TESTING_STATUS','NUMBER',:old.TESTING_STATUS,:new.TESTING_STATUS);
    end if;
    --
    --
    if nvl(:old.SECURITY_IMPACT,'1') != nvl(:new.SECURITY_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'SECURITY_IMPACT','VARCHAR2',:old.SECURITY_IMPACT,:new.SECURITY_IMPACT);
    end if;
    if nvl(:old.SECURITY_ASSIGNEE,'1') != nvl(:new.SECURITY_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'SECURITY_ASSIGNEE','VARCHAR2',:old.SECURITY_ASSIGNEE,:new.SECURITY_ASSIGNEE);
    end if;
    if nvl(:old.SECURITY_STATUS,0) != nvl(:new.SECURITY_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'SECURITY_STATUS','NUMBER',:old.SECURITY_STATUS,:new.SECURITY_STATUS);
    end if;
    --
    --
    if nvl(:old.ACCESSIBILITY_IMPACT,'1') != nvl(:new.ACCESSIBILITY_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ACCESSIBILITY_IMPACT','VARCHAR2',:old.ACCESSIBILITY_IMPACT,:new.ACCESSIBILITY_IMPACT);
    end if;
    if nvl(:old.ACCESSIBILITY_ASSIGNEE,'1') != nvl(:new.ACCESSIBILITY_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ACCESSIBILITY_ASSIGNEE','VARCHAR2',:old.ACCESSIBILITY_ASSIGNEE,:new.ACCESSIBILITY_ASSIGNEE);
    end if;
    if nvl(:old.ACCESSIBILITY_STATUS,0) != nvl(:new.ACCESSIBILITY_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ACCESSIBILITY_STATUS','NUMBER',:old.ACCESSIBILITY_STATUS,:new.ACCESSIBILITY_STATUS);
    end if;
    --
    --
    if nvl(:old.FOCUS_AREA,'1') != nvl(:new.FOCUS_AREA,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FOCUS_AREA','VARCHAR2',:old.FOCUS_AREA,:new.FOCUS_AREA);
    end if;
    if nvl(:old.RELEASE,'1') != nvl(:new.RELEASE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'RELEASE','VARCHAR2',:old.RELEASE,:new.RELEASE);
    end if;

    if nvl(to_char(:old.FEATURE_PRIORITY),'1') != nvl(to_char(:new.FEATURE_PRIORITY),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_PRIORITY','VARCHAR2',to_char(:old.FEATURE_PRIORITY),to_char(:new.FEATURE_PRIORITY));
    end if;
    if nvl(to_char(:old.FEATURE_STATUS),0) != nvl(to_char(:new.FEATURE_STATUS),0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_STATUS','NUMBER',:old.FEATURE_STATUS,:new.FEATURE_STATUS);
    end if;
    if nvl(to_char(:old.FEATURE_DESIRABILITY),'1') != nvl(to_char(:new.FEATURE_DESIRABILITY),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_DESIRABILITY','VARCHAR2',to_char(:old.FEATURE_DESIRABILITY),to_char(:new.FEATURE_DESIRABILITY));
    end if;
    if nvl(to_char(:old.APPLICATION_ID),'1') != nvl(to_char(:new.APPLICATION_ID),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'APPLICATION_ID','VARCHAR2',to_char(:old.APPLICATION_ID),to_char(:new.APPLICATION_ID));
    end if;
    if nvl(to_char(:old.PARENT_FEATURE_ID),'1') != nvl(to_char(:new.PARENT_FEATURE_ID),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'PARENT_FEATURE_ID','VARCHAR2',to_char(:old.PARENT_FEATURE_ID),to_char(:new.PARENT_FEATURE_ID));
    end if;
    if nvl(to_char(:old.DUE_DATE,'YYYYMMDD'),'1') != nvl(to_char(:new.DUE_DATE,'YYYYMMDD'),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'DUE_DATE','VARCHAR2',to_char(:old.DUE_DATE,'YYYYMMDD'),to_char(:new.DUE_DATE,'YYYYMMDD'));
    end if;
    if nvl(to_char(:old.START_DATE,'YYYYMMDD'),'1') != nvl(to_char(:new.START_DATE,'YYYYMMDD'),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'START_DATE','VARCHAR2',to_char(:old.START_DATE,'YYYYMMDD'),to_char(:new.START_DATE,'YYYYMMDD'));
    end if;

    if nvl(:old.event_id,0) != nvl(:new.event_id,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'EVENT_ID','NUMBER',:old.event_id,:new.event_id);
    end if;

    /*
    if sys.dbms_lob.get_length(:old.FEATURE_DESC) != sys.dbms_lob.get_length(:new.FEATURE_DESC) then
       insert into wwv_flow_feature_history
            (COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_CLOB,NEW_VALUE_CLOB)
            values
            ('FEATURE_DESC','CLOB',:old.FEATURE_DESC,:new.FEATURE_DESC);
    end if;
    */

    end if;

    --
    -- TAG
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
           p_component_type    => 'FEATURE',
           p_component_id      => :new.id,
           p_new_tags          => rtrim(trim(:new.FEATURE_TAGS),','),
           p_security_group_id => :new.security_group_id);

    -- set feature id
    if :new.feature_id is null and (inserting or updating) then
        select nvl(max(feature_id),0) + 1 into :new.feature_id
        from wwv_flow_features
        where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
    end if;

end wwv_flow_features_t1;
/
ALTER TRIGGER  wwv_flow_features_T1 ENABLE
/

prompt ...trigger wwv_flow_features_t2

create or replace trigger  wwv_flow_features_t2
after delete on wwv_flow_features
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_features_t2;
/
ALTER TRIGGER  wwv_flow_features_T2 ENABLE
/



create or replace trigger  wwv_flow_features_hist_t1
before insert or update on wwv_flow_feature_history
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
end wwv_flow_features_hist_t1;
/
ALTER TRIGGER  wwv_flow_features_hist_t1 ENABLE
/

prompt ...trigger wwv_flow_feature_prog_t1

create or replace trigger  wwv_flow_feature_prog_t1
before insert or update on wwv_flow_feature_progress
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_feature_prog_t1;
/
ALTER TRIGGER  wwv_flow_feature_prog_t1 ENABLE
/

prompt ...trigger wwv_flow_teamdev_tc_t1

create or replace trigger  wwv_flow_teamdev_tc_t1
before insert or update on wwv_flow_teamdev_tag_cloud
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_teamdev_tc_t1;
/
ALTER TRIGGER wwv_flow_teamdev_tc_t1 ENABLE
/


prompt ...trigger wwv_flow_links_t1

create or replace trigger  wwv_flow_links_t1
before insert or update on wwv_flow_links
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;

    --
    -- TAG
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'LINK',
        p_component_id      => :new.id,
        p_new_tags          => :new.TAGS,
        p_security_group_id => :new.security_group_id);
end wv_flow_links_t1;
/
ALTER TRIGGER  wwv_flow_links_t1 ENABLE
/

prompt ...trigger wwv_flow_links_t2

create or replace trigger wwv_flow_links_t2
after delete on wwv_flow_links
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_links_t2;
/
ALTER TRIGGER  wwv_flow_links_T2 ENABLE
/

prompt ...trigger wwv_flow_events_t1

create or replace trigger  wwv_flow_events_t1
before insert or update on wwv_flow_events
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;

    if inserting or updating then
       :new.EVENT_OWNER := trim(lower(:new.EVENT_OWNER));

       if :new.event_id is null then
           select nvl(max(event_id),0) + 1
           into:new.event_id
           from wwv_flow_events
           where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
       end if;
    end if;

    --
    -- TAG
    --
    begin
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'MILESTONE',
        p_component_id      => :new.id,
        p_new_tags          => :new.TAGS,
        p_security_group_id => :new.security_group_id);
    exception when others then
        null;
    end;
end wwv_flow_events_t1;
/
ALTER TRIGGER  wwv_flow_events_t1 ENABLE
/

prompt ...trigger wwv_flow_events_t2

create or replace trigger wwv_flow_events_t2
after delete on wwv_flow_events
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_events_t2;
/
ALTER TRIGGER  wwv_flow_events_t2 ENABLE
/


prompt ...trigger wwv_flow_tasks_t1

CREATE OR REPLACE TRIGGER  wwv_flow_TASKS_T1
before insert or update on wwv_flow_tasks
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
    --
    -- start date and complete date
    --
    if inserting or updating then
        if :new.task_status is null then
           :new.task_status := 0;
        end if;

        if :new.task_status = 100 and :new.date_completed is null then
           :new.date_completed := sysdate;
        end if;
        if :new.date_completed is not null and :new.task_status < 100 then
           :new.task_status := 100;
        end if;
    end if;

    --
    -- owner
    --
    if inserting or updating then
        :new.assigned_to := trim(lower(:new.assigned_to));
        :new.contributor := trim(lower(:new.contributor));
    end if;

    --
    -- TAGS
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'TODO',
        p_component_id      => :new.id,
        p_new_tags          => :new.TASK_TAGS,
        p_security_group_id => :new.security_group_id);

    --
    -- task number
    --
    if inserting or updating then
        if :new.FRIENDLY_ID is null then
           for c1 in (
                   select nvl(max(FRIENDLY_ID),0) + 1 x
                   from   wwv_flow_tasks
                   where  security_group_id = wwv_flow_security.g_security_group_id)
                   loop
                   :new.friendly_id := c1.x;
           end loop;
        end if;
    end if;
end;
/
alter trigger  wwv_flow_tasks_t1 enable
/


prompt ...trigger wwv_flow_tasks_t2

create or replace trigger wwv_flow_tasks_t2
after delete on wwv_flow_tasks
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_tasks_t2;
/
alter trigger  wwv_flow_tasks_t2 enable
/




CREATE OR REPLACE TRIGGER   wwv_flow_task_progress_T1
before insert or update on  wwv_flow_task_progress
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_task_progress_T1;
/

CREATE OR REPLACE TRIGGER   wwv_flow_task_defaults_T1
before insert or update on  wwv_flow_task_defaults
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_task_defaults_T1;
/



prompt ...trigger wwv_flow_news_t1


create or replace trigger wwv_flow_news_t1
   before insert or update on wwv_flow_news
   for each row
begin
   --
   -- ID
   --
   if inserting and :new.id is null then
       :new.id := wwv_flow_id.next_val;
   end if;
   --
   -- timestamps
   --
   if inserting then
      :new.created_on := sysdate;
      :new.created_by := wwv_flow.g_user;
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
end;
/

ALTER TRIGGER  wwv_flow_NEWS_T1 ENABLE
/


create or replace trigger  wwv_flow_team_files_t1
before insert or update on wwv_flow_team_files
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;

end wwv_flow_team_files_t1;
/
alter trigger wwv_flow_team_files_t1 enable
/





---------------------------------
-- Team Development views
--


create or replace view apex_team_bugs
as
select
    w.PROVISIONING_COMPANY_ID   workspace_id,
    w.short_name                workspace_name,
    --
    b.ID                          bug_id,
    b.BUG_ID                      friendly_bug_number,
    b.BUG_TITLE                   bug_title,
    b.ASSIGNED_TO                 assigned_to,
    b.BUG_SEVERITY                bug_severity,
    b.BUG_STATUS                  bug_status,
    b.PRIORITY                    priority,
    b.FIX_BY_RELEASE              fix_by_release,
    --
    b.ESTIMATED_FIX_DATE,
    b.ACTUAL_FIX_DATE,
    --
    b.BUG_DESCRIPTION,
    b.REPORTED_PLATFORM,
    b.REPORTED_BROWSER,
    b.REPORTED_OPERATING_SYSTEM,
    b.FEATURE_ID                  related_feature_id,
    b.TARGET_MILESTONE_ID         target_milestone_id,
    b.TASK_ID                     related_todo_id,
    b.DUPLICATE_OF_BUG,
    b.TAGS,
    --
    b.CUSTOMER_NAME               customer_name,
    b.CUSTOMER_ISSUE              customer_issue,
    --
    b.COMPONENT                   product_component,
    b.PRODUCT                     product_name,
    b.PRODUCT_VERSION             product_version,
    b.IMPACT                      impact_of_fix,
    b.APPLICATION_ID              application_id,
    b.PAGE_ID                     page_id,
    --
    b.CREATED_BY,
    b.CREATED_ON,
    b.UPDATED_BY,
    b.UPDATED_ON
from
    wwv_flow_current_sgid sgid,
    wwv_flow_bugs b,
    wwv_flow_companies w
where
    b.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
             sgid.security_group_id = w.PROVISIONING_COMPANY_ID)) and
    (user in ('SYS', 'SYSTEM', 'APEX_050000') or w.PROVISIONING_COMPANY_ID != 10)
/


comment on table  apex_team_bugs                     is 'Identifies bugs, also known as software defects.';
comment on column apex_team_bugs.workspace_id        is 'Primary key that identifies the workspace.';
comment on column apex_team_bugs.workspace_name      is 'Name of the workspace.';
comment on column apex_team_bugs.bug_id              is 'Primary key of the bug.';
comment on column apex_team_bugs.bug_title           is 'Primary name for this bug.';
comment on column apex_team_bugs.assigned_to    is 'Name of developer assigned to fix this bug.';
comment on column apex_team_bugs.bug_severity   is 'The severity of this bug.';
comment on column apex_team_bugs.bug_status     is 'The status of this bug.';
comment on column apex_team_bugs.priority       is 'The priority assigned to this bug.';
comment on column apex_team_bugs.fix_by_release is 'The release when this bug should be fixed.';
    --
comment on column apex_team_bugs.estimated_fix_date is 'The estimated fix date of the bug.';
comment on column apex_team_bugs.actual_fix_date    is 'The date the bug was actually fixed.';
    --
comment on column apex_team_bugs.bug_description           is 'Detailed description of the bug.';
comment on column apex_team_bugs.reported_platform         is 'Platform the bug was reported on.';
comment on column apex_team_bugs.reported_browser          is 'Browser being used when bug was noticed.';
comment on column apex_team_bugs.reported_operating_system is 'Operating system the buy was reported on.';
comment on column apex_team_bugs.related_feature_id        is 'Unique identifier of the related feature.';
comment on column apex_team_bugs.target_milestone_id       is 'Unique identifier of the milestone for when this bug is targeted to be completed.';
comment on column apex_team_bugs.related_todo_id           is 'Unique identifier of related To Do.';
comment on column apex_team_bugs.duplicate_of_bug          is 'If this bug is a duplicate of an existing bug, the unique identifier of the other bug.';
comment on column apex_team_bugs.tags                      is 'Tags associated with this bug.';
    --
comment on column apex_team_bugs.customer_name             is 'Name of customer reporting this bug.';
comment on column apex_team_bugs.customer_issue            is 'A description of the bug as described by the customer.';
    --
comment on column apex_team_bugs.product_component         is 'Product component (if available) associated with this bug.';
comment on column apex_team_bugs.product_name              is 'Product associated with this bug.';
comment on column apex_team_bugs.product_version           is 'Specifid version of product associated with this bug.';
comment on column apex_team_bugs.impact_of_fix             is 'The modules, components or patches that this bug fix will impact.';
comment on column apex_team_bugs.application_id            is 'Associated application.';
comment on column apex_team_bugs.page_id                   is 'Relevant page within associated application.';
    --
comment on column apex_team_bugs.created_by                is 'Developer who created this bug.';
comment on column apex_team_bugs.created_on                is 'Date on which this bug was created.';
comment on column apex_team_bugs.updated_by                is 'Developer who last updated this bug.';
comment on column apex_team_bugs.updated_on                is 'Date on which this bug was last updated.';

create or replace view apex_team_milestones
as
select
    w.PROVISIONING_COMPANY_ID   workspace_id,
    w.short_name                workspace_name,
    --
   m.ID                        milestone_id,
   m.EVENT_NAME                milestone,
   m.EVENT_OWNER               milestone_owner,
   m.EVENT_DATE                milestone_date,
   m.EVENT_TYPE                milestone_type,
   m.RELEASE                   release,
   m.EVENT_DESC                milestone_description,
   m.TAGS                      tags,
   --
   m.CREATED_BY,
   m.CREATED_ON,
   m.UPDATED_BY,
   m.UPDATED_ON,
   m.EVENT_ID                  friendly_milestone_id,
   m.SELECTABLE_FROM_FEATURES_YN
from
    wwv_flow_current_sgid sgid,
    WWV_FLOW_EVENTS m,
    wwv_flow_companies w
where
    m.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
            sgid.security_group_id = w.PROVISIONING_COMPANY_ID)) and
            (user in ('SYS', 'SYSTEM', 'APEX_050000') or w.PROVISIONING_COMPANY_ID != 10)
/


comment on table  apex_team_milestones                     is 'Identifies bugs, also known as software defects.';
comment on column apex_team_milestones.workspace_id        is 'Primary key that identifies the workspace.';
comment on column apex_team_milestones.milestone_id        is 'Primary key of the bug.';
comment on column apex_team_milestones.workspace_name      is 'Name of the workspace.';
comment on column apex_team_milestones.milestone           is 'Name of the milestone.';
comment on column apex_team_milestones.milestone_owner     is 'Owner of the milestone.';
comment on column apex_team_milestones.milestone_date      is 'Date on which the milestone is to occur.';
comment on column apex_team_milestones.milestone_type      is 'Type of milestone.';
comment on column apex_team_milestones.release             is 'Release milestone is associated with.';
comment on column apex_team_milestones.milestone_description is 'Description of milestone.';
comment on column apex_team_milestones.tags                is 'Tags associated with this milestone.';
comment on column apex_team_milestones.friendly_milestone_id       is 'More readable id for the milestone (unique within workspace only).';
comment on column apex_team_milestones.selectable_from_features_yn is 'Identifies whether or not this milestone can be associated with a feature.';

comment on column apex_team_milestones.created_by                is 'Developer who created this milestone.';
comment on column apex_team_milestones.created_on                is 'Date on which this milestone was created.';
comment on column apex_team_milestones.updated_by                is 'Developer who last updated this milestone.';
comment on column apex_team_milestones.updated_on                is 'Date on which this milestone was last updated.';


create or replace view apex_team_todos
as
select
    w.PROVISIONING_COMPANY_ID     workspace_id,
    w.short_name                  workspace_name,
    --
   t.ID                          todo_id,
   t.FRIENDLY_ID                 todo_friendly_id,
   t.ASSIGNED_TO                 assigned_to,
   t.CONTRIBUTOR                 contributor,
   t.TASK_NAME                   todo_name,
   t.DESCRIPTION                 todo_description,
   t.ESTIMATED_EFFORT_IN_HOURS   estimated_effort_in_hours,
   t.TASK_STATUS                 todo_status,
   t.TASK_CATEGORY               todo_category,
   t.TASK_TAGS                   tags,
   --
   t.START_DATE                  start_date,
   t.DATE_COMPLETED              date_completed,
   t.DUE_DATE                    due_date,
   --
   t.APPLICATION_ID              apex_application_id,
   t.PAGE_ID                     apex_application_page_id,
   --t.WEBSHEET_ID,
   t.REF_COMPONENT_TYPE,
   --t.CUSTOMER_DETAILS,
   t.PARENT_TASK_ID              parent_todo_id,
   --t.TASK_GROUP                todo_group,
    --
   t.RELEASE                     release,
   t.EVENT_ID                    milestone_id,
   t.FEATURE_ID                  feature_id,
   t.PRODUCT_VERSION             product_version,
   --
   t.CREATED_BY,
   t.CREATED_ON,
   t.UPDATED_BY,
   t.UPDATED_ON
from
    wwv_flow_current_sgid sgid,
    WWV_FLOW_tasks t,
    wwv_flow_companies w
where
    t.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
            sgid.security_group_id = w.PROVISIONING_COMPANY_ID)) and
            (user in ('SYS', 'SYSTEM', 'APEX_050000') or w.PROVISIONING_COMPANY_ID != 10)
/

comment on table  apex_team_todos                  is 'Items that need to get done - i.e. to dos.';
comment on column apex_team_todos.workspace_id     is 'Primary key that identifies the workspace.';
comment on column apex_team_todos.todo_id          is 'Primary key of the to do.';
comment on column apex_team_todos.workspace_name   is 'Name of the workspace.';

comment on column apex_team_todos.todo_friendly_id is 'More readable id for the to do (unique within workspace only).';
comment on column apex_team_todos.assigned_to      is 'Identifies who the to do is assigned to.';
comment on column apex_team_todos.contributor      is 'Identifies who is contributing to the completion of the to do.';
comment on column apex_team_todos.todo_name        is 'Brief description of the to do.';
comment on column apex_team_todos.todo_description is 'Detailed description of the to do.';
comment on column apex_team_todos.estimated_effort_in_hours is 'Estimate of hours to complete the to do.';
comment on column apex_team_todos.todo_status      is 'Status of the to do.';
comment on column apex_team_todos.todo_category    is 'Category assigned to the to do.';
comment on column apex_team_todos.tags             is 'Tags associated with this to do.';

comment on column apex_team_todos.start_date     is 'Date that work on the to was begun.';
comment on column apex_team_todos.date_completed is 'Date to do was completed.';
comment on column apex_team_todos.due_date       is 'Date the to do is scheduled to be completed.';

comment on column apex_team_todos.apex_application_id      is 'Associated application.';
comment on column apex_team_todos.apex_application_page_id is 'Relevant page within associated application.';

comment on column apex_team_todos.parent_todo_id  is 'ID of parent to do (link to todo_id to view hierarchy).';
comment on column apex_team_todos.release         is 'Release associated with this to do.';
comment on column apex_team_todos.milestone_id    is 'Milestone associated with this to do.';
comment on column apex_team_todos.feature_id      is 'Feature associated with this to do.';
comment on column apex_team_todos.product_version is 'Product version associated with this to do.';

comment on column apex_team_todos.created_by  is 'Developer who created this milestone.';
comment on column apex_team_todos.created_on  is 'Date on which this milestone was created.';
comment on column apex_team_todos.updated_by  is 'Developer who last updated this milestone.';
comment on column apex_team_todos.updated_on  is 'Date on which this milestone was last updated.';

create or replace view apex_team_features
as
select
    w.PROVISIONING_COMPANY_ID     workspace_id,
    w.short_name                  workspace_name,
    --
    f.id                          feature_id,
    f.feature_id                  feature_friendly_id,
    f.feature_name,
    f.feature_owner,
    f.feature_contributor,
    f.focus_area,
    f.release,
    f.feature_desc                feature_description,
    f.justification,
    f.feature_tags,
    f.feature_priority,
    f.feature_status,
    f.feature_desirability,
    f.due_date,
    f.start_date,
    f.module,
    f.estimated_effort_in_hours,
    --
    f.publishable_yn,
    f.publishable_description,
    --
    f.globalization_impact,
    f.globalization_assignee,
    f.globalization_status,
    --
    f.user_interface_impact,
    f.user_interface_assignee,
    f.user_interface_status,
    --
    f.doc_impact,
    f.doc_status,
    f.doc_writer,
    --
    f.testing_impact,
    f.testing_assignee,
    f.testing_status,
    --
    f.security_impact,
    f.security_assignee,
    f.security_status,
    --
    f.accessibility_impact,
    f.accessibility_assignee,
    f.accessibility_status,
    --
    f.application_id,
    f.parent_feature_id,
    f.event_id                    milestone_id,
    --
    f.created_by,
    f.created_on,
    f.updated_by,
    f.updated_on
from
    wwv_flow_current_sgid sgid,
    wwv_flow_features f,
    wwv_flow_companies w
where
    f.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
             (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
             sgid.security_group_id= w.PROVISIONING_COMPANY_ID)) and
            (user in ('SYS', 'SYSTEM', 'APEX_050000') or w.PROVISIONING_COMPANY_ID != 10)
/



comment on table  apex_team_features                     is 'Items that need to get done - i.e. to dos.';
comment on column apex_team_features.workspace_id        is 'Primary key that identifies the workspace.';
comment on column apex_team_features.workspace_name      is 'Name of the workspace.';
comment on column apex_team_features.feature_id          is 'Primary key of the feature.';
comment on column apex_team_features.feature_friendly_id is 'More readable id for the feature (unique within workspace only).';
comment on column apex_team_features.feature_name        is 'Brief description of the feature.';
comment on column apex_team_features.feature_owner       is 'Identifies who the feature is assigned to.';
comment on column apex_team_features.feature_contributor is 'Identifies who is contributing to the completion of the feature.';

comment on column apex_team_features.focus_area                is 'Focus area (or category) assigned to this feature.';
comment on column apex_team_features.release                   is 'Release associated with this feature.';
comment on column apex_team_features.feature_description       is 'Detailed description of the feature.';
comment on column apex_team_features.justification             is 'Justification for creating this feature.';
comment on column apex_team_features.feature_tags              is 'Tags associated with this feature.';
comment on column apex_team_features.feature_priority          is 'Priority assigned to this feature.';
comment on column apex_team_features.feature_status            is 'Current status of this feature.';
comment on column apex_team_features.feature_desirability      is 'Desirability of this feature.';
comment on column apex_team_features.due_date                  is 'Date this feature is due to be completed.';
comment on column apex_team_features.start_date                is 'Date this feature is due to be started.';
comment on column apex_team_features.module                    is 'Module associated with this feature.';
comment on column apex_team_features.estimated_effort_in_hours is 'Estimate of the number of hours this feature will take to complete.';

comment on column apex_team_features.publishable_yn          is 'Identifies whether or not this feature is publishable.';
comment on column apex_team_features.publishable_description is 'Description that will be published describing this feature.';

comment on column apex_team_features.globalization_impact   is 'The globalization impact of this feature, including notes from the review.';
comment on column apex_team_features.globalization_assignee is 'Person responsible for reviewing the globalization of this feature.';
comment on column apex_team_features.globalization_status   is 'Status of the globalization review of this feature.';

comment on column apex_team_features.user_interface_impact   is 'The user interface impact of this feature, including notes from the review.';
comment on column apex_team_features.user_interface_assignee is 'Person responsible for reviewing the user interface of this feature.';
comment on column apex_team_features.user_interface_status   is 'Status of the user interface review of this feature.';

comment on column apex_team_features.doc_impact is 'Additional information about needed documentation or documentation status.';
comment on column apex_team_features.doc_status is 'Status of documentation for this feature.';
comment on column apex_team_features.doc_writer is 'Person responsible to document this feature.';

comment on column apex_team_features.testing_impact   is 'Additional information about needed testing or testing status.';
comment on column apex_team_features.testing_assignee is 'Person responsible to test this feature.';
comment on column apex_team_features.testing_status   is 'Testing status for this feature.';

comment on column apex_team_features.security_impact   is 'The security impact of this feature, including notes from the review.';
comment on column apex_team_features.security_assignee is 'Person responsible for reviewing the security of this feature.';
comment on column apex_team_features.security_status   is 'Status of the security review of this feature.';

comment on column apex_team_features.accessibility_impact   is 'The accessibility impact of this feature, including notes from the review.';
comment on column apex_team_features.accessibility_assignee is 'Person responsible for reviewing the accessibility of this feature.';
comment on column apex_team_features.accessibility_status   is 'Status of the accessibility review of this feature.';

comment on column apex_team_features.application_id    is 'Associated application.';
comment on column apex_team_features.parent_feature_id is 'ID of parent feature (link to feature_id to view hierarchy).';
comment on column apex_team_features.milestone_id      is 'Associated milestone.';

comment on column apex_team_features.created_by  is 'Developer who created this milestone.';
comment on column apex_team_features.created_on  is 'Date on which this milestone was created.';
comment on column apex_team_features.updated_by  is 'Developer who last updated this milestone.';
comment on column apex_team_features.updated_on  is 'Date on which this milestone was last updated.';
