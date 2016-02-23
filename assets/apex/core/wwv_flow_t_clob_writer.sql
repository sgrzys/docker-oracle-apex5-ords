set define '^' verify off
prompt ...wwv_flow_t_clob_writer.sql
create or replace type wwv_flow_t_clob_writer under wwv_flow_t_writer (
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_t_clob_writer.sql
--
--    DESCRIPTION
--      apex_t_writer type that writes to a clob
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
-- the clob value
--==============================================================================
l_clob     clob,
l_cache_01 number,
l_dur      number,

--==============================================================================
-- constructor that creates a temporary clob
--
-- EXAMPLE: create writer to temporary clob
--
-- declare
--     l_writer apex_t_clob_writer := apex_t_clob_writer(p_cache=>true);
-- begin
--     l_writer.p('updating l_writer''s cache');
--     dbms_output.put_line(l_writer.get_value);
--     l_writer.free;
-- end;
--
-- EXAMPLE: create clob writer and populate from table
--
-- declare
--     l_writer apex_t_clob_writer := apex_t_clob_writer();
-- begin
--     select my_clob into l_writer.l_clob
--       from my_table
--      where id = 1;
--     --
--     l_writer.p('directly updating my_table.my_clob');
-- end;
--==============================================================================
constructor function wwv_flow_t_clob_writer (
    self        in out nocopy wwv_flow_t_clob_writer,
    p_cache     in boolean     default true,
    p_dur       in pls_integer default null )
    return self as result,

--==============================================================================
-- free the temporary clob
--==============================================================================
overriding member procedure free (
    self in out nocopy wwv_flow_t_clob_writer ),

--==============================================================================
-- write any pending changes to l_clob
--==============================================================================
overriding member procedure flush (
    self in out nocopy wwv_flow_t_clob_writer ),

--==============================================================================
-- flush changes and return the clob value
--==============================================================================
member function get_value (
    self in out nocopy wwv_flow_t_clob_writer )
    return clob
)
/
show err
