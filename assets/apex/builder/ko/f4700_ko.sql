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
,p_release=>'5.0.3.00.02'
,p_default_workspace_id=>10
,p_default_application_id=>4708
,p_default_owner=>'APEX_050000'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 4708 - Oracle APEX New Service Signup
--
-- Application Export:
--   Application:     4708
--   Name:            Oracle APEX New Service Signup
--   Exported By:     APEX_050000
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.02
--   Instance ID:     113808939374227
--

-- Application Statistics:
--   Pages:                     11
--     Items:                   42
--     Computations:             5
--     Validations:             39
--     Processes:                5
--     Regions:                 64
--     Buttons:                 25
--   Shared Components:
--     Logic:
--       Items:                 35
--       Computations:           2
--       Build Options:          1
--     Navigation:
--       Parent Tabs:            1
--       Lists:                  1
--     Security:
--       Authentication:         1
--       Authorization:          1
--     User Interface:
--       Templates:
--         Page:                 5
--         Region:              14
--         Label:                8
--         List:                 3
--         Popup LOV:            1
--         Button:               9
--       LOVs:                   3
--       Shortcuts:              1
--       Plug-ins:               1
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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,4708)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEX_050000')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX New Service Signup')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A902294542915408477')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20151205181359'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'ko'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(108165525079033088.4708)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:Application Express'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'&PRODUCT_NAME. 5.0.3.00.02'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'O'
,p_security_scheme=>wwv_flow_api.id(510672326686703270)
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'wwv_flow_error_dev.internal_error_handler'
,p_substitution_string_01=>'PRODUCT_NAME'
,p_substitution_value_01=>'Application Express'
,p_substitution_string_02=>'DONE'
,p_substitution_value_02=>'완료'
,p_substitution_string_03=>'MSG_COMPANY'
,p_substitution_value_03=>'작업 영역: &COMPANY.'
,p_substitution_string_04=>'CLOSE'
,p_substitution_value_04=>'닫기'
,p_substitution_string_05=>'DATE_FORMAT'
,p_substitution_value_05=>'rr/mm/dd'
,p_substitution_string_06=>'LONG_DATE_FORMAT'
,p_substitution_value_06=>'fmDay yyyy"년"mm"월"dd"일"'
,p_substitution_string_07=>'TIME_FORMAT'
,p_substitution_value_07=>'AM hh:mi:ss'
,p_substitution_string_08=>'DATE_TIME_FORMAT'
,p_substitution_value_08=>'rr/mm/dd AM hh:mi:ss'
,p_substitution_string_09=>'RETURN_TO_APPLICATION'
,p_substitution_value_09=>'응용 프로그램으로 돌아가기'
,p_substitution_string_10=>'MSG_LANGUAGE'
,p_substitution_value_10=>'언어'
,p_substitution_string_11=>'PRODUCT_TYPE'
,p_substitution_value_11=>'작업 영역 요청'
,p_substitution_string_12=>'MSG_COPYRIGHT'
,p_substitution_value_12=>'Copyright &copy; 1999, 2015, Oracle and/or its affiliates. All rights reserved.'
,p_last_upd_yyyymmddhh24miss=>'20151205181309'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(4762183464.4708)
,p_name=>'ProvisionNewService'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(60577706518684017.4708)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'유형'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'#IMAGE_PREFIX#htmldb/builder/step_current.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4770195076.4708)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'식별'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4836827003.4708)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'스키마'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'25,26,40'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(25699022299795195.4708)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'설문 조사'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(SURVEY_ENABLED_YN,''N'') = ''Y'' and id = 1'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(109218886058.4708)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'맞춤'
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'27'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(80382420312008140.4708)
,p_list_item_display_sequence=>65
,p_list_item_link_text=>'계약'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4764187459.4708)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'확인'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'30,3'
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
 p_id=>wwv_flow_api.id(1352228430926978.4708)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(14848914952940932.4708)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1765072946679712055.4708)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(510672326686703270.4708)
,p_name=>'Workspace Requests Enabled'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if nvl(wwv_flow_platform.get_preference(''SERVICE_REQUEST_FLOW''),''MANUAL'') in (''EMAIL'',''4700'') then',
'    return TRUE;',
'else',
'    return FALSE;',
'end if;'))
,p_error_message=>'작업 영역 요청이 사용으로 설정되지 않았습니다.'
,p_reference_id=>786950454140282960.4708
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25713507070566709.4708)
,p_name=>'A1'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25715301313574483.4708)
,p_name=>'A10'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25713709840567432.4708)
,p_name=>'A2'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25713912264568155.4708)
,p_name=>'A3'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25714115727569121.4708)
,p_name=>'A4'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25714319190570197.4708)
,p_name=>'A5'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25714521961570954.4708)
,p_name=>'A6'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25714725078571880.4708)
,p_name=>'A7'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25714927155572445.4708)
,p_name=>'A8'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25715129580573146.4708)
,p_name=>'A9'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(144047527689955702.4708)
,p_name=>'AGREEMENT_ACCEPTED'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(103247625354177724.4708)
,p_name=>'F4700_REQ_NEW_SCHEMA'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(318946157429.4708)
,p_name=>'HELP_PAGE'
,p_item_comment=>'flow page that you would like help for.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(8584002656832123.4708)
,p_name=>'LOGIN_MESSAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25782509996254728.4708)
,p_name=>'LOV_1'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25794005175480492.4708)
,p_name=>'LOV_10'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25792324437476584.4708)
,p_name=>'LOV_2'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25792625823477001.4708)
,p_name=>'LOV_3'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25792827554477507.4708)
,p_name=>'LOV_4'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25793029286478012.4708)
,p_name=>'LOV_5'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25793231017478467.4708)
,p_name=>'LOV_6'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25793400327479065.4708)
,p_name=>'LOV_7'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25793602058479541.4708)
,p_name=>'LOV_8'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25793803790480026.4708)
,p_name=>'LOV_9'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(8632704676428693.4708)
,p_name=>'PAGES_VISITED'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25700525687890714.4708)
,p_name=>'Q1'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25702323047899430.4708)
,p_name=>'Q10'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25700729496891839.4708)
,p_name=>'Q2'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25700931920892551.4708)
,p_name=>'Q3'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25701102269893436.4708)
,p_name=>'Q4'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25701305386894398.4708)
,p_name=>'Q5'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25701515775897352.4708)
,p_name=>'Q6'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25701717506897886.4708)
,p_name=>'Q7'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25701919238898391.4708)
,p_name=>'Q8'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25702120970898892.4708)
,p_name=>'Q9'
,p_protection_level=>'N'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(8650202046513064.4708)
,p_computation_sequence=>1
,p_computation_item=>'PAGES_VISITED'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if instr(:PAGES_VISITED,'':''||wwv_flow.g_flow_step_id) > 0 then',
'   return :PAGES_VISITED;',
'else',
'   return :PAGES_VISITED||'':''||wwv_flow.g_flow_step_id;',
'end if;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(103248202067189926.4708)
,p_computation_sequence=>10
,p_computation_item=>'F4700_REQ_NEW_SCHEMA'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wwv_flow_platform.get_preference(''REQ_NEW_SCHEMA'')'
,p_compute_when=>'nvl(wwv_flow_platform.get_preference(''SERVICE_REQUEST_FLOW''),''MANUAL'') <> ''MANUAL'''
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
wwv_flow_api.create_toplevel_tab(
 p_id=>wwv_flow_api.id(11450003334894502.4708)
,p_tab_set=>'TOP'
,p_tab_sequence=>20
,p_tab_name=>'T_TOP'
,p_tab_text=>'&PRODUCT_NAME.'
,p_tab_target=>'f?p=4700:10:&SESSION.:'
,p_current_on_tabset=>'HOME'
);
end;
/
prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(80457122175018113.4708)
,p_lov_name=>'ACCEPT TERMS'
,p_lov_query=>'.'||wwv_flow_api.id(80457122175018113)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(80457326295018115.4708)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'약관에 동의합니다.'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(150771414457811401.4708)
,p_lov_name=>'NEW_OR_EXISTING_SCHEMA'
,p_lov_query=>'.'||wwv_flow_api.id(150771414457811401)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(150771702466811402.4708)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'데이터베이스에서 기존 스키마 사용'
,p_lov_return_value=>'NO'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_lov_disp_cond=>'F4700_REQ_NEW_SCHEMA'
,p_lov_disp_cond2=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(150771902162811402.4708)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'새 스키마 요청'
,p_lov_return_value=>'YES'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(728312584834618523.4708)
,p_lov_name=>'WORKSPACE_TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(728312584834618523)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(728312822592618530.4708)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'응용 프로그램 개발'
,p_lov_return_value=>'BUILDER'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-app-builder'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(728313109611618535.4708)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'패키지된 응용 프로그램만'
,p_lov_return_value=>'APPS'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-pkg-apps'
);
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
 p_id=>wwv_flow_api.id(4674102852.4708)
,p_theme_id=>3
,p_name=>'printer-friendly.ko'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title><link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#</head><body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>'<br />#BODY#'
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="htmldbSuccessMessage" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h2 class="hideMeButHearMe">#NOTIFICATION_MESSAGE_HEADING#</h2>',
'<div class="htmldbNotification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>5
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>80874804748045950.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(18107622439281852.4708)
,p_theme_id=>3
,p_name=>'[EBA] Wizard.ko'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:apex="http://apex.oracle.com">',
'<head>',
'	<title>#TITLE#</title>',
'	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge" /><![endif]-->',
'	<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'	',
'	<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_uniframe.css" type="text/css" />',
'	<!--[if IE 7]>',
'	<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_uniframe_ie7.css" type="text/css" />',
'	<![endif]-->',
'	<!--[if IE 8]>',
'	<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/eba_uniframe_ie8.css" type="text/css" />',
'	<![endif]-->',
'	#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'	<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'	#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'#REGION_POSITION_01#',
'<div class="ebaFrame ebaWizardFrame ebaSmallWizard">',
'<div class="ebaFrameHeader">',
'		<h1 class="oracleLogo">',
'			#LOGO#',
'		</h1>',
'		<div class="ebaProgressBar">',
'#REGION_POSITION_02#',
'		</div>',
'</div> <!-- End .ebaFrameHeader -->',
'<div class="ebaContentContainer">',
'#REGION_POSITION_03#',
'	<div class="ebaContent">',
'#BODY#',
'	</div> <!-- End .ebaContent -->',
'</div> <!-- End .ebaContentContainer -->',
'	<div class="ebaFrameFooter">',
'#REGION_POSITION_04#',
'#REGION_POSITION_05#',
'	</div>',
'</div> <!-- End .ebaFrame -->',
'#REGION_POSITION_06#',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="htmldbSuccessMessage" id="MESSAGE" role="alert">',
'<h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>',
'<img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="#CLOSE_NOTIFICATION#" />#SUCCESS_MESSAGE#</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="htmldbNotification" id="MESSAGE" role="alert">',
'<h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'<img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="#CLOSE_NOTIFICATION#" />#MESSAGE#</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(728298792391563586.4708)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Sign Up Wizard.ko'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.builder.initWizardProgressBar();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!--[if HTML5]><![endif]-->',
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="no-js lt-ie9 lt-ie8 ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="no-js lt-ie9 ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="no-js ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'',
'  <meta charset="UTF-8" />',
'  <title>#TITLE#</title>',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'  ',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT# ',
'<!--[if lt IE 9]><script src="#IMAGE_PREFIX#libraries/apex/html5_ie.js"></script><![endif]-->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body class="a-Page--simpleWizard" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'#REGION_POSITION_02#',
'#REGION_POSITION_03#',
'<div class="u-Layout u-Layout--centerVertically">',
'  #BODY#',
'</div>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" role="alert" id="sucessMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-success">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-check"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h5 class="a-AlertMessages-messageTitle" id="sucessMsg-Message">#SUCCESS_MESSAGE#</h5>',
'      <button id="sucessMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#PD_MESSAGE_CLOSE" onclick="$x_Remove(''sucessMsg'');return false;"><span class="a-Icon'
||' icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" role="alert" id="errorMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-error">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-remove"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h5 class="a-AlertMessages-messageTitle" id="errorMsg-Message">#MESSAGE#</h5>',
'      <button id="errorMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#PD_MESSAGE_CLOSE" onclick="$x_Remove(''errorMsg'');return false;"><span class="a-Icon i'
||'con-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_08'
,p_theme_class_id=>1
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>702692008314080052.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(728299018883563592.4708)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.ko'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.builder.initWizardProgressBar();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!--[if HTML5]><![endif]-->',
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="no-js lt-ie9 lt-ie8 ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="no-js lt-ie9 ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="no-js ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'',
'  <meta charset="UTF-8" />',
'  <title>#TITLE#</title>',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'  ',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT# ',
'<!--[if lt IE 9]><script src="#IMAGE_PREFIX#libraries/apex/html5_ie.js"></script><![endif]-->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body class="a-Page--wizard #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div class="u-Layout u-Layout--centerVertically">',
'  <div class="a-Wizard a-Wizard--default">',
'    #REGION_POSITION_02#',
'    <div class="a-Wizard-controls">#REGION_POSITION_01#</div>',
'    <div class="a-Wizard-body">#BODY#</div>',
'    <div class="a-Wizard-buttons">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer class="a-Footer">',
'  <div class="a-Footer-info">',
'    <span class="a-Footer-attribute">',
'      <span class="a-Icon icon-user" title="&MSG_USER."></span>',
'      <span class="u-VisuallyHidden">&MSG_USER.</span>',
'      &USER.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span class="a-Icon icon-workspace" title="&MSG_WORKSPACE."></span>',
'      <span class="u-VisuallyHidden">&MSG_WORKSPACE.</span>',
'      &COMPANY.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span class="a-Icon icon-language" title="&MSG_LANGUAGE."></span>',
'      &BROWSER_LANGUAGE.',
'    </span>',
'  </div>',
'  <div class="a-Footer-copyright">&MSG_COPYRIGHT.</div>',
'  <div class="a-Footer-version">#FLOW_VERSION#</div>',
'</footer>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" role="alert" id="sucessMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-success">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-check"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h5 class="a-AlertMessages-messageTitle" id="sucessMsg-Message">#SUCCESS_MESSAGE#</h5>',
'      <button id="sucessMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#PD_MESSAGE_CLOSE" onclick="$x_Remove(''sucessMsg'');return false;"><span class="a-Icon'
||' icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" role="alert" id="errorMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-error">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-remove"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h5 class="a-AlertMessages-messageTitle" id="errorMsg-Message">#MESSAGE#</h5>',
'      <button id="errorMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#PD_MESSAGE_CLOSE" onclick="$x_Remove(''errorMsg'');return false;"><span class="a-Icon i'
||'con-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_sidebar_def_reg_pos=>'BODY_3'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_08'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--danger a-Alert--wizard a-Alert--defaultIcons">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'      </div>',
'      <div class="a-Alert-body">',
'        <h2 class="a-Alert-subTitle">#MESSAGE#</h2>',
'        #ADDITIONAL_INFO#',
'        #TECHNICAL_INFO#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--large a-Button--hot" onclick="#BACK_LINK#" type="button">#RETURN_TO_APPLICATION#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>702684260095026477.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824976787312308427.4708)
,p_page_template_id=>wwv_flow_api.id(728299018883563592.4708)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824977164944308427.4708)
,p_page_template_id=>wwv_flow_api.id(728299018883563592.4708)
,p_name=>'Wizard Progress List'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824977534964308429.4708)
,p_page_template_id=>wwv_flow_api.id(728299018883563592.4708)
,p_name=>'Wizard Title'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824977932305308429.4708)
,p_page_template_id=>wwv_flow_api.id(728299018883563592.4708)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(728303139008563600.4708)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Dialog.ko'
,p_is_popup=>true
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.builder.initWizardModal();',
'apex.builder.initWizardProgressBar();'))
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'#TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'#PAGE_CSS#',
'',
'    ',
'#APEX_JAVASCRIPT# ',
'<!--[if lt IE 9]><script src="#IMAGE_PREFIX#libraries/apex/html5_ie.js"></script><![endif]-->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'    ',
'    ',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width,initial-scale=1" />',
'</head>',
'<body class="a-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Dialog a-Dialog--wizard">',
'  <div class="a-Dialog-wrap">',
'    <div class=" a-Dialog-wizardSteps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="a-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="a-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--dialog" id="page_success_msg" role="alert">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 class="a-Alert-title">#SUCCESS_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body">',
'        #SUCCESS_MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_success_msg'');" value="#CLOSE_NOTIFICATION#" type="button" title="#CLOSE_NOTIFICATION#"><span class="a-Icon icon-remove"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--dialog" id="page_warning_msg" role="alert">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body">',
'        #MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_warning_msg'');" value="#CLOSE_NOTIFICATION#" type="button" title="#CLOSE_NOTIFICATION#"><span class="a-Icon icon-remove"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>        '))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'800'
,p_dialog_max_width=>'1200'
,p_dialog_css_classes=>'a-Dialog--wizard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>689061037088924910.4708
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(18109103748352135.4708)
,p_template_name=>'[EBA] Button'
,p_template=>'<a href="#LINK#" class="ebaButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(18109222795357646.4708)
,p_template_name=>'[EBA] Hot Button'
,p_template=>'<a href="#LINK#" class="ebaHotButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(18109301108360805.4708)
,p_template_name=>'[EBA] Hot Button (Next)'
,p_template=>'<a href="#LINK#" class="ebaHotButton ebaNextButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<img src="#IMAGE_PREFIX#f_spacer.gif" alt=""/></a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(18109418424365879.4708)
,p_template_name=>'[EBA] Button (Previous)'
,p_template=>'<a href="#LINK#" class="ebaButton ebaPrevButton" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><img src="#IMAGE_PREFIX#f_spacer.gif" alt=""/>#LABEL!HTML#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(481975242743888810.4708)
,p_template_name=>'APEX 5.0 - Button'
,p_template=>'<button onclick="#JAVASCRIPT#" class="a-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="a-Button a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174750904387485475.4708
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(481975658518888812.4708)
,p_template_name=>'APEX 5.0 - Button with Icon'
,p_template=>'<button class="a-Button a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_reference_id=>404889142313786233.4708
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(481975923749888812.4708)
,p_template_name=>'APEX 5.0 - Icon Menu Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_reference_id=>3705338883615.4708
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(481976264382888813.4708)
,p_template_name=>'APEX 5.0 - Icon Only Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CL'
||'ASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>353820721334283301.4708
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(516411350946385636.4708)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18108515260336521.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#CLOSE#<span>#PREVIOUS##NEXT##CREATE#</span>',
''))
,p_page_plug_template_name=>'[EBA] Wizard Buttons'
,p_theme_id=>3
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(18113207959457422.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ebaWizardText ebaFormTable" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'[EBA] Form Region'
,p_theme_id=>3
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(29133613931545850.4708)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'APEX 4.0 - DIV with ID'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>245224629509817478.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(481965601614717220.4708)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#PREVIOUS##BODY##NEXT#</div>'
,p_page_plug_template_name=>'APEX 5.0 - Div with ID, Class, and Region Attributes'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(481969298650741033.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Wizard-controls u-Table #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="u-Table-fit u-textLeft a-Wizard-buttons">',
'  #PREVIOUS#',
'  </div>',
'  <div class="u-Table-fill">',
'    <div class="a-Wizard-steps">',
'      #BODY#',
'    </div>',
'    #CREATE#',
'  </div>',
'  <div class="u-Table-fit u-textRight a-Wizard-buttons">',
'  #NEXT#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Wizard Progress + Buttons'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(481970015003751305.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <h1 class="a-Wizard-title">#TITLE#</h1>',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Wizard'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(728272729796557092.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-ButtonRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="a-ButtonRegion-wrap">',
'    <div class="a-ButtonRegion-col a-ButtonRegion-col--left"><div class="a-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'    <div class="a-ButtonRegion-col a-ButtonRegion-col--content">',
'      <h2 class="a-ButtonRegion-title">#TITLE#</h2>',
'      #BODY#',
'      <div class="a-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="a-ButtonRegion-col a-ButtonRegion-col--right"><div class="a-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Button Region'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_template_options=>'a-ButtonRegion--wizard'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>687153470345619376.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(728279364278557123.4708)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#PREVIOUS##BODY##NEXT#</div>'
,p_page_plug_template_name=>'New APEX 5.0 - Div with ID, Class, and Region Attributes'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>716895227337398760.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(728280005939557124.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Region a-Region--hideShow #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="a-Region-header">',
'    <div class="a-Region-headerItems  a-Region-headerItems--controls">',
'      <button class="a-Button a-Button--icon a-Button--hideShow" type="button"></button>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--title">',
'      <h2 class="a-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--buttons">',
'      #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'    </div>',
'  </div>',
'  <div class="a-Region-body">',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Hide + Show Region'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_template_options=>'a-Region--flush'
,p_preset_template_options=>'is-expanded'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>689955986849128825.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(728292067255557137.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aWizardRegion" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="wizardRegionHeading">',
'    <h1><a href="javascript:void(0);" onclick="$(''##REGION_STATIC_ID#_content'').slideToggle();$(''##REGION_STATIC_ID#_img'').toggleClass(''expanded'');" class="hideShowLink"><img src="#IMAGE_PREFIX#f_spacer.gif" class="hideShow" alt="" id="#REGION_STATIC'
||'_ID#_img"/>#TITLE#</a></h1>',
'    <div class="buttonContainer">',
'    #EDIT##CLOSE##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT##CREATE##CREATE2#',
'    </div>',
'  </div>',
'  <div class="hideShowRegion" id="#REGION_STATIC_ID#_content">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'APEX 5.0 - Wizard Body (Hide/Show)'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>399850559367741099.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(728292709128557138.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="wizardHeader" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Wizard Header'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>42210710875242480.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(728293431473557139.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Wizard-region a-Form #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <h2 class="u-VisuallyHidden">#TITLE#</h2>',
'  <div class="a-Wizard-regionHeader">#REGION_HEADER#</div>',
'  <div class="a-Wizard-regionBody">#BODY#</div>',
'  <div class="a-Wizard-regionFooter">#REGION_FOOTER#</div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Wizard Region'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>702777601713950915.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(728294112567557139.4708)
,p_layout=>'TABLE'
,p_template=>'<div class="#REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><h1 class="a-Wizard-title">#TITLE#</h1></div>'
,p_page_plug_template_name=>'APEX 5.0 - Wizard Title Region'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>703469000349150769.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(860617531457119334.4708)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="successRegion">',
'<h1>#TITLE#</h1>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'[EBA] Success Region'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(4794278052.4708)
,p_list_template_current=>'<tr><td class="htmldbStandardList1"><a href="#LINK#" class="itemLink" title="#TEXT_ESC_SC#">#TEXT#</a></td></tr>'
,p_list_template_noncurrent=>'<tr><td class="htmldbStandardList2"><a href="#LINK#" class="itemLink" title="#TEXT_ESC_SC#">#TEXT#</a></td></tr>'
,p_list_template_name=>'Standard List (c:htmldbStandardList) From 4999'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="htmldbStandardList" cellpadding="0" cellspacing="0" border="0" summary="">',
'<tbody>'))
,p_list_template_after_rows=>'</tbody></table>'
,p_reference_id=>17385324891888482.4708
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(18108230235321990.4708)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'	<li class="currentStep #LIST_STATUS#">',
'		<span></span>',
'	</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'	<li class="#LIST_STATUS#">',
'		<span></span>',
'	</li>'))
,p_list_template_name=>'[EBA] Wizard Progress'
,p_theme_id=>3
,p_theme_class_id=>17
,p_list_template_before_rows=>'<ul class="ebaProgressWizard">'
,p_list_template_after_rows=>' </ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(481972912021825750.4708)
,p_list_template_current=>'<li class="a-WizardSteps-step is-active"><div class="a-WizardSteps-wrap"><span class="a-WizardSteps-marker"><span class="a-Icon icon-wizard-step-complete"></span></span><span class="a-WizardSteps-label">#TEXT#</span></div></li>'
,p_list_template_noncurrent=>'<li class="a-WizardSteps-step"><div class="a-WizardSteps-wrap"><span class="a-WizardSteps-marker"><span class="a-Icon icon-wizard-step-complete"></span></span><span class="a-WizardSteps-label">#TEXT#</span></div></li>'
,p_list_template_name=>'APEX 5.0 - Wizard Progress'
,p_theme_id=>3
,p_theme_class_id=>17
,p_list_template_before_rows=>'<ul class="a-WizardSteps #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(18117622573511758.4708)
,p_template_name=>'[EBA] Optional w/ Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="ebaOptional"><a href="javascript:void(0)" tabindex="999" class="helpTip" data-item-id="#CURRENT_ITEM_ID#" data-session="&SESSION.">'
,p_template_body2=>'</a></label>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(18117725602511758.4708)
,p_template_name=>'[EBA] Required w/ Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="ebaRequired"><a href="javascript:void(0)" tabindex="999" class="helpTip" data-item-id="#CURRENT_ITEM_ID#" data-session="&SESSION.">'
,p_template_body2=>'</a></label>'
,p_on_error_after_label=>'<span class="ebaLabelError">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(18341322111783282.4708)
,p_template_name=>'No Label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="ebaNoLabel">'
,p_template_body2=>'</label>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(481972669929805619.4708)
,p_template_name=>'APEX 5.0 - Optional Label'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_reference_id=>487444299516703815.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(481972771960821314.4708)
,p_template_name=>'APEX 5.0 - Required Label'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'  <span class="a-Form-required"><span class="a-Icon icon-asterisk"></span></span><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_reference_id=>487443659585685414.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(516405744549268368.4708)
,p_template_name=>'APEX 5.0 - Optional Label (Above)'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer a-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_on_error_after_label=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_reference_id=>492676964457041934.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(516405998930268369.4708)
,p_template_name=>'APEX 5.0 - Required Label (Above)'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'  <span class="a-Form-required"><span class="a-Icon icon-asterisk"></span></span><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer a-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_reference_id=>492677038682043223.4708
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(805564588331659193.4708)
,p_template_name=>'APEX 5.0 - Hidden Label'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer a-Form-labelContainer--visuallyhidden">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label visuallyhidden">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_reference_id=>687907221148719616.4708
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
 p_id=>wwv_flow_api.id(14663214008465131.4708)
,p_page_name=>'winlov'
,p_page_title=>'검색 대화상자'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#APEX_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css?v=#APEX_VERSION#" type="text/css"/>',
'<link rel="stylesheet" href="#IMAGE_PREFIX#apex_ui/css/Theme-Standard#MIN#.css?v=#APEX_VERSION#" type="text/css"/>',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="a-Page a-Page--popupLOV"'
,p_before_field_text=>'<div class="a-PopupLOV-actions a-Form--large">'
,p_filter_width=>'15'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="a-Form-field a-Form-searchField"'
,p_find_button_text=>'검색'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'닫기'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'다음 &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; 이전'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">행 #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>200
,p_before_result_set=>'<div class="a-PopupLOV-links">'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>17343114994581872.4708
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(204024310335769388.4708)
,p_theme_id=>3
,p_name=>'Standard'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css',
'[if lte IE 9]#IMAGE_PREFIX#apex_ui/css/Core-ie#MIN#.css',
'#IMAGE_PREFIX#apex_ui/css/Theme-Standard#MIN#.css'))
,p_is_current=>true
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
 p_id=>wwv_flow_api.id(728273198308557106.4708)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(728273812208557117.4708)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(728274811074557119.4708)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(728281789702557125.4708)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(728282779546557126.4708)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(728284958660557127.4708)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746434995533421149.4708)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746436279201421149.4708)
,p_theme_id=>3
,p_name=>'FORM_LABEL_ALIGNMENT'
,p_display_name=>'Form Label Alignment'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Set Form Alignment for Grid Based forms'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746436594439421149.4708)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746436840999421149.4708)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746437988722421151.4708)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746438219342421151.4708)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746438589659421151.4708)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746438816241421151.4708)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746439137924421151.4708)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746439645845421152.4708)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746439918130421152.4708)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728276986572557122.4708)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728277248569557122.4708)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(728274811074557119)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728277525479557122.4708)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(728274811074557119)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728277818941557122.4708)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(728273812208557117)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728278146450557122.4708)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(728273812208557117)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728278498295557123.4708)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728278798769557123.4708)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_api.id(728273198308557106)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(728279089427557123.4708)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728272729796557092.4708)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_api.id(728273198308557106)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746435033845421149.4708)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_api.id(746434995533421149)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746435216989421149.4708)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_api.id(746434995533421149)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746435405988421149.4708)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_api.id(746434995533421149)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746435656825421149.4708)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_api.id(746434995533421149)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746435848002421149.4708)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_api.id(746434995533421149)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746436091506421149.4708)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_api.id(746434995533421149)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746436368676421149.4708)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(746436279201421149)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746436678574421149.4708)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_api.id(746436594439421149)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746436965719421149.4708)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_api.id(746436840999421149)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746437112234421149.4708)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_api.id(746436594439421149)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746437368469421149.4708)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_api.id(746436594439421149)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746437581881421150.4708)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_api.id(746436594439421149)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746437748876421150.4708)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_api.id(746436840999421149)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746438058857421151.4708)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_api.id(746437988722421151)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746438384706421151.4708)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(746438219342421151)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746438655416421151.4708)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_api.id(746438589659421151)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746438901201421151.4708)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(746438816241421151)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746439281590421151.4708)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_api.id(746439137924421151)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746439479283421151.4708)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(746436840999421149)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746439725429421152.4708)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746439645845421152)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746440034159421152.4708)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_api.id(746439918130421152)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746440162594421152.4708)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746440362741421152.4708)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_api.id(746438589659421151)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746440520463421152.4708)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_api.id(746438816241421151)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746440758010421152.4708)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_api.id(746439137924421151)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746440822788421152.4708)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746440925815421152.4708)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1199561525047032426.4708)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746439645845421152)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554852920727542292.4708)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554853081668542293.4708)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554853269909542294.4708)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(728273812208557117)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554853498802542294.4708)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(728273812208557117)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554853672639542294.4708)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(728284958660557127)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554853833133542294.4708)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(728274811074557119)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554854022496542294.4708)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(728281789702557125)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554854201680542294.4708)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(728281789702557125)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554854474957542294.4708)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(728282779546557126)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554854632648542294.4708)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(728280005939557124.4708)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(728282779546557126)
,p_template_types=>'REGION'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(46948758488708852.4708)
,p_build_option_name=>'company address'
,p_build_option_status=>'EXCLUDE'
,p_build_option_comment=>'we can avoid asking internal Oracle folks for address info'
);
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
 p_id=>wwv_flow_api.id(187203309767569784.4708)
,p_shortcut_name=>'ITEM_HELP'
,p_shortcut_type=>'HTML_TEXT'
,p_error_text=>'도움말을 표시할 수 없습니다.'
,p_reference_id=>24184979678.4708
,p_shortcut=>'<a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999" title="이 항목에 대한 도움말입니다."><img src="#IMAGE_PREFIX#infoicon_status_gray.gif" width="16" height="16" /></a>'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(108165525079033088.4708)
,p_name=>'Database'
,p_scheme_type=>'NATIVE_DAD'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_cookie_path=>'&CGI_SCRIPT_NAME.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Based on authentication scheme from gallery:No Authentication (using DAD)'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_wizard_selection
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(805561388021651744.4708)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.WIZARD_SELECTION'
,p_display_name=>'마법사 선택'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.WIZARD_SELECTION'),'')
,p_render_function=>'wwv_flow_f4000_plugins.render_wizard_selection'
,p_ajax_function=>'wwv_flow_f4000_plugins.ajax_wizard_selection'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:SOURCE:ELEMENT:LOV:LOV_REQUIRED:CASCADING_LOV'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_substitute_attributes=>true
,p_reference_id=>805558538998648898.4708
,p_subscribe_plugin_settings=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(805561682413651902.4708)
,p_plugin_id=>wwv_flow_api.id(805561388021651744.4708)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Icon Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'S'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(805562091226651903.4708)
,p_plugin_attribute_id=>wwv_flow_api.id(805561682413651902.4708)
,p_display_sequence=>10
,p_display_value=>'Small'
,p_return_value=>'S'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(805562552885651903.4708)
,p_plugin_attribute_id=>wwv_flow_api.id(805561682413651902.4708)
,p_display_sequence=>20
,p_display_value=>'Medium'
,p_return_value=>'M'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(805563001543651903.4708)
,p_plugin_attribute_id=>wwv_flow_api.id(805561682413651902.4708)
,p_display_sequence=>30
,p_display_value=>'Large'
,p_return_value=>'L'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(805563507507651905.4708)
,p_plugin_id=>wwv_flow_api.id(805561388021651744.4708)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Submit Page'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>'Select whether or not to submit the page when making a selection'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(4970202676302344.4708)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'데스크톱'
,p_display_seq=>10
,p_use_auto_detect=>true
,p_is_default=>true
,p_theme_id=>3
,p_home_url=>'f?p=4700:1:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_global_page_id=>.4708
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>true
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
 p_id=>.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_name=>'0'
,p_page_mode=>'NORMAL'
,p_step_title=>'0'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184900'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(384692482059932839.4708)
,p_plug_name=>'APEX 5 - Header'
,p_region_css_classes=>'a-Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="f?p=4000:1500:&APP_SESSION." class="a-Header-logo" title="Home">',
'  <span class="a-Header-apexLogo"></span>',
'</a>'))
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_tab_set=>'HOME'
,p_name=>'작업 영역 요청'
,p_page_mode=>'NORMAL'
,p_step_title=>'서비스 요청'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.a-WizardSteps-step.is-active .a-WizardSteps-label {',
'    display: block;',
'}',
'.a-WizardSteps-step .a-WizardSteps-label {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184900'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(384691444752932829.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(384691527009932830.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(384691444752932829.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(384692102633932836.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(384691527009932830.4708)
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(384691677393932831.4708)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_api.id(384691444752932829.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(728293431473557139.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<p class="a-Wizard-subHeading">어떤 유형의 작업 영역을 요청하겠습니까?</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(384692253736932837.4708)
,p_plug_name=>'Wizard Buttons'
,p_parent_plug_id=>wwv_flow_api.id(384691444752932829.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(384692330805932838.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(384692253736932837.4708)
,p_button_name=>'P1_NEXT'
,p_button_static_id=>'P1_NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'다음'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(384692558261932840.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(384692253736932837.4708)
,p_button_name=>'P1_CANCEL'
,p_button_static_id=>'P1_CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_css_classes=>'a-Button--large'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(741644129987187002.4708)
,p_branch_name=>'Redirect to Login Page'
,p_branch_action=>'f?p=4550:1'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(384692558261932840.4708)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(66683221933097168.4708)
,p_branch_name=>'Go To Page 20'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(692815844776250920.4708)
,p_name=>'WORKSPACE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(384691677393932831.4708)
,p_item_default=>'BUILDER'
,p_prompt=>'유형'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.WIZARD_SELECTION'
,p_named_lov=>'WORKSPACE_TYPE'
,p_lov=>'.'||wwv_flow_api.id(728312584834618523)||'.'
,p_field_template=>wwv_flow_api.id(805564588331659193.4708)
,p_item_css_classes=>'a-IconList--featured a-IconList--featured--wide'
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'S'
,p_attribute_02=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_name=>'작업 영역 요청 - 두번째 페이지'
,p_page_mode=>'NORMAL'
,p_step_title=>'작업 영역 요청 - 두번째 페이지'
,p_step_sub_title=>'Request Workspace - Second Page'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.a-WizardSteps-step.is-active .a-WizardSteps-label {',
'    display: block;',
'}',
'.a-WizardSteps-step .a-WizardSteps-label {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184900'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(624348233786280075.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(624348462275280075.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(624348233786280075.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(624348630378280075.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(624348462275280075.4708)
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(624348871164280076.4708)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_api.id(624348233786280075.4708)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(624350429513280083.4708)
,p_plug_name=>'Wizard Buttons'
,p_parent_plug_id=>wwv_flow_api.id(624348233786280075.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(624350696578280086.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(624350429513280083.4708)
,p_button_name=>'P2_NEXT'
,p_button_static_id=>'P2_NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'다음'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(624391705621329097.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(624350429513280083.4708)
,p_button_name=>'P2_PREVIOUS'
,p_button_static_id=>'P2_PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481976264382888813.4708)
,p_button_image_alt=>'이전'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(624350869612280090.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(624350429513280083.4708)
,p_button_name=>'P2_CANCEL'
,p_button_static_id=>'P2_CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(624352524796280096.4708)
,p_branch_name=>'Go To Page 25'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(624350696578280086.4708)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(624392091754336529.4708)
,p_branch_name=>'Go to Page 1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(624391705621329097.4708)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(741644387803197176.4708)
,p_branch_name=>'Redirect to Login Page'
,p_branch_action=>'f?p=4550:1'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(624350869612280090.4708)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(624349012704280076.4708)
,p_name=>'ADMIN_FIRST_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(624348871164280076.4708)
,p_prompt=>'이름'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(481972771960821314.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(624349255885280079.4708)
,p_name=>'ADMIN_LAST_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(624348871164280076.4708)
,p_prompt=>'성'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(481972771960821314.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(624349478067280079.4708)
,p_name=>'ADMIN_EMAIL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(624348871164280076.4708)
,p_prompt=>'전자 메일'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(481972771960821314.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'이 전자 메일 주소로 계정 정보가 전송됩니다.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(624349967806280083.4708)
,p_name=>'COMPANY_NAME'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(624348871164280076.4708)
,p_prompt=>'작업 영역'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'a-Form-field u-textUpper'
,p_field_template=>wwv_flow_api.id(481972771960821314.4708)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'소유하려는 작업 영역 이름을 입력하십시오. 작업 영역이 프로비전되면 작업 영역/사용자 이름/비밀번호 조합을 사용하여 로그인하십시오.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(624351113308280091.4708)
,p_computation_sequence=>20
,p_computation_item=>'COMPANY_NAME'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'trim(:COMPANY_NAME)'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(624351739240280095.4708)
,p_validation_name=>'ADMIN_FIRST_NAME not null'
,p_validation_sequence=>10
,p_validation=>'ADMIN_FIRST_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(624349012704280076.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(624351943922280095.4708)
,p_validation_name=>'ADMIN_LAST_NAME not null'
,p_validation_sequence=>20
,p_validation=>'ADMIN_LAST_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(624349255885280079.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(624352137233280095.4708)
,p_validation_name=>'ADMIN_EMAIL not null'
,p_validation_sequence=>30
,p_validation=>'ADMIN_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(624349478067280079.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(624352336404280096.4708)
,p_validation_name=>'ADMIN_EMAIL must be valid'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_at number;',
'  l_dot number;',
'begin',
'  l_at := instr(nvl(:ADMIN_EMAIL,''x''),''@'');',
'  l_dot := instr(nvl(:ADMIN_EMAIL,''x''),''.'',l_at);',
'  return l_at > 1 and l_dot > 1 and (l_dot - l_at) > 1;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'부적합한 전자 메일'
,p_always_execute=>'N'
,p_validation_condition=>'ADMIN_EMAIL'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(624350696578280086.4708)
,p_associated_item=>wwv_flow_api.id(624349478067280079.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(624351399015280093.4708)
,p_validation_name=>'company doesn''t already exist'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- Company name must be unique even if previous request was declined, since',
'-- it is possible to reactivate declined requests (and there is a unique index',
'-- on the company name).',
'for c1 in (select null',
'             from wwv_flow_provision_company',
'            where company_name = upper(:COMPANY_NAME)',
'              --and project_status not in (''DECLINED'', ''TERMINATED'')',
') loop',
'    return false;',
'end loop;',
'',
'for c1 in (select null',
'             from wwv_flow_companies',
'            where short_name = upper(:COMPANY_NAME)',
') loop',
'    return false;',
'end loop;',
'',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'다른 작업 영역 이름을 입력하십시오.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(624350696578280086.4708)
,p_associated_item=>wwv_flow_api.id(624349967806280083.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(624351561451280095.4708)
,p_validation_name=>'Invalid characters in workspace name'
,p_validation_sequence=>60
,p_validation=>'COMPANY_NAME'
,p_validation2=>' <>'
,p_validation_type=>'ITEM_IN_VALIDATION_CONTAINS_NO_CHAR_IN_STRING2'
,p_error_message=>'작업 영역 이름이 부적합합니다.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(624350696578280086.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_name=>'작업 영역 요청 - 확인'
,p_page_mode=>'NORMAL'
,p_step_title=>'Oracle Application Express'
,p_step_sub_title=>'Confirmation'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184900'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26270707309302905.4708)
,p_plug_name=>'작업 영역이 요청되었습니다.'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18348331817861713.4708)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_api.id(26270707309302905.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516145500301081707.4708)
,p_plug_name=>'Wizard Body'
,p_parent_plug_id=>wwv_flow_api.id(26270707309302905.4708)
,p_region_css_classes=>'a-Wizard-body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.prn(''<div class="a-Wizard-success">'');',
'sys.htp.prn(''<div class="a-Wizard-icon"><span class="a-Icon a-Icon--xl icon-check"></span></div>'');',
'sys.htp.prn(''<h2 class="a-Wizard-subTitle">'');',
'sys.htp.prn(wwv_flow_lang.system_message(',
'    ''WORKSPACE_SIGNUP_SUCCESS_01'',',
'    ''<strong>''||',
'     wwv_flow_escape.html(:P3_COMPANY_NAME)||',
'     ''</strong>''));',
'sys.htp.prn(''</h2><p class="a-Wizard-text">'');',
'sys.htp.prn(wwv_flow_lang.system_message(''WORKSPACE_SIGNUP_SUCCESS_02'',',
'    wwv_flow_escape.html(:P3_ADMIN_EMAIL)));',
'sys.htp.prn(''</p>'');',
'sys.htp.prn(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18348522944868646.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18348331817861713.4708)
,p_button_name=>'FINISH'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'사인인 화면으로 진행'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=4550:1:&SESSION.'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(235693425700565320.4708)
,p_name=>'P3_COMPANY_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26270707309302905.4708)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(235693721602567173.4708)
,p_name=>'P3_ADMIN_EMAIL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26270707309302905.4708)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_name=>'설문 조사 질문'
,p_page_mode=>'NORMAL'
,p_step_title=>'서비스 요청'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184900'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25696603898761468.4708)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(18108515260336521.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516394643687212836.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516394851182212837.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(516394643687212836.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516145498582081706.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(516394851182212837.4708)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516395010313212838.4708)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_api.id(516394643687212836.4708)
,p_region_css_classes=>'a-Wizard-body a-Form'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25696432164760206.4708)
,p_plug_name=>'&PRODUCT_NAME. 등록'
,p_parent_plug_id=>wwv_flow_api.id(516395010313212838.4708)
,p_region_css_classes=>'a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26648304716757938.4708)
,p_plug_name=>'Pre Text'
,p_parent_plug_id=>wwv_flow_api.id(516395010313212838.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (select PRE_SURVEY_TEXT from WWV_FLOW_PROV_SIGNUP_Q where id = 1 and PRE_SURVEY_TEXT is not null) loop',
'   sys.htp.prn(''<p class="a-Wizard-text a-Wizard-text--pre">'');',
'   sys.htp.prn(c1.PRE_SURVEY_TEXT);',
'   sys.htp.prn(''</p>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26648804847767366.4708)
,p_plug_name=>'Post Text'
,p_parent_plug_id=>wwv_flow_api.id(516395010313212838.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (select POST_SURVEY_TEXT from WWV_FLOW_PROV_SIGNUP_Q where id = 1 and POST_SURVEY_TEXT is not null) loop',
'   sys.htp.prn(''<p class="a-Wizard-text a-Wizard-text--post">'');',
'   sys.htp.prn(c1.POST_SURVEY_TEXT);',
'   sys.htp.prn(''</p>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516395225562212838.4708)
,p_plug_name=>'Wizard Buttons'
,p_parent_plug_id=>wwv_flow_api.id(516394643687212836.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25697412694761472.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(516395225562212838.4708)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'다음'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25697023233761471.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(516395225562212838.4708)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481976264382888813.4708)
,p_button_image_alt=>'이전'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25696820320761471.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(516395225562212838.4708)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(25698009916772677.4708)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(25697412694761472.4708)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517470352545983375.4708)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(25697412694761472.4708)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517470693841985745.4708)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(25697412694761472.4708)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25699805554856566.4708)
,p_name=>'P24_Q1'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q1.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin return :LOV_1; end;',
''))
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q1'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25702726426919309.4708)
,p_name=>'P24_Q2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q2.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_2; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q2'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25703326211928720.4708)
,p_name=>'P24_Q3'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q3.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_3; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q3'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25703724011994311.4708)
,p_name=>'P24_Q4'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q4.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_4; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q4'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25777606991111943.4708)
,p_name=>'P24_Q5'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q5.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_5; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q5'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25778026731117668.4708)
,p_name=>'P24_Q6'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q6.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_6; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q6'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25778229501118422.4708)
,p_name=>'P24_Q7'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q7.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_7; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q7'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25778431925119147.4708)
,p_name=>'P24_Q8'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q8.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_8; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q8'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25778601582119878.4708)
,p_name=>'P24_Q9'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q9.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_9; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q9'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25778810239122410.4708)
,p_name=>'P24_Q10'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(25696432164760206.4708)
,p_prompt=>'&Q10.'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'begin return :LOV_10; end;'
,p_tag_css_classes=>'a-Form-radio a-Form-radio--longLabels'
,p_display_when=>'Q10'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517957195019106801.4708)
,p_validation_name=>'P24_Q1'
,p_validation_sequence=>10
,p_validation=>'P24_Q1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q1'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(25699805554856566.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517957657444109073.4708)
,p_validation_name=>'P24_Q2'
,p_validation_sequence=>20
,p_validation=>'P24_Q2'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q2'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517958236752112011.4708)
,p_validation_name=>'P24_Q3'
,p_validation_sequence=>30
,p_validation=>'P24_Q3'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q3'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517958400795112554.4708)
,p_validation_name=>'P24_Q4'
,p_validation_sequence=>40
,p_validation=>'P24_Q4'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q4'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517958664493113319.4708)
,p_validation_name=>'P24_Q5'
,p_validation_sequence=>50
,p_validation=>'P24_Q5'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q5'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517958828394113925.4708)
,p_validation_name=>'P24_Q6'
,p_validation_sequence=>60
,p_validation=>'P24_Q6'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q6'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517959294776114427.4708)
,p_validation_name=>'P24_Q7'
,p_validation_sequence=>70
,p_validation=>'P24_Q7'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q7'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517959538183114913.4708)
,p_validation_name=>'P24_Q8'
,p_validation_sequence=>80
,p_validation=>'P24_Q8'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q8'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517959792447115409.4708)
,p_validation_name=>'P24_Q9'
,p_validation_sequence=>90
,p_validation=>'P24_Q9'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q9'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(517959974835115917.4708)
,p_validation_name=>'P24_Q10'
,p_validation_sequence=>100
,p_validation=>'P24_Q10'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'필수'
,p_always_execute=>'N'
,p_validation_condition=>'Q10'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(25697412694761472.4708)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25700112527886954.4708)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set questions'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   l_vc_arr2   apex_application_global.vc_arr2; ',
'   l_Lov varchar2(4000);',
'   function get_query (p_question in varchar2 default null) return varchar2',
'   is',
'   begin',
'      if p_question is null then return null; else',
'      l_vc_arr2 :=APEX_UTIL.STRING_TO_TABLE(p_separator=>chr(10),p_string=>replace(replace(p_question,'''''''',''''''''''''),chr(13),null));',
'      l_Lov := ''select x d, x r from ('';',
'      for i in 1..l_vc_arr2.count loop',
'         l_Lov := l_Lov||'' select ''''''||l_vc_arr2(i)||'''''' x from dual union all'';',
'      end loop;',
'      l_lov := l_lov ||'' select ''''a'''' x from dual where 1 = 2)'';',
'      return l_lov;',
'      end if;',
'   end;',
'begin',
'for c1 in (select * from WWV_FLOW_PROV_SIGNUP_Q where id = 1) loop',
':Q1 := c1.SURVEY_QUESTION_01; :LOV_1 := get_query(c1.SURVEY_ANSWER_01);',
':Q2 := c1.SURVEY_QUESTION_02; :LOV_2 := get_query(c1.SURVEY_ANSWER_02);',
':Q3 := c1.SURVEY_QUESTION_03; :LOV_3 := get_query(c1.SURVEY_ANSWER_03);',
':Q4 := c1.SURVEY_QUESTION_04; :LOV_4 := get_query(c1.SURVEY_ANSWER_04);',
':Q5 := c1.SURVEY_QUESTION_05; :LOV_5 := get_query(c1.SURVEY_ANSWER_05);',
':Q6 := c1.SURVEY_QUESTION_06; :LOV_6 := get_query(c1.SURVEY_ANSWER_06);',
':Q7 := c1.SURVEY_QUESTION_07; :LOV_7 := get_query(c1.SURVEY_ANSWER_07);',
':Q8 := c1.SURVEY_QUESTION_08; :LOV_8 := get_query(c1.SURVEY_ANSWER_08);',
':Q9 := c1.SURVEY_QUESTION_09; :LOV_9 := get_query(c1.SURVEY_ANSWER_09);',
':Q10 := c1.SURVEY_QUESTION_10; :LOV_10 := get_query(c1.SURVEY_ANSWER_10);',
'end loop;',
'end;'))
);
end;
/
prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_tab_set=>'HOME'
,p_name=>'작업 영역 요청 - 스키마 지정'
,p_page_mode=>'NORMAL'
,p_step_title=>'작업 영역 요청 - 스키마 지정'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20151205181309'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4863831037.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29261829463725446.4708)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_api.id(4863831037.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516145120027081703.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(4863831037.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516145206173081704.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(516145120027081703.4708)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516145337648081705.4708)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_api.id(4863831037.4708)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18350230104012648.4708)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4841831018.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(29261829463725446.4708)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'다음'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4893430263.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(29261829463725446.4708)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481976264382888813.4708)
,p_button_image_alt=>'이전'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_button_condition=>'F4700_REQ_NEW_SCHEMA'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4839831015.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(29261829463725446.4708)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(177096326383922599.4708)
,p_branch_action=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4841831018.4708)
,p_branch_sequence=>10
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :NEW_SCHEMA = ''YES'' then',
'  return false;',
'else',
'  for c1 in (select 1 from dual where',
' wwv_flow_provisioning.restricted_schema_i(:P25_SCHEMA,:COMPANY_NAME) = ''1''',
'union all ',
'select 1 from wwv_flow_company_schemas where schema = :P25_SCHEMA) loop',
'  return true;',
'  end loop;',
'  return false;',
'end if;'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(25800727750666745.4708)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4841831018.4708)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(66700008567178536.4708)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517333648995125819.4708)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4841831018.4708)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1617426846755257730.4708)
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'NEW_SCHEMA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4849831028.4708)
,p_name=>'DATABASE_SIZE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(516145337648081705.4708)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_default number;',
'begin',
'    for c1 in (select req_size',
'                 from wwv_flow_workspace_req_size',
'                where request_type = ''N''',
'                  and default_size = ''Y'') loop',
'        l_default := c1.req_size;',
'        exit;',
'    end loop;',
'    return l_default;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'공간 할당'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select req_size||'' MB'' d, req_size r',
'  from wwv_flow_workspace_req_size',
' where request_type = ''N''',
'   and display = ''Y''',
' order by to_number(req_size)'))
,p_cHeight=>1
,p_tag_attributes2=>'class="instructiontext"'
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'YES'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'필요한 디스크 공간의 양을 선택하십시오. 스키마가 생성되면 필요한 경우 공간을 추가로 요청할 수 있습니다.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(320269887457.4708)
,p_name=>'SCHEMA_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(516145337648081705.4708)
,p_prompt=>'스키마 이름'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'YES'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(481972771960821314.4708)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'이 스키마는 데이터베이스 객체를 소유할 Oracle 데이터베이스 사용자입니다. 스키마 변경은 복잡한 작업이므로 이 이름을 선택할 때 약간의 시간이 소요될 수 있습니다. 서비스가 등록되면 스키마 비밀번호와 로그인 비밀번호가 전송됩니다. 작업 영역이 생성되면 스키마를 더 추가할 수 있습니다.',
'',
'',
'',
'적합한 스키마 이름은 다음 지침을 따라야 합니다.',
'',
' - 1-30바이트 길이여야 함\n',
' - 따옴표를 포함할 수 없음',
'',
' - 문자로 시작해야 함\n',
' - 밑줄(_), 달러($) 및 파운드(#) 기호를 제외한\n',
' 영숫자만 포함할 수 있음',
'',
' - Oracle 예약어일 수 없음',
'',
' - DUAL일 수 없음'))
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11472001772984287.4708)
,p_name=>'EXISTING_SCHEMA_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(516145337648081705.4708)
,p_prompt=>'기존 스키마'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'NO'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(481972771960821314.4708)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'새 &PRODUCT_NAME. 작업 영역에 액세스할 수 있도록 하려는 스키마 이름을 입력하십시오. 작업 영역이 생성되면 스키마를 더 추가할 수 있습니다.',
''))
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36459510251028490.4708)
,p_name=>'NEW_SCHEMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(516145337648081705.4708)
,p_prompt=>'구성'
,p_source=>'YES'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'NEW_OR_EXISTING_SCHEMA'
,p_lov=>'.'||wwv_flow_api.id(150771414457811401)||'.'
,p_lov_translated=>'Y'
,p_display_when=>'F4700_REQ_NEW_SCHEMA'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'새 작업 영역에 대해 새 데이터베이스 스키마를 생성할지 또는 기존 데이터베이스 스키마를 구성할지 여부를 선택하십시오.'
,p_attribute_01=>'1'
,p_attribute_02=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172217307242398784.4708)
,p_name=>'NEW_SCHEMA_HINT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(516145337648081705.4708)
,p_source=>'wwv_flow_lang.system_message(''F4700.NEW_SCHEMA_HINT'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'a-Wizard-text'
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'YES'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(18341322111783282.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172222728497414363.4708)
,p_name=>'EXISTING_SCHEMA_HINT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(516145337648081705.4708)
,p_source=>'wwv_flow_lang.system_message(''F4700.EXISTING_SCHEMA_HINT'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'a-Wizard-text'
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'NO'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(18341322111783282.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177097216171957551.4708)
,p_name=>'P25_SCHEMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(18350230104012648.4708)
,p_display_as=>'NATIVE_HIDDEN'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(177098721282977925.4708)
,p_computation_sequence=>10
,p_computation_item=>'P25_SCHEMA'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'nvl(upper(:EXISTING_SCHEMA_NAME), upper(:SCHEMA_NAME))'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(241344206807542545.4708)
,p_computation_sequence=>20
,p_computation_item=>'NEW_SCHEMA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :F4700_REQ_NEW_SCHEMA = ''Y''',
'   then return ''YES'';',
'else ',
'    return ''NO'';',
'end if;'))
,p_compute_when=>'NEW_SCHEMA'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(174995802627402506.4708)
,p_validation_name=>'new schema name not null'
,p_validation_sequence=>10
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'스키마 이름을 지정해야 합니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(320269887457.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(174996724098408796.4708)
,p_validation_name=>'existing schema name not null'
,p_validation_sequence=>20
,p_validation=>'EXISTING_SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'스키마 이름을 지정해야 합니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(11472001772984287.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(16910421773188557.4708)
,p_validation_name=>'schema exists'
,p_validation_sequence=>30
,p_validation=>'wwv_flow_security.exists_db_user(upper(:EXISTING_SCHEMA_NAME))'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'&EXISTING_SCHEMA_NAME. 스키마가 존재하지 않습니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(11472001772984287.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(31864751459513493.4708)
,p_validation_name=>'new schema does not exist'
,p_validation_sequence=>50
,p_validation=>'wwv_flow_security.get_db_user_or_role(upper(:SCHEMA_NAME)) is null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'다른 스키마 이름을 입력하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(320269887457.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(31865013913542993.4708)
,p_validation_name=>'no spaces in name'
,p_validation_sequence=>70
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_CONTAINS_NO_SPACES'
,p_error_message=>'스키마 이름에 공백이 있으면 안됩니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(320269887457.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47216914721574906.4708)
,p_validation_name=>'schema name cant contain quotes'
,p_validation_sequence=>80
,p_validation=>'instr(:SCHEMA_NAME,'''''''')+instr(:SCHEMA_NAME,''"'') = 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'스키마 이름에 따옴표가 있으면 안됩니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(320269887457.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(47217711926597880.4708)
,p_validation_name=>'cannot be an oracle reserved word'
,p_validation_sequence=>90
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_provision.schema_name_valid(',
'    p_schema            => :SCHEMA_NAME,',
'    p_workspace_name    => :COMPANY_NAME);'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'스키마 이름(&SCHEMA_NAME.)이 예약되었거나 제한된 이름입니다. 다른 스키마를 입력하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(320269887457.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(59988904879054677.4708)
,p_validation_name=>'schema name is valid'
,p_validation_sequence=>100
,p_validation=>'wwv_flow_utilities.is_valid_identifier(:SCHEMA_NAME)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'스키마 이름이 부적합합니다. 다른 이름을 지정하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(320269887457.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(175009024256995482.4708)
,p_validation_name=>'new schema not used in existing workspace'
,p_validation_sequence=>110
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'  from wwv_flow_company_schemas',
' where schema = upper(:SCHEMA_NAME)',
'   and not exists (',
'           -- Exclude earlier validation to avoid duplicate error messages',
'           select null from sys.all_users where username = upper(:SCHEMA_NAME)',
'       )'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'다른 스키마 이름을 입력하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(320269887457.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13059725120036431.4708)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove bad char from schema name'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':schema_name := trim(replace(:schema_name,''-'',''_''));',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,''\'','''');',
':schema_name := replace(:schema_name,''/'','''');',
':schema_name := replace(:schema_name,''['','''');',
':schema_name := replace(:schema_name,'']'','''');',
':schema_name := replace(:schema_name,''('','''');',
':schema_name := replace(:schema_name,'')'','''');',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,''\'','''');',
':schema_name := replace(:schema_name,''/'','''');',
':schema_name := replace(:schema_name,''+'','''');',
':schema_name := replace(:schema_name,''='','''');',
':schema_name := replace(:schema_name,''*'','''');',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,''$'','''');',
':schema_name := replace(:schema_name,''&'','''');',
':schema_name := replace(:schema_name,'';'','''');',
':schema_name := replace(:schema_name,''%'','''');',
':schema_name := replace(:schema_name,''#'','''');',
':schema_name := replace(:schema_name,''@'','''');',
':schema_name := replace(:schema_name,''!'','''');',
':schema_name := replace(:schema_name,''~'','''');',
':schema_name := replace(:schema_name,''`'','''');',
':schema_name := replace(:schema_name,'''''''','''');',
':schema_name := replace(:schema_name,'':'','''');',
':schema_name := replace(:schema_name,''"'','''');',
':schema_name := replace(:schema_name,''?'','''');',
':schema_name := replace(:schema_name,''<'','''');',
':schema_name := replace(:schema_name,''>'','''');',
':schema_name := replace(:schema_name,''{'','''');',
':schema_name := replace(:schema_name,''}'','''');',
':schema_name := replace(:schema_name,''.'','''');',
':schema_name := replace(:schema_name,'','','''');',
':schema_name := replace(:schema_name,''^'','''');'))
);
end;
/
prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_name=>'작업 영역 요청 - 스키마 경고'
,p_page_mode=>'NORMAL'
,p_step_title=>'작업 영역 요청 - 스키마 경고'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184901'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177082418885844385.4708)
,p_plug_name=>'경고'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(18113207959457422.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(195695513611201651.4708)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(18108515260336521.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517949648797931799.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517949851182931801.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(517949648797931799.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517950053089931801.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(517949851182931801.4708)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517950234959931802.4708)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_api.id(517949648797931799.4708)
,p_region_css_classes=>'a-Wizard-body a-Form'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517952931820969756.4708)
,p_plug_name=>'Shared Schema Warning'
,p_parent_plug_id=>wwv_flow_api.id(517950234959931802.4708)
,p_region_css_classes=>'a-Wizard-warning'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>310
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-Wizard-icon"><span class="a-Icon a-Icon--xl icon-warning"></span></div>'');',
'sys.htp.p(''<p class="a-Wizard-text">'');',
'sys.htp.p(wwv_flow_lang.system_message(p_name=>''F4700.P26_WARN_SHARED_SCHEMA'',p0=>v(''PRODUCT_NAME'')));',
'sys.htp.p(''</p>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from wwv_flow_company_schemas where schema = upper(:P25_SCHEMA)'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517953857557021232.4708)
,p_plug_name=>'Restricted Schema Warning'
,p_parent_plug_id=>wwv_flow_api.id(517950234959931802.4708)
,p_region_css_classes=>'a-Wizard-warning'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>320
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-Wizard-icon"><span class="a-Icon a-Icon--xl icon-warning"></span></div>'');',
'sys.htp.p(''<p class="a-Wizard-text">'');',
'sys.htp.p(wwv_flow_lang.system_message(p_name=>''F4700.P26_WARN_RESTRICTED_SCHEMA'',p0=>v(''PRODUCT_NAME'')));',
'sys.htp.p(''</p>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 from dual where',
' wwv_flow_provisioning.restricted_schema_i(:P25_SCHEMA,:COMPANY_NAME) = ''1'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517950490437931802.4708)
,p_plug_name=>'Wizard Buttons'
,p_parent_plug_id=>wwv_flow_api.id(517949648797931799.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(752122034442695897.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(728294112567557139.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177082802719844403.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(517950490437931802.4708)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'다음'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177083008639844403.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(517950490437931802.4708)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481976264382888813.4708)
,p_button_image_alt=>'이전'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177082609759844393.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(517950490437931802.4708)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(66706514632218067.4708)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(177082802719844403.4708)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(25801706888679653.4708)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(177082802719844403.4708)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517472394235011586.4708)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(177082802719844403.4708)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'' and id = 1'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517472886591015296.4708)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(177082802719844403.4708)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177084702792844420.4708)
,p_name=>'P26_RESTRICTED_SCHEMA_WARNING'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(517950234959931802.4708)
,p_use_cache_before_default=>'NO'
,p_source=>'wwv_flow_lang.system_message(p_name=>''F4700.P26_WARN_RESTRICTED_SCHEMA'',p0=>v(''PRODUCT_NAME''))'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_tag_css_classes=>'a-Wizard-text'
,p_label_alignment=>'ABOVE'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 from dual where',
' wwv_flow_provisioning.restricted_schema_i(:P25_SCHEMA,:COMPANY_NAME) = ''1'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(18341322111783282.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177095520711911576.4708)
,p_name=>'P26_SCHEMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(517950234959931802.4708)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
);
end;
/
prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_tab_set=>'HOME'
,p_name=>'작업 영역 요청 - 프로젝트 설명'
,p_page_mode=>'NORMAL'
,p_step_title=>'작업 영역 요청 - 프로젝트 설명'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184901'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516408864658385622.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516409065144385626.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(516408864658385622.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516409204387385627.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(516409065144385626.4708)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516409441539385628.4708)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_api.id(516408864658385622.4708)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p class="a-Wizard-text">이 정보는 &PRODUCT_NAME. 관리자가 이 서비스의 용도를 파악하는 데 유용합니다.</p>',
'<p class="a-Wizard-text">&P27_MORE_JUSTIFICATION.</p>'))
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516411073780385633.4708)
,p_plug_name=>'Wizard Buttons'
,p_parent_plug_id=>wwv_flow_api.id(516408864658385622.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(516411245858385636.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(516411073780385633.4708)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'다음'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(109157847214.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(516411073780385633.4708)
,p_button_name=>'Back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481976264382888813.4708)
,p_button_image_alt=>'이전'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(516411647143385640.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(516411073780385633.4708)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(516362650992934299.4708)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:28::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(66702007660187721.4708)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(516411245858385636.4708)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(25802015676691687.4708)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(109157847214.4708)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(25802200570696805.4708)
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(109157847214.4708)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''N'''
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109173847225.4708)
,p_name=>'PROJECT_DESCRIPTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(516409441539385628.4708)
,p_prompt=>'이 서비스를 요청하는 이유를 제공하십시오.'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(516405998930268369.4708)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'서비스 요청 목적을 입력하십시오. 이 정보는 &PRODUCT_NAME. 관리자 참조용입니다.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109175847225.4708)
,p_name=>'PROJECT_JUSTIFICATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(516409441539385628.4708)
,p_prompt=>'서비스 요청 근거(선택 사항)'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>32767
,p_cHeight=>8
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(516405744549268368.4708)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'회사 또는 서비스 계약에 따라 요청에 대한 근거가 필요할 경우 근거를 제공하십시오.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177451430104093580.4708)
,p_name=>'P27_MORE_JUSTIFICATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(516409441539385628.4708)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(516405744549268368.4708)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(177458508913257768.4708)
,p_computation_sequence=>10
,p_computation_item=>'P27_MORE_JUSTIFICATION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare x varchar2(32767) := null;',
'begin',
'    if wwv_flow_provisioning.restricted_schema_i(:P25_SCHEMA,:COMPANY_NAME) = ''1'' then',
'      x := wwv_flow_lang.system_message(''F4700.P26_JUSTIFY_RESTRICTED_SCHEMA'');',
'    end if;      ',
'    for c1 in (select 1 from wwv_flow_company_schemas ',
'        where schema = :P25_SCHEMA) loop',
'      if x is not null then x := x||''<p />''; end if;',
'      x := x||wwv_flow_lang.system_message(''F4700.P26_JUSTIFY_SHARED_SCHEMA'');',
'      exit;',
'    end loop;',
'    return x||''<p />'';',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(109236958762.4708)
,p_validation_name=>'PROJECT_DESCRIPTION Not Null'
,p_validation_sequence=>10
,p_validation=>'PROJECT_DESCRIPTION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'이 서비스를 요청하는 이유를 설명해야 합니다.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(109173847225.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 23-FEB-2001 12:53'
);
end;
/
prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_name=>'서비스 계약'
,p_page_mode=>'NORMAL'
,p_step_title=>'서비스 계약'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184901'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80230402173993477.4708)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(18108515260336521.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517967421599265744.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517967654884265745.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(517967421599265744.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517967892852265745.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(517967654884265745.4708)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517968022564265746.4708)
,p_plug_name=>'Wizard Form'
,p_parent_plug_id=>wwv_flow_api.id(517967421599265744.4708)
,p_region_css_classes=>'a-Wizard-body a-Form'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80170923513990161.4708)
,p_plug_name=>'Agreement'
,p_parent_plug_id=>wwv_flow_api.id(517968022564265746.4708)
,p_region_css_classes=>'a-Wizard-agreement'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   l_clob      clob;',
'   c             pls_integer := 0;',
'   l_amount number;',
'   l_offset    number;',
'   l_buffer    varchar2(32767);',
'begin',
'   for c1 in (select AGREEMENT_TEXT from WWV_FLOW_PROV_SIGNUP_Q where id = 1) loop',
'   l_clob := c1.AGREEMENT_TEXT;',
'   if sys.dbms_lob.getlength(l_clob) > 0 then',
'        l_amount := 4000;',
'        l_offset := 1;',
'        begin',
'            loop',
'                sys.dbms_lob.read( l_clob, l_amount, l_offset, l_buffer );',
'                sys.htp.prn( replace(l_buffer,chr(10),''<br />'') );',
'                l_offset := l_offset + l_amount;',
'                l_amount := 32000;',
'            end loop;',
'        exception',
'            when no_data_found then',
'                null;',
'        end;',
'    end if;',
'    end loop;',
'end;',
'',
' '))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81409728268284890.4708)
,p_plug_name=>'Accept terms'
,p_parent_plug_id=>wwv_flow_api.id(517968022564265746.4708)
,p_region_css_classes=>'a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(517968214545265746.4708)
,p_plug_name=>'Wizard Buttons'
,p_parent_plug_id=>wwv_flow_api.id(517967421599265744.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80231020051993478.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(517968214545265746.4708)
,p_button_name=>'Proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'다음'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon a-Button--strongLabel'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80230815227993478.4708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(517968214545265746.4708)
,p_button_name=>'Back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481976264382888813.4708)
,p_button_image_alt=>'이전'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80230614027993477.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(517968214545265746.4708)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(80315521913999183.4708)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(80231020051993478.4708)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517475649795114509.4708)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(80230815227993478.4708)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(SURVEY_ENABLED_YN,''N'') = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517475870611116622.4708)
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(80230815227993478.4708)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517475139255103367.4708)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(80230815227993478.4708)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80434718366017037.4708)
,p_name=>'P28_ACCEPT_TERMS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(81409728268284890.4708)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ACCEPT TERMS'
,p_lov=>'.'||wwv_flow_api.id(80457122175018113)||'.'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(144094305310958675.4708)
,p_computation_sequence=>10
,p_computation_item=>'AGREEMENT_ACCEPTED'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P28_ACCEPT_TERMS'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(247493906498726082.4708)
,p_validation_name=>'terms accepted'
,p_validation_sequence=>10
,p_validation=>'P28_ACCEPT_TERMS'
,p_validation2=>'Y'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>'계속하려면 약관에 동의해야 합니다.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(80231020051993478.4708)
,p_associated_item=>wwv_flow_api.id(80434718366017037.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_tab_set=>'HOME'
,p_name=>'작업 영역 요청 - 확인'
,p_page_mode=>'NORMAL'
,p_step_title=>'작업 영역 요청 - 확인'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184901'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516416294096463438.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94840826419648214.4708)
,p_plug_name=>'Wizard Body'
,p_parent_plug_id=>wwv_flow_api.id(516416294096463438.4708)
,p_region_css_classes=>'a-Wizard-body a-Form a-Form--large'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p class="a-Wizard-text">작업 영역 요청을 확인하십시오.</p>'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'code remove for justification',
'htp.p(''<tr>'');',
'htp.p(''<td>''||wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.JUSTIFICATION'')||''</td>'');',
'htp.p(''<td class="htmldbFDB">''||htf.escape_sc(substr(:PROJECT_JUSTIFICATION,1,50))||''...</td>'');',
'htp.p(''</tr>'');'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26272310950341776.4708)
,p_plug_name=>'Verification Code'
,p_parent_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_region_css_classes=>'a-Wizard-verification'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.p(''<p>'' || wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.ACCEPT'')||''</p>'');',
'',
'sys.htp.p(''<table class="htmldbStandard3" cellspacing="0" cellpadding="0" border="0" summary="">'');',
'sys.htp.p(''<tr>'');',
'sys.htp.p(''<td class="htmldbFDB"><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=1&p_sessionid=''|| :APP_SESSION ||''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=2&p_sessionid=''|| :APP_SESSI'
||'ON ||''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=3&p_sessionid=''|| :APP_SESSION ||''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=4&p_sessionid=''|| :APP_SESSI'
||'ON ||''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=5&p_sessionid=''|| :APP_SESSION ||''" height="60", width="40"/>',
' </td>'');',
'sys.htp.p(''</tr>'');',
'sys.htp.p(''</table>'');',
'sys.htp.p(''<a href="f?p=4700:30:''||:app_session||''">''||wwv_flow_lang.system_message(''REGEN_VER'')||''</a>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_platform.get_preference(''REQUIRE_VERIFICATION_CODE'') = ''Y'''
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htp.p(''<p>'' || wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.ACCEPT'')||''</p>'');',
'',
'htp.p(''<table class="htmldbStandard3" cellspacing="0" cellpadding="0" border="0" summary="">'');',
'htp.p(''<tr>'');',
'htp.p(''<td class="htmldbFDB"><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=1&p_sessionid=''|| :APP_SESSION ||''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=2&p_sessionid=''|| :APP_SESSION |'
||'|''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=3&p_sessionid=''|| :APP_SESSION ||''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=4&p_sessionid=''|| :APP_SESSION |'
||'|''" height="60", width="40"/><img src="#OWNER#.wwv_flow_image_generator.get_image?p_position=5&p_sessionid=''|| :APP_SESSION ||''" height="60", width="40"/>',
' </td>'');',
'htp.p(''</tr>'');',
'htp.p(''</table>'');',
'htp.p(''<a href="f?p=4700:30:''||:app_session||''">''||wwv_flow_lang.system_message(''REGEN_VER'')||''</a>'');'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516416468522463439.4708)
,p_plug_name=>'Wizard Progress Bar'
,p_parent_plug_id=>wwv_flow_api.id(516416294096463438.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516416609246463439.4708)
,p_plug_name=>'Wizard Progress List'
,p_parent_plug_id=>wwv_flow_api.id(516416468522463439.4708)
,p_region_sub_css_classes=>'a-WizardSteps--displayCurrentLabelOnly'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4762183464.4708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(481972912021825750.4708)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(516418271756463442.4708)
,p_plug_name=>'Wizard Buttons'
,p_parent_plug_id=>wwv_flow_api.id(516416294096463438.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(318141939408.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(516418271756463442.4708)
,p_button_name=>'Accept'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'요청 제출'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--large a-Button--strongLabel'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(318938118262.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(516418271756463442.4708)
,p_button_name=>'Back_button'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481976264382888813.4708)
,p_button_image_alt=>'이전'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_css_classes=>'a-Button--large a-Button--largeIcon'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(516418625242463444.4708)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(516418271756463442.4708)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975242743888810.4708)
,p_button_image_alt=>'취소'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=4550:1'
,p_button_css_classes=>'a-Button--large a-Button--padLeft'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(60145132142214439.4708)
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(318141939408.4708)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517468015163944139.4708)
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(318938118262.4708)
,p_branch_sequence=>15
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(AGREEMENT_ENABLED_YN,''N'') = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(388346306877278713.4708)
,p_branch_action=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(318938118262.4708)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where nvl(JUSTIFICATION_REQUIRED_YN,''Y'') = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517414131433361542.4708)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(318938118262.4708)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'select 1 from WWV_FLOW_PROV_SIGNUP_Q where SURVEY_ENABLED_YN = ''Y'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(517415202755367631.4708)
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(318938118262.4708)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26273021255363662.4708)
,p_name=>'P30_WORKSPACE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'작업 영역 이름'
,p_source=>'COMPANY_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26401719484160967.4708)
,p_name=>'P30_WORKSPACE_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'설명'
,p_source=>'PROJECT_DESCRIPTION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26402116498169624.4708)
,p_name=>'P30_FIRST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'이름'
,p_source=>'ADMIN_FIRST_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26402322731171379.4708)
,p_name=>'P30_LAST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'성'
,p_source=>'ADMIN_LAST_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26402504854175640.4708)
,p_name=>'P30_ADMIN_EMAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'관리자 전자 메일'
,p_source=>'ADMIN_EMAIL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26402731520183408.4708)
,p_name=>'P30_USE_EXISTING_SCHEMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'기존 스키마 사용'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :NEW_SCHEMA = ''NO'' then',
'  return wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.YES'');',
'else',
' return wwv_flow_lang.system_message(p_name=>''SERVICE_SIGNUP.NO'');',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26403006848195226.4708)
,p_name=>'P30_SCHEMA_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'스키마 이름'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :NEW_SCHEMA = ''YES'' then',
'    return :SCHEMA_NAME;',
'else',
'    return :EXISTING_SCHEMA_NAME;',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26403223124199902.4708)
,p_name=>'P30_DB_SIZE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(94840826419648214.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'데이터베이스 크기(MB)'
,p_source=>'DATABASE_SIZE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_display_when=>'NEW_SCHEMA'
,p_display_when2=>'YES'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29906703634753342.4708)
,p_name=>'P30_VERIFICATION_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26272310950341776.4708)
,p_use_cache_before_default=>'NO'
,p_prompt=>'확인 코드'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>5
,p_tag_css_classes=>'a-Form-field a-Form-field--readOnly'
,p_display_when=>'wwv_flow_platform.get_preference(''REQUIRE_VERIFICATION_CODE'') = ''Y'''
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(481972669929805619.4708)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'이 상자에 표시된 확인 코드를 입력해야 합니다.',
'문자는 <b>대소문자를 구분</b>하므로 입력할 때 주의해야 합니다.'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29962128538283685.4708)
,p_validation_name=>'verification code matched'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in (',
'        select * from wwv_flow_request_verifications',
'         where session_id = :APP_SESSION',
'    ) loop',
'        if c1.verification_string = :P30_VERIFICATION_CODE then',
'            return true;',
'        else',
'            -- Reset incorrectly entered verification code in session state',
'            -- since this value is not very useful (the user will see a new',
'            -- code).',
'            apex_util.set_session_state(',
'                p_name  => ''P30_VERIFICATION_CODE'',',
'                p_value => ''''',
'            );',
'            return false;',
'        end if;',
'    end loop;',
'',
'    return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'부적합한 확인 코드'
,p_always_execute=>'N'
,p_validation_condition=>'wwv_flow_platform.get_preference(''REQUIRE_VERIFICATION_CODE'') = ''Y'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(29906703634753342.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(143943821324944409.4708)
,p_validation_name=>'values exist'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'trim(:COMPANY_NAME) is not null',
'and trim(:ADMIN_EMAIL) is not null'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'모든 값이 제대로 설정되지 않았습니다. 작업 영역 요청 프로세스를 재시작하십시오.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(247624218797767424.4708)
,p_validation_name=>'terms accepted'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_AGREEMENT_ENABLED_YN varchar2(1) := ''N'';',
'begin',
'    for c1 in (',
'        select AGREEMENT_ENABLED_YN ',
'          from WWV_FLOW_PROV_SIGNUP_Q ',
'         where id = 1',
'    ) loop',
'        l_AGREEMENT_ENABLED_YN := nvl(c1.AGREEMENT_ENABLED_YN, ''N'');',
'    end loop;',
'',
'    if l_AGREEMENT_ENABLED_YN != ''Y'' then',
'        return true;',
'    elsif l_AGREEMENT_ENABLED_YN = ''Y'' and :AGREEMENT_ACCEPTED = ''Y'' then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'약관이 제대로 동의되지 않았습니다.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184197002254427848.4708)
,p_validation_name=>'new schema name not null'
,p_validation_sequence=>40
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'스키마 이름을 지정해야 합니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184242065158429229.4708)
,p_validation_name=>'existing schema name not null'
,p_validation_sequence=>50
,p_validation=>'EXISTING_SCHEMA_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'스키마 이름을 지정해야 합니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184242341374430656.4708)
,p_validation_name=>'schema exists'
,p_validation_sequence=>60
,p_validation=>'wwv_flow_security.exists_db_user(upper(:EXISTING_SCHEMA_NAME))'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'&EXISTING_SCHEMA_NAME. 스키마가 존재하지 않습니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''NO'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184242602392431985.4708)
,p_validation_name=>'new schema does not exist'
,p_validation_sequence=>70
,p_validation=>'wwv_flow_security.get_db_user_or_role(upper(:SCHEMA_NAME)) is null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'다른 스키마 이름을 입력하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184247877095437803.4708)
,p_validation_name=>'no spaces in name'
,p_validation_sequence=>80
,p_validation=>'SCHEMA_NAME'
,p_validation_type=>'ITEM_CONTAINS_NO_SPACES'
,p_error_message=>'스키마 이름에 공백이 있으면 안됩니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184248749119438943.4708)
,p_validation_name=>'schema name cant contain quotes'
,p_validation_sequence=>90
,p_validation=>'instr(:SCHEMA_NAME,'''''''')+instr(:SCHEMA_NAME,''"'') = 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'스키마 이름에 따옴표가 있으면 안됩니다.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184249045719440018.4708)
,p_validation_name=>'cannot be an oracle reserved word'
,p_validation_sequence=>100
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_provision.schema_name_valid(',
'    p_schema            => :SCHEMA_NAME,',
'    p_workspace_name    => :COMPANY_NAME);'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'스키마 이름(&SCHEMA_NAME.)이 예약되었거나 제한된 이름입니다. 다른 스키마를 입력하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184249340031441378.4708)
,p_validation_name=>'schema name is valid'
,p_validation_sequence=>110
,p_validation=>'wwv_flow_utilities.is_valid_identifier(:SCHEMA_NAME)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'스키마 이름이 부적합합니다. 다른 이름을 지정하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2184249626926442496.4708)
,p_validation_name=>'new schema not used in existing workspace'
,p_validation_sequence=>120
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'  from wwv_flow_company_schemas',
' where schema = upper(:SCHEMA_NAME)',
'   and not exists (',
'           -- Exclude earlier validation to avoid duplicate error messages',
'           select null from sys.all_users where username = upper(:SCHEMA_NAME)',
'       )'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'다른 스키마 이름을 입력하십시오.'
,p_always_execute=>'N'
,p_validation_condition=>':NEW_SCHEMA = ''YES'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(318141939408.4708)
,p_associated_item=>wwv_flow_api.id(.4708)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16952718581632268.4708)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit request'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_schema        wwv_flow_provision_company.schema_name%type;',
'    l_database_size varchar2(1000);',
'begin',
'    if :NEW_SCHEMA = ''YES'' then',
'        l_schema := :SCHEMA_NAME;',
'        l_database_size := :DATABASE_SIZE;',
'    else',
'        l_schema := :EXISTING_SCHEMA_NAME;',
'    end if;',
'',
'    wwv_flow_provisioning.make_request (',
'        p_COMPANY_NAME          => :COMPANY_NAME,',
'        p_ADMIN_FIRST_NAME      => :ADMIN_FIRST_NAME,',
'        p_ADMIN_LAST_NAME       => :ADMIN_LAST_NAME,',
'        p_ADMIN_EMAIL           => :ADMIN_EMAIL,',
'        p_ADMIN_PHONE           => :ADMIN_PHONE,',
'        p_ADMIN_USERID          => :ADMIN_EMAIL,',
'        p_COMPANY_ADDRESS       => null,',
'        p_CITY                  => null,',
'        p_STATE                 => null,',
'        p_ZIP                   => null,',
'        p_COUNTRY               => null,',
'        p_COMPANY_TYPE          => null,',
'        p_COMPANY_PHONE         => null,',
'        p_COMPANY_FAX           => null,',
'        p_DATABASE_SIZE         => l_database_size,',
'        p_SCHEMA_NAME           => l_schema,',
'        p_project_description   => :PROJECT_DESCRIPTION,',
'        p_project_justification => :PROJECT_JUSTIFICATION,',
'        p_workspace_type        => :WORKSPACE_TYPE,',
'        p_question_1            => :Q1,',
'        p_answer_1              => :P24_Q1,',
'        p_question_2            => :Q2,',
'        p_answer_2              => :P24_Q2,',
'        p_question_3            => :Q3,',
'        p_answer_3              => :P24_Q3,',
'        p_question_4            => :Q4,',
'        p_answer_4              => :P24_Q4,',
'        p_question_5            => :Q5,',
'        p_answer_5              => :P24_Q5,',
'        p_question_6            => :Q6,',
'        p_answer_6              => :P24_Q6,',
'        p_question_7            => :Q7,',
'        p_answer_7              => :P24_Q7,',
'        p_question_8            => :Q8,',
'        p_answer_8              => :P24_Q8,',
'        p_question_9            => :Q9,',
'        p_answer_9              => :P24_Q9,',
'        p_question_10           => :Q10,',
'        p_answer_10             => :P24_Q10',
'    );',
'    --',
'    wwv_flow_mail.push_queue_background();',
'end;'))
,p_process_error_message=>'&MSG_COMPANY.을(를) 요청하는 중 오류가 발생했습니다.'
,p_process_when_button_id=>wwv_flow_api.id(318141939408.4708)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(235706412746607558.4708)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear cache'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    c_company_name constant wwv_flow_provision_company.company_name%type := :COMPANY_NAME;',
'    c_admin_email  constant wwv_flow_provision_company.admin_email%type := :ADMIN_EMAIL;',
'begin',
'    wwv_flow_session_state.clear_state_for_application(:APP_ID);',
'',
'    apex_util.set_session_state(',
'        p_name  => ''P3_COMPANY_NAME'',',
'        p_value => c_company_name',
'    );',
'    apex_util.set_session_state(',
'        p_name  => ''P3_ADMIN_EMAIL'',',
'        p_value => c_admin_email',
'    );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(318141939408.4708)
);
end;
/
prompt --application/pages/page_00073
begin
wwv_flow_api.create_page(
 p_id=>73.4708
,p_user_interface_id=>wwv_flow_api.id(4970202676302344.4708)
,p_name=>'&PRODUCT_NAME. 작업 영역 생성'
,p_page_mode=>'NORMAL'
,p_step_title=>'&PRODUCT_NAME. 작업 영역 생성'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'&PRODUCT_NAME. Workspace Creation'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'<!--',
'function showLoading(){',
'  window.setTimeout(''doSubmit(\''CREATE_WORKSPACE\'')'',100);',
'  window.setTimeout(''$x("loadingIcon").src = $x("loadingIcon").src'', 100);',
'}',
'-->',
'</script>'))
,p_step_template=>wwv_flow_api.id(728298792391563586.4708)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEADM/aadm_hm.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184901'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(698805774605413350.4708)
,p_plug_name=>'작업 영역 요청'
,p_region_css_classes=>'a-Wizard--requestWorkspace'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481970015003751305.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(785007512742389611.4708)
,p_plug_name=>'Ticker Event'
,p_parent_plug_id=>wwv_flow_api.id(698805774605413350.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.p(''<script type="text/javascript" language="javascript">',
'addLoadEvent(showLoading);',
'</script>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P73_STATUS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(785007731946389617.4708)
,p_plug_name=>'Approval Status'
,p_parent_plug_id=>wwv_flow_api.id(698805774605413350.4708)
,p_region_css_classes=>'a-Wizard-body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-Wizard-success">'');',
'sys.htp.p(''<h2 class="a-Wizard-subTitle u-tC">'');',
'sys.htp.prn(wwv_flow_lang.system_message(''F4350.CREATING_WORKSPACE''));',
'sys.htp.p(''...</h2>'');',
'sys.htp.p(''<span class="u-Processing" style="position: relative; margin: 48px auto; left: 0;"><span class="u-Processing-spinner"></span></span>'');',
'sys.htp.p(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P73_STATUS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(785007904613389618.4708)
,p_plug_name=>'Workspace Creation Status'
,p_parent_plug_id=>wwv_flow_api.id(698805774605413350.4708)
,p_region_css_classes=>'a-Wizard-body'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P73_STATUS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(825233966004277601.4708)
,p_plug_name=>'Workspace Successfully Created'
,p_parent_plug_id=>wwv_flow_api.id(785007904613389618.4708)
,p_region_css_classes=>'a-Wizard-success'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481965601614717220.4708)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'sys.htp.p(''<div class="a-Wizard-text">''||:P73_STATUS||''</div>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Wizard-icon"><span class="a-Icon a-Icon--xl icon-check"></span></div>',
'<h2 class="a-Wizard-subTitle">작업 영역이 성공적으로 생성됨</h2>'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(861065721162173096.4708)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_api.id(698805774605413350.4708)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(481969298650741033.4708)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(861008913543170914.4708)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(861065721162173096.4708)
,p_button_name=>'FINISH'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(481975658518888812.4708)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'사인인 화면으로 진행'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'&P73_SIGN_IN_URL.'
,p_button_execute_validations=>'N'
,p_button_condition=>'P73_STATUS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(785009012421389623.4708)
,p_branch_action=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(785008112786389619.4708)
,p_name=>'P73_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(825233966004277601.4708)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(785603515624489906.4708)
,p_name=>'PROVISION_ID'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(785007904613389618.4708)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2210612504487687901.4708)
,p_name=>'P73_SIGN_IN_URL'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_api.id(785007904613389618.4708)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(785008723931389621.4708)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Provision workspace'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_fnd_developer_api.f4700_73_provision_workspace(',
'    p_provision_id => :PROVISION_ID,',
'    p_sign_in_url  => :P73_SIGN_IN_URL,',
'    p_msg          => :P73_STATUS );',
''))
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
