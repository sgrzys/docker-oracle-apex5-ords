set define '^' verify off
prompt ...wwv_flow_platform.sql
create or replace package wwv_flow_platform as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_platform.sql
--
--    DESCRIPTION
--      Low-level interface to instance parameters.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa  03/04/2001 - Created
--      mhichwa  03/26/2001 - changes pres to pref
--      mhichwa  04/18/2001 - Changed platform pref to platform prefs
--      jkallman 05/17/2005 - Added set_preference
--      nagkrish 11/12/2007 - If workspace creation via email notification is re-enabled, corresponding system message is deleted.
--      jkallman 02/23/2011 - Added support for application activity logging
--      pawolf   02/23/2011 - Fixed a bug in application activity logging and changed the order execution
--      jkallman 04/01/2011 - Added result_cache hint to get_preference
--      jkallman 11/29/2012 - Added support for application_activity_logging = 'O', and update of packaged applications (Bug 15918165)
--      cneumuel 03/05/2013 - Added internal caching. moved from platform.sql to wwv_flow_platform.{sql,plb} (bug #15893138)
--      cneumuel 05/06/2013 - In get_preference: use pl/sql function result cache (bug #15893138)
--      cneumuel 05/12/2013 - In get_preference: no relies_on clause in spec on 11.1
--      cneumuel 02/26/2014 - Added global variables and init() for caching
--      cneumuel 03/05/2014 - Added g_max_session_idle_sec and g_max_session_length_sec (feature #1323)
--                          - Added g_instance_id
--      cneumuel 03/06/2014 - Added g_instance_proxy
--      cneumuel 06/26/2014 - Added g_apex_instance_enabled
--      cneumuel 01/23/2015 - Added g_checksum_hash_function (bug #20384628)
--      cneumuel 06/09/2015 - Added g_proxy_authentication for PROXY_AUTHENTICATION (feature #1798)
--
--------------------------------------------------------------------------------

--==============================================================================
-- globals for common instance parameters that are always needed at the
-- beginning of request processing. these are set via init() below and on first
-- access, in the package body's begin block.
--
-- the number of these globals should be kept small. only add a new one if it
-- is used for each request.
--==============================================================================
g_qos_max_workspace_requests   number;
g_qos_max_session_requests     number;
g_qos_max_session_kill_timeout number;
g_rm_consumer_group            varchar2(4000);
g_allow_hostnames              varchar2(4000);
g_http_sts_max_age             varchar2(4000);
g_http_response_headers        varchar2(4000);
g_require_https                varchar2(4000);
g_rejoin_existing_sessions     varchar2(4000);
g_max_session_length_sec       number;
g_max_session_idle_sec         number;
g_instance_id                  varchar2(4000);
g_instance_proxy               varchar2(4000);
g_apex_instance_enabled        varchar2(4000);
g_checksum_hash_function       varchar2(4000);
g_proxy_authentication         varchar2(4000);

--==============================================================================
-- G E T   P R E F E R E N C E
-- preference names include:
--    EXP_COMMAND_PATH = command path used to execute the export and import utilities
--==============================================================================
function get_preference (
   p_preference_name in varchar2)
   return varchar2
$if sys.dbms_db_version.version < 11 $then
   /* no result_cache */
$else
   result_cache
$end
   ;

--==============================================================================
procedure set_preference (
   p_preference_name  in varchar2,
   p_preference_value in varchar2 );

--==============================================================================
-- Initialize the global variables.
--
-- The package calls init on startup, but there may be occasions where a
-- re-initialization is necessary.
--==============================================================================
procedure init;

end wwv_flow_platform;
/
show err

