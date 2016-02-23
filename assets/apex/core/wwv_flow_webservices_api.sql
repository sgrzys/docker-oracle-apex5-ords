set define '^'
set verify off
prompt ...wwv_flow_webservices_api

Rem  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_webservices_api.sql
Rem
Rem    DESCRIPTION
Rem      API to interact with Web services.
Rem
Rem    NOTES
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/06/2009 - Created
Rem      jstraub   08/27/2009 - Removed make_request function and procedure, consolidated to wwv_flow_web_services.make_soap_request
Rem      jstraub   09/22/2009 - Moved make_request functions and procedures from htmldb_util
Rem      jstraub   11/17/2009 - Removed p_http_headers parameters, no longer necessary with header globals
Rem      jstraub   05/18/2011 - Added p_transfer_timeout to make_rest_request and make_request (bug 11886970)
Rem      cneumuel  04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem      jstraub   04/09/2014 - Added function make_rest_request_b returning BLOB
Rem      jstraub   04/09/2014 - Added p_scheme for auth type in make_request and make_rest_request*
Rem      jstraub   04/14/2015 - Changed header.value type to varchar2(4096) bug (20882245)

create or replace package wwv_flow_webservices_api
as

empty_vc_arr wwv_flow_global.vc_arr2;

g_request_cookies   sys.utl_http.cookie_table;
g_response_cookies  sys.utl_http.cookie_table;

type header is record (name varchar2(256), value varchar2(4096));
type header_table is table of header index by binary_integer;

g_headers           header_table;
g_request_headers   header_table;

g_status_code       pls_integer;

function blob2clobbase64 (
--
-- This function converts a blob to base64 character encoded representation and
-- returns it as a clob.
--
-- Arguments:
--   p_blob                 The blob to convert
--
--
    p_blob in blob ) return clob;

function clobbase642blob (
--
-- This function converts base64 encoded binary data and returns it as a blob.
--
-- Arguments:
--   p_clob                 The base64 encoded data
--
--
    p_clob in clob ) return blob;

procedure make_request (
--
-- This procedure invokes a Web service with the supplied SOAP envelope and stores
-- the response in a collection.
--
-- Arguments:
--   p_url                  The url endpoint of the Web service
--   p_action               The SOAP Action corresponding to the operation invoked
--   p_version              The SOAP version, 1.1 or 1.2
--   p_collection_name      The name of the collection to store the response
--   p_envelope             The SOAP envelope to post to the service
--   p_username             The username if basic authentication is required for this service
--   p_password             The password if basic authentication is required for this service
--   p_scheme               The authentication scheme, Basic (default) or AWS
--   p_proxy_override       The proxy to use for the request
--   p_transfer_timeout     The amount of time in seconds to wait for a response
--   p_wallet_path          The filesystem path to a wallet if request is https
--                          ex., file:/usr/home/oracle/WALLETS
--   p_wallet_pwd           The password to access the wallet
--
    p_url               in varchar2,
    p_action            in varchar2 default null,
    p_version           in varchar2 default '1.1',
    p_collection_name   in varchar2 default null,
    p_envelope          in clob,
    p_username          in varchar2 default null,
    p_password          in varchar2 default null,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number default 180,
    p_wallet_path       in varchar2 default null,
    p_wallet_pwd        in varchar2 default null );

function make_request (
--
-- This function invokes a Web service with the supplied SOAP envelope and returns
-- the response as an sys.xmltype.
--
-- Arguments:
--   p_url                  The url endpoint of the Web service
--   p_action               The SOAP Action corresponding to the operation invoked
--   p_version              The SOAP version, 1.1 or 1.2
--   p_envelope             The SOAP envelope to post to the service
--   p_username             The username if basic authentication is required for this service
--   p_password             The password if basic authentication is required for this service
--   p_scheme               The authentication scheme, Basic (default) or AWS
--   p_proxy_override       The proxy to use for the request
--   p_transfer_timeout     The amount of time in seconds to wait for a response
--   p_wallet_path          The filesystem path to a wallet if request is https
--                          ex., file:/usr/home/oracle/WALLETS
--   p_wallet_pwd           The password to access the wallet
--
    p_url               in varchar2,
    p_action            in varchar2 default null,
    p_version           in varchar2 default '1.1',
    p_envelope          in clob,
    p_username          in varchar2 default null,
    p_password          in varchar2 default null,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number default 180,
    p_wallet_path       in varchar2 default null,
    p_wallet_pwd        in varchar2 default null ) return sys.xmltype;

function make_rest_request(
--
-- This function invokes a RESTful Web service with the supplied name value pairs, body clob, or body blob
-- the response as an clob.
--
-- Arguments:
--   p_url                  The url endpoint of the Web service
--   p_http_method          The HTTP Method to use, PUT, POST, GET, HEAD or DELETE
--   p_username             The username if basic authentication is required for this service
--   p_password             The password if basic authentication is required for this service
--   p_scheme               The authentication scheme, Basic (default) or AWS
--   p_proxy_override       The proxy to use for the request

--   p_body                 The HTTP payload to be sent as clob
--   p_body_blob            The HTTP payload to be sent as binary blob (ex., posting a file)
--   p_parm_name            The name of the parameters to be used in name/value pairs
--   p_parm_value           The value of the paramters to be used in name/value pairs
--   p_wallet_path          The filesystem path to a wallet if request is https
--                          ex., file:/usr/home/oracle/WALLETS
--   p_wallet_pwd           The password to access the wallet
--
    p_url               in varchar2,
    p_http_method       in varchar2,
    p_username          in varchar2 default null,
    p_password          in varchar2 default null,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number default 180,
    p_body              in clob default empty_clob(),
    p_body_blob         in blob default empty_blob(),
    p_parm_name         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_wallet_path       in varchar2 default null,
    p_wallet_pwd        in varchar2 default null ) return clob;

function make_rest_request_b(
--
-- This function invokes a RESTful Web service with the supplied name value pairs, body clob, or body blob
-- the response as a blob.
--
-- Arguments:
--   p_url                  The url endpoint of the Web service
--   p_http_method          The HTTP Method to use, PUT, POST, GET, HEAD or DELETE
--   p_username             The username if basic authentication is required for this service
--   p_password             The password if basic authentication is required for this service
--   p_scheme               The authentication scheme, Basic (default) or AWS
--   p_proxy_override       The proxy to use for the request
--   p_body                 The HTTP payload to be sent as clob
--   p_body_blob            The HTTP payload to be sent as binary blob (ex., posting a file)
--   p_parm_name            The name of the parameters to be used in name/value pairs
--   p_parm_value           The value of the paramters to be used in name/value pairs
--   p_wallet_path          The filesystem path to a wallet if request is https
--                          ex., file:/usr/home/oracle/WALLETS
--   p_wallet_pwd           The password to access the wallet
--
    p_url               in varchar2,
    p_http_method       in varchar2,
    p_username          in varchar2 default null,
    p_password          in varchar2 default null,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number default 180,
    p_body              in clob default empty_clob(),
    p_body_blob         in blob default empty_blob(),
    p_parm_name         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_wallet_path       in varchar2 default null,
    p_wallet_pwd        in varchar2 default null ) return blob;

function parse_xml (
--
-- This function returns a particular node of an xml document and returns it as
-- a varchar.
--
-- Arguments:
--   p_xml                  The xmldocument as an sys.xmltype to parse
--   p_xpath                The xPath to the desired node
--   p_ns                   The namespace to the desired node
    p_xml               in sys.xmltype,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) return varchar2;

function parse_xml_clob (
--
-- This function returns a particular node of an xml document and returns it as
-- a clob.
--
-- Arguments:
--   p_xml                  The xmldocument as an sys.xmltype to parse
--   p_xpath                The xPath to the desired node
--   p_ns                   The namespace to the desired node
    p_xml               in sys.xmltype,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) return clob;

function parse_response (
--
-- This function converts the clob001 column of passed collection to an sys.xmltype
-- and then returns a particular node of that document.
--
-- Arguments:
--   p_collection_name      The name of the collection that has the xml document
--   p_xpath                The xPath to the desired node
--   p_ns                   The namespace to the desired node
    p_collection_name   in varchar2,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) return varchar2;

function parse_response_clob (
--
-- This function converts the clob001 column of passed collection to an sys.xmltype
-- and then returns a particular node of that document.
--
-- Arguments:
--   p_collection_name      The name of the collection that has the xml document
--   p_xpath                The xPath to the desired node
--   p_ns                   The namespace to the desired node
    p_collection_name   in varchar2,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) return clob;


end wwv_flow_webservices_api;
/
show errors
