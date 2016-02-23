set define '^'
set verify off
prompt ...collection_member_resize

Rem    NAME
Rem      collection_member_resize
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  05/03/2012 - Created
Rem
Rem    DESCRIPTION
Rem      Beginning in Database 12.1, VARCHAR2 columns can defined with maximum length of 32767 instead
Rem      of the earlier limit of 4000.  However, this can only be realized if the following two conditions are true:
Rem
Rem      1) database initialization parameter compatible is at least '12.0.0.0'
Rem      2) database initialization parameter max_sql_string_size = extended
Rem
Rem      The purpose of this script is to extend the VARCHAR2 columns of a WWV_FLOW_COLLECTION_MEMBERS$
Rem      to be 32767 if possible.  Not only will this script be invoked at APEX installation time, but it
Rem      can also be used to modify the APEX collections tables after a database is changed to use the
Rem      larger VARCHAR2 size.
Rem

declare
    l_stmt varchar2(1000) := 'ALTER TABLE ' || sys_context('USERENV','CURRENT_SCHEMA') || '.WWV_FLOW_COLLECTION_MEMBERS$ MODIFY #COLUMN_NAME# VARCHAR2(32767)';
begin
    for c1 in (select column_name
                 from dba_tab_columns
                where owner = sys_context('USERENV','CURRENT_SCHEMA') 
                  and table_name = 'WWV_FLOW_COLLECTION_MEMBERS$'
                  and data_type = 'VARCHAR2'
                  and data_length = 4000
                  and column_name like 'C0%') loop
        begin
            execute immediate replace(l_stmt,'#COLUMN_NAME#',c1.column_name);
        exception
            when others then
                if sqlcode <> -910 then
                    raise;
                end if;
        end;
    end loop;
end;
/
