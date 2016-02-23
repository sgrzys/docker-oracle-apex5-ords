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
,p_default_application_id=>4307
,p_default_owner=>'APEX_050000'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 4307 - Oracle APEX Data Workshop
--
-- Application Export:
--   Application:     4307
--   Name:            Oracle APEX Data Workshop
--   Exported By:     APEX_050000
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.02
--   Instance ID:     113808939374227
--

-- Application Statistics:
--   Pages:                     23
--     Items:                   96
--     Computations:            26
--     Validations:             72
--     Processes:               41
--     Regions:                 92
--     Buttons:                 57
--     Dynamic Actions:         18
--   Shared Components:
--     Logic:
--       Items:                  6
--       Processes:              1
--       Computations:           1
--       Build Options:          1
--     Navigation:
--       Lists:                 12
--       Breadcrumbs:            1
--         Entries:             26
--       NavBar Entries:         2
--     Security:
--       Authentication:         1
--       Authorization:          9
--     User Interface:
--       Templates:
--         Page:                13
--         Region:              30
--         Label:                8
--         List:                12
--         Popup LOV:            1
--         Breadcrumb:           2
--         Button:               6
--         Report:               6
--       LOVs:                  20
--       Shortcuts:              1
--       Plug-ins:               7
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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,4307)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEX_050000')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX Data Workshop')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A902261126979382010')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'N'
,p_checksum_salt_last_reset=>'20151205181359'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'zh-tw'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(539653303570634151.4307)
,p_application_tab_set=>1
,p_logo_image=>'#IMAGE_PREFIX#apex_ui/apexlogo.png'
,p_logo_image_attributes=>'width="282" height="20" alt="&PRODUCT_NAME."'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'&PRODUCT_NAME. 5.0.3.00.02'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_security_scheme=>wwv_flow_api.id(12527124696576833)
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'wwv_flow_error_dev.internal_error_handler'
,p_substitution_string_01=>'LOGOUT'
,p_substitution_value_01=>'登出'
,p_substitution_string_02=>'PRODUCT_NAME'
,p_substitution_value_02=>'Application Express'
,p_substitution_string_03=>'MSG_COMPANY'
,p_substitution_value_03=>'工作區: &COMPANY.'
,p_substitution_string_04=>'MSG_LANGUAGE'
,p_substitution_value_04=>'語言'
,p_substitution_string_05=>'MSG_COPYRIGHT'
,p_substitution_value_05=>'版權所有 &copy; 1999, 2015, Oracle. 保留一切權利.'
,p_substitution_string_06=>'MSG_USER'
,p_substitution_value_06=>'使用者'
,p_substitution_string_07=>'MSG_JSCRIPT'
,p_substitution_value_07=>'您必須啟用 JavaScript, 才能執行本產品.'
,p_substitution_string_08=>'MSG_TBL_SUMMARY'
,p_substitution_value_08=>'頁面版面配置表格'
,p_substitution_string_09=>'DONE'
,p_substitution_value_09=>'完成'
,p_substitution_string_10=>'TOP'
,p_substitution_value_10=>'返回頁首'
,p_substitution_string_11=>'CLOSE'
,p_substitution_value_11=>'關閉'
,p_substitution_string_12=>'DATE_FORMAT'
,p_substitution_value_12=>'yyyy/mm/dd'
,p_substitution_string_13=>'LONG_DATE_FORMAT'
,p_substitution_value_13=>'fmDay yyyy"年"mm"月"dd"日"'
,p_substitution_string_14=>'TIME_FORMAT'
,p_substitution_value_14=>'AM hh:mi:ss'
,p_substitution_string_15=>'DATE_TIME_FORMAT'
,p_substitution_value_15=>'yyyy/mm/dd AM hh:mi:ss'
,p_substitution_string_16=>'RETURN_TO_APPLICATION'
,p_substitution_value_16=>'返回應用程式'
,p_substitution_string_17=>'DELETE_MSG'
,p_substitution_value_17=>'要執行此刪除動作嗎?'
,p_substitution_string_18=>'FIND'
,p_substitution_value_18=>'尋找'
,p_substitution_string_19=>'HELP'
,p_substitution_value_19=>'說明'
,p_last_upd_yyyymmddhh24miss=>'20151205181315'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2202106852499122.4307)
,p_name=>'Data Workshop Home Page Icons'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(260022612007597680.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'匯入儲存區域'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(260023118587599550.4307)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'試算表匯入'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2206807807518397.4307)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'儲存區域'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3648913903408259.4307)
,p_name=>'data import'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3653931134432189.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'文字資料匯入儲存區域'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_list_item_disp_condition=>'11'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(220739912737841935.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'試算表匯入儲存區域'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_list_item_disp_condition=>'8'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3931814922814551.4307)
,p_name=>'Plain Text Data Import'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3932708473822070.4307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'檔案詳細資訊'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'18,19,21'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'18'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3933320594825587.4307)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'表格特性'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'18,19,21'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'19'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3933729944828323.4307)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'主索引鍵'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'18,19,21'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'21'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3934205141830584.4307)
,p_name=>'Plain Text Data Import2'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3935014837833421.4307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'表格擁有者和名稱'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'22'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3935628343837346.4307)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'檔案詳細資訊'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'24'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3935901116838942.4307)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'資料欄對應'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'25'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(74707671328250039.4307)
,p_name=>'Data Loading'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2638109323313851.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'文字資料'
,p_list_item_link_target=>'f?p=&APP_ID.:230:&SESSION.::&DEBUG.:18,19,21,22,24,25:F4300_P230_LOAD_FROM:UPLOAD:'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_text_01=>'從結構化純檔案 (例如以逗號區隔資料 (csv) 或以 Tab 區隔資料的檔案) 載入資料.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(74710220544263433.4307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'XML 資料'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:::'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_text_01=>'從正規格式的 XML 載入資料.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(171168300110560910.4307)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'試算表資料'
,p_list_item_link_target=>'f?p=&APP_ID.:230:&SESSION.::&DEBUG.:200,210,220,230,240,260,270:::'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_text_01=>'從正規格式的 XML 載入資料.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(75585889878824332.4307)
,p_name=>'Data Unloading'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(75614520977877818.4307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'至文字'
,p_list_item_link_target=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:150,180:::'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_text_01=>'將資料庫資料匯出至純檔案.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(75616418561883144.4307)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'至 XML'
,p_list_item_link_target=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:90:::'
,p_list_item_icon=>'htmldb/icons/pt_build_options.png'
,p_list_item_icon_attributes=>'width="20" height="20" title="#LIST_LABEL#" alt="#LIST_LABEL#"'
,p_list_text_01=>'將資料庫資料匯出至 XML 文件.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(104358211508848205.4307)
,p_name=>'Plain Text Data Export'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(104369115334180721.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'資料欄'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'150'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(104371204982185568.4307)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'選項'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'180'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(112716503290208213.4307)
,p_name=>'Excel Data Import'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(204680314570920715.4307)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'目標和方法'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'230'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(112719626353212694.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'資料'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'200,210,220,230'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'200'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(112720322256214662.4307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'表格特性'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'200,210,220,230'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(117063907614069206.4307)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'主索引鍵'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'200,210,220,230'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'220'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(204693724897946351.4307)
,p_name=>'Excel Data Import2'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(204695520153948493.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'類型和方法'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'230'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(204698011742952420.4307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'表格擁有者和名稱'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'240,260,270'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'240'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(204702125748961090.4307)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'資料'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'240,260,270'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'270'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(204711009357968724.4307)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'資料欄對應'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'240,260,270'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'260'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(697382068928001818.4307)
,p_name=>'APEX 5 - Administration (Header)'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697382206098001819.4307)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'管理'
,p_list_item_link_target=>'f?p=4350:1:&APP_SESSION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697382502013001824.4307)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697382891464001824.4307)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'管理服務'
,p_security_scheme=>wwv_flow_api.id(12521431744512635)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697383150352001827.4307)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'管理服務'
,p_list_item_link_target=>'f?p=4350:21:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697382891464001824.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697383440829001827.4307)
,p_list_item_display_sequence=>215
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(697382891464001824.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697383714500001828.4307)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'提出服務要求'
,p_list_item_link_target=>'f?p=4350:96:&SESSION.::NO:49::'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''SERVICE_REQUESTS_ENABLED'') = ''Y'''
,p_parent_list_item_id=>wwv_flow_api.id(697382891464001824.4307)
,p_security_scheme=>wwv_flow_api.id(12521431744512635)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697384038930001828.4307)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'設定工作區偏好設定'
,p_list_item_link_target=>'f?p=4350:17:&SESSION.::NO:RP::'
,p_parent_list_item_id=>wwv_flow_api.id(697382891464001824.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697384322750001828.4307)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'編輯公告'
,p_list_item_link_target=>'f?p=4350:35:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697382891464001824.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697384679765001828.4307)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'工作區使用狀況'
,p_list_item_link_target=>'f?p=4350:101:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697382891464001824.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697384955467001832.4307)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'管理使用者和群組'
,p_list_item_link_target=>'f?p=4350:55:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(12521431744512635)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697385224525001832.4307)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'監督活動'
,p_list_item_link_target=>'f?p=4350:22:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(10763432184894214)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697385572574001832.4307)
,p_list_item_display_sequence=>500
,p_list_item_link_text=>'儀表板'
,p_list_item_link_target=>'f?p=4350:33:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(10763432184894214)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1250636556640192780.4307)
,p_list_item_display_sequence=>600
,p_list_item_link_text=>'變更我的密碼'
,p_list_item_link_target=>'f?p=4350:3:&SESSION.::&DEBUG.:3#pwd'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_security_scheme=>wwv_flow_api.id(10763432184894214)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(697413399059052182.4307)
,p_name=>'APEX 5 - Help'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697413586319052182.4307)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'文件'
,p_list_item_link_target=>'&SYSTEM_HELP_URL.'
,p_list_text_01=>'helpLinkNewWindow'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2105952923293025164.4307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'討論論壇'
,p_list_item_link_target=>'https://apex.oracle.com/forum'
,p_list_text_01=>'helpLinkForum'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2185440800402478745.4307)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'甲骨文全球開發者技術網路 (OTN)'
,p_list_item_link_target=>'http://otn.oracle.com/apex'
,p_list_text_01=>'helpLinkOTN'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697414494575052183.4307)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697414778925052183.4307)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'關於'
,p_list_item_link_target=>'f?p=4350:9:&SESSION.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(718988657702143721.4307)
,p_name=>'APEX 5 - Tabs'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'應用程式產生器'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW::'
,p_list_item_icon_alt_attribute=>'應用程式產生器向下展開功能'
,p_list_text_01=>'tab-app-builder'
,p_security_scheme=>wwv_flow_api.id(786533090058102287)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718989111037143726.4307)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'資料庫應用程式'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW:DATABASE:'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718989405911143726.4307)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Web 試算表應用程式'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW:WEBSHEET:'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718989747866143727.4307)
,p_list_item_display_sequence=>125
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718990080119143727.4307)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'建立'
,p_list_item_link_target=>'f?p=4000:56:&SESSION.::NO:56,103,104,106,130,131,35,227,3020,3000,3001:FB_FLOW_ID,FB_FLOW_PAGE_ID:'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718990361569143729.4307)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'匯入'
,p_list_item_link_target=>'f?p=4000:460:&SESSION.::&DEBUG.:460:F4000_P56_CREATE_OPTION,P460_FILE_TYPE:IMP,FLOW_EXPORT:'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718990613085143729.4307)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'匯出'
,p_list_item_link_target=>'f?p=4000:523:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718990955731143729.4307)
,p_list_item_display_sequence=>155
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'工作區公用程式'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718991584443143730.4307)
,p_list_item_display_sequence=>161
,p_list_item_link_text=>'全部工作區公用程式'
,p_list_item_link_target=>'f?p=4000:182:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718991801399143730.4307)
,p_list_item_display_sequence=>162
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718992140150143730.4307)
,p_list_item_display_sequence=>163
,p_list_item_link_text=>'應用程式產生器預設值'
,p_list_item_link_target=>'f?p=4000:800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718992741957143730.4307)
,p_list_item_display_sequence=>165
,p_list_item_link_text=>'工作區主題'
,p_list_item_link_target=>'f?p=4000:763:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718993081390143731.4307)
,p_list_item_display_sequence=>166
,p_list_item_link_text=>'應用程式群組'
,p_list_item_link_target=>'f?p=4000:722:&SESSION.::&DEBUG.:RP'
,p_parent_list_item_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718993347641143731.4307)
,p_list_item_display_sequence=>167
,p_list_item_link_text=>'Application Express 檢視'
,p_list_item_link_target=>'f?p=4000:714:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718993626969143731.4307)
,p_list_item_display_sequence=>168
,p_list_item_link_text=>'交叉應用程式報表'
,p_list_item_link_target=>'f?p=4000:9009:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(718991291702143729.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718993986713143731.4307)
,p_list_item_display_sequence=>169
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718994253577143731.4307)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'移轉'
,p_list_item_link_target=>'f?p=4400:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718988842906143722.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718994566071143731.4307)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'SQL 工作室'
,p_list_item_link_target=>'f?p=4500:3002:&SESSION.'
,p_list_item_icon_alt_attribute=>'SQL 工作室向下展開功能'
,p_list_text_01=>'tab-sql-workshop'
,p_security_scheme=>wwv_flow_api.id(388304690603143191)
,p_list_item_current_type=>'ALWAYS'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718994850225143732.4307)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'物件瀏覽器'
,p_list_item_link_target=>'f?p=4500:1001:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718994566071143731.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718995124049143732.4307)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'SQL 命令'
,p_list_item_link_target=>'f?p=4500:1003:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718994566071143731.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718995499947143732.4307)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'SQL 命令檔'
,p_list_item_link_target=>'f?p=4500:1004:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718994566071143731.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'公用程式'
,p_parent_list_item_id=>wwv_flow_api.id(718994566071143731.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718996015547143732.4307)
,p_list_item_display_sequence=>241
,p_list_item_link_text=>'全部公用程式'
,p_list_item_link_target=>'f?p=4500:1005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718996329468143733.4307)
,p_list_item_display_sequence=>242
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718996661572143733.4307)
,p_list_item_display_sequence=>243
,p_list_item_link_text=>'資料工作室'
,p_list_item_link_target=>'f?p=4300:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718996948262143733.4307)
,p_list_item_display_sequence=>244
,p_list_item_link_text=>'查詢製作器'
,p_list_item_link_target=>'f?p=4500:1002:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718997212313143733.4307)
,p_list_item_display_sequence=>245
,p_list_item_link_text=>'產生 DDL'
,p_list_item_link_target=>'f?p=4500:12:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718997530238143733.4307)
,p_list_item_display_sequence=>246
,p_list_item_link_text=>'使用者介面預設值'
,p_list_item_link_target=>'f?p=4500:813:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718997895063143733.4307)
,p_list_item_display_sequence=>247
,p_list_item_link_text=>'表格方法'
,p_list_item_link_target=>'f?p=4500:120:&SESSION.::NO::P117_CREATE_PACKAGE:TABLE'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718998124709143734.4307)
,p_list_item_display_sequence=>248
,p_list_item_link_text=>'關於資料庫'
,p_list_item_link_target=>'f?p=4500:36:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718998433413143734.4307)
,p_list_item_display_sequence=>249
,p_list_item_link_text=>'物件報表'
,p_list_item_link_target=>'f?p=4500:1042:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718998775140143734.4307)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'資料庫監督'
,p_list_item_link_target=>'f?p=4500:11:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718999007388143734.4307)
,p_list_item_display_sequence=>251
,p_list_item_link_text=>'綱要比較'
,p_list_item_link_target=>'f?p=4500:1350:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718999349755143734.4307)
,p_list_item_display_sequence=>252
,p_list_item_link_text=>'資源回收筒'
,p_list_item_link_target=>'f?p=4500:1070:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718995706005143732.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718999661410143734.4307)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'RESTful 服務'
,p_list_item_link_target=>'f?p=4850:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718994566071143731.4307)
,p_security_scheme=>wwv_flow_api.id(10770526811204883)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'團隊開發'
,p_list_item_link_target=>'f?p=4800:4000:&SESSION.'
,p_list_item_icon_alt_attribute=>'團隊開發向下展開功能'
,p_list_text_01=>'tab-team-dev'
,p_security_scheme=>wwv_flow_api.id(10767409693039076)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719000200495143734.4307)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>'里程碑'
,p_list_item_link_target=>'f?p=4800:6006:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719000507420143734.4307)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>'功能'
,p_list_item_link_target=>'f?p=4800:9010:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719000816388143735.4307)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'待辦事項'
,p_list_item_link_target=>'f?p=4800:3001:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719001169653143735.4307)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'錯誤'
,p_list_item_link_target=>'f?p=4800:3501:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719001409743143735.4307)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>'回應'
,p_list_item_link_target=>'f?p=4800:8012:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719001716284143735.4307)
,p_list_item_display_sequence=>355
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>'公用程式'
,p_parent_list_item_id=>wwv_flow_api.id(718999920942143734.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719002368925143735.4307)
,p_list_item_display_sequence=>361
,p_list_item_link_text=>'全部公用程式'
,p_list_item_link_target=>'f?p=4800:2:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719002662619143736.4307)
,p_list_item_display_sequence=>362
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
end;
/
begin
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719002979626143737.4307)
,p_list_item_display_sequence=>363
,p_list_item_link_text=>'團隊開發設定'
,p_list_item_link_target=>'f?p=4800:3005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719003213232143737.4307)
,p_list_item_display_sequence=>364
,p_list_item_link_text=>'版本摘要'
,p_list_item_link_target=>'f?p=4800:4050:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719003537077143737.4307)
,p_list_item_display_sequence=>365
,p_list_item_link_text=>'啟用檔案'
,p_list_item_link_target=>'f?p=4350:17:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719003866862143737.4307)
,p_list_item_display_sequence=>366
,p_list_item_link_text=>'後推逾期錯誤'
,p_list_item_link_target=>'f?p=4800:5:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719004113111143737.4307)
,p_list_item_display_sequence=>367
,p_list_item_link_text=>'功能公用程式'
,p_list_item_link_target=>'f?p=4800:9013:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719004487421143737.4307)
,p_list_item_display_sequence=>368
,p_list_item_link_text=>'管理重點區域'
,p_list_item_link_target=>'f?p=4800:9020:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719004793890143738.4307)
,p_list_item_display_sequence=>369
,p_list_item_link_text=>'更新指派對象'
,p_list_item_link_target=>'f?p=4800:6004:&SESSION.::&DEBUG.:6004:::'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719005043331143738.4307)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'檢視檔案'
,p_list_item_link_target=>'f?p=4800:9:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719005393350143738.4307)
,p_list_item_display_sequence=>371
,p_list_item_link_text=>'永久清除資料'
,p_list_item_link_target=>'f?p=4800:6:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719005649685143739.4307)
,p_list_item_display_sequence=>372
,p_list_item_link_text=>'管理新聞'
,p_list_item_link_target=>'f?p=4800:7000:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719005956050143739.4307)
,p_list_item_display_sequence=>373
,p_list_item_link_text=>'管理連結'
,p_list_item_link_target=>'f?p=4800:5000:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719002021894143735.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719006217814143739.4307)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'套裝應用程式'
,p_list_item_link_target=>'f?p=4750:1:&APP_SESSION.'
,p_list_text_01=>'tab-apps'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719006508197143740.4307)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'應用程式庫'
,p_list_item_link_target=>'f?p=4750:50:&SESSION.::&DEBUG.:50:'
,p_parent_list_item_id=>wwv_flow_api.id(719006217814143739.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719006810190143740.4307)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'儀表板'
,p_list_item_link_target=>'f?p=4750:2:&SESSION.::&DEBUG.:2:'
,p_parent_list_item_id=>wwv_flow_api.id(719006217814143739.4307)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719007190968143740.4307)
,p_list_item_display_sequence=>430
,p_list_item_link_text=>'管理'
,p_list_item_link_target=>'f?p=4750:6:&SESSION.::&DEBUG.:6:'
,p_parent_list_item_id=>wwv_flow_api.id(719006217814143739.4307)
,p_list_item_current_type=>'TARGET_PAGE'
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
 p_id=>wwv_flow_api.id(1490428208929471.4307)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(14848517159940928.4307)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1765072320094712054.4307)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(10763432184894214.4307)
,p_name=>'Dashboard access'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'return',
'    wwv_flow_authorization.is_authorized_developer(',
'        p_developer_authorization => ''ADMIN''',
'    )',
'    or wwv_flow_authorization.is_authorized_developer(',
'        p_developer_authorization => ''EDIT''',
'    );'))
,p_error_message=>'未授權您存取「儀表板」與「監督活動」.'
,p_reference_id=>786936829326142579.4307
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(10766802982027753.4307)
,p_name=>'Flow: EDIT'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>'您沒有編輯應用程式的授權'
,p_reference_id=>12480509677812756.4307
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(10767409693039076.4307)
,p_name=>'APEX 5.0 Team development enabled'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 ',
'from wwv_flow_companies w, ',
'        wwv_flow_fnd_user u',
'where nvl(w.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'' and ',
'      w.PROVISIONING_COMPANY_ID = :flow_security_group_id and',
'      u.security_group_id = :flow_security_group_id and',
'      u.USER_NAME = upper(:app_user) and',
'      nvl(u.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'''))
,p_error_message=>'此工作區未啟用團隊開發'
,p_reference_id=>786516861027697723.4307
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(10770526811204883.4307)
,p_name=>'APEX 5.0 RESTful Services Enabled'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 ',
'from wwv_flow_companies',
'where ALLOW_RESTFUL_SERVICES_YN = ''Y'' and ',
'      PROVISIONING_COMPANY_ID = :flow_security_group_id',
'and exists (select 1',
'                  from wwv_flow_platform_prefs',
'                 where name  = ''RESTFUL_SERVICES_ENABLED''',
'                   and value = ''Y'')'))
,p_error_message=>'沒有執行嘗試之作業的權限'
,p_reference_id=>786519856057734816.4307
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(12521431744512635.4307)
,p_name=>'Flow: ADMIN'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'ADMIN'
,p_error_message=>'您沒有管理應用程式的授權'
,p_reference_id=>12511219858301010.4307
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(12527124696576833.4307)
,p_name=>'Flow: DATA_LOADER'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'DATA_LOADER'
,p_error_message=>'您沒有存取資料載入器的授權'
,p_reference_id=>786941042784190072.4307
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(388304690603143191.4307)
,p_name=>'APEX 5.0 SQL Workshop Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'SQL'
,p_error_message=>'您沒有使用「SQL 工作室」的授權'
,p_reference_id=>786516265251697717.4307
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(517058043352714021.4307)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>'未啟用「產生器 SSO」'
,p_reference_id=>6738410669854771.4307
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(786533090058102287.4307)
,p_name=>'APEX 5.0 Application Builder Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>'沒有執行嘗試之作業的權限'
,p_reference_id=>786516029127697713.4307
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(1364313342198532.4307)
,p_icon_sequence=>10
,p_icon_subtext=>'工作區 &COMPANY.'
,p_icon_target=>'#'
,p_icon_image_alt=>'工作區 &COMPANY.'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(39955524108615064.4307)
,p_icon_sequence=>20
,p_icon_subtext=>'登出'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'登出'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(49906314503034042.4307)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AJAX_COLLECT_CLOB'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_code clob := empty_clob;',
'begin',
'   sys.dbms_lob.createtemporary( l_code, false, sys.dbms_lob.SESSION );',
'   for i in 1..wwv_flow.g_f01.count loop',
'        sys.dbms_lob.writeappend(l_code,length(wwv_flow.g_f01(i)),wwv_flow.g_f01(i));',
'    end loop;',
'apex_collection.create_or_truncate_collection(p_collection_name=>''CLOB_CONTENT'');',
'apex_collection.add_member(p_collection_name=>''CLOB_CONTENT'',p_clob001=>l_code);',
'sys.htp.prn(''SUCCESS'');',
'end;'))
,p_security_scheme=>wwv_flow_api.id(12527124696576833)
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(5126097226.4307)
,p_name=>'COMPANY'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_item_comment=>'name of company for mutli company oracle platform'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(25339931440732484.4307)
,p_name=>'F4300_IMEX_BATCH_ID'
,p_data_type=>'NUMBER'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(48603115971458169.4307)
,p_name=>'F4300_LAST_VIEW'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(242549145362.4307)
,p_name=>'F4300_LOAD_JOB'
,p_data_type=>'NUMBER'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(147029609296398557.4307)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_item_comment=>'Used by Custom2 authentication for deep linking support'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(48610196642071039.4307)
,p_name=>'LAST_VIEW'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(5128100953.4307)
,p_computation_sequence=>10
,p_computation_item=>'COMPANY'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'ON_NEW_INSTANCE'
,p_computation=>'wwv_flow.get_company_name'
,p_compute_when=>'COMPANY'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_computation_error_message=>'無法計算工作區名稱.'
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
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87923517360560740.4307)
,p_lov_name=>'CASE.SENSITIVE.Y'
,p_lov_query=>'.'||wwv_flow_api.id(87923517360560740)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87923721904560740.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'有大小寫之別'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(23546816846659473.4307)
,p_lov_name=>'CREATE_TABLE_SCHEMAS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  q varchar2(32767) := null;',
'begin',
'  q:=q||''select wwv_flow_escape.html(c.schema) d, c.schema v '';',
'  q:=q||''from   wwv_flow_company_schemas c, '';',
'  q:=q||''       wwv_flow_fnd_user u '';',
'  q:=q||''where  c.security_group_id = :flow_security_group_id and '';',
'  q:=q||''       u.security_group_id = :flow_security_group_id and '';',
'  q:=q||''       u.user_name = :flow_user and '';',
'  q:=q||''       (u.ALLOW_ACCESS_TO_SCHEMAS is null or '';',
'  q:=q||''        instr('''':''''||u.ALLOW_ACCESS_TO_SCHEMAS||'''':'''','''':''''||c.schema||'''':'''')>0) '';',
'  if wwv_flow_global.g_xe then',
'    q:=q||''  and exists (select null '';',
'    q:=q||''              from sys.dba_sys_privs '';',
'    q:=q||''              where privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''') '';',
'    q:=q||''              and grantee = c.schema '';',
'    q:=q||''              union all '';',
'    q:=q||''              select null '';',
'    q:=q||''              from sys.dba_sys_privs s, sys.dba_role_privs r '';',
'    q:=q||''              where r.granted_role=s.grantee '';',
'    q:=q||''              and r.grantee = c.schema '';',
'    q:=q||''              and s.privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''')) '';',
'  else',
'    q:=q||''  and exists (select null '';',
'    q:=q||''               from sys.dba_sys_privs '';',
'    q:=q||''               where privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''') '';',
'    q:=q||''                 and grantee = c.schema)     '';',
'  end if;         ',
'  q:=q||''  and exists (select null '';',
'  q:=q||''                from sys.dba_users '';',
'  q:=q||''               where username = c.schema) '';',
'  q:=q||''order by 1 '';',
'  ',
'  return q;',
'end;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87944005995777613.4307)
,p_lov_name=>'EXPORT.AS.FILE.Y'
,p_lov_query=>'.'||wwv_flow_api.id(87944005995777613)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87944229029777613.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'匯出成檔案'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(143183002952786622.4307)
,p_lov_name=>'EXPORT.FILE_FORMAT'
,p_lov_query=>'.'||wwv_flow_api.id(143183002952786622)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(143183319798786629.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unix'
,p_lov_return_value=>'UNIX'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(143183511674786632.4307)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'DOS'
,p_lov_return_value=>'DOS'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(135399325911344822.4307)
,p_lov_name=>'I18N_IANA_CHARSET'
,p_reference_id=>144796827445692396.4307
,p_lov_query=>'.'||wwv_flow_api.id(135399325911344822)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9210119015925448.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'阿拉伯文 ISO-8859-6'
,p_lov_return_value=>'iso-8859-6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9210315200925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'阿拉伯文 Windows 1256'
,p_lov_return_value=>'windows-1256'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9210506914925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'中文 Big5'
,p_lov_return_value=>'big5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9210710375925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'中文 GBK'
,p_lov_return_value=>'gbk'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9210911324925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'斯拉夫文 ISO-8859-5'
,p_lov_return_value=>'iso-8859-5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9211132764925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'斯拉夫文 KOI8-R'
,p_lov_return_value=>'koi8-r'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9211319597925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'斯拉夫文 KOI8-U'
,p_lov_return_value=>'koi8-u'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9211519694925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'斯拉夫文 Windows 1251'
,p_lov_return_value=>'windows-1251'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9211710593925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'東歐語系 ISO-8859-2'
,p_lov_return_value=>'iso-8859-2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9211916251925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'東歐語系 Windows 1250'
,p_lov_return_value=>'windows-1250'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9212127400925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'希臘文 ISO-8859-7'
,p_lov_return_value=>'iso-8859-7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9212326492925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'希臘文 Windows 1253'
,p_lov_return_value=>'windows-1253'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9212524385925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'希伯來文 ISO-8859-8-i'
,p_lov_return_value=>'iso-8859-8-i'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9212723211925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'希伯來文 Windows 1255'
,p_lov_return_value=>'windows-1255'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9212909639925449.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'日文 EUC'
,p_lov_return_value=>'euc-jp'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9213115890925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'日文 Shift JIS'
,p_lov_return_value=>'shift_jis'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9213332197925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'韓文 EUC'
,p_lov_return_value=>'euc-kr'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9213521447925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'北歐語系 ISO-8859-4'
,p_lov_return_value=>'iso-8859-4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9213724764925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'北歐語系 Windows 1257'
,p_lov_return_value=>'windows-1257'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9213919798925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'南歐語系 ISO-8859-3'
,p_lov_return_value=>'iso-8859-3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9214102242925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'泰文 TIS-620'
,p_lov_return_value=>'tis-620'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9214302164925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'土耳其文 ISO-8859-9'
,p_lov_return_value=>'iso-8859-9'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9214532482925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'土耳其文 Windows 1254'
,p_lov_return_value=>'windows-1254'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9214722219925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode UTF-8'
,p_lov_return_value=>'utf-8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9214919398925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode UTF-16 Big Endian'
,p_lov_return_value=>'utf-16be'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9215121243925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode UTF-16 Little Endian'
,p_lov_return_value=>'utf-16le'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9215302670925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'US-ASCII'
,p_lov_return_value=>'us-ascii'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9215523599925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'越南文 Windows 1258'
,p_lov_return_value=>'windows-1258'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9215727684925450.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'西歐語系 ISO-8859-1'
,p_lov_return_value=>'iso-8859-1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9215928361925451.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'西歐語系 Windows 1252'
,p_lov_return_value=>'windows-1252'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(139941401949707953.4307)
,p_lov_name=>'I18N_IANA_DB_CHARSET'
,p_reference_id=>144802427115692411.4307
,p_lov_query=>'.'||wwv_flow_api.id(139941401949707953)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9188622999826963.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'阿拉伯文 ISO-8859-6'
,p_lov_return_value=>'AR8ISO8859P6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9188802065826963.4307)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'阿拉伯文 Windows 1256'
,p_lov_return_value=>'AR8MSWIN1256'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9189008473826963.4307)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'中文 Big5'
,p_lov_return_value=>'ZHT16MSWIN950'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9189218199826963.4307)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'中文 GBK'
,p_lov_return_value=>'ZHS16GBK'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9189423281826963.4307)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'斯拉夫文 ISO-8859-5'
,p_lov_return_value=>'CL8ISO8859P5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9189625838826963.4307)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'斯拉夫文 KOI8-R'
,p_lov_return_value=>'CL8KOI8R'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9189801148826963.4307)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'斯拉夫文 KOI8-U'
,p_lov_return_value=>'CL8KOI8U'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9190022075826963.4307)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'斯拉夫文 Windows 1251'
,p_lov_return_value=>'CL8MSWIN1251'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9190219973826963.4307)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'東歐語系 ISO-8859-2'
,p_lov_return_value=>'EE8ISO8859P2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9190416617826963.4307)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'東歐語系 Windows 1250'
,p_lov_return_value=>'EE8MSWIN1250'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9190615496826963.4307)
,p_lov_disp_sequence=>110
,p_lov_disp_value=>'希臘文 ISO-8859-7'
,p_lov_return_value=>'EL8ISO8859P7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9190828699826963.4307)
,p_lov_disp_sequence=>120
,p_lov_disp_value=>'希臘文 Windows 1253'
,p_lov_return_value=>'EL8MSWIN1253'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9191002890826963.4307)
,p_lov_disp_sequence=>130
,p_lov_disp_value=>'希伯來文 ISO-8859-8-i'
,p_lov_return_value=>'IW8ISO8859P8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9191211076826964.4307)
,p_lov_disp_sequence=>140
,p_lov_disp_value=>'希伯來文 Windows 1255'
,p_lov_return_value=>'IW8MSWIN1255'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9191419400826964.4307)
,p_lov_disp_sequence=>150
,p_lov_disp_value=>'日文 EUC'
,p_lov_return_value=>'JA16EUC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9191608713826964.4307)
,p_lov_disp_sequence=>160
,p_lov_disp_value=>'日文 Shift JIS'
,p_lov_return_value=>'JA16SJIS'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9191822628826964.4307)
,p_lov_disp_sequence=>170
,p_lov_disp_value=>'韓文 EUC'
,p_lov_return_value=>'KO16MSWIN949'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9192014784826964.4307)
,p_lov_disp_sequence=>180
,p_lov_disp_value=>'北歐語系 ISO-8859-4'
,p_lov_return_value=>'NEE8ISO8859P4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9192221153826964.4307)
,p_lov_disp_sequence=>190
,p_lov_disp_value=>'北歐語系 Windows 1257'
,p_lov_return_value=>'BLT8MSWIN1257'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9192402718826964.4307)
,p_lov_disp_sequence=>200
,p_lov_disp_value=>'南歐語系 ISO-8859-3'
,p_lov_return_value=>'SE8ISO8859P3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9192610187826966.4307)
,p_lov_disp_sequence=>210
,p_lov_disp_value=>'泰文 TIS-620'
,p_lov_return_value=>'TH8TISASCII'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9192804602826966.4307)
,p_lov_disp_sequence=>220
,p_lov_disp_value=>'土耳其文 ISO-8859-9'
,p_lov_return_value=>'WE8ISO8859P9'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9193001882826966.4307)
,p_lov_disp_sequence=>230
,p_lov_disp_value=>'土耳其文 Windows 1254'
,p_lov_return_value=>'TR8MSWIN1254'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9193223602826966.4307)
,p_lov_disp_sequence=>240
,p_lov_disp_value=>'Unicode UTF-8'
,p_lov_return_value=>'AL32UTF8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9193425721826966.4307)
,p_lov_disp_sequence=>242
,p_lov_disp_value=>'Unicode UTF-16 Big Endian'
,p_lov_return_value=>'AL16UTF16'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9193631752826967.4307)
,p_lov_disp_sequence=>244
,p_lov_disp_value=>'Unicode UTF-16 Little Endian'
,p_lov_return_value=>'AL16UTF16LE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9193806252826967.4307)
,p_lov_disp_sequence=>248
,p_lov_disp_value=>'US-ASCII'
,p_lov_return_value=>'US7ASCII'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9194024220826967.4307)
,p_lov_disp_sequence=>250
,p_lov_disp_value=>'越南文 Windows 1258'
,p_lov_return_value=>'VN8MSWIN1258'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9194205591826967.4307)
,p_lov_disp_sequence=>260
,p_lov_disp_value=>'西歐語系 ISO-8859-1'
,p_lov_return_value=>'WE8ISO8859P1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9194414927826967.4307)
,p_lov_disp_sequence=>270
,p_lov_disp_value=>'西歐語系 Windows 1252'
,p_lov_return_value=>'WE8MSWIN1252'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87945815476789819.4307)
,p_lov_name=>'INCLUDE.COL.NAMES.Y'
,p_lov_query=>'.'||wwv_flow_api.id(87945815476789819)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87946002718789820.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'包括資料欄名稱'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87953325959849588.4307)
,p_lov_name=>'ISCOLUMN.NAME.TEXT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<span class="instructiontext">''||',
'wwv_flow_lang.system_message(''F4300_INSTRUCT_TEXT'')||''</span>'' d, ''Y'' r from dual'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(182776719411.4307)
,p_lov_name=>'LIST_SCHEMA_OWNERS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c.schema) d, c.schema v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87921416882551159.4307)
,p_lov_name=>'LOAD.OPTION'
,p_lov_query=>'.'||wwv_flow_api.id(87921416882551159)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87921609839551159.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'上傳檔案 (使用逗號或 Tab 區隔)'
,p_lov_return_value=>'UPLOAD'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87921801389551160.4307)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'複製並貼上'
,p_lov_return_value=>'PASTE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(20828314943711235.4307)
,p_lov_name=>'LOAD_DATA_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(20828314943711235)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(20828624229711248.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'NUMBER'
,p_lov_return_value=>'NUMBER'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(20828808097711250.4307)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'VARCHAR2'
,p_lov_return_value=>'VARCHAR2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(20829026553711250.4307)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'DATE'
,p_lov_return_value=>'DATE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(20829212946711250.4307)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'CLOB'
,p_lov_return_value=>'CLOB'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(20829421949711250.4307)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'BINARY_FLOAT'
,p_lov_return_value=>'BINARY_FLOAT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(20829612125711251.4307)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'BINARY_DOUBLE'
,p_lov_return_value=>'BINARY_DOUBLE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(162716910286446218.4307)
,p_lov_name=>'P16_TABLES'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select table_name a, table_name b',
'from sys.dba_tables',
'where owner=:F4300_P14_TARGET_SCHEMA',
'and table_name not like ''BIN$%''',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(236956028332134846.4307)
,p_lov_name=>'P2_LOAD'
,p_lov_query=>'.'||wwv_flow_api.id(236956028332134846)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(236956315568134853.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'我的匯入'
,p_lov_return_value=>'MY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(236956532195134859.4307)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'所有匯入'
,p_lov_return_value=>'ALL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(29232624018252340.4307)
,p_lov_name=>'PK_TYPES'
,p_reference_id=>20561306137429854.4307
,p_lov_query=>'.'||wwv_flow_api.id(29232624018252340)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(51627621271152564.4307)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'從新順序產生'
,p_lov_return_value=>'NEW_SEQUENCE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(51627831065152564.4307)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'從現有的順序產生'
,p_lov_return_value=>'EXISTING_SEQUENCE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(51628012394152565.4307)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'未產生'
,p_lov_return_value=>'NOT_GENERATED'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87931511182663028.4307)
,p_lov_name=>'PRESERVE.CASE.Y'
,p_lov_query=>'.'||wwv_flow_api.id(87931511182663028)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87931730659663028.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'維持原來大小寫樣式'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87918702852509211.4307)
,p_lov_name=>'RESTRICT.LOAD.FILES'
,p_lov_query=>'.'||wwv_flow_api.id(87918702852509211)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87918901897509212.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'我的匯入檔案'
,p_lov_return_value=>'MY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87919109206509212.4307)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'所有匯入檔案'
,p_lov_return_value=>'ALL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87922429003554589.4307)
,p_lov_name=>'TABLE.OPTION'
,p_lov_query=>'.'||wwv_flow_api.id(87922429003554589)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87922602291554590.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'現有的表格'
,p_lov_return_value=>'EXIST'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87922820756554590.4307)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'新表格'
,p_lov_return_value=>'NEW'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87933423434676001.4307)
,p_lov_name=>'USE.EXISTING.COL'
,p_lov_query=>'.'||wwv_flow_api.id(87933423434676001)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87933602623676001.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'使用現有的資料欄'
,p_lov_return_value=>'EXISTING_KEY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87933822194676002.4307)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'建立新資料欄'
,p_lov_return_value=>'NEW_KEY'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87930425596657700.4307)
,p_lov_name=>'YES.NO.RETURNS_Y_OR_N'
,p_lov_query=>'.'||wwv_flow_api.id(87930425596657700)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87930802381657701.4307)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'是'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(87930609321657701.4307)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'否'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(182782926995.4307)
,p_lov_name=>'YES_NO'
,p_lov_query=>'.'||wwv_flow_api.id(182782926995)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(182785927024.4307)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'是'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(182787927024.4307)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'否'
,p_lov_return_value=>'N'
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
prompt --application/shared_components/navigation/breadcrumbs/dataworkshop_menu
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(6678815232629976.4307)
,p_name=>'dataworkshop.menu'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2211613627528920.4307)
,p_parent_id=>wwv_flow_api.id(174561719510562263.4307)
,p_short_name=>'資料工作室'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6682115379645994.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:230:&SESSION.::&DEBUG.:::'
,p_page_id=>230
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6686911916662790.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入 XML 資料'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6690530882669221.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'取消載入至文字'
,p_link=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:::'
,p_page_id=>150
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6692619668674394.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_page_id=>200
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6694113198677405.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:::'
,p_page_id=>210
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6695107375680103.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:220:&SESSION.::&DEBUG.:::'
,p_page_id=>220
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6828030820688031.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6829415292695176.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6830608822698182.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6837120647738320.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'文字資料載入儲存區域'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6844627307765634.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'取消載入至 XML'
,p_link=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:::'
,p_page_id=>90
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6848706388775367.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'取消載入至文字'
,p_link=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:::'
,p_page_id=>180
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7700814894541393.4307)
,p_parent_id=>wwv_flow_api.id(.4307)
,p_short_name=>'首頁'
,p_link=>'f?p=4500:1000:&SESSION.'
,p_page_id=>99999
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9390600588273869.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'試算表儲存區域'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23356717195631333.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23359105981636561.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23360528181641436.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23362831810685340.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:240:&SESSION.::&DEBUG.:::'
,p_page_id=>240
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23364720380690653.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.:::'
,p_page_id=>270
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23366014557693362.4307)
,p_parent_id=>wwv_flow_api.id(2211613627528920.4307)
,p_short_name=>'載入資料'
,p_link=>'f?p=&APP_ID.:260:&SESSION.::&DEBUG.:::'
,p_page_id=>260
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(28488306101493931.4307)
,p_parent_id=>wwv_flow_api.id(.4307)
,p_short_name=>'<span class="u-VisuallyHidden">SQL 工作室</span><span class="a-Icon icon-breadcrumb-previous"></span>'
,p_link=>'f?p=4500:3002:&SESSION.'
,p_page_id=>77777
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(75399131516711549.4307)
,p_parent_id=>wwv_flow_api.id(6837120647738320.4307)
,p_short_name=>'文字資料載入詳細資訊'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(174561719510562263.4307)
,p_parent_id=>wwv_flow_api.id(28488306101493931.4307)
,p_short_name=>'公用程式'
,p_link=>'f?p=4500:1005:&SESSION.'
,p_page_id=>8888
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(236917018865057364.4307)
,p_parent_id=>wwv_flow_api.id(9390600588273869.4307)
,p_short_name=>'試算表載入詳細資訊'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(388323657510153942.4307)
,p_parent_id=>wwv_flow_api.id(.4307)
,p_short_name=>'頁碼為零的頁面'
,p_link=>'f?p=&FLOW_ID.:0:&SESSION.'
,p_page_id=>0
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(9113661096283.4307)
,p_theme_id=>3
,p_name=>'4300_printer-friendly.zh-tw'
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
,p_reference_id=>80874804748045950.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(3485606247566446.4307)
,p_theme_id=>3
,p_name=>'Green Look (Left And Right SideBars) From 4999.zh-tw'
,p_is_popup=>false
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
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#',
'<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_06#',
'',
'',
'<div id="htmldbMessageHolder"><a name="SkipRepNav"></a>#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="htmldbBodyMargin">',
'  <div id="apex-main">',
'    <div id="ContentBody">',
'      <div id="apex-two-col">',
'        <div id="apex-sidebar">#REGION_POSITION_03##REGION_POSITION_05#</div>',
'        <div id="apex-content">#REGION_POSITION_02#',
'          <div id="apex-splash">',
'            <div id="RP4">#REGION_POSITION_04#</div>',
'            <div id="BB">#BODY#</div>',
'          </div>',
'        </div>',
'      </div>',
'    </div>',
'    <div id="apex-left-sidebar">#REGION_POSITION_01#</div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="apex-footer-info">',
'  <div style="float:right;">#FLOW_VERSION#</div>',
'  <div style="float:right;">#CUSTOMIZE#</div>',
'</div>',
'<div id="apex-footer">',
'   <div class="content">',
'     <div style="float:left;">&MSG_COMPANY.&nbsp;&MSG_USER.:&nbsp;&USER.</div>',
'     <div style="float:right;">&MSG_LANGUAGE.:&nbsp;&BROWSER_LANGUAGE.&nbsp;|&nbsp;&MSG_COPYRIGHT.</div>',
'   </div>',
'</div>',
'#FORM_CLOSE# <a name="END"><br />',
'</a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification success" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium success"/>',
'    <p>#SUCCESS_MESSAGE#</p>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification warning" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium warning"/>',
'    <div class="warningMessage">',
'      <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'      #MESSAGE#',
'    </div>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_08'
,p_theme_class_id=>16
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
,p_reference_id=>18525205721780073.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7505408382227958.4307)
,p_theme_id=>3
,p_name=>'Green Look (Right SideBar) From 4999.zh-tw'
,p_is_popup=>false
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
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#',
'<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_06#',
'',
'',
'<div id="htmldbMessageHolder"><a name="SkipRepNav"></a>#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="htmldbBodyMargin">',
'  <div>#REGION_POSITION_01#</div>',
'  <div id="ContentBody">',
'    <div id="apex-two-col">',
'      <div id="apex-sidebar">#REGION_POSITION_03##REGION_POSITION_05#</div>',
'      <div id="apex-content">#REGION_POSITION_02#',
'        <div id="apex-splash"><div id="BB">#BODY#</div></div>',
'      </div>',
'    </div>',
'  </div>',
'  <div>#REGION_POSITION_04#</div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="apex-footer-info">',
'  <div style="float:right;">#FLOW_VERSION#</div>',
'  <div style="float:right;">#CUSTOMIZE#</div>',
'</div>',
'<div id="apex-footer">',
'   <div class="content">',
'     <div style="float:left;">&MSG_COMPANY.&nbsp;&MSG_USER.:&nbsp;&USER.</div>',
'     <div style="float:right;">&MSG_LANGUAGE.:&nbsp;&BROWSER_LANGUAGE.&nbsp;|&nbsp;&MSG_COPYRIGHT.</div>',
'   </div>',
'</div>',
'#FORM_CLOSE# <a name="END"><br />',
'</a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification success" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium success"/>',
'    <p>#SUCCESS_MESSAGE#</p>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification warning" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium warning"/>',
'    <div class="warningMessage">',
'      <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'      #MESSAGE#',
'    </div>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_08'
,p_theme_class_id=>1
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>18525411970780075.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(208580315559534207.4307)
,p_theme_id=>3
,p_name=>'APEX 4.2 - Wizard .zh-tw'
,p_is_popup=>false
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
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body #ONLOAD# class="aWizard">',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#',
'<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_06#',
'',
'<div class="wizardOuterContainer">',
'#REGION_POSITION_01#',
'<div class="wizardContainer">',
'    <h1 class="visuallyhidden">#TITLE#</h1>',
'    #REGION_POSITION_03#',
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="wizardBody">',
'    #BODY#',
'    #REGION_POSITION_04#',
'    #REGION_POSITION_05#',
'  </div>',
'</div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="apex-footer-info">',
'  <div style="float:right;">#FLOW_VERSION#</div>',
'  <div style="float:right;">#CUSTOMIZE#</div>',
'</div>',
'<div id="apex-footer">',
'   <div class="content">',
'     <div style="float:left;">&MSG_COMPANY.&nbsp;&MSG_USER.:&nbsp;&USER.</div>',
'     <div style="float:right;">&MSG_LANGUAGE.:&nbsp;&BROWSER_LANGUAGE.&nbsp;|&nbsp;&MSG_COPYRIGHT.</div>',
'   </div>',
'</div>',
'#FORM_CLOSE# <a name="END"><br />',
'</a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'<script>',
'function loadWizardTrain() {',
'	var currentStep = $("li.current,li.first-current,li.last-current",''div.wizardProgress'');',
'	if (currentStep.prev().length > 0) {',
'		currentStep.prevAll().find(''span'').addClass("pastCurrent");',
'	}',
'}',
'$(document).ready(function(){',
'loadWizardTrain();',
'})',
'</script>',
'</body></html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aWizardMessage successMessage" id="aSuccessMessage" role="alert">',
'  <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>',
'  <a href="javascript:void(0)" onclick="$x_Remove(''aSuccessMessage'')" class="aCloseNotification"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aWizardMessage errorMessage" id="aErrorMessage" role="alert">',
'  <a href="javascript:void(0)" onclick="$x_Remove(''aErrorMessage'')" class="aCloseNotification"><span class="visuallyhidden">#CLOSE_NOTIFICATION#</span></a>',
'  <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'  #MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_08'
,p_theme_class_id=>16
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
,p_reference_id=>42231511193339128.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(471759212441917909.4307)
,p_theme_id=>3
,p_name=>'APEX 4.2 - No SideBar.zh-tw'
,p_is_popup=>false
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
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#',
'<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="page-header">',
'  <div>',
'      <a id="apex-logo" href="#HOME_LINK#"><h1>#LOGO#</h1></a>',
'      <div class="nav-bar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="apex-top-bar-end">',
'    <div class="apex-top-bar">',
'       #REGION_POSITION_07#',
'    </div>',
'  </div>',
'  <div id="apex-breadcrumb-region-end">',
'    <div id="apex-breadcrumb-region">',
'      <div id="apex-breadcrumbs">#REGION_POSITION_08#</div>',
'      <div id="apex-help"><a href="&SYSTEM_HELP_URL." target="_blank"><img src="#IMAGE_PREFIX#f_spacer.gif" class="iconSmall help" alt="" /><span>&HELP.</span></a></div>',
'      <div id="apex-controls">#REGION_POSITION_06#</div>',
'    </div>',
'  </div>',
'</div>',
'',
'<div id="htmldbMessageHolder"><a name="SkipRepNav"></a>#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="htmldbBodyMargin">',
'  <div>#REGION_POSITION_01#</div>',
'  <div id="ContentBody">',
'    <div id="apex-content">#REGION_POSITION_02#',
'      <div id="apex-splash">#REGION_POSITION_04#<div id="BB">#BODY#</div></div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="apex-footer-info">',
'  <div style="float:right;">#FLOW_VERSION#</div>',
'  <div style="float:right;">#CUSTOMIZE#</div>',
'</div>',
'<div id="apex-footer">',
'   <div class="content">',
'     <div style="float:left;">&MSG_COMPANY.&nbsp;&MSG_USER.:&nbsp;&USER.</div>',
'     <div style="float:right;">&MSG_LANGUAGE.:&nbsp;&BROWSER_LANGUAGE.&nbsp;|&nbsp;&MSG_COPYRIGHT.</div>',
'   </div>',
'</div>',
'#FORM_CLOSE# <a name="END"><br />',
'</a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification success" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium success"/>',
'    <p>#SUCCESS_MESSAGE#</p>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification warning" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium warning"/>',
'    <div class="warningMessage">',
'      <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'      #MESSAGE#',
'    </div>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion aActionRegion failRegion #REGION_CSS_CLASSES#" id="ERROR">',
'  <div class="aRegionContent clearfix">',
'    <div class="aActionRegionIcon">',
'      <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" />',
'    </div>',
'    <p><strong>#MESSAGE#</strong></p>',
'    #ADDITIONAL_INFO#',
'    #TECHNICAL_INFO#',
'  </div>',
'  <span class="aButtonContainer">',
'    <button onclick="#BACK_LINK#" class="aButton hotButton"><span>#RETURN_TO_APPLICATION#</span></button>',
'  </span>',
'</section>'))
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>187453329378870285.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(716604580917788355.4307)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Dialog.zh-tw'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.builder.initWizardModal();'
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
'<meta charset="UTF-8" />',
'<title>#TITLE#</title>',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'',
'#APEX_CSS#',
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
'<body class="a-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Dialog" role="dialog" aria-label="#TITLE#">',
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
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
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
,p_dialog_css_classes=>'a-Dialog--uiDialog'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>120828417372192930.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(716604939833788366.4307)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Edit Screen.zh-tw'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.builder.initStickyHeader(''a_EditScreen_header'');'
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
'<body #ONLOAD#>',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'  <div class="a-Body">',
'    <main class="a-Main">',
'      #REGION_POSITION_02#',
'      <div class="a-EditScreen">',
'        <div class="a-EditScreen-header" id="a_EditScreen_header">',
'          #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'          #REGION_POSITION_04#',
'        </div>',
'        <div class="a-EditScreen-body">',
'          #BODY#',
'        </div>',
'      </div>',
'    </main>',
'    <aside class="a-Side">',
'        #REGION_POSITION_03#',
'        #REGION_POSITION_05#',
'    </aside>',
'  </div>'))
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
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="alert">',
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
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="alert">',
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
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
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
,p_reference_id=>689595297061847770.4307
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(747112016170067798.4307)
,p_page_template_id=>wwv_flow_api.id(716604939833788366.4307)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(747112448459067799.4307)
,p_page_template_id=>wwv_flow_api.id(716604939833788366.4307)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(716607252394788370.4307)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.zh-tw'
,p_is_popup=>false
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
'<body #ONLOAD#>',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'#REGION_POSITION_02#',
'#REGION_POSITION_03#',
'  <div class="a-Body">',
'    <main class="a-Main">',
'        #BODY#',
'    </main>',
'  </div>',
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
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="alert">',
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
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="alert">',
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
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
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
'        <h2 class="a-Alert-title">#MESSAGE#</h2>',
'      </div>',
'      <div class="a-Alert-body">',
'        #ADDITIONAL_INFORMATION#',
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
,p_reference_id=>637437892049443496.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(716607780903788372.4307)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.zh-tw'
,p_is_popup=>false
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
'<body #ONLOAD#>',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'#REGION_POSITION_02#',
'  <div class="a-Body">',
'    <main class="a-Main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'    </main>',
'    <aside class="a-Side">',
'        #REGION_POSITION_03#',
'    </aside>',
'  </div>',
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
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="alert">',
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
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="alert">',
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
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
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
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>386895861966224222.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970723723564339906.4307)
,p_page_template_id=>wwv_flow_api.id(716607780903788372.4307)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970724109087339906.4307)
,p_page_template_id=>wwv_flow_api.id(716607780903788372.4307)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970724540049339907.4307)
,p_page_template_id=>wwv_flow_api.id(716607780903788372.4307)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970724913565339907.4307)
,p_page_template_id=>wwv_flow_api.id(716607780903788372.4307)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970725381151339907.4307)
,p_page_template_id=>wwv_flow_api.id(716607780903788372.4307)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970725711831339907.4307)
,p_page_template_id=>wwv_flow_api.id(716607780903788372.4307)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970726188421339907.4307)
,p_page_template_id=>wwv_flow_api.id(716607780903788372.4307)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(716609164058788372.4307)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Sign Up Wizard.zh-tw'
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
,p_reference_id=>702692008314080052.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(716609648731788373.4307)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard.zh-tw'
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
,p_reference_id=>702684260095026477.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824989302125308447.4307)
,p_page_template_id=>wwv_flow_api.id(716609648731788373.4307)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824989797922308447.4307)
,p_page_template_id=>wwv_flow_api.id(716609648731788373.4307)
,p_name=>'Wizard Progress List'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824990142859308448.4307)
,p_page_template_id=>wwv_flow_api.id(716609648731788373.4307)
,p_name=>'Wizard Title'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824990504766308448.4307)
,p_page_template_id=>wwv_flow_api.id(716609648731788373.4307)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(716613771837788376.4307)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Dialog.zh-tw'
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
,p_reference_id=>689061037088924910.4307
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1184364303968453797.4307)
,p_theme_id=>3
,p_name=>'APEX 4.1 - Optional Right Sidebar (Table).zh-tw'
,p_is_popup=>false
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
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#',
'<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_06#',
'',
'',
'<div id="htmldbMessageHolder"><a name="SkipRepNav"></a>#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="htmldbBodyMargin">',
'  <div>#REGION_POSITION_01#</div>',
'  <div id="ContentBody">',
'    <table id="apex-page-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'      <tbody>',
'        <tr>',
'          <td class="apex-page-content" width="100%">',
'            #REGION_POSITION_02#',
'            <div id="apex-splash">#REGION_POSITION_04#<div id="BB">#BODY#</div></div>	    ',
'	      </td>',
'          <td class="apex-page-sidebar">#REGION_POSITION_03##REGION_POSITION_05#</td>     ',
'        </tr>',
'      </tbody>',
'    </table>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="apex-footer-info">',
'  <div style="float:right;">#FLOW_VERSION#</div>',
'  <div style="float:right;">#CUSTOMIZE#</div>',
'</div>',
'<div id="apex-footer">',
'   <div class="content">',
'     <div style="float:left;">&MSG_COMPANY.&nbsp;&MSG_USER.:&nbsp;&USER.</div>',
'     <div style="float:right;">&MSG_LANGUAGE.:&nbsp;&BROWSER_LANGUAGE.&nbsp;|&nbsp;&MSG_COPYRIGHT.</div>',
'   </div>',
'</div>',
'#FORM_CLOSE# <a name="END"><br />',
'</a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification success" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium success"/>',
'    <p>#SUCCESS_MESSAGE#</p>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aNotification warning" id="MESSAGE" role="alert">',
'  <div class="aNotificationText">',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" class="iconMedium warning"/>',
'    <div class="warningMessage">',
'      <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
'      #MESSAGE#',
'    </div>',
'    <a href="#" class="closeMessage" onclick="$x_Remove(''MESSAGE'');return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="#CLOSE_NOTIFICATION#" class="iconSmall close"/></a>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>1
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
,p_reference_id=>450655205700156564.4307
,p_translate_this_template=>'N'
);
null;
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(388298521291079233.4307)
,p_template_name=>'APEX 5.0 - Icon Menu Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_reference_id=>3705338883615.4307
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(388298732478079235.4307)
,p_template_name=>'APEX 5.0 - Icon Only Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CL'
||'ASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>353820721334283301.4307
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(716616681872794730.4307)
,p_template_name=>'APEX 5.0 - Button'
,p_template=>'<button onclick="#JAVASCRIPT#" class="a-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="a-Button a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174750904387485475.4307
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(716616877554794734.4307)
,p_template_name=>'APEX 5.0 - Button with Icon'
,p_template=>'<button class="a-Button a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_reference_id=>404889142313786233.4307
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(716617173062794734.4307)
,p_template_name=>'APEX 5.0 - Icon Badge Button'
,p_template=>'<button class="a-Button a-Button--noLabel #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#"></span><span class="a-But'
||'ton-badge"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#"></span><spa'
||'n class="a-Button-badge"></span></button>'
,p_reference_id=>631020282344854024.4307
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(716617477116794735.4307)
,p_template_name=>'APEX 5.0 - Icon Badge Menu Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#"></span><span class="a-Button-badge"></span><span class="a-Icon icon-menu-drop-down"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#"></span><span class="a-Button-badge"></span><span class="a-Icon icon-menu-drop-down"></span></button>'
,p_reference_id=>631020159860848910.4307
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(9113673096289.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion altHeading editRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'      <a href="#" class="aIconButton" onclick="uF();return false;"><img src="#IMAGE_PREFIX#f_spacer.gif" class="upIcon" alt="&TOP." /></a>',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'gray-box'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>17353903289599940.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(101735615849237059.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" style="width:100%">',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title"><h2>#TITLE#</h2></div>',
'    <div class="rc-buttons">#EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r"><div class="rc-content">#BODY#</div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Report Region'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>17354512447599941.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(104263607591363808.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion sideRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Info (c:htmldbInfo)  From 4999'
,p_plug_table_bgcolor=>'#F7F7E7'
,p_theme_id=>3
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#F7F7E7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>' '
,p_reference_id=>17355419405599943.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(170264105041113342.4307)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# style="float:left;clear:both;">#BODY#</div>'
,p_page_plug_template_name=>'APEX 4.0 - Div (Float Left)'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>35964702876463547.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(170268110269113348.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'APEX 4.0 - Rounded Corner 180px (Gray Top)'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>32612420016685806.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(170269127235113349.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion sideRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'APEX 4.0 - Sidebar (Gray Header)'
,p_plug_table_bgcolor=>'#F7F7E7'
,p_theme_id=>3
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#F7F7E7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>' '
,p_reference_id=>17355419405599943.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(170270131526113350.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion buttonRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    #BODY#',
'    <span class="aButtonContainer">',
'      #CLOSE##COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#',
'    </span>',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'APEX 4.0 - Top Bar (100%)'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>17357218626599946.4307
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <table class="TopBarUIFix" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" width="100%"><tbody class="GreenBar"><tr><td valign="middle" class="L">#BODY#</td><td width="30" class="C"><br /></td><td valign="middle" class='
||'"R" align="right"><span style="margin-right:10px;">#CLOSE#</span>#COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#</td></tr></tbody></table>',
''))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(208585513765537107.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aWizardRegion" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'</section>'))
,p_page_plug_template_name=>'APEX 4.2 - Wizard Body'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>42209615589242480.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(208585923103537108.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aWizardRegion dividerTop" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'<div class="wizardRegionHeading">',
'  <h1>#TITLE#</h1>',
'  <div class="buttonContainer">',
'#EDIT##CLOSE##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT##CREATE##CREATE2#',
'  </div>',
'</div>',
'  #BODY#',
'</section>'))
,p_page_plug_template_name=>'APEX 4.2 - Wizard Body (Divider)'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>42209811475242480.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(208586424307537108.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aWizardRegion dividerTop" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
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
,p_page_plug_template_name=>'APEX 4.2 - Wizard Body (Hide/Show)'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>42210116661242480.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(208586913756537109.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="wizardButtonsContainer" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="leftButtons">',
'    #PREVIOUS##DELETE##CHANGE##CLOSE#',
'  </div>',
'  <div class="rightButtons">',
'    #EDIT##CREATE##NEXT#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 4.2 - Wizard Buttons'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>42210411889242480.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(279748823389483962.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-wiz-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# >',
'  <div class="rc-blue-top"><div class="rc-blue-top-r">',
'    <div class="rc-title"><h2>#TITLE#</h2></div>',
'    <div class="rc-buttons">#CLOSE##DELETE##EDIT##CHANGE##PREVIOUS##NEXT##CREATE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r"><div class="rc-content">#BODY#</div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'(Done) Wizard Box (Collapse)'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>236935712467247464.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(388246039131933975.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="a-Region-header">',
'    <div class="a-Region-headerItems  a-Region-headerItems--title">',
'      <h2 class="a-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--buttons">',
'      #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'    </div>',
'  </div>',
'  <div class="a-Region-body">',
'  <div class="a-Region-bodyHeader">#REGION_HEADER#</div>',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Region'
,p_theme_id=>3
,p_theme_class_id=>21
,p_preset_template_options=>'a-Region--noPadding'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174748721787471587.4307
,p_translate_this_template=>'N'
,p_template_comment=>'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI a-Button--goToTop" onclick="uF();" type="button" title="&TOP."><span class="a-Icon icon-up-chevron"></span></button>'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(388246630957934005.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-Region-header">',
'    <div class="a-Region-headerItems  a-Region-headerItems--left">',
'      <h2 class="a-Region-title">#TITLE#</h2>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--right">',
'      #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'    </div>',
'  </div>',
'  <div class="a-Region-body">',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Region (Top Buttons)'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174747104640428780.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(388251521427936641.4307)
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
,p_reference_id=>716895227337398760.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716642617570817147.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Accordion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #SUBREGIONS#',
'</div>',
'<script type="text/javascript">',
'  apex.jQuery( "#accordion" ).accordion({',
'    icons: false,',
'    header: ".a-Region-header",',
'    heightStyle: ''content'',',
'    collapsible: true',
'  });',
'</script>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Accordion-item">',
'#SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Accordion'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174746301430371105.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716643236475817156.4307)
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
,p_reference_id=>687153470345619376.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716648790045817165.4307)
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
,p_reference_id=>689955986849128825.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716658831322817171.4307)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="a-IRR-region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading"><h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>#PREVIOUS##BODY##NEXT#</div>'
,p_page_plug_template_name=>'APEX 5.0 - Interactive Report Region'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_template_options=>'a-IRR-region--responsiveIconView'
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>678354360586321695.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716660784129817173.4307)
,p_layout=>'TABLE'
,p_template=>'<div class="a-PageAnchors #COMPONENT_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'APEX 5.0 - Page Anchors'
,p_plug_table_bgcolor=>'white'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'white'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>' '
,p_reference_id=>17354206769599941.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716661407318817173.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-PageColumn #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-PageColumn-header">',
'    <h2 class="a-PageColumn-heading">#TITLE#</h2>',
'  </div>',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Page Designer Column'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174613223222362440.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716662167050817173.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-PageColumn-body #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Page Designer Column (Body)'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174630015632506596.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716662948592817174.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Region a-Region--hasIcon #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="a-Region-header">',
'    <div class="a-Region-headerItems  a-Region-headerItems--title">',
'      <h2 class="a-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--buttons">',
'      #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'    </div>',
'  </div>',
'  <div class="a-Region-body">',
'    <div class="a-RegionMedia">',
'      <div class="a-RegionMedia-graphic">',
'        <span class="a-Icon a-Icon--regionIcon #ICON_CSS_CLASSES#"></span>',
'      </div>',
'      <div class="a-RegionMedia-content">',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Region with Icon'
,p_theme_id=>3
,p_theme_class_id=>21
,p_preset_template_options=>'a-Region--noPadding'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>698829239393878937.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716673270402817181.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-TabsContainer #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #SUB_REGION_HEADERS#',
'  #SUB_REGIONS#',
'</div>',
'<script type="text/javascript">',
'    $("##REGION_STATIC_ID#").tabs({',
'      create: function() {',
'        $(this).addClass(''ui-tabs--simpleInset'')',
'      }',
'    });',
'</script>'))
,p_sub_plug_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul>',
'#ENTRIES#',
'</ul>'))
,p_sub_plug_header_entry_templ=>'<li><a href="##SUB_REGION_ID#">#SUB_REGION_TITLE#</a></li>'
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-TabsContainer-item" id="#SUB_REGION_ID#">',
'#SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Tabs'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>183211208341566300.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716673932750817181.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Toolbar #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-Toolbar-items a-Toolbar-items--left">#PREVIOUS#</div>',
'  <div class="a-Toolbar-items a-Toolbar-items--right">#NEXT#</div>',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Toolbar'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174613705533399534.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716674688097817182.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Toolbar-items a-Toolbar-items--left #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Toolbar Items (Left)'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174628415239478085.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716675364323817183.4307)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Toolbar-items a-Toolbar-items--right #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Toolbar Items (Right)'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>174629130392501406.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716676055535817183.4307)
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
,p_reference_id=>399850559367741099.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716676747173817184.4307)
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
,p_reference_id=>702777601713950915.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(716677498440817185.4307)
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
,p_reference_id=>703469000349150769.4307
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(3482816826549973.4307)
,p_list_template_current=>'<li class="a-LinksList-item is-current #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_noncurrent=>'<li class="a-LinksList-item #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#</span></a>'
||'</li>'
,p_list_template_name=>'unordered list'
,p_theme_id=>3
,p_theme_class_id=>1
,p_default_template_options=>'a-LinksList--showArrow'
,p_list_template_before_rows=>'<ul class="a-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="a-LinksList-item is-current #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#'
||'</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="a-LinksList-item#A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="a-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#</span></a><'
||'/li>'
,p_item_templ_curr_w_child=>'<li class="a-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-'
||'badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="a-LinksList-item #A03#"><a href="#LINK#" class="a-LinksLisa-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksLisa-label">#TEXT#</span><span class="a-LinksList-badge">#A01#</span></a>'
||'</li>'
,p_reference_id=>60219508156141083.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(119835024987557728.4307)
,p_list_template_current=>'<tr><td class="htmldbStandardList1"><a href="#LINK#" class="itemLink" title="#TEXT_ESC_SC#">#TEXT#</a></td></tr>'
,p_list_template_noncurrent=>'<tr><td class="htmldbStandardList2"><a href="#LINK#" class="itemLink" title="#TEXT_ESC_SC#">#TEXT#</a></td></tr>'
,p_list_template_name=>'standard-list-w-link'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="htmldbStandardList" cellpadding="0" cellspacing="0" border="0" summary="">',
'<tbody>'))
,p_list_template_after_rows=>'</tbody></table>'
,p_reference_id=>17385324891888482.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(170283117853932398.4307)
,p_list_template_current=>'<li><a href="#LINK#" title="#TEXT#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#" title="#TEXT#">#TEXT#</a></li>'
,p_list_template_name=>'Copy of Simple Image List'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<ul class="listwithicon">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>32421627622986728.4307
,p_list_template_comment=>'<img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(187647214478984350.4307)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="current">',
'    <a class="nosub" href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a>',
'</div>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="non-current">',
'    <a class="nosub" href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a>',
'</div>',
''))
,p_list_template_name=>'APEX 4.0 - Pull Down Tabs'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<div id="tabs" class="dhtmlMenuLG">'
,p_list_template_after_rows=>'</div>'
,p_before_sub_list=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul id="S#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="aTabs dhtmlSubMenu pulldown-tabs" style="display:none;">',
''))
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)" title="#TEXT_ESC_SC#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="current">',
'    <a href="#LINK#" title="#TEXT_ESC_SC#" class="link_text">#TEXT#</a>',
'    <a href="#" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false); return false;" class="link_icon">',
'        <img src="#IMAGE_PREFIX#apex/builder/down_dark_12x12.gif" width="12" height="12" class="dhtmlMenu" alt="#IMAGE_ALT#"/>',
'    </a>',
'</div>',
''))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="non-current">',
'    <a href="#LINK#" title="#TEXT_ESC_SC#" class="link_text">#TEXT#</a>',
'    <a href="#" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false); return false;" class="link_icon">',
'        <img src="#IMAGE_PREFIX#apex/builder/down_dark_12x12.gif" width="12" height="12" class="dhtmlMenu" alt="#IMAGE_ALT#"/>',
'    </a>',
'</div>',
''))
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')" title="#TEXT_ESC_SC#"><span>#TEXT#</span><img class="htmldbMIMG" alt="" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></'
||'li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')" title="#TEXT_ESC_SC#"><span>#TEXT#</span><img class="htmldbMIMG" alt="" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></'
||'li>'
,p_reference_id=>9651611091899590.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(208592324393539718.4307)
,p_list_template_current=>'<li class="#LIST_STATUS#"><span>#TEXT#</span></li>'
,p_list_template_noncurrent=>'<li class="#LIST_STATUS#"><span>#TEXT#</span></li>'
,p_list_template_name=>'APEX 4.2 - Wizard Progress Bar'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="wizardProgress">',
'<ul>'))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</div>'))
,p_reference_id=>42216127932260877.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(388254947243942451.4307)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'APEX 5.0 - Navigation List'
,p_theme_id=>3
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul>'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_sub_list_item_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>',
''))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>',
''))
,p_sub_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>',
''))
,p_sub_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>',
''))
,p_reference_id=>573607518145151423.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(388255255364942452.4307)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'APEX 5.0 - Menu Popup'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup(e);',
'}',
'e.menu({ slide: e.hasClass("js-slide")});',
''))
,p_theme_id=>3
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>747588010155545129.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(716622637646805405.4307)
,p_list_template_current=>'<li class="a-ImageNav-item"><button type="button" data-link="#LINK#" class="a-ImageNav-link launch-aut #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></button></li>'
,p_list_template_noncurrent=>'<li class="a-ImageNav-item"><a href="#LINK#" class="a-ImageNav-link #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></a></li>'
,p_list_template_name=>'APEX 5.0 - Image Navigation'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<ul class="a-ImageNav #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>481290423891543508.4307
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td style="width: 20%">',
'	<a href="#LINK#" class="iconContainer" title="#TEXT_ESC_SC#">',
'		<span class="largeIcon"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></span>',
'		<span class="iconLabel">#TEXT#</span>',
'	</a>',
'</td>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(716623225818805411.4307)
,p_list_template_current=>'<li class="a-LinksList-item is-current #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_noncurrent=>'<li class="a-LinksList-item #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#</span></a>'
||'</li>'
,p_list_template_name=>'APEX 5.0 - Links List'
,p_theme_id=>3
,p_theme_class_id=>1
,p_default_template_options=>'a-LinksList--showArrow'
,p_list_template_before_rows=>'<ul class="a-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="a-LinksList-item is-current #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#'
||'</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="a-LinksList-item#A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="a-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#</span></a><'
||'/li>'
,p_item_templ_curr_w_child=>'<li class="a-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-'
||'badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="a-LinksList-item #A03#"><a href="#LINK#" class="a-LinksLisa-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksLisa-label">#TEXT#</span><span class="a-LinksList-badge">#A01#</span></a>'
||'</li>'
,p_reference_id=>60219508156141083.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(716627442136805429.4307)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="a-MediaList-item is-active">',
'    <a href="#LINK#" class="a-MediaList-link" #A03#>',
'        <div class="a-MediaList-iconWrap">',
'            <span class="a-MediaList-icon"><span class="a-Icon #IMAGE#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="a-MediaList-body">',
'            <h3 class="a-MediaList-title">#TEXT#</h3>',
'            <p class="a-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="a-MediaList-badgeWrap">',
'            <span class="a-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="a-MediaList-item">',
'    <a href="#LINK#" class="a-MediaList-link" #A03#>',
'        <div class="a-MediaList-iconWrap">',
'            <span class="a-MediaList-icon"><span class="a-Icon #IMAGE#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="a-MediaList-body">',
'            <h3 class="a-MediaList-title">#TEXT#</h3>',
'            <p class="a-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="a-MediaList-badgeWrap">',
'            <span class="a-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'APEX 5.0 - Media List'
,p_theme_id=>3
,p_theme_class_id=>9
,p_default_template_options=>'a-MediaList--noBadge'
,p_list_template_before_rows=>'<ul class="a-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>692720897220784060.4307
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(716634611298805444.4307)
,p_list_template_current=>'<li class="a-Tabs-item is-active"><a href="#LINK#" class="a-Tabs-link">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="a-Tabs-item"><a href="#LINK#" class="a-Tabs-link">#TEXT#</a></li>'
,p_list_template_name=>'APEX 5.0 - Sub Tabs'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<div class="a-TabsContainer a-TabsContainer--subTabs"><ul class="a-Tabs a-Tabs--subTabButtons">'
,p_list_template_after_rows=>'</ul></div>'
,p_reference_id=>168708522102193705.4307
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aSubTabs"><ul>',
'<li class="active"><a href="#LINK#" title="#TEXT_ESC_SC#"><span>#TEXT#</span></a></li>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(716635374633805444.4307)
,p_list_template_current=>'<li class="a-WizardSteps-step is-active"><div class="a-WizardSteps-wrap"><span class="a-WizardSteps-marker"><span class="a-Icon icon-wizard-step-complete"></span></span><span class="a-WizardSteps-label">#TEXT# <span class="a-WizardSteps-labelState"><'
||'/span></span></div></li>'
,p_list_template_noncurrent=>'<li class="a-WizardSteps-step is-inactive"><div class="a-WizardSteps-wrap"><span class="a-WizardSteps-marker"><span class="a-Icon icon-wizard-step-complete"></span></span><span class="a-WizardSteps-label">#TEXT# <span class="a-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'APEX 5.0 - Wizard Progress'
,p_theme_id=>3
,p_theme_class_id=>17
,p_default_template_options=>'a-WizardSteps--slim'
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="a-WizardSteps #COMPONENT_CSS_CLASSES#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>687902065557685310.4307
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(10583525904875984.4307)
,p_row_template_name=>'(DHTML) Automatic PPR Pagination Report From 4999 (2)'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" cellspacing="0" class="u-Report"  border="0" summary="#REGION_TITLE#" id="#REGION_ID#" htmldb:href="p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:pg_R_#REGION_ID#:NO:">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="htmldbCSV">#CSV_LINK#</span>',
'',
'<script language=JavaScript type=text/javascript>',
'<!--',
'init_htmlPPRReport(''#REGION_ID#'');',
'',
'//-->',
'</script>',
'</htmldb:#REGION_ID#>',
'</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#TEXT#',
''))
,p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><span class="a-Icon icon-right-chevron"></span></a>'
,p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><span class="a-Icon icon-left-chevron"></span></a>'
,p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>3
,p_theme_class_id=>7
,p_reference_id=>6574616710304003.4307
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(10583525904875984.4307)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(24534016112516813.4307)
,p_row_template_name=>'(DHTML) Automatic PPR Pagination Report'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" cellspacing="0" class="u-Report"  border="0" summary="#REGION_TITLE#" id="#REGION_ID#" htmldb:href="p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:pg_R_#REGION_ID#:NO:">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="htmldbCSV">#CSV_LINK#</span>',
'',
'<script language=JavaScript type=text/javascript>',
'<!--',
'init_htmlPPRReport(''#REGION_ID#'');',
'',
'//-->',
'</script>',
'</htmldb:#REGION_ID#>',
'</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#TEXT#',
''))
,p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><span class="a-Icon icon-right-chevron"></span></a>'
,p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><span class="a-Icon icon-left-chevron"></span></a>'
,p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>3
,p_theme_class_id=>7
,p_reference_id=>6574616710304003.4307
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(24534016112516813.4307)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(716680169562820879.4307)
,p_row_template_name=>'APEX 5.0 - Badge List (Named Column)'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="a-BadgeList-item #A01#">',
'  <span class="a-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="a-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>',
''))
,p_row_template_before_rows=>'<ul class="a-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>0
,p_preset_template_options=>'a-BadgeList--fixed:a-BadgeList--large'
,p_reference_id=>488487951233692049.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(716689315506820891.4307)
,p_row_template_name=>'APEX 5.0 - Badge List (Row)'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#1#</span>',
'  <span class="t-BadgeList-value">#2#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>6
,p_reference_id=>689060248369886348.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(716690084418820892.4307)
,p_row_template_name=>'APEX 5.0 - Links List'
,p_row_template1=>'<li class="a-LinksList-item">#COLUMN_VALUE#</li>'
,p_row_template_before_rows=>'<ul class="a-LinksList a-LinksList--report #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>'</ul>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'OMIT'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_template_options=>'a-LinksList--nowrap:a-LinksList--showArrow'
,p_reference_id=>17383712077884846.4307
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(716690084418820892.4307)
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>'OMIT'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(716692596502820893.4307)
,p_row_template_name=>'APEX 5.0 - Standard Report'
,p_row_template1=>'<td class="a-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="a-Report-wrap">',
'    <table class="a-Report-pagination">#TOP_PAGINATION#</table>',
'    <div class="a-Report-tableWrap">',
'    <table class="a-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="a-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="a-Report-pagination a-Report-pagination a-Report-pagination--bottom">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="a-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>'</thead><tbody>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="a-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>3
,p_theme_class_id=>7
,p_reference_id=>123725814882271159.4307
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(716692596502820893.4307)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(103909823939152778.4307)
,p_template_name=>'FormField_Nonrequired'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="aLabel aOptional"><a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_on_error_after_label=>'<small class="aError">#ERROR_MESSAGE#</small>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>17388415351892041.4307
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(103910729134154335.4307)
,p_template_name=>'FormField_Required'
,p_template_body1=>'<em>*</em><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="aLabel aRequired"><a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>' <span class="hideMeButHearMe">(#VALUE_REQUIRED#)</span></a></label>'
,p_on_error_after_label=>'<small class="aError">#ERROR_MESSAGE#</small>'
,p_theme_id=>3
,p_theme_class_id=>2
,p_reference_id=>17388508175892042.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(716619724928799710.4307)
,p_template_name=>'APEX 5.0 - Dynamic Attribute'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'  <span class="a-Form-required"><span class="a-Icon icon-asterisk"></span></span><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-dynamicItemHelp" data-itemname="#CURRENT_ITEM_NAME#" data-appid="&FB_FLOW_ID." title="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help"></span><span cl'
||'ass="u-VisuallyHidden">#CURRENT_ITEM_HELP_LABEL#</span></button>#ERROR_TEMPLATE#</div>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>692681574974429799.4307
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(716619812724799715.4307)
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
,p_reference_id=>687907221148719616.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(716619902812799716.4307)
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
,p_reference_id=>487444299516703815.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(716620098616799716.4307)
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
,p_reference_id=>492676964457041934.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(716620116614799716.4307)
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
,p_reference_id=>487443659585685414.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(716620262276799717.4307)
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
,p_reference_id=>492677038682043223.4307
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(6680621597641306.4307)
,p_name=>'breadcrumbs'
,p_current_page_option=>'<span class="htmldbBreadcrumb">#NAME#</span>'
,p_non_current_page_option=>'<a href="#LINK#" class="htmldbBreadcrumb" title="#NAME#">#NAME#</a>'
,p_between_levels=>'<span class="htmldbBreadcrumbSep"><img alt="" src="#IMAGE_PREFIX#apex/apex_top_sep.gif"></span>'
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>60115300853820165.4307
,p_translate_this_template=>'N'
);
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(388324150680174551.4307)
,p_name=>'APEX 5.0 - Breadcrumbs'
,p_before_first=>'<ul class="a-Breadcrumb">'
,p_current_page_option=>'<li class="a-Breadcrumb-item a-Breadcrumb-item is-active"><span class="a-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="a-Breadcrumb-item"><a href="#LINK#" class="a-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>689285808648404711.4307
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(14450905155573152.4307)
,p_page_name=>'winlov'
,p_page_title=>'搜尋對話方塊'
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
,p_find_button_text=>'搜尋'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'關閉'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'下一步 &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; 上一步'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">#FIRST_ROW# 到 #LAST_ROW# 個資料列</div>'
,p_result_rows_per_pg=>200
,p_before_result_set=>'<div class="a-PopupLOV-links">'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>17343114994581872.4307
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
 p_id=>wwv_flow_api.id(204023628129766298.4307)
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
 p_id=>wwv_flow_api.id(689614385032993955.4307)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(689615352683993957.4307)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(689616067927993957.4307)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(689617971149993958.4307)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(697050181422402965.4307)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(697237270343708853.4307)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716627933163805437.4307)
,p_theme_id=>3
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716651026369817167.4307)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716680568033820885.4307)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716683010367820887.4307)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716693030768820894.4307)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716693772056820894.4307)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716694490428820895.4307)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(716695780930820895.4307)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746384980429369270.4307)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746386277848369272.4307)
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
 p_id=>wwv_flow_api.id(746386590179369273.4307)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746386837091369273.4307)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746387914400369273.4307)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746388241346369273.4307)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746388584487369274.4307)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746388817603369274.4307)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746389125810369274.4307)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746389680630369274.4307)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746389981180369274.4307)
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
 p_id=>wwv_flow_api.id(716631528909805442.4307)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(716627933163805437)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716631802430805442.4307)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(716627933163805437)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716632125006805443.4307)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(716627933163805437)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716632489831805443.4307)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(716627933163805437)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716632734421805443.4307)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(716627933163805437)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716633065178805443.4307)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716633316484805443.4307)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716633627405805444.4307)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716633983927805444.4307)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716634227760805444.4307)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716627442136805429.4307)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716646319427817163.4307)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716646619661817164.4307)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(689616067927993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716646910119817164.4307)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(689616067927993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716647269701817164.4307)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716647553597817164.4307)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716647865815817165.4307)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716648106429817165.4307)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_api.id(697050181422402965)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716648424698817165.4307)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716643236475817156.4307)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_api.id(697050181422402965)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716685439520820889.4307)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716685743417820889.4307)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716686060431820889.4307)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716686384136820889.4307)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_api.id(716683010367820887)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716686665684820889.4307)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(716683010367820887)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716686908265820889.4307)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_api.id(716683010367820887)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716687260952820889.4307)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(716683010367820887)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716687559988820890.4307)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(716683010367820887)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716687806578820890.4307)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716688135348820890.4307)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716688413599820890.4307)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716688770385820890.4307)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(716689011646820890.4307)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716680169562820879.4307)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(716680568033820885)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746385021702369271.4307)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_api.id(746384980429369270)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746385273484369271.4307)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_api.id(746384980429369270)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746385423121369271.4307)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_api.id(746384980429369270)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746385659686369271.4307)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_api.id(746384980429369270)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746385813465369271.4307)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_api.id(746384980429369270)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746386068179369271.4307)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_api.id(746384980429369270)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746386322011369272.4307)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(746386277848369272)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746386638275369273.4307)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_api.id(746386590179369273)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746386963177369273.4307)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_api.id(746386837091369273)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746387177619369273.4307)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_api.id(746386590179369273)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746387398521369273.4307)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_api.id(746386590179369273)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746387523132369273.4307)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_api.id(746386590179369273)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746387785673369273.4307)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_api.id(746386837091369273)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746388036191369273.4307)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_api.id(746387914400369273)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746388367616369273.4307)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(746388241346369273)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746388624176369274.4307)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_api.id(746388584487369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746388983120369274.4307)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(746388817603369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746389216430369274.4307)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_api.id(746389125810369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746389467393369274.4307)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(746386837091369273)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746389708684369274.4307)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746389680630369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746390046020369274.4307)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_api.id(746389981180369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746390150868369274.4307)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746390397268369274.4307)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_api.id(746388584487369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746390512332369275.4307)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_api.id(746388817603369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746390767691369275.4307)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_api.id(746389125810369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746390882019369275.4307)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(746390917880369275.4307)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787136680200949751.4307)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716692596502820893.4307)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(716693030768820894)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787136832495949751.4307)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716692596502820893.4307)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(716693772056820894)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787137078732949751.4307)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716692596502820893.4307)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_api.id(716694490428820895)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787137218251949751.4307)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716692596502820893.4307)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(716694490428820895)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787137405724949751.4307)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716692596502820893.4307)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(716694490428820895)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787137521807949751.4307)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716692596502820893.4307)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787137715876949751.4307)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716692596502820893.4307)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_api.id(716695780930820895)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(926398873781707530.4307)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(388255255364942452.4307)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(926398916414707530.4307)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(388255255364942452.4307)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(940695494482341567.4307)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1199563165206032440.4307)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746389680630369274)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525654306702182071.4307)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525654416732182071.4307)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525654507461182071.4307)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525654689857182071.4307)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525654825674182071.4307)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(697237270343708853)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525655034537182071.4307)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(697237270343708853)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525659340255182097.4307)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525659441811182097.4307)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525659560470182097.4307)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525659675457182098.4307)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525659887066182098.4307)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(697237270343708853)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525660099207182098.4307)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(697237270343708853)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544820405774478040.4307)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716690084418820892.4307)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544820596794478040.4307)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716690084418820892.4307)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544820636742478040.4307)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(716690084418820892.4307)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554801274622408333.4307)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(697050181422402965)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554801401450408333.4307)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_api.id(697050181422402965)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554801638095408334.4307)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554801888000408334.4307)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554802037921408334.4307)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(689615352683993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554802202518408334.4307)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(689616067927993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554802406950408334.4307)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(689617971149993958)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554802636388408334.4307)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(689617971149993958)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554802870646408334.4307)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554802972049408334.4307)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554803157047408334.4307)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(388246039131933975.4307)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_api.id(689616067927993957)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554834649462526824.4307)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_api.id(716658831322817171.4307)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554834759654526824.4307)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716658831322817171.4307)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554834865767526824.4307)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716658831322817171.4307)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554854985135542298.4307)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554855096554542298.4307)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554855290375542298.4307)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554855436301542298.4307)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554855609961542299.4307)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(689615352683993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554855863802542299.4307)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(689616067927993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554856018683542299.4307)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(689617971149993958)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554856254808542299.4307)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(689617971149993958)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554856471559542299.4307)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(716651026369817167)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554856619328542299.4307)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716648790045817165.4307)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(716651026369817167)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554872845517550829.4307)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554873082445550829.4307)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_api.id(697050181422402965)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554873264879550829.4307)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(689617971149993958)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554873467120550829.4307)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(689616067927993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554873649715550830.4307)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554873866842550830.4307)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(697050181422402965)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554874039691550830.4307)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554874220093550830.4307)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(689617971149993958)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554874432919550830.4307)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(689615352683993957)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554874697518550830.4307)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(716662948592817174.4307)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(689614385032993955)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(693448447977546491.4307)
,p_build_option_name=>'Enable APEX Internal Feedback'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
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
 p_id=>wwv_flow_api.id(180670925407283078.4307)
,p_shortcut_name=>'ITEM_HELP'
,p_shortcut_type=>'HTML_TEXT'
,p_error_text=>'無法顯示說明.'
,p_reference_id=>24184979678.4307
,p_shortcut=>'<a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999"><img src="#IMAGE_PREFIX#infoicon_status_gray.gif" width=16 height=16 border=0></a>'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(539653303570634151.4307)
,p_name=>'Internal Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=4550:8:&SESSION.'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_cookie_path=>'&CGI_SCRIPT_NAME.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>540226219724705040.4307
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/authorization_type/com_oracle_apex_developer_authorization
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(12521612942512635.4307)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_display_name=>'開發人員授權'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function is_authorized (',
'    p_authorization in apex_plugin.t_authorization,',
'    p_plugin        in apex_plugin.t_plugin )',
'    return apex_plugin.t_authorization_exec_result',
'is',
'    l_result               apex_plugin.t_authorization_exec_result;',
'begin',
'    l_result.is_authorized := wwv_flow_authorization.is_authorized_developer ( ',
'                                  p_developer_authorization => p_authorization.attribute_01 );',
'    return l_result;',
'exception',
'    when no_data_found then',
'        l_result.is_authorized := false;',
'        return l_result;',
'end;'))
,p_execution_function=>'is_authorized'
,p_substitute_attributes=>true
,p_reference_id=>12457518297512494.4307
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(786884209949512865.4307)
,p_plugin_id=>wwv_flow_api.id(12521612942512635.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Developer Role'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786884688713512865.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>10
,p_display_value=>'ADMIN: Ability to manage flow developer privileges'
,p_return_value=>'ADMIN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786885196596512865.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>20
,p_display_value=>'EDIT: Ability change all attributes of specified flow(s)'
,p_return_value=>'EDIT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786885697196512866.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>30
,p_display_value=>'HELP: Ability edit help page for a given company'
,p_return_value=>'HELP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786886117257512866.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>40
,p_display_value=>'BROWSE: Access to Oracle data dictionary browser'
,p_return_value=>'BROWSE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786886644701512867.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>50
,p_display_value=>'CREATE: Ability to create new flows'
,p_return_value=>'CREATE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786887107848512867.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>60
,p_display_value=>'MONITOR: Ability to monitor flow activity'
,p_return_value=>'MONITOR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786887665109512867.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>70
,p_display_value=>'DB_MONITOR: Ability to monitor Oracle database attributes'
,p_return_value=>'DB_MONITOR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786888174226512867.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>80
,p_display_value=>'SQL: Ability to issues SQL statements'
,p_return_value=>'SQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786888638439512867.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>90
,p_display_value=>'USER_MANAGER: Manage user accounts for cookie based authentication'
,p_return_value=>'USER_MANAGER'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786889193469512869.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>100
,p_display_value=>'DATA_LOADER: Data Workshop'
,p_return_value=>'DATA_LOADER'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786889603854512869.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>110
,p_display_value=>'RESTFUL: Ability to enable RESTful Services'
,p_return_value=>'RESTFUL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786890183499512869.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(786884209949512865.4307)
,p_display_sequence=>120
,p_display_value=>'PKG_APPS: Ability to install packaged applications'
,p_return_value=>'PKG_APPS'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_apex
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(113746414043665431.4307)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_display_name=>'Apex 認證'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_apex'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113737019268347425.4307
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_cloud_idm
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356673526869447685.4307)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'
,p_display_name=>'INTERNAL Oracle Cloud Identity Management'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'),'')
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_cloud'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_cloud'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_cloud'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_cloud'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_cloud'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113749806821809026.4307
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_db
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356676122950447689.4307)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.DB'
,p_display_name=>'INTERNAL 資料庫帳戶'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.DB'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_db'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113749511183746276.4307
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_header
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356696623544447717.4307)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'
,p_display_name=>'INTERNAL HTTP 標頭變數'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE:JQM_TABLET'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'),'')
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_header'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_header'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_header'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_header'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_header'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>708795120396802284.4307
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356696828873447717.4307)
,p_plugin_id=>wwv_flow_api.id(356696623544447717.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'HTTP Header Variable Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'OAM_REMOTE_USER'
,p_display_length=>30
,p_max_length=>255
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Specifies the name of the HTTP header variable which contains the username.',
'The default OAM_REMOTE_USER is used by Oracle Access Manager and has to be changed',
'if another authentication provider is used.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356697211514447717.4307)
,p_plugin_id=>wwv_flow_api.id(356696623544447717.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Action if Username is Empty'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'BUILTIN_URL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Specifies the action which should be performed if the username stored in the HTTP header variable is empty. The following options are available:',
'</p>',
'<p>',
'<ul>',
'  <li><strong>Redirect to Built-In URL</strong> to initiate a login by the web server. This Built-In URL has to be setup to be protected by the web server, in order to force a login when called. After login, the web server must store the validated us'
||'ername in the HTTP header variable, so it is available to the authentication scheme. The Built-In URL is',
'<pre>/apex/apex_authentication.callback</pre>',
'The prefix <code>/apex/</code> depends on your server configuration.',
'</li>',
'  <li><strong>Redirect to URL</strong> to initiate a login on an external server which then sets the validated username in the HTTP header variable. The external server should redirect back to the application using the URL generated by the <code>#CAL'
||'LBACK#</code> placeholder to complete authentication in the application.</li>',
'  <li><strong>Display Error</strong> will display the specified error message and no login will be performed in the application.</li>',
'</ul>',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356697625048447717.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356697211514447717.4307)
,p_display_sequence=>10
,p_display_value=>'Redirect to Built-In URL'
,p_return_value=>'BUILTIN_URL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356698106182447717.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356697211514447717.4307)
,p_display_sequence=>20
,p_display_value=>'Redirect to URL'
,p_return_value=>'URL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356698627598447717.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356697211514447717.4307)
,p_display_sequence=>30
,p_display_value=>'Display Error'
,p_return_value=>'ERROR'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356699113011447718.4307)
,p_plugin_id=>wwv_flow_api.id(356696623544447717.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(356697211514447717.4307)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'URL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Specifies the URL of an external login server which sets the validated username in the HTTP header variable. The external server should redirect back to the application using the URL generated by the <code>#CALLBACK#</code> placeholder to complete au'
||'thentication in the application.',
'</p>',
'<p>',
'<h3>Example:</h3>',
'<pre>http://sso.mycompany.com/?success=#CALLBACK#</pre>',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356699514966447718.4307)
,p_plugin_id=>wwv_flow_api.id(356696623544447717.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(356697211514447717.4307)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ERROR'
,p_help_text=>'Specifies the error message to be displayed if the HTTP header variable does not contain a value or the HTTP header variable does not exist.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356699902995447718.4307)
,p_plugin_id=>wwv_flow_api.id(356696623544447717.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Verify Username'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ALWAYS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(356697211514447717.4307)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'BUILTIN_URL,URL'
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Specifies how often the username stored in the HTTP header variable is verified. The following options are available:',
'</p>',
'<p>',
'<ul>',
'  <li><strong>Each Request</strong> will expect that the CGI variable is always set as soon as the login has been performed by the web server. If the username is not identical to the one stored in the current &PRODUCT_NAME. session, the session will '
||'be invalidated and a new login will be initiated. This is the most secure option because it detects logouts or username changes.',
'  </li>',
'  <li><strong>After Login</strong> will only verify and store the username in the &PRODUCT_NAME. session after the web server has performed the login and calls the callback to complete authentication in the application. For callback see "Action if Us'
||'ername is Empty" configuration.',
'  </li>',
'</ul>',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356700320876447718.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356699902995447718.4307)
,p_display_sequence=>10
,p_display_value=>'Each Request'
,p_return_value=>'ALWAYS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356700819744447719.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356699902995447718.4307)
,p_display_sequence=>20
,p_display_value=>'After Login'
,p_return_value=>'CALLBACK'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356701330878447719.4307)
,p_plugin_id=>wwv_flow_api.id(356696623544447717.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Logout URL of SSO Server'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'If the authentication scheme is based on Oracle Access Manager or similar servers,',
'you can use this attribute to specify a URL to log out of the central single sign-on server.',
'<p/>',
'For Oracle Access Manager based SSO, enter for example',
'<pre>',
'/oamsso/logout.html?end_url=%POST_LOGOUT_URL%',
'</pre>',
'The substitution parameter <strong>%POST_LOGOUT_URL%</strong> will be replaced by an encoded URL to the login page of your application.'))
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_ldap
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356765414638447769.4307)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'
,p_display_name=>'INTERNAL LDAP 目錄'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE:JQM_TABLET'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_ldap'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>863910941135523528.4307
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>輸入用於認證登入頁面中之 LDAP 目錄的使用者名稱和密碼. 請注意, 密碼可能區分大小寫.</p>',
''))
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356765732481447771.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Host'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_max_length=>255
,p_is_translatable=>false
,p_help_text=>'The hostname of your LDAP directory server.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356766124243447771.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Port'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>6
,p_max_length=>10
,p_is_translatable=>false
,p_help_text=>'The port number of your LDAP directory host. The default is 389.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356766526635447771.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Use SSL'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NO_SSL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Choose whether to use SSL to bind to the LDAP directory. If SSL with Authentication is chosen, a wallet must be configured for the &PRODUCT_NAME. instance.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356766900119447771.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356766526635447771.4307)
,p_display_sequence=>10
,p_display_value=>'SSL'
,p_return_value=>'SSL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356767428334447772.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356766526635447771.4307)
,p_display_sequence=>20
,p_display_value=>'SSL with Authentication'
,p_return_value=>'SSL_AUTH'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356767916882447772.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356766526635447771.4307)
,p_display_sequence=>30
,p_display_value=>'No SSL'
,p_return_value=>'NO_SSL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356768406566447772.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Distinguished Name (DN) String'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter the pattern used to construct the fully qualified distinguished name (DN) string to DBMS_LDAP.SIMPLE_BIND_S if using exact DN or the search base if using non-exact DN. Use <strong>%LDAP_USER%</strong> as a placeholder for the username.  For exa'
||'mple:',
'<p>',
'<strong>Exact DN</strong>',
'</p>',
'<p>',
'cn=%LDAP_USER%,l=amer,dc=yourdomain,dc=com',
'</p>',
'<p>',
'<strong>Non-Exact DN (Search Base)</strong>',
'</p>',
'<p>',
'dc=yourdomain,dc=com',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356768825861447772.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Use Exact Distinguished Name (DN)'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Choose whether the LDAP Distinguished Name (DN) String is exact or non-exact. If non-exact, LDAP Distinguished Name (DN) is the search base and you must supply a Search Filter.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356769223844447773.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Search Filter'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(356768825861447772.4307)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the search filter when not using an exact distinguished name (DN). Use <strong>%LDAP_USER%</strong> as a place-holder for the username. For example:',
'</p>',
'<p><pre>cn=%LDAP_USER%</pre></p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356769612451447773.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'LDAP Username Edit Function'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'You may provide additional code to be executed to transform the username into a format perfectly suited to the LDAP directory entry or LDAP username.',
'The bind variable :USERNAME contains the name the end user specified.',
'For example, the following code calls a function which replaces all "."''s with "_"''s in the DN string:</p>',
'',
'<p><pre>',
'return apex_custom_auth.ldap_dnprep(p_username => :USERNAME);',
'</pre></p>',
'',
'<p>&PRODUCT_NAME. will escape the returned username based on the authentication attribute <strong>Username Escaping</strong>.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356770002974447773.4307)
,p_plugin_id=>wwv_flow_api.id(356765414638447769.4307)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Username Escaping'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'STD'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Before replacing <strong>%LDAP_USER%</strong> in the LDAP distinguished name and search string,',
'&PRODUCT_NAME. can automatically escape special characters in the username.',
'<p/>',
'The possible rules for escaping are:',
'<ul>',
'<li><strong>Standard</strong>:',
'Escape special characters based on RFC 4514 (for distinguished names) and RFC 4515 (for search strings).',
'Additionally, escape unicode characters.',
'This is the most secure setting, but may cause problems with some LDAP servers.</li>',
'<li><strong>Only special characters</strong>:',
'Escape special characters based on RFC 4514 (for distinguished names) and RFC 4515 (for search strings).',
'Do not escape unicode characters.</li>',
'<li><strong>No escaping</strong>:',
'Do not escape any characters.',
'This setting is potentially insecure,',
'unless a <strong>Username Edit Function</strong> is employed that already',
'escapes the username (for example with apex_escape.ldap_dn or apex_escape.ldap_search_filter).</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356770430789447773.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356770002974447773.4307)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356770908739447773.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356770002974447773.4307)
,p_display_sequence=>20
,p_display_value=>'Only special characters'
,p_return_value=>'ONLY'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356771418301447773.4307)
,p_plugin_attribute_id=>wwv_flow_api.id(356770002974447773.4307)
,p_display_sequence=>30
,p_display_value=>'No Escaping'
,p_return_value=>'NO'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_sso
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356820112047447809.4307)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'
,p_display_name=>'INTERNAL Oracle Application Server Single Sign-On'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'),'')
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_osso'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_osso'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_osso'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_osso'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_osso'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113750429890071859.4307
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(4969527595302343.4307)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'桌面'
,p_display_seq=>10
,p_use_auto_detect=>true
,p_is_default=>true
,p_theme_id=>3
,p_home_url=>'f?p=4300:1:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_global_page_id=>.4307
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
 p_id=>.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'頁碼為零的頁面'
,p_page_mode=>'NORMAL'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(216950505720834051)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388236187524918490.4307)
,p_plug_name=>'APEX 5 - Header'
,p_region_css_classes=>'a-Header apex-sql-workshop'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_07'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388236352716918490.4307)
,p_plug_name=>'APEX 5 - Header Left'
,p_parent_plug_id=>wwv_flow_api.id(388236187524918490.4307)
,p_region_css_classes=>'a-Header-col a-Header-col--left'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1456614651025020.4307)
,p_plug_name=>'Application Tabs'
,p_region_name=>'a_Header_menu'
,p_parent_plug_id=>wwv_flow_api.id(388236352716918490.4307)
,p_region_css_classes=>'a-Header-tabsContainer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(718988657702143721.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(388254947243942451.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388236512184918491.4307)
,p_plug_name=>'APEX 5 - Logo'
,p_parent_plug_id=>wwv_flow_api.id(388236352716918490.4307)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'sys.htp.p(''<a href="f?p=4500:1000:''||:APP_SESSION||''::''||:DEBUG||''::::" class="a-Header-logo" title="''||wwv_flow_lang.system_message(''HOME_NAV'')||''"><span class="a-Header-apexLogo"></span></a>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388236787857918491.4307)
,p_plug_name=>'APEX 5 - Home Link'
,p_parent_plug_id=>wwv_flow_api.id(388236352716918490.4307)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388237172510918491.4307)
,p_plug_name=>'APEX 5 - Header Right'
,p_parent_plug_id=>wwv_flow_api.id(388236187524918490.4307)
,p_region_css_classes=>'a-Header-col a-Header-col--right'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388237328927918491.4307)
,p_plug_name=>'APEX 5 - Search'
,p_parent_plug_id=>wwv_flow_api.id(388237172510918491.4307)
,p_region_css_classes=>'a-Header-search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-SearchBox a-SearchBox--noGoButton a-SearchBox--autoExpand a-SearchBox--fill">'');',
'sys.htp.p(''  <div class="a-SearchBox-field">'');',
'sys.htp.p(''    <span class="a-SearchBox-icon"><span class="a-Icon icon-search"></span></span>'');',
'sys.htp.p(''    <label for="P0_SEARCH" class="visuallyhidden">Search</label>'');',
'sys.htp.p(''    <input type="text" class="a-SearchBox-input" id="P0_SEARCH" placeholder="''||wwv_flow_lang.system_message(''WWV_FLOW_QUICK_FLOW.SEARCH'')||''">'');',
'sys.htp.p(''  </div>'');',
'sys.htp.p(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388237583055918491.4307)
,p_plug_name=>'APEX 5 - Account'
,p_parent_plug_id=>wwv_flow_api.id(388237172510918491.4307)
,p_region_css_classes=>'a-Header-account'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_4000_ui.account_mega_menu (',
'    p_username          => :APP_USER,',
'    p_workspace_id      => :WORKSPACE_ID,',
'    p_session           => :APP_SESSION,',
'    p_logout_url        => :LOGOUT_URL',
');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388296571194069434.4307)
,p_plug_name=>'APEX 5 - Header Navigation Links'
,p_parent_plug_id=>wwv_flow_api.id(388237172510918491.4307)
,p_region_css_classes=>'a-Header-navLinks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388344712770271079.4307)
,p_plug_name=>'APEX 5 - Administration Menu'
,p_region_name=>'adminMenu'
,p_parent_plug_id=>wwv_flow_api.id(388296571194069434.4307)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(697382068928001818.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(388255255364942452.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486771776816301727.4307)
,p_plug_name=>'APEX 5 - Help'
,p_region_name=>'helpMenu'
,p_parent_plug_id=>wwv_flow_api.id(388296571194069434.4307)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(697413399059052182.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(388255255364942452.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388236965230918491.4307)
,p_plug_name=>'APEX 5 - Control Bar'
,p_region_css_classes=>'a-ControlBar apex-sql-workshop'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_07'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388237715059918492.4307)
,p_plug_name=>'APEX 5 - Control Bar Left'
,p_parent_plug_id=>wwv_flow_api.id(388236965230918491.4307)
,p_region_css_classes=>'a-ControlBar-col a-ControlBar-col--noPadding'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388323355246153942.4307)
,p_plug_name=>'APEX 5 - Breadcrumb'
,p_parent_plug_id=>wwv_flow_api.id(388237715059918492.4307)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(6678815232629976.4307)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(388324150680174551.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388237918952918492.4307)
,p_plug_name=>'APEX 5 - Control Bar Right'
,p_parent_plug_id=>wwv_flow_api.id(388236965230918491.4307)
,p_region_css_classes=>'a-ControlBar-col'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388251521427936641.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(384688985396932804.4307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(388296571194069434.4307)
,p_button_name=>'ADMINISTRATION'
,p_button_static_id=>'header-adminMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298521291079233.4307)
,p_button_image_alt=>'管理'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-gears-alt'
,p_button_cattributes=>'data-menu="adminMenu_menu"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(384689065888932805.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(388296571194069434.4307)
,p_button_name=>'FEEDBACK'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'回應'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=4750:11001:&SESSION.::&DEBUG.:RP,11001:P11001_APPLICATION_ID,P11001_PAGE_ID:&APP_ID.,&APP_PAGE_ID.:'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-comments'
,p_grid_new_grid=>false
,p_required_patch=>wwv_flow_api.id(693448447977546491.4307)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(384689133506932806.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(388296571194069434.4307)
,p_button_name=>'HELP'
,p_button_static_id=>'header-helpMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298521291079233.4307)
,p_button_image_alt=>'說明'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-help'
,p_button_cattributes=>'data-menu="helpMenu_menu"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(388350254436282356.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(388236787857918491.4307)
,p_button_name=>'HOME'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'首頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=4500:1000:&SESSION.::&DEBUG.::::'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-home'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入/取消載入資料'
,p_page_mode=>'NORMAL'
,p_step_title=>'載入/取消載入資料'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(216950505720834051)
,p_step_template=>wwv_flow_api.id(716607252394788370.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEUTL/sql_utl_exprt_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2209528931524495.4307)
,p_plug_name=>'儲存區域'
,p_icon_css_classes=>'icon-util-export-repository'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--paddedBody:h240'
,p_component_template_options=>'a-LinksList--nowrap'
,p_plug_template=>wwv_flow_api.id(716662948592817174.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(2202106852499122.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--bottomBorder'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170288209634031042.4307)
,p_plug_name=>'載入資料'
,p_icon_css_classes=>'icon-util-data-load'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--paddedBody:h240'
,p_component_template_options=>'a-LinksList--nowrap'
,p_plug_template=>wwv_flow_api.id(716662948592817174.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(74707671328250039.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--rightBorder apex-col--bottomBorder'
,p_plug_comment=>'Load data from your computer from various file formats into your online database.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170288516691042569.4307)
,p_plug_name=>'取消載入資料'
,p_icon_css_classes=>'icon-util-data-unload'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--paddedBody:h240'
,p_component_template_options=>'a-LinksList--nowrap'
,p_plug_template=>wwv_flow_api.id(716662948592817174.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(75585889878824332.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716623225818805411.4307)
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--rightBorder apex-col--bottomBorder'
,p_plug_comment=>'Extract data from database schemas online to files on your computer.'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(171170229200569353.4307)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(945660876947384278.4307)
,p_name=>'RENDERING: Page - Dialog Closed'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(170288209634031042.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(945661141312384282.4307)
,p_event_id=>wwv_flow_api.id(945660876947384278.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var lSuccessMsg = this.data.APEX_SUCCESS_MESSAGE,',
'    lVal = this.data[ ''REQUEST'' ]; ',
'',
'if ( lVal === "LOAD_SPREADSHEET") {',
'    lUrl = ''f?p=&APP_ID.:11:&SESSION.'';',
'} else if ( lVal === "LOAD_XML") {',
'    lUrl = ''f?p=&APP_ID.:1:&SESSION.'';',
'} else {',
'    lUrl = ''f?p=&APP_ID.:8:&SESSION.'';',
'}',
'',
'if ( lSuccessMsg ) {',
'   lUrl += ''&success_msg='' + lSuccessMsg;',
'}',
'setTimeout(function() {',
'    apex.navigation.redirect(lUrl);',
'}, 0);'))
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'試算表載入詳細資訊'
,p_page_mode=>'NORMAL'
,p_step_title=>'試算表載入詳細資訊'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_step_template=>wwv_flow_api.id(716607252394788370.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEUTL/sql_utl_exprt_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236908207860041215.4307)
,p_plug_name=>'載入試算表'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(104263607591363808.4307)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>此頁面顯示有關試算表匯入的資訊. 如果進行匯入時有任何資料列失敗, 此頁面會顯示錯誤訊息.</p>'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_plug_query_no_data_found=>'找不到失敗的資料列.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(236908624285041216.4307)
,p_name=>'失敗的資料列'
,p_template=>wwv_flow_api.id(716648790045817165.4307)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:is-expanded'
,p_component_template_options=>'#DEFAULT#:a-Report--stretch'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<span class="htmldbError">'' || wwv_flow_escape.html(errm) || ''</span>'' Error,',
'          data Data',
'   from wwv_flow_data_load_bad_log',
'  where load_id = :P2_LOAD_ID'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(716692596502820893.4307)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_no_data_found=>'找不到失敗的資料列.'
,p_query_num_rows_type=>'ROW_RANGES'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image=>'blue_arrow_down.gif'
,p_query_desc_image=>'blue_arrow_up.gif'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236909010953041218.4307)
,p_query_column_id=>1
,p_column_alias=>'ERROR'
,p_column_display_sequence=>1
,p_column_heading=>'錯誤'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236909111520041218.4307)
,p_query_column_id=>2
,p_column_alias=>'DATA'
,p_column_display_sequence=>2
,p_column_heading=>'資料'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236909231803041218.4307)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(236910023245041222.4307)
,p_name=>'匯入詳細資訊'
,p_template=>wwv_flow_api.id(388246039131933975.4307)
,p_display_sequence=>25
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>'Select CREATED_ON Load_Date, CREATED_BY Loaded_By, DATA_SCHEMA Schema2, DATA_TABLE Table2, SUCCESS_ROWS Rows_Loaded, FAILED_ROWS Rows_Failed from wwv_flow_data_load_unload where id=:P2_LOAD_ID'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>2
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'找不到資料.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'blue_arrow_down.gif'
,p_query_desc_image=>'blue_arrow_up.gif'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236910621733041225.4307)
,p_query_column_id=>1
,p_column_alias=>'LOAD_DATE'
,p_column_display_sequence=>1
,p_column_heading=>'匯入日期'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236910704793041225.4307)
,p_query_column_id=>2
,p_column_alias=>'LOADED_BY'
,p_column_display_sequence=>2
,p_column_heading=>'匯入者'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236910825625041225.4307)
,p_query_column_id=>3
,p_column_alias=>'SCHEMA2'
,p_column_display_sequence=>3
,p_column_heading=>'綱要'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236910911224041225.4307)
,p_query_column_id=>4
,p_column_alias=>'TABLE2'
,p_column_display_sequence=>4
,p_column_heading=>'表格'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236910405016041225.4307)
,p_query_column_id=>5
,p_column_alias=>'ROWS_LOADED'
,p_column_display_sequence=>5
,p_column_heading=>'匯入的資料列'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(236910524132041225.4307)
,p_query_column_id=>6
,p_column_alias=>'ROWS_FAILED'
,p_column_display_sequence=>6
,p_column_heading=>'失敗的資料列'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(236911018188041226.4307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(236909231803041218.4307)
,p_button_name=>'BACK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'返回儲存區域'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(236912309292041255.4307)
,p_branch_action=>'f?p=&FLOW_ID.:11:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(236911408920041236.4307)
,p_name=>'P2_LOAD_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'文字資料載入詳細資訊'
,p_page_mode=>'NORMAL'
,p_step_title=>'文字資料載入詳細資訊'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716607252394788370.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3913203962745120.4307)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(55112340569377996.4307)
,p_name=>'失敗的資料列'
,p_template=>wwv_flow_api.id(716648790045817165.4307)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:is-expanded'
,p_component_template_options=>'#DEFAULT#:a-Report--stretch'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<span class="htmldbError">'' || wwv_flow_escape.html(errm) || ''</span>'' Error,',
'          data Data',
'   from wwv_flow_data_load_bad_log',
'  where load_id = :F4300_P7_LOAD_ID'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(716692596502820893.4307)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_no_data_found=>'找不到失敗的資料列.'
,p_query_num_rows_type=>'ROW_RANGES'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image=>'blue_arrow_down.gif'
,p_query_desc_image=>'blue_arrow_up.gif'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26396310164851868.4307)
,p_query_column_id=>1
,p_column_alias=>'ERROR'
,p_column_display_sequence=>1
,p_column_heading=>'錯誤'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26396413604851868.4307)
,p_query_column_id=>2
,p_column_alias=>'DATA'
,p_column_display_sequence=>2
,p_column_heading=>'資料'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(234740508574260035.4307)
,p_name=>'匯入詳細資訊'
,p_template=>wwv_flow_api.id(388246039131933975.4307)
,p_display_sequence=>25
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>'Select CREATED_ON Load_Date, CREATED_BY Loaded_By, DATA_SCHEMA Schema2, DATA_TABLE Table2, SUCCESS_ROWS Rows_Loaded, FAILED_ROWS Rows_Failed from wwv_flow_data_load_unload where id=:F4300_P7_LOAD_ID'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>'<p>此頁面顯示有關文字資料檔案匯入的資訊. 如果進行匯入時有任何資料列失敗, 此頁面會顯示錯誤訊息.</p>'
,p_fixed_header=>'NONE'
,p_query_row_template=>2
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'找不到資料.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image=>'blue_arrow_down.gif'
,p_query_desc_image=>'blue_arrow_up.gif'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234741120589260051.4307)
,p_query_column_id=>1
,p_column_alias=>'LOAD_DATE'
,p_column_display_sequence=>1
,p_column_heading=>'匯入日期'
,p_column_format=>'&DATE_TIME_FORMAT.'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234741209381260051.4307)
,p_query_column_id=>2
,p_column_alias=>'LOADED_BY'
,p_column_display_sequence=>2
,p_column_heading=>'匯入者'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234741308348260051.4307)
,p_query_column_id=>3
,p_column_alias=>'SCHEMA2'
,p_column_display_sequence=>3
,p_column_heading=>'綱要'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234741425535260051.4307)
,p_query_column_id=>4
,p_column_alias=>'TABLE2'
,p_column_display_sequence=>4
,p_column_heading=>'表格'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234741507868260052.4307)
,p_query_column_id=>5
,p_column_alias=>'ROWS_LOADED'
,p_column_display_sequence=>5
,p_column_heading=>'匯入的資料列'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234741628809260052.4307)
,p_query_column_id=>6
,p_column_alias=>'ROWS_FAILED'
,p_column_display_sequence=>6
,p_column_heading=>'失敗的資料列'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192104604688817535.4307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3913203962745120.4307)
,p_button_name=>'BACK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'返回儲存區域'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(234998201152447134.4307)
,p_branch_action=>'f?p=&FLOW_ID.:8:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27172013799279694.4307)
,p_name=>'F4300_P7_LOAD_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(234980910062392922.4307)
,p_name=>'P7_PREV_PAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3913203962745120.4307)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'文字資料載入儲存區域'
,p_page_mode=>'NORMAL'
,p_step_title=>'文字資料載入儲存區域'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716607780903788372.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEUTL/sql_utl_imprt_rep.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3921012881766600.4307)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noBorder'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220725321769721592.4307)
,p_plug_name=>'儲存區域'
,p_region_template_options=>'#DEFAULT#:a-Region--slimPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388246039131933975.4307)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>此頁面顯示載入之「文字」資料的狀態.</p> ',
'<p>若要存取載入的檔案, 請選取檔案名稱.</p> ',
'<p>若要移除狀態項目, 請選取項目, 然後按一下<b>刪除勾選的項目</b>.</p>'))
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(220741417024852608.4307)
,p_plug_name=>'工作'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388246039131933975.4307)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3648913903408259.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(234960616202337996.4307)
,p_name=>'儲存區域'
,p_template=>wwv_flow_api.id(388251521427936641.4307)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-Report--stretch'
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    q      varchar2(4000);',
'begin',
'  q := ''select '';',
'  q:= q || ''''''<label for="f01_''''||rownum||''''" title="Select File"><input type="checkbox" id="f01_''''||rownum||''''" name="f01" value="''''||f.id||''''" /></label>'''' cb,'';',
'  q:= q || '' ''''f?p=4300:7:''||:flow_session||''::::F4300_P7_LOAD_ID:'''' || dat.id details_link, '';',
'  q:= q || '' NULL "Details",'';',
'  q:= q || '' sys.htf.anchor (''''wwv_flow_file_mgr.get_file?p_id='''' || to_char(f.id), f.filename) "File", '';',
'  q:= q || '' dat.created_by "Created By", '';',
'  q:= q || '' dat.created_on  "Created on", '';',
'  q:= q || '' decode(data_type,''''ASCII IMPORT'''',wwv_flow_lang.system_message(''''F4300_TEXT_IMPORT'''')) "Type", '';',
'  q:= q || ''data_Schema "Schema", '';',
'  q:= q || ''data_table "Table", '';',
'  q:= q || '' nvl(sys.dbms_lob.getlength (f.blob_content),0) "Bytes",'';',
'  q:= q || '' success_rows "Succeeded",'';  ',
'  q:= q || '' decode(failed_rows,0,''''0'''',sys.htf.anchor(''''f?p=4300:7:''||:flow_session||''::::F4300_P7_LOAD_ID:'''' || dat.id,'';',
'  q:= q || '' failed_rows))     "Failed", '';',
'  q:= q || '' f.created_on + x.delete_after_days to_be_deleted '';',
'  q:= q || '' from wwv_flow_file_objects$ f, wwv_flow_data_load_unload dat, (select wwv_flow_platform.get_preference(''''DELETE_UPLOADED_FILES_AFTER_DAYS'''') delete_after_days from dual) x '';',
'  q:= q || '' where f.id=dat.data_id'' ;',
'  q:= q || '' and dat.security_group_id =:FLOW_SECURITY_GROUP_ID '';',
'',
'  if (:F4300_P8_RESTRICT_BY = ''MY'' or :F4300_P8_RESTRICT_BY is NULL)  then',
'      q:= q || '' and dat.created_by = :FLOW_USER '';',
'  end if;  ',
'return q;',
'end;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(716692596502820893.4307)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'找不到檔案'
,p_query_num_rows_type=>'ROW_RANGES'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961216430338008.4307)
,p_query_column_id=>1
,p_column_alias=>'CB'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(937850430942294704.4307)
,p_query_column_id=>2
,p_column_alias=>'DETAILS_LINK'
,p_column_display_sequence=>13
,p_column_heading=>'Details Link'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961308847338008.4307)
,p_query_column_id=>3
,p_column_alias=>'Details'
,p_column_display_sequence=>2
,p_column_heading=>'詳細資訊'
,p_column_link=>'#DETAILS_LINK#'
,p_column_linktext=>'<span class="a-Icon icon-page"></span>'
,p_column_link_attr=>'class="a-Button"'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961403149338008.4307)
,p_query_column_id=>4
,p_column_alias=>'File'
,p_column_display_sequence=>3
,p_column_heading=>'檔案'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961531529338008.4307)
,p_query_column_id=>5
,p_column_alias=>'Created By'
,p_column_display_sequence=>4
,p_column_heading=>'匯入者'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961610894338008.4307)
,p_query_column_id=>6
,p_column_alias=>'Created on'
,p_column_display_sequence=>5
,p_column_heading=>'匯入日期'
,p_column_format=>'SINCE'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961731890338010.4307)
,p_query_column_id=>7
,p_column_alias=>'Type'
,p_column_display_sequence=>6
,p_column_heading=>'類型'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961804936338010.4307)
,p_query_column_id=>8
,p_column_alias=>'Schema'
,p_column_display_sequence=>7
,p_column_heading=>'綱要'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234961924524338011.4307)
,p_query_column_id=>9
,p_column_alias=>'Table'
,p_column_display_sequence=>8
,p_column_heading=>'表格'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234962026814338011.4307)
,p_query_column_id=>10
,p_column_alias=>'Bytes'
,p_column_display_sequence=>9
,p_column_heading=>'位元組'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234962102068338011.4307)
,p_query_column_id=>11
,p_column_alias=>'Succeeded'
,p_column_display_sequence=>10
,p_column_heading=>'成功'
,p_column_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234962213306338011.4307)
,p_query_column_id=>12
,p_column_alias=>'Failed'
,p_column_display_sequence=>11
,p_column_heading=>'失敗'
,p_column_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(174139107561146972.4307)
,p_query_column_id=>13
,p_column_alias=>'TO_BE_DELETED'
,p_column_display_sequence=>12
,p_column_heading=>'即將刪除'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(51804488943808398.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3921012881766600.4307)
,p_button_name=>'F4300_P8_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--small'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'設定'
,p_button_position=>'BODY'
,p_request_source=>'GO'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(130487609243007078.4307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3921012881766600.4307)
,p_button_name=>'Delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'刪除勾選的項目'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from wwv_flow_file_objects$ f, wwv_flow_data_load_unload dat',
'where f.id=dat.data_id',
'and dat.security_group_id =:FLOW_SECURITY_GROUP_ID'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(130488219172007162.4307)
,p_branch_action=>'8'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51821394189864043.4307)
,p_name=>'F4300_P8_RESTRICT_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3921012881766600.4307)
,p_prompt=>'顯示'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'RESTRICT.LOAD.FILES'
,p_lov=>'.'||wwv_flow_api.id(87918702852509211)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_help_text=>'指定顯示您的檔案或所有檔案'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(165133620695131261.4307)
,p_validation_name=>'SelectAtLeastOne'
,p_validation_sequence=>10
,p_validation=>'wwv_flow.g_f01.count > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'至少必須選取一個要刪除的檔案.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(130487609243007078.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(51823819555198806.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'rest pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_when=>'GO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(130807727310131197.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete file'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for i in 1..wwv_flow.g_f01.count loop',
'    delete from wwv_flow_file_objects$',
'     where id = wwv_flow.g_f01(i)',
'     and security_group_id = :flow_security_group_id;',
'',
'    delete from wwv_flow_data_load_unload',
'    where data_id = wwv_flow.g_f01(i)',
'    and security_group_id = :flow_security_group_id;',
'end loop;'))
,p_process_error_message=>'刪除檔案時發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(130487609243007078.4307)
,p_process_when=>'wwv_flow.g_f01.count > 0'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'已刪除檔案.'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'試算表儲存區域'
,p_page_mode=>'NORMAL'
,p_step_title=>'試算表儲存區域'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_step_template=>wwv_flow_api.id(716607780903788372.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEUTL/sql_utl_exprt_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3655019491438205.4307)
,p_plug_name=>'工作'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388246039131933975.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3648913903408259.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(3482816826549973.4307)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3925626518780012.4307)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114705422835023938.4307)
,p_plug_name=>'試算表儲存區域'
,p_region_template_options=>'#DEFAULT#:a-Region--slimPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388246039131933975.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>此頁面顯示匯入之試算表資料的狀態.</p> ',
'<p>若要移除狀態項目, 請選取它然後按一下<b>刪除勾選的項目</b>.</p>'))
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(234717428566209000.4307)
,p_name=>'載入項目'
,p_template=>wwv_flow_api.id(388251521427936641.4307)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    q           varchar2(4000);    ',
'begin    ',
'  q:= q || ''select '';',
'  q:= q || ''''''<label for="f01_''''||rownum||''''" class="hideMe508">Select Import</label><input id="f01_''''||rownum||''''" type="checkbox" name="f01" value="''''||dat.id||''''">'''' cb,'';',
'  q:= q || '' ''''f?p=4300:2:''||:flow_session||''::::P2_LOAD_ID:'''' || dat.id details_link, '';',
'  q:= q || '' null "Details",'';',
'  q:= q || '' dat.created_by "Created By", '';',
'  q:= q || '' dat.created_on  "Created on", '';',
'  q:= q || '' decode (data_type, ''''EXCEL IMPORT'''', wwv_flow_lang.system_message(''''F4300.SPREADSHEET_IMPORT'''')) "Type", '';',
'  q:= q || ''data_Schema "Schema", '';',
'',
'',
'  q:= q || ''data_table "TABLE", '';  ',
'  q:= q || '' success_rows "Succeeded",'';',
'  q:= q || '' decode(failed_rows,0,''''0'''',sys.htf.anchor(''''f?p=4300:2:''||:flow_session||''::::P2_LOAD_ID:'''' || dat.id,'';',
'  q:= q || '' failed_rows))     "Failed", '';',
'  q:= q || '' o.object_id object_id, o.owner object_owner '';',
'  q:= q || '' from wwv_flow_data_load_unload dat, sys.dba_objects o '';  ',
'  q:= q || '' where o.owner = dat.data_schema '';',
'  q:= q || '' and o.object_name = dat.data_table '';',
'  q:= q || '' and o.object_type = ''''TABLE'''' '';',
'  q:= q || '' and dat.security_group_id =:FLOW_SECURITY_GROUP_ID '';',
'  q:= q || '' and data_type = ''''EXCEL IMPORT'''''';',
'',
'  if (:F4300_P11_RESTRICT_BY = ''MY'' or :F4300_P11_RESTRICT_BY is NULL)  then',
'      q:= q || '' and dat.created_by = :FLOW_USER '';',
'  end if;  ',
'return q;',
'end;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(716692596502820893.4307)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'找不到任何「試算表匯入」項目.'
,p_query_num_rows_type=>'ROW_RANGES'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718032272209012.4307)
,p_query_column_id=>1
,p_column_alias=>'CB'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(937952072556533758.4307)
,p_query_column_id=>2
,p_column_alias=>'DETAILS_LINK'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718112718209012.4307)
,p_query_column_id=>3
,p_column_alias=>'Details'
,p_column_display_sequence=>2
,p_column_heading=>'詳細資訊'
,p_column_link=>'#DETAILS_LINK#'
,p_column_linktext=>'<span class="a-Icon icon-page"></span>'
,p_column_link_attr=>'class="a-Button"'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718206872209012.4307)
,p_query_column_id=>4
,p_column_alias=>'Created By'
,p_column_display_sequence=>3
,p_column_heading=>'匯入者'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718310926209013.4307)
,p_query_column_id=>5
,p_column_alias=>'Created on'
,p_column_display_sequence=>4
,p_column_heading=>'匯入日期'
,p_column_format=>'SINCE'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718429023209013.4307)
,p_query_column_id=>6
,p_column_alias=>'Type'
,p_column_display_sequence=>5
,p_column_heading=>'類型'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718526244209013.4307)
,p_query_column_id=>7
,p_column_alias=>'Schema'
,p_column_display_sequence=>6
,p_column_heading=>'綱要'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718631100209013.4307)
,p_query_column_id=>8
,p_column_alias=>'TABLE'
,p_column_display_sequence=>7
,p_column_heading=>'表格'
,p_column_link=>'f?p=4500:1001:&SESSION.:FOCUS:::OB_OBJECT_ID,OB_CURRENT_TYPE,OB_SCHEMA:#OBJECT_ID#,TABLE,#OBJECT_OWNER#'
,p_column_linktext=>'#TABLE#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718712148209013.4307)
,p_query_column_id=>9
,p_column_alias=>'Succeeded'
,p_column_display_sequence=>8
,p_column_heading=>'成功'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(234718804458209013.4307)
,p_query_column_id=>10
,p_column_alias=>'Failed'
,p_column_display_sequence=>9
,p_column_heading=>'失敗'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(268495509916252852.4307)
,p_query_column_id=>11
,p_column_alias=>'OBJECT_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Object'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(268502322084284781.4307)
,p_query_column_id=>12
,p_column_alias=>'OBJECT_OWNER'
,p_column_display_sequence=>11
,p_column_heading=>'Object Owner'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(114704228365023929.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3925626518780012.4307)
,p_button_name=>'F4300_P11_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'設定'
,p_button_position=>'BODY'
,p_request_source=>'GO'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192155317097767347.4307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3925626518780012.4307)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'刪除勾選的項目'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from wwv_flow_data_load_unload dat, sys.dba_objects o ',
'where o.owner = dat.data_schema',
'and o.object_name = dat.data_table',
'and o.object_type = ''TABLE''',
'and dat.security_group_id =:FLOW_SECURITY_GROUP_ID',
'and data_type = ''EXCEL IMPORT'''))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(114703320184023921.4307)
,p_branch_action=>'11'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(114704528502023930.4307)
,p_name=>'F4300_P11_RESTRICT_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3925626518780012.4307)
,p_prompt=>'顯示'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'RESTRICT.LOAD.FILES'
,p_lov=>'.'||wwv_flow_api.id(87918702852509211)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'指定顯示您的「試算表」匯入或所有「試算表」匯入項目.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(165128603595116797.4307)
,p_validation_name=>'SelectAtLeastOne'
,p_validation_sequence=>10
,p_validation=>'wwv_flow.g_f01.count > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'至少必須選取一個要刪除的檔案.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(192155317097767347.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192159607728774014.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete load_unload detail'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'forall i in 1..wwv_flow.g_f01.count',
'    delete from wwv_flow_data_load_unload',
'     where id = wwv_flow.g_f01(i)',
'     and security_group_id = :flow_security_group_id;',
'commit;'))
,p_process_error_message=>'進行刪除時發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(192155317097767347.4307)
,p_process_success_message=>'已刪除試算表資料載入詳細資訊.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(114704811615023932.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'rest pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_when=>'GO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入 XML 資料'
,p_page_mode=>'MODAL'
,p_step_title=>'載入 XML 資料'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731303316584395)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(184012414812654843.4307)
,p_plug_name=>'載入 XML 資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(208585513765537107.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>選取資料庫綱要和您要將資料載入其中之表格的名稱, 然後找出要上傳的 XML 文件.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(341792317669297384.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937839991596088902.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(341792317669297384.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184013029848654860.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(341792317669297384.4307)
,p_button_name=>'LOAD_XML'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'載入資料'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(184013614902654876.4307)
,p_name=>'F4300_P14_TARGET_SCHEMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(184012414812654843.4307)
,p_prompt=>'綱要'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LIST_SCHEMA_OWNERS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c.schema) d, c.schema v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取綱要 - '
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'選取擁有要將資料載入其中之表格的資料庫綱要.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(238567106303255599.4307)
,p_name=>'F4300_P16_TARGET_TABLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(184012414812654843.4307)
,p_prompt=>'表格'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P16_TABLES'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select table_name a, table_name b',
'from sys.dba_tables',
'where owner=:F4300_P14_TARGET_SCHEMA',
'and table_name not like ''BIN$%''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取表格 -'
,p_lov_cascade_parent_items=>'F4300_P14_TARGET_SCHEMA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'選取您要將資料載入其中的資料庫表格. 依照預設, 所有表格名稱都會轉換成大寫. 選取<span class="fielddatabold">維持原來大小寫樣式</span>來覆寫此預設行為.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(239230403195330418.4307)
,p_name=>'F4300_P17_FILE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(184012414812654843.4307)
,p_prompt=>'檔案'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_display_when_type=>'FLOW_ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'N'
,p_help_text=>'按一下<span class="fielddatabold">瀏覽</span>來尋找要上傳的 XML 檔案.'
,p_attribute_01=>'WWV_FLOW_FILES'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(184014831290654966.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'14'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(238757828944271610.4307)
,p_validation_name=>'Schema Must Be Selected'
,p_validation_sequence=>20
,p_validation=>'F4300_P14_TARGET_SCHEMA'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須選取 #LABEL#.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P14_TARGET_SCHEMA'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(184013029848654860.4307)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(184013614902654876.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(238842116261277415.4307)
,p_validation_name=>'Table Must Be Selected'
,p_validation_sequence=>30
,p_validation=>'F4300_P16_TARGET_TABLE'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須選取 #LABEL#.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P16_TARGET_TABLE'
,p_validation_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_when_button_pressed=>wwv_flow_api.id(184013029848654860.4307)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(238567106303255599.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(239260717048334408.4307)
,p_validation_name=>'file required'
,p_validation_sequence=>40
,p_validation=>'F4300_P17_FILE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定檔案.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P17_FILE'
,p_validation_condition_type=>'ITEM_IS_NULL'
,p_when_button_pressed=>wwv_flow_api.id(184013029848654860.4307)
,p_associated_item=>wwv_flow_api.id(239230403195330418.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(239275721203335597.4307)
,p_validation_name=>'file not 0 byte'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (select id                     ',
'           from wwv_flow_file_objects$',
'           where name = :F4300_P17_FILE',
'           and doc_size = 0)',
'loop',
'  delete from wwv_flow_file_objects$',
'  where id = c1.id',
'  and security_group_id = :flow_security_group_id;',
'',
'  :F4300_P17_FILE := null;',
'',
'  return false;',
'end loop;',
'',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'檔案沒有任何內容.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P17_FILE'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(184013029848654860.4307)
,p_associated_item=>wwv_flow_api.id(239230403195330418.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937840169136091731.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937839991596088902.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937840425239091732.4307)
,p_event_id=>wwv_flow_api.id(937840169136091731.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(238937010159285027.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P14_TARGET_SCHEMA);'
,p_process_error_message=>'無效的綱要'
,p_process_when_button_id=>wwv_flow_api.id(184013029848654860.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(239245612546333116.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'10.1 or greater:  create_load_xml'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_blob blob;',
'  l_clob clob;',
'  l_sql  varchar2(32767) := null;',
'  n      wwv_flow_global.vc_arr2;',
'  r      wwv_flow_global.vc_arr2;',
'  l_nls_date_format      varchar2(255) := null;',
'  l_nls_timestamp_format varchar2(255) := null;',
'  l_nls_timestamp_tz_format varchar2(255) := null;',
'  c_nls_date_format      varchar2(255) := ''rrrr-MM-dd"T"HH24:mi:ss."000"'';',
'  c_nls_timestamp_format varchar2(255) := ''rrrr-MM-dd"T"HH24:mi:ss.FF3'';',
'  c_nls_timestamp_tz_format varchar2(255) := ''rrrr-MM-dd"T"HH24:mi:ss.FF3 TZR'';',
'begin',
'  --',
'  -- Update the type to XML_DATA_IMPORT',
'  --',
'  update wwv_flow_file_objects$',
'      set file_type = ''XML_DATA_IMPORT''',
'   where name = :F4300_P17_FILE;',
'',
'  for c1 in (select blob_content',
'             from  wwv_flow_file_objects$',
'              where  name = :F4300_P17_FILE) loop',
'    l_blob := c1.blob_content;',
'  end loop;',
'',
'  declare',
'    l_dest_offset  number := 1;',
'    l_src_offset   number := 1;',
'    l_lang_context number := sys.dbms_lob.default_lang_ctx;',
'    l_warning      number;',
'  begin',
'    sys.dbms_lob.createtemporary ( l_clob, FALSE, sys.dbms_lob.SESSION );',
'    sys.dbms_lob.open( l_blob, sys.dbms_lob.lob_readonly );',
'',
'    sys.dbms_lob.convertToCLOB(',
'        dest_lob      => l_clob,',
'        src_blob      => l_blob,',
'        amount        => sys.dbms_lob.lobmaxsize,',
'        dest_offset   => l_dest_offset,',
'        src_offset    => l_src_offset,',
'        blob_csid     => nls_charset_id(''AL32UTF8''),',
'        lang_context  => l_lang_context,',
'        warning       => l_warning );',
'',
'    sys.dbms_lob.close( l_blob );',
'  end;',
'',
'  wwv_flow_utilities.g_xml_clob := l_clob;',
'',
'  l_sql := ''declare '';',
'  l_sql := l_sql||''insCtx sys.dbms_xmlstore.ctxType; '';',
'  l_sql := l_sql||''rows number; '';',
'  l_sql := l_sql||''l_nls_date_format      varchar2(255) := null; '';',
'  l_sql := l_sql||''begin '';',
'  l_sql := l_sql||''insCtx := sys.dbms_xmlstore.newContext(''''''||:F4300_P14_TARGET_SCHEMA;',
'  l_sql := l_sql||''.''||:F4300_P16_TARGET_TABLE||''''''); '';',
'  l_sql := l_sql||''dbms_xmlstore.setRowTag(insCtx,''''ROW''''); '';',
'  l_sql := l_sql||''rows := sys.dbms_xmlstore.insertXML(insCtx,wwv_flow_utilities.g_xml_clob); '';',
'  l_sql := l_sql||''dbms_xmlstore.closeContext(insCtx); '';',
'  l_sql := l_sql||''end;'';',
'',
'  for c1 in (select parameter, value',
'             from nls_session_parameters',
'             where PARAMETER in (''NLS_DATE_FORMAT'',''NLS_TIMESTAMP_FORMAT'',''NLS_TIMESTAMP_TZ_FORMAT'')) loop',
'    if c1.parameter = ''NLS_DATE_FORMAT'' then',
'      l_nls_date_format := c1.value;',
'    elsif c1.parameter = ''NLS_TIMESTAMP_FORMAT'' then',
'      l_nls_timestamp_format := c1.value;',
'    elsif c1.parameter = ''NLS_TIMESTAMP_TZ_FORMAT'' then',
'      l_nls_timestamp_tz_format := c1.value;',
'    end if;',
'  end loop;',
'',
'  sys.dbms_session.set_nls(''NLS_DATE_FORMAT'',''''''''||c_nls_date_format||'''''''');',
'  sys.dbms_session.set_nls(''NLS_TIMESTAMP_FORMAT'',''''''''||c_nls_timestamp_format||'''''''');',
'  sys.dbms_session.set_nls(''NLS_TIMESTAMP_TZ_FORMAT'',''''''''||c_nls_timestamp_tz_format||'''''''');',
'',
'',
'  wwv_flow_f4000_util.run_block',
'          ( p_sql    => l_sql,',
'            p_user   => :F4300_P14_TARGET_SCHEMA);',
'',
'  sys.dbms_session.set_nls(''NLS_DATE_FORMAT'',''''''''||l_nls_date_format||'''''''');',
'  sys.dbms_session.set_nls(''NLS_TIMESTAMP_FORMAT'',''''''''||l_nls_timestamp_format||'''''''');',
'  sys.dbms_session.set_nls(''NLS_TIMESTAMP_TZ_FORMAT'',''''''''||l_nls_timestamp_tz_format||'''''''');',
'',
'end;'))
,p_process_error_message=>'載入 XML 時發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(184013029848654860.4307)
,p_process_success_message=>'XML 已載入.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(698584609866530529.4307)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_attribute_01=>'REQUEST'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'XML 已載入.'
);
end;
/
prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 檔案詳細資訊'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 檔案詳細資訊'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2157120477803132.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'要上傳的檔案內容必須是文字.  若要上傳 .XLS 檔案, 請先將它儲存成 CSV 格式. <p />',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3939910944851245.4307)
,p_plug_name=>'導覽'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3931814922814551.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21283612328451431.4307)
,p_plug_name=>'全球化'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676055535817183.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208596429152553286.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937785833006812802.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208596429152553286.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2158311458803135.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208596429152553286.4307)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2158218927803135.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208596429152553286.4307)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2586909632661028.4307)
,p_branch_action=>'18'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'F4300_P18_REUPLOAD'
,p_branch_condition_text=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2159723337803140.4307)
,p_branch_action=>'19'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(2158311458803135.4307)
,p_branch_sequence=>20
,p_branch_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2159221254803139.4307)
,p_branch_action=>'230'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(2158218927803135.4307)
,p_branch_sequence=>30
,p_branch_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2157814244803134.4307)
,p_name=>'F4300_P13_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2157120477803132.4307)
,p_prompt=>'文字檔'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_display_when=>'F4300_P13_FILE'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'N'
,p_help_text=>'按一下<span class="fielddatabold">瀏覽</span>來尋找要上傳的檔案.'
,p_attribute_01=>'WWV_FLOW_FILES'
,p_item_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243727316068250.4307)
,p_name=>'F4300_P13_IS_COLUMN_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2157120477803132.4307)
,p_item_default=>'Y'
,p_prompt=>'第一個資料列含有資料欄名稱'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ISCOLUMN.NAME.TEXT'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<span class="instructiontext">''||',
'wwv_flow_lang.system_message(''F4300_INSTRUCT_TEXT'')||''</span>'' d, ''Y'' r from dual'))
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料包含第一個資料列的資料欄名稱, 請選取此方塊.</p>',
'',
'',
'',
'<pre>',
'',
'',
'',
'Name     Salary     Commission',
'',
'',
'',
'Clark    1000       10',
'',
'',
'',
'Scott    2000       20',
'',
'',
'',
'</pre>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2329615063755442.4307)
,p_name=>'F4300_P13_SEPARATOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2157120477803132.4307)
,p_item_default=>','
,p_prompt=>'區隔符號: (\t 為 tab)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'指定資料欄區隔符號字元. 請使用 <code>\t</code> 作為 Tab 區隔符號.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2583912702633467.4307)
,p_name=>'F4300_P18_FILE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2157120477803132.4307)
,p_prompt=>'檔案名稱:'
,p_source=>'substr(:F4300_P13_FILE,instr(:F4300_P13_FILE,''/'')+1)'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_display_when=>'F4300_P13_FILE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'要上傳的檔案名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2586326817656557.4307)
,p_name=>'F4300_P18_REUPLOAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2157120477803132.4307)
,p_item_default=>'N'
,p_prompt=>'重新上傳檔案'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES.NO.RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(87930425596657700)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'F4300_P13_FILE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'指定重新上傳檔案'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2764003228797653.4307)
,p_name=>'F4300_P13_ENCLOSED_BY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2157120477803132.4307)
,p_prompt=>'選擇性外加符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="htmldbInfoBodyP">輸入分界字元. 您可以使用此字元來區分資料值的開始和結束界限. 如果您指定分界字元,「資料工作室」會忽略資料值開始和結束界限前面的空格. 您也可以使用此選項來涵括使用指定之分界字元的資料值.</div>',
'<div class="htmldbInfoBodyP">如果第一個資料列包含資料欄名稱, 請選取<span class="fielddatabold">第一個資料列含有資料欄名稱</span>.</div>',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21284319254453394.4307)
,p_name=>'P18_CURRENCY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(21283612328451431.4307)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_return_val varchar2(30) := ''$'';',
'begin',
'    for c1 in (select value',
'                 from nls_session_parameters',
'                where parameter = ''NLS_CURRENCY'') loop',
'        l_return_val := c1.value;',
'        exit;',
'    end loop;',
'    --',
'    return l_return_val;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'貨幣符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料包含國際貨幣符號, 請在此處輸入該符號.</p>',
'<p>例如, 如果您的資料包含 "&euro;1,234.56" 或 "&yen;1,234.56", 請輸入 "&euro;" 或 "&yen;".  否則, 資料將無法正確載入.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21931121693474165.4307)
,p_name=>'P18_GROUP_SEPARATOR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(21283612328451431.4307)
,p_item_default=>'return wwv_flow.get_nls_group_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'群組區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>群組區隔符號是一個區隔整數群組 (例如顯示千分位與百萬分位) 的字元.</p>',
'<p>任何字元皆可當成群組區隔符號. 指定的字元必須是單位元組, 而且群組區隔符號必須與其他十進位字元不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21932028965476228.4307)
,p_name=>'P18_DECIMAL_CHARACTER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(21283612328451431.4307)
,p_item_default=>'return wwv_flow.get_nls_decimal_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'十進位字元'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>十進位字元可區隔整數和數字的小數部分.</p>',
'<p> 任何字元皆可當成十進位字元. 指定的字元必須是單位元組, 而且十進位字元必須與群組區隔符號不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143068503644769301.4307)
,p_name=>'P18_FILE_CHARSET'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2157120477803132.4307)
,p_item_default=>'nvl(lower(trim(sys.owa_util.get_cgi_env(''REQUEST_IANA_CHARSET''))),''utf-8'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'檔案字元集'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'I18N_IANA_CHARSET'
,p_lov=>'.'||wwv_flow_api.id(135399325911344822)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'選擇編碼之文字檔的字元集'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(49531609285689625.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P13_IS_COLUMN_NAME'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'F4300_P13_IS_COLUMN_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2601228838903096.4307)
,p_computation_sequence=>20
,p_computation_item=>'F4300_P18_REUPLOAD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when_type=>'%null%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2959116096955698.4307)
,p_validation_name=>'file name not null'
,p_validation_sequence=>10
,p_validation=>'F4300_P13_FILE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須選取要上傳的檔案.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2158311458803135.4307)
,p_associated_item=>wwv_flow_api.id(2157814244803134.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(165112819562074156.4307)
,p_validation_name=>'SeparatorMand'
,p_validation_sequence=>20
,p_validation=>'F4300_P13_SEPARATOR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定區隔符號.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2158311458803135.4307)
,p_associated_item=>wwv_flow_api.id(2329615063755442.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52214713959981319.4307)
,p_validation_name=>'file not 0 byte'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (select id                     ',
'           from wwv_flow_file_objects$',
'           where name = :F4300_P13_FILE',
'           and doc_size = 0)',
'loop',
'  delete from wwv_flow_file_objects$',
'  where id = c1.id',
'  and security_group_id = :flow_security_group_id;',
'',
'  :F4300_P13_FILE := null;',
'',
'  return false;',
'end loop;',
'',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'檔案沒有任何內容.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2158311458803135.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(245259621035850537.4307)
,p_validation_name=>'not valid file extension'
,p_validation_sequence=>40
,p_validation=>'return wwv_flow_load_data.valid_file_extension (p_filename => :F4300_P13_FILE)'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'檔案包含無效的副檔名. 不支援二進位檔案類型.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2158311458803135.4307)
,p_associated_item=>wwv_flow_api.id(2583912702633467.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937786060661818197.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937785833006812802.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937786365024818199.4307)
,p_event_id=>wwv_flow_api.id(937786060661818197.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2324003064685753.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create table info collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare  ',
'  l_first_row_is_col_name boolean := false;',
'  l_file_id               number := 0;',
'begin',
'  for c1 in (select id             ',
'             from wwv_flow_file_objects$',
'             where name = :F4300_P13_FILE)',
'  loop',
'    l_file_id := c1.id;',
'  end loop;',
'',
'  if l_file_id != 0 then',
'    if :F4300_P13_IS_COLUMN_NAME = ''Y'' then',
'      l_first_row_is_col_name := true;',
'    end if;',
'    wwv_flow_load_data.create_csv_collection (',
'     p_file_id                => l_file_id,',
'     p_separator              => lower(:F4300_P13_SEPARATOR),',
'     p_enclosed_by            => :F4300_P13_ENCLOSED_BY,  ',
'     p_first_row_is_col_name  => l_first_row_is_col_name,',
'     p_currency               => :P18_CURRENCY,',
'     p_numeric_chars          => :P18_DECIMAL_CHARACTER||:P18_GROUP_SEPARATOR,',
'     p_charset                => :P18_FILE_CHARSET',
'     );',
'  end if;',
'end;'))
,p_process_error_message=>'使用載入的資料建立集合時發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(2158311458803135.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23875226415655164.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete file and reupload'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'delete from wwv_flow_file_objects$',
'where name = :F4300_P13_FILE;',
'',
':F4300_P13_FILE := null;'))
,p_process_error_message=>'無法刪除檔案.'
,p_process_when=>'F4300_P18_REUPLOAD'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
);
end;
/
prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 表格特性'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 表格特性'
,p_html_page_onload=>'onload="f_ImportDataTypeOnload()"'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'<!--',
'',
'function f_ImportDataTypeOnload(){',
'var lRow = html_GetElement(''importData'').rows[1];',
'var lSelects = lRow.getElementsByTagName(''SELECT'');',
'var lLength = lSelects.length;',
'for(var i=0;i<lLength;i++){lSelects[i].onchange()}',
'return;',
'}',
'',
'',
'function f_ImportDataType(pThis,pThat){  ',
'var lCheckValues = new Array(''NUMBER'',''CLOB'',''DATE'',''BINARY_FLOAT'',''BINARY_DOUBLE'');',
'  var lTest2 = html_DisableOnValue(pThis,lCheckValues,pThat);',
'  html_GetElement(pThat).disabled = false;',
'  if(lTest2){',
'    html_GetElement(pThat).setAttribute(''onfocus'',''this.blur()'');',
'    }else{',
'    html_GetElement(pThat).setAttribute(''onfocus'','''');',
'  }',
'',
'}',
'//-->',
'</script>'))
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2160319726803142.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#:a-Form--fixedLabels'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2252818489103487.4307)
,p_plug_name=>'設定表格特性'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="overflow: auto; width: 100%; padding: 12px;"'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'wwv_flow_load_data.display_ntable_property(p_collection_name => ''CSV_IMPORT'' );'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3940715792852571.4307)
,p_plug_name=>'導覽'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3931814922814551.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208599127898562379.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221480323469295765.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>您可以在此頁面預覽新表格的外觀. 請輸入表格名稱, 變更資料欄名稱或資料類型, 以及指定要包括的資料欄.</p>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937784823962801386.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208599127898562379.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2161511969803145.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208599127898562379.4307)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2161401612803145.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208599127898562379.4307)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2162930496803151.4307)
,p_branch_action=>'21'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(2161511969803145.4307)
,p_branch_sequence=>20
,p_branch_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2162430587803150.4307)
,p_branch_action=>'18'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(2161401612803145.4307)
,p_branch_sequence=>10
,p_branch_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2161012050803145.4307)
,p_name=>'F4300_P13_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2160319726803142.4307)
,p_prompt=>'綱要'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CREATE_TABLE_SCHEMAS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  q varchar2(32767) := null;',
'begin',
'  q:=q||''select wwv_flow_escape.html(c.schema) d, c.schema v '';',
'  q:=q||''from   wwv_flow_company_schemas c, '';',
'  q:=q||''       wwv_flow_fnd_user u '';',
'  q:=q||''where  c.security_group_id = :flow_security_group_id and '';',
'  q:=q||''       u.security_group_id = :flow_security_group_id and '';',
'  q:=q||''       u.user_name = :flow_user and '';',
'  q:=q||''       (u.ALLOW_ACCESS_TO_SCHEMAS is null or '';',
'  q:=q||''        instr('''':''''||u.ALLOW_ACCESS_TO_SCHEMAS||'''':'''','''':''''||c.schema||'''':'''')>0) '';',
'  if wwv_flow_global.g_xe then',
'    q:=q||''  and exists (select null '';',
'    q:=q||''              from sys.dba_sys_privs '';',
'    q:=q||''              where privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''') '';',
'    q:=q||''              and grantee = c.schema '';',
'    q:=q||''              union all '';',
'    q:=q||''              select null '';',
'    q:=q||''              from sys.dba_sys_privs s, sys.dba_role_privs r '';',
'    q:=q||''              where r.granted_role=s.grantee '';',
'    q:=q||''              and r.grantee = c.schema '';',
'    q:=q||''              and s.privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''')) '';',
'  else',
'    q:=q||''  and exists (select null '';',
'    q:=q||''               from sys.dba_sys_privs '';',
'    q:=q||''               where privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''') '';',
'    q:=q||''                 and grantee = c.schema)     '';',
'  end if;         ',
'  q:=q||''  and exists (select null '';',
'  q:=q||''                from sys.dba_users '';',
'  q:=q||''               where username = c.schema) '';',
'  q:=q||''order by 1 '';',
'  ',
'  return q;',
'end;'))
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_read_only_when=>'wwv_flow_global.g_xe'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_read_only_disp_attr=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'選擇您要建立並且要將資料載入其中的資料庫綱要.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2267110534176923.4307)
,p_name=>'F4300_P13_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2160319726803142.4307)
,p_prompt=>'表格名稱'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>2000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'指定您要建立的表格名稱. 依照預設, 所有表格名稱都會轉換成大寫. 選取<span class="fielddatabold">維持原來大小寫樣式</span>來覆寫此預設行為.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2269730619182732.4307)
,p_name=>'F4300_P19_DUMMY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2160319726803142.4307)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77772602360009347.4307)
,p_name=>'P19_PRESERVE_CASE'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(2160319726803142.4307)
,p_prompt=>'維持原來大小寫樣式'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'PRESERVE.CASE.Y'
,p_lov=>'.'||wwv_flow_api.id(87931511182663028)||'.'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(77778717729023209.4307)
,p_computation_sequence=>5
,p_computation_item=>'F4300_P13_TABLE_NAME'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'upper(replace(wwv_flow_utilities.remove_spaces(:F4300_P13_TABLE_NAME),chr(32),''_''))'
,p_compute_when=>'P19_PRESERVE_CASE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2611527265139214.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P19_DUMMY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_col_name varchar2(4000) := null;',
'begin',
'for i in 1..wwv_flow.g_f06.count loop',
'  if :P19_PRESERVE_CASE is null then',
'    l_col_name := upper(wwv_flow_utilities.remove_spaces(wwv_flow.g_f01(i)));',
'  else',
'    l_col_name := wwv_flow_utilities.remove_spaces(wwv_flow.g_f01(i));',
'  end if;',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 1,',
'     p_attr_value => l_col_name',
'     );',
'',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 2,',
'     p_attr_value => wwv_flow.g_f02(i)',
'     );',
'',
'',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 4,',
'     p_attr_value => wwv_flow.g_f04(i)',
'     );',
'',
'',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 5,',
'     p_attr_value => wwv_flow.g_f05(i)',
'     );',
'     ',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 6,',
'     p_attr_value => wwv_flow.g_f07(i)',
'     );  ',
'end loop;',
'',
'return ''true'';',
'',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2615902509169951.4307)
,p_validation_name=>'column name not null, not > 30'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'  for i in 1..wwv_flow.g_f01.count loop',
'',
'  if wwv_flow.g_f04(i) = ''Y'' ',
'    then',
'    if wwv_flow.g_f01(i) is not null then',
'      if length(wwv_flow.g_f01(i)) > 30 then',
'        return wwv_flow_lang.system_message(''F4300.COL_NAMES_NOT_LONGER_THAN_30'');',
'      end if;',
'    else',
'      return wwv_flow_lang.system_message(''F4300.COL_NAMES_NOT_NULL'');',
'    end if;',
'',
'  end if;',
'',
'  end loop;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'資料欄名稱錯誤.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2617025019176456.4307)
,p_validation_name=>'table name not > 30'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'',
'if length(:F4300_P13_TABLE_NAME) > 30 then',
'',
'  return wwv_flow_lang.system_message(''F4300.TABLE_NAMES_NOT_LONGER_THAN_30'');',
'',
'end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'表格名稱太長.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(2267110534176923.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2617811990182089.4307)
,p_validation_name=>'at least one upload selected'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_no_count number := 0;',
'',
'begin',
'',
'  for i in 1..wwv_flow.g_f04.count loop',
'',
'    if wwv_flow.g_f04(i) = ''N'' then',
'',
'      l_no_count := l_no_count + 1;',
'',
'    end if;',
'',
'  end loop;',
'',
'',
'',
'  if l_no_count = wwv_flow.g_f04.count then',
'',
'    return false;',
'',
'  else',
'',
'    return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'至少必須指定一個要包括在新表格中的資料欄.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2618831730187776.4307)
,p_validation_name=>'cannot have same table name'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'',
'if wwv_flow_load_excel_data.table_exists(',
'',
'  p_schema => :F4300_P13_OWNER,',
'',
'  p_table_name => wwv_flow_utilities.remove_spaces(:F4300_P13_TABLE_NAME)',
'',
'  ) then',
'',
'  return wwv_flow_lang.system_message(''F4300.F4500.TABLE_ALREADY_EXISTS'');',
'',
'end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'現有的物件已經在使用此名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(2267110534176923.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2620211429191428.4307)
,p_validation_name=>'table name not null'
,p_validation_sequence=>50
,p_validation=>'F4300_P13_TABLE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定表格名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(2267110534176923.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2622018486202935.4307)
,p_validation_name=>'column length not zero or null'
,p_validation_sequence=>70
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'',
'  for i in 1..wwv_flow.g_f05.count loop',
'',
'    if wwv_flow.g_f05(i) is not null then',
'',
'      if wwv_flow.g_f05(i) = 0 then',
'',
'        return wwv_flow_lang.system_message(''F4300.COL_LENGTH_NOT_ZERO'');',
'',
'      end if;',
'',
'    else',
'',
'      return wwv_flow_lang.system_message(''F4300.COL_LENGTH_NOT_NULL'');',
'',
'    end if;',
'',
'  end loop;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'「資料欄長度」有錯誤.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(290889128494860177.4307)
,p_validation_name=>'reserved name'
,p_validation_sequence=>80
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_sw_util.is_database_reserved_word(p_word=>:F4300_P13_TABLE_NAME) then',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'指定的表格名稱是一個 Oracle 保留字.  請選擇其他名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(291061510906810726.4307)
,p_validation_name=>'column name reserved word'
,p_validation_sequence=>90
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_message varchar2(32000);',
'begin',
'    for i in 1..wwv_flow.g_f01.count loop',
'        if wwv_flow_sw_util.is_database_reserved_word(p_word=>upper(wwv_flow.g_f01(i))) then',
'            if l_message is not null then',
'                l_message := l_message || '', '';',
'            end if;',
'            l_message := l_message || upper(wwv_flow.g_f01(i));',
'        end if;',
'    end loop;',
'    --',
'    if l_message is not null then',
'        l_message := wwv_flow_lang.system_message(''F4000.COLUMN_NAME_RESERVED_WORD'') || '' ('' || l_message || '')'';',
'    end if;',
'    return l_message;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'指定的資料欄名稱是一個 Oracle 保留字.  請選擇其他名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(25617203076189584.4307)
,p_validation_name=>'F4300_P13_OWNER'
,p_validation_sequence=>100
,p_validation=>'F4300_P13_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定綱要.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2161511969803145.4307)
,p_associated_item=>wwv_flow_api.id(2161012050803145.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937785042471804309.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937784823962801386.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937785344680804311.4307)
,p_event_id=>wwv_flow_api.id(937785042471804309.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432754819513077103.4307)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Schema'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :F4300_P13_OWNER is not null then',
'wwv_flow_sw_api.check_priv(:F4300_P13_OWNER);',
'end if;'))
,p_process_error_message=>'無效的綱要'
);
end;
/
prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 主索引鍵'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 主索引鍵'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2163507507803153.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>您可以使用此頁面來指定表格的主索引鍵.  如果資料集中沒有任何單一資料欄適合作為主索引鍵, 則請指定新資料欄作為主索引鍵. 主索引鍵是用來作為表格中資料列的唯一識別.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3941420987854137.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3931814922814551.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208600405997574943.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937792840943888300.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208600405997574943.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2164724759803154.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208600405997574943.4307)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'載入資料'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2164626737803154.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208600405997574943.4307)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(29899701983651170.4307)
,p_branch_action=>'21'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'P13_PK_TYPE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(52491202943423441.4307)
,p_branch_action=>'f?p=&FLOW_ID.:21:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2165605436803157.4307)
,p_branch_action=>'19'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(2164626737803154.4307)
,p_branch_sequence=>40
,p_branch_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2164212316803154.4307)
,p_name=>'F4300_P21_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_use_cache_before_default=>'NO'
,p_prompt=>'綱要:'
,p_source=>'F4300_P13_OWNER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'擁有要將資料載入其中之表格的綱要.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_item_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2290019463274070.4307)
,p_name=>'F4300_P21_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_use_cache_before_default=>'NO'
,p_prompt=>'表格名稱:'
,p_source=>'F4300_P13_TABLE_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_help_text=>'要將資料載入其中的表格名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29865802488537862.4307)
,p_name=>'P13_PK1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_prompt=>'主索引鍵'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c001)||''(''||c002||'')'' a, c001',
'  from wwv_flow_collections',
' where collection_name = ''CSV_IMPORT'' and c001 is not null',
' order by seq_id',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取主索引鍵 -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_display_when=>'P13_PK1_OPTION'
,p_display_when2=>'EXISTING_KEY'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'指定要作為您表格之主索引鍵的資料欄. 主索引鍵是一個唯一識別某個資料列的資料欄. Oracle 並沒有要求您的表格一定要有主索引鍵, 但是此精靈會要求您指定主索引鍵.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29868930193545840.4307)
,p_name=>'P13_PK1_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_prompt=>'PK 限制條件名稱'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'命名主索引鍵限制條件.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29871919935552356.4307)
,p_name=>'P13_PK_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_item_default=>'NEW_SEQUENCE'
,p_prompt=>'產生主索引鍵:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PK_TYPES'
,p_lov=>'.'||wwv_flow_api.id(29232624018252340)||'.'
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'選擇要如何運算主索引鍵. 或者, 選擇不設定主索引鍵的值.'
,p_attribute_01=>'1'
,p_attribute_02=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29874226299563636.4307)
,p_name=>'P13_EXISTING_SEQUENCE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_prompt=>'順序'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(sequence_name) d, sequence_name v',
' from sys.dba_sequences ',
'where sequence_owner = :F4300_P13_OWNER',
'order by sequence_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取順序 -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_display_when=>'P13_PK_TYPE'
,p_display_when2=>'EXISTING_SEQUENCE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'指定將用來產生主索引鍵值之現有資料庫順序的名稱.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29876013271569281.4307)
,p_name=>'P13_NEW_SEQUENCE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_prompt=>'順序'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_display_when=>'P13_PK_TYPE'
,p_display_when2=>'NEW_SEQUENCE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'指定為了產生此新表格主索引鍵而建立之新資料庫順序的名稱.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52479416748399039.4307)
,p_name=>'P13_PK1_OPTION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_item_default=>'NEW_KEY'
,p_prompt=>'主索引鍵來源:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'USE.EXISTING.COL'
,p_lov=>'.'||wwv_flow_api.id(87933423434676001)||'.'
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'您可以選取現有的資料欄或新增資料欄作為主索引鍵.'
,p_attribute_01=>'1'
,p_attribute_02=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52483906836405605.4307)
,p_name=>'P13_PK1_2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2163507507803153.4307)
,p_item_default=>'ID'
,p_prompt=>'新主索引鍵資料欄'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_display_when=>'P13_PK1_OPTION'
,p_display_when2=>'NEW_KEY'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'輸入新主索引鍵資料欄的名稱.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29883807645586566.4307)
,p_computation_sequence=>10
,p_computation_item=>'P13_PK1_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_sw_util.generate_pk_name (',
'    p_owner => :F4300_P13_OWNER,',
'    p_name  => replace(:F4300_P13_TABLE_NAME,'' '',''_'') )'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(48784624982313991.4307)
,p_computation_sequence=>20
,p_computation_item=>'P13_PK1_2'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_pk    varchar2(40) := null;',
'begin',
'    for c1 in (select c001',
'                 from wwv_flow_collections',
'                where collection_name = ''CSV_IMPORT''',
'                  and upper(c001) = ''ID'') ',
'    loop',
'        for i in 1..10 loop',
'            for c2 in (select c001',
'                         from wwv_flow_collections',
'                        where collection_name = ''CSV_IMPORT''',
'                          and upper(c001) = ''ID''||i) ',
'            loop',
'                l_pk := ''ID'';',
'            end loop;--c2',
'            if l_pk is null then',
'                return ''ID''||i;',
'            else',
'                l_pk := null;',
'            end if;',
'        end loop;--i',
'    end loop;--c1',
'    return ''ID'';',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29887722321600349.4307)
,p_computation_sequence=>30
,p_computation_item=>'P13_PK1'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'   for c1 in (',
'     select c001',
'     from wwv_flow_collections',
'     where collection_name = ''CSV_IMPORT''',
'     and upper(c001) = ''ID''',
'   ) loop',
'     return c1.c001;',
'   end loop;',
'   for c1 in (',
'     select c001',
'     from wwv_flow_collections',
'     where collection_name = ''CSV_IMPORT''',
'     and upper(c001) like ''%ID''',
'   ) loop',
'     return c1.c001;',
'   end loop;',
'end;'))
,p_compute_when=>'P13_PK1'
,p_compute_when_type=>'ITEM_IS_NULL_OR_ZERO'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29885422537590887.4307)
,p_computation_sequence=>40
,p_computation_item=>'P13_NEW_SEQUENCE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_sw_util.generate_seq_name (',
'    p_owner => :F4300_P13_OWNER,',
'    p_name  => replace(:F4300_P13_TABLE_NAME,'' '',''_''))'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29890322799609950.4307)
,p_validation_name=>'ExSEQUENCE not null'
,p_validation_sequence=>10
,p_validation=>'P13_EXISTING_SEQUENCE'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'必須指定順序.'
,p_always_execute=>'N'
,p_validation_condition=>'P13_PK_TYPE'
,p_validation_condition2=>'EXISTING_SEQUENCE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(29874226299563636.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29894220852618813.4307)
,p_validation_name=>'PK_NAME available'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'if not wwv_flow_builder.is_valid_identifier(''"''||:P13_PK1_NAME||''"'') ',
'   then return ',
'        wwv_flow_lang.system_message(''F4300.NOT_VALID_PK_NAME'',:P13_PK1_NAME);',
'end if;',
'    ',
'if not wwv_flow_sw_util.is_available_name(:P13_PK1_NAME, :F4300_P21_OWNER ) ',
'   then return ',
'    wwv_flow_lang.system_message(''F4300.F4500.NAME_ALREADY_USED'',:P13_PK1_NAME);',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'錯誤.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(29868930193545840.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29895317520627355.4307)
,p_validation_name=>'ExistingPK not null'
,p_validation_sequence=>30
,p_validation=>'P13_PK1'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須指定主索引鍵.'
,p_always_execute=>'N'
,p_validation_condition=>'P13_PK1_OPTION'
,p_validation_condition2=>'EXISTING_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(29865802488537862.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52517420651456956.4307)
,p_validation_name=>'NewPK not null'
,p_validation_sequence=>40
,p_validation=>'P13_PK1_2'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定主索引鍵.'
,p_always_execute=>'N'
,p_validation_condition=>'P13_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(52483906836405605.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52521315588464886.4307)
,p_validation_name=>'PK not > 30 chars'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if length(:P13_PK1_2) > 30 then',
'  return false;',
'end if;',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'「主索引鍵」資料欄名稱不能超過 30 個字元.'
,p_always_execute=>'N'
,p_validation_condition=>'P13_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(52483906836405605.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52522413641473849.4307)
,p_validation_name=>'PK gen option needs to be auto'
,p_validation_sequence=>60
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P13_PK_TYPE = ''NOT_GENERATED'' then',
'  return false;',
'end if;',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'建立新主索引鍵時, 必須按順序產生「主索引鍵」.'
,p_always_execute=>'N'
,p_validation_condition=>'P13_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(29871919935552356.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29896704837633092.4307)
,p_validation_name=>'PK_NAME not null'
,p_validation_sequence=>70
,p_validation=>'P13_PK1_NAME'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須指定 PK 名稱.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(29868930193545840.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29898416743646038.4307)
,p_validation_name=>'SEQ_NAME available'
,p_validation_sequence=>80
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if not wwv_flow_builder.is_valid_identifier(''"''||:P13_NEW_SEQUENCE||''"'') then',
'   return wwv_flow_lang.system_message(''F4300.F4500.NOT_VALID_SEQ_NAME'',:P13_NEW_SEQUENCE);',
'end if;',
'    ',
'if not wwv_flow_sw_util.is_available_name(:P13_NEW_SEQUENCE, :F4300_P21_OWNER) then',
'   return wwv_flow_lang.system_message(''F4300.F4500.NAME_ALREADY_USED'',:P13_NEW_SEQUENCE);',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'錯誤.'
,p_always_execute=>'N'
,p_validation_condition=>'P13_PK_TYPE'
,p_validation_condition2=>'NEW_SEQUENCE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(29876013271569281.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(48786206675337067.4307)
,p_validation_name=>'no duplicate PK'
,p_validation_sequence=>90
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_cnt pls_integer := 0;',
'begin',
'    for c1 in (select count(c001) cnt',
'               from wwv_flow_collections',
'               where collection_name = ''CSV_IMPORT''',
'               and upper(c001) = upper(:P13_PK1_2))',
'    loop',
'      l_cnt := c1.cnt;',
'    end loop;',
'    if l_cnt > 0 then',
'      return wwv_flow_lang.system_message(''F4500.P602.DUP_COL_NAME'',:P13_PK1_2);',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'錯誤.'
,p_always_execute=>'N'
,p_validation_condition=>'P13_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(2164724759803154.4307)
,p_associated_item=>wwv_flow_api.id(52483906836405605.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937793190642890959.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937792840943888300.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937793478434890959.4307)
,p_event_id=>wwv_flow_api.id(937793190642890959.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2632715940268420.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create table'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare    ',
'  l_cnames     wwv_flow_global.vc_arr2;  ',
'  l_data_type  wwv_flow_global.vc_arr2;  ',
'  l_upload     wwv_flow_global.vc_arr2;',
'  l_max_length wwv_flow_global.vc_arr2;',
'  l_seq_name   varchar2(255) := null;',
'  l_pk1        varchar2(255) := :P13_PK1;',
'  l_pk1_name   varchar2(255) := null;',
'  i            pls_integer := 0;',
'begin     ',
'   if :P13_PK1_OPTION = ''NEW_KEY'' then',
'      i := i+1;',
'      l_pk1 := replace(wwv_flow_utilities.remove_spaces(:P13_PK1_2),chr(32),''_'');      ',
'      if :P19_PRESERVE_CASE is null then',
'        l_pk1 := upper(l_pk1);',
'      end if;',
'      l_cnames(i) := l_pk1;',
'      l_data_type(i) := ''NUMBER'';',
'      l_upload(i) := ''Y'';',
'      l_max_length(i) := 30;',
'   end if;',
'',
'   for c in (select * ',
'             from wwv_flow_collections ',
'             where collection_name=''CSV_IMPORT'') loop',
'     i := i+1; ',
'     l_cnames(i) := c.c001;',
'     l_data_type(i) := c.c002;',
'     l_upload(i) := c.c004;',
'     l_max_length(i) := c.c005;    ',
'   end loop;  ',
'  ',
'  if :P13_PK_TYPE = ''NEW_SEQUENCE'' then',
'    l_seq_name := :P13_NEW_SEQUENCE;',
'    if :P19_PRESERVE_CASE is null then',
'      l_seq_name := upper(l_seq_name);',
'    end if;',
'  elsif :P13_PK_TYPE = ''EXISTING_SEQUENCE'' then',
'    l_seq_name := :P13_EXISTING_SEQUENCE;',
'  else',
'    l_seq_name := NULL;',
'  end if;',
'',
' l_pk1_name := :P13_PK1_NAME;',
' if :P19_PRESERVE_CASE is null then',
'   l_pk1_name := upper(l_pk1_name);',
' end if;',
' wwv_flow_load_excel_data.create_table (',
'  p_schema        => :F4300_P13_OWNER,',
'  p_table_name    => wwv_flow_utilities.remove_spaces(:F4300_P13_TABLE_NAME),',
'  p_pk1           => l_pk1,',
'  p_pk1_name      => l_pk1_name,',
'  p_pk1_type      => :P13_PK_TYPE,',
'  p_seq_name      => l_seq_name,',
'  --',
'  p_cnames        => l_cnames,',
'  p_data_type     => l_data_type,  ',
'  p_upload        => l_upload,',
'  p_max_length    => l_max_length ',
'  ); ',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(2164724759803154.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2634021612279507.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'insert data'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_file_id                number := 0;',
'  l_first_row_is_col_name  boolean := false;  ',
'  l_cnames                 wwv_flow_global.vc_arr2;      ',
'  l_upload                 wwv_flow_global.vc_arr2;  ',
'  i                        number := 0;',
'  --',
'  l_data_type              wwv_flow_global.vc_arr2;',
'  l_data_format            wwv_flow_global.vc_arr2;',
'  l_parsed_data_format     wwv_flow_global.vc_arr2;',
'begin',
'  select id',
'  into l_file_id',
'  from wwv_flow_file_objects$',
'  where name = :F4300_P13_FILE;',
'  ',
'  for c in (select * ',
'            from wwv_flow_collections ',
'            where collection_name=''CSV_IMPORT'') loop',
'    i := i + 1;',
'    l_cnames(i) := c.c001;    ',
'    l_upload(i) := c.c004; ',
'    l_data_type(i) := c.c002;  ',
'    l_data_format(i) := c.c006;',
'    l_parsed_data_format(i) := c.c027; ',
'  end loop;  ',
'',
'  if :F4300_P13_IS_COLUMN_NAME = ''Y'' then',
'    l_first_row_is_col_name := true;',
'  end if;',
'',
'  wwv_flow_load_data.load_csv_data (',
'   p_file_id    => l_file_id,',
'   p_cnames     => l_cnames,',
'   p_upload     => l_upload,',
'   p_schema     => :F4300_P13_OWNER,',
'   p_table      => wwv_flow_utilities.remove_spaces(:F4300_P13_TABLE_NAME),',
'   p_data_type             => l_data_type,',
'   p_data_format           => l_data_format,',
'   p_parsed_data_format    => l_parsed_data_format,',
'   p_separator             => lower(:F4300_P13_SEPARATOR),',
'   p_enclosed_by           => :F4300_P13_ENCLOSED_BY,',
'   p_first_row_is_col_name => l_first_row_is_col_name,',
'   p_load_to               => ''NEW'',',
'   p_currency              => :P18_CURRENCY,',
'   p_numeric_chars         => :P18_DECIMAL_CHARACTER||:P18_GROUP_SEPARATOR,',
'   p_charset               => :P18_FILE_CHARSET',
'   );',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(2164724759803154.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(698583885660530521.4307)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2164724759803154.4307)
,p_process_success_message=>'資料已載入.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69940020626931717.4307)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P13_OWNER);'
,p_process_error_message=>'無效的綱要'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122951803454637884.4307)
,p_process_sequence=>40
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P13_OWNER);'
);
end;
/
prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 表格擁有者和名稱'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 表格擁有者和名稱'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2166903406803173.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>選取資料庫綱要和您要將資料載入其中之表格的名稱.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region generated 20-SEP-2002 14:00:18'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3942229644856578.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3934205141830584.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208603801195601913.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937794354347915984.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208603801195601913.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2167814861803176.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208603801195601913.4307)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4117018823640385.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208603801195601913.4307)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2169404691803182.4307)
,p_branch_action=>'24'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(2167814861803176.4307)
,p_branch_sequence=>10
,p_branch_comment=>'Generated 20-SEP-2002 14:00:18'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4117328710640389.4307)
,p_branch_action=>'230'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(4117018823640385.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2167519385803175.4307)
,p_name=>'F4300_P22_TABLE_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2166903406803173.4307)
,p_prompt=>'表格擁有者'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LIST_SCHEMA_OWNERS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c.schema) d, c.schema v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取綱要 - '
,p_lov_null_value=>'%null%'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_read_only_when=>'wwv_flow_global.g_xe'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_read_only_disp_attr=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'<p>選取內含您要將資料載入其中之表格的資料庫綱要.</p>'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>'Generated 20-SEP-2002 14:00:18'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(236284414381765839.4307)
,p_name=>'F4300_P22_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2166903406803173.4307)
,p_prompt=>'表格名稱'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(table_name) d, table_name r',
'from sys.dba_tables',
'where owner = :F4300_P22_TABLE_OWNER',
'and table_name not like ''BIN$%''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取表格 -'
,p_lov_cascade_parent_items=>'F4300_P22_TABLE_OWNER'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'<p>選取要將資料載入其中的資料庫表格.</p>'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3375200229249004.4307)
,p_validation_name=>'F4300_P22_TABLE_OWNER Not Null'
,p_validation_sequence=>10
,p_validation=>'F4300_P22_TABLE_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定綱要.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(2167519385803175.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 25-SEP-2002 14:41'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(236299719922767422.4307)
,p_validation_name=>'F4300_P22_TABLE_NAME Not Null'
,p_validation_sequence=>20
,p_validation=>'F4300_P22_TABLE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定「表格名稱」.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P22_TABLE_NAME'
,p_validation_condition_type=>'ITEM_IS_NULL'
,p_when_button_pressed=>wwv_flow_api.id(2167814861803176.4307)
,p_associated_item=>wwv_flow_api.id(236284414381765839.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 25-SEP-2002 14:40'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937794586888918217.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937794354347915984.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937794833959918218.4307)
,p_event_id=>wwv_flow_api.id(937794586888918217.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(236513721363871972.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Verify Schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P22_TABLE_OWNER);'
,p_process_error_message=>'無效的綱要'
,p_process_when_button_id=>wwv_flow_api.id(2167814861803176.4307)
);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 檔案詳細資訊'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 檔案詳細資訊'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3829922094433887.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<label for="file-upload" class="hideMe508">檔案上傳</label><p>請使用此頁面來尋找要上傳的檔案. 如果第一個資料列含有資料欄名稱, 請選取<b>第一個資料列含有資料欄名稱</b>.</p>',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3943707265859631.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3934205141830584.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21249425216360552.4307)
,p_plug_name=>'全球化'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676055535817183.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208605727861609658.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937795591496921755.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208605727861609658.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3830706637433895.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208605727861609658.4307)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3830402542433895.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208605727861609658.4307)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3834709806433923.4307)
,p_branch_action=>'24'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'F4300_P24_REUPLOAD'
,p_branch_condition_text=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3834410468433923.4307)
,p_branch_action=>'25'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(3830706637433895.4307)
,p_branch_sequence=>20
,p_branch_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3834101310433921.4307)
,p_branch_action=>'22'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(3830402542433895.4307)
,p_branch_sequence=>30
,p_branch_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3831104189433900.4307)
,p_name=>'F4300_P24_REUPLOAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3829922094433887.4307)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'重新上傳檔案'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES.NO.RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(87930425596657700)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_display_when=>'F4300_P22_FILE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'指定重新上傳檔案'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3831424650433904.4307)
,p_name=>'F4300_P24_FILE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3829922094433887.4307)
,p_prompt=>'檔案名稱'
,p_source=>'F4300_P22_FILE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_display_when=>'F4300_P22_FILE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'要上傳的檔案名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3832007249433909.4307)
,p_name=>'F4300_P22_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3829922094433887.4307)
,p_prompt=>'檔案'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_tag_attributes=>'id="file-upload"'
,p_label_alignment=>'RIGHT'
,p_display_when=>'F4300_P22_FILE'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>按一下<strong>瀏覽</strong>來尋找要上傳的檔案.</p>'
,p_attribute_01=>'WWV_FLOW_FILES'
,p_item_comment=>'Generated 20-SEP-2002 14:00:17'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3832316073433910.4307)
,p_name=>'F4300_P22_IS_COLUMN_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(3829922094433887.4307)
,p_item_default=>'Y'
,p_prompt=>'第一個資料列含有資料欄名稱'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ISCOLUMN.NAME.TEXT'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<span class="instructiontext">''||',
'wwv_flow_lang.system_message(''F4300_INSTRUCT_TEXT'')||''</span>'' d, ''Y'' r from dual'))
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料含有第一個資料列中的資料欄名稱, 請選取此選項. 下列為一範例:</p>',
'<pre>',
'Name     Salary     Commission',
'Clark    1000       10',
'Scott    2000       20',
'</pre>',
'',
'',
'',
'<pre>',
'',
'',
'',
'Name     Salary     Commission',
'',
'',
'',
'Clark    1000       10',
'',
'',
'',
'Scott    2000       20',
'',
'',
'',
'</pre>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3832614597433912.4307)
,p_name=>'F4300_P22_SEPARATOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(3829922094433887.4307)
,p_item_default=>','
,p_prompt=>'區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>指定資料欄區隔符號字元. 請使用 <strong>\t</strong> 當成 Tab 區隔符號.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3832902320433912.4307)
,p_name=>'F4300_P22_ENCLOSED_BY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(3829922094433887.4307)
,p_prompt=>'選擇性外加符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>指定選擇性外加符號字元.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21250401452363148.4307)
,p_name=>'P24_CURRENCY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(21249425216360552.4307)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_return_val varchar2(30) := ''$'';',
'begin',
'    for c1 in (select value',
'                 from nls_session_parameters',
'                where parameter = ''NLS_CURRENCY'') loop',
'        l_return_val := c1.value;',
'        exit;',
'    end loop;',
'    --',
'    return l_return_val;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'貨幣符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料包含國際貨幣符號, 請在此處輸入該符號.</p>',
'<p>例如, 如果您的資料包含 "&euro;1,234.56" 或 "&yen;1,234.56", 請輸入 "&euro;" 或 "&yen;".  否則, 資料將無法正確載入.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21979404565582755.4307)
,p_name=>'P24_GROUP_SEPARATOR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(21249425216360552.4307)
,p_item_default=>'return wwv_flow.get_nls_group_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'群組區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>群組區隔符號是一個區隔整數群組 (例如顯示千分位與百萬分位) 的字元.</p>',
'<p>任何字元皆可當成群組區隔符號. 指定的字元必須是單位元組, 而且群組區隔符號必須與其他十進位字元不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21983213138604079.4307)
,p_name=>'P24_DECIMAL_CHARACTER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(21249425216360552.4307)
,p_item_default=>'return wwv_flow.get_nls_decimal_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'十進位字元'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>十進位字元可區隔整數和數字的小數部分.</p>',
'<p> 任何字元皆可當成十進位字元. 指定的字元必須是單位元組, 而且十進位字元必須與群組區隔符號不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143065000827740153.4307)
,p_name=>'P24_FILE_CHARSET'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(3829922094433887.4307)
,p_item_default=>'nvl(lower(trim(sys.owa_util.get_cgi_env(''REQUEST_IANA_CHARSET''))),''utf-8'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'檔案字元集'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'I18N_IANA_CHARSET'
,p_lov=>'.'||wwv_flow_api.id(135399325911344822)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'選擇編碼之文字檔的字元集.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3835011019433929.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P22_FILE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_compute_when=>'F4300_P24_REUPLOAD'
,p_compute_when_text=>'Y'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(49535021883702753.4307)
,p_computation_sequence=>20
,p_computation_item=>'F4300_P22_IS_COLUMN_NAME'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'F4300_P22_IS_COLUMN_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3835314069433929.4307)
,p_computation_sequence=>30
,p_computation_item=>'F4300_P24_REUPLOAD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3835908087433932.4307)
,p_validation_name=>'file name not null'
,p_validation_sequence=>10
,p_validation=>'F4300_P22_FILE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定檔案.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(3830706637433895.4307)
,p_associated_item=>wwv_flow_api.id(3832007249433909.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937795797046923768.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937795591496921755.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937796033082923768.4307)
,p_event_id=>wwv_flow_api.id(937795797046923768.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3836525951433937.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create table info collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare  ',
'  l_first_row_is_col_name boolean := false;',
'  l_file_id               number := 0;',
'begin',
'  select id',
'  into l_file_id',
'  from wwv_flow_file_objects$',
'  where name = :F4300_P22_FILE;',
'  ',
'  ',
'  if :F4300_P22_IS_COLUMN_NAME = ''Y'' then',
'    l_first_row_is_col_name := true;',
'  end if;',
'  wwv_flow_load_data.create_csv_collection (',
'   p_file_id                => l_file_id,',
'   p_separator              => lower(:F4300_P22_SEPARATOR),',
'   p_enclosed_by            => :F4300_P22_ENCLOSED_BY,  ',
'   p_first_row_is_col_name  => l_first_row_is_col_name,',
'   p_currency               => :P24_CURRENCY,',
'   p_numeric_chars          => :P24_DECIMAL_CHARACTER||:P24_GROUP_SEPARATOR,',
'   p_charset                => :P24_FILE_CHARSET',
'   );',
'end;'))
,p_process_error_message=>'使用載入的資料建立集合時發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(3830706637433895.4307)
);
end;
/
prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 資料欄對應'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 資料欄對應'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3379027934257020.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>您可以在此頁面預覽您資料的載入方式. 請比對資料庫資料欄名稱與資料中的資料欄是否相符. 若要上傳資料欄, 請選取<b>是</b>, 否則選取<b>否</b>. 星號 (*) 表示必要的資料欄. 若要將資料上傳至選取的表格, 請按一下<b>載入資料</b>.</p> ',
'<p>您可以使用「SQL 工作室」來修改表格屬性, 例如變更資料欄長度、設定非空值資料欄或變更資料欄類型.</p> ',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3382431874267620.4307)
,p_plug_name=>'定義資料欄對應'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="overflow: auto; width: 100%; padding: 12px;"'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_load_data.display_etable_property (',
'    p_table_owner     => :F4300_P22_TABLE_OWNER,',
'    p_table_name      => :F4300_P22_TABLE_NAME,',
'    p_collection_name => ''CSV_IMPORT''',
'    );'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(7082409118250737.4307)
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_query_show_nulls_as=>' - '
,p_plug_query_col_allignments=>'L:L:L:L:L:L:L'
,p_plug_query_sum_cols=>'::::::'
,p_plug_query_number_formats=>'::::::'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3944611767860950.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(3934205141830584.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208608528123628623.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937797370499933217.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208608528123628623.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3749803794082687.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208608528123628623.4307)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'載入資料'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3748622363078595.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208608528123628623.4307)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3748901903078596.4307)
,p_branch_action=>'24'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(3748622363078595.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3753406349092940.4307)
,p_name=>'F4300_P25_TABLE_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3379027934257020.4307)
,p_use_cache_before_default=>'NO'
,p_prompt=>'綱要:'
,p_source=>'F4300_P22_TABLE_OWNER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'擁有要載入資料之表格的綱要.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3754218816096550.4307)
,p_name=>'F4300_P25_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3379027934257020.4307)
,p_use_cache_before_default=>'NO'
,p_prompt=>'表格名稱:'
,p_source=>'F4300_P22_TABLE_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'要將資料載入其中的表格名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3872807706566435.4307)
,p_name=>'F4300_P25_DUMMY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3379027934257020.4307)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3874326752571910.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P25_DUMMY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'for i in 1..wwv_flow.g_f04.count loop',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f04(i),',
'     p_attr_number => 1,',
'     p_attr_value => wwv_flow_utilities.remove_spaces(wwv_flow.g_f01(i))',
'     );',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f04(i),',
'     p_attr_number => 4,',
'     p_attr_value => wwv_flow.g_f02(i)',
'     );',
'     ',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''CSV_IMPORT'',',
'     p_seq => wwv_flow.g_f04(i),',
'     p_attr_number => 6,',
'     p_attr_value => wwv_flow.g_f05(i)',
'     );     ',
'end loop;',
'',
'return ''true'';',
'',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3758426912108293.4307)
,p_validation_name=>'column name not null'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_null_found number := 0;',
'',
'begin',
'',
'  for i in 1..wwv_flow.g_f01.count loop',
'',
'    if wwv_flow.g_f02(i)=''Y'' then',
'',
'      if replace(wwv_flow.g_f01(i),''%''||''null%'',null) is null then',
'',
'        l_null_found := l_null_found + 1;',
'',
'      end if;',
'',
'    end if;',
'',
'  end loop;',
'',
'',
'',
'  if l_null_found > 0 then',
'',
'    return false;',
'',
'  else',
'',
'    return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'資料欄名稱不能為空值.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(3749803794082687.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3759521849116267.4307)
,p_validation_name=>'at least one upload selected'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_no_count number := 0;',
'',
'begin',
'',
'  for i in 1..wwv_flow.g_f02.count loop',
'',
'    if wwv_flow.g_f02(i) = ''N'' then',
'',
'      l_no_count := l_no_count + 1;',
'',
'    end if;',
'',
'  end loop;',
'',
'',
'',
'  if l_no_count = wwv_flow.g_f02.count then',
'',
'    return false;',
'',
'  else',
'',
'    return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'至少必須指定一個資料欄來上傳資料.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(3749803794082687.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3762021418135076.4307)
,p_validation_name=>'not null columns must be loaded'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_not_null_error number := 0;',
'',
'  l_columns        varchar2(32767) := null;',
'',
'  l_not_null_cols  varchar2(32767) := null;',
'',
'  l_trigger_body   long;',
'',
'begin',
'',
'  l_columns := wwv_flow_utilities.table_to_string2(wwv_flow.g_f01);',
'',
'',
'',
'  -- get trigger body if it is before insert trigger on the selected table',
'',
'  for c1 in (select trigger_body',
'',
'             from sys.dba_triggers',
'',
'             where table_name = :F4300_P22_TABLE_NAME',
'',
'             and table_owner = :F4300_P22_TABLE_OWNER',
'',
'             and trigger_type like ''%BEFORE%''',
'',
'             and triggering_event like ''%INSERT%'')',
'',
'  loop',
'',
'     l_trigger_body := c1.trigger_body;',
'',
'  end loop;',
'',
'',
'',
'  -- get all not null columns',
'',
'  for c1 in (select column_name',
'',
'             from sys.dba_tab_columns',
'',
'             where table_name = :F4300_P22_TABLE_NAME',
'',
'             and owner = :F4300_P22_TABLE_OWNER',
'',
'             and nullable = ''N''',
'',
'             ) loop',
'',
'',
'',
'      for i in 1..wwv_flow.g_f01.count loop',
'',
'        -- If column names user selected is equal to not null columns,',
'',
'        -- user didn''t include to upload',
'',
'        -- and the column doesn''t have trigger, raise an error.',
'',
'        if (wwv_flow.g_f01(i) = c1.column_name) then',
'',
'          if wwv_flow.g_f02(i) = ''N'' then',
'',
'            if instr(nvl(UPPER(l_trigger_body),'' ''),c1.column_name) = 0 then',
'',
'              l_not_null_error := l_not_null_error + 1;',
'',
'              l_not_null_cols := l_not_null_cols||'',''||c1.column_name;',
'',
'            end if;',
'',
'          end if;',
'',
'        else',
'',
'          -- If user did not select not null columns,',
'',
'          -- and the column doesn''t have trigger',
'',
'          -- raise an error.',
'',
'          if instr(l_columns,c1.column_name) = 0 then',
'',
'            if instr(nvl(UPPER(l_trigger_body),'' ''),c1.column_name) = 0 then',
'',
'              l_not_null_error := l_not_null_error + 1;',
'',
'              l_not_null_cols := l_not_null_cols||'',''||c1.column_name;',
'',
'            end if;',
'',
'          end if;',
'',
'        end if;',
'',
'      end loop;',
'',
'  end loop;',
'',
'',
'',
'',
'',
'  if l_not_null_error > 0 then',
'',
'      return false;',
'',
'  else',
'',
'      return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&F4300_P22_TABLE_OWNER..&F4300_P22_TABLE_NAME. 中有 NOT NULL 資料欄. 請選取上傳資料, 不會發生錯誤.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(3749803794082687.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3804414642293989.4307)
,p_validation_name=>'duplicate column names'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_col       varchar2(32767) := null;',
'  l_duplicate boolean := true;',
'begin',
'  for i in 1..wwv_flow.g_f01.count loop',
'    -- if column selected is to be uploaded, check for duplicate column selection',
'    if wwv_flow.g_f02(i) = ''Y'' then',
'        if instr(nvl(l_col,'' ''), ('':'' || wwv_flow.g_f01(i) || '':'')) > 0 then',
'          l_duplicate := false;',
'        end if;',
'        if i > 1 then',
'            l_col := l_col || wwv_flow.g_f01(i) || '':'';',
'        else',
'            l_col := '':'' || wwv_flow.g_f01(i) || '':'' ;',
'        end if;',
'    end if;',
'  end loop;',
'  return l_duplicate;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'選取重複的資料欄名稱.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(3749803794082687.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937797560733935376.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937797370499933217.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937797853562935376.4307)
,p_event_id=>wwv_flow_api.id(937797560733935376.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3813707079395907.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'insert data'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_file_id                number := 0;',
'  l_first_row_is_col_name  boolean := false;',
'  l_cnames                 wwv_flow_global.vc_arr2;',
'  --',
'  l_data_types             wwv_flow_global.vc_arr2;',
'  l_parsed_data_format     wwv_flow_global.vc_arr2;',
'  j                        pls_integer := 0;',
'begin',
'  select id',
'  into l_file_id',
'  from wwv_flow_file_objects$',
'  where name = :F4300_P22_FILE;',
'',
'  if :F4300_P22_IS_COLUMN_NAME = ''Y'' then',
'    l_first_row_is_col_name := true;',
'  end if;',
'',
'  for i in 1..wwv_flow.g_f01.count loop',
'    l_cnames(i) := wwv_flow.g_f01(i);',
'    ',
'    for c1 in (select data_type',
'               from sys.dba_tab_columns',
'               where owner = :F4300_P22_TABLE_OWNER',
'               and table_name = :F4300_P22_TABLE_NAME',
'               and column_name = wwv_flow.g_f01(i)',
'               order by column_id)',
'    loop',
'       l_data_types(i) := c1.data_type;    	',
'    end loop;    ',
'  end loop;',
'  ',
'  for c in (select * ',
'            from wwv_flow_collections ',
'            where collection_name=''CSV_IMPORT'') loop',
'    j := j + 1;    ',
'    l_parsed_data_format(j) := c.c027; ',
'  end loop;',
'',
'  wwv_flow_load_data.load_csv_data (',
'   p_file_id    => l_file_id,',
'   p_cnames     => l_cnames,',
'   p_upload     => wwv_flow.g_f02,',
'   p_schema     => :F4300_P22_TABLE_OWNER,',
'   p_table      => :F4300_P22_TABLE_NAME,',
'   p_data_type  => l_data_types,',
'   p_data_format => wwv_flow.g_f05,',
'   p_parsed_data_format => l_parsed_data_format,',
'   p_separator  => lower(:F4300_P22_SEPARATOR),',
'   p_enclosed_by => :F4300_P22_ENCLOSED_BY,',
'   p_first_row_is_col_name => l_first_row_is_col_name,',
'   p_load_to               => ''EXIST'',',
'   p_currency              => :P24_CURRENCY,',
'   p_numeric_chars         => :P24_DECIMAL_CHARACTER||:P24_GROUP_SEPARATOR,',
'   p_charset               => :P24_FILE_CHARSET',
'   );',
'end;'))
,p_process_error_message=>'插入資料發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(3749803794082687.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(698584313626530526.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3749803794082687.4307)
,p_process_success_message=>'資料已載入.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432755516873085837.4307)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'security check'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P22_TABLE_OWNER);'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122950027302616323.4307)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'security check'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P22_TABLE_OWNER);'
);
end;
/
prompt --application/pages/page_00090
begin
wwv_flow_api.create_page(
 p_id=>90.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'取消載入至 XML - 資料欄'
,p_page_mode=>'MODAL'
,p_step_title=>'取消載入至 XML - 資料欄'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731303316584395)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_exprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(242928263721.4307)
,p_plug_name=>'取消載入至 XML'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_query_show_nulls_as=>'(null)'
,p_plug_header=>'<p>您可以將表格的內容匯出至 XML 文件. 選取您要匯出至 XML 文件的資料庫綱要、表格以及關聯的資料欄.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(341984427776830221.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(944846820724951476.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(341984427776830221.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(242954438477.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(341984427776830221.4307)
,p_button_name=>'EXPORTDATA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'取消載入資料'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.submit(''EXPORTDATA'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(242922263709.4307)
,p_branch_action=>'90'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(242926263712.4307)
,p_name=>'F4300_P90_XML_EXPORT_COLUMNS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(242928263721.4307)
,p_prompt=>'資料欄'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(column_name) d, column_name r',
'from sys.dba_tab_columns',
'where table_name= :F4300_P80_XML_EXPORT_TABLE',
'and owner =:F4300_P70_SCHEMA and column_id is not null'))
,p_lov_cascade_parent_items=>'F4300_P80_XML_EXPORT_TABLE,F4300_P70_SCHEMA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>10
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'選取要匯出至 XML 文件的資料庫物件資料欄.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73486104619415064.4307)
,p_name=>'P90_FILE_EXPORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(242928263721.4307)
,p_item_default=>'Y'
,p_prompt=>'匯出成檔案'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'EXPORT.AS.FILE.Y'
,p_lov=>'.'||wwv_flow_api.id(87944005995777613)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196680604705342464.4307)
,p_name=>'P90_WHERE_CLAUSE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(242928263721.4307)
,p_prompt=>'Where 子句'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>5
,p_new_grid=>true
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'輸入 SQL WHERE 子句, 以限制選取的資料列數目.  例如:',
'<pre>',
'DEPTNO = 10',
'</pre>'))
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(254954327846848756.4307)
,p_name=>'F4300_P70_SCHEMA'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(242928263721.4307)
,p_prompt=>'表格擁有者'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LIST_SCHEMA_OWNERS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c.schema) d, c.schema v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1',
''))
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'選取擁有您要匯出之物件的資料庫綱要.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(254973402004850698.4307)
,p_name=>'F4300_P80_XML_EXPORT_TABLE'
,p_item_sequence=>2
,p_item_plug_id=>wwv_flow_api.id(242928263721.4307)
,p_prompt=>'表格'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(table_name) d, table_name v',
'from sys.dba_tables',
'where owner=:F4300_P70_SCHEMA',
'and table_name not like ''BIN$%''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取表格 -'
,p_lov_null_value=>'0'
,p_lov_cascade_parent_items=>'F4300_P70_SCHEMA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_help_text=>'選取要匯出為 XML 檔案格式的資料庫物件名稱.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(241192503550535804.4307)
,p_computation_sequence=>10
,p_computation_item=>'P90_WHERE_CLAUSE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare ',
'  w varchar2(30000);',
'begin',
'  w := :p90_where_clause;',
'  for i in 1..10 loop',
'    w := rtrim(rtrim(rtrim(trim(w),'';/ ''),chr(10)),chr(13));',
'  end loop;',
'  return w;',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(255090131917868798.4307)
,p_validation_name=>'export table not null'
,p_validation_sequence=>5
,p_validation=>'F4300_P80_XML_EXPORT_TABLE'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須指定「匯出表格」.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P80_XML_EXPORT_TABLE'
,p_validation_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_when_button_pressed=>wwv_flow_api.id(242954438477.4307)
,p_associated_item=>wwv_flow_api.id(254973402004850698.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(61180608448820628.4307)
,p_validation_name=>'export cols not null'
,p_validation_sequence=>10
,p_validation=>'F4300_P90_XML_EXPORT_COLUMNS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定「匯出資料欄」.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(242954438477.4307)
,p_associated_item=>wwv_flow_api.id(242926263712.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(99812303853555653.4307)
,p_validation_name=>'no row exists'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_cnt    number := 0;  ',
'  l_sql    varchar2(32767) := null;',
'begin    ',
'  l_sql := ''select count(*) from "''||:F4300_P80_XML_EXPORT_TABLE||''"'';',
'                                             ',
'  l_cnt := wwv_flow_f4000_util.select_num (p_sql => l_sql, p_user => :F4300_P70_SCHEMA);',
'  ',
'  if l_cnt = 0 then',
'    return false;',
'  else',
'    return true;',
'  end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'選取的表格沒有任何要匯出的記錄. 請先將資料填入表格, 再執行匯出.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P80_XML_EXPORT_TABLE'
,p_validation_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_when_button_pressed=>wwv_flow_api.id(242954438477.4307)
,p_associated_item=>wwv_flow_api.id(254973402004850698.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(255075127415867567.4307)
,p_validation_name=>'schema not null'
,p_validation_sequence=>30
,p_validation=>'F4300_P70_SCHEMA'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須指定綱要.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P70_SCHEMA'
,p_validation_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_when_button_pressed=>wwv_flow_api.id(242954438477.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(944847063502954022.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(944846820724951476.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(944847397350954024.4307)
,p_event_id=>wwv_flow_api.id(944847063502954022.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(242990422910.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'start_xml_download'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_dataload_xml.download_xml (',
'    p_to_file => lower(:F4300_P80_XML_EXPORT_TABLE)||''.xml'',',
'    p_schema  => :F4300_P70_SCHEMA, ',
'    p_table   => :F4300_P80_XML_EXPORT_TABLE, ',
'    p_columns => wwv_flow_utilities.string_to_table2(:F4300_P90_XML_EXPORT_COLUMNS),',
'    p_where   => :P90_WHERE_CLAUSE );'))
,p_process_when_button_id=>wwv_flow_api.id(242954438477.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(698584852702530531.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(242954438477.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432755700382090489.4307)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P70_SCHEMA);'
,p_process_when=>'F4300_P70_SCHEMA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432755918043095637.4307)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P70_SCHEMA);'
);
end;
/
prompt --application/pages/page_00150
begin
wwv_flow_api.create_page(
 p_id=>150.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'取消載入至文字 - 資料欄'
,p_page_mode=>'MODAL'
,p_step_title=>'取消載入至文字 - 資料欄'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_exprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27155313458825518.4307)
,p_plug_name=>'取消載入至文字'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>wwv_flow_api.id(7082409118250737.4307)
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_column_width=>'valign="top"'
,p_plug_query_show_nulls_as=>' - '
,p_plug_query_col_allignments=>'L:L:L:L:L:L:L'
,p_plug_query_sum_cols=>'::::::'
,p_plug_query_number_formats=>'::::::'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<p>您可以取消將表格內容載入至結構化文字檔. 例如, 您可以將整個表格匯出至使用逗號區隔的檔案 (.CSV). 請選取擁有您要取消載入至「文字」之表格的資料庫綱要.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27155716362825519.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(104358211508848205.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_query_show_nulls_as=>'(null)'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208611722282655337.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(250661318515297280.4307)
,p_name=>'無法取消載入資料欄'
,p_template=>wwv_flow_api.id(716676747173817184.4307)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select owner, ',
'table_name, ',
'column_name,',
'data_type',
'from sys.dba_tab_columns',
'where owner = :F4300_P150_SCHEMA',
'and table_name = :F4300_P160_ASC_EXPORT_TABLE',
'and data_type in (''SDO_GEOMETRY'',''BLOB'',''BFILE'',''ORDAUDIO'',''ORDIMAGE'',''ORDIMAGESIGNATURE'',''ORDVIDEO'',''ORDDOC'',''URITYPE'',''DBURITYPE'',''XDBURITYPE'',''HTTPURITYPE'',''XMLTYPE'')'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from sys.dba_tab_columns',
'where owner = :F4300_P150_SCHEMA',
'and table_name = :F4300_P160_ASC_EXPORT_TABLE',
'and data_type in (''SDO_GEOMETRY'',''BLOB'',''BFILE'',''ORDAUDIO'',''ORDIMAGE'',''ORDIMAGESIGNATURE'',''ORDVIDEO'',''ORDDOC'',''URITYPE'',''DBURITYPE'',''XDBURITYPE'',''HTTPURITYPE'',''XMLTYPE'')'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(10583525904875984.4307)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'1:2'
,p_query_no_data_found=>'找不到資料.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(250661515424297282.4307)
,p_query_column_id=>1
,p_column_alias=>'OWNER'
,p_column_display_sequence=>1
,p_column_heading=>'綱要'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(250661627810297284.4307)
,p_query_column_id=>2
,p_column_alias=>'TABLE_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'表格'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(250661730665297284.4307)
,p_query_column_id=>3
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'資料欄'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(250661827095297284.4307)
,p_query_column_id=>4
,p_column_alias=>'DATA_TYPE'
,p_column_display_sequence=>4
,p_column_heading=>'資料類型'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(940815743000894347.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208611722282655337.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27154700232825500.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208611722282655337.4307)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(27154924917825505.4307)
,p_branch_action=>'180'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(27154700232825500.4307)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27155123411825508.4307)
,p_name=>'F4300_P150_SCHEMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(27155313458825518.4307)
,p_prompt=>'綱要'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LIST_SCHEMA_OWNERS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c.schema) d, c.schema v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1',
''))
,p_cSize=>30
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'選取擁有您要匯出之物件的資料庫綱要.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(249987629719234198.4307)
,p_name=>'F4300_P160_ASC_EXPORT_TABLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(27155313458825518.4307)
,p_prompt=>'表格'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(table_name) a, table_name b',
'from sys.dba_tables',
'where owner=:F4300_P150_SCHEMA',
'and table_name not like ''BIN$%''',
'order by table_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取表格 -'
,p_lov_null_value=>'0'
,p_lov_cascade_parent_items=>'F4300_P150_SCHEMA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'選取要匯出為純文字格式的資料庫表格.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(250371231151263023.4307)
,p_name=>'F4300_P170_ASC_EXPORT_COLUMNS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(27155313458825518.4307)
,p_prompt=>'資料欄'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(column_name) a, column_name b',
'from sys.dba_tab_columns',
'where table_name= :F4300_P160_ASC_EXPORT_TABLE',
'and owner =:F4300_P150_SCHEMA',
'and data_type not in (''SDO_GEOMETRY'',''BLOB'',''BFILE'',''ORDAUDIO'',''ORDIMAGE'',''ORDIMAGESIGNATURE'',''ORDVIDEO'',''ORDDOC'',''URITYPE'',''DBURITYPE'',''XDBURITYPE'',''HTTPURITYPE'',''XMLTYPE'') and column_id is not null'))
,p_lov_cascade_parent_items=>'F4300_P160_ASC_EXPORT_TABLE,F4300_P150_SCHEMA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cHeight=>10
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'選取要成為此純文字檔之一部分的資料欄. 只支援取消載入 BLOB 和 BFILE 以外的 Oracle 內建資料類型.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(250444929550272065.4307)
,p_name=>'P170_WHERE_CLAUSE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(27155313458825518.4307)
,p_prompt=>'Where 子句'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>32767
,p_cHeight=>6
,p_new_grid=>true
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'輸入 SQL WHERE 子句, 以限制選取的資料列數目.  例如:',
'<pre>',
'DEPTNO = 10',
'</pre>'))
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(250598322886289033.4307)
,p_computation_sequence=>10
,p_computation_item=>'P170_WHERE_CLAUSE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare w varchar2(30000);',
'begin',
'w := :P170_WHERE_CLAUSE;',
'for i in 1..10 loop',
'  w := rtrim(rtrim(rtrim(trim(w),'';/ ''),chr(10)),chr(13));',
'end loop;',
'return w;',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(65600608761173558.4307)
,p_validation_name=>'schema not null'
,p_validation_sequence=>10
,p_validation=>'F4300_P150_SCHEMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定綱要.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(27154700232825500.4307)
,p_associated_item=>wwv_flow_api.id(27155123411825508.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(250138105739246184.4307)
,p_validation_name=>'Table Name Must Be Selected'
,p_validation_sequence=>20
,p_validation=>'F4300_P160_ASC_EXPORT_TABLE'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須選取 #LABEL#.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P160_ASC_EXPORT_TABLE'
,p_validation_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_when_button_pressed=>wwv_flow_api.id(27154700232825500.4307)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(249987629719234198.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(250624431197291449.4307)
,p_validation_name=>'export col not null'
,p_validation_sequence=>30
,p_validation=>'F4300_P170_ASC_EXPORT_COLUMNS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定匯出資料欄.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(27154700232825500.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(940816209580897014.4307)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(940815743000894347.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(940816584358897016.4307)
,p_event_id=>wwv_flow_api.id(940816209580897014.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432756705015101278.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P150_SCHEMA);'
,p_process_error_message=>'無效的綱要'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432756921291105974.4307)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P150_SCHEMA);'
,p_process_when=>'F4300_P150_SCHEMA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
prompt --application/pages/page_00180
begin
wwv_flow_api.create_page(
 p_id=>180.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'取消載入至文字 - 選項'
,p_page_mode=>'MODAL'
,p_step_title=>'取消載入至文字 - 選項'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215731706086585147)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_exprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185631'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27163003595914791.4307)
,p_plug_name=>'取消載入至文字'
,p_region_template_options=>'#DEFAULT#:a-Form--fixedLabels'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>wwv_flow_api.id(7082409118250737.4307)
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_query_show_nulls_as=>' - '
,p_plug_query_col_allignments=>'L:L:L:L:L:L:L'
,p_plug_query_sum_cols=>'::::::'
,p_plug_query_number_formats=>'::::::'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<p>指定用以在每一行區隔資料欄值的區隔符號類型, 以及識別資料欄中文字字串的方式.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27163907693981199.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(104358211508848205.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_query_show_nulls_as=>'(null)'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208613222760664930.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(941533206074201078.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208613222760664930.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27163504640971637.4307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(208613222760664930.4307)
,p_button_name=>'EXPORTDATA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'取消載入資料'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.submit(''EXPORTDATA'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27164230828990784.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208613222760664930.4307)
,p_button_name=>'previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(151088609408189516.4307)
,p_branch_action=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(27163504640971637.4307)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(27164522069990788.4307)
,p_branch_action=>'150'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(27164230828990784.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5580720856115889.4307)
,p_name=>'F4300_P180_INC_COLUMN_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(27163003595914791.4307)
,p_prompt=>'包括資料欄名稱'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'INCLUDE.COL.NAMES.Y'
,p_lov=>'.'||wwv_flow_api.id(87945815476789819)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'如果要匯出資料與資料欄名稱, 請勾選此項目.'
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27163402948965482.4307)
,p_name=>'F4300_P180_SEPARATOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(27163003595914791.4307)
,p_item_default=>','
,p_prompt=>'區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="htmldbInfoBodyP">指定用來區隔每一行之資料欄值的區隔符號類型.</div> ',
'<div class="htmldbInfoBodyP">預設值為逗號 (<code>,</code>).  若要使用 Tab 作為資料欄區隔符號, 請輸入反斜線且後接字母 "t" (<code>	</code>).</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142827824937224518.4307)
,p_name=>'P180_FILE_CHARSET'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(27163003595914791.4307)
,p_use_cache_before_default=>'NO'
,p_item_default=>'nvl(lower(trim(sys.owa_util.get_cgi_env(''REQUEST_IANA_CHARSET''))),''utf-8'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'檔案字元集'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'I18N_IANA_CHARSET'
,p_lov=>'.'||wwv_flow_api.id(135399325911344822)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'選取要用於編碼匯出檔的字元集.',
''))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143184623384792499.4307)
,p_name=>'P180_FILE_FORMAT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(27163003595914791.4307)
,p_prompt=>'檔案格式'
,p_source=>'wwv_flow_lang.system_message(p_name=>''F4300.P180_FILE_FORMAT'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EXPORT.FILE_FORMAT'
,p_lov=>'.'||wwv_flow_api.id(143183002952786622)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'選擇 DOS, 讓產生之檔案中的文字行以歸位字元和換行字元為結尾. 選擇 UNIX, 讓產生之檔案中的文字行以換行字元為結尾.  '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162884825010392552.4307)
,p_name=>'F4300_P180_ENCLOSED'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(27163003595914791.4307)
,p_prompt=>'選擇性外加符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'使用此選項來指定如何識別資料欄中的文字字串. 您可以指定單引號或雙引號.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196667304565257203.4307)
,p_name=>'P180_TABLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(27163003595914791.4307)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&F4300_P160_ASC_EXPORT_TABLE.'
,p_prompt=>'表格:'
,p_source=>'F4300_P160_ASC_EXPORT_TABLE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'指定選取的表格.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941533402851204296.4307)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(941533206074201078.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941533765949204298.4307)
,p_event_id=>wwv_flow_api.id(941533402851204296.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27164904458230351.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'export data process'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   ascii_cols  wwv_flow_global.vc_arr2;',
'   l_query     varchar2(4000);',
'   l_sep       varchar2(1):=NULL;',
'   l_cnt       number;',
'   w           varchar2(4000); ',
'begin',
'  ascii_cols:= wwv_flow_utilities.string_to_table2(:F4300_P170_ASC_EXPORT_COLUMNS);',
'  l_query:=''select '';',
'  for i in 1..ascii_cols.count',
'  loop  	',
'    l_query:=l_query || l_sep || ''"''|| ascii_cols(i) ||''"'';',
'    l_sep   :='','';   ',
'  end loop;',
'  l_query := l_query || '' from "'' || :F4300_P150_SCHEMA || ''"."'' ||:F4300_P160_ASC_EXPORT_TABLE||''"'';',
'',
'  if :P170_WHERE_CLAUSE is not null then',
'     w := trim(:P170_WHERE_CLAUSE);',
'     if upper(substr(w,1,5)) = ''WHERE'' then',
'        w := substr(w,6);',
'     end if;',
'     l_query := l_query||'' where ''||:P170_WHERE_CLAUSE;',
'  end if;',
'',
'  l_cnt:=wwv_flow_load_data.dump_ascii (',
'             p_schema => :F4300_P150_SCHEMA,',
'             p_separator=> :F4300_P180_SEPARATOR,',
'             p_enclosed_by => :F4300_P180_ENCLOSED,',
'             p_inc_col_names => :F4300_P180_INC_COLUMN_NAME,',
'             p_query => l_query,',
'             p_mime_charset => :P180_FILE_CHARSET,',
'             p_file_format => :P180_FILE_FORMAT,',
'             p_file_name => lower(:F4300_P160_ASC_EXPORT_TABLE));',
'  wwv_flow.g_excel_format := true;',
'  wwv_flow.g_page_text_generated := true;',
'  wwv_flow.g_unrecoverable_error := true;',
'end;'))
,p_process_error_message=>'無法匯出資料.'
,p_process_when_button_id=>wwv_flow_api.id(27163504640971637.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(698584798226530530.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(27163504640971637.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(196670309198268035.4307)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P150_SCHEMA);'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(196684208130390717.4307)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P150_SCHEMA);'
);
end;
/
prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 資料'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 資料'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'	function p200_ClobUpload(){',
'		var clob = new apex.ajax.clob(p200_ClobFinish);',
'		clob._set($x(''F4300_P200_EXCEL_DATA'').value);',
'		return;',
'	}',
'	function p200_ClobFinish(){',
'			if(p.readyState == 1){',
'			}else if(p.readyState == 2){',
'			}else if(p.readyState == 3){',
'			}else if(p.readyState == 4){',
'					$x(''F4300_P200_EXCEL_DATA'').value=" "',
'					doSubmit(''NEXT'');',
'					return;',
'			}else{return false;}',
'	}',
'</script>',
'',
''))
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21272823578416828.4307)
,p_plug_name=>'全球化'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676055535817183.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112725909100220750.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(208585513765537107.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>從試算表程式 (例如 Microsoft Excel) 複製要載入的資料, 然後貼到「資料」欄位中.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112730325478228304.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(112716503290208213.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208614921852674151.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937840947040120496.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208614921852674151.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(112736203452235067.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208614921852674151.4307)
,p_button_name=>'NEXT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:p200_ClobUpload();'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204374305269310796.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208614921852674151.4307)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(51886005938559488.4307)
,p_branch_action=>'210'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(112736203452235067.4307)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(204374726822310798.4307)
,p_branch_action=>'230'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(204374305269310796.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4208210436082721.4307)
,p_name=>'F4300_P200_SEPARATOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112725909100220750.4307)
,p_item_default=>','
,p_prompt=>'區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_display_when=>'F4300_P230_LOAD_TYPE'
,p_display_when2=>'EXCEL'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>指定資料欄區隔符號字元. 請使用 <strong>\t</strong> 當成 Tab 區隔符號.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_reference_id=>3832614597433912.4307
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4209527059087470.4307)
,p_name=>'F4300_P200_ENCLOSED_BY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112725909100220750.4307)
,p_prompt=>'外加符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_display_when=>'F4300_P230_LOAD_TYPE'
,p_display_when2=>'EXCEL'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>指定選擇性外加符號字元.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_reference_id=>3832902320433912.4307
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21275331197419000.4307)
,p_name=>'P200_CURRENCY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(21272823578416828.4307)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_return_val varchar2(30) := ''$'';',
'begin',
'    for c1 in (select value',
'                 from nls_session_parameters',
'                where parameter = ''NLS_CURRENCY'') loop',
'        l_return_val := c1.value;',
'        exit;',
'    end loop;',
'    --',
'    return l_return_val;',
'end;     '))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'貨幣符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料包含國際貨幣符號, 請在此處輸入該符號.</p>',
'<p>例如, 如果您的資料包含 "&euro;1,234.56" 或 "&yen;1,234.56", 請輸入 "&euro;" 或 "&yen;".  否則, 資料將無法正確載入.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21710714544355494.4307)
,p_name=>'P200_GROUP_SEPARATOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(21272823578416828.4307)
,p_item_default=>'return wwv_flow.get_nls_group_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'群組區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>群組區隔符號是一個區隔整數群組 (例如顯示千分位與百萬分位) 的字元.</p>',
'<p>任何字元皆可當成群組區隔符號. 指定的字元必須是單位元組, 而且群組區隔符號必須與其他十進位字元不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21713607056362785.4307)
,p_name=>'P200_DECIMAL_CHARACTER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(21272823578416828.4307)
,p_item_default=>'return wwv_flow.get_nls_decimal_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'十進位字元'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>十進位字元可區隔整數和數字的小數部分.</p>',
'<p> 任何字元皆可當成十進位字元. 指定的字元必須是單位元組, 而且十進位字元必須與群組區隔符號不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112740117271247331.4307)
,p_name=>'F4300_P200_EXCEL_DATA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112725909100220750.4307)
,p_prompt=>'資料'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(716620262276799717.4307)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--stretch'
,p_help_text=>'複製並貼上要從試算表程式載入的資料.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112749902593269315.4307)
,p_name=>'F4300_P200_IS_FIELD_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112725909100220750.4307)
,p_item_default=>'Y'
,p_prompt=>'第一個資料列含有資料欄名稱'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ISCOLUMN.NAME.TEXT'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<span class="instructiontext">''||',
'wwv_flow_lang.system_message(''F4300_INSTRUCT_TEXT'')||''</span>'' d, ''Y'' r from dual'))
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'class="fielddataboldl"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料含有第一個資料列中的資料欄名稱, 請選取此選項. 下列為一範例:</p>',
'<pre>',
'Name     Salary     Commission',
'Clark    1000       10',
'Scott    2000       20',
'</pre>',
'',
'',
'',
'<pre>',
'',
'',
'',
'Name     Salary     Commission',
'',
'',
'',
'Clark    1000       10',
'',
'',
'',
'Scott    2000       20',
'',
'',
'',
'</pre>'))
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(49528010062670927.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P200_IS_FIELD_NAME'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'F4300_P200_IS_FIELD_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(118390630315447740.4307)
,p_validation_name=>'data not null'
,p_validation_sequence=>10
,p_validation=>'F4300_P200_EXCEL_DATA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定資料.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(112740117271247331.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4210720957095218.4307)
,p_validation_name=>'separator not null'
,p_validation_sequence=>30
,p_validation=>'F4300_P200_SEPARATOR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定區隔符號.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P230_LOAD_TYPE'
,p_validation_condition2=>'CSV'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(112736203452235067.4307)
,p_associated_item=>wwv_flow_api.id(4208210436082721.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937841145052122532.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937840947040120496.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937841453405122532.4307)
,p_event_id=>wwv_flow_api.id(937841145052122532.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117624930761654964.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare  ',
'  l_first_row_is_col_name boolean := false;',
'  q varchar2(32767) := null;',
'  l_data clob := empty_clob();',
'begin',
'  select clob001 into l_data from apex_collections where collection_name=''CLOB_CONTENT'';',
'  if :F4300_P200_IS_FIELD_NAME = ''Y'' then',
'    l_first_row_is_col_name := true;',
'  end if;',
'  wwv_flow.debug(''*** check *** ''||:F4300_P200_SEPARATOR);',
'  wwv_flow_load_excel_data.get_table_info (',
'   p_string                 => l_data,',
'   p_separator              => lower(nvl(:F4300_P200_SEPARATOR,''\t'')),',
'   p_enclosed_by            => :F4300_P200_ENCLOSED_BY,   ',
'   p_first_row_is_col_name  => l_first_row_is_col_name,',
'   p_currency               => :P200_CURRENCY,',
'   p_numeric_chars          => :P200_DECIMAL_CHARACTER||:P200_GROUP_SEPARATOR,',
'   p_load_type              => ''EXCEL''',
'   );',
'end;'))
,p_process_error_message=>'載入 Excel 資料時發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(112736203452235067.4307)
);
end;
/
prompt --application/pages/page_00210
begin
wwv_flow_api.create_page(
 p_id=>210.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 表格特性'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 表格特性'
,p_html_page_onload=>'onload="f_ImportDataTypeOnload()"'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'<!--',
'',
'function f_ImportDataTypeOnload(){',
'var lRow = html_GetElement(''importData'').rows[1];',
'var lSelects = lRow.getElementsByTagName(''SELECT'');',
'var lLength = lSelects.length;',
'for(var i=0;i<lLength;i++){lSelects[i].onchange()}',
'return;',
'}',
'',
'',
'function f_ImportDataType(pThis,pThat){  ',
'var lCheckValues = new Array(''NUMBER'',''CLOB'',''DATE'',''BINARY_FLOAT'',''BINARY_DOUBLE'');',
'  var lTest2 = html_DisableOnValue(pThis,lCheckValues,pThat);',
'  html_GetElement(pThat).disabled = false;',
'  if(lTest2){',
'    html_GetElement(pThat).setAttribute(''onfocus'',''this.blur()'');',
'    }else{',
'    html_GetElement(pThat).setAttribute(''onfocus'','''');',
'  }',
'',
'}',
'//-->',
'</script>'))
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112768526710303685.4307)
,p_plug_name=>'設定表格特性'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="overflow: auto; width: 100%; padding: 12px;"'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'wwv_flow_load_data.display_ntable_property(p_collection_name => ''EXCEL_IMPORT'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112771111398310853.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(112716503290208213.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112785418706337777.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#:a-Form--fixedLabels'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:100%"'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>您可以在此頁面預覽表格的定義方式. 請輸入表格名稱, 然後複查資料欄名稱、資料類型和資料欄長度. 若要上傳資料欄, 請選取<b>是</b>或<b>否</b>.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208626820868128034.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937846775380244224.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208626820868128034.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116940415820894908.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208626820868128034.4307)
,p_button_name=>'Next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(112777203593320251.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208626820868128034.4307)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(116940829853894912.4307)
,p_branch_action=>'220'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(116940415820894908.4307)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(112777626990320254.4307)
,p_branch_action=>'200'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(112777203593320251.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77784300806046762.4307)
,p_name=>'P210_PRESERVE_CASE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112785418706337777.4307)
,p_prompt=>'維持原來大小寫樣式'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'PRESERVE.CASE.Y'
,p_lov=>'.'||wwv_flow_api.id(87931511182663028)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100051613844477110.4307)
,p_name=>'F4300_P210_DUMMY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112785418706337777.4307)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112792123870350640.4307)
,p_name=>'F4300_P200_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112785418706337777.4307)
,p_prompt=>'綱要'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CREATE_TABLE_SCHEMAS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  q varchar2(32767) := null;',
'begin',
'  q:=q||''select wwv_flow_escape.html(c.schema) d, c.schema v '';',
'  q:=q||''from   wwv_flow_company_schemas c, '';',
'  q:=q||''       wwv_flow_fnd_user u '';',
'  q:=q||''where  c.security_group_id = :flow_security_group_id and '';',
'  q:=q||''       u.security_group_id = :flow_security_group_id and '';',
'  q:=q||''       u.user_name = :flow_user and '';',
'  q:=q||''       (u.ALLOW_ACCESS_TO_SCHEMAS is null or '';',
'  q:=q||''        instr('''':''''||u.ALLOW_ACCESS_TO_SCHEMAS||'''':'''','''':''''||c.schema||'''':'''')>0) '';',
'  if wwv_flow_global.g_xe then',
'    q:=q||''  and exists (select null '';',
'    q:=q||''              from sys.dba_sys_privs '';',
'    q:=q||''              where privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''') '';',
'    q:=q||''              and grantee = c.schema '';',
'    q:=q||''              union all '';',
'    q:=q||''              select null '';',
'    q:=q||''              from sys.dba_sys_privs s, sys.dba_role_privs r '';',
'    q:=q||''              where r.granted_role=s.grantee '';',
'    q:=q||''              and r.grantee = c.schema '';',
'    q:=q||''              and s.privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''')) '';',
'  else',
'    q:=q||''  and exists (select null '';',
'    q:=q||''               from sys.dba_sys_privs '';',
'    q:=q||''               where privilege in (''''CREATE TABLE'''',''''CREATE ANY TABLE'''') '';',
'    q:=q||''                 and grantee = c.schema)     '';',
'  end if;         ',
'  q:=q||''  and exists (select null '';',
'  q:=q||''                from sys.dba_users '';',
'  q:=q||''               where username = c.schema) '';',
'  q:=q||''order by 1 '';',
'  ',
'  return q;',
'end;'))
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_read_only_when=>'wwv_flow_global.g_xe'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_read_only_disp_attr=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'選取您要建立並將資料載入其中的資料庫綱要.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112794014812354843.4307)
,p_name=>'F4300_P200_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112785418706337777.4307)
,p_prompt=>'表格名稱'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>2000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'<div class="htmldbInfoBodyP">指定您要建立的表格名稱. 依照預設, 所有表格名稱會轉換成大寫. 選取<span class="fielddatabold">維持原來大小寫樣式</span>來覆寫此預設行為.</div>'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(77787115351050931.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P200_TABLE_NAME'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'upper(replace(wwv_flow_utilities.remove_spaces(:F4300_P200_TABLE_NAME),chr(32),''_''))'
,p_compute_when=>'P210_PRESERVE_CASE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100053005864480800.4307)
,p_computation_sequence=>20
,p_computation_item=>'F4300_P210_DUMMY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_col_name varchar2(4000) := null;',
'  ',
'  function primary_key(',
'    p_primary_key_value in number,',
'    p_index             in number )',
'    return varchar2',
'  is',
'    l_return_value varchar2(4000) := NULL;',
'  begin',
'    if p_primary_key_value is not null then',
'      if p_primary_key_value = p_index then',
'        l_return_value := ''<INPUT TYPE="radio" NAME="f03" VALUE="''||p_primary_key_value||''" checked>'';',
'      else',
'        l_return_value := ''<INPUT TYPE="radio" NAME="f03" VALUE="''||p_index||''">'';',
'      end if;',
'    end if;',
'    return l_return_value;',
'  exception',
'    when others then',
'        return ''<INPUT TYPE="radio" NAME="f03" VALUE="''||p_index||''">'';',
'  end;',
'begin',
'',
'for i in 1..wwv_flow.g_f06.count loop',
'  if :P210_PRESERVE_CASE is null then',
'    l_col_name := upper(wwv_flow_utilities.remove_spaces(wwv_flow.g_f01(i)));',
'  else',
'    l_col_name := wwv_flow_utilities.remove_spaces(wwv_flow.g_f01(i));',
'  end if;',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 1,',
'     p_attr_value => l_col_name',
'     );',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 2,',
'     p_attr_value => wwv_flow.g_f02(i)',
'     );',
'',
'  --wwv_flow_collection.update_member_attribute (',
'  --   p_collection_name => ''EXCEL_IMPORT'',',
'  --   p_seq => wwv_flow.g_f06(i),',
'  --   p_attr_number => 3,',
'  --   p_attr_value => primary_key(wwv_flow.g_f03(1),i)',
'  --   );',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 4,',
'     p_attr_value => wwv_flow.g_f04(i)',
'     );',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 5,',
'     p_attr_value => wwv_flow.g_f05(i)',
'     );',
'     ',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f06(i),',
'     p_attr_number => 6,',
'     p_attr_value => wwv_flow.g_f07(i)',
'     ); ',
'end loop;',
'',
'return ''true'';',
'exception when others then',
'	raise_application_error (-20001,''f05=''||wwv_flow_utilities.table_to_string2(wwv_flow.g_f05)||'' f06=''||',
'	wwv_flow_utilities.table_to_string2(wwv_flow.g_f06));',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(114893927053188792.4307)
,p_validation_name=>'column name not null, not > 30'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'  for i in 1..wwv_flow.g_f01.count loop',
'    if wwv_flow.g_f01(i) is not null then',
'      if length(wwv_flow.g_f01(i)) > 30 then',
'        return wwv_flow_lang.system_message(''F4300.COL_NAMES_NOT_LONGER_THAN_30'');',
'      end if;',
'    else',
'      return wwv_flow_lang.system_message(''F4300.COL_NAMES_NOT_NULL'');',
'    end if;',
'  end loop;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'資料欄名稱錯誤.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(118154731285520466.4307)
,p_validation_name=>'table name not > 30'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if length(:F4300_P200_TABLE_NAME) > 30 then',
'',
'  return wwv_flow_lang.system_message(''F4300.TABLE_NAMES_NOT_LONGER_THAN_30'');',
'',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'表格名稱太長.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(112794014812354843.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(91385502544995259.4307)
,p_validation_name=>'column length not zero or null'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'  for i in 1..wwv_flow.g_f05.count loop',
'    if wwv_flow.g_f05(i) is not null then',
'      if wwv_flow.g_f05(i) = 0 then',
'        return wwv_flow_lang.system_message(''F4300.COL_LENGTH_NOT_ZERO'');',
'      end if;',
'    else',
'      return wwv_flow_lang.system_message(''F4300.COL_LENGTH_NOT_NULL'');',
'    end if;',
'  end loop;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'「資料欄長度」有錯誤.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(114895819289192431.4307)
,p_validation_name=>'table name not null'
,p_validation_sequence=>40
,p_validation=>'F4300_P200_TABLE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定表格名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(112794014812354843.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(115047225043539180.4307)
,p_validation_name=>'cannot have same table name'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_load_excel_data.table_exists(',
'  p_schema => :F4300_P200_OWNER,',
'  p_table_name => wwv_flow_utilities.remove_spaces(:F4300_P200_TABLE_NAME)',
'  ) then',
'  return wwv_flow_lang.system_message(''F4300.F4500.TABLE_ALREADY_EXISTS'');',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'現有物件已經使用此名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(112794014812354843.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(117872306579291939.4307)
,p_validation_name=>'at least one upload selected'
,p_validation_sequence=>70
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_no_count number := 0;',
'',
'begin',
'',
'  for i in 1..wwv_flow.g_f04.count loop',
'',
'    if wwv_flow.g_f04(i) = ''N'' then',
'',
'      l_no_count := l_no_count + 1;',
'',
'    end if;',
'',
'  end loop;',
'',
'',
'',
'  if l_no_count = wwv_flow.g_f04.count then',
'',
'    return false;',
'',
'  else',
'',
'    return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'至少必須指定一個要包括在新表格中的資料欄.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(289728718255300356.4307)
,p_validation_name=>'reserved name'
,p_validation_sequence=>80
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_sw_util.is_database_reserved_word(p_word=>:F4300_P200_TABLE_NAME) then',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'指定的表格名稱是一個 Oracle 保留字.  請選擇其他名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(112794014812354843.4307)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(291055332677788667.4307)
,p_validation_name=>'column name reserved word'
,p_validation_sequence=>90
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_message varchar2(32000);',
'begin',
'    for i in 1..wwv_flow.g_f01.count loop',
'        if wwv_flow_sw_util.is_database_reserved_word(p_word=>upper(wwv_flow.g_f01(i))) then',
'            if l_message is not null then',
'                l_message := l_message || '', '';',
'            end if;',
'            l_message := l_message || upper(wwv_flow.g_f01(i));',
'        end if;',
'    end loop;',
'    --',
'    if l_message is not null then',
'        l_message := wwv_flow_lang.system_message(''F4000.COLUMN_NAME_RESERVED_WORD'') || '' ('' || l_message || '')'';',
'    end if;',
'    return l_message;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'指定的資料欄名稱是一個 Oracle 保留字.  請選擇其他名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(25730909453566476.4307)
,p_validation_name=>'F4300_P200_OWNER'
,p_validation_sequence=>100
,p_validation=>'F4300_P200_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定綱要.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(116940415820894908.4307)
,p_associated_item=>wwv_flow_api.id(112792123870350640.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(460448021945064666.4307)
,p_validation_name=>'PLSQL'
,p_validation_sequence=>110
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (select count(*) thecount ',
'             from wwv_flow_collections',
'            where collection_name = ''EXCEL_IMPORT''',
'            minus',
'           select count(distinct c001)',
'             from wwv_flow_collections',
'            where collection_name = ''EXCEL_IMPORT'') loop',
'    -- A row exists which means there is at least one duplicate column name',
'    return FALSE;',
'end loop;',
'--',
'return TRUE;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'一或多個資料欄名稱重複.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(116940415820894908.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937847166341246211.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937846775380244224.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937847496378246211.4307)
,p_event_id=>wwv_flow_api.id(937847166341246211.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432757616574114106.4307)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Schema'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :F4300_P200_OWNER is not null then',
'wwv_flow_sw_api.check_priv(:F4300_P200_OWNER);',
'end if;'))
,p_process_error_message=>'無效的綱要'
);
end;
/
prompt --application/pages/page_00220
begin
wwv_flow_api.create_page(
 p_id=>220.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 主索引鍵'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 主索引鍵'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117056604391055559.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>wwv_flow_api.id(7082409118250737.4307)
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_query_show_nulls_as=>' - '
,p_plug_query_col_allignments=>'L:L:L:L:L:L:L'
,p_plug_query_sum_cols=>'::::::'
,p_plug_query_number_formats=>'::::::'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<p>您可以使用此頁面來指定表格的主索引鍵.  如果資料集中沒有任何單一資料欄適合作為主索引鍵, 則請指定新資料欄作為主索引鍵. 主索引鍵是用來作為表格中資料列的唯一識別.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117059228102059736.4307)
,p_plug_name=>'導覽'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(112716503290208213.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208627826540139171.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937848432173255988.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208627826540139171.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117073012899083351.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208627826540139171.4307)
,p_button_name=>'LOAD_SPREADSHEET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'載入資料'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117070800779079776.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208627826540139171.4307)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117073412886083354.4307)
,p_branch_action=>'11'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(117073012899083351.4307)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(29278228032445971.4307)
,p_branch_action=>'220'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'P200_PK_TYPE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(52010014229160977.4307)
,p_branch_action=>'f?p=&FLOW_ID.:220:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(117071203531079778.4307)
,p_branch_action=>'210'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(117070800779079776.4307)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29225226404227933.4307)
,p_name=>'P200_PK1_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_prompt=>'限制條件名稱'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'命名主索引鍵限制條件.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29231303248249589.4307)
,p_name=>'P200_PK_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_item_default=>'NEW_SEQUENCE'
,p_prompt=>'產生主索引鍵:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'PK_TYPES'
,p_lov=>'.'||wwv_flow_api.id(29232624018252340)||'.'
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'選擇要如何運算主索引鍵. 或者, 選擇不設定主索引鍵的值.'
,p_attribute_01=>'1'
,p_attribute_02=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29236325197265446.4307)
,p_name=>'P200_EXISTING_SEQUENCE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_prompt=>'順序'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(sequence_name) a, sequence_name b from sys.dba_sequences ',
'where sequence_owner = :F4300_P200_OWNER',
'order by sequence_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取順序 -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_display_when=>':P200_PK_TYPE = ''EXISTING_SEQUENCE'''
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'指定將用來產生主索引鍵值之現有資料庫順序的名稱.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29241232039286358.4307)
,p_name=>'P200_NEW_SEQUENCE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_prompt=>'順序'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_display_when=>':P200_PK_TYPE = ''NEW_SEQUENCE'''
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'指定為了產生此新表格主索引鍵而建立之新資料庫順序的名稱.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52007705655139616.4307)
,p_name=>'P200_PK1_OPTION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_item_default=>'NEW_KEY'
,p_prompt=>'主索引鍵來源:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'USE.EXISTING.COL'
,p_lov=>'.'||wwv_flow_api.id(87933423434676001)||'.'
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'您可以選取現有的資料欄或新增資料欄作為主索引鍵.'
,p_attribute_01=>'1'
,p_attribute_02=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52012902417204955.4307)
,p_name=>'P200_PK1_2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_item_default=>'ID'
,p_prompt=>'新主索引鍵資料欄'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_display_when=>'P200_PK1_OPTION'
,p_display_when2=>'NEW_KEY'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'輸入用以識別表格中之資料列的新資料欄名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117095028927104885.4307)
,p_name=>'P220_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_use_cache_before_default=>'NO'
,p_prompt=>'綱要:'
,p_source=>'F4300_P200_OWNER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'擁有表格的綱要.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117097720517108862.4307)
,p_name=>'P220_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_use_cache_before_default=>'NO'
,p_prompt=>'表格名稱:'
,p_source=>'F4300_P200_TABLE_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'要載入資料之表格的名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117102827837120664.4307)
,p_name=>'P200_PK1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(117056604391055559.4307)
,p_prompt=>'主索引鍵'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c001)||''(''||c002||'')'' a, c001',
'  from wwv_flow_collections',
' where collection_name = ''EXCEL_IMPORT'' and c001 is not null',
' order by seq_id',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取主索引鍵 -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_display_when=>'P200_PK1_OPTION'
,p_display_when2=>'EXISTING_KEY'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'指定要作為您表格之主索引鍵的資料欄. 主索引鍵是一個唯一識別某個資料列的資料欄. Oracle 並沒有要求您的表格一定要有主索引鍵, 但是此精靈會要求您指定主索引鍵.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(13590021101989074.4307)
,p_computation_sequence=>10
,p_computation_item=>'P200_PK1_2'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_pk    varchar2(40) := null;',
'begin',
'    for c1 in (select c001',
'                 from wwv_flow_collections',
'                where collection_name = ''EXCEL_IMPORT''',
'                  and upper(c001) = ''ID'') ',
'    loop',
'        for i in 1..10 loop',
'            for c2 in (select c001',
'                         from wwv_flow_collections',
'                        where collection_name = ''EXCEL_IMPORT''',
'                          and upper(c001) = ''ID''||i) ',
'            loop',
'                l_pk := ''ID'';',
'            end loop;--c2',
'            if l_pk is null then',
'                return ''ID''||i;',
'            else',
'                l_pk := null;',
'            end if;',
'        end loop;--i',
'    end loop;--c1',
'    return ''ID'';',
'end;'))
,p_compute_when_type=>'%null%'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29253014255347439.4307)
,p_computation_sequence=>20
,p_computation_item=>'P200_PK1'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'   for c1 in (',
'     select c001',
'     from wwv_flow_collections',
'     where collection_name = ''EXCEL_IMPORT''',
'     and upper(c001) = ''ID''',
'   ) loop',
'     return c1.c001;',
'   end loop;',
'   for c1 in (',
'     select c001',
'     from wwv_flow_collections',
'     where collection_name = ''EXCEL_IMPORT''',
'     and upper(c001) like ''%ID''',
'   ) loop',
'     return c1.c001;',
'   end loop;',
'end;'))
,p_compute_when=>'P200_PK1'
,p_compute_when_type=>'ITEM_IS_NULL_OR_ZERO'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29250213170318666.4307)
,p_computation_sequence=>30
,p_computation_item=>'P200_NEW_SEQUENCE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_sw_util.generate_seq_name (',
'    p_owner => :F4300_P200_OWNER,',
'    p_name  => replace(:F4300_P200_TABLE_NAME,'' '',''_'') )'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29248007498307620.4307)
,p_computation_sequence=>40
,p_computation_item=>'P200_PK1_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_sw_util.generate_pk_name (',
'    p_owner => :F4300_P200_OWNER,',
'    p_name  => replace(:F4300_P200_TABLE_NAME,'' '',''_'') )'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29254418196358029.4307)
,p_validation_name=>'SEQUENCE not null'
,p_validation_sequence=>10
,p_validation=>'P200_EXISTING_SEQUENCE'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'必須指定順序.'
,p_always_execute=>'N'
,p_validation_condition=>'P200_PK_TYPE'
,p_validation_condition2=>'EXISTING_SEQUENCE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(29236325197265446.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29266319281386761.4307)
,p_validation_name=>'PK_NAME available'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'if not wwv_flow_builder.is_valid_identifier(''"''||:P200_PK1_NAME||''"'') then',
'   return ',
'       wwv_flow_lang.system_message(''F4300.NOT_VALID_PK_NAME'',:P200_PK1_NAME);',
'end if;',
'    ',
'if not wwv_flow_sw_util.is_available_name(:P200_PK1_NAME, :P220_OWNER ) then',
'   return ',
'   wwv_flow_lang.system_message(''F4300.F4500.NAME_ALREADY_USED'',:P200_PK1_NAME);',
'end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'錯誤.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(29225226404227933.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52417430985005732.4307)
,p_validation_name=>'PK not null'
,p_validation_sequence=>30
,p_validation=>'P200_PK1'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'必須指定主索引鍵.'
,p_always_execute=>'N'
,p_validation_condition=>'P200_PK1_OPTION'
,p_validation_condition2=>'EXISTING_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(117102827837120664.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52419018303011469.4307)
,p_validation_name=>'PK not null'
,p_validation_sequence=>40
,p_validation=>'P200_PK1_2'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定主索引鍵.'
,p_always_execute=>'N'
,p_validation_condition=>'P200_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(52012902417204955.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52420808391018166.4307)
,p_validation_name=>'PK not > 30 chars'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if length(:P200_PK1_2) > 30 then',
'  return false;',
'end if;',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'「主索引鍵」資料欄名稱不能超過 30 個字元.'
,p_always_execute=>'N'
,p_validation_condition=>'P200_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52424804066054749.4307)
,p_validation_name=>'PK gen option needs to be auto'
,p_validation_sequence=>60
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P200_PK_TYPE = ''NOT_GENERATED'' then',
'  return false;',
'end if;',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'建立新主索引鍵時, 必須按順序產生「主索引鍵」.'
,p_always_execute=>'N'
,p_validation_condition=>'P200_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(29231303248249589.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29270400759419169.4307)
,p_validation_name=>'PK_NAME not null'
,p_validation_sequence=>70
,p_validation=>'P200_PK1_NAME'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須指定 PK 名稱.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(29225226404227933.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29274101928429039.4307)
,p_validation_name=>'SEQ_NAME available'
,p_validation_sequence=>80
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'if not wwv_flow_builder.is_valid_identifier(''"''||:P200_NEW_SEQUENCE||''"'') then',
'   return wwv_flow_lang.system_message(''F4300.F4500.NOT_VALID_SEQ_NAME'',:P200_NEW_SEQUENCE);',
'end if;',
'    ',
'if not wwv_flow_sw_util.is_available_name(:P200_NEW_SEQUENCE, :P220_OWNER ) then',
'   return wwv_flow_lang.system_message(''F4300.F4500.NAME_ALREADY_USED'',:P200_NEW_SEQUENCE);',
'end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'錯誤.'
,p_always_execute=>'N'
,p_validation_condition=>'P200_PK_TYPE'
,p_validation_condition2=>'NEW_SEQUENCE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(29241232039286358.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(48704226490898036.4307)
,p_validation_name=>'no duplicate PK col'
,p_validation_sequence=>90
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_cnt pls_integer := 0;',
'begin',
'    for c1 in (select count(c001) cnt',
'               from wwv_flow_collections',
'               where collection_name = ''EXCEL_IMPORT''',
'               and upper(c001) = upper(:P200_PK1_2))',
'    loop',
'      l_cnt := c1.cnt;',
'    end loop;',
'    if l_cnt > 0 then',
'      return wwv_flow_lang.system_message(''F4500.P602.DUP_COL_NAME'',:P200_PK1_2);',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'錯誤.'
,p_always_execute=>'N'
,p_validation_condition=>'P200_PK1_OPTION'
,p_validation_condition2=>'NEW_KEY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(117073012899083351.4307)
,p_associated_item=>wwv_flow_api.id(52012902417204955.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937848654142258327.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937848432173255988.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937848917746258327.4307)
,p_event_id=>wwv_flow_api.id(937848654142258327.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117113015507171948.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create table with new primary key'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare    ',
'  l_cnames     wwv_flow_global.vc_arr2;  ',
'  l_data_type  wwv_flow_global.vc_arr2;  ',
'  l_upload     wwv_flow_global.vc_arr2;',
'  l_max_length wwv_flow_global.vc_arr2;',
'  l_seq_name   varchar2(255) := null;',
'  l_pk1        varchar2(255) := :P200_PK1;',
'  l_pk1_name   varchar2(255) := null;',
'  i            pls_integer := 0;',
'begin   ',
'   if :P200_PK1_OPTION = ''NEW_KEY'' then',
'      i := i+1;',
'      l_pk1 := replace(wwv_flow_utilities.remove_spaces(:P200_PK1_2),chr(32),''_'');	',
'      if :P210_PRESERVE_CASE is null then',
'        l_pk1 := upper(l_pk1);',
'      end if;',
'      l_cnames(i) := l_pk1;',
'      l_data_type(i) := ''NUMBER'';',
'      l_upload(i) := ''Y'';',
'      l_max_length(i) := 30;',
'   end if;	 ',
'    ',
'   for c in (select * ',
'             from wwv_flow_collections ',
'             where collection_name=''EXCEL_IMPORT'') loop',
'     i := i+1; ',
'     l_cnames(i) := c.c001;',
'     l_data_type(i) := c.c002;',
'     l_upload(i) := c.c004;',
'     l_max_length(i) := c.c005;    ',
'   end loop;  ',
' ',
'  if :P200_PK_TYPE = ''NEW_SEQUENCE'' then    ',
'    l_seq_name := :P200_NEW_SEQUENCE;',
'    if :P210_PRESERVE_CASE is null then',
'      l_seq_name := upper(l_seq_name);',
'    end if;',
'  elsif :P200_PK_TYPE = ''EXISTING_SEQUENCE'' then',
'    l_seq_name := :P200_EXISTING_SEQUENCE;',
'  else',
'    l_seq_name := NULL;',
'  end if;',
'  ',
' l_pk1_name := :P200_PK1_NAME;',
' if :P210_PRESERVE_CASE is null then',
'   l_pk1_name := upper(l_pk1_name);',
' end if;',
' wwv_flow_load_excel_data.create_table (',
'  p_schema        => :F4300_P200_OWNER,',
'  p_table_name    => wwv_flow_utilities.remove_spaces(:F4300_P200_TABLE_NAME),',
'  p_pk1           => l_pk1,',
'  p_pk1_name      => l_pk1_name,',
'  p_pk1_type      => :P200_PK_TYPE,',
'  p_seq_name      => l_seq_name,',
'  --',
'  p_cnames        => l_cnames,',
'  p_data_type     => l_data_type,  ',
'  p_upload        => l_upload,',
'  p_max_length    => l_max_length ',
'  );',
'end;'))
,p_process_error_message=>'建立表格發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(117073012899083351.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117884026167328458.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'insert data'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare      ',
'  l_first_row_is_col_name boolean := false;  ',
'  l_cnames        wwv_flow_global.vc_arr2;      ',
'  l_upload        wwv_flow_global.vc_arr2;  ',
'  i               number := 0;',
'  --',
'  l_data_type     wwv_flow_global.vc_arr2;',
'  l_data_format   wwv_flow_global.vc_arr2;',
'  l_parsed_data_format wwv_flow_global.vc_arr2;',
'  l_data               clob := empty_clob();',
'begin  ',
'  for c in (select * ',
'            from wwv_flow_collections ',
'            where collection_name=''EXCEL_IMPORT'') loop',
'    i := i + 1;',
'    l_cnames(i) := c.c001;    ',
'    l_upload(i) := c.c004; ',
'    l_data_type(i) := c.c002;  ',
'    l_data_format(i) := c.c006;',
'    l_parsed_data_format(i) := c.c027;   ',
'  end loop;  ',
'',
'  if :F4300_P200_IS_FIELD_NAME = ''Y'' then',
'    l_first_row_is_col_name := true;',
'  end if;',
'',
'  select clob001 into l_data from apex_collections where collection_name=''CLOB_CONTENT'';',
'',
'  wwv_flow_load_excel_data.load_excel_data (',
'   p_string      => l_data,',
'   p_cnames      => l_cnames,',
'   p_upload      => l_upload,',
'   p_schema      => :F4300_P200_OWNER,',
'   p_table       => wwv_flow_utilities.remove_spaces(:F4300_P200_TABLE_NAME),',
'   p_data_type   => l_data_type,',
'   p_data_format => l_data_format,',
'   p_parsed_data_format => l_parsed_data_format,',
'   p_separator   => lower(nvl(:F4300_P200_SEPARATOR,''\t'')),',
'   p_enclosed_by => :F4300_P200_ENCLOSED_BY,',
'   p_first_row_is_col_name => l_first_row_is_col_name,',
'   p_load_to               => :F4300_P230_LOAD_TO,',
'   p_currency              => :P200_CURRENCY,',
'   p_numeric_chars         => :P200_DECIMAL_CHARACTER||:P200_GROUP_SEPARATOR,',
'   p_load_type             => :F4300_P230_LOAD_TYPE',
'   );',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(117073012899083351.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(698584506824530528.4307)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_attribute_01=>'REQUEST'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117073012899083351.4307)
,p_process_success_message=>'資料已載入.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432758606662120691.4307)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P200_OWNER);'
,p_process_error_message=>'無效的綱要'
);
end;
/
prompt --application/pages/page_00230
begin
wwv_flow_api.create_page(
 p_id=>230.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 目標和方法'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 目標和方法'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23238502857624260.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(112716503290208213.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204342305194256542.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208631500137150436.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(755293959966836805.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208631500137150436.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204360203968291570.4307)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(208631500137150436.4307)
,p_button_name=>'Next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4107407002608653.4307)
,p_branch_action=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:18,19,21::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(204360203968291570.4307)
,p_branch_sequence=>10
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':F4300_P230_LOAD_TO = ''NEW'' and :F4300_P230_LOAD_FROM = ''UPLOAD'''
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101365129882269401.4307)
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:22,24,25::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(204360203968291570.4307)
,p_branch_sequence=>20
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':F4300_P230_LOAD_TO = ''EXIST'' and :F4300_P230_LOAD_FROM = ''UPLOAD'''
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7218508617368954.4307)
,p_branch_name=>'Go To Page 200'
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:200,210,220,240,260,270::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(204360203968291570.4307)
,p_branch_sequence=>30
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':F4300_P230_LOAD_TO = ''NEW'' and :F4300_P230_LOAD_FROM = ''PASTE'''
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7222330435375211.4307)
,p_branch_name=>'Go To Page 240'
,p_branch_action=>'f?p=&APP_ID.:240:&SESSION.::&DEBUG.:200,210,220,240,260,270::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(204360203968291570.4307)
,p_branch_sequence=>40
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':F4300_P230_LOAD_TO = ''EXIST'' and :F4300_P230_LOAD_FROM = ''PASTE'''
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4077631590265585.4307)
,p_name=>'F4300_P230_LOAD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(204342305194256542.4307)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4085714930308101.4307)
,p_name=>'F4300_P230_LOAD_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(204342305194256542.4307)
,p_item_default=>'NEW'
,p_prompt=>'載入至:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'TABLE.OPTION'
,p_lov=>'.'||wwv_flow_api.id(87922429003554589)||'.'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_escape_on_http_output=>'N'
,p_help_text=>'選擇要載入什麼資料. 如果您已經有資料庫表格, 請選擇「現有的表格」. 如果您要建立新表格, 請選擇「新表格」.'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4087612637316960.4307)
,p_name=>'F4300_P230_LOAD_FROM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(204342305194256542.4307)
,p_item_default=>'PASTE'
,p_prompt=>'載入自:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'LOAD.OPTION'
,p_lov=>'.'||wwv_flow_api.id(87921416882551159)||'.'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_escape_on_http_output=>'N'
,p_help_text=>'指定是否要從複製並貼上試算表資料的檔案上傳資料'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(144922211438995306.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P230_LOAD_TYPE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'EXCEL'
,p_compute_when=>'F4300_P230_LOAD_FROM'
,p_compute_when_text=>'PASTE'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(755294096977836806.4307)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(755293959966836805.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(755294125459836807.4307)
,p_event_id=>wwv_flow_api.id(755294096977836806.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00240
begin
wwv_flow_api.create_page(
 p_id=>240.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 表格擁有者和名稱'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 表格擁有者和名稱'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_step_template=>wwv_flow_api.id(716604580917788355.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204401222157339825.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>選取資料庫綱要和您要將資料載入其中之表格的名稱.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204716203535971465.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(204693724897946351.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208632630958159342.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937854111825355772.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208632630958159342.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204420610772359727.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208632630958159342.4307)
,p_button_name=>'Next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204423219430362194.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208632630958159342.4307)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(204421016156359729.4307)
,p_branch_action=>'270'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(204420610772359727.4307)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(204423618157362195.4307)
,p_branch_action=>'230'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(204423219430362194.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(204430218669387043.4307)
,p_name=>'F4300_P240_TABLE_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(204401222157339825.4307)
,p_prompt=>'表格擁有者'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LIST_SCHEMA_OWNERS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(c.schema) d, c.schema v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1',
''))
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_read_only_when=>'wwv_flow_global.g_xe'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_read_only_disp_attr=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'選擇擁有要將 Excel 資料載入其中之表格的資料庫綱要.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246102019809840383.4307)
,p_name=>'F4300_P250_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(204401222157339825.4307)
,p_prompt=>'表格名稱'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select table_name a, table_name b',
'from sys.dba_tables',
'where owner = :F4300_P240_TABLE_OWNER',
'and table_name not like ''BIN$%''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 選取表格 -'
,p_lov_null_value=>'0'
,p_lov_cascade_parent_items=>'F4300_P240_TABLE_OWNER'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'選擇您要將資料載入其中的資料庫表格. 依照預設, 所有表格名稱都會轉換成大寫. 選取<span class="fielddatabold">維持原來大小寫樣式</span>來覆寫此預設行為.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(204445117363402835.4307)
,p_validation_name=>'F4300_P240_TABLE_OWNER Not Null'
,p_validation_sequence=>10
,p_validation=>'F4300_P240_TABLE_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定「表格擁有者」.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(204430218669387043.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 16-APR-2002 11:44'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(249092017542126655.4307)
,p_validation_name=>'Table Name Must Be Selected'
,p_validation_sequence=>20
,p_validation=>'F4300_P250_TABLE_NAME'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'必須選取 #LABEL#.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P250_TABLE_NAME'
,p_validation_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_when_button_pressed=>wwv_flow_api.id(204420610772359727.4307)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(246102019809840383.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937854390691357948.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937854111825355772.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937854626445357948.4307)
,p_event_id=>wwv_flow_api.id(937854390691357948.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00260
begin
wwv_flow_api.create_page(
 p_id=>260.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428185632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204491026143474742.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#:a-Form--fixedLabels'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>您可以在此頁面預覽您資料的載入方式. 請比對資料庫資料欄名稱與資料中的資料欄是否相符. 若要將資料上傳至選取的表格, 請按一下<b>匯入資料</b>.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204502624837490516.4307)
,p_plug_name=>'定義資料欄對應'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="overflow: auto; width: 100%; padding: 12px;"'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_load_data.display_etable_property (',
'    p_table_owner     => :F4300_P240_TABLE_OWNER,',
'    p_table_name      => :F4300_P250_TABLE_NAME,',
'    p_collection_name => ''EXCEL_IMPORT''',
'    );'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(7082409118250737.4307)
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_query_show_nulls_as=>' - '
,p_plug_query_col_allignments=>'L:L:L:L:L:L:L'
,p_plug_query_sum_cols=>'::::::'
,p_plug_query_number_formats=>'::::::'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<p>若要上傳資料欄, 請選取<b>是</b>或<b>否</b>. 星號 (*) 表示必要的資料欄. 您可以使用「SQL 工作室」來修改表格屬性, 例如變更資料欄長度、設定非空值資料欄或變更資料欄類型.</p>'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204723028108975231.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(204693724897946351.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208634426933167651.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937859839834424223.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208634426933167651.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204499923557486442.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208634426933167651.4307)
,p_button_name=>'LOAD_SPREADSHEET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'載入資料'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204496812129483108.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208634426933167651.4307)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(204500300920486444.4307)
,p_branch_name=>'Go To Page 11'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(204499923557486442.4307)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(204497212696483110.4307)
,p_branch_action=>'270'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(204496812129483108.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3876124806580817.4307)
,p_name=>'F4300_P260_DUMMY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(204491026143474742.4307)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(204576022341643606.4307)
,p_name=>'F4300_P260_TABLE_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(204491026143474742.4307)
,p_prompt=>'綱要:'
,p_source=>'F4300_P240_TABLE_OWNER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'表格擁有者的名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(204580511127648778.4307)
,p_name=>'F4300_P260_TABLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(204491026143474742.4307)
,p_prompt=>'表格名稱:'
,p_source=>'F4300_P250_TABLE_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'要載入資料之表格的名稱'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3877004851584509.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P260_DUMMY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'for i in 1..wwv_flow.g_f04.count loop',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f04(i),',
'     p_attr_number => 1,',
'     p_attr_value => wwv_flow_utilities.remove_spaces(wwv_flow.g_f01(i))',
'     );',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f04(i),',
'     p_attr_number => 4,',
'     p_attr_value => wwv_flow.g_f02(i)',
'     );',
'',
'  wwv_flow_collection.update_member_attribute (',
'     p_collection_name => ''EXCEL_IMPORT'',',
'     p_seq => wwv_flow.g_f04(i),',
'     p_attr_number => 6,',
'     p_attr_value => wwv_flow.g_f05(i)',
'     );',
'end loop;',
'return ''true'';',
'',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1970910321700429.4307)
,p_validation_name=>'column name not null'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'',
'',
'  l_null_found number := 0;',
'',
'',
'',
'begin',
'',
'',
'',
'  for i in 1..wwv_flow.g_f01.count loop',
'',
'    if wwv_flow.g_f02(i)=''Y'' then',
'',
'      if replace(wwv_flow.g_f01(i),''%''||''null%'',null) is null then',
'',
'        l_null_found := l_null_found + 1;',
'',
'      end if;',
'',
'    end if;',
'',
'  end loop;',
'',
'',
'',
'',
'',
'  if l_null_found > 0 then',
'',
'    return false;',
'',
'  else',
'',
'    return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'資料欄名稱不能為空值.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1976413962729112.4307)
,p_validation_name=>'at least one upload selected'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_no_count number := 0;',
'',
'begin',
'',
'  for i in 1..wwv_flow.g_f02.count loop',
'',
'    if wwv_flow.g_f02(i) = ''N'' then',
'',
'      l_no_count := l_no_count + 1;',
'',
'    end if;',
'',
'  end loop;',
'',
'',
'',
'',
'',
'  if l_no_count = wwv_flow.g_f02.count then',
'',
'    return false;',
'',
'  else',
'',
'    return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'至少必須指定一個要包括的資料欄來上傳資料.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2246727491917184.4307)
,p_validation_name=>'not null columns must be loaded'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_not_null_error number := 0;',
'',
'  l_columns        varchar2(32767) := null;',
'',
'  l_not_null_cols  varchar2(32767) := null;',
'',
'  l_trigger_body   long;',
'',
'begin',
'',
'  l_columns := wwv_flow_utilities.table_to_string2(wwv_flow.g_f01);',
'',
'',
'',
'  -- get trigger body if it is before insert trigger on the selected table',
'',
'  for c1 in (select trigger_body',
'',
'             from sys.dba_triggers',
'',
'             where table_name = :F4300_P250_TABLE_NAME',
'',
'             and table_owner = :F4300_P240_TABLE_OWNER',
'',
'             and trigger_type like ''%BEFORE%''',
'',
'             and triggering_event like ''%INSERT%'')',
'',
'  loop',
'',
'     l_trigger_body := c1.trigger_body;',
'',
'  end loop;',
'',
'',
'',
'  -- get all not null columns',
'',
'  for c1 in (select column_name',
'',
'             from sys.dba_tab_columns',
'',
'             where table_name = :F4300_P250_TABLE_NAME',
'',
'             and owner = :F4300_P240_TABLE_OWNER',
'',
'             and nullable = ''N''',
'',
'             ) loop',
'',
'',
'',
'      for i in 1..wwv_flow.g_f01.count loop',
'',
'        -- If column names user selected is equal to not null columns,',
'',
'        -- user didn''t include to upload',
'',
'        -- and the column doesn''t have trigger, raise an error.',
'',
'        if (wwv_flow.g_f01(i) = c1.column_name) then',
'',
'          if wwv_flow.g_f02(i) = ''N'' then',
'',
'            if instr(nvl(UPPER(l_trigger_body),'' ''),c1.column_name) = 0 then',
'',
'              l_not_null_error := l_not_null_error + 1;',
'',
'              l_not_null_cols := l_not_null_cols||'',''||c1.column_name;',
'',
'            end if;',
'',
'          end if;',
'',
'        else',
'',
'          -- If user did not select not null columns,',
'',
'          -- and the column doesn''t have trigger',
'',
'          -- raise an error.',
'',
'          if instr(l_columns,c1.column_name) = 0 then',
'',
'            if instr(nvl(UPPER(l_trigger_body),'' ''),c1.column_name) = 0 then',
'',
'              l_not_null_error := l_not_null_error + 1;',
'',
'              l_not_null_cols := l_not_null_cols||'',''||c1.column_name;',
'',
'            end if;',
'',
'          end if;',
'',
'        end if;',
'',
'      end loop;',
'',
'  end loop;',
'',
'',
'',
'',
'',
'  if l_not_null_error > 0 then',
'',
'      return false;',
'',
'  else',
'',
'      return true;',
'',
'  end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&F4300_P240_TABLE_OWNER..&F4300_P250_TABLE_NAME. 中有 NOT NULL 資料欄. 選取上傳資料, 不會發生錯誤.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2416102541642929.4307)
,p_validation_name=>'duplicate column names'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_col       varchar2(32767) := null;',
'  l_duplicate boolean := true;',
'',
'begin',
'  for i in 1..wwv_flow.g_f01.count loop',
'    -- if column selected is to be uploaded, check for duplicate column selection',
'    if wwv_flow.g_f02(i) = ''Y'' then',
'        if instr('':''||nvl(l_col,'' '')||'':'','':''||wwv_flow.g_f01(i)||'':'') > 0 then',
'          l_duplicate := false;',
'        end if;',
'',
'        if i > 1 then',
'            l_col := '':'';',
'        end if;',
'        l_col := l_col||wwv_flow.g_f01(i);',
'    end if;',
'  end loop;',
'',
'  return l_duplicate;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'選取重複的資料欄名稱.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937860168589426014.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937859839834424223.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937860430093426015.4307)
,p_event_id=>wwv_flow_api.id(937860168589426014.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1998328769813398.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'insert data'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare  ',
'  l_first_row_is_col_name boolean := false;',
'  l_cnames                wwv_flow_global.vc_arr2;',
'  --',
'  l_data_types            wwv_flow_global.vc_arr2;',
'  l_parsed_data_format    wwv_flow_global.vc_arr2;',
'  j                       pls_integer := 0;',
'  l_data                  clob := empty_clob();',
'begin',
'  if :F4300_P270_IS_FIELD_NAME = ''Y'' then',
'    l_first_row_is_col_name := true;',
'  end if;',
'',
'  for i in 1..wwv_flow.g_f01.count loop',
'    l_cnames(i) := wwv_flow.g_f01(i);',
'    for c1 in (select data_type',
'               from sys.dba_tab_columns',
'               where owner = :F4300_P240_TABLE_OWNER',
'               and table_name = upper(:F4300_P250_TABLE_NAME)',
'               and column_name = wwv_flow.g_f01(i)',
'               order by column_id)',
'    loop',
'       l_data_types(i) := c1.data_type;    	',
'    end loop;  ',
'  end loop;',
'  ',
'  for c in (select * ',
'            from wwv_flow_collections ',
'            where collection_name=''EXCEL_IMPORT'') loop',
'    j := j + 1;    ',
'    l_parsed_data_format(j) := c.c027;   ',
'  end loop; ',
'',
'  select clob001 into l_data from apex_collections where collection_name=''CLOB_CONTENT'';',
'',
'  wwv_flow_load_excel_data.load_excel_data (',
'   p_string      => l_data,',
'   p_cnames      => l_cnames,',
'   p_upload      => wwv_flow.g_f02,',
'   p_schema      => :F4300_P240_TABLE_OWNER,',
'   p_table       => :F4300_P250_TABLE_NAME,',
'   p_data_type   => l_data_types,',
'   p_data_format => wwv_flow.g_f05,',
'   p_parsed_data_format => l_parsed_data_format,',
'   p_separator   => lower(nvl(:F4300_P270_SEPARATOR,''\t'')),',
'   p_enclosed_by => :F4300_P270_ENCLOSED_BY,',
'   p_first_row_is_col_name => l_first_row_is_col_name,',
'   p_load_to               => :F4300_P230_LOAD_TO,',
'   p_currency              => :P270_CURRENCY,',
'   p_numeric_chars         => :P270_DECIMAL_CHARACTER||:P270_GROUP_SEPARATOR,',
'   p_load_type             => :F4300_P230_LOAD_TYPE',
'   );',
'end;'))
,p_process_error_message=>'插入資料發生錯誤.'
,p_process_when_button_id=>wwv_flow_api.id(204499923557486442.4307)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(698584417528530527.4307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_attribute_01=>'REQUEST'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(204499923557486442.4307)
,p_process_success_message=>'資料已載入.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(432759525709126193.4307)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate Schema'
,p_process_sql_clob=>'wwv_flow_sw_api.check_priv(:F4300_P240_TABLE_OWNER);'
,p_process_error_message=>'無效的綱要'
);
end;
/
prompt --application/pages/page_00270
begin
wwv_flow_api.create_page(
 p_id=>270.4307
,p_user_interface_id=>wwv_flow_api.id(4969527595302343.4307)
,p_name=>'載入資料 - 資料'
,p_page_mode=>'MODAL'
,p_step_title=>'載入資料 - 資料'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215729525348581243)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'    var gTextArea = ''F4300_P270_EXCEL_DATA''; // set to textarea item name',
'',
'    function data_set(){',
'		var CLobTest = new apex.ajax.clob(function(){',
'		$x(gTextArea).value=" ";',
'		doSubmit(''NEXT'')});',
'        CLobTest._set($x(gTextArea).value);',
'    }',
'</script>'))
,p_step_template=>wwv_flow_api.id(716613771837788376.4307)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'resizable:true,minWidth:500,minHeight:400'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEUTL/sql_utl_imprt.htm'
,p_last_upd_yyyymmddhh24miss=>'20151205181304'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21176307696090495.4307)
,p_plug_name=>'全球化'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676055535817183.4307)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204523926135583458.4307)
,p_plug_name=>'載入資料'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_plug_header=>'<p>從試算表程式 (例如 Microsoft Excel) 複製要匯入的資料, 然後貼到「資料」欄位中.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204526605078583471.4307)
,p_plug_name=>'Navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716676747173817184.4307)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(204693724897946351.4307)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(716635374633805444.4307)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(208636709187181466.4307)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(716643236475817156.4307)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937854870258362997.4307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(208636709187181466.4307)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616681872794730.4307)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204524413345583460.4307)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(208636709187181466.4307)
,p_button_name=>'Next'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(716616877554794734.4307)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'下一頁'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:data_set();'
,p_icon_css_classes=>'icon-left-chevron icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(204524712263583462.4307)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(208636709187181466.4307)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388298732478079235.4307)
,p_button_image_alt=>'上一頁'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(204526930972583473.4307)
,p_branch_action=>'260'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'NEXT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(204527202242583475.4307)
,p_branch_action=>'240'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(204524712263583462.4307)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4182706815845162.4307)
,p_name=>'F4300_P270_SEPARATOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(204523926135583458.4307)
,p_item_default=>','
,p_prompt=>'區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_display_when=>'F4300_P230_LOAD_TYPE'
,p_display_when2=>'EXCEL'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716620116614799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>指定資料欄區隔符號字元. 請使用 <strong>\t</strong> 當成 Tab 區隔符號.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_reference_id=>3832614597433912.4307
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4184502444853276.4307)
,p_name=>'F4300_P270_ENCLOSED_BY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(204523926135583458.4307)
,p_prompt=>'外加符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_display_when=>'F4300_P230_LOAD_TYPE'
,p_display_when2=>'EXCEL'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>指定選擇性外加符號字元.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_reference_id=>3832902320433912.4307
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21177230552097084.4307)
,p_name=>'P270_CURRENCY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(21176307696090495.4307)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_return_val varchar2(30) := ''$'';',
'begin',
'    for c1 in (select value',
'                 from nls_session_parameters',
'                where parameter = ''NLS_CURRENCY'') loop',
'        l_return_val := c1.value;',
'        exit;',
'    end loop;',
'    --',
'    return l_return_val;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'貨幣符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料包含國際貨幣符號, 請在此處輸入該符號.</p>',
'<p>例如, 如果您的資料包含 "&euro;1,234.56" 或 "&yen;1,234.56", 請輸入 "&euro;" 或 "&yen;".  否則, 資料將無法正確載入.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21863704163128428.4307)
,p_name=>'P270_GROUP_SEPARATOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(21176307696090495.4307)
,p_item_default=>'return wwv_flow.get_nls_group_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'群組區隔符號'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>群組區隔符號是一個區隔整數群組 (例如顯示千分位與百萬分位) 的字元.</p>',
'<p>任何字元皆可當成群組區隔符號. 指定的字元必須是單位元組, 而且群組區隔符號必須與其他十進位字元不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21865509835139517.4307)
,p_name=>'P270_DECIMAL_CHARACTER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(21176307696090495.4307)
,p_item_default=>'return wwv_flow.get_nls_decimal_separator;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'十進位字元'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>1
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619902812799716.4307)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>十進位字元可區隔整數和數字的小數部分.</p>',
'<p> 任何字元皆可當成十進位字元. 指定的字元必須是單位元組, 而且十進位字元必須與群組區隔符號不同. 字元可以是空格, 但不能是數字字元或下列任一字元:</p>',
'<ul class="noIndent">',
'<li>加號 (+)</li>',
'<li>連字號 (-)</li> ',
'<li>小於符號 (<)</li>',
'<li>大於符號 (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(204525129697583464.4307)
,p_name=>'F4300_P270_EXCEL_DATA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(204523926135583458.4307)
,p_prompt=>'資料'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(716620262276799717.4307)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--stretch'
,p_help_text=>'您最多只能將 30KB 的資料貼到此欄位中.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(204525430553583465.4307)
,p_name=>'F4300_P270_IS_FIELD_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(204523926135583458.4307)
,p_item_default=>'Y'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ISCOLUMN.NAME.TEXT'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<span class="instructiontext">''||',
'wwv_flow_lang.system_message(''F4300_INSTRUCT_TEXT'')||''</span>'' d, ''Y'' r from dual'))
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'class="fielddataboldl"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(716619812724799715.4307)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>如果您的資料包含第一個資料列的資料欄名稱, 請選取此方塊.</p>',
'',
'',
'',
'<pre>',
'',
'',
'',
'Name     Salary     Commission',
'',
'',
'',
'Clark    1000       10',
'',
'',
'',
'Scott    2000       20',
'',
'',
'',
'</pre>'))
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(49537626170713419.4307)
,p_computation_sequence=>10
,p_computation_item=>'F4300_P270_IS_FIELD_NAME'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'F4300_P270_IS_FIELD_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4186717812867171.4307)
,p_validation_name=>'separator not null'
,p_validation_sequence=>10
,p_validation=>'F4300_P270_SEPARATOR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定區隔符號.'
,p_always_execute=>'N'
,p_validation_condition=>'F4300_P230_LOAD_TYPE'
,p_validation_condition2=>'CSV'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(4182706815845162.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(83593200492080009.4307)
,p_validation_name=>'data cannot be > 30KB'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if length(:F4300_P270_EXCEL_DATA) > 30000 then',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'貼上的資料超過 30KB.  請將檔案儲存為逗號區隔 (csv) 或定位區隔的格式. 然後上傳檔案來載入資料.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(204527804107583477.4307)
,p_validation_name=>'data not null'
,p_validation_sequence=>30
,p_validation=>'F4300_P270_EXCEL_DATA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'必須指定資料.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(204525129697583464.4307)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937856058957374906.4307)
,p_name=>'cancel dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937854870258362997.4307)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937856350408374907.4307)
,p_event_id=>wwv_flow_api.id(937856058957374906.4307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(204528110232583479.4307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare  ',
'  l_first_row_is_col_name boolean := false;',
'  l_data clob := empty_clob();',
'begin',
'  select clob001 into l_data from apex_collections where collection_name=''CLOB_CONTENT'';',
'',
'  if :F4300_P270_IS_FIELD_NAME = ''Y'' then',
'    l_first_row_is_col_name := true;',
'  end if;',
'  wwv_flow_load_excel_data.get_table_info (',
'   p_string                 => l_data,',
'   p_separator              => lower(nvl(:F4300_P270_SEPARATOR,''\t'')),',
'   p_enclosed_by            => :F4300_P270_ENCLOSED_BY,  ',
'   p_first_row_is_col_name  => l_first_row_is_col_name,',
'   p_currency               => :P270_CURRENCY,',
'   p_numeric_chars          => :P270_DECIMAL_CHARACTER||:P270_GROUP_SEPARATOR,',
'   p_load_type              => ''EXCEL''',
'   );',
'end;'))
,p_process_error_message=>'載入 Excel 資料時發生錯誤.'
,p_process_when=>'NEXT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
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
