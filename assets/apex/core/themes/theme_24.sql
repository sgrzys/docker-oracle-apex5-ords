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
,p_default_application_id=>108824
,p_default_owner=>'THEME_DEV'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 108824 - Theme: Cloudy
--
-- Application Export:
--   Application:     108824
--   Name:            Theme: Cloudy
--   Exported By:     APEX_050000
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.0.00.32
--   Instance ID:     69332573836388
--

-- Application Statistics:
--   Pages:                     61
--     Items:                  114
--     Computations:             3
--     Validations:             22
--     Processes:               80
--     Regions:                254
--     Buttons:                182
--   Shared Components:
--     Logic:
--       Items:                  2
--     Navigation:
--       Parent Tabs:            2
--       Tab Sets:               2
--         Tabs:                16
--       Lists:                 11
--       Breadcrumbs:            1
--         Entries:             46
--       Trees:                  1
--       NavBar Entries:         4
--     Security:
--       Authentication:         3
--       Authorization:          3
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                18
--         Region:              34
--         Label:                6
--         List:                17
--         Popup LOV:            1
--         Calendar:             3
--         Breadcrumb:           2
--         Button:               7
--         Report:              11
--       LOVs:                   7
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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,108824)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'THEME_DEV')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Theme: Cloudy')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F108824')
,p_application_group=>3931220191679794
,p_application_group_name=>'Theme Work'
,p_page_view_logging=>'YES'
,p_checksum_salt_last_reset=>'20150407120750'
,p_bookmark_checksum_function=>'MD5'
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'4.1'
,p_flow_language=>'en-us'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Created 08/12/2004 11:25:08 AM'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(5820287076806998044)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:Theme 24 - Cloudy'
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
,p_last_upd_yyyymmddhh24miss=>'20150407120750'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5820178505573957163)
,p_name=>'wizard progress bar 38, 39, 40'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820178674505957163)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Step 1'
,p_list_item_link_target=>'f?p=&APP_ID.:38:&SESSION.:'
,p_list_item_current_for_pages=>'38'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820179001449957164)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Step 2'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.:'
,p_list_item_current_for_pages=>'39'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820179297424957164)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Step 3 and Final'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.:'
,p_list_item_current_for_pages=>'40'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5820938487026083318)
,p_name=>'Long List (progress test)'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820938674764083319)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Start'
,p_list_item_link_target=>'f?p=&APP_ID.:46:&SESSION.:'
,p_list_item_current_for_pages=>'46'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820938975453083321)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Progress Train'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820939277385083322)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Continue Progress'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820939588804083322)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Really long progress indicator designed to show off support for long text'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820939895215083322)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Yet more progress'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5820941900878087300)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Complete'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9408698634690650962)
,p_name=>'Calendar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9408699044041653642)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'23'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9408699318545655707)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Calendar Alt 1'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'24'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9408699623393657156)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Small Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'22'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9548020307523723221)
,p_name=>'Page Templates'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548020984451725967)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'One Level Tabs'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548021589992727616)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'One Level Tabs with Sidebar'
,p_list_item_link_target=>'f?p=&APP_ID.:211:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548022294494728855)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'Two Level Tabs'
,p_list_item_link_target=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548022700035730492)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'Two Level Tabs With Sidebar'
,p_list_item_link_target=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548023104537731830)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'No Tabs'
,p_list_item_link_target=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548024382504734936)
,p_list_item_display_sequence=>6
,p_list_item_link_text=>'No Tabs With Sidebar'
,p_list_item_link_target=>'f?p=&APP_ID.:215:&SESSION.::&DEBUG.:RP:::'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9548615900422445928)
,p_name=>'MultiLevel'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548616408734448249)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Parent 1'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'menu/addresses_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548616682892450250)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Parent 2'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'menu/app_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548618001246455569)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Child 2.1'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548616682892450250)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548618304016456431)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Child 2.2'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548616682892450250)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548618607826457539)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Child 2.3'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548616682892450250)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548617292588453134)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Parent 3'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'menu/biz_user_red_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548619183369459874)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Child 3.1'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548617292588453134)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548619586832460894)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Child 3.2'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548617292588453134)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548619891334462216)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Child 3.2.1'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548619586832460894)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548622383500469413)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Child 3.2.2'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548619586832460894)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548620499299464513)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Child 3.3'
,p_list_item_link_target=>'#'
,p_parent_list_item_id=>wwv_flow_api.id(9548617292588453134)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9548633385887517433)
,p_name=>'DHTML Select'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548634208050523785)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'DHTML Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DTREE:&DEBUG.::::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548633900778521680)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tree List'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:TREE:&DEBUG.:RP:::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548634482901525946)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Menu with Sub List'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DMENU:&DEBUG.::::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548634790866528283)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Menu (Images) with sublist'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DIMENU:&DEBUG.::::'
,p_list_item_icon=>'menu/blank_bx_128x128.png'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9549827036048580010)
,p_name=>'Template Type'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548444500647444414)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Buttons'
,p_list_item_link_target=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'32'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9408681814905266714)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9549828836872589696)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Label'
,p_list_item_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'202'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9549829107913590812)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'List'
,p_list_item_link_target=>'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'205'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9549829413454592397)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Menu'
,p_list_item_link_target=>'f?p=&APP_ID.:206:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'206'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9548610691156424302)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Multi Level Lists (This Label is on Multiple Lines)'
,p_list_item_link_target=>'f?p=&APP_ID.:120:&SESSION.:DMENU:&DEBUG.::::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'120'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9549828227868587073)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Region'
,p_list_item_link_target=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'201'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9549828532716588469)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Report'
,p_list_item_link_target=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'themes/theme_13/iconwizard.gif'
,p_list_item_icon_attributes=>'alt=""'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'204'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9849121245520624273)
,p_name=>'Tasks'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9873766846331101771)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'About this Application'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9874119551662989300)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Enter a New Order'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9849121649676625453)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Add a New Customer'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9849384233932434653)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Add a New Product'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:::'
,p_security_scheme=>wwv_flow_api.id(9849333653559232147)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9849202042937737042)
,p_name=>'Administration'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9850349225627676378)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Charts'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9849202446400738102)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Manage Users'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8,9'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9865982547369221399)
,p_name=>'Order Wizard'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9865982953256223069)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Select a Customer'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9865992326076253035)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Select Items'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9873887148538162183)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Place Order'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'14'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9877243335706938046)
,p_name=>'Chart Tabs'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9877244243671940341)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Cluster Bar'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9877253129519964657)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Pie Chart'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9877253433675965888)
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
 p_id=>wwv_flow_api.id(24045814653053452)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1765089926296712077)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(9849333653559232147)
,p_name=>'Edit Products'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>'select 1 from demo_users where user_name = :APP_USER and products = ''Y'''
,p_error_message=>'You are not authorized to edit Product Information.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(9850137028596765921)
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
 p_id=>wwv_flow_api.id(9877222247125865692)
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
 p_id=>wwv_flow_api.id(8956574020767862158)
,p_icon_sequence=>10
,p_icon_subtext=>'Feedback'
,p_icon_target=>'javascript:popupURL(''f?p=&APP_ID.:102:::102'');'
,p_nav_entry_is_feedback_yn=>'Y'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(9848750839298633973)
,p_icon_sequence=>20
,p_icon_subtext=>'Print'
,p_icon_target=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::::YES'
,p_icon_image_alt=>'Print'
,p_nav_entry_is_feedback_yn=>'N'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(5818842992344180682)
,p_icon_sequence=>30
,p_icon_subtext=>'Search'
,p_icon_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(9848750737834633972)
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
 p_id=>wwv_flow_api.id(9848751324621634128)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_item_comment=>'Used by Custom2 authentication for deep linking support'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9878977339556236596)
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
 p_id=>wwv_flow_api.id(8952781643374373515)
,p_tab_set=>'PageTemplates'
,p_tab_sequence=>10
,p_tab_name=>'T_MYTAB'
,p_tab_text=>'mytab'
,p_tab_step=>19
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(9848750253866633966)
,p_tab_set=>'TS1'
,p_tab_sequence=>1
,p_tab_name=>'T_HOME'
,p_tab_text=>'Home'
,p_tab_step=>1
,p_tab_also_current_for_pages=>'15'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(9848750334702633970)
,p_tab_set=>'TS1'
,p_tab_sequence=>2
,p_tab_name=>'T_CUSTOMERS'
,p_tab_text=>'Cust'
,p_tab_step=>2
,p_tab_also_current_for_pages=>'7'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(9848750453877633971)
,p_tab_set=>'TS1'
,p_tab_sequence=>3
,p_tab_name=>'T_PRODUCTS'
,p_tab_text=>'Prod'
,p_tab_step=>3
,p_tab_also_current_for_pages=>'6,10,21'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(9848750527944633971)
,p_tab_set=>'TS1'
,p_tab_sequence=>4
,p_tab_name=>'T_ORDERS'
,p_tab_text=>'Orders'
,p_tab_step=>4
,p_tab_also_current_for_pages=>'11,12,13,14,29,14'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(9848750634160633972)
,p_tab_set=>'TS1'
,p_tab_sequence=>5
,p_tab_name=>'T_CHARTS'
,p_tab_text=>'Charts'
,p_tab_step=>5
,p_tab_also_current_for_pages=>'16,17,17'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(9877278552123027933)
,p_tab_set=>'TS1'
,p_tab_sequence=>15
,p_tab_name=>'T_ADMIN'
,p_tab_text=>'Admin'
,p_tab_step=>8
,p_tab_also_current_for_pages=>'9'
,p_tab_parent_tabset=>'Page Templates2'
,p_security_scheme=>wwv_flow_api.id(9877222247125865692)
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(9549818828140331693)
,p_tab_set=>'TS1'
,p_tab_sequence=>25
,p_tab_name=>'T_TEMPLATES'
,p_tab_text=>'Theme'
,p_tab_step=>200
,p_tab_also_current_for_pages=>'19,200,201,202,204,205,206,214,215,32,120,213,212,22,23,24,25,26'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(8390734862863902095)
,p_tab_set=>'TS1'
,p_tab_sequence=>35
,p_tab_name=>'T_RDS'
,p_tab_text=>'RDS'
,p_tab_step=>18
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5819917385261341539)
,p_tab_set=>'TS1'
,p_tab_sequence=>45
,p_tab_name=>'Cal'
,p_tab_text=>'Cal'
,p_tab_step=>34
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5820160477528728717)
,p_tab_set=>'TS1'
,p_tab_sequence=>55
,p_tab_name=>'T_PORTAL'
,p_tab_text=>'Portal'
,p_tab_step=>35
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5820162004623783039)
,p_tab_set=>'TS1'
,p_tab_sequence=>65
,p_tab_name=>'T_TREE'
,p_tab_text=>'Tree'
,p_tab_step=>36
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5820162474257787251)
,p_tab_set=>'TS1'
,p_tab_sequence=>75
,p_tab_name=>'T_SEARCH'
,p_tab_text=>'Search'
,p_tab_step=>28
,p_tab_also_current_for_pages=>'33'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5820165873594811387)
,p_tab_set=>'TS1'
,p_tab_sequence=>85
,p_tab_name=>'T_POP'
,p_tab_text=>'Pop'
,p_tab_step=>37
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5820170382844816251)
,p_tab_set=>'TS1'
,p_tab_sequence=>95
,p_tab_name=>'Wiz'
,p_tab_text=>'Wiz'
,p_tab_step=>38
,p_tab_also_current_for_pages=>'39,40,46'
,p_tab_parent_tabset=>'Page Templates2'
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(5820174093023861039)
,p_tab_set=>'TS1'
,p_tab_sequence=>105
,p_tab_name=>'Form'
,p_tab_text=>'Form'
,p_tab_step=>43
,p_tab_also_current_for_pages=>'41'
,p_tab_parent_tabset=>'Page Templates2'
);
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
wwv_flow_api.create_toplevel_tab(
 p_id=>wwv_flow_api.id(9548064586763218652)
,p_tab_set=>'Page Templates2'
,p_tab_sequence=>10
,p_tab_name=>'T_PARENTTABTEST2'
,p_tab_text=>'Parent&nbsp;Tab&nbsp;Test&nbsp;2'
,p_tab_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_current_on_tabset=>'TS1'
);
wwv_flow_api.create_toplevel_tab(
 p_id=>wwv_flow_api.id(9548061608247200836)
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
 p_id=>wwv_flow_api.id(9849675528885994474)
,p_lov_name=>'CATEGORIES'
,p_lov_query=>'.'||wwv_flow_api.id(9849675528885994474)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9849675846558994477)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Phones'
,p_lov_return_value=>'Phones'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9849676048033994479)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Computer'
,p_lov_return_value=>'Computer'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9849676223186994479)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Audio'
,p_lov_return_value=>'Audio'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9849676440050994479)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Video'
,p_lov_return_value=>'Video'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5818846305597241234)
,p_lov_name=>'EXAMPLE SEARCH SHOW OPTIONS'
,p_lov_query=>'.'||wwv_flow_api.id(5818846305597241234)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5818846481838241236)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Report pages'
,p_lov_return_value=>'R'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5818846702944241237)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Form pages'
,p_lov_return_value=>'F'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5818846874240241237)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Chart pages'
,p_lov_return_value=>'C'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5818847082728241237)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Home page'
,p_lov_return_value=>'H'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5818847296273241237)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Other'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(3725445166235088048)
,p_lov_name=>'P204_Report Row Per Page'
,p_lov_query=>'.'||wwv_flow_api.id(3725445166235088048)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725445443974088049)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'10'
,p_lov_return_value=>'10'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725445637456088050)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'15'
,p_lov_return_value=>'15'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725445863399088050)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'20'
,p_lov_return_value=>'20'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725446044386088050)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'30'
,p_lov_return_value=>'30'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725446261107088050)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'50'
,p_lov_return_value=>'50'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725446441459088050)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'100'
,p_lov_return_value=>'100'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725446639546088050)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'200'
,p_lov_return_value=>'200'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725446851048088050)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'500'
,p_lov_return_value=>'500'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725447034472088050)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'1000'
,p_lov_return_value=>'1000'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3725447237638088050)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'5000'
,p_lov_return_value=>'5000'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9850959822003489075)
,p_lov_name=>'PRODUCTS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_name d, product_id r from demo_product_info',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9873824050673566717)
,p_lov_name=>'PRODUCTS WITH PRICE'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_name || '' [$'' || list_price || '']'' d, product_id r from demo_product_info',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9850227322905452429)
,p_lov_name=>'STATES'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select initcap(state_name) display_value, st return_value from   demo_states',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9849328646848220812)
,p_lov_name=>'Y OR N'
,p_lov_query=>'.'||wwv_flow_api.id(9849328646848220812)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9849328937868220815)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Y'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(9849329147589220817)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'N'
,p_lov_return_value=>'N'
);
end;
/
prompt --application/shared_components/navigation/trees
begin
wwv_flow_api.create_tree(
 p_id=>wwv_flow_api.id(9885634952729028370)
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
 p_id=>wwv_flow_api.id(9849008539194215590)
,p_name=>'Main Menu'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5818842693725177476)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Search'
,p_link=>'f?p=&FLOW_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5818844203667187910)
,p_parent_id=>wwv_flow_api.id(5818842693725177476)
,p_short_name=>'Search Results'
,p_link=>'f?p=&FLOW_ID.:33:&SESSION.'
,p_page_id=>33
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5819923605803380560)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Calendar Test'
,p_link=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820160796582728718)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Portal'
,p_link=>'f?p=&FLOW_ID.:35:&SESSION.'
,p_page_id=>35
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820162299414783039)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Tree'
,p_link=>'f?p=&FLOW_ID.:36:&SESSION.'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820166185446811387)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Pop'
,p_link=>'f?p=&FLOW_ID.:37:&SESSION.'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820173488610844318)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Wizard Step 1'
,p_link=>'f?p=&FLOW_ID.:38:&SESSION.'
,p_page_id=>38
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820177985929861072)
,p_parent_id=>wwv_flow_api.id(5820218482899418671)
,p_short_name=>'Edit Employee'
,p_link=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::'
,p_page_id=>41
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820184677846092381)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Step 3'
,p_link=>'f?p=&FLOW_ID.:40:&SESSION.'
,p_page_id=>40
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820185204575095143)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Step 2'
,p_link=>'f?p=&FLOW_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820218482899418671)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Employees'
,p_link=>'f?p=&FLOW_ID.:43:&SESSION.'
,p_page_id=>43
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5820937399548063247)
,p_parent_id=>wwv_flow_api.id(5820173488610844318)
,p_short_name=>'Long Progress List'
,p_link=>'f?p=&FLOW_ID.:46:&SESSION.'
,p_page_id=>46
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5821050205676509576)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'Multi Level Lists'
,p_link=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:::'
,p_page_id=>120
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8390735165274902095)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Region Display Selector'
,p_link=>'f?p=&FLOW_ID.:18:&SESSION.'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8952739650364433140)
,p_parent_id=>0
,p_short_name=>'test'
,p_link=>'f?p=&FLOW_ID.:100:&SESSION.'
,p_page_id=>100
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9191184361238433627)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'No Tabs With Sidebar'
,p_link=>'f?p=&APP_ID.:215:&SESSION.::&DEBUG.:::'
,p_page_id=>215
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9191417755551345805)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Report'
,p_link=>'f?p=&FLOW_ID.:21:&SESSION.'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9191718649518158815)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'Two Level Tabs with Sidebar'
,p_link=>'f?p=&FLOW_ID.:213:&SESSION.'
,p_page_id=>213
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9410149936933516504)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'No Tabs'
,p_link=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:::'
,p_page_id=>214
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9410188214277542243)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'One Level Tabs'
,p_link=>'f?p=&FLOW_ID.:210:&SESSION.'
,p_page_id=>210
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9410352031289564744)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'One Level Tabs with Sidebar'
,p_link=>'f?p=&FLOW_ID.:211:&SESSION.'
,p_page_id=>211
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9547967609845561897)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'Menu Templates'
,p_link=>'f?p=&APP_ID.:206:&SESSION.::&DEBUG.:::'
,p_page_id=>206
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9547973601206581052)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Template Index'
,p_link=>'f?p=&FLOW_ID.:200:&SESSION.'
,p_page_id=>200
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9547975911545591451)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'Label Templates'
,p_link=>'f?p=&FLOW_ID.:202:&SESSION.'
,p_page_id=>202
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9547978097743597902)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'List Templates'
,p_link=>'f?p=&APP_ID.:205:&SESSION.::&DEBUG.:::'
,p_page_id=>205
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9547997412333682287)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'Region Templates'
,p_link=>'f?p=&FLOW_ID.:201:&SESSION.'
,p_page_id=>201
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9548000289688692787)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'Report Templates'
,p_link=>'f?p=&FLOW_ID.:204:&SESSION.'
,p_page_id=>204
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9548460589800655277)
,p_parent_id=>wwv_flow_api.id(9547973601206581052)
,p_short_name=>'Button Templates'
,p_link=>'f?p=&FLOW_ID.:32:&SESSION.'
,p_page_id=>32
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849012334476223702)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849067831490582348)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Customers'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849072651361597553)
,p_parent_id=>wwv_flow_api.id(9849067831490582348)
,p_short_name=>'Add/Modify Customers'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849200226660732425)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Admin'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849394034110472588)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Products'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849394340343474418)
,p_parent_id=>wwv_flow_api.id(9849394034110472588)
,p_short_name=>'Add/Modify Products'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849512522204809730)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Orders'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9849605226218425952)
,p_parent_id=>wwv_flow_api.id(9849394340343474418)
,p_short_name=>'Add Product Image'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9850120721661688165)
,p_parent_id=>wwv_flow_api.id(9849512522204809730)
,p_short_name=>'View/Modify Orders'
,p_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9865976543943173072)
,p_parent_id=>wwv_flow_api.id(9849512522204809730)
,p_short_name=>'Enter New Order'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9866041140031389528)
,p_parent_id=>wwv_flow_api.id(9849512522204809730)
,p_short_name=>'Enter New Order'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9874063425306678893)
,p_parent_id=>wwv_flow_api.id(9849512522204809730)
,p_short_name=>'Enter New Order'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9877353632664192643)
,p_parent_id=>wwv_flow_api.id(9849200226660732425)
,p_short_name=>'Reset Password'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9877355540975195097)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'Charts'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>0
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9877357526908200511)
,p_parent_id=>wwv_flow_api.id(9877355540975195097)
,p_short_name=>'Cluster Bar'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9877358534180202584)
,p_parent_id=>wwv_flow_api.id(9877355540975195097)
,p_short_name=>'Pie Chart'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9877389935406316517)
,p_parent_id=>wwv_flow_api.id(9877355540975195097)
,p_short_name=>'Stacked Bar'
,p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9885627336323014214)
,p_parent_id=>wwv_flow_api.id(9849012334476223702)
,p_short_name=>'About this Application'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(386622894318240528)
,p_theme_id=>24
,p_name=>'Dialog'
,p_is_popup=>true
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD# id="uPopup">',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer" role="dialog" aria-label="#TITLE#">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uMidCol">',
'  #REGION_POSITION_01#',
'  #REGION_POSITION_02#',
'  #BODY#',
'  #REGION_POSITION_04#',
'  #REGION_POSITION_05#',
'  #REGION_POSITION_06#',
'  #REGION_POSITION_07#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>4
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.close(#IS_MODAL#);'
,p_dialog_height=>'500'
,p_dialog_width=>'600'
,p_dialog_max_width=>'1000'
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067249494695038)
,p_theme_id=>24
,p_name=>'Login'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD# id="uLogin">',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="uLoginContainer">',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  #REGION_POSITION_02#',
'  #BODY#',
'  #REGION_POSITION_03#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uSingleAlertMessage red" id="uNotificationMessage">',
'	<p>#MESSAGE#</p>',
'	<a href="javascript:void(0)" class="closeMessage" onclick="$x_Remove(''uNotificationMessage'')"></a>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0"'
,p_theme_class_id=>6
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
,p_template_comment=>'18'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067333434695039)
,p_theme_id=>24
,p_name=>'No Tabs - Left Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        <li><span>#WELCOME_USER#</span></li>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uLeftCol">',
'    <aside>',
'    #REGION_POSITION_02#',
'    </aside>',
'  </td>',
'  <td id="uMidCol">',
'    #BODY#',
'    #REGION_POSITION_03#',
'  </td>',
'</tr></table>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067444836695040)
,p_theme_id=>24
,p_name=>'No Tabs - Left and Right Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<table id="uPageCols" class="uThreeCol"><tr>',
'  <td id="uLeftCol">',
'    <aside>',
'    #REGION_POSITION_02#',
'    </aside>',
'  </td>',
'  <td id="uMidCol">',
'    #BODY#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067553254695040)
,p_theme_id=>24
,p_name=>'No Tabs - No Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uOneCol">',
'  #REGION_POSITION_02#',
'  #BODY#',
'  #REGION_POSITION_03#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uNoHeading uErrorRegion">',
'  <div class="uRegionContent">',
'    <p><strong>#MESSAGE#</strong></p>',
'    <p>#ADDITIONAL_INFO#</p>',
'    <div class="uErrorTechInfo">#TECHNICAL_INFO#</div>',
'  </div>',
'  <div class="uRegionHeading">',
'    <span class="uButtonContainer">',
'      <a href="#BACK_LINK#" class="uButtonLarge uHotButton"><span>#OK#</span></a>',
'    </span>',
'  </div>',
'</section>'))
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067655690695040)
,p_theme_id=>24
,p_name=>'No Tabs - Right Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uMidCol">',
'    #REGION_POSITION_02#',
'    #BODY#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067732264695040)
,p_theme_id=>24
,p_name=>'One Level Tabs - Left Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uTwoColumns">',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uLeftCol">',
'    <aside>',
'    #REGION_POSITION_02#',
'    </aside>',
'  </td>',
'  <td id="uMidCol">',
'    #BODY#',
'    #REGION_POSITION_03#',
'  </td>',
'</tr></table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067855509695040)
,p_theme_id=>24
,p_name=>'One Level Tabs - Left and Right Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uThreeColumns">',
'<table id="uPageCols" class="uThreeCol"><tr>',
'  <td id="uLeftCol">',
'    <aside>',
'    #REGION_POSITION_02#',
'    </aside>',
'  </td>',
'  <td id="uMidCol">',
'    #BODY#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_current_tab=>'<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866067945585695041)
,p_theme_id=>24
,p_name=>'One Level Tabs - No Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uOneCol">',
'  #REGION_POSITION_02#',
'  #BODY#',
'  #REGION_POSITION_03#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068033412695041)
,p_theme_id=>24
,p_name=>'One Level Tabs - Right Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uTwoColumns">',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uMidCol">',
'    #REGION_POSITION_02#',
'    #BODY#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068132870695041)
,p_theme_id=>24
,p_name=>'One Level Tabs - Wizard Page'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uOneCol">',
'',
'<div class="cWizard">',
'	<div class="cWizardHeader">',
'		#REGION_POSITION_02#',
'	</div>',
'    <div class="cWizardContentContainer">',
'    <div class="cWizardContent">',
'        #BODY##REGION_POSITION_03#',
'    </div>',
'    <div class="clear"></div>',
'</div>',
'',
'</div>',
''))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>8
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068245660695041)
,p_theme_id=>24
,p_name=>'Popup'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD# id="uPopup">',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uMidCol">',
'  #REGION_POSITION_01#',
'  #REGION_POSITION_02#',
'  #BODY#',
'  #REGION_POSITION_04#',
'  #REGION_POSITION_05#',
'  #REGION_POSITION_06#',
'  #REGION_POSITION_07#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>4
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068330690695041)
,p_theme_id=>24
,p_name=>'Printer Friendly'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD# id="uPrinterFriendly">',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  #REGION_POSITION_01#',
'  #REGION_POSITION_04#',
'</header>',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uOneCol">',
'  #REGION_POSITION_02#',
'  #BODY#',
'  #REGION_POSITION_03#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>5
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
,p_template_comment=>'3'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068447599695041)
,p_theme_id=>24
,p_name=>'Two Level Tabs - Left Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <div class="uParentTabs">',
'    <ul>',
'      #PARENT_TAB_CELLS#',
'    </ul>',
'  </div>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uTwoColumns">',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uLeftCol">',
'    <aside>',
'    #REGION_POSITION_02#',
'    </aside>',
'  </td>',
'  <td id="uMidCol">',
'    #BODY#',
'    #REGION_POSITION_03#',
'  </td>',
'</tr></table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_non_curr_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068537156695041)
,p_theme_id=>24
,p_name=>'Two Level Tabs - Left and Right Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <div class="uParentTabs">',
'    <ul>',
'      #PARENT_TAB_CELLS#',
'    </ul>',
'  </div>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uThreeColumns">',
'<table id="uPageCols" class="uThreeCol"><tr>',
'  <td id="uLeftCol">',
'    <aside>',
'    #REGION_POSITION_02#',
'    </aside>',
'  </td>',
'  <td id="uMidCol">',
'    #BODY#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_current_tab=>'<li><a class="active" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_current_tab=>'<li class="active"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_non_curr_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068643533695041)
,p_theme_id=>24
,p_name=>'Two Level Tabs - No Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <div class="uParentTabs">',
'    <ul>',
'      #PARENT_TAB_CELLS#',
'    </ul>',
'  </div>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uOneCol">',
'  #REGION_POSITION_02#',
'  #BODY#',
'  #REGION_POSITION_03#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
'</div>'))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_non_curr_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>2
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6866068747353695042)
,p_theme_id=>24
,p_name=>'Two Level Tabs - Right Sidebar'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <div class="uParentTabs">',
'    <ul>',
'      #PARENT_TAB_CELLS#',
'    </ul>',
'  </div>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uTwoColumns">',
'<table id="uPageCols" class="uTwoCol"><tr>',
'  <td id="uMidCol">',
'    #REGION_POSITION_02#',
'    #BODY#',
'  </td>',
'  <td id="uRightCol">',
'    <aside>',
'    #REGION_POSITION_03#',
'    </aside>',
'  </td>',
'</tr></table>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'<div id="uHiddenItems">',
'  #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_top_non_curr_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>2
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7331486344805587694)
,p_theme_id=>24
,p_name=>'One Level Tabs - Content Frame'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<!--[if lt IE 7 ]> <html class="ie6 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7 ]>    <html class="ie7 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8 ]>    <html class="ie8 no-css3" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9 ]>    <html class="ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if (gt IE 9)|!(IE)]><!--> <html lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'',
'<head>',
'',
'  <meta charset="UTF-8">',
'  ',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
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
'  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css">',
'  <script src="#THEME_IMAGES#js/4_1.js"></script>',
'</head>',
'<body #ONLOAD#>',
'  <!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'  #FORM_OPEN#',
'  <div id="uBodyContainer">'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<header id="uHeader">',
'  #REGION_POSITION_07#',
'  <hgroup>',
'    <a href="#HOME_LINK#" id="uLogo">#LOGO#</a>',
'    <div class="uAPEXNavBar">',
'      <ul>',
'        #NAVIGATION_BAR#',
'      </ul>',
'    </div>',
'    #REGION_POSITION_08#',
'  </hgroup>',
'  <nav>',
'    <ul>',
'      #TAB_CELLS#',
'    </ul>',
'  </nav>',
'  #REGION_POSITION_04#',
'</header>',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'<div id="uOneCol">',
'<section class="uRegion uRegionNoPadding clearfix uRegionFrame">',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'		#REGION_POSITION_02#',
'    </span>',
'  </div>',
'  <div class="uFrameContent">',
'	<div class="uFrameMain">',
'		#BODY#',
'	</div>',
'	<div class="uFrameSide">',
'		#REGION_POSITION_03#',
'	</div>',
'  </div>',
'</section>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<footer id="uFooter">',
'  <div class="uFooterContent">',
'    <div id="customize">#CUSTOMIZE#</div>',
'    #REGION_POSITION_05#',
'    #APP_VERSION#',
'  </div>',
'  <div class="uFooterBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</footer>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uSuccessMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uSuccessMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uCheckmarkIcon" alt="" />',
'    <div class="uMessageText">',
'      #SUCCESS_MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_current_tab=>'<li><a href="#TAB_LINK#" class="active">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_non_current_tab=>'<li><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</li>'
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uMessageRegion clearfix" id="uNotificationMessage">',
'  <div class="uRegionContent clearfix">',
'    <a href="javascript:void(0)" onclick="$x_Remove(''uNotificationMessage'')" class="uCloseMessage"></a>',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uWarningIcon" alt="" />',
'    <div class="uMessageText">',
'      #MESSAGE#',
'    </div>',
'  </div>',
'</section>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<li><a href="#LINK#">#TEXT#</a>#EDIT#</li>'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_grid_type=>'TABLE'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(3791847543330)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_template=>'<input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>'<input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_template_comment=>'5.0 upgrade'
,p_theme_id=>24
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(6866074553808695058)
,p_template_name=>'Button'
,p_template=>'<a href="#LINK#" class="uButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_hot_template=>'<a href="#LINK#" class="uButton uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>24
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(6866074640645695061)
,p_template_name=>'Interactive Report Button'
,p_template=>'<a href="#LINK#" class="uButtonIR #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_hot_template=>'<a href="#LINK#" class="uButtonIR uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_translate_this_template=>'N'
,p_theme_class_id=>2
,p_theme_id=>24
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(6866074732178695061)
,p_template_name=>'Large Button'
,p_template=>'<a href="#LINK#" class="uButtonLarge #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_hot_template=>'<a href="#LINK#" class="uButtonLarge uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_template_comment=>'Standard Button'
,p_theme_id=>24
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(6866074858076695061)
,p_template_name=>'Small Button'
,p_template=>'<a href="#LINK#" class="uButtonSmall #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_hot_template=>'<a href="#LINK#" class="uButtonSmall uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>24
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(7333071134004754916)
,p_template_name=>'[ + ] Add Button'
,p_template=>'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" title="#LABEL#" class="addIcon" /></a>'
,p_hot_template=>'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" title="#LABEL#" class="addIcon"/></a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>24
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(7343353056045245405)
,p_template_name=>'[ Text ] Button'
,p_template=>'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a>'
,p_hot_template=>'<a href="#LINK#" class="uIconButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>24
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866068854740695042)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uBorderlessRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Borderless Region'
,p_theme_id=>24
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Use this region template when you want to contain content without a border.',
'',
'TITLE=YES',
'BUTTONS=YES',
'100% WIDTH=NO'))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866068955067695046)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uBracketedRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Bracketed Region'
,p_theme_id=>24
,p_theme_class_id=>18
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Use this region template when you want to contain content with a bracket UI.',
'',
'TITLE=YES',
'BUTTONS=YES',
'100% WIDTH=NO'))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069031066695046)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="uBreadcrumbs" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="uBreadcrumbsBG">',
'    <div class="uLeft"></div>',
'    <div class="uRight"></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Breadcrumb Region'
,p_theme_id=>24
,p_theme_class_id=>6
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069153659695046)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uButtonRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uButtonRegionContentContainer">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'</section>',
''))
,p_page_plug_template_name=>'Button Region with Title'
,p_theme_id=>24
,p_theme_class_id=>4
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069258920695046)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uButtonRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uButtonRegionContentContainer">',
'    <div class="uButtonRegionContent">#BODY#</div>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'</section>',
''))
,p_page_plug_template_name=>'Button Region without Title'
,p_theme_id=>24
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069329330695046)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Chart List'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069436351695046)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Chart Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>30
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069537100695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Form Region'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>24
,p_theme_class_id=>8
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069651354695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uHideShowRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>',
'      <a href="javascript:void(0)" class="uRegionControl"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>',
'      #TITLE#',
'    </h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Hide and Show Region'
,p_theme_id=>24
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069748753695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uBorderlessRegion uHideShowRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>',
'      <a href="javascript:void(0)" class="uRegionControl"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>',
'      #TITLE#',
'    </h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Hide and Show Region - Borderless'
,p_theme_id=>24
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069854126695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">',
'    #BODY#',
'</div>'))
,p_page_plug_template_name=>'IRR Region Template'
,p_theme_id=>24
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866069954347695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Navigation Region'
,p_theme_id=>24
,p_theme_class_id=>5
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070055963695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Navigation Region - Heading Inside'
,p_theme_id=>24
,p_theme_class_id=>16
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070154468695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uNoHeading #REGION_CSS_CLASSES# clearfix">',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>',
''))
,p_page_plug_template_name=>'Region without Buttons and Titles'
,p_theme_id=>24
,p_theme_class_id=>19
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070259517695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uNoHeading #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Region without Title'
,p_theme_id=>24
,p_theme_class_id=>11
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070335822695047)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uButtonRegion uNoHeading uReportFilter #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    <div class="uReportFilterRow">',
'    <img src="#IMAGE_PREFIX#f_spacer.gif" class="uSearchIcon" alt="" />',
'    #BODY#',
'    </div>',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Report Filter - Single Row'
,p_theme_id=>24
,p_theme_class_id=>31
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070430125695048)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Report List'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070529299695048)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Reports Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070636174695048)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uRegionNoPadding #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Reports Region - 100% Width'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>13
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070758559695048)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Reports Region - Heading Inside'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>10
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070841457695051)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Sidebar Region'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>24
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table border="0" cellpadding="0" cellspacing="0">',
'        <tr>',
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>',
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>',
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#FF0000" height="16">',
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">',
'              <tr>',
'                <td align=middle valign="top">',
'                  <div align="center">',
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">',
'                      <b>#TITLE# </b></font></div>',
'                </td>',
'              </tr>',
'            </table>',
'          </td>',
'        </tr>',
'</table>',
'<table border="0" cellpadding="0" cellspacing="0">',
'   <tr>',
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />',
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">',
'              <tr>',
'                <td colspan="2">',
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">',
'                    <tr>',
'                      <td>&nbsp;</td>',
'                      <td valign="top" width="106">',
'                        <P><FONT face="arial, helvetica" size="1">',
'                            #BODY#',
'                           </font>',
'                        </P>',
'                      </td>',
'                    </tr>',
'                  </table>',
'            </table>',
'          </td>',
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'      </table>',
'      <table border="0" cellpadding="0" cellspacing="0">',
'        <tr>',
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>',
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>',
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'</table>',
''))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866070938464695051)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Sidebar Region - Heading Inside'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>24
,p_theme_class_id=>3
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866071054655695051)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="cWizardButtons cWizardButtonsLeft">',
'#PREVIOUS##CLOSE#',
'</div>',
'<div class="cWizardButtons cWizardButtonsRight">',
'#NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'</div>'))
,p_page_plug_template_name=>'Wizard Buttons'
,p_theme_id=>24
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866071137750695051)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Wizard Region'
,p_theme_id=>24
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866071243755695052)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Wizard Region with Icon'
,p_theme_id=>24
,p_theme_class_id=>20
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6866071330465695052)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" style="display:none" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'jQuery Modal Region Template'
,p_theme_id=>24
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7019390835752965810)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uAlertRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'</section>'))
,p_page_plug_template_name=>'Alert Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>10
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Used for alerts and confirmations.  Please use a region image for the success/warning icon'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7291194844539274285)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion uModalRegion uAlertRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'</section>'))
,p_page_plug_template_name=>'Modal Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7295152258222016287)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#BODY#',
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'</div>'))
,p_page_plug_template_name=>'DIV Region with ID'
,p_theme_id=>24
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7325499029784873649)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uBorderlessRegion #REGION_CSS_CLASSES# uHideShowRegion clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>',
'      <a href="javascript:void(0)" class="uRegionControl uRegionCollapsed"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="Hide/Show"/></a>',
'      #TITLE#',
'    </h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix" style="display: none;">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Hide and Show Region (Hidden First) - Borderless'
,p_theme_id=>24
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7333786546742853172)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#SUB_REGION_HEADERS#',
'#BODY#',
'<div class="uFrameContainer #REGION_CSS_CLASSES#">',
'#SUB_REGIONS#',
'</div>'))
,p_sub_plug_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uFrameRegionSelector clearfix">',
'  <ul>',
'    <li><a href="javascript:void(0);" class="showAllLink active"><span>Show All</span></a></li>',
'    #ENTRIES#',
'  </ul>',
'</div>'))
,p_sub_plug_header_entry_templ=>'<li><a href="javascript:void(0);" id="sub_#SUB_REGION_ID#"><span>#SUB_REGION_TITLE#</span></a></li>'
,p_page_plug_template_name=>'Content Frame Body Container'
,p_theme_id=>24
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7447955356197440784)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="ebaSearchFilterRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<h3>#TITLE#</h3>',
'#BODY#',
'<div class="ebaSearchFilterButtons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'</div>'))
,p_page_plug_template_name=>'Search Filter Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7505551837743027494)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion uRegionNoPadding uLoginRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uLoginHeading">',
'    <span class="bgArrow"></span>',
'    <div class="appIcon">',
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="appIcon #REGION_STATIC_ID#" alt=""/>',
'    </div> ',
'    <h1>#TITLE#</h1>',
'  </div>',
'  <div class="uLoginBody clearfix">',
'    #BODY#',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Login Region'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>24
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7537128157507954169)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<section class="uRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix"  style="height: 400px; overflow:scroll">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Scrollable Content Region'
,p_theme_id=>24
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1826089610826571714
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866072341897695053)
,p_list_template_current=>'<a href="#LINK#" class="uButtonSmall uHotButton" #A01# role="button"><span>#TEXT#</span></a> '
,p_list_template_noncurrent=>'<a href="#LINK#" class="uButtonSmall" #A01# role="button"><span>#TEXT#</span></a> '
,p_list_template_name=>'Button List'
,p_theme_id=>24
,p_theme_class_id=>6
,p_list_template_before_rows=>'<div class="uButtonList">'
,p_list_template_after_rows=>'</div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866072448198695054)
,p_list_template_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'DHTML Tree'
,p_theme_id=>24
,p_theme_class_id=>23
,p_list_template_before_rows=>'<ul class="dhtmlTree">'
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
 p_id=>wwv_flow_api.id(6866072558001695054)
,p_list_template_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Hierarchical Expanding'
,p_theme_id=>24
,p_theme_class_id=>22
,p_list_template_before_rows=>'<ul class="dhtmlTree">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866072634977695054)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <li class="active">',
'      <a href="#LINK#">',
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />',
'        <span>#TEXT#</span>',
'      </a>',
'    </li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <li>',
'      <a href="#LINK#">',
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />',
'        <span>#TEXT#</span>',
'      </a>',
'    </li>'))
,p_list_template_name=>'Horizontal Images with Label List'
,p_theme_id=>24
,p_theme_class_id=>4
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uImagesList uHorizontalImagesList clearfix">',
'  <ul>'))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  </ul>',
'</div>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866072736917695054)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li> '
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li> '
,p_list_template_name=>'Horizontal Links List'
,p_theme_id=>24
,p_theme_class_id=>3
,p_list_template_before_rows=>'<ul class="uHorizontalLinksList">'
,p_list_template_after_rows=>'</ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866072846445695054)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <li class="#LIST_STATUS#">',
'      <span>#TEXT#</span>',
'    </li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <li class="#LIST_STATUS#">',
'      <span>#TEXT#</span>',
'    </li>'))
,p_list_template_name=>'Horizontal Wizard Progress List'
,p_theme_id=>24
,p_theme_class_id=>17
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uHorizontalProgressList">',
'  <ul>'))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  </ul>',
'</div>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073047399695054)
,p_list_template_current=>'<li><a href="#LINK#" class="active">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Page Level Tabs List'
,p_theme_id=>24
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<nav class="uPageTabs">',
'<ul>'))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</nav>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073146013695054)
,p_list_template_current=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Pull Down Menu'
,p_theme_id=>24
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#f_spacer.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#arrow_down_gray_dark.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" />',
'</li>'))
,p_item_templ_noncurr_w_child=>'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#arrow_down_gray_dark.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>'
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" / ></a></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073254638695055)
,p_list_template_current=>'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a><'
||'/div>'
,p_list_template_noncurrent=>'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  "/></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a>'
||'</div>'
,p_list_template_name=>'Pull Down Menu with Image'
,p_theme_id=>24
,p_theme_class_id=>21
,p_list_template_before_rows=>'<div class="dhtmlMenuLG">'
,p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="S#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt="" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(thi'
||'s,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />',
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>',
'</div>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(th'
||'is,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />',
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>',
'</div>'))
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073356918695055)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Tabbed Navigation List'
,p_theme_id=>24
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uHorizontalTabs">',
'<ul>'))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</div>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073448356695055)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <li class="active">',
'      <a href="#LINK#">',
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />',
'        <span>#TEXT#</span>',
'      </a>',
'    </li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <li>',
'      <a href="#LINK#">',
'        <img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" />',
'        <span>#TEXT#</span>',
'      </a>',
'    </li>'))
,p_list_template_name=>'Vertical Images List'
,p_theme_id=>24
,p_theme_class_id=>5
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uImagesList uVerticalImagesList clearfix">',
'  <ul>'))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  </ul>',
'</div>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073559679695055)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Ordered List'
,p_theme_id=>24
,p_theme_class_id=>2
,p_list_template_before_rows=>'<ol class="uNumberedList">'
,p_list_template_after_rows=>'</ol>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073655037695055)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Sidebar List'
,p_theme_id=>24
,p_theme_class_id=>19
,p_list_template_before_rows=>'<ul class="uVerticalSidebarList">'
,p_list_template_after_rows=>'</ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073736258695055)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List with Bullets'
,p_theme_id=>24
,p_theme_class_id=>1
,p_list_template_before_rows=>'<ul class="uVerticalList">'
,p_list_template_after_rows=>'</ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073843421695055)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List without Bullets'
,p_theme_id=>24
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="uVerticalList noBullets">'
,p_list_template_after_rows=>'</ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6866073929647695055)
,p_list_template_current=>'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>'
,p_list_template_noncurrent=>'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>'
,p_list_template_name=>'Wizard Progress List - Vertical'
,p_theme_id=>24
,p_theme_class_id=>17
,p_list_template_before_rows=>'<div class="uVerticalProgressList" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><ul>'
,p_list_template_after_rows=>'</ul></div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7233426646252329043)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li>',
'    <a href="#LINK#">',
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="#A02#" alt="" />',
'      <h3>#TEXT#</h3>',
'      <h4>#A01#</h4>',
'    </a>',
'  </li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li>',
'    <a href="#LINK#">',
'      <img src="#IMAGE_PREFIX#f_spacer.gif" class="#A02#" alt="" />',
'      <h3>#TEXT#</h3>',
'      <h4>#A01#</h4>',
'    </a>',
'  </li>'))
,p_list_template_name=>'Vertical List with Subtext and Icon'
,p_theme_id=>24
,p_theme_class_id=>1
,p_list_template_before_rows=>'<ul class="largeLinkList">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866071427283695052)
,p_row_template_name=>'Borderless Report'
,p_row_template1=>'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="uReportContainer uBorderlessReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">',
'<tbody class="uReportPagination">',
'#TOP_PAGINATION#',
'</tbody>',
'<tbody class="uReportBody">',
'<tr><td>',
'<table summary="#REGION_TITLE#" class="uReport uReportBorderless">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>',
'</td>',
'</tr>',
'</tbody>',
'<tbody class="uReportPagination">',
'#PAGINATION#',
'</tbody>',
'</table>',
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_mouse_over=>'#F0F0F0'
,p_row_style_checked=>'#E8E8E8'
,p_theme_id=>24
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6866071427283695052)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866071531991695052)
,p_row_template_name=>'Fixed Headers'
,p_row_template1=>'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">',
'<tbody class="uReportPagination">',
'#TOP_PAGINATION#',
'</tbody>',
'<tbody class="uReportBody">',
'<tr><td>',
'<div class="uFixedHeadersContainer">',
'<table summary="#REGION_TITLE#" class="uReport uReportFixedHeaders">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>',
'</div>',
'</td>',
'</tr>',
'</tbody>',
'<tbody class="uReportPagination">',
'#PAGINATION#',
'</tbody>',
'</table>',
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<thead>',
''))
,p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>',
''))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_mouse_over=>'#F0F0F0'
,p_row_style_checked=>'#E8E8E8'
,p_theme_id=>24
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6866071531991695052)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tr>',
''))
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866071633433695052)
,p_row_template_name=>'Horizontal Border'
,p_row_template1=>'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">',
'<tbody class="uReportPagination">',
'#TOP_PAGINATION#',
'</tbody>',
'<tbody class="uReportBody">',
'<tr><td>',
'<table summary="#REGION_TITLE#" class="uReport uReportHorizontal">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>',
'</td>',
'</tr>',
'</tbody>',
'<tbody class="uReportPagination">',
'#PAGINATION#',
'</tbody>',
'</table>',
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_mouse_over=>'#F0F0F0'
,p_row_style_checked=>'#E8E8E8'
,p_theme_id=>24
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6866071633433695052)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866071744320695052)
,p_row_template_name=>'One Column Unordered List'
,p_row_template1=>'<li>#COLUMN_VALUE#</li>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="uReportList" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">',
'<tbody class="uReportPagination">',
'#TOP_PAGINATION#',
'</tbody>',
'<tbody class="uReportBody">',
'<tr><td>',
'<ul class="uReportList">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</td>',
'</tr>',
'</tbody>',
'<tbody class="uReportPagination">',
'#PAGINATION#',
'</tbody>',
'</table>',
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>24
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6866071744320695052)
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>'OMIT'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866071827297695052)
,p_row_template_name=>'Search Results Report (SELECT link_text, link_target, detail1, detail2, last_modified)'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'<span class="title"><a href="#2#">#1#</a></span>',
'<span class="description"><span class="last_modified">#5#</span>#3#</span>',
'<span class="type">#4#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="sSearchResultsReport">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="uPaginationTable">',
'#PAGINATION#',
'</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>24
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866071947086695052)
,p_row_template_name=>'Standard'
,p_row_template1=>'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">',
'<tbody class="uReportPagination">',
'#TOP_PAGINATION#',
'</tbody>',
'<tbody class="uReportBody">',
'<tr><td>',
'<table summary="#REGION_TITLE#" class="uReport uReportStandard">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>',
'</td>',
'</tr>',
'</tbody>',
'<tbody class="uReportPagination">',
'#PAGINATION#',
'</tbody>',
'</table>',
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_mouse_over=>'#F0F0F0'
,p_row_style_checked=>'#E8E8E8'
,p_theme_id=>24
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6866071947086695052)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866072040629695052)
,p_row_template_name=>'Standard - Alternative'
,p_row_template1=>'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template3=>'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="uOddRow">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="uReportContainer" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" summary="">',
'<tbody class="uReportPagination">',
'#TOP_PAGINATION#',
'</tbody>',
'<tbody class="uReportBody">',
'<tr><td>',
'<table summary="#REGION_TITLE#" class="uReport uReportAlternative">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>',
'</td>',
'</tr>',
'</tbody>',
'<tbody class="uReportPagination">',
'#PAGINATION#',
'</tbody>',
'</table>',
'<div class="uReportDownloadLinks">#EXTERNAL_LINK##CSV_LINK#</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="#LINK#" class="uPaginationPrev"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /> #PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>24
,p_theme_class_id=>5
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6866072040629695052)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tr>',
''))
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866072143856695052)
,p_row_template_name=>'Two Column Portlet'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'  <span class="uValueHeading">',
'    #1#',
'  </span>',
'  <span class="uValue">',
'    #2#',
'  </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="uValuePairs" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>24
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6866072244859695053)
,p_row_template_name=>'Value Attribute Pairs'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'  <span class="uValueHeading">',
'    #COLUMN_HEADER#',
'  </span>',
'  <span class="uValue">',
'    #COLUMN_VALUE#',
'  </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="uValuePairs" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>24
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7345269341912421153)
,p_row_template_name=>'Value Attribute Pairs - Left Aligned'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'  <label>',
'    #COLUMN_HEADER#',
'  </label>',
'  <span>',
'    #COLUMN_VALUE#',
'  </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="vapList" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>24
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7355669849679634514)
,p_row_template_name=>'Comment Bubbles'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="#1#">',
'<div>',
'	<em>#2#</em>',
'	#3##4##5##6##7#',
'</div>',
'<span>',
'	#8# (#9#) #10#',
'</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="commentBubbles">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="uPaginationTable">',
'#PAGINATION#',
'</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>24
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6866074030923695055)
,p_template_name=>'No Label'
,p_template_body1=>'<span class="uNoLabel">'
,p_template_body2=>'</span>'
,p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>'
,p_theme_id=>24
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6866074133349695058)
,p_template_name=>'Optional'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="uOptional">'
,p_template_body2=>'</label>'
,p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>'
,p_theme_id=>24
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6866074245808695058)
,p_template_name=>'Optional with help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="uOptional"><a class="uHelpLink" href="javascript:apex.theme.popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')">'
,p_template_body2=>'</a></label>'
,p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>'
,p_theme_id=>24
,p_theme_class_id=>1
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6866074350417695058)
,p_template_name=>'Required'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="uRequired">'
,p_template_body2=>' <img src="#IMAGE_PREFIX#f_spacer.gif" alt="#VALUE_REQUIRED#" class="uAsterisk" /></label>'
,p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>'
,p_theme_id=>24
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6866074454353695058)
,p_template_name=>'Required with help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="uRequired"><a class="uHelpLink" href="javascript:apex.theme.popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')">'
,p_template_body2=>'</a> <img src="#IMAGE_PREFIX#f_spacer.gif" alt="#VALUE_REQUIRED#" class="uAsterisk" /></label>'
,p_on_error_after_label=>'<span class="uLabelError">#ERROR_MESSAGE#</span>'
,p_theme_id=>24
,p_theme_class_id=>2
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(7081592730926972598)
,p_template_name=>'Hidden label, read by screen reader'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="hideMeButHearMe">'
,p_template_body2=>'</label>'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#'
,p_theme_id=>24
,p_theme_class_id=>13
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(6866074938343695061)
,p_name=>'Breadcrumb Menu'
,p_before_first=>'<ul>'
,p_current_page_option=>'<li class="active"><span>#NAME#</span></li> '
,p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li> '
,p_between_levels=>'<li class="uSeparator"><img src="#IMAGE_PREFIX#f_spacer.gif" class="uBreadcrumbSeparator" alt="" /></li> '
,p_after_last=>'</ul>'
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>24
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(6866075046577695062)
,p_name=>'Hierarchical Menu'
,p_before_first=>'<ul class="t1HierarchicalMenu">'
,p_current_page_option=>'<li class="t1current">#NAME#</li>'
,p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>11
,p_start_with_node=>'CHILD_MENU'
,p_theme_id=>24
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(6866075432045695082)
,p_popup_icon=>'#IMAGE_PREFIX#f_spacer.gif'
,p_popup_icon_attr=>'alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#" class="uPopupLOVIcon"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#APEX_JAVASCRIPT#',
'<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge" /><![endif]-->',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">  <link rel="stylesheet" href="#THEME_IMAGES#css/4_1.css" type="text/css" media="all"/>',
'#THEME_CSS#',
'</head>'))
,p_page_body_attr=>'class="uPopUpLOV"'
,p_before_field_text=>'<div class="uActionBar">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="searchField"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="smallButton"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="smallButton hotButton"'
,p_next_button_text=>'Next >'
,p_next_button_attr=>'class="smallButton"'
,p_prev_button_text=>'< Previous'
,p_prev_button_attr=>'class="smallButton"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<div class="lovPagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>'<div class="lovLinks">'
,p_theme_id=>24
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(6866075143752695062)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>'<th scope="col" valign="bottom" class="DayOfWeek" id="#DY#">#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="CalendarAlternative1Holder"> ',
' <tr>',
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="CalendarAlternative1">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="Day" valign="top" height="100" headers="#DY#">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="Today" headers="#DY#">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="WeekendDay" headers="#DY#">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="NonDay" valign="top" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="WeekCalendarAlternative1Holder">',
'<tr>',
'<td class="MonthTitle">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th scope="col" class="DayOfWeek" id="#DY#">#IDAY#<br>#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="WeekCalendarAlternative1">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="Day" valign="top" headers="#DY#">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="Today" valign="top" headers="#DY#">'
,p_weekly_weekend_open_format=>'<td valign="top" class="NonDay" headers="#DY#">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th scope="row" class="Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="DayOfWeek" id="#DY#">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="DayCalendarAlternative1Holder"> <tr><td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="DayCalendarAlternative1">'
,p_daily_month_close_format=>'</table></td> </tr> </table>'
,p_daily_day_open_format=>'<td valign="top" class="Day" headers="#DY#">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="Today" headers="#DY#">'
,p_daily_time_open_format=>'<th scope="row" class="Hour">'
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
,p_theme_id=>24
,p_theme_class_id=>1
);
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(6866075256537695081)
,p_cal_template_name=>'Calendar - Alternative'
,p_day_of_week_format=>'<th scope="col" class="DayOfWeek" id="#DY#">#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="CalendarHolder"> ',
' <tr>',
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="Calendar">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="Day" valign="top" headers="#DY#">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="Today" headers="#DY#">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="WeekendDay" headers="#DY#">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="NonDay" valign="top" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="WeekCalendarHolder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th scope="col" class="DayOfWeek" id="#DY#">#IDAY#<br>#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="WeekCalendar">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="Day" valign="top" headers="#DY#">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="Today" valign="top" headers="#DY#">'
,p_weekly_weekend_open_format=>'<td valign="top" class="NonDay" headers="#DY#">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th scope="row" class="Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="DayOfWeek" id="#DY#">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="2" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="DayCalendar">'
,p_daily_month_close_format=>'</table></td> </tr> </table>'
,p_daily_day_open_format=>'<td valign="top" class="Day" headers="#DY#">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="Today" headers="#DY#">'
,p_daily_time_open_format=>'<th scope="row" class="Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="CalendarHolder"> ',
' <tr>',
'   <td class="MonthTitle">#WTITLE#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_cust_day_of_week_format=>'<th scope="col" class="DayOfWeek">#IDAY#</th>'
,p_cust_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="Calendar">'
,p_cust_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr>'
,p_cust_day_title_format=>'<div class="DayTitle">#DD#</div>'
,p_cust_day_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="Day" valign="top">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="Today">'
,p_cust_nonday_title_format=>'<div class="NonDayTitle">#DD#</div>'
,p_cust_nonday_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="NonDay" valign="top">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<div class="WeekendDayTitle">#DD#</div>'
,p_cust_weekend_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="WeekendDay">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="Hour">'
,p_cust_time_close_format=>'<br /></th>'
,p_cust_wk_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="WeekCalendarHolder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_cust_wk_day_of_week_format=>'<th scope="col" class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>'
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="WeekCalendar">'
,p_cust_wk_month_close_format=>'</table></td></tr></table>'
,p_cust_wk_day_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="Day" valign="top">'
,p_cust_wk_day_close_format=>'<br /></td>'
,p_cust_wk_today_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="Today" valign="top">'
,p_cust_wk_weekend_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" valign="top" class="NonDay">'
,p_cust_wk_weekend_close_format=>'<br /></td>'
,p_cust_month_day_height_pix=>'75'
,p_cust_week_day_width_per=>'14'
,p_agenda_format=>'<table class="ListCalendarAlternateHolder" summary="" role="presentation"><tr><td class="MonthTitle">#LTITLE#</td></tr><tr><td><table class="ListCalendarAlternate" summary="#CALENDAR_TITLE# #LTITLE#">#DAYS#</td></tr></table>'''
,p_agenda_past_day_format=>'<tr> <th id="#MON#_#DD#_#YYYY#" colspan="2" class="PastDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_today_day_format=>'<tr>  <th  id="#MON#_#DD#_#YYYY#" colspan="2"  class="ToDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_future_day_format=>'<tr>   <th  id="#MON#_#DD#_#YYYY#" colspan="2" class="FutureDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>'
,p_agenda_past_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="PastHour" >#TIME#</th><td class="PastDay" headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_today_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="TodayHour" >#TIME#</th><td class="ToDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_agenda_future_entry_format=>'<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="FutureHour" >#TIME#</th><td class="FutureDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>24
,p_theme_class_id=>2
);
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(6866075351863695082)
,p_cal_template_name=>'Small Calendar'
,p_day_of_week_format=>'<th scope="col" class="day-of-week">#DY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="small-calendar-holder"> ',
' <tr>',
'   <td class="month-title">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="small-calendar">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>'))
,p_day_title_format=>'<div class="day-title">#DD#</div>'
,p_day_open_format=>'<td class="day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="weekend-day-title">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="weekend-day">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="non-day-title">#DD#</div>'
,p_nonday_open_format=>'<td class="non-day" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="SmallWeekCalendarHolder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th scope="col" class="DayOfWeek">#DY#<br />#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="SmallWeekCalendar">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="Day" valign="top"><div class="inner">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t1Today" valign="top"><div class="inner">'
,p_weekly_weekend_open_format=>'<td valign="top" class="NonDay"><div class="inner">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" class="DayOfWeek">#DY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="SmallDayCalendarHolder"> <tr> <td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="SmallDayCalendar">'
,p_daily_month_close_format=>'</table></td></tr></table>'
,p_daily_day_open_format=>'<td valign="top" class="Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="Today">'
,p_daily_time_open_format=>'<th scope="row" class="Hour">'
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
,p_theme_id=>24
,p_theme_class_id=>3
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(6866075530186695086)
,p_theme_id=>24
,p_theme_name=>'Cloudy'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(6866067945585695041)
,p_default_dialog_template=>wwv_flow_api.id(386622894318240528)
,p_error_template=>wwv_flow_api.id(6866067553254695040)
,p_printer_friendly_template=>wwv_flow_api.id(6866068330690695041)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(6866067249494695038)
,p_default_button_template=>wwv_flow_api.id(6866074553808695058)
,p_default_region_template=>wwv_flow_api.id(6866070529299695048)
,p_default_chart_template=>wwv_flow_api.id(6866069436351695046)
,p_default_form_template=>wwv_flow_api.id(6866069537100695047)
,p_default_reportr_template=>wwv_flow_api.id(6866070529299695048)
,p_default_tabform_template=>wwv_flow_api.id(6866070529299695048)
,p_default_wizard_template=>wwv_flow_api.id(6866071137750695051)
,p_default_menur_template=>wwv_flow_api.id(6866069031066695046)
,p_default_listr_template=>wwv_flow_api.id(6866069329330695046)
,p_default_irr_template=>wwv_flow_api.id(6866069854126695047)
,p_default_report_template=>wwv_flow_api.id(6866071947086695052)
,p_default_label_template=>wwv_flow_api.id(6866074133349695058)
,p_default_menu_template=>wwv_flow_api.id(6866074938343695061)
,p_default_calendar_template=>wwv_flow_api.id(6866075143752695062)
,p_default_list_template=>wwv_flow_api.id(6866073736258695055)
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>wwv_flow_api.id(6866069258920695046)
,p_default_dialogr_template=>wwv_flow_api.id(7295152258222016287)
,p_default_option_label=>wwv_flow_api.id(6866074245808695058)
,p_default_required_label=>wwv_flow_api.id(6866074454353695058)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(24),'#IMAGE_PREFIX#themes/theme_24/')
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
 p_id=>wwv_flow_api.id(9849074824244603011)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(9850102545599622361)
,p_shortcut_name=>'OK_TO_GET_NEXT_PREV_PK_VALUE'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Are you sure you want to leave this page without saving?'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(5820287076806998044)
,p_name=>'apex'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_attribute_15=>'909310509363380410'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101:&SESSION.'
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:1'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Based on authentication scheme from gallery:Existing Login Page: Use Application Express Account Credentials'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(9810357875984952712)
,p_name=>'carl'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_attribute_15=>'4899381308541335078'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101:&SESSION.'
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:1'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Based on authentication scheme from gallery:Existing Login Page: Use HTML DB Account Credentials'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(9850196932199202144)
,p_name=>'CUSTOM SCHEME'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'custom_auth'
,p_attribute_05=>'N'
,p_attribute_15=>'4939220364755584510'
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
 p_id=>wwv_flow_api.id(24045711997053447)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'DESKTOP'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>24
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_name=>'Page Zero'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page Zero'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9849011730321222429)
,p_plug_name=>'Application Breadcrumb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069031066695046)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_menu_id=>wwv_flow_api.id(9849008539194215590)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(6866074938343695061)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'22,101,44,1'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9849420134250557782)
,p_plug_name=>'Charts'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>11
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9877243335706938046)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820688488655251228)
,p_plug_name=>'Theme notes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>80
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
 p_id=>wwv_flow_api.id(5820689505755265603)
,p_plug_name=>'Button Region without Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069436351695046)
,p_plug_display_sequence=>75
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
 p_id=>wwv_flow_api.id(8454367291763913907)
,p_plug_name=>'Button Region with Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069153659695046)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Text inside the Region Source'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9246653215674603453)
,p_name=>'My Employees'
,p_template=>wwv_flow_api.id(6866070758559695048)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>'select * from wwv_demo_emp'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866071531991695052)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
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
 p_id=>wwv_flow_api.id(4960932606047122565)
,p_query_column_id=>1
,p_column_alias=>'EMPNO'
,p_column_display_sequence=>1
,p_column_heading=>'Empno'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4960932688354122565)
,p_query_column_id=>2
,p_column_alias=>'ENAME'
,p_column_display_sequence=>2
,p_column_heading=>'Ename'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4960932789809122565)
,p_query_column_id=>3
,p_column_alias=>'JOB'
,p_column_display_sequence=>3
,p_column_heading=>'Job'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4960932890850122565)
,p_query_column_id=>4
,p_column_alias=>'MGR'
,p_column_display_sequence=>4
,p_column_heading=>'Mgr'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4960933005504122565)
,p_query_column_id=>5
,p_column_alias=>'HIREDATE'
,p_column_display_sequence=>5
,p_column_heading=>'Hiredate'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4960933105289122565)
,p_query_column_id=>6
,p_column_alias=>'SAL'
,p_column_display_sequence=>6
,p_column_heading=>'Sal'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4960933191519122565)
,p_query_column_id=>7
,p_column_alias=>'COMM'
,p_column_display_sequence=>7
,p_column_heading=>'Comm'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4960933276107122565)
,p_query_column_id=>8
,p_column_alias=>'DEPTNO'
,p_column_display_sequence=>8
,p_column_heading=>'Deptno'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4964057998691510493)
,p_query_column_id=>9
,p_column_alias=>'WORK_CITY'
,p_column_display_sequence=>9
,p_column_heading=>'Work City'
,p_report_column_width=>80
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4964058074269510493)
,p_query_column_id=>10
,p_column_alias=>'WORK_COUNTRY'
,p_column_display_sequence=>10
,p_column_heading=>'Work Country'
,p_report_column_width=>80
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9849279544359040279)
,p_name=>'My Top Orders'
,p_template=>wwv_flow_api.id(6866070758559695048)
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
'select o.order_id edit, o.order_id, o.order_timestamp, o.order_total, c.cust_last_name || '', '' || c.cust_first_name customer_name',
'from demo_orders o, demo_customers c, demo_users u',
'where o.customer_id = c.customer_id',
'and o.user_id = u.user_id',
'and (u.user_name = :APP_USER or :APP_USER = ''ADMIN'')',
'order by o.order_total desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_customized=>'1'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
,p_query_num_rows=>6
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>6
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'My Orders Total:'
,p_csv_output=>'N'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9891624748275799400)
,p_query_column_id=>1
,p_column_alias=>'EDIT'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:#EDIT#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" border="0" alt="Icon 2">'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9849279733919040285)
,p_query_column_id=>2
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Order #'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9849280034252040285)
,p_query_column_id=>3
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>4
,p_column_heading=>'Order Date'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9849279929470040285)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>5
,p_column_heading=>'Order Total'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9849288849600070164)
,p_query_column_id=>5
,p_column_alias=>'CUSTOMER_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Customer Name'
,p_column_link=>'#'
,p_column_linktext=>'#CUSTOMER_NAME#'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9887156148862973505)
,p_plug_name=>'Sample Application v2.0'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070938464695051)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Welcome to the HTML DB Sample Application v2.0.  This application is designed to highlight the features of HTML DB.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9887162923151985023)
,p_plug_name=>'Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9849121245520624273)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073736258695055)
,p_plug_query_row_template=>1
,p_plug_footer=>'<p>Theme testers, make sure this list of actions looks good.</p>'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8454367579080919691)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8454367291763913907)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820690480759273595)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5820689505755265603)
,p_button_name=>'Test3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Test 3 - Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820690100692273592)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820689505755265603)
,p_button_name=>'Test1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Test 1 - Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8454368583255919695)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(8454367291763913907)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8454368767128919695)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(8454367291763913907)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3728423842581952320)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(9849279544359040279)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8454368187780919695)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(8454367291763913907)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820690284477273595)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5820689505755265603)
,p_button_name=>'Test2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Test 2 - Edit'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8454368384392919695)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(8454367291763913907)
,p_button_name=>'EDIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8454367992031919694)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8454367291763913907)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8454367767054919691)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8454367291763913907)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'< Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3728392847644944397)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(9849279544359040279)
,p_button_name=>'TEST'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_image_alt=>'Test'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8771055801877913019)
,p_branch_action=>'f?p=&FLOW_ID.:1:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9850728927779282615)
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
 p_id=>wwv_flow_api.id(9850785221807299743)
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
 p_id=>wwv_flow_api.id(9883331234500438415)
,p_computation_sequence=>10
,p_computation_item=>'P1_QUOTA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select to_char(quota, ''$999,999.99'') from demo_users where user_name = :APP_USER'
,p_compute_when_type=>'%null%'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(9883332543504441021)
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
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Customers'
,p_page_mode=>'NORMAL'
,p_step_title=>'Customers'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'Help for this page'
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150407120750'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7863991754884859791)
,p_plug_name=>'Customers'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070154468695047)
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
 p_id=>wwv_flow_api.id(7863991854531859791)
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
,p_owner=>'SHAKEEB'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7863992060760859794)
,p_db_column_name=>'CUSTOMER_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Customer Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7863992169084859794)
,p_db_column_name=>'CUSTOMER_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7863992280703859794)
,p_db_column_name=>'CUSTOMER_ADDRESS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Customer Address'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7863992366363859795)
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
 p_id=>wwv_flow_api.id(7863992478482859795)
,p_db_column_name=>'CUST_STATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Cust State'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7863992581799859795)
,p_db_column_name=>'CUST_POSTAL_CODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Cust Postal Code'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7863992673124860026)
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
 p_id=>wwv_flow_api.id(9885598127084869625)
,p_name=>'Top Customers'
,p_template=>wwv_flow_api.id(6866070938464695051)
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
,p_query_row_template=>wwv_flow_api.id(6866072143856695052)
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
 p_id=>wwv_flow_api.id(9885598430843869668)
,p_query_column_id=>1
,p_column_alias=>'CUST_NAME'
,p_column_display_sequence=>2
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9885598547567869668)
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
 p_id=>wwv_flow_api.id(5809450591594710279)
,p_query_column_id=>3
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>3
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9891750726270029580)
,p_name=>'Customers'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
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
 p_id=>wwv_flow_api.id(9891750944145029612)
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
 p_id=>wwv_flow_api.id(9891751030044029612)
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
 p_id=>wwv_flow_api.id(9891751131658029612)
,p_query_column_id=>3
,p_column_alias=>'CUSTOMER_ADDRESS'
,p_column_display_sequence=>3
,p_column_heading=>'Address'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9891751237624029612)
,p_query_column_id=>4
,p_column_alias=>'CUST_CITY'
,p_column_display_sequence=>4
,p_column_heading=>'City'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9891751321879029612)
,p_query_column_id=>5
,p_column_alias=>'CUST_STATE'
,p_column_display_sequence=>5
,p_column_heading=>'State'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9891751430896029612)
,p_query_column_id=>6
,p_column_alias=>'CUST_POSTAL_CODE'
,p_column_display_sequence=>6
,p_column_heading=>'ZIP Code'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849064137808565303)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9891750726270029580)
,p_button_name=>'P2_GO'
,p_button_static_id=>'P2_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
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
 p_id=>wwv_flow_api.id(9849079133615611402)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9891750726270029580)
,p_button_name=>'P2_NEW'
,p_button_static_id=>'P2_NEW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_is_hot=>'Y'
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
 p_id=>wwv_flow_api.id(9849080638463612778)
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
 p_id=>wwv_flow_api.id(9849064242497565308)
,p_branch_action=>'f?p=&FLOW_ID.:2:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9891932028580222468)
,p_name=>'P2_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9891750726270029580)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Products'
,p_page_mode=>'NORMAL'
,p_step_title=>'Products'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866068033412695041)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150108083959'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2533786224610554261)
,p_plug_name=>'Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9849121245520624273)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073736258695055)
,p_plug_query_row_template=>1
,p_plug_footer=>'<p>Theme testers, make sure this list of actions looks good.</p>'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8455729962920766291)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>This page shows various display controls used for this theme.</p>'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8455735089155792772)
,p_plug_name=>'Comments'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
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
 p_id=>wwv_flow_api.id(8455735260543793978)
,p_plug_name=>'Customers'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
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
 p_id=>wwv_flow_api.id(8455736688163820912)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8952783751878950044)
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
 p_id=>wwv_flow_api.id(8952783830938950044)
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
 p_id=>wwv_flow_api.id(8952784037283950117)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Stock #'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8952784150623950147)
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
 p_id=>wwv_flow_api.id(8952784231184950147)
,p_db_column_name=>'PRODUCT_DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8952784339737950148)
,p_db_column_name=>'PRODUCT_AVAIL'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Availability'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8952784455060950148)
,p_db_column_name=>'CATEGORY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8952784552548950151)
,p_db_column_name=>'LIST_PRICE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8396074080545116550)
,p_db_column_name=>'THE_IMAGE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Image'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(8952784643747950795)
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
 p_id=>wwv_flow_api.id(9849404847316504785)
,p_name=>'Top 10 Products'
,p_template=>wwv_flow_api.id(6866070938464695051)
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
,p_query_row_template=>wwv_flow_api.id(6866071633433695052)
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
 p_id=>wwv_flow_api.id(9849405132222504793)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9849405222995504793)
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
 p_id=>wwv_flow_api.id(8455736162059803879)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8455729962920766291)
,p_button_name=>'reset'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8455736363084803879)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8455729962920766291)
,p_button_name=>'Apply'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5810038184655799814)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8952783751878950044)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9849598737982405865)
,p_branch_action=>'f?p=&FLOW_ID.:6:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9849598522147405863)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8455730485561782245)
,p_name=>'P3_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8455729962920766291)
,p_prompt=>'Date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8455730676899782248)
,p_name=>'P3_COMMENTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8455729962920766291)
,p_prompt=>'Comments'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>16
,p_cMaxlength=>4000
,p_cHeight=>4
,p_cAttributes=>'nowrap'
,p_colspan=>2
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Orders'
,p_page_mode=>'NORMAL'
,p_step_title=>'Orders'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9189138618188101170)
,p_plug_name=>'Orders'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070938464695051)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Validate that this text looks good and has proper margins left, right and top.'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9850111135682654335)
,p_name=>'My Orders'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
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
 p_id=>wwv_flow_api.id(9850111631312654343)
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
 p_id=>wwv_flow_api.id(9850111845692654345)
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
 p_id=>wwv_flow_api.id(9850112139948654346)
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
 p_id=>wwv_flow_api.id(9850112350133654346)
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
 p_id=>wwv_flow_api.id(9850112549356654346)
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
 p_id=>wwv_flow_api.id(9850113624452654353)
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
 p_id=>wwv_flow_api.id(9850162936879891269)
,p_plug_name=>'Orders by Day'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>5
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_cal_id=>wwv_flow_api.id(9850163153542891273)
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
,p_template_id=>wwv_flow_api.id(6866075143752695062)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9852426428051258012)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9850111135682654335)
,p_button_name=>'ENTER_NEW_ORDER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enter New Order'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9850163534379891284)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9850162936879891269)
,p_button_name=>'Today'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Today'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9850163738845891285)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9850162936879891269)
,p_button_name=>'Next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9850163337714891279)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9850162936879891269)
,p_button_name=>'Previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9852426626413258039)
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9852426428051258012)
,p_branch_sequence=>5
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9850163946718891288)
,p_branch_action=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9850163242310891276)
,p_name=>'P4_CALENDAR_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9850162936879891269)
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
 p_id=>wwv_flow_api.id(9850163426953891283)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' wwv_flow_utilities.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9850163337714891279)
,p_process_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9850163629782891285)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' wwv_flow_utilities.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9850163534379891284)
,p_process_comment=>'Generated 13-AUG-04'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9850163841970891285)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' wwv_flow_utilities.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9850163738845891285)
,p_process_comment=>'Generated 13-AUG-04'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Cluster Bar'
,p_page_mode=>'NORMAL'
,p_step_title=>'Cluster Bar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5812597784049028816)
,p_plug_name=>'Charts'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(5812596682055009294)
,p_plug_name=>'Centered List'
,p_parent_plug_id=>wwv_flow_api.id(5812597784049028816)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(9877243335706938046)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073356918695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9858326625920915895)
,p_plug_name=>'Sales by Month and Category'
,p_parent_plug_id=>wwv_flow_api.id(5812597784049028816)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866068854740695042)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(8392417678732653114)
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
 p_id=>wwv_flow_api.id(8392417787269653114)
,p_chart_id=>wwv_flow_api.id(8392417678732653114)
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
 p_id=>wwv_flow_api.id(8392417873069653115)
,p_chart_id=>wwv_flow_api.id(8392417678732653114)
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
 p_id=>wwv_flow_api.id(8392417983588653115)
,p_chart_id=>wwv_flow_api.id(8392417678732653114)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_required_role=>wwv_flow_api.id(9849333653559232147)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9849396230085480896)
,p_plug_name=>'Add/Modify Products'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9881764241023318681)
,p_name=>'Product Image'
,p_template=>wwv_flow_api.id(6866070841457695051)
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
 p_id=>wwv_flow_api.id(9881764442166318690)
,p_query_column_id=>1
,p_column_alias=>'IMAGE_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9881764537079318691)
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
 p_id=>wwv_flow_api.id(9849662831730900636)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_api.id(9881764241023318681)
,p_button_name=>'DELETE_IMAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P6_IMAGE_ID'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849594333875380898)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9881764241023318681)
,p_button_name=>'CHANGE_IMAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Upload'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P6_IMAGE_ID'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849396527296480900)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849396723862480902)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849396433992480899)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849396627829480900)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9849594526361380904)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9849594333875380898)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9849655730167862350)
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
 p_id=>wwv_flow_api.id(9849396821828480905)
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>999
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849396938626480908)
,p_name=>'P6_PRODUCT_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Id'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849397042142480919)
,p_name=>'P6_PRODUCT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Name'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849397254048480922)
,p_name=>'P6_PRODUCT_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Description'
,p_source=>'PRODUCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849397325932480922)
,p_name=>'P6_CATEGORY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Category'
,p_source=>'CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES'
,p_lov=>'.'||wwv_flow_api.id(9849675528885994474)||'.'
,p_cSize=>31
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849397545625480922)
,p_name=>'P6_PRODUCT_AVAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Product Available'
,p_source=>'PRODUCT_AVAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'Y OR N'
,p_lov=>'.'||wwv_flow_api.id(9849328646848220812)||'.'
,p_cSize=>2
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849397624435480923)
,p_name=>'P6_LIST_PRICE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(9849396230085480896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'List Price'
,p_source=>'LIST_PRICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9881905244869622626)
,p_name=>'P6_IMAGE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(9849396230085480896)
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
 p_id=>wwv_flow_api.id(9849397131443480922)
,p_validation_name=>'P6_PRODUCT_NAME not null'
,p_validation_sequence=>20
,p_validation=>'P6_PRODUCT_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Product Name must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849397042142480919)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9849397433663480922)
,p_validation_name=>'P6_CATEGORY not null'
,p_validation_sequence=>40
,p_validation=>'P6_CATEGORY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Category must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849397325932480922)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9885524544353145977)
,p_validation_name=>'P6_LIST_PRICE'
,p_validation_sequence=>50
,p_validation=>'P6_LIST_PRICE'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'List Price must be Numeric.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849397624435480923)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9849397731050480926)
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
 p_id=>wwv_flow_api.id(9849678450142010040)
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
 p_id=>wwv_flow_api.id(9849397851127480927)
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
 p_id=>wwv_flow_api.id(9849397925166480928)
,p_process_sequence=>2
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'6'
,p_process_when_button_id=>wwv_flow_api.id(9849396627829480900)
,p_process_when=>'DELETE_IMAGE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
 p_id=>wwv_flow_api.id(9849074237293603004)
,p_plug_name=>'Add/Modify Customers'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9874141222975085041)
,p_name=>'Orders for this Customer'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
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
 p_id=>wwv_flow_api.id(9874145330640115682)
,p_query_column_id=>1
,p_column_alias=>'EDIT'
,p_column_display_sequence=>1
,p_column_heading=>'Order #'
,p_column_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9874155730041172293)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9874154527315166436)
,p_query_column_id=>3
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>6
,p_column_heading=>'Quantity'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9874154625227166436)
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
 p_id=>wwv_flow_api.id(9874156647141186711)
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
 p_id=>wwv_flow_api.id(9874166052560254518)
,p_query_column_id=>6
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Sales Rep'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9874166134142254519)
,p_query_column_id=>7
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>2
,p_column_heading=>'Order Date'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849074548045603006)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P7_CUSTOMER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849074732865603008)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849074426729603006)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P7_CUSTOMER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849074632364603006)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P7_CUSTOMER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9214870528800234784)
,p_branch_action=>'f?p=&APP_ID.:&P7_BRANCH.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 02-FEB-2010 10:38 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849075053213603015)
,p_name=>'P7_CUSTOMER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer ID'
,p_source=>'CUSTOMER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849075146804603022)
,p_name=>'P7_CUST_FIRST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'First Name'
,p_source=>'CUST_FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>21
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
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
 p_id=>wwv_flow_api.id(9849075349970603026)
,p_name=>'P7_CUST_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name'
,p_source=>'CUST_LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>21
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
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
 p_id=>wwv_flow_api.id(9849075535175603027)
,p_name=>'P7_CUST_STREET_ADDRESS1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Street Address'
,p_source=>'CUST_STREET_ADDRESS1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s address.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849075625074603027)
,p_name=>'P7_CUST_STREET_ADDRESS2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Street Address 2'
,p_source=>'CUST_STREET_ADDRESS2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
 p_id=>wwv_flow_api.id(9849075745420603027)
,p_name=>'P7_CUST_CITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
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
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
 p_id=>wwv_flow_api.id(9849075844037603027)
,p_name=>'P7_CUST_STATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
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
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Enter the customer''s state.  This value is determined via a web service based on the zip code when the customer is created.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849075941039603043)
,p_name=>'P7_CUST_POSTAL_CODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Postal Code'
,p_source=>'CUST_POSTAL_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>11
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
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
 p_id=>wwv_flow_api.id(9849076027061603043)
,p_name=>'P7_PHONE_NUMBER1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Phone Number'
,p_source=>'PHONE_NUMBER1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>26
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
 p_id=>wwv_flow_api.id(9849076150705603043)
,p_name=>'P7_PHONE_NUMBER2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Alt Phone Number'
,p_source=>'PHONE_NUMBER2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>26
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
 p_id=>wwv_flow_api.id(9849076249132603043)
,p_name=>'P7_CREDIT_LIMIT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Credit Limit'
,p_source=>'CREDIT_LIMIT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>9
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
 p_id=>wwv_flow_api.id(9849076323630603044)
,p_name=>'P7_CUST_EMAIL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'CUST_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>31
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
 p_id=>wwv_flow_api.id(9866019132665330671)
,p_name=>'P7_BRANCH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(9849074237293603004)
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
 p_id=>wwv_flow_api.id(9849075225101603025)
,p_validation_name=>'P7_CUST_FIRST_NAME not null'
,p_validation_sequence=>2
,p_validation=>'P7_CUST_FIRST_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Cust First Name must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849075146804603022)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9849075431496603026)
,p_validation_name=>'P7_CUST_LAST_NAME not null'
,p_validation_sequence=>3
,p_validation=>'P7_CUST_LAST_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Cust Last Name must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849075349970603026)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9850229935521468088)
,p_validation_name=>'P7_CREDIT_LIMIT'
,p_validation_sequence=>13
,p_validation=>'P7_CREDIT_LIMIT'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Credit Limit must be a Number.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849076249132603043)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9850334947341550186)
,p_validation_name=>'P7_PHONE_NUMBER1'
,p_validation_sequence=>23
,p_validation=>'P7_PHONE_NUMBER1'
,p_validation2=>'^\(?[[:digit:]]{3}\)?[-. ][[:digit:]]{3}[-. ][[:digit:]]{4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Phone number format not recognized'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849076027061603043)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9850337530850554873)
,p_validation_name=>'P7_PHONE_NUMBER2'
,p_validation_sequence=>33
,p_validation=>'P7_PHONE_NUMBER2'
,p_validation2=>'^\(?[[:digit:]]{3}\)?[-. ][[:digit:]]{3}[-. ][[:digit:]]{4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Phone number format not recognized'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849076150705603043)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9857436340006644006)
,p_validation_name=>'P7_CUST_POSTAL_CODE'
,p_validation_sequence=>43
,p_validation=>'P7_CUST_POSTAL_CODE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter a US ZIP Code.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849075941039603043)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9885527030950274558)
,p_validation_name=>'P7_CREDIT_LIMIT'
,p_validation_sequence=>53
,p_validation=>'P7_CREDIT_LIMIT'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Credit Limit must be Numeric.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849076249132603043)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9827707452951054380)
,p_validation_name=>'Credit Limit <= 5000'
,p_validation_sequence=>63
,p_validation=>':P7_CREDIT_LIMIT <= 5000'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'A customer''s Credit Limit must be less than or equal to $5,000'
,p_always_execute=>'N'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9849076450022603047)
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
 p_id=>wwv_flow_api.id(9878560252653310116)
,p_process_sequence=>5
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_WEB_SERVICE'
,p_process_name=>'Get ZIP Code from Web Service'
,p_attribute_01=>wwv_flow_api.id(9878557246292305494)
,p_attribute_02=>'ITEMS'
,p_process_when_button_id=>wwv_flow_api.id(9849074426729603006)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9849076529212603049)
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
 p_id=>wwv_flow_api.id(9849076633887603049)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'7'
,p_process_when_button_id=>wwv_flow_api.id(9849074632364603006)
,p_process_when_type=>'NEVER'
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_required_role=>wwv_flow_api.id(9877222247125865692)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9849236246025861006)
,p_name=>'Manage Users'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
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
 p_id=>wwv_flow_api.id(9849237531957861048)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_disable_sort_column=>'N'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9849236427382861015)
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
 p_id=>wwv_flow_api.id(9849236529238861017)
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
 p_id=>wwv_flow_api.id(9849236729667861018)
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
 p_id=>wwv_flow_api.id(9849236844444861018)
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
 p_id=>wwv_flow_api.id(9849245844500884101)
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
 p_id=>wwv_flow_api.id(9849326447739213597)
,p_query_column_id=>7
,p_column_alias=>'PRODUCTS'
,p_column_display_sequence=>6
,p_column_heading=>'Edit Products'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(9849328646848220812)
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'NO'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_USERS'
,p_ref_column_name=>'PRODUCTS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9850077127784386736)
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
 p_id=>wwv_flow_api.id(9877217725833857454)
,p_query_column_id=>9
,p_column_alias=>'ADMIN_USER'
,p_column_display_sequence=>7
,p_column_heading=>'Admin User'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(9849328646848220812)
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849237253402861024)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9849236246025861006)
,p_button_name=>'ADD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Add User'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849237044062861024)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9849236246025861006)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Save Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849236932068861024)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9849236246025861006)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849237139087861024)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9849236246025861006)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Remove Selected Users'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9849237848625861049)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9849237324836861045)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9849236246025861006)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_USERS'
,p_attribute_03=>'USER_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(9849237044062861024)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9849237441901861046)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9849236246025861006)
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
 p_id=>wwv_flow_api.id(9849237633321861049)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9849236246025861006)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_USERS'
,p_attribute_03=>'USER_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(9849237253402861024)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9849237730951861049)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9849236246025861006)
,p_process_type=>'NATIVE_TABFORM_ADD_ROWS'
,p_process_name=>'AddRows'
,p_attribute_01=>'1'
,p_process_error_message=>'Unable to add rows'
,p_process_when_button_id=>wwv_flow_api.id(9849237253402861024)
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Reset Password'
,p_page_mode=>'NORMAL'
,p_step_title=>'Reset Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(9877222247125865692)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9849274532837980157)
,p_plug_name=>'Reset Password for &P9_USER_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9850251844890622127)
,p_plug_name=>'Error!'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9850238051461548399)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_api.id(9849274532837980157)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849346127633253053)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9849274532837980157)
,p_button_name=>'RESET_PW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Reset Password'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9849346333746253066)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9849346127633253053)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9850238245463548408)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9850238051461548399)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849275236300981166)
,p_name=>'P9_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9849274532837980157)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849343542393247921)
,p_name=>'P9_NEW_PW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9849274532837980157)
,p_prompt=>'Enter New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849344347588249327)
,p_name=>'P9_NEW_PW_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9849274532837980157)
,p_prompt=>'Re-Enter New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849350052913260411)
,p_name=>'P9_USER_NAME'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(9849274532837980157)
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
 p_id=>wwv_flow_api.id(9849357452137279067)
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
,p_associated_item=>wwv_flow_api.id(9849343542393247921)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9850206129737248797)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9849608845958431718)
,p_plug_name=>'Select Product Image'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849713442072225332)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_api.id(9849608845958431718)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9849611131198436911)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9849608845958431718)
,p_button_name=>'UPLOAD_IMAGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Upload Image'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9849611336663436913)
,p_branch_action=>'f?p=&FLOW_ID.:6:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9849611131198436911)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9849713640118225335)
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9849713442072225332)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9849609753923433948)
,p_name=>'P10_IMAGE_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9849608845958431718)
,p_prompt=>'Product Image'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'WWV_FLOW_FILES'
,p_attribute_06=>'Y'
,p_attribute_08=>'inline'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9849690251966067402)
,p_validation_name=>'P10_IMAGE_URL'
,p_validation_sequence=>10
,p_validation=>'P10_IMAGE_URL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select an image to upload.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9849609753923433948)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9849614337562448225)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9865981337672218534)
,p_plug_name=>'Select a Customer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9865984028799225480)
,p_plug_name=>'Order Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9865982547369221399)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073929647695055)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9874132933532050295)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9865981337672218534)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9865993744776258452)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9865981337672218534)
,p_button_name=>'NEW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create New Customer'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9865990947416249824)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9865981337672218534)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next >'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9865991128160249831)
,p_branch_action=>'f?p=&FLOW_ID.:12:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9865990947416249824)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9865993942166258455)
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_BRANCH:12&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9865993744776258452)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9874133148537050298)
,p_branch_action=>'f?p=&FLOW_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9874132933532050295)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9865989028022244153)
,p_name=>'P11_CUSTOMER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9865981337672218534)
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
,p_field_template=>wwv_flow_api.id(6866074454353695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Choose a customer using the popup selector, or to create a new customer, click <b>Create New Customer</b>'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9865998224260271508)
,p_validation_name=>'P11_CUSTOMER_ID'
,p_validation_sequence=>10
,p_validation=>'P11_CUSTOMER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a customer.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(9865990947416249824)
,p_associated_item=>wwv_flow_api.id(9865989028022244153)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9873909454135267924)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9873885252563153921)
,p_plug_name=>'Order Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9865982547369221399)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073929647695055)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9873896132702214392)
,p_name=>'Product Catalog'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
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
 p_id=>wwv_flow_api.id(9873896342915214405)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Product Id'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9874082928263793247)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Product Name'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9874082447525789422)
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
 p_id=>wwv_flow_api.id(9873900136865232402)
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
 p_id=>wwv_flow_api.id(9873900921667239551)
,p_name=>'Order for &P12_CUSTOMER_NAME.'
,p_template=>wwv_flow_api.id(6866069537100695047)
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
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
 p_id=>wwv_flow_api.id(9873926437569367223)
,p_query_column_id=>1
,p_column_alias=>'C001'
,p_column_display_sequence=>6
,p_column_heading=>'C001'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9873901452989239566)
,p_query_column_id=>2
,p_column_alias=>'C002'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9874085053543800549)
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
 p_id=>wwv_flow_api.id(9873918050897333127)
,p_query_column_id=>4
,p_column_alias=>'COUNT(C002)'
,p_column_display_sequence=>3
,p_column_heading=>'Qty'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9873917143624331076)
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
 p_id=>wwv_flow_api.id(9873923051851352393)
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
 p_id=>wwv_flow_api.id(9874071039897711428)
,p_plug_name=>'Customer Info'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070938464695051)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9874068631455699624)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9873900921667239551)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9873959949361521972)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9873900921667239551)
,p_button_name=>'PLACE_ORDER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Place Order'
,p_button_position=>'BOTTOM'
,p_button_condition=>'select 1 from htmldb_collections where collection_name = ''ORDER'''
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9873960134904521983)
,p_branch_action=>'f?p=&FLOW_ID.:14:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9873959949361521972)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9874068851193699630)
,p_branch_action=>'f?p=&FLOW_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9874068631455699624)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9873889042913179452)
,p_name=>'P12_CUSTOMER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9873885252563153921)
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
 p_id=>wwv_flow_api.id(9873953143643482516)
,p_name=>'P12_PRODUCT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9873896132702214392)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(9873891535079186663)
,p_computation_sequence=>10
,p_computation_item=>'P12_CUSTOMER_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select cust_first_name || '' '' || cust_last_name from demo_customers where customer_id = :P11_CUSTOMER_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9874094032990860893)
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
,p_process_when_button_id=>wwv_flow_api.id(9873959949361521972)
,p_process_success_message=>'Order Created'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9873910651149276504)
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
 p_id=>wwv_flow_api.id(9873930139562386695)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9886236637407392959)
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
 p_id=>wwv_flow_api.id(9886252151184491530)
,p_name=>'Order Lines'
,p_template=>wwv_flow_api.id(9547722005512784323)
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
,p_query_row_template=>wwv_flow_api.id(6866071633433695052)
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
 p_id=>wwv_flow_api.id(9886254232399505108)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9886252643445491552)
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
 p_id=>wwv_flow_api.id(9886252734057491552)
,p_query_column_id=>3
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>3
,p_column_heading=>'Quantity'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9886254352563505109)
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
 p_id=>wwv_flow_api.id(9886334436227657617)
,p_plug_name=>'Order Progress'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9865982547369221399)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073929647695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9886231447880377073)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9885635032040028372)
,p_plug_name=>'Hierarchy'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'9885634952729028370'
,p_plug_source_type=>'NATIVE_TREE'
,p_plug_query_row_template=>1
,p_attribute_01=>wwv_flow_api.id(9885634952729028370)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9885653824903086610)
,p_plug_name=>'About this Application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(9885635227649028388)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9885635032040028372)
,p_button_name=>'COLLAPSE_ALL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Collapse All'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:CONTRACT_ALL:&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9885635335329028392)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9885635032040028372)
,p_button_name=>'EXPAND_ALL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Expand All'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:EXPAND_ALL:&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9885635425259028393)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9885635032040028372)
,p_button_name=>'RESET_TREE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Reset Tree'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.:RESET_TREE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9885635632469028398)
,p_branch_action=>'f?p=&APP_ID.:15:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9885635521873028396)
,p_name=>'P15_TREE_ROOT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9885635032040028372)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Pie Chart'
,p_page_mode=>'NORMAL'
,p_step_title=>'Pie Chart'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5812597175953017072)
,p_plug_name=>'Centered List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9877243335706938046)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073356918695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9877293340180062356)
,p_plug_name=>'Total Sales by Category'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866068854740695042)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(8392418281577653116)
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
 p_id=>wwv_flow_api.id(8392418362736653116)
,p_chart_id=>wwv_flow_api.id(8392418281577653116)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Stacked Bar'
,p_page_mode=>'NORMAL'
,p_step_title=>'Stacked Bar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5812597380454018324)
,p_plug_name=>'Centered List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_2'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9877243335706938046)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073356918695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9884338321658257869)
,p_plug_name=>'Percentage of Sales by Category over Months'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866068854740695042)
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
 p_id=>wwv_flow_api.id(8392418586804653117)
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
 p_id=>wwv_flow_api.id(8392418663435653117)
,p_chart_id=>wwv_flow_api.id(8392418586804653117)
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
 p_id=>wwv_flow_api.id(8392418781503653117)
,p_chart_id=>wwv_flow_api.id(8392418586804653117)
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
 p_id=>wwv_flow_api.id(8392418882654653117)
,p_chart_id=>wwv_flow_api.id(8392418586804653117)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_updated_by=>''
,p_last_upd_yyyymmddhh24miss=>'20150112103756'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8390735385747902098)
,p_plug_name=>'Region 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8390735580442902098)
,p_plug_name=>'Region 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8390735782976902099)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8390735990152902099)
,p_plug_name=>'Report 4'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8390736187298902100)
,p_plug_name=>'Region 5'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8390737391195911249)
,p_plug_name=>'Region Display Selector'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'tabtest'
,p_page_mode=>'NORMAL'
,p_step_title=>'tabtest'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866068747353695042)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8952780555475359864)
,p_plug_name=>'aaa'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8952780748734359908)
,p_plug_name=>'bbb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8952780926543359914)
,p_plug_name=>'ccc'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8952781144653359915)
,p_plug_name=>'ddd'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(8952781342645359917)
,p_plug_name=>'eee'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9873990646618098393)
,p_name=>'Product Info'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866072244859695053)
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
 p_id=>wwv_flow_api.id(9873990837023098418)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Product Id'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9873990949553098418)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9873991026064098418)
,p_query_column_id=>3
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>3
,p_column_heading=>'Description'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9873991124764098418)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>4
,p_column_heading=>'Category'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9873991245086098418)
,p_query_column_id=>5
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>5
,p_column_heading=>'Avail'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9873991321834098418)
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
 p_id=>wwv_flow_api.id(9873991443463098419)
,p_query_column_id=>7
,p_column_alias=>'IMAGE_URL'
,p_column_display_sequence=>7
,p_column_heading=>'Image Url'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9884483923604599084)
,p_name=>'Product Image'
,p_template=>wwv_flow_api.id(9547722005512784323)
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
 p_id=>wwv_flow_api.id(9884484147163599099)
,p_query_column_id=>1
,p_column_alias=>'IMAGE_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9884484234898599099)
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
 p_id=>wwv_flow_api.id(9874004742257182270)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9873990646618098393)
,p_button_name=>'CLOSE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Close this Window'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:window.close();'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9873992253891100468)
,p_name=>'P20_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9873990646618098393)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9191416644291345793)
,p_name=>'Report'
,p_template=>wwv_flow_api.id(6866070758559695048)
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
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
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
 p_id=>wwv_flow_api.id(9191416955480345802)
,p_query_column_id=>1
,p_column_alias=>'CUST_FIRST_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Cust First Name'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9191417059938345803)
,p_query_column_id=>2
,p_column_alias=>'CUST_LAST_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Cust Last Name'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9191417164236345803)
,p_query_column_id=>3
,p_column_alias=>'CUST_CITY'
,p_column_display_sequence=>3
,p_column_heading=>'Cust City'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9191417241114345803)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>4
,p_column_heading=>'Order Total'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9191417348589345803)
,p_query_column_id=>5
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>5
,p_column_heading=>'Order Timestamp'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9191417468743345803)
,p_query_column_id=>6
,p_column_alias=>'CUST_STATE'
,p_column_display_sequence=>6
,p_column_heading=>'Cust State'
,p_column_alignment=>'left'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9191417560927345803)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Calendar'
,p_alias=>'CALANDER'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(9408684615728276392)
,p_plug_name=>'Orders by Day'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(9408684825786276400)
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
,p_template_id=>wwv_flow_api.id(6866075351863695082)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9408691018498627279)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9408697413566644811)
,p_plug_name=>'Calendar List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9408698634690650962)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073356918695055)
,p_plug_query_row_template=>1
);
end;
/
prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Calendar 2'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054718'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(9011132730385579673)
,p_plug_name=>'Calendar'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(9011132924770579675)
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
,p_template_id=>wwv_flow_api.id(6866075143752695062)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9408693619183633880)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9408701423178666554)
,p_plug_name=>'Calendar List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9408698634690650962)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073356918695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8381651969612326045)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9011132730385579673)
,p_button_name=>'P23_REFRESH'
,p_button_static_id=>'P23_REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
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
 p_id=>wwv_flow_api.id(9011133839028579677)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9011132730385579673)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P23_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9011134217768579679)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9011132730385579673)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P23_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9011134631139579680)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9011132730385579673)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P23_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9011135035646579681)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9011132730385579673)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9011135437443579681)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9011132730385579673)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9011135835467579682)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9011132730385579673)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9011136240915579683)
,p_branch_action=>'f?p=&FLOW_ID.:23:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9011133234168579676)
,p_name=>'P23_CALENDAR_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9011132730385579673)
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
 p_id=>wwv_flow_api.id(9011133437959579676)
,p_name=>'P23_CALENDAR_END_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9011132730385579673)
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
 p_id=>wwv_flow_api.id(9011133621530579677)
,p_name=>'P23_CALENDAR_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(9011132730385579673)
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
 p_id=>wwv_flow_api.id(9011134016139579678)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9011133839028579677)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9011134420585579679)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9011134217768579679)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9011134839401579680)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9011134631139579680)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9011135231174579681)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9011135035646579681)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9011135632288579682)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9011135437443579681)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9011136042440579683)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9011135835467579682)
,p_process_comment=>'Generated 02-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8381652586581331007)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Custom'
,p_process_sql_clob=>' apex_util.custom_calendar(''P23_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(8381651969612326045)
,p_process_comment=>'Generated 02-DEC-09'
);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Calendar 3'
,p_page_mode=>'NORMAL'
,p_step_title=>'Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054718'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(9190073216310510221)
,p_plug_name=>'Calendar'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''<a title="Order Detail" href="f?p=&APP_ID.:29:'' || :APP_SESSION || ''::::P29_ORDER_ID:'' || order_id || ''">'' || to_char(order_total, ''$999,999'') || ''</a><br />'' ord, order_timestamp',
'from demo_orders o, demo_users u',
'where o.user_id = u.user_id and (u.user_name = :APP_USER',
'or :APP_USER = ''ADMIN'')'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(9190073415455510230)
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
,p_template_id=>wwv_flow_api.id(6866075256537695081)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9408696143246639381)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9408702027334667728)
,p_plug_name=>'Calendar List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9408698634690650962)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073356918695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8381686479271376180)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9190073216310510221)
,p_button_name=>'P24_REFRESH'
,p_button_static_id=>'P24_REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
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
 p_id=>wwv_flow_api.id(9190074344042510244)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9190073216310510221)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P24_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9190074718252510251)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9190073216310510221)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P24_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9190075126069510252)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9190073216310510221)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P24_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9190075521262510255)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9190073216310510221)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9190075941046510256)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9190073216310510221)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9190076327270510257)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9190073216310510221)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9190076720047510259)
,p_branch_action=>'f?p=&FLOW_ID.:24:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9190073713040510233)
,p_name=>'P24_CALENDAR_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9190073216310510221)
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
 p_id=>wwv_flow_api.id(9190073940354510240)
,p_name=>'P24_CALENDAR_END_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9190073216310510221)
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
 p_id=>wwv_flow_api.id(9190074117190510241)
,p_name=>'P24_CALENDAR_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9190073216310510221)
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
 p_id=>wwv_flow_api.id(9190074532048510246)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9190074344042510244)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9190074929267510251)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9190074718252510251)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9190075325804510255)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9190075126069510252)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9190075717562510256)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9190075521262510255)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9190076113723510257)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9190075941046510256)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9190076514171510258)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(9190076327270510257)
,p_process_comment=>'Generated 22-DEC-09'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8381686867281382109)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Custom'
,p_process_sql_clob=>' apex_util.custom_calendar(''P24_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(8381686479271376180)
,p_process_comment=>'Generated 22-DEC-09'
);
end;
/
prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7118237929574589668)
,p_plug_name=>'First'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:32%; float:left; margin-right: 1%; clear: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7118238130431589671)
,p_plug_name=>'Second'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:32%; float:left; margin-right: 1%; clear: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7118238356214589672)
,p_plug_name=>'Third'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:33%; float:left; clear: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7118238531086589672)
,p_plug_name=>'Fourth'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_1'
,p_plug_item_display_point=>'BELOW'
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140326085045'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5810401391794646779)
,p_plug_name=>'One'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 33%;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(5810401578267646782)
,p_plug_name=>'Two'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 33%; clear: none; margin-left: 1%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(5810401788344646783)
,p_plug_name=>'Three'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="float: left; width: 32%; clear: none; margin-left: 1%"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(5810402005161646784)
,p_plug_name=>'Span Three'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(7080568138222796773)
,p_plug_name=>'Calendar 1'
,p_plug_source=>'select * from "WWV_MIG_RPT_DATA"'
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(7080568647508796813)
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
,p_template_id=>wwv_flow_api.id(6866075143752695062)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080569443015796823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7080568138222796773)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P27_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080570035019796837)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7080568138222796773)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P27_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080570637297796837)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7080568138222796773)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P27_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080571241135796839)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(7080568138222796773)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080571830262796840)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(7080568138222796773)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080572428250796841)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(7080568138222796773)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080569844654796832)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080569443015796823)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080570439705796837)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080570035019796837)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080571043712796838)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080570637297796837)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080571649626796840)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080571241135796839)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080572239719796841)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080571830262796840)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080572851103796842)
,p_branch_action=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080572428250796841)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7080568828723796814)
,p_name=>'P27_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7080568138222796773)
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
 p_id=>wwv_flow_api.id(7080569032199796820)
,p_name=>'P27_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7080568138222796773)
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
 p_id=>wwv_flow_api.id(7080569237478796820)
,p_name=>'P27_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7080568138222796773)
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
 p_id=>wwv_flow_api.id(7080569645766796828)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P27_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080569443015796823)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080570242673796837)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P27_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080570035019796837)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080570836838796838)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P27_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080570637297796837)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080571431703796840)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080571241135796839)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080572045581796841)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080571830262796840)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080572627348796841)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080572428250796841)
,p_process_comment=>'Generated 5/26/2010'
);
end;
/
prompt --application/pages/page_00028
begin
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5818843197885182259)
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
 p_id=>wwv_flow_api.id(5819927376205428392)
,p_branch_action=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::P33_SEARCH:&P28_SEARCH.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 14-OCT-2010 07:49 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5818843404465184177)
,p_name=>'P28_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5818843197885182259)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_attributes=>'class="sSearchFieldBig"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074030923695055)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_required_role=>wwv_flow_api.id(9850137028596765921)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20141203171654'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9872476341374786219)
,p_plug_name=>'Order #&P29_ORDER_ID.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9872478522710786257)
,p_name=>'Items for Order #&P29_ORDER_ID.'
,p_template=>wwv_flow_api.id(6866069537100695047)
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
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
 p_id=>wwv_flow_api.id(9872479736994786276)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_alignment=>'CENTER'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9872478641053786265)
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
 p_id=>wwv_flow_api.id(9872478739606786265)
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
 p_id=>wwv_flow_api.id(9872478835452786266)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Product Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(9873824050673566717)
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'CARL'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'PRODUCT_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9872478943583786266)
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
 p_id=>wwv_flow_api.id(9872479027230786266)
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
 p_id=>wwv_flow_api.id(9873870445427076239)
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
 p_id=>wwv_flow_api.id(9872479427934786272)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9872478522710786257)
,p_button_name=>'ADD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Add Item to Order'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872477836539786240)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_button_name=>'GET_PREVIOUS_ORDER_ID'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'&lt; Previous Order'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:htmldb_goSubmit(''GET_PREVIOUS_ORDER_ID'')'
,p_button_condition=>'P29_ORDER_ID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872477727957786240)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_button_name=>'GET_NEXT_ORDER_ID'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next Order &gt;'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:htmldb_goSubmit(''GET_NEXT_ORDER_ID'')'
,p_button_condition=>'P29_ORDER_ID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872476550799786220)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Save Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872479224275786272)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9872478522710786257)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Save Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872476743566786221)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872476427133786220)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872476646757786220)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete Order'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9872479341533786272)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9872478522710786257)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete Checked Items'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9874129227599020198)
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
 p_id=>wwv_flow_api.id(9872480048891786277)
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9872478344770786255)
,p_branch_action=>'f?p=&FLOW_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:&P29_ORDER_ID_NEXT.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9872477727957786240)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9872478421773786256)
,p_branch_action=>'f?p=&FLOW_ID.:29:&SESSION.::&DEBUG.::P29_ORDER_ID:&P29_ORDER_ID_PREV.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(9872477836539786240)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872476826197786224)
,p_name=>'P29_ORDER_ID'
,p_item_sequence=>99
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Id'
,p_source=>'ORDER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872476942926786232)
,p_name=>'P29_CUSTOMER_ID'
,p_item_sequence=>98
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
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
,p_field_template=>wwv_flow_api.id(6866074454353695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872477141858786235)
,p_name=>'P29_ORDER_TOTAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872477230563786235)
,p_name=>'P29_ORDER_TIMESTAMP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872477338640786236)
,p_name=>'P29_USER_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872477941081786246)
,p_name=>'P29_ORDER_ID_NEXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_prompt=>'P29_ORDER_ID_NEXT'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872478036417786246)
,p_name=>'P29_ORDER_ID_PREV'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
,p_prompt=>'P29_ORDER_ID_PREV'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9872478127512786249)
,p_name=>'P29_ORDER_ID_COUNT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
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
 p_id=>wwv_flow_api.id(9873859826749032836)
,p_name=>'P29_CUSTOMER_INFO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9872476341374786219)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9872477046290786233)
,p_validation_name=>'P29_CUSTOMER_ID not null'
,p_validation_sequence=>2
,p_validation=>'P29_CUSTOMER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Customer Id must have some value.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9872476942926786232)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9872477434030786237)
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
 p_id=>wwv_flow_api.id(9872478225565786252)
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
 p_id=>wwv_flow_api.id(9872477540824786240)
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
 p_id=>wwv_flow_api.id(9872477644999786240)
,p_process_sequence=>2
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'29'
,p_process_when_button_id=>wwv_flow_api.id(9872476646757786220)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9872479537007786274)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9872478522710786257)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_ORDER_ITEMS'
,p_attribute_03=>'ORDER_ITEM_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(9872479224275786272)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9872479629545786274)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9872478522710786257)
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
 p_id=>wwv_flow_api.id(9872479827440786277)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9872478522710786257)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_ORDER_ITEMS'
,p_attribute_03=>'ORDER_ITEM_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(9872479427934786272)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9872479935662786277)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9872478522710786257)
,p_process_type=>'NATIVE_TABFORM_ADD_ROWS'
,p_process_name=>'AddRows'
,p_attribute_01=>'1'
,p_process_error_message=>'Unable to add rows'
,p_process_when_button_id=>wwv_flow_api.id(9872479427934786272)
);
end;
/
prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
 p_id=>wwv_flow_api.id(5813309385119293759)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070154468695047)
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
 p_id=>wwv_flow_api.id(5813309491400293759)
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
 p_id=>wwv_flow_api.id(5813309673752293771)
,p_db_column_name=>'EMPNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Employee #'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5813309784519293776)
,p_db_column_name=>'ENAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Employee Name - from attr dict'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5813309879821293776)
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
 p_id=>wwv_flow_api.id(5813309995159293776)
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
 p_id=>wwv_flow_api.id(5813310098551293777)
,p_db_column_name=>'HIREDATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Hiredate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5813310201986293777)
,p_db_column_name=>'SAL'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Salary'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5813310276819293777)
,p_db_column_name=>'COMM'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Commission'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5813310387566293777)
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
 p_id=>wwv_flow_api.id(5813310486601293948)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(7080612933851805039)
,p_plug_name=>'Calendar 1'
,p_plug_source=>'select * from "APEX$_WS_HISTORY"'
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(7080613455584805042)
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
,p_template_id=>wwv_flow_api.id(6866075143752695062)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080614243741805045)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7080612933851805039)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P31_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080614856040805049)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7080612933851805039)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P31_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080615447720805050)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7080612933851805039)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P31_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080617850341805057)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(7080612933851805039)
,p_button_name=>'CUSTOM_CALENDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Reload'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080616045697805052)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(7080612933851805039)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080616645538805053)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(7080612933851805039)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7080617238487805054)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(7080612933851805039)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080614627087805047)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080614243741805045)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080615256241805050)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080614856040805049)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080615847947805051)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080615447720805050)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080616428160805053)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080616045697805052)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080617033701805054)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080616645538805053)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080617654836805055)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080617238487805054)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7080618230237805058)
,p_branch_action=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7080617850341805057)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7080613643151805043)
,p_name=>'P31_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7080612933851805039)
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
 p_id=>wwv_flow_api.id(7080613853213805044)
,p_name=>'P31_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7080612933851805039)
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
 p_id=>wwv_flow_api.id(7080614044701805044)
,p_name=>'P31_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7080612933851805039)
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
 p_id=>wwv_flow_api.id(7080614425250805046)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080614243741805045)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080615039371805049)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080614856040805049)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080615637521805051)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080615447720805050)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080616242301805052)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080616045697805052)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080616851671805054)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080616645538805053)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080617427522805055)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080617238487805054)
,p_process_comment=>'Generated 5/26/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7080618051528805057)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Reload'
,p_process_sql_clob=>' apex_util.custom_calendar(''P31_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(7080617850341805057)
,p_process_comment=>'Generated 5/26/2010'
);
end;
/
prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Button Templates'
,p_alias=>'BUTTONTEMPLATES'
,p_page_mode=>'NORMAL'
,p_step_title=>'Button Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7846255280329484385)
,p_plug_name=>'No Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(9548447803942483163)
,p_plug_name=>'Button Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
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
 p_id=>wwv_flow_api.id(9548454981488580772)
,p_plug_name=>'Template Types'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5818236879846539826)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9548447803942483163)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Black Button'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9548448690913488846)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9548447803942483163)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Button'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9548451296585499954)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9548447803942483163)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_image_alt=>'Button Small'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9548450381348495565)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9548447803942483163)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Hot Button'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9548452398972547943)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9548447803942483163)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Hot Button Small'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5818236198622450637)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9548447803942483163)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Red Button'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9548449300263491554)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Search Results'
,p_page_mode=>'NORMAL'
,p_step_title=>'Search Results'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5818844497239210413)
,p_name=>'Search Results'
,p_template=>wwv_flow_api.id(6866070259517695047)
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
,p_query_row_template=>wwv_flow_api.id(6866071827297695052)
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
 p_id=>wwv_flow_api.id(5818844782726210423)
,p_query_column_id=>1
,p_column_alias=>'LINK_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'LINK_TITLE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5818844902903210427)
,p_query_column_id=>2
,p_column_alias=>'LINK_TARGET'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_TARGET'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5818844973477210427)
,p_query_column_id=>3
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>3
,p_column_heading=>'DESCRIPTION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5818845105260210427)
,p_query_column_id=>4
,p_column_alias=>'TYPE_OF_RESULT'
,p_column_display_sequence=>4
,p_column_heading=>'TYPE_OF_RESULT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5818845185275210427)
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
 p_id=>wwv_flow_api.id(5818845686288216745)
,p_plug_name=>'Refine your Search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070938464695051)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(5818906894524663733)
,p_plug_name=>'Sort Results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070938464695051)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(5820285577979257608)
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
 p_id=>wwv_flow_api.id(5818845898409220246)
,p_name=>'P33_SHOW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5818845686288216745)
,p_prompt=>'Show'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'EXAMPLE SEARCH SHOW OPTIONS'
,p_lov=>'.'||wwv_flow_api.id(5818846305597241234)||'.'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5818907183920670151)
,p_name=>'P33_SORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5818906894524663733)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820288379147017628)
,p_name=>'P33_SEARCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5820285577979257608)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_calendar(
 p_id=>wwv_flow_api.id(5819917003292341533)
,p_plug_name=>'Calendar of Changed Page Items'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select application_id||''.''||page_id "APPLICATION_NAME",',
'	 "ITEM_NAME",',
'	  "LAST_UPDATED_ON",',
'	 "LAST_UPDATED_BY" ',
' from	 "APEX_APPLICATION_PAGE_ITEMS" ',
'where last_updated_on is not null'))
,p_plug_source_type=>'NATIVE_CALENDAR'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'ABOVE'
,p_cal_id=>wwv_flow_api.id(5819917680248341546)
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
,p_template_id=>wwv_flow_api.id(6866075143752695062)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5819918495146341560)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5819917003292341533)
,p_button_name=>'MONTHLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Monthly'
,p_button_position=>'TOP'
,p_button_condition=>'NVL(:P34_CALENDAR_TYPE, ''M'') <> ''M'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5819919083830341569)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5819917003292341533)
,p_button_name=>'WEEKLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Weekly'
,p_button_position=>'TOP'
,p_button_condition=>'P34_CALENDAR_TYPE'
,p_button_condition2=>'W'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5819919692924341571)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5819917003292341533)
,p_button_name=>'DAILY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Daily'
,p_button_position=>'TOP'
,p_button_condition=>'P34_CALENDAR_TYPE'
,p_button_condition2=>'D'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5819920295769341572)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5819917003292341533)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'< Previous'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5819920882753341572)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5819917003292341533)
,p_button_name=>'TODAY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Today'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5819921475347341575)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(5819917003292341533)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Next >'
,p_button_position=>'TOP'
,p_grid_new_grid=>false
,p_button_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5819918881588341567)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5819918495146341560)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5819919499664341570)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5819919083830341569)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5819920101876341571)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5819919692924341571)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5819920680293341572)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5819920295769341572)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5819921300402341573)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5819920882753341572)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5819921890072341576)
,p_branch_action=>'f?p=&FLOW_ID.:34:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5819921475347341575)
,p_branch_sequence=>-1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5819917891635341554)
,p_name=>'P34_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5819917003292341533)
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
 p_id=>wwv_flow_api.id(5819918081569341559)
,p_name=>'P34_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5819917003292341533)
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
 p_id=>wwv_flow_api.id(5819918304212341559)
,p_name=>'P34_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5819917003292341533)
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
 p_id=>wwv_flow_api.id(5819918705237341564)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Monthly'
,p_process_sql_clob=>' apex_util.month_calendar(''P34_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5819918495146341560)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5819919295002341570)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Weekly'
,p_process_sql_clob=>' apex_util.weekly_calendar(''P34_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5819919083830341569)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5819919901190341571)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Daily'
,p_process_sql_clob=>' apex_util.daily_calendar(''P34_CALENDAR_TYPE'');'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5819919692924341571)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5819920493901341572)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Previous'
,p_process_sql_clob=>' apex_util.decrement_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5819920295769341572)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5819921106034341572)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Today'
,p_process_sql_clob=>' apex_util.today_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5819920882753341572)
,p_process_comment=>'Generated 10/14/2010'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5819921696737341576)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust Calendar Date -Next'
,p_process_sql_clob=>' apex_util.increment_calendar;'
,p_process_error_message=>'Error changing calendar date.'
,p_process_when_button_id=>wwv_flow_api.id(5819921475347341575)
,p_process_comment=>'Generated 10/14/2010'
);
end;
/
prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5820274181013577324)
,p_name=>'Pages'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866072143856695052)
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
 p_id=>wwv_flow_api.id(5820274486123577328)
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
 p_id=>wwv_flow_api.id(5820274579348577329)
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
 p_id=>wwv_flow_api.id(5820274976426594930)
,p_name=>'Page Items'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
'select item_name item_name,  last_updated_on',
'from apex_application_page_items',
'where application_id = :APP_ID and last_updated_on is not null',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866072143856695052)
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
 p_id=>wwv_flow_api.id(5820275483006596836)
,p_query_column_id=>1
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>1
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5820275288734594933)
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
 p_id=>wwv_flow_api.id(5820278695762846502)
,p_name=>'Regions'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
'select ''P''||page_id||'' -  ''||region_name page_name, last_updated_on',
'from apex_application_page_regions',
'where application_id = :APP_ID and last_updated_on is not null',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866072143856695052)
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
 p_id=>wwv_flow_api.id(5820278895389846505)
,p_query_column_id=>1
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>1
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5820278996302846505)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>2
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5820279474553859254)
,p_name=>'Page Processes'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
'select ''P''||page_id||'' -  ''||process_name item_name,  last_updated_on',
'from apex_application_page_proc',
'where application_id = :APP_ID and last_updated_on is not null',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866072143856695052)
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
 p_id=>wwv_flow_api.id(5820279776318859257)
,p_query_column_id=>1
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>1
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5820279700553859257)
,p_query_column_id=>2
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>2
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820280377455869597)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069651354695047)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
 p_id=>wwv_flow_api.id(5820285281913247701)
,p_plug_name=>'Tree'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
,p_plug_footer=>'<p>This is region footer text.  This is a reports region template.  This text should be displayed below component content.  This text is within an HTML paragraph "p" tag.</p>'
,p_attribute_01=>'default'
,p_attribute_02=>'S'
,p_attribute_04=>'N'
,p_attribute_06=>'tree5820285176463247701'
,p_attribute_07=>'JSTREE'
);
end;
/
prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820289005251034648)
,p_plug_name=>'Test Popup Page'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(5820931302243936342)
,p_plug_name=>'Hide Show Region Example'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069651354695047)
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
 p_id=>wwv_flow_api.id(5820289789583049058)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820289005251034648)
,p_button_name=>'TEST_POPUP'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Test Popup Page'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:popUpNamed(''f?p=&APP_ID.:44:&SESSION.:::'',''PopupTest'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820629995227477300)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5820289005251034648)
,p_button_name=>'SHOW_ME_AN_ERROR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Show Me An Error'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::BAD_ITEM:20'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820788700729576345)
,p_name=>'P37_DATE_PICKER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5820289005251034648)
,p_prompt=>'Date Picker'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820788879735579807)
,p_name=>'P37_POPUP_LOV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5820289005251034648)
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
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820789091509583168)
,p_name=>'P37_COLOR_PICKER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5820289005251034648)
,p_prompt=>'Color Picker'
,p_display_as=>'NATIVE_COLOR_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820789298782585237)
,p_name=>'P37_POPUP_CALCULATOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5820289005251034648)
,p_prompt=>'Popup Calculator'
,p_display_as=>'NATIVE_TEXT_WITH_CALCULATOR'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820166881048816246)
,p_plug_name=>'Step 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(5820179589430957164)
,p_plug_name=>'wizard progress bar 38, 39, 40'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5820178505573957163)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072846445695054)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820180501118984211)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069258920695046)
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
 p_id=>wwv_flow_api.id(5820942190273093732)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5820166881048816246)
,p_button_name=>'TEST_LONG_PROGRESS_TEXT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Test Long Progress Text'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820167278883816247)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820180501118984211)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820167604644816247)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5820180501118984211)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5820167883687816248)
,p_branch_action=>'f?p=&APP_ID.:39:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5820167604644816247)
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4763393047854916619)
,p_name=>'P38_TEST_LOV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5820166881048816246)
,p_prompt=>'Test Lov'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC2:Test;1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820167075742816247)
,p_name=>'P38_ITEM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5820166881048816246)
,p_prompt=>'ITEM 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820168477271816249)
,p_plug_name=>'Step 2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866071137750695051)
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
 p_id=>wwv_flow_api.id(5820179795818957166)
,p_plug_name=>'wizard progress bar 38, 39, 40'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5820178505573957163)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072846445695054)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820168890964816249)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820168477271816249)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820169204693816249)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5820168477271816249)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820169090683816249)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5820168477271816249)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_image_alt=>'< Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5820169795352816250)
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5820169204693816249)
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5820169481233816250)
,p_branch_action=>'f?p=&APP_ID.:38:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5820169090683816249)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820168693397816249)
,p_name=>'P39_ITEM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5820168477271816249)
,p_prompt=>'ITEM 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820170601693816251)
,p_plug_name=>'Step 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866071137750695051)
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
 p_id=>wwv_flow_api.id(5820179974037957166)
,p_plug_name=>'wizard progress bar 38, 39, 40'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(5820178505573957163)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072846445695054)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820170977160816252)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820170601693816251)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820171094296816252)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5820170601693816251)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finish'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820171177619816252)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5820170601693816251)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_image_alt=>'< Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5820171902459816253)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5820171094296816252)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5820171585817816252)
,p_branch_action=>'f?p=&APP_ID.:39:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5820171177619816252)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820170796596816251)
,p_name=>'P40_ITEM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5820170601693816251)
,p_prompt=>'ITEM 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5820262477793443991)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820174300683861042)
,p_plug_name=>'Employees'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(5820180992162010066)
,p_plug_name=>'What to test'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(5820932091985942819)
,p_plug_name=>'Button Bar Region To test Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069258920695046)
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
 p_id=>wwv_flow_api.id(5820943692529132178)
,p_plug_name=>'Nested Region Container (forms region)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(5820943904303135638)
,p_plug_name=>'Nested Region'
,p_parent_plug_id=>wwv_flow_api.id(5820943692529132178)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866068854740695042)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
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
 p_id=>wwv_flow_api.id(5820944194391142155)
,p_plug_name=>'Nested Region No Heading'
,p_parent_plug_id=>wwv_flow_api.id(5820943692529132178)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866068854740695042)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
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
 p_id=>wwv_flow_api.id(5820949600981219793)
,p_plug_name=>'Nested Hide Show'
,p_parent_plug_id=>wwv_flow_api.id(5820943692529132178)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069651354695047)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
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
 p_id=>wwv_flow_api.id(5820945191883160373)
,p_plug_name=>'Items with labels left aligned'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(5820947382102176531)
,p_plug_name=>'Above Label'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(5820949088383206703)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(5820945191883160373)
,p_button_name=>'TEST_BOTTOM_BUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_image_alt=>'Test Bottom Button'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820174599699861045)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5820932091985942819)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P41_EMPNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820174776637861045)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820932091985942819)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820174493771861045)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5820932091985942819)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Create Employee'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P41_EMPNO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820174697283861045)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5820932091985942819)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
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
 p_id=>wwv_flow_api.id(5820175485090861047)
,p_branch_action=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820175695782861048)
,p_name=>'P41_EMPNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Empno'
,p_source=>'EMPNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820175886904861064)
,p_name=>'P41_ENAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
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
 p_id=>wwv_flow_api.id(5820176075217861066)
,p_name=>'P41_JOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820176286234861067)
,p_name=>'P41_MGR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
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
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820176490365861068)
,p_name=>'P41_HIREDATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
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
,p_field_template=>wwv_flow_api.id(6866074350417695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820176702647861068)
,p_name=>'P41_SAL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Required with help'
,p_source=>'SAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>7
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820176883453861068)
,p_name=>'P41_COMM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Comm (not req with help)'
,p_source=>'COMM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>7
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820177084862861069)
,p_name=>'P41_DEPTNO'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
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
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820631278220519787)
,p_name=>'P41_DISPLAY_ONLY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820945480586166550)
,p_name=>'P41_TEST'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(5820945191883160373)
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
 p_id=>wwv_flow_api.id(5820945691727166551)
,p_name=>'P41_TEST2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(5820945191883160373)
,p_prompt=>'Required no help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(6866074350417695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820945903863166551)
,p_name=>'P41_TEST3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(5820945191883160373)
,p_prompt=>'Required with help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820946095087166551)
,p_name=>'P41_TEST4'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(5820945191883160373)
,p_prompt=>'Optional no help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820946275528166553)
,p_name=>'P41_TEST5'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(5820945191883160373)
,p_prompt=>'Optional with help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820947593877179878)
,p_name=>'P41_EXAMPLE_OF_LABEL_ABOVE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(5820947382102176531)
,p_prompt=>'Example of Label Above (this should look good over a text area)'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820948483750195852)
,p_name=>'P41_EXAMPLE_OF_LABEL_ABOVE_R'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(5820947382102176531)
,p_prompt=>'Example of Label Above (required)'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820948804528201915)
,p_name=>'P41_DISPLAY_ONLY2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(5820945191883160373)
,p_prompt=>'Display Only'
,p_source=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820949787606225342)
,p_name=>'P41_SHUTTLE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(5820174300683861042)
,p_prompt=>'Shuttle'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>'select dname, deptno from dept'
,p_cSize=>150
,p_cMaxlength=>4000
,p_cHeight=>10
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'ALL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5820177291981861070)
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
 p_id=>wwv_flow_api.id(5820177488367861071)
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
 p_id=>wwv_flow_api.id(5820177704338861071)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'41'
,p_process_when_button_id=>wwv_flow_api.id(5820174697283861045)
);
end;
/
prompt --application/pages/page_00043
begin
wwv_flow_api.create_page(
 p_id=>43
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Employees'
,p_page_mode=>'NORMAL'
,p_step_title=>'Employees'
,p_step_sub_title=>'Employees'
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
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2535940422376361934)
,p_name=>'Tabular Form'
,p_template=>wwv_flow_api.id(6866070529299695048)
,p_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'"ROWID",',
'"EMPNO",',
'"ENAME",',
'"JOB",',
'"MGR",',
'"HIREDATE",',
'"SAL",',
'"COMM",',
'"DEPTNO"',
'from "#OWNER#"."EMP"',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
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
 p_id=>wwv_flow_api.id(2535944032331361948)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'Select Row'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535940730721361935)
,p_query_column_id=>2
,p_column_alias=>'ROWID'
,p_column_display_sequence=>2
,p_column_heading=>'Rowid'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_column_width=>16
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'ROWID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535940845303361936)
,p_query_column_id=>3
,p_column_alias=>'EMPNO'
,p_column_display_sequence=>3
,p_column_heading=>'Empno'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_column_width=>16
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'EMPNO'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535940948252361936)
,p_query_column_id=>4
,p_column_alias=>'ENAME'
,p_column_display_sequence=>4
,p_column_heading=>'Ename'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'POPUPKEY_QUERY'
,p_inline_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ename, empno FROM emp ORDER by 1',
''))
,p_lov_show_nulls=>'NO'
,p_column_width=>12
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'ENAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535941022478361936)
,p_query_column_id=>5
,p_column_alias=>'JOB'
,p_column_display_sequence=>5
,p_column_heading=>'Job'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>12
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'JOB'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535941124065361936)
,p_query_column_id=>6
,p_column_alias=>'MGR'
,p_column_display_sequence=>6
,p_column_heading=>'Mgr'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'MGR'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535941219682361936)
,p_query_column_id=>7
,p_column_alias=>'HIREDATE'
,p_column_display_sequence=>7
,p_column_heading=>'Hiredate'
,p_disable_sort_column=>'N'
,p_display_as=>'DATE_PICKER'
,p_column_width=>12
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'HIREDATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535941343776361936)
,p_query_column_id=>8
,p_column_alias=>'SAL'
,p_column_display_sequence=>8
,p_column_heading=>'Sal'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'SAL'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535941430738361936)
,p_query_column_id=>9
,p_column_alias=>'COMM'
,p_column_display_sequence=>9
,p_column_heading=>'Comm'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'COMM'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2535941537840361936)
,p_query_column_id=>10
,p_column_alias=>'DEPTNO'
,p_column_display_sequence=>10
,p_column_heading=>'Deptno'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'POPUPKEY_QUERY'
,p_inline_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ename, empno FROM emp ORDER by 1',
''))
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_040100'
,p_ref_table_name=>'EMP'
,p_ref_column_name=>'DEPTNO'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535944425147362705)
,p_column_sequence=>1
,p_query_column_name=>'ROWID'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535944528996362706)
,p_column_sequence=>2
,p_query_column_name=>'EMPNO'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535944633814362706)
,p_column_sequence=>3
,p_query_column_name=>'ENAME'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535944734654362706)
,p_column_sequence=>4
,p_query_column_name=>'JOB'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535944841468362706)
,p_column_sequence=>5
,p_query_column_name=>'MGR'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535944920521362706)
,p_column_sequence=>6
,p_query_column_name=>'HIREDATE'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535945037969362706)
,p_column_sequence=>7
,p_query_column_name=>'SAL'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535945119870362706)
,p_column_sequence=>8
,p_query_column_name=>'COMM'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(2535945231934362706)
,p_column_sequence=>9
,p_query_column_name=>'DEPTNO'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820218702404418674)
,p_plug_name=>'Employees'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070154468695047)
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
 p_id=>wwv_flow_api.id(5820218782325418674)
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
 p_id=>wwv_flow_api.id(5820218974629418689)
,p_db_column_name=>'EMPNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Employee #'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5820219082005418691)
,p_db_column_name=>'ENAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5820219182813418691)
,p_db_column_name=>'JOB'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5820219289023418691)
,p_db_column_name=>'MGR'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Manager'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5820219385195418691)
,p_db_column_name=>'HIREDATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Hiredate'
,p_column_type=>'DATE'
,p_format_mask=>'&APP_DATE_FMT. HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5820219485632418692)
,p_db_column_name=>'SAL'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Salary'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5820219585565418692)
,p_db_column_name=>'COMM'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Commission'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5820219697526418692)
,p_db_column_name=>'DEPTNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Department'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5820219799181418932)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8824876'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'EMPNO:ENAME:JOB:MGR:HIREDATE:SAL:COMM:DEPTNO'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2535941928514361940)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2535940422376361934)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Add Row'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:apex.widget.report.tabular.addRow();'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2535941717850361940)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2535940422376361934)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2535941643901361940)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2535940422376361934)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2535941847942361940)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(2535940422376361934)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820221505808449156)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820218702404418674)
,p_button_name=>'CREATE_EMPLOYEE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074640645695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Employee >'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:41::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2535944123186361948)
,p_branch_action=>'f?p=&APP_ID.:43:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2535942727974361946)
,p_tabular_form_region_id=>wwv_flow_api.id(2535940422376361934)
,p_validation_name=>'MGR must be numeric'
,p_validation_sequence=>50
,p_validation=>'MGR'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2535941717850361940)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'MGR'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2535942946708361946)
,p_tabular_form_region_id=>wwv_flow_api.id(2535940422376361934)
,p_validation_name=>'HIREDATE must be a valid date'
,p_validation_sequence=>60
,p_validation=>'HIREDATE'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'#COLUMN_HEADER# must be a valid date.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2535941717850361940)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'HIREDATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2535943145148361946)
,p_tabular_form_region_id=>wwv_flow_api.id(2535940422376361934)
,p_validation_name=>'SAL must be numeric'
,p_validation_sequence=>70
,p_validation=>'SAL'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2535941717850361940)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'SAL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2535943336765361946)
,p_tabular_form_region_id=>wwv_flow_api.id(2535940422376361934)
,p_validation_name=>'COMM must be numeric'
,p_validation_sequence=>80
,p_validation=>'COMM'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2535941717850361940)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'COMM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2535943538230361946)
,p_tabular_form_region_id=>wwv_flow_api.id(2535940422376361934)
,p_validation_name=>'DEPTNO must be numeric'
,p_validation_sequence=>90
,p_validation=>'DEPTNO'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(2535941717850361940)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'DEPTNO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2535943618747361946)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(2535940422376361934)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'EMP'
,p_attribute_03=>'ROWID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2535941717850361940)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2535943831664361947)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(2535940422376361934)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'EMP'
,p_attribute_03=>'ROWID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'MULTI_ROW_DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
);
end;
/
prompt --application/pages/page_00044
begin
wwv_flow_api.create_page(
 p_id=>44
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_name=>'Popup test'
,p_page_mode=>'NORMAL'
,p_step_title=>'Popup test'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866068245660695041)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20140507054718'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820289996855051197)
,p_plug_name=>'Popup Test'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(5820398299686722508)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(5820289996855051197)
,p_button_name=>'P44_INLINE_BUTTON'
,p_button_static_id=>'P44_INLINE_BUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
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
 p_id=>wwv_flow_api.id(5820398675576724999)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820289996855051197)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5820398480186722510)
,p_branch_action=>'f?p=&FLOW_ID.:44:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820396976568696882)
,p_name=>'P44_X1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5820289996855051197)
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
 p_id=>wwv_flow_api.id(5820397192152701384)
,p_name=>'P44_X2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5820289996855051197)
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
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820397700248713141)
,p_name=>'P44_X3'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5820289996855051197)
,p_prompt=>'Optional with help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820397876830715871)
,p_name=>'P44_X4'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5820289996855051197)
,p_prompt=>'Required'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074350417695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5820398086526718659)
,p_name=>'P44_X5'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5820289996855051197)
,p_prompt=>'Required with Help'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Long Progress List'
,p_page_mode=>'NORMAL'
,p_step_title=>'Long Progress List'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820937594036066370)
,p_plug_name=>'Standard Wizard Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866071137750695051)
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
 p_id=>wwv_flow_api.id(5820940181857083323)
,p_plug_name=>'Long List (progress test)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(5820938487026083318)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073929647695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5820943379369128376)
,p_plug_name=>'hide show test'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069651354695047)
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
 p_id=>wwv_flow_api.id(5820942573782098408)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820937594036066370)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820942774967098410)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5820937594036066370)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_name=>'Login'
,p_alias=>'LOGIN'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067249494695038)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054718'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9848749341714633939)
,p_plug_name=>'Login'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
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
 p_id=>wwv_flow_api.id(9848749747927633958)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9848749341714633939)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'Login'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'LOGIN'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9848749441222633948)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9848749341714633939)
,p_prompt=>'User Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9848749643726633958)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9848749341714633939)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>20
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9848749952502633964)
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
 p_id=>wwv_flow_api.id(9848749837110633960)
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
 p_id=>wwv_flow_api.id(9848750125841633966)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'101'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9848750048479633966)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_name=>'Feedback'
,p_alias=>'FEEDBACK'
,p_page_mode=>'NORMAL'
,p_step_title=>'Feedback'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(6866068245660695041)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_page_comment=>'This page was generated by the feedback wizard'
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8956572418986859823)
,p_plug_name=>'Feedback'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(8956573224531859886)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8956572418986859823)
,p_button_name=>'SUBMIT'
,p_button_static_id=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3791847543330)
,p_button_image_alt=>'Submit Feedback'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8956572643205859868)
,p_name=>'P102_FEEDBACK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8956572418986859823)
,p_prompt=>'Feedback'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8956572819179859869)
,p_name=>'P102_X'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8956572418986859823)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8956573013782859870)
,p_name=>'P102_FEEDBACK_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8956572418986859823)
,p_prompt=>'Feedback Type'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select the_name, id from WWV_FLOW_FEEDBACK_TYPES order by id'
,p_cSize=>20
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8956573444048859909)
,p_validation_name=>'Feedback not null'
,p_validation_sequence=>10
,p_validation=>'P102_FEEDBACK'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Value must be specified'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(8956573224531859886)
,p_associated_item=>wwv_flow_api.id(8956572643205859868)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8956573617971859926)
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
 p_id=>wwv_flow_api.id(8956573838543859927)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Multi Level Lists'
,p_alias=>'MULTILISTS'
,p_page_mode=>'NORMAL'
,p_step_title=>'Multi Level Lists'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866068447599695041)
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
 p_id=>wwv_flow_api.id(9548613700984436597)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548623195275472759)
,p_plug_name=>'Tree'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9548615900422445928)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072448198695054)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'TREE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548627210297486578)
,p_plug_name=>'DHTML Tree'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9548615900422445928)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072558001695054)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'DTREE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548629187356498843)
,p_plug_name=>'DHTML Menu with Sublist'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070636174695048)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9548615900422445928)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073146013695054)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'DMENU'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548631896145510886)
,p_plug_name=>'DHTML List (Image) with Sublist'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070636174695048)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9548615900422445928)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073254638695055)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'DIMENU'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548637606581542295)
,p_plug_name=>'List Template Types'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9548615900422445928)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072634977695054)
,p_plug_query_row_template=>1
,p_plug_footer=>'<p>The Above list is a multi level list.  Parent 2 and Parent 3 have sub lists, however parent 2 seems to also link to page 6.</p>'
);
end;
/
prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Template Index'
,p_alias=>'TEMPLATEINDEX'
,p_page_mode=>'NORMAL'
,p_step_title=>'Template Index'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140507054718'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5818240786013062017)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(5818672578015466970)
,p_plug_name=>'Side Bar Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Testing Region Here'
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
 p_id=>wwv_flow_api.id(7086300724128085603)
,p_plug_name=>'List Region with Icon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069748753695047)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Test'
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
 p_id=>wwv_flow_api.id(7762314961134040661)
,p_plug_name=>'Standard Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069651354695047)
,p_plug_display_sequence=>49
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Standard'
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
 p_id=>wwv_flow_api.id(7849651452760479022)
,p_plug_name=>'Wizard Region Template'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866071137750695051)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'This region should be fixed width because its a wizard template.  Buttons should fit well.'
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
 p_id=>wwv_flow_api.id(8771316694400886128)
,p_plug_name=>'Nested Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866068854740695042)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'Testing Nested Region'
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
 p_id=>wwv_flow_api.id(9547858889319528699)
,p_plug_name=>'Theme Testing Application Notes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070529299695048)
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
 p_id=>wwv_flow_api.id(9548026092678747282)
,p_plug_name=>'Page Layout'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9548020307523723221)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9549827511938582478)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5818255603460076485)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5818240786013062017)
,p_button_name=>'P200_SEARCHBUTTON'
,p_button_static_id=>'P200_SEARCHBUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
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
 p_id=>wwv_flow_api.id(7849651760379481238)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7849651452760479022)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7849651960023481239)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7849651452760479022)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074732178695061)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next >'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5818255783184076486)
,p_branch_action=>'f?p=&FLOW_ID.:200:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5818255390300072732)
,p_name=>'P200_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5818240786013062017)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_attributes=>'class="sSearchField"'
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(6866074030923695055)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Region Templates'
,p_alias=>'REGIONTEMPLATES'
,p_page_mode=>'NORMAL'
,p_step_title=>'Region Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067855509695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9210161220131558455)
,p_plug_name=>'Report List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069329330695046)
,p_plug_display_sequence=>210
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
 p_id=>wwv_flow_api.id(9407798117400897156)
,p_plug_name=>'Wizard Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866071137750695051)
,p_plug_display_sequence=>180
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
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9407799340256903667)
,p_plug_name=>'Wizard Region with Icon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866071243755695052)
,p_plug_display_sequence=>190
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
 p_id=>wwv_flow_api.id(9408653913023755223)
,p_plug_name=>'Chart Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069436351695046)
,p_plug_display_sequence=>200
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
 p_id=>wwv_flow_api.id(8392419182867653118)
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
 p_id=>wwv_flow_api.id(8392419281042653118)
,p_chart_id=>wwv_flow_api.id(8392419182867653118)
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
 p_id=>wwv_flow_api.id(9549834924545671233)
,p_plug_name=>'Borderless Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866068854740695042)
,p_plug_display_sequence=>6
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
 p_id=>wwv_flow_api.id(9549835807014675645)
,p_plug_name=>'Bracketed Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866068955067695046)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(9549837208877685673)
,p_plug_name=>'Button Region with Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069153659695046)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.<br /><b>The BODY content is output after the formating HTML</b>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9549838125500690466)
,p_plug_name=>'Button Region without Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069258920695046)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BUTTON REGION WITHOUT TITLE<br />',
'&SAMPLE_TEXT.<br /><b>The BODY content is output after formating HTML</b>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9549838807276694664)
,p_plug_name=>'List WIth Icon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069329330695046)
,p_plug_display_sequence=>60
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
 p_id=>wwv_flow_api.id(9549839517319697562)
,p_plug_name=>'Form Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
,p_plug_display_sequence=>6.5
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
 p_id=>wwv_flow_api.id(9549840230479701419)
,p_plug_name=>'Hide and Show Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069651354695047)
,p_plug_display_sequence=>4
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
 p_id=>wwv_flow_api.id(9549845929495805195)
,p_plug_name=>'Navigation Region, Alternative 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070055963695047)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9549847017852811280)
,p_plug_name=>'Navigation Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>99
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9549849233913825374)
,p_plug_name=>'Region without Buttons and Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070154468695047)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.<br /><b>Region without Buttons and Title</b>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9549849911534828367)
,p_plug_name=>'Region without Title'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070259517695047)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'&SAMPLE_TEXT.<br /><b>Region without Title</b>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9549853722148897629)
,p_plug_name=>'Sidebar Region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9549854709465903424)
,p_plug_name=>'Sidebar Region, Alternatie 1'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070938464695051)
,p_plug_display_sequence=>170
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9810917375320529712)
,p_name=>'Reports Region'
,p_template=>wwv_flow_api.id(6866070529299695048)
,p_display_sequence=>0
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
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810917683097529744)
,p_query_column_id=>1
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'ORDER_ID'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810917773927529744)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'CUSTOMER_ID'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810917886746529745)
,p_query_column_id=>3
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>3
,p_column_heading=>'ORDER_TOTAL'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810917981470529745)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>4
,p_column_heading=>'ORDER_TIMESTAMP'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9810925070603537774)
,p_name=>'Reports Region 100% Width'
,p_template=>wwv_flow_api.id(6866070636174695048)
,p_display_sequence=>1
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
,p_query_num_rows=>15
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
 p_id=>wwv_flow_api.id(9810925265628537777)
,p_query_column_id=>1
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Order Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810925368193537777)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Customer Id'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810925471946537778)
,p_query_column_id=>3
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>3
,p_column_heading=>'Order Total'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810925585333537778)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>4
,p_column_heading=>'Order Timestamp'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9810929785840542238)
,p_name=>'Reports Region Alternative 1'
,p_template=>wwv_flow_api.id(6866070758559695048)
,p_display_sequence=>2
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
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810930291476542240)
,p_query_column_id=>1
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>1
,p_column_heading=>'ORDER_ID'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810929988907542239)
,p_query_column_id=>2
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>2
,p_column_heading=>'CUSTOMER_ID'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810930086924542239)
,p_query_column_id=>3
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>3
,p_column_heading=>'ORDER_TOTAL'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9810930162693542240)
,p_query_column_id=>4
,p_column_alias=>'ORDER_TIMESTAMP'
,p_column_display_sequence=>4
,p_column_heading=>'ORDER_TIMESTAMP'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9407762041846141699)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9549837208877685673)
,p_button_name=>'Test_4'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Test_4'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467947998017264942)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'CHANGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'CHANGE'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467955099237355518)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'CHANGE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Change'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467958671810413838)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Change2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Change'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9407760433058127387)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9549838125500690466)
,p_button_name=>'Test_2'
,p_button_static_id=>'Test_2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3791847543330)
,p_button_image_alt=>'Test_1'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9407762422233141701)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9549837208877685673)
,p_button_name=>'Test_6'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Test_4'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467948188663264943)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'CLOSE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074858076695061)
,p_button_image_alt=>'CLOSE'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467955290060355518)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'CLOSE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467958892477413839)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Close2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820393898301372038)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(9549849911534828367)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9407760225093127384)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9549838125500690466)
,p_button_name=>'Test_1'
,p_button_static_id=>'Test_1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3791847543330)
,p_button_image_alt=>'Test_1'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467948383647264943)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'COPY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'COPY'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467955500147355519)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'COPY1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Copy'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467959100420413839)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Copy2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Copy'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9407760643279127387)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9549838125500690466)
,p_button_name=>'Test_3'
,p_button_static_id=>'Test_3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(3791847543330)
,p_button_image_alt=>'Test_1'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467948591443264944)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'CREATE'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467955695807355519)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'CREATE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467959295286413840)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'CREATE2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820393684795368153)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(9549849911534828367)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9407762234986141700)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9549837208877685673)
,p_button_name=>'Test_5'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Test_4'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467948771314264944)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'CREATE2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'CREATE2'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467955887704355519)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'CREATE21'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467959495646413840)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'CREATE22'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create2'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467948976035264944)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'DELETE'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467956099094355520)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'DELETE1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467959680115413840)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Delete2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467949188324264945)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'EDIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'EDIT'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467956284348355520)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'EDIT1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467959887106413841)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Edit2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467949373099264945)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'EXPAND'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'EXPAND'
,p_button_position=>'REGION_TEMPLATE_EXPAND'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467956477400355521)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'Expand1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Expand'
,p_button_position=>'REGION_TEMPLATE_EXPAND'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467960082590413841)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Expand2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Expand'
,p_button_position=>'REGION_TEMPLATE_EXPAND'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467949594102264946)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'HELP'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'HELP'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467956697410355521)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'Help1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Help'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467960280803413842)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Help2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Help'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7091134939105165568)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9549838125500690466)
,p_button_name=>'Button2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Forward'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467949782566264946)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'NEXT'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467956894239355522)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'Next1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467960475058413842)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Next2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7091134751479165543)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9549838125500690466)
,p_button_name=>'Button1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Back'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467949987120264946)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'PREVIOUS'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467957073018355522)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'Previous1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467960699893413843)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'Previous2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467947773759264940)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_button_name=>'DEFAULT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'DEFAULT'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467954892600355515)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9407798117400897156)
,p_button_name=>'DEFAULT1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Default'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9467958497887413836)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9407799340256903667)
,p_button_name=>'DEFAULT2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Default'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9811750590209584310)
,p_name=>'P201_FOR_DEMO_FORM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_prompt=>'For Demo Form'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9811752970600588106)
,p_name=>'P201_FOR_DEMO_FORM_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9549839517319697562)
,p_prompt=>'For Demo Form 2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_step_template=>wwv_flow_api.id(6866068643533695041)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20140328112156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9547733606574878690)
,p_plug_name=>'Label Demo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866069537100695047)
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
 p_id=>wwv_flow_api.id(9547740292231546898)
,p_plug_name=>'Templates'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9547733908736878691)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P202_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9547734098506878692)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9547733793887878691)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P202_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9547733999413878691)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P202_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9547734702993878696)
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9463190181796548030)
,p_name=>'FVD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9547734891367878697)
,p_name=>'P202_PRODUCT_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Id'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9547735093344878703)
,p_name=>'P202_PRODUCT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Required Label'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074350417695058)
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
 p_id=>wwv_flow_api.id(9547735301123878705)
,p_name=>'P202_PRODUCT_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Optional Label'
,p_source=>'PRODUCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9547735503009878705)
,p_name=>'P202_CATEGORY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Optional Label with Help'
,p_source=>'CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>31
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
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
 p_id=>wwv_flow_api.id(9547735690694878706)
,p_name=>'P202_PRODUCT_AVAIL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Required Label with Help'
,p_source=>'PRODUCT_AVAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074454353695058)
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
 p_id=>wwv_flow_api.id(9547735886803878706)
,p_name=>'P202_LIST_PRICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_use_cache_before_default=>'NO'
,p_prompt=>'List Price'
,p_source=>'LIST_PRICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9547736085518878707)
,p_name=>'P202_IMAGE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(9547733606574878690)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Image Id'
,p_source=>'IMAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074245808695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(9467943489202184152)
,p_validation_name=>'P202_PRODUCT_NAME'
,p_validation_sequence=>10
,p_validation=>'P202_PRODUCT_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Value must be specified.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(9547735093344878703)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9547736312748878708)
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
 p_id=>wwv_flow_api.id(9547736697943878710)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'202'
,p_process_when_button_id=>wwv_flow_api.id(9547733999413878691)
);
end;
/
prompt --application/pages/page_00204
begin
wwv_flow_api.create_page(
 p_id=>204
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Report Templates'
,p_alias=>'REPORTTEMPLATES'
,p_page_mode=>'NORMAL'
,p_step_title=>'Report Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20141203171656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3725444964120088046)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(6866070335822695047)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(3725445061200088047)
,p_name=>'Classic Report'
,p_template=>wwv_flow_api.id(6866070529299695048)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select * from (',
'select	 "DEMO_PRODUCT_INFO"."PRODUCT_NAME" as "PRODUCT_NAME",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_DESCRIPTION" as "PRODUCT_DESCRIPTION",',
'	 "DEMO_PRODUCT_INFO"."CATEGORY" as "CATEGORY",',
'	 "DEMO_PRODUCT_INFO"."PRODUCT_AVAIL" as "PRODUCT_AVAIL" ',
' from	 "DEMO_PRODUCT_INFO" "DEMO_PRODUCT_INFO")',
'where (',
' instr(upper("PRODUCT_NAME"),upper(nvl(:P204_SEARCH,"PRODUCT_NAME"))) > 0  or',
' instr(upper("PRODUCT_DESCRIPTION"),upper(nvl(:P204_SEARCH,"PRODUCT_DESCRIPTION"))) > 0 ',
')',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_num_rows_item=>'P204_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3725449064435088060)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'PRODUCT_NAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3725449136554088060)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'PRODUCT_DESCRIPTION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3725449239345088060)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'CATEGORY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3725449348359088060)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'PRODUCT_AVAIL'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5820417805356133774)
,p_name=>'Tabular Form with Report Template (Standard)'
,p_template=>wwv_flow_api.id(6866070529299695048)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'"DEPTNO",',
'"DEPTNO" DEPTNO_DISPLAY,',
'"DNAME",',
'"LOC"',
'from "#OWNER#"."DEPT"',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
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
 p_id=>wwv_flow_api.id(5820419899532133830)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5820418083566133786)
,p_query_column_id=>2
,p_column_alias=>'DEPTNO'
,p_column_display_sequence=>2
,p_column_heading=>'Deptno'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_column_width=>16
,p_pk_col_source_type=>'T'
,p_ref_schema=>'APEX_040000'
,p_ref_table_name=>'DEPT'
,p_ref_column_name=>'DEPTNO'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5820418188601133788)
,p_query_column_id=>3
,p_column_alias=>'DEPTNO_DISPLAY'
,p_column_display_sequence=>3
,p_column_heading=>'Deptno'
,p_disable_sort_column=>'N'
,p_column_width=>16
,p_ref_schema=>'APEX_040000'
,p_ref_table_name=>'DEPT'
,p_ref_column_name=>'DEPTNO_DISPLAY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5820418297676133788)
,p_query_column_id=>4
,p_column_alias=>'DNAME'
,p_column_display_sequence=>4
,p_column_heading=>'Dname'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>14
,p_ref_schema=>'APEX_040000'
,p_ref_table_name=>'DEPT'
,p_ref_column_name=>'DNAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5820418387733133788)
,p_query_column_id=>5
,p_column_alias=>'LOC'
,p_column_display_sequence=>5
,p_column_heading=>'Loc'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>13
,p_ref_schema=>'APEX_040000'
,p_ref_table_name=>'DEPT'
,p_ref_column_name=>'LOC'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9547841098913398980)
,p_name=>'Reports Region (Standard) - Partial Page Refresh = No'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
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
 p_id=>wwv_flow_api.id(9547841400707399006)
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
 p_id=>wwv_flow_api.id(9547841487479399009)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547841611708399009)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547841691008399009)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9547842693157406788)
,p_name=>'Report Template (Standard Alt 1)'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866072040629695052)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'SEARCH_ENGINE'
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
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547842883886406791)
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
 p_id=>wwv_flow_api.id(9547842981957406791)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547843093815406792)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547843195941406792)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9547845893681444819)
,p_name=>'Report Template (Borderless)'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866071427283695052)
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
 p_id=>wwv_flow_api.id(9547846100239444821)
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
 p_id=>wwv_flow_api.id(9547846209669444822)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547846303267444822)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547846380483444822)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9547847890695453371)
,p_name=>'Report Template (Horizontal Border)'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866071633433695052)
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
 p_id=>wwv_flow_api.id(9547848081692453372)
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
 p_id=>wwv_flow_api.id(9547848192658453372)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Product<br>Description<br>Multiline'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547848304544453372)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9547848404406453372)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_AVAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Product Avail'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_include_in_export=>'Y'
,p_print_col_width=>'25'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9547850309312477737)
,p_name=>'Report Template (Standard) - Partial Page Refresh = Yes'
,p_template=>wwv_flow_api.id(6866070529299695048)
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
,p_query_row_template=>wwv_flow_api.id(6866071947086695052)
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
 p_id=>wwv_flow_api.id(9547850494823477739)
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
 p_id=>wwv_flow_api.id(9547850608223477739)
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
 p_id=>wwv_flow_api.id(9547850692911477739)
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
 p_id=>wwv_flow_api.id(9547850783225477740)
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
 p_id=>wwv_flow_api.id(9547858197846521732)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3725447961594088052)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(3725444964120088046)
,p_button_name=>'P204_GO'
,p_button_static_id=>'P204_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
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
 p_id=>wwv_flow_api.id(3725448140306088053)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(3725444964120088046)
,p_button_name=>'P204_RESET'
,p_button_static_id=>'P204_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'RESET'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820418778364133817)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5820417805356133774)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Add Row'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:addRow();'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820418580293133817)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5820417805356133774)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820418501296133817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5820417805356133774)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5820418701486133817)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5820417805356133774)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(6866074553808695058)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5820419974086133830)
,p_branch_action=>'f?p=&APP_ID.:204:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3725448763706088056)
,p_branch_action=>'f?p=&APP_ID.:204:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3725447548329088052)
,p_name=>'P204_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3725444964120088046)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3725447745174088052)
,p_name=>'P204_ROWS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3725444964120088046)
,p_item_default=>'15'
,p_prompt=>'Display'
,p_source=>'15'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P204_Report Row Per Page'
,p_lov=>'.'||wwv_flow_api.id(3725445166235088048)||'.'
,p_cSize=>30
,p_cMaxlength=>2000
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(6866074133349695058)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3725448350041088054)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_attribute_01=>'THIS_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GO,P204_SEARCH,RESET'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5820419473460133825)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(5820417805356133774)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEPT'
,p_attribute_03=>'DEPTNO'
,p_process_error_message=>'Unable to process update.'
,p_process_when_button_id=>wwv_flow_api.id(5820418580293133817)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3725448554811088054)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Reset report search'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P204_SEARCH,P204_ROWS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3725448140306088053)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5820419693604133829)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(5820417805356133774)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Menu Templates'
,p_page_mode=>'NORMAL'
,p_step_title=>'Menu Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067855509695040)
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
 p_id=>wwv_flow_api.id(5808947989824296835)
,p_plug_name=>'Standard Tabs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>8
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073356918695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5814070381528314015)
,p_plug_name=>'Progress List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072846445695054)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9547857488149518921)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548383992021218299)
,p_plug_name=>'Vertical List w Bullets'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070841457695051)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073736258695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548386009467232747)
,p_plug_name=>'Vertical List w/o Bullets'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070636174695048)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073843421695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548421009972469451)
,p_plug_name=>'Vertical Ordered List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070938464695051)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073559679695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548422404216477300)
,p_plug_name=>'Wizard Progress List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070055963695047)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073929647695055)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548443988873440946)
,p_plug_name=>'Button List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072341897695053)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548603011579354470)
,p_plug_name=>'Horizontal Images with Label List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072634977695054)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548603584006355961)
,p_plug_name=>'Horizontal Links List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866072736917695054)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548605507685372291)
,p_plug_name=>'Vertical Images List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866070758559695048)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073448356695055)
,p_plug_query_row_template=>1
);
end;
/
prompt --application/pages/page_00206
begin
wwv_flow_api.create_page(
 p_id=>206
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
,p_tab_set=>'TS1'
,p_name=>'Menu Templates'
,p_page_mode=>'NORMAL'
,p_step_title=>'Menu Templates'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9547863697200549847)
,p_plug_name=>'Region 3'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6866069954347695047)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(9549827036048580010)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6866073655037695055)
,p_plug_query_row_template=>1
);
end;
/
prompt --application/pages/page_00210
begin
wwv_flow_api.create_page(
 p_id=>210
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
 p_id=>wwv_flow_api.id(9547790481851637048)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547791195010640895)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547792109901645230)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547793399643651657)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547794285229656981)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547794995965660135)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547795711549664583)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547796393672668864)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547797081682674889)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547797802807680982)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547798484584685239)
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
 p_id=>wwv_flow_api.id(9812202560230436683)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_step_template=>wwv_flow_api.id(6866067732264695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9547825203435237590)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547825386220237606)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547825609926237607)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547825790278237607)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547826000245237608)
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
 p_id=>wwv_flow_api.id(9547826190346237608)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547826406865237609)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547826601639237609)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547826782655237610)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547826995180237610)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9547827184272237612)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9812208966248447928)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_step_template=>wwv_flow_api.id(6866068747353695042)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548029708987893189)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548029883731893190)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548030511874893193)
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
 p_id=>wwv_flow_api.id(9548030694780893193)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548030903410893194)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548031105325893195)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548031283358893195)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548031707591893196)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548031896951893197)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9812212685988453592)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_step_template=>wwv_flow_api.id(6866068447599695041)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548034012618903495)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548034180688903498)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548034381958903499)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548034609619903500)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548034809757903501)
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
 p_id=>wwv_flow_api.id(9548034990097903505)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548035202416903505)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548035395646903506)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548035598574903506)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548035786002903507)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548035989999903507)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9812218284387462568)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_step_template=>wwv_flow_api.id(6866067655690695040)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548038290723918957)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548038487562918958)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548038681258918958)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548038894194918959)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548039095437918960)
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
 p_id=>wwv_flow_api.id(9548039293865918964)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548039509192918964)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548039685217918965)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548039910336918965)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548040094946918966)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548040290885918966)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9812221571012468183)
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
,p_user_interface_id=>wwv_flow_api.id(24045711997053447)
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
,p_step_template=>wwv_flow_api.id(6866067333434695039)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20140326085030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9548042795203928124)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548043004916928125)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548043192474928125)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548043407125928126)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548043598658928126)
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
 p_id=>wwv_flow_api.id(9548043792272928127)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548044006405928129)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548044208480928130)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548044396101928130)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548044608865928131)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548044806838928131)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9548044985365928132)
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
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(9812224361447474853)
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
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
