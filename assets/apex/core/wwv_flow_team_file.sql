set define off
set verify off

prompt ...wwv_flow_team_file
create or replace package wwv_flow_team_file as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--     wwv_flow_team_file.sql
--
--    DESCRIPTION
--      Package to manage APEX$TEAM_DEV_FILES table.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    07/17/2012 - Created (feature #1007)
--     cbcho    07/18/2012 - Added team_dev_file_enabled
--     asitters 04/29/2014 - Added p_filesize_quota parameter to install procedure (feature 1415)
--
--------------------------------------------------------------------------------

function team_dev_file_enabled return boolean;

procedure install (
    p_filesize_quota    in number default 15728640
    );

procedure add_file (
    p_component_id    in number default null,
    p_component_type  in varchar2 default null,
    p_file_name       in varchar2 default null,
    p_file_comments   in varchar2 default null
    );

procedure create_file_collection (
    p_component_id    in number default null,
    p_max_row_count   in number default null
    );

function get_file_src (
    p_file_id in number )
    return varchar2;
    
procedure get_file (
    p_page_id    in number,
    p_session_id in number,
    p_file_id    in number,
    p_checksum   in varchar2 );
    
procedure delete_file (
    p_file_id   in number);

procedure fetch_file (
    p_file_id          in number,
    p_component_id     out number,
    p_component_type   out varchar2,
    p_filename         out varchar2,
    p_file_mimetype    out varchar2,
    p_file_comments    out varchar2,
    p_updated_on       out varchar2,
    p_updated_by       out varchar2
    );

procedure save_file_comment (
    p_file_id          in number default null,
    p_file_comments    in varchar2 default null);
                      
end  wwv_flow_team_file;
/
show errors
set define '^'
