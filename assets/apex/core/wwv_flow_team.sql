set define '^' verify off
prompt ...wwv_flow_team
create or replace package wwv_flow_team as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2010. All Rights Reserved.
--
--    NAME
--      wwv_flow_team.plb
--
--    DESCRIPTION
--      Team development package
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  09/15/2009 - Created
--     mhichwa  09/15/2009 - Added show_breadcrumb
--     mhichwa  10/29/2009 - Added show_milestone_dashboard1 
--     mhichwa  10/30/2009 - Added show_bug_dashboard1 
--     mhichwa  11/02/2009 - added show_developer_summary, send_developer_summary
--     mhichwa  11/04/2009 - added get_default_release 
--     mhichwa  11/25/2009 - added log_feedback_as_bug
--     cbcho    02/22/2010 - Removed websheet show_breadcrumbs2
--     mhichwa  03/11/2010 - added show todo dashboard 1
--     mhichwa  03/12/2010 - moved to pct reporting add show milestone details
--     mhichwa  03/29/2010 - added team_dash_1, and feedback_dash_1
--     cneumuel 09/11/2013 - Moved implementation of submit_feedback, submit_feedback_followup, get_feedback_follow_up from htmldb_util to wwv_flow_team
--     cneumuel 09/11/2013 - Moved implementation of submit_feedback, submit_feedback_followup, get_feedback_follow_up from wwv_flow_team to wwv_flow_feedback_int
--     cbcho    11/05/2014 - Added get_feedback_logged_as_info (bug #14376944)
--     cbcho    11/07/2014 - Added log_feedback_as_feature (bug #14376944)
--
--------------------------------------------------------------------------------

g_bug_id number;
g_todo_id number;
g_feature_id number;

procedure team_dash_1 (
	p_developer         in varchar2 default null,
    p_release           in varchar2 default '0',
    p_application       in number   default 0,
    p_session           in number default 0,
    p_security_group_id in number default 0,
    p_show              in varchar2 default 'ALL'
    );

procedure feedback_dash_1 (
	p_developer         in varchar2 default null,
    p_release           in varchar2 default '0',
    p_application       in number   default 0,
    p_session           in number default 0,
    p_security_group_id in number default 0,
    p_show              in varchar2 default 'ALL'
    );

procedure show_todo_dash_1 (
	p_developer         in varchar2 default null,
    p_release           in varchar2 default '0',
    p_application       in number   default 0,
    p_show              in varchar2 default 'ALL',
    p_session           in number default 0,
    p_security_group_id in number default 0
   );

procedure show_feature_dash_1 (
    p_release        in varchar2 default '0',
    p_application    in number   default 0,
    p_show           in varchar2 default 'ALL',
    p_session        in number default 0,
    p_security_group_id in number default 0
	);

function get_feedback_logged_as_info (
    p_id   in number,
    p_type in varchar2
    ) return varchar2;

procedure log_feedback_as_todo (
    p_feedback_id        in number,
    p_assigned_to        in varchar2 default null,
    p_description        in varchar2 default null,
    p_name               in varchar2 default null,
    p_release            in varchar2 default null,
    p_status             in varchar2 default null,
    p_category           in varchar2 default null,
    p_delete_feedback_yn in varchar2 default 'N'
    );

procedure log_feedback_as_bug (
    p_feedback_id  in number,
    p_workspace_id in number,
	p_assigned_to  in varchar2 default null,
    p_bug_title    in varchar2 default null,
    p_severity     in varchar2 default null,
    p_release      in varchar2 default null
    );

procedure log_feedback_as_feature (
    p_feedback_id          in number,
    p_app_id               in number,
    p_feature_name         in varchar2,
    p_feature_description  in varchar2 default null,
    p_feature_status       in varchar2 default null,
    p_new_release          in varchar2 default null, 
    p_release              in varchar2 default null,
    p_new_assignee         in varchar2 default null,
    p_assigned_to          in varchar2 default null,
    p_development_priority in varchar2 default null,
    p_desirability         in varchar2 default null,
    p_due_date             in date default null,
    p_start_date           in date default null
    );

function get_default_release (
   p_security_group_id in number   default null,
   p_return_null_as    in varchar2 default null)
   return varchar2
   ;
   
function get_email (
   p_security_group_id in number   default null,
   p_apex_developer    in varchar2 default null)
   return varchar2
   ;

procedure send_developer_summary (
   p_current_user       in varchar2 default null,
   p_release             in varchar2 default null,
   p_security_group_id  in number,
   p_developer          in varchar2 default null,
   p_subject            in varchar2 default null,
   p_from               in varchar2 default null,
   p_to                 in varchar2 default null,
   p_cc                 in varchar2 default null,
   p_body               in varchar2 default null,
   p_number_format      in varchar2 default '999G999G999G990',
   p_date_format        in varchar2 default 'DD-MON-YYYY',
   p_show_milestone_details in varchar2 default 'Y')
   ;

procedure show_developer_summary (
    p_security_group_id in number   default null,
    p_release           in varchar2 default null,
    p_developer         in varchar2 default null,
    p_number_format     in varchar2 default '999G999G999G990',
    p_date_format        in varchar2 default 'DD-MON-YYYY',
    p_htp_result_yn     in varchar2 default 'Y',
    p_show_milestone_details in varchar2 default 'Y')   
    ;

procedure show_bug_dashboard1 (
    p_show              in varchar2 default null,
    p_security_group_id in number   default null,
    p_release           in varchar2 default null,
    p_session           in number   default null)
    ;

procedure show_milestone_dashboard1 (
    p_security_group_id in number   default null,
    p_release           in varchar2 default null,
    p_session           in number   default null)
    ;

procedure show_breadcrumbs (
    p_application_id    in number,
    p_security_group_id in number,
    p_app_session       in number)
    ;


procedure wwv_flow_team_tag_sync (
    p_component_type    in varchar2 default 'FEATURE',
    p_component_id      in number   default null,
    p_new_tags          in varchar2 default null,
    p_security_group_id in number   default null)
    ;

procedure wwv_flow_render_tag_cloud (
    p_security_group_id     in number,
    p_session_id            in number,
    P_tag_type              in varchar2 default 'ALL',
    p_alpha                 in number default 1,
    p_max                   in number default 100,
    p_limit                 in number default 10000,
    p_link_to_page          in varchar2 default '8800',
    p_tag_item_filter       in varchar2 default 'IRC_TAGS',
    p_clear_cache           in varchar2 default '8800,RIR') 
    ;

end wwv_flow_team;
/
show errors
