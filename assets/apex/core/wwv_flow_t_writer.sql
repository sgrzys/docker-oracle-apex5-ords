set define '^' verify off
prompt ...wwv_flow_t_writer.sql
create or replace type wwv_flow_t_writer as object (
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_t_writer.sql
--
--    DESCRIPTION
--      Object type that can write to some resource. This is the root of a type
--      hierarchy. Only the subtypes are instantiable.
--
--    EXAMPLE
--      procedure print_data(p_writer in out nocopy apex_t_writer)
--      is
--      begin
--          -- 'Hello Oracle'||chr(10)
--          p_writer.prn('Hello');
--          p_writer.p(' Oracle');
--          -- 'Hello "APEX"'||chr(10)
--          p_writer.prnf('Hello "%s"%s', 'APEX', chr(10));
--      end;
--
--    SEE ALSO
--      type apex_t_clob_writer: subtype which writes to a clob
--      type apex_t_blob_writer: subtype which writes to a blob
--      type apex_t_htp_writer: subtype which writes via sys.htp
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    08/22/2013 - Created
--    cneumuel    12/02/2014 - Made p% and prn% members final, because calling is faster
--
--------------------------------------------------------------------------------

--==============================================================================
-- internal attributes for buffering output (may not be used by all subtypes)
--==============================================================================
l_temp        varchar2(32767 byte),
l_temp_length number,

--==============================================================================
-- constructor
--==============================================================================
constructor function wwv_flow_t_writer (
    self in out nocopy wwv_flow_t_writer )
    return self as result,

--==============================================================================
-- free the resource
--==============================================================================
member procedure free (
    self in out nocopy wwv_flow_t_writer ),

--==============================================================================
-- write any pending changes, in case the writer does caching
--==============================================================================
member procedure flush (
    self in out nocopy wwv_flow_t_writer ),

--==============================================================================
-- internal prn routine - do not use directly
--==============================================================================
final member procedure prn_internal (
    self          in out nocopy wwv_flow_t_writer,
    p_text        in varchar2,
    p_text_length in number ),

--==============================================================================
-- write a string, without line break
--==============================================================================
final member procedure prn (
    self   in out nocopy wwv_flow_t_writer,
    p_text in varchar2 ),

--==============================================================================
-- write a clob, without line break
--==============================================================================
final member procedure prn (
    self   in out nocopy wwv_flow_t_writer,
    p_text in clob ),

--==============================================================================
-- write a formatted string, without line break (simplified fprintf)
--
-- every i-th position of '%s' in p_text gets replaced by the p<i-1>. For
-- example,
--
--   l_writer.prnf('Hello %s Version "%d"', 'APEX', 5);
--
-- is equivalent to
--
--   l_writer.prn('Hello '||'APEX'||' Version "'||5||'"');
--
-- but easier to read. Further, every pi and p_text can be up to 32k, while
-- concatenation of long varchar2 might cause an error.
--==============================================================================
final member procedure prnf (
    self   in out nocopy wwv_flow_t_writer,
    p_text in varchar2,
    p0     in varchar2,
    p1     in varchar2 default null,
    p2     in varchar2 default null,
    p3     in varchar2 default null,
    p4     in varchar2 default null,
    p5     in varchar2 default null,
    p6     in varchar2 default null,
    p7     in varchar2 default null,
    p8     in varchar2 default null,
    p9     in varchar2 default null ),

--==============================================================================
-- write a string, and a line break
--==============================================================================
final member procedure p (
    self   in out nocopy wwv_flow_t_writer,
    p_text in varchar2 ),

--==============================================================================
-- write a clob, and a line break
--==============================================================================
final member procedure p (
    self   in out nocopy wwv_flow_t_writer,
    p_text in clob ),

--==============================================================================
-- write a formatted string, with line break (simplified fprintf)
--
-- every i-th position of '%s' in p_text gets replaced by the p<i-1>. For
-- example,
--
--   l_writer.p('Hello %s Version "%d"', 'APEX', 5);
--
-- is equivalent to
--
--   l_writer.p('Hello '||'APEX'||' Version "'||5||'"');
--
-- but easier to read. Further, every pi and p_text can be up to 32k, while
-- concatenation of long varchar2 might cause an error.
--==============================================================================
final member procedure pf (
    self   in out nocopy wwv_flow_t_writer,
    p_text in varchar2,
    p0     in varchar2,
    p1     in varchar2 default null,
    p2     in varchar2 default null,
    p3     in varchar2 default null,
    p4     in varchar2 default null,
    p5     in varchar2 default null,
    p6     in varchar2 default null,
    p7     in varchar2 default null,
    p8     in varchar2 default null,
    p9     in varchar2 default null )

) not instantiable not final;
/
show err
