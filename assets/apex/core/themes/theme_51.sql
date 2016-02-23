set define off verify off feedback off
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.0.00.32'
,p_default_workspace_id=>20
,p_default_application_id=>8960
,p_default_owner=>'APPSTORE'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 8960 - Mobile Master Theme
--
-- Application Export:
--   Application:     8960
--   Name:            Mobile Master Theme
--   Exported By:     APEX_050000
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.0.00.32
--   Instance ID:     69332573836388
--

-- Application Statistics:
--   Pages:                     20
--     Items:                   33
--     Processes:                7
--     Regions:                 41
--     Buttons:                 49
--     Dynamic Actions:          3
--   Shared Components:
--     Logic:
--     Navigation:
--       Lists:                  3
--       NavBar Entries:         1
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 3
--         Region:              14
--         Label:                3
--         List:                 5
--         Popup LOV:            1
--         Calendar:             1
--         Button:               2
--         Report:               1
--       Shortcuts:              1
--     Globalization:
--     Reports:
--   Supporting Objects:  Excluded

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,8960)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'THEME_DEV')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Mobile Master Theme')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F108851')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20150304140928'
,p_bookmark_checksum_function=>'MD5'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'0'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(2326391530239215583)
,p_application_tab_set=>0
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'Y'
,p_csv_encoding=>'Y'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150304140928'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2328108722362119877)
,p_name=>'Footer Nav Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328108904931119879)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'List Views'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'grid'
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>'to_number(:APP_PAGE_ID) <= 12'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2329277410628131538)
,p_list_item_display_sequence=>12
,p_list_item_link_text=>'Item Gallery'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'grid'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328109219154119880)
,p_list_item_display_sequence=>14
,p_list_item_link_text=>'Buttons'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'grid'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2329277204049129678)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Collapse'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'grid'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2328121002917886714)
,p_name=>'List Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328121201818886714)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Basic'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328121515598886716)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'With Dividers'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328121819756886716)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'With Images'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328122123613886716)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'With Counter'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328122401586886716)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'With Everything'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2328122818155891064)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Advanced Formatting'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2488063565599418187)
,p_name=>'Sub List Test'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488063756105418188)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Line 1'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488064047897418188)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Line 2'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'ALWAYS'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488064355210418188)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sub List 1'
,p_list_item_link_target=>'f?p=&APP_ID.::&SESSION.:'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488065052917420964)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Line 1a'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(2488064355210418188)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488065250760422042)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Line 2a'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(2488064355210418188)
,p_list_item_current_type=>'ALWAYS'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488065545800424281)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Line 3a'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(2488064355210418188)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488064642621418189)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Line 4'
,p_list_item_link_target=>'f?p=&APP_ID.::&SESSION.:'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(2110434408087450569)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(2332017916261604230)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3875524584211162558)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(2326322301621588503)
,p_icon_sequence=>200
,p_icon_subtext=>'Logout'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Logout'
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_cell_colspan=>1
);
end;
/
prompt --application/shared_components/logic/application_processes
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
null;
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(2326367111442698719)
,p_theme_id=>51
,p_name=>'Page'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'',
'<head>',
'',
'  <meta charset="utf-8" />',
'  <meta name="apple-mobile-web-app-capable" content="yes">',
'  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#',
'  #APPLICATION_CSS#',
'  #APEX_JAVASCRIPT#',
'  #THEME_JAVASCRIPT#',
'  #APPLICATION_JAVASCRIPT#',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#PAGE_STATIC_ID#" data-role="page" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="a" data-url="#REQUESTED_URL#" class="ui-responsive-panel" >',
'#TEMPLATE_CSS#',
'#PAGE_CSS#',
'#FORM_OPEN#',
'',
'#REGION_POSITION_01#',
'',
'<div data-role="panel" id="menupanel"  class="jqm-navmenu-panel" data-position="left" data-display="overlay">',
'    #SIDE_GLOBAL_NAVIGATION_LIST#',
'</div>    ',
'',
'<div data-role="content" data-theme="a">',
'  <div id="messages">',
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  </div>',
'  #BODY#',
'</div>',
'',
'#REGION_POSITION_08#',
'',
'#FORM_CLOSE#',
'#TEMPLATE_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-d success" style="margin-bottom:20px;" id="success-message">',
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-b notification" id="notification-message">',
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>',
'</div>'))
,p_theme_class_id=>17
,p_grid_type=>'VARIABLE'
,p_grid_max_columns=>5
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>false
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS# apex-grid-debug">#ROWS#</div>'
,p_grid_row_template=>'#COLUMNS#'
,p_grid_column_template=>'<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
,p_grid_javascript_debug_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });',
'',
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });',
''))
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(2320894219913585889)
,p_page_template_id=>wwv_flow_api.id(2326367111442698719)
,p_name=>'Header Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(2320932014226696254)
,p_page_template_id=>wwv_flow_api.id(2326367111442698719)
,p_name=>'Footer Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(2320932560318696255)
,p_page_template_id=>wwv_flow_api.id(2326367111442698719)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(2326400418098760884)
,p_theme_id=>51
,p_name=>'Popup'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'',
'<head>',
'',
'  <meta charset="utf-8" />',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#    ',
'  #APPLICATION_CSS#',
'  #APEX_JAVASCRIPT#',
'  #THEME_JAVASCRIPT#',
'  #APPLICATION_JAVASCRIPT#',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#PAGE_STATIC_ID#" data-role="page" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="a">',
'#TEMPLATE_CSS#',
'#PAGE_CSS#',
'#FORM_OPEN#',
'',
'<div data-role="content" data-theme="a">',
'  <div id="messages">',
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  </div>',
'  #BODY#',
'</div><!-- /content -->',
'#FORM_CLOSE#',
'#TEMPLATE_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</div><!-- /page -->',
''))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-d success" id="success-message">',
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-b notification" id="notification-message">',
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>',
'</div>'))
,p_theme_class_id=>17
,p_grid_type=>'VARIABLE'
,p_grid_max_columns=>5
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>false
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS#">#ROWS#</div>'
,p_grid_row_template=>'#COLUMNS#'
,p_grid_column_template=>'<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
,p_grid_javascript_debug_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });',
'',
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });',
''))
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(2497041316279758126)
,p_theme_id=>51
,p_name=>'Dialog'
,p_is_popup=>true
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'',
'<head>',
'',
'  <meta charset="utf-8" />',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#',
'  #APPLICATION_CSS#',
'  #APEX_JAVASCRIPT#',
'  #APPLICATION_JAVASCRIPT#',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#PAGE_STATIC_ID#" data-dialog="true" data-role="page" data-close-btn="right" aria-label="#TITLE#" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="a">',
' <div data-role="header" class="ui-header ui-bar-c">',
'  <h1>#TITLE#</h1>',
' </div>',
'#TEMPLATE_CSS#',
'#PAGE_CSS#',
'#FORM_OPEN#',
'',
'<div data-role="content" data-theme="a">',
'  <div id="messages">',
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  </div>',
'  #BODY#',
'</div><!-- /content -->',
'#FORM_CLOSE#',
'#THEME_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</div><!-- /page -->',
''))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-d success" id="success-message">',
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ui-bar ui-bar-b notification" id="notification-message">',
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>',
'</div>'))
,p_theme_class_id=>4
,p_grid_type=>'VARIABLE'
,p_grid_max_columns=>5
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>false
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS#">#ROWS#</div>'
,p_grid_row_template=>'#COLUMNS#'
,p_grid_column_template=>'<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
,p_grid_javascript_debug_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });',
'',
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){',
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });',
''))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_width=>'92.5%'
,p_dialog_max_width=>'500px'
,p_dialog_browser_frame=>'MODAL'
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(2321531103932121492)
,p_template_name=>'Icon Button'
,p_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_hot_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn ui-btn-b #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_theme_class_id=>4
,p_default_template_options=>'ui-btn-inline:ui-corner-all'
,p_preset_template_options=>'ui-btn-icon-notext'
,p_theme_id=>51
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(2326403612314891650)
,p_template_name=>'Standard Button'
,p_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_hot_template=>'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="ui-btn ui-btn-b #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_theme_class_id=>1
,p_default_template_options=>'ui-btn-inline:ui-corner-all'
,p_theme_id=>51
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326374003763904721)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" data-position="fixed" data-fullscreen="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #CHANGE#',
'  #BODY#',
'</div> <!-- /footer -->'))
,p_page_plug_template_name=>'Footer Toolbar (Fullscreen)'
,p_theme_id=>51
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326374525513904721)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" data-position="fixed" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #CHANGE#',
'  #BODY#',
'</div> <!-- /footer -->'))
,p_page_plug_template_name=>'Footer Toolbar (Fixed)'
,p_theme_id=>51
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326374902769904722)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="header" data-theme="a" data-position="fixed" data-fullscreen="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #PREVIOUS#',
'  <h1>#TITLE#</h1>',
'  #NEXT#',
'  #BODY#',
'</div> <!-- /header -->'))
,p_page_plug_template_name=>'Header Toolbar (Fullscreen)'
,p_theme_id=>51
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326375220650904722)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="header" data-theme="a" data-position="fixed" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #PREVIOUS#',
'  <h1>#PAGE_TITLE#</h1>',
'  #NEXT#',
'  #BODY#',
'</div> <!-- /header -->'))
,p_page_plug_template_name=>'Header Toolbar (Fixed)'
,p_theme_id=>51
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326378206709010065)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  #CHANGE#',
'  #BODY#',
'</div> <!-- /footer -->'))
,p_page_plug_template_name=>'Footer Toolbar (Displays at Bottom of Page)'
,p_theme_id=>51
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326389100925140930)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#">',
'#BODY#',
'#SUB_REGIONS#',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'#PREVIOUS#',
'#NEXT#    ',
'</div>'))
,p_page_plug_template_name=>'Plain (No Title)'
,p_theme_id=>51
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326404704096946118)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="controlgroup" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Button Group (Vertical)'
,p_theme_id=>51
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326404904358965079)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="controlgroup" data-type="horizontal" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Button Group (Horizontal)'
,p_theme_id=>51
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326407707700032263)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="collapsible" data-collapsed="false" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'<h3>#TITLE#</h3>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Collapsible (Open)'
,p_theme_id=>51
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326413202730097081)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="collapsible-set" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'#SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Collapsible Set'
,p_theme_id=>51
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326426614102346363)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="ui-collapsible #REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>',
'  <h3 class="ui-collapsible-heading ui-btn ui-corner-top ui-btn-up-a">',
'    <span class="ui-btn-inner ui-corner-top ui-corner-bottom">',
'      <span lass="ui-btn-text">#TITLE#</span>',
'    </span>',
'  </h3>',
'  <div class="ui-collapsible-content ui-body-c ui-corner-bottom">',
'    #BODY#',
'    #SUB_REGIONS#',
'    #EDIT#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Region (With Title Bar)'
,p_theme_id=>51
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2326450919379679102)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>',
'<h3>#TITLE#</h3>',
'#BODY#',
'#SUB_REGIONS#',
'#EDIT#',
'</div>'))
,p_page_plug_template_name=>'Region (With Title)'
,p_theme_id=>51
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2355032081809468160)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" data-role="collapsible" #REGION_CSS_CLASSES# #REGION_ATTRIBUTES#>',
'<h3>#TITLE#</h3>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Collapsible (Closed)'
,p_theme_id=>51
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(2928813681375019484)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-role="panel" id="#REGION_STATIC_ID#" data-position="right" data-display="overlay" class="#REGION_CSS_CLASSES#">',
'#BODY#',
'#SUB_REGIONS#',
'#CLOSE#',
'#DELETE#',
'#CREATE#',
'#EDIT#',
'#CHANGE#',
'</div>  '))
,p_page_plug_template_name=>'Panel'
,p_theme_id=>51
,p_theme_class_id=>2
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(2326379623903081270)
,p_list_template_current=>'<li><a href="#LINK#" class="ui-btn-active" data-transition="flow" data-icon="#IMAGE#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#" data-transition="flow" data-icon="#IMAGE#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Navigation Bar'
,p_theme_id=>51
,p_theme_class_id=>11
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-role="navbar">',
'  <ul>',
''))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  </ul>',
'</div><!-- /navbar -->'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(2329283415879237214)
,p_list_template_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'List View'
,p_theme_id=>51
,p_theme_class_id=>9
,p_list_template_before_rows=>'<ul data-role="listview">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(2488066866816456401)
,p_list_template_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'List View (Inset)'
,p_theme_id=>51
,p_theme_class_id=>10
,p_list_template_before_rows=>'<ul data-role="listview" data-inset="true">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul data-inset="true">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-theme="b">',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<a href="#LINK#">#TEXT_ESC_SC#</a>',
'#SUB_LISTS#',
'</li>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(2695242441200067168)
,p_list_template_current=>'<a href="#LINK#" rel="external" data-role="button" data-icon="#A01#">#TEXT_ESC_SC#</a>'
,p_list_template_noncurrent=>'<a href="#LINK#" rel="external" data-role="button" data-icon="#A01#">#TEXT_ESC_SC#</a>'
,p_list_template_name=>'Button Control Group'
,p_theme_id=>51
,p_theme_class_id=>9
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="navgroup">',
'   <div data-role="controlgroup" data-type="horizontal">'))
,p_list_template_after_rows=>'</div></div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3604679261281196482)
,p_list_template_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Navigation Menu'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.jqm-navmenu-panel .ui-listview > li .ui-collapsible-heading {',
'    margin: 0;',
'}',
'.jqm-navmenu-panel .ui-collapsible.ui-li-static {',
'    border: medium none !important;',
'    padding: 0;',
'}',
'.jqm-navmenu-panel .ui-collapsible + li > .ui-btn, .jqm-navmenu-panel .ui-collapsible + .ui-collapsible > .ui-collapsible-heading > .ui-btn, .jqm-navmenu-panel .ui-panel-inner > .ui-listview > li.ui-first-child .ui-btn {',
'    border-top: medium none !important;',
'}',
'.jqm-navmenu-panel .ui-listview .ui-listview .ui-btn {',
'    color: #999;',
'    padding-left: 1.5em;',
'}',
'.jqm-navmenu-panel .ui-listview .ui-listview .ui-btn.ui-btn-active {',
'    color: #fff;',
'}',
'.jqm-navmenu-panel .ui-btn:after {',
'    opacity: 0.4;',
'}',
'.jqm-demos .jqm-navmenu-panel.jqm-panel-page-nav {',
'    display: none;',
'    left: 12px;',
'    position: absolute;',
'    top: 178px;',
'}',
'.jqm-demos .jqm-navmenu-panel.jqm-panel-page-nav ul li:first-child a {',
'    border-top: medium none;',
'}',
'',
''))
,p_theme_id=>51
,p_theme_class_id=>9
,p_list_template_before_rows=>'<ul data-role="listview">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul data-role="listview" data-theme="b">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-role="collapsible" data-iconpos="right" data-inset="false">',
'    <h2>#TEXT_ESC_SC#</h2>',
'    <ul data-role="listview" data-theme="b">',
'        #SUB_LISTS#',
'    </ul>',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-role="collapsible" data-iconpos="right" data-inset="false">',
'    <h2>#TEXT_ESC_SC#</h2>',
'    #SUB_LISTS#',
'</li>'))
,p_sub_templ_curr_w_child=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(2491334154496778121)
,p_row_template_name=>'Standard Report'
,p_row_template1=>'<div class="list-view-cell" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_VALUE#</div>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
'<ul data-role="listview">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<li data-role="list-divider">'
,p_column_heading_template=>'<div class="list-view-cell" id="#COLUMN_HEADER_NAME#" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_HEADER#</div>'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_checked=>'#ccc'
,p_theme_id=>51
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(2491334154496778121)
,p_row_template_before_first=>'<li>'
,p_row_template_after_last=>'</li>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(2326370622143706691)
,p_template_name=>'Required'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'<span class="a-Icon icon-asterisk"></span></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="ui-field-contain">'
,p_after_item=>'</div>'
,p_on_error_before_label=>' '
,p_on_error_after_label=>' '
,p_theme_id=>51
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(2326417710704175064)
,p_template_name=>'Optional'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="ui-field-contain">'
,p_after_item=>'</div>'
,p_on_error_before_label=>' '
,p_on_error_after_label=>' '
,p_theme_id=>51
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(2326418724126197925)
,p_template_name=>'No Label (For Screenreaders)'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div class="ui-hide-label" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_on_error_before_label=>' '
,p_on_error_after_label=>' '
,p_theme_id=>51
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(2326388804603132465)
,p_popup_icon=>'#IMAGE_PREFIX#list.gif'
,p_popup_icon_attr=>'width=13 height=13 alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#APEX_JAVASCRIPT#',
'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css>',
'#THEME_CSS#',
'</head>'))
,p_page_body_attr=>'bgcolor=white OnLoad=first_field()'
,p_before_field_text=>' '
,p_page_heading_text=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css><style>a:link { color:#336699; text-decoration:none; padding:2px;} a:visited { color:#336699; text-decoration:none;} a:hover { color:red; text-decoration:underline;} body { font-fami'
||'ly:arial; background-color:#ffffff;} </style>'
,p_page_footer_text=>'</center></td></tr></table>'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next'
,p_prev_button_text=>'Previous'
,p_after_field_text=>'</div><br />'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'Row(s) #FIRST_ROW# - #LAST_ROW#'
,p_result_rows_per_pg=>10
,p_theme_id=>51
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(2447024650059031347)
,p_cal_template_name=>'Basic Calendar'
,p_day_of_week_format=>'<th scope="col" class="m-DayOfWeek">#IDY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="m-Calendar" id="calendar_month_#REGION_STATIC_ID#" data-enhance=false>',
'<tr><th scope="colgroup" class="m-MonthTitle" colspan="7" >#IMONTH# #YYYY#</th></tr>',
''))
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr><td colspan="7">',
'<div id="calendar_day_details_#REGION_STATIC_ID#"></div>',
'</td>',
'</tr>',
'</table>',
'<script>',
'apex.jQuery( "##PAGE_STATIC_ID#" ).on( "pageinit", function() {',
'',
'    // Initialize calendar data as list view as soon as that section has been refreshed',
'    // Use Swipe Left and Right to go to the next or previous month',
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ )',
'        .on( "apexafterrefresh", function() {',
'            apex.jQuery( "#calendar_month_#REGION_STATIC_ID#", apex.gPageContext$ )',
'                .find( "[data-role=''listview'']")',
'                .listview(); })',
'        .on( "swipeleft", function() {',
'            apex.widget.calendar.ajax_calendar(''S'', ''next''); } )',
'        .on( "swiperight", function() {',
'            apex.widget.calendar.ajax_calendar(''S'', ''previous''); } );',
'',
'    // Load calendar data of date if it''s tapped',
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ ).on( "tap", "#calendar_month_#REGION_STATIC_ID# td[class*=m-]", function () {',
'        var lDate     = apex.jQuery( this ).data( "date" ),',
'            lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#", apex.gPageContext$ );',
'        apex.jQuery(".apex-calendar-today-has-data")',
'            .addClass(''apex-calendar-has-data'')',
'            .removeClass("apex-calendar-today-has-data");',
'        apex.jQuery( ".m-Today" )',
'            .addClass("m-Day")',
'            .removeClass( "m-Today" );',
'        apex.jQuery( this ).addClass( "m-Today" );',
'',
'        apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", lDate, {',
'            clear: function() {',
'                lDetails$.empty();',
'            },',
'            success: function( pData ) {',
'                lDetails$.html( pData );',
'            }',
'        });',
'    });',
'',
'    // New calendar entries can be added with tab and hold',
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ ).on( "taphold", "#calendar_month_#REGION_STATIC_ID# td[class*=m-]", function (e) {',
'       apex.widget.calendar.ajaxAddData(e);',
'    });',
'',
'    // Get the data of the current day as soon as the page gets displayed',
'    apex.jQuery( "##PAGE_STATIC_ID#" ).on( "pageshow", function() {',
'        var lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#", apex.gPageContext$ );',
'        apex.jQuery( ".m-Today", apex.gPageContext$ )',
'            .addClass( "m-Day" )',
'            .removeClass( "m-Today" );',
'        apex.jQuery( "#calendar_month_#REGION_STATIC_ID#", apex.gPageContext$ )',
'            .find( "td[data-date=#CURRENT_DATE#]" )',
'            .addClass( "m-Today" );',
'        apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", "#CURRENT_DATE#", {',
'            clear: function() {',
'                lDetails$.empty();',
'            },',
'            success: function( pData ) {',
'                lDetails$.html( pData );',
'            }',
'        });',
'    });',
'',
'});',
'</script>'))
,p_day_title_format=>'<div class="content-primary" class="m-DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="m-Day #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="m-Today #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#'
,p_weekend_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="content-primary" class="m-WeekendDayTitle">#DD#</div>',
''))
,p_weekend_open_format=>'<td class="m-WeekendDay #HAS_DATA#"  data-date="#CANONICAL_DATE#">#TITLE_FORMAT#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="content-primary" class="m-NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="m-NonDay"  data-date="#CANONICAL_DATE#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="m-WeekCalendar">',
'	<tr>',
'        <th scope="colgroup" class="m-monthTitle" colspan="7" >#WTITLE#</th>',
'	</tr>'))
,p_weekly_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="m-DayOfWeek" >#IDY# #MM#/#DD#</th>',
''))
,p_weekly_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<script>',
'    // register a delegated event on the table listening for all taphold in TD''s',
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {',
'        apex.widget.calendar.ajaxAddData(e);',
'    });',
'</script>'))
,p_weekly_day_open_format=>'<td class="m-Day">'
,p_weekly_day_close_format=>'</td>'
,p_weekly_today_open_format=>'<td class="m-Today">'
,p_weekly_weekend_open_format=>'<td class="m-NonDay">'
,p_weekly_weekend_close_format=>'</td>'
,p_weekly_time_open_format=>'<th scope="row" class="m-hour">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr rowspan="2">'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="m-DayOfWeek">#IDAY# #DD# #IMONTH# #YYYY#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="#CALENDAR_TITLE# #START_DL#" class="m-DayCalendar"><tr>',
''))
,p_daily_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<script>',
'    // register a delegated event on the table listening for all taphold in TD''s',
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {',
'        apex.widget.calendar.ajaxAddData(e);',
'    });',
'</script>'))
,p_daily_day_open_format=>'<td class="m-Day">'
,p_daily_day_close_format=>'</td>'
,p_daily_today_open_format=>'<td class="m-ToDay">'
,p_daily_time_open_format=>'<th scope="row" class="m-hour">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr rowspan="2" >'
,p_daily_hour_close_format=>'</tr>'
,p_agenda_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul data-role="listview">',
'#DAYS#',
'</ul>',
''))
,p_agenda_past_day_format=>'<li data-role="list-divider" data-theme="a">#IDAY# #IMONTH# #DD# #YYYY#</li>'
,p_agenda_today_day_format=>'<li data-role="list-divider" data-theme="b">#IDAY# #IMONTH# #DD# #YYYY#</li>'
,p_agenda_future_day_format=>'<li  data-role="list-divider" >#IDAY# #IMONTH# #DD# #YYYY#</li>'
,p_agenda_past_entry_format=>'<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>'
,p_agenda_today_entry_format=>'<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>'
,p_agenda_future_entry_format=>'<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>'
,p_month_data_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul id="listview_#REGION_STATIC_ID#" data-role="listview" data-inset="true" data-theme="a">#DAYS#</ul>',
''))
,p_month_data_entry_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li align="left" >#LINK##DATA#<p class="ui-li-aside">#TIME#</p></li>',
' '))
,p_theme_id=>51
,p_theme_class_id=>1
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(2326365812296690007)
,p_theme_id=>51
,p_theme_name=>'Mobile'
,p_ui_type_name=>'JQM_SMARTPHONE'
,p_navigation_type=>'L'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(2326367111442698719)
,p_default_dialog_template=>wwv_flow_api.id(2497041316279758126)
,p_error_template=>wwv_flow_api.id(2326367111442698719)
,p_printer_friendly_template=>wwv_flow_api.id(2326367111442698719)
,p_login_template=>wwv_flow_api.id(2326367111442698719)
,p_default_button_template=>wwv_flow_api.id(2326403612314891650)
,p_default_region_template=>wwv_flow_api.id(2326389100925140930)
,p_default_chart_template=>wwv_flow_api.id(2326389100925140930)
,p_default_form_template=>wwv_flow_api.id(2326389100925140930)
,p_default_reportr_template=>wwv_flow_api.id(2326450919379679102)
,p_default_tabform_template=>wwv_flow_api.id(2326389100925140930)
,p_default_wizard_template=>wwv_flow_api.id(2326389100925140930)
,p_default_irr_template=>wwv_flow_api.id(2326389100925140930)
,p_default_report_template=>wwv_flow_api.id(2491334154496778121)
,p_default_label_template=>wwv_flow_api.id(2326417710704175064)
,p_default_calendar_template=>wwv_flow_api.id(2447024650059031347)
,p_default_list_template=>wwv_flow_api.id(2488066866816456401)
,p_default_nav_list_template=>wwv_flow_api.id(2329283415879237214)
,p_default_top_nav_list_temp=>wwv_flow_api.id(2329283415879237214)
,p_default_side_nav_list_temp=>wwv_flow_api.id(3604679261281196482)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(2326404904358965079)
,p_default_dialogr_template=>wwv_flow_api.id(2326389100925140930)
,p_default_option_label=>wwv_flow_api.id(2326417710704175064)
,p_default_header_template=>wwv_flow_api.id(2326375220650904722)
,p_default_footer_template=>wwv_flow_api.id(2326374525513904721)
,p_default_required_label=>wwv_flow_api.id(2326370622143706691)
,p_default_page_transition=>'SLIDE'
,p_default_popup_transition=>'POP'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(51),'#IMAGE_PREFIX#themes/theme_51/')
,p_css_file_urls=>'#THEME_IMAGES#css/5_0.css'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(2110437725309369097)
,p_theme_id=>51
,p_name=>'Red'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#themes/theme_51/css/red/theme_style_red.min.css',
'#IMAGE_PREFIX#themes/theme_51/css/red/jquery.mobile.icons.min.css'))
,p_is_current=>false
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(2110437725312370466)
,p_theme_id=>51
,p_name=>'Blue'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#themes/theme_51/css/blue/theme_style_blue.min.css',
'#IMAGE_PREFIX#themes/theme_51/css/blue/jquery.mobile.icons.min.css'))
,p_is_current=>false
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(2321089408866035804)
,p_theme_id=>51
,p_name=>'Default'
,p_css_file_urls=>'#IMAGE_PREFIX#themes/theme_51/css/default/theme_style_default.css'
,p_is_current=>true
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(2358961141432738591)
,p_theme_id=>51
,p_name=>'Dark'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#themes/theme_51/css/dark/theme_style_dark.min.css',
'#IMAGE_PREFIX#themes/theme_51/css/dark/jquery.mobile.icons.min.css'))
,p_is_current=>false
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(2271877737261813172)
,p_theme_id=>51
,p_name=>'COLLAPSIBLE_REGION'
,p_display_name=>'Collapsible Region'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Collapsed'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(2271960710861842100)
,p_theme_id=>51
,p_name=>'REGION_SIZE'
,p_display_name=>'Region Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Standard'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(2272020947026925582)
,p_theme_id=>51
,p_name=>'COLLAPSIBLE_SET'
,p_display_name=>'Collapsible Set'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(2321529303038114737)
,p_theme_id=>51
,p_name=>'ICON_BUTTON'
,p_display_name=>'Icon Button'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(2321529827044117387)
,p_theme_id=>51
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(2928815836457025819)
,p_theme_id=>51
,p_name=>'PANEL_OPTIONS'
,p_display_name=>'Panel Options'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'The relationship of the panel to the page contents. Can either push the page over ("reveal"), re-flow the content to fit the panel content as a column ("push"), or sit over the content ("overlay").'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(2928852134771510647)
,p_theme_id=>51
,p_name=>'MENU_PANEL_OPTIONS'
,p_display_name=>'Menu Panel Options'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'The relationship of the menu panel to the page contents. Can either push the page over ("reveal"), re-flow the content to fit the panel content as a column ("push"), or sit over the content ("overlay").'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321091562088052872)
,p_theme_id=>51
,p_name=>'ROUNDED_CORNERS'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_css_classes=>'ui-corner-all'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321092497355058666)
,p_theme_id=>51
,p_name=>'INLINE_BUTTON'
,p_display_name=>'Inline Button'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_css_classes=>'ui-btn-inline'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321531371120121497)
,p_theme_id=>51
,p_name=>'INLINE_BUTTON'
,p_display_name=>'Inline Button'
,p_display_sequence=>5
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-btn-inline'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321531649935121497)
,p_theme_id=>51
,p_name=>'ROUNDED_CORNERS'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-corner-all'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321532522038124240)
,p_theme_id=>51
,p_name=>'ICON_LEFT'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-btn-icon-left'
,p_group_id=>wwv_flow_api.id(2321529827044117387)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321569405163127645)
,p_theme_id=>51
,p_name=>'ICON_RIGHT'
,p_display_name=>'Right'
,p_display_sequence=>40
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-btn-icon-right'
,p_group_id=>wwv_flow_api.id(2321529827044117387)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321569864925129117)
,p_theme_id=>51
,p_name=>'ICON_TOP'
,p_display_name=>'Top'
,p_display_sequence=>30
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-btn-icon-top'
,p_group_id=>wwv_flow_api.id(2321529827044117387)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321570200858130289)
,p_theme_id=>51
,p_name=>'ICON_BOTTOM'
,p_display_name=>'Bottom'
,p_display_sequence=>50
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-btn-icon-bottom'
,p_group_id=>wwv_flow_api.id(2321529827044117387)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321570903007132964)
,p_theme_id=>51
,p_name=>'NO_TEXT'
,p_display_name=>'No Text'
,p_display_sequence=>60
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-btn-icon-notext'
,p_group_id=>wwv_flow_api.id(2321529827044117387)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321575935251147652)
,p_theme_id=>51
,p_name=>'ICON_DELETE'
,p_display_name=>'Delete'
,p_display_sequence=>200
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-delete'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321648000567253551)
,p_theme_id=>51
,p_name=>'ICON_ACTION'
,p_display_name=>'Action'
,p_display_sequence=>100
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-action'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2321648660809255182)
,p_theme_id=>51
,p_name=>'ICON_ALERT'
,p_display_name=>'Alert'
,p_display_sequence=>110
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-alert'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322022398301268858)
,p_theme_id=>51
,p_name=>'ICON_BACK'
,p_display_name=>'Back'
,p_display_sequence=>120
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-back'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322022542154270267)
,p_theme_id=>51
,p_name=>'ICON_BARS'
,p_display_name=>'Bars'
,p_display_sequence=>130
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-bars'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322024210300272262)
,p_theme_id=>51
,p_name=>'ICON_BULLETS'
,p_display_name=>'Bullets'
,p_display_sequence=>140
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-bullets'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322024459346273964)
,p_theme_id=>51
,p_name=>'ICON_CALENDAR'
,p_display_name=>'Calendar'
,p_display_sequence=>150
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-calendar'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322753736643310271)
,p_theme_id=>51
,p_name=>'ICON_CARAT_LEFT'
,p_display_name=>'Left'
,p_display_sequence=>170
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-carat-l'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322753998164311787)
,p_theme_id=>51
,p_name=>'ICON_CARAT_RIGHT'
,p_display_name=>'Right'
,p_display_sequence=>180
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-carat-r'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322754158685313946)
,p_theme_id=>51
,p_name=>'ICON_CARAT_UP'
,p_display_name=>'Up'
,p_display_sequence=>190
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-carat-u'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322773362741319378)
,p_theme_id=>51
,p_name=>'ICON_CARAT_DOWN'
,p_display_name=>'Down'
,p_display_sequence=>160
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-carat-d'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322774788782323164)
,p_theme_id=>51
,p_name=>'ICON_CHECK'
,p_display_name=>'Check'
,p_display_sequence=>210
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-check'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322774963686324237)
,p_theme_id=>51
,p_name=>'ICON_CLOUD'
,p_display_name=>'Cloud'
,p_display_sequence=>220
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-cloud'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322776131724325714)
,p_theme_id=>51
,p_name=>'ICON_COMMENT'
,p_display_name=>'Comment'
,p_display_sequence=>230
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-comment'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322824347679370160)
,p_theme_id=>51
,p_name=>'ICON_CLOCK'
,p_display_name=>'Clock'
,p_display_sequence=>240
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-clock'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322824544671371836)
,p_theme_id=>51
,p_name=>'ICON_EDIT'
,p_display_name=>'Edit'
,p_display_sequence=>250
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-edit'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322824745540373440)
,p_theme_id=>51
,p_name=>'ICON_GEAR'
,p_display_name=>'Gear'
,p_display_sequence=>260
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-gear'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322826050194378635)
,p_theme_id=>51
,p_name=>'ICON_GRID'
,p_display_name=>'Grid'
,p_display_sequence=>270
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-grid'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322826232996380577)
,p_theme_id=>51
,p_name=>'ICON_HOME'
,p_display_name=>'Home'
,p_display_sequence=>280
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-home'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322826497594382020)
,p_theme_id=>51
,p_name=>'ICON_INFO'
,p_display_name=>'Info'
,p_display_sequence=>290
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-info'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322827339085383580)
,p_theme_id=>51
,p_name=>'ICON_LOCATION'
,p_display_name=>'Location'
,p_display_sequence=>300
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-location'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322827888113387721)
,p_theme_id=>51
,p_name=>'ICON_LOCK'
,p_display_name=>'Lock'
,p_display_sequence=>310
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-lock'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322828145131390906)
,p_theme_id=>51
,p_name=>'ICON_MAIL'
,p_display_name=>'Mail'
,p_display_sequence=>320
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-mail'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322828324773392135)
,p_theme_id=>51
,p_name=>'ICON_MINUS'
,p_display_name=>'Minus'
,p_display_sequence=>330
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-minus'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322828560992395171)
,p_theme_id=>51
,p_name=>'ICON_PHONE'
,p_display_name=>'Phone'
,p_display_sequence=>340
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-phone'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322828798488397301)
,p_theme_id=>51
,p_name=>'ICON_PLUS'
,p_display_name=>'Plus'
,p_display_sequence=>350
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-plus'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322830821396402002)
,p_theme_id=>51
,p_name=>'ICON_POWER'
,p_display_name=>'Power'
,p_display_sequence=>360
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-power'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322831021426403735)
,p_theme_id=>51
,p_name=>'ICON_REFRESH'
,p_display_name=>'Refresh'
,p_display_sequence=>370
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-refresh'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322831291230405409)
,p_theme_id=>51
,p_name=>'ICON_SEARCH'
,p_display_name=>'Search'
,p_display_sequence=>380
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-search'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322831453128407191)
,p_theme_id=>51
,p_name=>'ICON_STAR'
,p_display_name=>'Star'
,p_display_sequence=>390
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-star'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322832223676414662)
,p_theme_id=>51
,p_name=>'ICON_TAG'
,p_display_name=>'Tag'
,p_display_sequence=>400
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-tag'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2322832486180415861)
,p_theme_id=>51
,p_name=>'ICON_USER'
,p_display_name=>'User'
,p_display_sequence=>410
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_css_classes=>'ui-icon-user'
,p_group_id=>wwv_flow_api.id(2321529303038114737)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2928852830575515452)
,p_theme_id=>51
,p_name=>'OVERLAY'
,p_display_name=>'Overlay'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(2326367111442698719)
,p_css_classes=>'overlay'
,p_group_id=>wwv_flow_api.id(2928852134771510647)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2928855643991516419)
,p_theme_id=>51
,p_name=>'REVEAL'
,p_display_name=>'Reveal'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(2326367111442698719)
,p_css_classes=>'reveal'
,p_group_id=>wwv_flow_api.id(2928852134771510647)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(2928858493635517554)
,p_theme_id=>51
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(2326367111442698719)
,p_css_classes=>'push'
,p_group_id=>wwv_flow_api.id(2928852134771510647)
,p_template_types=>'PAGE'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(2326470607873901949)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(2326391530239215583)
,p_name=>'No Authentication'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(2326322225257588503)
,p_ui_type_name=>'JQM_SMARTPHONE'
,p_display_name=>'jQuery Mobile'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>51
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_global_page_id=>0
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>true
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'0'
,p_page_mode=>'NORMAL'
,p_step_title=>'0'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2326389705212151560)
,p_plug_name=>'Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326375220650904722)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2328109510026125801)
,p_plug_name=>'Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326374525513904721)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(2328108722362119877)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(2326379623903081270)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2328125829902017546)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2326389705212151560)
,p_button_name=>'HOME'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Home'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_button_cattributes=>'data-icon="home" data-iconpos="notext" data-direction="reverse"'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Home'
,p_alias=>'HOME'
,p_page_mode=>'NORMAL'
,p_step_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_page_transition=>'SLIDE'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150302120452'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2320935068985710401)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid=>true
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2328124518894919750)
,p_plug_name=>'Menu'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(2328121002917886714)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(2488066866816456401)
,p_plug_query_row_template=>1
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Simple List View'
,p_page_mode=>'NORMAL'
,p_step_title=>'Simple List View'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_page_transition=>'FLIP'
,p_popup_transition=>'SLIDE'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2327974707392755579)
,p_plug_name=>'Simple List View'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'select * from demo_product_info order by product_name'
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_09=>'NONE'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Grouped List View'
,p_page_mode=>'NORMAL'
,p_step_title=>'Grouped List View'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2327975203589776335)
,p_plug_name=>'Grouped List View'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from demo_product_info',
' order by category, product_name'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_09=>'NONE'
,p_attribute_12=>'CATEGORY'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'List View with Images'
,p_page_mode=>'NORMAL'
,p_step_title=>'List View with Images'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2327975727862788346)
,p_plug_name=>'List View with Images'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from demo_product_info',
' order by product_name'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_09=>'IMAGE_BLOB'
,p_attribute_10=>'PRODUCT_IMAGE'
,p_attribute_11=>'PRODUCT_ID'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'List View with Counter'
,p_page_mode=>'NORMAL'
,p_step_title=>'List View with Supplement Info'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2327976707453801772)
,p_plug_name=>'List View with Counter'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.*,',
'       ( select sum(oi.quantity)',
'           from demo_order_items oi',
'          where oi.product_id = p.product_id',
'       ) as order_quantity',
'  from demo_product_info p',
' order by p.product_name'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_08=>'ORDER_QUANTITY'
,p_attribute_09=>'NONE'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'List View with Everything'
,p_page_mode=>'NORMAL'
,p_step_title=>'List View with Everything'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2327980206453849466)
,p_plug_name=>'List View with Everything'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.*,',
'       ( select sum(oi.quantity)',
'           from demo_order_items oi',
'          where oi.product_id = p.product_id',
'       ) as order_quantity',
'  from demo_product_info p',
' order by p.category, p.product_name'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'SEARCH:INSET'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_08=>'ORDER_QUANTITY'
,p_attribute_09=>'IMAGE_BLOB'
,p_attribute_10=>'PRODUCT_IMAGE'
,p_attribute_11=>'PRODUCT_ID'
,p_attribute_12=>'CATEGORY'
,p_attribute_14=>'f?p=&APP_ID.:1:&SESSION.::::P1_PRODUCT_ID:&PRODUCT_ID.'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'List View Advanced Formatting'
,p_page_mode=>'NORMAL'
,p_step_title=>'list view'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2327980928226907848)
,p_plug_name=>'List View Advanced Formatting'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.*,',
'       ( select sum(oi.quantity)',
'           from demo_order_items oi',
'          where oi.product_id = p.product_id',
'       ) as order_quantity',
'  from demo_product_info p',
' order by p.category, p.product_name'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'SEARCH:ADVANCED_FORMATTING:INSET'
,p_attribute_05=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h3>&PRODUCT_NAME.</h3>',
'<p>&PRODUCT_DESCRIPTION.</p>'))
,p_attribute_07=>'EUR <strong>&LIST_PRICE.</strong>'
,p_attribute_09=>'IMAGE_BLOB'
,p_attribute_10=>'PRODUCT_IMAGE'
,p_attribute_11=>'PRODUCT_ID'
,p_attribute_12=>'CATEGORY'
,p_attribute_14=>'f?p=&APP_ID.:10:&SESSION.::::P10_PRODUCT_ID:&PRODUCT_ID.'
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Calendar'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar'
,p_step_sub_title=>'Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(2447025272569037895)
,p_plug_name=>'Calendar 1'
,p_plug_source=>'select * from "EMP"'
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(2447025761025037899)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P8_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_item=>'P8_CALENDAR_DISPLAY'
,p_display_type=>'COL'
,p_easy_sql_table=>'EMP'
,p_date_column=>'HIREDATE'
,p_display_column=>'COMM'
,p_date_type_column=>'P8_CALENDAR_TYPE'
,p_end_date_item=>'P8_CALENDAR_END_DATE'
,p_include_custom_cal=>'N'
,p_custom_cal_days=>3
,p_item_link_open_in=>'W'
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_calendar_type=>'A'
,p_template_id=>wwv_flow_api.id(2447024650059031347)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2447026567574037900)
,p_plug_name=>'Calendar Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326378206709010065)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2447026750484037900)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2447026567574037900)
,p_button_name=>'MONTHLY'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.widget.calendar.ajax_calendar(''M'',''same'');return false;'
,p_button_condition=>'NVL(:P8_CALENDAR_TYPE, ''M'') <> ''M'''
,p_grid_new_grid=>false
,p_button_comment=>'Generated 05/22/2012'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2447026968411037901)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2447026567574037900)
,p_button_name=>'WEEKLY'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.widget.calendar.ajax_calendar(''W'',''same'');return false;'
,p_button_condition=>'P8_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 05/22/2012'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2447027145339037901)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2447026567574037900)
,p_button_name=>'DAILY'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.widget.calendar.ajax_calendar(''D'',''same'');return false;'
,p_button_condition=>'P8_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 05/22/2012'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2447027343815037901)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2447026567574037900)
,p_button_name=>'LISTVIEW'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'List'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.widget.calendar.ajax_calendar(''A'',''same'');return false;'
,p_button_condition=>'P8_CALENDAR_TYPE'
,p_button_condition2=>'A'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 05/22/2012'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2447027972844037902)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(2447026567574037900)
,p_button_name=>'TODAY'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.widget.calendar.ajax_calendar(''S'',''today'');return false;'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 05/22/2012'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2447026066293037899)
,p_name=>'P8_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2447025272569037895)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P8_CALENDAR_DISPLAY'
,p_source=>'P8_CALENDAR_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 05/22/2012'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2447026251719037899)
,p_name=>'P8_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2447025272569037895)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return sysdate;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Start Date'
,p_source=>'P8_CALENDAR_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 05/22/2012'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2447026448682037900)
,p_name=>'P8_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2447025272569037895)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return sysdate+3;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'End Date'
,p_source=>'P8_CALENDAR_END_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 05/22/2012'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2447027540947037901)
,p_name=>'Swipe right'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(2447025272569037895)
,p_bind_type=>'bind'
,p_bind_event_type=>'swiperight'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2447027856422037901)
,p_event_id=>wwv_flow_api.id(2447027540947037901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.widget.calendar.ajax_calendar(''S'',''previous'');return false;'
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Created by System'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2447028172407037902)
,p_name=>'Swipe left'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(2447025272569037895)
,p_bind_type=>'bind'
,p_bind_event_type=>'swipeleft'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2447028462684037902)
,p_event_id=>wwv_flow_api.id(2447028172407037902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.widget.calendar.ajax_calendar(''S'',''next'');return false;'
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Created by System'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'sub list test'
,p_page_mode=>'NORMAL'
,p_step_title=>'sub list test'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2488066160667435699)
,p_plug_name=>'Sub List Test'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(2488063565599418187)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(2488066866816456401)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Product'
,p_page_mode=>'NORMAL'
,p_step_title=>'Product'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150302130511'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2328112412734252442)
,p_plug_name=>'Product'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2328118401564312571)
,p_plug_name=>'Button Group'
,p_parent_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326404904358965079)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2328112719998252443)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2328118401564312571)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P10_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2328112627177252443)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2328118401564312571)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P10_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2328112803302252443)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2328118401564312571)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P10_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2328113618716252449)
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328113807612252454)
,p_name=>'P10_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Id'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328114009745252458)
,p_name=>'P10_PRODUCT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Name'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>48
,p_cMaxlength=>50
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328114230070252459)
,p_name=>'P10_PRODUCT_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Description'
,p_source=>'PRODUCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>2000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328114420815252460)
,p_name=>'P10_CATEGORY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Category'
,p_source=>'CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select distinct category as d,',
'       category',
'  from demo_product_info',
' order by 1'))
,p_cSize=>32
,p_cMaxlength=>30
,p_cHeight=>1
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328114616454252460)
,p_name=>'P10_PRODUCT_AVAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Avail'
,p_source=>'PRODUCT_AVAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_cSize=>32
,p_cMaxlength=>1
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328114821093252460)
,p_name=>'P10_LIST_PRICE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_use_cache_before_default=>'NO'
,p_prompt=>'List Price'
,p_source=>'LIST_PRICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>6
,p_cMaxlength=>6
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328115015822252460)
,p_name=>'P10_PRODUCT_IMAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2328112412734252442)
,p_use_cache_before_default=>'NO'
,p_source=>'PRODUCT_IMAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>64
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_03=>'PRODUCT_NAME'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2328116012116252461)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_PRODUCT_INFO'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_PRODUCT_INFO'
,p_attribute_03=>'P10_PRODUCT_ID'
,p_attribute_04=>'PRODUCT_ID'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2328116203458252464)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DEMO_PRODUCT_INFO'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_PRODUCT_INFO'
,p_attribute_03=>'P10_PRODUCT_ID'
,p_attribute_04=>'PRODUCT_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2328116416406252464)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'10'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2328112803302252443)
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Login'
,p_alias=>'LOGIN'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150302130651'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2326392216783216649)
,p_plug_name=>'Login'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2326392815919216649)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2326392216783216649)
,p_button_name=>'P11_LOGIN'
,p_button_static_id=>'P11_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Login'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'LOGIN'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2326392404135216649)
,p_name=>'P11_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2326392216783216649)
,p_prompt=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>100
,p_colspan=>2
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326370622143706691)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2326392610244216649)
,p_name=>'P11_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2326392216783216649)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>64
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(2326370622143706691)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2326393212273216650)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P11_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2326393025080216650)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P11_USERNAME,',
'    p_password => :P11_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2326393602220216650)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'11'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2326393419092216650)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P11_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Item Gallery'
,p_page_mode=>'NORMAL'
,p_step_title=>'Item Gallery'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329249231582866165)
,p_plug_name=>'Item Gallery'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329249613670876949)
,p_name=>'P12_TEXT_FIELD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Text Field'
,p_placeholder=>'Enter a Text'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329249820942879041)
,p_name=>'P12_TEXTAREA'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Textarea'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>3
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329250031331882076)
,p_name=>'P12_YES_NO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Flip switch'
,p_display_as=>'NATIVE_YES_NO'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329250203758883610)
,p_name=>'P12_SLIDER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Slider'
,p_display_as=>'NATIVE_SLIDER'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'0'
,p_attribute_02=>'100'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329250731247901034)
,p_name=>'P12_CHECKBOXES_HORIZONTAL'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Checkboxes (Horizontal)'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select dname, deptno',
'  from dept',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'HORIZONTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329251017526906504)
,p_name=>'P12_CHECKBOXES_VERTICAL'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Checkboxes (Vertical)'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select dname, deptno',
'  from dept',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329251426661918633)
,p_name=>'P12_RADIO_VERTICAL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Radio Group (Vertical)'
,p_source=>'10'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select dname, deptno',
'  from dept',
' order by 1'))
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
,p_attribute_04=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329251800735939444)
,p_name=>'P12_RADIO_HORIZONTAL'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Radio Group (Horizontal)'
,p_source=>'10'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select dname, deptno',
'  from dept',
' order by 1'))
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
,p_attribute_04=>'HORIZONTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329252827185956580)
,p_name=>'P12_SELECT_LIST'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Select List'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select dname, deptno',
'  from dept',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- select department -'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329253223853965052)
,p_name=>'P12_SELECT_LIST_MULTI'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Select List (Multi Select)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select dname, deptno',
'  from dept',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- select department -'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329253516365972338)
,p_name=>'P12_DATE_PICKER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Date Picker'
,p_format_mask=>'YYYY-MM-DD'
,p_display_as=>'NATIVE_DATE_PICKER_HTML5'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329253724330974721)
,p_name=>'P12_DATE_PICKER_WITH_TIME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Date Picker with Time'
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS'
,p_display_as=>'NATIVE_DATE_PICKER_HTML5'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'DATETIME-LOCAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329254021344983317)
,p_name=>'P12_DISPLAY_ONLY'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display Only'
,p_source=>'Readonly Value'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329254207969988914)
,p_name=>'P12_NUMBER_FIELD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Number Field'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329254419398992202)
,p_name=>'P12_PASSWORD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329254605676997651)
,p_name=>'P12_TEXT_FIELD_EMAIL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Text Field Email'
,p_placeholder=>'Enter an E-Mail'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329254812949999771)
,p_name=>'P12_TEXT_FIELD_URL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Text Field URL'
,p_placeholder=>'Enter a URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'URL'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329255018837001443)
,p_name=>'P12_TEXT_FIELD_PHONE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Text Field Phone'
,p_placeholder=>'Enter a Phone#'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329284000538450410)
,p_name=>'P12_SELECT_LIST_LONG'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(2329249231582866165)
,p_prompt=>'Select List (Long)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ename, empno',
'  from emp',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- select employee -'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Collapse'
,p_page_mode=>'NORMAL'
,p_step_title=>'Collapse'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150304080023'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329268822656033042)
,p_plug_name=>'Collapse Normal - Open'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from dept',
' order by dname'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'DNAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329269118322039167)
,p_plug_name=>'Collapse Normal - Closed'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2355032081809468160)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' where job = ''CLERK''',
' order by ename'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329269424340050399)
,p_plug_name=>'Collapse Set (Accordion) - Normal'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326413202730097081)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329269602654053571)
,p_plug_name=>'Collapse Set Normal (Accordion) - Tab 2'
,p_parent_plug_id=>wwv_flow_api.id(2329269424340050399)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' where job = ''CLERK''',
' order by ename'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329269810619055901)
,p_plug_name=>'Collapse Set Normal (Accordion) - Tab 1'
,p_parent_plug_id=>wwv_flow_api.id(2329269424340050399)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from dept',
' order by dname'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'DNAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329270322047059207)
,p_plug_name=>'Collapse Set Normal (Accordion) - Tab 3'
,p_parent_plug_id=>wwv_flow_api.id(2329269424340050399)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' where job = ''SALESMAN''',
' order by ename'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329271418977086692)
,p_plug_name=>'Collapse Set (Accordion) - Smaller'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'data-mini="true"'
,p_plug_template=>wwv_flow_api.id(2326413202730097081)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329271609569086693)
,p_plug_name=>'Collapse Set Smaller (Accordion) - Tab 2'
,p_parent_plug_id=>wwv_flow_api.id(2329271418977086692)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'data-mini="true"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' where job = ''CLERK''',
' order by ename'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329271806556086693)
,p_plug_name=>'Collapse Set Smaller (Accordion) - Tab 1'
,p_parent_plug_id=>wwv_flow_api.id(2329271418977086692)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'data-mini="true"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from dept',
' order by dname'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'DNAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329272016576086693)
,p_plug_name=>'Collapse Set Smaller (Accordion) - Tab 3'
,p_parent_plug_id=>wwv_flow_api.id(2329271418977086692)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'data-mini="true"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' where job = ''SALESMAN''',
' order by ename'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329273913483113456)
,p_plug_name=>'Collapse Smaller - Open'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'data-mini="true"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326407707700032263)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from dept',
' order by dname'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'DNAME'
,p_attribute_09=>'NONE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329274119024115041)
,p_plug_name=>'Collapse Smaller - Closed'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'data-mini="true"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2355032081809468160)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' where job = ''CLERK''',
' order by ename'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INSET'
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Buttons'
,p_page_mode=>'NORMAL'
,p_step_title=>'Buttons'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150304052249'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2321114899506089313)
,p_plug_name=>'Icon Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2321652281356258426)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2321652800830258432)
,p_plug_name=>'Button Group'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326404904358965079)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329279112605155267)
,p_plug_name=>'100% Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329280525482183232)
,p_plug_name=>'Inline Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329281327345193233)
,p_plug_name=>'Button Group Vertical'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326404704096946118)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2329282421719210469)
,p_plug_name=>'Button Group Horizontal'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(2326404904358965079)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321652381287258427)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2321652800830258432)
,p_button_name=>'REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-refresh:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Refresh'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321652454793258428)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2321652800830258432)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-search:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321652551105258429)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2321652800830258432)
,p_button_name=>'STAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-star:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Star'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321652653098258430)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2321652800830258432)
,p_button_name=>'TAG'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-tag:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Tag'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321652783510258431)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(2321652800830258432)
,p_button_name=>'USER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-user:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'User'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329279325566164310)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2329279112605155267)
,p_button_name=>'100_BUTTON_NORMAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-corner-all'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'100% Button Normal'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329280730833183232)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2329280525482183232)
,p_button_name=>'INLINE_BUTTON_NORMAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Inline Button Normal'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329281509267193235)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2329281327345193233)
,p_button_name=>'BUTTON_GROUP_VERTICAL_NORMAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Button Group Vertical Normal'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329282604726210469)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2329282421719210469)
,p_button_name=>'BUTTON_GROUP_HORIZONTAL_NORMAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_image_alt=>'Button Group Horizontal Normal'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329279706304168221)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2329279112605155267)
,p_button_name=>'100_BUTTON_HOT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-corner-all'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'100% Button Hot'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329280925622183232)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2329280525482183232)
,p_button_name=>'INLINE_BUTTON_HOT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inline Button Hot'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329281729465193235)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2329281327345193233)
,p_button_name=>'BUTTON_GROUP_VERTICAL_HOT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Button Group Vertical Hot'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2329282806295210470)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2329282421719210469)
,p_button_name=>'BUTTON_GROUP_HORIZONTAL_HOT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(2326403612314891650)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Button Group Horizontal Hot'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651085342258414)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'CLOCK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-clock:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Clock'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651162560258415)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'EDIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-edit:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321633410166172392)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'ACTION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-action:ui-btn-icon-top'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Action'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321652194681258425)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'GEAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-gear:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Gear'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321649733278258401)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'ALERT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-alert:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Alert'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321652028379258424)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'GRID'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-grid:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Grid'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650227916258406)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'BACK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-back:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Back'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651991199258423)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'HOME'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-home:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Home'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650143357258405)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'BARS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-bars:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Bars'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651829984258422)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'INFO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-info:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Info'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321649902671258403)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'BULLETS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-bullets:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Bullets'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651745166258421)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'LOCATION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-location:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Location'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650344916258407)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'CALENDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-calendar:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Calendar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651653677258420)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'LOCK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-lock:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Lock'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650025514258404)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'DOWN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-carat-d:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Down'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651527198258419)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'MAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-mail:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Mail'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650414744258408)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'LEFT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-carat-l:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Left'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651459149258418)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'MINUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-minus:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Minus'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650535987258409)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'RIGHT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-carat-r:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Right'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651367672258417)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'PLUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-plus:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Plus'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650671129258410)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'UP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-carat-u:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Up'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321651275502258416)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(2321652281356258426)
,p_button_name=>'POWER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-power:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Power'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650752286258411)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'CHECK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-check:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Check'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650892959258412)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'CLOUD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-cloud:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Cloud'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321650930507258413)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'COMMENT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-comment:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Comment'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2321649848621258402)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(2321114899506089313)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'ui-btn-inline:ui-corner-all:ui-icon-delete:ui-btn-icon-left'
,p_button_template_id=>wwv_flow_api.id(2321531103932121492)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_CREATE'
);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Charts Overview'
,p_page_mode=>'NORMAL'
,p_step_title=>'Charts Overview'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2328110227053139633)
,p_plug_name=>'Charts Overview'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'select * from dept order by dname'
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_01=>'INSET'
,p_attribute_02=>'DNAME'
,p_attribute_09=>'NONE'
,p_attribute_14=>'f?p=&APP_ID.:21:&SESSION.::::P21_DEPTNO:&DEPTNO.'
);
end;
/
prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'Saleries'
,p_page_mode=>'NORMAL'
,p_step_title=>'Saleries'
,p_step_sub_title=>'Saleries'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124937'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2328110726649155649)
,p_plug_name=>'Saleries'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'data-enhance="false"'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(2328110901374155651)
,p_default_chart_type=>'Horizontal3DColumn'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_10946800950492406'
,p_chart_width=>500
,p_chart_height=>500
,p_chart_animation=>'N'
,p_display_attr=>':H:N:V:X:N:N::V:Y:None:::N:::Default:::P'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E::'
,p_pie_attr=>'Outside:::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'Tahoma:10:#000000'
,p_grid_labels_font=>'Tahoma:10:'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:#000000'
,p_y_axis_title_font=>'Tahoma:14:#000000'
,p_gauge_labels_font=>'Tahoma:10:'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(2328111015915155657)
,p_chart_id=>wwv_flow_api.id(2328110901374155651)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select NULL LINK,',
'       job as label,',
'       sum(sal) as value',
'  from emp',
' where deptno = :P21_DEPTNO',
' group by job',
' order by 3 desc',
''))
,p_series_type=>'Bar'
,p_series_required_role=>'%null%'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2328111201200161098)
,p_name=>'P21_DEPTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2328110726649155649)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
end;
/
prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'abc'
,p_page_mode=>'NORMAL'
,p_step_title=>'abc'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124937'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2331011425322958929)
,p_plug_name=>'abc'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'select * from emp'
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
);
end;
/
prompt --application/pages/page_00055
begin
wwv_flow_api.create_page(
 p_id=>55
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'emp'
,p_page_mode=>'NORMAL'
,p_step_title=>'emp'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124937'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2337308801104589219)
,p_plug_name=>'emp'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(2326389100925140930)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select e.*, substr(ename, 1, 1) as divider',
'  from emp e',
' where deptno = nvl(:P55_DEPTNO, deptno)',
' order by ename'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_ajax_items_to_submit=>'P55_DEPTNO'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>6
,p_plug_query_no_data_found=>'No Employees'
,p_attribute_01=>'INSET'
,p_attribute_02=>'ENAME'
,p_attribute_09=>'NONE'
,p_attribute_12=>'DIVIDER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2338835713865705479)
,p_name=>'P55_DEPTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2337308801104589219)
,p_prompt=>'Deptno'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select dname, deptno from dept order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- select department -'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(2326417710704175064)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2338835830141710237)
,p_name=>'Refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_DEPTNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2338836123704710239)
,p_event_id=>wwv_flow_api.id(2338835830141710237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2337308801104589219)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(2326322225257588503)
,p_name=>'instructions'
,p_page_mode=>'NORMAL'
,p_step_title=>'instructions'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(2326367111442698719)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150226124937'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2335616130950791869)
,p_plug_name=>'instructions'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Mobile:',
'',
'1) Neue Region on Dept mit Inset',
'2) Neue Region on Emp mit Inset',
'',
'-> multiple lists on one page',
'',
'',
'1) Neue Region mit',
'',
'select *',
'  from demo_product_info',
' order by category, product_name',
'',
'2) Inset Aktivieren',
'3) List Divider',
'4) Link',
'',
'f?p=&APP_ID.:10:&SESSION.::::P10_PRODUCT_ID:&PRODUCT_ID.',
'',
'4) Search',
'5) Counter',
'',
'select p.*,',
'       ( select sum(oi.quantity)',
'           from demo_order_items oi',
'          where oi.product_id = p.product_id',
'       ) as order_quantity',
'  from demo_product_info p',
' order by p.category, p.product_name',
'',
'6) Image',
'7) Advanced',
'',
'<h3>&PRODUCT_NAME.</h3>',
'<p>&PRODUCT_DESCRIPTION.</p>',
'',
'EUR <strong>&LIST_PRICE.</strong>',
'',
'8) Hierarchisch',
'',
'select ename,',
'       level',
'  from emp',
'connect by prior empno = mgr',
'  start with mgr is null',
' order siblings by ename',
'',
'9) Accordion',
'',
''))
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
