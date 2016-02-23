set define '^'
set verify off
prompt ...wwv_flow_pkg_app_ui

Rem  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_pkg_app_ui.sql
Rem
Rem    DESCRIPTION
Rem      API to display packaged application user interface from application 4000.
Rem    NOTES
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    SCRIPT ARGUMENTS
Rem      NONE
Rem
Rem
Rem    RUNTIME DEPLOYMENT
Rem      YES
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem    cbcho      03/30/3012 - Created
Rem    msewtz     04/24/2012 - Added support for websheets
Rem    hfarrell   05/21/2012 - Updated p81_app_detail to add p_app_type, to support Websheet installation
Rem    hfarrell   08/23/2012 - Added function get_data, to handle retrieval of packaged application metadata (bug 14303198)
Rem    hfarrell   08/23/2012 - Reordered parameters in get_data function
Rem    msewtz     12/30/2013 - Updated get_data to default p_escape to false to avoid over-escaping when called from SQL in reports in Builder, other calls to this procedure fully specify p_escape (bug 17856644)
Rem    hfarrell   02/21/2014 - In p50_applications: added p_app_group (feature #1380)
Rem    hfarrell   01/30/2015 - Added procedure p1_featured_apps (bug #20440628)
Rem    cbcho      03/18/2015 - Removed p50_applications as it is not used anymore in 5.0 (bug #20724234)

create or replace package wwv_flow_pkg_app_ui
is


function get_data (p_str               varchar2,
                   p_lang              varchar2 default 'en',
                   p_system_message    varchar2 default null,
                   p_escape            boolean  default false,
                   p_app_id            varchar2 default null,
                   p_alternate_message varchar2 default null)
                   return varchar2;

procedure p81_app_detail (
    p_app_id       in number,
    p_app_session  in number,
    p_pkg_app_id   in number   default null,
    p_app_type     in varchar2 default null
    );    

procedure p1_featured_apps(
    p_app_id         in number,
    p_app_page_id    in number,
    p_app_session    in number
    );

end wwv_flow_pkg_app_ui;
/
show errors
