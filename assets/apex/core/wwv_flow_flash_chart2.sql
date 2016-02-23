set define '^'
set verify off
prompt ...wwv_flow_flash_chart2


Rem  Copyright (c) Oracle Corporation 2006. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_flash_chart2.sql
Rem
Rem    DESCRIPTION
Rem      Flash charting engine
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    NOTES
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    CUSTOMER MAY CUSTOMIZE
Rem      NO
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem    cbcho      11/06/2007 - Created
Rem    madelfio   11/06/2007 - Updated to output dynamic XML


create or replace package wwv_flow_flash_chart2
as

procedure chart(p_report_id in number default null);

end wwv_flow_flash_chart2;
/
show error;
