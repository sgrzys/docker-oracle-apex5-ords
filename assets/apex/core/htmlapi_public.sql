set define '^'
set verify off
prompt ...wwv_flow_html_api

Rem    NAME
Rem      htmlapi_public.sql
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    Arguments:
Rem     1:  
Rem     2:
Rem     3:  Flow user
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     sdillon  05/24/2001 - Created
Rem     jkallman 08/18/2003 - Remove write_html (Bug 3063954)
Rem     sspadafo 09/11/2004 - Add remove_html overloaded procedure (Bug 3821504)
Rem     jkallman 03/27/2006 - Add support for p_file_charset (Bug 5116366)
Rem     sspadafo 06/24/2006 - Created as copy of htmlapi.sql. Package wwv_flow_html_api will now be only for publicly exposed entry points. (Bug 5308534)
Rem     pawolf   12/01/2010 - Bug# 9823391: Added p_flow_id to remove_html
Rem     cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem     pawolf   04/22/2013 - Deprecated APIs (feature ##1169)

create or replace package wwv_flow_html_api
as

--==============================================================================
-- *** API Deprecated, use wwv_flow_api.create_app_static_file and create_workspace_static_file instead ***
--==============================================================================
function new_html_repository_record(
    p_name                  in out varchar2,
    p_varchar2_table            in sys.dbms_sql.varchar2_table,
    p_mimetype                  in varchar2,
    p_flow_id                   in number,
    p_notes                     in varchar2)
    return number
    ;
    
--==============================================================================
-- *** API Deprecated ***
--==============================================================================
procedure remove_html(
    p_html_name in varchar2,
    p_flow_id   in number   default null)
    ;
end wwv_flow_html_api;
/
show error
