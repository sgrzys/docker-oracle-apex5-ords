set define off
set verify off

prompt ...wwv_flow_combined_file
create or replace package wwv_flow_combined_file as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_combined_file.sql
--
--    DESCRIPTION
--      This package contains utility functions for combined files.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      01/14/2014 - Created
--
--------------------------------------------------------------------------------
--
--
--==============================================================================
-- Returns the name of the combined file if p_url is contained in its configuration.
--==============================================================================
function get_file_url (
    p_url in varchar2 )
    return varchar2;
--
--==============================================================================
-- Procedure loads the combined files configuration and stores it into an internal
-- cache.
--==============================================================================
procedure load;
--
--==============================================================================
-- Clears the buffered JavaScript code.
--==============================================================================
procedure reset;
--
end wwv_flow_combined_file;
/
show errors

set define '^'
