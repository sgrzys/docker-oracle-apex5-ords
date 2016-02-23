set define '^'
set verify off
prompt ...wwv_flow_ws_import_api

Rem  Copyright (c) Oracle Corporation 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ws_import_api.sql
Rem    DESCRIPTION
Rem     Interface to creating Websheet attributes.
Rem
Rem    NOTES
Rem      API to insert Websheet application metadata into the apex data dictionary
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbcho    03/16/2010 - Created
Rem     jstraub  03/31/2010 - Changed to invokers rights package
Rem     cbcho    04/02/2010 - Added procedures to create annotations and export annotations
Rem     cbcho    04/08/2010 - Added create and export acl
Rem     cbcho    04/09/2010 - Added data_section_style to create and export section
Rem     cbcho    04/13/2010 - Removed g_id_offset
Rem     cbcho    04/22/2010 - Added copy_data_grid
Rem     cbcho    05/12/2010 - Added copy_page_sections
Rem     cbcho    06/01/2011 - Added p_nav_order_by to create_section (feature 546)
Rem     cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem     cbcho    06/15/2012 - Changed create_section to include max_row_count,show_add_row,show_edit_row,show_search (feature #900)


create or replace package wwv_flow_ws_import_api
authid current_user
as

procedure create_acl (
    p_id              in number default null,
    p_ws_app_id       in number default null,       
    p_username        in varchar2 default null,        
    p_priv            in varchar2 default null);
        
procedure create_section (
    p_id                    in number default null,
    p_ws_app_id             in number default null,
    p_webpage_id            in number default null,
    p_section_type          in varchar2 default null,
    p_display_sequence      in number default null,
    p_title                 in varchar2 default null,
    p_content               in varchar2 default null,
    p_content_upper         in varchar2 default null,
    p_nav_start_webpage_id  in number default null,
    p_nav_max_level         in number default null,
    p_nav_order_by          in varchar2 default null,
    p_nav_include_link      in varchar2 default null,
    p_data_grid_id          in number default null,
    p_report_id             in number default null,
    p_data_section_style    in number default null,
    p_max_row_count         in number default null,
    p_show_add_row          in varchar2 default null,
    p_show_edit_row         in varchar2 default null,
    p_show_search           in varchar2 default null,
    p_chart_type            in varchar2 default null,
    p_chart_3d              in varchar2 default null,
    p_chart_label           in varchar2 default null,
    p_label_axis_title      in varchar2 default null,
    p_chart_value           in varchar2 default null,
    p_value_axis_title      in varchar2 default null,
    p_chart_aggregate       in varchar2 default null,
    p_chart_sorting         in varchar2 default null
    );

procedure create_row (
    p_id                 in number default null,    
    p_ws_app_id          in number default null,
    p_data_grid_id       in number default null,
    p_unique_value       in varchar2 default null,
    p_tags               in varchar2 default null,
    p_parent_row_id      in number default null,
    p_owner              in varchar2 default null,
    p_geocode            in varchar2 default null,
    p_load_order         in number default null,
    --p_change_count    in default number,          
    p_c001               in varchar2 default null,
    p_c002               in varchar2 default null,
    p_c003               in varchar2 default null,
    p_c004               in varchar2 default null,
    p_c005               in varchar2 default null,
    p_c006               in varchar2 default null,
    p_c007               in varchar2 default null,
    p_c008               in varchar2 default null,
    p_c009               in varchar2 default null,
    p_c010               in varchar2 default null,
    p_c011               in varchar2 default null,
    p_c012               in varchar2 default null,
    p_c013               in varchar2 default null,
    p_c014               in varchar2 default null,
    p_c015               in varchar2 default null,
    p_c016               in varchar2 default null,
    p_c017               in varchar2 default null,
    p_c018               in varchar2 default null,
    p_c019               in varchar2 default null,
    p_c020               in varchar2 default null,
    p_c021               in varchar2 default null,
    p_c022               in varchar2 default null,
    p_c023               in varchar2 default null,
    p_c024               in varchar2 default null,
    p_c025               in varchar2 default null,
    p_c026               in varchar2 default null,
    p_c027               in varchar2 default null,
    p_c028               in varchar2 default null,
    p_c029               in varchar2 default null,
    p_c030               in varchar2 default null,
    p_c031               in varchar2 default null,
    p_c032               in varchar2 default null,
    p_c033               in varchar2 default null,
    p_c034               in varchar2 default null,
    p_c035               in varchar2 default null,
    p_c036               in varchar2 default null,
    p_c037               in varchar2 default null,
    p_c038               in varchar2 default null,
    p_c039               in varchar2 default null,
    p_c040               in varchar2 default null,
    p_c041               in varchar2 default null,
    p_c042               in varchar2 default null,
    p_c043               in varchar2 default null,
    p_c044               in varchar2 default null,
    p_c045               in varchar2 default null,
    p_c046               in varchar2 default null,
    p_c047               in varchar2 default null,
    p_c048               in varchar2 default null,
    p_c049               in varchar2 default null,
    p_c050               in varchar2 default null,
    p_n001               in number default null,
    p_n002               in number default null,
    p_n003               in number default null,
    p_n004               in number default null,
    p_n005               in number default null,
    p_n006               in number default null,
    p_n007               in number default null,
    p_n008               in number default null,
    p_n009               in number default null,
    p_n010               in number default null,
    p_n011               in number default null,
    p_n012               in number default null,
    p_n013               in number default null,
    p_n014               in number default null,
    p_n015               in number default null,
    p_n016               in number default null,
    p_n017               in number default null,
    p_n018               in number default null,
    p_n019               in number default null,
    p_n020               in number default null,
    p_n021               in number default null,
    p_n022               in number default null,
    p_n023               in number default null,
    p_n024               in number default null,
    p_n025               in number default null,
    p_n026               in number default null,
    p_n027               in number default null,
    p_n028               in number default null,
    p_n029               in number default null,
    p_n030               in number default null,
    p_n031               in number default null,
    p_n032               in number default null,
    p_n033               in number default null,
    p_n034               in number default null,
    p_n035               in number default null,
    p_n036               in number default null,
    p_n037               in number default null,
    p_n038               in number default null,
    p_n039               in number default null,
    p_n040               in number default null,
    p_n041               in number default null,
    p_n042               in number default null,
    p_n043               in number default null,
    p_n044               in number default null,
    p_n045               in number default null,
    p_n046               in number default null,
    p_n047               in number default null,
    p_n048               in number default null,
    p_n049               in number default null,
    p_n050               in number default null,            
    p_d001               in date default null,
    p_d002               in date default null,
    p_d003               in date default null,
    p_d004               in date default null,
    p_d005               in date default null,
    p_d006               in date default null,
    p_d007               in date default null,
    p_d008               in date default null,
    p_d009               in date default null,
    p_d010               in date default null,
    p_d011               in date default null,
    p_d012               in date default null,
    p_d013               in date default null,
    p_d014               in date default null,
    p_d015               in date default null,
    p_d016               in date default null,
    p_d017               in date default null,
    p_d018               in date default null,
    p_d019               in date default null,
    p_d020               in date default null,
    p_d021               in date default null,
    p_d022               in date default null,
    p_d023               in date default null,
    p_d024               in date default null,
    p_d025               in date default null,
    p_d026               in date default null,
    p_d027               in date default null,
    p_d028               in date default null,
    p_d029               in date default null,
    p_d030               in date default null,
    p_d031               in date default null,
    p_d032               in date default null,
    p_d033               in date default null,
    p_d034               in date default null,
    p_d035               in date default null,
    p_d036               in date default null,
    p_d037               in date default null,
    p_d038               in date default null,
    p_d039               in date default null,
    p_d040               in date default null,
    p_d041               in date default null,
    p_d042               in date default null,
    p_d043               in date default null,
    p_d044               in date default null,
    p_d045               in date default null,
    p_d046               in date default null,
    p_d047               in date default null,
    p_d048               in date default null,
    p_d049               in date default null,
    p_d050               in date default null, 
    p_clob001            in varchar2 default null,               
    p_search_clob        in varchar2 default null);
    
procedure create_file (
    p_id                     in number default null,
    p_ws_app_id              in number default null,
    p_data_grid_id           in number default null,
    p_row_id                 in number default null,
    p_webpage_id             in number default null,
    p_component_level        in varchar2 default null,
    p_name                   in varchar2 default null,
    p_varchar2_table         in sys.dbms_sql.varchar2_table,
    p_content_last_update    in date default null,
    p_mime_type              in varchar2 default null,
    p_content_charset        in varchar2 default null,
    p_content_filename       in varchar2 default null,
    p_description            in varchar2 default null,
    p_image_attributes       in varchar2 default null,
    p_image_alias            in varchar2 default null
    );
    
procedure create_note (
    p_id                     in number default null,
    p_ws_app_id              in number default null,
    p_data_grid_id           in number default null,
    p_row_id                 in number default null,
    p_webpage_id             in number default null,
    p_component_level        in varchar2 default null,
    p_content                in varchar2 default null
    );
    
procedure create_tag (
    p_id                     in number default null,
    p_ws_app_id              in number default null,
    p_data_grid_id           in number default null,
    p_row_id                 in number default null,
    p_webpage_id             in number default null,
    p_component_level        in varchar2 default null,
    p_tag                    in varchar2 default null
    );
    
procedure create_link (
    p_id                     in number default null,
    p_ws_app_id              in number default null,
    p_data_grid_id           in number default null,
    p_row_id                 in number default null,
    p_webpage_id             in number default null,
    p_component_level        in varchar2 default null,
    p_tags                   in varchar2 default null,
    p_show_on_homepage       in varchar2 default null,
    p_link_name              in varchar2 default null,
    p_url                    in varchar2 default null,
    p_link_description       in varchar2 default null,
    p_display_sequence       in number default null
    );

procedure export_sections (
    p_ws_app_id    in number,
    p_webpage_id   in number,
    p_format       in varchar2 default null);
      
procedure export_rows (
    p_ws_app_id    in number,
    p_data_grid_id in number,
    p_format       in varchar2 default null);
    
procedure export_annotations (
    p_ws_app_id       in number,   
    p_component_level in varchar2,
    p_format          in varchar2 default null);    

procedure export_acl (
    p_ws_app_id       in number
    );
                     
procedure remove_ws_components (
    p_ws_app_id    in number);
    
procedure copy_data_grid (
    p_ws_app_id            in number,
    p_old_data_grid_id     in number,
    p_new_data_grid_id     in number);
    
procedure copy_page_sections (
    p_ws_app_id        in number,
    p_old_webpage_id   in number,
    p_new_webpage_id   in number);                   
end wwv_flow_ws_import_api;
/
show errors;
