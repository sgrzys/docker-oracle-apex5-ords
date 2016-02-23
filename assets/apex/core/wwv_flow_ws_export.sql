set define '^'
set verify off
set serveroutput on size 1000000
prompt ...wwv_flow_ws_export
create or replace package wwv_flow_ws_export
is
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2010 - 2012. All Rights Reserved.
--
--    NAME
--     wwv_flow_ws_export.plb
--
--    DESCRIPTION
--      Generate API calls to create Websheet objects
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    02/25/2010 - Created
--     cbcho    04/08/2010 - Added logic to export all metadata for Websheet
--     hfarrell 06/15/2011 - Added parameter p_file_id to procedure export and global variables g_blob_content, g_text, g_lf and g_cr (feature #661)
--     cbcho    03/21/2014 - Added p_export_pkg_app_mapping in export (feature #1399)
--
--------------------------------------------------------------------------------

g_mime_shown                 boolean := false;
g_file_id                    number;
g_blob_content               blob;
g_text                       varchar2(32767) := null;
g_lf                         varchar2(10) := unistr('\000a');
g_cr                         varchar2(10) := unistr('\000d');

procedure export (    
    p_ws_app_id                   in number,    
    p_format                      in varchar2 default 'UNIX',
    p_commit                      in varchar2 default 'YES',
    p_export_datagrid_data        in varchar2 default 'N',
    p_export_datagrid_annotations in varchar2 default 'N',
    p_export_page_annotations     in varchar2 default 'N',
    p_export_public_reports       in varchar2 default 'N',
    p_export_private_reports      in varchar2 default 'N',
    p_export_subscriptions        in varchar2 default 'N',
    p_export_pkg_app_mapping      in varchar2 default 'N',
    p_file_id                     in number   default null
    );
    
end wwv_flow_ws_export;
/
show error
