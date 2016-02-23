set define '^'
set verify off
prompt ...wwv_flow_isc

Rem    NAME
Rem      flow_isc.sql
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     mhichwa  06/23/2003 - Created (bug 3020053)
Rem     sspadafo 06/24/2003 - Add current_flow_restricted function (Bug 3017850)
Rem     sspadafo 08/28/2004 - Add deployment_environment function (Bug 3859617)


create or replace package wwv_flow_isc
as
   function vc return boolean;
   function current_flow_restricted return boolean;
   function deployment_environment return boolean;
end wwv_flow_isc;
/
