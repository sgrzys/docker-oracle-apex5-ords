Rem  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_sys_all_views.sql
Rem
Rem    DESCRIPTION
Rem      This file creates APEX view wrappers for sys.all_* database dictionary views.
Rem      In a Cloud environment the views are replaced by a version which uses
Rem      the user_* views. This is necessary because of the database lockdown.
Rem      See cloud\apex_patches\apex_sys_all_views.sql
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    pawolf      01/26/2012 - Created
Rem    jkallman    01/27/2012 - Remove edition, namespace from apex_sys_all_objects
Rem    cneumuel    04/17/2012 - Prefix sys objects with schema (bug #12338050)

set define '^'

prompt Create apex_sys_all_synonyms view

create or replace force view apex_sys_all_synonyms
as
select owner,
       synonym_name,
       table_owner,
       table_name,
       db_link
  from sys.all_synonyms
/

prompt Create apex_sys_all_objects view

create or replace force view apex_sys_all_objects
as
select owner,
       object_name,
       subobject_name,
       object_id,
       data_object_id,
       object_type,
       created,
       last_ddl_time,
       timestamp,
       status,
       temporary,
       generated,
       secondary
  from sys.all_objects
/

prompt Create apex_sys_all_constraints view

create or replace force view apex_sys_all_constraints
as
select owner,
       constraint_name,
       constraint_type,
       table_name,
       search_condition,
       r_owner,
       r_constraint_name,
       delete_rule,
       status,
       deferrable,
       deferred,
       validated,
       generated,
       bad,
       rely,
       last_change,
       index_owner,
       index_name,
       invalid,
       view_related
  from sys.all_constraints
/

prompt Create apex_sys_all_dependencies view

create or replace force view apex_sys_all_dependencies
as
select owner,
       name,
       type,
       referenced_owner,
       referenced_name,
       referenced_type,
       referenced_link_name,
       dependency_type
  from sys.all_dependencies
/
