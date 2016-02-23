set define '^'
set verify off
prompt ...wwv_flow_csv_data.sql


Rem  Copyright (c) Oracle Corporation 1999. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_csv_data.sql
Rem
Rem    DESCRIPTION
Rem     ASCII data loading tables  
Rem     
Rem
Rem    NOTES
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       sleuniss  03/20/2001 - Created
Rem       mhichwa   03/23/2001 - Removed unneeded carot 3 from triggers
Rem       sleuniss  03/29/2001 - added created on, created by id and 
Rem                              created by columns to
Rem                              wwv_flow_data_load_unload tab
Rem       cbcho     11/05/2001 - added EXCEL IMPORT check constraint value
Rem       jkallman  06/10/2004 - Rename duplicate object names for triggers (Bug 3256811)
Rem       jkallman  04/13/2009 - Add missing constraints and indexes (Bug 8416002)




prompt ...create table wwv_flow_data_load_unload

create table wwv_flow_data_load_unload (
    id                    number,
    platform              varchar2(1)  default 'W',
    file_columns          varchar2(4000),
    data_type             varchar2(255),
                          constraint valid_flow_data_type
                                  check (data_type in (
                                  'XML IMPORT',
                                  'XML EXPORT',
                                  'ASCII EXPORT',
                                  'ASCII IMPORT',
                                  'EXCEL IMPORT')),
    data_schema           varchar2(255),
    data_table            varchar2(255),
    success_rows          number,
    failed_rows           number,
    data_id               number,
    job_id                number,
    security_group_id     number,
    created_on            date,
    created_by            varchar2(100),
    created_by_id         number,
    enclosed_by           varchar2(4),
    separator             varchar2(1)  default ','
    )
/


alter table wwv_flow_data_load_unload
    add constraint wwv_flow_data_load_unload_pk
    primary key(id)
/

alter table wwv_flow_data_load_unload
    add constraint wwv_flow_data_load_unload_fk 
    foreign key(security_group_id)
    references wwv_flow_companies(provisioning_company_id)
    on delete cascade
/

create index wwv_flow_data_load_unload_idx1 on wwv_flow_data_load_unload(security_group_id)
/



prompt ...creating trigger wwv_biu_flow_data_load_unload
create or replace trigger wwv_biu_flow_data_load_unload
    before insert or update on wwv_flow_data_load_unload
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

prompt ...create table wwv_flow_data_load_bad_log

create table wwv_flow_data_load_bad_log (
     id                    number,
     load_id               number,
     security_group_id     number,
     errm                  varchar2(4000),
     data                  varchar2(4000)
    )
/

alter table wwv_flow_data_load_bad_log
    add constraint wwv_flow_data_load_bad_log_fk1 
    foreign key(load_id)
    references wwv_flow_data_load_unload(id)
    on delete cascade
/

alter table wwv_flow_data_load_bad_log
    add constraint wwv_flow_data_load_bad_log_fk2 
    foreign key(security_group_id)
    references wwv_flow_companies(provisioning_company_id)
    on delete cascade
/

create index wwv_flow_data_load_bad_idx1 on wwv_flow_data_load_bad_log(load_id)
/

create index wwv_flow_data_load_bad_idx2 on wwv_flow_data_load_bad_log(security_group_id)
/

create or replace trigger wwv_biu_flow_data_load_bad_log
    before insert or update on wwv_flow_data_load_bad_log
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/
