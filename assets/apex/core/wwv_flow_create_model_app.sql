set define '^'
set verify off
prompt ...wwv_flow_create_model_app


Rem     NAME
Rem      wwv_flow_create_model_app.sql
Rem     Arguments:
Rem      1:  
Rem      2:
Rem      3:  Flow user
Rem     MODIFIED (MM/DD/YYYY)
Rem      cbcho    03/21/2005 - Created
Rem      cbcho    04/11/2005 - Added p_authentication in create_modules
Rem      cbcho    04/26/2005 - Added shared component import logic
Rem      cbcho    05/13/2005 - Added p_shared_components argument to create_modules
Rem      jkallman 11/28/2007 - Added p_date_format to create_modules
Rem      jkallman 08/20/2009 - Added p_timestamp_format, p_timestamp_tz_format to create_modules
Rem      hfarrell 06/10/2011 - Added p_date_time_format to create_modules (feature #715)
Rem      msewtz   03/29/2012 - Updated procedure spec for create_modules, altered theme input paramters (feature #784)
Rem      msewtz   08/23/2013 - Added support for navigation lists (feature 1236)
Rem      msewtz   11/07/2013 - Added support for theme styles
Rem      msewtz   07/18/2014 - Added theme subscription attribute to create_modules

create or replace package wwv_flow_create_model_app
as
--  Copyright (c) Oracle Corporation 2005. All Rights Reserved.
--
--
--    DESCRIPTION
--      This package creates an application on multiple tables based on information from following tables:
--      WWV_FLOW_MODELS,WWV_FLOW_MODEL_PAGES,WWV_FLOW_MODEL_PAGE_COLS
--
--    NOTES
--      
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

g_flow_id        number := null;
g_home_page_id   number := null;

procedure create_modules (
    p_flow_id                    in number,        
    p_model_id                   in number,
    p_navigation_type            in varchar2 default 'T',
    p_create_tabs                in varchar2 default 'SINGLE_LEVEL_TABS',
    p_authentication             in varchar2 default null,
    p_flow_language              in varchar2 default null,
    p_flow_language_derived_from in varchar2 default null,
    p_date_format                in varchar2 default null,
    p_date_time_format           in varchar2 default null,
    p_timestamp_format           in varchar2 default null,
    p_timestamp_tz_format        in varchar2 default null,
    p_copy_from_theme_id         in number   default null,
    p_copy_from_theme_flow_id    in number   default null,
    p_copy_from_flow_id          in number   default null,
    p_copy_option                in varchar2 default null, 
    p_theme_style_id             in number   default null,
    p_subscribe_theme            in varchar2 default 'N'       
    );

end wwv_flow_create_model_app;
/
show error;