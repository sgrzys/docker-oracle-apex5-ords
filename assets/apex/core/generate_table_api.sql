set define '^'
set verify off
prompt ...wwv_flow_generate_table_api


Rem  Copyright (c) Oracle Corporation 2003 All Rights Reserved.
Rem
Rem    NAME
Rem      generate_table_api.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    SCRIPT ARGUMENTS
Rem      1.
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem      msewtz    02/25/2003 - Created


CREATE OR REPLACE PACKAGE wwv_flow_generate_table_api IS


  procedure create_api (
    p_owner         in  varchar2,  
    p_app_name      in  varchar2,
    p_table_name_01 in  varchar2 default null,
    p_table_name_02 in  varchar2 default null,
    p_table_name_03 in  varchar2 default null,
    p_table_name_04 in  varchar2 default null,
    p_table_name_05 in  varchar2 default null,  
    p_table_name_06 in  varchar2 default null,
    p_table_name_07 in  varchar2 default null,
    p_table_name_08 in  varchar2 default null,
    p_table_name_09 in  varchar2 default null,
    p_table_name_10 in  varchar2 default null,
    p_action        in  varchar2 default 'SHOW'      
  );


END wwv_flow_generate_table_api;
/


