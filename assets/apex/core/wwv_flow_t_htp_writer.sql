set define '^' verify off
prompt ...wwv_flow_t_htp_writer.sql
create or replace type wwv_flow_t_htp_writer under wwv_flow_t_writer (
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_t_htp_writer.sql
--
--    DESCRIPTION
--      apex_t_writer type that writes via sys.htp. the output is buffered. if
--      code also uses the sys.htp APIs directly, flush() needs to be called
--      to write the buffer out to sys.htp.
--
--    SEE ALSO
--      type apex_t_writer: parent type
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    08/22/2013 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- constructor
--
-- EXAMPLE
--
-- declare
--     l_writer apex_t_htp_writer := apex_t_htp_writer();
-- begin
--     l_writer.p('hello world');
--     l_writer.flush;
--     sys.htp.p('direct output - flush of buffered writer necessary');
--     l_writer.p('continue in buffered mode');
--     l_writer.flush;
-- end;
--==============================================================================
constructor function wwv_flow_t_htp_writer (
    self           in out nocopy wwv_flow_t_htp_writer )
    return self as result,

--==============================================================================
-- write pending changes via htp.prn
--==============================================================================
overriding member procedure flush (
    self in out nocopy wwv_flow_t_htp_writer )
)
/
show err

