set define '^' feedback off
prompt ...wwv_flow_imp_parser
create or replace package wwv_flow_imp_parser as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      imp_parser.sql
--
--    DESCRIPTION
--      This package provides parsing engine for flow export file.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    05/19/2003 - Created
--     cbcho    05/21/2003 - Added get_flow_id function
--     cbcho    05/21/2003 - Added get_parse_as_schema
--     cbcho    05/21/2003 - Added get_security_group_id
--     cbcho    05/22/2003 - Added p_parse_as_schema in parse
--     cbcho    05/22/2003 - Added get_schema_provisioned
--     cbcho    05/23/2003 - Added get_css_name
--     cbcho    05/23/2003 - Added get_image_name
--     cbcho    06/02/2003 - Added function flow_exists
--     cbcho    06/03/2003 - Added function is_company_export
--     cbcho    06/06/2003 - Added function get_version
--     cbcho    06/11/2003 - Added function get_build_status
--     sspadafo 07/04/2003 - Added flow relocation param to parse (Bug 3025348)
--     sspadafo 07/05/2003 - Added p_adjust_offset param to parse (Bug 3025348)
--     sspadafo 07/07/2003 - Added p_original_flow_id param to parse (Bug 3025348)
--     sspadafo 07/10/2003 - Added get_page_id function (Bug 3046586)
--     sspadafo 06/15/2004 - Add function get_workspace_schemas (Bug 3689457)
--     sspadafo 06/18/2004 - Add support for theme install
--     sspadafo 06/24/2004 - Add support for ui defaults
--     sspadafo 04/26/2005 - Add function get_workspace_name (Bug 4285727)
--     sspadafo 05/31/2006 - Add function is_component_export
--     sspadafo 06/05/2006 - Add function get_component_manifest (Bug 5234327)
--     pawolf   05/08/2009 - Added plugin support
--     sbkenned 01/13/2010 - Added get_attr_dict_workspace
--     pawolf   02/24/2010 - Added get_feedback_origin
--     cbcho    04/08/2010 - Added websheet_parse, websheet_get_stmt, websheet_get_block
--     cbcho    07/11/2012 - Added p_pkg_app_install to parse (feature #992)
--     cbcho    01/29/2013 - Added overloaded procedure parse to parse CLOB (bug #16224861)
--     cneumuel 04/16/2013 - In parse: added p_new_name, p_new_build_status, p_clean_language_map (feature #985)
--     cbcho    08/19/2013 - Exposed replace_links to use in wwv_flow_pkg_app_parser (feature #1257)
--     cbcho    08/21/2013 - Exposed websheet_replace_links to use in wwv_flow_pkg_app_parser (feature #1257)
--     cneumuel 06/12/2014 - In parse: removed p_clean_language_map and corresponding code, since the cleanup now already happens in wwv_flow_api.create_language_map
--     cneumuel 01/29/2015 - Added parse_import (bug #20205388)
--     vuvarov  03/27/2015 - In parse(p_clob): added p_offset (bug 20738738)
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# utility functions
--#
--##############################################################################

function get_build_status (p_file_id in number)
return varchar2;

function get_version (p_file_id in number)
return varchar2;

function is_websheet_export (p_file_id in number)
return boolean;

function is_company_export (p_file_id in number)
return boolean;

function flow_exists (p_flow_id in number)
return number;

function get_image_name (p_file_id in number)
return varchar2;

function get_css_name (p_file_id in number)
return varchar2;

function get_workspace_name (p_file_id in number)
return varchar2;

function get_attr_dict_workspace (p_file_id in number)
return varchar2;

function get_schema_provisioned (p_file_id in number)
return varchar2;

function get_workspace_schemas (p_file_id in number)
return varchar2;

function get_component_manifest (p_file_id in number)
return clob;

function get_flow_id (p_file_id in number)
return number;

function get_ws_app_id (p_file_id in number)
return number;

function get_page_id (p_file_id in number)
return number;

function get_theme_id (p_file_id in number)
return number;

function get_theme_name (p_file_id in number)
return varchar2;

function get_plugin_type (p_file_id in number)
return varchar2;

function get_plugin_name (p_file_id in number)
return varchar2;

function get_plugin_display_name (p_file_id in number)
return varchar2;

function get_ui_schema (p_file_id in number)
return varchar2;

function get_security_group_id (p_file_id in number)
return number;

function get_parse_as_schema (p_file_id in number)
return varchar2;

function get_websheet_schema (p_file_id in number)
return varchar2;

function get_feedback_origin (p_file_id in number)
return varchar2;

function is_component_export (p_file_id in number)
return boolean;

procedure replace_links(
    p_old_flow in number,
    p_new_flow in number);

procedure websheet_replace_links(
    p_old_ws_app_id in number,
    p_new_ws_app_id in number);

--##############################################################################
--#
--# parse / install
--#
--##############################################################################

--==============================================================================
-- types for import files and parser results (see parse_import)
-- todo: themes, ui defaults, team dev feedback
--==============================================================================
subtype t_parsed_import_type_id is pls_integer range 1 .. 4;
c_parsed_import_type_workspace constant t_parsed_import_type_id := 1;
c_parsed_import_type_app       constant t_parsed_import_type_id := 2;
c_parsed_import_type_websheet  constant t_parsed_import_type_id := 3;
c_parsed_import_type_plugin    constant t_parsed_import_type_id := 4;
type t_parsed_import  is record (
    type_id t_parsed_import_type_id,
    errors  wwv_flow_t_varchar2 := wwv_flow_t_varchar2() );

--==============================================================================
-- parser for import file. does not run import file.
--==============================================================================
function parse_import (
    p_clob in clob )
    return t_parsed_import;

--==============================================================================
-- parse and run import file
--==============================================================================
procedure parse (
  p_file_id            in number,
  p_parse_as_schema    in varchar2 default null,
  p_install_as_flow    in number   default null,
  p_original_flow_id   in number   default null,
  p_adjust_offset      in boolean  default true,
  p_create_theme       in boolean  default false,
  p_pkg_app_install    in boolean  default false,
  p_new_name           in varchar2 default null,
  p_new_build_status   in varchar2 default null );

--==============================================================================
-- parse and run import file
--==============================================================================
procedure parse (
  p_clob              in clob,
  p_parse_as_schema   in varchar2 default null,
  p_install_as_flow   in number   default null,
  p_original_flow_id  in number   default null,
  p_offset            in number   default null,
  p_adjust_offset     in boolean  default true,
  p_create_theme      in boolean  default false,
  p_pkg_app_install   in boolean  default false );

--==============================================================================
-- parse and run websheet import file
--==============================================================================
procedure websheet_parse (
  p_file_id            in number,
  p_websheet_schema    in varchar2 default null,
  p_new_ws_app_id      in number   default null,
  p_original_ws_app_id in number   default null,
  p_adjust_offset      in boolean  default true
  );
end wwv_flow_imp_parser;
/
show error;
