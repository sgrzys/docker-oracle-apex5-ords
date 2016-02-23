set define '^'
set verify off
prompt ...wwv_flow_ws_setup

Rem    NAME
Rem      wwv_flow_ws_setup.sql
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      cbcho     01/29/2010 - Created
Rem      jkallman  02/03/2010 - Added all_object_valid2
Rem      dpeake    04/20/2010 - Added display_setup_multi_schemas
Rem      cbcho     12/16/2010 - Added enough_space_available to validate if websheet schema has sufficient space to install objects (bug 9850519)


create or replace package wwv_flow_ws_setup
as
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    DESCRIPTION
--      Utility package to manage APEX$ tables.
--
--    NOTES
--      
--

g_apex$_status_collection    varchar2(255) := 'APEX$_OBJECT_STATUS';
g_invalid_apex$_collection   varchar2(255) := 'APEX$_OBJECTS_INVALID';
g_invalid_apex$_detail       varchar2(255) := 'APEX$_OBJECTS_INVALID_DETAIL';

function enough_space_available(
    p_schema           in varchar2,
    --
    p_additional_space out varchar2) return boolean;
    
function get_apex$_schema (
    p_workspace_id  in number default null) return varchar2;

function setup_exists (
    p_workspace_id  in number default null) return boolean;

function one_workspace_schema_exists return boolean;

function get_invalid_obj_ddl (
    p_object_type in varchar2,
    p_object_name in varchar2) return clob;
    
procedure display_setup_info (
    p_session_id   in number);

procedure display_setup_multi_schemas (
    p_schema   in varchar2,
    p_session_id   in number);

procedure display_setup_confirm (
    p_schema  in varchar2);

procedure display_remove_confirm;

procedure display_recreate_confirm;

procedure display_invalid_obj_ddl;

procedure get_object_status;

function all_object_valid (
    p_get_object_status  in varchar2 default 'Y'
    ) return boolean;
    
function all_object_valid2 return boolean;    
    
procedure recreate_invalid_objects;

procedure remove;

procedure install (
    p_schema         in varchar2,
    p_workspace_id   in number default null,
    p_install_to     in varchar2 default 'CURRENT_WORKSPACE'
    );
       
end  wwv_flow_ws_setup;
/
show errors
