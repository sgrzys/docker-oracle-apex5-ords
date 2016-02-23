set define '^'
set verify off
prompt ...wwv_flow_ws_webpage

Rem  Copyright (c) Oracle Corporation 2007-2010. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ws_webpage.sql
Rem    DESCRIPTION
Rem     Interface for geocoding data.
Rem
Rem    NOTES
Rem      API to generate geocode data and store in worksheet.
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     mhichwa  04/04/2007 - Created
Rem     mhichwa  04/17/2007 - Added sharing
Rem     cbcho    05/27/2007 - Renamed wwv_flow_worksheet_webpage to wwv_flow_ws_webpage
Rem     cbcho    09/04/2009 - Added show, show_annotations
Rem     cbcho    09/09/2009 - Added to log wwv_flow_log.g_websheet_id, wwv_flow_log.g_webpage_id in show procedure
Rem     cbcho    12/02/2009 - Renamed show_annotations to show_annotations_menu
Rem     cbcho    12/02/2009 - Added show_attachments,show_notes,show_tags
Rem     cbcho    12/04/2009 - Added show_tag_clouds
Rem     cbcho    12/18/2009 - Changed show_chart to accept p_section_id
Rem     cbcho    12/23/2009 - Added show_breadcrumbs
Rem     cbcho    01/06/2010 - Changed show_breadcrumbs to display parent, child
Rem     cbcho    02/03/2010 - Changed show to accept p_ws_app_id instead of p_websheet_id
Rem     cbcho    02/07/2010 - Added display_page_link
Rem     cbcho    02/08/2010 - Added p_link_text to display_page_link
Rem     cbcho    02/17/2010 - Added get_last_updated_page, get_last_updated_file
Rem     cbcho    02/22/2010 - Removed display_page_link
Rem     mhichwa  02/26/2010 - added show_attachment_examples
Rem     mhichwa  02/26/2010 - added show_recent_files
Rem     mhichwa  04/09/2010 - added g_tree
Rem     cbcho    04/23/2010 - Exposed clean_out_editor_tag
Rem     mhichwa  04/30/2010 - added p_session in show_notes
Rem     cbcho    05/11/2010 - Added g_running_data_section,g_data_section_html to use from wwv_flow_worksheet.csv (bug 9694798)
Rem     jkallman 05/14/2010 - Added function get_login_url
Rem     mhichwa  06/11/2010 - add p_ws_page_id to get_login_url bug 9797007
Rem     cbcho    02/17/2011 - Added show_breadcrumbs2
Rem     shrahman 02/18/2011 - Removed show_attachments, show_tags, show_notes, moved to wwv_flow_ws_ui
Rem     cbcho    02/23/2011 - Exposed print_in_chunks
Rem     cbcho    03/28/2011 - Added is_data_grid_query
Rem     cbcho    04/26/2011 - Added show_slides
Rem     cbcho    04/27/2011 - Removed deprecated show_breadcrumbs, show_breadcrumbs2
Rem     cbcho    04/28/2011 - Removed show_slides and added p_presentation_mode to show.  This way, we use one code base to display page and slides.
Rem     cbcho    05/10/2011 - Removed obsolete procedures show_annotations_meu, show_attachment_examples, show_recent_files, get_last_updated_page, get_last_updated_file
Rem     cbcho    05/20/2011 - Unexposed is_data_grid_query from spec. Added Validate_string.
Rem     cbcho    01/24/2012 - Changed get_anchor to add p_esacpe_sc. (bug 13452950)
Rem     jkallman 03/14/2012 - Removed print_in_chunks (Bug 13812100)
Rem     cbcho    06/15/2012 - Added g_data_grid_section so wwv_flow_worksheeet accesses the value (feature #900)
Rem     cbcho    06/21/2012 - Changed get_url, get_anchor to accept p_alias (feature #950)


create or replace package wwv_flow_ws_webpage
as

g_tree                  wwv_flow_plugin_util.t_column_value_list; -- for use with jstrees
g_running_data_section  boolean := false;

type t_datagrid_section is record (
    section_id           number,
    show_edit_row        varchar2(1),
    max_row_count        number,
    last_page_id         number);
g_data_grid_section t_datagrid_section;

g_data_section_html     varchar2(32767) := null; -- for data section

function clean_out_editor_tag (
    p_string        in clob)
    return clob;

function validate_string (
    p_str              in clob,
    p_ws_app_id        in number,
    p_page_id          in number,
    p_section_id       in number) return varchar2;
    
procedure show_tag_clouds (
    p_ws_app_id             in number,    
    p_session_id            in number,    
    p_alpha                 in number default 1,
    p_max                   in number default 100,
    p_limit                 in number default 10000,
    p_link_to_page          in varchar2 default '904',
    p_tag_item_filter       in varchar2 default 'IRC_TAG',
    p_clear_cache           in varchar2 default '904,RIR') ;
                        
procedure show (
    p_ws_app_id         in number,
    p_webpage_id        in number,
    p_request           in varchar2 default null,
    p_presentation_mode in varchar2 default 'N');

function get_login_url( 
	p_ws_app_id  in number,
	p_ws_page_id in number default null ) 
return varchar2;

function get_url (
    p_ws_app_id       in number,
    p_session         in number,
    p_alias           in varchar2,
    p_url_postfix     in varchar2 default null )
    return varchar2;

function get_anchor (
    p_ws_app_id       in number,
    p_session         in number,
    p_alias           in varchar2,
    p_url_postfix     in varchar2 default null,
    p_text            in varchar2,
    p_escape_sc       in varchar2 default 'Y')
    return varchar2;

end wwv_flow_ws_webpage;
/
show errors;
