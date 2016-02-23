Rem  Copyright (c) Oracle Corporation 2012 - 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_install_internal_themes.sql
Rem
Rem    DESCRIPTION
Rem      Install internal themes into theme repository (SGID=12)
Rem
Rem    MODIFIED     (MM/DD/YYYY)
Rem    jkallman      03/26/2012 - Created
Rem    msewtz        03/27/2012 - Added theme 25
Rem    vuvarov       05/05/2012 - Call set_workspace_id() first to satisfy check for reserved App ID ranges.
Rem    msewtz        03/27/2012 - Added themes 1-11 and 13-24
Rem    jkallman      06/01/2012 - Clear out globals at end of script
Rem    msewtz        06/19/2012 - Added theme 25
Rem    msewtz        07/23/2012 - Added theme 12
Rem    shrahman      08/17/2012 - Added theme 26
Rem    msewtz        08/28/2013 - Added theme 31
Rem    jstraub       10/21/2013 - Changed SGID 11 references to 12
Rem    msewtz        11/13/2013 - Added themes 51 and 42
Rem    msewtz        01/07/2014 - Removed theme 30
Rem    msewtz        06/02/2014 - Replace theme 31 with 42
Rem    msewtz        10/24/2014 - Added THEME_OFFSET to ensure themes always get installed with the same template and theme IDs
Rem    cneumuel      10/28/2014 - Set define '^' before installing each theme file, because the themese set define to "on"

set verify off

define THEME_OFFSET = 1447581811918206904;

prompt Application Express internal themes


prompt
prompt ...Installing Theme 1
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8801);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_1.sql


prompt
prompt ...Installing Theme 2
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8802);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_2.sql


prompt
prompt ...Installing Theme 3
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8803);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_3.sql


prompt
prompt ...Installing Theme 4
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8804);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_4.sql


prompt
prompt ...Installing Theme 5
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8805);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_5.sql


prompt
prompt ...Installing Theme 6
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8806);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_6.sql


prompt
prompt ...Installing Theme 7
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8807);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_7.sql


prompt
prompt ...Installing Theme 8
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8808);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_8.sql


prompt
prompt ...Installing Theme 9
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8809);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_9.sql


prompt
prompt ...Installing Theme 10
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8810);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_10.sql


prompt
prompt ...Installing Theme 11
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8811);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_11.sql


prompt
prompt ...Installing Theme 12
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8812);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_12.sql


prompt
prompt ...Installing Theme 13
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8813);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_13.sql


prompt
prompt ...Installing Theme 14
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8814);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_14.sql


prompt
prompt ...Installing Theme 15
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8815);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_15.sql


prompt
prompt ...Installing Theme 16
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8816);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_16.sql


prompt
prompt ...Installing Theme 17
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8817);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_17.sql


prompt
prompt ...Installing Theme 18
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8818);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_18.sql


prompt
prompt ...Installing Theme 19
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8819);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_19.sql


prompt
prompt ...Installing Theme 20
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8820);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_20.sql


prompt
prompt ...Installing Theme 21
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8821);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_21.sql



prompt
prompt ...Installing Theme 22
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8822);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_22.sql


prompt
prompt ...Installing Theme 23
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8823);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_23.sql



prompt
prompt ...Installing Theme 24
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8824);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_24.sql



prompt
prompt ...Installing Theme 25
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8825);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_25.sql



prompt
prompt ...Installing Theme 26
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8826);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_26.sql


prompt
prompt ...Installing Theme 42
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8842);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_42.sql


prompt
prompt ...Installing Theme 51
prompt
set feedback off define '^'
begin
    wwv_flow_application_install.set_workspace_id(12);
    wwv_flow_api.set_security_group_id(12);
    wwv_flow_application_install.set_application_id(8851);
    wwv_flow_application_install.set_offset(^THEME_OFFSET);
    wwv_flow_application_install.set_schema(wwv_flow.g_flow_schema_owner);
end;
/
@@theme_51.sql


begin
      update wwv_flows
          set application_type = 'THEME'
        where security_group_id = 12
          and id between 8800 and 8900;

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
set feedback on define '^'
prompt
prompt  ...done
