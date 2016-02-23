set define '^'
set verify off
prompt ...wwv_flow_admin_api

Rem    Arguments:
Rem     1:
Rem     2:
Rem     3:  Flow user

Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbcho    03/08/2002 - created
Rem     cbcho    12/05/2002 - Added edit_user_and_group
Rem     cbcho    12/06/2002 - Added edit_developer_roles
Rem     cbcho    12/06/2002 - Added delete_developer_role
Rem     jstraub  08/20/2003 - Exposed edit_developer_role for simplified privs admin
Rem     sspadafo 12/10/2006 - Add parameters to procedures to support password expiration/locking feature
Rem     jkallman 01/26/2007 - Add lock_workspace
Rem     mhichwa  07/30/2009 - added archive_activity_log
Rem     sbkenned 04/01/2010 - added new component access parameters to create_user, edit_user and edit_user_and_group
Rem     cneumuel 05/19/2011 - In create_user: removed p_user_id,p_developer_privs, added p_is_admin
Rem     cneumuel 01/05/2012 - In edit_user_and_group: default p_first_password_use_occurred to null (bug #13386166)
Rem     jkallman 08/03/2012 - Added p_default_date_format to create_user, edit_user, edit_user_and_group


create or replace package wwv_flow_admin_api
as
--  Copyright (c) Oracle Corporation 2002 - 2009. All Rights Reserved.
--
--    NAME
--      wwv_flow_admin_api.sql
--
--    DESCRIPTION
--      API for Platform Administrators to manage cookie based users for all companies.
--      Workspace administration.
--


empty_vc_arr wwv_flow_global.vc_arr2;


--
-- archiving apis
--
function get_last_archived_date (
   p_workspace_id         in number)
   return date
   ;

procedure archive_activity_log (
   p_workspace_id         in number);



--
-- user apis
--

procedure remove_user (
    --
    -- Description
    --   This procedure allows for programatic removal of users with given security_group_id.
    --
    -- Example
    --
    p_user_id            in number,
    p_security_group_id  in number)
    ;

procedure fetch_user (
     --
     -- Fetch user information from
     -- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
     --
     p_user_id                      in number,
     p_user_name                    out varchar2,
     p_first_name                   out varchar2,
     p_last_name                    out varchar2,
     p_email_address                out varchar2,
     p_groups                       out varchar2,
     p_developer_role               out varchar2,
     p_default_schema               out varchar2,
     p_description                  out varchar2,
     p_account_expiry               out date,
     p_account_locked               out varchar2,
     p_failed_access_attempts       out number,
     p_change_password_on_first_use out varchar2,
     p_first_password_use_occurred  out varchar2,
     p_security_group_id            out number
     );

procedure create_user (
    p_security_group_id            in number,
    p_user_name                    in varchar2,
    p_first_name                   in varchar2 default null,
    p_last_name                    in varchar2 default null,
    p_description                  in varchar2 default null,
    p_email_address                in varchar2 default null,
    p_web_password                 in varchar2,
    p_group_ids                    in varchar2 default null,
    p_default_schema               in varchar2 default null,
    p_default_date_format          in varchar2 default null,
    p_allow_access_to_schemas      in varchar2 default null,
    p_account_expiry               in date     default trunc(sysdate),
    p_account_locked               in varchar2 default 'N',
    p_failed_access_attempts       in number   default 0,
    p_change_password_on_first_use in varchar2 default 'Y',
    p_first_password_use_occurred  in varchar2 default 'N',
    p_attribute_01                 in varchar2 default null,
    p_attribute_02                 in varchar2 default null,
    p_attribute_03                 in varchar2 default null,
    p_attribute_04                 in varchar2 default null,
    p_attribute_05                 in varchar2 default null,
    p_attribute_06                 in varchar2 default null,
    p_attribute_07                 in varchar2 default null,
    p_attribute_08                 in varchar2 default null,
    p_attribute_09                 in varchar2 default null,
    p_attribute_10                 in varchar2 default null,
    --
    p_is_admin                     in varchar2 default 'Y',
    p_allow_app_building_yn        in varchar2 default 'Y',
    p_allow_sql_workshop_yn        in varchar2 default 'Y',
    p_allow_websheet_dev_yn        in varchar2 default 'Y',
    p_allow_team_development_yn    in varchar2 default 'Y' );

procedure edit_user (
     --
     -- Edit user information to
     -- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
     --
     p_user_id                      in number,
     p_security_group_id            in number,
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
     p_developer_roles              in varchar2 default null,
     p_description                  in varchar2 default null,
     p_account_expiry               in date     default trunc(sysdate),
     p_account_locked               in varchar2 default 'N',
     p_failed_access_attempts       in number   default 0,
     p_change_password_on_first_use in varchar2 default 'Y',
     p_first_password_use_occurred  in varchar2 default 'N',
     --
     p_allow_app_building_yn        in varchar2 default 'Y',
     p_allow_sql_workshop_yn        in varchar2 default 'Y',
     p_allow_websheet_dev_yn        in varchar2 default 'Y',
     p_allow_team_development_yn    in varchar2 default 'Y'
     );

procedure edit_user_and_group (
     --
     -- Edit user information to
     -- wwv_flow_fnd_user, wwv_flow_fnd_group_users.
     -- This procedure does NOT edit wwv_flow_developers.
     --
     p_user_id                      in number,
     p_security_group_id            in number,
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
     p_account_expiry               in date     default trunc(sysdate),
     p_account_locked               in varchar2 default 'N',
     p_failed_access_attempts       in number   default 0,
     p_change_password_on_first_use in varchar2 default 'Y',
     p_first_password_use_occurred  in varchar2 default null,
     --
     p_allow_app_building_yn        in varchar2 default 'Y',
     p_allow_sql_workshop_yn        in varchar2 default 'Y',
     p_allow_websheet_dev_yn        in varchar2 default 'Y',
     p_allow_team_development_yn    in varchar2 default 'Y'
     );

procedure edit_developer_role (
    --
    -- Edit user developer roles in wwv_flow_developers.
    --
    p_id                in number,
    p_security_group_id in number,
    p_user_id           in number,
    p_user_name         in varchar2,
    p_flow_id           in number default null,
    p_developer_roles   in varchar2 default null
    );

procedure edit_developer_roles (
    --
    -- This procedure expects array values.
    -- Edit user developer roles in wwv_flow_developers.
    --
    p_ids               in wwv_flow_global.vc_arr2,
    p_security_group_id in number,
    p_user_id           in number,
    p_user_name         in varchar2,
    p_flow_ids          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_developer_roles   in wwv_flow_global.vc_arr2 default empty_vc_arr
    );

procedure delete_developer_role (
    --
    -- This procedure removes user developer roles.
    --
    p_id                in number,
    p_security_group_id in number,
    p_user_name         in varchar2
    );

procedure lock_workspace (
    --
    -- Lock all workspace accounts and also
    -- change the status of all workspace applications
    -- to Unavailable.
    --
    p_security_group_id in number
    );

end wwv_flow_admin_api;
/
show error;
