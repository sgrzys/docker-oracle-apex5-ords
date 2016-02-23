set define '^' verify off
prompt ...wwv_flow_advisor_checks_int.sql
create or replace package wwv_flow_advisor_checks_int authid definer
$if sys.dbms_db_version.version >= 12 $then
accessible by (wwv_flow_advisor_checks_api)
$end
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_advisor_checks_int.sql
--
--    DESCRIPTION
--      Internal advisor checks that directly go against the base tables.
--
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/22/2014 - Created
--    cneumuel    08/14/2014 - Added sql_injection
--
--------------------------------------------------------------------------------

--==============================================================================
-- checks for deprecated attributes of pages and page components 
--==============================================================================
procedure deprecated_attributes (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure sql_injection (
    p_application_id in number,
    p_page_id        in number default null );

end wwv_flow_advisor_checks_int;
/
show err

