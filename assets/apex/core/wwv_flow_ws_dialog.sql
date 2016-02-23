set define '^' verify off
prompt ...wwv_flow_ws_dialog
create or replace package wwv_flow_ws_dialog as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_ws_dialog.sql
--
--    DESCRIPTION
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--    cbcho     03/31/2008 - Created
--    cbcho     07/01/2008 - Changed list_of_values to edit existing LOV
--    cbcho     07/24/2008 - Added add_column_validation
--    cbcho     07/29/2008 - Added p_mode to column_groups
--    cbcho     08/18/2008 - Added p_websheet_id to add_notification
--    cbackstr  08/20/2008 - Added list_of_values_text to get csv string of LOV item
--    cbcho     04/23/2009 - Added p_websheet_id where needed
--    cbcho     05/22/2009 - Added p_link_id to add_links
--    cbcho     05/28/2009 - Changed reset_geocode to accept p_websheet_id
--    cbcho     08/04/2009 - Removed add_notification
--    cbcho     08/14/2009 - Added p_note_id to add_notes
--    cbcho     09/04/2009 - Removed add_webpage_section
--    jkallman  02/05/2010 - Removed websheet_sharing
--    arayner   04/15/2010 - Added p_column_name parameter to add_column_validation
--    cneumuel  12/10/2012 - Added ondemand_dialog (bug #15977940)
--    cbcho     12/03/2013 - Removed all procedures from the spec except ondemand_dialog as it is the main procedure calling all others
--
--------------------------------------------------------------------------------

--
-- called from on-demand process DIALOG in 4900
--
procedure ondemand_dialog (
    p_websheet_id     in number,  -- P2_WEBSHEET_ID
    p_worksheet_id    in number,  -- P2_ID
    p_base_report_id  in number,  -- RPT_ID
    p_row_id          in number );-- CURRENT_WORKSHEET_ROW

end  wwv_flow_ws_dialog;
/
show errors
