set define '^' verify off
prompt ...wwv_flow_t_blob_writer.sql
create or replace type wwv_flow_t_blob_writer under wwv_flow_t_writer (
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_t_blob_writer.sql
--
--    DESCRIPTION
--      apex_t_writer type that writes to a blob
--
--    SEE ALSO
--      type apex_t_writer: parent type
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    08/22/2013 - Created
--    cneumuel    11/10/2014 - Defer createTemporary to flush procedure. if called in constructor, this leaks an empty lob
--
--------------------------------------------------------------------------------

--==============================================================================
-- input and output character sets
--==============================================================================
l_from_charset    varchar2(100),
l_to_charset      varchar2(100),
l_need_convert_01 number,
l_cache_01        number,
l_dur             number,
--==============================================================================
-- the blob value
--==============================================================================
l_blob            blob,

--==============================================================================
-- constructor that creates a temporary blob
--
-- ARGUMENTS
-- * p_from_charset the character set of input data that gets passed to p or prn
--                  defaults to wwv_flow_lang.get_db_charset
-- * p_to_charset   the character set of data that gets written to l_blob
--                  defaults to 'american_america.al32utf8'
-- * p_cache        parameter to dbms_lob.createtemporary
-- * p_dur          parameter to dbms_lob.createtemporary
--                  defaults to dbms_lob.call
--
-- EXAMPLE: writing to a stored blob
--
-- declare
--     l_writer apex_t_blob_writer := apex_t_blob_writer();
-- begin
--     select my_blob into l_writer.l_blob
--       from my_table
--      where id = 1;
--     --
--     l_writer.p('directly updating my_table.my_blob');
--     l_writer.flush;
-- end;
--
-- EXAMPLE: using a temporary lob
--
-- declare
--     l_writer apex_t_blob_writer := apex_t_blob_writer(p_cache=>true);
-- begin
--     l_writer.p('hello world');
--     l_writer.flush;
--
--     sys.htp.init;
--     sys.owa_util.mime_header('text/plain', false);
--     sys.htp.p('Content-Disposition: attachment; filename="greeting.txt"');
--     sys.owa_util.http_header_close;
--     sys.wpg_docload.download_file(l_writer.l_blob);
--     apex_application.stop_apex_engine;
-- end;
--==============================================================================
constructor function wwv_flow_t_blob_writer (
    self           in out nocopy  wwv_flow_t_blob_writer,
    p_from_charset in varchar2    default null,
    p_to_charset   in varchar2    default 'american_america.al32utf8',
    p_cache        in boolean     default true,
    p_dur          in pls_integer default null )
    return self as result,

--==============================================================================
-- free the temporary blob
--==============================================================================
overriding member procedure free (
    self in out nocopy wwv_flow_t_blob_writer ),

--==============================================================================
-- write any pending changes to l_blob
--==============================================================================
overriding member procedure flush (
    self in out nocopy wwv_flow_t_blob_writer ),

--==============================================================================
-- flush changes and return the blob value
--==============================================================================
member function get_value (
    self in out nocopy wwv_flow_t_blob_writer )
    return blob
)
/
show err

