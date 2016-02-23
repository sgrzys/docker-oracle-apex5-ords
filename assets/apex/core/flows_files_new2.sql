set define '^'
set verify off
prompt ...create flows_files


Rem  Copyright (c) Oracle Corporation 2001. All Rights Reserved.
Rem
Rem    NAME
Rem      trigger.sql
Rem
Rem    DESCRIPTION
Rem      Flow tiggers creation script.
Rem
Rem    NOTES
Rem
Rem    ARGUMENTS
Rem       1. TNS connect information
Rem       2.
Rem       3. Flows Schema Owner
Rem       4.
Rem       5. Flows Password
Rem       6.
Rem       7.
Rem       8.
Rem       9. Application Tablespace
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jstraub  10/04/2001 - Created
Rem       tmuth    10/09/2001 - Added trigger
Rem       tmuth    10/10/2001 - Removed constraint
Rem       tmuth    10/10/2001 - Moved connection to ins.sql
Rem       sspadafo 01/14/2009 - Added updating of wwv_flow_file_api.g_file_inserted_count
Rem       jstraub  08/14/2015 - Prefix trigger creation with FLOWS_FILES to fix issue with lrgsrgdbcu*

prompt ...trigger wwv_biu_flow_file_objects

create or replace trigger FLOWS_FILES.wwv_biu_flow_file_objects
    before insert or update on wwv_flow_file_objects$
    for each row
begin
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
        if :new.security_group_id is null then
            :new.security_group_id :=
              nvl(wwv_flow_security.g_security_group_id,0);
        end if;
        wwv_flow_file_object_id.g_id := :new.id;
        wwv_flow_file_api.g_file_inserted := true;
        wwv_flow_file_api.g_file_inserted_count := wwv_flow_file_api.g_file_inserted_count + 1;
    elsif updating then
        :new.updated_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        wwv_flow_file_object_id.g_id := :new.id;
    end if;
    --
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.flow_id is null then
        :new.flow_id := 0;
    end if;
    :new.filename := substr(:new.name,instr(:new.name,'/')+1);
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/
show errors




