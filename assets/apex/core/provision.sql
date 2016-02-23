set define '^' verify off
prompt ...wwv_flow_provisioning
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      provision.sql
--
--    DESCRIPTION
--      This package provides provisioning and account management services.
--
--    SECURITY
--      Only available to the internal super user
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa  02/23/2001 - Created
--      mhichwa  02/25/2001 - Extended
--      mhichwa  02/26/2001 - Improved termination
--      mhichwa  02/27/2001 - Do not create company on request, only on provision
--      mhichwa  02/27/2001 - Added remove by company ID
--      mhichwa  02/28/2001 - Added work_log
--      mhichwa  03/04/2001 - Added make_modification_request
--      mhichwa  03/04/2001 - Added reject service modification request procedure
--      mhichwa  03/04/2001 - Added add schema request
--      mhichwa  03/09/2001 - Added reporting by company
--      mhichwa  03/10/2001 - Modified reporting
--      mhichwa  03/10/2001 - Added reporting by user
--      sdillon  03/22/2001 - Added reset_password
--      sdillon  03/26/2001 - Altered ADD_SCHEMA to take in default & temp ts
--      sdillon  03/26/2001 - Added pre process request for request data in UI
--      sdillon  03/30/2001 - Added install_ and remove_demo
--      sdillon  03/30/2001 - Added reset schema password
--      sdillon  04/02/2001 - Removed remove_demo
--      sdillon  04/03/2001 - Added provision storage by request
--      sdillon  04/04/2001 - Changed auto_provision_company for default db size
--      sdillon  04/17/2001 - Added functions total requests and total open requests
--      sdillon  05/03/2001 - Changed provision_request to take a password. Necessary b/c you cant get
--                            the plain-text web_password via sql anymore
--      cbcho    06/27/2002 - Added install_forum_flow and remove_forum_flow
--      cbcho    06/28/2002 - Added install_forum_scripts
--      cbcho    07/16/2002 - Added p_schema to install_forum_scripts
--      cbcho    07/16/2002 - Added p_schema to remove_demo_tables
--      cbcho    07/16/2002 - Added p_schema to install_demo_tables
--      rmattama 08/23/2002 - Added p_security_group_id to make_request and auto_provision_company
--      jstraub  07/24/2003 - Removed report_by_sgid, report_by_current_company and report_by_user since obsolete
--      jstraub  09/25/2003 - Removed instal_demo, install_demo_flow, install_form_flow, remove_demo, remove_demo_flow,
--                            remove forum_flow, install_forum_scripts, install_demo_scripts
--      sspadafo 07/29/2004 - Add restricted_schema, site_admin_is_resricted, validate_schema_name functions (Bug 3781714)
--      sspadafo 05/01/2005 - Add p_use_existing parameter to add_schema and add_schema_by_request procedures
--      sspadafo 07/11/2005 - Add p_workspace_name to restricted_schema functions
--      sspadafo 09/15/2005 - Expose create_flow_super_user,create_cookie_based_user for XE provisioning
--      nagkrish 01/04/2007 - Added procedures accept_request, provision_accept_request, delete_accepted_request to enable email verification workspace creation
--      jkallman 02/15/2007 - Added functions get_schemas_by_sgid and get_tablespaces_by_sgid
--      jkallman 02/15/2007 - Add parameters p_drop_users and p_drop_tablespaces to terminate_service_by_sgid
--      cbcho    08/07/2009 - Added p_install_websheet to auto_provision_company
--      jkallman 02/22/2010 - Added function restricted_schema, but using p_security_group_id instead
--      cbcho    03/08/2010 - Removed p_install_websheet from auto_provision_company
--      jkallman 05/09/2011 - Add p_preallocation_size to auto_provision_company, make_request.  Add install_sample flags to provision_request, auto_provision_company.
--      jkallman 05/11/2011 - Add parameters p_drop_tablespaces and p_remove_request to terminate_by_sgid
--      jkallman 05/13/2011 - Add set_commit
--      cneumuel 06/15/2011 - Removed reset_schema_password, which was not referenced anymore
--      hfarrell 09/23/2011 - Added procedure install_demo_restful_service
--      sathikum 03/27/2012 - Added update_default_schema to update the default schema in wwv_flow_fnd_user (Bug# 12965539)
--      hfarrell 05/20/2014 - In make_request: added p_workspace_type (feature #1429)
--      hfarrell 05/23/2014 - In auto_provision_company: added p_workspace_type (feature #1429)
--      cneumuel 06/19/2015 - In auto_provision_company, provision_request: added p_install_team_dev_files (bug #21256468)
--------------------------------------------------------------------------------
create or replace package wwv_flow_provisioning as

------------------------------------
-- U T I L I T Y   F U N C T I O N S
--

procedure set_commit( p_commit_transactions in boolean default TRUE );

procedure create_flow_super_user (
    p_user_id in number,
    p_user_adminid in varchar2,
    p_security_group_id in number)
    ;

procedure create_cookie_based_user (
    p_provision_id in number,
    p_password     in varchar2)
    ;

function site_admin_is_restricted
    return boolean
    ;

function site_admin_is_restricted_i
    return integer
    ;

function restricted_schema(
    p_schema         in varchar2,
    p_workspace_name in varchar2)
    return boolean
    ;

function restricted_schema(
    p_schema            in varchar2,
    p_security_group_id in number)
    return boolean
    ;


function restricted_schema_i(
    p_schema         in varchar2,
    p_workspace_name in varchar2)
    return integer
    ;

function reserved_schema(
    p_schema in varchar2)
    return boolean
    ;

function reserved_schema_i(
    p_schema in varchar2)
    return integer
    ;

function validate_schema_name(
    p_schema         in varchar2,
    p_workspace_name in varchar2)
    return varchar2
    ;

function total_service_requests
    return number
    ;

function total_open_service_requests
    return number
    ;

function total_change_requests
    return number
    ;

function total_open_change_requests
    return number
    ;


-----------------------------
-- D E M O   R E Q U E S T S
--

procedure install_demo_tables(
    p_security_group_id in number,
    p_schema            in varchar2 default null)
    ;

procedure remove_demo_tables(
    p_security_group_id in varchar2,
    p_schema            in varchar2 default null)
    ;

procedure install_demo_restful_service(
    p_security_group_id in number,
    p_schema            in varchar2 default null)
    ;

----------------------------------------------
-- A U T O   P R O V I S I O N   C O M P A N Y
--
procedure auto_provision_company (
    p_company_name              in varchar2 default null,
    p_schema_name               in varchar2 default null,
    p_schema_password           in varchar2 default null,
    p_database_size             in varchar2 default 'SMALL',
    p_database_initial_size     in varchar2 default null,
    p_admin_userid              in varchar2 default null,
    p_admin_password            in varchar2 default null,
    p_admin_first_name          in varchar2 default null,
    p_admin_last_name           in varchar2 default null,
    p_admin_title               in varchar2 default null,
    p_admin_email               in varchar2 default null,
    p_project_description       in varchar2 default null,
    p_security_group_id         in varchar2 default null,
    p_install_sample_app        in varchar2 default null,
    p_install_sample_ws         in varchar2 default null,
    p_install_team_dev_files    in varchar2 default null,
    p_workspace_type            in varchar2 default null);


----------------------------
-- M A K E   R E Q U E S T S
--
procedure make_request (
    p_company_name              in varchar2 default null,
    p_admin_first_name          in varchar2 default null,
    p_admin_last_name           in varchar2 default null,
    p_admin_title               in varchar2 default null,
    p_admin_email               in varchar2 default null,
    p_admin_phone               in varchar2 default null,
    p_admin_userid              in varchar2 default null,
    p_company_address           in varchar2 default null,
    p_city                      in varchar2 default null,
    p_state                     in varchar2 default null,
    p_zip                       in varchar2 default null,
    p_country                   in varchar2 default null,
    p_company_type              in varchar2 default null,
    p_company_web_site          in varchar2 default null,
    p_number_of_employees       in varchar2 default null,
    p_company_phone             in varchar2 default null,
    p_company_fax               in varchar2 default null,
    p_oracle_partner            in varchar2 default null,
    p_how_did_you_hear_about_us in varchar2 default null,
    p_service_use_status        in varchar2 default null,
    p_database_size             in varchar2 default null,
    p_database_initial_size     in varchar2 default null,
    p_service_start_date        in varchar2 default null,
    p_service_termination_date  in varchar2 default null,
    p_schema_name               in varchar2 default null,
    p_estimated_end_users       in varchar2 default null,
    p_page_views_per_day        in varchar2 default null,
    p_project_description       in varchar2 default null,
    p_project_justification     in varchar2 default null,
    p_security_group_id         in varchar2 default null,
    p_workspace_type            in varchar2 default null,
    --
    p_question_1                in varchar2 default null,
    p_answer_1                  in varchar2 default null,
    p_question_2                in varchar2 default null,
    p_answer_2                  in varchar2 default null,
    p_question_3                in varchar2 default null,
    p_answer_3                  in varchar2 default null,
    p_question_4                in varchar2 default null,
    p_answer_4                  in varchar2 default null,
    p_question_5                in varchar2 default null,
    p_answer_5                  in varchar2 default null,
    p_question_6                in varchar2 default null,
    p_answer_6                  in varchar2 default null,
    p_question_7                in varchar2 default null,
    p_answer_7                  in varchar2 default null,
    p_question_8                in varchar2 default null,
    p_answer_8                  in varchar2 default null,
    p_question_9                in varchar2 default null,
    p_answer_9                  in varchar2 default null,
    p_question_10               in varchar2 default null,
    p_answer_10                 in varchar2 default null
    );

-----------------------------------------
-- P R E   P R O C E S S   R E Q U E S T
--
procedure pre_process_request (
    p_id                        in number)
    ;


------------------------------------
-- P R O V I S I O N   R E Q U E S T
--
procedure provision_request (
    p_id                        in number,
    p_password                  in varchar2,
    p_admin_password            in varchar2,
    p_install_sample_app        in varchar2 default null,
    p_install_sample_ws         in varchar2 default null,
    p_install_team_dev_files    in varchar2 default null );

------------------------------------
-- A C C E P T   R E Q U E S T
--
procedure accept_request (
    p_id                        in number)
    ;


-----------------------------------------------------
-- P R O V I S I O N   A C C E P T E D  R E Q U E S T
--
procedure provision_accept_request (
    p_id                        in number,
    email_id                    in varchar2,
    p_password                  in varchar2,
    p_admin_password            in varchar2)
    ;


-------------------------------------------------
-- D E L E T E  A C C E P T E D   R E Q U E S T
--
procedure delete_accepted_request (
    p_id  in number)
    ;


------------------------------------
-- D E N Y   R E Q U E S T
--
procedure deny_request (
    p_id                        in number)
    ;

------------------------------------
-- T E R M I N A T E   S E R V I C E
--
procedure terminate_service (
    p_id                        in number)
    ;
procedure terminate_service_by_sgid (
    p_security_group_id  in number,
    p_drop_users         in varchar2 default 'N',
    p_drop_tablespaces   in varchar2 default 'N',
    p_remove_request     in varchar2 default 'N')
    ;

-------------------------------------------------
-- D E L E T E  P R O V I S I O N   R E Q U E S T
--
procedure delete_provision_request (
    p_id  in number)
    ;


----------------------------------------------------
-- M A K E   M O D I F I C A T I O N   R E Q U E S T
--
procedure make_modification_request (
    p_security_group_id     in number   default wwv_flow_security.g_security_group_id,
    p_service_name          in varchar2,
    p_service_attribute_1   in varchar2 default null,
    p_service_attribute_2   in varchar2 default null,
    p_service_attribute_3   in varchar2 default null,
    p_service_attribute_4   in varchar2 default null,
    p_service_attribute_5   in varchar2 default null,
    p_service_attribute_6   in varchar2 default null,
    p_service_attribute_7   in varchar2 default null,
    p_service_attribute_8   in varchar2 default null)
    ;

procedure reject_modification_request (
    p_request_id in number)
    ;


procedure delete_modification_request (
    p_request_id in number)
    ;

-------------------------------------
-- S C H E M A   M O D I F I C A T I O N S
--
-- p_security_group_id = identifies company
-- p_schema_name       = identifies the new schema to be created
-- p_db_size           = megabytes
--

procedure add_schema_by_request (
    p_request_id      in number,
    p_use_existing    in boolean default false)
    ;

procedure add_schema (
    p_request_id            in number,
    p_security_group_id     in number,
    p_schema_name           in varchar2,
    p_default_ts            in varchar2,
    p_temporary_ts          in varchar2,
    p_use_existing          in boolean default false)
    ;

procedure remove_schema (
    p_security_group_id     in number,
    p_schema_name           in varchar2)
    ;

procedure update_user_default_schema (
    p_security_group_id     in number,
    p_new_schema            in varchar2,
    p_old_schema            in varchar2)
    ;

procedure remove_schema_by_request (
    p_request_id               in number)
    ;

procedure provision_storage_by_request (
    p_request_id      in number)
    ;

function reset_password (
    p_company                  in varchar2,
    p_username                 in varchar2,
    p_size                     in number default 6)
    return varchar2
    ;

--
-- For a given security_group_id, return a delimited list of workspace schemas
--
function get_schemas_by_sgid (
    p_security_group_id in number,
    p_separator         in varchar2 default null )
    return varchar2
    ;
--
-- For a given security_group_id, return a delimited list of default tablespaces
-- associated with the workspace schemas
--
function get_tablespaces_by_sgid (
    p_security_group_id in number,
    p_separator         in varchar2 default null )
    return varchar2
    ;

end wwv_flow_provisioning;
/
show errors
