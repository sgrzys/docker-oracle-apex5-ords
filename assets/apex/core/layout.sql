set define '^'
set verify off
prompt ...wwv_flow_region_layout


Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   07/17/2000 - Created
Rem      mhichwa   10/12/2000 - Added show_page_documentation
Rem      mhichwa   01/24/2002 - Added show_on_load
Rem      mhichwa   04/01/2002 - Added show_on_load_flow
Rem      mhichwa   04/03/2002 - Added show_on_accept_flow
Rem      tmuth     04/04/2002 - Added g_first_process
Rem      cbcho     04/12/2002 - Added show_region_template and region_temp_substitution
Rem      cbcho     04/15/2002 - Added page_temp_substitution
Rem      sspadafo  01/16/2003 - Bug 2750294 New p_show_all parameter to flowchart procedures
Rem      cbcho     06/13/2003 - Obsolete procedure show_page_show,show_page_processing,
Rem                             show_page_regions2,show_page_regions,show,show_page_documentation,page_title
Rem      mhichwa   08/05/2004 - Remove obsolete procedures
Rem      mhichwa   05/10/2005 - added set_most_recently_edited
Rem      mhichwa   03/28/2006 - Added show_on_load_page procedure
Rem      mhichwa   03/29/2006 - Added additional show procedures to support page 4000:4150
Rem      mhichwa   04/05/2006 - Removed obsolete procedures
Rem      mhichwa   04/06/2006 - Added related pages and components
Rem      mhichwa   04/14/2006 - Added set lock status procedure
Rem      mhichwa   10/04/2007 - Added p_page argument to page_rendering_icons shared comp and proc (bug 5937978)
Rem      mhichwa   09/08/2008 - Added dynamic actions
Rem      mhichwa   03/19/2009 - Added procedure show_page0_app_proc 
Rem      mhichwa   03/19/2009 - Added procedure show_page0_app_comp
Rem      mhichwa   05/28/2009 - Added procedure show_page0_app_items
Rem      mhichwa   07/16/2009 - added p_page_id to show_related_pages_report
Rem      pawolf    12/11/2009 - Added several getter functions for type description lookups
Rem      pawolf    02/20/2010 - Added support for process plugins
Rem      pawolf    06/21/2012 - Added global page support (feature #987)
Rem      shrahman  07/16/2012 - creating procedure show_shared_standard_tabs
Rem      msewtz    08/08/2013 - Added show_navigation_list (feature 1236)
Rem      pawolf    11/04/2014 - Removed show_related_pages_report and set_most_recently_edited
Rem      pawolf    11/10/2014 - In show_page_buttons: correctly show buttons associated to global page regions (bug# 19989686)
Rem      hfarrell  11/18/2014 - Added show_shared_plugins (feature #1598)

create or replace package wwv_flow_region_layout
as

    g_first_process boolean := true;

procedure page_rendering_icons (
    p_page in varchar2 default null)
    ;
procedure shared_component_icons (
    p_page in varchar2 default null)
    ;
procedure page_processing_icons (
    p_page in varchar2 default null)
    ;

-------------------------
-- Page Rendering On Load
--
procedure show_on_load_page (
    p_page                 in number,
    p_global_page_id       in number,
    p_flow                 in number,
    p_session              in number)
    ;
procedure show_on_load_regions (
    p_page                 in number,
    p_global_page_id       in number,
    p_flow                 in number,
    p_session              in number)
    ;
procedure show_page_buttons (
    p_page           in number,
    p_global_page_id in number,
    p_flow           in number,
    p_session        in number)
    ;
procedure show_page_items (
    p_page    in number,
    p_flow    in number,
    p_session in number)
    ;
procedure show_on_load_computations (
    p_page                 in number,
    p_flow                 in number,
    p_session              in number)
    ;
procedure show_on_load_processes (
    p_page                 in number,
    p_flow                 in number,
    p_session              in number)
    ;
procedure show_on_load_dynact (
    p_page                 in number,
    p_flow                 in number,
    p_session              in number)
    ;

----------------------------
-- Page Processing on submit
--
procedure show_on_submit_comp (
    p_page in number,
    p_flow in number,
    p_session in number)
    ;
procedure show_on_submit_val (
    p_page in number,
    p_flow in number,
    p_session in number)
    ;
procedure show_on_submit_proc (
    p_page    in number,
    p_flow    in number,
    p_session in number)    
    ;

procedure show_on_submit_branch (
    p_page    in number,
    p_flow    in number,
    p_session in number)
    ;
    
-- shared
procedure show_shared_tabs (
    p_page in number,
    p_flow in number,
    p_session in number)
    ;    
procedure show_shared_standard_tabs (
    p_page in number,
    p_flow in number,
    p_session in number)
    ;    
procedure show_navigation_list (
    p_page       in number,
    p_flow       in number,
    p_session    in number)
    ;    
procedure show_shared_lov (
    p_page in number,
    p_flow in number,
    p_session in number)
    ;      
procedure show_shared_bc (
    p_page     in number,
    p_flow     in number,
    p_session  in number)
    ;
procedure show_shared_lists (
    p_page     in number,
    p_flow     in number,
    p_session  in number)
    ;        
procedure show_shared_theme (
    p_page     in number,
    p_flow     in number,
    p_session  in number)
    ;
procedure show_shared_templates (
    p_page     in number,
    p_flow     in number,
    p_session  in number)
    ;
procedure show_shared_security (
    p_page     in number,
    p_flow     in number,
    p_session  in number)
    ;
procedure show_shared_navbar (
    p_page     in number,
    p_flow     in number,
    p_session  in number)
    ;       
        
procedure show_shared_plugins (
    p_page     in number,
    p_flow     in number,
    p_session  in number)
    ;     
        
-- 4150 helper functions        
        
 procedure show_apex_home_pg_elink (
    p_page     in number default null,
    p_flow     in number default null,
    p_session  in number default null)
    ;
 procedure set_lock_status (
    p_flow in number,
    p_page in number)
    ;
        
        
        
-- other        
        

procedure show_page_template (
    p_flow          in number,
    p_page          in number default null,
    p_template      in varchar2 default null,
    p_template_id   in number   default null)
    ;

procedure page_temp_substitution (
    p_flow          in number,   
    p_template_id   in number)
    ;

procedure show_on_load_flow (
    p_page     in number,
    p_flow     in number,
    p_session  in number,
    p_show_all in boolean default false)
    ;

procedure show_on_accept_flow (
    p_page          in number,
    p_flow          in number,
    p_session       in number,
    p_show_all      in boolean default false)
    ;

procedure show_region_template (
    p_flow          in number,   
    p_template_id   in number);
        
procedure region_temp_substitution (
    p_flow          in number,   
    p_template_id   in number);    

procedure show_title (
       p_title in varchar2,
       p_t1    in varchar2 default null, 
       p_n1    in varchar2 default null,
       p_t2    in varchar2 default null,
       p_n2    in varchar2 default null,
       p_t3    in varchar2 default null,
       p_n3    in varchar2 default null,
       p_t4    in varchar2 default null,
       p_n4    in varchar2 default null,
       p_t5    in varchar2 default null,
       p_n5    in varchar2 default null,
       p_t6    in varchar2 default null,
       p_n6    in varchar2 default null,
       p_button_class in varchar2 default null,
       p_title_tab_attributes in varchar2 default null,
       p_help  in varchar2,
       p_name  in varchar2 default null);

--
-- page zero information reports
--

procedure show_global_page_app_proc (
    p_flow    in number,
    p_session in number)
    ;
    
procedure show_global_page_app_comp (
    p_flow    in number,
    p_session in number)
    ;

procedure show_global_page_app_items (
    p_flow    in number,
    p_session in number)
    ;

function get_process_type_desc (
    p_flow_id      in number,
    p_process_type in varchar2 )
    return varchar2;

function get_computation_type_desc (
    p_computation_type in varchar2 )
    return varchar2;

function get_validation_type_desc (
    p_validation_type in varchar2 )
    return varchar2;

function get_dyn_action_cond_type_desc (
    p_triggering_condition_type in varchar2 )
    return varchar2;

function get_page_item_type_desc (
    p_flow_id    in number,
    p_display_as in varchar2 )
    return varchar2;

function get_tabform_column_type_desc (
    p_display_as in varchar2 )
    return varchar2;

function get_ir_column_type_desc (
    p_display_as in varchar2 )
    return varchar2;
   
function get_condition_type_desc (
    p_condition_type in varchar2 )
    return varchar2;

function get_authorization_scheme_desc (
    p_authorization_scheme_id in varchar2 )
    return varchar2; 

function get_build_option_desc (
    p_build_option_id in number )
    return varchar2;
      
end wwv_flow_region_layout;
/
show errors
