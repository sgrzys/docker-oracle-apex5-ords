set define '^' verify off
prompt ...wwv_flow_builder
create or replace package wwv_flow_builder is
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    DESCRIPTION
--      Flow Builder Reports.
--
--    SECURITY
--
--    NOTES
--      Page processes of flow 4000 call these reports.
--
--    RUNTIME DEPLOYMENT: NO
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    09/28/1999 - Created
--     mhichwa    01/12/2000 - Added p_header_html_suffix argument to report_header procedure
--     mhichwa    05/15/2000 - Remove obsolete procedures
--     mhichwa    06/13/2000 - Added p_search_string
--     cbcho      10/17/2001 - Added populate_updateable_col
--     mhichwa    10/22/2001 - Added set_upd_column_display_attr
--     mhichwa    10/20/2002 - Added show_page_list
--     mhichwa    02/21/2003 - Added function get_current_page_id_and_name (bug tbd)
--     mhichwa    02/21/2003 - Added function get_current_flow_id_and_name (bug tbd)
--     jstraub    03/24/2003 - Added procedure split_url for f?p syntax, bug 2860435
--     jstraub    04/08/2003 - Added p_success_msg to split_url
--     jkallman   06/20/2003 - Added is_valid_identifier
--     jstraub    06/24/2003 - Added is_valid_table_or_view
--     jkallman   06/27/2003 - Added is_valid_column_name
--     sspadafo   06/29/2003 - Added is_item_name_used (Bug 3025928)
--     sspadafo   06/30/2003 - Added is_item_name_duplicate (Bug 3025928)
--     jstraub    07/25/2003 - Removed obsolete procedures list_page_item, list_flow_tables, list_required_roles
--     jstraub    07/25/2003 - Removed obsolete procedure simple_current_page_list
--      msewtz    06/14/2004 - Updated set_upd_column_display_attr to support UI defaults
--      msewtz    06/14/2004 - Updated set_upd_column_display_attr to support FK and PK defaults
--      msewtz    06/29/2004 - updated set_upd_column_display_attr, added lov support
--      msewtz    09/13/2004 - updated set_upd_column_display_attr, changed p_column_width to number (bug 3887170)
--      cbcho     03/29/2006 - Added function region_source_type_lov (Bug 3085375)
--     sspadafo   02/25/2007 - Added p_report_column to split_url procedure (Bug 4922083)
--     hfarrell   11/20/2007 - Updated set_upd_column_display_attr to support column heading setting (bug 5949318)
--     jkallman   11/20/2009 - Added get_current_flow_language
--     sathikum   04/21/2010 - Added is_valid_dblink_name function to fix #8276705
--     pawolf     02/08/2011 - Added is_valid_item_name and get_valid_item_name for multibyte support (feature 224)
--     cneumuel   08/08/2014 - Removed list_plsql_source
--
--------------------------------------------------------------------------------
procedure unreserve_flow_page (
    p_flow_id       in number,
    p_page_id       in number,
    p_flow_session  in number)
    ;
procedure report_header (
    p_flow_id                  in varchar2 default null,
    p_flow_page_id             in varchar2 default null,
    p_instance                 in varchar2 default null,
    p_header_html_suffix       in varchar2 default '<br>')
    ;
function generate_header (
    p_flow_id                  in varchar2 default null,
    p_flow_page_id             in varchar2 default null,
    p_instance                 in varchar2 default null,
    p_header_html_suffix       in varchar2 default '<br>')
    return varchar2
    ;

procedure simple_page_list (
    p_flow_id     in number)
    ;

procedure simple_items_list (
    p_flow_id     in number,
    p_page_id     in number)
    ;

procedure populate_updateable_col (
    p_flow_id            in number,
    p_region_id          in number,
    p_region_source      in varchar2,
    p_security_group_id  in number
    );    

procedure set_upd_column_display_attr (
    p_flow_id             in number,
    p_region_id           in number,
    p_owner               in varchar2,
    p_table               in varchar2,
    p_query_column_name   in varchar2,
    p_column_default_type in varchar2,
    p_column_default      in varchar2,
    p_column_width        in number,
    p_column_heading      in varchar2,
    p_lov                 in varchar2,              
    p_pk_col_source_type  in varchar2,
    p_pk_col_source       in varchar2,    
    p_display_as          in varchar2,
    p_security_group_id   in number
    );

procedure show_page_list
    ;
function get_current_page_id_and_name return varchar2
    ;
function get_current_flow_id_and_name return varchar2
    ;
    
function get_current_flow_language return varchar2
    ;
    
procedure split_url (
    p_url               in varchar2,
    p_flow             out varchar2,
    p_page             out varchar2,
    p_session          out varchar2,
    p_request          out varchar2,
    p_debug            out varchar2,
    p_clear_cache      out varchar2,
    p_arg_names        out varchar2,
    p_arg_values       out varchar2,
    p_success_msg      out varchar2,
    p_report_column     in boolean default false
    );

function is_valid_dblink_name(
    p_name              in varchar2) return boolean 
    ;

function is_valid_identifier(
    p_identifier        in varchar2) return boolean
    ;

function is_valid_column_name(
    p_column_name       in varchar2) return boolean
    ;

    
function is_valid_table_or_view(
    p_owner             in varchar2,
    p_object_name       in varchar2 ) return varchar2
    ;

function is_valid_item_name (
    p_name              in varchar2 )
    return boolean;
    
function is_item_name_used (
    p_flow              in varchar2,
    p_name              in varchar2 )
    return boolean;
    
function is_item_name_duplicate (
    p_flow              in varchar2,
    p_id                in number,
    p_name              in varchar2 )
    return boolean;

function get_valid_item_name (
    p_name in varchar2 )
    return varchar2;

function is_valid_button_name (
    p_name in varchar2 )
    return boolean;

function get_valid_button_name (
    p_name in varchar2 )
    return varchar2;

function region_source_type_lov (
    p_current_value in varchar2)
    return varchar2;
    
end wwv_flow_builder;
/
show errors
