set define '^'
set verify off
prompt ...wwv_flow_application_install

Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  01/28/2010 - Created
Rem      jkallman  08/16/2012 - Added publish_application
Rem      jkallman  08/19/2012 - Added p_new_translated_app_id to publish_application
Rem      cbcho     07/11/2014 - Added set_auto_install_sup_obj, get_auto_install_sup_obj (feature #1344)
Rem      pawolf    02/23/2015 - Added set_static_(app/theme/plugin)_file_prefix, get_static_(app/theme/plugin)_file_prefix (feature #1165)


create or replace package wwv_flow_application_install as

--  Copyright (c) Oracle Corporation 2010. All Rights Reserved.
--
--    NAME
--      wwv_flow_application_install
--
--    DESCRIPTION
--      Methods used to control APEX application installation behavior.  If not set,
--      then an APEX application will install normally.  However, if these global are set,
--      then these will take precedence over those specified in the application export file
--
--
--
--
--

--
-- Workspace ID
--
procedure set_workspace_id(
    p_workspace_id in number );

function get_workspace_id
    return number;


--
-- Application ID
--    
procedure set_application_id(
    p_application_id in number );
    
function get_application_id
    return number;   
    
procedure generate_application_id;   


--
-- Offset 
--    
procedure set_offset(
    p_offset in number );
    
procedure generate_offset;    
    
function get_offset
    return number;
    

--
-- Schema
--
procedure set_schema(
    p_schema in varchar2 );     
    
function get_schema 
    return varchar2;        
    
    
--
-- Name
--
procedure set_application_name(
    p_application_name in varchar2 );
    
function get_application_name
    return varchar2;       
    
    
--
-- Alias
--
procedure set_application_alias(
    p_application_alias in varchar2 );
    
function get_application_alias
    return varchar2;        
    
    
--
-- Image Prefix
--
procedure set_image_prefix(
    p_image_prefix in varchar2 );
    
function get_image_prefix
    return varchar2;      
    
    
--
-- Proxy
--
procedure set_proxy(
    p_proxy in varchar2 );
    
function get_proxy
    return varchar2;               

--
-- Auto Install of Supporting Objects
--   
procedure set_auto_install_sup_obj(
    p_auto_install_sup_obj in boolean );

function get_auto_install_sup_obj
    return boolean;

--
-- Static Application File Prefix
--
procedure set_static_app_file_prefix(
    p_file_prefix in varchar2 );
    
function get_static_app_file_prefix
    return varchar2;               

--
-- Static Theme File Prefix
--
procedure set_static_theme_file_prefix(
    p_theme_number in number,
    p_file_prefix  in varchar2 );

function get_static_theme_file_prefix(
    p_theme_number in number )
    return varchar2;               

--
-- Static Plugin File Prefix
--
procedure set_static_plugin_file_prefix(
    p_plugin_type in varchar2,
    p_plugin_name in varchar2,
    p_file_prefix in varchar2 );

function get_static_plugin_file_prefix(
    p_plugin_type in varchar2,
    p_plugin_name in varchar2 )
    return varchar2;               

--
-- Publish Application
--
procedure publish_application(
    p_application_id in number,
    p_language_code  in varchar2,
    p_new_translated_app_id in number default null );

--
-- Clear
--
procedure clear_all;       


        
end wwv_flow_application_install;
/
