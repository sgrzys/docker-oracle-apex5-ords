set define '^'
set verify off
prompt ...wwv_flow_upgrade_app


create or replace package wwv_flow_upgrade_app
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    NAME
--      wwv_flow_upgrade_app.sql
--
--    DESCRIPTION
--      This package is used for upgrading selected components from older version to 4.0 version.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    sathikum    01/22/2010 - Created
--    sathikum    02/15/2010 - Added additonal paremeter p_item_id for supporting individual item migration
--    pawolf      03/12/2010 - Added migration for LOV null return value
--    sathikum    03/23/2010 - added procedure migrate_interactive_report for IR
--    sathikum    03/24/2010 - removed procedure migrate_to_required2
--    sathikum    03/26/2010 - Added code for Advanced Migration procedure name migtrate_objects
--    sathikum    04/01/2010 - Updated code for Advanced Migration functionality
--    sbkenned    04/22/2010 - Updated code for Advanced, added packages to create collections used in reports, updated check valid date format and renamed package
--    sbkenned    04/14/2011 - removed get_upgrade_summary (it is not used)
--    hfarrell    04/18/2012 - Renamed update_flash_to_flash5 to update_flash_chart, and update_svg_to_flash to update_svg_chart. Added p_chart_rendering to both procedures
--    hfarrell    04/19/2012 - Updated update_svg_chart to remove p_chart_rendering, as only offering upgrade option to HTML5 via wizard
--    hfarrell    04/19/2012 - Added update_html_chart to support upgrade of existing HTML charts to HTML5
--    sathikum    11/29/2013 - Added update_to_css_calendar to upgrade theme calendar to CSS Calendar (feature #1132)
--    hfarrell    04/08/2014 - Added update_all_flash_charts, to upgrade all Flash 3 charts in an application to latest Flash version (feature #1345)
--    hfarrell    04/17/2014 - Removed update_all_flash_charts; In update_flash_chart: removed p_chart_rendering (feature #1345)
--    hfarrell    07/30/2014 - Added update_jstree (feature #1384)
--
--------------------------------------------------------------------------------


-- updates old Date Picker to new jQuery UI based Datepicker
--
procedure update_datepicker (
    p_flow_id       in number,
    p_page_id       in number default null,
    p_item_id       in number default null);

-- removes IS_NUMERIC validations and changes the display as to Numeric
--
procedure update_to_numeric (
    p_flow_id       in number,
    p_page_id       in number default null,
    p_item_id       in number default null);

-- updates the required attribute to yes for items which have not null validations
--
procedure update_to_required (
    p_flow_id       in number,
    p_page_id       in number default null,
    p_item_id       in number default null);

-- updates %null% LOV null return values to null
--
procedure update_lov_null_return_value (
    p_flow_id in number,
    p_page_id in number default null,
    p_item_id in number default null );

--  Update Flash 6 charts to HTML5
--
procedure update_flash_chart (
    p_flow_id         in number,
    p_page_id         in number   default null,
    p_region_id       in number   default null);

-- Updates SVG chart to latest version of Flash or HTML5 
--
procedure update_svg_chart (
    p_flow_id         in number,
    p_page_id         in number   default null,
    p_region_id       in number   default null);

--  Update Flash 3 charts to latest version of Flash or HTML5
--  Update Flash 6 charts to HTML5
--
procedure update_html_chart (
    p_flow_id         in number,
    p_page_id         in number   default null,
    p_region_id       in number   default null);

-- updates Editor "FCKEditor v2" to "CKEditor v3"
--
procedure update_to_CKEditor (
    p_flow_id       in number,
    p_page_id       in number default null,
    p_item_id       in number default null);

-- updates Interative Report Settings
--
procedure update_interactive_report (
    p_type          in varchar2,
    p_flow_id       in number,
    p_region_id     in number default null,
    p_report_id     in number default null);

-- used for advanced upgrade (when validations have conditions)
--
procedure update_advanced (
    p_flow_id       in number,
    p_page_id       in number default null);

-- used to populate the collection used for regular upgrade on page 911
--
procedure create_report_collection (
    p_upgrade_type  in varchar2,
    p_app_id        in number,
    p_user          in varchar2 );

-- used to populate the collection used for advanced upgrade on page 911
--
procedure create_adv_report_collection (
    p_app_id        in number,
    p_user          in varchar2,
    p_session_id    in number );

-- updates theme based Calendar to CSS Caledar    
--
procedure update_to_css_calendar (
    p_flow_id         in number,
    p_page_id         in number   default null,
    p_region_id       in number   default null);
    
-- updates jsTree regions to new APEX Tree widget    
--
procedure update_jstree (
    p_flow_id         in number,
    p_page_id         in number   default null,
    p_region_id       in number   default null);

end wwv_flow_upgrade_app;
/
show errors
    

    
