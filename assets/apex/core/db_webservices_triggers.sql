set define '^' verify off
prompt ...db_webservices_triggers.sql

Rem  Copyright (c) Oracle Corporation 2011 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      db_webservices_triggers.sql
Rem
Rem    DESCRIPTION
Rem      Triggers associated with the RESTful Services tables
Rem
Rem    NOTES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    hfarrell    09/15/2011 - Created - moved triggers from /core/db_webservices_tab.sql
Rem    hfarrell    09/16/2011 - Added trigger biu_wwv_flow_rt$privileges on wwv_flow_rt$privileges
Rem    hfarrell    09/20/2011 - Added trigger biu_wwv_flow_rt$priv_groups on wwv_flow_privilege_groups
Rem    hfarrell    09/21/2011 - Updated all triggers to modify setting of updated_by and created_by - as per request from Colm
Rem    hfarrell    10/13/2011 - Added trigger biu_wwv_flow_rt$user_sessions on wwv_flow_rt$user_sessions
Rem    hfarrell    07/18/2012 - Added trigger biu_wwv_flow_rt$pend_approvals on new table wwv_flow_rt$pending_approvalsl,
Rem                             as part of cross-site request forgery (CSRF) prevention by Colm
Rem    cneumuel    03/12/2013 - In biu_wwv_flow_rt$modules: if given parsing schema is invalid, use first workspace
Rem                             schema (bug #16477523)
Rem    vuvarov     01/09/2014 - In biu_wwv_flow_rt$modules: allow APEX_PUBLIC_USER parsing schema (feature #1267)
Rem    vuvarov     07/16/2014 - In biu_wwv_flow_rt$modules, biu_wwv_flow_rt$templates: trim URI
Rem    hfarrell    08/25/2015 - Added cascading trigger logic to biu_wwv_flow_rt$templates, biu_wwv_flow_rt$handlers, biu_wwv_flow_rt$parameters, biu_wwv_flow_rt$priv_groups

prompt ...trigger biu_wwv_flow_rt$modules

create or replace trigger  biu_wwv_flow_rt$modules
    before insert or update on wwv_flow_rt$modules
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,0) + 1;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- defaults
    if :new.status is null then
       :new.status := 'NOT_PUBLISHED';
    end if;
    if :new.items_per_page is null then
       :new.items_per_page := 25;
    end if;
    :new.uri_prefix := trim( :new.uri_prefix );
    --
    -- verify schema (and possibly revert to first provisioned schema) when
    -- * no parsing_schema given
    -- * parsing schema is '!USER_SCHEMA' or 'APEX_PUBLIC_USER' but workspace is not 10
    -- * parsing schema is neither '!USER_SCHEMA' nor 'APEX_PUBLIC_USER' nor the old parsing schema
    --
    if :new.parsing_schema is null
        or ( :new.parsing_schema in ('!USER_SCHEMA', 'APEX_PUBLIC_USER') and :new.security_group_id != 10 )
        or :new.parsing_schema not in ( '!USER_SCHEMA', 'APEX_PUBLIC_USER', nvl(:old.parsing_schema, :new.parsing_schema) )
    then
        --
        -- query workspace schemas for the given parsing schema. found_schema
        -- contains :new.parsing_schema if :new.parsing_schema is a workspace
        -- schema. otherwise, parsing_schema will be set to
        -- first_schema_provisioned.
        --
        for i in ( select min(case when s.schema = :new.parsing_schema then s.schema end) over () found_schema,
                          c.first_schema_provisioned
                     from wwv_flow_company_schemas s,
                          wwv_flow_companies c
                    where s.security_group_id       = c.provisioning_company_id
                      and c.provisioning_company_id = :new.security_group_id )
        loop
            if i.found_schema is null then
                wwv_flow_debug.trace (
                    'parsing schema "%s" not found, reverting to "%s"',
                    :new.parsing_schema,
                    i.first_schema_provisioned );
                :new.parsing_schema := i.first_schema_provisioned;
            else
                wwv_flow_debug.trace (
                    'accepting parsing_schema change to "%s"',
                    i.found_schema );
            end if;
            exit;
        end loop;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$templates

create or replace trigger  biu_wwv_flow_rt$templates
    before insert or update or delete on wwv_flow_rt$templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        --
        -- defaults
        --
        if :new.priority is null then
            :new.priority := 1;
        end if;
        :new.uri_template := trim( :new.uri_template );
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        if inserting or updating then
            :new.updated_on := sysdate;
            if :new.updated_by is null then
                :new.updated_by := wwv_flow_security.g_user;
            end if;
            if inserting then
                :new.created_on := sysdate;
                if :new.created_by is null then
                    :new.created_by := nvl(wwv_flow_security.g_user,user);
                end if;
            end if;
        end if;
        -- Cascade to parent
        begin
            update wwv_flow_rt$modules
               set updated_on         = sysdate,
                   updated_by         = wwv_flow_security.g_user
             where id                 = coalesce(:new.module_id,:old.module_id)
               and security_group_id  = coalesce(:new.security_group_id,:old.security_group_id);
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$handlers

create or replace trigger  biu_wwv_flow_rt$handlers
    before insert or update or delete on wwv_flow_rt$handlers
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        if inserting or updating then
            :new.updated_on := sysdate;
            if :new.updated_by is null then
                :new.updated_by := wwv_flow_security.g_user;
            end if;
            if inserting then
                :new.created_on := sysdate;
                if :new.created_by is null then
                    :new.created_by := nvl(wwv_flow_security.g_user,user);
                end if;
            end if;
        end if;
        -- Cascade to parent
        begin
            for c1 in (select module_id from wwv_flow_rt$templates
                        where id                = coalesce(:new.template_id,:old.template_id)
                          and security_group_id = coalesce(:new.security_group_id,:old.security_group_id))
            loop
                update wwv_flow_rt$modules
                   set updated_on         = sysdate,
                       updated_by         = wwv_flow_security.g_user
                 where id                 = c1.module_id
                   and security_group_id  = coalesce(:new.security_group_id,:old.security_group_id);
            end loop;
        exception when wwv_flow_error.e_mutating_table then null;
        end;

    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$parameters

create or replace trigger  biu_wwv_flow_rt$parameters
    before insert or update or delete on wwv_flow_rt$parameters
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        if inserting or updating then
            :new.updated_on := sysdate;
            if :new.updated_by is null then
                :new.updated_by := wwv_flow_security.g_user;
            end if;
            if inserting then
                :new.created_on := sysdate;
                if :new.created_by is null then
                    :new.created_by := nvl(wwv_flow_security.g_user,user);
                end if;
            end if;
        end if;
        -- Cascade to parent
        begin
            for c1 in (select t.module_id 
                         from wwv_flow_rt$templates t, wwv_flow_rt$handlers h
                        where t.id                = h.template_id
                          and h.id                = coalesce(:new.handler_id,:old.handler_id)
                          and h.security_group_id = coalesce(:new.security_group_id,:old.security_group_id))
            loop
                update wwv_flow_rt$modules
                   set updated_on         = sysdate,
                       updated_by         = wwv_flow_security.g_user
                 where id                 = c1.module_id
                   and security_group_id  = coalesce(:new.security_group_id,:old.security_group_id);
            end loop;
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$clients

create or replace trigger  biu_wwv_flow_rt$clients
    before insert on wwv_flow_rt$clients
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$client_privs

create or replace trigger  biu_wwv_flow_rt$client_privs
    before insert or update on wwv_flow_rt$client_privileges
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$approvals

create or replace trigger  biu_wwv_flow_rt$approvals
    before insert or update on wwv_flow_rt$approvals
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$pend_approvals

create or replace trigger  biu_wwv_flow_rt$pend_approvals
    before insert or update on wwv_flow_rt$pending_approvals
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$approval_privs

create or replace trigger  biu_wwv_flow_rt$approval_privs
    before insert or update on wwv_flow_rt$approval_privs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$user_sessions

create or replace trigger  biu_wwv_flow_rt$user_sessions
    before insert or update on wwv_flow_rt$user_sessions
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/
show errors

prompt ...trigger biu_wwv_flow_rt$privileges

create or replace trigger  biu_wwv_flow_rt$privileges
    before insert or update on wwv_flow_rt$privileges
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,0) + 1;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
       if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

prompt ...trigger biu_wwv_flow_rt$privilege_groups

create or replace trigger  biu_wwv_flow_rt$priv_groups
    before insert or update or delete on wwv_flow_rt$privilege_groups
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        if inserting or updating then
            :new.updated_on := sysdate;
            if :new.updated_by is null then
                :new.updated_by := wwv_flow_security.g_user;
            end if;
            if inserting then
                :new.created_on := sysdate;
                if :new.created_by is null then
                    :new.created_by := nvl(wwv_flow_security.g_user,user);
                end if;
            end if;
        end if;
        -- Cascade to parent
        begin
            update wwv_flow_rt$privileges
               set updated_on         = sysdate,
                   updated_by         = wwv_flow_security.g_user
             where id                 = coalesce(:new.privilege_id,:old.privilege_id)
               and security_group_id  = coalesce(:new.security_group_id,:old.security_group_id);
        exception when wwv_flow_error.e_mutating_table then null;
        end;        
    end if;
end;
/

show errors
