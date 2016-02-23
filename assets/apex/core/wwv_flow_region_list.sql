set define '^' verify off
prompt ...wwv_flow_region_list.sql
create or replace package wwv_flow_region_list authid definer
$if sys.dbms_db_version.version >= 12 $then
accessible by (wwv_flow_region_native)
$end
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_region_list.sql
--
--    DESCRIPTION
--      list region implementation
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    10/06/2014 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- low-level API to render a list shared component. used on
-- 4000:4716 - Create Page - Global Navigation / Tabs
--==============================================================================
procedure render_list (
    p_region_id               in number,
    p_region_name             in varchar2 default null,
    p_list_id                 in number,
    p_list_template_id        in number,
    p_region_sub_css_classes  in varchar2 default null,
    p_region_template_options in varchar2 default null );

--==============================================================================
-- API for wwv_flow_region_native
--==============================================================================
function render_list (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;

end wwv_flow_region_list;
/
show err

