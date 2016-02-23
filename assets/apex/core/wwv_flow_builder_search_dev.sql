set define '^'
set verify off
prompt ...wwv_flow_builder_search_dev


create or replace package wwv_flow_builder_search_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_builder_search_dev.sql
--
--    DESCRIPTION
--      This package searches for strings in an Oracle APEX application.
--
--    RUNTIME DEPLOYMENT: NO
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      05/13/2009 - Created
--    pawolf      05/25/2009 - Added regexp support
--    pawolf      08/24/2009 - Refactored common functions to wwv_flow_dictionary
--    pawolf      02/27/2012 - Renamed packages wwv_flow_advisor to wwv_flow_advisor_dev, wwv_flow_dictionary to wwv_flow_dictionary_dev and wwv_flow_search to wwv_flow_builder_search_dev
--
--
--------------------------------------------------------------------------------
--
--==============================================================================
-- Searches in an application(s) for the specified string.
-- The application id and page id are optional.
--
-- If p_search_string is prefixed with regexp: the search string will be treated
-- as a regular expression.
--
-- Use the view wwv_flow_search_result to access the result.
--==============================================================================
procedure search_application (
    p_application_id in number   := null,
    p_page_id        in number   := null,
    p_case_sensitive in boolean  := false,
    p_search_string  in varchar2 );
--
END wwv_flow_builder_search_dev;
/
show errors
