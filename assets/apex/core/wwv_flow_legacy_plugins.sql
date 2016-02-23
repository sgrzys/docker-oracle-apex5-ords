set define '^'
set verify off
prompt ...wwv_flow_legacy_plugins

create or replace package wwv_flow_legacy_plugins
as
------------------------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_legacy_plugins.sql
--
--    DESCRIPTION
--      This package contains the code for all legacy APEX Builder compents that 
--      have been converted into plug-ins.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    hfarrell    04/13/2012 - Created
--    hfarrell    04/17/2012 - Added show_html_chart - called directly for existing HTML Charts
--
------------------------------------------------------------------------------------------------

-- Global Variables
g_region_id           number := null;  -- current region id
g_row_cnt             number := 0;
g_scale               number;
g_bar_width           number;
g_bar_height          number;
g_max_rows            number;
g_min_row             number;
g_range               number;    
g_total_value         number := 0;
g_max_value           number := -999999999999999999999999999999999999;
g_min_value           number := 999999999999999999999999999999999999;
g_max_element         number := 0;
g_min_element         number := 0;
g_axis                varchar2(10);
g_bar_color           varchar2(10);
g_use_flow_pagination varchar2(30) := null;    
g_bar_image           varchar2(250);
g_num_mask            varchar2(250);
g_font_size           varchar2(250);
g_font_color          varchar2(250);
g_font_face           varchar2(250);
g_image_locat         varchar2(250);
g_chart_title         varchar2(2000); 
g_status              varchar2(32767) := null;
g_pagination_row      varchar2(32767) := null;
empty_vc_arr          wwv_flow_global.vc_arr2;
g_colors              wwv_flow_global.vc_arr2;
g_link                wwv_flow_global.vc_arr2;
g_text                wwv_flow_global.vc_arr2;
g_value               wwv_flow_global.vc_arr2;
g_upper_span          wwv_flow_global.vc_arr2;
g_lower_span          wwv_flow_global.vc_arr2;
    

--
-- REGION PLUG-INs
--

-- Renders the HTML Chart region.
function render_html_chart (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;


-- Show the HTML Chart region.
procedure show_html_chart(
    p_cursor              in integer      default null,
    p_chart_type          in varchar2     default 'HBAR',
    p_bar_image           in varchar2     default 'MULTI',
    p_chart_title         in varchar2     default null,
    p_axis                in varchar2     default 'ZERO',
    p_scale               in number       default 300,
    p_bar_width           in number       default 40,
    p_bar_height          in number       default 20,
    p_num_mask            in varchar2     default '999,999,999,999,999,999,999,999,999,999,999,999,999',
    p_font_size           in varchar2     default '-2',
    p_font_color          in varchar2     default null,
    p_font_face           in varchar2     default null,
    p_max_rows            in number       default 2000,
    p_min_row             in number       default 1,
    p_show_summary        in varchar2     default null, -- 'CAMXVSFLR'
    p_image_prefix        in varchar2     default nvl(wwv_flow.g_image_prefix,'/'||'i/'),
    p_use_flow_pagination in varchar2     default 'YES' );


end wwv_flow_legacy_plugins;
/
show errors
