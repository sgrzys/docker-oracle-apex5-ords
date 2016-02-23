set define '^' verify off
prompt ...wwv_flow_t_dbms_output_writer.sql
create or replace type wwv_flow_t_dbms_output_writer under wwv_flow_t_writer (
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_t_dbms_output_writer.sql
--
--    DESCRIPTION
--      Object type that writes to dbms_output.
--
--    EXAMPLE
--      declare
--          l_writer apex_t_writer := apex_t_dbms_output_writer();
--      begin
--          l_writer.prn('hello');
--          l_writer.p(' Oracle');
--          l_writer.flush;
--      end;
--
--    SEE ALSO
--      type apex_t_writer: parent type
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    01/16/2014 - Created
--    cneumuel    12/02/2014 - Use flush instead of prn_internal, because that one is now final in wwv_flow_t_writer
--
--------------------------------------------------------------------------------

--==============================================================================
constructor function wwv_flow_t_dbms_output_writer (
    self           in out nocopy wwv_flow_t_dbms_output_writer )
    return self as result,

--==============================================================================
-- write any pending changes to dbms_output
--==============================================================================
overriding member procedure flush (
    self in out nocopy wwv_flow_t_dbms_output_writer )

);
/
show err

