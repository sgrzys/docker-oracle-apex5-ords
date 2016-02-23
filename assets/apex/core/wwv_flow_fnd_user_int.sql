set define '^' verify off
prompt ...wwv_flow_fnd_user_int
create or replace package wwv_flow_fnd_user_int authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001-2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_fnd_user_int.sql
--
--    DESCRIPTION
--      Internal API to manage cookie based users.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  05/24/2000 - created
--     mhichwa  06/26/2001 - improved documentation
--     mhichwa  06/26/2001 - Added remove user API
--     mhichwa  06/28/2001 - Improved comments
--     mhichwa  06/28/2001 - Added default schema and parse as user arguments
--     mhichwa  07/05/2001 - Added 10 fnd user generic attributes
--     mhichwa  08/03/2001 - Added export fnd users
--     mhichwa  08/09/2001 - Added web password format
--     mhichwa  08/10/2001 - Added create company, improved comments
--     jstraub  08/20/2001 - Added reset_pw procedure
--     jstraub  09/14/2001 - Added parameter p_msg to reset_pw procedure
--     jkallman 11/05/2001 - Added get_user_roles
--     jkallman 11/27/2001 - Added find_security_group_id, find_company
--     cbcho    03/06/2002 - Added fetch_fnd_user
--     cbcho    03/07/2002 - Added edit_fnd_user
--     jstraub  04/11/2003 - move g_mime_shown to package header in order to use Content-Disposition: attachment;
--     sspadafo 05/29/2004 - Improve security of all entry points (Bug 3660623)
--     sspadafo 12/10/2006 - Added lock_account,unlock_account,get_account_locked_status,expire_workspace_account,unexpire_workspace_account,
--       ...               - expire_end_user_account,unexpire_end_user_account,workspace_account_days_left,end_user_account_days_left,set_custom_auth_status,
--       ...               - set_authentication_result,change_password_on_first_use,password_first_use_occurred,get_authentication_result
--     sspadafo 12/10/2006 - Added parameters to create_company, create_fnd_user, fetch_fnd_user, edit_fnd_user for account expiration/locking feature
--     sspadafo 01/23/2008 - Added p_description to first fetch_user procedure (Bug 6475019)
--     sspadafo 01/24/2009 - Added g_password_save
--     mhichwa  08/31/2009 - comment only change
--     jstraub  03/15/2010 - Added create_user_from_csv
--     mhichwa  03/17/2010 - enhanced create_user_from_csv
--     sbkenned 03/19/2010 - updated create_user_from_collection and create_user_coll_from_csv to removed unused columns
--     jkallman 04/06/2010 - Add missing attributes to create_company, create_fnd_user
--     pawolf   04/15/2010 - Added p_include_script_header to export_fnd_users
--     sathikum 02/28/2011 - Added delete_user_group (feature #592)
--     cneumuel 03/21/2011 - added p_check_user_is_admin to workspace_account_days_left
--     jkallman 03/30/2011 - Added support for friendly name and workspace_service_id
--     jkallman 03/31/2011 - Changed friendly_name to display_name
--     cneumuel 04/11/2011 - In create_company: added workspace image and mime type
--     jkallman 07/20/2011 - Changed create_company to make display_name and workspace_service_id default null
--     jstraub  08/02/2011 - Added p_account_status to create_company (bug 12804607)
--     pawolf   09/05/2011 - Added new parameter p_rm_consumer_group to create_company (Bug 12944223)
--     pawolf   09/05/2011 - Added new parameter p_host_prefix, p_cloud_group_name and p_cloud_service_name to create_company (Bug 13101596)
--     cneumuel 11/18/2011 - In create_fnd_user: added p_person_type
--     jkallman 01/05/2012 - Added auto_archive_yn to create_company
--     cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
--     hfarrell 07/17/2012 - Added p_allow_restful_services_yn and p_path_prefix to create_company (feature #863)
--     jkallman 08/03/2012 - Added p_default_date_format to create_user, edit_user
--     cneumuel 12/07/2012 - Changed sample domains in docs to example.com (bug #15963390)
--     jstraub  02/13/2013 - Added p_ws_schema to create_company
--     jstraub  03/22/2013 - Added p_minimal to export_fnd_users
--     pawolf   04/16/2013 - Added files_version to wwv_flow_companies (feature #1165)
--     cneumuel 07/08/2013 - format changes
--                         - added set_group_group_grants, get_group_group_grants (feature #1233)
--     cneumuel 07/11/2013 - added set_group_user_grants, get_group_user_grants
--     cneumuel 08/30/2013 - Added reset_password
--     cneumuel 09/06/2013 - In reset_password: added p_old_password
--                         - Made wwv_flow_fnd_user_api an invoker rights wrapper for wwv_flow_fnd_user_int
--     cneumuel 10/15/2013 - Added g_password_format (bug #17214728)
--     msewtz   01/24/2013 - Added wwv_flow_companies.allow_packaged_app_ins_yn (feature 1348)
--     hfarrell 02/14/2014 - Added fetch_fnd_user and edit_fnd_user for Edit Profile page (feature #1379)
--     hfarrell 02/27/2014 - In overloaded edit_fnd_user: removed unrequired p_user_name
--     hfarrell 02/27/2014 - In create_fnd_user: added p_profile_image
--     hfarrell 03/05/2014 - In create_fnd_user: added profile_image related parameters
--     cneumuel 03/07/2014 - In create_company: added p_qos_max_workspace_requests, p_qos_max_session_requests, p_qos_max_session_kill_timeout, p_max_session_length_sec, p_max_session_idle_sec (feature #1323)
--     cneumuel 05/12/2014 - In find_security_group_id: add p_calling_user to get the current_user
--     cneumuel 06/05/2014 - In get_user_roles: add optional parameter p_security_group_id
--                         - Added get_account_privileges
--                         - In create_fnd_user: allow to set team dev access for end users
--     jkallman 06/12/2014 - In create_company:  added p_max_email_messages (feature #1037)
--     cneumuel 10/16/2014 - In edit_fnd_user#2: add p_account_locked (feature #1482)
--     vuvarov  12/31/2014 - Added create_or_update_user for apxchpwd.sql
--     cneumuel 06/11/2015 - Added can_edit_builder_users, check_can_edit_builder_users (feature #1798)
--     cneumuel 08/05/2015 - In create_fnd_user: add p_admin_override and do not run admin check if set to true (bug #21561358)
--
--------------------------------------------------------------------------------

--==============================================================================
-- a user's account privileges
--==============================================================================
subtype t_account_type is pls_integer range 1 .. 3;
c_account_type_admin constant t_account_type := 1;
c_account_type_dev   constant t_account_type := 2;
c_account_type_user  constant t_account_type := 3;
type t_account_privileges is record (
    account_type         t_account_type,
    app_builder          boolean,
    websheets            boolean,
    create_packaged_app  boolean,
    sql_workshop         boolean,
    restful_services     boolean,
    team_development     boolean );

--==============================================================================
-- This procedure exports all users in a the current company, designed to be
-- called from the flows html development environment.
--==============================================================================
procedure export_fnd_users (
    p_export_format         in varchar2 default 'UNIX',
    p_include_script_header in boolean default true,
    p_minimal               in boolean default false );

--==============================================================================
-- This procedure creates a company description.  Without a company user and
-- flows can not be creatd.
--
-- Arguments:
--    p_id                        = unique ID which identifies a company row, not referenced by other tables
--    p_provisioning_company_id   = security_group_id column is a foreign key to this column.  The
--                                  security_group_id column is used by all tables that store data that is
--                                  specific to a given company.
--    p_short_name                = name of the company used to login
--    p_first_schema_provisioned  = is used to indicate the first schema created. This is necessary to
--                                  determine things like what is the default tablespace for this company
--    p_company_schemas           = colon delimited list of schemas that this company can "parse as".
--    p_ws_schema                 = indicates the schema for Websheet objects
--    p_rm_consumer_group         = Resource Manager consumer group which should be used when executing
--                                  applications for this company.
--    p_path_prefix               = is used in RESTful Services to determine workspace associated with RESTful service
--    p_allow_restful_services_yn = is a workspace level setting to to determine whether RESTful Services is enabled. This
--                                  setting is dependent on the instance level preference RESTFUL_SERVICES_ENABLED being set to 'Y'.
--==============================================================================
procedure create_company (
    p_id                           in number,
    p_provisioning_company_id      in number,
    p_short_name                   in varchar2,
    p_display_name                 in varchar2 default null,
    p_workspace_service_id         in number   default null,
    p_first_schema_provisioned     in varchar2,
    p_company_schemas              in varchar2,
    p_ws_schema                    in varchar2 default null,
    p_expire_fnd_user_accounts     in varchar2 default null,
    p_account_lifetime_days        in number   default null,
    p_fnd_user_max_login_failures  in number   default null,
    p_account_status               in varchar2 default 'ASSIGNED',
    p_allow_plsql_editing          in varchar2 default null,
    p_allow_app_building_yn        in varchar2 default null,
    p_allow_packaged_app_ins_yn    in varchar2 default null,
    p_allow_sql_workshop_yn        in varchar2 default null,
    p_allow_websheet_dev_yn        in varchar2 default null,
    p_allow_team_development_yn    in varchar2 default null,
    p_allow_to_be_purged_yn        in varchar2 default null,
    p_source_identifier            in varchar2 default null,
    p_auto_archive_yn              in varchar2 default null,
    p_builder_notification_message in varchar2 default null,
    p_workspace_image_mime_type    in varchar2 default null,
    p_workspace_image              in sys.dbms_sql.varchar2_table default wwv_flow_api.empty_varchar2_table,
    p_rm_consumer_group            in varchar2 default null,
    p_host_prefix                  in varchar2 default null,
    p_cloud_group_name             in varchar2 default null,
    p_cloud_service_name           in varchar2 default null,
    p_path_prefix                  in varchar2 default null,
    p_allow_restful_services_yn    in varchar2 default null,
    p_files_version                in number   default 1,
    p_qos_max_workspace_requests   in number   default null,
    p_qos_max_session_requests     in number   default null,
    p_qos_max_session_kill_timeout in number   default null,
    p_max_session_length_sec       in number   default null,
    p_max_session_idle_sec         in number   default null,
    p_max_email_messages           in number   default null );

--==============================================================================
-- This procedure allows for programatic and bulk creation of users.
--
-- Arguments:
--    p_ID                = unique identifier of the group, typically a large virtually globally unique number.
--    p_group_name        = name of group
--    p_security_group_id = identifies which company this user group belongs to
--    p_group_desc        = text description used as an note to the developer
--==============================================================================
procedure create_user_group (
    p_id                      in number,
    p_group_name              in varchar2,
    p_security_group_id       in number,
    p_group_desc              in varchar2);

--==============================================================================
-- This procedure allows for removal of group from wwv_flow_fnd_user_groups.
-- This procedure is overloaded.
--
-- Arguments:
--    p_group_id          = unique identifier of the group, typically a large virtually globally unique number.
--==============================================================================
procedure delete_user_group (
    p_group_id                in number);

--==============================================================================
-- This procedure allows for removal of group from wwv_flow_fnd_user_groups.
-- This procedure is overloaded.
--
-- Arguments:
--    p_group_name          = group name.
--==============================================================================
procedure delete_user_group (
    p_group_name              in varchar2);

--==============================================================================
-- This function returns ids of groups that are granted to a given group
--
-- Arguments:
--    p_group_id          = group identifier
-- Returns:
--    identifiers of groups that are granted to p_group_id
--==============================================================================
function get_group_group_grants (
    p_group_id                in number )
    return wwv_flow_t_number;

--==============================================================================
-- This procedure updates the group-group grants for a given group
--
-- Arguments:
--    p_group_id          = group identifier
--    p_granted_group_ids = identifiers of groups that are granted to p_group_id
--==============================================================================
procedure set_group_group_grants (
    p_group_id                in number,
    p_granted_group_ids       in wwv_flow_t_number );

--==============================================================================
-- return whether developers and administrators can be created/edited/deleted.
-- this is disabled if the developers are managed externally, as it is done in
-- the cloud.
--==============================================================================
function can_edit_builder_users
    return boolean;

--==============================================================================
-- verify that developers/admins can be edited and raise an error otherwise
--
-- PARAMETERS
-- * p_new_privilege  on insert/edit, the new ALLOW_APP_BUILDING_YN value
-- * p_old_user_id    on edit/remove, the current user's id
--==============================================================================
procedure check_can_edit_builder_users (
    p_new_privilege in varchar2,
    p_old_user_id   in number );

--==============================================================================
-- This procedure allows for programatic and bulk creation of users.
--
-- Example:
--    From sqlplus logged in as the privileged flows user, first
--    ensure that the security group id is set properly, then create
--    your users.
--
--    begin wwv_flow_security.g_security_group_id := 20; end;
--    /
--
--    begin
--       for i in 1..10 loop
--          wwv_flow_fnd_user_int.create_fnd_user(
--             p_user_name => 'USER_'||i,
--             p_email_address => 'user_'||i||'@example.com',
--             p_web_password => 'user_'||i) ;
--       end loop;
--       commit;
--    end;
--    /
--
-- Arguments:
--    p_user_id         numeric primary key of user
--    p_user_name       the username the user uses to login
--    p_first_name      informational only
--    p_last_name       informational only
--    p_web_password    the unencrypted password for the new user
--    p_group_ids       A colon delimited list of group IDs from the table wwv_flow_fnd_user_groups
--    p_developer_privs A colon delmited list of developer privs, privs include:
--                      ADMIN:BROWSE:CREATE:DATA_LOADER:DB_MONITOR:EDIT:HELP:MONITOR:SQL:USER_MANAGER
--    p_default_schema  A valid oracle schema that is the default schema for use in browsing and
--                      creating flows
--    p_allow_access_to_schemas A colon delimited list of oracle schemas that the user is allowed to
--                      parse as.  If null the user can parse as any schema available to the company.
--                      This does not provide privilege it only resticts privilege, so listing a schema
--                      does not provide the privilege to parse as a schema, it only restricts that user
--                      to that list of schemas.
--    p_attributes_XX   These attributes allow you to store arbitary information about a given user.
--                      They are for use by flow developers who want to extend user information.
--    p_web_password_format Identifies the format of the web password.
--                      The range of values is
--                      - CLEAR_TEXT: clear text passwords that are automatically hashed
--                      - a valid password version identifier
--    p_person_type     "E" marks the user as external
--    p_admin_override  If true, do not check whether current user is administrator.
--==============================================================================
procedure create_fnd_user (
    p_user_id                      in number   default null,
    p_user_name                    in varchar2,
    p_first_name                   in varchar2 default null,
    p_last_name                    in varchar2 default null,
    p_description                  in varchar2 default null,
    p_email_address                in varchar2 default null,
    p_web_password                 in varchar2,
    p_web_password_format          in varchar2 default 'CLEAR_TEXT',
    p_group_ids                    in varchar2 default null,
    p_developer_privs              in varchar2 default null,
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
    p_allow_app_building_yn        in varchar2 default null,
    p_allow_sql_workshop_yn        in varchar2 default null,
    p_allow_websheet_dev_yn        in varchar2 default null,
    p_allow_team_development_yn    in varchar2 default null,
    p_person_type                  in varchar2 default null,
    p_profile_image                in blob     default empty_blob(),
    p_profile_image_name           in varchar2 default null,
    p_profile_mimetype             in varchar2 default null,
    p_profile_filename             in varchar2 default null,
    p_profile_last_update          in date     default null,
    p_profile_charset              in varchar2 default null,
    p_admin_override               in boolean  default false );

--==============================================================================
-- This procedure allows for programatic and bulk creation of users from a text
-- file.  The file must be in one of two formats.
--
-- FORMAT 1
-- username,email,PRIV1:PRIV2,password
--
-- FORMAT 2
-- username,email,PRIV1:PRIV2
--
-- PRIV1:PRIV2 is a colon delimited list of developer privelages of the
-- user.  Valid privelages are detailed in create_fnd_user spec.
--
-- Each line must end with a line feed (chr(10)).
--
-- Arguments:
--
--    p_id          The id of the file in wwv_flow_file_objects$
--    p_mode        Either CREATE or display depending on whether you
--                  actually want to create the users or just display them
--                  via sys.htp.p
--    p_format      Can be either 1, 2 or 3.  Refers to the format of the file
--                  and the create user process.  1: passwords are contained in
--                  the file in clear text.  2: passwords have been supplied via
--                  the p_password parameter.  3: passwords should be randomly
--                  generated and then e-mailed to the user.
--    p_password    Only relevant in format 2.  Every user created is given the
--                  password supplied in this parameter.
--    p_app         The name of the application.  This name appears in the subject
--                  and body of the e-mail message sent to users when format is 3.
--    p_appurl      Optional URL can be supplied when file format is 3.  The URL will
--                  appear at the end of the mail message.
--    p_start       This parameter holds the start time of execution
--    p_end         Parameter holds the time the procedure completes
--    p_loaded      The number of users that were provisioned by the execution of the
--                  procedure.
--==============================================================================
procedure create_user_from_file (
  p_id in number,
  p_mode      in varchar2 default 'CREATE',
  p_format    in varchar2 default '1',
  p_password  in varchar2 default 'oracle',
  p_app       in varchar2 default null,
  p_appurl    in varchar2 default null,
  p_start    out varchar2,
  p_end      out varchar2,
  p_loaded   out varchar2)
    ;

--==============================================================================
procedure create_user_coll_from_csv (
    p_users                     in varchar2,
    p_security_group_id         in number,
    p_strip_domain              in varchar2 default 'Y');

--==============================================================================
procedure create_user_from_collection (
    p_security_group_id         in number,
    p_web_password              in varchar2,
    p_allow_access_to_schemas   in varchar2,
    p_default_schema            in varchar2,
    p_developer                 in varchar2,
    p_admin                     in varchar2,
    p_allow_app_building_yn     in varchar2,
    p_allow_sql_workshop_yn     in varchar2,
    p_allow_websheet_dev_yn     in varchar2,
    p_allow_team_development_yn in varchar2);

--==============================================================================
-- This procedure allows for programatic removal of users.
-- This procedure is overloaded.
--==============================================================================
procedure remove_fnd_user (
    p_user_id         in number);

--==============================================================================
-- This procedure allows for programatic removal of users.
-- This procedure is overloaded.
--
-- Example:
--    begin wwv_flow_security.g_security_group_id := 20; end;
--    /
--
--    begin
--       for i in 1..10 loop
--          wwv_flow_fnd_user_int.remove_fnd_user(
--             p_user_name => 'USER_'||i);
--       end loop;
--       commit;
--    end;
--    /
--==============================================================================
procedure remove_fnd_user (
    p_user_name       in varchar2);

--==============================================================================
-- This procedure changes the current users password.
--==============================================================================
procedure change_current_user_pw (
    p_new_password    in varchar2);

--==============================================================================
-- This procedure resets the current users password to a random one and sends
-- an email with the new password to the user.
--==============================================================================
procedure reset_pw (
    p_user                  in varchar2,
    p_security_group_id     in varchar2,
    p_msg                   in varchar2);

--==============================================================================
-- change password of p_user_name in the current workspace to p_new_password.
-- If p_change_password_on_first_use is true, then the user is has to change
-- the password on the next login.
--
-- ARGUMENTS
-- * p_user_name                    the user whose password should be changed.
--                                  defaults to the currently logged in APEX
--                                  user.
-- * p_old_password                 the old (current) password of the user. if
--                                  the value is not the user's password, an
--                                  error occurs. the call also succeeds if the
--                                  given value is null and the owner of the
--                                  calling PL/SQL code has
--                                  APEX_ADMINISTRATOR_ROLE.
-- * p_new_password                 the new password
-- * p_change_password_on_first_use if true (default), then the user has to
--                                  change the password on the next login.
--
-- RAISES
-- * INVALID_CREDENTIALS            p_user_name/p_old_password mismatch
-- * APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER authentication was prevented by
--                                  login throttle
-- * internal error                 p_old_password is null and caller does not
--                                  have APEX_ADMINISTRATOR_ROLE
-- * internal error                 caller is not a valid workspace schema
--==============================================================================
procedure reset_password (
    p_calling_user                 in varchar2 default sys_context('userenv','current_user'),
    p_user_name                    in varchar2 default wwv_flow_security.g_user,
    p_old_password                 in varchar2 default null,
    p_new_password                 in varchar2,
    p_change_password_on_first_use in boolean default true );

--==============================================================================
-- obsolete
--==============================================================================
function user_in_group (
    p_group_name in varchar2)
    return boolean;

--==============================================================================
-- Return the colon-delimited list of developer roles
-- for the specified user in the current company
--==============================================================================
function get_user_roles (
    p_security_group_id     in number default wwv_flow_security.g_security_group_id,
    p_username              in varchar2 )
    return varchar2;

--==============================================================================
-- Return the workspace user's account privileges.
--==============================================================================
function get_account_privileges (
    p_user_name             in varchar2 default wwv_flow_security.g_user )
    return t_account_privileges;

--==============================================================================
-- given a company short name return the security group id
-- p_company = short name of company
--==============================================================================
function find_security_group_id (
    p_calling_user in varchar2 default sys_context('userenv','current_user'),
    p_company      in varchar2 default null)
    return number;

--==============================================================================
-- given a security_group_id, return the company short name
-- p_company = short name of company
--==============================================================================
function find_company (
     p_security_group_id  in varchar2 default null)
     return varchar2;

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
     p_user_id       in number,
     p_company       out varchar2,
     p_user_name     out varchar2,
     p_first_name    out varchar2,
     p_last_name     out varchar2,
     p_web_password  out varchar2,
     p_email_address out varchar2,
     p_start_date    out varchar2,
     p_end_date      out varchar2,
     p_employee_id   out varchar2,
     p_allow_access_to_schemas out varchar2,
     p_person_type     out varchar2,
     p_default_schema  out varchar2,
     p_groups          out varchar2,
     p_developer_role  out varchar2,
     p_description     out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
     p_user_id         in number,
     p_user_name       out varchar2,
     p_first_name      out varchar2,
     p_last_name       out varchar2,
     p_email_address   out varchar2,
     p_groups          out varchar2,
     p_developer_role  out varchar2,
     p_description     out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
     p_user_id                      in number,
     p_company                      out varchar2,
     p_user_name                    out varchar2,
     p_first_name                   out varchar2,
     p_last_name                    out varchar2,
     p_web_password                 out varchar2,
     p_email_address                out varchar2,
     p_start_date                   out varchar2,
     p_end_date                     out varchar2,
     p_employee_id                  out varchar2,
     p_allow_access_to_schemas      out varchar2,
     p_person_type                  out varchar2,
     p_default_schema               out varchar2,
     p_groups                       out varchar2,
     p_developer_role               out varchar2,
     p_description                  out varchar2,
     p_account_expiry               out date,
     p_account_locked               out varchar2,
     p_failed_access_attempts       out number,
     p_change_password_on_first_use out varchar2,
     p_first_password_use_occurred  out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user for Edit Profile page (feature #1379 for 5.0).
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
     p_user_id                      in number,
     p_user_name                    out varchar2,
     p_company                      out varchar2,
     p_first_name                   out varchar2,
     p_last_name                    out varchar2,
     p_email_address                out varchar2,
     p_web_password                 out varchar2,
     p_first_password_use_occurred  out varchar2
     );

--==============================================================================
-- Edit user information to
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
--==============================================================================
procedure edit_fnd_user (
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
     p_developer_roles              in varchar2 default null,
     p_description                  in varchar2 default null,
     p_account_expiry               in date     default null,
     p_account_locked               in varchar2 default 'N',
     p_failed_access_attempts       in number   default 0,
     p_change_password_on_first_use in varchar2 default 'Y',
     p_first_password_use_occurred  in varchar2 default 'N' );

--==============================================================================
-- Edit user information to
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
--==============================================================================
procedure edit_fnd_user (
    p_user_id                      in number,
    p_first_name                   in varchar2 default null,
    p_last_name                    in varchar2 default null,
    p_web_password                 in varchar2 default null,
    p_new_password                 in varchar2 default null,
    p_email_address                in varchar2 default null,
    p_account_locked               in varchar2 default null,
    p_first_password_use_occurred  in varchar2 default 'N',
    p_profile_image                in blob     default empty_blob() );

--==============================================================================
-- Return the IDs of groups that are granted to a given user
--
-- ARGUMENTS
-- * p_user_id       the user's id
--
-- RETURNS
--   table of group ids
--==============================================================================
function get_group_user_grants (
    p_user_id        in number )
    return wwv_flow_t_number;

--==============================================================================
-- This procedure updates the group-user grants for a given user
--
-- ARGUMENTS
-- * p_user_id           = the user's id
-- * p_granted_group_ids = identifiers of groups that are granted to p_user_id
--==============================================================================
procedure set_group_user_grants (
    p_user_id           in number,
    p_granted_group_ids in wwv_flow_t_number );

--==============================================================================
procedure lock_account (
    p_user_name     in varchar2 );

--==============================================================================
procedure unlock_account(
    p_user_name     in varchar2 );

--==============================================================================
function get_account_locked_status(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
procedure expire_workspace_account(
    p_user_name in varchar2 );

procedure unexpire_workspace_account(
    p_user_name in varchar2 );

--==============================================================================
procedure expire_end_user_account(
    p_user_name in varchar2 );

--==============================================================================
procedure unexpire_end_user_account(
    p_user_name in varchar2 );

--==============================================================================
function workspace_account_days_left (
    p_user_name           in varchar2,
    p_check_user_is_admin in boolean default true )
    return number;

--==============================================================================
function end_user_account_days_left(
    p_user_name in varchar2)
    return number;

--==============================================================================
procedure set_custom_auth_status(
    p_status in varchar2 );

--==============================================================================
procedure set_authentication_result(
    p_code in number );

--==============================================================================
function get_authentication_result
    return number;

--==============================================================================
function change_password_on_first_use(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
function password_first_use_occurred(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
-- Create or update instance administrator account. Called from apxchpwd.sql so it may generate dbms_output.
--==============================================================================
procedure create_or_update_user(
    p_user_id  in number,
    p_username in varchar2,
    p_email    in varchar2,
    p_password in varchar2 );

end wwv_flow_fnd_user_int;
/
show errors
