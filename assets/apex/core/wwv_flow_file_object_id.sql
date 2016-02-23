set define '^'
set verify off
prompt ...application_authentication

Rem    SCRIPT ARGUMENTS
Rem      NONE
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem
Rem     jkallman   10/04/2001 - Created

--
-- S Q L   W O R K S H O P
--
prompt ... create wwv_flow_file_object_id

create or replace package wwv_flow_file_object_id 
is
   g_id number;
end;
/
show errors