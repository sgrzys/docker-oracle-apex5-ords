set define '^'
set verify off
prompt ...wwv_flow_cloud_archive

Rem  Copyright (c) Oracle Corporation 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_cloud_archive.sql
Rem    DESCRIPTION
Rem     Interface to exporting applications for cloud environments.
Rem
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     jstraub  12/07/2011 - Created
Rem     jstraub  12/08/2011 - added incremental_archive
Rem     jstraub  12/12/2011 - added archive_file and archive_files
Rem     jstraub  12/14/2011 - added purge_archives and purge_versions
Rem     jstraub  12/21/2011 - added g_max_versions
Rem     jstraub  01/04/2012 - replaced apex_application_global reference with wwv_flow_global (bug 13499756)
Rem     jstraub  02/09/2012 - added p_export_full_wksp to incremental_archive
Rem     jstraub  04/03/2012 - added p_log to purge_versions (bug 13921918)
Rem     jstraub  04/26/2012 - added archive_rest (bug 14008382)

create or replace package wwv_flow_cloud_archive
authid current_user
as

g_max_versions      number;

function create_header(
    p_workspace_id          in number,
    p_version               in number   default null,
    p_archive_name          in varchar2 default null,
    p_comments              in varchar2 default null,
    p_retentions_in_days    in number   default 7) return number;

procedure archive_applications(
    p_workspace_id          in number,
    p_header_id             in number   default null,
    p_application_id        in number   default null,
    p_version               in number   default null,
    p_archive_name          in varchar2 default null,
    p_comments              in varchar2 default null,
    p_retentions_in_days    in number   default 7);

procedure incremental_archive(
    p_workspace_id          in number,
    p_archive_name          in varchar2 default null,
    p_comments              in varchar2 default null,
    p_export_full_wksp      in varchar2 default 'N',
    p_retentions_in_days    in number   default 7);

procedure archive_workspace(
    p_header_id             in number,
    p_workspace_id          in number);

procedure archive_files(
    p_header_id             in number,
    p_workspace_id          in number);

procedure archive_rest(
    p_header_id             in number,
    p_workspace_id          in number);

function archive_file(
    p_workspace_id          in number,
    p_file_id               in number,
    p_header_id             in number   default null,
    p_version               in number   default null,
    p_archive_name          in varchar2 default null,
    p_comments              in varchar2 default null,
    p_retentions_in_days    in number   default 7,
    p_log                   in boolean  default true) return number;

procedure archive_files(
    p_workspace_id          in number,
    p_files                 in wwv_flow_global.vc_arr2,
    p_version               in number   default null,
    p_archive_name          in varchar2 default null,
    p_comments              in varchar2 default null,
    p_retentions_in_days    in number   default 7);

procedure purge_archives;

procedure purge_versions(
    p_max_versions_to_retain    in number,
    p_log                       in boolean default true);

end wwv_flow_cloud_archive;
/
show errors
