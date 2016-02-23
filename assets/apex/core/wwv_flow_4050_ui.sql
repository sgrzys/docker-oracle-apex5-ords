set define '^' verify off
prompt ...wwv_flow_4050_ui
create or replace package wwv_flow_4050_ui as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_4050_ui.sql
--
--    DESCRIPTION
--     User interface plsql for internal administration application
--
--    SECURITY
--      No grants
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa    05/06/2009 - Created
--     mhichwa    08/14/2009 - added cw and p_chart_width
--     mhichwa    11/16/2009 - added procedure show_edit_system_message
--     jstraub    08/02/2010 - Changed p_days default to be represented is seconds
--     vuvarov    06/26/2012 - Added show_system_message() and system_message_exists()
--     vuvarov    09/18/2014 - Removed show_edit_system_message
--
--------------------------------------------------------------------------------

--==============================================================================
-- System Messages/Announcements (defined in app 4050, but can be displayed in
-- other apps)
--==============================================================================
procedure show_system_message (
    p_app_session in number default null);

function system_message_exists
    return boolean;
--==============================================================================

--
-- instance level reporting
--

procedure top_applications (
    p_app_session   in varchar2,
    p_image_prefix  in varchar2,
    p_days          in number default 43200, --p_days is now actually in seconds (bug 9886194)
    p_display_count in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50)
    ;

procedure top_workspaces (
    p_app_session   in varchar2,
    p_image_prefix  in varchar2,
    p_days          in number default 43200, --p_days is now actually in seconds (bug 9886194)
    p_display_count in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50)
    ;

procedure top_users (
    p_app_session   in varchar2,
    p_image_prefix  in varchar2,
    p_days          in number default 43200, --p_days is now actually in seconds (bug 9886194)
    p_display_count in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50)
    ;

--
-- workspace level reporting
--
procedure top_workspace_applications (
    p_app_session       in varchar2,
    p_image_prefix      in varchar2,
    p_security_group_id in number,
    p_days              in number default 1,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50)
    ;

procedure top_workspace_users (
    p_app_session       in varchar2,
    p_image_prefix      in varchar2,
    p_security_group_id in number,
    p_days              in number default 1,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50)
    ;

procedure show_workspace_admins (
    p_app_session       in varchar2,
    p_security_group_id in number,
    p_image_prefix      in varchar2,
    p_display_count     in number default 8)
    ;

end wwv_flow_4050_ui;
/
show errors
