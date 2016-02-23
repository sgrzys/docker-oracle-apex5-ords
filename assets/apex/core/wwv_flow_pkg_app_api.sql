set define '^' verify off
prompt ...wwv_flow_pkg_app_api
create or replace package wwv_flow_pkg_app_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_pkg_app_api.sql
--
--    DESCRIPTION
--      Exports all Packaged Application related data of a workspace.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    hfarrell    05/25/2012 - Created
--    vuvarov     02/26/2014 - Added generate_application_zip, expand_application_zip (feature #1380)
--    vuvarov     03/03/2014 - Added sync_application_metadata
--
--------------------------------------------------------------------------------

--
-- Export data of Packaged Applications from the INTERNAL workspace into
-- a SQL script with all settings for SQL*Plus.
-- p_format can be DOS or UNIX.
--
procedure export_script (
    p_format  in varchar2 default 'UNIX',
    p_version in varchar2 default null);

--
-- Export data of all Packaged Application components in INTERNAL workspace.
-- p_format can be DOS or UNIX.
--
procedure export (
    p_format in varchar2 default 'UNIX' );

procedure sync_application_metadata( p_security_group_id in number,
                                     p_application_id    in number default null );

procedure generate_application_zip( p_security_group_id in number,
                                    p_keep_export       in boolean default false,
                                    p_application_id    in number default null );

procedure expand_application_zip( p_security_group_id in number,
                                  p_file_name         in varchar2,
                                  p_keep_export       in boolean default false );

end wwv_flow_pkg_app_api;
/
show errors
