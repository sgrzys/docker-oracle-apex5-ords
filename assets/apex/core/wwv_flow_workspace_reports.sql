set define '^'

set verify off
prompt ...wwv_flow_workspace_reports

Rem  Copyright (c) Oracle Corporation 2009 - 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_4000_ui.plb
Rem    DESCRIPTION
Rem      Given a workspace ID produce a summary report
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem     mhichwa    09/17/2009 - Created
Rem     mhichwa    09/18/2009 - Improved
Rem     mhichwa    09/23/2009 - added get_pending_email and globalized
Rem     sbkenned   04/13/2010 - added get_purge_summary
Rem     sbkenned   04/19/2010 - added get_purge_summary2



create or replace package  wwv_flow_workspace_reports
as

function get_pending_email (
    p_session_id in number default 0)
    return varchar2 
    ;

function get_pending_requests (
    p_session_id in number default 0)
    return varchar2 
    ;

function get_requests (
   p_max_requests      in number default 7,
   p_app_session       in number default null,
   p_security_group_id in number default 0 )
   return varchar2
   ;

procedure report_workspace_usage (
    p_security_group_id in number,
    p_language          in varchar2 default null,
    p_time_frame_DWMY   in varchar2 default 'W',
    p_email_format_yn   in varchar2 default 'N',
    p_email_title       in varchar2 default null,
    p_max_apps          in number default 10,
    p_max_websheets     in number default 10,
    p_max_db_objects    in number default 10,
    p_date_format       in varchar2 default 'Day Month DD, YYYY HH24:MI',
    p_report_db_obj_yn  in varchar2 default 'Y',
    p_print_report_yn   in varchar2 default 'Y'
    )
    ;

-- call report_workspace_usage first with p_print_report_yn = N
function get_workspace_usage_output
   return varchar2
   ;

function get_purge_summary  (
    p_session_id  in number default 0)
    return varchar2 
    ;
function get_purge_summary2 (
	p_session_id in number default 0)
    return varchar2 
    ;

end wwv_flow_workspace_reports;
/
show errors