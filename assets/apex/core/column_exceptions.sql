set define '^'
set verify off
prompt ...column_exceptions


Rem  Copyright (c) Oracle Corporation 2002. All Rights Reserved.
Rem
Rem    NAME
Rem      column_exceptions.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem    tmuth      12/02/2002 - Created
Rem    sspadafo   07/12/2003 - Changed date format in insert statements for nls compatibility (Bug 3048757)




prompt ...wwv_column_exceptions

create table wwv_column_exceptions(
    table_name      varchar2(40),
    column_name     varchar2(40),
    obsolete_date   date default null,
    constraint col_exceptions_pk primary key (table_name, column_name)
    )
    
/

Rem  select table_name,column_name
Rem    from all_tab_columns
Rem   where owner = 'FLOWS_20020815'
Rem   MINUS 
Rem  select table_name,column_name
Rem    from all_tab_columns
Rem   where owner = 'FLOWS_20021101';


prompt ...Populate wwv_column_exceptions
insert into wwv_column_exceptions values('WWV_FLOW_PROCESSING'     ,'PROCESS_SQL',    to_date('08/15/2002','MM/DD/YYYY'));
insert into wwv_column_exceptions values('WWV_FLOW_STEPS'          ,'FIELD_TEMPLATE', to_date('08/15/2002','MM/DD/YYYY'));
insert into wwv_column_exceptions values('WWV_FLOW_STEP_PROCESSING','PROCESS_SQL',    to_date('08/15/2002','MM/DD/YYYY'));
