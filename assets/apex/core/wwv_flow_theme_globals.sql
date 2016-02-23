    set define '^'
set verify off
prompt ...wwv_flow_theme_globals

Rem  Copyright (c) Oracle Corporation 2003. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_theme_globals.sql
Rem
Rem    DESCRIPTION
Rem      Package used to hole theme defaults which will be set by wwv_flow_theme_? packages
Rem      This is to facilitate application creation.
Rem
Rem    NOTES
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem       skutz     06/05/2004 - Created
Rem       skutz     06/11/2004 - Added g_default_option_label and g_default_required_label globals
Rem       skutz     06/17/2004 - Added g_default_chart_list and g_default_report_list globals
Rem       skutz     06/18/2004 - Added g_default_breadcrumb_region
Rem       skutz     06/22/2004 - Added g_default_sb_page_template and g_default_sb_region_template
Rem       skutz     06/24/2004 - Added g_default_sb_nav_template
Rem       skutz     08/02/2004 - Added g_default_ul_list
Rem       arayner   11/20/2009 - Added g_default_irr_template
Rem       msewtz    06/06/2012 - Added g_default_header_template and g_default_footer_template
Rem       hfarrell  05/27/2013 - Added g_dialog_template (feature #587)
Rem       hfarrell  06/26/2013 - Renamed g_dialog_template to g_default_dialog_template (feature #587)
Rem       msewtz    08/05/2013 - Added g_default_nav_list_template (feature 1236)
Rem       msewtz    08/05/2013 - Added g_navigation_type (feature 1236)
Rem       pmanirah  07/23/2014 - Added g_default_dialog_btr_template
Rem       davgale   08/06/2014 - Added g_default_top_nav_list_temp and g_default_side_nav_list_temp (feature 1472)
Rem       hfarrell  10/20/2014 - Added g_default_navbar_list_template (feature #1536)
Rem       hfarrell  10/22/2014 - Added g_default_nav_bar_type (feature #1536)
Rem       hfarrell  12/10/2014 - Added g_default_dialogbtnr_template and g_default_dialogr_template
Rem       hfarrell  12/11/2014 - Removed g_default_dialog_btr_template (verified by pmanirah that it is not required)
Rem       hfarrell  01/06/2015 - Added g_dialogbtnr_display_point - to specify display point for dialog button region
Rem       msewtz    02/12/2015 - Added g_default_nav_list_position   
 
create or replace package wwv_flow_theme_globals
as

    g_theme_id                     number;
    -- page
    g_navigation_type              varchar2(1);
    g_nav_bar_type                 varchar2(20);
    g_default_nav_list_position    varchar2(20);    

    g_default_page_template        number;
    g_error_template               number;
    g_printer_friendly_template    number;
    g_breadcrumb_display_point     varchar2(2000);
    g_sidebar_display_point        varchar2(2000);
    g_login_template               number;
    -- region
    g_default_button_template      number;
    g_default_region_template      number;
    g_default_chart_template       number;
    g_default_form_template        number;
    g_default_reportr_template     number;
    g_default_tabform_template     number;
    g_default_wizard_template      number;
    g_default_menur_template       number;
    g_default_listr_template       number;
    g_default_irr_template         number;
    g_default_header_template      number;
    g_default_footer_template      number;
    --row/report
    g_default_report_template      number;
    -- field/label
    g_default_label_template       number;
    -- menu
    g_default_menu_template        number;
    -- calendar
    g_default_calendar_template    number;
    -- lists
    g_default_list_template        number;
    g_default_nav_list_template    number;
    g_default_top_nav_list_temp    number;
    g_default_side_nav_list_temp   number;
    g_default_option_label         number;
    g_default_required_label       number;
    g_default_navbar_list_template number;
    -- dialog page
    g_default_dialog_template      number;
    -- dialog button region
    g_default_dialogbtnr_template  number;
    -- dialog button region position
    g_dialogbtnr_display_point     varchar2(2000);
    -- dialog content region
    g_default_dialogr_template     number;
    -- list globals
    g_default_chart_list           number;
    g_default_report_list          number;
    g_default_ul_wo_bullet_list    number;
    --
    g_default_breadcrumb_region    number;

    g_default_sb_page_template     number;
    g_default_sb_region_template   number;
    g_default_sb_nav_template      number;

end wwv_flow_theme_globals;
/
show errors;