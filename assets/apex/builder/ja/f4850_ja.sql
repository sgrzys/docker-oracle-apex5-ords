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
,p_default_application_id=>4859
,p_default_owner=>'APEX_050000'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 4859 - Oracle APEX RESTful Services
--
-- Application Export:
--   Application:     4859
--   Name:            Oracle APEX RESTful Services
--   Exported By:     APEX_050000
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.02
--   Instance ID:     113808939374227
--

-- Application Statistics:
--   Pages:                     17
--     Items:                  103
--     Computations:            21
--     Validations:             27
--     Processes:               37
--     Regions:                 75
--     Buttons:                 50
--     Dynamic Actions:         16
--   Shared Components:
--     Logic:
--       Items:                  3
--       Computations:           1
--       Build Options:          1
--     Navigation:
--       Lists:                  6
--       Breadcrumbs:            1
--         Entries:             19
--       NavBar Entries:         3
--     Security:
--       Authentication:         1
--       Authorization:         10
--     User Interface:
--       Templates:
--         Page:                13
--         Region:              31
--         Label:               10
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           2
--         Button:              11
--         Report:               7
--       LOVs:                  26
--       Shortcuts:              2
--       Plug-ins:               8
--     Globalization:
--       Messages:              25
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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,4859)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEX_050000')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX RESTful Services')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A902301526265419194')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20151205181359'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'ja'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(540039604917681918.4859)
,p_application_tab_set=>0
,p_logo_image=>'#IMAGE_PREFIX#apex_ui/apexlogo.png'
,p_logo_image_attributes=>'width="282" height="20" alt="&PRODUCT_NAME."'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'&PRODUCT_NAME. 5.0.3.00.02'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_security_scheme=>wwv_flow_api.id(803273801918815227)
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'wwv_flow_error_dev.internal_error_handler'
,p_substitution_string_01=>'MSG_LANGUAGE'
,p_substitution_value_01=>'言語'
,p_substitution_string_02=>'MSG_USER'
,p_substitution_value_02=>'ユーザー'
,p_substitution_string_03=>'MSG_COMPANY'
,p_substitution_value_03=>'ワークスペース: &COMPANY.'
,p_substitution_string_04=>'WS_APP_OWNER'
,p_substitution_value_04=>'APEX_040000'
,p_substitution_string_05=>'DELETE_MSG'
,p_substitution_value_05=>'この削除操作を実行しますか。'
,p_substitution_string_06=>'PRODUCT_TYPE'
,p_substitution_value_06=>'Webシート'
,p_substitution_string_07=>'PRODUCT_NAME'
,p_substitution_value_07=>'Application Express'
,p_substitution_string_08=>'HELP'
,p_substitution_value_08=>'ヘルプ'
,p_substitution_string_09=>'EDIT'
,p_substitution_value_09=>'編集'
,p_substitution_string_10=>'MSG_COPYRIGHT'
,p_substitution_value_10=>'Copyright &copy; 1999, 2015, Oracle. All rights reserved.'
,p_substitution_string_11=>'DATE_FORMAT'
,p_substitution_value_11=>'rr-mm-dd'
,p_substitution_string_12=>'CLOSE'
,p_substitution_value_12=>'閉じる'
,p_substitution_string_13=>'CONFIRM'
,p_substitution_value_13=>'確認'
,p_substitution_string_14=>'MSG_JSCRIPT'
,p_substitution_value_14=>'この製品は、JavaScriptが有効な状態で実行する必要があります。'
,p_substitution_string_15=>'TOP'
,p_substitution_value_15=>'トップ'
,p_last_upd_yyyymmddhh24miss=>'20151205181315'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(697672714234539780.4859)
,p_name=>'APEX 5 - Administration (Header)'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697672931942539782.4859)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'管理'
,p_list_item_link_target=>'f?p=4350:1:&APP_SESSION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697673242694539782.4859)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697673509734539782.4859)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'サービスの管理'
,p_security_scheme=>wwv_flow_api.id(852575108977939507)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697673887665539782.4859)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'サービスの管理'
,p_list_item_link_target=>'f?p=4350:21:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697673509734539782.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697674127826539782.4859)
,p_list_item_display_sequence=>215
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(697673509734539782.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697674400346539783.4859)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'サービス・リクエストの作成'
,p_list_item_link_target=>'f?p=4350:96:&SESSION.::NO:49::'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''SERVICE_REQUESTS_ENABLED'') = ''Y'''
,p_parent_list_item_id=>wwv_flow_api.id(697673509734539782.4859)
,p_security_scheme=>wwv_flow_api.id(852575108977939507)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697674737416539784.4859)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'ワークスペース・プリファレンスの設定'
,p_list_item_link_target=>'f?p=4350:17:&SESSION.::NO:RP::'
,p_parent_list_item_id=>wwv_flow_api.id(697673509734539782.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697675002004539785.4859)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'お知らせの編集'
,p_list_item_link_target=>'f?p=4350:35:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697673509734539782.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697675352821539785.4859)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'ワークスペース使用率'
,p_list_item_link_target=>'f?p=4350:101:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697673509734539782.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697675698018539786.4859)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'ユーザーとグループの管理'
,p_list_item_link_target=>'f?p=4350:55:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(852575108977939507)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697675965880539786.4859)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'アクティビティの監視'
,p_list_item_link_target=>'f?p=4350:22:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(10759203169791179)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697676290030539786.4859)
,p_list_item_display_sequence=>500
,p_list_item_link_text=>'ダッシュボード'
,p_list_item_link_target=>'f?p=4350:33:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(10759203169791179)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1250965925147232831.4859)
,p_list_item_display_sequence=>600
,p_list_item_link_text=>'パスワードの変更'
,p_list_item_link_target=>'f?p=4350:3:&SESSION.::&DEBUG.:3#pwd'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_security_scheme=>wwv_flow_api.id(10759203169791179)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(697677732086541316.4859)
,p_name=>'APEX 5 - Help'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697677972603541317.4859)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'ドキュメント'
,p_list_item_link_target=>'&SYSTEM_HELP_URL.'
,p_list_text_02=>'helpLinkNewWindow'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2105957308761058240.4859)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'ディスカッション・フォーラム'
,p_list_item_link_target=>'https://apex.oracle.com/forum'
,p_list_text_01=>'helpLinkForum'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2185502966910586903.4859)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Oracle Technology Network'
,p_list_item_link_target=>'http://otn.oracle.com/apex'
,p_list_text_01=>'helpLinkOTN'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697678894738541317.4859)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697679129392541317.4859)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'バージョン情報'
,p_list_item_link_target=>'f?p=4350:9:&SESSION.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(719172975581246435.4859)
,p_name=>'APEX 5 - Tabs'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'アプリケーション・ビルダー'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW::'
,p_list_item_icon_alt_attribute=>'アプリケーション・ビルダーのドリルダウン'
,p_list_text_01=>'tab-app-builder'
,p_security_scheme=>wwv_flow_api.id(6685808796641112)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719173467509246436.4859)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'データベース・アプリケーション'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW:DATABASE:'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719173722390246436.4859)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Webシート・アプリケーション'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW:WEBSHEET:'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719174096423246437.4859)
,p_list_item_display_sequence=>125
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719174338146246437.4859)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'作成'
,p_list_item_link_target=>'f?p=4000:56:&SESSION.::NO:56,103,104,106,130,131,35,227,3020,3000,3001:FB_FLOW_ID,FB_FLOW_PAGE_ID:'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719174652049246437.4859)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'インポート'
,p_list_item_link_target=>'f?p=4000:460:&SESSION.::&DEBUG.:460:F4000_P56_CREATE_OPTION,P460_FILE_TYPE:IMP,FLOW_EXPORT:'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719174913009246437.4859)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'エクスポート'
,p_list_item_link_target=>'f?p=4000:523:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719175228969246437.4859)
,p_list_item_display_sequence=>155
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'ワークスペース・ユーティリティ'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719175891312246438.4859)
,p_list_item_display_sequence=>161
,p_list_item_link_text=>'すべてのワークスペース・ユーティリティ'
,p_list_item_link_target=>'f?p=4000:182:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719176144909246438.4859)
,p_list_item_display_sequence=>162
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719176402390246438.4859)
,p_list_item_display_sequence=>163
,p_list_item_link_text=>'アプリケーション・ビルダーのデフォルト値'
,p_list_item_link_target=>'f?p=4000:800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719176704666246438.4859)
,p_list_item_display_sequence=>164
,p_list_item_link_text=>'ニュースの管理'
,p_list_item_link_target=>'f?p=4800:7000:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719177037967246438.4859)
,p_list_item_display_sequence=>165
,p_list_item_link_text=>'ワークスペース・テーマ'
,p_list_item_link_target=>'f?p=4000:763:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719177364622246439.4859)
,p_list_item_display_sequence=>166
,p_list_item_link_text=>'アプリケーション・グループ'
,p_list_item_link_target=>'f?p=4000:722:&SESSION.::&DEBUG.:RP'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719177622562246439.4859)
,p_list_item_display_sequence=>167
,p_list_item_link_text=>'Application Expressビュー'
,p_list_item_link_target=>'f?p=4000:714:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719177921227246439.4859)
,p_list_item_display_sequence=>168
,p_list_item_link_text=>'アプリケーション間レポート'
,p_list_item_link_target=>'f?p=4000:9009:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719175552037246438.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719178248125246439.4859)
,p_list_item_display_sequence=>169
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719178543463246439.4859)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'移行'
,p_list_item_link_target=>'f?p=4400:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719173110379246436.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719178829971246440.4859)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'SQLワークショップ'
,p_list_item_link_target=>'f?p=4500:3002:&SESSION.'
,p_list_item_icon_alt_attribute=>'SQLワークショップのドリルダウン'
,p_list_text_01=>'tab-sql-workshop'
,p_security_scheme=>wwv_flow_api.id(6685907847641114)
,p_list_item_current_type=>'ALWAYS'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719179191283246440.4859)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'オブジェクト・ブラウザ'
,p_list_item_link_target=>'f?p=4500:1001:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719178829971246440.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719179422661246440.4859)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'SQLコマンド'
,p_list_item_link_target=>'f?p=4500:1003:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719178829971246440.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719179772704246442.4859)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'SQLスクリプト'
,p_list_item_link_target=>'f?p=4500:1004:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719178829971246440.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'ユーティリティ'
,p_parent_list_item_id=>wwv_flow_api.id(719178829971246440.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719180367219246442.4859)
,p_list_item_display_sequence=>241
,p_list_item_link_text=>'すべてのユーティリティ'
,p_list_item_link_target=>'f?p=4500:1005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719180648018246442.4859)
,p_list_item_display_sequence=>242
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719180966936246443.4859)
,p_list_item_display_sequence=>243
,p_list_item_link_text=>'データ・ワークショップ'
,p_list_item_link_target=>'f?p=4300:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719181251634246443.4859)
,p_list_item_display_sequence=>244
,p_list_item_link_text=>'クエリー・ビルダー'
,p_list_item_link_target=>'f?p=4500:1002:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719181595820246443.4859)
,p_list_item_display_sequence=>245
,p_list_item_link_text=>'DDLの生成'
,p_list_item_link_target=>'f?p=4500:12:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719181851272246443.4859)
,p_list_item_display_sequence=>246
,p_list_item_link_text=>'ユーザー・インタフェースのデフォルト値'
,p_list_item_link_target=>'f?p=4500:813:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719182177219246443.4859)
,p_list_item_display_sequence=>247
,p_list_item_link_text=>'表のメソッド'
,p_list_item_link_target=>'f?p=4500:120:&SESSION.::NO::P117_CREATE_PACKAGE:TABLE'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719182443645246443.4859)
,p_list_item_display_sequence=>248
,p_list_item_link_text=>'データベースについて'
,p_list_item_link_target=>'f?p=4500:36:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719182775397246444.4859)
,p_list_item_display_sequence=>249
,p_list_item_link_text=>'オブジェクト・レポート'
,p_list_item_link_target=>'f?p=4500:1042:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719183082670246444.4859)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'データベース監視'
,p_list_item_link_target=>'f?p=4500:11:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719183394998246444.4859)
,p_list_item_display_sequence=>251
,p_list_item_link_text=>'スキーマの比較'
,p_list_item_link_target=>'f?p=4500:1350:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719183663877246444.4859)
,p_list_item_display_sequence=>252
,p_list_item_link_text=>'ごみ箱'
,p_list_item_link_target=>'f?p=4500:1070:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719180043659246442.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719183987271246444.4859)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'RESTfulサービス'
,p_list_item_link_target=>'f?p=4850:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719178829971246440.4859)
,p_security_scheme=>wwv_flow_api.id(803273801918815227)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'チーム開発'
,p_list_item_link_target=>'f?p=4800:4000:&SESSION.'
,p_list_item_icon_alt_attribute=>'チーム開発のドリルダウン'
,p_list_text_01=>'tab-team-dev'
,p_security_scheme=>wwv_flow_api.id(6686010157641115)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719184545609246444.4859)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>'マイルストン'
,p_list_item_link_target=>'f?p=4800:6006:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719184871457246444.4859)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>'機能'
,p_list_item_link_target=>'f?p=4800:9010:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719185125506246444.4859)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'To Do'
,p_list_item_link_target=>'f?p=4800:3001:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719185476979246445.4859)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'バグ'
,p_list_item_link_target=>'f?p=4800:3501:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719185795991246445.4859)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>'フィードバック'
,p_list_item_link_target=>'f?p=4800:8012:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719186065984246445.4859)
,p_list_item_display_sequence=>355
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>'ユーティリティ'
,p_parent_list_item_id=>wwv_flow_api.id(719184267590246444.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719186663030246445.4859)
,p_list_item_display_sequence=>361
,p_list_item_link_text=>'すべてのユーティリティ'
,p_list_item_link_target=>'f?p=4800:2:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719186911944246445.4859)
,p_list_item_display_sequence=>362
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719187296081246446.4859)
,p_list_item_display_sequence=>363
,p_list_item_link_text=>'チーム開発の設定'
,p_list_item_link_target=>'f?p=4800:3005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719187577001246446.4859)
,p_list_item_display_sequence=>364
,p_list_item_link_text=>'リリース・サマリー'
,p_list_item_link_target=>'f?p=4800:4050:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719187832156246446.4859)
,p_list_item_display_sequence=>365
,p_list_item_link_text=>'ファイルの有効化'
,p_list_item_link_target=>'f?p=4350:17:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719188179400246446.4859)
,p_list_item_display_sequence=>366
,p_list_item_link_text=>'期限経過したバグのプッシュ'
,p_list_item_link_target=>'f?p=4800:5:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719188406965246447.4859)
,p_list_item_display_sequence=>367
,p_list_item_link_text=>'機能ユーティリティ'
,p_list_item_link_target=>'f?p=4800:9013:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719188775616246447.4859)
,p_list_item_display_sequence=>368
,p_list_item_link_text=>'フォーカス領域の管理'
,p_list_item_link_target=>'f?p=4800:9020:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719189035085246447.4859)
,p_list_item_display_sequence=>369
,p_list_item_link_text=>'割当て先の更新'
,p_list_item_link_target=>'f?p=4800:6004:&SESSION.::&DEBUG.:6004:::'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719189313765246447.4859)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'ファイルの表示'
,p_list_item_link_target=>'f?p=4800:9:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719189651384246449.4859)
,p_list_item_display_sequence=>371
,p_list_item_link_text=>'データのパージ'
,p_list_item_link_target=>'f?p=4800:6:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719189914442246449.4859)
,p_list_item_display_sequence=>372
,p_list_item_link_text=>'ニュースの管理'
,p_list_item_link_target=>'f?p=4800:7000:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719190295709246449.4859)
,p_list_item_display_sequence=>373
,p_list_item_link_text=>'リンクの管理'
,p_list_item_link_target=>'f?p=4800:5000:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719186321307246445.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719190530504246449.4859)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'パッケージ・アプリケーション'
,p_list_item_link_target=>'f?p=4750:50:&APP_SESSION.'
,p_list_text_01=>'tab-apps'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719190862410246449.4859)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'アプリケーション・ギャラリ'
,p_list_item_link_target=>'f?p=4750:50:&SESSION.::&DEBUG.:50:'
,p_parent_list_item_id=>wwv_flow_api.id(719190530504246449.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719191141951246449.4859)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'ダッシュボード'
,p_list_item_link_target=>'f?p=4750:2:&SESSION.::&DEBUG.:2:'
,p_parent_list_item_id=>wwv_flow_api.id(719190530504246449.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719191421386246450.4859)
,p_list_item_display_sequence=>430
,p_list_item_link_text=>'管理'
,p_list_item_link_target=>'f?p=4750:6:&SESSION.::&DEBUG.:6:'
,p_parent_list_item_id=>wwv_flow_api.id(719190530504246449.4859)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(873550610677863830.4859)
,p_name=>'icon navigation'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(873550831158863831.4859)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'オブジェクト・ブラウザ'
,p_list_item_link_target=>'f?p=4500:1001:&SESSION.'
,p_list_item_icon=>'htmldb/icons/ob_browser.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(873551124330863831.4859)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'SQLコマンド'
,p_list_item_link_target=>'f?p=4500:1003:&SESSION.'
,p_list_item_icon=>'htmldb/icons/sqlcmd.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(873551403588863831.4859)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'SQLスクリプト'
,p_list_item_link_target=>'f?p=4500:1004:&SESSION.'
,p_list_item_icon=>'htmldb/icons/sqlscrpt.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(873831932541898524.4859)
,p_list_item_display_sequence=>35
,p_list_item_link_text=>'クエリー・ビルダー'
,p_list_item_link_target=>'f?p=4500:1001:&SESSION.'
,p_list_item_icon=>'htmldb/icons/qbuilder.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(873551715997863831.4859)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'ユーティリティ'
,p_list_item_link_target=>'f?p=4500:1005:&SESSION.'
,p_list_item_icon=>'htmldb/icons/shared_comp_small.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(873552006687863831.4859)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'RESTfulサービス'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'htmldb/icons/dbservice.png'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1493530200311490901.4859)
,p_name=>'REST_PRIVS_LIST'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3144413854938363873.4859)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'RESTfulサービス権限'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1493530405217490901.4859)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'クライアント登録'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RIR:::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'GROUPS'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1646563629182384932.4859)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'RESTfulサービスの承認'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2488269555599673580.4859)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'エクスポート'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:::'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1  from WWV_FLOW_RT$MODULES',
'where SECURITY_GROUP_ID = :flow_security_group_id'))
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2498818148769125606.4859)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'インポート'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(366350517809482707.4859)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'サンプル・データのリセット'
,p_list_item_link_target=>'javascript:apex.submit({request:''RESET_SAMPLE_DATA''});'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1655184530741291898.4859)
,p_name=>'Approval_Updates'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1655184723489291899.4859)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'承認'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RIR,CIR:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1655185011991291900.4859)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'複数の承認の更新'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RIR,CIR:::'
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
 p_id=>wwv_flow_api.id(1665747160933187.4859)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(14859207420941042.4859)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1765073360593712056.4859)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(6685808796641112.4859)
,p_name=>'APEX 5.0 Application Builder Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>'試行した操作に対する権限がありません'
,p_reference_id=>786516029127697713.4859
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(6685907847641114.4859)
,p_name=>'APEX 5.0 SQL Workshop Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'SQL'
,p_error_message=>'試行した操作に対する権限がありません'
,p_reference_id=>786516265251697717.4859
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(6686010157641115.4859)
,p_name=>'APEX 5.0 Team development enabled'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 ',
'from wwv_flow_companies w, wwv_flow_fnd_user u',
'where nvl(w.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'' and ',
'      w.PROVISIONING_COMPANY_ID = :flow_security_group_id and',
'      u.security_group_id = :flow_security_group_id and',
'      u.USER_NAME = upper(:app_user) and',
'      nvl(u.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'''))
,p_error_message=>'このワークスペースでは、チーム開発は使用できません'
,p_reference_id=>786516861027697723.4859
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(6686108619641115.4859)
,p_name=>'APEX 5.0 Websheets Enabled'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 ',
'from wwv_flow_companies w, wwv_flow_fnd_user u',
'where nvl(w.ALLOW_WEBSHEET_DEV_YN,''Y'') = ''Y'' and ',
'      w.PROVISIONING_COMPANY_ID = :flow_security_group_id and',
'      u.security_group_id = :flow_security_group_id and',
'      u.USER_NAME = upper(:app_user) and',
'      nvl(u.ALLOW_WEBSHEET_DEV_YN,''Y'') = ''Y'''))
,p_error_message=>'試行した操作に対する権限がありません'
,p_reference_id=>786517166823697723.4859
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(10759203169791179.4859)
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
,p_error_message=>'ダッシュボードと「アクティビティの監視」へのアクセスは許可されていません。'
,p_reference_id=>786936829326142579.4859
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(763730718028679365.4859)
,p_name=>'APEX 5.0 Packaged App Enabled'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'    for c1 in (select 1 from wwv_flow_companies w',
'                     where nvl(w.ALLOW_PACKAGED_APP_INS_YN,''Y'') = ''Y'' ',
'                         and w.PROVISIONING_COMPANY_ID = :flow_security_group_id) ',
'    loop',
'        return',
'            ( wwv_flow_authorization.is_authorized_developer(',
'                  p_developer_authorization => ''ADMIN''',
'            )',
'           or wwv_flow_authorization.is_authorized_developer(',
'                    p_developer_authorization => ''EDIT''',
'           ) and wwv_flow_platform.get_preference(''PKG_APP_ENABLED'') = ''Y'' );',
'',
'    end loop;',
'    return false;',
'end;'))
,p_error_message=>'試行した操作に対する権限がありません'
,p_reference_id=>786517456817697723.4859
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(803273801918815227.4859)
,p_name=>'APEX 5.0 RESTful Services Enabled'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    for l_ws in ( select allow_restful_services_yn',
'                    from wwv_flow_companies',
'                   where provisioning_company_id = :flow_security_group_id )',
'    loop',
'        return l_ws.allow_restful_services_yn                               = ''Y''',
'           and wwv_flow_platform.get_preference(''RESTFUL_SERVICES_ENABLED'') = ''Y''',
'           and wwv_flow_authorization.is_authorized_developer(''EDIT'');',
'    end loop;',
'    return false;',
'end;'))
,p_error_message=>'試行した操作に対する権限がありません'
,p_reference_id=>786519856057734816.4859
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(852575108977939507.4859)
,p_name=>'Flow: ADMIN'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'ADMIN'
,p_error_message=>'アプリケーションの管理は許可されていません'
,p_reference_id=>12511219858301010.4859
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(852581401782939524.4859)
,p_name=>'Flow: EDIT'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>'アプリケーションの編集は許可されていません'
,p_reference_id=>12480509677812756.4859
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(873288123790839255.4859)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>'ビルダーSSOが有効になっていません'
,p_reference_id=>6738410669854771.4859
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(872399403957776718.4859)
,p_icon_sequence=>1
,p_icon_image=>'Workspace &COMPANY.'
,p_icon_subtext=>'ワークスペース&COMPANY.'
,p_icon_target=>'#'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(873191312015835823.4859)
,p_icon_sequence=>2
,p_icon_subtext=>'( <span style="text-decoration:underline;">ワークスペースの切替え</span> )'
,p_icon_target=>'f?p=4550:20'
,p_icon_image_alt=>'ワークスペースの切替え'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
,p_security_scheme=>wwv_flow_api.id(873288123790839255)
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(6685705047641105.4859)
,p_icon_sequence=>99
,p_icon_subtext=>'( <span style="text-decoration:underline;">ログアウト</span> )'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'ログアウト'
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
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
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1534926119072175978.4859)
,p_name=>'ACTIVE_NODE'
,p_data_type=>'NUMBER'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(872498331315784584.4859)
,p_name=>'COMPANY'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6688329890650779.4859)
,p_name=>'FSP_AFTER_LOGIN_URL'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(872544309629787776.4859)
,p_computation_sequence=>10
,p_computation_item=>'COMPANY'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wwv_flow.get_company_name'
,p_compute_when=>'COMPANY'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_computation_error_message=>'ワークスペース名を計算できません。'
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
 p_id=>wwv_flow_api.id(948796511932598687.4859)
,p_lov_name=>'DATABASE SCHEMAS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select /* APEX4850L1 */ wwv_flow_escape.html(upper(c.schema)) d, upper(c.schema) v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(792100407834275994.4859)
,p_lov_name=>'ETAG_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(792100407834275994)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792100610608275996.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'セキュアなHASH'
,p_lov_return_value=>'HASH'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792100820783275997.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'問合せ'
,p_lov_return_value=>'QUERY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792101014833275997.4859)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'なし'
,p_lov_return_value=>'NONE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(914883828990434889.4859)
,p_lov_name=>'FILE EXPORT TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(914883828990434889)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(914884011226434892.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'XMLファイル'
,p_lov_return_value=>'XML'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(914884227962434893.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'SQLスクリプト'
,p_lov_return_value=>'SQL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(776540711317147315.4859)
,p_lov_name=>'HANDLER'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nvl(method,''No method'') x, id',
'from wwv_flow_rt$handlers'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(793208615430277767.4859)
,p_lov_name=>'HANDLER_METHODS'
,p_lov_query=>'.'||wwv_flow_api.id(793208615430277767)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793208825198277771.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'GET'
,p_lov_return_value=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793209204809277772.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'DELETE'
,p_lov_return_value=>'DELETE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793209415292277772.4859)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'POST'
,p_lov_return_value=>'POST'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793209014774277772.4859)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'PUT'
,p_lov_return_value=>'PUT'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(793264406688294176.4859)
,p_lov_name=>'HANDLER_QUERY_FORMAT'
,p_lov_query=>'.'||wwv_flow_api.id(793264406688294176)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793264622598294176.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'JSON'
,p_lov_return_value=>'DEFAULT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793264825009294176.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'CSV'
,p_lov_return_value=>'CSV'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1488736008597865790.4859)
,p_lov_name=>'HANDLER_SECURE_ACCESS'
,p_lov_query=>'.'||wwv_flow_api.id(1488736008597865790)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1488736303736865793.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'はい'
,p_lov_return_value=>'YES'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1488736530845865794.4859)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'いいえ'
,p_lov_return_value=>'NO'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(793284611321304933.4859)
,p_lov_name=>'HANDLER_SECURITY'
,p_lov_query=>'.'||wwv_flow_api.id(793284611321304933)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793284832075304933.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'パブリック'
,p_lov_return_value=>'NONE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793285017364304933.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'セキュア'
,p_lov_return_value=>'SECURE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1671084505895948418.4859)
,p_lov_name=>'I18N_IANA_CHARSET'
,p_reference_id=>144796827445692396.4859
,p_lov_query=>'.'||wwv_flow_api.id(1671084505895948418)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671093901719948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode (UTF-16 Little Endian)'
,p_lov_return_value=>'utf-16le'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671094124464948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode (UTF-16 Big Endian)'
,p_lov_return_value=>'utf-16be'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671094300393948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'US-ASCII'
,p_lov_return_value=>'us-ascii'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671094520466948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'アラビア語 ISO-8859-6'
,p_lov_return_value=>'iso-8859-6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671094700871948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'アラビア語(Windows 1256)'
,p_lov_return_value=>'windows-1256'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671094921688948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'中国語(Big5)'
,p_lov_return_value=>'big5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671095110740948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'中国語(GBK)'
,p_lov_return_value=>'gbk'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671095331933948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'キリル語(ISO-8859-5)'
,p_lov_return_value=>'iso-8859-5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671095502169948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'キリル語(KOI8-R)'
,p_lov_return_value=>'koi8-r'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671095705442948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'キリル語(KOI8-U)'
,p_lov_return_value=>'koi8-u'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671095932299948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'キリル語(Windows 1251)'
,p_lov_return_value=>'windows-1251'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671096121544948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'東ヨーロッパ語(ISO-8859-2)'
,p_lov_return_value=>'iso-8859-2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671096329393948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'東ヨーロッパ語(Windows 1250)'
,p_lov_return_value=>'windows-1250'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671096502409948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ギリシャ語(ISO-8859-7)'
,p_lov_return_value=>'iso-8859-7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671096725054948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ギリシャ語(Windows 1253)'
,p_lov_return_value=>'windows-1253'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671096913527948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ヘブライ語(ISO-8859-8-i)'
,p_lov_return_value=>'iso-8859-8-i'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671097100860948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ヘブライ語(Windows 1255)'
,p_lov_return_value=>'windows-1255'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671097315673948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'日本語(EUC)'
,p_lov_return_value=>'euc-jp'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671097520272948439.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'日本語(Shift JIS)'
,p_lov_return_value=>'shift_jis'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671097709314948440.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'韓国語(EUC)'
,p_lov_return_value=>'euc-kr'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671097923215948440.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'北ヨーロッパ語(ISO-8859-4)'
,p_lov_return_value=>'iso-8859-4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671098132735948440.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'北ヨーロッパ語(Windows 1257)'
,p_lov_return_value=>'windows-1257'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671098331088948440.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'南ヨーロッパ語(ISO-8859-3)'
,p_lov_return_value=>'iso-8859-3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671098518496948441.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'タイ語(TIS-620)'
,p_lov_return_value=>'tis-620'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671098727107948441.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'トルコ語(ISO-8859-9)'
,p_lov_return_value=>'iso-8859-9'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671098918742948441.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'トルコ語(Windows 1254)'
,p_lov_return_value=>'windows-1254'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671099131511948441.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode(UTF-8)'
,p_lov_return_value=>'utf-8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671099313041948441.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ベトナム語(Windows 1258)'
,p_lov_return_value=>'windows-1258'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671099521679948441.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'西ヨーロッパ語(ISO-8859-1)'
,p_lov_return_value=>'iso-8859-1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671099704494948441.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'西ヨーロッパ語(Windows 1252)'
,p_lov_return_value=>'windows-1252'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(321119108469325958.4859)
,p_lov_name=>'METHODS'
,p_lov_query=>'.'||wwv_flow_api.id(321119108469325958)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(321119402415325959.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'PUT'
,p_lov_return_value=>'PUT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(321119614070325960.4859)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'GET'
,p_lov_return_value=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(321119810979325960.4859)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'POST'
,p_lov_return_value=>'POST'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(321120019210325960.4859)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'DELETE'
,p_lov_return_value=>'DELETE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(414537600634127531.4859)
,p_lov_name=>'MODULES'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   wwv_flow_rt$modules',
'where security_group_id = :flow_security_group_id',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1501629904585944475.4859)
,p_lov_name=>'MODULE_NAMES'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select id d, name r',
'from   wwv_flow_rt$modules',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1484087224479961236.4859)
,p_lov_name=>'P3_HANDLER_SOURCE_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(1484087224479961236)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1484087529294961238.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'問合せ'
,p_lov_return_value=>'QUERY'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P3_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1484087728312961238.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'1行問い合せる'
,p_lov_return_value=>'QUERY_1_ROW'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P3_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1484087920223961238.4859)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'フィード'
,p_lov_return_value=>'FEED'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P3_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1484088114901961238.4859)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'PL/SQL'
,p_lov_return_value=>'PLSQL'
,p_lov_disp_cond_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_lov_disp_cond=>'P3_METHOD'
,p_lov_disp_cond2=>'DELETE:POST:PUT:GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1484088322527961238.4859)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'メディア・リソース'
,p_lov_return_value=>'MEDIA'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P3_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(793236521795289048.4859)
,p_lov_name=>'P9_HANDLER_SOURCE_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(793236521795289048)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793236700829289051.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'問合せ'
,p_lov_return_value=>'QUERY'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P9_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793236928620289051.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'1行問い合せる'
,p_lov_return_value=>'QUERY_1_ROW'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P9_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1438482126999310901.4859)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'フィード'
,p_lov_return_value=>'FEED'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P9_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793237101153289052.4859)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'PL/SQL'
,p_lov_return_value=>'PLSQL'
,p_lov_disp_cond_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_lov_disp_cond=>'P9_METHOD'
,p_lov_disp_cond2=>'DELETE:POST:PUT:GET'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793237329580289052.4859)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'メディア・リソース'
,p_lov_return_value=>'MEDIA'
,p_lov_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_lov_disp_cond=>'P9_METHOD'
,p_lov_disp_cond2=>'GET'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(793423420718336071.4859)
,p_lov_name=>'PARAMETER_ACCESS'
,p_lov_query=>'.'||wwv_flow_api.id(793423420718336071)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793423630540336072.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'IN'
,p_lov_return_value=>'IN'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793423817192336072.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'OUT'
,p_lov_return_value=>'OUT'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 from wwv_flow_rt$handlers',
'where id = :P12_HANDLER_ID',
'and source_type = ''PLSQL''',
'and security_group_id = :flow_security_group_id'))
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793424005083336072.4859)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'IN/OUT'
,p_lov_return_value=>'INOUT'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 from wwv_flow_rt$handlers',
'where id = :P12_HANDLER_ID',
'and source_type = ''PLSQL''',
'and security_group_id = :flow_security_group_id'))
,p_lov_disp_cond2=>'PLSQL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(793403203749331167.4859)
,p_lov_name=>'PARAMETER_SOURCE'
,p_lov_query=>'.'||wwv_flow_api.id(793403203749331167)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793403408340331167.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'HTTPヘッダー'
,p_lov_return_value=>'HEADER'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1422794016916942828.4859)
,p_lov_disp_sequence=>15
,p_lov_disp_value=>'レスポンス本文'
,p_lov_return_value=>'RESPONSE'
,p_lov_disp_cond_type=>'PLSQL_EXPRESSION'
,p_lov_disp_cond=>'V(''P12_ACCESS_METHOD'') = ''OUT'' or :APP_PAGE_ID = 9'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793403609738331167.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'URI'
,p_lov_return_value=>'URI'
,p_lov_disp_cond_type=>'PLSQL_EXPRESSION'
,p_lov_disp_cond=>'V(''P12_ACCESS_METHOD'') = ''IN'' or :APP_PAGE_ID = 9'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1423989032583278480.4859)
,p_lov_name=>'PARAMETER_SOURCE_NO_CONDITIONS'
,p_lov_query=>'.'||wwv_flow_api.id(1423989032583278480)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1423989323415278482.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'HTTPヘッダー'
,p_lov_return_value=>'HEADER'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1423989504373278483.4859)
,p_lov_disp_sequence=>15
,p_lov_disp_value=>'レスポンス本文'
,p_lov_return_value=>'RESPONSE'
,p_lov_disp_cond2=>'OUT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1423989720951278484.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'URI'
,p_lov_return_value=>'URI'
,p_lov_disp_cond2=>'IN'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(793443816001344104.4859)
,p_lov_name=>'PARAMETER_TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(793443816001344104)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793444013072344105.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'String'
,p_lov_return_value=>'STRING'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793444211458344105.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Integer'
,p_lov_return_value=>'INT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793444423050344105.4859)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Double'
,p_lov_return_value=>'DOUBLE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793444618634344105.4859)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Long'
,p_lov_return_value=>'LONG'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(793444812427344105.4859)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Timestamp'
,p_lov_return_value=>'TIMESTAMP'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(826059223722614454.4859)
,p_lov_name=>'PICK MODULE'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''All Services'' d, 999 r from dual',
'union all',
'select name d, id r from WWV_FLOW_RT$MODULES ',
'where security_group_id = :flow_security_group_id',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1481196731126092675.4859)
,p_lov_name=>'PRIVILEGES'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select label d, id r',
'  from wwv_flow_rt$privileges',
' where security_group_id = :flow_security_group_id',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(316762018242533973.4859)
,p_lov_name=>'PUBLISHED NOT PUBLISHED'
,p_lov_query=>'.'||wwv_flow_api.id(316762018242533973)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(316762306509533979.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'公開'
,p_lov_return_value=>'PUBLISHED'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(316762517698533983.4859)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'未公開'
,p_lov_return_value=>'NOT_PUBLISHED'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1646678615030409311.4859)
,p_lov_name=>'RESTFUL_APPROVAL_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(1646678615030409311)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1646678927075409312.4859)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'承認済'
,p_lov_return_value=>'APPROVED'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1646679121350409312.4859)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'保留中'
,p_lov_return_value=>'PENDING'
,p_lov_disp_cond_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_lov_disp_cond=>'14,16'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1646679301282409312.4859)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'拒否'
,p_lov_return_value=>'DENIED'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1646424605586349771.4859)
,p_lov_name=>'RESTFUL_SERVICE_CLIENTS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name d, id r ',
'from wwv_flow_rt$clients',
'where security_group_id = :flow_security_group_id',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(317434812233598482.4859)
,p_lov_name=>'SOURCE_TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(317434812233598482)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(317435304805598483.4859)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'問合せ'
,p_lov_return_value=>'QUERY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(317435514983598483.4859)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'1行問い合せる'
,p_lov_return_value=>'QUERY_1_ROW'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(317435726705598483.4859)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'PL/SQL'
,p_lov_return_value=>'PLSQL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(317435916084598483.4859)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'メディア'
,p_lov_return_value=>'MEDIA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1504722425110707335.4859)
,p_lov_name=>'USER_GROUPS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select group_name d, id r',
'from   wwv_flow_fnd_user_groups',
'where  security_group_id = :flow_security_group_id',
'union all',
'select group_name d, id r',
'from wwv_flow_fnd_user_groups',
'where  security_group_id = 10',
'and :flow_security_group_id <> 10',
'and group_name = ''RESTful Services'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(792033515275240381.4859)
,p_lov_name=>'ZERO THROUGH 9'
,p_lov_query=>'.'||wwv_flow_api.id(792033515275240381)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792033722063240383.4859)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'0'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792033913288240384.4859)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'1'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792034107246240384.4859)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'2'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792034319315240384.4859)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'3'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792034525773240385.4859)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'4'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792034719819240385.4859)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'5'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792034916654240385.4859)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'6'
,p_lov_return_value=>'6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792035120319240385.4859)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'7'
,p_lov_return_value=>'7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792035332044240385.4859)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'8'
,p_lov_return_value=>'8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(792035529692240385.4859)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'9'
,p_lov_return_value=>'9'
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
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(6687412253641141.4859)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6687804718641149.4859)
,p_parent_id=>wwv_flow_api.id(325184318717294081.4859)
,p_short_name=>'RESTfulサービス'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6690617516703988.4859)
,p_parent_id=>wwv_flow_api.id(.4859)
,p_short_name=>'ホーム'
,p_link=>'f?p=4500:1000:&SESSION.'
,p_page_id=>99999
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(304474918819443056.4859)
,p_parent_id=>wwv_flow_api.id(6687804718641149.4859)
,p_short_name=>'RESTfulサービス・モジュールの作成'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(315395905415249299.4859)
,p_parent_id=>wwv_flow_api.id(6687804718641149.4859)
,p_short_name=>'RESTfulサービス・モジュール'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(325184318717294081.4859)
,p_parent_id=>wwv_flow_api.id(.4859)
,p_short_name=>'<span class="u-VisuallyHidden">SQLワークショップ</span><span class="a-Icon icon-breadcrumb-previous"></span>'
,p_link=>'f?p=4500:3002:&SESSION.'
,p_page_id=>99998
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(388804142472871280.4859)
,p_parent_id=>wwv_flow_api.id(.4859)
,p_short_name=>'0'
,p_link=>'f?p=&FLOW_ID.:0:&SESSION.'
,p_page_id=>0
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(413824715640010611.4859)
,p_parent_id=>wwv_flow_api.id(315395905415249299.4859)
,p_short_name=>'リソース・テンプレート'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(413930227369017548.4859)
,p_parent_id=>wwv_flow_api.id(415722322040309103.4859)
,p_short_name=>'リソース・ハンドラ・パラメータ'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(415722322040309103.4859)
,p_parent_id=>wwv_flow_api.id(413824715640010611.4859)
,p_short_name=>'リソース・ハンドラ'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(825236215533488467.4859)
,p_parent_id=>wwv_flow_api.id(6687804718641149.4859)
,p_short_name=>'RESTfulサービスのエクスポート'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(835826920508943696.4859)
,p_parent_id=>wwv_flow_api.id(6687804718641149.4859)
,p_short_name=>'RESTfulサービスのインポート'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1481433909665180242.4859)
,p_parent_id=>wwv_flow_api.id(1481503026042187892.4859)
,p_short_name=>'RESTfulサービス権限の詳細'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1481503026042187892.4859)
,p_parent_id=>wwv_flow_api.id(6687804718641149.4859)
,p_short_name=>'RESTfulサービス権限'
,p_link=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1504438624052636603.4859)
,p_parent_id=>wwv_flow_api.id(6687804718641149.4859)
,p_short_name=>'クライアント登録'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1504612710885657958.4859)
,p_parent_id=>wwv_flow_api.id(1504438624052636603.4859)
,p_short_name=>'クライアント登録'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1646510922571380988.4859)
,p_parent_id=>wwv_flow_api.id(6687804718641149.4859)
,p_short_name=>'RESTfulサービスの承認'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1647082920975488070.4859)
,p_parent_id=>wwv_flow_api.id(1646510922571380988.4859)
,p_short_name=>'RESTfulサービスの作成/編集'
,p_link=>'f?p=&FLOW_ID.:15:&SESSION.'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1655767024290367492.4859)
,p_parent_id=>wwv_flow_api.id(1646510922571380988.4859)
,p_short_name=>'複数の承認の更新'
,p_link=>'f?p=&FLOW_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1746949323661635358.4859)
,p_parent_id=>wwv_flow_api.id(415722322040309103.4859)
,p_short_name=>'テスト・リソース・ハンドラ'
,p_link=>'f?p=&FLOW_ID.:8:&SESSION.'
,p_page_id=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6672820488641033.4859)
,p_theme_id=>3
,p_name=>'APEX 4.0 - Left SideBar.ja'
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
'      <div id="apex-content">#REGION_POSITION_02#',
'        <div id="apex-splash">',
'          <div id="RP4">#REGION_POSITION_04#</div>',
'          <div id="BB">#BODY#</div>',
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
,p_reference_id=>35947117597242898.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6672920821641033.4859)
,p_theme_id=>3
,p_name=>'APEX 4.2 - No SideBar.ja'
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
,p_reference_id=>187453329378870285.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6673001550641034.4859)
,p_theme_id=>3
,p_name=>'APEX 4.0 - Right SideBar.ja'
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
,p_reference_id=>18525411970780075.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(348171001889489868.4859)
,p_theme_id=>3
,p_name=>'APEX 4.2 - Wizard .ja'
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
,p_reference_id=>42231511193339128.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(348183913031531541.4859)
,p_theme_id=>3
,p_name=>'APEX 4.2 - Edit Screen.ja'
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
'        <div id="apex-edit-screen">#REGION_POSITION_04#<div id="BB">#BODY#</div></div>',
'      </div>',
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
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>244139901565747496.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(719669719239933042.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Dialog.ja'
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
,p_reference_id=>120828417372192930.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(719670183563933079.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Edit Screen.ja'
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
,p_reference_id=>689595297061847770.4859
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(747114200967067802.4859)
,p_page_template_id=>wwv_flow_api.id(719670183563933079.4859)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(747114672927067802.4859)
,p_page_template_id=>wwv_flow_api.id(719670183563933079.4859)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(719672364834933087.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.ja'
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
,p_reference_id=>637437892049443496.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(719672816683933088.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.ja'
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
,p_reference_id=>386895861966224222.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970709321907339893.4859)
,p_page_template_id=>wwv_flow_api.id(719672816683933088.4859)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970709764099339893.4859)
,p_page_template_id=>wwv_flow_api.id(719672816683933088.4859)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970710139877339894.4859)
,p_page_template_id=>wwv_flow_api.id(719672816683933088.4859)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970710573105339894.4859)
,p_page_template_id=>wwv_flow_api.id(719672816683933088.4859)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970710933032339894.4859)
,p_page_template_id=>wwv_flow_api.id(719672816683933088.4859)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970711302386339894.4859)
,p_page_template_id=>wwv_flow_api.id(719672816683933088.4859)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970711720247339895.4859)
,p_page_template_id=>wwv_flow_api.id(719672816683933088.4859)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(719674293388933089.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Sign Up Wizard.ja'
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
,p_reference_id=>702692008314080052.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(719674703062933090.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard.ja'
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
,p_reference_id=>702684260095026477.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824978805028308431.4859)
,p_page_template_id=>wwv_flow_api.id(719674703062933090.4859)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824979225213308432.4859)
,p_page_template_id=>wwv_flow_api.id(719674703062933090.4859)
,p_name=>'Wizard Progress List'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824979649959308432.4859)
,p_page_template_id=>wwv_flow_api.id(719674703062933090.4859)
,p_name=>'Wizard Title'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824980028677308432.4859)
,p_page_template_id=>wwv_flow_api.id(719674703062933090.4859)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(719678839350933097.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Dialog.ja'
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
,p_reference_id=>689061037088924910.4859
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(754939123056928433.4859)
,p_theme_id=>3
,p_name=>'APEX 5.0 - RESTful Web Services.ja'
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
'<body #ONLOAD# class="a-Page--webservices #PAGE_CSS_CLASSES#">',
'<!--[if lte IE 8]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'#REGION_POSITION_02#',
'  <div class="a-Body">',
'    <aside class="a-Side a-Side--left a-Side--large">',
'        #REGION_POSITION_03#',
'    </aside>',
'    <main class="a-Main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
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
,p_reference_id=>754942495369044641.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(754945327790072675.4859)
,p_page_template_id=>wwv_flow_api.id(754939123056928433.4859)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(232195217185455150.4859)
,p_template_name=>'APEX 4.2 - Next Button'
,p_template=>'<button class="aButton nextButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#<img src="#IMAGE_PREFIX#f_spacer.gif" class="nextBlack" alt=""/></span></button>'
,p_hot_template=>'<button class="aButton hotButton nextButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#<img src="#IMAGE_PREFIX#f_spacer.gif" class="nextWhite" alt=""/></span></button>'
,p_reference_id=>40780910892272674.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(302280313173718795.4859)
,p_template_name=>'APEX 4.1 - Button'
,p_template=>'<button class="aButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#</span></button> '
,p_hot_template=>'<button class="aButton hotButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#</span></button> '
,p_reference_id=>275775519061831382.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="button-gray" role="button" title="#LABEL#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span>#LABEL#</span></a> ',
'',
'',
'<a href="#LINK#" class="button-orange" role="button" title="#LABEL#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span>#LABEL#</span></a> '))
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(388776568320789175.4859)
,p_template_name=>'APEX 5.0 - Icon Menu Button (2)'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_reference_id=>3705338883615.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(388776713638789177.4859)
,p_template_name=>'APEX 5.0 - Icon Only Button (2)'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CL'
||'ASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>353820721334283301.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(629187503480957071.4859)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>'<input type="button" value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_template_comment=>'5.0 upgrade'
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(719734705014947853.4859)
,p_template_name=>'APEX 5.0 - Button'
,p_template=>'<button onclick="#JAVASCRIPT#" class="a-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="a-Button a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174750904387485475.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(719734932326947858.4859)
,p_template_name=>'APEX 5.0 - Button with Icon'
,p_template=>'<button class="a-Button a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_reference_id=>404889142313786233.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(719735277951947858.4859)
,p_template_name=>'APEX 5.0 - Icon Badge Button'
,p_template=>'<button class="a-Button a-Button--noLabel #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#"></span><span class="a-But'
||'ton-badge"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#"></span><spa'
||'n class="a-Button-badge"></span></button>'
,p_reference_id=>631020282344854024.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(719735508683947859.4859)
,p_template_name=>'APEX 5.0 - Icon Badge Menu Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#"></span><span class="a-Button-badge"></span><span class="a-Icon icon-menu-drop-down"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#"></span><span class="a-Button-badge"></span><span class="a-Icon icon-menu-drop-down"></span></button>'
,p_reference_id=>631020159860848910.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(719735863923947860.4859)
,p_template_name=>'APEX 5.0 - Icon Menu Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_reference_id=>3705338883615.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(719736129383947861.4859)
,p_template_name=>'APEX 5.0 - Icon Only Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CL'
||'ASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>353820721334283301.4859
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6673713929641045.4859)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'APEX 4.0 - Div  with ID (c:htmldbHID)'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>245224629509817478.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6673907217641045.4859)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'APEX 4.0 - Div with ID and Region Attributes'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>2974803291668087.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6674010598641046.4859)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="hide-show-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="hide-show-top">',
'    <div class="hide-show-title"><h3>',
'      <a href="#" onclick="htmldb_ToggleTableBody(''i#REGION_STATIC_ID#'',''body#REGION_STATIC_ID#''); return false;">',
'        <img src="#IMAGE_PREFIX#htmldb/builder/rollup_plus_dgray.gif" class="pseudoButtonActive" id="i#REGION_STATIC_ID#" alt="" />',
'        #TITLE#',
'      </a></h3>    ',
'    </div>',
'  </div>',
'  <div class="hide-show-body" style="display:none;" id="body#REGION_STATIC_ID#">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'APEX 4.0 - Hide and Show Region'
,p_theme_id=>3
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>18662712241194598.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6674313033641046.4859)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion sideNavRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
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
,p_page_plug_template_name=>'APEX 4.0 - Rounded Corner (Gray Top)'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>29053509612942271.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6674714399641047.4859)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion altHeading #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
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
,p_page_plug_template_name=>'APEX 4.0 - Rounded Corner Large'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_reference_id=>27763613494297374.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6675116240641047.4859)
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
,p_reference_id=>17355419405599943.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6675215817641047.4859)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="aRegion sideRegion sideNavRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
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
,p_page_plug_template_name=>'APEX 4.0 - Sidebar Navigation'
,p_plug_table_bgcolor=>'#F7F7E7'
,p_theme_id=>3
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#F7F7E7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>' '
,p_reference_id=>456726627253419549.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6675304951641047.4859)
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
,p_page_plug_template_name=>'APEX 4.0 - Top Bar'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>191052627601630142.4859
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <table class="TopBarUIFix" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" width="100%"><tbody class="GreenBar"><tr><td valign="middle" class="L">#BODY#</td><td width="30" class="C"><br /></td><td valign="middle" class='
||'"R" align="right"><span style="margin-right:10px;">#CLOSE#</span>#COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#</td></tr></tbody></table>',
''))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6675421676641048.4859)
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
,p_reference_id=>17357218626599946.4859
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <table class="TopBarUIFix" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" width="100%"><tbody class="GreenBar"><tr><td valign="middle" class="L">#BODY#</td><td width="30" class="C"><br /></td><td valign="middle" class='
||'"R" align="right"><span style="margin-right:10px;">#CLOSE#</span>#COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#</td></tr></tbody></table>',
''))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6675929305641049.4859)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_ID#">#BODY#</div>'
,p_page_plug_template_name=>'Breadcrumb Region'
,p_theme_id=>3
,p_theme_class_id=>6
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6676416472641049.4859)
,p_layout=>'TABLE'
,p_template=>'<table class="htmldbGBR" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#"><thead><tr><th class="T">#TITLE#</th><th class="BT">#CLOSE#&nbsp;#EDIT##EXPAND##HELP##DELETE##COPY##CREATE#<img src="#IMAGE_PREFIX#up_arrow.gif" al'
||'t="&TOP." class="pb" onclick="uF()"/></th></tr></thead><tbody><tr><td colspan="2" class="B">#BODY#</td></tr></tbody></table>'
,p_page_plug_template_name=>'Gray Box (worksheet)'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(348176930747494218.4859)
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
,p_reference_id=>42209615589242480.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(348178315010494220.4859)
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
,p_reference_id=>42210411889242480.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(388770208095784265.4859)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#PREVIOUS##BODY##NEXT#</div>'
,p_page_plug_template_name=>'APEX 5 - Div with ID, Class, and Region Attributes'
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
 p_id=>wwv_flow_api.id(719684209410942721.4859)
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
,p_reference_id=>174746301430371105.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719684836837942735.4859)
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
,p_reference_id=>687153470345619376.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719691677138942761.4859)
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
,p_reference_id=>689955986849128825.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719702549794942779.4859)
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
,p_reference_id=>678354360586321695.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719704379601942780.4859)
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
,p_reference_id=>17354206769599941.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719705012309942781.4859)
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
,p_reference_id=>174613223222362440.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719705787384942781.4859)
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
,p_reference_id=>174630015632506596.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719706437830942782.4859)
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
,p_reference_id=>174748721787471587.4859
,p_translate_this_template=>'N'
,p_template_comment=>'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI a-Button--goToTop" onclick="uF();" type="button" title="&TOP."><span class="a-Icon icon-up-chevron"></span></button>'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719716763420942796.4859)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <h2 class="u-VisuallyHidden">#TITLE#</h2>',
'  <div class="a-Region-body">',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Region (Hidden Heading)'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>717832816842067694.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719717435785942797.4859)
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
,p_reference_id=>698829239393878937.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719727766130942804.4859)
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
,p_reference_id=>183211208341566300.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719728426095942807.4859)
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
,p_reference_id=>174613705533399534.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719729116465942807.4859)
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
,p_reference_id=>174628415239478085.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719729865365942808.4859)
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
,p_reference_id=>174629130392501406.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719730593079942808.4859)
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
,p_reference_id=>399850559367741099.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719731261318942809.4859)
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
,p_reference_id=>702777601713950915.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(719731990154942810.4859)
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
,p_reference_id=>703469000349150769.4859
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6681909853641062.4859)
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
,p_reference_id=>9651611091899590.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6683027032641069.4859)
,p_list_template_current=>'<li class="a-LinksList-item is-current #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_noncurrent=>'<li class="a-LinksList-item #A03#"><a href="#LINK#" class="a-LinksList-link" #A02#><span class="a-LinksList-icon"><span class="t-Icon #IMAGE#"></span></span><span class="a-LinksList-label">#TEXT#</span><span class="a-LinksList-badge">#A01#</span></a>'
||'</li>'
,p_list_template_name=>'Unordered List (c:htmldbUl) From 4999'
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
,p_reference_id=>60219508156141083.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(388773697797786787.4859)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'APEX 5 - Navigation List'
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
,p_reference_id=>573607518145151423.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(388773934841786788.4859)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'APEX 5.0 Menu Popup'
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
,p_reference_id=>747588010155545129.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(719740035822969345.4859)
,p_list_template_current=>'<li class="a-ImageNav-item"><button type="button" data-link="#LINK#" class="a-ImageNav-link launch-aut #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></button></li>'
,p_list_template_noncurrent=>'<li class="a-ImageNav-item"><a href="#LINK#" class="a-ImageNav-link #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></a></li>'
,p_list_template_name=>'APEX 5.0 - Image Navigation'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<ul class="a-ImageNav #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>481290423891543508.4859
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td style="width: 20%">',
'	<a href="#LINK#" class="iconContainer" title="#TEXT_ESC_SC#">',
'		<span class="largeIcon"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></span>',
'		<span class="iconLabel">#TEXT#</span>',
'	</a>',
'</td>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(719740644210969351.4859)
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
,p_reference_id=>60219508156141083.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(719744974422969355.4859)
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
,p_reference_id=>692720897220784060.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(719752075880969362.4859)
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
,p_reference_id=>573607518145151423.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(719752749945969363.4859)
,p_list_template_current=>'<li class="a-Tabs-item is-active"><a href="#LINK#" class="a-Tabs-link">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="a-Tabs-item"><a href="#LINK#" class="a-Tabs-link">#TEXT#</a></li>'
,p_list_template_name=>'APEX 5.0 - Sub Tabs'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<div class="a-TabsContainer a-TabsContainer--subTabs"><ul class="a-Tabs a-Tabs--subTabButtons">'
,p_list_template_after_rows=>'</ul></div>'
,p_reference_id=>168708522102193705.4859
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="aSubTabs"><ul>',
'<li class="active"><a href="#LINK#" title="#TEXT_ESC_SC#"><span>#TEXT#</span></a></li>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(719753408696969364.4859)
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
,p_reference_id=>687902065557685310.4859
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(873644613350880195.4859)
,p_list_template_current=>'<a href="#LINK#" title="#TEXT_ESC_SC#" class="runediticons"><img src="#IMAGE_PREFIX##IMAGE#" alt="#TEXT#" title="#TEXT#" /></a>'
,p_list_template_noncurrent=>'<a href="#LINK#" title="#TEXT_ESC_SC#" class="runediticons"><img src="#IMAGE_PREFIX##IMAGE#" alt="#TEXT#" title="#TEXT#" /></a>'
,p_list_template_name=>'Run / Edit Page'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<table summary="" cellpadding="0" cellspacing="0" border="0" id="htmldbRunEdit"><tr><td class="htmldbRunEdit">&PAGE.&nbsp;&FB_FLOW_PAGE_ID.</td><td>'
,p_list_template_after_rows=>'</td></tr></table>'
,p_reference_id=>21869428576987437.4859
,p_list_template_comment=>'run edit page with icons shown in the top right corner'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1655476716389340490.4859)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="current"><div class="tbl"><a href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a></div><div class="tbr"><img alt="" src="#IMAGE_PREFIX#1px_trans.gif"></div></div>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="non-current"><div class="tbl"><a href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a></div><div class="tbr"><img alt="" src="#IMAGE_PREFIX#1px_trans.gif"></div></div>',
''))
,p_list_template_name=>'APEX 4.0 MIKE Region Tabbed Navigation'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<div id="subtabs" style="padding-left:6px;">'
,p_list_template_after_rows=>'</div>'
,p_reference_id=>168712225287236339.4859
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6679518318641053.4859)
,p_row_template_name=>'(DHTML) Automatic PPR Pagination Report 100%'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" cellspacing="0" class="htmldbStandard3"  border="0" summary="" id="#REGION_ID#" href="p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:pg_R_#REGION_ID#:NO:" style="width:100%;">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'#CSV_LINK#',
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
,p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6679518318641053.4859)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6679925011641056.4859)
,p_row_template_name=>'(DHTML) Automatic PPR Pagination Report from 4999'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#"><div class="of">#COLUMN_VALUE#</div></td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" cellspacing="0" class="htmldbStandard3"  border="0" summary="" id="#REGION_ID#" htmldb:href="p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:pg_R_#REGION_ID#:NO:">',
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
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#"><div class="of">#COLUMN_HEADER#</div></th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#TEXT#',
''))
,p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6679925011641056.4859)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6680513762641056.4859)
,p_row_template_name=>'APEX 4.0 - Standard Report'
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
,p_reference_id=>123725814882271159.4859
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6680513762641056.4859)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(719756401064973260.4859)
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
,p_reference_id=>488487951233692049.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(719765686149973274.4859)
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
,p_reference_id=>689060248369886348.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(719766306083973274.4859)
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
,p_reference_id=>17383712077884846.4859
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(719766306083973274.4859)
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>'OMIT'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(719768854998973277.4859)
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
,p_reference_id=>123725814882271159.4859
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(719768854998973277.4859)
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
 p_id=>wwv_flow_api.id(6683302430641069.4859)
,p_template_name=>'APEX 4.0 - Top Bar Label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a class="apex-ga-label" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_theme_id=>3
,p_theme_class_id=>0
,p_reference_id=>57728329098847875.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6683429755641072.4859)
,p_template_name=>'FormField_Optional'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6683514682641072.4859)
,p_template_name=>'FormField_Optional No Link'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="htmldbLabelOptional">'
,p_template_body2=>'</span></label>'
,p_theme_id=>3
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6683627983641072.4859)
,p_template_name=>'FormField_Required'
,p_template_body1=>'<em>*</em><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="aLabel aRequired"><a href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>' <span class="hideMeButHearMe">(#VALUE_REQUIRED#)</span></a></label>'
,p_on_error_after_label=>'<small class="aError">#ERROR_MESSAGE#</small>'
,p_theme_id=>3
,p_theme_class_id=>2
,p_reference_id=>17388508175892042.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(719737144024952633.4859)
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
,p_reference_id=>692681574974429799.4859
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(719737202731952639.4859)
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
,p_reference_id=>687907221148719616.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(719737377976952639.4859)
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
,p_reference_id=>487444299516703815.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(719737479015952640.4859)
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
,p_reference_id=>492676964457041934.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(719737577300952641.4859)
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
,p_reference_id=>487443659585685414.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(719737671382952642.4859)
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
,p_reference_id=>492677038682043223.4859
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(6685028533641078.4859)
,p_name=>'Breadcrumbs (c:htmldbBreadcrumb) '
,p_current_page_option=>'<span class="htmldbBreadcrumb">#NAME#</span>'
,p_non_current_page_option=>'<a href="#LINK#" class="htmldbBreadcrumb" title="#NAME#">#NAME#</a>'
,p_between_levels=>'<span class="htmldbBreadcrumbSep"><img alt="" src="#IMAGE_PREFIX#apex/apex_top_sep.gif"></span>'
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>60115300853820165.4859
,p_translate_this_template=>'N'
);
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(388777204236790831.4859)
,p_name=>'APEX 5 - Breadcrumbs'
,p_before_first=>'<ul class="a-Breadcrumb">'
,p_current_page_option=>'<li class="a-Breadcrumb-item a-Breadcrumb-item is-active"><span class="a-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="a-Breadcrumb-item"><a href="#LINK#" class="a-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(6685219659641084.4859)
,p_page_name=>'winlov'
,p_page_title=>'検索ダイアログ・ボックス'
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
,p_find_button_text=>'検索'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'閉じる'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'次 &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; 戻る'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">行#FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>200
,p_before_result_set=>'<div class="a-PopupLOV-links">'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>17343114994581872.4859
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(6685118440641079.4859)
,p_cal_template_name=>'Default Calander'
,p_day_of_week_format=>'<th scope="col" width="14%" class="htmldbDayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="htmldbCalendarHolder" cellpadding="0" cellspacing="0" border="0" width="100%" summary="" role="presentation"><tr>',
'<td class="htmldbMonthTitle">#IMONTH# #YYYY#</td>',
'</tr>',
'<tr><td>'))
,p_month_open_format=>'<table class="htmldbCalendar" cellpadding="0" cellspacing="3" border="0" width="100%" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td></tr></table>',
'',
''))
,p_day_title_format=>'<div class="htmldbDayTitle">#DD#</div>'
,p_day_open_format=>'<td class="htmldbDay">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="htmldbToday">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="htmldbWeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td class="htmldbWeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="htmldbNonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="htmldbNonDay">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr>'
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>3
,p_theme_class_id=>1
);
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
 p_id=>wwv_flow_api.id(204025807133792433.4859)
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
 p_id=>wwv_flow_api.id(697251294722708867.4859)
,p_theme_id=>101
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698694776128187820.4859)
,p_theme_id=>101
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698695498474187821.4859)
,p_theme_id=>101
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698696193838187821.4859)
,p_theme_id=>101
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698697787201187821.4859)
,p_theme_id=>101
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719685315860942741.4859)
,p_theme_id=>101
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719686065595942753.4859)
,p_theme_id=>101
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719687083065942754.4859)
,p_theme_id=>101
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719693321199942765.4859)
,p_theme_id=>101
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719694346985942765.4859)
,p_theme_id=>101
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719696520421942771.4859)
,p_theme_id=>101
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719745438780969357.4859)
,p_theme_id=>101
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719756857955973266.4859)
,p_theme_id=>101
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(719759344431973269.4859)
,p_theme_id=>101
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746522780970832157.4859)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746524032352832160.4859)
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
 p_id=>wwv_flow_api.id(746524354430832160.4859)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746524636021832160.4859)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746525736498832161.4859)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746526003025832161.4859)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746526303910832162.4859)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746526607241832162.4859)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746526976589832162.4859)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746527492206832162.4859)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746527712264832162.4859)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750698972347419636.4859)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750699786949419639.4859)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750700275488419640.4859)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750700521792419640.4859)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750701252020419640.4859)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750721754465422866.4859)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(787120436131949721.4859)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(787120733611949723.4859)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(787121012780949723.4859)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(787121853109949723.4859)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(1021077947236574443.4859)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719749095572969359.4859)
,p_theme_id=>101
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(719745438780969357)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719749378327969359.4859)
,p_theme_id=>101
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(719745438780969357)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719749632408969359.4859)
,p_theme_id=>101
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(719745438780969357)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719749999172969359.4859)
,p_theme_id=>101
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(719745438780969357)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719750270888969359.4859)
,p_theme_id=>101
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(719745438780969357)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719750521283969360.4859)
,p_theme_id=>101
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719750827622969360.4859)
,p_theme_id=>101
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719751139188969360.4859)
,p_theme_id=>101
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719751444164969360.4859)
,p_theme_id=>101
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719751746273969360.4859)
,p_theme_id=>101
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719744974422969355.4859)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719761756589973270.4859)
,p_theme_id=>101
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719762074209973270.4859)
,p_theme_id=>101
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719762347743973271.4859)
,p_theme_id=>101
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719762657912973271.4859)
,p_theme_id=>101
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_api.id(719759344431973269)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719762981452973271.4859)
,p_theme_id=>101
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(719759344431973269)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719763261799973271.4859)
,p_theme_id=>101
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_api.id(719759344431973269)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719763565151973271.4859)
,p_theme_id=>101
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(719759344431973269)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719763866645973271.4859)
,p_theme_id=>101
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(719759344431973269)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719764136152973271.4859)
,p_theme_id=>101
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719764457918973271.4859)
,p_theme_id=>101
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719764796759973272.4859)
,p_theme_id=>101
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719765079854973272.4859)
,p_theme_id=>101
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(719765336086973272.4859)
,p_theme_id=>101
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719756401064973260.4859)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(719756857955973266)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747447930745062680.4859)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(746526607241832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747448195284062681.4859)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_api.id(746526976589832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747448314100062681.4859)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746527492206832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747448512100062681.4859)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_api.id(746526303910832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747448789732062681.4859)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_api.id(746526607241832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747448938441062681.4859)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_api.id(746526976589832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747449123999062681.4859)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_api.id(746524636021832160)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747449340190062681.4859)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(746524636021832160)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747449571553062681.4859)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_api.id(746524636021832160)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747449731770062681.4859)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_api.id(746527712264832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747449891888062681.4859)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747450089546062681.4859)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_api.id(746526303910832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747450122219062681.4859)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747450323348062681.4859)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_api.id(746524354430832160)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747450579040062682.4859)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_api.id(746524354430832160)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747450779854062682.4859)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(746526003025832161)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747450942414062682.4859)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(746524032352832160)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747451165030062682.4859)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_api.id(746525736498832161)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747451224088062682.4859)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747451425091062682.4859)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_api.id(746524354430832160)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747451600479062682.4859)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_api.id(746524354430832160)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747451867827062682.4859)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_api.id(746522780970832157)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747452046306062685.4859)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_api.id(746522780970832157)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747452223243062685.4859)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_api.id(746522780970832157)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747452449216062685.4859)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_api.id(746522780970832157)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747452689227062685.4859)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_api.id(746522780970832157)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747452829858062685.4859)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_api.id(746522780970832157)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754946063015083320.4859)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754946286739083320.4859)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(750700521792419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754946482307083320.4859)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(750700521792419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754946616505083322.4859)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754946893486083322.4859)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754946959496083322.4859)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754947190105083322.4859)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_api.id(750698972347419636)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(754947398925083322.4859)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719684836837942735.4859)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_api.id(750698972347419636)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787120568119949722.4859)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6680513762641056.4859)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(787120436131949721)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787120860598949723.4859)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6680513762641056.4859)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(787120733611949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787121118010949723.4859)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6680513762641056.4859)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_api.id(787121012780949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787121347377949723.4859)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6680513762641056.4859)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(787121012780949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787121505745949723.4859)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6680513762641056.4859)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(787121012780949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787121668141949723.4859)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6680513762641056.4859)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787121959886949723.4859)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6680513762641056.4859)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_api.id(787121853109949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787125838975949728.4859)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719768854998973277.4859)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(787120436131949721)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787126056332949729.4859)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719768854998973277.4859)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(787120733611949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787126250641949729.4859)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719768854998973277.4859)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_api.id(787121012780949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787126475470949729.4859)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719768854998973277.4859)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(787121012780949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787126699665949729.4859)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719768854998973277.4859)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(787121012780949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787126737679949729.4859)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719768854998973277.4859)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787126986708949729.4859)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719768854998973277.4859)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_api.id(787121853109949723)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(940696364380341577.4859)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719753408696969364.4859)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1019608729798657537.4859)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(388773934841786788.4859)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1019608842503657537.4859)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(388773934841786788.4859)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1199562177116032430.4859)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(719734932326947858.4859)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746527492206832162)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525660373773182102.4859)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525660453236182102.4859)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525660576207182102.4859)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525660668772182102.4859)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525660853485182102.4859)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(1021077947236574443)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525661000539182102.4859)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(1021077947236574443)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525663443196182118.4859)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719740644210969351.4859)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525663555494182118.4859)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719740644210969351.4859)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525663691914182118.4859)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719740644210969351.4859)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525663701680182118.4859)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719740644210969351.4859)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525663988048182118.4859)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719740644210969351.4859)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(1021077947236574443)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525664122904182118.4859)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(719740644210969351.4859)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(1021077947236574443)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544816183566477996.4859)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719766306083973274.4859)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544816239334477996.4859)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719766306083973274.4859)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544816346635477997.4859)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(719766306083973274.4859)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554808167201408361.4859)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(750698972347419636)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554808376461408362.4859)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_api.id(750698972347419636)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554808538958408362.4859)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554808702062408362.4859)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554808992281408362.4859)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(750700275488419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554809198122408362.4859)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(750700521792419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554809350418408362.4859)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(750701252020419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554809541904408363.4859)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(750701252020419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554809723181408363.4859)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554809868131408363.4859)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554810080669408363.4859)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719706437830942782.4859)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_api.id(750700521792419640)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554831128435526790.4859)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_api.id(719702549794942779.4859)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554831281587526791.4859)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719702549794942779.4859)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554831398178526791.4859)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719702549794942779.4859)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554838902558542255.4859)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554839044958542255.4859)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554839293090542255.4859)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554839447434542255.4859)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554839629067542255.4859)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(750700275488419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554839801508542255.4859)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(750700521792419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554840011745542255.4859)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(750701252020419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554840202523542255.4859)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(750701252020419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554840441586542256.4859)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(750721754465422866)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554840668183542256.4859)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719691677138942761.4859)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(750721754465422866)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554860289631550796.4859)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554860417345550796.4859)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_api.id(750698972347419636)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554860625063550796.4859)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(750701252020419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554860834521550796.4859)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(750700521792419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554861036468550796.4859)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554861239925550796.4859)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(750698972347419636)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554861401068550796.4859)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554861664175550796.4859)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(750701252020419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554861870266550796.4859)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(750700275488419640)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554862010703550796.4859)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(719717435785942797.4859)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(750699786949419639)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(693462905220662747.4859)
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
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149089898337366)
,p_name=>'CODE_EDITOR.REPLACE_SKIP'
,p_message_language=>'ja'
,p_message_text=>'スキップ'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149181131337366)
,p_name=>'CODE_EDITOR.REPLACE_ALL'
,p_message_language=>'ja'
,p_message_text=>'すべて置換'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149210304337366)
,p_name=>'CODE_EDITOR.REPLACE_INPUT'
,p_message_language=>'ja'
,p_message_text=>'置換'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149390989337366)
,p_name=>'CODE_EDITOR.FIND_INPUT'
,p_message_language=>'ja'
,p_message_text=>'検索'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149475488337366)
,p_name=>'CODE_EDITOR.CLOSE'
,p_message_language=>'ja'
,p_message_text=>'閉じる'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149561666337366)
,p_name=>'CODE_EDITOR.MATCH_RE'
,p_message_language=>'ja'
,p_message_text=>'正規表現'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149619788337366)
,p_name=>'CODE_EDITOR.MATCH_CASE'
,p_message_language=>'ja'
,p_message_text=>'大/小文字の区別'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149736653337366)
,p_name=>'CODE_EDITOR.SHOW_RULER'
,p_message_language=>'ja'
,p_message_text=>'ルーラーの表示'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149850936337366)
,p_name=>'CODE_EDITOR.SHORTCUT_TITLE'
,p_message_language=>'ja'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902149955293337366)
,p_name=>'CODE_EDITOR.THEMES'
,p_message_language=>'ja'
,p_message_text=>'テーマ'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150052199337366)
,p_name=>'CODE_EDITOR.INDENT_SIZE'
,p_message_language=>'ja'
,p_message_text=>'インデント・サイズ'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150195749337367)
,p_name=>'CODE_EDITOR.TAB_SIZE'
,p_message_language=>'ja'
,p_message_text=>'タブ・サイズ'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150237235337367)
,p_name=>'CODE_EDITOR.INDENT_WITH_TABS'
,p_message_language=>'ja'
,p_message_text=>'タブ挿入領域'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150355198337367)
,p_name=>'CODE_EDITOR.SHOW_LINE_NUMBERS'
,p_message_language=>'ja'
,p_message_text=>'行番号の表示'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150474522337367)
,p_name=>'CODE_EDITOR.USE_PLAIN_TEXT_EDITOR'
,p_message_language=>'ja'
,p_message_text=>'プレーン・テキスト・エディタの使用'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150537865337367)
,p_name=>'CODE_EDITOR.SETTINGS'
,p_message_language=>'ja'
,p_message_text=>'設定'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150606742337367)
,p_name=>'CODE_EDITOR.VALIDATE'
,p_message_language=>'ja'
,p_message_text=>'検証'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150773076337367)
,p_name=>'CODE_EDITOR.HINT'
,p_message_language=>'ja'
,p_message_text=>'オートコンプリート'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150800372337367)
,p_name=>'CODE_EDITOR.REPLACE'
,p_message_language=>'ja'
,p_message_text=>'置換'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902150916325337367)
,p_name=>'CODE_EDITOR.FIND_PREV'
,p_message_language=>'ja'
,p_message_text=>'前を検索'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902151099932337367)
,p_name=>'CODE_EDITOR.FIND_NEXT'
,p_message_language=>'ja'
,p_message_text=>'次を検索'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902151165683337367)
,p_name=>'CODE_EDITOR.FIND'
,p_message_language=>'ja'
,p_message_text=>'検索'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902151204089337367)
,p_name=>'CODE_EDITOR.REDO'
,p_message_language=>'ja'
,p_message_text=>'やり直し'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902151376919337367)
,p_name=>'CODE_EDITOR.UNDO'
,p_message_language=>'ja'
,p_message_text=>'元に戻す'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(902151488706337367)
,p_name=>'CODE_EDITOR.VALIDATION_SUCCESS'
,p_message_language=>'ja'
,p_message_text=>'検証成功'
,p_is_js_message=>true
);
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
 p_id=>wwv_flow_api.id(315392728012249274.4859)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'この削除操作を実行しますか。'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(1420362217001980473.4859)
,p_shortcut_name=>'OK_TO_GET_NEXT_PREV_PK_VALUE'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'このページを保存せずに閉じますか。'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(540039604917681918.4859)
,p_name=>'Internal Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=4550:8:&SESSION.'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_cookie_path=>'&CGI_SCRIPT_NAME.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>540226219724705040.4859
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_apex
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(113747616193665437.4859)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_display_name=>'APEX認証'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_apex'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113737019268347425.4859
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_cloud_idm
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356674103679447686.4859)
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
,p_reference_id=>113749806821809026.4859
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_db
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356677018501447690.4859)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.DB'
,p_display_name=>'INTERNALデータベース・アカウント'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.DB'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_db'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113749511183746276.4859
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_header
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356714620431447729.4859)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'
,p_display_name=>'INTERNAL HTTPヘッダー変数'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE:JQM_TABLET'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'),'')
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_header'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_header'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_header'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_header'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_header'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>708795120396802284.4859
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356714826109447729.4859)
,p_plugin_id=>wwv_flow_api.id(356714620431447729.4859)
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
 p_id=>wwv_flow_api.id(356715226328447729.4859)
,p_plugin_id=>wwv_flow_api.id(356714620431447729.4859)
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
 p_id=>wwv_flow_api.id(356715625060447730.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356715226328447729.4859)
,p_display_sequence=>10
,p_display_value=>'Redirect to Built-In URL'
,p_return_value=>'BUILTIN_URL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356716102777447730.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356715226328447729.4859)
,p_display_sequence=>20
,p_display_value=>'Redirect to URL'
,p_return_value=>'URL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356716812982447731.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356715226328447729.4859)
,p_display_sequence=>30
,p_display_value=>'Display Error'
,p_return_value=>'ERROR'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356717301112447732.4859)
,p_plugin_id=>wwv_flow_api.id(356714620431447729.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(356715226328447729.4859)
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
 p_id=>wwv_flow_api.id(356717723010447732.4859)
,p_plugin_id=>wwv_flow_api.id(356714620431447729.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(356715226328447729.4859)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ERROR'
,p_help_text=>'Specifies the error message to be displayed if the HTTP header variable does not contain a value or the HTTP header variable does not exist.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356718117275447732.4859)
,p_plugin_id=>wwv_flow_api.id(356714620431447729.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Verify Username'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ALWAYS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(356715226328447729.4859)
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
 p_id=>wwv_flow_api.id(356718523646447732.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356718117275447732.4859)
,p_display_sequence=>10
,p_display_value=>'Each Request'
,p_return_value=>'ALWAYS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356719006191447733.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356718117275447732.4859)
,p_display_sequence=>20
,p_display_value=>'After Login'
,p_return_value=>'CALLBACK'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356719524049447733.4859)
,p_plugin_id=>wwv_flow_api.id(356714620431447729.4859)
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
 p_id=>wwv_flow_api.id(356785826007447783.4859)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'
,p_display_name=>'INTERNAL LDAPディレクトリ'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE:JQM_TABLET'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_ldap'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>863910941135523528.4859
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>ログイン・ページで指定されたLDAPディレクトリの認証のために、ユーザー名およびパスワードを入力してください。パスワードは大/小文字が区別されます。</p>',
''))
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356786126109447783.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
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
 p_id=>wwv_flow_api.id(356786512722447783.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
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
 p_id=>wwv_flow_api.id(356786924086447785.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
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
 p_id=>wwv_flow_api.id(356787310773447789.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356786924086447785.4859)
,p_display_sequence=>10
,p_display_value=>'SSL'
,p_return_value=>'SSL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356787811096447789.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356786924086447785.4859)
,p_display_sequence=>20
,p_display_value=>'SSL with Authentication'
,p_return_value=>'SSL_AUTH'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356788327860447789.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356786924086447785.4859)
,p_display_sequence=>30
,p_display_value=>'No SSL'
,p_return_value=>'NO_SSL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356788802127447789.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
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
 p_id=>wwv_flow_api.id(356789212920447789.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
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
 p_id=>wwv_flow_api.id(356789604423447789.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Search Filter'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(356789212920447789.4859)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the search filter when not using an exact distinguished name (DN). Use <strong>%LDAP_USER%</strong> as a place-holder for the username. For example:',
'</p>',
'<p><pre>cn=%LDAP_USER%</pre></p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(356790016159447790.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
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
 p_id=>wwv_flow_api.id(356790429871447790.4859)
,p_plugin_id=>wwv_flow_api.id(356785826007447783.4859)
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
 p_id=>wwv_flow_api.id(356790826964447790.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356790429871447790.4859)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356791330010447790.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356790429871447790.4859)
,p_display_sequence=>20
,p_display_value=>'Only special characters'
,p_return_value=>'ONLY'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(356791830303447791.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(356790429871447790.4859)
,p_display_sequence=>30
,p_display_value=>'No Escaping'
,p_return_value=>'NO'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_sso
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(356820723668447809.4859)
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
,p_reference_id=>113750429890071859.4859
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/com_oracle_apex_developer_authorization
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(852575313487939509.4859)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_display_name=>'開発者の認可'
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
,p_reference_id=>12457518297512494.4859
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(786859129856512840.4859)
,p_plugin_id=>wwv_flow_api.id(852575313487939509.4859)
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
 p_id=>wwv_flow_api.id(786859582059512840.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>10
,p_display_value=>'ADMIN: Ability to manage flow developer privileges'
,p_return_value=>'ADMIN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786860016578512841.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>20
,p_display_value=>'EDIT: Ability change all attributes of specified flow(s)'
,p_return_value=>'EDIT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786860517600512841.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>30
,p_display_value=>'HELP: Ability edit help page for a given company'
,p_return_value=>'HELP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786861062823512842.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>40
,p_display_value=>'BROWSE: Access to Oracle data dictionary browser'
,p_return_value=>'BROWSE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786861576769512842.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>50
,p_display_value=>'CREATE: Ability to create new flows'
,p_return_value=>'CREATE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786862070345512842.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>60
,p_display_value=>'MONITOR: Ability to monitor flow activity'
,p_return_value=>'MONITOR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786862507250512842.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>70
,p_display_value=>'DB_MONITOR: Ability to monitor Oracle database attributes'
,p_return_value=>'DB_MONITOR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786863065493512843.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>80
,p_display_value=>'SQL: Ability to issues SQL statements'
,p_return_value=>'SQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786863571025512843.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>90
,p_display_value=>'USER_MANAGER: Manage user accounts for cookie based authentication'
,p_return_value=>'USER_MANAGER'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786864096990512843.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>100
,p_display_value=>'DATA_LOADER: Data Workshop'
,p_return_value=>'DATA_LOADER'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786864588869512843.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>110
,p_display_value=>'RESTFUL: Ability to enable RESTful Services'
,p_return_value=>'RESTFUL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786865010547512844.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(786859129856512840.4859)
,p_display_sequence=>120
,p_display_value=>'PKG_APPS: Ability to install packaged applications'
,p_return_value=>'PKG_APPS'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_code_editor
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2638440060724883493.4859)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.CODE_EDITOR'
,p_display_name=>'コード・エディタ'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.CODE_EDITOR'),'')
,p_render_function=>'wwv_flow_f4000_plugins.render_code_editor'
,p_ajax_function=>'wwv_flow_f4000_plugins.ajax_code_editor'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:SOURCE:ELEMENT:WIDTH:HEIGHT:ENCRYPT'
,p_substitute_attributes=>true
,p_reference_id=>1510773430399830292.4859
,p_subscribe_plugin_settings=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_plugin_id=>wwv_flow_api.id(2638440060724883493.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667025468599599100.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667025917919599100.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>20
,p_display_value=>'HTML'
,p_return_value=>'HTMLMIXED'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667026407844599101.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>30
,p_display_value=>'CSS'
,p_return_value=>'CSS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667026952538599101.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>40
,p_display_value=>'JavaScript'
,p_return_value=>'JAVASCRIPT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667027982435599101.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>45
,p_display_value=>'DDL'
,p_return_value=>'DDL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667027409311599101.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>50
,p_display_value=>'PL/SQL Block'
,p_return_value=>'PLSQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667029425527599102.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>60
,p_display_value=>'PL/SQL Functions/Procedures'
,p_return_value=>'PLSQL_FUNCTIONS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667028471794599102.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>70
,p_display_value=>'PL/SQL Expression'
,p_return_value=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667028905818599102.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_display_sequence=>80
,p_display_value=>'PL/SQL Function Body'
,p_return_value=>'PLSQL_FUNCTION_BODY'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1667029915877599102.4859)
,p_plugin_id=>wwv_flow_api.id(2638440060724883493.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Return Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL_EXPRESSION,PLSQL_FUNCTION_BODY'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667030349380599102.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667029915877599102.4859)
,p_display_sequence=>10
,p_display_value=>'VARCHAR2'
,p_return_value=>'VARCHAR2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1667030832626599103.4859)
,p_plugin_attribute_id=>wwv_flow_api.id(1667029915877599102.4859)
,p_display_sequence=>20
,p_display_value=>'BOOLEAN'
,p_return_value=>'BOOLEAN'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1667031351049599103.4859)
,p_plugin_id=>wwv_flow_api.id(2638440060724883493.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Show Query Builder'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1667025014506599100.4859)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1667031748878599103.4859)
,p_plugin_id=>wwv_flow_api.id(2638440060724883493.4859)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Adjustable Height'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_help_text=>'If Yes the user can adjust the height of the code editor.'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(4971601142302345.4859)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'デスクトップ'
,p_display_seq=>10
,p_use_auto_detect=>true
,p_is_default=>true
,p_theme_id=>3
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_global_page_id=>.4859
,p_navigation_list_id=>wwv_flow_api.id(719172975581246435.4859)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_api.id(719752075880969362.4859)
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
 p_id=>.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
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
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388765343250781060.4859)
,p_plug_name=>'APEX 5 - Header'
,p_region_css_classes=>'a-Header apex-sql-workshop'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
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
 p_id=>wwv_flow_api.id(388765545527781060.4859)
,p_plug_name=>'APEX 5 - Header Left'
,p_parent_plug_id=>wwv_flow_api.id(388765343250781060.4859)
,p_region_css_classes=>'a-Header-col a-Header-col--left'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
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
 p_id=>wwv_flow_api.id(6690019401688459.4859)
,p_plug_name=>'APEX Tabs'
,p_region_name=>'a_Header_menu'
,p_parent_plug_id=>wwv_flow_api.id(388765545527781060.4859)
,p_region_css_classes=>'a-Header-tabsContainer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(719172975581246435.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(388773697797786787.4859)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388765715263781060.4859)
,p_plug_name=>'APEX 5 - Logo'
,p_parent_plug_id=>wwv_flow_api.id(388765545527781060.4859)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'sys.htp.p(''<a href="f?p=4500:1000:''||:APP_SESSION||''::''||:DEBUG||''::::" class="a-Header-logo" title="''||wwv_flow_lang.system_message(''HOME_NAV'')||''"><span class="a-Header-apexLogo"></span></a>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388765918985781061.4859)
,p_plug_name=>'APEX 5 - Home Link'
,p_parent_plug_id=>wwv_flow_api.id(388765545527781060.4859)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
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
 p_id=>wwv_flow_api.id(388766163882781061.4859)
,p_plug_name=>'APEX 5 - Header Right'
,p_parent_plug_id=>wwv_flow_api.id(388765343250781060.4859)
,p_region_css_classes=>'a-Header-col a-Header-col--right'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>50
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
 p_id=>wwv_flow_api.id(388766385158781061.4859)
,p_plug_name=>'APEX 5 - Search'
,p_parent_plug_id=>wwv_flow_api.id(388766163882781061.4859)
,p_region_css_classes=>'a-Header-search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
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
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388766531252781061.4859)
,p_plug_name=>'APEX 5 - Header Navigation Links'
,p_parent_plug_id=>wwv_flow_api.id(388766163882781061.4859)
,p_region_css_classes=>'a-Header-navLinks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>70
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
 p_id=>wwv_flow_api.id(388802482283857068.4859)
,p_plug_name=>'APEX 5 - Administration Menu'
,p_region_name=>'adminMenu'
,p_parent_plug_id=>wwv_flow_api.id(388766531252781061.4859)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(697672714234539780.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(388773934841786788.4859)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486772471745301734.4859)
,p_plug_name=>'APEX 5 - Help Menu'
,p_region_name=>'helpMenu'
,p_parent_plug_id=>wwv_flow_api.id(388766531252781061.4859)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(697677732086541316.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(388773934841786788.4859)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388766724611781061.4859)
,p_plug_name=>'APEX 5 - Header Account'
,p_parent_plug_id=>wwv_flow_api.id(388766163882781061.4859)
,p_region_css_classes=>'a-Header-account'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>80
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
 p_id=>wwv_flow_api.id(388766982392781062.4859)
,p_plug_name=>'APEX 5 - Control Bar'
,p_region_css_classes=>'a-ControlBar apex-sql-workshop'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>90
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
 p_id=>wwv_flow_api.id(388767112596781062.4859)
,p_plug_name=>'APEX 5 - Control Bar Left'
,p_parent_plug_id=>wwv_flow_api.id(388766982392781062.4859)
,p_region_css_classes=>'a-ControlBar-col a-ControlBar-col--noPadding'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>100
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
 p_id=>wwv_flow_api.id(388803868206871278.4859)
,p_plug_name=>'APEX 5 - Breadcrumb'
,p_parent_plug_id=>wwv_flow_api.id(388767112596781062.4859)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(6687412253641141.4859)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(388777204236790831.4859)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(388767384999781062.4859)
,p_plug_name=>'APEX 5 - Control Bar Right'
,p_parent_plug_id=>wwv_flow_api.id(388766982392781062.4859)
,p_region_css_classes=>'a-ControlBar-col'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>110
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
 p_id=>wwv_flow_api.id(1430615932721831909.4859)
,p_plug_name=>'RESTful Service'
,p_region_name=>'sideTree'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(388770208095784265.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_c1_cnt           pls_integer := 0;',
'  l_c2_cnt           pls_integer := 0;',
'  l_c3_cnt           pls_integer := 0;',
'  l_active_module    varchar2(20) := null;',
'  l_active_template  varchar2(20) := null;',
'  l_active_handler   varchar2(20) := null;',
'  l_active_new_temp  varchar2(20) := null;',
'  l_active_new_hand  varchar2(20) := null;',
'',
'begin',
'',
'  sys.htp.p(''<style>'');',
'  sys.htp.p(''#sideTree {width: 400px;}'');',
'  sys.htp.p(''#sideTree .rc-content-main {min-height: 600px;}'');',
'  sys.htp.p(''#apex-left-sidebar {width: 400px; margin-left: -410px;}'');',
'  sys.htp.p(''#apex-main {padding-left: 410px;}'');',
'  sys.htp.p(''</style>'');',
'  sys.htp.p(''<ul class="databaseServicesTree">'');',
'  ------------',
'  -- module',
'  --',
'  for c4 in ( select max(name) name from WWV_FLOW_RT$MODULES',
'                where id = :P10_ID',
'  ',
'  ) ',
'  loop',
'      l_c3_cnt := l_c3_cnt + 1;',
'      if :P10_ID = :ACTIVE_NODE then',
'          l_active_module := '' class="active"'';',
'      else',
'          l_active_module := null;',
'      end if;',
'      sys.htp.p(''<li''||l_active_module||''><a href="f?p=''||:app_id||'':10:''||:app_session||''::::P10_ID,ACTIVE_NODE:''||:P10_ID||'',''||:P10_ID||''" title="''||wwv_flow_lang.system_message(''DB_SERVICES_MODULE_NAME'')||'': ''||',
'                wwv_flow_escape.html(c4.name)||''" alt="''||wwv_flow_lang.system_message(''DB_SERVICES_MODULE_NAME'')||'': ''||',
'                wwv_flow_escape.html(c4.name)||''"><span class="visuallyhidden">''||wwv_flow_lang.system_message(''DB_SERVICES_MODULE_NAME'')||'':</span>''||',
'                wwv_flow_escape.html(c4.name)||''</a>'');',
'     ',
'      -- NEW',
'      sys.htp.p(''<ul>'');',
'      -- NEw  ',
'',
'      ------------',
'      -- templates',
'      -- ',
'      l_c1_cnt := 0;',
'      for c1 in (select id,',
'                        module_id,',
'                        uri_template,',
'                        priority,',
'                        etag_type,',
'                        etag_query,',
'                        created_by,',
'                        created_on,',
'                        updated_by,',
'                        updated_on,',
'                        (select max(uri_prefix) from WWV_FLOW_RT$MODULES m',
'                         where m.id = t.module_id) uri_prefix',
'                  from wwv_flow_rt$templates t',
'                 where module_id = :P10_ID',
'                   and security_group_id = :flow_security_group_id',
'                 order by uri_template)',
'      loop',
'          l_c1_cnt := l_c1_cnt + 1;',
'          if c1.id = :ACTIVE_NODE then',
'              l_active_template := '' active'';',
'          else',
'              l_active_template := null;',
'          end if;',
'          sys.htp.p(''<li class="method''||l_active_template||''"><a href="f?p=''||:app_id||'':11:''||:app_session||''::::P11_ID,ACTIVE_NODE:''||c1.id||'',''||c1.id||''" title="''||wwv_flow_lang.system_message(''DB_SERVICES_URI_TEMPLATE'')||'': ''||',
'                wwv_flow_escape.html(c1.uri_template)||''"><span class="visuallyhidden">''||wwv_flow_lang.system_message(''DB_SERVICES_URI_TEMPLATE'')||'':</span>''||wwv_flow_escape.html(c1.uri_template)||',
'              ''</a>'');',
'',
'          -- NEW',
'          sys.htp.p(''<ul>'');',
'          -- NEw',
'      ',
'          l_c2_cnt := 0;     ',
'          for c2 in (select id,',
'                            template_id,',
'                            source_type,',
'                            format,',
'                            method,',
'                            mimes_allowed,',
'                            items_per_page,',
'                            source,',
'                            created_by,',
'                            created_on,',
'                            updated_by,',
'                            updated_on',
'                     from wwv_flow_rt$handlers',
'                    where template_id = c1.id',
'                      and security_group_id = :flow_security_group_id',
'                    order by method)',
'          loop',
'              l_c2_cnt := l_c2_cnt + 1;',
'              if c2.id = :ACTIVE_NODE then',
'                  l_active_handler := '' active'';',
'              else',
'                  l_active_handler := null;',
'              end if;',
'/*              sys.htp.p(''<li class="parameter''||l_active_handler||''"><a href="f?p=''||:app_id||'':9:''||:app_session||'':::9:P9_ID,ACTIVE_NODE:''||c2.id||'',''||c2.id||''" title="''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER'')||'': ''||',
'                wwv_flow_escape.html(c2.method)||''" alt="''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER'')||'': ''||',
'                wwv_flow_escape.html(c2.method)||''">''||',
'                wwv_flow_escape.html(c2.method)||''</a></li>''); */',
'',
'               sys.htp.p(''<li class="parameter''||l_active_handler||''"><a href="f?p=''||:app_id||'':9:''||:app_session||'':::9:P9_ID,ACTIVE_NODE:''||c2.id||'',''||c2.id||''" title="''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER'')||'': ''||',
'                wwv_flow_escape.html(c2.method)||''" ><span class="visuallyhidden">''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER'')||'':</span>''||',
'                wwv_flow_escape.html(c2.method)||''</a></li>'');',
'               ',
'          end loop; -- c2 ',
'',
'          if :ACTIVE_NODE = 1 and :P9_TEMPLATE_ID = c1.id then',
'              l_active_new_hand := '' active'';',
'          else',
'              l_active_new_hand := null;',
'          end if;',
'',
'          sys.htp.p(''<li class="createLink parameter''||l_active_new_hand||''"><a href="f?p=''||:app_id||'':9:''||:app_session||',
'          '':::9:P9_TEMPLATE_ID,ACTIVE_NODE:''||c1.id||'',1" title="''||wwv_flow_lang.system_message(''db_services_create_handler'')||''" >''||wwv_flow_lang.system_message(''db_services_create_handler'')||''</a></li>'');',
'',
'--NEW',
'          sys.htp.p(''</ul>'');',
'          sys.htp.p(''</li>'');',
'--NEW',
'      end loop; -- c1',
'  ',
'      if :ACTIVE_NODE = 2 then',
'          l_active_new_temp := '' active'';',
'      else',
'          l_active_new_temp := null;',
'      end if;',
'',
'      sys.htp.p(''<li class="createLink method''||l_active_new_temp||''"><a href="f?p=''||:app_id||'':11:''||:app_session||',
'                '':::11:P11_MODULE_ID,ACTIVE_NODE:''||:P10_ID||'',2" title="''||wwv_flow_lang.system_message(''db_services_create_template'')||''" >''||wwv_flow_lang.system_message(''db_services_create_template'')||''</a></li>'');',
'',
'--NEW ',
'      sys.htp.p(''</ul>'');',
'      sys.htp.p(''</li>'');',
'--NEW',
'  end loop; -- c4',
'  sys.htp.p(''</ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'9,10,11,12'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1652096011106668228.4859)
,p_plug_name=>'例'
,p_region_template_options=>'#DEFAULT#:is-collapsed:a-Region--noPadding:a-Region--noBorder'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719691677138942761.4859)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.prn(''<br /><b>Uniform Resource Identifier (URI)</b>'');',
'sys.htp.prn(''<pre>'');',
'sys.htp.prn(''hr/employees/{ID}''||chr(10));',
'sys.htp.prn(''|_|_________|____|''||chr(10));',
'sys.htp.prn('' |     |      |''||chr(10));',
'sys.htp.prn('' |     |       -''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER_BIND_VARIABLE'')||chr(10));',
'sys.htp.prn('' |     | ''||chr(10));',
'sys.htp.prn('' |      - ''||wwv_flow_lang.system_message(''DB_SERVICES_TEMPLATE_URI'')||chr(10));',
'sys.htp.prn('' |''||chr(10));',
'sys.htp.prn(''  - ''||wwv_flow_lang.system_message(''DB_SERVICES_MODULE_URI'')||chr(10));',
'sys.htp.prn('' </pre>'');',
'',
'sys.htp.prn(''<br/><b>Module Name</b>'');',
'sys.htp.prn(''<pre>oracle.example.hr</pre>'');',
'sys.htp.prn(''<br/><b>URI Prefix</b>'');',
'sys.htp.prn(''<pre>hr/</pre>'');',
'sys.htp.prn(''<br/><b>URI Template</b>'');',
'sys.htp.prn(''<pre>employees/{ID}</pre>'');',
'sys.htp.prn(''<br/><b>Handler Method</b>'');',
'sys.htp.prn(''<pre>GET</pre>'');',
'sys.htp.prn(''<br/><b>Handler Source Type</b>'');',
'sys.htp.prn(''<pre>Query One Row</pre>'');',
'sys.htp.prn(''<br/><b>''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER_SOURCE'')||''</b>'');',
'sys.htp.prn(''<pre>select EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO                 ',
' from EMP where EMPNO = :ID</pre>'');',
'sys.htp.prn(''<br/><b>JSON</b><br/>'');',
'sys.htp.prn(''<pre>'');',
'sys.htp.prn(''{"items":[{"empno":7839,"ename":"KING","job":"PRESIDENT","hiredate":"1981-11-17T08:00:00Z"<br/>'');',
'sys.htp.prn('',"sal":5000,"deptno":10}]}'');',
'sys.htp.prn(''</pre>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'3,10,11'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(388782753453839938.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(388765918985781061.4859)
,p_button_name=>'Home'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388776713638789177.4859)
,p_button_image_alt=>'ホーム'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=4500:1000:&SESSION.::&DEBUG.::::'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-home'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(388782965786839939.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(388766531252781061.4859)
,p_button_name=>'Administration'
,p_button_static_id=>'header-adminMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388776568320789175.4859)
,p_button_image_alt=>'管理'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-gears-alt'
,p_button_cattributes=>'data-menu="adminMenu_menu"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(388783141974839939.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(388766531252781061.4859)
,p_button_name=>'Feedback'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388776713638789177.4859)
,p_button_image_alt=>'フィードバック'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=4750:11001:&SESSION.::&DEBUG.:RP,11001:P11001_APPLICATION_ID,P11001_PAGE_ID:&APP_ID.,&APP_PAGE_ID.:'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-comments'
,p_grid_new_grid=>false
,p_required_patch=>wwv_flow_api.id(693462905220662747.4859)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(388783358311839939.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(388766531252781061.4859)
,p_button_name=>'Help'
,p_button_static_id=>'header-helpMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(388776568320789175.4859)
,p_button_image_alt=>'ヘルプ'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-help'
,p_button_cattributes=>'data-menu="helpMenu_menu"'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービス'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービス'
,p_step_sub_title=>'Database Services'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(719672816683933088.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20151205181311'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(314849921026177831.4859)
,p_plug_name=>'RESTfulサービス'
,p_region_template_options=>'#DEFAULT#:a-IRR-region--noOuterBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719702549794942779.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'    ''icon-sc-web-service'' the_icon,',
'    ''f?p=''||:APP_ID||'':10:''||:APP_SESSION||'':::10:P10_ID,ACTIVE_NODE:''||id||'',''||id the_link,',
'    ID,',
'    NAME,',
'    URI_PREFIX,',
'    ORIGINS_ALLOWED,',
'    ITEMS_PER_PAGE,',
'    STATUS,',
'    privilege_id,',
'    lower(CREATED_BY) CREATED_BY,',
'    CREATED_ON,',
'    lower(UPDATED_BY) UPDATED_BY,',
'    UPDATED_ON',
'from WWV_FLOW_RT$MODULES',
'where SECURITY_GROUP_ID = :flow_security_group_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(314850029566177831.4859)
,p_name=>'Database Services'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'この問合せは#MAX_ROW_COUNT#より多い行数を返します。結果が完全になるようにデータをフィルタ処理してください。'
,p_no_data_found_message=>'RESTfulサービスが定義されていません'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_use_custom=>'Y'
,p_icon_view_custom_link=>'<a href="#THE_LINK#" class="a-IRR-icon"><span class="a-Icon #THE_ICON#"></span><span class="a-IRR-iconName">#NAME#</span></a>'
,p_icon_view_columns_per_row=>5
,p_owner=>'MIKE'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314850214245177834.4859)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314850408116177836.4859)
,p_db_column_name=>'NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'モジュール名'
,p_column_link=>'#THE_LINK#'
,p_column_linktext=>'#NAME#'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314850505583177836.4859)
,p_db_column_name=>'URI_PREFIX'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'URI接頭辞'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314850626484177836.4859)
,p_db_column_name=>'ORIGINS_ALLOWED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'使用可能な起点'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314850710899177837.4859)
,p_db_column_name=>'ITEMS_PER_PAGE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'ページ当たりのアイテム数'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314850829662177837.4859)
,p_db_column_name=>'STATUS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'ステータス'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(316762018242533973)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314850920562177837.4859)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'作成者'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314851029320177837.4859)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'作成'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314851116142177837.4859)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'更新者'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(314851223860177837.4859)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'更新'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(315042220928203591.4859)
,p_db_column_name=>'THE_ICON'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'イメージ'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(315121931102216035.4859)
,p_db_column_name=>'THE_LINK'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'リンク'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1477786324163087649.4859)
,p_db_column_name=>'PRIVILEGE_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'権限'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1481196731126092675)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(431036115543701113.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>RESTfulサービスを使用すると、RESTfulサービスの宣言的仕様をSQLおよびPL/SQLにマップできます。各RESTfulサービスがモジュールと呼ばれ、URI接頭辞を識別します。各モジュールに1つ以上のテンプレートを指定できます。</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(873578727299868642.4859)
,p_plug_name=>'icon navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(873550610677863830.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(873644613350880195.4859)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1663039516185193367.4859)
,p_plug_name=>'タスク'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(1493530200311490901.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(317018302836567417.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(314849921026177831.4859)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'リセット'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,RIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(303564928182336535.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(314849921026177831.4859)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734932326947858.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3::'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(366350325573479076.4859)
,p_branch_name=>'Reset Sample Data'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'RESET_SAMPLE_DATA'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(932665420312561004.4859)
,p_validation_name=>'Check RESTful schema'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    c_schema constant wwv_flow_companies.first_schema_provisioned%type := wwv_flow_security.find_first_schema( p_security_group_id => :flow_security_group_id );',
'begin',
'    for c1 in ( select null',
'                  from sys.dba_users',
'                 where username = c_schema )',
'    loop',
'        return null;',
'    end loop;',
'',
'    return wwv_flow_lang.system_message( p_name => ''F4850.P1.SCHEMA_DOES_NOT_EXIST'',',
'                                         p0     => wwv_flow_escape.html( c_schema ) );',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'エラー'
,p_always_execute=>'N'
,p_validation_condition=>'RESET_SAMPLE_DATA'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(366350028809474473.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Sample Data'
,p_process_sql_clob=>'wwv_flow_listener.reset_sample_data;'
,p_process_error_message=>'サンプルのRESTfulサービス・データのリセット中にエラーが発生しました。'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESET_SAMPLE_DATA'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'サンプルのRESTfulサービス・データは正常にリセットされました。'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービスのエクスポート'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービスのエクスポート'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(719674703062933090.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(348181302763503934.4859)
,p_plug_name=>'ウィザード・ボタン'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(752122217336695898.4859)
,p_plug_name=>'RESTfulサービスのエクスポート'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719731990154942810.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(825514210852506690.4859)
,p_plug_name=>'RESTfulサービスのエクスポート'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:800px;"'
,p_plug_template=>wwv_flow_api.id(719731261318942809.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<br/>RESTfulサービス・メタデータをSQLスクリプト・ファイル形式にエクスポートします。このインスタンスまたは互換性のある別のApplication ExpressインスタンスにSQLスクリプトをインポートできます。<p/>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(825549419164509031.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(348181302763503934.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(825549624897509032.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(348181302763503934.4859)
,p_button_name=>'Export'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'エクスポート'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(825700400725522665.4859)
,p_name=>'P2_RESTFUL_SERVICE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(825514210852506690.4859)
,p_prompt=>'RESTfulサービス'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PICK MODULE'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''All Services'' d, 999 r from dual',
'union all',
'select name d, id r from WWV_FLOW_RT$MODULES ',
'where security_group_id = :flow_security_group_id',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- サービスの選択 -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'エクスポートするRESTfulサービスを指定します。ワークスペースのRESTfulサービスをすべてエクスポートするには、<b>「すべてのサービス」</b>を選択します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(835737417692928010.4859)
,p_name=>'P2_EXPORT_FILE_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(825514210852506690.4859)
,p_item_default=>'SQL'
,p_source=>'SQL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'この属性で、エクスポートするファイル形式が決定されます。SQLスクリプトはOracle Application Expressワークスペースにインポートできます。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1670990205226936919.4859)
,p_name=>'P2_FILE_CHARSET'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(825514210852506690.4859)
,p_item_default=>'nvl(lower(trim(sys.owa_util.get_cgi_env(''REQUEST_IANA_CHARSET''))),''utf-8'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'ファイルの文字セット:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'I18N_IANA_CHARSET'
,p_lov=>'.'||wwv_flow_api.id(1671084505895948418)||'.'
,p_cattributes_element=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'エクスポート・ファイルは、指定した文字セットでエンコードされます。'
,p_attribute_01=>'N'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1671361912030005092.4859)
,p_name=>'P2_SERVICE_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(825514210852506690.4859)
,p_prompt=>'エクスポートできるRESTfulサービスの数'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select count(*) c ',
'from WWV_FLOW_RT$MODULES ',
'where security_group_id = :flow_security_group_id'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'現在のワークスペースで定義されているRESTfulサービスの数を示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1671262700686982930.4859)
,p_validation_name=>'RESTful Service Not Null'
,p_validation_sequence=>10
,p_validation=>'P2_RESTFUL_SERVICE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'エクスポートするRESTfulサービスを選択する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(825549624897509032.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(825700400725522665.4859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(933767018114277671.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Export File'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'    -- Export All RESTful Services in Workspace',
'    if :P2_RESTFUL_SERVICE = 999 then',
'',
'        sys.htp.init;',
'        wwv_flow.g_page_text_generated := true;',
'        wwv_flow_gen_api2.g_mime_shown := true;',
'        sys.owa_util.mime_header (''application/x-sql'',false);',
'        sys.htp.p (',
'            ''Content-Disposition: attachment; filename=''||',
'            wwv_flow_utilities.encode_filename (',
'                replace(lower(replace(wwv_flow_lang.system_message(''DB_SERVICES_RESTFUL_SERVICES''), ''.'', ''_'')), '' '', ''_'')||''_''||sysdate||',
'                ''.sql'' ) );',
'        sys.owa_util.http_header_close;',
'',
'        wwv_flow_gen_api2.export_restful_services (',
'            p_commit    => ''YES'',',
'            p_format    => :P2_FORMAT );',
'',
'    else',
'',
'        -- Export Selected RESTful Service',
'        for c1 in (',
'            select name',
'              from wwv_flow_rt$modules',
'             where id = to_number(:P2_RESTFUL_SERVICE) )',
'        loop',
'            sys.htp.init;',
'            wwv_flow.g_page_text_generated := true;',
'            wwv_flow_gen_api2.g_mime_shown := true;',
'            sys.owa_util.mime_header (''application/x-sql'',false);',
'            sys.htp.p (',
'                ''Content-Disposition: attachment; filename=''||',
'                wwv_flow_utilities.encode_filename (',
'                    replace(lower(replace(wwv_flow_escape.html(c1.name), ''.'', ''_'')), '' '', ''_'')||',
'                    ''.sql'' ) );',
'            sys.owa_util.http_header_close;',
'',
'            wwv_flow_gen_api2.export_restful_service (',
'                p_module_id => :P2_RESTFUL_SERVICE,',
'                p_commit    => ''YES'',',
'                p_format    => :P2_FORMAT );',
'            exit;',
'        end loop;',
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(825549624897509032.4859)
,p_process_success_message=>'RESTfulサービスが正常にエクスポートされました。'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービス・モジュールの作成'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービス・モジュールの作成'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(719670183563933079.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(304327127776431653.4859)
,p_plug_name=>'RESTfulサービス・モジュール'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_footer=>'<br/>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1472423006082058889.4859)
,p_plug_name=>'リソース・テンプレート'
,p_parent_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="border-top: 1px solid #cccccc;padding:10px 0 10px 0;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
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
 p_id=>wwv_flow_api.id(1472518827254093392.4859)
,p_plug_name=>'リソース・ハンドラ'
,p_parent_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="border-top: 1px solid #cccccc;padding:10px 0 10px 0;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(417180817350539207.4859)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noBorder'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_04'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(431576920438730918.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>RESTfulサービスを使用すると、データベースへのRESTfulアクセスの宣言的仕様が可能です。これを作成するには、一連のUniform Resource Identifier (URI)を、SQL問合せまたは匿名PL/SQLブロックに構成します。URIのセットは、URIテンプレートで識別されます。</p><p>RESTfulサービス・モジュールは、よく使うテンプレート(リソース・テンプレートと言う)を共通のURI接頭辞でグループ化したものです。この接頭辞が、すべてのテンプレートの前に付'
||'きます。URIテンプレートは、URIを記述する単純な構文です。</p><p>ハンドラは、特定のHTTPメソッドを処理する問合せ、または匿名PL/SQLブロックです。1つのリソース・テンプレートに、複数のリソース・ハンドラを定義できますが、HTTPメソッドごとに使用できるハンドラは1つだけです。</p>',
''))
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(304327513110431653.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(417180817350539207.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(304327822910431653.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(417180817350539207.4859)
,p_button_name=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'モジュールの作成'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(304328505737431654.4859)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_ID:&P3_MODULE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(304327822910431653.4859)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(327533908504029252.4859)
,p_name=>'P3_MODULE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_prompt=>'名前'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'RESTfulサービス・モジュール名を入力します。RESTfulサービス・モジュールを使用して、Uniform Resource Identifier (URI)テンプレートを共通の接頭辞でグループ化します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(328242425267119175.4859)
,p_name=>'P3_STATUS'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_prompt=>'ステータス'
,p_source=>'PUBLISHED'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PUBLISHED NOT PUBLISHED'
,p_lov=>'.'||wwv_flow_api.id(316762018242533973)||'.'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'パブリッシュしたサービスは使用可能で、未公開のものは使用できません。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(328279824706128489.4859)
,p_name=>'P3_MODULE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_item_default=>'0'
,p_prompt=>'モジュール'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name, id ',
'from wwv_flow_rt$modules ',
'where security_group_id = :flow_security_group_id ',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 新規モジュール -'
,p_lov_null_value=>'0'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'RESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(829958421128351764.4859)
,p_name=>'P3_URI_PREFIX'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_prompt=>'URI接頭辞'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>255
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'これは、使用されるUniform Resource Identifier (URI)のベースです。  '
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1441198408541223455.4859)
,p_name=>'P3_ORIGINS_ALLOWED'
,p_item_sequence=>26
,p_item_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_prompt=>'使用可能な起点'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>リソース・テンプレートへのアクセスを許可されている起点のカンマ区切りのリスト。例:</p><p>',
'',
'http://example1.org, https://*.example2.com',
'</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1472304010060022224.4859)
,p_name=>'P3_URI_TEMPLATE'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_api.id(1472423006082058889.4859)
,p_prompt=>'URIテンプレート'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>81
,p_cMaxlength=>600
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Uniform Resource Identifier (URI)を識別するURIテンプレートを入力します。URIテンプレートは、<b>example/get/{id}</b>のようにURIを記述する単純な構文です。<p>URIテンプレートにはゼロから複数のパラメータを指定でき(たとえば、<b>{id}</b>)、それをSQL問合せや無名PL/SQLブロックでパラメータにバインドすることができます。次の構文ルールが適用されます。</p>',
'<ul>',
'<li>URIテンプレートをスラッシュ(/)文字で始めることはできません。</li>',
'<li>URIテンプレートにはUnicode文字を使用できます。</li>',
'<li>パラメータの宣言には中カッコ({})を使用します。</li>',
'<li>パラメータ名は英字で始め、ゼロ文字以上の英数字か、アンダースコア(_)、ハイフン(-)を続けます。</li>',
'<li>オプション・パラメータはサポートされません。</li>',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1472323525644026730.4859)
,p_name=>'P3_PRIORITY'
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_api.id(1472423006082058889.4859)
,p_item_default=>'0'
,p_prompt=>'優先度'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ZERO THROUGH 9'
,p_lov=>'.'||wwv_flow_api.id(792033515275240381)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'テンプレートの評価順序を示します。高い数値から先に評価されます。たとえば、2つのテンプレートが一致した場合、優先度9のテンプレートが優先度0のテンプレートよりも優先して選ばれます。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1472343003265029730.4859)
,p_name=>'P3_ETAG_TYPE'
,p_item_sequence=>65
,p_item_plug_id=>wwv_flow_api.id(1472423006082058889.4859)
,p_item_default=>'HASH'
,p_prompt=>'エンティティ・タグ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ETAG_TYPES'
,p_lov=>'.'||wwv_flow_api.id(792100407834275994)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'リソース・テンプレートで使用するエンティティ・タグのタイプを示します。エンティティ・タグは、リソースのバージョン識別子として機能するHTTPヘッダーです。エンティティ・タグ・ヘッダーを使用すると、以前に取得したリソースを取得せずに済み、リソースを更新するときにオプティミスティック・ロックを実行できます。次のオプションがあります:<p/>',
'<ul>',
'<li><b>セキュアなHASH:</b> 返されるリソース表現の内容を、セキュアなダイジェスト関数でハッシュし、特定のリソース・バージョンに一意のフィンガープリントを指定します。</li>',
'<li><b>問合せ:</b> リソース・バージョンを一意に識別する問合せを手動で定義します。多くの場合、手動で定義した問合せの方が、リソース表現の全体をハッシュするより効率的にエンティティ・タグを生成できます。</li>',
'<li><b>なし:</b> エンティティ・タグを生成しません。</li>',
'</ul>'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1472362512615032426.4859)
,p_name=>'P3_ETAG_QUERY'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_api.id(1472423006082058889.4859)
,p_prompt=>'エンティティ・タグ問合せ'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>58
,p_cMaxlength=>4000
,p_cHeight=>8
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'カスタム・エンティティ・タグの作成に使用される1つの行を返すSQL SELECT文。SELECT文の結果は、リソースの各バージョンを一意に識別する必要があります。例を次に示します。<p/>',
'',
'<i>select updated_on, updated_by from my_table where id = :id</i>'))
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1482015622711307901.4859)
,p_name=>'P3_PRIVILEGE'
,p_item_sequence=>85
,p_item_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_prompt=>'必要な権限'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRIVILEGES'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select label d, id r',
'  from wwv_flow_rt$privileges',
' where security_group_id = :flow_security_group_id',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 権限の割当て - '
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'このRESTfulサービス・モジュールへのアクセスを許可する際に必要な権限を指定します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1483954013566920227.4859)
,p_name=>'P3_METHOD'
,p_item_sequence=>95
,p_item_plug_id=>wwv_flow_api.id(1472518827254093392.4859)
,p_prompt=>'方法'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'HANDLER_METHODS'
,p_lov=>'.'||wwv_flow_api.id(793208615430277767)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- メソッドの選択 -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'リソース・ハンドラに使用されるHTTPメソッドを指定します。  次の4つのオプションがあります:<p/>',
'<ul>',
'<li><b>GET</b> - リソースの表現を取得します。</li>',
'<li><b>DELETE</b> - 既存のリソースを削除します。</li>',
'<li><b>POST</b> - 新しいリソースを作成するか、リソースをコレクションに追加します。</li>',
'<li><b>PUT</b> - 既存のリソースを更新します。</li>',
'</ul>',
'<p>1つのHTTPメソッドに指定できるハンドラは1つのみです。</p>'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1483973520146922181.4859)
,p_name=>'P3_SOURCE_TYPE'
,p_item_sequence=>105
,p_item_plug_id=>wwv_flow_api.id(1472518827254093392.4859)
,p_prompt=>'ソース・タイプ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P3_HANDLER_SOURCE_TYPES'
,p_lov=>'.'||wwv_flow_api.id(1484087224479961236)||'.'
,p_lov_cascade_parent_items=>'P3_METHOD'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'選択したHTTPメソッドのソース実装を定義します。次のオプションがあります:<p/>',
'<ul>',
'<li><b>問合せ</b> - SQL問合せを実行し、選択したフォーマットに応じてJavaScript Object Notation (JSON)形式またはCSV形式に結果セットを変換します。このオプションを使用できるのは、HTTPのGETメソッドを選択した場合のみです。</li>',
'<li><b>1行問い合せる</b> - 1行分のデータをJSON形式で返すSQL問合せを1回実行します。このオプションを使用できるのは、HTTPのGETメソッドを選択した場合のみです。</li>',
'<li><b>PL/SQL</b> - 無名PL/SQLブロックを実行し、OUTまたはIN/OUTパラメータをJSON形式に変換します。このオプションを使用できるのは、選択したHTTPメソッドがDELETE、PUT、POSTのいずれかの場合です。</li>',
'<li><b>フィード</b> - SQL問合せを実行し、結果をJSON Feed形式に変換します。フィードの各アイテムには、リソースのサマリーと、リソースの完全形式へのハイパーリンクが含まれます。結果セットの各行の最初の列はその行の一意な識別子でなければならず、path/to/feed/{id}という形式のハイパーリンクを生成するために使用されます。このとき、最初の列の値が{id}の値として使用されます。行の他の列は、リソースを要約するとみなされ、フィードに含まれます。リソースの完全形式のリソ'
||'ース・テンプレートも、別途定義する必要があります。</li>',
'<li><b>メディア・リソース</b> - 特定のフォーマットに従うSQL問合せを実行し、結果セットをバイナリ形式に変換します。これには、その形式のインターネット・メディア・タイプを指定するHTTP Content-Typeヘッダーが伴います。SQL問合せのフォーマットは、<p><i>SELECT ''content_type'', column FROM . . .となり、</i><br/><br/>',
'この場合の<i>''content_type''</i>は、受信データの識別に使用するためにブラウザに渡される文字列であり、たとえば、<i>''image/jpeg''</i>および<i>column</i>は、戻されるデータのソースを含む列の名前です。メディア・リソース・ソース・タイプは、一般的にイメージなどのメディア・オブジェクトに使用されますが、この場合、データは呼出しを行う受信者によって直接処理されます。</p>',
'',
'</li>',
'',
'</ul>'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1483993026726924065.4859)
,p_name=>'P3_FORMAT'
,p_is_required=>true
,p_item_sequence=>115
,p_item_plug_id=>wwv_flow_api.id(1472518827254093392.4859)
,p_prompt=>'書式'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'HANDLER_QUERY_FORMAT'
,p_lov=>'.'||wwv_flow_api.id(793264406688294176)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'結果を返す方法を定義します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1484042122832941854.4859)
,p_name=>'P3_SOURCE'
,p_item_sequence=>125
,p_item_plug_id=>wwv_flow_api.id(1472518827254093392.4859)
,p_prompt=>'ソース'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>59
,p_cMaxlength=>4000
,p_cHeight=>8
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'選択したHTTPメソッドを処理するSQL問合せ、またはPL/SQLブロックを指定します。1つのリソース・テンプレートに、複数のリソース・ハンドラを定義できます。追加のハンドラを定義するには、新規作成したRESTfulサービス・モジュールを編集します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1487576707587042344.4859)
,p_name=>'P3_TEMPLATE_LABEL'
,p_item_sequence=>43
,p_item_plug_id=>wwv_flow_api.id(1472423006082058889.4859)
,p_prompt=>'リソース・テンプレートの追加'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap" class="fielddatabold" '
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1487765829236086368.4859)
,p_name=>'P3_HANDLER_LABEL'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_api.id(1472518827254093392.4859)
,p_prompt=>'リソース・ハンドラの追加'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap" class="fielddatabold" '
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1765477505857393079.4859)
,p_name=>'P3_ITEMS_PER_PAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(304327127776431653.4859)
,p_item_default=>'25'
,p_prompt=>'ページ区切りサイズ'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'ページ区切りウィンドウのサイズを示します。データベース問合せの場合、これは返される行の数です。'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(328305831285130369.4859)
,p_computation_sequence=>10
,p_computation_item=>'P3_MODULE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1484918031059313249.4859)
,p_validation_name=>'Handler Source Must be Specified - When Method Selected'
,p_validation_sequence=>10
,p_validation=>'P3_SOURCE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'選択したリソース・ハンドラ・メソッド&P3_METHOD.に対して、#LABEL#を指定する必要があります。'
,p_always_execute=>'N'
,p_validation_condition=>'P3_METHOD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(304327822910431653.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(1484042122832941854.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1485000520585329185.4859)
,p_validation_name=>'Module Name Must be Specified'
,p_validation_sequence=>20
,p_validation=>'P3_MODULE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL#に値を指定する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(304327822910431653.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(327533908504029252.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1485181103448362038.4859)
,p_validation_name=>'UIR Template Must Be Specified When Method Selected'
,p_validation_sequence=>40
,p_validation=>'P3_URI_TEMPLATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL#に値を指定する必要があります。'
,p_always_execute=>'N'
,p_validation_condition=>'P3_METHOD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(304327822910431653.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(1472304010060022224.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1500815508610586058.4859)
,p_validation_name=>'Module Name Must be Unique per Workspace'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  for c1 in (select 1 from wwv_flow_rt$modules',
'             where name = :P3_MODULE_NAME',
'             and security_group_id = :flow_security_group_id)',
'  loop',
'      return false;',
'  end loop;',
'  return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'モジュール名&P3_MODULE_NAME.は、既存のモジュールによってすでに使用されています。モジュール名は一意でなければなりません。'
,p_always_execute=>'N'
,p_validation_condition=>'P3_MODULE_NAME'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(304327822910431653.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(327533908504029252.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1765596609676469803.4859)
,p_validation_name=>'Pagination Must be Specified'
,p_validation_sequence=>60
,p_validation=>'P3_ITEMS_PER_PAGE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL#に値を指定する必要があります。'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(1765477505857393079.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2544541212596667024.4859)
,p_validation_name=>'Validate URI Template'
,p_validation_sequence=>80
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_listener.is_valid_template(p_template=> :P3_URI_TEMPLATE) then',
'  return true;',
'else',
'  return false;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'URIテンプレートに、長さが100文字を超えるパラメータ名を含めることはできません。また、パラメータは、次の形式であることが必要です。',
'<br/><br/>',
'中括弧({)の後ろにアルファベットが1文字あり、最大99文字のアルファベットまたは特殊文字(_、-、.)が続き、閉じの中括弧(})で終了。'))
,p_always_execute=>'N'
,p_validation_condition=>'P3_URI_TEMPLATE'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(304327822910431653.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(1472304010060022224.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(328339719988136574.4859)
,p_name=>'show hide new module'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_MODULE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(328340029831136575.4859)
,p_event_id=>wwv_flow_api.id(328339719988136574.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_MODULE_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(328340221159136575.4859)
,p_event_id=>wwv_flow_api.id(328339719988136574.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_MODULE_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(328421310685162257.4859)
,p_name=>'show hide format'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_SOURCE_TYPE'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1484401026482056468.4859)
,p_event_id=>wwv_flow_api.id(328421310685162257.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_FORMAT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1484409032716058223.4859)
,p_event_id=>wwv_flow_api.id(328421310685162257.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_FORMAT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1472465509330069367.4859)
,p_name=>'Etag Query Display'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_ETAG_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1472465820168069367.4859)
,p_event_id=>wwv_flow_api.id(1472465509330069367.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_ETAG_QUERY'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1472466011487069368.4859)
,p_event_id=>wwv_flow_api.id(1472465509330069367.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_ETAG_QUERY'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1484537332762086656.4859)
,p_name=>'Handler Source Type Display'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_METHOD'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1484537621000086657.4859)
,p_event_id=>wwv_flow_api.id(1484537332762086656.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_SOURCE_TYPE,P3_FORMAT,P3_SOURCE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1484537805073086657.4859)
,p_event_id=>wwv_flow_api.id(1484537332762086656.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_SOURCE_TYPE,P3_FORMAT,P3_SOURCE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(327787501279055539.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create RESTful Service'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   l_module_id    number;',
'   l_template_id  number;',
'begin',
'',
'',
'if :P3_MODULE = ''0'' then',
'   insert into wwv_flow_rt$modules(',
'        name, ',
'        uri_prefix, ',
'        origins_allowed,',
'        items_per_page, ',
'        status,',
'        privilege_id',
'    ) ',
'    values (',
'        :P3_MODULE_NAME, ',
'        :P3_URI_PREFIX, ',
'        null,',
'        :P3_ITEMS_PER_PAGE, ',
'        :P3_STATUS,',
'        :P3_PRIVILEGE)',
'    returning id into l_module_id;',
'    :P3_MODULE   := l_module_id;',
'    :ACTIVE_NODE := l_module_id;',
'',
'    if :P3_URI_TEMPLATE is not null then',
'        insert into wwv_flow_rt$templates (',
'             module_id,',
'             uri_template,',
'             priority,',
'             etag_type,',
'             etag_query',
'        ) ',
'        values (',
'            l_module_id,',
'            :P3_URI_TEMPLATE,',
'            :P3_PRIORITY,',
'            :P3_ETAG_TYPE,',
'            :P3_ETAG_QUERY)',
'        returning id into l_template_id;',
' ',
'    end if;',
' ',
'    if :P3_METHOD is not null then',
'        insert into wwv_flow_rt$handlers (',
'            template_id,',
'            method,',
'            format,',
'            source_type,',
'            source,',
'            require_https',
'        )',
'        values (',
'            l_template_id,',
'            :P3_METHOD,',
'            :P3_FORMAT,',
'            :P3_SOURCE_TYPE,',
'            :P3_SOURCE,',
'            ''YES'');',
'    end if;',
'',
'    commit;',
'',
'    -- Grant Connection to Oracle REST Data Services',
'    wwv_flow_security.grant_restful_connect;',
'else',
'   l_module_id := :P3_MODULE;',
'end if;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(304327822910431653.4859)
,p_process_success_message=>'RESTfulサービスが正常に作成されました。'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービス権限'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービス権限'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(719672816683933088.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1481362602354168216.4859)
,p_plug_name=>'RESTfulサービス権限'
,p_region_template_options=>'#DEFAULT#:a-IRR-region--noOuterBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719702549794942779.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''icon-util-webservice'' the_icon,',
'    ''f?p=''||:APP_ID||'':6:''||:APP_SESSION||'':::6:P6_ID:''||id the_link,',
'a.id, ',
'a.name,',
'a.label,',
'(select count(id) from wwv_flow_rt$modules where privilege_id = a.id) modules,',
'wwv_flow_escape.html(substr(a.description,1,100)) description,',
'a.comments,',
'a.security_group_id,',
'a.created_by,',
'a.created_on,',
'a.updated_by,',
'a.updated_on,',
'a.row_version_number',
'from wwv_flow_rt$privileges a',
'where security_group_id = :flow_security_group_id',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1481362824788168217.4859)
,p_name=>'RESTful Service Privileges'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'この問合せは#MAX_ROW_COUNT#より多い行数を返します。結果が完全になるようにデータをフィルタ処理してください。'
,p_no_data_found_message=>'データが見つかりません。'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_use_custom=>'Y'
,p_icon_view_custom_link=>'<a href="#THE_LINK#" class="a-IRR-icon"><span class="a-Icon #THE_ICON#"></span><span class="a-IRR-iconName">#NAME#</span></a>'
,p_icon_view_columns_per_row=>5
,p_owner=>'HILARY'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481362909554168221.4859)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363006248168222.4859)
,p_db_column_name=>'NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'名前'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ID:#ID#'
,p_column_linktext=>'#NAME#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363113610168226.4859)
,p_db_column_name=>'LABEL'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'ラベル'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363217930168226.4859)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'説明'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363324751168226.4859)
,p_db_column_name=>'COMMENTS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'コメント'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363418674168226.4859)
,p_db_column_name=>'SECURITY_GROUP_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'セキュリティ・グループID'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363522707168226.4859)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'作成者'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363623212168226.4859)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'作成'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363702848168227.4859)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'更新者'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363816718168227.4859)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'更新'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1481363924702168227.4859)
,p_db_column_name=>'ROW_VERSION_NUMBER'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'行バージョン番号'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1482212409430370283.4859)
,p_db_column_name=>'THE_ICON'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'アイコン'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1482212525894370286.4859)
,p_db_column_name=>'THE_LINK'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'リンク'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1499159212842792392.4859)
,p_db_column_name=>'MODULES'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'関連モジュール'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1493364107883464751.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>RESTfulサービス権限を使用すると、ユーザーとグループに基づく権限を作成でき、それをRESTfulサービスでのセキュリティ制約の割当てに使用できます。</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1493583821090496910.4859)
,p_plug_name=>'タスク'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(1493530200311490901.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6683027032641069.4859)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
,p_plug_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from wwv_flow_rt$privileges a',
'where security_group_id = :flow_security_group_id'))
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1481618806379199064.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1481362602354168216.4859)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'リセット'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,RIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1481364107551168228.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1481362602354168216.4859)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734932326947858.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6::'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービスのインポート'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービスのインポート'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(719674703062933090.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(348182004972513994.4859)
,p_plug_name=>'ウィザード・ボタン'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(752122312856695898.4859)
,p_plug_name=>'RESTfulサービスのインポート'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719731990154942810.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(835936732499951225.4859)
,p_plug_name=>'RESTfulサービスのインポート'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:800px;"'
,p_plug_template=>wwv_flow_api.id(719731261318942809.4859)
,p_plug_display_sequence=>11
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<br/>インポートするファイルを選択します。<p/>インポートしたファイルに、このワークスペースですでに使用されているRESTfulサービス名が含まれている場合には、既存のRESTfulサービスが削除され、ファイルからの新しい定義で置き換えられます。'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(836073906788962700.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(348182004972513994.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(836074103020962702.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(348182004972513994.4859)
,p_button_name=>'import'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'インポート'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1676495700514539251.4859)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(836000914622955500.4859)
,p_name=>'P5_SQL_SCRIPT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(835936732499951225.4859)
,p_prompt=>'ファイルのインポート'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>40
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'インポートするファイルを選択してください。'
,p_attribute_01=>'WWV_FLOW_FILES'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1671777721268149657.4859)
,p_name=>'P5_FILE_CHARSET'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(835936732499951225.4859)
,p_item_default=>'nvl(lower(trim(sys.owa_util.get_cgi_env(''REQUEST_IANA_CHARSET''))),''utf-8'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'ファイルの文字セット:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'I18N_IANA_CHARSET'
,p_lov=>'.'||wwv_flow_api.id(1671084505895948418)||'.'
,p_cHeight=>1
,p_cattributes_element=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'エクスポート・ファイルは、指定した文字セットでエンコードされます。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1672375317393318867.4859)
,p_name=>'P5_FILE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(835936732499951225.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1671872825901160455.4859)
,p_validation_name=>'Import file Not Null'
,p_validation_sequence=>10
,p_validation=>'P5_SQL_SCRIPT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL#に値を指定する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(836074103020962702.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(836000914622955500.4859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1672300517262309428.4859)
,p_validation_name=>'Not a valid export file'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_imp_parser.is_restful_export(:P4450_FILE_ID) then',
'   return false;',
'else',
'   return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'有効なRESTfulサービス・エクスポート・ファイルを選択する必要があります。'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(836074103020962702.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(836000914622955500.4859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1688815914323158180.4859)
,p_validation_name=>'P5_SQL_SCRIPT Not a Valid RESTful Service Export File'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_clob     clob;',
'    l_string   varchar2(32767);',
'    l_delim    varchar2(10) := chr(10)||''/'';',
'    l_last     number := 1;',
'    n          number := 0;',
'begin',
'',
'    for c1 in (select blob_content, file_charset',
'                 from wwv_flow_file_objects$',
'                where id = :P5_FILE_ID) loop',
'',
'        l_clob := wwv_flow_utilities.blob_to_clob(',
'                    p_blob    => c1.blob_content,',
'                    p_charset => :P5_FILE_CHARSET);',
'    end loop;',
'',
'    if instr(l_clob, ''wwv_flow_api.remove_restful_service'') > 0 then',
'        sys.dbms_lob.freetemporary( lob_loc => l_clob );',
'        return true;',
'    else',
'        sys.dbms_lob.freetemporary( lob_loc => l_clob );',
'        return false;',
'    end if;',
'exception when others then',
'    sys.dbms_lob.freetemporary( lob_loc => l_clob );',
'    return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL#は有効なRESTfulサービス・エクスポート・ファイルではありません。'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(836074103020962702.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(836000914622955500.4859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(914174503223342309.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'upload file'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_title     varchar2(4000) := null;',
'  l_file_type varchar2(4000) := null;',
'  l_flow_id   number := 0;',
'  l_file_id   number := 0;',
'  l_start     number := 0;',
'  l_owner     varchar2(100);',
'begin',
'  l_start := instr(:P5_SQL_SCRIPT,''/'',1)+1;',
'  l_title := substr(:P5_SQL_SCRIPT,l_start);',
'  l_file_type := ''RESTFUL_EXPORT''; ',
'  ',
'  --',
'  -- save file attributes',
'  --',
'  update wwv_flow_file_objects$ ',
'  set    title = l_title, ',
'         description = l_title||'' upload'',',
'         security_group_id = :flow_security_group_id,      ',
'         mime_type = ''application/text'',',
'         created_by = :flow_user,',
'         file_charset = :P460_FILE_CHARSET',
'  where name = :P5_SQL_SCRIPT;',
'  ',
'  for c1 in (select id',
'             from wwv_flow_file_objects$',
'             where name = :P5_SQL_SCRIPT',
'             and security_group_id = :flow_security_group_id)',
'  loop',
'     l_file_id := c1.id;',
'  end loop;             ',
'    ',
'  -- update flow id in wwv_flow_file_objects$',
'  update wwv_flow_file_objects$',
'  set file_type = l_file_type',
'  where name = :P5_SQL_SCRIPT;',
'',
'  l_owner := wwv_flow_security.find_first_schema(p_security_group_id => wwv_flow_security.g_security_group_id);',
'',
'  wwv_flow_imp_parser.parse (',
'        p_file_id          => l_file_id,',
'        p_parse_as_schema  => l_owner,',
'        p_install_as_flow  => null,',
'        p_original_flow_id => null,',
'        p_adjust_offset    => true );',
'',
'  -- Delete uploaded file from wwv_flow_file_objects$',
'  delete from wwv_flow_file_objects$',
'   where file_type = l_file_type',
'     and name = :P5_SQL_SCRIPT;',
'',
'end;'))
,p_process_error_message=>'RESTfulサービスのインポート中にエラーが発生しました。'
,p_process_success_message=>'RESTfulサービスが正常にインポートされました。'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービス権限の詳細'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービス権限の詳細'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(719670183563933079.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(348186514931535843.4859)
,p_plug_name=>'トップ・バー'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noBorder'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1481359110874168192.4859)
,p_plug_name=>'RESTfulサービス権限の詳細'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1502577210987258576.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>RESTfulサービス権限を使用すると、ユーザーとグループに基づく権限を作成でき、それをRESTfulサービスでのセキュリティ制約の割当てに使用できます。</p>',
'<p>既存のユーザー・グループに権限を割り当てるには、<b>「割当て済グループ」</b>を使用してグループを選択します。</p>',
'<p>権限を割り当てるRESTfulサービス・モジュールを選択するには、<b>「保護されたモジュール」</b>シャトルを使用します。1つのモジュールに割り当てることのできる権限は1つだけです。</p>'))
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1503988405960569372.4859)
,p_plug_name=>'コメント'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1481359725287168196.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(348186514931535843.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1481359509686168196.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(348186514931535843.4859)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'削除'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P6_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1481359405275168196.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(348186514931535843.4859)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'変更の適用'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P6_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1481359325157168196.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(348186514931535843.4859)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P6_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1481360315897168198.4859)
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1481360521739168199.4859)
,p_name=>'P6_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1481359110874168192.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1481360715399168205.4859)
,p_name=>'P6_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1481359110874168192.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'名前'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'RESTfulサービス権限を示す名前を入力します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1481360913225168206.4859)
,p_name=>'P6_LABEL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1481359110874168192.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ラベル'
,p_source=>'LABEL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'RESTfulサービス権限を示すラベル値を入力します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1481361126755168206.4859)
,p_name=>'P6_DESCRIPTION'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_api.id(1481359110874168192.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'説明'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>43
,p_cMaxlength=>4000
,p_cHeight=>2
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'RESTfulサービス権限の簡単な説明を入力します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1481361326853168207.4859)
,p_name=>'P6_COMMENTS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1503988405960569372.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'コメント'
,p_source=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cMaxlength=>4000
,p_cHeight=>3
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'コメントをオプションで入力します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1499741302780338342.4859)
,p_name=>'P6_MODULES'
,p_item_sequence=>47
,p_item_plug_id=>wwv_flow_api.id(1481359110874168192.4859)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_column      varchar2(32767) := null;',
'    l_all_columns varchar2(32767) := null;',
'begin',
'    for c1 in (',
'       select name',
'         from wwv_flow_rt$modules',
'        where security_group_id = :flow_security_group_id',
'          and privilege_id = :P6_ID',
'       order by name',
'    ) loop',
'        l_all_columns := l_all_columns||c1.name||'':'';',
'    end loop;',
'',
'    return rtrim(l_all_columns,'':'');',
' ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'保護されたモジュール'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r from (',
'select name d, id r',
'from wwv_flow_rt$modules',
'where security_group_id = :flow_security_group_id',
'and privilege_id is null)'))
,p_cSize=>150
,p_cMaxlength=>4000
,p_cHeight=>10
,p_cAttributes=>'nowrap="nowrap"'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'この権限を割り当てる1つ以上のモジュールを選択します。1つのモジュールに割り当てることのできる権限は1つだけです。'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1511194715694592616.4859)
,p_name=>'P6_GROUP'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(1481359110874168192.4859)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  for c1 in (select id from wwv_flow_fnd_user_groups',
'              where group_name = ''RESTful Services''',
'                and security_group_id = 10)',
'  loop',
'      return c1.id;',
'  end loop;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'割当て済グループ'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select user_group_id from wwv_flow_rt$privilege_groups',
'where security_group_id = :flow_security_group_id',
'and privilege_id = :P6_ID'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USER_GROUPS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select group_name d, id r',
'from   wwv_flow_fnd_user_groups',
'where  security_group_id = :flow_security_group_id',
'union all',
'select group_name d, id r',
'from wwv_flow_fnd_user_groups',
'where  security_group_id = 10',
'and :flow_security_group_id <> 10',
'and group_name = ''RESTful Services'''))
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>6
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'この権限を割り当てるユーザー・グループを示します。1つの権限を少なくとも1つのグループに割り当てる必要があります。デフォルトでは、RESTfulサービス・グループに1つの権限が割り当てられます。RESTfulサービス・グループに割り当てられた権限によって保護されているRESTfulサービス・モジュールにアクセスしたいユーザーがいる場合には、ワークスペース管理者がRESTfulサービス・グループにそのユーザーを割り当てる必要があります。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1481361702962168210.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WWV_FLOW_RT$PRIVILEGES'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$PRIVILEGES'
,p_attribute_03=>'P6_ID'
,p_attribute_04=>'ID'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1503104607842380669.4859)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Associations to Removed Privilege'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  -- Remove association to Modules',
'  update wwv_flow_rt$modules',
'     set privilege_id = null',
'   where privilege_id = :P6_ID;',
'',
'  -- Remove association to User Groups',
'  delete from wwv_flow_rt$privilege_groups',
'   where privilege_id = :P6_ID',
'     and security_group_id = :flow_security_group_id;',
'',
'   commit;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1481359509686168196.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1481361926344168210.4859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WWV_FLOW_RT$PRIVILEGES'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$PRIVILEGES'
,p_attribute_03=>'P6_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'P6_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'アクションが処理されました。'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1495911220134895657.4859)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Module-Privilege Relationship'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    j int := 0;',
'    c wwv_flow_global.vc_arr2;',
'begin',
'',
'    c := wwv_flow_utilities.string_to_table2(:P6_MODULES);',
'',
'    -- Insert New Module-Privilege Relationships',
'    for j in 1..c.count loop',
'        update wwv_flow_rt$modules',
'           set privilege_id = :P6_ID',
'         where id = c(j)',
'           and security_group_id = :flow_security_group_id;',
'    end loop;',
'    commit;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1481359325157168196.4859)
,p_process_when=>'P8_MODULES'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1495926525675897195.4859)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Module-Privilege Relationship'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    j int := 0;',
'    k int := 0;',
'    l_existing_modules   varchar2(4000) := null;',
'    l_selected_modules   varchar2(4000) := null;',
'    c wwv_flow_global.vc_arr2;',
'    d wwv_flow_global.vc_arr2;',
'    e wwv_flow_global.vc_arr2;',
'begin',
'',
'    l_selected_modules := :P6_MODULES;',
'    c := wwv_flow_utilities.string_to_table2(:P6_MODULES);',
'',
'    for j in 1..c.count loop',
'        if not wwv_flow_utilities.is_numeric(c(j)) then',
'            select id into e(j) from wwv_flow_rt$modules where name = c(j)',
'               and security_group_id = :flow_security_group_id;',
'            l_selected_modules := replace(l_selected_modules,c(j),e(j));',
'        else',
'            e(j) := c(j); ',
'        end if;',
'    end loop;',
'',
'    -- Retrieve List of Existing Protected Modules',
'    for c1 in (select id from wwv_flow_rt$modules',
'                where privilege_id = :P6_ID)',
'    loop',
'        l_existing_modules := l_existing_modules||c1.id||'':'';',
'    end loop;',
'',
'    -- No Modules Available for Selection',
'    if l_existing_modules is null and l_selected_modules is null then',
'        null;',
'',
'    -- New Modules Selected',
'    elsif l_existing_modules is null and l_selected_modules is not null then',
'',
'        -- Insert New Module-Privilege Relationships',
'        for j in 1..e.count loop',
'',
'            update wwv_flow_rt$modules',
'               set privilege_id = :P6_ID',
'             where id = e(j)',
'               and security_group_id = :flow_security_group_id;',
'        end loop;',
'        commit;',
'',
'    -- Remove Existing Module-Privilege Relationships',
'    elsif l_existing_modules is not null and l_selected_modules is null then',
'',
'        update wwv_flow_rt$modules',
'           set privilege_id = null',
'         where privilege_id = :P6_ID',
'           and security_group_id = :flow_security_group_id;',
'            ',
'        commit;',
'',
'    -- Existing Modules and New Modules Selected - Update Accordingly',
'    elsif l_existing_modules is not null and l_selected_modules is not null then',
'',
'        for j in 1..e.count loop',
'',
'            -- Newly Selected Module',
'            if instr(l_existing_modules,e(j)) = 0 then',
'                update wwv_flow_rt$modules',
'                   set privilege_id = :P6_ID',
'                 where id = e(j)',
'                   and security_group_id = :flow_security_group_id;',
'                commit;',
'',
'            -- Selected Module Already Associated to Privilege',
'            elsif instr(l_existing_modules,e(j)) > 0 then',
'                l_existing_modules := replace(l_existing_modules,e(j));',
'            end if;',
'            commit;',
'        end loop;',
'',
'        -- Delete Any Removed Relationships',
'        d := wwv_flow_utilities.string_to_table2(l_existing_modules);',
'',
'        for k in 1..d.count loop',
'          update wwv_flow_rt$modules',
'             set privilege_id = null',
'           where privilege_id = :P6_ID',
'             and id = d(k)',
'             and security_group_id = :flow_security_group_id;',
'          commit;',
'        end loop;',
'    end if;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1481359405275168196.4859)
,p_process_when=>'P8_MODULES'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1511859820477764368.4859)
,p_process_sequence=>64
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Privilege-Group Assignments'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  j int := 0;',
'  c wwv_flow_global.vc_arr2;',
'begin',
'',
'    c := wwv_flow_utilities.string_to_table2(:P6_GROUP);',
'',
'    -- Insert New Privilege-Group Assignment',
'    for j in 1..c.count loop',
'        insert into wwv_flow_rt$privilege_groups(privilege_id,user_group_id)',
'                   values(:P6_ID,c(j));',
'    end loop;',
'    commit;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1481359325157168196.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1511605603583664825.4859)
,p_process_sequence=>65
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Privilege-Group Assignments'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  j int := 0;',
'  k int := 0;',
'  l_selected_grps    varchar2(4000) := null;',
'  l_existing_grps    varchar2(4000) := null;',
'  c wwv_flow_global.vc_arr2;',
'  d wwv_flow_global.vc_arr2;',
'begin',
'    l_selected_grps := :P6_GROUP;',
'    c := wwv_flow_utilities.string_to_table2(:P6_GROUP);',
'',
'    -- Retrieve List of Existing Privilege-Group Assignments',
'    for c1 in (select distinct user_group_id from wwv_flow_rt$privilege_groups',
'                where privilege_id = :P6_ID)',
'    loop',
'        l_existing_grps := l_existing_grps||c1.user_group_id||'':'';',
'    end loop;',
'',
'    -- No Groups Selected',
'    if l_existing_grps is null and l_selected_grps is null then',
'        null;',
'',
'    -- New Group Selected',
'    elsif l_existing_grps is null and l_selected_grps is not null then',
'',
'        -- Insert New Privilege-Group Assignment',
'        for j in 1..c.count loop',
'',
'            insert into wwv_flow_rt$privilege_groups(privilege_id,user_group_id)',
'                       values(:P6_ID,c(j));',
'        end loop;',
'        commit;',
'',
'    -- Remove Existing Privilege-Group Assignments',
'    elsif l_existing_grps is not null and l_selected_grps is null then',
'',
'        delete from wwv_flow_rt$privilege_groups',
'         where privilege_id = :P6_ID',
'           and security_group_id = :flow_security_group_id;',
'            ',
'        commit;',
'',
'    -- Existing Groups and New Group Selected - Update Accordingly',
'    elsif l_existing_grps is not null and l_selected_grps is not null then',
'',
'        for j in 1..c.count loop',
'',
'            -- Newly Selected Group',
'            if instr(l_existing_grps,c(j)) = 0 then',
'                insert into wwv_flow_rt$privilege_groups (privilege_id, user_group_id)',
'                          values(:P6_ID,c(j));',
'                commit;',
'',
'            -- Selected Group Already Associated to Privilege',
'            elsif instr(l_existing_grps,c(j)) > 0 then',
'                l_existing_grps := replace(l_existing_grps,c(j));',
'            end if;',
'            commit;',
'        end loop;',
'',
'        -- Delete Any Removed Assignments',
'        d := wwv_flow_utilities.string_to_table2(l_existing_grps);',
'',
'        for k in 1..d.count loop',
'          delete from wwv_flow_rt$privilege_groups',
'           where privilege_id = :P6_ID',
'             and user_group_id = d(k)',
'             and security_group_id = :flow_security_group_id;',
'          commit;',
'        end loop;',
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1481359405275168196.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1481362110253168210.4859)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'6'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1481359509686168196.4859)
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'クライアント登録'
,p_page_mode=>'NORMAL'
,p_step_title=>'クライアント登録'
,p_step_sub_title=>'RESTful Service Privilege Groups'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(719672816683933088.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_plug_name=>'クライアント登録'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6674714399641047.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1504542129313651862.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6674010598641046.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<p>クライアントを登録すると、RESTfulサービス権限をApplication Expressのアプリケーションに関連付け、それをRESTfulサービスでのセキュリティ制約の割当てに使用できます。<br/>選択したアプリケーションに割り当てるRESTfulサービス権限を選択するには、<b>「権限」</b>シャトルを使用します。</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1504542329439651862.4859)
,p_plug_name=>'コメント'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6674714399641047.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1504538922478651854.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1504539519555651854.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1504539320140651854.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'変更の適用'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1504539111714651854.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_image_alt=>'削除'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1504544332492651869.4859)
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1504539726779651855.4859)
,p_name=>'P7_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1504539923994651857.4859)
,p_name=>'P7_APPLICATIONS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_prompt=>'アプリケーション'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select id||''. ''||name||decode(build_status,''RUN_ONLY'','' - ''||sm.run_only,null)',
'      app_name, id r',
'from   wwv_flows f,',
'      (select wwv_flow_lang.system_message(''RUN'') run,',
'              wwv_flow_lang.system_message(''RUN_ONLY'') run_only,',
'              wwv_flow_lang.system_message(''RUN_AND_BUILD'') run_and_build,',
'              wwv_flow_lang.system_message(''F4000.YES'') t_yes,',
'              wwv_flow_lang.system_message(''F4000.NO'') t_no,',
'              wwv_flow_lang.system_message(''Unassigned'') t_unassigned',
'       from dual) sm',
'where',
'       security_group_id = :flow_security_group_id and',
'       f.build_status != ''RUN_AND_HIDDEN'' and',
'       not exists (',
'       select null from wwv_flow_language_map',
'       where translation_flow_id = f.id and',
'         security_group_id = :flow_security_group_id) and',
'       not exists (',
'       select null from wwv_flow_rt$clients',
'       where name = f.name and',
'         security_group_id = :flow_security_group_id) and',
'       (',
'       exists (',
'       select 1 from wwv_flow_developers',
'       where userid = :flow_user and',
'             flow_id is null and',
'             security_group_id = :flow_security_group_id)',
'       or',
'       exists (',
'       select 1 from wwv_flow_developers',
'       where userid = :flow_user and',
'             flow_id = f.id and',
'             security_group_id = :flow_security_group_id ))'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- アプリケーションの選択 -'
,p_cHeight=>1
,p_display_when=>'P7_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(6683627983641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'権限を登録するApplication Expressのアプリケーションを選択します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1504541411354651859.4859)
,p_name=>'P7_PRIVS'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_column      varchar2(32767) := null;',
'    l_all_columns varchar2(32767) := null;',
'begin',
'    for c1 in (',
'       select b.label',
'         from wwv_flow_rt$privileges b, wwv_flow_rt$client_privileges a',
'        where a.security_group_id = :flow_security_group_id',
'          and b.security_group_id = a.security_group_id',
'          and b.id = a.privilege_id',
'          and a.client_id = :P7_ID',
'        order by b.label',
'    ) loop',
'        l_all_columns := l_all_columns||c1.label||'':'';',
'    end loop;',
'',
'    return rtrim(l_all_columns,'':'');',
' ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'権限'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r from (',
'select label d, id r',
'from wwv_flow_rt$privileges',
'where security_group_id = :flow_security_group_id',
'and id not in (select privilege_id from wwv_flow_rt$client_privileges where security_group_id = :flow_security_group_id and client_id = :P7_ID))'))
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(6683627983641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'選択したアプリケーションに登録する1つ以上の権限を選択します。1つの権限を1つ以上のグループに割り当てることができます。'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1504542510412651862.4859)
,p_name=>'P7_COMMENTS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1504542329439651862.4859)
,p_prompt=>'コメント'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cMaxlength=>4000
,p_cHeight=>3
,p_field_template=>wwv_flow_api.id(6683429755641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'コメントをオプションで入力します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1514914507643009675.4859)
,p_name=>'P7_APP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_prompt=>'アプリケーション:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''Third Party Application'' r, 0 d from dual',
'union all',
'select id||''. ''||name||decode(build_status,''RUN_ONLY'','' - ''||sm.run_only,null)',
'      app_name, id r',
'from   wwv_flows f,',
'      (select wwv_flow_lang.system_message(''RUN'') run,',
'              wwv_flow_lang.system_message(''RUN_ONLY'') run_only,',
'              wwv_flow_lang.system_message(''RUN_AND_BUILD'') run_and_build,',
'              wwv_flow_lang.system_message(''F4000.YES'') t_yes,',
'              wwv_flow_lang.system_message(''F4000.NO'') t_no,',
'              wwv_flow_lang.system_message(''Unassigned'') t_unassigned',
'       from dual) sm',
'where',
'       security_group_id = :flow_security_group_id and',
'       f.build_status != ''RUN_AND_HIDDEN'' and',
'       not exists (',
'       select null from wwv_flow_language_map',
'       where translation_flow_id = f.id and',
'         security_group_id = :flow_security_group_id) and',
'       (',
'       exists (',
'       select 1 from wwv_flow_developers',
'       where userid = :flow_user and',
'             flow_id is null and',
'             security_group_id = :flow_security_group_id)',
'       or',
'       exists (',
'       select 1 from wwv_flow_developers',
'       where userid = :flow_user and',
'             flow_id = f.id and',
'             security_group_id = :flow_security_group_id ))'))
,p_cattributes_element=>'class="fielddatabold"'
,p_display_when=>'P7_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(6683429755641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'クライアントに登録されるアプリケーションを示します。アプリケーションは、Application Expressのアプリケーション、またはサードパーティのアプリケーションです。'
,p_attribute_01=>'N'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1645007507449009677.4859)
,p_name=>'P7_CLIENT_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_item_default=>'return to_char(wwv_flow_id.next_val);'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'クライアントID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>32
,p_field_template=>wwv_flow_api.id(6683627983641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'クライアントのIDを示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1645034518877013003.4859)
,p_name=>'P7_CLIENT_SECRET'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_prompt=>'クライアントの秘密'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>32
,p_field_template=>wwv_flow_api.id(6683429755641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'クライアントIDのパスワードを示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1654095522420863644.4859)
,p_name=>'P7_CLIENT_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1504538706569651852.4859)
,p_prompt=>'クライアント:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold"'
,p_display_when=>'P7_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(6683429755641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'登録されているクライアントの名前を示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1515947531659300436.4859)
,p_computation_sequence=>10
,p_computation_item=>'P7_APP_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nvl(apex_application_id,0) from wwv_flow_rt$clients',
'where id = :P7_ID',
'and security_group_id = :flow_security_group_id'))
,p_compute_when=>'P7_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1645079623510023770.4859)
,p_computation_sequence=>10
,p_computation_item=>'P7_CLIENT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select client_id from wwv_flow_rt$clients',
'where id = :P7_ID',
'and security_group_id = :flow_security_group_id'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1645165519832032208.4859)
,p_computation_sequence=>10
,p_computation_item=>'P7_CLIENT_SECRET'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select client_secret from wwv_flow_rt$clients',
'where id = :P7_ID',
'and security_group_id = :flow_security_group_id'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1654142807314868799.4859)
,p_computation_sequence=>10
,p_computation_item=>'P7_CLIENT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name from wwv_flow_rt$clients',
'where id = :P7_ID',
'and security_group_id = :flow_security_group_id'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1515011724397023926.4859)
,p_validation_name=>'Application Must Be Selected'
,p_validation_sequence=>10
,p_validation=>'P7_APPLICATIONS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL#を選択する必要があります。'
,p_always_execute=>'N'
,p_validation_condition=>'P7_ID'
,p_validation_condition_type=>'ITEM_IS_NULL'
,p_when_button_pressed=>wwv_flow_api.id(1504539519555651854.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(1504539923994651857.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1515090611153039024.4859)
,p_validation_name=>'At Least One Privilege Must Be Selected'
,p_validation_sequence=>20
,p_validation=>'P7_PRIVS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'1つ以上のモジュールを選択する必要があります。'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(1504541411354651859.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1656728706405578188.4859)
,p_validation_name=>'Client ID Cannot Be Null'
,p_validation_sequence=>30
,p_validation=>'P7_CLIENT_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL#に値を指定する必要があります。'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(1645007507449009677.4859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1504543420356651866.4859)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Client-Privilege Associations'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  delete from wwv_flow_rt$clients',
'   where id = :P7_ID',
'     and security_group_id = :flow_security_group_id;',
'     --and apex_application_id = :P7_APP_ID;',
'',
'   commit;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1504539111714651854.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1504543226350651866.4859)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Client-Privilege Association'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    j                    int                       := 0;',
'    l_client_id          number                    := null;',
'    l_app_id             number                    := null;',
'    l_app_name           varchar2(255)             := null;',
'    l_email_address      varchar2(255)             := null;',
'    c                    wwv_flow_global.vc_arr2;',
'begin',
'',
'    -- Retrieve user''s email address',
'    select email_address into l_email_address ',
'    from wwv_flow_fnd_user where user_name = :flow_user',
'     and security_group_id = :flow_security_group_id;',
'',
'    -- Retrieve Application Name',
'    select name into l_app_name from wwv_flows',
'     where id = :P7_APPLICATIONS',
'       and security_group_id = :flow_security_group_id;',
'',
'    -- Set Application Id',
'    l_app_id := :P7_APPLICATIONS;',
'',
'    insert into wwv_flow_rt$clients (auth_flow,',
'                                     response_type,',
'                                     name,',
'                                     apex_application_id,',
'                                     client_id,',
'                                     client_secret,',
'                                     support_email)',
'                              values(',
'                                     ''EXCHANGE'',',
'                                     ''TOKEN'',',
'                                     l_app_name,',
'                                     l_app_id,',
'                                     :P7_CLIENT_ID,--to_char(wwv_flow_id.next_val),',
'                                     :P7_CLIENT_SECRET,',
'                                     l_email_address)',
'                              returning id into l_client_id;    ',
'',
'    -- Insert New Client-Privileges',
'    c := wwv_flow_utilities.string_to_table2(:P7_PRIVS);',
'',
'    for j in 1..c.count loop',
'        insert into wwv_flow_rt$client_privileges (client_id, ',
'                                                   privilege_id) ',
'                                           values (',
'                                                   l_client_id,',
'                                                   c(j));',
'    end loop;',
'    commit;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1504539519555651854.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1504543003374651865.4859)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Module-Privilege Relationship'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    j int := 0;',
'    k int := 0;',
'    l_existing_privs   varchar2(4000) := null;',
'    l_selected_privs   varchar2(4000) := null;',
'    c wwv_flow_global.vc_arr2;',
'    d wwv_flow_global.vc_arr2;',
'    e wwv_flow_global.vc_arr2;',
'begin',
'',
'    l_selected_privs := :P7_PRIVS;',
'    c := wwv_flow_utilities.string_to_table2(:P7_PRIVS);',
'',
'    -- Update Client ID & Secret',
'    update wwv_flow_rt$clients',
'       set client_id = :P7_CLIENT_ID,',
'           client_secret = :P7_CLIENT_SECRET',
'     where id = :P7_ID;',
'',
'    for j in 1..c.count loop',
'        if not wwv_flow_utilities.is_numeric(c(j)) then',
'            select id into e(j) from wwv_flow_rt$privileges where label = c(j)',
'               and security_group_id = :flow_security_group_id;',
'            l_selected_privs := replace(l_selected_privs,c(j),e(j));',
'        else',
'            e(j) := c(j); ',
'        end if;',
'    end loop;',
'',
'    -- Retrieve List of Existing Privileges Associated with Client',
'    for c1 in (select privilege_id from wwv_flow_rt$client_privileges',
'                where client_id = :P7_ID',
'                  and security_group_id = :flow_security_group_id)',
'    loop',
'        l_existing_privs := l_existing_privs||c1.privilege_id||'':'';',
'    end loop;',
'',
'    -- No Privileges Available for Selection',
'    if l_existing_privs is null and l_selected_privs is null then',
'        null;',
'',
'    -- New Privileges Selected',
'    elsif l_existing_privs is null and l_selected_privs is not null then',
'',
'        -- Insert New Privilege-Group Assignment',
'        for j in 1..e.count loop',
'            insert into wwv_flow_rt$client_privileges(client_id,privilege_id) values(:P7_ID,e(j));',
'        end loop;',
'        commit;',
'',
'    -- Remove Existing Client-Privilege Assignments',
'    elsif l_existing_privs is not null and l_selected_privs is null then',
'',
'        delete from wwv_flow_rt$client_privileges',
'         where client_id = :P7_ID',
'           and security_group_id = :flow_security_group_id;',
'            ',
'        commit;',
'',
'    -- Existing Privileges and New Privileges Selected - Update Accordingly',
'    elsif l_existing_privs is not null and l_selected_privs is not null then',
'',
'        for j in 1..e.count loop',
'',
'            -- Newly Selected Privilege',
'            if instr(l_existing_privs,e(j)) = 0 then',
'                insert into wwv_flow_rt$client_privileges(client_id, privilege_id) values(:P7_ID, e(j));',
'                commit;',
'',
'            -- Selected Privilege Already Associated to Client',
'            elsif instr(l_existing_privs,e(j)) > 0 then',
'                l_existing_privs := replace(l_existing_privs,e(j));',
'            end if;',
'            commit;',
'        end loop;',
'',
'        -- Delete Any Removed Assignments',
'        d := wwv_flow_utilities.string_to_table2(l_existing_privs);',
'',
'        for k in 1..d.count loop',
'            delete from wwv_flow_rt$client_privileges',
'             where client_id = :P7_ID',
'               and privilege_id = d(k)',
'               and security_group_id = :flow_security_group_id;',
'',
'          commit;',
'        end loop;',
'    end if;',
'',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1504539320140651854.4859)
,p_process_when=>'P8_MODULES'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1504544004783651867.4859)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'6'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1504539111714651854.4859)
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'テスト・リソース・ハンドラ'
,p_page_mode=>'NORMAL'
,p_step_title=>'テスト・リソース・ハンドラ'
,p_step_sub_title=>'Test Resource Handler'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'',
'function saveBinds(){',
'  var c = 0;',
'  var arr1 = new Array();',
'  var arr2 = new Array();',
'  var get = new htmldb_Get(null,4850,''SAVE_BINDS'',8, null, ''wwv_flow.accept'');',
'  var url = $x(''P8_TEST_URL'').value; ',
'',
'  apex.jQuery("[name=f01]").each(function(){',
'    get.addParam(''f01'', this.value);',
'    arr1[c] = this.value;',
'    c = c+1;',
'  });',
'',
'  c = 0;',
'  apex.jQuery("[name=f02]").each(function(){',
'    get.addParam(''f02'', this.value);',
'    arr2[c] = this.value;',
'    c = c+1;',
'  });    ',
'  	        ',
'  var x = get.get(''FULL'');',
'  for (var i=0;i<arr1.length;i++) {',
'      url = url.replace(''{''+arr1[i].toLowerCase().replace('':'','''')+''}'',arr2[i]);',
'  }',
'  popUp2(url,''800'',''600'');',
'}',
'',
'function testQuery(){',
'  if (document.wwv_flow.f01) {',
'    saveBinds();',
'  }',
' ',
'}    ',
'            ',
'</script>',
''))
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
''))
,p_step_template=>wwv_flow_api.id(719672364834933087.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1733770413928176715.4859)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1733772827846176722.4859)
,p_plug_name=>'ソース'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1746459609587553150.4859)
,p_name=>'バインド変数の設定'
,p_parent_plug_id=>wwv_flow_api.id(1733772827846176722.4859)
,p_template=>wwv_flow_api.id(388770208095784265.4859)
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_binds sys.dbms_sql.varchar2_table;',
'begin',
'    if (htmldb_collection.collection_exists(''SET_BINDS'')=false) then',
'',
'        htmldb_collection.create_or_truncate_collection(p_collection_name => ''SET_BINDS'');',
'        l_binds := wwv_flow_utilities.get_binds(:P9_SOURCE);',
'',
'        for i in 1 .. l_binds.count ',
'        loop',
'            htmldb_collection.add_member(',
'                p_collection_name => ''SET_BINDS'',',
'                p_c001            => l_binds(i),',
'                p_generate_md5    => ''YES'' );',
'        end loop;',
'',
'    end if;',
'',
'    return ''',
'        select c001||wwv_flow_item.hidden(1,c001) c001, wwv_flow_item.text(2,c002) ',
'        from wwv_flow_collections ',
'        where collection_name = ''''SET_BINDS'''''';',
'end;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_display_when_condition=>'SET_BINDS'
,p_ajax_enabled=>'N'
,p_ajax_items_to_submit=>'P9_SOURCE'
,p_query_row_template=>wwv_flow_api.id(719768854998973277.4859)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'バインド変数が見つかりません。'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1746459804326553155.4859)
,p_query_column_id=>1
,p_column_alias=>'C001'
,p_column_display_sequence=>1
,p_column_heading=>'バインド変数'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1746459927708553155.4859)
,p_query_column_id=>2
,p_column_alias=>'WWV_FLOW_ITEM.TEXT(2,C002)'
,p_column_display_sequence=>2
,p_column_heading=>'値'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1733770616928176715.4859)
,p_button_sequence=>11
,p_button_plug_id=>wwv_flow_api.id(1733770413928176715.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::P9_TEMPLATE_ID:&P8_TEMPLATE_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1733771009972176718.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1733770413928176715.4859)
,p_button_name=>'TEST'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'テスト'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:testQuery();'
,p_button_condition=>'P8_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1733780410256176751.4859)
,p_branch_action=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(1733770616928176715.4859)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1733773023324176722.4859)
,p_name=>'P8_SOURCE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1733772827846176722.4859)
,p_item_default=>'&P9_SOURCE.'
,p_prompt=>'ソース'
,p_source=>'P9_SOURCE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>32767
,p_cHeight=>12
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'YES'
,p_help_text=>'選択したHTTPメソッドを処理するSQL問合せ、またはPL/SQLブロックを指定します。1つのリソース・テンプレートに、複数のリソース・ハンドラを定義できます。追加のハンドラを定義するには、新規作成したRESTfulサービス・モジュールを編集します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1733774909651176726.4859)
,p_name=>'P8_TEST_URL'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(1733772827846176722.4859)
,p_prompt=>'Test Resource Handler'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1746819013490611074.4859)
,p_name=>'P8_TEMPLATE_ID'
,p_item_sequence=>275
,p_item_plug_id=>wwv_flow_api.id(1733772827846176722.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1747198221895670291.4859)
,p_name=>'P8_ID'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(1733772827846176722.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1748829401612175403.4859)
,p_name=>'P8_WS_DISPLAY_NAME'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(1733772827846176722.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1747540208183751477.4859)
,p_computation_sequence=>10
,p_computation_item=>'P8_SOURCE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P9_SOURCE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1748721200658156203.4859)
,p_computation_sequence=>50
,p_computation_item=>'P8_WS_DISPLAY_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select display_name from wwv_flow_companies where provisioning_company_id = :flow_security_group_id'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1739972501689962650.4859)
,p_name=>'Set Source to Read Only'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_SOURCE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1739972812731962651.4859)
,p_event_id=>wwv_flow_api.id(1739972501689962650.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_SOURCE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1748672211262149779.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Test URL Setting'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  for i in 1..wwv_flow.g_f01.count loop   	   ',
'      htmldb_collection.update_member(',
'        p_collection_name => ''SET_BINDS'',',
'        p_seq             => i,',
'        p_c001            => wwv_flow.g_f01(i),',
'        p_c002            => wwv_flow.g_f02(i)',
'    );',
'  end loop;',
'',
'  htmldb_collection.update_member(',
'    p_collection_name => ''REST_QUERIES'',',
'    p_seq             => :P8_ID,',
'    p_clob001         => :P8_SOURCE,',
'    p_c002            => wwv_flow_utilities.table_to_string2(wwv_flow.g_f01,''|''),',
'    p_c003            => wwv_flow_utilities.table_to_string2(wwv_flow.g_f02,''|'')',
'  ); ',
'',
'  commit;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SET_BINDS'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'リソース・ハンドラ'
,p_page_mode=>'NORMAL'
,p_step_title=>'リソース・ハンドラ'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(754939123056928433.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20151205181313'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(415717831389309088.4859)
,p_plug_name=>'リソース・ハンドラ'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--sideRegion:a-Region--accessibleHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>リソース・ハンドラは、特定のHTTPメソッドを処理する問合せ、または',
'匿名PL/SQLブロックです。1つのリソース・テンプレートに複数のリソース・',
'ハンドラを定義できますが、HTTPメソッドごとに使用できるハンドラは1つのみです。</p>',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(417550318651558505.4859)
,p_plug_name=>'リソース・ハンドラ: &P9_CONTEXT2.'
,p_region_css_classes=>'a-Region--noTopBorder'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--showTitle'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1421455001426645001.4859)
,p_name=>'パラメータ'
,p_template=>wwv_flow_api.id(719706437830942782.4859)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'a-Region--stacked:a-Region--noPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#:a-Report--inline:a-Report--stretch'
,p_region_attributes=>'style="width: 100%"'
,p_new_grid_row=>false
,p_display_column=>1
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select id,',
'       name,',
'       bind_variable_name,',
'       access_method,',
'       source_type,',
'       param_type',
'  from wwv_flow_rt$parameters',
' where security_group_id = to_number(:flow_security_group_id)',
'   and handler_id = to_number(:P9_ID)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6680513762641056.4859)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'パラメータが定義されていません'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1421886809831704196.4859)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Edit'
,p_use_as_row_header=>'N'
,p_column_link=>'javascript:apex.submit({request:''UPDATE'',set:{''P9_HANDLER_ID'':''#ID#''}});'
,p_column_linktext=>'<img width="16" height="16" border="0" alt="編集" src="#IMAGE_PREFIX#menu/pencil16x16.gif"/>'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1421455313367645006.4859)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>2
,p_column_heading=>'名前'
,p_column_link=>'javascript:apex.submit({request:''UPDATE'',set:{''P9_HANDLER_ID'':''#ID#''}});'
,p_column_linktext=>'#NAME#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1479086417854530566.4859)
,p_query_column_id=>3
,p_column_alias=>'BIND_VARIABLE_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'バインド変数名'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1421455500048645006.4859)
,p_query_column_id=>4
,p_column_alias=>'ACCESS_METHOD'
,p_column_display_sequence=>4
,p_column_heading=>'アクセス方法'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(793423420718336071)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1479086501785530567.4859)
,p_query_column_id=>5
,p_column_alias=>'SOURCE_TYPE'
,p_column_display_sequence=>5
,p_column_heading=>'ソース・タイプ'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(793403203749331167)
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1421455703240645006.4859)
,p_query_column_id=>6
,p_column_alias=>'PARAM_TYPE'
,p_column_display_sequence=>6
,p_column_heading=>'パラメータ・タイプ'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(793443816001344104)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1423464203260128067.4859)
,p_plug_name=>'コメント'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6674714399641047.4859)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1423652610972187103.4859)
,p_plug_name=>'ソース'
,p_region_template_options=>'a-Region--flush:a-Region--noPadding:a-Region--sideRegion:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(871840316452657306.4859)
,p_plug_name=>'例'
,p_parent_plug_id=>wwv_flow_api.id(1423652610972187103.4859)
,p_region_template_options=>'#DEFAULT#:is-collapsed:a-Region--noBorder'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719691677138942761.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.prn(''<br /><b>Uniform Resource Identifier (URI)</b>'');',
'sys.htp.prn(''<pre>'');',
'sys.htp.prn(''hr/employees/{ID}''||chr(10));',
'sys.htp.prn(''|_|_________|____|''||chr(10));',
'sys.htp.prn('' |     |      |''||chr(10));',
'sys.htp.prn('' |     |       -''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER_BIND_VARIABLE'')||chr(10));',
'sys.htp.prn('' |     | ''||chr(10));',
'sys.htp.prn('' |      - ''||wwv_flow_lang.system_message(''DB_SERVICES_TEMPLATE_URI'')||chr(10));',
'sys.htp.prn('' |''||chr(10));',
'sys.htp.prn(''  - ''||wwv_flow_lang.system_message(''DB_SERVICES_MODULE_URI'')||chr(10));',
'sys.htp.prn('' </pre>'');',
'',
'sys.htp.prn(''<br/><b>Module Name</b>'');',
'sys.htp.prn(''<pre>oracle.example.hr</pre>'');',
'sys.htp.prn(''<br/><b>URI Prefix</b>'');',
'sys.htp.prn(''<pre>hr/</pre>'');',
'sys.htp.prn(''<br/><b>URI Template</b>'');',
'sys.htp.prn(''<pre>employees/{ID}</pre>'');',
'sys.htp.prn(''<br/><b>Handler Method</b>'');',
'sys.htp.prn(''<pre>GET</pre>'');',
'sys.htp.prn(''<br/><b>Handler Source Type</b>'');',
'sys.htp.prn(''<pre>Query One Row</pre>'');',
'sys.htp.prn(''<br/><b>''||wwv_flow_lang.system_message(''DB_SERVICES_HANDLER_SOURCE'')||''</b>'');',
'sys.htp.prn(''<pre>select EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO                 ',
' from EMP where EMPNO = :ID</pre>'');',
'sys.htp.prn(''<br/><b>JSON</b><br/>'');',
'sys.htp.prn(''<pre>{"items":[{"empno":7839,"ename":"KING","job":"PRESIDENT","hiredate":"1981-11-17T08:00:00Z","sal":5000,"deptno":10}]}</pre>'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1553816020133253411.4859)
,p_plug_name=>'テスト'
,p_parent_plug_id=>wwv_flow_api.id(1423652610972187103.4859)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':P9_ID is not null',
'and wwv_flow_listener.is_required_version',
'and :P9_METHOD = ''GET'''))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>RESTfulサービス・ハンドラの動作をテストするには、「テスト」ボタンをクリックします。RESTfulサービス・ハンドラが',
'    パラメータを使用する場合、「バインド変数の設定」ボタンをクリックして、パラメータのテスト値を設定します。テストする前に、',
'    「変更の適用」をクリックしてこのページのすべての変更が保存されていることを確認してください。適切な検索結果を得るために、',
'    JSONビューアがブラウザにインストールされていることを確認してください。',
'</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1430003820639430990.4859)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719704379601942780.4859)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1732541115320381853.4859)
,p_button_sequence=>260
,p_button_plug_id=>wwv_flow_api.id(1553816020133253411.4859)
,p_button_name=>'P9_TEST_BTN'
,p_button_static_id=>'P9_TEST_BTN'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'テスト'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:redirect(''&P9_TEST_URL.'');'
,p_button_execute_validations=>'N'
,p_button_cattributes=>'alt="Test Handler"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1733536230473105314.4859)
,p_button_sequence=>264
,p_button_plug_id=>wwv_flow_api.id(1553816020133253411.4859)
,p_button_name=>'P9_BIND_VARS'
,p_button_static_id=>'P9_BIND_VARS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734932326947858.4859)
,p_button_image_alt=>'バインド変数の設定'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'icon-right-chevron'
,p_button_cattributes=>'nowrap="nowrap"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1421556901688663938.4859)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(1421455001426645001.4859)
,p_button_name=>'CREATE_PARAMETER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734932326947858.4859)
,p_button_image_alt=>'パラメータの作成'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_HANDLER_ID:&P9_ID.'
,p_button_condition=>'P9_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(415718401230309089.4859)
,p_button_sequence=>11
,p_button_plug_id=>wwv_flow_api.id(417550318651558505.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::P11_ID:&P9_TEMPLATE_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(415718224764309088.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(417550318651558505.4859)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'削除'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P9_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(415718123163309088.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(417550318651558505.4859)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'変更の適用'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P9_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(415718014389309088.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(417550318651558505.4859)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P9_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1747904716158829506.4859)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::P8_ID,P8_TEMPLATE_ID:&P9_ID.,&P9_TEMPLATE_ID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(1733536230473105314.4859)
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'P9_BIND_VARS'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1422108524638727404.4859)
,p_branch_action=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_ID:&P9_HANDLER_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>5
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(415719030255309090.4859)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::ACTIVE_NODE:&P10_ID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1419956720632884447.4859)
,p_branch_action=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::ACTIVE_NODE:&P9_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>15
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313203204327299052.4859)
,p_name=>'P9_MODULE_ID'
,p_item_sequence=>275
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415719210986309091.4859)
,p_name=>'P9_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415719609228309098.4859)
,p_name=>'P9_TEMPLATE_ID'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'TEMPLATE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415719826088309099.4859)
,p_name=>'P9_SOURCE_TYPE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ソース・タイプ'
,p_source=>'SOURCE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P9_HANDLER_SOURCE_TYPES'
,p_lov=>'.'||wwv_flow_api.id(793236521795289048)||'.'
,p_lov_cascade_parent_items=>'P9_METHOD'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'選択したHTTPメソッドのソース実装を定義します。次のオプションがあります:<p/>',
'<ul>',
'<li><b>問合せ</b> - SQL問合せを実行し、選択したフォーマットに応じてJavaScript Object Notation (JSON)形式またはCSV形式に結果セットを変換します。このオプションを使用できるのは、HTTPのGETメソッドを選択した場合のみです。</li>',
'<li><b>1行問い合せる</b> - 1行分のデータをJSON形式で返すSQL問合せを1回実行します。このオプションを使用できるのは、HTTPのGETメソッドを選択した場合のみです。</li>',
'<li><b>PL/SQL</b> - 無名PL/SQLブロックを実行し、OUTまたはIN/OUTパラメータをJSON形式に変換します。このオプションを使用できるのは、選択したHTTPメソッドがDELETE、PUT、POSTのいずれかの場合です。</li>',
'<li><b>フィード</b> - SQL問合せを実行し、結果をJSON Feed形式に変換します。フィードの各アイテムには、リソースのサマリーと、リソースの完全形式へのハイパーリンクが含まれます。結果セットの各行の最初の列はその行の一意な識別子でなければならず、path/to/feed/{id}という形式のハイパーリンクを生成するために使用されます。このとき、最初の列の値が{id}の値として使用されます。行の他の列は、リソースを要約するとみなされ、フィードに含まれます。リソースの完全形式のリソ'
||'ース・テンプレートも、別途定義する必要があります。</li>',
'<li><b>メディア・リソース</b> - 特定のフォーマットに従うSQL問合せを実行し、結果セットをバイナリ形式に変換します。これには、その形式のインターネット・メディア・タイプを指定するHTTP Content-Typeヘッダーが伴います。SQL問合せのフォーマットは、<p><i>SELECT ''content_type'', column FROM . . .となり、</i><br/><br/>',
'この場合の<i>''content_type''</i>は、受信データの識別に使用するためにブラウザに渡される文字列であり、たとえば、<i>''image/jpeg''</i>および<i>column</i>は、戻されるデータのソースを含む列の名前です。メディア・リソース・ソース・タイプは、一般的にイメージなどのメディア・オブジェクトに使用されますが、この場合、データは呼出しを行う受信者によって直接処理されます。</p>',
'',
'</li>',
'',
'</ul>'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415720010022309099.4859)
,p_name=>'P9_FORMAT'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'書式'
,p_source=>'FORMAT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'HANDLER_QUERY_FORMAT'
,p_lov=>'.'||wwv_flow_api.id(793264406688294176)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'結果を返す方法を定義します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415720221233309099.4859)
,p_name=>'P9_METHOD'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_item_default=>'GET'
,p_prompt=>'方法'
,p_source=>'METHOD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'HANDLER_METHODS'
,p_lov=>'.'||wwv_flow_api.id(793208615430277767)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'リソース・ハンドラに使用されるHTTPメソッドを指定します。  次の4つのオプションがあります:<p/>',
'<ul>',
'<li><b>GET</b> - リソースの表現を取得します。</li>',
'<li><b>DELETE</b> - 既存のリソースを削除します。</li>',
'<li><b>POST</b> - 新しいリソースを作成するか、リソースをコレクションに追加します。</li>',
'<li><b>PUT</b> - 既存のリソースを更新します。</li>',
'</ul>',
'<p>1つのHTTPメソッドに指定できるハンドラは1つのみです。</p>'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415720400481309100.4859)
,p_name=>'P9_MIMES_ALLOWED'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'使用可能なMIMEタイプ'
,p_source=>'MIMES_ALLOWED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'HTTPリクエストで許可されているMIMEタイプのカンマ区切りリスト。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415720826157309101.4859)
,p_name=>'P9_ITEMS_PER_PAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ページ区切りサイズ'
,p_source=>'ITEMS_PER_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'ページ区切りウィンドウのサイズを示します。データベース問合せの場合、これは返される行の数です。'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415721201271309101.4859)
,p_name=>'P9_SOURCE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1423652610972187103.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ソース'
,p_source=>'SOURCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.CODE_EDITOR'
,p_cSize=>70
,p_cMaxlength=>4000
,p_cHeight=>12
,p_field_template=>wwv_flow_api.id(719737671382952642.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'選択したHTTPメソッドを処理するSQL問合せ、またはPL/SQLブロックを指定します。1つのリソース・テンプレートに、複数のリソース・ハンドラを定義できます。追加のハンドラを定義するには、新規作成したRESTfulサービス・モジュールを編集します。'
,p_attribute_01=>'DDL'
,p_attribute_02=>'VARCHAR2'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_item_comment=>'Mode has been set to DDL to disable the validation functionality. The reason is that the mode would have to be dynamic based on the "Source Type" of the Resource Handler and that''s currently not supported by the plug-in.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(415807630613325449.4859)
,p_name=>'P9_MODULE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'選択したRESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(827027518761754993.4859)
,p_name=>'P9_URI_PREFIX'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'URIテンプレートの接頭辞を示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(830884219537436467.4859)
,p_name=>'P9_URI_TEMPLATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'URIテンプレートを示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(832232305525546032.4859)
,p_name=>'P9_COMMENTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1423464203260128067.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'コメント'
,p_source=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>4000
,p_cHeight=>3
,p_colspan=>2
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6683429755641072.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'コメントをオプションで入力します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1422069832125720033.4859)
,p_name=>'P9_HANDLER_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1433796730285856069.4859)
,p_name=>'P9_CONTEXT'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'RESTfulサービス・モジュール:'
,p_source=>':P9_URI_PREFIX'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'RESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1488238422347387234.4859)
,p_name=>'P9_REQUIRES_HTTPS'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_item_default=>'YES'
,p_prompt=>'セキュア・アクセスが必要'
,p_source=>'REQUIRE_HTTPS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'HANDLER_SECURE_ACCESS'
,p_lov=>'.'||wwv_flow_api.id(1488736008597865790)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'HTTPSなど、セキュアなチャネルを介してリソースにアクセスするかどうかを示します。セキュア・アクセスが必要な場合には<b>「はい」</b>に設定します。<p/>'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1490230600257336469.4859)
,p_name=>'P9_CONTEXT2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(417550318651558505.4859)
,p_use_cache_before_default=>'NO'
,p_source=>':P9_METHOD'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P9_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1490285926576344125.4859)
,p_name=>'P9_RESOURCE_TEMPLATE'
,p_item_sequence=>7
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'URIテンプレート:'
,p_source=>':P9_URI_TEMPLATE'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'URIテンプレートを示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1579347520455738754.4859)
,p_name=>'P9_WS_DISPLAY_NAME'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(415717831389309088.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1581475214165982868.4859)
,p_name=>'P9_TEST_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1553816020133253411.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(776271912777053047.4859)
,p_computation_sequence=>10
,p_computation_item=>'P9_MODULE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    r varchar2(500) := null;',
'begin',
'    if :P9_ID is not null then',
'        for c1 in (select name',
'                     from WWV_FLOW_RT$MODULES m',
'                    where id = (select module_id',
'                                  from wwv_flow_rt$templates t',
'                                 where t.id = (select max(nvl(template_id , 0 )) x',
'                                                 from WWV_FLOW_RT$HANDLERS H',
'                                                where ID = :P9_ID',
'                                                  and security_group_id = :FLOW_SECURITY_GROUP_ID',
'                                               )',
'                               )',
'                  )',
'        loop',
'            r := c1.name;',
'        end loop;',
'    else',
'        for c1 in (select name',
'                     from WWV_FLOW_RT$MODULES m',
'                    where id = (select module_id',
'                                  from wwv_flow_rt$templates t',
'                                 where id = :P9_TEMPLATE_ID',
'                                   and security_group_id = :FLOW_SECURITY_GROUP_ID',
'                               )',
'                  )',
'        loop',
'           r := c1.name;',
'        end loop;',
'    end if;',
'    return r;',
'end;'))
);
end;
/
begin
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1482723122262525332.4859)
,p_computation_sequence=>10
,p_computation_item=>'P9_TEMPLATE_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select template_id from wwv_flow_rt$handlers',
'where id = :P9_ID',
'and security_group_id = :flow_security_group_id'))
,p_compute_when=>'P9_TEMPLATE_ID'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1579374101886742786.4859)
,p_computation_sequence=>10
,p_computation_item=>'P9_WS_DISPLAY_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select display_name from wwv_flow_companies where provisioning_company_id = :flow_security_group_id'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(827061405040760464.4859)
,p_computation_sequence=>20
,p_computation_item=>'P9_URI_PREFIX'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   r varchar2(500) := null;',
'begin',
'if :P9_ID is not null then',
'    for c1 in (',
'    select uri_prefix ',
'    from WWV_FLOW_RT$MODULES m',
'    where  ',
'              id = (',
'    select module_id ',
'    from wwv_flow_rt$templates t ',
'    where  t.id = (',
'    select max(nvl(template_id , 0 )) x',
'    from WWV_FLOW_RT$HANDLERS H',
'    where ID = :P9_ID and security_group_id = :FLOW_SECURITY_GROUP_ID',
'    )',
'    )',
'    ) loop',
'        r := c1.uri_prefix;',
'    end loop;',
'else',
'    for c1 in (',
'    select uri_prefix ',
'    from WWV_FLOW_RT$MODULES m',
'    where  ',
'              id = (',
'    select module_id ',
'    from wwv_flow_rt$templates t ',
'    where id = :P9_TEMPLATE_ID and security_group_id = :FLOW_SECURITY_GROUP_ID)) loop',
'       r := c1.uri_prefix;',
'    end loop;',
'end if;',
'return r;',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(830907727848438834.4859)
,p_computation_sequence=>30
,p_computation_item=>'P9_URI_TEMPLATE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   r varchar2(500) := null;',
'begin',
'if :P9_ID is not null then',
'    for c1 in (',
'    select uri_template',
'    from wwv_flow_rt$templates t ',
'    where  t.id = (',
'    select max(nvl(template_id , 0 )) x',
'    from WWV_FLOW_RT$HANDLERS H',
'    where ID = :P9_ID and security_group_id = :FLOW_SECURITY_GROUP_ID',
'    )',
'    ) loop',
'        r := c1.uri_template;',
'    end loop;',
'else',
'    for c1 in (',
'    select uri_template ',
'    from wwv_flow_rt$templates t ',
'    where id = :P9_TEMPLATE_ID and security_group_id = :FLOW_SECURITY_GROUP_ID) loop',
'       r := c1.uri_template;',
'    end loop;',
'end if;',
'return r;',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(17155305412903044.4859)
,p_computation_sequence=>35
,p_computation_item=>'P9_REQUIRES_HTTPS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select require_https from wwv_flow_rt$handlers',
'where id = :P9_ID',
'and template_id = :P9_TEMPLATE_ID',
'and security_group_id = :flow_security_group_id'))
,p_compute_when=>'P9_TEMPLATE_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1582267716907106725.4859)
,p_computation_sequence=>40
,p_computation_item=>'P9_TEST_URL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_path_prefix  varchar2(255);',
'    l_url          varchar2(4000);',
'begin',
'',
'    -- Obtain path prefix',
'    if not wwv_flow_global.g_cloud then',
'        for c1 in (select path_prefix',
'                     from wwv_flow_companies',
'                    where provisioning_company_id = wwv_flow_security.g_security_group_id)',
'        loop',
'          if c1.path_prefix is not null then',
'              l_path_prefix := lower(c1.path_prefix)|| ''/'';',
'          end if;',
'          exit;',
'        end loop;',
'    end if;',
'',
'    l_url := wwv_flow_utilities.host_url( p_option => ''SCRIPT'' );',
'',
'    ',
'    if v(''P9_REQUIRES_HTTPS'') = ''YES'' then',
'        l_url := replace( l_url, ''http://'', ''https://'');',
'    end if;',
'    ',
'    --',
'    -- Account for the case if SERVER_PORT is not properly set.  In Oracle REST Data Services 2.0 and greater,',
'    -- HTTP_HOST will not contain port # if not the default for the given protocol.',
'    --',
'    if instr(sys.owa_util.get_cgi_env(''HTTP_HOST''),'':'') = 0 then',
'        l_url := replace( l_url, '':443/'', ''/'');',
'        l_url := replace( l_url, '':80/'', ''/'');',
'    end if;',
'    ',
'    l_url := l_url || l_path_prefix || :P9_URI_PREFIX || :P9_URI_TEMPLATE;    ',
'',
'    return l_url;',
'',
'end;',
''))
,p_computation_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Original code, which may change:',
'declare',
'  l_port     varchar2(10);',
'  l_url      varchar2(4000);',
'begin',
'  if v(''P9_REQUIRES_HTTPS'') = ''YES'' then',
'      l_port := sys.owa_util.get_cgi_env(''SERVER_PORT'');',
'',
'      if l_port not in (80,443) then ',
'          l_url := ''http://''||sys.owa_util.get_cgi_env(''HTTP_HOST'')||sys.owa_util.get_cgi_env(''SCRIPT_NAME'') ||''/''||:P9_URI_PREFIX||:P9_URI_TEMPLATE;',
'',
'      else',
'          l_url := ''https://''||replace(sys.owa_util.get_cgi_env(''HTTP_HOST''),'':''||l_port)||sys.owa_util.get_cgi_env(''SCRIPT_NAME'') ||''/''||:P9_URI_PREFIX||:P9_URI_TEMPLATE;',
'',
'      end if;',
'',
'  else',
'      l_url := ''http://''||sys.owa_util.get_cgi_env(''HTTP_HOST'')||sys.owa_util.get_cgi_env(''SCRIPT_NAME'') ||''/''||:P9_URI_PREFIX||:P9_URI_TEMPLATE;',
'',
'  end if;',
'',
'  return l_url;',
'',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(313203509275312014.4859)
,p_computation_sequence=>60
,p_computation_item=>'P9_MODULE_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select module_id ',
'from wwv_flow_rt$templates t ',
'where id = :P9_TEMPLATE_ID ',
'and security_group_id = :FLOW_SECURITY_GROUP_ID'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1466521523382744169.4859)
,p_validation_name=>'Cannot have multiple Methods of the same type'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'  for c1 in (select 1 from wwv_flow_rt$handlers',
'              where method = :P9_METHOD',
'                and template_id = :P9_TEMPLATE_ID',
'                and security_group_id = :flow_security_group_id)',
'  loop',
'      return false;',
'  end loop;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&P9_METHOD.メソッドはリソース・テンプレート&P9_URI_TEMPLATE.にすでに定義されています。新しいメソッドを選択する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(415718014389309088.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(415720221233309099.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(793353017339316137.4859)
,p_name=>'Query_Format'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_SOURCE_TYPE'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(793353307921316139.4859)
,p_event_id=>wwv_flow_api.id(793353017339316137.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_FORMAT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(793353520357316140.4859)
,p_event_id=>wwv_flow_api.id(793353017339316137.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_FORMAT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1421591224890670728.4859)
,p_name=>'Mime Type Allowed - Visibility'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_METHOD'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'POST,PUT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1421591523478670730.4859)
,p_event_id=>wwv_flow_api.id(1421591224890670728.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_MIMES_ALLOWED'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1421591708671670730.4859)
,p_event_id=>wwv_flow_api.id(1421591224890670728.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_MIMES_ALLOWED'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1421633313593676856.4859)
,p_name=>'Pagination Size - Visibility'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_METHOD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'GET'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1421633610107676857.4859)
,p_event_id=>wwv_flow_api.id(1421633313593676856.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ITEMS_PER_PAGE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1421633826127676857.4859)
,p_event_id=>wwv_flow_api.id(1421633313593676856.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ITEMS_PER_PAGE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1441044614727196819.4859)
,p_name=>'Parameters Region Visibility'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1441044907662196820.4859)
,p_event_id=>wwv_flow_api.id(1441044614727196819.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1421455001426645001.4859)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1441045128148196820.4859)
,p_event_id=>wwv_flow_api.id(1441044614727196819.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1421455001426645001.4859)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1553853809528259751.4859)
,p_name=>'Test Link Visibility'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_METHOD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'GET'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1553854110562259753.4859)
,p_event_id=>wwv_flow_api.id(1553853809528259751.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_XXX'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1553854315143259753.4859)
,p_event_id=>wwv_flow_api.id(1553853809528259751.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_XXX'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(415721708151309102.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WWV_FLOW_RT$HANDLERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$HANDLERS'
,p_attribute_03=>'P9_ID'
,p_attribute_04=>'ID'
,p_attribute_05=>'P9_TEMPLATE_ID'
,p_attribute_06=>'TEMPLATE_ID'
,p_attribute_09=>'P9_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'アクションが処理されました。'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1747633016672791821.4859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Source Value in Session'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'apex_util.set_session_state(p_name  => ''P9_SOURCE'',',
'                            p_value => v(''P9_SOURCE''));',
'',
'apex_util.set_session_state(p_name  => ''P9_URI_TEMPLATE'',',
'                            p_value => v(''P9_URI_TEMPLATE''));',
'',
'apex_util.set_session_state(p_name  => ''P9_URI_PREFIX'',',
'                            p_value => v(''P9_URI_PREFIX''));',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1733536230473105314.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1737996921785343966.4859)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Binds Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if htmldb_collection.collection_exists(''SET_BINDS'') then',
'    htmldb_collection.delete_collection(''SET_BINDS'');',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1733536230473105314.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1758495531925339285.4859)
,p_process_sequence=>37
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Test URL'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_path_prefix  varchar2(255);',
'    l_test_url     varchar2(4000);',
'begin',
'',
'    -- Obtain path prefix',
'    if not wwv_flow_global.g_cloud then',
'        for c1 in (select path_prefix',
'                     from wwv_flow_companies',
'                    where provisioning_company_id = wwv_flow_security.g_security_group_id)',
'        loop',
'          if c1.path_prefix is not null then',
'              l_path_prefix := lower(c1.path_prefix)|| ''/'';',
'          end if;',
'          exit;',
'        end loop;',
'    end if;',
'',
'    l_test_url := wwv_flow_utilities.host_url( p_option => ''SCRIPT'' );',
'    ',
'    if v(''P9_REQUIRES_HTTPS'') = ''YES'' then',
'        l_test_url := replace( l_test_url, ''http://'', ''https://'');',
'    end if;',
'',
'    --',
'    -- Account for the case if SERVER_PORT is not properly set.  In Oracle REST Data Services 2.0 and greater,',
'    -- HTTP_HOST will not contain port # if not the default for the given protocol.',
'    --    ',
'    if instr(sys.owa_util.get_cgi_env(''HTTP_HOST''),'':'') = 0 then',
'        l_test_url := replace( l_test_url, '':443/'', ''/'');',
'        l_test_url := replace( l_test_url, '':80/'', ''/'');',
'    end if;',
'        ',
'    l_test_url := l_test_url || l_path_prefix || :P9_URI_PREFIX || :P9_URI_TEMPLATE;',
'',
'    :P8_TEST_URL := l_test_url;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1733536230473105314.4859)
,p_process_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_protocol  varchar2(10);',
'    l_port      varchar2(10);',
'    l_test_url  varchar2(4000);',
'begin',
'',
'    if v(''P9_REQUIRES_HTTPS'') = ''YES'' then',
'',
'        l_port := sys.owa_util.get_cgi_env(''SERVER_PORT'');',
'        if l_port not in (80,443) then',
'            l_test_url := ''http://''||sys.owa_util.get_cgi_env(''HTTP_HOST'')||sys.owa_util.get_cgi_env(''SCRIPT_NAME'') ||''/''||:P9_URI_PREFIX||:P9_URI_TEMPLATE;',
'        else',
'            l_test_url := ''http://''||replace(sys.owa_util.get_cgi_env(''HTTP_HOST''),'':''||l_port)||sys.owa_util.get_cgi_env(''SCRIPT_NAME'') ||''/''||:P9_URI_PREFIX||:P9_URI_TEMPLATE;',
'        end if;',
'    else',
'        l_test_url := ''http://''||sys.owa_util.get_cgi_env(''HTTP_HOST'')||sys.owa_util.get_cgi_env(''SCRIPT_NAME'') ||''/''||:P9_URI_PREFIX||:P9_URI_TEMPLATE;',
'    end if;',
'',
'    :P8_TEST_URL := l_test_url;',
'',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(415721927341309102.4859)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'9'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(415718224764309088.4859)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(415721528225309102.4859)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WWV_FLOW_RT$HANDLERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$HANDLERS'
,p_attribute_03=>'P9_ID'
,p_attribute_04=>'ID'
,p_attribute_14=>'N'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービス・モジュール'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービス・モジュール'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(754939123056928433.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(315391922639249269.4859)
,p_plug_name=>'RESTfulサービス・モジュール'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>RESTfulサービス・モジュールは、よく使うテンプレートを共通のURI接頭辞でグループ化したものです。この接頭辞が、すべてのテンプレートの前に付きます。</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(315442028856253198.4859)
,p_plug_name=>'RESTfulモジュール: &P10_CONTEXT.'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noBorder:a-ButtonRegion--showTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1508093406935757443.4859)
,p_plug_name=>'コメント'
,p_region_template_options=>'a-Region--stacked:a-Region--noPadding:a-Region--sideRegion:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(315392526204249272.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(315442028856253198.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(315392306728249271.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(315442028856253198.4859)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'削除'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(315392227681249271.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(315442028856253198.4859)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'変更の適用'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(315393403045249276.4859)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(315392306728249271.4859)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1417582023322935236.4859)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(315393611151249279.4859)
,p_name=>'P10_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(315391922639249269.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(315394002929249292.4859)
,p_name=>'P10_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(315391922639249269.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'名前'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'RESTfulサービス・モジュール名を示します。モジュールを使用してURIテンプレートをグループ化します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(315394224459249293.4859)
,p_name=>'P10_URI_PREFIX'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(315391922639249269.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'URI接頭辞'
,p_source=>'URI_PREFIX'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'URIテンプレートの接頭辞を示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(315394401252249293.4859)
,p_name=>'P10_ORIGINS_ALLOWED'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(315391922639249269.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'使用可能な起点'
,p_source=>'ORIGINS_ALLOWED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>リソース・テンプレートへのアクセスを許可されている起点のカンマ区切りのリスト。例:</p><p>',
'',
'http://example1.org, https://*.example2.com',
'</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(315394601423249294.4859)
,p_name=>'P10_ITEMS_PER_PAGE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(315391922639249269.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ページ区切りサイズ'
,p_source=>'ITEMS_PER_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'ページ区切りウィンドウのサイズを示します。データベース問合せの場合、これは返される行の数です。'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(315394822820249295.4859)
,p_name=>'P10_STATUS'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(315391922639249269.4859)
,p_use_cache_before_default=>'NO'
,p_item_default=>'PUBLISHED'
,p_prompt=>'ステータス'
,p_source=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PUBLISHED NOT PUBLISHED'
,p_lov=>'.'||wwv_flow_api.id(316762018242533973)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'パブリッシュしたRESTfulモジュール・サービスは使用可能で、未公開のものは使用できません。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1434359723247996035.4859)
,p_name=>'P10_CONTEXT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(315442028856253198.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'P10_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1481151617573060319.4859)
,p_name=>'P10_PRIVILEGE'
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_api.id(315391922639249269.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'必要な権限'
,p_source=>'PRIVILEGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRIVILEGES'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select label d, id r',
'  from wwv_flow_rt$privileges',
' where security_group_id = :flow_security_group_id',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- 権限の割当て - '
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'このRESTfulサービス・モジュールへのアクセスに必要な権限を示します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1508154331176764410.4859)
,p_name=>'P10_COMMENTS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1508093406935757443.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'コメント'
,p_source=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>3
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'コメントをオプションで入力します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1405176819617701319.4859)
,p_name=>'Handler - Source Type'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_SOURCE_TYPE'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1410286913587782850.4859)
,p_name=>'Template - Etag Type'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_ETAG_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1411621224761543103.4859)
,p_name=>'Mime Type Allowed - Visibility'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_METHOD'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'POST,PUT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1412467600668397192.4859)
,p_name=>'GET Method Settings'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_METHOD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'GET'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(315395124185249296.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WWV_FLOW_RT$MODULES'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$MODULES'
,p_attribute_03=>'P10_ID'
,p_attribute_04=>'ID'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(315395301314249297.4859)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WWV_FLOW_RT$MODULES'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$MODULES'
,p_attribute_03=>'P10_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P10_NODE_TYPE'
,p_process_when2=>'M'
,p_process_success_message=>'アクションが処理されました。'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(315395519441249297.4859)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'10'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(315392306728249271.4859)
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'リソース・テンプレート'
,p_page_mode=>'NORMAL'
,p_step_title=>'リソース・テンプレート'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(754939123056928433.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184626'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(413821013331010603.4859)
,p_plug_name=>'リソース・テンプレート'
,p_region_template_options=>'a-Region--noPadding:a-Region--sideRegion:a-Region--accessibleHeader'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
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
 p_id=>wwv_flow_api.id(414725128124144902.4859)
,p_plug_name=>'URIテンプレート: &P11_CONTEXT2.'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noBorder:a-ButtonRegion--showTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(431495829658724106.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>リソース・テンプレートとは、Uniform Resource Identifier (URI)のセットをSQL問合せまたは匿名PL/SQLブロックにバインドする構成ファイルです。URIのセットは、URIテンプレートで識別されます。URIテンプレートは、URIを記述する単純な構文です。例:</p>',
'<p/>',
'people/{userid}',
'</p><p>',
'URIテンプレートにはゼロから複数のパラメータを指定でき(たとえば、{userid})、それがHTTPヘッダーとともにHTTPリクエストで送信されます。 ',
'</p>',
''))
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1507986129051735426.4859)
,p_plug_name=>'コメント'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413821618027010604.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(414725128124144902.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_ID:&P10_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413821407871010604.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(414725128124144902.4859)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'削除'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P11_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413821307050010604.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(414725128124144902.4859)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'変更の適用'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P11_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413821217315010604.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(414725128124144902.4859)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P11_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1765902015675679728.4859)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::ACTIVE_NODE:&P10_ID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(413821407871010604.4859)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(413822212647010605.4859)
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::ACTIVE_NODE:&P11_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413822407340010606.4859)
,p_name=>'P11_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413822815255010608.4859)
,p_name=>'P11_MODULE_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'MODULE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'選択したRESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413823027195010608.4859)
,p_name=>'P11_URI_TEMPLATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'URIテンプレート'
,p_source=>'URI_TEMPLATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>84
,p_cMaxlength=>600
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Uniform Resource Identifier (URI)を識別するURIテンプレートを入力します。URIテンプレートは、<b>example/get/{id}</b>のようにURIを記述する単純な構文です。<p>URIテンプレートにはゼロから複数のパラメータを指定でき(たとえば、<b>{id}</b>)、それをSQL問合せや無名PL/SQLブロックでパラメータにバインドすることができます。次の構文ルールが適用されます。</p>',
'<ul>',
'<li>URIテンプレートをスラッシュ(/)文字で始めることはできません。</li>',
'<li>URIテンプレートにはUnicode文字を使用できます。</li>',
'<li>パラメータの宣言には中カッコ({})を使用します。</li>',
'<li>パラメータ名は英字で始め、ゼロ文字以上の英数字か、アンダースコア(_)、ハイフン(-)を続けます。</li>',
'<li>オプション・パラメータはサポートされません。</li>',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413823206696010608.4859)
,p_name=>'P11_PRIORITY'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_prompt=>'優先度'
,p_source=>'PRIORITY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ZERO THROUGH 9'
,p_lov=>'.'||wwv_flow_api.id(792033515275240381)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'テンプレートの評価順序を示します。高い数値から先に評価されます。たとえば、2つのテンプレートが一致した場合、優先度9のテンプレートが優先度0のテンプレートよりも優先して選ばれます。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413823424646010609.4859)
,p_name=>'P11_ETAG_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_use_cache_before_default=>'NO'
,p_item_default=>'HASH'
,p_prompt=>'エンティティ・タグ'
,p_source=>'ETAG_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ETAG_TYPES'
,p_lov=>'.'||wwv_flow_api.id(792100407834275994)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'リソース・テンプレートで使用するエンティティ・タグのタイプを示します。エンティティ・タグは、リソースのバージョン識別子として機能するHTTPヘッダーです。エンティティ・タグ・ヘッダーを使用すると、以前に取得したリソースを取得せずに済み、リソースを更新するときにオプティミスティック・ロックを実行できます。次のオプションがあります:<p/>',
'<ul>',
'<li><b>セキュアなHASH:</b> 返されるリソース表現の内容を、セキュアなダイジェスト関数でハッシュし、特定のリソース・バージョンに一意のフィンガープリントを指定します。</li>',
'<li><b>問合せ:</b> リソース・バージョンを一意に識別する問合せを手動で定義します。多くの場合、手動で定義した問合せの方が、リソース表現の全体をハッシュするより効率的にエンティティ・タグを生成できます。</li>',
'<li><b>なし:</b> エンティティ・タグを生成しません。</li>',
'</ul>'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413823622365010609.4859)
,p_name=>'P11_ETAG_QUERY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'エンティティ・タグ問合せ'
,p_source=>'ETAG_QUERY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>10
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'カスタム・エンティティ・タグの作成に使用される1つの行を返すSQL SELECT文。SELECT文の結果は、リソースの各バージョンを一意に識別する必要があります。例を次に示します。<p/>',
'',
'<i>select updated_on, updated_by from my_table where id = :id</i>'))
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(829420818133284650.4859)
,p_name=>'P11_COMMENTS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1507986129051735426.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'コメント'
,p_source=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>3
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'コメントをオプションで入力します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(830528716373407135.4859)
,p_name=>'P11_URI_PREFIX'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'URIテンプレートの接頭辞を示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1434018604537914883.4859)
,p_name=>'P11_MODULE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_prompt=>'RESTfulサービス・モジュール:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'RESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1434238826878959234.4859)
,p_name=>'P11_MODULE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(413821013331010603.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'選択したRESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1489941516571293940.4859)
,p_name=>'P11_CONTEXT2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(414725128124144902.4859)
,p_use_cache_before_default=>'NO'
,p_source=>':P11_URI_TEMPLATE'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P11_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(831111718067455020.4859)
,p_computation_sequence=>10
,p_computation_item=>'P11_URI_PREFIX'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   r varchar2(500) := null;',
'begin',
'if :P11_ID is not null then',
'    for c1 in ( select uri_prefix',
'                  from WWV_FLOW_RT$MODULES m',
'                 where ID = (select module_id ',
'                               from wwv_flow_rt$templates ',
'                              where id = :P11_ID ',
'                                and security_group_id = :FLOW_SECURITY_GROUP_ID)',
'    ) loop',
'        r := c1.uri_prefix;',
'    end loop;',
'else',
'    for c2 in (',
'        select uri_prefix ',
'        from WWV_FLOW_RT$MODULES m',
'        where id = :P11_MODULE_ID)',
'    loop',
'       r := c2.uri_prefix;',
'    end loop;',
'end if;',
'return r;',
'end;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1434254332419960854.4859)
,p_computation_sequence=>40
,p_computation_item=>'P11_MODULE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    r varchar2(500) := null;',
'begin',
'',
'if :P11_ID is not null then',
'    for c1 in (select name',
'                 from WWV_FLOW_RT$MODULES m',
'                where id = (select module_id',
'                              from wwv_flow_rt$templates t',
'                             where t.id = :P11_ID',
'                           )',
'              )',
'    loop',
'        r := c1.name;',
'    end loop;',
'else',
'for c2 in (',
'        select name ',
'        from WWV_FLOW_RT$MODULES m',
'        where id = :P11_MODULE_ID)',
'    loop',
'       r := c2.name;',
'    end loop;',
'end if;',
'return r;',
'end;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1440907827148172058.4859)
,p_validation_name=>'ETAG Query Must Be Specified'
,p_validation_sequence=>10
,p_validation=>'P11_ETAG_QUERY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL#に値を指定する必要があります。'
,p_always_execute=>'N'
,p_validation_condition=>'P11_ETAG_TYPE'
,p_validation_condition2=>'QUERY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(413821307050010604.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(413823622365010609.4859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2544541829696681480.4859)
,p_validation_name=>'Validate URI Template'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_listener.is_valid_template(p_template=> :P11_URI_TEMPLATE) then',
'  return true;',
'else',
'  return false;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'URIテンプレートに、長さが100文字を超えるパラメータ名を含めることはできません。また、パラメータは、次の形式であることが必要です。',
'<br/><br/>',
'中括弧({)の後ろにアルファベットが1文字あり、最大99文字のアルファベットまたは特殊文字(_、-、.)が続き、閉じの中括弧(})で終了。'))
,p_always_execute=>'N'
,p_validation_condition=>'P11_URI_TEMPLATE'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(413821307050010604.4859)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(413823027195010608.4859)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(792175609959305079.4859)
,p_name=>'Show/Hide Query'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_ETAG_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792175913603305081.4859)
,p_event_id=>wwv_flow_api.id(792175609959305079.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ETAG_QUERY'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792176122098305081.4859)
,p_event_id=>wwv_flow_api.id(792175609959305079.4859)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ETAG_QUERY'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(413823918098010610.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WWV_FLOW_RT$TEMPLATES'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$TEMPLATES'
,p_attribute_03=>'P11_ID'
,p_attribute_04=>'ID'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(413824123123010610.4859)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WWV_FLOW_RT$TEMPLATES'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$TEMPLATES'
,p_attribute_03=>'P11_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'P11_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'アクションが処理されました。'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(413824304724010610.4859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'11'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(413821407871010604.4859)
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'リソース・ハンドラ・パラメータ'
,p_page_mode=>'NORMAL'
,p_step_title=>'リソース・ハンドラ・パラメータ'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(754939123056928433.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184627'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(413926308446017538.4859)
,p_plug_name=>'リソース・ハンドラ・パラメータ'
,p_region_template_options=>'a-Region--flush:a-Region--noPadding:a-Region--sideRegion:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'<p>リソース・ハンドラのパラメータを手動で定義すると、リソース・ハンドラのHTTPヘッダーにバインドすることも、URIテンプレート・パラメータを特定のデータ型にキャストすることもできます。たとえば、生成される表示内容をローカライズするには、リソース・ハンドラがHTTPのAccept-Languageヘッダーの値を知る必要があります。</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(415049901982175222.4859)
,p_plug_name=>'Button Bar'
,p_region_css_classes=>'a-Region--noTopBorder'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719684836837942735.4859)
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
 p_id=>wwv_flow_api.id(1508409614825854375.4859)
,p_plug_name=>'コメント'
,p_region_template_options=>'a-Region--flush:a-Region--noPadding:a-Region--sideRegion:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(719706437830942782.4859)
,p_plug_display_sequence=>25
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413926920108017540.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(415049901982175222.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413926722356017540.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(415049901982175222.4859)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_image_alt=>'削除'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413926615195017540.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(415049901982175222.4859)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'変更の適用'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(413926522912017540.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(415049901982175222.4859)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(719734705014947853.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(413927527643017541.4859)
,p_branch_action=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413927701266017542.4859)
,p_name=>'P12_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413928128947017543.4859)
,p_name=>'P12_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'バインド変数名'
,p_source=>'BIND_VARIABLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'SQLまたはPL/SQLで使用されるパラメータのバインド変数名を示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413928317224017543.4859)
,p_name=>'P12_ALIAS'
,p_is_required=>true
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'名前'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737577300952641.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'パラメータ名を指定します。'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413928502228017544.4859)
,p_name=>'P12_SOURCE_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ソース・タイプ'
,p_source=>'SOURCE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARAMETER_SOURCE'
,p_lov=>'.'||wwv_flow_api.id(793403203749331167)||'.'
,p_lov_cascade_parent_items=>'P12_ACCESS_METHOD'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'パラメータ・ソース・タイプを示します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413928713436017544.4859)
,p_name=>'P12_ACCESS_METHOD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'アクセス方法'
,p_source=>'ACCESS_METHOD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARAMETER_ACCESS'
,p_lov=>'.'||wwv_flow_api.id(793423420718336071)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'共通のHTTPメソッドを指定します。<b>IN</b>、<b>IN/OUT</b>、<b>OUT</b>のオプションがあります。URIテンプレート・パラメータの設定はINのみです。ヘッダー・パラメータにINの値を指定すると、HTTPリクエストにヘッダーが使用されます。IN/OUTの値を指定すると、その値がHTTPリクエストにもレスポンスにも使用されます。OUTの値を指定すると、その値が',
'HTTPレスポンスのみに使用されます。'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413928914548017544.4859)
,p_name=>'P12_PARAM_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'パラメータ・タイプ'
,p_source=>'PARAM_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARAMETER_TYPE'
,p_lov=>'.'||wwv_flow_api.id(793443816001344104)||'.'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'パラメータのデータ型を示します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(413929115668017544.4859)
,p_name=>'P12_HANDLER_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_source=>'HANDLER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'選択されたハンドラ。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(831503412835500777.4859)
,p_name=>'P12_MODULE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'選択したRESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(831574923225503795.4859)
,p_name=>'P12_URI_PREFIX'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'URIテンプレートの接頭辞を示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(831706424395513558.4859)
,p_name=>'P12_URI_TEMPLATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'URIテンプレートを示します。'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(831938624872523179.4859)
,p_name=>'P12_TEMPLATE_SOURCE'
,p_item_sequence=>54
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_prompt=>'ハンドラ・ソース'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>6
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'fielddatabold'
,p_label_alignment=>'RIGHT-TOP'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'選択したHTTPメソッドを処理するリソース・ハンドラSQL問合せ、またはPL/SQLブロックを指定します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(832078207819537181.4859)
,p_name=>'P12_COMMENTS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1508409614825854375.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'コメント'
,p_source=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>3
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'コメントをオプションで入力します。'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1438965424547433182.4859)
,p_name=>'P12_CONTEXT'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'RESTfulサービス・モジュール:'
,p_source=>':P12_MODULE'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'RESTfulサービス・モジュール名を示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1482979623581696066.4859)
,p_name=>'P12_HANDLER_SOURCE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1490378423029362010.4859)
,p_name=>'P12_RESOURCE_TEMPLATE'
,p_item_sequence=>6
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'URIテンプレート:'
,p_source=>':P12_URI_TEMPLATE'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'URIテンプレートを示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1490412018311370063.4859)
,p_name=>'P12_RESOURCE_HANDLER'
,p_item_sequence=>7
,p_item_plug_id=>wwv_flow_api.id(413926308446017538.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'リソース・ハンドラ:'
,p_source=>'P12_HANDLER_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'HANDLER'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nvl(method,''No method'') x, id',
'from wwv_flow_rt$handlers'))
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'使用するリソース・ハンドラHTTPメソッドを示します。'
,p_attribute_01=>'N'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1491751332528875757.4859)
,p_name=>'P12_CONTEXT2'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(415049901982175222.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'リソース・ハンドラ・パラメータ:'
,p_source=>':P12_ALIAS'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_cattributes_element=>'class="fielddatabold"'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'P12_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(719737377976952639.4859)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1439054629872444237.4859)
,p_computation_sequence=>40
,p_computation_item=>'P12_MODULE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    r varchar2(500) := null;',
'begin',
'    if :P9_ID is not null then',
'        for c1 in (select name',
'                     from WWV_FLOW_RT$MODULES m',
'                    where id = (select module_id',
'                                  from wwv_flow_rt$templates t',
'                                 where t.id = (select max(nvl(template_id , 0 )) x',
'                                                 from WWV_FLOW_RT$HANDLERS H',
'                                                where ID = :P9_ID',
'                                                  and security_group_id = :FLOW_SECURITY_GROUP_ID',
'                                               )',
'                               )',
'                  )',
'        loop',
'            r := c1.name;',
'        end loop;',
'    else',
'        for c1 in (select name',
'                     from WWV_FLOW_RT$MODULES m',
'                    where id = (select module_id',
'                                  from wwv_flow_rt$templates t',
'                                 where id = :P9_TEMPLATE_ID',
'                                   and security_group_id = :FLOW_SECURITY_GROUP_ID',
'                               )',
'                  )',
'        loop',
'           r := c1.name;',
'        end loop;',
'    end if;',
'    return r;',
'end;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1439069908879447568.4859)
,p_computation_sequence=>40
,p_computation_item=>'P12_URI_PREFIX'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   r varchar2(500) := null;',
'begin',
'if :P9_ID is not null then',
'    for c1 in (',
'    select uri_prefix ',
'    from WWV_FLOW_RT$MODULES m',
'    where  ',
'              id = (',
'    select module_id ',
'    from wwv_flow_rt$templates t ',
'    where  t.id = (',
'    select max(nvl(template_id , 0 )) x',
'    from WWV_FLOW_RT$HANDLERS H',
'    where ID = :P9_ID and security_group_id = :FLOW_SECURITY_GROUP_ID',
'    )',
'    )',
'    ) loop',
'        r := c1.uri_prefix;',
'    end loop;',
'else',
'    for c1 in (',
'    select uri_prefix ',
'    from WWV_FLOW_RT$MODULES m',
'    where  ',
'              id = (',
'    select module_id ',
'    from wwv_flow_rt$templates t ',
'    where id = :P9_TEMPLATE_ID and security_group_id = :FLOW_SECURITY_GROUP_ID)) loop',
'       r := c1.uri_prefix;',
'    end loop;',
'end if;',
'return r;',
'end;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1439085214420449233.4859)
,p_computation_sequence=>40
,p_computation_item=>'P12_URI_TEMPLATE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'   r varchar2(500) := null;',
'begin',
'if :P9_ID is not null then',
'    for c1 in (',
'    select uri_template',
'    from wwv_flow_rt$templates t ',
'    where  t.id = (',
'    select max(nvl(template_id , 0 )) x',
'    from WWV_FLOW_RT$HANDLERS H',
'    where ID = :P9_ID and security_group_id = :FLOW_SECURITY_GROUP_ID',
'    )',
'    ) loop',
'        r := c1.uri_template;',
'    end loop;',
'else',
'    for c1 in (',
'    select uri_template ',
'    from wwv_flow_rt$templates t ',
'    where id = :P9_TEMPLATE_ID and security_group_id = :FLOW_SECURITY_GROUP_ID) loop',
'       r := c1.uri_template;',
'    end loop;',
'end if;',
'return r;',
'end;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1483268128701792175.4859)
,p_computation_sequence=>40
,p_computation_item=>'P12_HANDLER_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select handler_id from wwv_flow_rt$parameters',
'where id = :P12_ID',
'and security_group_id = :flow_security_group_id'))
,p_compute_when=>'P12_HANDLER_ID'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1491603025555845341.4859)
,p_name=>'Disable Source Item'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_TEMPLATE_SOURCE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1491603321263845342.4859)
,p_event_id=>wwv_flow_api.id(1491603025555845341.4859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_TEMPLATE_SOURCE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(413929407780017546.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WWV_FLOW_RT$PARAMETERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$PARAMETERS'
,p_attribute_03=>'P12_ID'
,p_attribute_04=>'ID'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(834248230441751846.4859)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set display only values'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (',
'    select template_id, sys.dbms_lob.substr(SOURCE,500,1) source',
'    from WWV_FLOW_RT$HANDLERS H',
'    where ID = :P12_HANDLER_ID and security_group_id = :FLOW_SECURITY_GROUP_ID) ',
'    loop',
'    :P12_TEMPLATE_SOURCE := c1.source;',
'    for c2 in (',
'       select module_id, uri_template',
'       from wwv_flow_rt$templates t ',
'       where id = c1.template_id and security_group_id = :FLOW_SECURITY_GROUP_ID) loop',
'           :P12_URI_TEMPLATE := c2.uri_template;',
'       for c3 in (',
'           select name, uri_prefix, id',
'           from WWV_FLOW_RT$MODULES m',
'           where id = c2.module_id and security_group_id = :FLOW_SECURITY_GROUP_ID) loop',
'              :P12_MODULE := wwv_flow_escape.html(c3.name);',
'              :P12_URI_PREFIX := wwv_flow_escape.html(c3.uri_prefix);',
'       end loop;',
'       ',
'    end loop;',
'end loop;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(413929600454017546.4859)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WWV_FLOW_RT$PARAMETERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$PARAMETERS'
,p_attribute_03=>'P12_ID'
,p_attribute_04=>'ID'
,p_attribute_05=>'P12_HANDLER_ID'
,p_attribute_06=>'HANDLER_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'アクションが処理されました。'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(413929830939017547.4859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'12'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(413926722356017540.4859)
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'クライアント登録'
,p_page_mode=>'NORMAL'
,p_step_title=>'クライアント登録'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6673001550641034.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184627'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1493765414286523358.4859)
,p_plug_name=>'クライアント登録'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719702549794942779.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.id,',
'       nvl2(a.apex_application_id,a.apex_application_id||''.''||(select name from wwv_flows ',
'         where id = a.apex_application_id ',
'           and security_group_id = a.security_group_id),''Third Party Application'') app_name,',
'       a.name client_name,',
'       a.updated_by,',
'       a.updated_on,',
'       wwv_flow_escape.html(substr(a.description,1,100)) description,',
'       decode(a.apex_application_id,null,:IMAGE_PREFIX||''menu/dbshare_64.gif'',:IMAGE_PREFIX||''apex/builder/db_app_64x64.gif'') the_icon,',
'       ''f?p=''||:APP_ID||'':7:''||:APP_SESSION||'':::7:P7_ID:''||id the_link',
'from wwv_flow_rt$clients a',
'where a.security_group_id = :flow_security_group_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1493765612692523359.4859)
,p_name=>'RESTful Service Privilege Groups'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'この問合せは#MAX_ROW_COUNT#より多い行数を返します。結果が完全になるようにデータをフィルタ処理してください。'
,p_no_data_found_message=>'データが見つかりません。'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_link_column=>'THE_LINK'
,p_icon_view_img_src_column=>'THE_ICON'
,p_icon_view_label_column=>'CLIENT_NAME'
,p_icon_view_columns_per_row=>5
,p_owner=>'HILARY'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1493766315141523363.4859)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'更新者'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1510965911492563071.4859)
,p_db_column_name=>'THE_ICON'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'アイコン'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1510966006055563071.4859)
,p_db_column_name=>'THE_LINK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'リンク'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1513974106408820041.4859)
,p_db_column_name=>'ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1513974413044820044.4859)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'更新'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1516151509028360174.4859)
,p_db_column_name=>'APP_NAME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'アプリケーション'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1643550722257332632.4859)
,p_db_column_name=>'CLIENT_NAME'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'クライアント'
,p_column_link=>'#THE_LINK#'
,p_column_linktext=>'#CLIENT_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1665202832469041740.4859)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'説明'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1504318002245625065.4859)
,p_plug_name=>'Top Bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6675421676641048.4859)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1646756928320422616.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6675116240641047.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>クライアントを登録すると、許可されたクライアントを現在のワークスペースに登録する、既存のクライアント登録を取り消す、あるいはクライアント資格証明をリセットすることができます。</p><p/>Application Expressのアプリケーションとサード・パーティのアプリケーションをどちらも表示できますが、登録できるのはApplication Expressのアプリケーション<b>のみ</b>です。</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1504337307785626669.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1504318002245625065.4859)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_image_alt=>'リセット'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,RIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1493766730178523366.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1504318002245625065.4859)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'アプリケーションの登録 >'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7::'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービスの承認'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービスの承認'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184627'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1646010406456239414.4859)
,p_plug_name=>'RESTfulサービスの承認'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719702549794942779.4859)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.ID, ',
'a.CLIENT_ID,',
'a.USER_NAME,',
'apex_item.hidden(1,a.ID)||apex_item.select_list_from_lov(2,a.STATUS,''RESTFUL_APPROVAL_TYPES'',null,''NO'') status,',
'a.SECURITY_GROUP_ID,',
'a.CREATED_BY,',
'a.CREATED_ON,',
'a.UPDATED_BY,',
'a.UPDATED_ON,',
':IMAGE_PREFIX||''htmldb/icons/icon_auth_default.gif'' the_icon,',
'--''f?p=''||:APP_ID||'':15:''||:APP_SESSION||'':::15:P15_ID:''||a.id the_link',
'''f?p=''||:APP_ID||'':14:''||:APP_SESSION||'':::'' the_link',
'from #OWNER#.WWV_FLOW_RT$APPROVALS a',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1646010626906239415.4859)
,p_name=>'RESTful Service Approvals'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'この問合せは#MAX_ROW_COUNT#より多い行数を返します。結果が完全になるようにデータをフィルタ処理してください。'
,p_no_data_found_message=>'データが見つかりません。'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_link_column=>'THE_LINK'
,p_icon_view_img_src_column=>'THE_ICON'
,p_icon_view_label_column=>'USER_NAME'
,p_icon_view_columns_per_row=>5
,p_owner=>'HILARY'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646010728336239416.4859)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646010803515239417.4859)
,p_db_column_name=>'CLIENT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'クライアント'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(1646424605586349771)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646010909522239417.4859)
,p_db_column_name=>'USER_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'ユーザー名'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646011006306239417.4859)
,p_db_column_name=>'STATUS'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'ステータス'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(1646678615030409311)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646011119004239417.4859)
,p_db_column_name=>'SECURITY_GROUP_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'セキュリティ・グループID'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646011221324239418.4859)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'作成者'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646011308706239418.4859)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'作成'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646011401620239418.4859)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'更新者'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646011517428239418.4859)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'更新'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646258411249285138.4859)
,p_db_column_name=>'THE_ICON'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'アイコン'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1646258532566285139.4859)
,p_db_column_name=>'THE_LINK'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'リンク'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1646157302891254340.4859)
,p_plug_name=>'Top Bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6675421676641048.4859)
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1646895316031456904.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6675116240641047.4859)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>RESTfulサービスを承認すると、RESTfulサービス・クライアントに関連する承認の管理が可能になります。</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_name=>'表形式フォーム'
,p_template=>wwv_flow_api.id(6674714399641047.4859)
,p_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'"ID",',
'"ID" ID_DISPLAY,',
'"CLIENT_ID",',
'"USER_NAME",',
'"STATUS",',
'"SECURITY_GROUP_ID",',
'"CREATED_BY",',
'"CREATED_ON",',
'"UPDATED_BY",',
'"UPDATED_ON",',
'"ROW_VERSION_NUMBER"',
'from "#OWNER#"."WWV_FLOW_RT$APPROVALS"',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6679518318641053.4859)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'データが見つかりません。'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648063800327695219.4859)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_column_width=>16
,p_pk_col_source_type=>'T'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648063915559695219.4859)
,p_query_column_id=>2
,p_column_alias=>'ID_DISPLAY'
,p_column_display_sequence=>2
,p_column_heading=>'Id'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_column_width=>16
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'ID_DISPLAY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064032300695219.4859)
,p_query_column_id=>3
,p_column_alias=>'CLIENT_ID'
,p_column_display_sequence=>3
,p_column_heading=>'クライアント'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(1646424605586349771)
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'NO'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'CLIENT_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064116646695219.4859)
,p_query_column_id=>4
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'ユーザー名'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'USER_NAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064226050695219.4859)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>5
,p_column_heading=>'ステータス'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(1646678615030409311)
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'NO'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'STATUS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064313937695219.4859)
,p_query_column_id=>6
,p_column_alias=>'SECURITY_GROUP_ID'
,p_column_display_sequence=>6
,p_column_heading=>'Security Group Id'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'SECURITY_GROUP_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064431515695219.4859)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>7
,p_column_heading=>'作成者'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'CREATED_BY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064502988695219.4859)
,p_query_column_id=>8
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>8
,p_column_heading=>'作成'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_column_width=>12
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'CREATED_ON'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064614899695219.4859)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'更新者'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'UPDATED_BY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064727477695219.4859)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_ON'
,p_column_display_sequence=>10
,p_column_heading=>'更新'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_column_width=>12
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'UPDATED_ON'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1648064817375695219.4859)
,p_query_column_id=>11
,p_column_alias=>'ROW_VERSION_NUMBER'
,p_column_display_sequence=>11
,p_column_heading=>'Row Version Number'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040200'
,p_ref_table_name=>'WWV_FLOW_RT$APPROVALS'
,p_ref_column_name=>'ROW_VERSION_NUMBER'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109108010700613.4859)
,p_column_sequence=>1
,p_query_column_name=>'ID'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109221449700615.4859)
,p_column_sequence=>2
,p_query_column_name=>'ID_DISPLAY'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109311736700615.4859)
,p_column_sequence=>3
,p_query_column_name=>'CLIENT_ID'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109422434700615.4859)
,p_column_sequence=>4
,p_query_column_name=>'USER_NAME'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109530143700615.4859)
,p_column_sequence=>5
,p_query_column_name=>'STATUS'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109610317700615.4859)
,p_column_sequence=>6
,p_query_column_name=>'SECURITY_GROUP_ID'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109722690700615.4859)
,p_column_sequence=>7
,p_query_column_name=>'CREATED_BY'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109817607700615.4859)
,p_column_sequence=>8
,p_query_column_name=>'CREATED_ON'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648109911057700615.4859)
,p_column_sequence=>9
,p_query_column_name=>'UPDATED_BY'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648110030503700615.4859)
,p_column_sequence=>10
,p_query_column_name=>'UPDATED_ON'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1648110112548700615.4859)
,p_column_sequence=>11
,p_query_column_name=>'ROW_VERSION_NUMBER'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1655185314733291900.4859)
,p_plug_name=>'ナビゲーション'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6673907217641045.4859)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(1655184530741291898.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1655476716389340490.4859)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1648064930974695225.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_image_alt=>'取消'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1646176608085255847.4859)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1646157302891254340.4859)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_image_alt=>'リセット'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,RIR,CIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1646011801025239419.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1646157302891254340.4859)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'作成'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1648065021794695225.4859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1646157302891254340.4859)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'変更の適用'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1648067522021695229.4859)
,p_branch_action=>'f?p=&APP_ID.:14:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648065625738695227.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'CLIENT_ID not null'
,p_validation_sequence=>30
,p_validation=>'CLIENT_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER#に値が必要です。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'CLIENT_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648065829230695227.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'CLIENT_ID must be numeric'
,p_validation_sequence=>30
,p_validation=>'CLIENT_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER#は数値で指定する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'CLIENT_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648066014923695227.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'USER_NAME not null'
,p_validation_sequence=>40
,p_validation=>'USER_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER#に値が必要です。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'USER_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648066210742695227.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'STATUS not null'
,p_validation_sequence=>50
,p_validation=>'STATUS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER#に値が必要です。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'STATUS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648066414329695227.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'SECURITY_GROUP_ID not null'
,p_validation_sequence=>60
,p_validation=>'SECURITY_GROUP_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER#に値が必要です。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'SECURITY_GROUP_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648066601565695227.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'SECURITY_GROUP_ID must be numeric'
,p_validation_sequence=>60
,p_validation=>'SECURITY_GROUP_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER#は数値で指定する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'SECURITY_GROUP_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648066818534695227.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'CREATED_ON must be a valid date'
,p_validation_sequence=>80
,p_validation=>'CREATED_ON'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'#COLUMN_HEADER#は、有効な日付である必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'CREATED_ON'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648067014517695229.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'UPDATED_ON must be a valid date'
,p_validation_sequence=>100
,p_validation=>'UPDATED_ON'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'#COLUMN_HEADER#は、有効な日付である必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'UPDATED_ON'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1648067210667695229.4859)
,p_tabular_form_region_id=>wwv_flow_api.id(1648063522077695211.4859)
,p_validation_name=>'ROW_VERSION_NUMBER must be numeric'
,p_validation_sequence=>110
,p_validation=>'ROW_VERSION_NUMBER'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER#は数値で指定する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1648065021794695225.4859)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4859)
,p_associated_column=>'ROW_VERSION_NUMBER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1648817128329848402.4859)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Manage Approvals'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'    -- Update wwv_flow_rt$approvals table to approve/deny access',
'    for i in 1 .. HTMLDB_APPLICATION.g_f01.count',
'    loop',
'',
'        -- Set Status Only For Changed Values',
'        update wwv_flow_rt$approvals',
'           set status = wwv_flow.g_f02(i)',
'         where id = wwv_flow.g_f01(i)',
'           and status <> wwv_flow.g_f02(i);',
'',
'        -- Delete Existing User Sessions',
'        if wwv_flow.g_f02(i) = ''DENIED'' then',
'            delete from wwv_flow_rt$user_sessions',
'             where approval_id = wwv_flow.g_f01(i);',
'        end if;',
'',
'    end loop;',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1648065021794695225.4859)
,p_process_success_message=>'ステータスが正常に更新されました。'
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'RESTfulサービスの作成/編集'
,p_page_mode=>'NORMAL'
,p_step_title=>'RESTfulサービスの作成/編集'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184627'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1646007103991239390.4859)
,p_branch_action=>'f?p=&APP_ID.:14:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1646009523673239406.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WWV_FLOW_RT$APPROVALS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$APPROVALS'
,p_attribute_03=>'P15_ID'
,p_attribute_04=>'ID'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1646009729618239406.4859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WWV_FLOW_RT$APPROVALS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_RT$APPROVALS'
,p_attribute_03=>'P15_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'アクションが処理されました。'
);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16.4859
,p_user_interface_id=>wwv_flow_api.id(4971601142302345.4859)
,p_name=>'複数の承認の更新'
,p_page_mode=>'NORMAL'
,p_step_title=>'複数の承認の更新'
,p_step_sub_title=>'Upset Multiple Approvals'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(719672816683933088.4859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'bldapp_item_pg_edit.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184627'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1654447920552002311.4859)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6675421676641048.4859)
,p_plug_display_sequence=>91
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1654540109279011339.4859)
,p_plug_name=>'RESTfulサービスの承認'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(719702549794942779.4859)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'apex_item.checkbox2(1,a.id,null,null,'':'',null,''Select item'') c, ',
'a.ID, ',
'a.CLIENT_ID,',
'a.USER_NAME,',
'a.status,',
'a.SECURITY_GROUP_ID,',
'a.CREATED_BY,',
'a.CREATED_ON,',
'a.UPDATED_BY,',
'a.UPDATED_ON,',
':IMAGE_PREFIX||''htmldb/icons/icon_auth_default.gif'' the_icon,',
'--''f?p=''||:APP_ID||'':15:''||:APP_SESSION||'':::15:P15_ID:''||a.id the_link',
'''f?p=''||:APP_ID||'':14:''||:APP_SESSION||'':::'' the_link',
'from #OWNER#.WWV_FLOW_RT$APPROVALS a',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1654540306040011341.4859)
,p_name=>'RESTful Service Approvals'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'この問合せは#MAX_ROW_COUNT#より多い行数を返します。結果が完全になるようにデータをフィルタ処理してください。'
,p_no_data_found_message=>'データが見つかりません。'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_link_column=>'THE_LINK'
,p_icon_view_img_src_column=>'THE_ICON'
,p_icon_view_label_column=>'USER_NAME'
,p_icon_view_columns_per_row=>5
,p_owner=>'HILARY'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654540403106011343.4859)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654540516507011343.4859)
,p_db_column_name=>'CLIENT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'クライアント'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(1646424605586349771)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654540612928011343.4859)
,p_db_column_name=>'USER_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'ユーザー名'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654540712711011343.4859)
,p_db_column_name=>'STATUS'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'ステータス'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(1646678615030409311)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654540827723011344.4859)
,p_db_column_name=>'SECURITY_GROUP_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'セキュリティ・グループID'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654540924130011344.4859)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'作成者'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654541026547011344.4859)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'作成'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654541102869011344.4859)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'更新者'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654541204892011344.4859)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'更新'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654541326296011345.4859)
,p_db_column_name=>'THE_ICON'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'アイコン'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654541402424011345.4859)
,p_db_column_name=>'THE_LINK'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'リンク'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1654672604262047707.4859)
,p_db_column_name=>'C'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'<input type="checkbox" onclick="$f_CheckFirstColumn(this)" name="すべてをチェック" title="すべてをチェック"/>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1655531818367345111.4859)
,p_plug_name=>'ナビゲーション'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6673907217641045.4859)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(1655184530741291898.4859)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1655476716389340490.4859)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1656558608998541091.4859)
,p_plug_name=>'バージョン情報'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6675116240641047.4859)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>複数の承認を更新するには、<b>「更新後のステータス」</b>を使用して目的のステータスを設定し、更新する承認に対応するチェックボックスを選択して<b>「ステータスの更新」</b>をクリックします。</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1657380930272708144.4859)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1654447920552002311.4859)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_image_alt=>'リセット'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,RIR,CIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1655988208418398947.4859)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1654447920552002311.4859)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(302280313173718795.4859)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ステータスの更新'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1654451519268002325.4859)
,p_branch_action=>'16'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>119
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1654448818143002316.4859)
,p_name=>'P16_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1654447920552002311.4859)
,p_use_cache_before_default=>'NO'
,p_prompt=>'更新後のステータス'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'RESTFUL_APPROVAL_TYPES'
,p_lov=>'.'||wwv_flow_api.id(1646678615030409311)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(6683302430641069.4859)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'チェックされた承認を更新するステータスを示します。'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1654450000473002317.4859)
,p_name=>'P16_SPACE'
,p_item_sequence=>18
,p_item_plug_id=>wwv_flow_api.id(1654447920552002311.4859)
,p_source=>'&nbsp;'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1654450719223002321.4859)
,p_validation_name=>'AtLeastOneSelected'
,p_validation_sequence=>10
,p_validation=>'wwv_flow.g_f01.count > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'アイテムを1つ以上選択する必要があります。'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1655988208418398947.4859)
,p_associated_item=>wwv_flow_api.id(.4859)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1654451232336002321.4859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Approval Statuses'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for i in 1..wwv_flow.g_f01.count loop',
'    -- Update Approvals Table ',
'    update wwv_flow_rt$approvals ',
'       set status = :P16_STATUS',
'     where id = wwv_flow.g_f01(i)',
'       and status <> :P16_STATUS;',
'  ',
'    -- Update User_Sessions Table',
'    if :P16_STATUS = ''DENIED'' then',
'        delete from wwv_flow_rt$user_sessions',
'         where approval_id = wwv_flow.g_f01(i);',
'    end if;',
'   ',
'end loop;'))
,p_process_error_message=>'承認ステータスの更新中にエラーが発生しました。'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1655988208418398947.4859)
,p_process_success_message=>'ステータスが更新されました。'
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
