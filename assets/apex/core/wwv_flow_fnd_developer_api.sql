set define '^' verify off
prompt ...wwv_flow_fnd_developer_api
create or replace package wwv_flow_fnd_developer_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_fnd_developer_api.sql
--
--    DESCRIPTION
--      API to manage cookie based users.
--
--    NOTES
--      This package supports developer privileges with multiple application IDs.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    12/04/2002 - created
--     cbcho    12/06/2002 - Added edit_developer_roles, edit_developer_role
--     cbcho    12/06/2002 - Added delete_developer_role
--     sspadafo 12/10/2006 - Added new parameters to edit_fnd_user for account locking/expiration feature; added log_user_authentication
--     mhichwa  01/12/2007 - Added Procedure f4550_reset_passord
--     mhichwa  01/23/2007 - Added procedure f4550_send_workspace
--     mhichwa  01/30/2007 - Added procedure f4050_55_provision_workspace
--     mhichwa  01/30/2007 - Added procedure f4350_73_provision_workspace
--     nagkrish 02/01/2007 - Added function convert_urls_to_links to convert url to link in html format e-mail.
--     nagkrish 02/02/2007 - Added function convert_txt_to_html to convert text message to html format.
--     nagkrish 02/09/2007 - Added 'out' parameter 'p_msg' to procedure f4050_55_provision_workspace
--     jkallman 02/09/2007 - Removed p_image_prefix from f4350_73_provision_workspace
--     jkallman 12/12/2007 - Added admin_notify_change_request and admin_notify_new_request
--     mhichwa  08/31/2009 - Added allow workshop columns
--     mhichwa  09/24/2009 - Added procedure set_component_privs
--     mhichwa  10/05/2009 - corrected spelling of wwv_flow_fnd_development_yn
--     mhichwa  04/27/2010 - support reset websheet password f4900_reset_password, similar to f4550_reset_password
--     jkallman 06/13/2011 - Renamed f4350_73_provision_workspace to f4700_73_provision_workspace
--     cneumuel 03/28/2012 - Moved log_user_authentication to wwv_flow_authentication.log_login (bug #13713222)
--     cbcho    04/18/2012 - Added p_security_group_id in convert_txt_to_html in order to call wwv_flow_mail.get_instance_url
--                           with p_security_group_id passed in (feature #549)
--     vuvarov  06/07/2012 - Removed p_id parameter from f4700_73_provision_workspace (feature #699)
--     vuvarov  06/25/2012 - Moved convert_urls_to_links() and convert_txt_to_html() to wwv_flow_mail
--     jkallman 08/03/2012 - Added p_default_date_format to edit_fnd_user
--     cneumuel 02/23/2015 - In f4700_73_provision_workspace: add p_sign_in_url, do not send mail (bug #20436998)
--
--------------------------------------------------------------------------------

empty_vc_arr wwv_flow_global.vc_arr2;


procedure set_component_privs (
    p_user_id                      in number,
    p_ALLOW_APP_BUILDING_YN        in varchar2 default 'N',
    p_ALLOW_SQL_WORKSHOP_YN        in varchar2 default 'N',
    p_ALLOW_WEBSHEET_DEV_YN        in varchar2 default 'N',
    p_ALLOW_TEAM_DEVELOPMENT_YN      in varchar2 default 'N')
    ;

procedure edit_fnd_user (
     --
     -- Edit user information to
     -- wwv_flow_fnd_user, wwv_flow_fnd_group_users table.
     --
     p_user_id                      in number,
     p_user_name                    in varchar2,
     p_first_name                   in varchar2 default null,
     p_last_name                    in varchar2 default null,
     p_web_password                 in varchar2 default null,
     p_new_password                 in varchar2 default null,
     p_email_address                in varchar2 default null,
     p_start_date                   in varchar2 default null,
     p_end_date                     in varchar2 default null,
     p_employee_id                  in varchar2 default null,
     p_allow_access_to_schemas      in varchar2 default null,
     p_person_type                  in varchar2 default null,
     p_default_schema               in varchar2 default null,
     p_default_date_format          in varchar2 default null,
     p_group_ids                    in varchar2 default null,
     p_description                  in varchar2 default null,
     p_account_expiry               in date default null,
     p_account_locked               in varchar2 default null,
     p_failed_access_attempts       in number   default null,
     p_change_password_on_first_use in varchar2 default null,
     p_first_password_use_occurred  in varchar2 default null,
     --
     p_ALLOW_APP_BUILDING_YN        in varchar2 default 'Y',
     p_ALLOW_SQL_WORKSHOP_YN        in varchar2 default 'Y',
     p_ALLOW_WEBSHEET_DEV_YN        in varchar2 default 'Y',
     p_ALLOW_TEAM_DEVELOPMENT_YN    in varchar2 default 'Y'
     );

procedure edit_developer_role (
    --
    -- Edit user developer roles in wwv_flow_developers.
    --
    p_id               in number,
    p_user_id          in number,
    p_user_name        in varchar2,
    p_flow_id          in number default null,
    p_developer_roles  in varchar2 default null
    );

procedure edit_developer_roles (
    --
    -- This procedure expects array values.
    -- Edit user developer roles in wwv_flow_developers.
    --
    p_ids              in wwv_flow_global.vc_arr2,
    p_user_id          in number,
    p_user_name        in varchar2,
    p_flow_ids         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_developer_roles  in wwv_flow_global.vc_arr2 default empty_vc_arr
    );

procedure delete_developer_role (
    p_id        in number,
    p_user_name in varchar2
    );

--
-- reset passwords
--

procedure f4550_send_workspace (
   p_email_address      in varchar2 );

procedure f4550_reset_password (
   p_email_address      in varchar2,
   p_workspace_name     in varchar2 default null );

procedure f4900_reset_password (
  p_ws_app_id           in number   default null,
  p_user_name           in varchar2 default null,
  p_email_address       in varchar2 default null,
  p_workspace_name      in varchar2 default null );


--
--
--

procedure f4050_55_provision_workspace (
   p_provision_id       in number,
   p_approval_message   in varchar2,
   p_acceptance_message in varchar2 );

procedure f4700_73_provision_workspace (
   p_provision_id       in number,
   p_sign_in_url        in out varchar2,
   p_msg                in out varchar2 );


procedure admin_notify_new_request (
    p_workspace_name in varchar2,
    p_schema_name    in varchar2,
    p_admin_userid   in varchar2,
    p_admin_email    in varchar2 );

procedure admin_notify_change_request (
    p_workspace_id   in number,
    p_admin_userid   in varchar2 );


end wwv_flow_fnd_developer_api;
/
show error;
