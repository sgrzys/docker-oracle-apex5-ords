set define '^'
set verify off
prompt ...wwv_flow_theme_manager spec
rem  copyright (c) oracle corporation 2003-2007. all rights reserved.
rem
rem    name
rem      wwv_flow_theme_manager.sql
rem
rem    description
rem      package body used to manage theme switching.
rem
rem    notes
rem
rem    modified    (mm/dd/yyyy)
rem    skutz     06/10/2004 - created
rem    skutz     06/14/2004 - added copy_theme api
rem    skutz     06/14/2004 - added initialize_theme api to set null theme_id to a value
rem    skutz     06/17/2004 - added switch_theme_defaults api
rem    skutz     06/18/2004 - added get_new_theme_id to return next avail theme_id for import parser
rem    skutz     06/28/2004 - added set_globals procedure
rem    skutz     06/29/2004 - added get_button_position function
rem    skutz     07/30/2004 - added set_defaults procedure
Rem    skutz     08/30/2004 - Added get_util_xxx functions to return template utilization strings for reporting (bug 3862376)
Rem    mhichwa   12/07/2007 - Added create_new_workspace_theme
Rem    mhichwa   12/11/2007 - Added change_workspace_theme and delete_workspace_theme
Rem    mhichwa   12/12/2007 - Added add_theme_to_application
Rem    mhichwa   12/12/2007 - Added get_theme_image_icon
Rem    mhichwa   12/13/2007 - Added procedure create_new_public_theme
Rem    mhichwa   12/13/2007 - Added procedure change_public_theme, delete_public_theme
Rem    mhichwa   12/22/2007 - Added f4000_process_theme_image
Rem    pawolf    03/13/2012 - Added p_interface_id to set_globals (feature# 827)
Rem    pawolf    03/19/2012 - Changed code to only use new columns in wwv_flow_user_interfaces instead of the old columns in wwv_flow (feature# 827)
Rem    msewtz    06/01/2012 - Updated add_theme_to_application to use new standard theme architecture 
Rem    pawolf    04/11/2013 - Removed package wwv_flow_theme_files and moved code to wwv_flow_theme_manager
Rem    msewtz    11/07/2013 - Added support for setting theme style via creat app wizard
Rem    msewtz    03/07/2014 - Updated switch theme to allow migration of tab based navigation to navigation lists
Rem    msewtz    07/22/2014 - Added theme subscriptions (feature 823)
Rem    msewtz    02/11/2015 - Added is_theme_switch_allowed to check theme compatibility

create or replace package wwv_flow_theme_manager is

    empty_vc_arr wwv_flow_global.vc_arr2;
    
    procedure create_new_public_theme (
       p_workspace_id    in number,
       p_app_id          in number,
       p_app_theme_id    in number,
       p_theme_name      in varchar2,
       p_theme_number    in number,
       p_theme_desc      in varchar2 default null);
    
    function get_theme_image_icon (
       p_theme_id               in number,
       p_application_id         in number)
       return varchar2;
    
    procedure add_theme_to_application (
        p_application_id         in number,
        p_theme_id               in number);
    
    procedure delete_workspace_theme (
        p_id              in number);
        
    procedure delete_public_theme (
        p_id              in number);
    
    procedure change_workspace_theme (
        p_id              in number,
        p_theme_name      in varchar2,
        p_theme_number    in number,
        p_theme_desc      in varchar2 default null);
        
    procedure change_public_theme (
        p_id              in number,
        p_theme_name      in varchar2,
        p_theme_number    in number,
        p_theme_desc      in varchar2 default null);
    
    procedure create_new_workspace_theme (
        p_app_id          in number,
        p_app_theme_id    in number,
        p_theme_name      in varchar2,
        p_theme_number    in number,
        p_theme_desc      in varchar2 default null);
    
    function count_consolidation (
        p_application_id       in number,
        p_consolidate_from     in number default 0,
        p_consolidate_to       in number default 0,
        p_template_type        in varchar2 default null)
        return number;

    procedure consolidate_templates (
        p_application_id       in number,
        p_consolidate_from     in number default 0,
        p_consolidate_to       in number default 0,
        p_template_type        in varchar2 default null);

    function is_navigation_upgrade (
        p_flow_id    in number,
        p_from_theme in number,
        p_to_theme   in number 
    ) return boolean;
    
    function is_theme_switch_allowed (
        p_flow_id    in number,
        p_from_theme in number,
        p_to_theme   in number     
    ) return varchar2;
    
    procedure switch_theme (
        p_flow_id    in number,
        p_from_theme in number,
        p_to_theme   in number );

    procedure delete_theme(p_flow_id in number, p_theme_id in number, p_import in varchar2 default 'N');

    procedure renumber_theme(p_flow_id in number, p_to_theme in number, p_from_theme in number);

    procedure copy_theme(
        p_from_flow_id    in number, 
        p_to_flow_id      in number, 
        p_from_theme      in number, 
        p_to_theme        in number, 
        p_theme_style_id  in number default null,
        p_subscribe_theme in boolean default false
    );

    procedure set_globals (
        p_flow_id           in number,
        p_to_theme          in number default null,
        p_user_interface_id in number default null );

    function get_new_theme_id(p_flow_id in number) return number;
    function get_button_postion(p_template_id in number, p_position in varchar2) return varchar2;
    function get_page_util(p_flow_id in number, p_id in number) return varchar2;
    function get_region_util(p_flow_id in number, p_id in number) return varchar2;
    function get_report_util(p_flow_id in number, p_id in number) return varchar2;
    function get_list_util(p_flow_id in number, p_id in number) return varchar2;
    function get_field_util(p_flow_id in number, p_id in number) return varchar2;
    function get_button_util(p_flow_id in number, p_id in number) return varchar2;
    function get_menu_util(p_flow_id in number, p_id in number) return varchar2;
    function get_cal_util(p_flow_id in number, p_id in number) return varchar2;

    procedure f4000_process_theme_image (
        p_id           in number   default null,
        p_THEME_IMAGE  in varchar2 default null,
        P_CUSTOM_IMAGE in varchar2 default null)
        ;

procedure find_template_files (
    p_flow_id              in number,
    p_theme                in number   default null,
    p_show_templates       in varchar2 default 'N',
    p_show_page_components in varchar2 default 'N',
    p_show_components      in varchar2 default 'N',
    p_show_gif             in varchar2 default 'N',
    p_show_jpg             in varchar2 default 'N',
    p_show_png             in varchar2 default 'N',
    p_show_css             in varchar2 default 'N',
    p_show_js              in varchar2 default 'N',
    p_show_swf             in varchar2 default 'N',
    p_show_ico             in varchar2 default 'N'
    )	
    ;

procedure find_css_classes (
    p_flow_id              in number,
    p_theme                in number   default null,
    p_show_templates       in varchar2 default 'N',
    p_show_page_components in varchar2 default 'N',
    p_show_components      in varchar2 default 'N')
    ;

procedure find_substitution_strings (
    p_flow_id              in number,
    p_theme                in number   default null)
    ;
    
procedure find_object_dependencies (
   p_flow_id      in number,
   p_page_id      in number default null)
   ;
   
function get_theme_image_name (
   p_id           in number)
   return         varchar2
   ;

end;
/
show errors;
