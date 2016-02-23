set define '^' verify off
prompt ...wwv_flow_cgi.sql
create or replace package wwv_flow_cgi as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_cgi.sql
--
--    DESCRIPTION
--      Provide easy access to CGI variables
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    06/14/2012 - Created
--    cneumuel    06/15/2012 - Added g_x_forwarded_for, init (feature #899)
--    cneumuel    08/09/2012 - Changed access to wwv_flow_cgi from globals to functions
--    pawolf      01/10/2013 - Added get_http_accept (bug #16097364)
--    cneumuel    03/27/2013 - Added get_http_referer, create_session_cookie_value, get_session_cookie_value, get_builder_login_cookie_name, get_builder_login_cookie_value (bug #16506634)
--    cneumuel    03/28/2013 - Added get_cookie (bug #15831333)
--    cneumuel    04/02/2013 - Added does_cookie_exist_for_value (bug #16506634)
--    pawolf      04/08/2013 - Added get_path_alias
--    cneumuel    07/26/2013 - Added set_session_cookie_value
--    cneumuel    11/08/2013 - Added add_response_header, add_builtin_response_headers, emit_response_headers (feature #1065)
--    cneumuel    11/13/2013 - Added get_x_forwarded_proto
--    cneumuel    01/22/2014 - Moved response header APIs to wwv_flow_response (feature #1065)
--    cneumuel    05/15/2014 - Added get_header_value, which decodes encoded words (bug #18703294)
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# H T T P   H E A D E R   V A L U E S
--#
--# These values automatically get initialized when the package gets accessed.
--# Use them instead of owa_util.get_cgi_env, to avoid looping through the header
--# array.
--#
--##############################################################################
subtype t_cgi_header is varchar2(32767);

function get_apex_listener_version  return t_cgi_header;
function get_cookie                 return t_cgi_header;
function get_dad_name               return t_cgi_header;
function get_http_accept            return t_cgi_header;
function get_http_accept_language   return t_cgi_header;
function get_http_host              return t_cgi_header;
function get_http_if_modified_since return t_cgi_header;
function get_http_if_none_match     return t_cgi_header;
function get_http_referer           return t_cgi_header;
function get_http_user_agent        return t_cgi_header;
function get_path_info              return t_cgi_header;
function get_path_alias             return t_cgi_header;
function get_query_string           return t_cgi_header;
function get_remote_addr            return t_cgi_header;
function get_remote_user            return t_cgi_header;
function get_request_iana_charset   return t_cgi_header;
function get_request_method         return t_cgi_header;
function get_request_protocol       return t_cgi_header;
function get_script_name            return t_cgi_header;
function get_script_prefix          return t_cgi_header;
function get_server_name            return t_cgi_header;
function get_server_port            return t_cgi_header;
function get_server_software        return t_cgi_header;
function get_x_forwarded_for        return t_cgi_header;
function get_x_forwarded_proto      return t_cgi_header;

--==============================================================================
-- generic get header value function, to be used instead of
-- owa_util.get_cgi_env. this decodes base64- or quoted printable encoded
-- header values (RFC 2047)
--==============================================================================
function get_header_value (
    p_header_name in varchar2 )
    return varchar2;

--##############################################################################
--#
--# S E S S I O N   C O O K I E   H A N D L I N G
--#
--##############################################################################

subtype t_cookie_value is varchar2(32);

--==============================================================================
-- return a new random session cookie value
--==============================================================================
function create_session_cookie_value
    return t_cookie_value;

--==============================================================================
-- update the CGI value for the given session cookie name
-- this does not send the cookie via htp, it merely updates wwv_flow_cgi's
-- internal structures.
--==============================================================================
procedure set_session_cookie_value (
    p_name  in varchar2,
    p_value in t_cookie_value );

--==============================================================================
-- return the CGI value for the given session cookie name
--==============================================================================
function get_session_cookie_value (
    p_name in varchar2 )
    return t_cookie_value;

--==============================================================================
-- return whether a session cookie with the given value exists
-- this function should only be used in wwv_flow_custom_auth_std.ws_login, for
-- sso authentication.
--==============================================================================
function does_cookie_exist_for_value (
    p_value in t_cookie_value )
    return boolean;

--==============================================================================
-- return builder remember me cookie name (ORA_WWV_REMEMBER_UN)
--==============================================================================
function get_builder_login_cookie_name
    return varchar2;

--==============================================================================
-- return builder remember me cookie value (ORA_WWV_REMEMBER_UN)
--==============================================================================
function get_builder_login_cookie_value
    return varchar2;

--##############################################################################
--#
--# U T I L I T Y   F U N C T I O N S
--#
--##############################################################################

--==============================================================================
-- Initialize the global variables.
--
-- The package calls init on startup, but there may be occasions where a
-- re-initialization is necessary.
--==============================================================================
procedure init;

end wwv_flow_cgi;
/
show err
