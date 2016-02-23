set define '^'
set verify off
prompt ...wwv_flow_copy_util

Rem    NAME
Rem      copyu.sql
Rem    Arguments:
Rem     1:  
Rem     2:
Rem     3:  Flow user
Rem    MODIFIED   (MM/DD/YYYY)
Rem     cbcho      03/04/2002 - Created
Rem     cbcho      03/14/2002 - Added copy_navbar
Rem     sspadafo   09/20/2002 - Added copy_auth_setup
Rem     cneumuel   02/03/2011 - Added plugin support for authorization (feature #580)
Rem     cneumuel   02/11/2011 - Added copy_plugin for authorization copying (feature #580)
Rem     cneumuel   02/16/2011 - Added copy_plugin_details to refactor code from copy_metadata.plb
Rem     pawolf     03/30/2012 - Moved copy_plugin and copy_plugin_details to wwv_flow_plugin_dev
Rem     pawolf     10/22/2014 - Added copy_plugin


create or replace package wwv_flow_copy_util
as
--  Copyright (c) Oracle Corporation 1999 - 2002. All Rights Reserved.
--
--
--    DESCRIPTION
--      Used to copy flow objects.
--
--    NOTES
--      
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--    RUNTIME DEPLOYMENT: YES
--
--
--==============================================================================
procedure copy_shortcut (
    p_copy_from_flow_id  in number,
    p_flow_id            in varchar2,
    p_from_shortcut_id   in number,
    p_to_shortcut_name   in varchar2,
    p_to_shortcut_id     in number default null);
--
--==============================================================================
procedure copy_security_scheme (
    p_copy_from_flow_id   in number,
    p_flow_id             in varchar2,
    p_from_scheme_id      in number,
    p_to_scheme_name      in varchar2,
    p_to_scheme_id        in number default null,
    p_subscribe           in boolean default false );
--
--==============================================================================
procedure copy_navbar (
    p_copy_from_flow_id   in number,
    p_flow_id             in varchar2,
    p_from_navbar_id      in number,
    p_to_navbar_name      in varchar2,
    p_to_navbar_id        in number default null );
--  
--==============================================================================
procedure copy_authentication (
    p_copy_from_flow_id      in number,
    p_flow_id                in varchar2,
    p_from_authentication_id in number,
    p_to_authentication_name in varchar2,
    p_to_authentication_id   in number  default null,
    p_subscribe              in boolean default false );
--  
--==============================================================================
procedure copy_plugin (
    p_from_application_id in number,
    p_from_plugin_id      in number,
    p_to_application_id   in varchar2,
    p_to_display_name     in varchar2,
    p_subscribe           in boolean default false );
--   
end wwv_flow_copy_util;
/
show error;
