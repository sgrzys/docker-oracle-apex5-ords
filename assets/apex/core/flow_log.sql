set define '^' verify off
prompt ...wwv_flow_log
create or replace package wwv_flow_log as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    DESCRIPTION
--      Flow activity logging
--
--    SECURITY
--
--    NOTES:
--      This program logs flow activity
--      p_elap:     Elapsed time in seconds
--      p_verbose:  Log all information not just most critical
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   08/04/1999 - Created
--      mhichwa   09/18/2001 - Exposed current log number function
--      mhichwa   12/05/2002 - Moved log interval to spec from body
--      mhichwa   06/20/2003 - added g_total_rows_fetched to improve log accuracy, bug 3018094
--      mhichwa   11/14/2008 - improved comments
--      mhichwa   05/12/2009 - added websheet_id, worksheet_id, ir_search columns
--      cbcho     05/12/2009 - Added g_worksheet_id, g_websheet_id
--      cbcho     09/09/2009 - Added g_ir_search, g_webpage_id, g_datagrid_id
--      cbcho     11/17/2009 - Added g_ir_report_id
--      mhichwa   11/23/2009 - log content length
--      jkallman  02/22/2010 - Add p_content_length to log()
--      cneumuel  05/24/2012 - Removed wwv_flow_log.log's p_num_rows parameter
--      jkallman  06/04/2012 - Added evaluate_current_log_number (Feature 966)
--      jkallman  06/04/2012 - Exposed initialize_log
--      cneumuel  12/01/2014 - In log: log request and page view type (feature #1599)
--
--------------------------------------------------------------------------------

--==============================================================================
-- counter for report rows fetched
--==============================================================================
g_total_rows_fetched pls_integer := 0;

--==============================================================================
-- for IR logging
--==============================================================================
g_worksheet_id          number;
g_ir_report_id          number;
g_ir_search             varchar2(4000);

--==============================================================================
-- for Websheet logging
--==============================================================================
g_websheet_id           number;
g_webpage_id            number;
g_datagrid_id           number;

--==============================================================================
-- activity log page view type
--==============================================================================
subtype t_page_view_type is wwv_flow_activity_log1$.page_view_type%type;
c_page_view_type_other         t_page_view_type := 0;
c_page_view_type_processing    t_page_view_type := 1;
c_page_view_type_rendering     t_page_view_type := 2;
c_page_view_type_ajax          t_page_view_type := 3;
c_page_view_type_auth_logout   t_page_view_type := 4;
c_page_view_type_auth_callback t_page_view_type := 5;

--==============================================================================
-- For the specified log (ACCESS, ACTIVITY, CLICKTHRU, DEBUG), determine if a log switch is necessary
-- If not, return the current log number.  Otherwise, switch the logs and return the updated log number
--==============================================================================
function evaluate_current_log_number( 
    p_log in varchar2 ) 
    return number;

--==============================================================================
procedure initialize_log (
    p_log in varchar2, 
    p_log_switch_after_days in number default null );

--==============================================================================
procedure log (
    p_elap                in number  default null,
    p_content_length      in number  default null,
    p_verbose             in boolean default true );

end wwv_flow_log;
/
show errors
