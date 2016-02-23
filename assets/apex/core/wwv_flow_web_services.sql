set define '^'
set verify off
prompt ...wwv_flow_web_services


Rem  Copyright (c) Oracle Corporation 2002. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_web_services.sql
Rem
Rem    DESCRIPTION
Rem      Flow Web Services
Rem
Rem    NOTES
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   07/23/2002 - Created
Rem      jkallman   08/05/2002 - Added parse
Rem      jkallman   08/07/2002 - Added get_error_code, get_error_message, print_rendered_result
Rem      jkallman   08/08/2002 - Added parmeters to make_request
Rem      jkallman   08/09/2002 - Added get_last_error_code, get_last_error_message
Rem      mhichwa    08/25/2002 - Added grant execute to public
Rem      jstraub    04/21/2004 - Added UDDI_request, find_proxy, find_services_by_busname,
Rem                              find_services_by_servname, get_service_details, WSDL_analyze,
Rem                              create_web_service to add UDDI browsing and improved web services features.
Rem      jstraub    04/23/2004 - Added second make_request procedure to support new process type
Rem      jstraub    05/05/2004 - Added get_path, and append element to dynamically build xpath and request envelope
Rem      jstraub    05/07/2004 - Added update_process_parms to support updating process of type web service
Rem      jstraub    05/14/2004 - Significantly changed the way paramaters relate, using ID instead of name, and changed parsing of response
Rem      jstraub    05/17/2004 - Added p_in_msg_style parameters to generate_body and append_element
Rem      jstraub    05/17/2004 - Added p_level parameter to get_path to support getting partial paths
Rem      jstraub    05/20/2004 - Added generate_query
Rem      jstraub    06/02/2004 - Added generate_header and append_element2 to support soap:header
Rem      jstraub    08/20/2004 - Added p_type to append_element and append_element2
Rem      jstraub    11/16/2006 - Added p_soap_style to create_web_service
Rem      jstraub    11/17/2006 - Added p_style to generate_envelope
Rem      jstraub    12/11/2006 - Added p_username and p_password to WSDL_analyze to support basic auth for 11g XDB Web services
Rem      jstraub    12/12/2006 - Added p_basic_auth to create_web_service to support basic auth for 11g XDB Web services
Rem      jstraub    12/12/2006 - Added p_username and p_password to function make_request to support basic auth
Rem      jstraub    12/15/2006 - Added p_wallet_path and p_wallet_pwd to make_request to support SSL (HTTPS)
Rem      jstraub    12/15/2006 - Added get_wallet_info to support SSL (HTTPS)
Rem      jstraub    12/22/2006 - Added create_auth_parms for basic auth support
Rem      jstraub    01/03/2006 - Removed get_wallet_info, no longer necessary since wallet info now platform preference
Rem      jstraub    01/05/2006 - Added generate_query_manual to support manual web references
Rem      jstraub    01/16/2009 - Added p_soap_style to append_element, append_element2, generate_body, generate_header (bug 7718753)
Rem      jstraub    03/27/2009 - Removed p_01 to p_10 parameters from make_request
Rem      jstraub    03/27/2009 - Removed obsolete generate_envelope functions
Rem      jstraub    04/02/2009 - Removed obsolete get_error_code, get_error_message, get_last_error_code
Rem      jstraub    06/03/2009 - Added create_rest_web_reference, make_rest_request, update_rest_web_reference
Rem      jstraub    06/09/2009 - Added p_xmlns parameter to create_rest_web_reference, update_rest_web_reference
Rem      jstraub    06/10/2009 - Added p_http_hdr_values to make_rest_request
Rem      jstraub    07/27/2009 - Added p_input_format and p_body to create_rest_web_reference to support other REST input types than name/value pairs
Rem      jstraub    08/13/2009 - Added p_body_blob() to make_rest_request to support file input type
Rem      jstraub    08/24/2009 - Added make_soap_request to consolidate sys.UTL_HTTP SOAP logic
Rem      jstraub    01/11/2010 - Added p_soap_version to create_web_service
Rem      jstraub    01/11/2010 - Added p_version to generate_envelope
Rem      jstraub    03/01/2010 - Added p_form_qualified to append_element and append_element2
Rem      jstraub    05/18/2011 - Added p_transfer_timeout to make_rest_request and make_soap_request (bug 11886970)
Rem      cneumuel   04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem      jstraub    04/09/2014 - Added function make_rest_request_b returning BLOB
Rem      jstraub    04/09/2014 - Added p_scheme for auth type in make_request, make_rest_request*, make_soap_request


create or replace package wwv_flow_web_services as

    --------------------------------------------------
    -- globals for response, clob and sys.xmltype
    --
    type flow_soap_response_clob    is table of clob index by binary_integer;
    g_flow_soap_response_clob       flow_soap_response_clob;

    type flow_soap_response_xmltype is table of sys.xmltype index by binary_integer;
    g_flow_soap_response_xmltype    flow_soap_response_xmltype;

    type flow_soap_idx              is table of number index by binary_integer;
    g_flow_soap_idx                 flow_soap_idx;

    g_flow_soap_error_code          sys.dbms_sql.varchar2_table;
    g_flow_soap_error_message       sys.dbms_sql.varchar2_table;

    empty_vc_arr                    wwv_flow_global.vc_arr2;
    g_body                          varchar2(32000);
    g_header                        varchar2(32000);

function generate_envelope(
    p_operation in varchar2,
    p_style     in varchar2,
    p_ns        in varchar2,
    p_version   in varchar2 default '1.1',
    p_body      in clob,
    p_header    in clob )
return clob;

function make_request(
    p_url            in varchar2,
    p_action         in varchar2,
    p_version        in varchar2 default '1.1',
    p_envelope       in clob,
    p_username       in varchar2,
    p_password       in varchar2,
    p_scheme         in varchar2 default 'Basic',
    p_proxy_override in varchar2 default null,
    p_charset        in varchar2 default null,
    p_wallet_path    in varchar2,
    p_wallet_pwd     in varchar2 )
return clob;

function make_rest_request(
    p_url               in varchar2,
    p_http_method       in varchar2,
    p_username          in varchar2,
    p_password          in varchar2,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number default 180,
    p_body              in clob default empty_clob(),
    p_body_blob         in blob default empty_blob(),
    p_parm_name         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_http_headers      in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_http_hdr_values   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_wallet_path       in varchar2,
    p_wallet_pwd        in varchar2 )
return clob;

function make_rest_request_b(
    p_url               in varchar2,
    p_http_method       in varchar2,
    p_username          in varchar2,
    p_password          in varchar2,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number default 180,
    p_body              in clob default empty_clob(),
    p_body_blob         in blob default empty_blob(),
    p_parm_name         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_http_headers      in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_http_hdr_values   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_wallet_path       in varchar2,
    p_wallet_pwd        in varchar2 )
return blob;

function make_soap_request(
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
    p_wallet_pwd        in varchar2 default null,
    p_http_headers      in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_http_hdr_values   in wwv_flow_global.vc_arr2 default empty_vc_arr
)
return clob;

procedure make_request(
    p_id             in number,
    p_process_id     in number,
    p_charset        in varchar2 default null );

procedure make_request(
    p_id             in number,
    p_operation_id   in number,
    p_process_id     in number,
    p_charset        in varchar2 default null );

function render_request(
    p_service_id     in number,
    p_stylesheet     in clob   default null,
    p_occurrence     in number default 1,
    p_stylesheet_id  in number default null)
return clob;

procedure print_rendered_result(
    p_service_id     in number,
    p_stylesheet     in clob   default null,
    p_occurrence     in number default 1,
    p_stylesheet_id  in number default null );

function parse( p_clob in clob )
return clob ;

function get_last_error_message
return varchar2;

function find_proxy(
    p_flow_id   in varchar2)
return varchar2;

function get_parm_value(
    p_parm_id       in number,
    p_process_id    in number )
return varchar2;

function get_parm_value(
    p_name          in varchar2,
    p_parm_name     in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value    in wwv_flow_global.vc_arr2 default empty_vc_arr )
return varchar2;

procedure append_element(
    p_process_id        in number default null,
    p_parm_id           in number,
    p_name              in varchar2,
    p_is_xsd            in varchar2,
    p_form_qualified    in varchar2,
    p_type              in varchar2,
    p_operation_id      in number,
    p_in_msg_style      in varchar2,
    p_soap_style        in varchar2,
    p_parm_name         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value        in wwv_flow_global.vc_arr2 default empty_vc_arr );

procedure append_element2(
    p_process_id        in number default null,
    p_parm_id           in number,
    p_name              in varchar2,
    p_is_xsd            in varchar2,
    p_form_qualified    in varchar2,
    p_type              in varchar2,
    p_operation_id      in number,
    p_in_msg_style      in varchar2,
    p_ns                in varchar2,
    p_soap_style        in varchar2,
    p_parm_name         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value        in wwv_flow_global.vc_arr2 default empty_vc_arr );

procedure generate_body(
    p_process_id    in number default null,
    p_operation_id  in number,
    p_in_msg_style  in varchar2,
    p_soap_style    in varchar2,
    p_parm_name     in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value    in wwv_flow_global.vc_arr2 default empty_vc_arr );

procedure generate_header(
    p_process_id    in number default null,
    p_operation_id  in number,
    p_in_msg_style  in varchar2,
    p_ns            in varchar2,
    p_soap_style    in varchar2,
    p_parm_name     in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value    in wwv_flow_global.vc_arr2 default empty_vc_arr );

function get_path(
    p_parm_id       in number,
    p_level         in number default 0 )
return varchar2;

function generate_query(
    p_operation_id              in number,
    p_array_parm                in number,
    p_report_collection_name    in varchar2,
    p_array_parms_collection    in varchar2 )
return varchar2;

function generate_query_manual(
    p_result_node               in varchar2,
    p_soap_style                in varchar2,
    p_message_format            in varchar2,
    p_namespace                 in varchar2,
    p_report_collection_name    in varchar2,
    p_array_parms_collection    in varchar2 )
return varchar2;

function UDDI_request(
    p_uddi_url              in varchar2,
    p_request_type          in varchar2,
    p_request_parameter     in varchar2,
    p_proxy_url             in varchar2,
    p_request_parameter2    in varchar2 default null,
    p_uddi_version          in varchar2 default '2.0' )
return sys.xmltype;

procedure find_services_by_servname(
    p_uddi_url              in varchar2,
    p_request_parameter2    in varchar2,
    p_flow_id               in varchar2,
    p_services_collection   in varchar2,
    p_exact                 in varchar2 default 'N',
    p_case_sensitive        in varchar2 default 'N',
    p_uddi_version          in varchar2 default '2.0' );

procedure find_services_by_busname(
    p_uddi_url              in varchar2,
    p_request_parameter     in varchar2,
    p_flow_id               in varchar2,
    p_services_collection   in varchar2,
    p_exact                 in varchar2 default 'N',
    p_case_sensitive        in varchar2 default 'N',
    p_uddi_version          in varchar2 default '2.0' );

procedure get_service_details(
    p_uddi_url              in varchar2,
    p_request_parameter     in varchar2,
    p_flow_id               in varchar2,
    p_services_collection   in varchar2,
    p_details_collection    in varchar2,
    p_uddi_version          in varchar2 default '2.0' );

function WSDL_analyze(
    p_wsdl_url                      in varchar2,
    p_flow_id                       in varchar2,
    p_uddi_details_collection       in varchar2,
    p_web_service_collection        in varchar2,
    p_operations_collection         in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_username                      in varchar2,
    p_password                      in varchar2 )
return varchar2;

procedure create_web_service(
    p_id                            in number,
    p_flow_id                       in varchar2,
    p_name                          in varchar2,
    p_url                           in varchar2,
    p_target_ns                     in varchar2,
    p_xsd_prefix                    in varchar2,
    p_soap_style                    in varchar2,
    p_soap_version                  in varchar2 default '1.1',
    p_operations_collection         in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_basic_auth                    in varchar2 );

procedure create_rest_web_reference(
    p_id                            in number,
    p_flow_id                       in varchar2,
    p_name                          in varchar2,
    p_url                           in varchar2,
    p_proxy_override                in varchar2,
    p_http_method                   in varchar2,
    p_input_format                  in varchar2,
    p_body                          in varchar2,
    p_output_format                 in varchar2,
    p_xpath                         in varchar2,
    p_xmlns                         in varchar2,
    p_text_parm_delim               in varchar2,
    p_text_record_delim             in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_headers_collection            in varchar2,
    p_basic_auth                    in varchar2 );

procedure update_rest_web_reference(
    p_id                            in number,
    p_flow_id                       in varchar2,
    p_name                          in varchar2,
    p_url                           in varchar2,
    p_proxy_override                in varchar2,
    p_http_method                   in varchar2,
    p_input_format                  in varchar2,
    p_body                          in varchar2,
    p_output_format                 in varchar2,
    p_xpath                         in varchar2,
    p_xmlns                         in varchar2,
    p_text_parm_delim               in varchar2,
    p_text_record_delim             in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_headers_collection            in varchar2,
    p_basic_auth                    in varchar2 );

procedure update_process_parms(
    p_process_id                    in number,
    p_in_parm_ids                   in wwv_flow_global.vc_arr2,
    p_in_parm_map_types             in wwv_flow_global.vc_arr2,
    p_in_parm_values                in wwv_flow_global.vc_arr2,
    p_out_map_type                  in varchar2,
    p_out_parm_ids                  in wwv_flow_global.vc_arr2,
    p_out_parm_values               in wwv_flow_global.vc_arr2,
    p_auth_parm_ids                 in wwv_flow_global.vc_arr2,
    p_auth_parm_map_types           in wwv_flow_global.vc_arr2,
    p_auth_parm_values              in wwv_flow_global.vc_arr2 );

procedure create_process_parms(
    p_process_id                    in number,
    p_in_parm_collection_name       in varchar2,
    p_out_map_type                  in varchar2,
    p_out_parm_collection_name      in varchar2 );

procedure create_auth_parms(
    p_process_id                    in number,
    p_auth_collection_name       in varchar2 );

end wwv_flow_web_services;
/
show errors
