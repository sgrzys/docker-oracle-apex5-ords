set define '^'
set verify off
prompt ...create flows_files


Rem  Copyright (c) Oracle Corporation 2001 - 2002. All Rights Reserved.
Rem
Rem    NAME
Rem      flows_files_new.sql
Rem
Rem    DESCRIPTION
Rem      Creates database table required to store uploaded files.
Rem
Rem    NOTES
Rem      
Rem    ARGUMENTS
Rem       1. TNS connect information
Rem       2.
Rem       3. Flows Schema Owner
Rem       4.
Rem       5. Flows Password
Rem       6.
Rem       7.
Rem       8.
Rem       9. Application Tablespace
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jstraub  10/04/2001 - Created
Rem       tmuth    10/09/2001 - Added create any synonym.  Removed grants and added to upgrade procedure.
Rem       tmuth    10/09/2001 - Removed trigger and moved to flows_files_new2.
Rem       tmuth    10/10/2001 - Removed extra ";" from second connect
Rem       tmuth    10/10/2001 - Moved connections to ins.sql
Rem       tmuth    10/14/2001 - Added wwv_flow_file_objects$ public synonym
Rem       cbcho    11/13/2001 - Added wwv_flow_files_user_idx
Rem       mhichwa  04/16/2002 - Changed file header comments
Rem       mhichwa  08/12/2002 - Increased size of updated_by and created_by columns from 30 bytes
Rem       mhichwa  08/05/2002 - Changed length of filename from 350 to 400
Rem       jkallman 08/04/2003 - Added file_charset (Bug 3033761)
Rem       jstraub  03/25/2004 - Moved grant on wwv_flow_file_objects$ out and into coreins.sql (Bug 3532644)
Rem       pawolf   05/07/2009 - Added index on security_group_id, filename, flow_id and remove index wwv_flow_files_sgid_fk_idx
Rem       jkallman 11/19/2009 - Changed NAME column from VARCHAR2(90) to VARCHAR2(400)
Rem       jkallman 06/01/2010 - Changed MIME_TYPE to varchar2(255)
Rem       cneumuel 05/22/2014 - Added column session_id and index (bug #15844363)
Rem       cneumuel  05/28/2014 - Fixed typo: s/flwos/flows
Rem       


prompt ... create wwv_flow_file_objects

create table wwv_flow_file_objects$ (
    id                               number 
                                     constraint wwv_flow_file_obj_pk
                                     primary key,
    flow_id                          number not null,
    name                             varchar2(400) not null unique,
    pathid                           number,
    filename                         varchar2(400),
    title                            varchar2(255),
    mime_type                        varchar2(255),
    doc_size                         number,
    dad_charset                      varchar2(128),
    created_by                       varchar2(255),
    created_on                       date,
    updated_by                       varchar2(255),
    updated_on                       date,
    deleted_as_of                    date default to_date('01-01-0001','DD-MM-YYYY') not null,
    last_updated                     date,
    content_type                     varchar2(128),
    blob_content                     blob,
    language                         varchar2(30),
    description                      varchar2(4000),
    security_group_id                number,
    file_type                        varchar2(255),
    file_charset                     varchar2(128),
    session_id                       number
    )
/


comment on table wwv_flow_file_objects$ is 
'General file repository table for all flows applications, used to store SQL Scripts, BLOBs, etc.'
/

create index wwv_flow_files_file_idx on wwv_flow_file_objects$ (security_group_id, filename, flow_id)
/

create index wwv_flow_files_user_idx on wwv_flow_file_objects$ (created_by)
/

create index wwv_flow_files_session_idx on flows_files.wwv_flow_file_objects$ (session_id)
/

create public synonym wwv_flow_file_objects$ for wwv_flow_file_objects$;

