set define '^'
set verify off
prompt ...flows_files_upgrade


Rem  Copyright (c) Oracle Corporation 2003. All Rights Reserved.
Rem
Rem    NAME
Rem      flows_files_upgrade.sql
Rem
Rem    DESCRIPTION
Rem      HTML DB file repository upgrade
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem       jkallman  08/04/2003 - Created
Rem       cbcho     12/02/2005 - Changed dba_* to fully qualify with sys.dba_* (Bug 4390397)
Rem       jkallman  11/19/2009 - Added increase of NAME column to 400
Rem       jkallman  06/01/2010 - Added increase of MIME_TYPE column to 255
Rem       pawolf    06/02/2010 - Added index wwv_flow_files_file_idx and removal of wwv_flow_files_sgid_fk_idx (Bug 9773818)
Rem       cneumuel  05/20/2014 - Added column session_id and index (bug #15844363)
Rem       cneumuel  05/28/2014 - Fixed typo: s/flwos/flows
Rem       jstraub   02/20/2015 - Suppress operation not allowed from within a pluggable database (bug 20381781)

prompt ...flows_files_upgrade
declare
    l_found boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'FILE_CHARSET') loop
        l_found := TRUE;
    end loop;
    --
    -- If the new column wasn't found, add it to the file object repository
    if l_found = FALSE then
        execute immediate 'ALTER TABLE wwv_flow_file_objects$ ADD file_charset VARCHAR2(128)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/



declare
    l_exists boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'NAME'
                  and data_length = 400) loop
        l_exists := TRUE;
    end loop;
    --
    -- If the modified column size hasn't been applied, alter the table
    if l_exists = FALSE then
        execute immediate 'ALTER TABLE FLOWS_FILES.wwv_flow_file_objects$ modify name VARCHAR2(400)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/


declare
    l_exists boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'MIME_TYPE'
                  and data_length = 255) loop
        l_exists := TRUE;
    end loop;
    --
    -- If the modified column size hasn't been applied, alter the table
    if l_exists = FALSE then
        execute immediate 'ALTER TABLE FLOWS_FILES.wwv_flow_file_objects$ modify mime_type VARCHAR2(255)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/

declare
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_indexes
                where owner = 'FLOWS_FILES'
                  and index_name = 'WWV_FLOW_FILES_SGID_FK_IDX')
    loop
        execute immediate 'drop index FLOWS_FILES.wwv_flow_files_sgid_fk_idx';
        exit;
    end loop;
exception
    when not_in_pdb then
        null;
end;
/


declare
    l_exists boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_indexes
                where owner = 'FLOWS_FILES'
                  and index_name = 'WWV_FLOW_FILES_FILE_IDX') loop
        l_exists := TRUE;
    end loop;
    --
    -- If the index doesn't exist add it
    if l_exists = FALSE then
        execute immediate 'create index FLOWS_FILES.wwv_flow_files_file_idx on FLOWS_FILES.wwv_flow_file_objects$ (security_group_id, filename, flow_id)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/

declare
    l_exists boolean := false;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'SESSION_ID' )
    loop
        l_exists := true;
    end loop;
    --
    -- If the modified column size hasn't been applied, alter the table
    if l_exists = false then
        execute immediate 'alter table flows_files.wwv_flow_file_objects$ add session_id number';
        execute immediate 'create index flows_files.wwv_flow_files_session_idx on flows_files.wwv_flow_file_objects$ (session_id)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/

