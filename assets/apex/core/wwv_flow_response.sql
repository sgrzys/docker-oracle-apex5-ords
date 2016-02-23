set define '^' verify off
prompt ...wwv_flow_response.sql
create or replace package wwv_flow_response as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_response.sql
--
--    DESCRIPTION
--      APIs for HTTP response headers and downloads.
--
--      Contrary to the header-related procedures in sys.owa_util which
--      immediately call sys.htp, this package uses an internal buffer for http
--      headers. They can only be emitted by calling write_headers(). The APEX
--      engine automatically calls this procedure after the BEFORE HEADER
--      processes run. Together with the option to overwrite a previously added
--      header, this allows the engine and application code to add headers at
--      more places, not only during BEFORE HEADER.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    01/17/2014 - Created
--    cneumuel    04/17/2014 - Renamed download_and_stop to download
--    cneumuel    07/15/2014 - Added x_frame_options
--
--------------------------------------------------------------------------------

--==============================================================================
-- HTTP status codes
--==============================================================================
subtype t_status is pls_integer range 100 .. 999;
c_continue                   constant t_status := 100;
c_switching_protocols        constant t_status := 101;
--
c_ok                         constant t_status := 200;
c_created                    constant t_status := 201;
c_accepted                   constant t_status := 202;
c_non_authoritative_info     constant t_status := 203;
c_no_content                 constant t_status := 204;
c_reset_content              constant t_status := 205;
c_partial_content            constant t_status := 206;
--
c_moved_permanently          constant t_status := 301;
c_found                      constant t_status := 302;
c_see_other                  constant t_status := 303;
c_not_modified               constant t_status := 304;
c_use_proxy                  constant t_status := 305;
c_temporary_redirect         constant t_status := 307;
--
c_bad_request                constant t_status := 400;
c_unauthorized               constant t_status := 401;
c_payment_required           constant t_status := 402;
c_forbidden                  constant t_status := 403;
c_not_found                  constant t_status := 404;
c_method_not_allowed         constant t_status := 405;
c_not_acceptable             constant t_status := 406;
c_proxy_auth_required        constant t_status := 407;
c_request_timeout            constant t_status := 408;
c_conflict                   constant t_status := 409;
c_gone                       constant t_status := 410;
c_length_required            constant t_status := 411;
c_precondition_failed        constant t_status := 412;
c_request_entity_too_large   constant t_status := 413;
c_request_uri_too_long       constant t_status := 414;
c_unsupported_media_type     constant t_status := 415;
c_requested_range_not_satisf constant t_status := 416;
c_expectation_failed         constant t_status := 417;
c_i_am_a_teapot              constant t_status := 418;
--
c_internal_server_error      constant t_status := 500;
c_not_implemented            constant t_status := 501;
c_bad_gateway                constant t_status := 502;
c_service_unavailable        constant t_status := 503;
c_gateway_timeout            constant t_status := 504;
c_http_version_not_supported constant t_status := 505;

--==============================================================================
-- reset the response buffer (via htp.init) and optionally clear header buffer.
--
-- ARGUMENTS
-- * p_keep_sticky_headers  if true (the default) then all headers that were
--                          added with header(p_is_sticky=>true) and cookie()
--                          below will be kept. if false, they will be removed.
--
-- EXAMPLE
-- begin
--     apex_response.reset;
-- end;
--==============================================================================
procedure reset (
    p_keep_sticky_headers in boolean default true );

--==============================================================================
-- add/overwrite a response header
--
-- ARGUMENTS
-- * p_name                 the header name
-- * p_value                the header value
-- * p_overwrite            if true, overwrites an existing header with the
--                          same name. if false or no such header has been added
--                          yet, append this one.
-- * p_is_sticky            if true, the header wiill be kept on reset. if
--                          false (the default), it will be removed on reset.
--
-- EXAMPLE
-- begin
--     apex_response.header (
--         p_name  => 'X-Content-Type-Options',
--         p_value => 'nosniff' );
-- end;
--==============================================================================
procedure header (
    p_name      in varchar2,
    p_value     in varchar2,
    p_overwrite in boolean default true,
    p_is_sticky in boolean default false );

--==============================================================================
-- remove a response header
--
-- ARGUMENTS
-- * p_name                 the header name
--
-- EXAMPLE
-- begin
--     apex_response.remove_header (
--         p_name => 'X-Frame-Options' );
-- end;
--==============================================================================
procedure remove_header (
    p_name      in varchar2 );

--==============================================================================
-- add/overwrite the response status header
--
-- ARGUMENTS
-- * p_code                 the status code
-- * p_reason               an optional reason phrase
--
-- EXAMPLE
-- begin
--     if sys.owa_util.get_cgi_env('REMOTE_ADDR') <> '127.0.0.1' then
--         apex_response.status (
--             p_code => apex_response.c_forbidden );
--         apex_application.stop_apex_engine;
--     end if;
-- end;
--==============================================================================
procedure status (
    p_code     in t_status,
    p_reason   in varchar2 default null );

--==============================================================================
-- add/overwrite the mime header
--
-- ARGUMENTS
-- * p_content_type         the content type
--
-- EXAMPLE
-- begin
--     apex_response.mime (
--         p_content_type => 'text/xml' );
--     apex_response.write_headers;
--     sys.htp.p('<tag>data</tag>');
-- end;
--==============================================================================
procedure mime (
    p_content_type in varchar2 default 'text/html' );

--==============================================================================
-- add/overwrite the cache-control header
--
-- ARGUMENTS
-- * p_enabled              if true (the default), add cache-control headers
--
-- EXAMPLE
-- begin
--     apex_response.cache_control;
--     apex_response.write_headers;
-- end;
--==============================================================================
procedure cache_control (
    p_enabled in boolean default true );

--==============================================================================
-- add/overwrite the x-frame-options header
--
-- ARGUMENTS
-- * p_value                header variable value. the value D stands for DENY,
--                          S for SAMEORIGIN.
--==============================================================================
procedure x_frame_options (
    p_value in varchar2 );

--==============================================================================
-- add/overwrite a cookie
--
-- ARGUMENTS
-- * p_name                 the cookie name
-- * p_value                the cookie value
-- * p_expires              if null (the default), the cookie will be session
--                          based. otherwise, the cookie will be persistent and
--                          live until the specified date.
-- * p_path                 the cookie path (default null)
-- * p_domain               the cookie domain (default null)
-- * p_secure               if true, the browser will only send the cookie on
--                          HTTPS requests. The default depends on the
--                          application's authentication scheme.
-- * p_httponly             if true (the default), the cookie value will only be
--                          available on the server and not in JavaScript.
--
-- EXAMPLE
-- begin
--     apex_response.cookie (
--         p_name    => 'my-tracking-cookie',
--         p_value   => 'something',
--         p_expires => add_months(sysdate, 1) );
-- end;
--==============================================================================
procedure cookie (
    p_name     in varchar2,
    p_value    in varchar2,
    p_expires  in date     default null,
    p_path     in varchar2 default null,
    p_domain   in varchar2 default null,
    p_secure   in boolean  default null,
    p_httponly in boolean  default true );

--==============================================================================
-- emit all buffered http headers
--
-- ARGUMENTS
-- * p_close_header_section if true (the default), write a newline that ends
--                          the http header section, so subsequent calls to
--                          sys.htp.p can be used to write the page body.
--
-- EXAMPLE
-- begin
--     apex_response.mime (
--         p_content_type => 'text/xml' );
--     apex_response.write_headers;
--     sys.htp.p('<tag>data</tag>');
-- end;
--==============================================================================
procedure write_headers (
    p_close_header_section in boolean default true );

--==============================================================================
-- reset buffer and emit all buffered http headers
--
-- ARGUMENTS
-- * p_close_header_section if true (the default), write a newline that ends
--                          the http header section, so subsequent calls to
--                          sys.htp.p can be used to write the page body.
--
-- EXAMPLE
-- begin
--     sys.htp.p('something');
--     if special_case then
--         apex_response.mime (
--             p_content_type => 'text/xml' );
--         apex_response.reset_and_write_headers;
--         sys.htp.p('<special>xx</special>');
--         apex_application.stop_apex_engine;
--     end if;
-- end;
--==============================================================================
procedure reset_and_write_headers (
    p_close_header_section in boolean default true );

--==============================================================================
-- utility procedure to reset the buffer, redirect and stop the APEX engine.
--
-- ARGUMENTS
-- * p_location             the location to redirect to
-- * p_status               the HTTP status return code (default is 302 - found).
-- * p_reset                if true (the default), call reset() before writing
--                          the location headers.
--
-- EXAMPLE
-- begin
--     apex_response.redirect_and_stop (
--         p_location => 'https://apex.oracle.com',
--         p_status   => apex_response.c_moved_permanently );
-- end;
--==============================================================================
procedure redirect_and_stop (
    p_location in varchar2,
    p_status   in t_status default c_found,
    p_reset    in boolean  default true );

--==============================================================================
-- utility procedure to reset the buffer and download a clob to the browser.
--
-- ARGUMENTS
-- * p_content_type         the mime type of the file
-- * p_clob                 the clob value that will be downloaded
-- * p_is_inline            if true, display the file inline in the browser
--                          window. if false (the default), make the browser
--                          raise a file download dialog box to save the file.
-- * p_filename             if a value is given, this is the default filename
--                          in the browser.
-- * p_reset                if true (the default), call reset() before writing
--                          any headers.
--
-- EXAMPLE
-- begin
--     for i in ( select * from my_files where name=:P1_DOWNLOAD_FILE ) loop
--         apex_response.download (
--             p_content_type => i.mime_type,
--             p_clob         => i.clob_value,
--             p_filename     => i.name );
--     end loop;
-- end;
--==============================================================================
procedure download (
    p_content_type in varchar2,
    p_clob         in out nocopy clob,
    p_is_inline    in boolean  default false,
    p_filename     in varchar2 default null,
    p_reset        in boolean  default true );

--==============================================================================
-- utility procedure to reset the buffer, download a blob to the browser.
--
-- ARGUMENTS
-- * p_content_type         the mime type of the file
-- * p_blob                 the blob value that will be downloaded
-- * p_is_inline            if true, display the file inline in the browser
--                          window. if false (the default), make the browser
--                          raise a file download dialog box to save the file.
-- * p_filename             if a value is given, this is the default filename
--                          in the browser.
-- * p_reset                if true (the default), call reset() before writing
--                          any headers.
--
-- EXAMPLE
-- begin
--     for i in ( select * from my_files where name=:P1_DOWNLOAD_FILE ) loop
--         apex_response.download (
--             p_content_type => i.mime_type,
--             p_blob         => i.blob_value,
--             p_filename     => i.name );
--     end loop;
-- end;
--==============================================================================
procedure download (
    p_content_type in varchar2,
    p_blob         in out nocopy blob,
    p_is_inline    in boolean  default false,
    p_filename     in varchar2 default null,
    p_reset        in boolean  default true );

--==============================================================================
-- return the rows in the htp output buffer, using sys.htp.get_page.
--
-- ARGUMENTS
-- * p_include_headers   if true, include lines that form the http headers. the
--                       default is to not include the headers.
-- * p_include_body      if true, include the lines that form the http body. the
--                       default is to include the body.
--
-- EXAMPLE
-- declare
--     l_lines apex_t_varchar2;
-- begin
--     sys.htp.p('hello');
--     sys.htp.p('world');
--     l_lines := apex_response.get_output;
--     for i in 1 .. l_lines.count loop
--         sys.dbms_output.put_line('body line '||i||': '||l_lines(i));
--     end loop;
-- end;
--==============================================================================
function get_response (
    p_include_headers in boolean default false,
    p_include_body    in boolean default true )
    return wwv_flow_t_varchar2;

end wwv_flow_response;
/
show err

