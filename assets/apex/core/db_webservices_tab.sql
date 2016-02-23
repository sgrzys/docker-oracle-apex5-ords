set define '^'
set verify off
prompt ...db_webservices_tab.sql

Rem  Copyright (c) Oracle Corporation 2011. All Rights Reserved.
Rem
Rem    NAME
Rem      db_webservice_tab.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    mhichwa     03/25/2011 - Created
Rem    jkallman    04/01/2011 - Renamed indexes
Rem    mhichwa     04/28/2011 - added security tables
Rem    cdivilly    05/10/2011 - Renamed wwv_flow_rt$resource -> wwv_flow_rt$template, wwv_flow_rt$parameters -> wwv_flow_rt$parameter , added wwv_flow_rt$module, 
Rem    cdivilly    05/11/2011 - Reworked RESTful Security Constraints tables
Rem    mhichwa     05/11/2011 - adjusted syntax, added indexes
Rem    mhichwa     05/11/2011 - added additional check contraints
Rem    mhichwa     05/12/2011 - new check constraints, improved indexes
Rem    mhichwa     05/12/2011 - added defaults to module trigger
Rem    mhichwa     05/12/2011 - added default for priority column in tempate table
Rem    mhichwa     05/12/2011 - added format and comments
Rem    cdivilly    05/27/2011 - fixed fk on wwv_flow_oa$scope_module, changed fk on wwv_flow_oa$clnt_scope_grnt
Rem    cdivilly    05/27/2011 - added wwv_flow_oa$bearer_token, stores active access tokens
Rem    cdivilly    05/31/2011 - replace wwv_flow_oa$clnt_scope_grnt with wwv_flow_oa$user_client
Rem    cdivilly    06/03/2011 - add response_type to wwv_flow_oa$client, scopes,bearer_token,token_expiry to wwv_flow_oa$user_client, rename wwv_flow_oa$client.return_uri -> redirect_uri
Rem    mhichwa     06/15/2011 - added cascade delete to fk, added comments column, added indexes for guid
Rem    hfarrell    09/07/2011 - Added parsing_schema to wwv_flow_rt$module and drop statement for table wwv_flow_oa$clnt_scope_grnt - commented out
Rem    hfarrell    09/07/2011 - Added column label to wwv_flow_oa$scope
Rem    cneumuel    09/08/2011 - Removed "/" after wwv_flow_oa$scope_module_i3 which caused re-execution and ORA-00955 error on install
Rem    arayner     09/08/2011 - Added RESPONSE value to wwv_flow_rt$parm_src_ck check constraint
Rem    hfarrell    09/08/2011 - Updated constraint wwv_flow_hdlr_sc_ck to remove AUTHENTICATED and SECURE_AND_AUTHENTICATED as recommended by Colm
Rem    hfarrell    09/09/2011 - Removed trigger biu_wwv_flow_oa$client on table wwv_flow_oa$client, and updated trigger biu_wwv_flow_oa$user_client on wwv_flow_oa$user_client table
Rem    hfarrell    09/09/2011 - Updated constraint wwv_flow_rt$hand_ck_st on table wwv_flow_rt$handler to add FEED, wwv_flow_rt$module.parsing_schema can be null
Rem    hfarrell    09/09/2011 - Reinstated the trigger biu_wwv_flow_oa$client on table wwv_flow_oa$client
Rem    hfarrell    09/12/2011 - Updated wwv_flow_oa$client to add auth_flow and scopes, and updated unique constraint wwv_flow_oa$scope_i1 on wwv_flow_oa$scope.name
Rem    hfarrell    09/13/2011 - Updated wwv_flow_oa$user_client to include refresh_token column
Rem    hfarrell    09/13/2011 - Updated table wwv_flow_rt$handler to remove column origins_allowed and add required_role, and added unique index wwv_flow_oa$uc_i6 on wwv_flow_oa$user_client 
Rem    hfarrell    09/14/2011 - Updated column refresh_token on wwv_flow_oa$user_client from varchar2(22) to varchar2(32)
Rem    hfarrell    09/14/2011 - Updated trigger biu_wwv_flow_rt$module to default parsing_schema with wwv_flow_companies.first_provisioning_schema.
Rem    hfarrell    09/15/2011 - Updated DDL with Patrick to incorporate revisions from Colm for factoring in authentication-related changes
Rem    pawolf      09/16/2011 - Added privilege_id to wwv_flow_rt$handlers and minor other changes
Rem    pawolf      09/16/2011 - Added new views
Rem    hfarrell    09/19/2011 - Added security_constraint back to wwv_flow_rt$handlers table
Rem    hfarrell    09/20/2011 - Updated column sizes for wwv_flow_rt$privileges:name and label;wwv_flow_rt$clients:name,auth_flow,response_type, and support_email;wwv_flow_rt$approvals.name. Renamed wwv_flow_rt$approval_privs:user_id to approval_id
Rem    hfarrell    09/20/2011 - Updated column size for wwv_flow_rt$modules:name and fixed typo in constraint wwv_flow_rt$handlers_rh_ck
Rem    hfarrell    09/20/2011 - Changed wwv_flow_rt$modules.uri_prefix to be nullable to correspond with UI change to make associated item optional
Rem    hfarrell    09/21/2011 - Added column apex_session_id to wwv_flow_rt$approvals, added column apex_application_id to wwv_flow_rt$approvals. Updated constraint wwv_flow_rt$clients_af_ck to include EXCHANGE
Rem    pawolf      09/26/2011 - Added column URI to view wwv_flow_rt$services
Rem    hfarrell    09/26/2011 - Updated constraint wwv_flow_rt$clients_appid_fk to be on delete cascade
Rem    hfarrell    10/13/2011 - Updated wwv_flow_rt$approvals and added new table wwv_flow_rt$user_sessions - as per request from Colm
Rem    hfarrell    10/14/2011 - Reverted back wwv_flow_rt$approvals_unique1 index on table wwv_flow_rt$approvals
Rem    hfarrell    10/18/2011 - Updated wwv_flow_rt$rt_sessions table to add foreign key constraint wwv_flow_rt$user_sess_fk1 on apex_session_id
Rem    hfarrell    02/17/2012 - Fix for bug 13732882: created indexes wwv_flow_rt$handlers_idx4 and wwv_flow_rt$user_sess_idx4
Rem    hfarrell    03/06/2012 - Updated views wwv_flow_rt$apex_account_privs and wwv_flow_rt$idm_privs to expose INTERNAL groups - as per request from Colm
Rem    hfarrell    03/09/2012 - Fix for bug 13815223: changed wwv_flow_rt$templates.uri_template from varchar2(4000) to varchar2(2000)
Rem    hfarrell    03/20/2012 - Fix for bug 13643600: changed wwv_flow_rt$templates.uri_template from varchar2(2000) to varchar2(600)
Rem    hfarrell    07/18/2012 - Added new table wwv_flow_rt$pending_approvals, and added columns client_state and refresh_expiry to wwv_flow_rt$user_sessions as part of cross-site request forgery (CSRF) prevention by Colm
Rem    hfarrell    07/18/2012 - Updated view wwv_flow_rt$services to restrict it by RESTFUL_SERVICES_ENABLED platform preference and workspace setting wwv_flow_companies.allow_restful_services_yn
Rem    hfarrell    08/13/2012 - Added wwv_flow_rt$errors table - for RESTful Services error handling
Rem    hfarrell    08/22/2012 - Updated wwv_flow_rt$errors to add 2 foreign key indexes and rename foreign key constraint from wwv_flow_rt$errors_pk_fk to wwv_flow_rt$errors_handler_fk
Rem    hfarrell    08/30/2012 - Modified index on wwv_flow_rt$pending_approvals table, as per request from Colm via email: changed wwv_flow_rt$pend_apprv_unique1 and added wwv_flow_rt$pend_apprv_idx2 (28-08-2012)
Rem    cneumuel    08/20/2013 - In wwv_flow_rt$idm_privs, wwv_flow_rt$apex_account_privs: support groups granted to other groups (feature #1233)
Rem    cneumuel    05/19/2015 - Long identifiers (bug #21031940)

create table  wwv_flow_rt$privileges (
 id                             number        constraint wwv_flow_rt$privs_pk primary key,
 name                           varchar2(255)  not null,
 label                          varchar2(255) not null enable,
 description                    varchar2(4000),
 comments                       varchar2(4000),
 security_group_id              number not null
                                constraint wwv_flow_rt$privs_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255),
 created_on                     date,
 updated_by                     varchar2(255),
 updated_on                     date,
 row_version_number             number
)
/

create unique index wwv_flow_rt$privs_unique1 on wwv_flow_rt$privileges (security_group_id,name);

comment on column wwv_flow_rt$privileges.id is 'Identifies the privileges ID';
comment on column wwv_flow_rt$privileges.name is 'A Programmatic identifier for this security constraint, no whitespace allowed';
comment on column wwv_flow_rt$privileges.label is 'The name of this security constraint as displayed to an end user';
comment on column wwv_flow_rt$privileges.description is 'Provides a brief description of the purpose of the resources protected by this constraint';
comment on column wwv_flow_rt$privileges.comments is 'Displays the comments on the privilege';


create table  wwv_flow_rt$privilege_groups (
 id                             number 
                                constraint wwv_flow_rt$priv_groups_pk  primary key,
 privilege_id                   number not null 
                                constraint wwv_flow_rt$priv_groups_fk
                                references wwv_flow_rt$privileges(id)
                                on delete cascade,
 user_group_id                  number not null
                                constraint wwv_flow_rt$priv_groups_fk2
                                references wwv_flow_fnd_user_groups(id)
                                on delete cascade,
 security_group_id              number         not null
                                constraint wwv_flow_rt$priv_groups_fk3
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
 )
/

create unique index wwv_flow_rt$priv_grps_unique1 on wwv_flow_rt$privilege_groups (security_group_id,user_group_id,privilege_id);
create index wwv_flow_rt$prive_groups_idx1 on wwv_flow_rt$privilege_groups (user_group_id);
create index wwv_flow_rt$priv_groups_idx2 on wwv_flow_rt$privilege_groups (privilege_id);


create table  wwv_flow_rt$modules (
 id                             number 
                                constraint wwv_flow_rt$modules_pk primary key,
 name                           varchar2(255) not null,
 uri_prefix                     varchar2(255),
 parsing_schema                 varchar2(128) not null,
 origins_allowed                varchar2(4000),
 items_per_page                 number        not null,
 privilege_id                   number 
                                constraint wwv_flow_rt$modules_priv_fk
                                references wwv_flow_rt$privileges (id),
 status                         varchar2(30) not null
                                constraint wwv_flow_rt$modules_status_ck
                                check (status in ('PUBLISHED','NOT_PUBLISHED')),
 comments                       varchar2(4000),
 security_group_id              number not null
                                constraint wwv_flow_rt$modules_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,                                          
 created_by                     varchar2(255),
 created_on                     date,
 updated_by                     varchar2(255),
 updated_on                     date,
 row_version_number             number
)
/

comment on column wwv_flow_rt$modules.name is 'Identifies the module name';
comment on column wwv_flow_rt$modules.uri_prefix is 'Defines a prefix on the URI path, which all Resource Templates within the module are resolved relative to, e.g. orders/';
comment on column wwv_flow_rt$modules.parsing_schema is 'Identifies the parsing schema associated with the RESTful Service';
comment on column wwv_flow_rt$modules.origins_allowed is 'Comma seperated list of fully qualified domains (for example http://oracle.com, http://www.oracle.com) which are permitted to access resources defined in this module';
comment on column wwv_flow_rt$modules.items_per_page is 'Defines the default number of rows returned by Resource Handlers within this module';
comment on column wwv_flow_rt$modules.privilege_id is 'Identifies the privilege to be applied to this Resource Module';
comment on column wwv_flow_rt$modules.status is 'Controls whether this module is currently active or not';

create unique index wwv_flow_rt$modules_unique1 on wwv_flow_rt$modules (security_group_id,name);
create index wwv_flow_rt$modules_idx1 on wwv_flow_rt$modules (privilege_id);	



create table  wwv_flow_rt$templates (
 id                             number         
                                constraint wwv_flow_rt$temps_pk primary key, 
 module_id                      number 
                                constraint wwv_flow_rt$temps_mod_fk
                                references wwv_flow_rt$modules (id) on delete cascade,
 uri_template                   varchar2(600) not null, 
 priority                       number         not null
 			                    constraint wwv_flow_rt$temps_priority_ck
                                check (priority between 0 and 9), 
 etag_type                      varchar2(30)   not null, 
                                constraint wwv_flow_rt$temps_etag_ck
                                check (etag_type in ('HASH', 'QUERY','NONE')),
 etag_query                     varchar2(4000),
 comments                       varchar2(4000),
 security_group_id              number         not null
                                constraint wwv_flow_rt$temps_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
  )
/

comment on column wwv_flow_rt$templates.module_id is 'Identifies the module this template is associated with';
comment on column wwv_flow_rt$templates.uri_template is 'Identifies the pattern of URIs that the Resource Template will handle, e.g. hello?who={person}';
comment on column wwv_flow_rt$templates.priority is 'When two or more Resource Templates match a single URI this value is used to choose a Resource Template, the Resource Template with the highest priority is chosen';
comment on column wwv_flow_rt$templates.etag_type is 'Identifies the type of entity tag';
comment on column wwv_flow_rt$templates.etag_query is 'Display the entity tag query';
comment on column wwv_flow_rt$templates.comments is 'Display the comments on the RESTful Service Resource Template';

create unique index wwv_flow_rt$templates_unique1 on wwv_flow_rt$templates (security_group_id,module_id,uri_template);
create index wwv_flow_rt$templates_idx1 on wwv_flow_rt$templates (security_group_id);
create index wwv_flow_rt$templates_idx2 on wwv_flow_rt$templates (module_id);


create table  wwv_flow_rt$handlers (
 id                             number  
                                constraint wwv_flow_rt$handlers_pk primary key, 
 template_id                    number         not null
                                constraint wwv_flow_rt$handlers_temps_fk
                                references  wwv_flow_rt$templates (id) on delete cascade, 
 source_type                    varchar2(30)   not null
                                constraint wwv_flow_rt$handlers_st_ck
                                check (source_type in ('QUERY' , 'QUERY_1_ROW', 'FEED' , 'PLSQL' , 'MEDIA')),
 format                         varchar2(30)   not null 
                                constraint wwv_flow_rt$handlers_ft_ck
                                check (format in ('CSV','DEFAULT')),
 method                         varchar2(10)   not null 
                                constraint wwv_flow_rt$handlers_md_ck
                                check (method in ('PUT', 'GET', 'POST', 'DELETE')),
 mimes_allowed                  varchar2(255),
 items_per_page                 number,
 require_https                  varchar2(30),
                                constraint wwv_flow_rt$handlers_rh_ck
                                check (require_https in ('YES', 'NO')), 
 privilege_id                   number 
                                constraint wwv_flow_rt$handlers_priv_fk
                                references wwv_flow_rt$privileges (id),
 source                         clob           not null, 
 comments                       varchar2(4000),
 security_group_id              number         not null
                                constraint wwv_flow_rt$handlers_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
)
/

comment on column wwv_flow_rt$handlers.source_type is 'Defines the strategy used to transform SQL results into a resource';
comment on column wwv_flow_rt$handlers.format is 'Applies to Query/Query One Row Only, defines whether to return results as JSON or Comma Separated Values (CSV)';
comment on column wwv_flow_rt$handlers.method is 'Defines the HTTP Method which this handler will respond to';
comment on column wwv_flow_rt$handlers.mimes_allowed is 'Applies to PUT and POST only, comma separated list of MIME types that the handler will accept';
comment on column wwv_flow_rt$handlers.items_per_page is 'Applies to Query format only, indicates maximum number of rows to return';
comment on column wwv_flow_rt$handlers.source is 'The SQL or PL/SQL used to generate the resource';

create unique index wwv_flow_rt$handlers_unique1 on wwv_flow_rt$handlers (security_group_id,template_id,method);
create index wwv_flow_rt$handlers_idx2 on wwv_flow_rt$handlers (security_group_id);
create index wwv_flow_rt$handlers_idx3 on wwv_flow_rt$handlers (template_id);
create index wwv_flow_rt$handlers_idx4 on wwv_flow_rt$handlers (privilege_id);

create table  wwv_flow_rt$parameters (
 id                             number    
                                constraint wwv_flow_rt$params_pk primary key,
 handler_id                     number             not null 
                                constraint wwv_flow_rt$params_handler_fk
                                references  wwv_flow_rt$handlers (id) on delete cascade, 
 name                           varchar2(100)      not null, 
 bind_variable_name             varchar2(30), 
 source_type                    varchar2(20)       not null
                                constraint wwv_flow_rt$params_st_ck
                                check ( source_type in ( 'URI','HEADER','RESPONSE')), 
 access_method                  varchar2(10)       not null enable
                                constraint wwv_flow_rt$params_am_ck
                                check ( access_method in ( 'IN','OUT','INOUT') ),
 param_type                     varchar2(30)       not null enable
                                constraint wwv_flow_rt$params_pt_ck
                                check (param_type in ( 'STRING','INT','DOUBLE','BOOLEAN','LONG','TIMESTAMP')),
 comments                       varchar2(4000),
 security_group_id              number         not null
                                constraint wwv_flow_rt$params_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
  )
/

comment on column wwv_flow_rt$parameters.bind_variable_name is 'The name of the parameter, as it will be refered to in the SQL';
comment on column wwv_flow_rt$parameters.name is 'The name of the parameter, as it is named in the URI Template or HTTP Header. Used to map names that are not legal SQL parameter names';
comment on column wwv_flow_rt$parameters.source_type is 'Identifies if the parameter originates in the URI Template or a HTTP Header';
comment on column wwv_flow_rt$parameters.access_method is 'Identifies if the parameter is an input value, output value or both';
comment on column wwv_flow_rt$parameters.param_type is 'Identifies the native type of the parameter';

create unique index wwv_flow_rt$params_unique1 on wwv_flow_rt$parameters (security_group_id,handler_id,name);
create unique index wwv_flow_rt$params_unique2 on wwv_flow_rt$parameters (security_group_id,handler_id,bind_variable_name);
create index wwv_flow_rt$params_idx1 on wwv_flow_rt$parameters (security_group_id);
create index wwv_flow_rt$params_idx2 on wwv_flow_rt$parameters (handler_id);


-- RESTful Security Constraints Tables

create table wwv_flow_rt$clients (
 id                             number   
                                constraint wwv_flow_rt$clients_pk primary key,
 name                           varchar2(255) not null,
 description                    varchar2(4000),
 auth_flow                      varchar2(30) not null,
                                constraint wwv_flow_rt$clients_af_ck
                                check (auth_flow in ('AUTH_CODE','IMPLICIT','PASSWORD','CLIENT_CRED','EXCHANGE')),
 apex_application_id            number
                                constraint wwv_flow_rt$clients_appid_fk
                                references wwv_flows(id)
                                on delete cascade,
 response_type                  varchar2(30)
                                not null 
                                constraint wwv_flow_rt$clients_rt_ck
                                check (response_type in ( 'CODE','TOKEN')),
 client_id                      varchar2(32) not null,
 client_secret                  varchar2(32),
 redirect_uri                   varchar2(2000),
 support_email                  varchar2(255) not null enable,
 about_url                      varchar2(512),
 security_group_id              number         not null
                                constraint wwv_flow_rt$clients_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
 )
/

comment on column wwv_flow_rt$clients.name is 'The name of the RESTful Security Constraints client application';
comment on column wwv_flow_rt$clients.description is 'A brief description of the purpose of the application';
comment on column wwv_flow_rt$clients.response_type is 'Identifies the type of RESTful Security Constraints response the client expects';
comment on column wwv_flow_rt$clients.client_id is 'Uniquely identifies the RESTful Security Constraints client';
comment on column wwv_flow_rt$clients.client_secret is 'The secret used to assert the RESTful Security Constraints client''s identity';
comment on column wwv_flow_rt$clients.redirect_uri is 'The URI the client wishes the RESTful Security Constraints response to be sent to';
comment on column wwv_flow_rt$clients.support_email is 'The email address users can send queries about the RESTful Security Constraints client to';
comment on column wwv_flow_rt$clients.about_url is 'The URL address users can be redirected to';
comment on column wwv_flow_rt$clients.apex_application_id is 'The Application Express application ID';

create unique index wwv_flow_rt$clients_unique1 on wwv_flow_rt$clients (security_group_id,name);
create unique index wwv_flow_rt$clients_unique2 on wwv_flow_rt$clients (security_group_id,client_id);
create  index wwv_flow_rt$clients_idx1 on wwv_flow_rt$clients (apex_application_id);


create table  wwv_flow_rt$client_privileges (
 id                             number 
                                constraint wwv_flow_rt$client_privs_pk primary key,
 client_id                      number not null 
                                constraint wwv_flow_rt$client_privs_fk
                                references wwv_flow_rt$clients(id)
                                on delete cascade,
 privilege_id                   number not null 
                                constraint wwv_flow_rt$client_privs_fk2
                                references wwv_flow_rt$privileges(id)
                                on delete cascade,
 security_group_id              number         not null
                                constraint wwv_flow_rt$client_privs_fk3
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
 )
/

create unique index wwv_flow_rt$client_privs_uniq1 on wwv_flow_rt$client_privileges (security_group_id,client_id,privilege_id);
create index wwv_flow_rt$client_privs_idx1 on wwv_flow_rt$client_privileges (client_id);
create index wwv_flow_rt$client_privs_idx2 on wwv_flow_rt$client_privileges (privilege_id);


-- Represents a user approval/denial of a client
create table  wwv_flow_rt$approvals (
 id                             number 
                                constraint wwv_flow_rt$approvals_pk primary key,
 client_id                      number not null 
                                constraint wwv_flow_rt$approvals_fk
                                references wwv_flow_rt$clients(id)
                                on delete cascade,
 user_name                      varchar2(255) not null,
 status                         varchar2(30) not null
                                constraint wwv_flow_rt$approvals_st_ck
                                check (status in ( 'PENDING','APPROVED','DENIED')),
 security_group_id              number         not null
                                constraint wwv_flow_rt$approvals_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
 )
/

comment on column wwv_flow_rt$approvals.client_id is 'Identifies the ID of the client';
comment on column wwv_flow_rt$approvals.user_name is 'The identifier of the user being asked to grant access';
comment on column wwv_flow_rt$approvals.status is 'The state of the access request';

create unique index wwv_flow_rt$approvals_unique1 on wwv_flow_rt$approvals (security_group_id,client_id,user_name);
create index wwv_flow_rt$approvals_idx1 on wwv_flow_rt$approvals (client_id);
create index wwv_flow_rt$approvals_idx2 on wwv_flow_rt$approvals (security_group_id);


-- Represents a pending approval of a client
create table  wwv_flow_rt$pending_approvals (
 id                             number 
                                constraint wwv_flow_rt$pend_apprv_pk primary key,
 approval_id                    number not null 
                                constraint wwv_flow_rt$pend_apprv_fk
                                references wwv_flow_rt$approvals(id)
                                on delete cascade,
 client_state                   varchar2(255)  not null,
 security_group_id              number         not null
                                constraint wwv_flow_rt$pend_apprv_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
 )
/

alter table wwv_flow_rt$pending_approvals add constraint wwv_flow_rt$pend_apprv_unique1 unique (approval_id, client_state)
/

comment on column wwv_flow_rt$pending_approvals.approval_id is 'Identifies the ID of the approval';
comment on column wwv_flow_rt$pending_approvals.client_state is 'A unique value provided by the OAuth2 client to prevent CSRF attacks';

create index wwv_flow_rt$pend_apprv_idx1 on wwv_flow_rt$pending_approvals (approval_id);
create index wwv_flow_rt$pend_apprv_idx2 on wwv_flow_rt$pending_approvals (security_group_id);

-- Represents the specific privileges that a user has granted access to
create table  wwv_flow_rt$approval_privs (
 id                             number 
                                constraint wwv_flow_rt$app_privs_pk primary key,
 approval_id                    number not null 
                                constraint wwv_flow_rt$app_privs_fk
                                references wwv_flow_rt$approvals(id)
                                on delete cascade,
 privilege_id                   number not null 
                                constraint wwv_flow_rt$app_privs_fk2
                                references wwv_flow_rt$privileges(id)
                                on delete cascade,
 security_group_id              number not null
                                constraint wwv_flow_rt$app_privs_sgid_fk
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255), 
 created_on                     date, 
 updated_by                     varchar2(255), 
 updated_on                     date, 
 row_version_number             number
 )
/

create unique index wwv_flow_rt$app_privs_unique1 on wwv_flow_rt$approval_privs (security_group_id,approval_id,privilege_id);
create index wwv_flow_rt$app_privs_idx1 on wwv_flow_rt$approval_privs (approval_id);
create index wwv_flow_rt$app_privs_idx2 on wwv_flow_rt$approval_privs (privilege_id);

-- Represents a user session created via OAuth2
create table  wwv_flow_rt$user_sessions (
 id                             number
                                constraint wwv_flow_rt$user_sess_pk primary key,
 approval_id                    number not null
                                constraint wwv_flow_rt$user_sess_fk
                                references wwv_flow_rt$approvals(id)
                                on delete cascade,
 apex_session_id                number
                                constraint wwv_flow_rt$user_sess_fk1
                                references wwv_flow_sessions$(id)
                                on delete cascade,
 bearer_token                   varchar2(32) not null,
 refresh_token                  varchar2(32),
 token_expiry                   timestamp not null,
 refresh_expiry                 timestamp,
 client_state                   varchar2(255),
 security_group_id              number         not null
                                constraint wwv_flow_rt$user_sess_fk2
                                references wwv_flow_companies(provisioning_company_id)
                                on delete cascade,
 created_by                     varchar2(255),
 created_on                     date,
 updated_by                     varchar2(255),
 updated_on                     date,
 row_version_number             number
 )
/

comment on column wwv_flow_rt$user_sessions.bearer_token is 'Contains the bearer token which the RESTful Security Constraints client will use to access resources';
comment on column wwv_flow_rt$user_sessions.refresh_token is 'A token that can be presented to extend the life of the current user session';
comment on column wwv_flow_rt$user_sessions.token_expiry is 'The time at which the bearer token will expire';
comment on column wwv_flow_rt$user_sessions.apex_session_id is 'The Application Express session ID, if the client for this user session is an APEX application'; 
comment on column wwv_flow_rt$user_sessions.refresh_expiry is 'The time at which the refresh token will expire';
comment on column wwv_flow_rt$user_sessions.client_state is 'The client provided state value, which can be used for audit purposes to link an OAuth2 User Session to a client session';


create unique index wwv_flow_rt$user_sess_idx1 on wwv_flow_rt$user_sessions (security_group_id,bearer_token);
create unique index wwv_flow_rt$user_sess_idx2 on wwv_flow_rt$user_sessions (security_group_id,refresh_token);
create index wwv_flow_rt$user_sess_idx3 on wwv_flow_rt$user_sessions (apex_session_id); 
create index wwv_flow_rt$user_sess_idx4 on wwv_flow_rt$user_sessions (approval_id);


create table wwv_flow_rt$errors (
    id                              number
                                    constraint wwv_flow_rt$errors_pk
                                    primary key,
    handler_id                      number not null
                                    constraint wwv_flow_rt$errors_handler_fk
                                    references wwv_flow_rt$handlers(id)
                                    on delete cascade,
    request_path                    varchar2(2000) not null,
    request_parameters              varchar2(2000),
    parsed_schema                   varchar2(128) not null,
    sql_error_code                  number not null,
    sql_error_message               varchar2(2000) not null,
    created_by                      varchar2(255),
    created_on                      date,
    security_group_id               number not null
                                    constraint wwv_flow_rt$errors_sgid_fk
                                    references wwv_flow_companies(provisioning_company_id)
                                    on delete cascade
    )
/

comment on column wwv_flow_rt$errors.handler_id         is 'ID of the request handler that caused the error';
comment on column wwv_flow_rt$errors.request_path       is 'Path and query string of the request that caused the error';
comment on column wwv_flow_rt$errors.request_parameters is 'Comma delimited list of the parameter values that were parsed from the request path, if any';
comment on column wwv_flow_rt$errors.parsed_schema      is 'The schema the SQL call was evaluated as';
comment on column wwv_flow_rt$errors.sql_error_code     is 'The SQL error code';
comment on column wwv_flow_rt$errors.sql_error_message  is 'The SQL error message';

create index wwv_flow_rt$errors_idx1 on wwv_flow_rt$errors (security_group_id);
create index wwv_flow_rt$errors_idx2 on wwv_flow_rt$errors (handler_id);


create or replace view wwv_flow_rt$services
as
select x.*,
       p.name  as privilege_name,
       p.label as privilege_label
  from ( select m.security_group_id,
                m.id              as module_id,
                m.name            as module_name,
                m.uri_prefix      as module_uri_prefix,
                m.parsing_schema  as module_parsing_schema,
                m.origins_allowed as module_origins_allowed,
                t.id              as template_id,
                t.uri_template    as template_uri_template,
                t.priority        as template_priority,
                t.etag_type       as template_etag_type,
                t.etag_query      as template_etag_query,
                h.id              as handler_id,
                h.source_type     as handler_source_type,
                h.format          as handler_format,
                h.method          as handler_method,
                h.mimes_allowed   as handler_mimes_allowed,
                h.source          as handler_source,
                h.require_https   as handler_require_https,
                nvl(h.privilege_id, m.privilege_id)     as privilege_id,
                nvl(h.items_per_page, m.items_per_page) as items_per_page,
                m.uri_prefix||t.uri_template            as uri
           from wwv_flow_rt$modules m,
                wwv_flow_rt$templates t,
                wwv_flow_rt$handlers h,
                wwv_flow_companies c
          where m.status            = 'PUBLISHED'
            and t.security_group_id = m.security_group_id
            and t.module_id         = m.id
            and h.security_group_id = t.security_group_id
            and h.template_id       = t.id
            and c.provisioning_company_id = t.security_group_id
            and c.allow_restful_services_yn      = 'Y'
            and exists ( select 1 
                           from wwv_flow_platform_prefs 
                          where name = 'RESTFUL_SERVICES_ENABLED' 
                            and value  = 'Y' )
       ) x,
       wwv_flow_rt$privileges p
 where p.id (+) = x.privilege_id
 order by template_priority desc, template_id;

create or replace view wwv_flow_rt$idm_privs
as
with indirect_grants as (
    select /*+ inline */
           g.security_group_id,
           g.id,
           cast(multiset (
               select gg.granted_group_id
                 from wwv_flow_fnd_group_groups gg
                start with gg.grantee_group_id  = g.id
                       and gg.security_group_id = g.security_group_id
                connect by gg.grantee_group_id  = prior gg.granted_group_id
                       and gg.security_group_id = prior gg.security_group_id )
               as wwv_flow_t_number ) group_ids
      from wwv_flow_fnd_user_groups g
), all_grants as (
    select security_group_id,
           id join_id,
           id,
           group_name
      from wwv_flow_fnd_user_groups g
     union
    select /*+ cardinality(gg, 5) push_pred(i) */
           i.security_group_id,
           i.id,
           ug.id,
           ug.group_name
      from indirect_grants i,
           table(i.group_ids) gg,
           wwv_flow_fnd_user_groups ug
     where ug.security_group_id in (10, i.security_group_id)
       and ug.id                = gg.column_value
)
select pg.security_group_id,
       pg.privilege_id,
       g.id         as group_id,
       g.group_name
  from wwv_flow_rt$privilege_groups pg,
       all_grants g
 where g.join_id           = pg.user_group_id
   and g.security_group_id in (pg.security_group_id,10)
/

create or replace view wwv_flow_rt$apex_account_privs
as
with direct_grants as (
    select /*+ inline */
           u.security_group_id,
           u.user_name,
           gu.group_id
      from wwv_flow_fnd_user u,
           wwv_flow_fnd_group_users gu
     where u.security_group_id = gu.security_group_id
       and u.user_id           = gu.user_id
), indirect_grants as ( 
    select /*+inline push_pred(u) */
           u.security_group_id,
           u.user_name,
           cast(multiset (
               select gg.granted_group_id
                 from wwv_flow_fnd_group_groups gg
                start with gg.grantee_group_id  = u.group_id
                       and gg.security_group_id = u.security_group_id
                connect by gg.grantee_group_id  = prior gg.granted_group_id
                       and gg.security_group_id = prior gg.security_group_id )
               as wwv_flow_t_number ) groups
      from direct_grants u
), all_grants as (
    select security_group_id, user_name, group_id
      from direct_grants
    union
    select /*+ cardinality(gg, 5) push_pred(i) */
           i.security_group_id,
           i.user_name,
           gg.column_value
      from indirect_grants i,
           table(i.groups) gg
)
select /*+ push_pred(g) */
       g.security_group_id,
       pg.privilege_id,
       g.user_name
  from wwv_flow_rt$privilege_groups pg,
       all_grants g
 where g.group_id          = pg.user_group_id
   and pg.security_group_id in (g.security_group_id,10)
/
