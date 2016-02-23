set define '^' verify off
prompt ...wwv_flow_css_calendar
create or replace package wwv_flow_css_calendar
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_css_calendar.sql
--
--    DESCRIPTION
--      This package is resonsible for handling css calendar native region plugin.
--
--    MODIFIED      (MM/DD/YYYY)
--    pmanirah       07/30/2013  - Created
--    pmanirah       07/30/2013  - Removed calls to render_calendar and ajax_calendar.
--                                 these calls will me made through render_region of wwv_flow_region_native.plb
--    pmanirah       08/01/2013  - Added a mew constant g_css_class_default which will be used to set default css class for event
--    pmanirah       11/25/2013  - Updated the t_event type by adding new attribute - description feature#1315
--    pmanirah       03/17/2014  - Added new function to retrieve first of day of the week and time format getFirstDayofWeek and getTimeFormat
--    pmanirah       06/06/2014  - Added a new function to transform the application date format to Fullcalendar date format
--    pmanirah       08/13/2014  - Added new parameters to p_allday_slot to mobile_week_view and mobile_day_view
--    pmanirah       11/10/2014  - Added new global variables g_xml_data, g_template_xslt, g_print_config and g_export_blob 
--    pmanirah       11/10/2014   - Moved render_css_calendar and ajax_css_calendar functions to seperate package wwv_flow_css_calendar
--    pmanirah       01/14/2015   - Added a new attribute to t_event record, this will be used during the sorting algorithm
--



    g_xml_data          varchar2(32767) := null;
    g_template_xslt     varchar2(32767) := null;




    g_print_config            varchar2(4000) := wwv_flow_platform.get_preference(p_preference_name => 'PRINT_BIB_LICENSED' );
    g_export_blob             blob;
    

    c_format                  constant varchar2(16)     := 'RRRRMMDDHH24MISS';
    g_start_of_week           number := 19721105;
    g_end_of_week             number;
    g_date_values             wwv_flow_global.vc_arr2;
    g_end_date_values         wwv_flow_global.vc_arr2;
    g_is_mobile_interface     boolean := not wwv_flow_page.is_desktop_ui(); 

    g_css_class_default       constant varchar2(255) := 'fc-apex-events-default';

    g_region_id               varchar2(4000);
    g_feature_option          varchar2(4000);
    g_end_date_column         varchar2(255);
    g_create_link             varchar2(4000);

    type t_event is record (
     id           varchar2(4000),
     url          varchar2(4000),
     title        varchar2(4000),
     check_sum    varchar2(4000),
     all_day      boolean,
     startdate    varchar2(255),
     enddate      varchar2(255),
     cssclass     varchar2(255),
     description  varchar2(32767),
     sorting_date varchar2(255) );

    type t_events_list is table of t_event index by pls_integer;

    function get_control_buttons(
                        p_feature_options   in varchar2)
    return varchar2;

    function get_download_options(
                        p_download_options   in varchar2)
    return varchar2;

    procedure download_format(
        p_events_list           in t_events_list,
        p_download_type         in varchar2,
        p_title                 in varchar2,
        p_view_start_date       in varchar2,
        p_view_end_date         in varchar2,
        p_start_date_data_type  in varchar2,
        p_end_date_data_type    in varchar2 );

      
    /*procedure send_email( p_events_list           in t_events_list,
                          p_type                  in varchar2,
                          p_title                 in varchar2,
                          p_view_start_date       in varchar2,
                          p_view_end_date         in varchar2,
                          p_start_date_data_type  in varchar2,
                          p_end_date_data_type    in varchar2 ); */

    procedure send_email( 
        p_events_list     in t_events_list,
        p_type            in varchar2 default 'M',
        p_to              in varchar2 default null,
        p_from            in varchar2 default null,
        p_sub             in varchar2 default null );   

    -- get application time format 12hours or 24 hours
    function getTimeFormat
    return varchar2;
    
    -- get application first day settings (sunday = 0, monday = 1, etc..)
    function getFirstDayOfWeek
    return varchar2;
        
    procedure mobile_month_view (
        p_start_date     varchar2 default null,
        p_end_date       varchar2 default null,
        p_cur_date       varchar2 default null,
        p_events_list    t_events_list
    );

    procedure mobile_week_view (
        p_start_date  varchar2 default null,
        p_end_date    varchar2 default null,
        p_cur_date    varchar2 default null,
        p_type        varchar2 default 'LARGE',
        p_allday_slot boolean  default false,
        p_events_list t_events_list
    );

    procedure mobile_list_view (
        p_start_date  varchar2 default null,
        p_end_date    varchar2 default null,
        p_cur_date    varchar2 default null,
        p_events_list t_events_list
    );

    procedure mobile_day_view (
        p_start_date   varchar2 default null,
        p_end_date     varchar2 default null,
        p_cur_date     varchar2 default null,
        p_allday_slot  boolean  default false,
        p_events_list  t_events_list
    );

    procedure mobile_year_view (
        p_start_date   varchar2 default null,
        p_end_date     varchar2 default null,
        p_cur_date     varchar2 default null,
        p_events_list  t_events_list
    );

    procedure mobile_day_data (
        p_start_date   varchar2 default null,
        p_end_date     varchar2 default null,
        p_events_list  t_events_list
    );

    procedure process_date(
        p_start_date in out varchar2,
        p_end_date   in out varchar2,
        p_cur_date   in out varchar2,
        p_action            varchar2 := 'MON_TODAY'
    );
    
    function db_to_fc_datetime_mask (
          p_db_mask            varchar2 )
    return varchar2;
    
    
    --
    --==============================================================================
    -- Renders the CSS Calendar region type based on the configuration of
    -- the region.
    --==============================================================================    
    procedure render_css_calendar (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_is_printer_friendly in boolean );

    --==============================================================================
    -- Returns the CSS Calendar events.
    --==============================================================================

    procedure ajax_css_calendar (
        p_region in wwv_flow_plugin_api.t_region );

end wwv_flow_css_calendar;
/
show errors
