set define '^'
set verify off
prompt ...wwv_flow_copy_page

Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      cbcho     01/09/2003 - Created (Bug 2743418)
Rem      cbcho     01/16/2003 - Added a_region procedure to copy one flow region to another (Bug 2754327)
Rem      cbcho     02/14/2003 - Added p_tab_set, p_tab_name in item procedure to set "also_current_for" attribute when the page reuses an existing tab(Bug 2785188)
Rem      cbcho     06/02/2006 - Added copy_from_other_app to copy page from another application (Bug 5262612)
Rem      cbcho     06/06/2006 - Added p_breadcrumb_id,p_breadcrumb_name,p_parent_id in copy procedure to create page with breadcrumb
Rem      cbcho     06/21/2006 - Added change_page_id_in_branch (bug 5346651)
Rem      jstraub   02/06/2007 - Exposed procedure web_services (bug 5865102)
Rem      pawolf    08/18/2009 - Added columns for hierarchical regions
Rem      pawolf    01/17/2011 - Added tabular form support for processes and validations (feature# 542)
Rem      hfarrell  05/31/2011 - Fix for bug 6920392: updated procedure a_region to include support for region_name e.g. #REGION_STATIC_ID# substitution
Rem      hfarrell  06/01/2011 - Fix for bug 6920392: updated procedure copy to include support for region_name e.g. #REGION_STATIC_ID# substitution
Rem      hfarrell  07/26/2012 - Updated copy procedure to add p_ui_type_id_to (feature #797)
Rem      hfarrell  08/30/2012 - Updated copy_from_other_app to add p_ui_type_id_to ( bug 14544971)
Rem      pawolf    09/23/2014 - Added navigation list parameters to copy and copy_from_other_app
Rem      hfarrell  10/06/2014 - In a_region: added p_new_region_name (bug #19730672)

create or replace
package wwv_flow_copy_page
as
--  Copyright (c) Oracle Corporation 1999 - 2003. All Rights Reserved.
--
--    DESCRIPTION
--      Copy page.
--
--    SECURITY
--      For use by flows user, not granted to public
--
--    RUNTIME DEPLOYMENT: YES
--
--    NOTES
--      This is called from the flow builder HTML designer.
--


empty_vc_arr wwv_flow_global.vc_arr2;

function change_page_id_in_branch (
    p_page_id_from             in number,
    p_page_id_to               in number,
    p_url                      in varchar2
    ) return varchar2;

function change_item_name (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_source                   in varchar2
    ) return varchar2;

function change_item_name (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_source                   in clob
    ) return varchar2;

--
-- Copy one flow plug and its items and buttons to another
-- Set p_clear_global_variables to clear the internal global variables. Should
-- be false when copying a page/application.
--
procedure a_region (
    p_flow_id_from           in number,
    p_page_id_from           in number,
    p_region_id_from         in number,
    p_flow_id_to             in number,
    p_page_id_to             in number,
    p_plug_name_to           in varchar2,
    p_parent_plug_id_to      in number   default null,
    p_display_seq_to         in number   default null,
    p_display_col_to         in number   default null,
    p_display_point_to       in varchar2 default null,
    p_new_region_title       in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_item_label         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_button_label       in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_region_name        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_copy_items             in boolean  default false,
    p_copy_buttons           in boolean  default false,
    p_copy_validations       in boolean  default false,
    p_copy_processes         in boolean  default false,
    p_copy_sub_regions       in boolean  default false,
    p_clear_global_variables in boolean  default true,
    p_region_name_to         in varchar2 default null);

procedure copy (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_page_name_to             in varchar2,
    --
    p_breadcrumb_id            in number default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_id                in number default null,
    --
    p_new_region_title         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_item_label           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_button_label         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_branch_value         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_region_name          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number default null,
    p_nav_list_parent_item_id  in number default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_ui_type_id_to            in number default null
    );


procedure copy_from_other_app (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_page_name_to             in varchar2,
    --
    p_breadcrumb_id            in number default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_id                in number default null,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number default null,
    p_nav_list_parent_item_id  in number default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_ui_type_id_to            in number default null
    );

procedure web_services (
    p_process_id_from in number,
    p_flow_id_from    in number,
    p_page_id_from    in number,
    p_process_id_to   in number,
    p_flow_id_to      in number,
    p_page_id_to      in number
    );

end wwv_flow_copy_page;
/
show errors;
