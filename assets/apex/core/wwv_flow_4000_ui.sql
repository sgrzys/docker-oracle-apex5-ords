set define '^' verify off
prompt ...wwv_flow_4000_ui
create or replace package wwv_flow_4000_ui as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_4000_ui.sql
--
--    DESCRIPTION
--     User interface plsql for internal application development application
--
--    SECURITY
--      No grants
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa    05/08/2009 - Created
--     mhichwa    05/20/2009 - added show_history
--     mhichwa    07/07/2009 - added p_max_length to top applications
--     mhichwa    07/08/2009 - added additional arguments
--     mhichwa    08/14/2009 - added cw and p_chart_width
--     mhichwa    07/18/2009 - added show_workspace_notification
--     mhichwa    07/31/2009 - added log_event
--     mhichwa    08/27/2009 - Added show_feedback
--     mhichwa    09/24/2009 - Added procedure top_applications_combo
--     mhichwa    09/30/2009 - added print_apex_online_info and print_cgi_env
--     mhichwa    11/11/2009 - added print_lov_examples
--     mhichwa    11/13/2009 - added function get_validation
--     mhichwa    11/24/2009 - added support for additional feedback attributes
--     jkallman   12/03/2009 - Removed submit_feedback
--     mhichwa    12/29/2009 - added get_timeframe
--     pawolf     01/12/2010 - Modified interface of print_lov_examples
--     mhichwa    02/02/2010 - added show tabs procedure
--     pawolf     02/23/2010 - Added statistics, updates, news, repository
--     mhichwa    04/21/2010 - Added p320_create_collection
--     mhichwa    05/12/2011 - removed procedure top_applications_combo and procedure top_users
--     shrahman   01/06/2014 - Added account_mega_menu procedure
--     jkallman   03/11/2014 - Removed procedure log_event (Feature 1050)
--     vuvarov    05/29/2014 - Added updates_check_enabled (feature #1437)
--     vuvarov    06/03/2014 - Added is_translation_installed
--     shrahman   08/21/2014 - Added new function get_app_initials
--     hfarrell   01/28/2015 - In top_applications_combo2: removed p_max_width (bug #20555708)
--
--------------------------------------------------------------------------------


procedure p320_create_collection (
    p_flow_id           in number,
    p_session           in number,
    p_security_group_id in number,
    p_image_prefix      in varchar2
    );

procedure show_tabs (
    p_application_id    in number   default null,
    p_security_group_id in number   default null,
    p_session_id        in number  default null,
    p_parent_tabset     in varchar2 default null)
    ;

function get_timeframe (
    p_days in number default 1)
    return varchar2
    ;

function get_validation (
    p_validation_id     in number default null,
    p_application_id    in number default null,
    p_security_group_id in number default null,
    p_validation        in varchar2 default null,
    p_bind_01           in varchar2 default null,
    p_bind_02           in varchar2 default null,
    p_bind_03           in varchar2 default null,
    p_bind_04           in varchar2 default null,
    p_bind_05           in varchar2 default null,
    p_bind_06           in varchar2 default null
    )
    return varchar2
    ;

procedure print_lov_examples (
    p_display_as in varchar2 )
    ;

procedure print_apex_online_info (
    p_ul_attr in varchar2 default null)
    ;

procedure print_cgi_env (
   p_html_table_attr  in varchar2 default null
   )
   ;

procedure show_news (
  p_workspace_id in number,
  p_num_seconds  in number default 5,
  p_max_rows     in number default 5)
  ;

--
-- workspace notification
--
procedure show_workspace_notification (
   p_workspace_id       in number default null,
   p_session            in number default null)
   ;

function workspace_notification_exists (
    p_workspace_id in number default null)
    return boolean   ;

function news_exist (
    p_workspace_id in number default null)
    return boolean;

--
-- history
--
procedure show_history (
   p_id                 in number   default null,
   p_component_type     in varchar2 default null,
   p_LAST_UPDATED_BY    in varchar2 default null,
   p_LAST_UPDATED_ON    in date     default null,
   p_CREATED_BY         in varchar2 default null,
   p_CREATED_ON         in date     default null,
   p_date_format_mask   in varchar2 default 'Day Month DD, YYYY HH24:MI')
   ;


--
-- instance level reporting
--

/* procedure top_applications_combo (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50,
    p_show_internal_yn  in varchar2 default 'Y',
    p_link              in varchar2 default null)
    ;
*/


function get_app_initials (
    p_title             in varchar2, 
    p_app_id            in number)
    return varchar2
    ;

procedure top_applications_combo2 (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_chart_width       in number default 50,
    p_show_internal_yn  in varchar2 default 'Y',
    p_link              in varchar2 default null)
    ;

procedure top_applications (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50,
    p_show_internal_yn  in varchar2 default 'Y')
    ;

procedure top_websheets (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_apex_owner        in varchar2 default null,
    p_chart_width       in number default 50)
    ;

/* procedure top_users (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50,
    p_link              in varchar2 default null)
    ;
*/

procedure top_users2 (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50,
    p_link              in varchar2 default null)
    ;
procedure show_page_event_link (
    p_days              in varchar2 default null,
    p_link              in varchar2 default null)
;
procedure show_sent_statistics;

function updates_check_enabled return boolean;

procedure updates;

procedure news;

procedure repository;

procedure account_mega_menu (
    p_username          in varchar2,
    p_workspace_id      in number,
    p_session           in number,
    p_logout_url        in varchar2)
;

--==============================================================================
-- Returns TRUE if a translation of a particular application is installed. Can be used to decide whether a language
-- selector should be displayed.
--==============================================================================
function is_translation_installed( p_flow_id  in number default wwv_flow.g_flow_id,
                                   p_language in varchar2 default null ) return boolean;

end wwv_flow_4000_ui;
/
show errors
