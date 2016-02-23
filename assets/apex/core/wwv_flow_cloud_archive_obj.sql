set define '^'
set verify off
prompt ...wwv_flow_cloud_archive_obj

Rem  Copyright (c) Oracle Corporation 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_cloud_archive_obj.sql
Rem    DESCRIPTION
Rem     Interface to exporting applications for cloud environments.
Rem
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     jstraub  11/18/2011 - Created
Rem     jstraub  12/08/2011 - added remove_archive_objects
Rem     jstraub  12/23/2011 - added create_archive_tables and create_archive_triggers

create or replace package wwv_flow_cloud_archive_obj
authid current_user
as

procedure create_archive_objects;

procedure create_archive_tables;

procedure create_archive_triggers;

procedure remove_archive_objects;

end wwv_flow_cloud_archive_obj;
/
show errors
