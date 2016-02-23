set define '^' verify off
prompt ...wwv_flow_instance_admin
create or replace package wwv_flow_instance_admin as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2007 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_instance_admin.sql
--
--    DESCRIPTION
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    SCRIPT ARGUMENTS
--      None
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED    (MM/DD/YYYY)
--      jstraub    08/10/2007 - Created
--      jstraub    09/18/2007 - Added grant to APEX_ADMINISTRATOR_ROLE
--      jstraub    10/30/2007 - Added remove_workspace
--      jstraub    11/08/2007 - Added add_workspace
--      jstraub    01/23/2009 - Added remove_saved_reports
--      cbcho      01/05/2010 - Added remove_saved_report to remove specific saved ir report
--      jkallman   05/13/2010 - Added add_authorized_url, remove_authorized_url, get_authorized_urls (Bug 9708943)
--      jstraub    04/14/2011 - Added remove_application
--      pawolf     09/05/2011 - Added new parameter p_rm_consumer_group and p_source_identifier to add_workspace (Bug 12944223)
--      cneumuel   10/21/2011 - In add_workspace: added p_group_name, p_host_prefix (bug #13101596)
--      cneumuel   11/09/2011 - In add_workspace: renamed p_group_name to p_cloud_group_name, added p_cloud_service_name
--      jstraub    12/01/2011 - Added truncate_log
--      jstraub    12/14/2011 - Added archive_workspace, purge_archives, purge_archive_versions
--      jkallman   02/01/2012 - Added enable_workspace, disable_workspace
--      jstraub    02/09/2012 - Added p_apps_only parameter to archive_workspace
--      jkallman   04/09/2012 - Added set_rm_consumer_group (Feature# 757)
--      cneumuel   04/30/2012 - Added reserve_workspace_app_ids, free_workspace_app_ids (bug#14008101)
--      jkallman   06/06/2012 - Added set_log_switch_interval
--      cneumuel   06/11/2012 - Added documentation for app id range procedures (feature #923)
--      cneumuel   06/14/2012 - Added LOGIN_THROTTLE_METHODS (feature #899)
--      cneumuel   06/18/2012 - Added INBOUND_PROXIES (feature #899)
--      cbcho      07/11/2012 - Added remove_subscription (feature #763)
--      jkallman   11/29/2012 - Added option of 'O' for application activity logging (Bug 15918165)
--      cneumuel   12/04/2012 - Fixed typo in doc of WORKSPACE_PROVISION_DEMO_OBJECTS, WORKSPACE_WEBSHEET_OBJECTS
--      cneumuel   12/05/2012 - Documented TRACING_ENABLED instance parameter (feature #994)
--      jkallman   12/07/2012 - Documented EMAIL_ATTACHMENT_MAX_SIZE_MB (Bug 15972758)
--      cneumuel   03/13/2013 - Documented PASSWORD_MIN_LENGTH, PASSWORD_NEW_DIFFERS_BY
--      cneumuel   03/20/2013 - Added QOS_MAX_SESSION_KILL_TIMEOUT, QOS_MAX_SESSION_REQUESTS, QOS_MAX_WORKSPACE_REQUESTS (bug #15893138)
--      jkallman   04/12/2013 - Added set_workspace_parameter (Bug 15893138)
--      cneumuel   07/02/2013 - Added ALLOW_RAS (feature #1152)
--                            - Added exists_parameter
--      cneumuel   09/04/2013 - Changed instance parameter USERNAME_VALIDATION (feature #3)
--      cneumuel   10/15/2013 - Added PASSWORD_HASH_FUNCTION (feature #1290)
--      cneumuel   10/22/2013 - Added CHECKSUM_HASH_FUNCTION (feature #1290)
--      cneumuel   11/05/2013 - Added APEX_BUILDER_AUTHENTICATION (feature #3)
--      cneumuel   11/08/2013 - Added HTTP_CONTENT_SECURITY_POLICY, HTTP_STRICT_TRANSPORT_SECURITY (feature #1065)
--      vuvarov    01/09/2014 - Added APEX_REST_PATH_PREFIX parameter (feature #1267)
--      cneumuel   01/27/2014 - Removed HTTP_CONTENT_SECURITY_POLICY, HTTP_STRICT_TRANSPORT_SECURITY. Added HTTP_RESPONSE_HEADERS, HTTP_STS_MAX_AGE. Changed REQUIRE_HTTPS. (feature #1065)
--      cneumuel   02/20/2014 - REJOIN_EXISTING_SESSIONS has values [NPY] (feature #1047)
--      cneumuel   02/26/2014 - Added ALLOW_HOSTNAMES, RM_CONSUMER_GROUP (feature #1323)
--                            - In set_workspace_parameter: support ALLOW_HOSTNAMES, RM_CONSUMER_GROUP
--      jkallman   04/16/2014 - Added HTTP_ERROR_STATUS_ON_ERROR_PAGE_ENABLED (feature #1413)
--      cneumuel   04/29/2014 - Changed doc for HTTP_RESPONSE_HEADERS
--      asitters   04/29/2014 - Added WORKSPACE_TEAM_DEV_FILES_YN and WORKSPACE_TEAM_DEV_FS_LIMIT  (feature #1415)
--      cneumuel   05/16/2014 - Added restrict_schema, unrestrict_schema, create_schema_exception, remove_schema_exception, remove_schema_exceptions, remove_workspace_exceptions (feature #1427)
--      hfarrell   05/26/2014 - In add_workspace: added p_workspace_type (feature #1429)
--      cneumuel   06/06/2014 - Added WORKSPACE_MAX_FILE_SIZE, WORKSPACE_MAX_FILE_COUNT (feature #1198)
--      cneumuel   06/11/2014 - Removed WORKSPACE_MAX_FILE_COUNT (feature #1198)
--      jkallman   06/12/2014 - Added WORKSPACE_EMAIL_MAXIMUM to set_workspace_parameter (feature #1037)
--      jstraub    07/10/2014 - Added EMAIL_IMAGES_URL and EMAIL_INSTANCE_URL
--      cneumuel   07/15/2014 - Added SYSTEM_DEBUG_LEVEL
--      cneumuel   08/12/2014 - Added get_workspace_parameter
--      cneumuel   11/26/2014 - For PRINT_BIB_LICENSED, document APEX_LISTENER value
--      cneumuel   02/09/2015 - Added PASSWORD_HASH_ITERATIONS (bug #20462973)
--      cneumuel   06/19/2015 - In add_workspace: default p_additional_schemas to null, do not install team dev files. Grant is now in wwv_flow_upgrade (bug #21256468)
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# I N S T A N C E   P A R A M E T E R S
--#
--##############################################################################

-- Parameter Name                    Description
-- --------------------------------- --------------------------------------------------------------------------------------------------
-- ACCOUNT_LIFETIME_DAYS             The maximum number of days an end-user account password may be used before the account is expired.
-- ALLOW_DB_MONITOR                  If set to Y, the default, database monitoring is enabled. If set to N, it is disabled.
-- ALLOW_HOSTNAMES                   If set, users can only navigate to an application if the URL's hostname part contains this
--                                   value. Instance administrators can configure more specific values at workspace level.
-- ALLOW_PUBLIC_FILE_UPLOAD          If set to Y, file uploads are allowed without user authentication. If set to N, the default, they
--                                   are not allowed.
-- ALLOW_RAS                         If set to Y, enable Real Application Security support for applications. If set to N (the default),
--                                   RAS can not be used.
--                                   NOTE: this parameter is only supported on 12c.
-- ALLOW_REST                        If set to Y, the default, developers are allowed to expose report regions as RESTful services. If
--                                   set to N, they are not allowed.
-- APEX_BUILDER_AUTHENTICATION       Controls the authentication scheme for the internal builder applications. Valid parameter values are
--                                   - APEX: Application Express workspace accounts authentication (default)
--                                   - DB: Database accounts authentication
--                                   - HEADER: HTTP header variable based authentication
--                                   - SSO: Oracle Single Sign-On authentication
--                                   - LDAP: LDAP authentication
-- APEX_REST_PATH_PREFIX             Controls the URI path prefix used to access built-in RESTful Services exposed by Application
--                                   Express (for example, RESTful Service for referencing static files in workspaces).
-- APPLICATION_ACTIVITY_LOGGING      Controls instance wide setting of application activity log ([A]lways, [N]ever, [U]se application
--                                   settings,[O]ff for New Applications)
-- APPLICATION_ID_MIN                The smallest possible ID for a websheet or database application
-- APPLICATION_ID_MAX                The largest possible ID for a websheet or database application
-- AUTOEXTEND_TABLESPACES            If set to Y, the default, provisioned tablespaces will autoextend up to a maximum size. If set to
--                                   N tablespaces will not autoextend.
-- CHECKSUM_HASH_FUNCTION            Defines the algorithm that is used to create one way hashes for URL checksums.
--                                   Valid values are MD5 (deprecated), SH1 (SHA-1), SH256 (SHA-2, 256 bit), SH384 (SHA-2, 384 bit),
--                                   SH512 (SHA-2, 512 bit) and null.
--                                   The SHA-2 algorithms are only available on Oracle 12g and later. A null value evaluates to the
--                                   most secure algorithm available and is the default.
-- CHECK_FOR_UPDATES                 If set to N, the check for Oracle Application Express and Oracle REST Data Services product
--                                   updates is disabled for the entire instance, regardless of preferences specified by
--                                   individual developers. The default is Y.
-- DELETE_UPLOADED_FILES_AFTER_DAYS  Uploaded files like application export files, websheet export files, spreadsheet data load files
--                                   will be automatically deleted after this number of days. Default is 14.
-- DISABLE_ADMIN_LOGIN               If set to Y, administration services are disabled. If set to N, the default, they are not
--                                   disabled.
-- DISABLE_WORKSPACE_LOGIN           If set to Y, the workspace login is disabled. If set to N, the default, the login is not disabled.
-- DISABLE_WS_PROV                   If set to Y, the workspace creation is disabled for requests sent out via e-mail notification. If
--                                   set to N, the default, they are not disabled.
-- EMAIL_ATTACHMENT_MAX_SIZE_MB      Maximum size, in megabytes, of a single email attachment sent via APEX_MAIL.
-- EMAIL_IMAGES_URL                  Specifies the full URL to the images directory of Application Express instance, including the
--                                   trailing slash after the images directory. For example: http://your_server/i/. This setting used
--                                   for Oracle Application Express system-generated emails.
-- EMAIL_INSTANCE_URL                Specifies the URL to Application Express instance, including the trailing slash after the Database
--                                   Access Descriptor. For example: http://your_server/pls/apex/. This setting used
--                                   for Oracle Application Express system-generated emails.
--
-- ENABLE_TRANSACTIONAL_SQL          If set to Y, the default, transactional SQL commands are enabled on this instance. If set to N,
--                                   transactional SQL commands are not enabled.
-- EXPIRE_FND_USER_ACCOUNTS          If set to Y, expiration of APEX accounts is enabled. If set to N, they are not enabled.
-- HTTP_RESPONSE_HEADERS             List of http response headers, separated by newline (chr(10)). APEX writes these headers on each
--                                   request, before rendering the page. The substitution string #CDN# within the headers will be replaced
--                                   by the content delivery networks that are known to APEX.
-- HTTP_ERROR_STATUS_ON_ERROR_PAGE_ENABLED If set to Y, when an unhandled exception occurs in the APEX engine, simply return
--                                         an HTTP 400 status code instead of showing the exception details on the page.
-- HTTP_STS_MAX_AGE                  This parameter is only relevant if REQUIRE_HTTPS is set to "A". Then, APEX emits a
--                                   Strict-Transport-Security: max-age=<value>
--                                   header on HTTPS requests if HTTP_STS_MAX_AGE has a value greater than 0. It also redirects to a
--                                   HTTPS URL if the request protocol is HTTP, instead of processing the request.
-- INBOUND_PROXIES                   Comma-separated list of IP addresses for proxy servers through which requests come in.
-- LOGIN_THROTTLE_DELAY              The flag which determines the time increase in seconds after failed logins
-- LOGIN_THROTTLE_METHODS            The methods to count failed logins. Colon-separated list of USERNAME_IP, USERNAME, IP
-- MAX_SESSION_IDLE_SEC              The number of seconds an internal application may be idle.
-- MAX_SESSION_LENGTH_SEC            The number of seconds an internal application session may exist.
-- PASSWORD_ALPHA_CHARACTERS         The alphabetic characters used for password complexity rules. Default list of alphabetic characters
--                                   include the following:
--                                   abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
-- PASSWORD_HASH_FUNCTION            Defines the algorithm that is used to create one way hashes for workspace user passwords.
--                                   Valid values are MD5 (deprecated), SH1 (SHA-1), SH256 (SHA-2, 256 bit), SH384 (SHA-2, 384 bit),
--                                   SH512 (SHA-2, 512 bit) and null.
--                                   The SHA-2 algorithms are only available on Oracle 12g and later. A null value evaluates to the
--                                   most secure algorithm available and is the default.
-- PASSWORD_HASH_ITERATIONS          Defines the number of iterations for the PASSWORD_HASH_FUNCTION (default 10000)
-- PASSWORD_HISTORY_DAYS             Defines the maximum number of days a developer or administrator account password may be used before
--                                   the account expires. The default value is 45 days.
-- PASSWORD_MIN_LENGTH               A positive integer or 0 which specifies the minimum character length for passwords for instance
--                                   administrators, workspace administrators, developers, and end user Application Express accounts.
-- PASSWORD_NEW_DIFFERS_BY           A positive integer or 0 which specifies the number of differences required between old and new
--                                   passwords. The passwords are compared character by character, and each difference that occurs in
--                                   any position counts toward the required minimum difference. This setting applies to accounts for
--                                   instance administrators, workspace administrators, developers, and end user Application Express
--                                   accounts.
-- PASSWORD_PUNCTUATION_CHARACTERS   The punctuation characters used for password complexity rules. Default list of punctuation
--                                   characters include the following:
--                                   !"#$%&()``*+,-/:;<=>?_
-- PLSQL_EDITING                     If set to Y, the default, the SQL Workshop Object Browser is enabled to allow users to edit and
--                                   compile PL/SQL. If set to N, users are not allowed.
-- PRINT_BIB_LICENSED                Specify standard support, advanced support or Oracle Rest Data Services (ORDS, formerly Apex 
--                                   Listener) support. ADVANCED requires an Oracle BI Publisher. APEX_LISTENER
--                                   license. Valid values include:
--                                   * STANDARD
--                                   * ADVANCED      - requires Oracle BI Publisher
--                                   * APEX_LISTENER - requires Oracle Rest Data Services
-- PRINT_SVR_PROTOCOL                Valid values include:
--                                   * http
--                                   * https
-- PRINT_SVR_HOST                    Specifies the host address of the print server converting engine, for example, localhost. Enter the
--                                   appropriate host address if the print server is installed at another location.
-- PRINT_SVR_PORT                    Defines the port of the print server engine, for example 8888. Value must be a positive integer.
-- PRINT_SVR_SCRIPT                  Defines the script that is the print server engine, for example:
--                                   /xmlpserver/convert
-- QOS_MAX_SESSION_KILL_TIMEOUT      Nr of seconds that an active old session can live, when qos_max_session_requests has been reached.
--                                   The oldest DB session with last_call_et > qos_max_session_kill_timeout will be killed.
-- QOS_MAX_SESSION_REQUESTS          Nr of allowed concurrent requests to one session associated with this workspace.
-- QOS_MAX_WORKSPACE_REQUESTS        Nr of allowed concurrent requests to sessions in this workspace.
-- REJOIN_EXISTING_SESSIONS          If N (the default), session rejoining is disabled for the whole instance.
--                                   If P, it is supported for non-authenticated users and public pages.
--                                   If Y, it is also supported for authenticated users and protected pages.
--                                   Session rejoining explicitly has to be enabled at application or page level. A more restrictive
--                                   setting at instance level with this instance parameter overrides application and page settings.
--                                   Unconditionally enabling session rejoining has serious security implications. Attackers could
--                                   take over sessions via XSS or if they have development access to a workspace.
-- REQUIRE_HTTPS                     Set to A, to enforce HTTPS for the whole APEX instance. Set to I to enforce HTTPS
--                                   within the Application Express development and administration applications. Select N to allow
--                                   all application be used when the protocol is either HTTP or HTTPS (HTTPS can be enforced at
--                                   application level).
-- REQUIRE_VERIFICATION_CODE         If set to Y, the Verification Code is displayed and is required for someone to request a new
--                                   workspace. If set to N, the default, the Verification Code is not required.
-- REQ_NEW_SCHEMA                    If set to Y, the option for new schema for new workspace requests is enabled. If set to N, the
--                                   default, the option is disabled.
-- RESTFULL_SERVICES_ENABLED         If set to Y, the default, RESTful services development is enabled. If set to N, RESTful services
--                                   are not enabled.
-- RM_CONSUMER_GROUP                 If set, this is the resource manager consumer group to be used for all page events. A more specific
--                                   group can be configured at workspace level.
-- SERVICE_REQUESTS_ENABLED          If set to Y, the default, workspace service requests for schemas, storage, and termination is
--                                   enabled. If set to N, these requests are disabled.
-- SERVICE_REQUEST_FLOW              Determines default provisioning mode. Default is MANUAL.
-- SMTP_FROM                         Defines the "from" address for administrative tasks that generate email, such as approving a
--                                   provision request or resetting a password.  Enter a valid email address, for example:
--                                   someone@somewhere.com
-- SMTP_HOST_ADDRESS                 Defines the server address of the SMTP server. If you are using another server as an SMTP relay,
--                                   change this parameter to that server's address.
--                                   Default setting: localhost
-- SMTP_HOST_PORT                    Defines the port the SMTP server listens to for mail requests.
--                                   Default setting: 25
-- SMTP_PASSWORD                     Defines the password APEX takes to authenticate itself against the SMTP server, in conjunction
--                                   with the parameter SMTP_USERNAME.
-- SMTP_TLS_MODE                     Defines whether or not APEX opens an encrypted connection to the SMTP server. Encryption is only
--                                   supported on database versions 11.2.0.2 and later. On earlier database versions, the connection
--                                   is not encrypted.
--                                   If set to N, the connection is unencrypted (default).
--                                   If set to Y, the connection is encrypted before data is sent.
--                                   If STARTTLS, Apex sends the SMTP commands EHLO <SMTP_HOST_ADDRESS> and STARTTLS before encrypting
--                                   the connection.
-- SMTP_USERNAME                     Defines the username APEX takes to authenticate itself against the SMTP server (default is null).
--                                   Starting with database version 11.2.0.2, APEX uses UTL_MAIL's AUTH procedure for authentication.
--                                   This procedure negotiates an authentication mode with the SMTP server. With earlier database versions,
--                                   the authentication mode is always AUTH LOGIN. If SMTP_USERNAME is null, no authentication is used.
-- SQL_SCRIPT_MAX_OUTPUT_SIZE        The maximum allowable size for an individual script result. Default is 200000.
-- STRONG_SITE_ADMIN_PASSWORD        If set to Y, the default, the apex_admin password must conform to the default set of strong complexity
--                                   rules. If set to N, the password is not required to follow the strong complexity rules.
-- SYSTEM_DEBUG_LEVEL                Defines a default debug level for all incoming requests.
-- SYSTEM_HELP_URL                   Location of the help and documentation accessed from the Help link within the development environment.
--                                   Default is http://apex.oracle.com/doc41.
-- TRACING_ENABLED                   If set to Y (the default), an application with Debug enabled can also generate server-side db trace
--                                   files using "&p_trace=YES" on the URL. If set to N, the request to create a trace file will be ignored.
-- USERNAME_VALIDATION               The regular expression used to validate a username of workspace developers and administrators. The
--                                   value '*' means no validation, which is the default.
-- WALLET_PATH                       The path to the wallet on the file system, for example: file:/home/<username>/wallets
-- WALLET_PWD                        The password associated with the wallet.
-- WEBSHEET_SQL_ACCESS               If set to Y, the default, SQL tags and SQL reports are possible in Websheet applications. If set to
--                                   N, they are not possible.
-- WORKSPACE_EMAIL_MAXIMUM           Maximum number of emails allowed to be sent via APEX_MAIL per workspace in a 24 hour period. Default
--                                   is 1000.
-- WORKSPACE_MAX_FILE_BYTES          The maximum number of bytes for uploaded files for a workspace. A setting at workspace level overrides
--                                   the instance level setting.
-- WORKSPACE_MAX_OUTPUT_SIZE         The maximum space allocated for script results. Default is 2000000.
-- WORKSPACE_PROVISION_DEMO_OBJECTS  If set to Y, the default, demonstration applications and database objects are created in new workspaces.
--                                   If set to N, they are not created in the current workspace.
-- WORKSPACE_WEBSHEET_OBJECTS        If set to Y, the default, APEX Websheet database objects are created in new workspaces. If set to N,
--                                   they are not created in the current workspace.
-- WORKSPACE_TEAM_DEV_FILES_YN       If set to Y, the default, new workspaces will allow file uploads into Team Development. If set to N, new
--                                   workspaces will not allow file uploads into Team Development, thereby disabling the ability to upload "feature",
--                                   "bug", and "feedback" attachments.
-- WORKSPACE_TEAM_DEV_FS_LIMIT       The maximum per upload file size of a Team Development file ("feature", "bug", and "feedback" attachments).
--                                   Default value is 15728640 (15 MB). All possible options are listed below:
--                                   5 MB - 5242880 | 10 MB - 10485760 | 15 MB - 15728640 | 20 MB - 20971520 | 25 MB - 26214400

--==============================================================================
-- Set an instance parameter value
--
-- NOTE: You must commit the transaction after calling this procedure for the
-- change to take effect.
--
-- ARGUMENTS
-- * p_parameter parameter name
-- * p_value     parameter value
--==============================================================================
procedure set_parameter(
    p_parameter           in varchar2,
    p_value               in varchar2 default 'N' );

--==============================================================================
-- Get an instance parameter value
--
-- ARGUMENTS
-- * p_parameter parameter name
--
-- RETURNS
-- the parameter value
--==============================================================================
function get_parameter(
    p_parameter           in varchar2 )
    return varchar2;

--==============================================================================
-- Check whether an instance parameter exists
--
-- ARGUMENTS
-- * p_parameter parameter name
--
-- RETURNS
-- true if the parameter exists, false otherwise
--==============================================================================
function exists_parameter (
    p_parameter            in varchar2 )
    return boolean;

--##############################################################################
--#
--# W O R K S P A C E   M A N A G E M E N T
--#
--##############################################################################

--==============================================================================
procedure add_workspace(
    p_workspace_id           in number   default null,
    p_workspace              in varchar2,
    p_source_identifier      in varchar2 default null,
    p_primary_schema         in varchar2,
    p_additional_schemas     in varchar2 default null,
    p_rm_consumer_group      in varchar2 default null,
    p_cloud_group_name       in varchar2 default null,
    p_cloud_service_name     in varchar2 default null,
    p_host_prefix            in varchar2 default null,
    p_workspace_type         in varchar2 default null );

--==============================================================================
procedure remove_workspace(
    p_workspace           in varchar2,
    p_drop_users          in varchar2 default 'N',
    p_drop_tablespaces    in varchar2 default 'N' );

--==============================================================================
procedure remove_application(
    p_application_id      in number );

--==============================================================================
function get_schemas(
    p_workspace           in varchar2 )
return varchar2;

--==============================================================================
procedure add_schema(
    p_workspace           in varchar2,
    p_schema              in varchar2 );

--==============================================================================
procedure remove_schema(
    p_workspace           in varchar2,
    p_schema              in varchar2 );

--==============================================================================
-- set a Resource Manager Consumer Group to a workspace
--==============================================================================
procedure set_workspace_consumer_group(
    p_workspace           in varchar2,
    p_rm_consumer_group   in varchar2 );

--==============================================================================
-- set a workspace parameter
--
-- ARGUMENTS
-- * p_workspace          the workspace name
-- * p_parameter          the parameter name, one of
--                        - ALLOW_HOSTNAMES
--                        - QOS_MAX_WORKSPACE_REQUESTS
--                        - QOS_MAX_SESSION_REQUESTS
--                        - QOS_MAX_SESSION_KILL_TIMEOUT
--                        - RM_CONSUMER_GROUP
--                        - WORKSPACE_EMAIL_MAXIMUM
--                        - WORKSPACE_MAX_FILE_BYTES
--                        that overrides the instance parameter value of the
--                        same name for this workspace.
-- * p_value              the parameter value
--
-- EXAMPLE
--   Restrict URLs for accessing applications in the HR workspace to have
--   "hr.example.com" in the hostname / domain name part.
--
--   begin
--       apex_instance_admin.set_workspace_parameter (
--           p_workspace => 'HR',
--           p_parameter => 'ALLOW_HOSTNAMES',
--           p_value     => 'hr.example.com' );
--   end;
--==============================================================================
procedure set_workspace_parameter(
    p_workspace           in varchar2,
    p_parameter           in varchar2,
    p_value               in varchar2 );

--==============================================================================
-- get a workspace parameter
--
-- ARGUMENTS
-- * p_workspace          the workspace name
-- * p_parameter          the parameter name, one of
--                        - ALLOW_HOSTNAMES
--                        - QOS_MAX_WORKSPACE_REQUESTS
--                        - QOS_MAX_SESSION_REQUESTS
--                        - QOS_MAX_SESSION_KILL_TIMEOUT
--                        - RM_CONSUMER_GROUP
--                        - WORKSPACE_EMAIL_MAXIMUM
--                        - WORKSPACE_MAX_FILE_BYTES
--                        that overrides the instance parameter value of the
--                        same name for this workspace.
--
-- EXAMPLE
--   Print the value of ALLOW_HOSTNAMES for the HR workspace.
--   "hr.example.com" in the hostname / domain name part.
--
--   begin
--       dbms_output.put_line (
--           apex_instance_admin.get_workspace_parameter (
--               p_workspace => 'HR',
--               p_parameter => 'ALLOW_HOSTNAMES' ));
--   end;
--==============================================================================
function get_workspace_parameter(
    p_workspace           in varchar2,
    p_parameter           in varchar2 )
    return varchar2;

--==============================================================================
procedure disable_workspace(
    p_workspace        in varchar2 default null );

--==============================================================================
procedure enable_workspace(
    p_workspace        in varchar2 default null );

--##############################################################################
--#
--# W O R K S P A C E   A R C H I V I N G
--#
--##############################################################################

--==============================================================================
procedure archive_workspace(
    p_workspace        in varchar2 default null,
    p_schema           in varchar2 default null,
    p_apps_only        in varchar2 default 'N');

procedure purge_archives(
    p_workspace        in varchar2 default null,
    p_schema           in varchar2 default null);

procedure purge_archive_versions(
    p_workspace                 in varchar2 default null,
    p_schema                    in varchar2 default null,
    p_max_versions_to_retain    in number);

--##############################################################################
--#
--# A P P L I C A T I O N   I D   R A N G E
--#
--##############################################################################

--==============================================================================
-- This procedure permanently reserves the IDs of websheet and database
-- applications in a given workspace. Even if the workspace and it's
-- applications get removed, developers can not create other applications with
-- one of these IDs.
--
-- Together with the parameters APPLICATION_ID_MIN and APPLICATION_ID_MAX, this
-- procedure can be used to support moving workspaces between Application
-- Express instances, without the risk of having duplicate application IDs.
--
-- ARGUMENTS
-- * p_workspace_id: The unique id of a workspace.
--
-- EXAMPLE
--   After setting up Application Express instance 1, ensure that
--   application IDs are between 100000 and 199999:
--
--   begin
--     apex_instance_admin.set_parameter('APPLICATION_ID_MIN', 100000);
--     apex_instance_admin.set_parameter('APPLICATION_ID_MAX', 199999);
--   end;
--
--   After setting up Application Express instance 2, ensure that
--   application IDs are between 200000 and 299999:
--
--   begin
--     apex_instance_admin.set_parameter('APPLICATION_ID_MIN', 200000);
--     apex_instance_admin.set_parameter('APPLICATION_ID_MAX', 299999);
--   end;
--
--   Later, the operations team decides that workspace MY_WORKSPACE with
--   ID 1234567890 should be moved from instance 1 to instance 2. The
--   required steps are:
--   1. Export the workspace, applications and data on instance 1 (not shown
--      here)
--   2. Ensure that no other application on instance 1 can reuse application
--      IDs of this workspace
--
--   begin
--     apex_instance_admin.reserve_workspace_app_ids(1234567890);
--   end;
--
--   3. Drop workspace, accompanying data and users on instance 1
--
--   begin
--     apex_instance_admin.remove_workspace('MY_WORKSPACE');
--   end;
--
--   4. Import the workspace, applications and data on instance 2 (not shown
--      here)
--==============================================================================
procedure reserve_workspace_app_ids (
    p_workspace_id in number );

--==============================================================================
-- This procedure removes the reservation of application IDs for a given
-- workspace id. Use this procedure to undo a reservation with
-- reserve_workspace_app_ids, when the reservation is not necessary anymore
-- because it happened by mistake or the workspace does not exist anymore.
--
-- ARGUMENTS
-- * p_workspace_id: The unique id of a workspace.
--
-- EXAMPLE
--   begin
--     apex_instance_admin.free_workspace_app_ids(1234567890);
--   end;
--==============================================================================
procedure free_workspace_app_ids (
    p_workspace_id in number );

--##############################################################################
--#
--# I N T E R A C T I V E   R E P O R T S
--#
--##############################################################################

--==============================================================================
procedure remove_saved_reports(
    p_application_id      in number default null );

--==============================================================================
procedure remove_saved_report(
    p_application_id      in number,
    p_report_id           in number);

--==============================================================================
procedure remove_subscription (
    p_subscription_id     in number);

--##############################################################################
--#
--# A U T H O R I Z E D   U R L S
--#
--##############################################################################

--==============================================================================
procedure add_authorized_url(
    p_url                 in varchar2,
    p_description         in varchar2 default null );

--==============================================================================
procedure remove_authorized_url(
    p_url                 in varchar2 );

--==============================================================================
function get_authorized_urls return wwv_flow_global.vc_arr2;

--##############################################################################
--#
--# R E S T R I C T E D   S C H E M A S
--#
--##############################################################################

--==============================================================================
-- Revoke the privilege to assign a schema to workspaces
--
-- ARGUMENTS
-- * p_schema               the schema
--
-- EXAMPLE
--   Revoke the privilege to assign schema HR to workspaces
--
--   begin
--       apex_instance_admin.restrict_schema(p_schema => 'HR');
--       commit;
--   end;
--
-- SEE ALSO
--   unrestrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_schema_exceptions, remove_workspace_exceptions
--==============================================================================
procedure restrict_schema (
    p_schema in varchar2 );

--==============================================================================
-- Re-grant the privilege to assign a schema to workspaces, if it has been
-- revoked before.
--
-- ARGUMENTS
-- * p_schema               the schema
--
-- EXAMPLE
--   Re-grant the privilege to assign schema HR to workspaces
--
--   begin
--       apex_instance_admin.unrestrict_schema(p_schema => 'HR');
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_schema_exceptions,  remove_workspace_exceptions
--==============================================================================
procedure unrestrict_schema (
    p_schema in varchar2 );

--==============================================================================
-- Create an exception which allows to assign a restricted schema to a specific
-- workspace.
--
-- ARGUMENTS
-- * p_schema               the schema
-- * p_workspace            the workspace
--
-- EXAMPLE
--   Allow assigning restricted schema HR to workspace HR_WORKSPACE
--
--   begin
--       apex_instance_admin.create_schema_exception (
--           p_schema    => 'HR',
--           p_workspace => 'HR_WORKSPACE' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   remove_schema_exception,
--   remove_schema_exceptions,  remove_workspace_exceptions
--==============================================================================
procedure create_schema_exception (
    p_schema    in varchar2,
    p_workspace in varchar2 );

--==============================================================================
-- Remove an exception which allowed to assign a restricted schema to a specific
-- workspace.
--
-- ARGUMENTS
-- * p_schema               the schema
-- * p_workspace            the workspace
--
-- EXAMPLE
--   Remove exception which allowed to assign HR to HR_WORKSPACE
--
--   begin
--       apex_instance_admin.remove_schema_exception (
--           p_schema    => 'HR',
--           p_workspace => 'HR_WORKSPACE' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   create_schema_exception,
--   remove_schema_exceptions,  remove_workspace_exceptions
--==============================================================================
procedure remove_schema_exception (
    p_schema    in varchar2,
    p_workspace in varchar2 );

--==============================================================================
-- Remove all exceptions which allowed to assign a given restricted schema to
-- workspaces.
--
-- ARGUMENTS
-- * p_schema               the schema
--
-- EXAMPLE
--   Remove all exceptions which allowed assigning HR to workspaces
--
--   begin
--       apex_instance_admin.remove_schema_exceptions (
--           p_schema    => 'HR' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_workspace_exceptions
--==============================================================================
procedure remove_schema_exceptions (
    p_schema    in varchar2 );


--==============================================================================
-- Remove all exceptions which allowed to assign restricted schemas to a
-- given workspace.
--
-- ARGUMENTS
-- * p_workspace            the workspace
--
-- EXAMPLE
--   Remove exception to assign restricted schemas to HR_WORKSPACE
--
--   begin
--       apex_instance_admin.remove_workspace_exceptions (
--           p_workspace => 'HR_WORKSPACE' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_schema_exceptions
--==============================================================================
procedure remove_workspace_exceptions (
    p_workspace    in varchar2 );

--##############################################################################
--#
--# L O G S
--#
--##############################################################################

--==============================================================================
procedure set_log_switch_interval(
   p_log_name              in varchar2,
   p_log_switch_after_days in number );

--==============================================================================
procedure truncate_log(
    p_log                 in varchar2 );

end wwv_flow_instance_admin;
/
