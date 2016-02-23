set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
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
,p_default_workspace_id=>200000
,p_default_application_id=>108813
,p_default_owner=>'THEME_DEV'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 108813 - Theme: Classic Blue
--
-- Application Export:
--   Application:     108813
--   Name:            Theme: Classic Blue
--   Exported By:     APEX_050000
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.0.00.32
--   Instance ID:     69332573836388
--

-- Application Statistics:
--   Pages:                     62
--     Items:                  113
--     Computations:             3
--     Validations:             17
--     Processes:               76
--     Regions:                245
--     Buttons:                170
--   Shared Components:
--     Logic:
--       Items:                  2
--     Navigation:
--       Parent Tabs:            2
--       Tab Sets:               2
--         Tabs:                16
--       Lists:                 11
--       Breadcrumbs:            1
--         Entries:             47
--       Trees:                  1
--       NavBar Entries:         4
--     Security:
--       Authentication:         3
--       Authorization:          3
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              23
--         Label:                5
--         List:                17
--         Popup LOV:            1
--         Calendar:             3
--         Breadcrumb:           2
--         Button:               5
--         Report:               9
--       LOVs:                   6
--       Shortcuts:              2
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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,108813)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'THEME_DEV')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Theme: Classic Blue')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'108813')
,p_application_group=>3931220191679794
,p_application_group_name=>'Theme Work'
,p_page_view_logging=>'YES'
,p_checksum_salt_last_reset=>'20150217034422'
,p_bookmark_checksum_function=>'MD5'
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'4.1'
,p_flow_language=>'en-us'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Created 08/12/2004 11:25:08 AM'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(2243174156476774620)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:Theme Testing Application'
,p_public_user=>'HTMLDB_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'Y'
,p_substitution_string_01=>'SAMPLE_TEXT'
,p_substitution_value_01=>'<div style="width:400px;">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad <a href="http://apex.oracle.com/">minim veniam</a>, quis nostrud exercitation ullamco l'
||'aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id e'
||'st laborum."<b>Sample Text Set to style="width:400px;" to test region collapse to content</b></div>'
,p_substitution_string_02=>'WELCOME'
,p_substitution_value_02=>'Welcome,&nbsp;'
,p_substitution_string_03=>'APP_DATE_FMT'
,p_substitution_value_03=>'Day Month DD, YYYY'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150217034422'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2243065585243733739)
,p_name=>'wizard progress bar 38, 39, 40'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243065754175733739)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Step 1'
,p_list_item_link_target=>'f?p=&APP_ID.:38:&SESSION.:'
,p_list_item_current_for_pages=>'38'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243066081119733740)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Step 2'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.:'
,p_list_item_current_for_pages=>'39'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243066377094733740)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Step 3 and Final'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.:'
,p_list_item_current_for_pages=>'40'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2243825566695859894)
,p_name=>'Long List (progress test)'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243825754433859895)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Start'
,p_list_item_link_target=>'f?p=&APP_ID.:46:&SESSION.:'
,p_list_item_current_for_pages=>'46'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243826055122859897)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Progress Train'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243826357054859898)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Continue Progress'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243826668473859898)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Really long progress indicator designed to show off support for long text'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243826974884859898)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Yet more progress'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2243828980547863876)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Complete'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5831585714360427538)
,p_name=>'Calendar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5831586123711430218)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'23'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5831586398215432283)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Calendar Alt 1'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'24'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5831586703063433732)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Small Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'22'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5970907387193499797)
,p_name=>'Page Templates'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5970908064121502543)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'One Level Tabs'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5970908669662504192)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'One Level Tabs with Sidebar'
,p_list_item_link_target=>'f?p=&APP_ID.:211:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5970909374164505431)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'Two Level Tabs'
,p_list_item_link_target=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5970909779705507068)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'Two Level Tabs With Sidebar'
,p_list_item_link_target=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5970910184207508406)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'No Tabs'
,p_list_item_link_target=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5970911462174511512)
,p_list_item_display_sequence=>6
,p_list_item_link_text=>'No Tabs With Sidebar'
,p_list_item_link_target=>'f?p=&APP_ID.:215:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1334010735207754716)
,p_list_item_display_sequence=>16
,p_list_item_link_text=>'No Tabs, Left + Right Side Bars'
,p_list_item_link_target=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5971502980092222504)
,p_name=>'MultiLevel'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971503488404224825)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Parent 1'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'menu/addresses_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971503762562226826)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Parent 2'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'menu/app_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971505080916232145)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Child 2.1'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971503762562226826)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971505383686233007)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Child 2.2'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971503762562226826)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971505687496234115)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Child 2.3'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971503762562226826)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971504372258229710)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Parent 3'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'menu/biz_user_red_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971506263039236450)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Child 3.1'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971504372258229710)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971506666502237470)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Child 3.2'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971504372258229710)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971506971004238792)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Child 3.2.1'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971506666502237470)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971509463170245989)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Child 3.2.2'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971506666502237470)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971507578969241089)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Child 3.3'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(5971504372258229710)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5971520465557294009)
,p_name=>'DHTML Select'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971521287720300361)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'DHTML Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DTREE:&DEBUG.::::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971520980448298256)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tree List'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:TREE:&DEBUG.:RP:::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971521562571302522)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Menu with Sub List'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DMENU:&DEBUG.::::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971521870536304859)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Menu (Images) with sublist'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DIMENU:&DEBUG.::::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5972714115718356586)
,p_name=>'Template Type'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971331580317220990)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Buttons'
,p_list_item_link_target=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'32'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5831568894575043290)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5972715916542366272)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Label'
,p_list_item_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'202'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5972716187583367388)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'List'
,p_list_item_link_target=>'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'205'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5972716493124368973)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Menu'
,p_list_item_link_target=>'f?p=&APP_ID.:206:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'206'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5971497770826200878)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Multi Level Lists (This Label is on Multiple Lines)'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DMENU:&DEBUG.::::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'120'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5972715307538363649)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Region'
,p_list_item_link_target=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'201'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5972715612386365045)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Report'
,p_list_item_link_target=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'204'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6272008325190400849)
,p_name=>'Tasks'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6296653926000878347)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'About this Application'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6297006631332765876)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Enter a New Order'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6272008729346402029)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Add a New Customer'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6272271313602211229)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Add a New Product'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:::'
,p_security_scheme=>wwv_flow_api.id(6272220733229008723)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6272089122607513618)
,p_name=>'Administration'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6273236305297452954)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Charts'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6272089526070514678)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Manage Users'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8,9'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6288869627038997975)
,p_name=>'Order Wizard'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6288870032925999645)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Select a Customer'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6288879405746029611)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Select Items'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6296774228207938759)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Place Order'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'14'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6300130415376714622)
,p_name=>'Chart Tabs'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6300131323341716917)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Cluster Bar'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6300140209189741233)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Pie Chart'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6300140513345742464)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Stacked Bar'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17'
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
 p_id=>wwv_flow_api.id(186736528483840064)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1765088890896712076)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(6272220733229008723)
,p_name=>'Edit Products'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>'select 1 from demo_users where user_name = :APP_USER and products = ''Y'''
,p_error_message=>'You are not authorized to edit Product Information.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(6273024108266542497)
,p_name=>'Verify Order Ownership'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_count number;',
'begin',
'  select count(*) into l_count from demo_orders ',
'    where order_id = :P29_ORDER_ID and user_id = ',
'    (select user_id from demo_users where user_name = :APP_USER);',
'  if l_count > 0 or :APP_USER = ''ADMIN'' then',
'    return true;',
'  else',
'    :P29_ORDER_ID := 1;',
'    return false;',
'  end if;',
'end;'))
,p_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'You are not authorized to view this order!<br />',
'Click <a href="f?p=&APP_ID.:4:&SESSION.">here</a> to continue'))
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(6300109326795642268)
,p_name=>'Admin Users'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>'select 1 from demo_users where user_name = :APP_USER and admin_user = ''Y'''
,p_error_message=>'You need to be an Admin User in order to view this page.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(5379461100437638734)
,p_icon_sequence=>10
,p_icon_subtext=>'Feedback'
,p_icon_target=>'javascript:popupURL(''f?p=&APP_ID.:102:::102'');'
,p_nav_entry_is_feedback_yn=>'Y'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(6271637918968410549)
,p_icon_sequence=>20
,p_icon_subtext=>'Print'
,p_icon_target=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::::YES'
,p_icon_image_alt=>'Print'
,p_nav_entry_is_feedback_yn=>'N'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(2241730072013957258)
,p_icon_sequence=>30
,p_icon_subtext=>'Search'
,p_icon_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(6271637817504410548)
,p_icon_sequence=>40
,p_icon_subtext=>'(Logout)'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Logout'
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
 p_id=>wwv_flow_api.id(6271638404291410704)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_item_comment=>'Used by Custom2 authentication for deep linking support'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6301864419226013172)
,p_name=>'G_PAGE_INFO'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5375668723044150091)
,p_tab_set=>'PageTemplates'
,p_tab_sequence=>10
,p_tab_name=>'T_MYTAB'
,p_tab_text=>'mytab'
,p_tab_step=>19
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(6271637333536410542)
,p_tab_set=>'TS1'
,p_tab_sequence=>1
,p_tab_name=>'T_HOME'
,p_tab_text=>'Home'
,p_tab_step=>1
,p_tab_also_current_for_pages=>'15'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(6271637533547410547)
,p_tab_set=>'TS1'
,p_tab_sequence=>3
,p_tab_name=>'T_PRODUCTS'
,p_tab_text=>'IRR'
,p_tab_step=>3
,p_tab_also_current_for_pages=>'6,10,21'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(6271637713830410548)
,p_tab_set=>'TS1'
,p_tab_sequence=>5
,p_tab_name=>'T_CHARTS'
,p_tab_text=>'Charts'
,p_tab_step=>5
,p_tab_also_current_for_pages=>'16,17,17'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(6300165631792804509)
,p_tab_set=>'TS1'
,p_tab_sequence=>15
,p_tab_name=>'T_ADMIN'
,p_tab_text=>'Admin'
,p_tab_step=>8
,p_tab_also_current_for_pages=>'9'
,p_tab_parent_tabset=>'Page Templates2'
,p_security_scheme=>wwv_flow_api.id(6300109326795642268)
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5972705907810108269)
,p_tab_set=>'TS1'
,p_tab_sequence=>25
,p_tab_name=>'T_TEMPLATES'
,p_tab_text=>'Theme'
,p_tab_step=>200
,p_tab_also_current_for_pages=>'19,200,201,202,204,205,206,214,215,32,120,213,212,22,23,24,25,26,310'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(4813621942533678671)
,p_tab_set=>'TS1'
,p_tab_sequence=>35
,p_tab_name=>'T_RDS'
,p_tab_text=>'RDS'
,p_tab_step=>18
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(2242804464931118115)
,p_tab_set=>'TS1'
,p_tab_sequence=>45
,p_tab_name=>'Cal'
,p_tab_text=>'Cal'
,p_tab_step=>34
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(2243047557198505293)
,p_tab_set=>'TS1'
,p_tab_sequence=>55
,p_tab_name=>'T_PORTAL'
,p_tab_text=>'Portal'
,p_tab_step=>35
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(2243049084293559615)
,p_tab_set=>'TS1'
,p_tab_sequence=>65
,p_tab_name=>'T_TREE'
,p_tab_text=>'Tree'
,p_tab_step=>36
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(2243049553927563827)
,p_tab_set=>'TS1'
,p_tab_sequence=>75
,p_tab_name=>'T_SEARCH'
,p_tab_text=>'Search'
,p_tab_step=>28
,p_tab_also_current_for_pages=>'33'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(2243052953264587963)
,p_tab_set=>'TS1'
,p_tab_sequence=>85
,p_tab_name=>'T_POP'
,p_tab_text=>'Pop'
,p_tab_step=>37
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(2243057462514592827)
,p_tab_set=>'TS1'
,p_tab_sequence=>95
,p_tab_name=>'Wiz'
,p_tab_text=>'Wiz'
,p_tab_step=>38
,p_tab_also_current_for_pages=>'39,40,46'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(2243061172693637615)
,p_tab_set=>'TS1'
,p_tab_sequence=>105
,p_tab_name=>'Form'
,p_tab_text=>'Form'
,p_tab_step=>43
,p_tab_also_current_for_pages=>'41'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(6271637607614410547)
,p_tab_set=>'TS1'
,p_tab_sequence=>106
,p_tab_name=>'T_ORDERS'
,p_tab_text=>'Orders'
,p_tab_step=>4
,p_tab_also_current_for_pages=>'11,12,13,14,29,14'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(6271637414372410546)
,p_tab_set=>'TS1'
,p_tab_sequence=>107
,p_tab_name=>'T_CUSTOMERS'
,p_tab_text=>'Cust'
,p_tab_step=>2
,p_tab_also_current_for_pages=>'7'
,p_tab_parent_tabset=>'Page Templates2'
);
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
wwv_flow_api.create_toplevel_tab(
 p_id=>wwv_flow_api.id(5970951666432995228)
,p_tab_set=>'Page Templates2'
,p_tab_sequence=>10
,p_tab_name=>'T_PARENTTABTEST2'
,p_tab_text=>'Parent&nbsp;Tab&nbsp;Test&nbsp;2'
,p_tab_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_current_on_tabset=>'TS1'
);
wwv_flow_api.create_toplevel_tab(
 p_id=>wwv_flow_api.id(5970948687916977412)
,p_tab_set=>'Page Templates2'
,p_tab_sequence=>20
,p_tab_name=>'T_PAGE TEMPLATES2'
,p_tab_text=>'Parent&nbsp;Tab&nbsp;Test&nbsp;1'
,p_tab_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_current_on_tabset=>'PageTemplates'
);
end;
/
prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6272562608555771050)
,p_lov_name=>'CATEGORIES'
,p_lov_query=>'.'||wwv_flow_api.id(6272562608555771050)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(6272562926228771053)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Phones'
,p_lov_return_value=>'Phones'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(6272563127703771055)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Computer'
,p_lov_return_value=>'Computer'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(6272563302856771055)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Audio'
,p_lov_return_value=>'Audio'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(6272563519720771055)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Video'
,p_lov_return_value=>'Video'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(2241733385267017810)
,p_lov_name=>'EXAMPLE SEARCH SHOW OPTIONS'
,p_lov_query=>'.'||wwv_flow_api.id(2241733385267017810)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2241733561508017812)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Report pages'
,p_lov_return_value=>'R'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2241733782614017813)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Form pages'
,p_lov_return_value=>'F'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2241733953910017813)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Chart pages'
,p_lov_return_value=>'C'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2241734162398017813)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Home page'
,p_lov_return_value=>'H'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2241734375943017813)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Other'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6273846901673265651)
,p_lov_name=>'PRODUCTS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_name d, product_id r from demo_product_info',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6296711130343343293)
,p_lov_name=>'PRODUCTS WITH PRICE'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_name || '' [$'' || list_price || '']'' d, product_id r from demo_product_info',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6273114402575229005)
,p_lov_name=>'STATES'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select initcap(state_name) display_value, st return_value from   demo_states',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6272215726517997388)
,p_lov_name=>'Y OR N'
,p_lov_query=>'.'||wwv_flow_api.id(6272215726517997388)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(6272216017537997391)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Y'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(6272216227258997393)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'N'
,p_lov_return_value=>'N'
);
end;
/
prompt --application/shared_components/navigation/trees
begin
wwv_flow_api.create_tree(
 p_id=>wwv_flow_api.id(6308522032398804946)
,p_name=>'Application Overview'
,p_type=>'DYNAMIC'
,p_item=>'P15_TREE_ROOT'
,p_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "PAGE_ID" id, ',
'       "PARENT_PAGE_ID" pid, ',
'       "PAGE_NAME" name, ',
'       null link, ',
'       null a1, ',
'       null a2 ',
'from "#OWNER#"."DEMO_PAGE_HIERARCHY"',
'order by 3'))
,p_levels=>5
,p_unexpanded_parent=>'<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre02.gif" width="16" height="22" border="0"></a></td>'
,p_unexpanded_parent_last=>'<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre03.gif" width="16" height="22" border="0"></a></td>'
,p_expanded_parent=>'<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre05.gif" width="16" height="22" border="0"></td>'
,p_expanded_parent_last=>'<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre06.gif" width="16" height="22" border="0"></a></td>'
,p_leaf_node=>'<td align="left"><img src="#IMAGE_PREFIX#Fndtre07.gif" width="16" height="22" border="0"></td>'
,p_leaf_node_last=>'<td align="left"><img src="#IMAGE_PREFIX#Fndtre08.gif" width="16" height="22" border="0"></td>'
,p_name_link_anchor_tag=>'<a href="#LINK#">#NAME#</a>'
,p_name_link_not_anchor_tag=>'#NAME#'
,p_indent_vertical_line=>'<td><img src="#IMAGE_PREFIX#Fndtre09.gif" width="16" height="22" border="0"></td>'
,p_indent_vertical_line_last=>'<td><img src="#IMAGE_PREFIX#Fndtre10.gif" width="16" height="22" border="0"></td>'
,p_drill_up=>'&nbsp;(up)'
,p_before_tree=>'<table border="0" cellspacing="0" cellpadding="0">'
,p_after_tree=>'</table>'
,p_level_1_template=>'<tr>#INDENT#<td colspan="#COLSPAN#" valign="CENTER" class="tiny">#NAME##A1##A2# #DRILL_UP#</td></tr>'
,p_level_2_template=>'<tr>#INDENT#<td colspan="#COLSPAN#" valign="CENTER" class="tiny">#NAME##A1##A2#</td></tr>'
);
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/main_menu
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(6271895618863992166)
,p_name=>'Main Menu'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1334006946833742148)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'No Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
,p_link=>'f?p=&FLOW_ID.:310:&SESSION.'
,p_page_id=>310
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2241729773394954052)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Search'
,p_link=>'f?p=&FLOW_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2241731283336964486)
,p_parent_id=>wwv_flow_api.id(2241729773394954052)
,p_short_name=>'Search Results'
,p_link=>'f?p=&FLOW_ID.:33:&SESSION.'
,p_page_id=>33
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2242810685473157136)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Calendar Test'
,p_link=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243047876252505294)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Portal'
,p_link=>'f?p=&FLOW_ID.:35:&SESSION.'
,p_page_id=>35
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243049379084559615)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Tree'
,p_link=>'f?p=&FLOW_ID.:36:&SESSION.'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243053265116587963)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Pop'
,p_link=>'f?p=&FLOW_ID.:37:&SESSION.'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243060568280620894)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Wizard Step 1'
,p_link=>'f?p=&FLOW_ID.:38:&SESSION.'
,p_page_id=>38
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243065065599637648)
,p_parent_id=>wwv_flow_api.id(2243105562569195247)
,p_short_name=>'Edit Employee'
,p_link=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::'
,p_page_id=>41
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243071757515868957)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Step 3'
,p_link=>'f?p=&FLOW_ID.:40:&SESSION.'
,p_page_id=>40
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243072284244871719)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Step 2'
,p_link=>'f?p=&FLOW_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243105562569195247)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Employees'
,p_link=>'f?p=&FLOW_ID.:43:&SESSION.'
,p_page_id=>43
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243824479217839823)
,p_parent_id=>wwv_flow_api.id(2243060568280620894)
,p_short_name=>'Long Progress List'
,p_link=>'f?p=&FLOW_ID.:46:&SESSION.'
,p_page_id=>46
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2243937285346286152)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'Multi Level Lists'
,p_link=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:::'
,p_page_id=>120
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4813622244944678671)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Region Display Selector'
,p_link=>'f?p=&FLOW_ID.:18:&SESSION.'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5375626730034209716)
,p_parent_id=>0
,p_short_name=>'test'
,p_link=>'f?p=&FLOW_ID.:100:&SESSION.'
,p_page_id=>100
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5614071440908210203)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'No Tabs With Sidebar'
,p_link=>'f?p=&APP_ID.:215:&SESSION.::&DEBUG.:::'
,p_page_id=>215
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5614304835221122381)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Report'
,p_link=>'f?p=&FLOW_ID.:21:&SESSION.'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5614605729187935391)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'Two Level Tabs with Sidebar'
,p_link=>'f?p=&FLOW_ID.:213:&SESSION.'
,p_page_id=>213
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5833037016603293080)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'No Tabs'
,p_link=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:::'
,p_page_id=>214
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5833075293947318819)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'One Level Tabs'
,p_link=>'f?p=&FLOW_ID.:210:&SESSION.'
,p_page_id=>210
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5833239110959341320)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'One Level Tabs with Sidebar'
,p_link=>'f?p=&FLOW_ID.:211:&SESSION.'
,p_page_id=>211
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5970854689515338473)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'Menu Templates'
,p_link=>'f?p=&APP_ID.:206:&SESSION.::&DEBUG.:::'
,p_page_id=>206
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5970860680876357628)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Template Index'
,p_link=>'f?p=&FLOW_ID.:200:&SESSION.'
,p_page_id=>200
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5970862991215368027)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'Label Templates'
,p_link=>'f?p=&FLOW_ID.:202:&SESSION.'
,p_page_id=>202
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5970865177413374478)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'List Templates'
,p_link=>'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:::'
,p_page_id=>205
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5970884492003458863)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'Region Templates'
,p_link=>'f?p=&FLOW_ID.:201:&SESSION.'
,p_page_id=>201
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5970887369358469363)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'Report Templates'
,p_link=>'f?p=&FLOW_ID.:204:&SESSION.'
,p_page_id=>204
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5971347669470431853)
,p_parent_id=>wwv_flow_api.id(5970860680876357628)
,p_short_name=>'Button Templates'
,p_link=>'f?p=&FLOW_ID.:32:&SESSION.'
,p_page_id=>32
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6271899414146000278)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6271954911160358924)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Customers'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6271959731031374129)
,p_parent_id=>wwv_flow_api.id(6271954911160358924)
,p_short_name=>'Add/Modify Customers'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6272087306330509001)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Admin'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6272281113780249164)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Products'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6272281420013250994)
,p_parent_id=>wwv_flow_api.id(6272281113780249164)
,p_short_name=>'Add/Modify Products'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6272399601874586306)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Orders'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6272492305888202528)
,p_parent_id=>wwv_flow_api.id(6272281420013250994)
,p_short_name=>'Add Product Image'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6273007801331464741)
,p_parent_id=>wwv_flow_api.id(6272399601874586306)
,p_short_name=>'View/Modify Orders'
,p_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6288863623612949648)
,p_parent_id=>wwv_flow_api.id(6272399601874586306)
,p_short_name=>'Enter New Order'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6288928219701166104)
,p_parent_id=>wwv_flow_api.id(6272399601874586306)
,p_short_name=>'Enter New Order'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6296950504976455469)
,p_parent_id=>wwv_flow_api.id(6272399601874586306)
,p_short_name=>'Enter New Order'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6300240712333969219)
,p_parent_id=>wwv_flow_api.id(6272087306330509001)
,p_short_name=>'Reset Password'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6300242620644971673)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'Charts'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>0
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6300244606577977087)
,p_parent_id=>wwv_flow_api.id(6300242620644971673)
,p_short_name=>'Cluster Bar'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6300245613849979160)
,p_parent_id=>wwv_flow_api.id(6300242620644971673)
,p_short_name=>'Pie Chart'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6300277015076093093)
,p_parent_id=>wwv_flow_api.id(6300242620644971673)
,p_short_name=>'Stacked Bar'
,p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6308514415992790790)
,p_parent_id=>wwv_flow_api.id(6271899414146000278)
,p_short_name=>'About this Application'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307115030340183858)
,p_theme_id=>13
,p_name=>'Login'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="t13Logo2">#LOGO#</div>',
'<div class="t13Sep"><br/></div>',
'<div id="t13BreadcrumbTop">&nbsp;</div>',
'<div class="t13BreadcrumbRegion"><br /></div>',
'<a name="SkipRepNav"></a>',
'<div id="t13MessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="t13BodyMargin">',
'<table border="0" cellspacing="0" cellpadding="0" align="center" width="600">',
'<tr><td>',
'#REGION_POSITION_02##REGION_POSITION_04##BODY#',
'</td>',
'</tr>',
'</table>',
'<div style="float:right;">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13NewBottom"><div class="t13NewBottom1">&BROWSER_LANGUAGE.</div><div class="t13NewBottom2">&MSG_COPYRIGHT.</div><br style="clear:both;"/>',
'</div>',
'#FORM_CLOSE#',
'<a name="END"><br /></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t13SuccessMessage">#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div class="t13Notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307115245182183858)
,p_theme_id=>13
,p_name=>'No Tabs'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td valign="top"><a id="t13Logo2" href="#">#LOGO#</a><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<div id="t13BreadcrumbTop">&nbsp;</div>',
'<table class="t13Layout" cellpadding="0" cellspacing="0" border="0" summary="" width="100%">',
'<tr>',
'<td class="t13BreadcrumbRegion"><div class="t13Breadcrumbs">#REGION_POSITION_01#<span id="t13Customize">#CUSTOMIZE#</span></div></td>',
'</table>',
'<a name="SkipRepNav"></a>',
'<div id="t13MessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="t13BodyMargin">',
'<table summary="" cellpadding="0" cellspacing="0" border="0" height="70%">',
'<tr>',
'<td valign="top" width="100%">#BODY##REGION_POSITION_02##REGION_POSITION_04#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top"><div style="float:right;">#REGION_POSITION_03#</div></td>',
'</tr>',
'</table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13NewBottom"><div id="t13User">&USER.</div><div class="t13NewBottom1">&BROWSER_LANGUAGE.</div>',
'<div class="t13NewBottom2">&MSG_COPYRIGHT.</div>',
'<br style="clear:both;"/>',
'</div>',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'<a name="END"><br /></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13SuccessMessage">#SUCCESS_MESSAGE#</div>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13Notification">#MESSAGE#</div>',
''))
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width=""'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13WizardRegion" summary="" cellpadding="0" cellspacing="0" border="0" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle"></th>',
'<th class="t13RegionButtons">',
'<a href="#BACK_LINK#" class="t13ButtonAlternative1">#OK#</a>',
'</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">',
'',
'  <p>#MESSAGE#</p>',
'  <strong>#ADDITIONAL_INFO#</strong>',
'  <br />',
'  <br />',
'  <div class="error_technical_info">#TECHNICAL_INFO#</div>',
'',
'</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307115538164183858)
,p_theme_id=>13
,p_name=>'No Tabs with Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td valign="top"><a id="t13Logo2" href="#">#LOGO#</a><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<div id="t13BreadcrumbTop">&nbsp;</div>',
'<table class="t13Layout" cellpadding="0" cellspacing="0" border="0" summary="" width="100%">',
'<tr>',
'<td class="t13BreadcrumbRegion"><div class="t13Breadcrumbs">#REGION_POSITION_01#<span id="t13Customize">#CUSTOMIZE#</span></div></td>',
'</table>',
'<a name="SkipRepNav"></a>',
'<div id="t13MessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="t13BodyMargin">',
'<table summary="" cellpadding="0" cellspacing="0" border="0" height="70%">',
'<tr>',
'<td valign="top">#REGION_POSITION_02#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top" width="100%">#BODY##REGION_POSITION_04#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top"><div style="float:right;">#REGION_POSITION_03#</div></td>',
'</tr>',
'</table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13NewBottom"><div id="t13User">&USER.</div><div class="t13NewBottom1">&BROWSER_LANGUAGE.</div>',
'<div class="t13NewBottom2">&MSG_COPYRIGHT.</div>',
'<br style="clear:both;"/>',
'</div>',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'<a name="END"><br /></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13SuccessMessage">#SUCCESS_MESSAGE#</div>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13Notification">#MESSAGE#</div>',
''))
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307115829749183859)
,p_theme_id=>13
,p_name=>'One Level Tabs'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td valign="top"><a id="t13Logo2" href="#">#LOGO#</a><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<div id="t13PageTabs"><table cellpadding="0" cellspacing="0" border="0" summary="" class="t13PageTabs"><tbody><tr>#TAB_CELLS#</tr></tbody></table>',
'</div>',
'<div id="t13BreadcrumbTop">&nbsp;</div>',
'<table class="t13Layout" cellpadding="0" cellspacing="0" border="0" summary="" width="100%">',
'<tr>',
'<td class="t13BreadcrumbRegion"><div class="t13Breadcrumbs">#REGION_POSITION_01#<span id="t13Customize">#CUSTOMIZE#</span></div></td>',
'</table>',
'<a name="SkipRepNav"></a>',
'<div id="t13MessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="t13BodyMargin">',
'<table summary="" cellpadding="0" cellspacing="0" border="0" height="70%">',
'<tr>',
'<td valign="top" width="100%">#BODY##REGION_POSITION_02##REGION_POSITION_04#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top"><div style="float:right;">#REGION_POSITION_03#</div></td>',
'</tr>',
'</table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13NewBottom"><div id="t13User">&USER.</div><div class="t13NewBottom1">&BROWSER_LANGUAGE.</div>',
'<div class="t13NewBottom2">&MSG_COPYRIGHT.</div>',
'<br style="clear:both;"/>',
'</div>',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'<a name="END"><br /></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13SuccessMessage">#SUCCESS_MESSAGE#</div>',
''))
,p_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OnL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnL.png" alt="" /></td>',
'<td class="OnC"><span>#TAB_LABEL#</span></td>',
'<td class="OnR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnR.png" alt="" /></td>'))
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OffL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffL.png" alt="" /></td>',
'<td class="OffC"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td class="OffR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffR.png" alt="" /></td>'))
,p_top_non_curr_tab_font_attr=>'class="parenttabtextoff"'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13Notification">#MESSAGE#</div>',
''))
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307116132894183859)
,p_theme_id=>13
,p_name=>'One Level Tabs with Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td valign="top"><a id="t13Logo2" href="#">#LOGO#</a><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<div id="t13PageTabs"><table cellpadding="0" cellspacing="0" border="0" summary="" class="t13PageTabs"><tbody><tr>#TAB_CELLS#</tr></tbody></table>',
'</div>',
'<div id="t13BreadcrumbTop">&nbsp;</div>',
'<table class="t13Layout" cellpadding="0" cellspacing="0" border="0" summary="" width="100%">',
'<tr>',
'<td class="t13BreadcrumbRegion"><div class="t13Breadcrumbs">#REGION_POSITION_01#<span id="t13Customize">#CUSTOMIZE#</span></div></td>',
'</table>',
'<a name="SkipRepNav"></a>',
'<div id="t13MessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="t13BodyMargin">',
'<table summary="" cellpadding="0" cellspacing="0" border="0" height="70%">',
'<tr>',
'<td valign="top">#REGION_POSITION_02#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top" width="100%">#BODY##REGION_POSITION_04#</td>',
'<td class="t13ColumnSep"><div class="htmldbColumnSep"><br /></div></td>',
'<td valign="top"><div style="float:right;">#REGION_POSITION_03#</div></td>',
'</tr>',
'</table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13NewBottom"><div id="t13User">&USER.</div><div class="t13NewBottom1">&BROWSER_LANGUAGE.</div>',
'<div class="t13NewBottom2">&MSG_COPYRIGHT.</div>',
'<br style="clear:both;"/>',
'</div>',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'<a name="END"><br /></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13SuccessMessage">#SUCCESS_MESSAGE#</div>',
''))
,p_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OnL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnL.png" alt="" /></td>',
'<td class="OnC"><span>#TAB_LABEL#</span></td>',
'<td class="OnR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnR.png" alt="" /></td>'))
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OffL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffL.png" alt="" /></td>',
'<td class="OffC"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td class="OffR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffR.png" alt="" /></td>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13Notification">#MESSAGE#</div>',
''))
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307116447560183860)
,p_theme_id=>13
,p_name=>'Popup'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td width="100%" valign="top"><div class="t13messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td'
||'>',
'<td valign="top">#REGION_POSITION_03#<br /></td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE##DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t13success">#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div class="t13notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavigationBar">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>4
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307116730201183860)
,p_theme_id=>13
,p_name=>'Printer Friendly'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td valign="top">#LOGO##REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#REGION_POSITION_08#</td>',
'</table>',
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td width="100%" valign="top">',
'<div style="border:1px solid black;">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>',
'#BODY##REGION_POSITION_04#</td>',
'<td valign="top">#REGION_POSITION_03#<br /></td>',
'</tr>',
'</table>',
'#REGION_POSITION_05#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE##DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t13success">#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div class="t13notification">#MESSAGE#</div>'
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>5
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
,p_template_comment=>'3'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307117023563183860)
,p_theme_id=>13
,p_name=>'Two Level Tabs'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td valign="top"><a id="t13Logo2" href="#">#LOGO#</a><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<div id="t13PageTabs"><table cellpadding="0" cellspacing="0" border="0" summary="" class="t13PageTabs"><tbody><tr>#PARENT_TAB_CELLS#</tr></tbody></table>',
'</div>',
'<div id="t13BreadcrumbTop2"><div>#TAB_CELLS#</div></div>',
'<table class="t13Layout" cellpadding="0" cellspacing="0" border="0" summary="" width="100%">',
'<tr>',
'<td class="t13BreadcrumbRegion"><div class="t13Breadcrumbs">#REGION_POSITION_01#</div><span id="t13Customize">#CUSTOMIZE#</span></td>',
'</table>',
'<a name="SkipRepNav"></a>',
'<div id="t13MessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="t13BodyMargin">',
'<table summary="" cellpadding="0" cellspacing="0" border="0" height="70%">',
'<tr>',
'<td valign="top" width="100%">#BODY##REGION_POSITION_02##REGION_POSITION_04#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top"><div style="float:right;">#REGION_POSITION_03#</div></td>',
'</tr>',
'</table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13NewBottom"><div id="t13User">&USER.</div><div class="t13NewBottom1">&BROWSER_LANGUAGE.</div>',
'<div class="t13NewBottom2">&MSG_COPYRIGHT.</div>',
'<br style="clear:both;"/>',
'</div>',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'<a name="END"><br /></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t13SuccessMessage">#SUCCESS_MESSAGE#</div>'
,p_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<span class="OnC">#TAB_LABEL#</span><b>|</b>',
''))
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<span class="OffC"><a href="#TAB_LINK#">#TAB_LABEL#</a></span><b>|</b>',
''))
,p_top_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OnL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnL.png" alt="" /></td>',
'<td class="OnC"><span>#TAB_LABEL#</span></td>',
'<td class="OnR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnR.png" alt="" /></td>',
'',
''))
,p_top_non_curr_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OffL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffL.png" alt="" /></td>',
'<td class="OffC"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td class="OffR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffR.png" alt="" /></td>',
''))
,p_notification_message=>'<div class="t13Notification">#MESSAGE#</div>'
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width=""'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>2
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(1307117327685183860)
,p_theme_id=>13
,p_name=>'Two Level Tabs with Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<link rel="stylesheet" href="#THEME_IMAGES#theme_4_0.css" type="text/css" />',
'#APEX_CSS#',
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
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td valign="top"><a id="t13Logo2" href="#">#LOGO#</a><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<div id="t13PageTabs"><table cellpadding="0" cellspacing="0" border="0" summary="" class="t13PageTabs"><tbody><tr>#PARENT_TAB_CELLS#</tr></tbody></table>',
'</div>',
'<div id="t13BreadcrumbTop2"><div>#TAB_CELLS#</div></div>',
'<table class="t13Layout" cellpadding="0" cellspacing="0" border="0" summary="" width="100%">',
'<tr>',
'<td class="t13BreadcrumbRegion"><div class="t13Breadcrumbs">#REGION_POSITION_01#</div><span id="t13Customize">#CUSTOMIZE#</span></td>',
'</table>',
'<a name="SkipRepNav"></a>',
'<div id="t13MessageHolder">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div class="t13BodyMargin">',
'<table summary="" cellpadding="0" cellspacing="0" border="0" height="70%">',
'<tr>',
'<td valign="top">#REGION_POSITION_02#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top" width="100%">#BODY##REGION_POSITION_04#</td>',
'<td class="t13ColumnSep"><div class="t13ColumnSep"><br /></div></td>',
'<td valign="top"><div style="float:right;">#REGION_POSITION_03#</div></td>',
'</tr>',
'</table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t13NewBottom"><div id="t13User">&USER.</div><div class="t13NewBottom1">&BROWSER_LANGUAGE.</div>',
'<div class="t13NewBottom2">&MSG_COPYRIGHT.</div>',
'<br style="clear:both;"/>',
'</div>',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'<a name="END"><br /></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t13SuccessMessage">#SUCCESS_MESSAGE#</div>'
,p_current_tab=>'<span class="OnC">#TAB_LABEL#</span><b>|</b>'
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<span class="OffC"><a href="#TAB_LINK#">#TAB_LABEL#</a></span><b>|</b>',
''))
,p_top_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OnL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnL.png" alt="" /></td>',
'<td class="OnC"><span>#TAB_LABEL#</span></td>',
'<td class="OnR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnR.png" alt="" /></td>'))
,p_top_non_curr_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OffL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffL.png" alt="" /></td>',
'<td class="OffC"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td class="OffR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffR.png" alt="" /></td>'))
,p_notification_message=>'<div class="t13Notification">#MESSAGE#</div>'
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(3791736542868)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_template=>'<input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>'<input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_template_comment=>'5.0 upgrade'
,p_theme_id=>13
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(1307117624872183861)
,p_template_name=>'Button'
,p_template=>'<input type="button" onclick="#JAVASCRIPT#" value="#LABEL#" class="t13Button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" />'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>13
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(1307117850205183861)
,p_template_name=>'Button, Alternative 1'
,p_template=>'<a href="#LINK#" class="t13ButtonAlternative1" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>13
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(1307118033714183861)
,p_template_name=>'Button, Alternative 2'
,p_template=>'<a href="#LINK#" class="t13ButtonAlternative2" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>13
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(1307118225465183861)
,p_template_name=>'Button, Alternative 3'
,p_template=>'<a href="#LINK#" class="t13ButtonAlternative3" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>2
,p_theme_id=>13
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307118447403183861)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13BorderlessRegion" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Borderless Region'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>13
,p_theme_class_id=>7
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307118749923183862)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t13BracketedRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<tr>',
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">',
'<tr>',
'<td class="t13bracket"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif" height="5" width="1" alt="" /></td>',
'<td rowspan="3" class="t13RegionBody">',
'<div class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>#BODY#</td>',
'<td class="t13bracket"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif" height="5" width="1" alt="" /></td>',
'</tr>',
'<tr>',
'<td><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif" height="48" width="1" alt="" /></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif" height="48" width="1" alt="" /></td>',
'</tr>',
'<tr>',
'<td class="t13bracket"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif" height="5" width="1" alt="" /></td>',
'<td class="t13bracket"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif" height="5" width="1" alt="" /></td>',
'</tr>',
'</table></td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Bracketed Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>13
,p_theme_class_id=>18
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307119031134183862)
,p_layout=>'TABLE'
,p_template=>'<div  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'Breadcrumb Region'
,p_theme_id=>13
,p_theme_class_id=>6
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307119334632183863)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ButtonRegionwithTitle" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'</table>#BODY#'))
,p_page_plug_template_name=>'Button Region with Title'
,p_theme_id=>13
,p_theme_class_id=>4
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307119630301183863)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ButtonRegionwithoutTitle" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'</table>#BODY#'))
,p_page_plug_template_name=>'Button Region without Title'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>13
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307119946929183863)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ListRegionwithIcon" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody"><table summary="" cellpadding="0" cellspacing="0" border="0">',
'<tr>',
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_13/images/report_icon.png" alt="" /></td>',
'<td valign="top">#BODY#</td>',
'</tr>',
'</table></td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Chart List'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>13
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307120250701183863)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ChartRegion" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Chart Region'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>13
,p_theme_class_id=>30
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307120527432183864)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13FormRegion" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#<img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif" height="1" width="500" alt="" /></td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Form Region'
,p_theme_id=>13
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307120825206183864)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13FormRegion" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#<img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#REGION_ID#Body'')" style="margin:0 5px;" class="pseudoButtonInactive" /></th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody id="#REGION_ID#Body" style="display:none;">',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Hide and Show Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>13
,p_theme_class_id=>1
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307121142734183864)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13NavigationRegion" border="0" cellpadding="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<tr>',
'<td class="t13RegionBody">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Navigation Region'
,p_theme_id=>13
,p_theme_class_id=>5
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307121447321183864)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13NavigationRegionAlternative1" border="0" cellpadding="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader"><tr><th class="t13RegionTitle">#TITLE#</th></tr></thead>',
'<tr>',
'<td class="t13RegionBody">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Navigation Region, Alternative 1'
,p_theme_id=>13
,p_theme_class_id=>16
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307121722709183865)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13RegionWithoutButtonTitle" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>',
'',
''))
,p_page_plug_template_name=>'Region without Buttons and Title'
,p_theme_id=>13
,p_theme_class_id=>19
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307122036801183865)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13RegionWithoutTitle" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>',
'',
''))
,p_page_plug_template_name=>'Region without Title'
,p_theme_id=>13
,p_theme_class_id=>11
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307122326202183865)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<tbody>',
'<tr>',
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>',
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_find.png" /></td>',
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>',
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>',
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>',
'</tr>',
'<tr><td class="apex_finderbar_left_middle"><br /></td></tr>',
'<tr>',
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Report Filter - Single Row'
,p_theme_id=>13
,p_theme_class_id=>31
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307122646462183865)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ListRegionwithIcon" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody"><table summary="" cellpadding="0" cellspacing="0" border="0">',
'<tr>',
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_13/report.gif""/></td>',
'<td valign="top">#BODY#</td>',
'</tr>',
'</table></td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Report List'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>13
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307122946604183866)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ReportRegion" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons" valign="bottom">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Reports Region'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>13
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307123222734183866)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ReportRegion" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# width="100%">',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Reports Region 100% Width'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>13
,p_theme_class_id=>13
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307123528493183866)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13ReportRegionAlt1" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons" valign="bottom">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Reports Region, Alternative 1'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>13
,p_theme_class_id=>10
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307123843367183866)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" class="t13Sidebar" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead>',
'<tr>',
'<th class="L"><br /></th>',
'<th class="C">#TITLE#</th>',
'<th class="R"><br /></th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="3" class="B">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Sidebar Region'
,p_plug_table_bgcolor=>'#F7F7E7'
,p_theme_id=>13
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#F7F7E7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'Y'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307124143912183867)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" class="t13SidebarAlt1" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead>',
'<tr><th class="L"><br /></th><th class="C">#TITLE#</th><th class="R"><br /></th></tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="3" class="B">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Sidebar Region, Alternative 1'
,p_plug_table_bgcolor=>'#F7F7E7'
,p_theme_id=>13
,p_theme_class_id=>3
,p_plug_heading_bgcolor=>'#F7F7E7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307124430808183867)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-blank" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top">',
'    <div class="rc-gray-top-r"></div>',
'  </div>',
'  <div class="rc-body">',
'    <div class="rc-body-r">',
'      <div class="rc-content-main">',
'        <div class="rc-left">',
'          #BODY#',
'        </div>',
'        <div class="rc-right">',
'          #CLOSE##COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#',
'        </div>',
'        <div class="clear"></div>',
'      </div>',
'    </div>',
'  </div>',
'  <div class="rc-bottom">',
'    <div class="rc-bottom-r"></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Top Bar'
,p_theme_id=>13
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307124748275183867)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13WizardRegion" summary="" cellpadding="0" cellspacing="0" border="0" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody>',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Wizard Region'
,p_theme_id=>13
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1307125039037183868)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="t13WizardRegion" summary="" cellpadding="0" cellspacing="0" border="0" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<thead class="t13RegionHeader">',
'<tr>',
'<th class="t13RegionTitle">#TITLE#</th>',
'<th class="t13RegionButtons">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</th>',
'</tr>',
'</thead>',
'<tbody class="Confirm">',
'<tr>',
'<td colspan="2" class="t13RegionBody">#BODY#</td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Wizard Region with Icon'
,p_theme_id=>13
,p_theme_class_id=>20
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307125325788183868)
,p_list_template_current=>'<a href="#LINK#" class="t13Current">#TEXT#</a>'
,p_list_template_noncurrent=>'<a href="#LINK#">#TEXT#</a>'
,p_list_template_name=>'Button List'
,p_theme_id=>13
,p_theme_class_id=>6
,p_list_template_before_rows=>'<div class="t13ButtonList">'
,p_list_template_after_rows=>'</div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307125650553183868)
,p_list_template_current=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'DHTML Menu with Sublist'
,p_theme_id=>13
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>'
,p_item_templ_noncurr_w_child=>'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>'
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#themes/theme_13/menu_open_right.gif" /></a'
||'></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#themes/theme_13/menu_open_right.gif" /></a'
||'></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307125942791183868)
,p_list_template_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'DHTML Tree'
,p_theme_id=>13
,p_theme_class_id=>22
,p_list_template_before_rows=>'<ul class="dhtmlTree">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307126227634183869)
,p_list_template_current=>'<td class="t13current"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/><br />#TEXT#</td>'
,p_list_template_noncurrent=>'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>'
,p_list_template_name=>'Horizontal Images with Label List'
,p_theme_id=>13
,p_theme_class_id=>4
,p_list_template_before_rows=>'<table class="t13HorizontalImageswithLabelList" cellpadding="0" border="0" cellspacing="0" summary=""><tr>'
,p_list_template_after_rows=>'</tr></table>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307126534993183869)
,p_list_template_current=>'<a href="#LINK#" class="t13current">#TEXT#</a>'
,p_list_template_noncurrent=>'<a href="#LINK#">#TEXT#</a>'
,p_list_template_name=>'Horizontal Links List'
,p_theme_id=>13
,p_theme_class_id=>3
,p_list_template_before_rows=>'<div class="t13HorizontalLinksList">'
,p_list_template_after_rows=>'</div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307126824588183870)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OnL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnL.png" alt="" /></td>',
'<td class="OnC"><a href="#LINK#">#TEXT#</a></td>',
'<td class="OnR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOnR.png" alt="" /></td>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td class="OffL"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffL.png" alt="" /></td>',
'<td class="OffC"><a href="#LINK#">#TEXT#</a></td>',
'<td class="OffR"><img src="#IMAGE_PREFIX#themes/theme_13/tabOffR.png" alt="" /></td>',
''))
,p_list_template_name=>'Page Tab Navigation'
,p_theme_id=>13
,p_theme_class_id=>0
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t13PageTabs">',
'<tbody>',
'<tr>',
''))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tr>',
'</tbody>',
'</table>'))
,p_list_template_comment=>'This is the list template to simulate tabs in the builder application'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307127132911183870)
,p_list_template_current=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></di'
||'v>'
,p_list_template_noncurrent=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt=""  /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></d'
||'iv>'
,p_list_template_name=>'Pull Down Menu with Image'
,p_theme_id=>13
,p_theme_class_id=>21
,p_list_template_before_rows=>'<div class="dhtmlMenuLG">'
,p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,'''
||'#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_item_templ_noncurr_w_child=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,'''
||'#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307127428491183870)
,p_list_template_current=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_list_template_noncurrent=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_list_template_name=>'Pull Down Menu with Image (Custom 1)'
,p_theme_id=>13
,p_theme_class_id=>9
,p_list_template_before_rows=>'<div class="dhtmlMenuLG">'
,p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_'
||'ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_item_templ_noncurr_w_child=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_'
||'ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307127750529183870)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td valign="bottom" class="t13SepL"><img src="#IMAGE_PREFIX#themes/theme_13/tab_list_left_cap.gif" alt="" /></td>',
'<td class="t13CurrentListTab"><a class="t13CurrentListTab" href="#LINK#">#TEXT#</a></td>',
'<td valign="bottom" class="t13SepR"><img src="#IMAGE_PREFIX#themes/theme_13/tab_list_right_cap.gif" alt="" /></td>'))
,p_list_template_noncurrent=>'<td><a href="#LINK#">#TEXT#</a></td>'
,p_list_template_name=>'Tabbed Navigation List'
,p_theme_id=>13
,p_theme_class_id=>7
,p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0"  summary="" width="100%" class="t13TabbedNavigationList"><tbody><tr><td class="t13LeftTabList">&nbsp;&nbsp;&nbsp;&nbsp;</td>'
,p_list_template_after_rows=>'<td class="t13EndCap" width="100%">&nbsp;</td></tr></tbody></table>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307128022883183871)
,p_list_template_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Tree List'
,p_theme_id=>13
,p_theme_class_id=>23
,p_list_template_before_rows=>'<ul class="htmlTree">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_noncurr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_curr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307128326231183871)
,p_list_template_current=>'<tr><td class="t13current"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>'
,p_list_template_noncurrent=>'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>'
,p_list_template_name=>'Vertical Images List'
,p_theme_id=>13
,p_theme_class_id=>5
,p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t13VerticalImagesList">'
,p_list_template_after_rows=>'</table>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307128642924183872)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>',
''))
,p_list_template_name=>'Vertical Images List (Custom 2)'
,p_theme_id=>13
,p_theme_class_id=>10
,p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="5" summary="" >'
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
''))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307128935443183872)
,p_list_template_current=>'<li class="t13current"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Ordered List'
,p_theme_id=>13
,p_theme_class_id=>2
,p_list_template_before_rows=>'<ol class="t13VerticalOrderedList">'
,p_list_template_after_rows=>'</ol>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307129242282183872)
,p_list_template_current=>'<a class="t13current" href="#LINK#">#TEXT#</a>'
,p_list_template_noncurrent=>'<a href="#LINK#">#TEXT#</a>'
,p_list_template_name=>'Vertical Sidebar List'
,p_theme_id=>13
,p_theme_class_id=>19
,p_list_template_before_rows=>'<div class="t13VerticalSidebarList">'
,p_list_template_after_rows=>'</div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307129535729183872)
,p_list_template_current=>'<li class="t13current"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered Links without Bullets'
,p_theme_id=>13
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t13VerticalUnorderedLinkswithoutBullets">'
,p_list_template_after_rows=>'</ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307129829032183872)
,p_list_template_current=>'<li class="t13current"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List with Bullets'
,p_theme_id=>13
,p_theme_class_id=>1
,p_list_template_before_rows=>'<ul class="t13VerticalUnorderedListwithBullets">'
,p_list_template_after_rows=>'</ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(1307130120281183873)
,p_list_template_current=>'<div class="t13WizCurrent">#TEXT#</div>'
,p_list_template_noncurrent=>'<div class="t13WizNon">#TEXT#</div>'
,p_list_template_name=>'Wizard Progress List'
,p_theme_id=>13
,p_theme_class_id=>17
,p_list_template_before_rows=>'<div class="t13WizBar">'
,p_list_template_after_rows=>'</div>'
,p_between_items=>'<div class="t13WizArrow"><img src="#IMAGE_PREFIX#arrow_down.gif" width="7" height="6" alt="Down" /></div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307130424219183873)
,p_row_template_name=>'APEX 4.0 - Value Attribute Pairs'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="report-row">',
'  <div class="report-col-hdr">#COLUMN_HEADER#</div>',
'  <div class="report-col-val">#COLUMN_VALUE#</div>',
'</div>'))
,p_row_template_before_rows=>'<div class="two-col-report-portlet">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>13
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307130729100183874)
,p_row_template_name=>'Borderless'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t13data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" class="t13Borderless"  border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="t13CSV">#CSV_LINK#</span>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t13ReportHeader">#COLUMN_HEADER#</th>'
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
,p_theme_id=>13
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_row_template_comment=>'<br /><img class="psuedoButton" src="#IMAGE_PREFIX#pdf.png" onclick="pdf_Grab_XML2(''f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:FLOW_FOP_OUTPUT_#REGION_ID#'')" />'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1307130729100183874)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307131236809183874)
,p_row_template_name=>'Horizontal Border'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t13data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" class="t13HorizontalBorder"  border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="t13CSV">#CSV_LINK#</span>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t13ReportHeader">#COLUMN_HEADER#</th>'
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
,p_theme_id=>13
,p_theme_class_id=>2
,p_translate_this_template=>'N'
,p_row_template_comment=>'<br /><img class="psuedoButton" src="#IMAGE_PREFIX#pdf.png" onclick="pdf_Grab_XML2(''f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:FLOW_FOP_OUTPUT_#REGION_ID#'')" />'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1307131236809183874)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307131732744183875)
,p_row_template_name=>'One Column Unordered List'
,p_row_template1=>'#COLUMN_VALUE#'
,p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr><td><ul class="t13OneColumnUnorderedList">'
,p_row_template_after_rows=>'</ul><div class="t13CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="t13pagination">#PAGINATION_NEXT# &gt;</a>'
,p_previous_page_template=>'<a href="#LINK#" class="t13pagination">&lt;#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="t13pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>'
,p_previous_set_template=>'<a href="#LINK#" class="t13pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>13
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1307131732744183875)
,p_row_template_before_first=>'<li>'
,p_row_template_after_last=>'</li>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307132244516183875)
,p_row_template_name=>'Standard'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t13data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" class="t13Standard"  border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="t13CSV">#CSV_LINK#</span>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t13ReportHeader">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#TEXT#',
''))
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>13
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1307132244516183875)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307132720755183876)
,p_row_template_name=>'Standard (PPR)'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t13data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" cellspacing="0" class="t13Standard"  border="0" summary="" id="#REGION_ID#" htmldb:href="p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:pg_R_#REGION_ID#:NO:">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="t13CSV">#CSV_LINK#</span>',
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
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t13ReportHeader">#COLUMN_HEADER#</th>'
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
,p_theme_id=>13
,p_theme_class_id=>7
,p_translate_this_template=>'N'
,p_row_template_comment=>'<br /><img class="psuedoButton" src="#IMAGE_PREFIX#pdf.png" onclick="pdf_Grab_XML2(''f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:FLOW_FOP_OUTPUT_#REGION_ID#'')" />'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1307132720755183876)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307133239708183876)
,p_row_template_name=>'Standard, Alternating Row Colors'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t13data">#COLUMN_VALUE#</td>'
,p_row_template2=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t13dataalt">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" class="t13Standard"  border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="t13CSV">#CSV_LINK#</span>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t13ReportHeader">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'EVEN_ROW_NUMBERS'
,p_row_template_display_cond2=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'EVEN_ROW_NUMBERS'
,p_pagination_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#TEXT#',
''))
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>13
,p_theme_class_id=>5
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1307133239708183876)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307133728182183877)
,p_row_template_name=>'Two Column Portlet'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="report-row">',
'  <div class="report-col-hdr">#1#</div>',
'  <div class="report-col-val">#2#</div>',
'</div>'))
,p_row_template_before_rows=>'<div class="two-col-report-portlet" #REPORT_ATTRIBUTES# id="#REGION_ID#">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>13
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(1307134022997183877)
,p_row_template_name=>'Value Attribute Pairs'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr>',
'<th class="t13ReportHeader">#COLUMN_HEADER#</th>',
'<td class="t13data">#COLUMN_VALUE#</td>',
'</tr>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr>',
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t13ValueAttributePairs">'))
,p_row_template_after_rows=>'</table><div class="t13CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="t13pagination">#PAGINATION_NEXT# &gt;</a>'
,p_previous_page_template=>'<a href="#LINK#" class="t13pagination">&lt;#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="t13pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>'
,p_previous_set_template=>'<a href="#LINK#" class="t13pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>13
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(1307134022997183877)
,p_row_template_after_last=>'<tr><td colspan="2" class="t13seperate"><hr /></td></tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1307134543305183878)
,p_template_name=>'No Label'
,p_template_body1=>'<span class="t13NoLabel">'
,p_template_body2=>'</span>'
,p_on_error_before_label=>'<div class="t13InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>13
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1307134630977183878)
,p_template_name=>'Optional Label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="t13OptionalLabel">'
,p_template_body2=>'</span></label>'
,p_theme_id=>13
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1307134724697183878)
,p_template_name=>'Optional Label with Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a class="t13OptionalLabelwithHelp" href="javascript:apex.theme.popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_theme_id=>13
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1307134820943183878)
,p_template_name=>'Required Label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999"><span class="t13RequiredLabel"><img src="#IMAGE_PREFIX#requiredicon_status2.gif" alt="" />'
,p_template_body2=>'</span></label>'
,p_on_error_before_label=>'<div class="t13InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>13
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1307134946658183878)
,p_template_name=>'Required Label with Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a class="t13RequiredLabelwithHelp" href="javascript:apex.theme.popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999"><img src="#IMAGE_PREFIX#requiredicon_status2.gif" alt="" />'
,p_template_body2=>'</a></label>'
,p_theme_id=>13
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(1307135051953183878)
,p_name=>'Breadcrumb Menu'
,p_current_page_option=>'<span class="t13Breadcrumb">#NAME#</span>'
,p_non_current_page_option=>'<a href="#LINK#" class="t13Breadcrumb">#NAME#</a>'
,p_between_levels=>'<span class="t13BreadcrumbSep">&gt;</span>'
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>13
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(1307135140414183878)
,p_name=>'Hierarchical Menu'
,p_before_first=>'<ul class="t13HierarchicalMenu">'
,p_current_page_option=>'<li class="t13current"><a href="#LINK#">#NAME#</a></li>'
,p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>11
,p_start_with_node=>'CHILD_MENU'
,p_theme_id=>13
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(1307135828469183878)
,p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif'
,p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#APEX_JAVASCRIPT#',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon"><link rel="stylesheet" href="#THEME_IMAGES#theme_V3.css" type="text/css">',
'',
'#THEME_CSS#',
'</head>'))
,p_page_body_attr=>'onload="first_field()" style="background-color:#FFFFFF;margin:0;"'
,p_before_field_text=>'<div class="t13PopupHead">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next >'
,p_prev_button_text=>'< Previous'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>'<div class="t13PopupBody">'
,p_theme_id=>13
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(1307135248105183878)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13CalendarHolder"> ',
' <tr>',
'   <td class="t13MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="2" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="t13Calendar">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="t13DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="t13Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="t13Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="t13WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="t13WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="t13NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="t13NonDay" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13WeekCalendarHolder">',
'<tr>',
'<td class="t13MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY#<br>#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t13WeekCalendar">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="t13Day" valign="top">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="t13Today" valign="top">'
,p_weekly_weekend_open_format=>'<td valign="top" class="t13NonDay">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t13Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13DayCalendarHolder"> <tr> <td class="t13MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="2" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t13DayCalendar">'
,p_daily_month_close_format=>'</table></td> </tr> </table>'
,p_daily_day_open_format=>'<td valign="top" class="t13Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="t13Today">'
,p_daily_time_open_format=>'<th scope="row" class="t13Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_agenda_format=>'<table class="ListCalendarHolder" summary="" role="presentation"><tr><td class="MonthTitle">#LTITLE#</td></tr><tr><td><table class="ListCalendar" summary="#CALENDAR_TITLE# #LTITLE#">#DAYS#</td></tr></table>'
,p_agenda_past_day_format=>'<tr> <th id="#MON#_#DD#_#YYYY#" colspan="2" class="PastDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_today_day_format=>'<tr>  <th  id="#MON#_#DD#_#YYYY#" colspan="2"  class="ToDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_future_day_format=>'<tr>   <th  id="#MON#_#DD#_#YYYY#" colspan="2" class="FutureDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_past_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="PastHour" >#TIME#</th><td class="PastDay" headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_today_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="TodayHour" >#TIME#</th><td class="ToDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_future_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="FutureHour" >#TIME#</th><td class="FutureDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>13
,p_theme_class_id=>1
);
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(1307135432528183878)
,p_cal_template_name=>'Calendar, Alternative 1'
,p_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13CalendarAlternative1Holder"> ',
' <tr>',
'   <td class="t13MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="t13CalendarAlternative1">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="t13DayTitle">#DD#</div><br />'
,p_day_open_format=>'<td class="t13Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="t13Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="t13WeekendDayTitle">#DD#</div><br />'
,p_weekend_open_format=>'<td valign="top" class="t13WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="t13NonDayTitle">#DD#</div><br />'
,p_nonday_open_format=>'<td class="t13NonDay" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13WeekCalendarAlternative1Holder">',
'<tr>',
'<td class="t13MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY#<br>#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t13WeekCalendarAlternative1">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="t13Day" valign="top">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="t13Today" valign="top">'
,p_weekly_weekend_open_format=>'<td valign="top" class="t13NonDay">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t13Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13DayCalendarAlternative1Holder"> <tr><td class="t13MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="2" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t13DayCalendarAlternative1">'
,p_daily_month_close_format=>'</table></td> </tr> </table>'
,p_daily_day_open_format=>'<td valign="top" class="t13Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="t13Today">'
,p_daily_time_open_format=>'<th scope="row" class="t13Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_agenda_format=>'<table class="ListCalendarAlternateHolder" summary="" role="presentation"><tr><td class="MonthTitle">#LTITLE#</td></tr><tr><td><table class="ListCalendarAlternate" summary="#CALENDAR_TITLE# #LTITLE#">#DAYS#</td></tr></table>'''
,p_agenda_past_day_format=>'<tr> <th id="#MON#_#DD#_#YYYY#" colspan="2" class="PastDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_today_day_format=>'<tr>  <th  id="#MON#_#DD#_#YYYY#" colspan="2"  class="ToDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_future_day_format=>'<tr>   <th  id="#MON#_#DD#_#YYYY#" colspan="2" class="FutureDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_past_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="PastHour" >#TIME#</th><td class="PastDay" headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_today_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="TodayHour" >#TIME#</th><td class="ToDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_future_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="FutureHour" >#TIME#</th><td class="FutureDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>13
,p_theme_class_id=>2
);
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(1307135621347183878)
,p_cal_template_name=>'Small Calendar'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13SmallCalenderHolder"> ',
' <tr>',
'   <td class="t13MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="t13SmallCalender">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="t13DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="t13Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="t13Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="t13WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="t13WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="t13NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="t13NonDay" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13SmallWeekCalendarHolder">',
'<tr>',
'<td class="t13MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY#<br />#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t13SmallWeekCalendar">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="t13Day" valign="top">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="t13Today" valign="top">'
,p_weekly_weekend_open_format=>'<td valign="top" class="t13NonDay">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t13Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="t13DayOfWeek">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="t13SmallDayCalendarHolder"> <tr> <td class="t13MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="2" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t13SmallDayCalendar">'
,p_daily_month_close_format=>'</table></td></tr></table>'
,p_daily_day_open_format=>'<td valign="top" class="t13Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="t13Today">'
,p_daily_time_open_format=>'<th scope="row" class="t13Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_agenda_format=>'<table class="ListCalendarSmallHolder" summary="" role="presentation"><tr><td class="MonthTitle">#LTITLE#</td></tr><tr><td><table class="ListCalendarSmall" summary="#CALENDAR_TITLE# #LTITLE#">#DAYS#</td></tr></table>'''
,p_agenda_past_day_format=>'<tr> <th id="#MON#_#DD#_#YYYY#" colspan="2" class="PastDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_today_day_format=>'<tr>  <th  id="#MON#_#DD#_#YYYY#" colspan="2"  class="ToDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_future_day_format=>'<tr>   <th  id="#MON#_#DD#_#YYYY#" colspan="2" class="FutureDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_past_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="PastHour" >#TIME#</th><td class="PastDay" headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_today_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="TodayHour" >#TIME#</th><td class="ToDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_future_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="FutureHour" >#TIME#</th><td class="FutureDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>13
,p_theme_class_id=>3
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(1307136022027183879)
,p_theme_id=>13
,p_theme_name=>'Classic Blue'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(1307115829749183859)
,p_error_template=>wwv_flow_api.id(1307115245182183858)
,p_printer_friendly_template=>wwv_flow_api.id(1307116730201183860)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(1307115030340183858)
,p_default_button_template=>wwv_flow_api.id(1307117624872183861)
,p_default_region_template=>wwv_flow_api.id(1307122946604183866)
,p_default_chart_template=>wwv_flow_api.id(1307120250701183863)
,p_default_form_template=>wwv_flow_api.id(1307120527432183864)
,p_default_reportr_template=>wwv_flow_api.id(1307122946604183866)
,p_default_tabform_template=>wwv_flow_api.id(1307122946604183866)
,p_default_wizard_template=>wwv_flow_api.id(1307124748275183867)
,p_default_menur_template=>wwv_flow_api.id(1307119031134183862)
,p_default_listr_template=>wwv_flow_api.id(1307122946604183866)
,p_default_report_template=>wwv_flow_api.id(1307132244516183875)
,p_default_label_template=>wwv_flow_api.id(1307134724697183878)
,p_default_menu_template=>wwv_flow_api.id(1307135051953183878)
,p_default_calendar_template=>wwv_flow_api.id(1307135248105183878)
,p_default_list_template=>wwv_flow_api.id(1307129829032183872)
,p_default_option_label=>wwv_flow_api.id(1307134724697183878)
,p_default_required_label=>wwv_flow_api.id(1307134946658183878)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(13),'#IMAGE_PREFIX#themes/theme_13/')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
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
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
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
 p_id=>wwv_flow_api.id(6271961903914379587)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(6272989625269398937)
,p_shortcut_name=>'OK_TO_GET_NEXT_PREV_PK_VALUE'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Are you sure you want to leave this page without saving?'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(2243174156476774620)
,p_name=>'apex'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_attribute_15=>'936116035867594372'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101:&SESSION.'
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:1'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Based on authentication scheme from gallery:Existing Login Page: Use Application Express Account Credentials'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(6233244955654729288)
,p_name=>'carl'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_attribute_15=>'4926186835045549040'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101:&SESSION.'
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:1'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Based on authentication scheme from gallery:Existing Login Page: Use HTML DB Account Credentials'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(6273084011868978720)
,p_name=>'CUSTOM SCHEME'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'custom_auth'
,p_attribute_05=>'N'
,p_attribute_15=>'4966025891259798472'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101:&SESSION.'
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:1'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'This custom authentication scheme is based on the username and password values stored in the DEMO_USERS table.'
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
 p_id=>wwv_flow_api.id(186736402974840064)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'DESKTOP'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>13
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&SESSION.'
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
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Page Zero'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page Zero'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085031'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6271898809990999005)
,p_plug_name=>'Application Breadcrumb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307119031134183862)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(6271895618863992166)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1307135051953183878)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'22,101,44,1'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6272307213920334358)
,p_plug_name=>'Charts'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>11
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(6300130415376714622)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'5,16,17'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Oracle APEX Theme Design Application'
,p_page_mode=>'NORMAL'
,p_step_title=>'Oracle APEX Theme Design Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This is the Home Page of the Sample Application.  It is intended to be a sales dashboard of sorts - displaying some metrics which are derived in real-time from the database.',
'<p>',
'The <strong>My Quota</strong> region is a new SVG chart type called  Dial Chart.  It is dynamically rendered based on a SQL Statement each time the page is viewed.  <strong>My Top Orders</strong> displays the top five orders for the currently signed '
||'in user, based on order total.  The <strong>Tasks</strong> region is an example of using a List to provide easy navigation to common tasks.'))
,p_last_upd_yyyymmddhh24miss=>'20140326085031'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1333951439953623609)
,p_plug_name=>'Theme Testing Application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'This is the theme testing application.  Use the tabs on top to navigate to the theme area you are testing.  Additional and remaining templates can be found under the "Theme" tab.'
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
 p_id=>wwv_flow_api.id(2243575568325027804)
,p_plug_name=>'Theme notes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Some themes may wish to not show the breadcrumb on the home page, because one entry ("Home") is not much of a breadcrumb.  Not showing the breadcrumb also tests the theme to ensure it is capable of displaying a page without a breadcrumb.  Unlike typi'
||'cal applications this theme testing application uses a page zero breadcrumb.'
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
 p_id=>wwv_flow_api.id(6310043228532750081)
,p_plug_name=>'Sample Application v2.0'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'Welcome to the HTML DB Sample Application v2.0.  This application is designed to highlight the features of HTML DB.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6310050002821761599)
,p_plug_name=>'Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(6272008325190400849)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129829032183872)
,p_plug_query_row_template=>1
,p_plug_footer=>'<p>Theme testers, make sure this list of actions looks good.</p>'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4877254658750696267)
,p_button_sequence=>10
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4877255846798696271)
,p_button_sequence=>10
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4877255662925696271)
,p_button_sequence=>20
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4877255267450696271)
,p_button_sequence=>40
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4877255464062696271)
,p_button_sequence=>50
,p_button_name=>'EDIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4877255071701696270)
,p_button_sequence=>30
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4877254846724696267)
,p_button_sequence=>20
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5193942881547689595)
,p_branch_action=>'f?p=&FLOW_ID.:1:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6273616007449059191)
,p_name=>'P1_QUOTA'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6273672301477076319)
,p_name=>'P1_TOTAL_SALES'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6306219623174217597)
,p_computation_sequence=>10
,p_computation_item=>'P1_TOTAL_SALES'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select to_char(sum(o.order_total), ''$999,999.99'')',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and u.user_name = :APP_USER'))
,p_compute_when_type=>'%null%'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6306218314170214991)
,p_computation_sequence=>20
,p_computation_item=>'P1_QUOTA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select to_char(quota, ''$999,999.99'') from demo_users where user_name = :APP_USER'
,p_compute_when_type=>'%null%'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Customers'
,p_page_mode=>'NORMAL'
,p_step_title=>'Customers'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'Help for this page'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4286878834554636367)
,p_plug_name=>'Customers'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121722709183865)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select customer_id, cust_last_name || '', '' || cust_first_name customer_name, CUST_STREET_ADDRESS1 || decode(CUST_STREET_ADDRESS2, null, null, '', '' || CUST_STREET_ADDRESS2) customer_address, cust_city, cust_state, cust_postal_code',
'from demo_customers',
'where upper(cust_last_name) like ''%'' || upper(:P2_SEARCH) || ''%''',
'or upper(cust_first_name) like ''%'' || upper(:P2_SEARCH) || ''%'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(4286878934201636367)
,p_name=>'Customers'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than 10,000 rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'SHAKEEB'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4286879140430636370)
,p_db_column_name=>'CUSTOMER_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Customer Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4286879248754636370)
,p_db_column_name=>'CUSTOMER_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4286879360373636370)
,p_db_column_name=>'CUSTOMER_ADDRESS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Customer Address'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4286879446033636371)
,p_db_column_name=>'CUST_CITY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Cust City'
,p_column_link=>'#'
,p_column_linktext=>'#CUST_CITY#'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4286879558152636371)
,p_db_column_name=>'CUST_STATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Cust State'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4286879661469636371)
,p_db_column_name=>'CUST_POSTAL_CODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Cust Postal Code'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4286879752794636602)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7973848'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'CUSTOMER_ID:CUSTOMER_NAME:CUSTOMER_ADDRESS:CUST_CITY:CUST_STATE:CUST_POSTAL_CODE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6308485206754646201)
,p_name=>'Top Customers'
,p_template=>wwv_flow_api.id(1307124143912183867)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'REGION_POSITION_03'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT  b.cust_last_name || '', '' || b.cust_first_name cust_name, ',
'   SUM(a.ORDER_TOTAL) order_total,',
'b.customer_id',
'FROM demo_orders a, DEMO_CUSTOMERS b',
'WHERE a.customer_id = b.customer_id',
'GROUP BY b.customer_id, b.cust_last_name || '', '' || b.cust_first_name ',
'ORDER BY NVL(SUM(a.ORDER_TOTAL),0) DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133728182183877)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6308485510513646244)
,p_query_column_id=>1
,p_column_alias=>'CUST_NAME'
,p_column_display_sequence=>2
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6308485627237646244)
,p_query_column_id=>2
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>1
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2232337671264486855)
,p_query_column_id=>3
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>3
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6314637805939806156)
,p_name=>'Customers'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select customer_id, cust_last_name || '', '' || cust_first_name customer_name, CUST_STREET_ADDRESS1 || decode(CUST_STREET_ADDRESS2, null, null, '', '' || CUST_STREET_ADDRESS2) customer_address, cust_city, cust_state, cust_postal_code',
'from demo_customers',
'where upper(cust_last_name) like ''%'' || upper(:P2_SEARCH) || ''%''',
'or upper(cust_first_name) like ''%'' || upper(:P2_SEARCH) || ''%'''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6314638023814806188)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::P7_CUSTOMER_ID,P7_BRANCH:#CUSTOMER_ID#,2'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="">'
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6314638109713806188)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Customer Name'
,p_column_hit_highlight=>'&P2_SEARCH.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6314638211327806188)
,p_query_column_id=>3
,p_column_alias=>'CUSTOMER_ADDRESS'
,p_column_display_sequence=>3
,p_column_heading=>'Address'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6314638317293806188)
,p_query_column_id=>4
,p_column_alias=>'CUST_CITY'
,p_column_display_sequence=>4
,p_column_heading=>'City'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6314638401548806188)
,p_query_column_id=>5
,p_column_alias=>'CUST_STATE'
,p_column_display_sequence=>5
,p_column_heading=>'State'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6314638510565806188)
,p_query_column_id=>6
,p_column_alias=>'CUST_POSTAL_CODE'
,p_column_display_sequence=>6
,p_column_heading=>'ZIP Code'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6271951217478341879)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6314637805939806156)
,p_button_name=>'P2_GO'
,p_button_static_id=>'P2_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'GO'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6271966213285387978)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6314637805939806156)
,p_button_name=>'P2_NEW'
,p_button_static_id=>'P2_NEW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'New Customer'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'NEW'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6271967718133389354)
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_BRANCH:2'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'NEW'
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 12-AUG-2004 14:08'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6271951322167341884)
,p_branch_action=>'f?p=&FLOW_ID.:2:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6314819108249999044)
,p_name=>'P2_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6314637805939806156)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Products'
,p_page_mode=>'NORMAL'
,p_step_title=>'Products'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4878617042590542867)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<p>This page shows various display controls used for this theme.</p>'
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
 p_id=>wwv_flow_api.id(5375670831548726620)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_ID" as "PRODUCT_ID",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."LIST_PRICE" as "LIST_PRICE" ,',
'        ''#IMAGE_PREFIX#apex/builder/menu-blank-128.gif'' the_image',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5375670910608726620)
,p_name=>'Products'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than 10,000 rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'NONE'
,p_fixed_header=>'NONE'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="">'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_link_column=>'PRODUCT_ID'
,p_icon_view_img_src_column=>'THE_IMAGE'
,p_icon_view_label_column=>'PRODUCT_NAME'
,p_icon_view_columns_per_row=>4
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table>',
'<tbody>'))
,p_detail_view_for_each_row=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr><th>#PRODUCT_NAME_LABEL#</th><td>#PRODUCT_NAME#</td></tr>',
'<tr><th>#PRODUCT_DESCRIPTION_LABEL#</th><td>#PRODUCT_DESCRIPTION#</td></tr>'))
,p_detail_view_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>'))
,p_owner=>'MARC'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5375671116953726693)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Stock #'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5375671230293726723)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Product'
,p_column_link=>'#'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5375671310854726723)
,p_db_column_name=>'PRODUCT_DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5375671419407726724)
,p_db_column_name=>'PRODUCT_AVAIL'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Availability'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5375671534730726724)
,p_db_column_name=>'CATEGORY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5375671632218726727)
,p_db_column_name=>'LIST_PRICE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4818961160214893126)
,p_db_column_name=>'THE_IMAGE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Image'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5375671723417727371)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1978157'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_view_mode=>'REPORT'
,p_report_columns=>'PRODUCT_ID:PRODUCT_NAME:PRODUCT_DESCRIPTION:PRODUCT_AVAIL:CATEGORY:LIST_PRICE:THE_IMAGE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6272291926986281361)
,p_name=>'Top 10 Products'
,p_template=>wwv_flow_api.id(1307124143912183867)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'REGION_POSITION_03'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT b.product_name, SUM(a.quantity * b.list_price)',
'    FROM DEMO_ORDER_ITEMS a, DEMO_PRODUCT_INFO b',
'    WHERE a.product_id = b.product_id',
'    GROUP BY b.product_name',
'    ORDER BY 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307131236809183874)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272292211892281369)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272292302665281369)
,p_query_column_id=>2
,p_column_alias=>'SUM(A.QUANTITY*B.LIST_PRICE)'
,p_column_display_sequence=>2
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4878623241729580455)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4878617042590542867)
,p_button_name=>'reset'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4878623442754580455)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4878617042590542867)
,p_button_name=>'Apply'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Apply'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2232925264325576390)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5375670831548726620)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272485817652182441)
,p_branch_action=>'f?p=&FLOW_ID.:6:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6272485601817182439)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4878617565231558821)
,p_name=>'P3_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4878617042590542867)
,p_prompt=>'Date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4878617756569558824)
,p_name=>'P3_COMMENTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4878617042590542867)
,p_prompt=>'Comments'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>16
,p_cMaxlength=>4000
,p_cHeight=>4
,p_cAttributes=>'nowrap'
,p_colspan=>2
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Orders'
,p_page_mode=>'NORMAL'
,p_step_title=>'Orders'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5612025697857877746)
,p_plug_name=>'Orders'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'Validate that this text looks good and has proper margins left, right and top.'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6272998215352430911)
,p_name=>'My Orders'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ',
'   "DEMO_CUSTOMERS"."CUST_FIRST_NAME" "CUST_FIRST_NAME", ',
'   "DEMO_CUSTOMERS"."CUST_LAST_NAME" "CUST_LAST_NAME", ',
'   "DEMO_ORDERS"."ORDER_ID" "ORDER_ID", ',
'   "DEMO_ORDERS"."ORDER_TOTAL" "ORDER_TOTAL", ',
'   "DEMO_ORDERS"."ORDER_TIMESTAMP" "ORDER_TIMESTAMP", ',
'   "DEMO_USERS"."USER_NAME" "USER_NAME"',
'FROM ',
'   "DEMO_CUSTOMERS", ',
'   "DEMO_ORDERS", ',
'   "DEMO_USERS"',
'WHERE "DEMO_USERS"."USER_ID" = "DEMO_ORDERS"."USER_ID"',
'   and "DEMO_CUSTOMERS"."CUSTOMER_ID" = "DEMO_ORDERS"."CUSTOMER_ID"',
'   and (("DEMO_USERS"."USER_NAME" = :APP_USER)',
'    or (:APP_USER =''ADMIN''))'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133239708183876)
,p_query_num_rows=>5
,p_query_options=>'GENERIC_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Total:'
,p_csv_output=>'N'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272998710982430919)
,p_query_column_id=>1
,p_column_alias=>'CUST_FIRST_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'First Name'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_CUSTOMERS'
,p_ref_column_name=>'CUST_FIRST_NAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272998925362430921)
,p_query_column_id=>2
,p_column_alias=>'CUST_LAST_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Last Name'
,p_disable_sort_column=>'N'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_CUSTOMERS'
,p_ref_column_name=>'CUST_LAST_NAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272999219618430922)
,p_query_column_id=>3
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:#ORDER_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" border="0" alt="Icon 2">'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDERS'
,p_ref_column_name=>'ORDER_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272999429803430922)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>6
,p_column_heading=>'Order Total'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDERS'
,p_ref_column_name=>'ORDER_TOTAL'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272999629026430922)
,p_query_column_id=>5
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>2
,p_column_heading=>'Order Date'
,p_disable_sort_column=>'N'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDERS'
,p_ref_column_name=>'ORDER_TIMESTAMP'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6273000704122430929)
,p_query_column_id=>6
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Sales Rep'
,p_disable_sort_column=>'N'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'USER_NAME'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(6273050016549667845)
,p_plug_name=>'Orders by Day'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>5
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_cal_id=>wwv_flow_api.id(6273050233212667849)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P4_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_item=>'P4_CALENDAR_DISPLAY'
,p_display_type=>'COL'
,p_date_column=>'ORDER_TIMESTAMP'
,p_display_column=>'ORD'
,p_start_of_week=>19721105
,p_start_time=>0
,p_end_time=>23
,p_time_format=>'24HOUR'
,p_week_start_day=>19721105
,p_week_end_day=>19721111
,p_custom_cal_days=>3
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_api.id(1307135248105183878)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6275313507721034588)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6272998215352430911)
,p_button_name=>'ENTER_NEW_ORDER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Enter New Order'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6273050614049667860)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6273050016549667845)
,p_button_name=>'Today'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Today'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6273050818515667861)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6273050016549667845)
,p_button_name=>'Next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6273050417384667855)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6273050016549667845)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6275313706083034615)
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6275313507721034588)
,p_branch_sequence=>5
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6273051026388667864)
,p_branch_action=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6273050321980667852)
,p_name=>'P4_CALENDAR_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6273050016549667845)
,p_item_default=>'return to_char(sysdate,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'P4_CALENDAR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 13-AUG-04'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6273050506623667859)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' wwv_flow_utilities.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(6273050417384667855)
,p_process_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6273050709452667861)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' wwv_flow_utilities.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(6273050614049667860)
,p_process_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6273050921640667861)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' wwv_flow_utilities.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(6273050818515667861)
,p_process_comment=>'Generated 13-AUG-04'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Cluster Bar'
,p_page_mode=>'NORMAL'
,p_step_title=>'Cluster Bar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6281213705590692471)
,p_plug_name=>'Sales by Month and Category'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
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
 p_id=>wwv_flow_api.id(4815304758402429690)
,p_default_chart_type=>'2DColumn'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart630923118905524620'
,p_chart_width=>500
,p_chart_height=>300
,p_chart_animation=>'N'
,p_display_attr=>':H:N::Y::Right::V::None:::N:::AquaLight:::S'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>'N:None:None:Full:None:None:Full:None:None:Full:30:15:5:N::::::'
,p_pie_attr=>'Outside:::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_color_scheme=>'6'
,p_x_axis_title=>'Sales (USD)'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_title=>'Month'
,p_y_axis_prefix=>'$'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
,p_legend_title_font=>'Tahoma:10:'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Arial:10:#000000'
,p_values_prefix=>'$'
,p_hints_font=>'Verdana:10:#000000'
,p_legend_font=>'Arial:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:#000000'
,p_y_axis_title_font=>'Tahoma:14:#000000'
,p_gauge_labels_font=>'Tahoma:10:'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815304866939429690)
,p_chart_id=>wwv_flow_api.id(4815304758402429690)
,p_series_seq=>10
,p_series_name=>'Mens'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, to_char(o.order_timestamp, ''MON RRRR'') label, sum (oi.quantity * oi.unit_price) value',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'and o.order_id = oi.order_id',
'and p.category = ''Mens''',
'group by to_char(o.order_timestamp, ''MON RRRR'')'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815304952739429691)
,p_chart_id=>wwv_flow_api.id(4815304758402429690)
,p_series_seq=>20
,p_series_name=>'Womens'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, to_char(o.order_timestamp, ''MON RRRR'') label, sum (oi.quantity * oi.unit_price) value',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'and o.order_id = oi.order_id',
'and p.category = ''Womens''',
'group by to_char(o.order_timestamp, ''MON RRRR'')'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815305063258429691)
,p_chart_id=>wwv_flow_api.id(4815304758402429690)
,p_series_seq=>30
,p_series_name=>'Accessories'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, to_char(o.order_timestamp, ''MON RRRR'') label, sum (oi.quantity * oi.unit_price) value',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'and o.order_id = oi.order_id',
'and p.category = ''Accessories''',
'group by to_char(o.order_timestamp, ''MON RRRR'')',
''))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Add/Modify Products'
,p_page_mode=>'NORMAL'
,p_step_title=>'Add/Modify Products'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(6272220733229008723)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171654'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6272283309755257472)
,p_plug_name=>'Add/Modify Products'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6304651320693095257)
,p_name=>'Product Image'
,p_template=>wwv_flow_api.id(1307123843367183866)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>2
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>'select image_id, image_name from demo_images where image_id = :P6_IMAGE_ID'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P6_PRODUCT_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_fixed_header=>'NONE'
,p_query_row_template=>1
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6304651521836095266)
,p_query_column_id=>1
,p_column_alias=>'IMAGE_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6304651616749095267)
,p_query_column_id=>2
,p_column_alias=>'IMAGE_NAME'
,p_column_display_sequence=>2
,p_column_html_expression=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div style="text-align:center;">',
'<img src="#OWNER#.custom_image_display?p_image_id=#IMAGE_ID#" />',
'</div>'))
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272549911400677212)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_api.id(6304651320693095257)
,p_button_name=>'DELETE_IMAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P6_IMAGE_ID'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272481413545157474)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6304651320693095257)
,p_button_name=>'CHANGE_IMAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Upload'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P6_IMAGE_ID'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272283606966257476)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272283803532257478)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272283513662257475)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272283707499257476)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272481606031157480)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6272481413545157474)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272542809837638926)
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_PRODUCT_ID:&P6_PRODUCT_ID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'if :REQUEST = ''CREATE'' or :REQUEST = ''DELETE_IMAGE'' then',
'  return true;',
'else',
'  return false;',
'end if;',
'end;'))
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 12-AUG-2004 20:23'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272283901498257481)
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>999
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272284018296257484)
,p_name=>'P6_PRODUCT_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Id'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272284121812257495)
,p_name=>'P6_PRODUCT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Name'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272284333718257498)
,p_name=>'P6_PRODUCT_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Description'
,p_source=>'PRODUCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272284405602257498)
,p_name=>'P6_CATEGORY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Category'
,p_source=>'CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES'
,p_lov=>'.'||wwv_flow_api.id(6272562608555771050)||'.'
,p_cSize=>31
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272284625295257498)
,p_name=>'P6_PRODUCT_AVAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Product Available'
,p_source=>'PRODUCT_AVAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'Y OR N'
,p_lov=>'.'||wwv_flow_api.id(6272215726517997388)||'.'
,p_cSize=>2
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272284704105257499)
,p_name=>'P6_LIST_PRICE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_use_cache_before_default=>'NO'
,p_prompt=>'List Price'
,p_source=>'LIST_PRICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6304792324539399202)
,p_name=>'P6_IMAGE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6272283309755257472)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source=>'IMAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6272284211113257498)
,p_validation_name=>'P6_PRODUCT_NAME not null'
,p_validation_sequence=>20
,p_validation=>'P6_PRODUCT_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Product Name must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6272284121812257495)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6272284513333257498)
,p_validation_name=>'P6_CATEGORY not null'
,p_validation_sequence=>40
,p_validation=>'P6_CATEGORY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Category must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6272284405602257498)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6308411624022922553)
,p_validation_name=>'P6_LIST_PRICE'
,p_validation_sequence=>50
,p_validation=>'P6_LIST_PRICE'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'List Price must be Numeric.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6272284704105257499)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272284810720257502)
,p_process_sequence=>1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_PRODUCT_INFO'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_PRODUCT_INFO'
,p_attribute_03=>'P6_PRODUCT_ID'
,p_attribute_04=>'PRODUCT_ID'
,p_attribute_14=>'N'
,p_process_error_message=>'Unable to fetch row.'
,p_process_when=>'DELETE_IMAGE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272565529811786616)
,p_process_sequence=>0
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Image'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- Update the image reference to 0, or "no image found"',
'update demo_product_info set image_id = 0 where product_id = :P6_PRODUCT_ID;',
'',
'-- Delete the image from demo_images, if the id != 0',
'if :P6_IMAGE_ID != 0 then',
'  delete from demo_images where image_id = :P6_IMAGE_ID;',
'end if;',
'',
'-- Set P6_IMAGE_ID = 0, or "no image found"',
':P6_IMAGE_ID := 0;'))
,p_process_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'if :REQUEST = ''DELETE'' or :REQUEST = ''DELETE_IMAGE'' then',
'  return true;',
'else',
'  return false;',
'end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272284930797257503)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DEMO_PRODUCT_INFO'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_PRODUCT_INFO'
,p_attribute_03=>'P6_PRODUCT_ID'
,p_attribute_04=>'PRODUCT_ID'
,p_attribute_09=>'P6_PRODUCT_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_process_error_message=>'Unable to process row of table DEMO_PRODUCT_INFO.'
,p_process_when=>'DELETE_IMAGE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'DML Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272285004836257504)
,p_process_sequence=>2
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'6'
,p_process_when_button_id=>wwv_flow_api.id(6272283707499257476)
,p_process_when=>'DELETE_IMAGE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Add/Modify Customers'
,p_page_mode=>'NORMAL'
,p_step_title=>'Add/Modify Customers'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150203091854'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6271961316963379580)
,p_plug_name=>'Add/Modify Customers'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6297028302644861617)
,p_name=>'Orders for this Customer'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select decode(u.user_id, (select user_id from demo_users where user_name = :APP_USER), ''&nbsp;<a href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::NO::P29_ORDER_ID:''',
' || o.order_id || ''"><img src="#IMAGE_PREFIX#ed-item.gif">Order #'' || o.order_id || ''</a>'', ''&nbsp;Order #'' || o.order_id) edit, p.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) ext_price, u.user_name, o.order_timestamp',
'from demo_orders o, demo_users u, demo_order_items oi, demo_product_info p',
'where customer_id = :P7_CUSTOMER_ID',
'and o.user_id = u.user_id(+)',
'and o.order_id = oi.order_id',
'and oi.product_id = p.product_id',
'order by o.order_id, o.order_timestamp, u.user_name'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P7_CUSTOMER_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133239708183876)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1'
,p_query_no_data_found=>'There are no orders for this customer.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Total for All Orders:'
,p_break_column_text_format=>'Order Total:'
,p_break_type_flag=>'REPEAT_HEADINGS_ON_BREAK_1'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6297032410309892258)
,p_query_column_id=>1
,p_column_alias=>'EDIT'
,p_column_display_sequence=>1
,p_column_heading=>'Order #'
,p_column_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6297042809710948869)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6297041606984943012)
,p_query_column_id=>3
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>6
,p_column_heading=>'Quantity'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6297041704896943012)
,p_query_column_id=>4
,p_column_alias=>'UNIT_PRICE'
,p_column_display_sequence=>5
,p_column_heading=>'Unit Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6297043726810963287)
,p_query_column_id=>5
,p_column_alias=>'EXT_PRICE'
,p_column_display_sequence=>7
,p_column_heading=>'Extended Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6297053132230031094)
,p_query_column_id=>6
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Sales Rep'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6297053213812031095)
,p_query_column_id=>7
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>2
,p_column_heading=>'Order Date'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6271961627715379582)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P7_CUSTOMER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6271961812535379584)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6271961506399379582)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P7_CUSTOMER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6271961712034379582)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P7_CUSTOMER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5637757608470011360)
,p_branch_action=>'f?p=&APP_ID.:&P7_BRANCH.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 02-FEB-2010 10:38 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271962132883379591)
,p_name=>'P7_CUSTOMER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer ID'
,p_source=>'CUSTOMER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271962226474379598)
,p_name=>'P7_CUST_FIRST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'First Name'
,p_source=>'CUST_FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>21
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s first name.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271962429640379602)
,p_name=>'P7_CUST_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name'
,p_source=>'CUST_LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>21
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s last name.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271962614845379603)
,p_name=>'P7_CUST_STREET_ADDRESS1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Street Address'
,p_source=>'CUST_STREET_ADDRESS1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s address.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271962704744379603)
,p_name=>'P7_CUST_STREET_ADDRESS2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Street Address 2'
,p_source=>'CUST_STREET_ADDRESS2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the second line of the customer''s street address, if it exists.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271962825090379603)
,p_name=>'P7_CUST_CITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'City'
,p_source=>'CUST_CITY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>31
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_display_when=>'P7_CUSTOMER_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s city.  This value is determined via a web service based on the zip code when the customer is created.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271962923707379603)
,p_name=>'P7_CUST_STATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'State'
,p_source=>'CUST_STATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATES'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select initcap(state_name) display_value, st return_value from   demo_states',
'order by 1'))
,p_cSize=>3
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_display_when=>'P7_CUSTOMER_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s state.  This value is determined via a web service based on the zip code when the customer is created.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271963020709379619)
,p_name=>'P7_CUST_POSTAL_CODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Postal Code'
,p_source=>'CUST_POSTAL_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>11
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s US ZIP code.  When creating a new customer, this value is passed to a web service to determine city & state.  If you do not know a valid US ZIP code, you can use "06037".'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271963106731379619)
,p_name=>'P7_PHONE_NUMBER1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Phone Number'
,p_source=>'PHONE_NUMBER1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>26
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s phone number.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271963230375379619)
,p_name=>'P7_PHONE_NUMBER2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Alt Phone Number'
,p_source=>'PHONE_NUMBER2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>26
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s alternate phone number.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271963328802379619)
,p_name=>'P7_CREDIT_LIMIT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Credit Limit'
,p_source=>'CREDIT_LIMIT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>9
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s credit limit.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271963403300379620)
,p_name=>'P7_CUST_EMAIL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'CUST_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>31
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s e-mail address.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6288906212335107247)
,p_name=>'P7_BRANCH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(6271961316963379580)
,p_item_default=>'2'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6271962304771379601)
,p_validation_name=>'P7_CUST_FIRST_NAME not null'
,p_validation_sequence=>2
,p_validation=>'P7_CUST_FIRST_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Cust First Name must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6271962226474379598)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6271962511166379602)
,p_validation_name=>'P7_CUST_LAST_NAME not null'
,p_validation_sequence=>3
,p_validation=>'P7_CUST_LAST_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Cust Last Name must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6271962429640379602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6273117015191244664)
,p_validation_name=>'P7_CREDIT_LIMIT'
,p_validation_sequence=>13
,p_validation=>'P7_CREDIT_LIMIT'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Credit Limit must be a Number.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6271963328802379619)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6273222027011326762)
,p_validation_name=>'P7_PHONE_NUMBER1'
,p_validation_sequence=>23
,p_validation=>'P7_PHONE_NUMBER1'
,p_validation2=>'^\(?[[:digit:]]{3}\)?[-. ][[:digit:]]{3}[-. ][[:digit:]]{4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Phone number format not recognized'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6271963106731379619)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6273224610520331449)
,p_validation_name=>'P7_PHONE_NUMBER2'
,p_validation_sequence=>33
,p_validation=>'P7_PHONE_NUMBER2'
,p_validation2=>'^\(?[[:digit:]]{3}\)?[-. ][[:digit:]]{3}[-. ][[:digit:]]{4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Phone number format not recognized'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6271963230375379619)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6280323419676420582)
,p_validation_name=>'P7_CUST_POSTAL_CODE'
,p_validation_sequence=>43
,p_validation=>'P7_CUST_POSTAL_CODE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter a US ZIP Code.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6271963020709379619)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6308414110620051134)
,p_validation_name=>'P7_CREDIT_LIMIT'
,p_validation_sequence=>53
,p_validation=>'P7_CREDIT_LIMIT'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Credit Limit must be Numeric.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6271963328802379619)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6250594532620830956)
,p_validation_name=>'Credit Limit <= 5000'
,p_validation_sequence=>63
,p_validation=>':P7_CREDIT_LIMIT <= 5000'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'A customer''s Credit Limit must be less than or equal to $5,000'
,p_always_execute=>'N'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6271963529692379623)
,p_process_sequence=>1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_CUSTOMERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_CUSTOMERS'
,p_attribute_03=>'P7_CUSTOMER_ID'
,p_attribute_04=>'CUSTOMER_ID'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6301447332323086692)
,p_process_sequence=>5
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_WEB_SERVICE'
,p_process_name=>'Get ZIP Code from Web Service'
,p_attribute_01=>wwv_flow_api.id(6301444325962082070)
,p_attribute_02=>'ITEMS'
,p_process_when_button_id=>wwv_flow_api.id(6271961506399379582)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6271963608882379625)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DEMO_CUSTOMERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_CUSTOMERS'
,p_attribute_03=>'P7_CUSTOMER_ID'
,p_attribute_04=>'CUSTOMER_ID'
,p_attribute_09=>'P11_CUSTOMER_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_process_error_message=>'Unable to process row of table DEMO_CUSTOMERS.'
,p_process_success_message=>'Customer Record Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6271963713557379625)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'7'
,p_process_when_button_id=>wwv_flow_api.id(6271961712034379582)
,p_process_when_type=>'NEVER'
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Manage Users'
,p_page_mode=>'NORMAL'
,p_step_title=>'Manage Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(6300109326795642268)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6272123325695637582)
,p_name=>'Manage Users'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'"USER_ID",',
'"USER_NAME",',
'"CREATED_ON",',
'"QUOTA", decode(password, null, ''Set Password'', ''Reset Password'') rp, ',
'products,',
'expires_on,',
'admin_user',
'from "#OWNER#"."DEMO_USERS"',
'where user_name != ''ADMIN'''))
,p_source_type=>'NATIVE_TABFORM'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133239708183876)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'Report returned no rows.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272124611627637624)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_disable_sort_column=>'N'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272123507052637591)
,p_query_column_id=>2
,p_column_alias=>'USER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'User Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_pk_col_source_type=>'T'
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'USER_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272123608908637593)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'USER_NAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272123809337637594)
,p_query_column_id=>4
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>4
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'CREATED_ON'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272123924114637594)
,p_query_column_id=>5
,p_column_alias=>'QUOTA'
,p_column_display_sequence=>5
,p_column_heading=>'Quota'
,p_column_format=>'FML999G999G999G999G990D00'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'QUOTA'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272132924170660677)
,p_query_column_id=>6
,p_column_alias=>'RP'
,p_column_display_sequence=>9
,p_column_heading=>'Reset PW'
,p_column_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_USER_ID,P9_USER_NAME:#USER_ID#,#USER_NAME#'
,p_column_linktext=>'#RP#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272213527408990173)
,p_query_column_id=>7
,p_column_alias=>'PRODUCTS'
,p_column_display_sequence=>6
,p_column_heading=>'Edit Products'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(6272215726517997388)
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'NO'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'PRODUCTS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6272964207454163312)
,p_query_column_id=>8
,p_column_alias=>'EXPIRES_ON'
,p_column_display_sequence=>8
,p_column_heading=>'Expires On'
,p_disable_sort_column=>'N'
,p_display_as=>'PICK_DATE_DD_MON_RR'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'EXPIRES_ON'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6300104805503634030)
,p_query_column_id=>9
,p_column_alias=>'ADMIN_USER'
,p_column_display_sequence=>7
,p_column_heading=>'Admin User'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(6272215726517997388)
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272124333072637600)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6272123325695637582)
,p_button_name=>'ADD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Add User'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272124123732637600)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6272123325695637582)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Save Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272124011738637600)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6272123325695637582)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272124218757637600)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6272123325695637582)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Remove Selected Users'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272124928295637625)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272124404506637621)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6272123325695637582)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_USERS'
,p_attribute_03=>'USER_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(6272124123732637600)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272124521571637622)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6272123325695637582)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'DEMO_USERS'
,p_attribute_03=>'USER_ID'
,p_process_error_message=>'Unable to process delete'
,p_process_when=>'MULTI_ROW_DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272124712991637625)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6272123325695637582)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_USERS'
,p_attribute_03=>'USER_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(6272124333072637600)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272124810621637625)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6272123325695637582)
,p_process_type=>'NATIVE_TABFORM_ADD_ROWS'
,p_process_name=>'AddRows'
,p_attribute_01=>'1'
,p_process_error_message=>'Unable to add rows'
,p_process_when_button_id=>wwv_flow_api.id(6272124333072637600)
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Reset Password'
,p_page_mode=>'NORMAL'
,p_step_title=>'Reset Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(6300109326795642268)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6272161612507756733)
,p_plug_name=>'Reset Password for &P9_USER_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P9_USER_NAME'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6273138924560398703)
,p_plug_name=>'Error!'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source=>'You cannot reset the password before you Apply Changes to a new user.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P9_USER_NAME'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6273125131131324975)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_api.id(6272161612507756733)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272233207303029629)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6272161612507756733)
,p_button_name=>'RESET_PW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Reset Password'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272233413416029642)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6272233207303029629)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6273125325133324984)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6273125131131324975)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272162315970757742)
,p_name=>'P9_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6272161612507756733)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272230622063024497)
,p_name=>'P9_NEW_PW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6272161612507756733)
,p_prompt=>'Enter New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272231427258025903)
,p_name=>'P9_NEW_PW_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6272161612507756733)
,p_prompt=>'Re-Enter New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272237132583036987)
,p_name=>'P9_USER_NAME'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(6272161612507756733)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6272244531807055643)
,p_validation_name=>'Passwords Must Match'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'if :P9_NEW_PW = :P9_NEW_PW_2 then',
'  return true;',
'else',
'  return false;',
'end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Your passwords must be the same.  Please re-enter.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6272230622063024497)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6273093209407025373)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Password'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'update demo_users set password = custom_hash(:P9_USER_NAME, :P9_NEW_PW)   ',
'  where user_name = upper(:P9_USER_NAME);'))
,p_process_success_message=>'Password for &P9_USER_NAME. Updated.'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Add Product Image'
,p_page_mode=>'NORMAL'
,p_step_title=>'Add Product Image'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6272495925628208294)
,p_plug_name=>'Select Product Image'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272600521742001908)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_api.id(6272495925628208294)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6272498210868213487)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6272495925628208294)
,p_button_name=>'UPLOAD_IMAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Upload Image'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272498416333213489)
,p_branch_action=>'f?p=&FLOW_ID.:6:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6272498210868213487)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6272600719788001911)
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6272600521742001908)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6272496833593210524)
,p_name=>'P10_IMAGE_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6272495925628208294)
,p_prompt=>'Product Image'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'WWV_FLOW_FILES'
,p_attribute_06=>'Y'
,p_attribute_08=>'inline'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6272577331635843978)
,p_validation_name=>'P10_IMAGE_URL'
,p_validation_sequence=>10
,p_validation=>'P10_IMAGE_URL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select an image to upload.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6272496833593210524)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6272501417232224801)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Product Image'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_image_id number;',
'begin',
'-- Get the Image ID from the sequence',
'select demo_images_seq.nextval into l_image_id from dual;',
'',
'-- Copy the image from the HTML DB wwv_flows_files table to our demo_images table',
'insert into demo_images (image_id, image_name, mime_type, image)',
'  select l_image_id, filename, mime_type, blob_content ',
'    from wwv_flow_files where name = :P10_IMAGE_URL;',
'',
'-- Update the product with the new Image ID',
'update demo_product_info set image_id = l_image_id where product_id = :P6_PRODUCT_ID;',
'',
'-- Remove the image from the HTML DB wwv_flows_files table',
'delete from wwv_flow_files where name = :P10_IMAGE_URL;',
'',
'-- Set the Image ID on page 6 to the newly uploaded image',
':P6_IMAGE_ID := l_image_id;',
'end;'))
,p_process_success_message=>'Image Uploaded'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Enter Order Header'
,p_page_mode=>'NORMAL'
,p_step_title=>'Enter Order Header'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6288868417341995110)
,p_plug_name=>'Select a Customer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6288871108469002056)
,p_plug_name=>'Order Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(6288869627038997975)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6297020013201826871)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6288868417341995110)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6288880824446035028)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6288868417341995110)
,p_button_name=>'NEW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create New Customer'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6288878027086026400)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6288868417341995110)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6288878207830026407)
,p_branch_action=>'f?p=&FLOW_ID.:12:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6288878027086026400)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6288881021836035031)
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_BRANCH:12&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6288880824446035028)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6297020228206826874)
,p_branch_action=>'f?p=&FLOW_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6297020013201826871)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6288876107692020729)
,p_name=>'P11_CUSTOMER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6288868417341995110)
,p_prompt=>'Customer'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select cust_last_name || '', '' || cust_first_name d, customer_id r from demo_customers',
'order by cust_last_name'))
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Choose a customer using the popup selector, or to create a new customer, click <b>Create New Customer</b>'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6288885303930048084)
,p_validation_name=>'P11_CUSTOMER_ID'
,p_validation_sequence=>10
,p_validation=>'P11_CUSTOMER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a customer.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(6288878027086026400)
,p_associated_item=>wwv_flow_api.id(6288876107692020729)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6296796533805044500)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create or Truncate ORDER Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htmldb_collection.create_or_truncate_collection',
'  (p_collection_name => ''ORDER'');'))
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Enter New Order'
,p_page_mode=>'NORMAL'
,p_step_title=>'Enter New Order'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'  function productPopup (productID) {',
'    var url;',
'  url = ''f?p=&APP_ID.:20:::::P20_PRODUCT_ID:'' + productID;',
'  w = open(url,"winLov","Scrollbars=1,resizable=1,width=700,height=400");',
'  if (w.opener == null)',
'  w.opener = self;',
'  w.focus();',
'  }',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6296772332232930497)
,p_plug_name=>'Order Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(6288869627038997975)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6296783212371990968)
,p_name=>'Product Catalog'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_id, ''<a href="javascript:productPopup('''''' || product_id || '''''');">'' || htf.escape_sc(product_name) || ''</a>'' product_name, list_price, ''Add to Order'' add_to_order',
'from demo_product_info',
'where product_avail = ''Y'''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133239708183876)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296783422584990981)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Product Id'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296970007933569823)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Product Name'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296969527195565998)
,p_query_column_id=>3
,p_column_alias=>'LIST_PRICE'
,p_column_display_sequence=>3
,p_column_heading=>'List Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296787216535008978)
,p_query_column_id=>4
,p_column_alias=>'ADD_TO_ORDER'
,p_column_display_sequence=>4
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.:ADD:&DEBUG.::P12_PRODUCT_ID:#PRODUCT_ID#'
,p_column_linktext=>'#ADD_TO_ORDER#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6296788001337016127)
,p_name=>'Order for &P12_CUSTOMER_NAME.'
,p_template=>wwv_flow_api.id(1307120527432183864)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>2
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select c001, c002, to_number(c003), count(c002), sum(c003),  ''Remove'' remove',
'from htmldb_collections',
'where collection_name = ''ORDER''',
'group by c001, c002, c003'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133239708183876)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'There are no items associated with this Order.  Click on <strong>Add to Order</strong> in the Product Catalog region to add items to this order.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Order Total:'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296813517239143799)
,p_query_column_id=>1
,p_column_alias=>'C001'
,p_column_display_sequence=>6
,p_column_heading=>'C001'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296788532659016142)
,p_query_column_id=>2
,p_column_alias=>'C002'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296972133213577125)
,p_query_column_id=>3
,p_column_alias=>'TO_NUMBER(C003)'
,p_column_display_sequence=>2
,p_column_heading=>'Unit Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296805130567109703)
,p_query_column_id=>4
,p_column_alias=>'COUNT(C002)'
,p_column_display_sequence=>3
,p_column_heading=>'Qty'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296804223294107652)
,p_query_column_id=>5
,p_column_alias=>'SUM(C003)'
,p_column_display_sequence=>4
,p_column_heading=>'Extended Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296810131521128969)
,p_query_column_id=>6
,p_column_alias=>'REMOVE'
,p_column_display_sequence=>5
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.:REMOVE:&DEBUG.::P12_PRODUCT_ID:#C001#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#delete.gif" border="0" title="Remove from order" alt="Icon 1">'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6296958119567488004)
,p_plug_name=>'Customer Info'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'for x in (select * from demo_customers where customer_id = :P11_CUSTOMER_ID)',
'loop',
'htp.p(x.cust_first_name || '' '' || x.cust_last_name || ''<br />'');',
'htp.p(x.cust_street_address1 || ''<br />'');',
'if x.cust_street_address2 is not null then',
'  htp.p(x.cust_street_address2 || ''<br />'');',
'end if;',
'htp.p(x.cust_city || '', '' || x.cust_state || ''  '' || x.cust_postal_code);',
'',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6296955711125476200)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6296788001337016127)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6296847029031298548)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6296788001337016127)
,p_button_name=>'PLACE_ORDER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Place Order'
,p_button_position=>'BOTTOM'
,p_button_condition=>'select 1 from htmldb_collections where collection_name = ''ORDER'''
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6296847214574298559)
,p_branch_action=>'f?p=&FLOW_ID.:14:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6296847029031298548)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6296955930863476206)
,p_branch_action=>'f?p=&FLOW_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6296955711125476200)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6296776122582956028)
,p_name=>'P12_CUSTOMER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6296772332232930497)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6296840223313259092)
,p_name=>'P12_PRODUCT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6296783212371990968)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6296778614748963239)
,p_computation_sequence=>10
,p_computation_item=>'P12_CUSTOMER_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select cust_first_name || '' '' || cust_last_name from demo_customers where customer_id = :P11_CUSTOMER_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6296981112660637469)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Place Order'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_order_id number;',
'  l_user_id number;',
'begin',
'',
'-- Fetch values that need to be inserted into the Order Header',
'select user_id into l_user_id from demo_users where user_name = :APP_USER;',
'select demo_ord_seq.nextval into l_order_id from dual;',
'',
'-- Insert a row into the Order Header table',
'insert into demo_orders values(l_order_id, :P11_CUSTOMER_ID, null, sysdate, l_user_id);',
'commit;',
'-- Loop through the ORDER collection and insert rows into the Order Line Item table',
'for x in (select c001, c003, sum(c004) c004 from htmldb_collections ',
'  where collection_name = ''ORDER'' group by c001, c003)',
'loop',
'  insert into demo_order_items values ',
'    (null, l_order_id, to_number(x.c001), to_number(x.c003),to_number(x.c004));',
'end loop;',
'',
'-- Truncate the collection after the order has been placed',
'htmldb_collection.truncate_collection(p_collection_name => ''ORDER'');',
'',
'-- Set the item P14_ORDER_ID to the order which was just placed',
':P14_ORDER_ID := l_order_id;',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(6296847029031298548)
,p_process_success_message=>'Order Created'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6296797730819053080)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Product to the ORDER Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for x in (select * from demo_product_info where product_id = :P12_PRODUCT_ID)',
'loop',
'  htmldb_collection.add_member(p_collection_name => ''ORDER'', ',
'    p_c001 => x.product_id, ',
'    p_c002 => x.product_name,',
'    p_c003 => x.list_price,',
'    p_c004 => 1);',
'end loop;'))
,p_process_when=>'ADD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Item Added to Order'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6296817219232163271)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Product from the ORDER Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for x in ',
'  (select seq_id, c001 from htmldb_collections ',
'    where collection_name = ''ORDER'' and c001 = :P12_PRODUCT_ID)',
'loop',
'htmldb_collection.delete_member(p_collection_name => ''ORDER'', p_seq => x.seq_id);',
'htp.p(''removed an item'');',
'end loop;'))
,p_process_when=>'REMOVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Item Removed from Order'
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'View/Modify Orders'
,p_page_mode=>'NORMAL'
,p_step_title=>'View/Modify Orders'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Place Order'
,p_page_mode=>'NORMAL'
,p_step_title=>'Place Order'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6309123717077169535)
,p_plug_name=>'Order Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'for x in (select c.cust_first_name, c.cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code from demo_customers c, demo_orders o',
'where c.customer_id = o.customer_id and o.order_id = :P14_ORDER_ID)',
'loop',
'  htp.p(''<span style="font-size:16px;font-weight:bold;">ORDER #'' || v(''P14_ORDER_ID'') || '' SUMMARY</span><br />'');',
'  htp.p(x.cust_first_name || '' '' || x.cust_last_name || ''<br />'');',
'  htp.p(x.cust_street_address1 || ''<br />'');',
'  if x.cust_street_address2 is not null then',
'      htp.p(x.cust_street_address2 || ''<br />'');',
'  end if;',
'  htp.p(x.cust_city || '', '' || x.cust_state || ''  '' || x.cust_postal_code || ''<br /><br />'');',
'end loop;',
'end;',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6309139230854268106)
,p_name=>'Order Lines'
,p_template=>wwv_flow_api.id(5970609085182560899)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.product_name, oi.unit_price, oi.quantity, (oi.unit_price * oi.quantity) exteneded_price   ',
'from demo_order_items oi, demo_product_info p',
'where oi.product_id = p.product_id and oi.order_id = :P14_ORDER_ID'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307131236809183874)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6309141312069281684)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6309139723115268128)
,p_query_column_id=>2
,p_column_alias=>'UNIT_PRICE'
,p_column_display_sequence=>2
,p_column_heading=>'Unit Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6309139813727268128)
,p_query_column_id=>3
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>3
,p_column_heading=>'Quantity'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6309141432233281685)
,p_query_column_id=>4
,p_column_alias=>'EXTENEDED_PRICE'
,p_column_display_sequence=>4
,p_column_heading=>'Exteneded Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6309221515897434193)
,p_plug_name=>'Order Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(6288869627038997975)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6309118527550153649)
,p_name=>'P14_ORDER_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'About this Application'
,p_page_mode=>'NORMAL'
,p_step_title=>'About this Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6308522111709804948)
,p_plug_name=>'Hierarchy'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'6308522032398804946'
,p_plug_source_type=>'NATIVE_TREE'
,p_plug_query_row_template=>1
,p_attribute_01=>wwv_flow_api.id(6308522032398804946)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6308540904572863186)
,p_plug_name=>'About this Application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Welcome to the Oracle HTML DB Sample Application v2.0!',
'<p>',
'This application is designed to illustrate some of the common features of Oracle HTML DB.  You may also find the howto documents useful; reference <a href="http://htmldb.oracle.com/howtos">Oracle Technology Network</a>.<ul>',
'<li><a href="f?p=&APP_ID.:1:&SESSION.">Dial Chart</a></li>',
'<li><a href="f?p=&APP_ID.:5:&SESSION.">Cluster Bar Chart</a></li>',
'<li><a href="f?p=&APP_ID.:17:&SESSION.">Stacked Bar Chart</a></li>',
'<li><a href="f?p=&APP_ID.:4:&SESSION.">Calendar Report</a></li>',
'<li><a href="f?p=&APP_ID.:4:&SESSION.">Master/Detail Form</a> (Edit any order to view)</li>',
'<li><a href="f?p=&APP_ID.:4:&SESSION.">Enhanced Tabluar Form</a> (Edit any order to view)</li>',
'<li><a href="f?p=&APP_ID.:7:&SESSION.::NO:7:P7_BRANCH:2.">Web Services Integration</a> (Add a new customer - City & State are looked up from a Web Service based on ZIP Code)</li>',
'<li>Themes</li>',
'</ul>',
'<p>Have a question or comment on the Sample Application, or about HTML DB in general?  Feel free to discuss it in the <a href="http://htmldb.oracle.com/forums">HTML DB Forum</a> on OTN.',
'<p>',
'For more information on the Sample Application, please see "Running a Demonstration Application" in the <a href="javascript:popupURL(''wwv_flow_help.show_help?p_lang=en-us&p_session=&SESSION.'');">online help</a> or in the "Oracle HTML DB User''s Guide.'
||'"'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6308522307318804964)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6308522111709804948)
,p_button_name=>'COLLAPSE_ALL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Collapse All'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:CONTRACT_ALL:&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6308522414998804968)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6308522111709804948)
,p_button_name=>'EXPAND_ALL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Expand All'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:EXPAND_ALL:&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6308522504928804969)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6308522111709804948)
,p_button_name=>'RESET_TREE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Reset Tree'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:RESET_TREE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6308522712138804974)
,p_branch_action=>'f?p=&APP_ID.:15:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6308522601542804972)
,p_name=>'P15_TREE_ROOT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6308522111709804948)
,p_prompt=>'Tree Root'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Pie Chart'
,p_page_mode=>'NORMAL'
,p_step_title=>'Pie Chart'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6300180419849838932)
,p_plug_name=>'Total Sales by Category'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(4815305361247429692)
,p_default_chart_type=>'3DPie'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart630923721750524622'
,p_chart_width=>600
,p_chart_height=>400
,p_chart_animation=>'N'
,p_display_attr=>':H::V:::Right::V::None:::N:::Default'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>'N:::::::::::::N::::'
,p_pie_attr=>'Outside:::'
,p_map_attr=>'::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_color_scheme=>'1'
,p_x_axis_label_font=>'Tahoma:10:'
,p_y_axis_label_font=>'Tahoma:10:'
,p_legend_title_font=>'Tahoma:10:'
, p_names_font=> null
, p_names_rotation=> null
,p_hints_font=>'Verdana:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:'
,p_y_axis_title_font=>'Tahoma:14:'
,p_gauge_labels_font=>'Tahoma:10:'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815305442406429692)
,p_chart_id=>wwv_flow_api.id(4815305361247429692)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, p.category || '' - '' || to_char(sum(o.order_total),''$999,999.99'') label, sum(o.order_total)',
'from demo_orders o, demo_order_items oi, demo_product_info p',
'where o.order_id = oi.order_id',
'and oi.product_id = p.product_id',
'group by category order by 3 desc'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Stacked Bar'
,p_page_mode=>'NORMAL'
,p_step_title=>'Stacked Bar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6307225401328034445)
,p_plug_name=>'Percentage of Sales by Category over Months'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
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
 p_id=>wwv_flow_api.id(4815305666474429693)
,p_default_chart_type=>'2DSTACKED_PCT'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart630924026977524623'
,p_chart_width=>600
,p_chart_height=>400
,p_chart_animation=>'N'
,p_display_attr=>':H:N::Y::Right::V:::::N:::Default:::S'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>'N:None:None:Full:None:None:Full:None:None:Full:30:15:5:N::::::'
,p_pie_attr=>'Outside:::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_color_scheme=>'1'
,p_x_axis_title=>'% of Monthly Sales'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_title=>'Month'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
,p_legend_title_font=>'Tahoma:10:'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Arial:10:#000000'
,p_hints_font=>'Verdana:10:#000000'
,p_legend_font=>'Arial:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:#000000'
,p_y_axis_title_font=>'Tahoma:14:#000000'
,p_gauge_labels_font=>'Tahoma:10:'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815305743105429693)
,p_chart_id=>wwv_flow_api.id(4815305666474429693)
,p_series_seq=>10
,p_series_name=>'Mens'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, to_char(o.order_timestamp, ''MON RRRR'') label, sum (oi.quantity * oi.unit_price) value',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'and o.order_id = oi.order_id',
'and p.category = ''Mens''',
'group by to_char(o.order_timestamp, ''MON RRRR'')'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815305861173429693)
,p_chart_id=>wwv_flow_api.id(4815305666474429693)
,p_series_seq=>20
,p_series_name=>'Womens'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, to_char(o.order_timestamp, ''MON RRRR'') label, sum (oi.quantity * oi.unit_price) value',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'and o.order_id = oi.order_id',
'and p.category = ''Womens''',
'group by to_char(o.order_timestamp, ''MON RRRR'')'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815305962324429693)
,p_chart_id=>wwv_flow_api.id(4815305666474429693)
,p_series_seq=>30
,p_series_name=>'Accessories'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, to_char(o.order_timestamp, ''MON RRRR'') label, sum (oi.quantity * oi.unit_price) value',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'and o.order_id = oi.order_id',
'and p.category = ''Accessories''',
'group by to_char(o.order_timestamp, ''MON RRRR'')'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
end;
/
prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Region Display Selector'
,p_page_mode=>'NORMAL'
,p_step_title=>'Region Display Selector'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150108083958'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4813622465417678674)
,p_plug_name=>'Region 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4813622660112678674)
,p_plug_name=>'Region 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4813622862646678675)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4813623069822678675)
,p_plug_name=>'Report 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4813623266968678676)
,p_plug_name=>'Region 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4813624470865687825)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'tabtest'
,p_page_mode=>'NORMAL'
,p_step_title=>'tabtest'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307117023563183860)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5375667635145136440)
,p_plug_name=>'aaa'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
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
 p_id=>wwv_flow_api.id(5375667828404136484)
,p_plug_name=>'bbb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(5375668006213136490)
,p_plug_name=>'ccc'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
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
 p_id=>wwv_flow_api.id(5375668224323136491)
,p_plug_name=>'ddd'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(5375668422315136493)
,p_plug_name=>'eee'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Product Info'
,p_page_mode=>'NORMAL'
,p_step_title=>'Product Info'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6296877726287874969)
,p_name=>'Product Info'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>2
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>'select * from demo_product_info where product_id = :P20_PRODUCT_ID'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307130424219183873)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296877916692874994)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Product Id'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296878029222874994)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296878105733874994)
,p_query_column_id=>3
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>3
,p_column_heading=>'Description'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296878204433874994)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>4
,p_column_heading=>'Category'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296878324755874994)
,p_query_column_id=>5
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>5
,p_column_heading=>'Avail'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296878401503874994)
,p_query_column_id=>6
,p_column_alias=>'LIST_PRICE'
,p_column_display_sequence=>6
,p_column_heading=>'List Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296878523132874995)
,p_query_column_id=>7
,p_column_alias=>'IMAGE_URL'
,p_column_display_sequence=>7
,p_column_heading=>'Image Url'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6307371003274375660)
,p_name=>'Product Image'
,p_template=>wwv_flow_api.id(5970609085182560899)
,p_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select i.image_id, i.image_name ',
'from demo_images i, demo_product_info p',
'where p.image_id = i.image_id and p.product_id = :P20_PRODUCT_ID'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_fixed_header=>'NONE'
,p_query_row_template=>1
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6307371226833375675)
,p_query_column_id=>1
,p_column_alias=>'IMAGE_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6307371314568375675)
,p_query_column_id=>2
,p_column_alias=>'IMAGE_NAME'
,p_column_display_sequence=>2
,p_column_html_expression=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div style="text-align:center;">',
'<img src="#OWNER#.custom_image_display?p_image_id=#IMAGE_ID#" />',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6296891821926958846)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6296877726287874969)
,p_button_name=>'CLOSE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Close this Window'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:window.close();'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6296879333560877044)
,p_name=>'P20_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6296877726287874969)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
end;
/
prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Report'
,p_page_mode=>'NORMAL'
,p_step_title=>'Report'
,p_step_sub_title=>'Report'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5614303723961122369)
,p_name=>'Report'
,p_template=>wwv_flow_api.id(1307123528493183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_CUSTOMERS"."CUST_FIRST_NAME" as "CUST_FIRST_NAME",',
'	 "DEMO_CUSTOMERS"."CUST_LAST_NAME" as "CUST_LAST_NAME",',
'	 "DEMO_CUSTOMERS"."CUST_CITY" as "CUST_CITY",',
'	 "DEMO_ORDERS"."ORDER_TOTAL" as "ORDER_TOTAL",',
'	 "DEMO_ORDERS"."ORDER_TIMESTAMP" as "ORDER_TIMESTAMP",',
'	 "DEMO_CUSTOMERS"."CUST_STATE" as "CUST_STATE",',
'	 "DEMO_CUSTOMERS"."CUST_POSTAL_CODE" as "CUST_POSTAL_CODE" ',
' from	 "DEMO_CUSTOMERS" "DEMO_CUSTOMERS",',
'	 "DEMO_ORDERS" "DEMO_ORDERS" ',
' where   "DEMO_CUSTOMERS"."CUSTOMER_ID"="DEMO_ORDERS"."CUSTOMER_ID"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image_attr=>'width="13" height="12" alt=""'
,p_query_desc_image_attr=>'width="13" height="12" alt=""'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5614304035150122378)
,p_query_column_id=>1
,p_column_alias=>'CUST_FIRST_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Cust First Name'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5614304139608122379)
,p_query_column_id=>2
,p_column_alias=>'CUST_LAST_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Cust Last Name'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5614304243906122379)
,p_query_column_id=>3
,p_column_alias=>'CUST_CITY'
,p_column_display_sequence=>3
,p_column_heading=>'Cust City'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5614304320784122379)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>4
,p_column_heading=>'Order Total'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5614304428259122379)
,p_query_column_id=>5
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>5
,p_column_heading=>'Order Timestamp'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5614304548413122379)
,p_query_column_id=>6
,p_column_alias=>'CUST_STATE'
,p_column_display_sequence=>6
,p_column_heading=>'Cust State'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5614304640597122379)
,p_query_column_id=>7
,p_column_alias=>'CUST_POSTAL_CODE'
,p_column_display_sequence=>7
,p_column_heading=>'Cust Postal Code'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
end;
/
prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Calendar'
,p_alias=>'CALANDER'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(5831571695398052968)
,p_plug_name=>'Orders by Day'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(5831571905456052976)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P22_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_type=>'NONE'
,p_date_column=>'ORDER_TIMESTAMP'
,p_start_of_week=>19721105
,p_day_link=>'#'
,p_item_link=>'#'
,p_start_time=>0
,p_end_time=>23
,p_time_format=>'24HOUR'
,p_week_start_day=>19721105
,p_week_end_day=>19721111
,p_custom_cal_days=>3
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_api.id(1307135621347183878)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5831578098168403855)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5831584493236421387)
,p_plug_name=>'Calendar List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5831585714360427538)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307127750529183870)
,p_plug_query_row_template=>1
);
end;
/
prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Calendar 2'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054719'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(5434019810055356249)
,p_plug_name=>'Calendar'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(5434020004440356251)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P23_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_item=>'P23_CALENDAR_DISPLAY'
,p_display_type=>'COL'
,p_date_column=>'ORDER_TIMESTAMP'
,p_display_column=>'ORD'
,p_start_of_week=>19721105
,p_day_link=>'#'
,p_start_time=>0
,p_end_time=>23
,p_time_format=>'24HOUR'
,p_week_start_day=>19721105
,p_week_end_day=>19721111
,p_date_type_column=>'P23_CALENDAR_TYPE'
,p_end_date_item=>'P23_CALENDAR_END_DATE'
,p_custom_cal_days=>3
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_api.id(1307135248105183878)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5831580698853410456)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5831588502848443130)
,p_plug_name=>'Calendar List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5831585714360427538)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307127750529183870)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4804539049282102621)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_button_name=>'P23_REFRESH'
,p_button_static_id=>'P23_REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Refresh'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'Go'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5434020918698356253)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P23_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5434021297438356255)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P23_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5434021710809356256)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P23_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5434022115316356257)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5434022517113356257)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5434022915137356258)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5434023320585356259)
,p_branch_action=>'f?p=&FLOW_ID.:23:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5434020313838356252)
,p_name=>'P23_CALENDAR_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Start Date'
,p_format_mask=>'YYYYMMDD'
,p_source=>'P23_CALENDAR_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>2000
,p_cHeight=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>'Generated by Calendar wizard on 02-DEC-09'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5434020517629356252)
,p_name=>'P23_CALENDAR_END_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp+7,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'End Date'
,p_format_mask=>'YYYYMMDD'
,p_source=>'P23_CALENDAR_END_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>2000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>'Generated by Calendar wizard on 02-DEC-09'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5434020701200356253)
,p_name=>'P23_CALENDAR_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5434019810055356249)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P23_CALENDAR_DISPLAY'
,p_source=>'P23_CALENDAR_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5434021095809356254)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5434020918698356253)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5434021500255356255)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5434021297438356255)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5434021919071356256)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5434021710809356256)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5434022310844356257)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5434022115316356257)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5434022711958356258)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5434022517113356257)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5434023122110356259)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5434022915137356258)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4804539666251107583)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Custom'
,p_process_sql_clob=>' apex_util.custom_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(4804539049282102621)
,p_process_comment=>'Generated 02-DEC-09'
);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Calendar 3'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054719'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(5612960295980286797)
,p_plug_name=>'Calendar'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(5612960495125286806)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P24_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_item=>'P24_CALENDAR_DISPLAY'
,p_display_type=>'COL'
,p_date_column=>'ORDER_TIMESTAMP'
,p_display_column=>'ORD'
,p_start_of_week=>19721105
,p_start_time=>0
,p_end_time=>23
,p_time_format=>'24HOUR'
,p_week_start_day=>19721105
,p_week_end_day=>19721111
,p_date_type_column=>'P24_CALENDAR_TYPE'
,p_end_date_item=>'P24_CALENDAR_END_DATE'
,p_custom_cal_days=>3
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_api.id(1307135432528183878)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5831583222916415957)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5831589107004444304)
,p_plug_name=>'Calendar List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5831585714360427538)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307127750529183870)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4804573558941152756)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_button_name=>'P24_REFRESH'
,p_button_static_id=>'P24_REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Refresh'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'Go'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5612961423712286820)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P24_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5612961797922286827)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P24_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5612962205739286828)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P24_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5612962600932286831)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5612963020716286832)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5612963406940286833)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5612963799717286835)
,p_branch_action=>'f?p=&FLOW_ID.:24:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5612960792710286809)
,p_name=>'P24_CALENDAR_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Start Date'
,p_format_mask=>'YYYYMMDD'
,p_source=>'P24_CALENDAR_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>2000
,p_cHeight=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>'Generated by Calendar wizard on 22-DEC-09'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5612961020024286816)
,p_name=>'P24_CALENDAR_END_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp+7,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'End Date'
,p_format_mask=>'YYYYMMDD'
,p_source=>'P24_CALENDAR_END_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>2000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>'Generated by Calendar wizard on 22-DEC-09'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5612961196860286817)
,p_name=>'P24_CALENDAR_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5612960295980286797)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P24_CALENDAR_DISPLAY'
,p_source=>'P24_CALENDAR_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5612961611718286822)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5612961423712286820)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5612962008937286827)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5612961797922286827)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5612962405474286831)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5612962205739286828)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5612962797232286832)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5612962600932286831)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5612963193393286833)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5612963020716286832)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5612963593841286834)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5612963406940286833)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4804573946951158685)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Custom'
,p_process_sql_clob=>' apex_util.custom_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(4804573558941152756)
,p_process_comment=>'Generated 22-DEC-09'
);
end;
/
prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Testing Page'
,p_page_mode=>'NORMAL'
,p_step_title=>'Testing Page'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3541125009244366244)
,p_plug_name=>'First'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:32%; float:left; margin-right: 1%; clear: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3541125210101366247)
,p_plug_name=>'Second'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:32%; float:left; margin-right: 1%; clear: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3541125435884366248)
,p_plug_name=>'Third'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:33%; float:left; clear: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3541125610756366248)
,p_plug_name=>'Fourth'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Three Col Page'
,p_page_mode=>'NORMAL'
,p_step_title=>'Three Col Page'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2233288471464423355)
,p_plug_name=>'One'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 33%;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
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
 p_id=>wwv_flow_api.id(2233288657937423358)
,p_plug_name=>'Two'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 33%; clear: none; margin-left: 1%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(2233288868014423359)
,p_plug_name=>'Three'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 32%; clear: none; margin-left: 1%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
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
 p_id=>wwv_flow_api.id(2233289084831423360)
,p_plug_name=>'Span Three'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Calendar 1'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar 1'
,p_step_sub_title=>'Calendar 1'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(3503455217892573349)
,p_plug_name=>'Calendar 1'
,p_plug_source=>'select * from "WWV_MIG_RPT_DATA"'
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(3503455727178573389)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P27_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_item=>'P27_CALENDAR_DISPLAY'
,p_display_type=>'COL'
,p_easy_sql_table=>'WWV_MIG_RPT_DATA'
,p_date_column=>'CREATED_ON'
,p_display_column=>'APPLICABLE'
,p_start_of_week=>19721105
,p_start_time=>0
,p_end_time=>23
,p_time_format=>'24HOUR'
,p_week_start_day=>19721105
,p_week_end_day=>19721111
,p_date_type_column=>'P27_CALENDAR_TYPE'
,p_end_date_item=>'P27_CALENDAR_END_DATE'
,p_custom_cal_days=>3
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_api.id(1307135248105183878)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503456522685573399)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P27_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503457114689573413)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P27_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503457716967573413)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P27_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503458320805573415)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503458909932573416)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503459507920573417)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503456924324573408)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503456522685573399)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503457519375573413)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503457114689573413)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503458123382573414)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503457716967573413)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503458729296573416)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503458320805573415)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503459319389573417)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503458909932573416)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503459930773573418)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503459507920573417)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3503455908393573390)
,p_name=>'P27_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P27_CALENDAR_DISPLAY'
,p_source=>'P27_CALENDAR_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>12
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 5/26/2010'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3503456111869573396)
,p_name=>'P27_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Start Date'
,p_source=>'P27_CALENDAR_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>12
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 5/26/2010'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3503456317148573396)
,p_name=>'P27_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3503455217892573349)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp+7,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'End Date'
,p_source=>'P27_CALENDAR_END_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>12
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503456725436573404)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P27_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503456522685573399)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503457322343573413)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P27_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503457114689573413)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503457916508573414)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P27_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503457716967573413)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503458511373573416)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503458320805573415)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503459125251573417)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503458909932573416)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503459707018573417)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503459507920573417)
,p_process_comment=>'Generated 5/26/2010'
);
end;
/
prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Search'
,p_page_mode=>'NORMAL'
,p_step_title=>'Search'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2241730277554958835)
,p_plug_name=>'search'
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
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<div class="sCustomSearch">'
,p_plug_footer=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'<p>Enter a page name in this application to locate a page</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2242814455875204968)
,p_branch_action=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::P33_SEARCH:&P28_SEARCH.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 14-OCT-2010 07:49 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2241730484134960753)
,p_name=>'P28_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2241730277554958835)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_attributes=>'class="sSearchFieldBig"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134543305183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Master Detail'
,p_page_mode=>'NORMAL'
,p_step_title=>'Master Detail'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>',
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(6273024108266542497)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6295363421044562795)
,p_plug_name=>'Order #&P29_ORDER_ID.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6295365602380562833)
,p_name=>'Items for Order #&P29_ORDER_ID.'
,p_template=>wwv_flow_api.id(1307120527432183864)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>2
,p_display_point=>'BODY_2'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'oi.order_item_id, oi.order_id, oi.product_id, oi.unit_price, oi.quantity,',
'(oi.unit_price * oi.quantity) extended_price',
'from "#OWNER#"."DEMO_ORDER_ITEMS" oi',
'where "ORDER_ID" = :P29_ORDER_ID'))
,p_source_type=>'NATIVE_TABFORM'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133239708183876)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'There are no items associated with this Order.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'&nbsp;'
,p_csv_output=>'N'
,p_query_asc_image=>'blue_arrow_down.gif'
,p_query_desc_image=>'blue_arrow_up.gif'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6295366816664562852)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_alignment=>'CENTER'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6295365720723562841)
,p_query_column_id=>2
,p_column_alias=>'ORDER_ITEM_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Order Item Id'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_column_width=>16
,p_pk_col_source_type=>'T'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'ORDER_ITEM_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6295365819276562841)
,p_query_column_id=>3
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Order Id'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_column_width=>16
,p_column_default=>'P29_ORDER_ID'
,p_column_default_type=>'ITEM'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'ORDER_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6295365915122562842)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Product Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(6296711130343343293)
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'PRODUCT_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6295366023253562842)
,p_query_column_id=>5
,p_column_alias=>'UNIT_PRICE'
,p_column_display_sequence=>6
,p_column_heading=>'Unit Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'DISPLAY_AND_SAVE'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'UNIT_PRICE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6295366106900562842)
,p_query_column_id=>6
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>5
,p_column_heading=>'Quantity'
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_lov_show_nulls=>'NO'
,p_column_width=>5
,p_column_default=>'1'
,p_column_default_type=>'FUNCTION'
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'QUANTITY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6296757525096852815)
,p_query_column_id=>7
,p_column_alias=>'EXTENDED_PRICE'
,p_column_display_sequence=>7
,p_column_heading=>'Extended Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295366507604562848)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6295365602380562833)
,p_button_name=>'ADD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Add Item to Order'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295364916209562816)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_button_name=>'GET_PREVIOUS_ORDER_ID'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'&lt; Previous Order'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:htmldb_goSubmit(''GET_PREVIOUS_ORDER_ID'')'
,p_button_condition=>'P29_ORDER_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295364807627562816)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_button_name=>'GET_NEXT_ORDER_ID'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next Order &gt;'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:htmldb_goSubmit(''GET_NEXT_ORDER_ID'')'
,p_button_condition=>'P29_ORDER_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295363630469562796)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Save Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295366303945562848)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6295365602380562833)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Save Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295363823236562797)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295363506803562796)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295363726427562796)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete Order'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6295366421203562848)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6295365602380562833)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete Checked Items'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6297016307268796774)
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>5
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  if :REQUEST in(''SAVE'', ''DELETE'') then',
'    return true;',
'  else',
'    return false;',
'  end if;',
'end;'))
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 21-AUG-2004 18:42'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6295367128561562853)
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6295365424440562831)
,p_branch_action=>'f?p=&FLOW_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:&P29_ORDER_ID_NEXT.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6295364807627562816)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6295365501443562832)
,p_branch_action=>'f?p=&FLOW_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:&P29_ORDER_ID_PREV.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6295364916209562816)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295363905867562800)
,p_name=>'P29_ORDER_ID'
,p_item_sequence=>99
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Id'
,p_source=>'ORDER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295364022596562808)
,p_name=>'P29_CUSTOMER_ID'
,p_item_sequence=>98
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer Id'
,p_source=>'CUSTOMER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>22
,p_cMaxlength=>255
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295364221528562811)
,p_name=>'P29_ORDER_TOTAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Total'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_source=>'ORDER_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>8
,p_cMaxlength=>255
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295364310233562811)
,p_name=>'P29_ORDER_TIMESTAMP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Date'
,p_format_mask=>'fmDay, fmDD fmMonth, YYYY'
,p_source=>'ORDER_TIMESTAMP'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>255
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295364418310562812)
,p_name=>'P29_USER_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sales Rep'
,p_source=>'USER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select user_name d, user_id r from demo_users order by 1'
,p_cSize=>22
,p_cMaxlength=>255
,p_cHeight=>1
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295365020751562822)
,p_name=>'P29_ORDER_ID_NEXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_prompt=>'P29_ORDER_ID_NEXT'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295365116087562822)
,p_name=>'P29_ORDER_ID_PREV'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_prompt=>'P29_ORDER_ID_PREV'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6295365207182562825)
,p_name=>'P29_ORDER_ID_COUNT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_tag_attributes=>'class="fielddata"'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6296746906418809412)
,p_name=>'P29_CUSTOMER_INFO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6295363421044562795)
,p_prompt=>'Customer Info'
,p_source=>'select cust_first_name || '' '' || cust_last_name || ''<br />'' || cust_street_address1 || decode(cust_street_address2, null, null, ''<br />'' || cust_street_address2) || ''</br>'' || cust_city || '', '' || cust_state || ''  '' || cust_postal_code from demo_cust'
||'omers where customer_id = :P29_CUSTOMER_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6295364125960562809)
,p_validation_name=>'P29_CUSTOMER_ID not null'
,p_validation_sequence=>2
,p_validation=>'P29_CUSTOMER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Customer Id must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(6295364022596562808)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295364513700562813)
,p_process_sequence=>1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_ORDERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_ORDERS'
,p_attribute_03=>'P29_ORDER_ID'
,p_attribute_04=>'ORDER_ID'
,p_attribute_14=>'N'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295365305235562828)
,p_process_sequence=>11
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_PAGINATION'
,p_process_name=>'Get Next or Previous Primary Key Value'
,p_attribute_02=>'DEMO_ORDERS'
,p_attribute_03=>'P29_ORDER_ID'
,p_attribute_04=>'ORDER_ID'
,p_attribute_07=>'ORDER_ID'
,p_attribute_09=>'P29_ORDER_ID_NEXT'
,p_attribute_10=>'P29_ORDER_ID_PREV'
,p_attribute_13=>'P29_ORDER_ID_COUNT'
,p_attribute_14=>'user_id = (select user_id from demo_users where user_name = :APP_USER)'
,p_process_error_message=>'Unable to run Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295364620494562816)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DEMO_ORDERS'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_ORDERS'
,p_attribute_03=>'P29_ORDER_ID'
,p_attribute_04=>'ORDER_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_process_error_message=>'Unable to process row of table DEMO_ORDERS.'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295364724669562816)
,p_process_sequence=>2
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'29'
,p_process_when_button_id=>wwv_flow_api.id(6295363726427562796)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295366616677562850)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6295365602380562833)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_ORDER_ITEMS'
,p_attribute_03=>'ORDER_ITEM_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(6295366303945562848)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295366709215562850)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6295365602380562833)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'DEMO_ORDER_ITEMS'
,p_attribute_03=>'ORDER_ITEM_ID'
,p_process_error_message=>'Unable to process delete'
,p_process_when=>'MULTI_ROW_DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295366907110562853)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6295365602380562833)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_ORDER_ITEMS'
,p_attribute_03=>'ORDER_ITEM_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(6295366507604562848)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6295367015332562853)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6295365602380562833)
,p_process_type=>'NATIVE_TABFORM_ADD_ROWS'
,p_process_name=>'AddRows'
,p_attribute_01=>'1'
,p_process_error_message=>'Unable to add rows'
,p_process_when_button_id=>wwv_flow_api.id(6295366507604562848)
);
end;
/
prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Report 1'
,p_page_mode=>'NORMAL'
,p_step_title=>'Report 1'
,p_step_sub_title=>'Report 1'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171253'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2236196464789070335)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121722709183865)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'select * from emp'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(2236196571070070335)
,p_name=>'Report 1'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'SHAKEEB'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236196753422070347)
,p_db_column_name=>'EMPNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Employee #'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236196864189070352)
,p_db_column_name=>'ENAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Employee Name - from attr dict'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236196959491070352)
,p_db_column_name=>'JOB'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236197074829070352)
,p_db_column_name=>'MGR'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Manager'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236197178221070353)
,p_db_column_name=>'HIREDATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Hiredate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236197281656070353)
,p_db_column_name=>'SAL'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Salary'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236197356489070353)
,p_db_column_name=>'COMM'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Commission'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2236197467236070353)
,p_db_column_name=>'DEPTNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Department'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2236197566271070524)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8755783'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'EMPNO:ENAME:JOB:MGR:HIREDATE:SAL:COMM:DEPTNO'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Calendar 1'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar 1'
,p_step_sub_title=>'Calendar 1'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(3503500013521581615)
,p_plug_name=>'Calendar 1'
,p_plug_source=>'select * from "APEX$_WS_HISTORY"'
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(3503500535254581618)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P31_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_item=>'P31_CALENDAR_DISPLAY'
,p_display_type=>'COL'
,p_easy_sql_table=>'APEX$_WS_HISTORY'
,p_date_column=>'CHANGE_DATE'
,p_display_column=>'APPLICATION_USER_ID'
,p_date_type_column=>'P31_CALENDAR_TYPE'
,p_end_date_item=>'P31_CALENDAR_END_DATE'
,p_include_custom_cal=>'Y'
,p_custom_cal_days=>3
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_api.id(1307135248105183878)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503501323411581621)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P31_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503501935710581625)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P31_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503502527390581626)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P31_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503504930011581633)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_button_name=>'CUSTOM_CALENDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Reload'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503503125367581628)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503503725208581629)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3503504318157581630)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503501706757581623)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503501323411581621)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503502335911581626)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503501935710581625)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503502927617581627)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503502527390581626)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503503507830581629)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503503125367581628)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503504113371581630)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503503725208581629)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503504734506581631)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503504318157581630)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3503505309907581634)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(3503504930011581633)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3503500722821581619)
,p_name=>'P31_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P31_CALENDAR_DISPLAY'
,p_source=>'P31_CALENDAR_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>12
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 5/26/2010'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3503500932883581620)
,p_name=>'P31_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Start Date'
,p_format_mask=>'YYYYMMDD'
,p_source=>'P31_CALENDAR_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>'Generated by Calendar wizard on 5/26/2010'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3503501124371581620)
,p_name=>'P31_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3503500013521581615)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp+7,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'End Date'
,p_format_mask=>'YYYYMMDD'
,p_source=>'P31_CALENDAR_END_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_item_comment=>'Generated by Calendar wizard on 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503501504920581622)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503501323411581621)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503502119041581625)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503501935710581625)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503502717191581627)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503502527390581626)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503503321971581628)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503503125367581628)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503503931341581630)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503503725208581629)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503504507192581631)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503504318157581630)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3503505131198581633)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Reload'
,p_process_sql_clob=>' apex_util.custom_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(3503504930011581633)
,p_process_comment=>'Generated 5/26/2010'
);
end;
/
prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Button Templates'
,p_alias=>'BUTTONTEMPLATES'
,p_page_mode=>'NORMAL'
,p_step_title=>'Button Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4269142359999260961)
,p_plug_name=>'No Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Text goes here.'
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
 p_id=>wwv_flow_api.id(5971334883612259739)
,p_plug_name=>'Button Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Put Text Here'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971342061158357348)
,p_plug_name=>'Template Types'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5971335770583265422)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5971334883612259739)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Button'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5971337461018272141)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5971334883612259739)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Hot Button (Alternative 1)'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5971338376255276530)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5971334883612259739)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'Button Alternative 2'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5971339478642324519)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5971334883612259739)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118225465183861)
,p_button_image_alt=>'Hot Button (Alternative 3)'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5971336379933268130)
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 17-AUG-2005 21:25 by CARL'
);
end;
/
prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Search Results'
,p_page_mode=>'NORMAL'
,p_step_title=>'Search Results'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2241731576908986989)
,p_name=>'Search Results'
,p_template=>wwv_flow_api.id(1360619352950572087)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select page_id||''. ''||page_name link_title,',
'          ''f?p=&APP_ID.:''||page_id||'':''||:app_session link_target,',
'         page_name description,',
'         ''type: ''||PAGE_FUNCTION||'', tabset: ''||tab_set type_of_result,',
'         LAST_UPDATED_ON',
'from apex_application_pages',
'where application_id = :app_id and instr(lower(page_id||''. ''||page_name),lower(:P33_SEARCH))>0'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307130729100183874)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2241731862395986999)
,p_query_column_id=>1
,p_column_alias=>'LINK_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'LINK_TITLE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2241731982572987003)
,p_query_column_id=>2
,p_column_alias=>'LINK_TARGET'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_TARGET'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2241732053146987003)
,p_query_column_id=>3
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>3
,p_column_heading=>'DESCRIPTION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2241732184929987003)
,p_query_column_id=>4
,p_column_alias=>'TYPE_OF_RESULT'
,p_column_display_sequence=>4
,p_column_heading=>'TYPE_OF_RESULT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2241732264944987003)
,p_query_column_id=>5
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>5
,p_column_heading=>'LAST_UPDATED_ON'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2241732765957993321)
,p_plug_name=>'Refine your Search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
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
 p_id=>wwv_flow_api.id(2241793974194440309)
,p_plug_name=>'Sort Results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
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
 p_id=>wwv_flow_api.id(2243172657649034184)
,p_plug_name=>'search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>4
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2241732978078996822)
,p_name=>'P33_SHOW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2241732765957993321)
,p_prompt=>'Show'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'EXAMPLE SEARCH SHOW OPTIONS'
,p_lov=>'.'||wwv_flow_api.id(2241733385267017810)||'.'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2241794263590446727)
,p_name=>'P33_SORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2241793974194440309)
,p_item_default=>'A'
,p_prompt=>'Sort'
,p_source=>'A'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Descending;D,Ascending;A'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243175458816794204)
,p_name=>'P33_SEARCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2243172657649034184)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Calendar 1'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar 1'
,p_step_sub_title=>'Calendar 1'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(2242804082962118109)
,p_plug_name=>'Calendar of Changed Page Items'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select application_id||''.''||page_id "APPLICATION_NAME",',
'	 "ITEM_NAME",',
'	  "LAST_UPDATED_ON",',
'	 "LAST_UPDATED_BY" ',
' from	 "APEX_APPLICATION_PAGE_ITEMS" ',
'where last_updated_on is not null'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(2242804759918118122)
,p_begin_at_start_of_interval=>'Y'
,p_date_item=>'P34_CALENDAR_DATE'
,p_display_as=>'M'
,p_display_item=>'P34_CALENDAR_DISPLAY'
,p_display_type=>'CUS'
,p_item_format=>'#APPLICATION_NAME# - #ITEM_NAME# (#LAST_UPDATED_BY#)'
,p_date_column=>'LAST_UPDATED_ON'
,p_start_of_week=>19721105
,p_start_time=>0
,p_end_time=>23
,p_time_format=>'24HOUR'
,p_week_start_day=>19721105
,p_week_end_day=>19721111
,p_date_type_column=>'P34_CALENDAR_TYPE'
,p_end_date_item=>'P34_CALENDAR_END_DATE'
,p_custom_cal_days=>3
,p_include_time_with_date=>'N'
,p_agenda_cal_days_type=>'MONTH'
,p_agenda_cal_days=>30
,p_template_id=>wwv_flow_api.id(1307135248105183878)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2242805574816118136)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P34_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2242806163500118145)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P34_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2242806772594118147)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P34_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2242807375439118148)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2242807962423118148)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2242808555017118151)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2242805961258118143)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2242805574816118136)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2242806579334118146)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2242806163500118145)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2242807181546118147)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2242806772594118147)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2242807759963118148)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2242807375439118148)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2242808380072118149)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2242807962423118148)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2242808969742118152)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2242808555017118151)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2242804971305118130)
,p_name=>'P34_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P34_CALENDAR_DISPLAY'
,p_source=>'P34_CALENDAR_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 10/14/2010'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2242805161239118135)
,p_name=>'P34_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Start Date'
,p_source=>'P34_CALENDAR_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 10/14/2010'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2242805383882118135)
,p_name=>'P34_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2242804082962118109)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return to_char(localtimestamp+7,''YYYYMMDD'');'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'End Date'
,p_source=>'P34_CALENDAR_END_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'Generated by Calendar wizard on 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2242805784907118140)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P34_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(2242805574816118136)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2242806374672118146)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P34_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(2242806163500118145)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2242806980860118147)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P34_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(2242806772594118147)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2242807573571118148)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(2242807375439118148)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2242808185704118148)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(2242807962423118148)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2242808776407118152)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(2242808555017118151)
,p_process_comment=>'Generated 10/14/2010'
);
end;
/
prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Portal'
,p_page_mode=>'NORMAL'
,p_step_title=>'Portal'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2243161260683353900)
,p_name=>'Pages'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 49%; margin-right: 1%;"'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select page_id||''.'' ||page_name page_name, last_updated_on',
'from apex_application_pages',
'where application_id = :APP_ID',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133728182183877)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>7
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2243161565793353904)
,p_query_column_id=>1
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>1
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#PAGE_NAME#'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2243161659018353905)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>2
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2243162056096371506)
,p_name=>'Page Items'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="clear: none; float: left; width: 50%;"'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select page_id||''.'' ||page_name page_name, last_updated_on',
'from apex_application_pages',
'where application_id = :APP_ID',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133728182183877)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>7
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333941726615581926)
,p_query_column_id=>1
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Page Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2243162368404371509)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>1
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2243165775432623078)
,p_name=>'Regions'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 49%; margin-right: 1%;"'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select page_id||''.'' ||page_name page_name, last_updated_on',
'from apex_application_pages',
'where application_id = :APP_ID',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133728182183877)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>7
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2243165975059623081)
,p_query_column_id=>1
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>1
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2243166075972623081)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>2
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2243166554223635830)
,p_name=>'Page Processes'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="clear: none; float: left; width: 50%;"'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select page_id||''.'' ||page_name page_name, last_updated_on',
'from apex_application_pages',
'where application_id = :APP_ID',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133728182183877)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>7
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333942030079582990)
,p_query_column_id=>1
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Page Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2243166780223635833)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>1
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243167457125646173)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120825206183864)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'This page demonstrates how you can create a portal page.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Tree'
,p_page_mode=>'NORMAL'
,p_step_title=>'Tree'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140730121324'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243172361583024277)
,p_plug_name=>'Tree'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status, ',
'       level, ',
'       "ENAME" as title, ',
'       null as icon, ',
'       "EMPNO" as value, ',
'       null as tooltip, ',
'       null as link ',
'from "#OWNER#"."WWV_DEMO_EMP"',
'start with "MGR" is null',
'connect by prior "EMPNO" = "MGR"',
'order siblings by "ENAME"'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_row_template=>1
,p_attribute_01=>'default'
,p_attribute_02=>'S'
,p_attribute_04=>'N'
,p_attribute_06=>'tree2243172256133024277'
,p_attribute_07=>'JSTREE'
);
end;
/
prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Pop'
,p_page_mode=>'NORMAL'
,p_step_title=>'Pop'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243176084920811224)
,p_plug_name=>'Test Popup Page'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_footer=>'<p>The following are examples of controls that popup pages, lists of values, date pickers etc.  Don''t forget to click the <b>Popup Page</b> button.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243818381913712918)
,p_plug_name=>'Hide Show Region Example'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120825206183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'This is a test of the hide show region.  Should be arrows.  Should show and hide this region content.  Region title should be displayed always.'
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
 p_id=>wwv_flow_api.id(2243176869252825634)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243176084920811224)
,p_button_name=>'TEST_POPUP'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Test Popup Page'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:popUpNamed(''f?p=&APP_ID.:44:&SESSION.:::'',''PopupTest'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243517074897253876)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2243176084920811224)
,p_button_name=>'SHOW_ME_AN_ERROR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Show Me An Error'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::BAD_ITEM:20'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243675780399352921)
,p_name=>'P37_DATE_PICKER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2243176084920811224)
,p_prompt=>'Date Picker'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243675959405356383)
,p_name=>'P37_POPUP_LOV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2243176084920811224)
,p_prompt=>'Popup Lov'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'STATES'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select initcap(state_name) display_value, st return_value from   demo_states',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243676171179359744)
,p_name=>'P37_COLOR_PICKER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2243176084920811224)
,p_prompt=>'Color Picker'
,p_display_as=>'NATIVE_COLOR_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243676378452361813)
,p_name=>'P37_POPUP_CALCULATOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2243176084920811224)
,p_prompt=>'Popup Calculator'
,p_display_as=>'NATIVE_TEXT_WITH_CALCULATOR'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Step 1'
,p_page_mode=>'NORMAL'
,p_step_title=>'Step 1'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243053960718592822)
,p_plug_name=>'Step 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_footer=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Using a form region to test full width.</p>',
'<p>Should see horizontal progress bar centered over this region</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243066669100733740)
,p_plug_name=>'wizard progress bar 38, 39, 40'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(2243065585243733739)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243067580788760787)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307119630301183863)
,p_plug_display_sequence=>4
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243829269942870308)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2243053960718592822)
,p_button_name=>'TEST_LONG_PROGRESS_TEXT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Test Long Progress Text'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243054358553592823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243067580788760787)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243054684314592823)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2243067580788760787)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243054963357592824)
,p_branch_action=>'f?p=&APP_ID.:39:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2243054684314592823)
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243054155412592823)
,p_name=>'P38_ITEM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2243053960718592822)
,p_prompt=>'ITEM 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00039
begin
wwv_flow_api.create_page(
 p_id=>39
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Step 2'
,p_page_mode=>'NORMAL'
,p_step_title=>'Step 2'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243055556941592825)
,p_plug_name=>'Step 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124748275183867)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'testing buttons for use in wizard regions'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243066875488733742)
,p_plug_name=>'wizard progress bar 38, 39, 40'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(2243065585243733739)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243055970634592825)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243055556941592825)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243056284363592825)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2243055556941592825)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118225465183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243056170353592825)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2243055556941592825)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243056875022592826)
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2243056284363592825)
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243056560903592826)
,p_branch_action=>'f?p=&APP_ID.:38:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2243056170353592825)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243055773067592825)
,p_name=>'P39_ITEM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2243055556941592825)
,p_prompt=>'ITEM 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Step 3'
,p_page_mode=>'NORMAL'
,p_step_title=>'Step 3'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243057681363592827)
,p_plug_name=>'Step 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124748275183867)
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
 p_id=>wwv_flow_api.id(2243067053707733742)
,p_plug_name=>'wizard progress bar 38, 39, 40'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(2243065585243733739)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243058056830592828)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243057681363592827)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243058173966592828)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2243057681363592827)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118225465183861)
,p_button_image_alt=>'Finish'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243058257289592828)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2243057681363592827)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'< Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243058982129592829)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2243058173966592828)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243058665487592828)
,p_branch_action=>'f?p=&APP_ID.:39:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(2243058257289592828)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243057876266592827)
,p_name=>'P40_ITEM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2243057681363592827)
,p_prompt=>'ITEM 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2243149557463220567)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'null'
,p_process_sql_clob=>'null;'
,p_process_success_message=>'You are now done your wizard, we hope you like the success message.'
);
end;
/
prompt --application/pages/page_00041
begin
wwv_flow_api.create_page(
 p_id=>41
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Employees'
,p_page_mode=>'NORMAL'
,p_step_title=>'Employees'
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
,p_last_upd_yyyymmddhh24miss=>'20140328112201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243061380353637618)
,p_plug_name=>'Employees'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
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
 p_id=>wwv_flow_api.id(2243068071831786642)
,p_plug_name=>'What to test'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Test the success message, popup list of values templates, calendar popup.  Attempt to create an employee without filling in mandatory fields or entering text in numeric columns.  Click the popup help for employee name.  Buttons are placed in a "Butto'
||'n Bar No Title" region template.'
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
 p_id=>wwv_flow_api.id(2243819171655719395)
,p_plug_name=>'Button Bar Region To test Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307119630301183863)
,p_plug_display_sequence=>3
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243830772198908754)
,p_plug_name=>'Nested Region Container (forms region)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243830983972912214)
,p_plug_name=>'Nested Region'
,p_parent_plug_id=>wwv_flow_api.id(2243830772198908754)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307118447403183861)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>'This is the source of a nested region, which is placed within a forms region.'
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
 p_id=>wwv_flow_api.id(2243831274060918731)
,p_plug_name=>'Nested Region No Heading'
,p_parent_plug_id=>wwv_flow_api.id(2243830772198908754)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307118447403183861)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>'This is an example of a nested region with no title.'
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
 p_id=>wwv_flow_api.id(2243836680650996369)
,p_plug_name=>'Nested Hide Show'
,p_parent_plug_id=>wwv_flow_api.id(2243830772198908754)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120825206183864)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>'This is a test of a region that uses a hide show template and is in a region that is a sub and another region.'
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
 p_id=>wwv_flow_api.id(2243832271552936949)
,p_plug_name=>'Items with labels left aligned'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>11
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243834461771953107)
,p_plug_name=>'Above Label'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>12
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243836168052983279)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(2243832271552936949)
,p_button_name=>'TEST_BOTTOM_BUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'Test Bottom Button'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243061679369637621)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2243819171655719395)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P41_EMPNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243061856307637621)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243819171655719395)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243061573441637621)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2243819171655719395)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Create Employee'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P41_EMPNO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243061776953637621)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2243819171655719395)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P41_EMPNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243062564760637623)
,p_branch_action=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243062775452637624)
,p_name=>'P41_EMPNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Empno'
,p_source=>'EMPNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243062966574637640)
,p_name=>'P41_ENAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'No Template'
,p_source=>'ENAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'this is help text, it should look good.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243063154887637642)
,p_name=>'P41_JOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Optional - Autocomplete dropdown'
,p_source=>'JOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct job from emp order by 1'
,p_cSize=>30
,p_cMaxlength=>9
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243063365904637643)
,p_name=>'P41_MGR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Optional with Help'
,p_source=>'MGR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select ename||'' ''||job d, empno r from emp'
,p_cSize=>30
,p_cMaxlength=>4
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243063570035637644)
,p_name=>'P41_HIREDATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Required'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'HIREDATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134820943183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243063782317637644)
,p_name=>'P41_SAL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Required with help'
,p_source=>'SAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>7
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243063963123637644)
,p_name=>'P41_COMM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Comm (not req with help)'
,p_source=>'COMM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>7
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243064164532637645)
,p_name=>'P41_DEPTNO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Department'
,p_source=>'DEPTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select dname, deptno from dept order by 1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>2
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243518357890296363)
,p_name=>'P41_DISPLAY_ONLY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_prompt=>'Display Only'
,p_source=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243832560255943126)
,p_name=>'P41_TEST'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(2243832271552936949)
,p_prompt=>'No template'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243832771396943127)
,p_name=>'P41_TEST2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(2243832271552936949)
,p_prompt=>'Required no help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(1307134820943183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243832983532943127)
,p_name=>'P41_TEST3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(2243832271552936949)
,p_prompt=>'Required with help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243833174756943127)
,p_name=>'P41_TEST4'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(2243832271552936949)
,p_prompt=>'Optional no help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243833355197943129)
,p_name=>'P41_TEST5'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(2243832271552936949)
,p_prompt=>'Optional with help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243834673546956454)
,p_name=>'P41_EXAMPLE_OF_LABEL_ABOVE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(2243834461771953107)
,p_prompt=>'Example of Label Above (this should look good over a text area)'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243835563419972428)
,p_name=>'P41_EXAMPLE_OF_LABEL_ABOVE_R'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(2243834461771953107)
,p_prompt=>'Example of Label Above (required)'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243835884197978491)
,p_name=>'P41_DISPLAY_ONLY2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(2243832271552936949)
,p_prompt=>'Display Only'
,p_source=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243836867276001918)
,p_name=>'P41_SHUTTLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(2243061380353637618)
,p_prompt=>'Shuttle'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>'select dname, deptno from dept'
,p_cSize=>150
,p_cMaxlength=>4000
,p_cHeight=>10
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'ALL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2243064371651637646)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EMP'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'EMP'
,p_attribute_03=>'P41_EMPNO'
,p_attribute_04=>'EMPNO'
,p_attribute_14=>'N'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2243064568037637647)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EMP'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'EMP'
,p_attribute_03=>'P41_EMPNO'
,p_attribute_04=>'EMPNO'
,p_attribute_09=>'P41_EMPNO'
,p_attribute_11=>'I:U:D'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_process_error_message=>'Unable to process row of table EMP.'
,p_process_success_message=>'Action Processed for employee with ID &P41_EMPNO.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2243064784008637647)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'41'
,p_process_when_button_id=>wwv_flow_api.id(2243061776953637621)
);
end;
/
prompt --application/pages/page_00043
begin
wwv_flow_api.create_page(
 p_id=>43
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Employees'
,p_page_mode=>'NORMAL'
,p_step_title=>'Employees'
,p_step_sub_title=>'Employees'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171253'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243105782074195250)
,p_plug_name=>'Employees'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121722709183865)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'select * from DEMO_PRODUCT_INFO'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(2243105861995195250)
,p_name=>'Employees'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:41:P41_EMPNO:#EMPNO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="">'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333944351896589228)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Product Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333944452128589230)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Product Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333944540873589230)
,p_db_column_name=>'PRODUCT_DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Product Description'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333944632513589230)
,p_db_column_name=>'CATEGORY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333944736803589230)
,p_db_column_name=>'PRODUCT_AVAIL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Product Avail'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333944836671589230)
,p_db_column_name=>'LIST_PRICE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'List Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333944938412589231)
,p_db_column_name=>'PRODUCT_IMAGE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Product Image'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333945025910589231)
,p_db_column_name=>'MIMETYPE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Mimetype'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333945122029589231)
,p_db_column_name=>'FILENAME'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1333945250998589231)
,p_db_column_name=>'IMAGE_LAST_UPDATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Image Last Update'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2243106878851195508)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8824876'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'EMPNO:ENAME:JOB:MGR:HIREDATE:SAL:COMM:DEPTNO:PRODUCT_ID:PRODUCT_NAME:PRODUCT_DESCRIPTION:CATEGORY:PRODUCT_AVAIL:LIST_PRICE:PRODUCT_IMAGE:MIMETYPE:FILENAME:IMAGE_LAST_UPDATE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243108585478225732)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243105782074195250)
,p_button_name=>'CREATE_EMPLOYEE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create Employee >'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:41::'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00044
begin
wwv_flow_api.create_page(
 p_id=>44
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Popup test'
,p_page_mode=>'NORMAL'
,p_step_title=>'Popup test'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116447560183860)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20140507054719'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243177076524827773)
,p_plug_name=>'Popup Test'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<p>&SAMPLE_TEXT.</p>'
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
 p_id=>wwv_flow_api.id(2243285379356499084)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(2243177076524827773)
,p_button_name=>'P44_INLINE_BUTTON'
,p_button_static_id=>'P44_INLINE_BUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Inline Button'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'Go'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243285755246501575)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243177076524827773)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243285559856499086)
,p_branch_action=>'f?p=&FLOW_ID.:44:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243284056238473458)
,p_name=>'P44_X1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2243177076524827773)
,p_item_default=>'dummy text'
,p_prompt=>'No Label Template'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243284271822477960)
,p_name=>'P44_X2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2243177076524827773)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'multiline',
'dummy',
'text'))
,p_prompt=>'Optional'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>4000
,p_cHeight=>5
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243284779918489717)
,p_name=>'P44_X3'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(2243177076524827773)
,p_prompt=>'Optional with help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243284956500492447)
,p_name=>'P44_X4'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(2243177076524827773)
,p_prompt=>'Required'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134820943183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2243285166196495235)
,p_name=>'P44_X5'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(2243177076524827773)
,p_prompt=>'Required with Help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00046
begin
wwv_flow_api.create_page(
 p_id=>46
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Long Progress List'
,p_page_mode=>'NORMAL'
,p_step_title=>'Long Progress List'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20140328112155'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243824673705842946)
,p_plug_name=>'Standard Wizard Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124748275183867)
,p_plug_display_sequence=>10
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_footer=>'This application pages shows a vertical progress list.  Some progress entries are very long to tst long entries.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243827261526859899)
,p_plug_name=>'Long List (progress test)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(2243825566695859894)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2243830459038904952)
,p_plug_name=>'hide show test'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120825206183864)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'test'
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
 p_id=>wwv_flow_api.id(2243829653451874984)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243824673705842946)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243829854636874986)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2243824673705842946)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00100
begin
wwv_flow_api.create_page(
 p_id=>100
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'test'
,p_page_mode=>'NORMAL'
,p_step_title=>'test'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Login'
,p_alias=>'LOGIN'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307115030340183858)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054719'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6271636421384410515)
,p_plug_name=>'Login'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<hr /><p>Login using your APEX credentials</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6271636827597410534)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6271636421384410515)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Login'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'LOGIN'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271636520892410524)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6271636421384410515)
,p_prompt=>'User Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6271636723396410534)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6271636421384410515)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>20
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6271637032172410540)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'owa_util.mime_header(''text/html'', FALSE);',
'owa_cookie.send(',
'    name=>''LOGIN_USERNAME_COOKIE'',',
'    value=>lower(:P101_USERNAME));',
'exception when others then null;',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6271636916780410536)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_custom_auth_std.login(',
'    P_UNAME       => v(''P101_USERNAME''),',
'    P_PASSWORD    => :P101_PASSWORD,',
'    P_SESSION_ID  => v(''APP_SESSION''),',
'    P_FLOW_PAGE   => :APP_ID||'':1''',
'    );'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6271637205511410542)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'101'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6271637128149410542)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    v varchar2(255) := null;',
'    c owa_cookie.cookie;',
'begin',
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');',
'   :P101_USERNAME := c.vals(1);',
'exception when others then null;',
'end;'))
);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_name=>'Feedback'
,p_alias=>'FEEDBACK'
,p_page_mode=>'NORMAL'
,p_step_title=>'Feedback'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(1307116447560183860)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_page_comment=>'This page was generated by the feedback wizard'
,p_last_upd_yyyymmddhh24miss=>'20140328112155'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5379459498656636399)
,p_plug_name=>'Feedback'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
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
 p_id=>wwv_flow_api.id(5379460304201636462)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5379459498656636399)
,p_button_name=>'SUBMIT'
,p_button_static_id=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3791736542868)
,p_button_image_alt=>'Submit Feedback'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5379459722875636444)
,p_name=>'P102_FEEDBACK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5379459498656636399)
,p_prompt=>'Feedback'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5379459898849636445)
,p_name=>'P102_X'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5379459498656636399)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5379460093452636446)
,p_name=>'P102_FEEDBACK_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5379459498656636399)
,p_prompt=>'Feedback Type'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select the_name, id from WWV_FLOW_FEEDBACK_TYPES order by id'
,p_cSize=>20
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5379460523718636485)
,p_validation_name=>'Feedback not null'
,p_validation_sequence=>10
,p_validation=>'P102_FEEDBACK'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Value must be specified'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(5379460304201636462)
,p_associated_item=>wwv_flow_api.id(5379459722875636444)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5379460697641636502)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit Feedback'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_util.submit_feedback (',
'    p_comment         => :P102_FEEDBACK,',
'    p_type            => :P102_FEEDBACK_TYPE,',
'    p_application_id  => wwv_flow.g_flow_id,',
'    p_page_id         => wwv_flow.g_flow_step_id);'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5379460918213636503)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Window'
);
end;
/
prompt --application/pages/page_00120
begin
wwv_flow_api.create_page(
 p_id=>120
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Multi Level Lists'
,p_alias=>'MULTILISTS'
,p_page_mode=>'NORMAL'
,p_step_title=>'Multi Level Lists'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971500780654213173)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971510274945249335)
,p_plug_name=>'Tree'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5971502980092222504)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307128022883183871)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'TREE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971514289967263154)
,p_plug_name=>'DHTML Tree'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5971502980092222504)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307125942791183868)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'DTREE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971516267026275419)
,p_plug_name=>'DHTML Menu with Sublist'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123222734183866)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5971502980092222504)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307125650553183868)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'DMENU'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971518975815287462)
,p_plug_name=>'DHTML List (Image) with Sublist'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123222734183866)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5971502980092222504)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307127132911183870)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'DIMENU'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971524686251318871)
,p_plug_name=>'List Template Types'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5971502980092222504)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307126227634183869)
,p_plug_query_row_template=>1
,p_plug_footer=>'<p>The Above list is a multi level list.  Parent 2 and Parent 3 have sub lists, however parent 2 seems to also link to page 6.</p>'
);
end;
/
prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Template Index'
,p_alias=>'TEMPLATEINDEX'
,p_page_mode=>'NORMAL'
,p_step_title=>'Template Index'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054719'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2241127865682838593)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_header=>'<div class="sCustomSearch">'
,p_plug_footer=>'</div>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970745968989305275)
,p_plug_name=>'Theme Testing Application Notes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'On the left are links to the all template examples and page layouts.<br />Page layouts are the examples of where region substitutions will be located on the page.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970913172348523858)
,p_plug_name=>'Page Layout'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5970907387193499797)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972714591608359054)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2241142683129853061)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2241127865682838593)
,p_button_name=>'P200_SEARCHBUTTON'
,p_button_static_id=>'P200_SEARCHBUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'Go'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4272538840049257814)
,p_button_sequence=>10
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4272539039693257815)
,p_button_sequence=>20
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118225465183861)
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2241142862853853062)
,p_branch_action=>'f?p=&FLOW_ID.:200:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2241142469969849308)
,p_name=>'P200_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2241127865682838593)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_attributes=>'class="sSearchField"'
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1307134543305183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00201
begin
wwv_flow_api.create_page(
 p_id=>201
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Region Templates'
,p_alias=>'REGIONTEMPLATES'
,p_page_mode=>'NORMAL'
,p_step_title=>'Region Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1333912134000442112)
,p_plug_name=>'Sidebar Region, Alternative 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>210
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et <a href="http://apex.oracle.com">dolore magna aliqua</a>. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex e'
||'a commodo consequat.',
'',
'<p><strong>Text should show a link for dolore magna aliqua</strong></a>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1333923927168496976)
,p_plug_name=>'Top Bar Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124430808183867)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Top Bar Region'
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
 p_id=>wwv_flow_api.id(1334007732652744547)
,p_plug_name=>'Report Filter - Single Row Example'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122326202183865)
,p_plug_display_sequence=>220
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
 p_id=>wwv_flow_api.id(5633048299801335031)
,p_plug_name=>'Report List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122646462183865)
,p_plug_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'this is a list of reports auto generated by create app wizard'
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
 p_id=>wwv_flow_api.id(5830685197070673732)
,p_plug_name=>'Wizard Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124748275183867)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5830686419926680243)
,p_plug_name=>'Wizard Region with Icon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307125039037183868)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure '
||'dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5831540992693531799)
,p_plug_name=>'Chart Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307120250701183863)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(4815306262537429694)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_title=>'Chart 1'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart630924623040524624'
,p_chart_width=>600
,p_chart_height=>400
,p_chart_animation=>'N'
,p_display_attr=>':H:N::Y::Right::V:::::N'
,p_pie_attr=>'Outside:::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_color_scheme=>'1'
,p_x_axis_label_font=>'Arial:8:#000000'
,p_y_axis_label_font=>'Arial:8:#000000'
,p_legend_title_font=>'Arial:8:#000000'
, p_names_font=> null
, p_names_rotation=> null
,p_hints_font=>'Verdana:10:#000000'
,p_chart_title_font=>'Arial:14:#000000'
,p_x_axis_title_font=>'Arial:14:#000000'
,p_y_axis_title_font=>'Arial:14:#000000'
,p_gauge_labels_font=>'Arial:8:#000000'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(4815306360712429694)
,p_chart_id=>wwv_flow_api.id(4815306262537429694)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null link, ORDER_ID label, ORDER_TOTAL value ',
'from  "FLOWS_020200"."DEMO_ORDERS"'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_no_data_found=>'No data found.'
,p_series_query_row_count_max=>15
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972722004215447809)
,p_plug_name=>'Borderless Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307118447403183861)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972722886684452221)
,p_plug_name=>'Bracketed Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307118749923183862)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972724288547462249)
,p_plug_name=>'Button Region with Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307119334632183863)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972725205170467042)
,p_plug_name=>'Button Region without Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307119630301183863)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Button Region without Title'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972725886946471240)
,p_plug_name=>'List WIth Icon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307119946929183863)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972726596989474138)
,p_plug_name=>'Form Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972727310149477995)
,p_plug_name=>'Hide and Show Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120825206183864)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972733009165581771)
,p_plug_name=>'Navigation Region, Alternative 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307121447321183864)
,p_plug_display_sequence=>180
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972734097522587856)
,p_plug_name=>'Navigation Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>170
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972736313583601950)
,p_plug_name=>'Region without Buttons and Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307121722709183865)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Region without Buttons and Title'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972736991204604943)
,p_plug_name=>'Region without Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122036801183865)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Region without Title'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972740801818674205)
,p_plug_name=>'Sidebar Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>190
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et <a href="http://apex.oracle.com">dolore magna aliqua</a>. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex e'
||'a commodo consequat.',
'',
'<p><strong>Text should show a link for dolore magna aliqua</strong></a>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5972741789135680000)
,p_plug_name=>'Sidebar Region, Alternative 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>200
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et <a href="http://apex.oracle.com">dolore magna aliqua</a>. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex e'
||'a commodo consequat.',
'',
'<p><strong>Text should show a link for dolore magna aliqua</strong></a>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6233804454990306288)
,p_name=>'Reports Region'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_ORDERS"."ORDER_ID" as "ORDER_ID",',
'	 "DEMO_ORDERS"."CUSTOMER_ID" as "CUSTOMER_ID",',
'	 "DEMO_ORDERS"."ORDER_TOTAL" as "ORDER_TOTAL",',
'	 "DEMO_ORDERS"."ORDER_TIMESTAMP" as "ORDER_TIMESTAMP" ',
' from	 "DEMO_ORDERS" "DEMO_ORDERS"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233804762767306320)
,p_query_column_id=>1
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Order Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233804853597306320)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Customer Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233804966416306321)
,p_query_column_id=>3
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>3
,p_column_heading=>'Order Total'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233805061140306321)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>4
,p_column_heading=>'Order Timestamp'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6233812150273314350)
,p_name=>'Reports Region 100% Width'
,p_template=>wwv_flow_api.id(1307123222734183866)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_ORDERS"."ORDER_ID" as "ORDER_ID",',
'	 "DEMO_ORDERS"."CUSTOMER_ID" as "CUSTOMER_ID",',
'	 "DEMO_ORDERS"."ORDER_TOTAL" as "ORDER_TOTAL",',
'	 "DEMO_ORDERS"."ORDER_TIMESTAMP" as "ORDER_TIMESTAMP" ',
' from	 "DEMO_ORDERS" "DEMO_ORDERS"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233812345298314353)
,p_query_column_id=>1
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Order Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233812447863314353)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Customer Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233812551616314354)
,p_query_column_id=>3
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>3
,p_column_heading=>'Order Total'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233812665003314354)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>4
,p_column_heading=>'Order Timestamp'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6233816865510318814)
,p_name=>'Reports Region Alternative 1'
,p_template=>wwv_flow_api.id(1307123528493183866)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_ORDERS"."ORDER_ID" as "ORDER_ID",',
'	 "DEMO_ORDERS"."CUSTOMER_ID" as "CUSTOMER_ID",',
'	 "DEMO_ORDERS"."ORDER_TOTAL" as "ORDER_TOTAL",',
'	 "DEMO_ORDERS"."ORDER_TIMESTAMP" as "ORDER_TIMESTAMP" ',
' from	 "DEMO_ORDERS" "DEMO_ORDERS"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233817371146318816)
,p_query_column_id=>1
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Order Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233817068577318815)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Customer Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233817166594318815)
,p_query_column_id=>3
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>3
,p_column_heading=>'Order Total'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6233817242363318816)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>4
,p_column_heading=>'Order Timestamp'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1334010836246755003)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(1334007732652744547)
,p_button_name=>'P201_GO'
,p_button_static_id=>'P201_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890835077687041518)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'CHANGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'CHANGE'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5830649121515918275)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(5972724288547462249)
,p_button_name=>'Test_4'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Test_4'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890842178907132094)
,p_button_sequence=>240
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'CHANGE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Change'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890845751480190414)
,p_button_sequence=>360
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Change2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Change'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890835268333041519)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'CLOSE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'CLOSE'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5830649501902918277)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(5972724288547462249)
,p_button_name=>'Test_6'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Test_4'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5830647512727903963)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_api.id(5972725205170467042)
,p_button_name=>'Test_2'
,p_button_static_id=>'Test_2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3791736542868)
,p_button_image_alt=>'Test_1'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243280977971148614)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_api.id(5972736991204604943)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890842369730132094)
,p_button_sequence=>250
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'CLOSE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890845972147190415)
,p_button_sequence=>370
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Close2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890835463317041519)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'COPY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'COPY'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5830647304762903960)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_api.id(5972725205170467042)
,p_button_name=>'Test_1'
,p_button_static_id=>'Test_1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117850205183861)
,p_button_image_alt=>'Test_1'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890842579817132095)
,p_button_sequence=>260
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'COPY1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Copy'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890846180090190415)
,p_button_sequence=>380
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Copy2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Copy'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890835671113041520)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'CREATE'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5830647722948903963)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(5972725205170467042)
,p_button_name=>'Test_3'
,p_button_static_id=>'Test_3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307118033714183861)
,p_button_image_alt=>'Test_1'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243280764465144729)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_api.id(5972736991204604943)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890842775477132095)
,p_button_sequence=>270
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'CREATE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890846374956190416)
,p_button_sequence=>390
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'CREATE2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890835850984041520)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'CREATE2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'CREATE2'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5830649314655918276)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(5972724288547462249)
,p_button_name=>'Test_5'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Test_4'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890842967374132095)
,p_button_sequence=>280
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'CREATE21'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890846575316190416)
,p_button_sequence=>400
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'CREATE22'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create2'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890836055705041520)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'DELETE'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890843178764132096)
,p_button_sequence=>290
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'DELETE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890846759785190416)
,p_button_sequence=>410
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Delete2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890836267994041521)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'EDIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'EDIT'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890843364018132096)
,p_button_sequence=>300
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'EDIT1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890846966776190417)
,p_button_sequence=>420
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Edit2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890836452769041521)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'EXPAND'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'EXPAND'
,p_button_position=>'REGION_TEMPLATE_EXPAND'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890843557070132097)
,p_button_sequence=>310
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'Expand1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Expand'
,p_button_position=>'REGION_TEMPLATE_EXPAND'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890847162260190417)
,p_button_sequence=>430
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Expand2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Expand'
,p_button_position=>'REGION_TEMPLATE_EXPAND'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890836673772041522)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'HELP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'HELP'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890843777080132097)
,p_button_sequence=>320
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'Help1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Help'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890847360473190418)
,p_button_sequence=>440
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Help2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Help'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890836862236041522)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'NEXT'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3514022018774942144)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_api.id(5972725205170467042)
,p_button_name=>'Button2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Forward'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890843973909132098)
,p_button_sequence=>330
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'Next1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890847554728190418)
,p_button_sequence=>450
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Next2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890837066790041522)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'PREVIOUS'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3514021831148942119)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(5972725205170467042)
,p_button_name=>'Button1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Back'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890844152688132098)
,p_button_sequence=>340
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'Previous1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890847779563190419)
,p_button_sequence=>460
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'Previous2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890834853429041516)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_button_name=>'DEFAULT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'DEFAULT'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890841972270132091)
,p_button_sequence=>230
,p_button_plug_id=>wwv_flow_api.id(5830685197070673732)
,p_button_name=>'DEFAULT1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Default'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5890845577557190412)
,p_button_sequence=>350
,p_button_plug_id=>wwv_flow_api.id(5830686419926680243)
,p_button_name=>'DEFAULT2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Default'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1334009349967749562)
,p_name=>'P201_FILTER1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1334007732652744547)
,p_prompt=>'Filter 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1334009534104749563)
,p_name=>'P201_FILTER2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1334007732652744547)
,p_prompt=>'Filter 2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6234637669879360886)
,p_name=>'P201_FOR_DEMO_FORM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_prompt=>'For Demo Form'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6234640050270364682)
,p_name=>'P201_FOR_DEMO_FORM_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5972726596989474138)
,p_prompt=>'For Demo Form 2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
end;
/
prompt --application/pages/page_00202
begin
wwv_flow_api.create_page(
 p_id=>202
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'LABEL_DEMO'
,p_page_mode=>'NORMAL'
,p_step_title=>'LABEL_DEMO'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>',
'',
'',
'<style>',
'td.t23CurrentTab{padding:0;}',
'td.t23Tab{padding:0;}',
'td.t23CurrentTab a{font-weight:bold;background-color:#EEEEEE;padding:4px;margin:0;display:block;}',
'td.t23Tab a{font-weight:bold;padding:4px;margin:0;display:block;}',
'td.t23Tab a:hover{background-color:#EEEEEE;}',
'</style>',
'',
''))
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112157'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970620686244655266)
,p_plug_name=>'Label Demo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307120527432183864)
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
 p_id=>wwv_flow_api.id(5970627371901323474)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5970620988406655267)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P202_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5970621178176655268)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5970620873557655267)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P202_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5970621079083655267)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P202_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5970621782663655272)
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5886077261466324606)
,p_name=>'FVD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5970621971037655273)
,p_name=>'P202_PRODUCT_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Id'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5970622173014655279)
,p_name=>'P202_PRODUCT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Required Label'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134820943183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5970622380793655281)
,p_name=>'P202_PRODUCT_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Optional Label'
,p_source=>'PRODUCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134630977183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5970622582679655281)
,p_name=>'P202_CATEGORY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Optional Label with Help'
,p_source=>'CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>31
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5970622770364655282)
,p_name=>'P202_PRODUCT_AVAIL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Required Label with Help'
,p_source=>'PRODUCT_AVAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134946658183878)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5970622966473655282)
,p_name=>'P202_LIST_PRICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_use_cache_before_default=>'NO'
,p_prompt=>'List Price'
,p_source=>'LIST_PRICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5970623165188655283)
,p_name=>'P202_IMAGE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(5970620686244655266)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Image Id'
,p_source=>'IMAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1307134724697183878)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5890830568871960728)
,p_validation_name=>'P202_PRODUCT_NAME'
,p_validation_sequence=>10
,p_validation=>'P202_PRODUCT_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Value must be specified.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(5970622173014655279)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5970623392418655284)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_PRODUCT_INFO'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'DEMO_PRODUCT_INFO'
,p_attribute_03=>'P202_PRODUCT_ID'
,p_attribute_04=>'PRODUCT_ID'
,p_attribute_14=>'N'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5970623777613655286)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'202'
,p_process_when_button_id=>wwv_flow_api.id(5970621079083655267)
);
end;
/
prompt --application/pages/page_00204
begin
wwv_flow_api.create_page(
 p_id=>204
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Report Templates'
,p_alias=>'REPORTTEMPLATES'
,p_page_mode=>'NORMAL'
,p_step_title=>'Report Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171655'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1333930647993531328)
,p_name=>'Report Template (Value Attribute Pairs - Div)'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select page_id||''.'' ||page_name page_name, last_updated_on',
'from apex_application_pages',
'where application_id = :APP_ID',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307130424219183873)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'CSV'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333933147085540575)
,p_query_column_id=>1
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Page Name'
,p_print_col_width=>'50'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333933226082540575)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>2
,p_column_heading=>'Last Updated On'
,p_print_col_width=>'50'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1333931323883533841)
,p_name=>'Repor Template (One Column Unordered List)'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME"',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307131732744183875)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'CSV'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333931540532533841)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
,p_print_col_width=>'100'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1333933635095546526)
,p_name=>'Report Template (Value Attribute Pairs - Table)'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>79
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select page_id||''.'' ||page_name page_name, last_updated_on',
'from apex_application_pages',
'where application_id = :APP_ID',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307134022997183877)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'CSV'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333933845911546526)
,p_query_column_id=>1
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Page Name'
,p_print_col_width=>'50'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333933927411546526)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>2
,p_column_heading=>'Last Updated On'
,p_print_col_width=>'50'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2243304885025910350)
,p_name=>'Tabular Form with Report Template (Standard)'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL" ',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2243306979201910406)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333929147238522024)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333929239487522024)
,p_query_column_id=>3
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>3
,p_column_heading=>'Product Description'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333929342358522024)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>4
,p_column_heading=>'Category'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1333929435152522024)
,p_query_column_id=>5
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>5
,p_column_heading=>'Product Avail'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1333928748554522021)
,p_column_sequence=>1
,p_query_column_name=>'PRODUCT_NAME'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1333928833212522023)
,p_column_sequence=>2
,p_query_column_name=>'PRODUCT_DESCRIPTION'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1333928922910522023)
,p_column_sequence=>3
,p_query_column_name=>'CATEGORY'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(1333929027870522023)
,p_column_sequence=>4
,p_query_column_name=>'PRODUCT_AVAIL'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5970728178583175556)
,p_name=>'Reports Template (Standard) - Partial Page Refresh = No'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL" ',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970728480377175582)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970728567149175585)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970728691378175585)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970728770678175585)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5970729772827183364)
,p_name=>'Report Template (Standard Alt 1)'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL" ',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307133239708183876)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'CSV'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970729963556183367)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970730061627183367)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970730173485183368)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970730275611183368)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5970732973351221395)
,p_name=>'Report Template (Borderless)'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL" ',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307130729100183874)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'CSV'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970733179909221397)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970733289339221398)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970733382937221398)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970733460153221398)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5970734970365229947)
,p_name=>'Report Template (Horizontal Border)'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL" ',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307131236809183874)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'CSV'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970735161362229948)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970735272328229948)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970735384214229948)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970735484076229948)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5970737388982254313)
,p_name=>'Report Template (Standard) - Partial Page Refresh = Yes'
,p_template=>wwv_flow_api.id(1307122946604183866)
,p_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL" ',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO"'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1307132244516183875)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'CSV'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970737574493254315)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970737687893254315)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970737772581254315)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5970737862895254316)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970745277516298308)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243305858033910393)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2243304885025910350)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Add Row'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:addRow();'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243305659962910393)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2243304885025910350)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243305580965910393)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2243304885025910350)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2243305781155910393)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2243304885025910350)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1307117624872183861)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2243307053755910406)
,p_branch_action=>'f?p=&APP_ID.:204:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2243306553129910401)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(2243304885025910350)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEPT'
,p_attribute_03=>'DEPTNO'
,p_process_error_message=>'Unable to process update.'
,p_process_when_button_id=>wwv_flow_api.id(2243305659962910393)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2243306773273910405)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(2243304885025910350)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'DEPT'
,p_attribute_03=>'DEPTNO'
,p_process_error_message=>'Unable to process delete.'
,p_process_when=>'MULTI_ROW_DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
);
end;
/
prompt --application/pages/page_00205
begin
wwv_flow_api.create_page(
 p_id=>205
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Menu Templates'
,p_page_mode=>'NORMAL'
,p_step_title=>'Menu Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2236957461198090591)
,p_plug_name=>'Progress List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970744567819295497)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971271071690994875)
,p_plug_name=>'Vertical List w Bullets'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129829032183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971273089137009323)
,p_plug_name=>'Vertical List w/o Bullets'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129535729183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971308089642246027)
,p_plug_name=>'Vertical Ordered List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307128935443183872)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971309483886253876)
,p_plug_name=>'Wizard Progress List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121447321183864)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307130120281183873)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971310164277257661)
,p_plug_name=>'Tabbed Navigation List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307127750529183870)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971331068543217522)
,p_plug_name=>'Button List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307125325788183868)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971490091249131046)
,p_plug_name=>'Horizontal Images with Label List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307126227634183869)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971490663676132537)
,p_plug_name=>'Horizontal Links List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307126534993183869)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5971492587355148867)
,p_plug_name=>'Vertical Images List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307123528493183866)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307128326231183871)
,p_plug_query_row_template=>1
);
end;
/
prompt --application/pages/page_00206
begin
wwv_flow_api.create_page(
 p_id=>206
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Menu Templates'
,p_page_mode=>'NORMAL'
,p_step_title=>'Menu Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970750776870326423)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5972714115718356586)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
);
end;
/
prompt --application/pages/page_00210
begin
wwv_flow_api.create_page(
 p_id=>210
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'One Level Tabs'
,p_page_mode=>'NORMAL'
,p_step_title=>'One Level Tabs'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style  type="text/css">',
'.htmldbRegionOutline{',
'border:1px dashed #DDDDDD;',
'background-color:#EEEEEE;',
'padding:2px;',
'margin:2px;',
'text-align:center;',
'}',
'</style>'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970677561521413624)
,p_plug_name=>'Region Position 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Position 2</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970678274680417471)
,p_plug_name=>'Region Postion 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Postion 3</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Customize'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970679189571421806)
,p_plug_name=>'Region Postion 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 4</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970680479313428233)
,p_plug_name=>'Region Postion 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 5</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970681364899433557)
,p_plug_name=>'Region Postion 6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 6</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970682075635436711)
,p_plug_name=>'Region Postion 7'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 7</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970682791219441159)
,p_plug_name=>'Region Postion 8'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 8</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970683473342445440)
,p_plug_name=>'After Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_source=>'<div class="htmldbRegionOutline">After Header</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970684161352451465)
,p_plug_name=>'Page Template Body (1)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (1)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970684882477457558)
,p_plug_name=>'Page Template Body (2)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (2)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970685564254461815)
,p_plug_name=>'Page Template Body (3)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (3)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6235089639900213259)
,p_plug_name=>'Before Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_source=>'<div class="htmldbRegionOutline">Before Footer</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00211
begin
wwv_flow_api.create_page(
 p_id=>211
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'One Level Tabs with Sidebar'
,p_page_mode=>'NORMAL'
,p_step_title=>'One Level Tabs with Sidebar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style  type="text/css">',
'.htmldbRegionOutline{',
'border:1px dashed #DDDDDD;',
'background-color:#EEEEEE;',
'padding:2px;',
'margin:2px;',
'text-align:center;',
'white-space:nowrap;',
'}',
'</style>'))
,p_step_template=>wwv_flow_api.id(1307116132894183859)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970712283105014166)
,p_plug_name=>'Region Postion 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Postion 3</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Customize'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970712465890014182)
,p_plug_name=>'Region Postion 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 4</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970712689596014183)
,p_plug_name=>'Region Postion 7'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 7</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970712869948014183)
,p_plug_name=>'Region Postion 8'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 8</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970713079915014184)
,p_plug_name=>'Page Template Body (3)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (3)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970713270016014184)
,p_plug_name=>'Region Postion 6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 6</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970713486535014185)
,p_plug_name=>'Region Position 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Position 2</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970713681309014185)
,p_plug_name=>'Page Template Body (2)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (2)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970713862325014186)
,p_plug_name=>'Region Postion 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 5</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970714074850014186)
,p_plug_name=>'After Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_source=>'<div class="htmldbRegionOutline">After Header</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970714263942014188)
,p_plug_name=>'Page Template Body (1)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (1)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6235096045918224504)
,p_plug_name=>'Before Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_source=>'<div class="htmldbRegionOutline">Before Footer</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00212
begin
wwv_flow_api.create_page(
 p_id=>212
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Two Level Tabs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Two Level Tabs'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style  type="text/css">',
'.htmldbRegionOutline{',
'border:1px dashed #DDDDDD;',
'background-color:#EEEEEE;',
'padding:2px;',
'margin:2px;',
'text-align:center;',
'}',
'</style>'))
,p_step_template=>wwv_flow_api.id(1307117023563183860)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970916788657669765)
,p_plug_name=>'Region Postion 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Postion 3</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Customize'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970916963401669766)
,p_plug_name=>'Region Postion 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 4</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970917591544669769)
,p_plug_name=>'Page Template Body (3)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (3)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970917774450669769)
,p_plug_name=>'Region Postion 6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 6</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970917983080669770)
,p_plug_name=>'Region Position 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Position 2</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970918184995669771)
,p_plug_name=>'Page Template Body (2)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (2)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970918363028669771)
,p_plug_name=>'Region Postion 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 5</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970918787261669772)
,p_plug_name=>'Page Template Body (1)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (1)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970918976621669773)
,p_plug_name=>'Region 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Region Postion 1'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6235099765658230168)
,p_plug_name=>'Before Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_source=>'<div class="htmldbRegionOutline">Before Footer</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00213
begin
wwv_flow_api.create_page(
 p_id=>213
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'Two Level Tabs with Sidebar'
,p_page_mode=>'NORMAL'
,p_step_title=>'Two Level Tabs with Sidebar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style  type="text/css">',
'.htmldbRegionOutline{',
'border:1px dashed #DDDDDD;',
'background-color:#EEEEEE;',
'padding:2px;',
'margin:2px;',
'text-align:center;',
'}',
'</style>'))
,p_step_template=>wwv_flow_api.id(1307117327685183860)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970921092288680071)
,p_plug_name=>'Region Postion 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Postion 3</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Customize'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970921260358680074)
,p_plug_name=>'Region Postion 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 4</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970921461628680075)
,p_plug_name=>'Region Postion 7'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 7</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970921689289680076)
,p_plug_name=>'Region Postion 8'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 8</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970921889427680077)
,p_plug_name=>'Page Template Body (3)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (3)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970922069767680081)
,p_plug_name=>'Region Postion 6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 6</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970922282086680081)
,p_plug_name=>'Region Position 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Position 2</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970922475316680082)
,p_plug_name=>'Page Template Body (2)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (2)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970922678244680082)
,p_plug_name=>'Region Postion 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 5</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970922865672680083)
,p_plug_name=>'After Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_source=>'<div class="htmldbRegionOutline">After Header</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970923069669680083)
,p_plug_name=>'Page Template Body (1)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (1)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6235105364057239144)
,p_plug_name=>'Before Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_source=>'<div class="htmldbRegionOutline">Before Footer</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00214
begin
wwv_flow_api.create_page(
 p_id=>214
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'No Tabs'
,p_page_mode=>'NORMAL'
,p_step_title=>'No Tabs'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style  type="text/css">',
'.htmldbRegionOutline{',
'border:1px dashed #DDDDDD;',
'background-color:#EEEEEE;',
'padding:2px;',
'margin:2px;',
'text-align:center;',
'white-space:nowrap;',
'}',
'</style>'))
,p_step_template=>wwv_flow_api.id(1307115245182183858)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970925370393695533)
,p_plug_name=>'Region Postion 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Postion 3</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Customize'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970925567232695534)
,p_plug_name=>'Region Postion 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 4</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970925760928695534)
,p_plug_name=>'Region Postion 7'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 7</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970925973864695535)
,p_plug_name=>'Region Postion 8'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 8</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970926175107695536)
,p_plug_name=>'Page Template Body (3)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (3)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970926373535695540)
,p_plug_name=>'Region Postion 6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 6</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970926588862695540)
,p_plug_name=>'Region Position 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Position 2</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970926764887695541)
,p_plug_name=>'Page Template Body (2)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (2)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970926990006695541)
,p_plug_name=>'Region Postion 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 5</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970927174616695542)
,p_plug_name=>'After Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_source=>'<div class="htmldbRegionOutline">After Header</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970927370555695542)
,p_plug_name=>'Page Template Body (1)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (1)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6235108650682244759)
,p_plug_name=>'Before Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_source=>'<div class="htmldbRegionOutline">Before Footer</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00215
begin
wwv_flow_api.create_page(
 p_id=>215
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'No Tabs with Sidebar'
,p_page_mode=>'NORMAL'
,p_step_title=>'No Tabs with Sidebar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style  type="text/css">',
'.htmldbRegionOutline{',
'border:1px dashed #DDDDDD;',
'background-color:#EEEEEE;',
'padding:2px;',
'margin:2px;',
'text-align:center;',
'}',
'</style>'))
,p_step_template=>wwv_flow_api.id(1307115538164183858)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970929874873704700)
,p_plug_name=>'Region Postion 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Postion 3</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Customize'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970930084586704701)
,p_plug_name=>'Region Postion 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 4</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970930272144704701)
,p_plug_name=>'Region Postion 7'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 7</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970930486795704702)
,p_plug_name=>'Region Postion 8'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 8</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970930678328704702)
,p_plug_name=>'Page Template Body (3)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (3)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970930871942704703)
,p_plug_name=>'Region Postion 6'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 6</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970931086075704705)
,p_plug_name=>'Region Position 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<div class="htmldbRegionOutline" style="width:200px;">Region Position 2</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970931288150704706)
,p_plug_name=>'Page Template Body (2)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (2)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970931475771704706)
,p_plug_name=>'Region Postion 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 5</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970931688535704707)
,p_plug_name=>'After Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_source=>'<div class="htmldbRegionOutline">After Header</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970931886508704707)
,p_plug_name=>'Page Template Body (1)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_source=>'<div class="htmldbRegionOutline">Page Template Body (1)</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5970932065035704708)
,p_plug_name=>'Region 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<div class="htmldbRegionOutline">Region Postion 1</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6235111441117251429)
,p_plug_name=>'Before Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_source=>'<div class="htmldbRegionOutline">Before Footer</div>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00310
begin
wwv_flow_api.create_page(
 p_id=>310
,p_user_interface_id=>wwv_flow_api.id(186736402974840064)
,p_tab_set=>'TS1'
,p_name=>'No Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
,p_page_mode=>'NORMAL'
,p_step_title=>'No Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1307115538164183858)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1334007037295742148)
,p_plug_name=>'Left Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307123843367183866)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1334007243282742149)
,p_plug_name=>'Center Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307122946604183866)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(1334007435626742149)
,p_plug_name=>'Right Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1307124143912183867)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1334010022048750987)
,p_plug_name=>'Page Layout'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1307121142734183864)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_list_id=>wwv_flow_api.id(5970907387193499797)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1307129242282183872)
,p_plug_query_row_template=>1
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
