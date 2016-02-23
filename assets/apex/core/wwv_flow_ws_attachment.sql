set define '^'
set verify off
prompt ...wwv_flow_ws_attachment

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ws_attachment.sql
Rem    DESCRIPTION
Rem     Interface to add attachments to data store.
Rem
Rem    NOTES
Rem      API to handle worksheet attachements.
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     jstraub  04/17/2007 - Created
Rem     cbcho    05/27/2008 - Renamed wwv_flow_worksheet_attachment to wwv_flow_ws_attachment
Rem     cbcho    07/28/2008 - Added p_project_id to add_doc
Rem     cbcho    07/28/2008 - Removed download_doc to use apex_util.get_blob_file_src instead
Rem     cbcho    05/15/2009 - Added p_websheet_id to add_doc
Rem     cbcho    05/18/2009 - Added get_ws_file, get_ws_file_src
Rem     cbcho    09/29/2009 - Added p_ws_app_id to add_doc
Rem     cbcho    12/02/2009 - Added p_webpage_id,p_component_level to add_doc
Rem     cbcho    02/04/2010 - Added change_image_attr
Rem     cbcho    02/04/2010 - Added p_image_alias to add_doc
Rem     sbkenned 02/09/2010 - Updated change_image_attr to include description
Rem     pawolf   03/10/2010 - Modified get_ws_file* procedures
Rem     cbcho    05/11/2011 - Changed change_image_attr to accept p_page_id

create or replace package wwv_flow_ws_attachment
as

procedure add_doc (
    p_ws_app_id       in number,
    p_webpage_id      in number default null,
    p_websheet_id     in number default null,  
    p_row_id          in varchar2 default null,
    p_component_level in varchar2 default null,
    p_file_name       in varchar2 default null,
    p_image_alias     in varchar2 default null,
    p_desc            in varchar2 default null
    );

procedure delete_doc (
    p_doc_id    in varchar2
    );

procedure change_image_attr (
    p_ws_app_id        in number,
    p_file_id          in number,
    p_page_id          in number default null, 
    p_image_alias      in varchar2 default null,
    p_image_attributes in varchar2 default null,
    p_description      in varchar2 default null
    );
    
function get_ws_file_src (
    p_file_id in number )
    return varchar2;
    
procedure get_ws_file (
    p_session_id in number,
    p_file_id    in number,
    p_checksum   in varchar2 );

end wwv_flow_ws_attachment;
/
show errors;
