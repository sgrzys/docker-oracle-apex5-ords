Rem  Copyright (c) Oracle Corporation 2012 - 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_install_theme_42.sql
Rem
Rem    DESCRIPTION
Rem      Install internal theme 42 into theme repository (SGID=12)
Rem
Rem    MODIFIED     (MM/DD/YYYY)
Rem    msewtz       11/13/2013 - Created

set define '^'
set verify off

define THEME_OFFSET = 1447581811918206904;

prompt
prompt ...Installing Theme 42
prompt
set feedback off
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8842);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_42.sql

begin
      update wwv_flows
          set application_type = 'THEME'
        where security_group_id = 12
          and id = 8842;

      commit;
end;
/


--
--  Clear out application globals, so this avoids any downstream effect
begin
    wwv_flow_application_install.clear_all;
end;
/


set verify off
set feedback on
prompt
prompt  ...done
