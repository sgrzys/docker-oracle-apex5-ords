Rem  Copyright (c) Oracle Corporation 2012 - 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_install_theme_11.sql
Rem
Rem    DESCRIPTION
Rem      Install internal theme 11 into theme repository (SGID=12)
Rem
Rem    MODIFIED     (MM/DD/YYYY)
Rem    arayner       05/22/2012 - Created

set define '^'
set verify off

define THEME_OFFSET = 1447581811918206904;

prompt
prompt ...Installing Theme 11
prompt
set feedback off
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8811);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_11.sql

begin
      update wwv_flows
          set application_type = 'THEME'
        where security_group_id = 12
          and id = 8811;

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
