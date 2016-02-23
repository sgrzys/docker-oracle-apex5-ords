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
,p_default_application_id=>4752
,p_default_owner=>'APEX_050000'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 4752 - Oracle APEX Packaged Applications
--
-- Application Export:
--   Application:     4752
--   Name:            Oracle APEX Packaged Applications
--   Exported By:     APEX_050000
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.02
--   Instance ID:     113808939374227
--

-- Application Statistics:
--   Pages:                     41
--     Items:                  202
--     Computations:            26
--     Validations:             49
--     Processes:               50
--     Regions:                156
--     Buttons:                 71
--     Dynamic Actions:         35
--   Shared Components:
--     Logic:
--       Items:                  4
--       Computations:           2
--       Build Options:          1
--     Navigation:
--       Lists:                 13
--       Breadcrumbs:            1
--         Entries:             30
--       NavBar Entries:         1
--     Security:
--       Authentication:         1
--       Authorization:         14
--     User Interface:
--       Templates:
--         Page:                 7
--         Region:              11
--         Label:                7
--         List:                 6
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               6
--         Report:               8
--       LOVs:                  23
--       Plug-ins:              14
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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,4752)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEX_050000')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX Packaged Applications')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A902295780319410126')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20151205181359'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'fr'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(539943211297143567.4752)
,p_application_tab_set=>1
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
,p_runtime_api_usage=>'O:W'
,p_security_scheme=>wwv_flow_api.id(806250634212071966)
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'wwv_flow_error_dev.internal_error_handler'
,p_substitution_string_01=>'HELP'
,p_substitution_value_01=>'Aide'
,p_substitution_string_02=>'PRODUCT_NAME'
,p_substitution_value_02=>'Application Express'
,p_substitution_string_03=>'MSG_COMPANY'
,p_substitution_value_03=>'Espace de travail : &COMPANY.'
,p_substitution_string_04=>'MSG_LANGUAGE'
,p_substitution_value_04=>'Langue'
,p_substitution_string_05=>'MSG_COPYRIGHT'
,p_substitution_value_05=>'Copyright &copy; 1999, 2015, Oracle. Tous droits réservés.'
,p_substitution_string_06=>'MSG_USER'
,p_substitution_value_06=>'Utilisateur'
,p_substitution_string_07=>'MSG_JSCRIPT'
,p_substitution_value_07=>'JavaScript doit être activé lorsque vous exécutez ce produit.'
,p_substitution_string_08=>'MSG_TBL_SUMMARY'
,p_substitution_value_08=>'Table de mise en page'
,p_substitution_string_09=>'EDIT'
,p_substitution_value_09=>'Modifier'
,p_substitution_string_10=>'DONE'
,p_substitution_value_10=>'Terminé'
,p_substitution_string_11=>'TOP'
,p_substitution_value_11=>'Haut'
,p_substitution_string_12=>'CLOSE'
,p_substitution_value_12=>'Fermer'
,p_substitution_string_13=>'CONFIRM'
,p_substitution_value_13=>'Confirmer'
,p_substitution_string_14=>'DATE_FORMAT'
,p_substitution_value_14=>'dd/mm/rr'
,p_substitution_string_15=>'LONG_DATE_FORMAT'
,p_substitution_value_15=>'fmDay dd Month yyyy'
,p_substitution_string_16=>'TIME_FORMAT'
,p_substitution_value_16=>'hh24:mi:ss'
,p_substitution_string_17=>'DATE_TIME_FORMAT'
,p_substitution_value_17=>'dd/mm/rr hh24:mi:ss'
,p_substitution_string_18=>'RETURN_TO_APP'
,p_substitution_value_18=>'Retour à l''application'
,p_substitution_string_19=>'DELETE_MSG'
,p_substitution_value_19=>'Voulez-vous effectuer cette action de suppression ?'
,p_substitution_string_20=>'PAGE'
,p_substitution_value_20=>'Page'
,p_last_upd_yyyymmddhh24miss=>'20151205181315'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(697584654501422607.4752)
,p_name=>'APEX 5 - Administration (Header)'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697584848032422609.4752)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=4350:1:&APP_SESSION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697585197430422609.4752)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697585449821422609.4752)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Gérer un service'
,p_security_scheme=>wwv_flow_api.id(404682514053862570)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697585763975422610.4752)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Gérer un service'
,p_list_item_link_target=>'f?p=4350:21:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697585449821422609.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697586015426422610.4752)
,p_list_item_display_sequence=>215
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(697585449821422609.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697586354477422610.4752)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Faire une demande de service'
,p_list_item_link_target=>'f?p=4350:96:&SESSION.::NO:49::'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''SERVICE_REQUESTS_ENABLED'') = ''Y'''
,p_parent_list_item_id=>wwv_flow_api.id(697585449821422609.4752)
,p_security_scheme=>wwv_flow_api.id(404682514053862570)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697586632510422611.4752)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'Définir des préférences d''espace de travail'
,p_list_item_link_target=>'f?p=4350:17:&SESSION.::NO:RP::'
,p_parent_list_item_id=>wwv_flow_api.id(697585449821422609.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697586992140422611.4752)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Modifier une annonce'
,p_list_item_link_target=>'f?p=4350:35:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697585449821422609.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697587277472422611.4752)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'Utilisation d''espace de travail'
,p_list_item_link_target=>'f?p=4350:101:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(697585449821422609.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697587582961422612.4752)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'Gérer les utilisateurs et les groupes'
,p_list_item_link_target=>'f?p=4350:55:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(404682514053862570)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697587853738422612.4752)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Surveiller l''activité'
,p_list_item_link_target=>'f?p=4350:22:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(404690492509862587)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697588196393422612.4752)
,p_list_item_display_sequence=>500
,p_list_item_link_text=>'Tableaux de bord'
,p_list_item_link_target=>'f?p=4350:33:&SESSION.'
,p_security_scheme=>wwv_flow_api.id(404690492509862587)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1250834841571213656.4752)
,p_list_item_display_sequence=>600
,p_list_item_link_text=>'Changer mon mot de passe'
,p_list_item_link_target=>'f?p=4350:3:&SESSION.::&DEBUG.:3#pwd'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_security_scheme=>wwv_flow_api.id(404690492509862587)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(697615600061428203.4752)
,p_name=>'APEX 5 - Help'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697615898751428203.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Documentation'
,p_list_item_link_target=>'&SYSTEM_HELP_URL.'
,p_list_text_01=>'helpLinkNewWindow'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2105955959214049535.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Forum de discussion'
,p_list_item_link_target=>'https://apex.oracle.com/forum'
,p_list_text_01=>'helpLinkForum'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2185501568508575816.4752)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Oracle Technology Network'
,p_list_item_link_target=>'http://otn.oracle.com/apex'
,p_list_text_01=>'helpLinkOTN'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697616716682428203.4752)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(697617094963428203.4752)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'A propos de'
,p_list_item_link_target=>'f?p=4350:9:&SESSION.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(719097510387175373.4752)
,p_name=>'APEX 5 - Tabs'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Concepteur d''applications'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW::'
,p_list_item_icon_alt_attribute=>'Analyse descendante de concepteur d''applications'
,p_list_text_01=>'tab-app-builder'
,p_security_scheme=>wwv_flow_api.id(746087390984722118)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719098028313175375.4752)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Applications de base de données'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW:DATABASE:'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719098321380175375.4752)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Applications Web'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::P1500_SHOW:WEBSHEET:'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719098639990175375.4752)
,p_list_item_display_sequence=>125
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719098992508175375.4752)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Créer'
,p_list_item_link_target=>'f?p=4000:56:&SESSION.::NO:56,103,104,106,130,131,4011,4012,4013,4059,4061,35,262,227,3020,3000,3001:FB_FLOW_ID,FB_FLOW_PAGE_ID:'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719099266704175376.4752)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Importer'
,p_list_item_link_target=>'f?p=4000:460:&SESSION.::&DEBUG.:460:F4000_P56_CREATE_OPTION,P460_FILE_TYPE:IMP,FLOW_EXPORT:'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719099546300175376.4752)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Exporter'
,p_list_item_link_target=>'f?p=4000:523:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719099824007175376.4752)
,p_list_item_display_sequence=>155
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Utilitaires d''espace de travail'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719100455998175377.4752)
,p_list_item_display_sequence=>161
,p_list_item_link_text=>'Tous les utilitaires d''espace de travail'
,p_list_item_link_target=>'f?p=4000:182:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719100773299175377.4752)
,p_list_item_display_sequence=>162
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719101097849175377.4752)
,p_list_item_display_sequence=>163
,p_list_item_link_text=>'Valeurs par défaut du concepteur d''applications'
,p_list_item_link_target=>'f?p=4000:800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719101644205175378.4752)
,p_list_item_display_sequence=>165
,p_list_item_link_text=>'Thèmes d''espace de travail'
,p_list_item_link_target=>'f?p=4000:763:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719101935050175380.4752)
,p_list_item_display_sequence=>166
,p_list_item_link_text=>'Groupes d''applications'
,p_list_item_link_target=>'f?p=4000:722:&SESSION.::&DEBUG.:RP'
,p_parent_list_item_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719102257549175380.4752)
,p_list_item_display_sequence=>167
,p_list_item_link_text=>'Vues Application Express'
,p_list_item_link_target=>'f?p=4000:714:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719102594130175381.4752)
,p_list_item_display_sequence=>168
,p_list_item_link_text=>'Etats inter-applications'
,p_list_item_link_target=>'f?p=4000:9009:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719100155318175376.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719102894713175381.4752)
,p_list_item_display_sequence=>169
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719103155672175381.4752)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Migrations'
,p_list_item_link_target=>'f?p=4400:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719097773376175375.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719103492129175381.4752)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Atelier SQL'
,p_list_item_link_target=>'f?p=4500:3002:&SESSION.'
,p_list_item_icon_alt_attribute=>'Analyse descendante de l''atelier SQL'
,p_list_text_01=>'tab-sql-workshop'
,p_security_scheme=>wwv_flow_api.id(404692541807863512)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719103785484175382.4752)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Navigateur d''objet'
,p_list_item_link_target=>'f?p=4500:1001:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719103492129175381.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719104043205175382.4752)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Commandes SQL'
,p_list_item_link_target=>'f?p=4500:1003:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719103492129175381.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719104303044175382.4752)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'Scripts SQL'
,p_list_item_link_target=>'f?p=4500:1004:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719103492129175381.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Utilitaires'
,p_parent_list_item_id=>wwv_flow_api.id(719103492129175381.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719104915398175382.4752)
,p_list_item_display_sequence=>241
,p_list_item_link_text=>'Tous les utilitaires'
,p_list_item_link_target=>'f?p=4500:1005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719105254051175382.4752)
,p_list_item_display_sequence=>242
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719105556872175383.4752)
,p_list_item_display_sequence=>243
,p_list_item_link_text=>'Atelier de données'
,p_list_item_link_target=>'f?p=4300:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719105899675175383.4752)
,p_list_item_display_sequence=>244
,p_list_item_link_text=>'Concepteur de requêtes'
,p_list_item_link_target=>'f?p=4500:1002:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719106178230175383.4752)
,p_list_item_display_sequence=>245
,p_list_item_link_text=>'Générer du DDL'
,p_list_item_link_target=>'f?p=4500:12:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719106492099175384.4752)
,p_list_item_display_sequence=>246
,p_list_item_link_text=>'Valeurs par défaut d''interface utilisateur'
,p_list_item_link_target=>'f?p=4500:813:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719106738745175384.4752)
,p_list_item_display_sequence=>247
,p_list_item_link_text=>'Méthodes sur les tables'
,p_list_item_link_target=>'f?p=4500:120:&SESSION.::NO::P117_CREATE_PACKAGE:TABLE'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719107028410175384.4752)
,p_list_item_display_sequence=>248
,p_list_item_link_text=>'A propos de la base de données'
,p_list_item_link_target=>'f?p=4500:36:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719107342427175384.4752)
,p_list_item_display_sequence=>249
,p_list_item_link_text=>'Etats sur les objets'
,p_list_item_link_target=>'f?p=4500:1042:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719107689961175384.4752)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'Moniteur de base de données'
,p_list_item_link_target=>'f?p=4500:11:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719107910006175384.4752)
,p_list_item_display_sequence=>251
,p_list_item_link_text=>'Comparaison de schémas'
,p_list_item_link_target=>'f?p=4500:1350:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719108292576175384.4752)
,p_list_item_display_sequence=>252
,p_list_item_link_text=>'Corbeille'
,p_list_item_link_target=>'f?p=4500:1070:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719104635487175382.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719108571085175384.4752)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'Services RESTful'
,p_list_item_link_target=>'f?p=4850:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719103492129175381.4752)
,p_security_scheme=>wwv_flow_api.id(404702144894863525)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'Développement d''équipe'
,p_list_item_link_target=>'f?p=4800:4000:&SESSION.'
,p_list_item_icon_alt_attribute=>'Analyse descendante de développement d''équipe'
,p_list_text_01=>'tab-team-dev'
,p_security_scheme=>wwv_flow_api.id(404693461378863512)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719109132011175385.4752)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>'Jalons'
,p_list_item_link_target=>'f?p=4800:6006:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719109459789175385.4752)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>'Fonctionnalités'
,p_list_item_link_target=>'f?p=4800:9010:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719109779086175385.4752)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'Tâches à effectuer'
,p_list_item_link_target=>'f?p=4800:3001:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719110005247175385.4752)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'Bugs'
,p_list_item_link_target=>'f?p=4800:3501:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719110388769175385.4752)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>'Informations en retour'
,p_list_item_link_target=>'f?p=4800:8012:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719110684924175385.4752)
,p_list_item_display_sequence=>355
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>'Utilitaires'
,p_parent_list_item_id=>wwv_flow_api.id(719108853679175384.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719111277961175386.4752)
,p_list_item_display_sequence=>361
,p_list_item_link_text=>'Tous les utilitaires'
,p_list_item_link_target=>'f?p=4800:2:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719111571406175386.4752)
,p_list_item_display_sequence=>362
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719111873291175386.4752)
,p_list_item_display_sequence=>363
,p_list_item_link_text=>'Paramètres de développement d''équipe'
,p_list_item_link_target=>'f?p=4800:3005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719112153192175386.4752)
,p_list_item_display_sequence=>364
,p_list_item_link_text=>'Récapitulatif de version'
,p_list_item_link_target=>'f?p=4800:4050:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719112445248175386.4752)
,p_list_item_display_sequence=>365
,p_list_item_link_text=>'Activer les fichiers'
,p_list_item_link_target=>'f?p=4350:17:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719112708660175386.4752)
,p_list_item_display_sequence=>366
,p_list_item_link_text=>'Relancer les bugs échus'
,p_list_item_link_target=>'f?p=4800:5:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719113037557175386.4752)
,p_list_item_display_sequence=>367
,p_list_item_link_text=>'Utilitaires de fonctionnalités'
,p_list_item_link_target=>'f?p=4800:9013:&SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719113360673175386.4752)
,p_list_item_display_sequence=>368
,p_list_item_link_text=>'Gérer les domaines d''attention'
,p_list_item_link_target=>'f?p=4800:9020:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719113608344175387.4752)
,p_list_item_display_sequence=>369
,p_list_item_link_text=>'Mettre à jour les destinataires'
,p_list_item_link_target=>'f?p=4800:6004:&SESSION.::&DEBUG.:6004:::'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719113963784175387.4752)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'Visualiser les fichiers'
,p_list_item_link_target=>'f?p=4800:9:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719114238664175387.4752)
,p_list_item_display_sequence=>371
,p_list_item_link_text=>'Purger les données'
,p_list_item_link_target=>'f?p=4800:6:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719114524363175387.4752)
,p_list_item_display_sequence=>372
,p_list_item_link_text=>'Gérer les actualités'
,p_list_item_link_target=>'f?p=4800:7000:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719114837155175388.4752)
,p_list_item_display_sequence=>373
,p_list_item_link_text=>'Gérer les liens'
,p_list_item_link_target=>'f?p=4800:5000:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_api.id(719110951891175386.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719115154029175388.4752)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Applications packagées'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:::'
,p_list_text_01=>'tab-apps'
,p_list_item_current_type=>'ALWAYS'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719115401508175388.4752)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'Galerie d''applications'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:::'
,p_parent_list_item_id=>wwv_flow_api.id(719115154029175388.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719115788931175389.4752)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'Tableau de bord'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:::'
,p_parent_list_item_id=>wwv_flow_api.id(719115154029175388.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(719116059754175389.4752)
,p_list_item_display_sequence=>430
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:::'
,p_parent_list_item_id=>wwv_flow_api.id(719115154029175388.4752)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(750862626609892264.4752)
,p_name=>'APEX 5 Apps Homepage Large Icons'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(750865255905892284.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Galerie d''applications packagées'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:::'
,p_list_item_icon=>'pkg-apps'
,p_list_item_icon_attributes=>'width="128" height="128" alt=""'
,p_security_scheme=>wwv_flow_api.id(806250634212071966)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(750864917368892284.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tableau de bord'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'admin-dashboards'
,p_security_scheme=>wwv_flow_api.id(806250634212071966)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(750867323547901636.4752)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Administration des applications packagées'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'pkg-apps-admin'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(755598782624864560.4752)
,p_name=>'install pkg app steps'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(755598958319864565.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Authentification'
,p_list_item_link_target=>'f?p=&APP_ID.:828:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(755605746913926308.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Confirmer'
,p_list_item_link_target=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(798354195880640621.4752)
,p_name=>'Apps Admin - Manage Service'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(798354314490640626.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Faire une demande de service'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:100,101,102,103,104:::'
,p_list_item_icon=>'icon-admin-service-request'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''SERVICE_REQUESTS_ENABLED'') = ''Y'''
,p_list_text_01=>'Demandez l''accès à du stockage supplémentaire ou l''interruption de l''espace de travail.'
,p_translate_list_text_y_n=>'Y'
,p_security_scheme=>wwv_flow_api.id(404682514053862570)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(798354600868640627.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Définir des préférences d''espace de travail'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:22:::'
,p_list_item_icon=>'icon-admin-workspace-preferences'
,p_list_text_01=>'Configurez des préférences pour contrôler les fonctionnalités de l''espace de travail.'
,p_translate_list_text_y_n=>'Y'
,p_security_scheme=>wwv_flow_api.id(404682514053862570)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(798354927640640627.4752)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Gérer les utilisateurs'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:300:::'
,p_list_item_icon=>'icon-apex-user'
,p_list_text_01=>'Contrôlez l''accès pour les administrateurs d''espace de travail, développeurs d''application et utilisateurs finals d''Application Express.'
,p_translate_list_text_y_n=>'Y'
,p_security_scheme=>wwv_flow_api.id(1020614257688498212)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(798364561880730346.4752)
,p_name=>'Apps Admin - Manage Interactive Report Settings'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(798365057920730347.4752)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Etats enregistrés'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'icon-saved-reports'
,p_list_text_01=>'Visualisez et gérez les états interactifs enregistrés créés par les utilisateurs d''applications packagées.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(798364738779730346.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Abonnements'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'icon-report-subscriptions'
,p_list_text_01=>'Visualisez et gérez les abonnements d''état interactif créés par les utilisateurs d''applications packagées.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(802137241064353033.4752)
,p_name=>'users and groups APEX 5.0'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(802137448713353036.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Utilisateurs'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'300'
);
end;
/
begin
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(802137757188353046.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Groupes'
,p_list_item_link_target=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'53'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(802138028621353046.4752)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Affectations de groupes'
,p_list_item_link_target=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:RP,51:::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(805116320497552727.4752)
,p_name=>'Request Service Tasks'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(805116571468552728.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Etat détaillé Utilisation de tablespace (peut prendre plusieurs secondes)'
,p_list_item_link_target=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(805118624066572072.4752)
,p_name=>'Request Service Train'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(805118852090572072.4752)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Identifier une demande'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'100'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(805119135311572072.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Définir une demande'
,p_list_item_link_target=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'101,102'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(805119463661572072.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Confirmer'
,p_list_item_link_target=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'104,105'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(805137189383669602.4752)
,p_name=>'user_admin_tasks'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(805137300235669602.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Changer de mot de passe'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:24:::'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_security_scheme=>wwv_flow_api.id(805137509572669602)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(805139777603669606.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Supprimer plusieurs utilisateurs'
,p_list_item_link_target=>'f?p=&APP_ID.:305:&SESSION.::&DEBUG.:RIR:::'
,p_security_scheme=>wwv_flow_api.id(404682514053862570)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(808592810483273051.4752)
,p_name=>'App Admin - Activity Reports'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(815829845963386613.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Activité de l''application'
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'icon-utilities-activity'
,p_list_text_01=>'Calendrier mensuel d''activité de l''application, générant des états sur des utilisateurs distincts et sur le total de vues de page par jour.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(808593312294273056.4752)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Vues de page'
,p_list_item_link_target=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29:::'
,p_list_item_icon=>'icon-utilities-page-views'
,p_list_text_01=>'Etat interactif de chaque vue de page. Visualisez l''utilisateur, le temps écoulé et la page.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(808593649251273056.4752)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Principaux utilisateurs'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:::'
,p_list_item_icon=>'icon-apex-user'
,p_list_text_01=>'Etat des vues de page consolidées par utilisateur.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(808614585475666760.4752)
,p_name=>'admin_tasks'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(808614733789666761.4752)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Changer de mot de passe'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:24:::'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_security_scheme=>wwv_flow_api.id(805137509572669602)
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
 p_id=>wwv_flow_api.id(1355859641927129.4752)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(539923825535132353.4752)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1765073051796712055.4752)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(2006202085640903486.4752)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.APEX.FLOT.PIE'
,p_attribute_01=>'1.333'
,p_attribute_02=>'1.5'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(2010925785324119040.4752)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.FLOTLINECHART2'
,p_attribute_01=>'3'
,p_attribute_02=>'1.333'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(404682514053862570.4752)
,p_name=>'Flow: ADMIN'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'ADMIN'
,p_error_message=>'Vous n''êtes pas autorisé à administrer les applications'
,p_reference_id=>12511219858301010.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(404690492509862587.4752)
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
,p_error_message=>'Vous n''êtes pas autorisé à accéder aux tableaux de bord ni à la surveillance de l''activité.'
,p_reference_id=>786936829326142579.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(404692541807863512.4752)
,p_name=>'APEX 5.0 SQL Workshop Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'SQL'
,p_error_message=>'Vous n''êtes pas autorisé à utiliser l''atelier SQL'
,p_reference_id=>786516265251697717.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(404693461378863512.4752)
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
,p_error_message=>'Le développement d''équipe n''est pas activé pour cet espace de travail'
,p_reference_id=>786516861027697723.4752
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(404702144894863525.4752)
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
,p_error_message=>'Vous n''êtes pas autorisé à effectuer cette opération'
,p_reference_id=>786519856057734816.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(517057690758689585.4752)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>'Le SSO (accès avec connexion unique) Builder n''est pas activé'
,p_reference_id=>6738410669854771.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(746087390984722118.4752)
,p_name=>'APEX 5.0 Application Builder Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>'Vous n''êtes pas autorisé à effectuer cette opération'
,p_reference_id=>786516029127697713.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(750863029365892273.4752)
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
,p_error_message=>'Vous n''êtes pas autorisé à effectuer cette opération'
,p_reference_id=>786517166823697723.4752
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(750863634498892275.4752)
,p_name=>'Flow: EDIT'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>'Vous n''êtes pas autorisé à modifier des applications'
,p_reference_id=>12480509677812756.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(805137509572669602.4752)
,p_name=>'APEX Builder Workspace Authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication = ''APEX'';'
,p_error_message=>'L''environnement de développement utilise l''authentification externe'
,p_reference_id=>786940505486177571.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(805427695742857816.4752)
,p_name=>'Service Requests Enabled'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_platform.get_preference(''SERVICE_REQUESTS_ENABLED'') = ''Y'' then',
'    return TRUE;',
'else',
'    return FALSE;',
'end if;'))
,p_error_message=>'Vous n''êtes pas autorisé à effectuer cette opération.'
,p_reference_id=>786932326296107981.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(805549616798538577.4752)
,p_name=>'Apps Only Workspace'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow.apps_only_workspace;'
,p_error_message=>'Vous n''êtes pas autorisé à effectuer cette opération.'
,p_reference_id=>815805295659547960.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(806250634212071966.4752)
,p_name=>'APEX 5.0 Packaged App Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'PKG_APPS'
,p_error_message=>'Vous n''êtes pas autorisé à installer des applications packagées'
,p_reference_id=>786517456817697723.4752
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1020614257688498212.4752)
,p_name=>'Apps Only Manage User Access'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authorization.is_authorized_developer( p_developer_authorization => ''ADMIN'') and  wwv_flow.apps_only_workspace;'
,p_error_message=>'Vous n''êtes pas autorisé à effectuer cette opération.'
,p_reference_id=>1020612387794480463.4752
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(539940611479132428.4752)
,p_icon_sequence=>10
,p_icon_subtext=>'Déconnexion'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Déconnexion'
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
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(789451369950334881.4752)
,p_name=>'APPS_ONLY_WORKSPACE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(805305720618296184.4752)
,p_name=>'COMPANY'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_item_comment=>'Prints workspace name referenced in page templates'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(805473839925021275.4752)
,p_name=>'F4750_P301_USER_ID'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(801935533242345735.4752)
,p_name=>'LAST_VIEW'
,p_protection_level=>'I'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(805306383623314462.4752)
,p_computation_sequence=>10
,p_computation_item=>'COMPANY'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wwv_flow.get_company_name'
,p_compute_when=>'COMPANY'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_computation_error_message=>'Impossible de calculer le nom de l''espace de travail.'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(789457530043363220.4752)
,p_computation_sequence=>10
,p_computation_item=>'APPS_ONLY_WORKSPACE'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow.apps_only_workspace then',
'    return ''Y'';',
'else',
'    return ''N'';',
'end if;'))
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
 p_id=>wwv_flow_api.id(750872384409975173.4752)
,p_lov_name=>'ACCESSIBILITY_MODE'
,p_lov_query=>'.'||wwv_flow_api.id(750872384409975173)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(750872651883975174.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Lecteur d''écran'
,p_lov_return_value=>'SCREEN_READER'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805398623015787070.4752)
,p_lov_name=>'ACCOUNT_LOCK_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(805398623015787070)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805398984329787071.4752)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Verrouillé'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805399223273787071.4752)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Déverrouillé'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(492829526790527241.4752)
,p_lov_name=>'APEX END USERS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select user_name d, user_name r',
'from wwv_flow_fnd_user u',
'where security_group_id = :flow_security_group_id',
'and not exists (select null',
'                from wwv_flow_developers d',
'                where d.security_group_id = u.security_group_id',
'                and d.userid            = u.user_name',
'                and (instr(d.developer_role,''ADMIN'') > 0',
'                     or instr(d.developer_role,''EDIT'') > 0))',
'and nvl(u.account_locked,''N'') = ''N''',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805346280616446827.4752)
,p_lov_name=>'CREATE.MULT.USER.STRIP.DOMAIN'
,p_lov_query=>'.'||wwv_flow_api.id(805346280616446827)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805346589515446828.4752)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Définir le nom utilisateur sur l''adresse électronique complète'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805346868716446830.4752)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Exclure @domaine du nom utilisateur'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(801895490296261989.4752)
,p_lov_name=>'DEVELOPER TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(801895490296261989)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(801895719161261989.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Oui'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(801896091470261989.4752)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Non'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805446669974928665.4752)
,p_lov_name=>'EXPIRE USER ACCOUNTS'
,p_lov_query=>'.'||wwv_flow_api.id(805446669974928665)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805446914472928666.4752)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Activer'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805447209740928666.4752)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Désactiver'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(801896378178261989.4752)
,p_lov_name=>'F4350_FND_GROUP_IDS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(group_name) d, id r',
'  from wwv_flow_fnd_user_groups',
' where security_group_id in (:flow_security_group_id,10)',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805284490639012075.4752)
,p_lov_name=>'IR_NOTIFY_INTERVAL'
,p_lov_query=>'.'||wwv_flow_api.id(805284490639012075)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805284794704012075.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Quotidien'
,p_lov_return_value=>'D'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805285009454012075.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Hebdomadaire'
,p_lov_return_value=>'W'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805285318472012075.4752)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Mensuel'
,p_lov_return_value=>'M'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805215191044829557.4752)
,p_lov_name=>'IR_NOTIFY_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(805215191044829557)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805215448430829557.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Soumis'
,p_lov_return_value=>'SUBMITTED'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805215780495829557.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Envoyé'
,p_lov_return_value=>'SENT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805216003045829557.4752)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Erreur'
,p_lov_return_value=>'ERROR'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805395834107760451.4752)
,p_lov_name=>'IR_REPORT_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(805395834107760451)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805396132813760451.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Val. par défaut du principal'
,p_lov_return_value=>'PRIMARY_DEFAULT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805396419095760452.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Val. par défaut du remplaçant'
,p_lov_return_value=>'ALTERNATIVE_DEFAULT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805396707756760452.4752)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Public'
,p_lov_return_value=>'PUBLIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805397045712760452.4752)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Privé'
,p_lov_return_value=>'	PRIVATE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805149229047727280.4752)
,p_lov_name=>'IR_USER_RPT_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(805149229047727280)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805149598764727280.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Public'
,p_lov_return_value=>'PUBLIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805149816021727280.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Privé'
,p_lov_return_value=>'PRIVATE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805509014809047810.4752)
,p_lov_name=>'LIST_AVAILABLE_SCHEMAS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(schema) d, schema r',
'',
'from   wwv_flow_company_schemas',
'',
'where  security_group_id = :flow_security_group_id',
'',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(818319918283815176.4752)
,p_lov_name=>'P30_VIEW_AS'
,p_lov_query=>'.'||wwv_flow_api.id(818319918283815176)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(818320265337815178.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Graphique'
,p_lov_return_value=>'CHART'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(818320554241815181.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Etat'
,p_lov_return_value=>'REPORT'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(931635900643222282.4752)
,p_lov_name=>'P7_PKG_APP_TASKS'
,p_lov_query=>'.'||wwv_flow_api.id(931635900643222282)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(931678677005143844.4752)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Mettre à jour'
,p_lov_return_value=>'UPDATE'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-pkg-app-install'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where a.app_id = m.app_id',
'and m.security_group_id = :flow_security_group_id',
'and a.app_id = :P7_APP_ID',
'and a.build_version > m.installed_build_version',
'and nvl(m.application_locked,''Y'') = ''Y'''))
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(931639477437295149.4752)
,p_lov_disp_sequence=>35
,p_lov_disp_value=>'Modifier authentification'
,p_lov_return_value=>'CHANGE_AUTH'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-pkg-app-chg-auth'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where a.app_id = m.app_id',
'and m.security_group_id = :flow_security_group_id',
'and a.app_id = :P7_APP_ID',
'and a.app_type = ''DB'''))
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(931636881822222290.4752)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Déverrouiller'
,p_lov_return_value=>'UNLOCK'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-pkg-app-unlock'
,p_lov_disp_cond_type=>'FUNCTION_BODY'
,p_lov_disp_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_db_app_n_locked boolean := false;',
'begin',
'	for c1 in (select null',
'	           from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'	           where a.app_id = m.app_id',
'	           and m.security_group_id = :flow_security_group_id',
'	           and a.app_id = :P7_APP_ID',
'	           and a.app_type = ''DB''',
'	           and nvl(m.application_locked,''Y'') = ''Y'')',
'	loop',
'		l_db_app_n_locked := true;',
'	end loop;',
'',
'	if l_db_app_n_locked then',
'		-- unlock available to full workspace with user who has builder access',
'		if not wwv_flow.apps_only_workspace and wwv_flow_authorization.is_authorized_developer (p_developer_authorization => ''EDIT'') then',
'			return true;',
'		end if;',
'	end if;',
'	return false;',
'end;'))
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(931636596704222290.4752)
,p_lov_disp_sequence=>55
,p_lov_disp_value=>'Enlever'
,p_lov_return_value=>'REMOVE'
,p_lov_template=>'#DISPLAY_VALUE#| gi-icon-pkg-app-remove'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where a.app_id = m.app_id',
'and m.security_group_id = :flow_security_group_id',
'and a.app_id = :P7_APP_ID'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(806412552593441624.4752)
,p_lov_name=>'PACKAGED_APP_AUTH_OPTION'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.''|| name_with_prefix) as d,',
'       name_with_prefix      as r',
'  from wwv_flow_native_plugins',
' where plugin_type = ''AUTHENTICATION TYPE''',
'   and (          name_with_prefix = ''NATIVE_APEX_ACCOUNTS''',
'         or (     name_with_prefix = ''NATIVE_HTTP_HEADER_VARIABLE''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_HHEAD'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_LDAP''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_LDAP'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_IAS_SSO''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_SSO'') = ''Y'' ))',
'union all',
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.NATIVE_CLOUD_IDM''),',
'       ''NATIVE_CLOUD_IDM''',
'  from sys.dual',
' where wwv_flow_authentication_dev.get_internal_authentication = ''CLOUD_IDM'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1446553355204723865.4752)
,p_lov_name=>'PACKAGED_APP_AUTH_OPTION_PG46'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.''|| name_with_prefix) as d,',
'       name_with_prefix      as r',
'  from wwv_flow_native_plugins',
' where plugin_type = ''AUTHENTICATION TYPE''',
'   and (          name_with_prefix = ''NATIVE_APEX_ACCOUNTS''',
'         or (     name_with_prefix = ''NATIVE_HTTP_HEADER_VARIABLE''',
'              and :P7_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_HHEAD'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_LDAP''',
'              and :P7_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_LDAP'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_IAS_SSO''',
'              and :P7_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_SSO'') = ''Y'' ))',
'union all',
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.NATIVE_CLOUD_IDM''),',
'       ''NATIVE_CLOUD_IDM''',
'  from sys.dual',
' where wwv_flow_authentication_dev.get_internal_authentication = ''CLOUD_IDM'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(492829835934527241.4752)
,p_lov_name=>'PKG_APP_NEW_USER'
,p_lov_query=>'.'||wwv_flow_api.id(492829835934527241)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(492830130329527242.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Créer un utilisateur Application Express'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1224176768409642192.4752)
,p_lov_name=>'PKG_APP_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(1224176768409642192)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1224177077201642193.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Base de données'
,p_lov_return_value=>'DB'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1224177391006642199.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Feuille Web'
,p_lov_return_value=>'WS'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(801842749107764598.4752)
,p_lov_name=>'REQEUEST SERVICE'
,p_lov_query=>'.'||wwv_flow_api.id(801842749107764598)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(801843300324764602.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Demander de l''espace de stockage supplémentaire'
,p_lov_return_value=>'STORAGE'
,p_lov_template=>'#DISPLAY_VALUE#<br /><a href="f?p=4750:101:&SESSION."><img src="#IMAGE_PREFIX#menu/wiz_add_storage_140x90.png" class="htmldbGreenIcon" width="140" height="90" alt="#DISPLAY_VALUE#" /></a>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(801843660323764602.4752)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Demander l''interruption'
,p_lov_return_value=>'TERMINATION'
,p_lov_template=>'#DISPLAY_VALUE#<br /><a href="f?p=4750:102:&SESSION."><img src="#IMAGE_PREFIX#menu/wiz_terminate_service_140x90.png" class="htmldbGreenIcon" width="140" height="90" alt="#DISPLAY_VALUE#" /></a>'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(805102768336534835.4752)
,p_lov_name=>'REQUEST SERVICE'
,p_lov_query=>'.'||wwv_flow_api.id(805102768336534835)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805103010621534839.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Demander un schéma'
,p_lov_return_value=>'SCHEMA'
,p_lov_template=>'#DISPLAY_VALUE#<br /><a href="f?p=4350:48:&SESSION."><img src="#IMAGE_PREFIX#menu/wiz_add_schema_140x90.png" class="htmldbGreenIcon" width="140" height="90" alt="#DISPLAY_VALUE#" /></a>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805103339867534842.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Demander de l''espace de stockage supplémentaire'
,p_lov_return_value=>'STORAGE'
,p_lov_template=>'#DISPLAY_VALUE#<br /><a href="f?p=4350:49:&SESSION."><img src="#IMAGE_PREFIX#menu/wiz_add_storage_140x90.png" class="htmldbGreenIcon" width="140" height="90" alt="#DISPLAY_VALUE#" /></a>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(805103624199534842.4752)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Demander l''interruption'
,p_lov_return_value=>'TERMINATION'
,p_lov_template=>'#DISPLAY_VALUE#<br /><a href="f?p=4350:50:&SESSION."><img src="#IMAGE_PREFIX#menu/wiz_terminate_service_140x90.png" class="htmldbGreenIcon" width="140" height="90" alt="#DISPLAY_VALUE#" /></a>'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(788989098726838748.4752)
,p_lov_name=>'TIMEFRAME'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, to_char(t) t',
'from (',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''SECONDS'')) d, 10 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''MINUTE'')) d, 60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 5*60 t from dual union all',
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 15*60 t from dual union all',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 30*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, 3600 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 2*3600  t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 3*3600  t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 4*3600  t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 6*3600 t from dual union all',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 8*3600 t from dual union all',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 12*3600 t from dual union all',
'select ''18 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 18*3600 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, 1*24*60*60 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 2*24*60*60 t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 3*24*60*60 t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 4*24*60*60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 5*24*60*60 t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 6*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, 7*24*60*60 t  from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 14*24*60*60 t  from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 28*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''YEAR'')) d, 365*24*60*60 t from dual order by 2',
') q'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(492828601280527238.4752)
,p_lov_name=>'WS_APP_ADMIN_USER_METHOD'
,p_lov_query=>'.'||wwv_flow_api.id(492828601280527238)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(492828905310527238.4752)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Employer l''utilisateur existant'
,p_lov_return_value=>'E'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(492829287682527240.4752)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Créer un nouvel utilisateur'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(801893675976261985.4752)
,p_lov_name=>'YES_NO_RETURNS_Y_OR_N'
,p_lov_query=>'.'||wwv_flow_api.id(801893675976261985)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(801893956418261987.4752)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Oui'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(801894275092261987.4752)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Non'
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
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(539941826945132432.4752)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(492870030976684874.4752)
,p_parent_id=>wwv_flow_api.id(806264496767109365.4752)
,p_short_name=>'Enlever une application packagée'
,p_link=>'f?p=&FLOW_ID.:237:&SESSION.'
,p_page_id=>237
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(492870967641701682.4752)
,p_parent_id=>wwv_flow_api.id(806264496767109365.4752)
,p_short_name=>'Installer l''application packagée'
,p_link=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.:::'
,p_page_id=>83
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(492872210530717222.4752)
,p_parent_id=>wwv_flow_api.id(806264496767109365.4752)
,p_short_name=>'Installer l''application packagée'
,p_link=>'f?p=&FLOW_ID.:209:&SESSION.'
,p_page_id=>209
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(492886054526780174.4752)
,p_parent_id=>wwv_flow_api.id(.4752)
,p_short_name=>'Déverrouiller l''application packagée'
,p_link=>'f?p=&APP_ID.:234:&SESSION.::&DEBUG.:::'
,p_page_id=>234
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(492897834760858127.4752)
,p_parent_id=>wwv_flow_api.id(.4752)
,p_short_name=>'Modifier authentification'
,p_link=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:::'
,p_page_id=>46
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(492907884020873126.4752)
,p_parent_id=>wwv_flow_api.id(806264496767109365.4752)
,p_short_name=>'Mettre à jour l''application packagée'
,p_link=>'f?p=&APP_ID.:262:&SESSION.'
,p_page_id=>262
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(657001585526112940.4752)
,p_parent_id=>wwv_flow_api.id(806264496767109365.4752)
,p_short_name=>'Installer l''application packagée'
,p_link=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:::'
,p_page_id=>210
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(750897172696068128.4752)
,p_parent_id=>wwv_flow_api.id(.4752)
,p_short_name=>'<span class="u-VisuallyHidden">Applications</span><span class="a-Icon icon-breadcrumb-previous"></span>'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(788162743515607361.4752)
,p_parent_id=>wwv_flow_api.id(750897172696068128.4752)
,p_short_name=>'Tableau de bord des applications packagées'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(798343358044477984.4752)
,p_parent_id=>wwv_flow_api.id(750897172696068128.4752)
,p_short_name=>'Administration des applications packagées'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(801841660268764588.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Demander un service'
,p_link=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::'
,p_page_id=>100
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(801862732676237146.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Gérer les utilisateurs'
,p_link=>'f?p=&APP_ID.:300:&SESSION.'
,p_page_id=>300
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(801882533106261969.4752)
,p_parent_id=>wwv_flow_api.id(801862732676237146.4752)
,p_short_name=>'Créer un utilisateur'
,p_link=>'f?p=&APP_ID.:301:&SESSION.'
,p_page_id=>301
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(801914548585279875.4752)
,p_parent_id=>wwv_flow_api.id(801862732676237146.4752)
,p_short_name=>'Créer plusieurs utilisateurs'
,p_link=>'f?p=&APP_ID.:302:&SESSION.'
,p_page_id=>302
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(802132173906156777.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Gérer les états enregistrés'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805157126884739471.4752)
,p_parent_id=>wwv_flow_api.id(801862732676237146.4752)
,p_short_name=>'Supprimer plusieurs utilisateurs'
,p_link=>'f?p=&APP_ID.:305:&SESSION.'
,p_page_id=>305
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805218510881843962.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Gérer les abonnements'
,p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805436491214880000.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Définir des préférences d''espace de travail'
,p_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805495463822047787.4752)
,p_parent_id=>wwv_flow_api.id(801862732676237146.4752)
,p_short_name=>'Modifier un utilisateur'
,p_link=>'f?p=&APP_ID.:306:&SESSION.'
,p_page_id=>306
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805527573061252965.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Demander de l''espace de stockage supplémentaire'
,p_link=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:::'
,p_page_id=>101
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805527784325261035.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Demander de l''espace de stockage supplémentaire'
,p_link=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::'
,p_page_id=>104
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805528069374265591.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Demande d''interruption de service'
,p_link=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:::'
,p_page_id=>102
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(805528699371274068.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Demande d''interruption de service'
,p_link=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:::'
,p_page_id=>105
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(806256027000082685.4752)
,p_parent_id=>wwv_flow_api.id(750897172696068128.4752)
,p_short_name=>'Galerie d''applications packagées'
,p_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:::'
,p_page_id=>50
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(806264496767109365.4752)
,p_parent_id=>wwv_flow_api.id(806256027000082685.4752)
,p_short_name=>'Détails de l''application packagée'
,p_link=>'f?p=&APP_ID.:81:&SESSION.'
,p_page_id=>81
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(806412249977441620.4752)
,p_parent_id=>wwv_flow_api.id(806264496767109365.4752)
,p_short_name=>'Installer l''application packagée'
,p_link=>'f?p=&APP_ID.:828:&SESSION.'
,p_page_id=>828
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(815830255443389334.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Activité de l''application'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(818291039720192108.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Vues de page'
,p_link=>'f?p=&APP_ID.:29:&SESSION.'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(818309602620781722.4752)
,p_parent_id=>wwv_flow_api.id(798343358044477984.4752)
,p_short_name=>'Principaux utilisateurs'
,p_link=>'f?p=&APP_ID.:30:&SESSION.'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1224179617523676528.4752)
,p_parent_id=>wwv_flow_api.id(788162743515607361.4752)
,p_short_name=>'Applications packagées'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(740687851443061408.4752)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Dialog.fr'
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
,p_reference_id=>689061037088924910.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(741365982136994250.4752)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Dialog.fr'
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
,p_reference_id=>120828417372192930.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(741366253443994295.4752)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Edit Screen.fr'
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
,p_reference_id=>689595297061847770.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(747469399730136676.4752)
,p_page_template_id=>wwv_flow_api.id(741366253443994295.4752)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(747469775365136676.4752)
,p_page_template_id=>wwv_flow_api.id(741366253443994295.4752)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(741368521013994306.4752)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.fr'
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
,p_reference_id=>637437892049443496.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(741369094170994311.4752)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.fr'
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
,p_reference_id=>386895861966224222.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970712970659339897.4752)
,p_page_template_id=>wwv_flow_api.id(741369094170994311.4752)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970713375545339897.4752)
,p_page_template_id=>wwv_flow_api.id(741369094170994311.4752)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970713743513339897.4752)
,p_page_template_id=>wwv_flow_api.id(741369094170994311.4752)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970714187781339897.4752)
,p_page_template_id=>wwv_flow_api.id(741369094170994311.4752)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970714515296339897.4752)
,p_page_template_id=>wwv_flow_api.id(741369094170994311.4752)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970714940759339898.4752)
,p_page_template_id=>wwv_flow_api.id(741369094170994311.4752)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(970715378375339898.4752)
,p_page_template_id=>wwv_flow_api.id(741369094170994311.4752)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(741370435290994312.4752)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Sign Up Wizard.fr'
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
,p_reference_id=>702692008314080052.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(741371098457994312.4752)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.fr'
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
,p_reference_id=>702684260095026477.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824980978803308434.4752)
,p_page_template_id=>wwv_flow_api.id(741371098457994312.4752)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824981311553308434.4752)
,p_page_template_id=>wwv_flow_api.id(741371098457994312.4752)
,p_name=>'Wizard Progress List'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824981767148308434.4752)
,p_page_template_id=>wwv_flow_api.id(741371098457994312.4752)
,p_name=>'Wizard Title'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(824982170342308434.4752)
,p_page_template_id=>wwv_flow_api.id(741371098457994312.4752)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(404710483554908976.4752)
,p_template_name=>'APEX 5.0 - Button'
,p_template=>'<button onclick="#JAVASCRIPT#" class="a-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="a-Button a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174750904387485475.4752
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(404710812892908978.4752)
,p_template_name=>'APEX 5.0 - Icon Menu Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_reference_id=>3705338883615.4752
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(404711161197908978.4752)
,p_template_name=>'APEX 5.0 - Icon Only Button'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CL'
||'ASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>353820721334283301.4752
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(510958289243179645.4752)
,p_template_name=>'APEX 5.0 - Button (Large)'
,p_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--large #BUTTON_CSS_CLASSES#" type="button" role="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--large a-Button--hot #BUTTON_CSS_CLASSES#" type="button" role="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174756119980565636.4752
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(510958400671179662.4752)
,p_template_name=>'APEX 5.0 - Button (Small)'
,p_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--small #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--small a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174755910284562884.4752
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(758581488338548971.4752)
,p_template_name=>'APEX 5.0 - Button with Icon'
,p_template=>'<button class="a-Button a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_reference_id=>404889142313786233.4752
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(404667570222803088.4752)
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
,p_reference_id=>174748721787471587.4752
,p_translate_this_template=>'N'
,p_template_comment=>'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI a-Button--goToTop" onclick="uF();" type="button" title="&TOP."><span class="a-Icon icon-up-chevron"></span></button>'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(404672496027804677.4752)
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
,p_reference_id=>716895227337398760.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(662132465401686364.4752)
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
,p_reference_id=>399850559367741099.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(740735067061086300.4752)
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
,p_reference_id=>687153470345619376.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(740771588500180474.4752)
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
,p_reference_id=>702777601713950915.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(746534672114889110.4752)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 class="a-Alert-title">#TITLE#</h2>',
'      </div>',
'      <div class="a-Alert-body">',
'        #BODY#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      #PREVIOUS##CLOSE##CREATE##NEXT#',
'    </div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Alert'
,p_theme_id=>3
,p_theme_class_id=>7
,p_default_template_options=>'a-Alert--defaultIcons'
,p_preset_template_options=>'a-Alert--warning:a-Alert--wizard'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>746362351042209764.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(805131422007607886.4752)
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
,p_reference_id=>42210710875242480.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(805132117516607920.4752)
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
,p_reference_id=>703469000349150769.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(805538978589340502.4752)
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
,p_reference_id=>678354360586321695.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(805699740467941340.4752)
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
,p_reference_id=>689955986849128825.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(1164683681838385745.4752)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="a-ProcessingRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <span class="u-Processing"><span class="u-Processing-spinner"></span></span>',
'  <div class="a-ProcessingRegion-title">#TITLE#</div>',
'  <div class="a-ProcessingRegion-body">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Processing Spinner Region'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1147280303078953726.4752
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(404660636766798903.4752)
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
,p_reference_id=>573607518145151423.4752
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(404660915136798904.4752)
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
,p_reference_id=>747588010155545129.4752
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(750892319717997379.4752)
,p_list_template_current=>'<li class="a-ImageNav-item"><button type="button" data-link="#LINK#" class="a-ImageNav-link launch-aut #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></button></li>'
,p_list_template_noncurrent=>'<li class="a-ImageNav-item"><a href="#LINK#" class="a-ImageNav-link #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></a></li>'
,p_list_template_name=>'APEX 5.0 - Image Navigation'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<ul class="a-ImageNav #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>481290423891543508.4752
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<td style="width: 20%">',
'	<a href="#LINK#" class="iconContainer" title="#TEXT_ESC_SC#">',
'		<span class="largeIcon"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></span>',
'		<span class="iconLabel">#TEXT#</span>',
'	</a>',
'</td>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(755602131069880061.4752)
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
,p_reference_id=>687902065557685310.4752
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(798348984564602568.4752)
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
,p_reference_id=>692720897220784060.4752
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(805146703039709510.4752)
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
,p_reference_id=>60219508156141083.4752
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(741378333819007312.4752)
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
,p_reference_id=>488487951233692049.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(741383139242007378.4752)
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
,p_reference_id=>689060248369886348.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(741383847997007380.4752)
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
,p_reference_id=>17383712077884846.4752
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(741383847997007380.4752)
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>'OMIT'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(741385154282007399.4752)
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
,p_reference_id=>123725814882271159.4752
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(741385154282007399.4752)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(805120647160580956.4752)
,p_row_template_name=>'APEX 5.0 - Portlet  Column Template'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="a-AVPList-item">',
'  <span class="a-AVPList-label">#COLUMN_HEADER#</span>',
'  <span class="a-AVPList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="a-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_ID#_report">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>0
,p_reference_id=>43020300221196425.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(805120945120580960.4752)
,p_row_template_name=>'APEX 5.0 - Portlet Row Template'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="a-AVPList-item">',
'  <span class="a-AVPList-label">#1#</span>',
'  <span class="a-AVPList-value">#2#</span>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="a-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_ID#_report">',
''))
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>7
,p_reference_id=>46763700145123930.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(805706496589034856.4752)
,p_row_template_name=>'APEX 5.0 - One Column Unordered List'
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
,p_after_column_heading=>'<tbody>'
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
,p_reference_id=>123725814882271159.4752
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(805706496589034856.4752)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(932270054883616955.4752)
,p_row_template_name=>'APEX 5.0 - App Cards Report'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="a-AppCards-item #ID#">',
'  <div class="a-AppCards-itemContainer">',
'    <div class="a-AppCards-iconContainer">',
'      <span class="a-AppCards-icon #ICON_CLASS#"></span>',
'    </div>',
'    <div class="a-AppCards-contentContainer" id="#ID#_name">',
'      <h2 class="a-AppCards-name">#APP_NAME#</h2>',
'      <div class="a-AppCards-info">#APP_INFO#</div>',
'    </div>',
'    <div class="a-AppCards-actionsContainer">',
'        #MODIFY_APP_BUTTON#',
'        #RUN_APP_BUTTON#',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="a-AppCards a-AppCards--slim  a-AppCards--stacked">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>7
,p_reference_id=>932268343459577530.4752
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(741012333966774170.4752)
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
,p_reference_id=>692681574974429799.4752
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(741376158824001765.4752)
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
,p_reference_id=>487444299516703815.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(741376298358001771.4752)
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
,p_reference_id=>492676964457041934.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(741376307162001773.4752)
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
,p_reference_id=>487443659585685414.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(741376417814001773.4752)
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
,p_reference_id=>492677038682043223.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(750871254241940005.4752)
,p_template_name=>'Hidden label, read by screen reader'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999" class="hideMeButHearMe">'
,p_template_body2=>'</label>'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#'
,p_theme_id=>3
,p_theme_class_id=>13
,p_reference_id=>4903009179971452.4752
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(1212080564184792020.4752)
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
,p_reference_id=>687907221148719616.4752
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(404662212565801043.4752)
,p_name=>'APEX 5.0 - Breadcrumbs'
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
 p_id=>wwv_flow_api.id(539940326974132424.4752)
,p_page_name=>'winlov'
,p_page_title=>'Boîte de dialogue de recherche'
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
,p_find_button_text=>'Rechercher'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Fermer'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Suivant &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Précédent'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Ligne(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>200
,p_before_result_set=>'<div class="a-PopupLOV-links">'
,p_theme_id=>3
,p_theme_class_id=>1
,p_reference_id=>17343114994581872.4752
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(539940232021132423.4752)
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
,p_reference_id=>353925314576528967.4752
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
 p_id=>wwv_flow_api.id(607578911660270943.4752)
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
 p_id=>wwv_flow_api.id(697253623117708869.4752)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698708764949187835.4752)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698709451036187835.4752)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698710164448187835.4752)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(698711710498187841.4752)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(740735413933086306.4752)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(740735719132086313.4752)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(740736131546086315.4752)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(741378782415007354.4752)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(741379667978007374.4752)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746441836569425940.4752)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746443190371425941.4752)
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
 p_id=>wwv_flow_api.id(746443452881425941.4752)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746443757575425941.4752)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746444836374425941.4752)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746445145634425941.4752)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746445421077425942.4752)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746445725296425945.4752)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746446077015425945.4752)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746446530805425946.4752)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746446884162425946.4752)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746535083802889112.4752)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(746535358980889115.4752)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750899131263089224.4752)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(750899683273089226.4752)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(798349340561602593.4752)
,p_theme_id=>3
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747463006528132175.4752)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(746445725296425945)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747463277324132175.4752)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_api.id(746446077015425945)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747463446233132175.4752)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746446530805425946)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747463631373132175.4752)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_api.id(746445421077425942)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747463892204132175.4752)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_api.id(746445725296425945)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747464099568132175.4752)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_api.id(746446077015425945)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747464257097132175.4752)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_api.id(746443757575425941)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747464408083132175.4752)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(746443757575425941)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747464690649132175.4752)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_api.id(746443757575425941)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747464847493132175.4752)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_api.id(746446884162425946)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747464983019132175.4752)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747465129834132176.4752)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_api.id(746445421077425942)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747465242839132176.4752)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747465484278132176.4752)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_api.id(746443452881425941)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747465645644132176.4752)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_api.id(746443452881425941)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747465815587132176.4752)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(746445145634425941)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747466092646132176.4752)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(746443190371425941)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747466208356132176.4752)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_api.id(746444836374425941)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747466360014132176.4752)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747466555388132176.4752)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_api.id(746443452881425941)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747466798216132176.4752)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_api.id(746443452881425941)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747466963230132176.4752)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_api.id(746441836569425940)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747467175674132176.4752)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_api.id(746441836569425940)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747467399810132176.4752)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_api.id(746441836569425940)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747467514327132177.4752)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_api.id(746441836569425940)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747467776225132177.4752)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_api.id(746441836569425940)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747467997690132177.4752)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_api.id(746441836569425940)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747473828460136685.4752)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747473950983136685.4752)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747474127360136685.4752)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_api.id(746535083802889112)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747474348131136685.4752)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_api.id(746535083802889112)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747474514470136685.4752)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_api.id(746535083802889112)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747474707581136685.4752)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(746535358980889115)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747474944578136686.4752)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_api.id(746535358980889115)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747475015417136686.4752)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747475237721136686.4752)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(746534672114889110.4752)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_api.id(746535083802889112)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747475664720136688.4752)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747475812078136688.4752)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(740736131546086315)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747476008148136688.4752)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(740736131546086315)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747476278021136688.4752)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(740735719132086313)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747476495301136688.4752)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(740735719132086313)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747476598371136688.4752)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747476784777136688.4752)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_api.id(740735413933086306)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747476963807136688.4752)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(740735067061086300.4752)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_api.id(740735413933086306)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747478061061136695.4752)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747478236458136695.4752)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747478465916136695.4752)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747478620563136695.4752)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_api.id(741379667978007374)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747478816770136695.4752)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(741379667978007374)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747479061860136695.4752)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_api.id(741379667978007374)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747479231007136697.4752)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(741379667978007374)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747479414686136697.4752)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(741379667978007374)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747479631087136697.4752)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747479882130136697.4752)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747480030416136697.4752)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747480265456136697.4752)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(747480483547136697.4752)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741378333819007312.4752)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(741378782415007354)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787127352847949731.4752)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741385154282007399.4752)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(698708764949187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787127585732949731.4752)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741385154282007399.4752)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(698709451036187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787127711546949731.4752)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741385154282007399.4752)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_api.id(698710164448187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787127972338949731.4752)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741385154282007399.4752)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(698710164448187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787128199893949731.4752)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741385154282007399.4752)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(698710164448187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787128259567949731.4752)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741385154282007399.4752)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(787128429850949731.4752)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741385154282007399.4752)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_api.id(698711710498187841)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798350813694602633.4752)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(798349340561602593)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798351014569602633.4752)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(798349340561602593)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798351220332602633.4752)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(798349340561602593)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798351489652602634.4752)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(798349340561602593)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798351687944602634.4752)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(798349340561602593)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798351753474602634.4752)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798351813649602634.4752)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798351937390602634.4752)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798352054616602634.4752)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(798352116411602634.4752)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(805706717271034862.4752)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(805706496589034856.4752)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(698708764949187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(805706847390034864.4752)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(805706496589034856.4752)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(698709451036187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(805706992942034864.4752)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(805706496589034856.4752)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(698710164448187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(805707090166034864.4752)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(805706496589034856.4752)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(805707148450034864.4752)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(805706496589034856.4752)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_api.id(698710164448187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(805707237455034864.4752)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(805706496589034856.4752)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_api.id(698711710498187841)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(805707357730034864.4752)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(805706496589034856.4752)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(698710164448187835)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(926400418677707541.4752)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(404660915136798904.4752)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(926400594637707541.4752)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(404660915136798904.4752)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(940695744751341570.4752)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1199562503035032434.4752)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(746446530805425946)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1241666929781396960.4752)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(1164683681838385745.4752)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525662345070182113.4752)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525662481640182113.4752)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525662510081182113.4752)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525662661993182113.4752)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525662869499182113.4752)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(697253623117708869)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1525663077488182113.4752)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(697253623117708869)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544819964749478035.4752)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741383847997007380.4752)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544820012780478035.4752)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741383847997007380.4752)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1544820102363478035.4752)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(741383847997007380.4752)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554817344758408390.4752)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(740735413933086306)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554817556033408390.4752)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_api.id(740735413933086306)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554817788346408390.4752)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(740735719132086313)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554817927221408390.4752)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(740735719132086313)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554818142196408390.4752)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(750899131263089224)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554818375607408390.4752)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(740736131546086315)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554818564149408390.4752)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(750899683273089226)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554818775823408390.4752)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(750899683273089226)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554818958443408390.4752)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_api.id(740735719132086313)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554819000019408390.4752)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554819282202408390.4752)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(404667570222803088.4752)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_api.id(740736131546086315)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554830602794526786.4752)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_api.id(805538978589340502.4752)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554830783243526786.4752)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805538978589340502.4752)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554830803540526786.4752)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805538978589340502.4752)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554836989856542249.4752)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554837048702542249.4752)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554837210657542249.4752)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_api.id(740735719132086313)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554837432873542249.4752)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_api.id(740735719132086313)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554837628193542249.4752)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_api.id(750899131263089224)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554837892538542249.4752)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_api.id(740736131546086315)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554838070925542250.4752)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_api.id(750899683273089226)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554838282191542250.4752)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_api.id(750899683273089226)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554838444739542251.4752)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(746535358980889115)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(1554838651314542251.4752)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(805699740467941340.4752)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(746535358980889115)
,p_template_types=>'REGION'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(693462664348655994.4752)
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
null;
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(539943211297143567.4752)
,p_name=>'Internal Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=4550:8:&SESSION.'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_cookie_path=>'&CGI_SCRIPT_NAME.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>540226219724705040.4752
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
 p_id=>wwv_flow_api.id(404682856933862574.4752)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_display_name=>'Autorisation de développeur'
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
,p_reference_id=>12457518297512494.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(786917664404512895.4752)
,p_plugin_id=>wwv_flow_api.id(404682856933862574.4752)
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
 p_id=>wwv_flow_api.id(786918050520512895.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>10
,p_display_value=>'ADMIN: Ability to manage flow developer privileges'
,p_return_value=>'ADMIN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786918529213512895.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>20
,p_display_value=>'EDIT: Ability change all attributes of specified flow(s)'
,p_return_value=>'EDIT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786919007037512895.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>30
,p_display_value=>'HELP: Ability edit help page for a given company'
,p_return_value=>'HELP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786919500675512895.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>40
,p_display_value=>'BROWSE: Access to Oracle data dictionary browser'
,p_return_value=>'BROWSE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786920021088512896.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>50
,p_display_value=>'CREATE: Ability to create new flows'
,p_return_value=>'CREATE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786920500573512897.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>60
,p_display_value=>'MONITOR: Ability to monitor flow activity'
,p_return_value=>'MONITOR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786921046133512897.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>70
,p_display_value=>'DB_MONITOR: Ability to monitor Oracle database attributes'
,p_return_value=>'DB_MONITOR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786921504189512899.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>80
,p_display_value=>'SQL: Ability to issues SQL statements'
,p_return_value=>'SQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786922057592512900.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>90
,p_display_value=>'USER_MANAGER: Manage user accounts for cookie based authentication'
,p_return_value=>'USER_MANAGER'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786922519973512900.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>100
,p_display_value=>'DATA_LOADER: Data Workshop'
,p_return_value=>'DATA_LOADER'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786923007253512901.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>110
,p_display_value=>'RESTFUL: Ability to enable RESTful Services'
,p_return_value=>'RESTFUL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(786923552272512901.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(786917664404512895.4752)
,p_display_sequence=>120
,p_display_value=>'PKG_APPS: Ability to install packaged applications'
,p_return_value=>'PKG_APPS'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_plugin_dynamic_attribute
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(499279834326550209.4752)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_display_name=>'Attribut dynamique de module d''extension'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'),'')
,p_render_function=>'wwv_flow_f4000_plugins.render_plugin_attribute'
,p_ajax_function=>'wwv_flow_f4000_plugins.ajax_plugin_attribute'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:SOURCE'
,p_substitute_attributes=>true
,p_reference_id=>6480508142096556.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_apex
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(760226818503948428.4752)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_display_name=>'Comptes Application Express INTERNAL'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_apex'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113737019268347425.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_cloud_idm
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(760229135394948431.4752)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'
,p_display_name=>'Oracle Cloud Identity Management INTERNAL'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'),'')
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_cloud'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_cloud'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_cloud'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_cloud'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_cloud'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113749806821809026.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_db
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(760232319702948435.4752)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.DB'
,p_display_name=>'Comptes de base de données INTERNAL'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.DB'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_db'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113749511183746276.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_header
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(760287411454948485.4752)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'
,p_display_name=>'Variable d''en-tête HTTP INTERNAL'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE:JQM_TABLET'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'),'')
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_header'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_header'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_header'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_header'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_header'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>708795120396802284.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(760287640967948485.4752)
,p_plugin_id=>wwv_flow_api.id(760287411454948485.4752)
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
 p_id=>wwv_flow_api.id(760288013514948486.4752)
,p_plugin_id=>wwv_flow_api.id(760287411454948485.4752)
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
 p_id=>wwv_flow_api.id(760288416604948486.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760288013514948486.4752)
,p_display_sequence=>10
,p_display_value=>'Redirect to Built-In URL'
,p_return_value=>'BUILTIN_URL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(760288913478948486.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760288013514948486.4752)
,p_display_sequence=>20
,p_display_value=>'Redirect to URL'
,p_return_value=>'URL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(760289423625948487.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760288013514948486.4752)
,p_display_sequence=>30
,p_display_value=>'Display Error'
,p_return_value=>'ERROR'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(760289933508948487.4752)
,p_plugin_id=>wwv_flow_api.id(760287411454948485.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(760288013514948486.4752)
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
 p_id=>wwv_flow_api.id(760290335785948487.4752)
,p_plugin_id=>wwv_flow_api.id(760287411454948485.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(760288013514948486.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ERROR'
,p_help_text=>'Specifies the error message to be displayed if the HTTP header variable does not contain a value or the HTTP header variable does not exist.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(760290725567948487.4752)
,p_plugin_id=>wwv_flow_api.id(760287411454948485.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Verify Username'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ALWAYS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(760288013514948486.4752)
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
 p_id=>wwv_flow_api.id(760291117778948488.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760290725567948487.4752)
,p_display_sequence=>10
,p_display_value=>'Each Request'
,p_return_value=>'ALWAYS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(760291619641948488.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760290725567948487.4752)
,p_display_sequence=>20
,p_display_value=>'After Login'
,p_return_value=>'CALLBACK'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(760292139060948488.4752)
,p_plugin_id=>wwv_flow_api.id(760287411454948485.4752)
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
 p_id=>wwv_flow_api.id(760360526050948543.4752)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'
,p_display_name=>'Annuaire LDAP INTERNAL'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE:JQM_TABLET'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'),'')
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_ldap'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>863910941135523528.4752
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Saisissez le nom utilisateur et le mot de passe permettant l''authentification par rapport à l''annuaire LDAP identifié dans la page de connexion. N''oubliez pas que, pour les mots de passe, il peut y avoir distinction entre les majuscules et les min'
||'uscules.</p>',
''))
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(760360721990948543.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
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
 p_id=>wwv_flow_api.id(760361111417948543.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
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
 p_id=>wwv_flow_api.id(760361533802948544.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
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
 p_id=>wwv_flow_api.id(760361938927948544.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760361533802948544.4752)
,p_display_sequence=>10
,p_display_value=>'SSL'
,p_return_value=>'SSL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(760362419420948544.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760361533802948544.4752)
,p_display_sequence=>20
,p_display_value=>'SSL with Authentication'
,p_return_value=>'SSL_AUTH'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(760362933267948544.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760361533802948544.4752)
,p_display_sequence=>30
,p_display_value=>'No SSL'
,p_return_value=>'NO_SSL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(760363417836948545.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
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
 p_id=>wwv_flow_api.id(760363827848948545.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
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
 p_id=>wwv_flow_api.id(760364216062948545.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Search Filter'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(760363827848948545.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the search filter when not using an exact distinguished name (DN). Use <strong>%LDAP_USER%</strong> as a place-holder for the username. For example:',
'</p>',
'<p><pre>cn=%LDAP_USER%</pre></p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(760364637771948545.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
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
 p_id=>wwv_flow_api.id(760365024887948545.4752)
,p_plugin_id=>wwv_flow_api.id(760360526050948543.4752)
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
 p_id=>wwv_flow_api.id(760365437846948545.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760365024887948545.4752)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(760365918613948546.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760365024887948545.4752)
,p_display_sequence=>20
,p_display_value=>'Only special characters'
,p_return_value=>'ONLY'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(760366434328948546.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(760365024887948545.4752)
,p_display_sequence=>30
,p_display_value=>'No Escaping'
,p_return_value=>'NO'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_sso
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(760375920088948554.4752)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'
,p_display_name=>'Oracle Application Server Single Sign-On INTERNAL'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'),'')
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_osso'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_osso'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_osso'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_osso'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_osso'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_reference_id=>113750429890071859.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_wizard_selection
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(931633487189212464.4752)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.WIZARD_SELECTION'
,p_display_name=>'Sélection de l''assistant'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.WIZARD_SELECTION'),'')
,p_render_function=>'wwv_flow_f4000_plugins.render_wizard_selection'
,p_ajax_function=>'wwv_flow_f4000_plugins.ajax_wizard_selection'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:SOURCE:ELEMENT:LOV:LOV_REQUIRED:CASCADING_LOV'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_substitute_attributes=>true
,p_reference_id=>3260301366184169092.4752
,p_subscribe_plugin_settings=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(931633787892213491.4752)
,p_plugin_id=>wwv_flow_api.id(931633487189212464.4752)
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
 p_id=>wwv_flow_api.id(931634195040213494.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(931633787892213491.4752)
,p_display_sequence=>10
,p_display_value=>'Small'
,p_return_value=>'S'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(931634625437213498.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(931633787892213491.4752)
,p_display_sequence=>20
,p_display_value=>'Medium'
,p_return_value=>'M'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(931635198372213498.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(931633787892213491.4752)
,p_display_sequence=>30
,p_display_value=>'Large'
,p_return_value=>'L'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(931635685556213498.4752)
,p_plugin_id=>wwv_flow_api.id(931633487189212464.4752)
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
prompt --application/shared_components/plugins/dynamic_action/com_oracle_apex_add_checkall_checkbox
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2448359566117403168.4752)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.ORACLE.APEX.ADD_CHECKALL_CHECKBOX'
,p_display_name=>'Ajouter la case Cocher tout'
,p_category=>'MISC'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.ORACLE.APEX.ADD_CHECKALL_CHECKBOX'),'')
,p_render_function=>'wwv_flow_f4000_plugins.render_add_check_all_checkbox'
,p_standard_attributes=>'ONLOAD'
,p_substitute_attributes=>true
,p_reference_id=>1223290239742970512.4752
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>L''action dynamique "Ajouter la case Cocher tout" transforme un en-tête de colonne contenant la chaîne #CHECK_ALL_CHECKBOX# en une case de type Cocher tout accessible, qui sélectionnera ou désélectionnera toutes les cases dans la colonne correspond'
||'ante.<p>',
'<p>',
'Pour utiliser ce module d''extension, assurez-vous que les attributs suivants sont définis :',
'<ol>',
'<li>Dans la colonne d''état, définissez la valeur ''#CHECK_ALL_CHECKBOX#'' comme valeur d''en-tête.</li>',
'<li>Pour l''attribut Action dynamique lorsque, sélectionnez la région d''état contenant la colonne.</li>',
'<li>Définissez l''action dynamique sur un déclenchement ''Après régénération'' et l''action sur ''Déclencher lors du chargement de la page''. (Les valeurs par défaut de ces deux actions seront définies de façon appropriée si l''action dynamique est créée en'
||' sélectionnant la région dans la section ''Affichage'' du concepteur de page et en créant l''action dynamique à partir de là.</li>',
'<li>Cela ne permet pas de gérer l''accessibilité des cases affichées sur chaque ligne, ce qui doit être effectué séparément dans la source de région. (Pour obtenir un exemple, reportez-vous à la région Régions 4000:656).</li>',
'</ol>',
'</p>'))
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_raphael_justgage
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.RAPHAEL.JUSTGAGE'
,p_display_name=>'Jauge JustGage ***'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.RAPHAEL.JUSTGAGE'),'#IMAGE_PREFIX#plugins/com.oracle.apex.raphael.justgage/1.0/')
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#plugin.js',
'#PLUGIN_FILES#justgage.js',
'#IMAGE_PREFIX#libraries/raphaeljs/2.1.2/apex.raphael.min.js'))
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render ',
'(',
'    p_region                in  apex_plugin.t_region,',
'    p_plugin                in  apex_plugin.t_plugin,',
'    p_is_printer_friendly   in  boolean ',
')',
'return apex_plugin.t_region_render_result',
'is',
'    -- Assign readable names to plugin attributes. Omit data attributes, they''ll be handled in ajax function.',
'    -- Label configuration',
'    c_show_labels           constant boolean        := p_region.attribute_04 = ''Y'';',
'    l_title                 varchar(200)            := nvl(p_region.attribute_05, '''');',
'    l_units                 varchar(200)            := nvl(p_region.attribute_06, '''');',
'    l_value_prefix          varchar(200)            := nvl(p_region.attribute_07, '''');',
'    l_value_suffix          varchar(200)            := nvl(p_region.attribute_08, '''');',
'    l_show_min_max          boolean                 := nvl(p_region.attribute_09, ''N'') = ''Y'';',
'    c_description_template  constant varchar(2000)  := apex_plugin_util.replace_substitutions(',
'                                                           nvl(p_region.attribute_20, ''''));',
'    l_heading               varchar(200)            := apex_plugin_util.replace_substitutions(',
'                                                           nvl(p_region.attribute_21, ''''));',
'',
'    -- Shadow configuration',
'    c_show_shadow           constant boolean        := nvl(p_region.attribute_10, ''N'') = ''Y'';',
'    c_shadow_opacity        constant number         := nvl( apex_plugin_util.get_attribute_as_number( p_region.attribute_11, ''Shadow Opacity'' ), 0 );',
'    c_shadow_offset         constant number         := to_number(nvl(p_region.attribute_12, 0));',
'',
'    -- Gauge configuration',
'    c_gauge_width           constant number         := nvl( apex_plugin_util.get_attribute_as_number( p_region.attribute_13, ''Gauge Width Scale'' ), 1 );',
'    c_gauge_color_scheme    constant varchar(200)   := p_region.attribute_14;',
'    l_gauge_colors          varchar(200)            := p_region.attribute_15;',
'    l_gauge_bg_color        varchar(200)            := p_region.attribute_16;',
'    c_gauge_mode            constant varchar(200)   := p_region.attribute_17;',
'    c_width                 constant number         := p_region.attribute_18;',
'    c_height                constant number         := p_region.attribute_19;',
'    c_decimals              constant number         := greatest(nvl(p_region.attribute_24, 0), 0);',
'    l_width_style           varchar(200)            := '''';',
'    l_height_style          varchar(200)            := '''';',
'',
'    -- Function constants',
'    c_rgb_single_regex      constant varchar2(200)  := ''^#[0-9a-fA-F]{6}$'';',
'    c_rgb_list_regex        constant varchar2(200)  := ''^#[0-9a-fA-F]{6}(,#[0-9a-fA-F]{6})*$'';',
'begin',
'    -- Size style settings',
'    if c_width is not null then ',
'        l_width_style := ''width:'' || c_width || ''px;'';',
'    end if;',
'    if c_height is not null then ',
'        l_height_style := ''height:'' || c_height || ''px;'';',
'    end if;',
'',
'    -- Add placeholder div',
'    sys.htp.p (',
'        ''<div class="a-BadgeChart a-BadgeChart--justGage" id="'' || p_region.static_id || ''_container">'' ||',
'            ''<div class="a-JustGage-desc"></div>'' ||',
'            ''<div id="'' || p_region.static_id || ''_gauge" class="a-JustGage-chart" style="'' || l_width_style || l_height_style || ''"></div>'' ||',
'            ''<div class="a-BadgeChart-text">'' ||',
'                ''<span class="a-BadgeChart-label"></span>'' ||',
'                ''<span class="a-BadgeChart-desc"></span>'' ||',
'            ''</div>'' ||',
'        ''</div>'');',
'',
'    -- Labels defaults',
'    if not c_show_labels then',
'        l_title := '''';',
'        l_units := '''';',
'        l_value_prefix := '''';',
'        l_value_suffix := '''';',
'        l_show_min_max := false;',
'    end if;',
'',
'    -- Donut mode has no min/max value labels',
'    l_show_min_max := l_show_min_max and c_gauge_mode <> ''donut'';',
'',
'    -- Validate shadow configuration',
'    if c_show_shadow then',
'        if c_shadow_opacity < 0 or c_shadow_opacity > 1 then',
'            -- invalid option',
'            null;',
'        end if; ',
'    end if;',
'',
'    -- Validate gauge configuration',
'    if c_gauge_width <= 0 then',
'        -- invalid option',
'        null;',
'    end if;',
'    case c_gauge_color_scheme',
'        when ''GTR'' then',
'            l_gauge_colors := ''#56bd0d,#f0dc05,#f52900'';',
'        when ''RTG'' then',
'            l_gauge_colors := ''#f52900,#f0dc05,#56bd0d'';',
'        else',
'            l_gauge_colors := replace(l_gauge_colors, '' '', '''');',
'            if not regexp_like(l_gauge_colors, c_rgb_list_regex) then',
'                -- invalid option',
'                null;',
'            end if;',
'    end case;',
'    l_gauge_bg_color := replace(l_gauge_bg_color, '' '', '''');',
'    if not regexp_like(l_gauge_bg_color, c_rgb_single_regex) then',
'        -- invalid option',
'        null;',
'    end if;',
'',
'    -- Build the initial chart. Data will be loaded with ajax.',
'    apex_javascript.add_onload_code (',
'        p_code => ''com_oracle_apex_raphael_justgage('' ||',
'            apex_javascript.add_value(p_region.static_id) ||',
'            ''{'' ||',
'                apex_javascript.add_attribute(''regionId'',       p_region.static_id || ''_gauge'') || ',
'                apex_javascript.add_attribute(''title'',          l_title) || ',
'                apex_javascript.add_attribute(''units'',          l_units) || ',
'                apex_javascript.add_attribute(''valuePrefix'',    l_value_prefix) || ',
'                apex_javascript.add_attribute(''valueSuffix'',    l_value_suffix) || ',
'                apex_javascript.add_attribute(''roundTo'',        c_decimals) || ',
'                apex_javascript.add_attribute(''showMinMax'',     l_show_min_max) || ',
'                apex_javascript.add_attribute(''showShadow'',     c_show_shadow) || ',
'                apex_javascript.add_attribute(''shadowOpacity'',  c_shadow_opacity) || ',
'                apex_javascript.add_attribute(''shadowOffset'',   c_shadow_offset) || ',
'                apex_javascript.add_attribute(''gaugeWidth'',     c_gauge_width) || ',
'                apex_javascript.add_attribute(''gaugeColors'',    l_gauge_colors) || ',
'                apex_javascript.add_attribute(''gaugeBgColor'',   l_gauge_bg_color) || ',
'                apex_javascript.add_attribute(''gaugeMode'',      c_gauge_mode) || ',
'                apex_javascript.add_attribute(''heading'',        l_heading) || ',
'                apex_javascript.add_attribute(''description'',    c_description_template) || ',
'                apex_javascript.add_attribute(''pageItems'',      apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit)) ||',
'                apex_javascript.add_attribute(''ajaxIdentifier'', apex_plugin.get_ajax_identifier, false, false) ||',
'            ''});'' );',
'    return null;',
'end;',
'',
'',
'function ajax ',
'(',
'    p_region    in  apex_plugin.t_region,',
'    p_plugin    in  apex_plugin.t_plugin ',
')',
'return apex_plugin.t_region_ajax_result',
'is',
'    -- It''s better to have named variables instead of using the generic ones, ',
'    -- makes the code more readable. ',
'    c_value_column          constant varchar2(255) := p_region.attribute_01;',
'    c_min_column            constant varchar2(255) := p_region.attribute_02;',
'    c_max_column            constant varchar2(255) := p_region.attribute_03;',
'    c_heading_link          constant varchar2(4000) := p_region.attribute_22;',
'    c_description_link      constant varchar2(4000) := p_region.attribute_23;',
'',
'    l_value_column_no       pls_integer;',
'    l_min_column_no         pls_integer;',
'    l_max_column_no         pls_integer;',
'    l_column_value_list     apex_plugin_util.t_column_value_list2;',
'',
'    l_value                 number;',
'    l_min                   number;',
'    l_max                   number;',
'    l_heading_link          varchar2(4000);',
'    l_description_link      varchar2(4000);',
'begin',
'    apex_plugin_util.print_json_http_header;',
'',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'        p_sql_statement     => p_region.source,',
'        p_min_columns       => 1,',
'        p_max_columns       => 3,',
'        p_component_name    => p_region.name );',
'',
'    -- Get the actual column # for faster access and also verify that the data type',
'    -- of the column matches with what we are looking for',
'    l_value_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''value column'',',
'        p_column_alias          => c_value_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => true,',
'        p_data_type             => apex_plugin_util.c_data_type_number );',
'',
'    l_min_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''min value column'',',
'        p_column_alias          => c_min_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => false,',
'        p_data_type             => apex_plugin_util.c_data_type_number );',
'',
'    l_max_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''min value column'',',
'        p_column_alias          => c_max_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => false,',
'        p_data_type             => apex_plugin_util.c_data_type_number );',
'',
'    -- Fetch the data',
'    if l_column_value_list(1).value_list.count = 1 then',
'        apex_plugin_util.set_component_values (',
'            p_column_value_list => l_column_value_list,',
'            p_row_num => 1 ',
'        );',
'    ',
'        l_heading_link := case',
'            when c_heading_link is not null then',
'                apex_util.prepare_url (',
'                    apex_plugin_util.replace_substitutions (',
'                        p_value  => c_heading_link,',
'                        p_escape => false',
'                    )',
'                )',
'        end;',
'        ',
'        l_description_link := case',
'            when c_description_link is not null then',
'                apex_util.prepare_url (',
'                    apex_plugin_util.replace_substitutions (',
'                        p_value  => c_description_link,',
'                        p_escape => false',
'                    )',
'                )',
'        end;',
'        ',
'        l_value := l_column_value_list(l_value_column_no).value_list(1).number_value;',
'        if l_min_column_no is not null then',
'            l_min := l_column_value_list(l_min_column_no).value_list(1).number_value;',
'        end if;',
'        if l_max_column_no is not null then',
'            l_max := l_column_value_list(l_max_column_no).value_list(1).number_value;',
'        end if;',
'        ',
'        apex_plugin_util.clear_component_values;',
'    else',
'        --invalid number of rows',
'        null;',
'    end if;',
'',
'    -- Default value to 0.',
'    l_value := nvl(l_value, 0);',
'',
'    -- Default min value to 0.',
'    l_min := nvl(l_min, 0);',
'',
'    -- Default max value to the smallest power of 10 equal to or greater than the value, starting with 100.',
'    if l_max is null then',
'        l_max := 100;',
'        loop',
'            exit when l_max >= l_value;',
'            l_max := l_max * 10;',
'        end loop;',
'    end if;',
'',
'    -- Print the actual, max and min values',
'    sys.htp.prn (',
'        ''[{'' ||',
'            apex_javascript.add_attribute(''headingLink'',  l_heading_link) ||',
'            apex_javascript.add_attribute(''descriptionLink'',  l_description_link) ||',
'            apex_javascript.add_attribute(''value'',  l_value) ||',
'            apex_javascript.add_attribute(''min'',    l_min) ||',
'            apex_javascript.add_attribute(''max'',    l_max, false, false) ||',
'        ''}]'' );',
'',
'    return null;',
'end;'))
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT'
,p_sql_min_column_count=>1
,p_sql_max_column_count=>3
,p_substitute_attributes=>false
,p_reference_id=>7534122046207970661.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>7
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024533829863217389.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_default_value=>'VALUE'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'The column that contains the value to be represented on the gauge.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024534250295217389.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Min Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_default_value=>'MIN'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'The column containing the minimum value represented by the gauge. When the value is equal or lesser than the minimum, the gauge will be shown as completely empty empty. If left empty, the minimum value defaults to 0.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024534614937217389.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Max Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_default_value=>'MAX'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'The column containing the maximum value represented by the gauge. When the value is equal or greater than the minimum, the gauge will be shown as completely full. If left blank, the maximum value defaults to the lesser power of 10 greater than the va'
||'lue.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024535094921217390.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Show Labels'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024535427124217390.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024535094921217390.4752)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024535942300217390.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>20
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2024535094921217390.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'The text for the label above the gauge.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024536345289217391.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Units'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>20
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2024535094921217390.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'The text for the label immediately below the gauge value.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024536773919217391.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Value Prefix'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>2
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2024535094921217390.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'The value label will be prefixed with this text.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024537120880217391.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Value Suffix'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>2
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2024535094921217390.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'This text will be appended to the value label.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024537553989217391.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Show Min and Max Values'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2024543227106217394.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'GAUGE'
,p_lov_type=>'STATIC'
,p_help_text=>'Whether to the actual minimum and maximum values on the gauge.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024537945517217391.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024537553989217391.4752)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024538404894217392.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Show Shadow'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Whether to render a shadow gradient on the gauge.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024538819041217392.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024538404894217392.4752)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024539372411217392.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Shadow Opacity'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'0.5'
,p_display_length=>5
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2024538404894217392.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'The opacity of the shadow, measured between 0 and 1.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024539785495217392.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Shadow Offset'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'0'
,p_display_length=>5
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2024538404894217392.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'The vertical offset of the shadow, in pixels.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024540119407217392.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Gauge Width Scale'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1'
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_help_text=>'The scale of the gauge''s width.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024540585021217392.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'GTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024540914685217392.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024540585021217392.4752)
,p_display_sequence=>10
,p_display_value=>'Dynamic Green-to-Red'
,p_return_value=>'GTR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024541471231217393.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024540585021217392.4752)
,p_display_sequence=>20
,p_display_value=>'Dynamic Red-to-Green'
,p_return_value=>'RTG'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024541970819217394.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024540585021217392.4752)
,p_display_sequence=>30
,p_display_value=>'Custom Color(s)'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024542467045217394.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Gauge Color(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'#144485'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2024540585021217392.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'CUSTOM'
,p_help_text=>'A comma-separated list of RGB colors to be used on the gauge. The first color will be used when the value is near the minimum and the last color will be used when the value is near the maximum. Leave only one color for a solid fill.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024542892625217394.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>160
,p_prompt=>'Empty Color'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'#d9d9d9'
,p_display_length=>10
,p_is_translatable=>false
,p_help_text=>'The color to be used on the ''empty'' sector of the gauge.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024543227106217394.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>1
,p_prompt=>'Gauge Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'GAUGE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Whether to render the gauge as a half circle or as a full circle.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024543631421217394.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024543227106217394.4752)
,p_display_sequence=>10
,p_display_value=>'Normal'
,p_return_value=>'GAUGE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2024544134026217394.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2024543227106217394.4752)
,p_display_sequence=>20
,p_display_value=>'Donut'
,p_return_value=>'DONUT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024544630930217395.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>2
,p_prompt=>'Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>'The fixed width of the gauge, in pixels. Leave blank for automatic/responsive.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024545061199217395.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>3
,p_prompt=>'Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>'The fixed height of the gauge, in pixels. Leave blank for automatic/responsive.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024545477572217396.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>20
,p_display_sequence=>91
,p_prompt=>'Description'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'To be shown under the Gauge. You may use the following text replacements:',
'<ul>',
'<li>:MIN:</li>',
'<li>:MAX:</li>',
'<li>:VALUE:</li>',
'</ul>',
'Example:<br/>',
'The actual value is :VALUE: (out of :MAX:)'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024545892399217396.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>21
,p_display_sequence=>95
,p_prompt=>'Heading'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>20
,p_max_length=>200
,p_is_translatable=>true
,p_help_text=>'The heading is displayed directly above the description and is commonly set to the label for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024546237864217396.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>22
,p_display_sequence=>96
,p_prompt=>'Heading Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'A URL to which the user will be redirected when the heading gets clicked. This attribute supports substitution strings.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024546657668217396.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>23
,p_display_sequence=>92
,p_prompt=>'Description Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'A URL to which the user will be redirected when the description gets clicked. This attribute supports substitution strings.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2024547063771217396.4752)
,p_plugin_id=>wwv_flow_api.id(3321999852992080663.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>24
,p_display_sequence=>240
,p_prompt=>'Decimals'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_default_value=>'0'
,p_display_length=>5
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_html5_bar_chart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_display_name=>'Graphique à barres HTML 5 ***'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.HTML5_BAR_CHART'),'#IMAGE_PREFIX#plugins/com.oracle.apex.html5_bar_chart/1.0/')
,p_javascript_file_urls=>'#PLUGIN_FILES#com_oracle_apex_html5_bar_chart.js'
,p_css_file_urls=>'#PLUGIN_FILES#com_oracle_apex_html5_bar_chart.css'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'FUNCTION RENDER (',
'    P_REGION IN APEX_PLUGIN.T_REGION,',
'    P_PLUGIN IN APEX_PLUGIN.T_PLUGIN,',
'    P_IS_PRINTER_FRIENDLY IN BOOLEAN',
') RETURN APEX_PLUGIN.T_REGION_RENDER_RESULT IS',
'BEGIN',
'    HTP.PRN(''<div id="''||APEX_ESCAPE.HTML_ATTRIBUTE(P_REGION.STATIC_ID)||''_chart" class="hbc">'');',
'    HTP.PRN(''</div>'');',
'    ',
'    APEX_JAVASCRIPT.ADD_ONLOAD_CODE (',
'        P_CODE => ''com_oracle_apex_html5_bar_chart(''||',
'            APEX_JAVASCRIPT.ADD_VALUE(P_REGION.STATIC_ID)||',
'            ''{''||',
'                -- Why is this attribute needed if is not used?',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(',
'                    ''pageItems'', ',
'                    APEX_PLUGIN_UTIL.PAGE_ITEM_NAMES_TO_JQUERY(P_REGION.AJAX_ITEMS_TO_SUBMIT)',
'                )||',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(',
'                    ''ajaxIdentifier'', ',
'                    APEX_PLUGIN.GET_AJAX_IDENTIFIER, ',
'                    FALSE, ',
'                    FALSE',
'                )||',
'            ''}''||',
'        '');''',
'    );',
'    ',
'    RETURN NULL;',
'END RENDER;',
'',
'FUNCTION AJAX (',
'    P_REGION IN APEX_PLUGIN.T_REGION,',
'    P_PLUGIN IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_REGION_AJAX_RESULT IS',
'    -- Map region attributes to function constants',
'    -- MODERN, CLASSIC',
'    C_CHART_TYPE CONSTANT VARCHAR2(7) := P_REGION.ATTRIBUTE_15;',
'    -- MODERN, MODERN_2, SOLAR, METRO, CUSTOM, COLUMN',
'    C_COLOR_SCHEME CONSTANT VARCHAR2(8) := P_REGION.ATTRIBUTE_17;',
'    C_CUSTOM_CHART_COLORS CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_10;',
'    C_COLOR_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_19;',
'    -- NONE, IMAGE, ICON, INITIALS',
'    C_ICON_TYPE CONSTANT VARCHAR2(8) := case when C_CHART_TYPE = ''ICON'' then P_REGION.ATTRIBUTE_01 end;',
'    C_LABEL_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_02;',
'    C_LABEL_LINK CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_03;',
'    C_VALUE_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_04;',
'    C_VALUE_LINK CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_05;',
'    -- ABOVE, AROUND',
'    C_TEXT_POSITION VARCHAR2(6) := P_REGION.ATTRIBUTE_18;',
'    C_CHART_CSS_CLASSES CONSTANT VARCHAR2(32767) := P_REGION.ATTRIBUTE_06;',
'    C_IMAGE_URL CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_07;',
'    C_CSS_ICON_CLASS_NAME CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_08;',
'    C_INITIALS_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_09;',
'    -- ABSOLUTE, RELATIVE',
'    C_BAR_WIDTH_CALCULATION CONSTANT VARCHAR2(8) := P_REGION.ATTRIBUTE_16;',
'    C_DISPLAY CONSTANT VARCHAR2(19) := P_REGION.ATTRIBUTE_11;',
'    C_PREFIX_FOR_VALUE CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_12;',
'    C_POSTFIX_FOR_VALUE CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_13;',
'    C_MAXIMUM_ROWS CONSTANT NUMBER := P_REGION.ATTRIBUTE_14;',
'    C_MESSAGE_WHEN_NO_DATA_FOUND CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_20;',
'    ',
'    L_COLOR_COLUMN_NUMBER PLS_INTEGER;',
'    L_LABEL_COLUMN_NUMBER PLS_INTEGER;',
'    L_VALUE_COLUMN_NUMBER PLS_INTEGER;',
'    L_INITIALS_COLUMN_NUMBER PLS_INTEGER;',
'    ',
'    L_COLUMN_VALUE_LIST APEX_PLUGIN_UTIL.T_COLUMN_VALUE_LIST2;',
'    ',
'    L_COLOR VARCHAR2(4000) := NULL;',
'    L_LABEL VARCHAR2(4000) := NULL;',
'    L_LABEL_LINK VARCHAR2(4000) := NULL;',
'    L_VALUE VARCHAR2(4000) := NULL;',
'    L_VALUE_LINK VARCHAR2(4000) := NULL;',
'    L_IMAGE_URL VARCHAR2(4000) := NULL;',
'    L_CSS_ICON_CLASS_NAME VARCHAR2(4000) := NULL;',
'    L_INITIALS VARCHAR2(4000) := NULL;',
'    L_MESSAGE_WHEN_NO_DATA_FOUND VARCHAR2(4000) := NULL;',
'',
'    L_CUSTOM_CHART_COLORS_TABLE APEX_APPLICATION_GLOBAL.VC_ARR2;',
'    L_CUSTOM_CHART_COLORS VARCHAR2(32767) := NULL;',
'BEGIN',
'    L_COLUMN_VALUE_LIST := APEX_PLUGIN_UTIL.GET_DATA2(',
'        P_SQL_STATEMENT  => P_REGION.SOURCE,',
'        P_MIN_COLUMNS    => 1,',
'        P_MAX_COLUMNS    => NULL,',
'        P_COMPONENT_NAME => P_REGION.NAME,',
'        P_MAX_ROWS => C_MAXIMUM_ROWS',
'    );',
'',
'    L_COLOR_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'        P_ATTRIBUTE_LABEL   => ''Color Column'',',
'        P_COLUMN_ALIAS      => C_COLOR_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED       => C_COLOR_SCHEME = ''COLUMN'',',
'        P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'    );',
'    L_LABEL_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'        P_ATTRIBUTE_LABEL   => ''Label Column'',',
'        P_COLUMN_ALIAS      => C_LABEL_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED       => TRUE,',
'        P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'    );',
'    L_VALUE_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'        P_ATTRIBUTE_LABEL   => ''Value Column'',',
'        P_COLUMN_ALIAS      => C_VALUE_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED       => TRUE,',
'        P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'    );',
'    if C_ICON_TYPE = ''INITIALS'' then',
'        L_INITIALS_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'            P_ATTRIBUTE_LABEL   => ''Initials Column'',',
'            P_COLUMN_ALIAS      => C_INITIALS_COLUMN,',
'            P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'            P_IS_REQUIRED       => true,',
'            P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'        );',
'    end if;',
'    -- Begin output as JSON',
'    OWA_UTIL.MIME_HEADER(''application/json'', FALSE);',
'    HTP.P(''Cache-Control: no-cache'');',
'    HTP.P(''Pragma: no-cache'');',
'    OWA_UTIL.HTTP_HEADER_CLOSE;',
'    ',
'    IF C_COLOR_SCHEME = ''CUSTOM'' THEN',
'        L_CUSTOM_CHART_COLORS_TABLE := APEX_UTIL.STRING_TO_TABLE(CASE WHEN C_CUSTOM_CHART_COLORS IS NOT NULL THEN TRIM(BOTH '''''''' FROM APEX_ESCAPE.JS_LITERAL(C_CUSTOM_CHART_COLORS)) END, '':'');',
'        L_CUSTOM_CHART_COLORS := ''"color_scheme":['';',
'        FOR I IN L_CUSTOM_CHART_COLORS_TABLE.FIRST .. L_CUSTOM_CHART_COLORS_TABLE.LAST LOOP',
'            IF I > 1 THEN',
'                L_CUSTOM_CHART_COLORS := L_CUSTOM_CHART_COLORS||'','';',
'            END IF;',
'            L_CUSTOM_CHART_COLORS := L_CUSTOM_CHART_COLORS||''"''||L_CUSTOM_CHART_COLORS_TABLE(I)||''"'';',
'        END LOOP;',
'        L_CUSTOM_CHART_COLORS := L_CUSTOM_CHART_COLORS||''],'';',
'    END IF;',
'',
'    L_MESSAGE_WHEN_NO_DATA_FOUND := APEX_ESCAPE.HTML_WHITELIST(',
'        APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                P_VALUE  => C_MESSAGE_WHEN_NO_DATA_FOUND,',
'                P_ESCAPE => FALSE',
'            )',
'        );',
'',
'    HTP.PRN(',
'        ''{''||',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''chart_type'',',
'                C_CHART_TYPE,',
'                FALSE,',
'                TRUE',
'            )',
'    );',
'    HTP.PRN(',
'        APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'            ''message_when_no_data_found'',',
'            L_MESSAGE_WHEN_NO_DATA_FOUND,',
'            TRUE,',
'            TRUE',
'        )',
'    );',
'    HTP.PRN(',
'        APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'            ''chart_css_class_names'',',
'            C_CHART_CSS_CLASSES,',
'            TRUE,',
'            TRUE',
'        )',
'    );',
'    HTP.PRN(',
'        APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'            ''icon_type'',',
'            C_ICON_TYPE,',
'            TRUE,',
'            TRUE',
'        )',
'    );',
'    IF C_COLOR_SCHEME = ''CUSTOM'' THEN',
'        HTP.PRN(',
'            L_CUSTOM_CHART_COLORS',
'        );',
'    ELSE',
'        HTP.PRN(',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''color_scheme'',',
'                C_COLOR_SCHEME,',
'                TRUE,',
'                TRUE',
'            )',
'        );',
'    END IF;',
'    HTP.PRN(',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''text_position'',',
'                C_TEXT_POSITION,',
'                FALSE,',
'                TRUE',
'            )||',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''bar_width_calculation'',',
'                C_BAR_WIDTH_CALCULATION,',
'                FALSE,',
'                TRUE',
'            )||',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''display'',',
'                C_DISPLAY,',
'                FALSE,',
'                TRUE',
'            )||',
'            CASE ',
'            	WHEN C_DISPLAY IN (''VALUE'') THEN',
'					APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''prefix_for_value'',',
'						C_PREFIX_FOR_VALUE,',
'						TRUE,',
'						TRUE',
'					)||',
'					APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''postfix_for_value'',',
'						C_POSTFIX_FOR_VALUE,',
'						TRUE,',
'						TRUE',
'					)',
'			END||',
'            ''"items":[''',
'    );',
'    ',
'    --FOR L_ROW_NUMBER IN L_COLUMN_VALUE_LIST(1).VALUE_LIST.FIRST .. L_COLUMN_VALUE_LIST(1).VALUE_LIST.LAST LOOP',
'    FOR L_ROW_NUMBER IN 1 .. L_COLUMN_VALUE_LIST(1).VALUE_LIST.COUNT LOOP',
'        BEGIN',
'            APEX_PLUGIN_UTIL.SET_COMPONENT_VALUES (',
'                P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'                P_ROW_NUM => L_ROW_NUMBER ',
'            );',
'            ',
'            IF L_ROW_NUMBER > 1 THEN',
'            	HTP.PRN('', '');',
'            END IF;',
'            ',
'            HTP.PRN(''{'');',
'            ',
'            L_LABEL := APEX_PLUGIN_UTIL.ESCAPE (',
'                APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'                    P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_LABEL_COLUMN_NUMBER).DATA_TYPE,',
'                    P_VALUE => L_COLUMN_VALUE_LIST(L_LABEL_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'                ),',
'                P_REGION.ESCAPE_OUTPUT',
'            );',
'            HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''label'',',
'                    L_LABEL,',
'                    FALSE',
'            	)',
'            );',
'            L_LABEL_LINK := ',
'                CASE ',
'                    WHEN C_LABEL_LINK IS NOT NULL THEN ',
'                        APEX_UTIL.PREPARE_URL (',
'                            APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                                P_VALUE  => C_LABEL_LINK,',
'                                P_ESCAPE => FALSE',
'                            )',
'                        )',
'                END;',
'            HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''label_link'',',
'                    L_LABEL_LINK',
'                )',
'            );',
'            L_VALUE := APEX_PLUGIN_UTIL.ESCAPE (',
'               APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'                   P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_VALUE_COLUMN_NUMBER).DATA_TYPE,',
'                   P_VALUE => L_COLUMN_VALUE_LIST(L_VALUE_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'               ),',
'               P_REGION.ESCAPE_OUTPUT',
'            );',
'            HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''value'',',
'                    L_VALUE,',
'                    FALSE,',
'                    C_VALUE_LINK IS NOT NULL OR L_COLOR_COLUMN_NUMBER IS NOT NULL OR C_CHART_TYPE = ''ICON''',
'                )',
'            );',
'            L_VALUE_LINK := ',
'                CASE ',
'                    WHEN C_VALUE_LINK IS NOT NULL THEN ',
'                        APEX_UTIL.PREPARE_URL (',
'                            APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                                P_VALUE  => C_VALUE_LINK,',
'                                P_ESCAPE => FALSE',
'                            )',
'                        )',
'                END;',
'             HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''value_link'',',
'                    L_VALUE_LINK,',
'                    TRUE,',
'                    L_COLOR_COLUMN_NUMBER IS NOT NULL OR C_CHART_TYPE = ''ICON''',
'                )',
'            );',
'            IF L_COLOR_COLUMN_NUMBER IS NOT NULL THEN',
'                L_COLOR := APEX_PLUGIN_UTIL.ESCAPE (',
'                   APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'                       P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_COLOR_COLUMN_NUMBER).DATA_TYPE,',
'                       P_VALUE => L_COLUMN_VALUE_LIST(L_COLOR_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'                   ),',
'                   P_REGION.ESCAPE_OUTPUT',
'                );',
'                HTP.PRN(',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                        ''color'',',
'                        L_COLOR,',
'                        FALSE,',
'                        C_CHART_TYPE = ''ICON''',
'                    )',
'                );',
'            END IF;',
'            IF C_ICON_TYPE = ''IMAGE'' THEN',
'				L_IMAGE_URL := ',
'                    CASE ',
'                        WHEN C_IMAGE_URL IS NOT NULL THEN ',
'                            APEX_UTIL.PREPARE_URL (',
'                                APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                                    P_VALUE  => C_IMAGE_URL,',
'                                    P_ESCAPE => FALSE',
'                                )',
'                            )',
'                    END;',
'				HTP.PRN(',
'					APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''image_url'',',
'						L_IMAGE_URL,',
'						FALSE,',
'						FALSE',
'					)',
'				);',
'			ELSIF C_ICON_TYPE = ''ICON'' THEN',
'				L_CSS_ICON_CLASS_NAME := APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                    P_VALUE  => C_CSS_ICON_CLASS_NAME,',
'                    P_ESCAPE => TRUE',
'                );',
'				HTP.PRN(',
'                	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''icon_css_class_name'',',
'						L_CSS_ICON_CLASS_NAME,',
'						FALSE,',
'						FALSE',
'					)',
'				);',
'			ELSIF C_ICON_TYPE = ''INITIALS'' THEN',
'				L_INITIALS := APEX_PLUGIN_UTIL.ESCAPE (',
'					APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'						P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_INITIALS_COLUMN_NUMBER).DATA_TYPE,',
'						P_VALUE => L_COLUMN_VALUE_LIST(L_INITIALS_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'					),',
'					P_REGION.ESCAPE_OUTPUT',
'				);',
'				HTP.PRN(',
'                	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    	''initials'',',
'	                    L_INITIALS,',
'	                    FALSE,',
'	                    FALSE',
'    	            )',
'    	        );',
'            END IF;',
'            ',
'			HTP.PRN(''}'');',
'            ',
'            APEX_PLUGIN_UTIL.CLEAR_COMPONENT_VALUES;',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                APEX_PLUGIN_UTIL.CLEAR_COMPONENT_VALUES;',
'                RAISE;',
'        END;',
'    END LOOP;',
'    HTP.PRN(',
'            '']''||',
'        ''}''',
'    );',
'    ',
'    RETURN NULL;',
'END AJAX;'))
,p_render_function=>'RENDER'
,p_ajax_function=>'AJAX'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT:ESCAPE_OUTPUT'
,p_sql_min_column_count=>1
,p_substitute_attributes=>false
,p_reference_id=>5610141522737396215.4752
,p_subscribe_plugin_settings=>true
,p_help_text=>'<p>Ce module d''extension dessine des graphiques à barres horizontales contenant des libellés, des valeurs et même des icônes</p>'
,p_version_identifier=>'1.0'
,p_files_version=>16
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006268931685907537.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Icon Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'INITIALS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006277098711907541.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ICON'
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul>',
'    <li><strong>Image</strong>: Adds an image HTML element on the left side of the chart.</li>',
'    <li><strong>CSS Icon</strong>: Unlike the &quot;Image&quot; icon, instead of displaying an image HTML element, it displays an icon with the given CSS class.</li>',
'    <li><strong>Initials</strong>: Opposed to both, the &quot;Image&quot; and &quot;CSS Icon&quot; icons, this one displays a colored circle containing the given initials.</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006269307704907538.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006268931685907537.4752)
,p_display_sequence=>10
,p_display_value=>'Image'
,p_return_value=>'IMAGE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006269805212907538.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006268931685907537.4752)
,p_display_sequence=>20
,p_display_value=>'CSS Icon'
,p_return_value=>'ICON'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006270313871907538.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006268931685907537.4752)
,p_display_sequence=>30
,p_display_value=>'Initials'
,p_return_value=>'INITIALS'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006270898104907538.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Label Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'<p>A query column from which the label to be displayed is given.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006271224803907539.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Label Link'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'<p>A URL to be opened whenever the label is clicked. This attribute supports substitution strings.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006271675789907539.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'<p>A query column from which the label to be displayed is given. Notice that this value is not displayed on the chart items when the chart has been configured to display the bar width percentage instead.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006272020373907539.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Value Link'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'<p>A URL to be opened whenever the displayed value is clicked. This attribute supports substitution strings.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006272490890907539.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>5
,p_prompt=>'Chart CSS Class Names'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'<p>CSS class names to be added to the root element of the chart separated with spaces.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006272846289907539.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>13
,p_prompt=>'Image URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006268931685907537.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IMAGE'
,p_help_text=>'<p>The Image URL to be displayed as the chart icon. This attribute supports Substitution strings referring to som query column like in <strong>&amp;IMAGE_URL.</strong> which would reference the <strong>IMAGE_URL</strong> column value for each of the '
||'bars presented on the char. Notice that substitutions with no value will be replaced with an empty string.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006273272857907539.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>12
,p_prompt=>'CSS Icon Class Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006268931685907537.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ICON'
,p_help_text=>'<p>The Icon CSS Class Name.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006273675862907539.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>14
,p_prompt=>'Initials Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006268931685907537.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'INITIALS'
,p_help_text=>'<p>A query column from which initials to be displayed as an icon are given.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006274092256907540.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>7
,p_prompt=>'Custom Chart Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'CUSTOM'
,p_help_text=>'<p>A list of CSS supported colors separated by colons.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006274433061907540.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Display'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VALUE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Displays either the item value or the calculated bar width on the right most text in the chart item.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006274824808907540.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006274433061907540.4752)
,p_display_sequence=>10
,p_display_value=>'Value'
,p_return_value=>'VALUE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006275327182907540.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006274433061907540.4752)
,p_display_sequence=>20
,p_display_value=>'Bar Width'
,p_return_value=>'BAR_WIDTH'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006275868271907541.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Prefix for Value'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2006274433061907540.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE'
,p_help_text=>'<p>When the value is displayed on the right most side of the chart item. The value of this attribute is prepended to it.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006276251069907541.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Postfix for Value'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2006274433061907540.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE'
,p_help_text=>'<p>When the value is displayed on the right most side of the chart item. The value of this attribute is appended to it.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006276652694907541.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Maximum Rows'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'5'
,p_is_translatable=>false
,p_help_text=>'<p>The maximum number of items to be displayed inside the region. Notice bar width calculations are made based on the number of items displayed.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006277098711907541.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>4
,p_prompt=>'Chart Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'TEXT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Defines how the chart will be displayed. There are two types of chart: </p>',
'<ul>',
'    <li><strong>Icon Chart</strong>: Displays bars with the label and value above and add an icon on the left.</li>',
'    <li><strong>Text Chart</strong>: Displays bars with the label and value either above or inline with the bar.</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006277474563907541.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006277098711907541.4752)
,p_display_sequence=>10
,p_display_value=>'Icon Chart'
,p_return_value=>'ICON'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006277997330907541.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006277098711907541.4752)
,p_display_sequence=>20
,p_display_value=>'Text Chart'
,p_return_value=>'TEXT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006278471627907542.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>105
,p_prompt=>'Bar Width Calculation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ABSOLUTE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Bar widths for each one of the chart items can be calculated in two ways:</p>',
'<ul>',
'    <li><strong>Absolute</strong>: 100% bar width is represented by the maximum value on the displayed chart items.</li>',
'    <li><strong>Relative</strong>: 100% bar width is represented by the sum of the values of all the displayed chart items.</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006278897464907542.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006278471627907542.4752)
,p_display_sequence=>10
,p_display_value=>'Absolute'
,p_return_value=>'ABSOLUTE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006279373310907542.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006278471627907542.4752)
,p_display_sequence=>20
,p_display_value=>'Relative'
,p_return_value=>'RELATIVE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>6
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>The colors to be used in the chart bars. There are two special types of configuration: </p>',
'<ul>',
'    <li><strong>Custom</strong>: Provides a text box to receive a colon separated list of css supported colors.</li>',
'</ul>',
'<ul>',
'    <li><strong>Query Column</strong>: Provides a select list with the query columns which expects a css valid color.</li>',
'</ul>',
''))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006280226737907543.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_display_sequence=>5
,p_display_value=>'Default'
,p_return_value=>'DEFAULT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006280711849907543.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_display_sequence=>10
,p_display_value=>'Modern'
,p_return_value=>'MODERN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006281297160907543.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN_2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006281704972907543.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006282208978907543.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006282788751907543.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_display_sequence=>50
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006283223942907543.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_display_sequence=>60
,p_display_value=>'Query Column'
,p_return_value=>'COLUMN'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006283798141907544.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>55
,p_prompt=>'Text Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'AROUND'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006277098711907541.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'TEXT'
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>When displaying a text chart, two options are available for displaying the label and value texts:</p>',
'<ul>',
'    <li><strong>Above the bar</strong>: The label and value texts are displayed above the bar at the left and right most sides of it respectively.</li>',
'    <li><strong>Inline with the bar</strong>: The label, the bar and the value are displayed in one line on that order.</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006284193963907544.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006283798141907544.4752)
,p_display_sequence=>10
,p_display_value=>'Above the bar'
,p_return_value=>'ABOVE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006284698759907545.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006283798141907544.4752)
,p_display_sequence=>20
,p_display_value=>'Inline with the bar'
,p_return_value=>'AROUND'
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006285119215907545.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>8
,p_prompt=>'Chart Colors Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006279811153907542.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'COLUMN'
,p_help_text=>'<p>A query column from which CSS supported colors are given.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006285570964907546.4752)
,p_plugin_id=>wwv_flow_api.id(3347748742822204626.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>20
,p_display_sequence=>200
,p_prompt=>'Message When No Data Found'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'No data found.'
,p_is_translatable=>true
,p_help_text=>'<p>Message to be displayed when no data was found.</p>'
);
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_flot_line
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.FLOT.LINE'
,p_display_name=>'Graphique à courbes Flot v2 ***'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.FLOT.LINE'),'#IMAGE_PREFIX#plugins/com.oracle.apex.flot_line/2.0/')
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/excanvas.min.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/jquery.flot.min.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/jquery.flot.resize.min.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/jquery.flot.symbol.min.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/jquery.flot.time.min.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/jquery.flot.axislabels.js',
'#PLUGIN_FILES#interpolation.js',
'#PLUGIN_FILES#com.oracle.apex.flot_line.js'))
,p_css_file_urls=>'#PLUGIN_FILES#com.oracle.apex.flot_line.css'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render ',
'(',
'    p_region                in  apex_plugin.t_region,',
'    p_plugin                in  apex_plugin.t_plugin,',
'    p_is_printer_friendly   in  boolean ',
')',
'return apex_plugin.t_region_render_result',
'is',
'    -- Assign readable names to plugin attributes. Omit data attributes, they''ll be handled in ajax function.',
'    -- Dimensions',
'    c_min_height            constant number         := nvl(p_region.attribute_18, 100);',
'    c_max_height            constant number         := nvl(p_region.attribute_19, 500);',
'',
'    -- Series display configuration',
'    c_data_points           constant varchar2(200)  := p_region.attribute_06;',
'    c_show_data_points      constant boolean        := c_data_points <> ''NONE'';',
'    c_interpolation         constant varchar2(200)  := p_region.attribute_21;',
'    c_show_area             constant boolean        := p_region.attribute_22 is not null;',
'',
'    -- Axis titles',
'    c_x_axis_title          constant varchar2(200)  := p_region.attribute_08;',
'    c_y_axis_title          constant varchar2(200)  := p_region.attribute_09;',
'',
'    -- Tooltip configuration',
'    c_show_tooltip          constant boolean        := p_region.attribute_10 is not null;',
'    c_series_tooltip        constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':SERIES:'') > 0;',
'    c_x_tooltip             constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':X:'') > 0;',
'    c_y_tooltip             constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':Y:'') > 0;',
'    c_custom_tooltip        constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':CUSTOM:'') > 0;',
'',
'    -- Legend',
'    c_show_legend           constant boolean        := p_region.attribute_12 is not null;',
'',
'    -- Colors',
'    c_color_scheme          constant varchar2(200)  := p_region.attribute_13;',
'    l_colors                varchar2(200)           := p_region.attribute_14;',
'',
'    -- X type checking',
'    c_is_time_data          constant boolean        := p_region.attribute_17 = ''TIMESTAMP'' OR p_region.attribute_17 = ''DATE'';',
'',
'    -- Aspect ratios',
'    c_min_ar                constant number         := nvl( apex_plugin_util.get_attribute_as_number( p_plugin.attribute_02, ''Min Aspect Ratio'' ), 1.333 );',
'    c_max_ar                constant number         := nvl( apex_plugin_util.get_attribute_as_number( p_plugin.attribute_01, ''Max Aspect Ratio'' ), 3 );',
'',
'    -- Function constants',
'    c_rgb_list_regex        constant varchar2(200)  := ''^#[0-9a-fA-F]{6}(,#[0-9a-fA-F]{6})*$'';',
'begin',
'    -- Add placeholder div',
'    sys.htp.p (',
'        ''<div class="a-FlotLine" id="'' || p_region.static_id || ''_container">'' ||',
'            ''<div class="a-FlotLine-desc"></div>'' ||',
'            ''<div class="a-FlotLine-chart" id="'' || p_region.static_id || ''_chart"></div>'' ||',
'        ''</div>'');',
'',
'    -- Color scheme',
'    case c_color_scheme',
'        when ''MODERN'' then',
'            l_colors := ''#FF3B30,#FF9500,#FFCC00,#4CD964,#34AADC,#007AFF,#5856D6,#FF2D55,#8E8E93,#C7C7CC'';',
'        when ''MODERN2'' then',
'            l_colors := ''#1ABC9C,#2ECC71,#4AA3DF,#9B59B6,#3D566E,#F1C40F,#E67E22,#E74C3C'';',
'        when ''SOLAR'' then',
'            l_colors := ''#B58900,#CB4B16,#DC322F,#D33682,#6C71C4,#268BD2,#2AA198,#859900'';',
'        when ''METRO'' then',
'            l_colors := ''#E61400,#19A2DE,#319A31,#EF9608,#8CBE29,#A500FF,#00AAAD,#FF0094,#9C5100,#E671B5'';',
'        else',
'            null;',
'    end case;',
'',
'    -- Build the initial chart. Data will be loaded with ajax.',
'    apex_javascript.add_onload_code (',
'        p_code => ''com_oracle_apex_flot_line('' ||',
'            apex_javascript.add_value(p_region.static_id) ||',
'            ''{'' ||',
'                apex_javascript.add_attribute(''chartRegionId'',  p_region.static_id || ''_chart'') ||',
'                apex_javascript.add_attribute(''isTimeData'',     c_is_time_data) || ',
'                apex_javascript.add_attribute(''showDataPoints'', c_show_data_points) || ',
'                apex_javascript.add_attribute(''fill'',           c_show_area) || ',
'                apex_javascript.add_attribute(''interpolation'',  c_interpolation) || ',
'                apex_javascript.add_attribute(''dataPoints'',     c_data_points) || ',
'                apex_javascript.add_attribute(''xAxisTitle'',     c_x_axis_title) || ',
'                apex_javascript.add_attribute(''yAxisTitle'',     c_y_axis_title) || ',
'                apex_javascript.add_attribute(''showTooltip'',    c_show_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipSeries'',  c_series_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipX'',       c_x_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipY'',       c_y_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipCustom'',  c_custom_tooltip) || ',
'                apex_javascript.add_attribute(''showLegend'',     c_show_legend) || ',
'                apex_javascript.add_attribute(''colors'',         l_colors) || ',
'                apex_javascript.add_attribute(''minHeight'',      c_min_height) || ',
'                apex_javascript.add_attribute(''maxHeight'',      c_max_height) || ',
'                apex_javascript.add_attribute(''minAR'',          c_min_ar) ||',
'                apex_javascript.add_attribute(''maxAR'',          c_max_ar) ||',
'                apex_javascript.add_attribute(''noDataFoundMessage'', p_region.no_data_found_message) || ',
'                apex_javascript.add_attribute(''pageItems'',      apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit)) ||',
'                apex_javascript.add_attribute(''ajaxIdentifier'', apex_plugin.get_ajax_identifier, false, false) ||',
'            ''});'' );',
'    return null;',
'end;',
'',
'function ajax',
'(',
'    p_region    in  apex_plugin.t_region,',
'    p_plugin    in  apex_plugin.t_plugin ',
')',
'return apex_plugin.t_region_ajax_result',
'is',
'    -- It''s better to have named variables instead of using the generic ones, ',
'    -- makes the code more readable. ',
'    c_has_multiple_series   constant boolean := ( p_region.attribute_03 = ''Y'' );',
'',
'    -- Column names',
'    c_x_type                constant varchar2(200) := p_region.attribute_17;',
'    c_x_column              constant varchar2(255) := coalesce(p_region.attribute_01, p_region.attribute_15, p_region.attribute_16);',
'    c_y_column              constant varchar2(255) := p_region.attribute_02;',
'    c_series_column         constant varchar2(255) := case when c_has_multiple_series then p_region.attribute_04 end;',
'    c_tooltip_column        constant varchar2(255) := p_region.attribute_11;',
'    c_link_target           constant varchar2(255) := p_region.attribute_20;',
'',
'    -- Series name, for single series configuration',
'    c_series_name           constant varchar2(200) := case when not c_has_multiple_series then p_region.attribute_05 end;',
'    c_use_sql_color         constant boolean       := p_region.attribute_13 = ''COLUMN'';',
'',
'    -- Column numbers for fetching',
'    l_x_column_no           pls_integer;',
'    l_y_column_no           pls_integer;',
'    l_series_column_no      pls_integer;',
'    l_tooltip_column_no     pls_integer;',
'    l_link_column_no        pls_integer;',
'    l_column_value_list     apex_plugin_util.t_column_value_list2;',
'',
'    -- Holders for row data',
'    l_x_number              number;',
'    l_x_timestamp           timestamp;',
'    l_x_date                date;',
'    l_y                     number;',
'    l_series                varchar2(4000);',
'    l_color                 varchar2(4000);',
'    l_tooltip               varchar2(4000);',
'    l_link                  varchar2(4000);',
'',
'    -- Date utils',
'    c_epoch                 constant timestamp     := to_date(''01-01-1970 00:00:00'', ''DD-MM-YYYY HH24:MI:SS'');',
'    l_millis                number;',
'begin',
'    apex_plugin_util.print_json_http_header;',
'',
'    sys.htp.prn(''{'');',
'',
'    -- First, we must get the color mapping if the color scheme requires it.',
'    if c_use_sql_color then',
'        l_column_value_list := apex_plugin_util.get_data2 (',
'            p_sql_statement     => p_region.attribute_23,',
'            p_min_columns       => 2,',
'            p_max_columns       => 2,',
'            p_component_name    => p_region.name );',
'',
'        sys.htp.prn(''"colors":['');',
'        for l_row_num in 1 .. l_column_value_list(1).value_list.count loop',
'            -- Series, optional',
'            l_series := apex_plugin_util.get_value_as_varchar2 (',
'                p_data_type => l_column_value_list(1).data_type,',
'                p_value     => l_column_value_list(1).value_list(l_row_num) );',
'            l_color := apex_plugin_util.get_value_as_varchar2 (',
'                p_data_type => l_column_value_list(2).data_type,',
'                p_value     => l_column_value_list(2).value_list(l_row_num) );',
'            ',
'        if l_row_num > 1 then',
'            sys.htp.prn('','');            ',
'        end if;',
'            sys.htp.prn(''{'');',
'            sys.htp.prn(',
'                apex_javascript.add_attribute(''series'', l_series) ||',
'                apex_javascript.add_attribute(''color'',  l_color, false, false) );',
'            sys.htp.prn(''}'');',
'        end loop;',
'        sys.htp.prn(''],'');',
'',
'        l_series := null;',
'    end if;',
'',
'    -- Then, we get the actual data points.',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'        p_sql_statement     => ''SELECT * FROM ('' || p_region.source || '') ORDER BY "'' || c_x_column || ''" ASC'',',
'        p_min_columns       => 2,',
'        p_max_columns       => 5,',
'        p_component_name    => p_region.name );',
'',
'    -- Get the actual column # for faster access and also verify that the data type',
'    -- of the column matches with what we are looking for',
'    l_x_column_no := apex_plugin_util.get_column_no (',
'                p_attribute_label       => ''x column'',',
'                p_column_alias          => c_x_column,',
'                p_column_value_list     => l_column_value_list,',
'                p_is_required           => true,',
'                p_data_type             => case c_x_type  ',
'                                            when ''NUMBER'' then apex_plugin_util.c_data_type_number',
'                                            when ''DATE'' then apex_plugin_util.c_data_type_date',
'                                            when ''TIMESTAMP'' then apex_plugin_util.c_data_type_timestamp end );',
'',
'    l_y_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''y column'',',
'        p_column_alias          => c_y_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => true,',
'        p_data_type             => apex_plugin_util.c_data_type_number );',
'',
'    l_series_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''series column'',',
'        p_column_alias          => c_series_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => false,',
'        p_data_type             => apex_plugin_util.c_data_type_varchar2 );',
'',
'    l_tooltip_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''tooltip column'',',
'        p_column_alias          => c_tooltip_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => false,',
'        p_data_type             => apex_plugin_util.c_data_type_varchar2 );',
'',
'    sys.htp.prn(''"data":['');',
'',
'    -- Fetch data',
'    for l_row_num in 1 .. l_column_value_list(1).value_list.count loop',
'        begin',
'            apex_plugin_util.set_component_values (',
'                p_column_value_list => l_column_value_list,',
'                p_row_num => l_row_num ',
'            );',
'',
'            -- X may be TIMESTAMP, DATE or NUMBER, required',
'            case c_x_type',
'                when ''TIMESTAMP'' then',
'                    l_x_timestamp := l_column_value_list(l_x_column_no).value_list(l_row_num).timestamp_value;',
'                    l_x_number := extract(day from (l_x_timestamp - c_epoch)) * 86400000 + ',
'                        extract(hour from (l_x_timestamp - c_epoch)) * 3600000 +',
'                        extract(minute from (l_x_timestamp - c_epoch)) * 60000 +',
'                        extract(second from (l_x_timestamp - c_epoch)) * 1000;',
'                when ''DATE'' then',
'                    l_x_date := l_column_value_list(l_x_column_no).value_list(l_row_num).date_value;',
'                    l_x_number := extract(day from (l_x_date - c_epoch)) * 86400000 + ',
'                        extract(hour from (l_x_date - c_epoch)) * 3600000 +',
'                        extract(minute from (l_x_date - c_epoch)) * 60000 +',
'                        extract(second from (l_x_date - c_epoch)) * 1000;',
'                when ''NUMBER'' then',
'                    l_x_number := l_column_value_list(l_x_column_no).value_list(l_row_num).number_value;',
'            end case;',
'',
'            -- Y is a number, required',
'            l_y := l_column_value_list(l_y_column_no).value_list(l_row_num).number_value;',
'',
'            -- Series, optional',
'            if l_series_column_no is not null then',
'                l_series := apex_plugin_util.get_value_as_varchar2 (',
'                    p_data_type => l_column_value_list(l_series_column_no).data_type,',
'                    p_value     => l_column_value_list(l_series_column_no).value_list(l_row_num) );',
'            end if;',
'',
'            -- Tooltip, optional',
'            if l_tooltip_column_no is not null then',
'                l_tooltip := apex_plugin_util.get_value_as_varchar2 (',
'                    p_data_type => l_column_value_list(l_tooltip_column_no).data_type,',
'                    p_value     => l_column_value_list(l_tooltip_column_no).value_list(l_row_num) );',
'            end if;',
'',
'            -- Link, optional',
'            if c_link_target is not null then',
'                l_link := wwv_flow_utilities.prepare_url (',
'                    apex_plugin_util.replace_substitutions (',
'                        p_value  => c_link_target,',
'                        p_escape => false ) );',
'            end if;',
'',
'            -- Print an object representing this data point',
'            if l_row_num > 1 then',
'                sys.htp.prn('','');            ',
'            end if;',
'            sys.htp.prn(',
'                ''{'' ||',
'                    apex_javascript.add_attribute(''series'',  nvl(l_series, c_series_name)) ||',
'                    apex_javascript.add_attribute(''tooltip'', l_tooltip) ||',
'                    apex_javascript.add_attribute(''link'',    l_link) ||',
'                    apex_javascript.add_attribute(''x'',       l_x_number) ||',
'                    apex_javascript.add_attribute(''y'',       l_y, false, false ) ||',
'                ''}'' );',
'',
'            apex_plugin_util.clear_component_values;',
'        exception when others then',
'            apex_plugin_util.clear_component_values;',
'            raise;',
'        end;',
'    end loop;',
'    sys.htp.prn('']'');',
'    sys.htp.prn(''}'');',
'',
'    return null;',
'end;'))
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT:NO_DATA_FOUND_MESSAGE'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>5
,p_substitute_attributes=>false
,p_reference_id=>7889316075630806158.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'2.0'
,p_files_version=>20
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010897423255119021.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Max Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'3'
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>'The maximum aspect ratio that Flot line charts use to recommend a height. A max aspect ratio of 3 means that the chart''s width should be no greater than 3 times its height. It can be overridden by the ''Max Height'' setting on each region.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010897825219119022.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Min Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1.333'
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>'The minimum aspect ratio that Flot line charts use to recommend a height. A min aspect ratio of 1.333 means that the chart''s width should be no less than 1.333 times its height. It can be overridden by the ''Min Height'' setting on each region.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010898246315119022.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'X Values Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_default_value=>'X'
,p_column_data_types=>'TIMESTAMP'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010914647289119032.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'TIMESTAMP'
,p_help_text=>'The column of the region SQL query to use as X values. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010898659224119022.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Y Values Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_default_value=>'Y'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'The column of the region SQL query to use as Y values. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010899095920119022.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Multiple Series'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Enable multi-series functionality on the chart. If selected, you must select a column to use as a series identifier.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010899457754119023.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010899095920119022.4752)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010899949207119023.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Series Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_default_value=>'SERIES'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010899095920119022.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'The column of the region SQL query to use as a series identifier. The values on this column will become the series'' names. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010900323720119023.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Series Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2010899095920119022.4752)
,p_depending_on_condition_type=>'NULL'
,p_help_text=>'The name of the single data series to be shown on the legend.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010900702929119023.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Data Points'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NONE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010917743161119033.4752)
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'STEP'
,p_lov_type=>'STATIC'
,p_help_text=>'The symbols used to mark the chart''s data points. Pick "Don''t show" to disable these markers.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010901168359119023.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010900702929119023.4752)
,p_display_sequence=>10
,p_display_value=>'Don''t show'
,p_return_value=>'NONE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010901633481119023.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010900702929119023.4752)
,p_display_sequence=>20
,p_display_value=>'Circle'
,p_return_value=>'CIRCLE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010902188742119024.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010900702929119023.4752)
,p_display_sequence=>30
,p_display_value=>'Square'
,p_return_value=>'SQUARE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010902617659119025.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010900702929119023.4752)
,p_display_sequence=>40
,p_display_value=>'Diamond'
,p_return_value=>'DIAMOND'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010903126484119025.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010900702929119023.4752)
,p_display_sequence=>50
,p_display_value=>'Cross'
,p_return_value=>'CROSS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010903600671119025.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010900702929119023.4752)
,p_display_sequence=>60
,p_display_value=>'Triangle'
,p_return_value=>'TRIANGLE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010904181184119025.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Axis Titles'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Whether to include labels on the X and/or Y axis. Leave both unselected to hide them.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010904521873119025.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010904181184119025.4752)
,p_display_sequence=>10
,p_display_value=>'X'
,p_return_value=>'X'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010905012264119026.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010904181184119025.4752)
,p_display_sequence=>20
,p_display_value=>'Y'
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010905563255119026.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'X Axis Title'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>20
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2010904181184119025.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'X:Y,X'
,p_help_text=>'The label for the X axis.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010905994167119026.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Y Axis Title'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>20
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2010904181184119025.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'X:Y,Y'
,p_help_text=>'The label for the Y axis.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010906318148119026.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Tooltips'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Customize what is shown on the tooltip for each data point. The ''Custom column'' option allows you to specify text for each individual data point as an additional column in the region SQL query. Leave all options unselected to disable the tooltips.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010906795173119027.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010906318148119026.4752)
,p_display_sequence=>0
,p_display_value=>'Show series name'
,p_return_value=>'SERIES'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010907272545119027.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010906318148119026.4752)
,p_display_sequence=>10
,p_display_value=>'Show X value'
,p_return_value=>'X'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010907720387119027.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010906318148119026.4752)
,p_display_sequence=>20
,p_display_value=>'Show Y value'
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010908244493119027.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010906318148119026.4752)
,p_display_sequence=>30
,p_display_value=>'Custom column'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010908759919119027.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Tooltip Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010906318148119026.4752)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SERIES:X:Y:CUSTOM,SERIES:X:CUSTOM,SERIES:Y:CUSTOM,X:Y:CUSTOM,SERIES:CUSTOM,X:CUSTOM,Y:CUSTOM,CUSTOM'
,p_help_text=>'The column of the region SQL query to use as custom tooltip values. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010909176730119028.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Legend'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Whether to display a legend on the chart. The legend will display the names and colors of all the data series.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010909506334119029.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010909176730119028.4752)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The color scheme used to render the chart. A different color will be assigned to each series.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010910408836119029.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_display_sequence=>10
,p_display_value=>'Modern'
,p_return_value=>'MODERN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010910986827119029.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010911455913119029.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010911995344119031.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010912421469119031.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_display_sequence=>50
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010912965228119031.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_display_sequence=>60
,p_display_value=>'SQL Query'
,p_return_value=>'COLUMN'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010913412349119031.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'CUSTOM'
,p_help_text=>'A comma-separated list of RGB color strings (e.g. #FF3377) to use as a color scheme for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010913841175119031.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>11
,p_prompt=>'X Values Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'DATE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010914647289119032.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'DATE'
,p_help_text=>'The column of the region SQL query to use as X values. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010914230673119032.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>12
,p_prompt=>'X Values Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010914647289119032.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'NUMBER'
,p_help_text=>'The column of the region SQL query to use as X values. '
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010914647289119032.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>2
,p_prompt=>'X Values Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'TIMESTAMP'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The data type of the X values in your query.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010915037606119032.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010914647289119032.4752)
,p_display_sequence=>10
,p_display_value=>'TIMESTAMP'
,p_return_value=>'TIMESTAMP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010915529419119032.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010914647289119032.4752)
,p_display_sequence=>20
,p_display_value=>'DATE'
,p_return_value=>'DATE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010916010975119033.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010914647289119032.4752)
,p_display_sequence=>30
,p_display_value=>'NUMBER'
,p_return_value=>'NUMBER'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010916580553119033.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>0
,p_prompt=>'Min Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>'The minimum height, in pixels, of the chart. Chart width will adapt to the size of the region. Defaults to 100px.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010916986838119033.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>1
,p_prompt=>'Max Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>'The maximum height, in pixels, of the chart. Chart width will adapt to the size of the region. Defaults to 500px.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010917303227119033.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>20
,p_display_sequence=>115
,p_prompt=>'Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010917743161119033.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>21
,p_display_sequence=>59
,p_prompt=>'Interpolation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'LINE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_comment=>'Whether the connection between consecutive data points should be shown as straight lines or as steps.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010918182501119034.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010917743161119033.4752)
,p_display_sequence=>10
,p_display_value=>'Lines'
,p_return_value=>'LINE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010918690982119034.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010917743161119033.4752)
,p_display_sequence=>20
,p_display_value=>'Steps'
,p_return_value=>'STEP'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010919188536119034.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>22
,p_display_sequence=>61
,p_prompt=>'Fill Area'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_comment=>'Whether to color the area below each series.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2010919577598119034.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2010919188536119034.4752)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010920060889119035.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>23
,p_display_sequence=>230
,p_prompt=>'Color SQL Query'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2010910048298119029.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'COLUMN'
,p_help_text=>'A SQL query that maps a series name to an RGB color. The first column must contain the series names (and those values must match the ones returned from the region SQL) and the second column must have the RGB color for the series. Both columns must be'
||' VARCHAR2.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2010920419638119035.4752)
,p_plugin_id=>wwv_flow_api.id(6509424821991051573.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>24
,p_display_sequence=>240
,p_prompt=>'Value Formatting'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_flot_pie
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.FLOT.PIE'
,p_display_name=>'Graphique à secteurs Flot v2 ***'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.FLOT.PIE'),'#IMAGE_PREFIX#plugins/com.oracle.apex.flot_pie/')
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/excanvas.min.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/jquery.flot.min.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.2/jquery.flot.resize.min.js',
'#PLUGIN_FILES#jquery.flot.pie.js',
'#PLUGIN_FILES#com_oracle_apex_flot_pie.js'))
,p_css_file_urls=>'#PLUGIN_FILES#com_oracle_apex_flot_pie.css'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    -- NOTE: THIS IS THE VALUE FOR PLUGIN FILE PREFIX #IMAGE_PREFIX#plugins/com.oracle.apex.flot_pie/',
'',
'function render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'    -- determine plugin attributes and assign readable names',
'    c_color_scheme         constant varchar2(255) := p_region.attribute_15;',
'    l_colors               varchar2(2000);',
'',
'    c_pie_type             constant apex_application_page_regions.attribute_05%type := nvl(p_region.attribute_05, ''STANDARD'');',
'',
'    c_inner_radius         constant number  := apex_plugin_util.get_attribute_as_number(apex_plugin_util.replace_substitutions(nvl(p_region.attribute_14,''-1'')), ''Inner Radius'');',
'',
'    c_show_tooltip         constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':TOOLTIP:'') > 0);',
'    c_show_legend          constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':LEGEND:'') > 0);',
'    c_show_label           constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':LABEL:'')  > 0);',
'    c_show_value           constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':VALUE:'')  > 0);',
'    c_pie_width            constant number  := to_number(apex_plugin_util.replace_substitutions(p_region.attribute_06));',
'',
'    c_min_height           constant number  := to_number(nvl(p_region.attribute_17, ''100''));',
'    c_max_height           constant number  := to_number(nvl(p_region.attribute_18, ''400''));',
'',
'    c_min_ar               constant number  := greatest(apex_plugin_util.get_attribute_as_number(p_plugin.attribute_01, ''Min Aspect Ratio''), 0.25);',
'    c_max_ar               constant number  := least(apex_plugin_util.get_attribute_as_number(p_plugin.attribute_02, ''Max Aspect Ratio''), 4);',
'',
'    c_combine_slices       constant boolean := (nvl(p_region.attribute_09, ''N'') = ''Y'');',
'    c_combine_threshold    constant number  := nvl(to_number(p_region.attribute_10), 10);',
'    c_combined_slice_label constant apex_application_page_regions.attribute_11%type := nvl(p_region.attribute_11, ''Other'');',
'    c_combined_slice_link  constant apex_application_page_regions.attribute_12%type := p_region.attribute_12;',
'    c_combined_slice_color constant apex_application_page_regions.attribute_13%type := p_region.attribute_13;',
'begin',
'    -- add placeholder div for chart',
'    sys.htp.p(',
'        ''<div class="flotPieContainer"><div id="'' || apex_escape.html_attribute(p_region.static_id || ''_chart'') || ''" style="width:'' ||',
'        case when c_pie_width is null then ''auto'' else c_pie_width || ''px'' end ||',
'        ''" class="flotPieContainerInner"></div></div>'' );',
'',
'    -- Set the colors to be used, if a non-SQL scheme was selected',
'    case c_color_scheme',
'      when ''MODERN'' then',
'        l_colors := ''#FF3B30,#FF9500,#FFCC00,#4CD964,#34AADC,#007AFF,#5856D6,#FF2D55,#8E8E93,#C7C7CC'';',
'      when ''MODERN2'' then',
'        l_colors := ''#1ABC9C,#2ECC71,#4AA3DF,#9B59B6,#3D566E,#F1C40F,#E67E22,#E74C3C'';',
'      when ''SOLAR'' then',
'        l_colors := ''#B58900,#CB4B16,#DC322F,#D33682,#6C71C4,#268BD2,#2AA198,#859900'';',
'      when ''METRO'' then',
'        l_colors := ''#E61400,#19A2DE,#319A31,#EF9608,#8CBE29,#A500FF,#00AAAD,#FF0094,#9C5100,#E671B5'';',
'      when ''CUSTOM'' then',
'        l_colors := p_region.attribute_16;',
'      when ''SQL'' then',
'        l_colors := null;',
'    end case;',
'',
'    -- Initialize the Flot pie chart when the page has been rendered.',
'    -- apex_javascript.add_attribute are used to make sure that',
'    -- the values are properly escaped.   ',
'    apex_javascript.add_onload_code (',
'        p_code => ''com_oracle_apex_flot_pie('' ||',
'                  apex_javascript.add_value(p_region.static_id) ||',
'                  ''{'' ||',
'                      apex_javascript.add_attribute(''colors'',           l_colors) || ',
'                      apex_javascript.add_attribute(''type'',             c_pie_type) || ',
'                      apex_javascript.add_attribute(''innerRadius'',      c_inner_radius)||',
'                      apex_javascript.add_attribute(''minAR'',            c_min_ar)||',
'                      apex_javascript.add_attribute(''maxAR'',            c_max_ar)||',
'                      apex_javascript.add_attribute(''minHeight'',        c_min_height) || ',
'                      apex_javascript.add_attribute(''maxHeight'',        c_max_height) || ',
'                      apex_javascript.add_attribute(''showLabel'',        c_show_label) || ',
'                      apex_javascript.add_attribute(''showLegend'',       c_show_legend) ||',
'                      apex_javascript.add_attribute(''showTooltip'',      c_show_tooltip) || ',
'                      apex_javascript.add_attribute(''showValue'',        c_show_value) || ',
'                      apex_javascript.add_attribute(''combineSlices'',    c_combine_slices) || ',
'                      apex_javascript.add_attribute(''combineThreshold'', c_combine_threshold) || ',
'                      apex_javascript.add_attribute(''combineLabel'',     apex_plugin_util.escape(',
'                                                                            apex_plugin_util.replace_substitutions (',
'                                                                                p_value  => c_combined_slice_label,',
'                                                                                p_escape => false ),',
'                                                                            p_region.escape_output )) || ',
'                      apex_javascript.add_attribute(''combineUrl'',       wwv_flow_utilities.prepare_url(',
'                                                                            apex_plugin_util.replace_substitutions (',
'                                                                                p_value  => c_combined_slice_link,',
'                                                                                p_escape => false ))) ||',
'                      apex_javascript.add_attribute(''combineColor'',     apex_plugin_util.escape(',
'                                                                            apex_plugin_util.replace_substitutions (',
'                                                                                p_value  => c_combined_slice_color,',
'                                                                                p_escape => false ),',
'                                                                            true )) || ',
'                      apex_javascript.add_attribute(''noDataFoundMessage'', p_region.no_data_found_message) || ',
'                      apex_javascript.add_attribute(''pageItems'',        apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit)) ||',
'                      apex_javascript.add_attribute(''ajaxIdentifier'',   apex_plugin.get_ajax_identifier, false, false) ||',
'                  ''});'' );',
'    apex_javascript.add_onload_code (',
'        p_code => ''setTimeout(function(){$("span.pieLabel").removeAttr("id");},1000);'' );',
'',
'    return null;',
'',
'end render;',
'',
'',
'function ajax (',
'     p_region in apex_plugin.t_region,',
'     p_plugin in apex_plugin.t_plugin )',
'     return apex_plugin.t_region_ajax_result',
'is',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable. We are using the same defaults for the',
'    -- required attributes as in the plug-in attribute configuration, because',
'    -- they can still be null. Keep them in sync!',
'    c_label_column constant varchar2(255) := p_region.attribute_01;',
'    c_value_column constant varchar2(255) := p_region.attribute_02;',
'    c_color_column constant varchar2(255) := p_region.attribute_03;',
'    c_link_target  constant varchar2(255) := p_region.attribute_04;',
'',
'    l_label_column_no   pls_integer;',
'    l_value_column_no   pls_integer;',
'    l_color_column_no   pls_integer;',
'    l_column_value_list apex_plugin_util.t_column_value_list2;',
'    ',
'    l_label             varchar2(4000);',
'    l_value             number;',
'    l_color             varchar2(20);',
'    l_url               varchar2(4000);',
'begin',
'    apex_plugin_util.print_json_http_header;',
'',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => p_region.source,',
'                               p_min_columns    => 2,',
'                               p_max_columns    => null,',
'                               p_component_name => p_region.name );',
'',
'    -- Get the actual column# for faster access and also verify that the data type',
'    -- of the column matches with what we are looking for',
'    l_label_column_no := apex_plugin_util.get_column_no (',
'                             p_attribute_label   => ''Label Column'',',
'                             p_column_alias      => c_label_column,',
'                             p_column_value_list => l_column_value_list,',
'                             p_is_required       => true,',
'                             p_data_type         => apex_plugin_util.c_data_type_varchar2 );',
'                                      ',
'    l_value_column_no := apex_plugin_util.get_column_no (',
'                             p_attribute_label   => ''Value Column'',',
'                             p_column_alias      => c_value_column,',
'                             p_column_value_list => l_column_value_list,',
'                             p_is_required       => true,',
'                             p_data_type         => apex_plugin_util.c_data_type_number );',
'',
'    l_color_column_no := apex_plugin_util.get_column_no (',
'                             p_attribute_label   => ''Color Column'',',
'                             p_column_alias      => c_color_column,',
'                             p_column_value_list => l_column_value_list,',
'                             p_is_required       => false,',
'                             p_data_type         => apex_plugin_util.c_data_type_varchar2 );',
'',
'    sys.htp.prn(''['');',
'',
'    -- It''s time to emit the selected rows',
'    for l_row_num in 1 .. l_column_value_list(1).value_list.count loop',
'        begin',
'            apex_plugin_util.set_component_values (',
'                p_column_value_list => l_column_value_list,',
'                p_row_num           => l_row_num );',
'',
'            -- get the label',
'            l_label := apex_plugin_util.escape (',
'                           apex_plugin_util.get_value_as_varchar2 (',
'                               p_data_type => l_column_value_list(l_label_column_no).data_type,',
'                               p_value     => l_column_value_list(l_label_column_no).value_list(l_row_num) ),',
'                           p_region.escape_output );',
'',
'            -- get the value',
'            l_value := l_column_value_list(l_value_column_no).value_list(l_row_num).number_value;',
'',
'            -- get the color if specified',
'            if l_color_column_no is not null then',
'                l_color := apex_plugin_util.escape (',
'                               apex_plugin_util.get_value_as_varchar2 (',
'                                   p_data_type => l_column_value_list(l_color_column_no).data_type,',
'                                   p_value     => l_column_value_list(l_color_column_no).value_list(l_row_num) ),',
'                               true );',
'            end if;',
'',
'            -- get the link target if it does exist',
'            if c_link_target is not null then',
'                l_url := wwv_flow_utilities.prepare_url (',
'                             apex_plugin_util.replace_substitutions (',
'                                 p_value  => c_link_target,',
'                                 p_escape => false ));',
'            end if;',
'',
'            -- write the data to our output buffer',
'            sys.htp.p (',
'                case when l_row_num > 1 then '','' end ||',
'                ''{'' ||',
'                apex_javascript.add_attribute(''label'', l_label) ||',
'                apex_javascript.add_attribute(''color'', l_color) ||',
'                apex_javascript.add_attribute(''url'',   l_url) ||',
'                apex_javascript.add_attribute(''data'',  l_value, false, false ) ||',
'                ''}'' );',
'',
'            apex_plugin_util.clear_component_values;',
'        exception when others then',
'            apex_plugin_util.clear_component_values;',
'            raise;',
'        end;',
'    end loop;',
'    sys.htp.prn('']'');',
'',
'    return null;',
'end ajax;'))
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT:NO_DATA_FOUND_MESSAGE:ESCAPE_OUTPUT'
,p_sql_min_column_count=>1
,p_sql_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' order by sal'))
,p_substitute_attributes=>false
,p_reference_id=>10867904589400691404.4752
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'2.0'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>25
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006181367767903476.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Min Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1.333'
,p_display_length=>5
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006181778775903476.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Max Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1.5'
,p_display_length=>5
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006182168651903476.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Label Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006182566778903476.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006182917098903476.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Color Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Specifies the column which contains the color of the pie slice. The color can be set as hex value or as the name of the color. If no column is entered then the color will automatically be calculated.</p>',
'',
'<p>Example:',
'<ul>',
'<li>#ff0000</li>',
'<li>red</li>',
'</ul>',
'</p>',
''))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006183392822903477.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Specifies the URL to a target page that is used if a user clicks on a pie slice.',
'</p>',
'<p>',
'To reference column values of your chart SQL statement use substitution syntax.',
'</p>',
'<p>',
'Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked pie slice',
'<pre>',
'f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.',
'</pre>',
'</p>',
'<p>',
'Example 2: Display the EMPNO value of the clicked pie slice in a JavaScript alert',
'<pre>',
'javascript:alert(''current empno: &amp;EMPNO.'');',
'</pre>',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006183725045903477.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Pie Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'STANDARD'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select the type of pie chart that should be displayed.  '
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006184174828903477.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006183725045903477.4752)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STANDARD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006184682515903478.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006183725045903477.4752)
,p_display_sequence=>20
,p_display_value=>'Donut'
,p_return_value=>'DONUT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006185138703903478.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006183725045903477.4752)
,p_display_sequence=>30
,p_display_value=>'Tilted'
,p_return_value=>'TILTED'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006185655090903478.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006183725045903477.4752)
,p_display_sequence=>40
,p_display_value=>'Rectangular'
,p_return_value=>'RECT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006186177809903478.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Width (in pixels)'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>10
,p_max_length=>30
,p_is_translatable=>false
,p_help_text=>'Enter the width of the pie chart you want to create. For example, setting the width to 100 will create a pie chart that is a maximum of 100 pixels wide. If no value is specified, the pie chart will consume all the space of the containing region. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006186541478903478.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Show Options'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_default_value=>'LABEL:VALUE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006186961665903478.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006186541478903478.4752)
,p_display_sequence=>5
,p_display_value=>'Legend'
,p_return_value=>'LEGEND'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006187480226903479.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006186541478903478.4752)
,p_display_sequence=>10
,p_display_value=>'Tooltip'
,p_return_value=>'TOOLTIP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006187944089903479.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006186541478903478.4752)
,p_display_sequence=>30
,p_display_value=>'Label'
,p_return_value=>'LABEL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006188410763903479.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006186541478903478.4752)
,p_display_sequence=>40
,p_display_value=>'Value'
,p_return_value=>'VALUE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006188999780903479.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Combine Slices'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Slices that are below a given percentage threshold can be combined into a single "other" slice.  For example, if a threshold of is set, then any slice that is below 10% will be grouped into the "other" slice.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006189396965903480.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Combined Slice Threshold'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'10'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006188999780903479.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_lov_type=>'STATIC'
,p_help_text=>'This threshold determines which slices to group together in an "other" slice.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006189710147903480.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006189396965903480.4752)
,p_display_sequence=>10
,p_display_value=>'1%'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006190237833903480.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006189396965903480.4752)
,p_display_sequence=>20
,p_display_value=>'2%'
,p_return_value=>'2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006190707617903480.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006189396965903480.4752)
,p_display_sequence=>30
,p_display_value=>'5%'
,p_return_value=>'5'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006191269268903480.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006189396965903480.4752)
,p_display_sequence=>40
,p_display_value=>'10%'
,p_return_value=>'10'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006191773444903480.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006189396965903480.4752)
,p_display_sequence=>50
,p_display_value=>'15%'
,p_return_value=>'15'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006192293975903481.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006189396965903480.4752)
,p_display_sequence=>60
,p_display_value=>'20%'
,p_return_value=>'20'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006192787116903482.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Combined Slice Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Other'
,p_display_length=>20
,p_max_length=>20
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2006188999780903479.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'Enter the label for the Other / combined slice.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006193117609903482.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Combined Slice Link'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006188999780903479.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'This URL will be used when "Other" or combined slice is clicked on.  Leave blank if you do not want to make this clickable. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006193592376903482.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Combined Slice Color'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>10
,p_max_length=>20
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Specifies the color which should be used for the combined slice. The color can be entered as hex value or as name of the color. If no color is specified then it will be defaulted to gray.</p>',
'',
'<p>Example:',
'<ul>',
'<li>#ff0000</li>',
'<li>red</li>',
'</ul>',
'</p>',
''))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006193994713903482.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>51
,p_prompt=>'Inner Radius'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006183725045903477.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'DONUT'
,p_help_text=>'The inner radius of the donut (i.e. the size of the hole). Numbers between 0 and 1 are treated as percentages and numbers greater than 1 are treated as pixels'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>25
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006197205493903484.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_display_sequence=>10
,p_display_value=>'Modern'
,p_return_value=>'MODERN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006194707423903482.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006195213595903483.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006195776388903483.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006196204029903483.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_display_sequence=>50
,p_display_value=>'SQL Column'
,p_return_value=>'SQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2006196714940903483.4752)
,p_plugin_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_display_sequence=>60
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006197744553903484.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>26
,p_prompt=>'Custom Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2006194385102903482.4752)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006198192263903484.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>70
,p_prompt=>'Min Height (pixels)'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006198597161903484.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>71
,p_prompt=>'Max Height (pixels)'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2006198885398903484.4752)
,p_plugin_id=>wwv_flow_api.id(9468150220120001830.4752)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>190
,p_prompt=>'Value Formatting'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(539940534604132427.4752)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Bureau'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>3
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_global_page_id=>.4752
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
 p_id=>.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Page globale - Bureau'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page globale - Bureau'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(404677206185829568.4752)
,p_plug_name=>'APEX 5 - Header'
,p_region_css_classes=>'a-Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_07'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(404677418056829569.4752)
,p_plug_name=>'APEX 5 - Header Left'
,p_parent_plug_id=>wwv_flow_api.id(404677206185829568.4752)
,p_region_css_classes=>'a-Header-col a-Header-col--left'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
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
 p_id=>wwv_flow_api.id(384690703142932822.4752)
,p_plug_name=>'APEX 5 - Tabs'
,p_region_name=>'a_Header_menu'
,p_parent_plug_id=>wwv_flow_api.id(404677418056829569.4752)
,p_region_css_classes=>'a-Header-tabsContainer'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(719097510387175373.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(404660636766798903.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'not wwv_flow.apps_only_workspace'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(404677698967829569.4752)
,p_plug_name=>'APEX 5 - Logo'
,p_parent_plug_id=>wwv_flow_api.id(404677418056829569.4752)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
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
 p_id=>wwv_flow_api.id(404677861324829570.4752)
,p_plug_name=>'APEX 5 - Header Right'
,p_parent_plug_id=>wwv_flow_api.id(404677206185829568.4752)
,p_region_css_classes=>'a-Header-col a-Header-col--right'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(404678078196829570.4752)
,p_plug_name=>'APEX 5 - Search'
,p_parent_plug_id=>wwv_flow_api.id(404677861324829570.4752)
,p_region_css_classes=>'a-Header-search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(404678295558829570.4752)
,p_plug_name=>'APEX 5 - Header Navigation lists'
,p_parent_plug_id=>wwv_flow_api.id(404677861324829570.4752)
,p_region_css_classes=>'a-Header-navLinks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(404724225488161526.4752)
,p_plug_name=>'APEX 5 - Administration Menu'
,p_region_name=>'adminMenu'
,p_parent_plug_id=>wwv_flow_api.id(404678295558829570.4752)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(697584654501422607.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(404660915136798904.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>'!'||wwv_flow_api.id(805549616798538577)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486772230808301732.4752)
,p_plug_name=>'APEX 5 - Help Menu'
,p_region_name=>'helpMenu'
,p_parent_plug_id=>wwv_flow_api.id(404678295558829570.4752)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(697615600061428203.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(404660915136798904.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(404678402039829570.4752)
,p_plug_name=>'APEX 5 - Header Account'
,p_parent_plug_id=>wwv_flow_api.id(404677861324829570.4752)
,p_region_css_classes=>'a-Header-account'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(404678655419829570.4752)
,p_plug_name=>'APEX 5 - Control Bar'
,p_region_css_classes=>'a-ControlBar apex-pkg-apps'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_07'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(404678877158829570.4752)
,p_plug_name=>'APEX 5 - Control Bar Left'
,p_parent_plug_id=>wwv_flow_api.id(404678655419829570.4752)
,p_region_css_classes=>'a-ControlBar-col a-ControlBar-col--noPadding'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
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
 p_id=>wwv_flow_api.id(384690882838932823.4752)
,p_plug_name=>'APEX 5- Breadcrumb'
,p_parent_plug_id=>wwv_flow_api.id(404678877158829570.4752)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(539941826945132432.4752)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(404662212565801043.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(404679005997829570.4752)
,p_plug_name=>'APEX 5 - Control Bar Right'
,p_parent_plug_id=>wwv_flow_api.id(404678655419829570.4752)
,p_region_css_classes=>'a-ControlBar-col'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(384690975801932824.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(404678295558829570.4752)
,p_button_name=>'ADMINISTRATION'
,p_button_static_id=>'header-adminMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710812892908978.4752)
,p_button_image_alt=>'Administration'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-gears-alt'
,p_button_cattributes=>'data-menu="adminMenu_menu"'
,p_grid_new_grid=>false
,p_security_scheme=>'!'||wwv_flow_api.id(805549616798538577)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(384691038290932825.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(404678295558829570.4752)
,p_button_name=>'FEEDBACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'Informations en retour'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=4750:11001:&SESSION.::&DEBUG.:RP,11001:P11001_APPLICATION_ID,P11001_PAGE_ID:&APP_ID.,&APP_PAGE_ID.:'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-comments'
,p_grid_new_grid=>false
,p_required_patch=>wwv_flow_api.id(693462664348655994.4752)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(384691145501932826.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(404678295558829570.4752)
,p_button_name=>'HELP'
,p_button_static_id=>'header-helpMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710812892908978.4752)
,p_button_image_alt=>'Aide'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-help'
,p_button_cattributes=>'data-menu="helpMenu_menu"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(385808567373243610.4752)
,p_name=>'P0_WINDOW_MGMT_MODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(404677206185829568.4752)
,p_source=>'APEX_WINDOW_MGMT_MODE'
,p_source_type=>'PREFERENCE'
,p_source_post_computation=>'NVL(:P0_WINDOW_MGMT_MODE, ''FOCUS'')'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(385808664685243611.4752)
,p_name=>'P0_WINDOW_MGMT_SHARE_WINDOW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(404677206185829568.4752)
,p_source=>'APEX_WINDOW_MGMT_SHARE_WINDOW'
,p_source_type=>'PREFERENCE'
,p_source_post_computation=>'NVL(:P0_WINDOW_MGMT_SHARE_WINDOW, ''N'')'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Accueil des applications packagées'
,p_page_mode=>'NORMAL'
,p_step_title=>'Accueil des applications packagées'
,p_step_sub_title=>'Oracle Application Express'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.regionDisplaySelector#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/* Developer Toolbar integration */',
'apex.builder.nameBuilderWindow();',
'',
'',
'setTimeout(function(){$("#featured_apps").carousel({html: true})},100);',
''))
,p_step_template=>wwv_flow_api.id(741369094170994311.4752)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(750747661941502571.4752)
,p_plug_name=>'A propos de'
,p_region_css_classes=>'a-Region--stacked a-Region--padded a-Region--flush a-Region--sideRegion'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Les applications packagées constituent une suite d''applications de productivité d''entreprise, facilement installable en quelques clics. vous pouvez facilement utiliser ces solutions en tant qu''applications de production pour améliorer les processu'
||'s d''entreprise. De plus, elles sont entièrement prises en charge par Oracle.</p>',
''))
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
 p_id=>wwv_flow_api.id(750750940971502582.4752)
,p_plug_name=>'Language'
,p_region_name=>'builder_home_lang_selector'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--paddedBody:a-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'sys.htp.p( wwv_flow_lang.get_language_selector_list );'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_4000_ui.is_translation_installed( p_flow_id => 4750 )'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(750751542816502585.4752)
,p_plug_name=>'Mode d''accessibilité'
,p_region_css_classes=>' a-Region--stacked a-Region--padded a-Region--flush a-Region--sideRegion'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(750867860695912536.4752)
,p_plug_name=>'Applications'
,p_region_sub_css_classes=>'pkg-apps'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--paddedBody:a-Region--accessibleHeader'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(750862626609892264.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(750892319717997379.4752)
,p_plug_query_row_template=>1
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(787083093555047575.4752)
,p_name=>'Applications packagées installées'
,p_template=>wwv_flow_api.id(404667570222803088.4752)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:a-Region--shadowScroll:a-Region--noPadding:h480'
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.app_name app_name,',
'       --a.app_description app_info,',
'       htmldb_util.prepare_url(''f?p=''||:app_id||'':81:''||:app_session||'':::81:P81_ID,P81_APP_TYPE:''||a.app_id||'',''||(case when a.app_type = ''DB'' then ''DATABASE'' when a.app_type = ''WS'' then ''WEBSHEET'' ',
'end)) run_app_link,',
'       m.created,',
'       a.app_id,',
'       (case when a.app_type = ''DB'' then m.installed_app_id else m.installed_ws_id end) id,',
'       htmldb_util.prepare_url(''f?p=''||:app_id||'':7:''||:app_session||'':::7:P7_APP_ID:''||a.app_id) modify_app_button,',
'       (case when a.app_type = ''DB'' then wwv_flow_dev.get_run_url(m.installed_app_id) else ''ws?p=''||m.installed_ws_id||'':home'' end) run_app_button,',
'       a.image_identifier icon_class,',
'       m.created app_info,',
'       sm.manage,',
'       sm.run',
'from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m,',
'     (select wwv_flow_lang.system_message(''MANAGE'') manage,',
'             wwv_flow_lang.system_message(''LAYOUT_RUN'') run',
'      from dual) sm',
'where a.app_id = m.app_id',
'and a.app_status != ''HIDDEN''',
'and m.security_group_id = :flow_security_group_id',
'order by m.created desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(932270054883616955.4752)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'Aucune application packagée installée.'
,p_query_num_rows_type=>'0'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.app_name app_name,',
'       --a.app_description app_info,',
'       apex_util.prepare_url(''f?p=''||:app_id||'':81:''||:app_session||'':::81:P81_ID,P81_APP_TYPE:''||a.app_id||'',''||(case when a.app_type = ''DB'' then ''DATABASE'' when a.app_type = ''WS'' then ''WEBSHEET'' end)) run_app_link,',
'       m.created,',
'       a.app_id,',
'       apex_util.prepare_url(''f?p=''||:app_id||'':7:''||:app_session||'':::7:P7_APP_ID:''||a.app_id) modify_app_button,',
'       (case when a.app_type = ''DB'' then wwv_flow_dev.get_run_url(m.installed_app_id) else ''ws?p=''||m.installed_ws_id||'':home'' end) run_app_button,',
'       a.image_identifier icon_class,',
'       m.created app_info',
'from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where a.app_id = m.app_id',
'and m.security_group_id = :flow_security_group_id',
'order by m.created desc'))
);
wwv_flow_api.set_region_column_width(
 p_id=>wwv_flow_api.id(787083093555047575.4752)
,p_plug_column_width=>'apex-col--bottomBorder apex-col--rightBorder'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(656958519483052405.4752)
,p_query_column_id=>1
,p_column_alias=>'APP_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Application'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(926448306370861802.4752)
,p_query_column_id=>2
,p_column_alias=>'RUN_APP_LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Lien Exécuter une application'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(656958784419052407.4752)
,p_query_column_id=>3
,p_column_alias=>'CREATED'
,p_column_display_sequence=>2
,p_column_heading=>'Créé'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(886493838302981514.4752)
,p_query_column_id=>4
,p_column_alias=>'APP_ID'
,p_column_display_sequence=>9
,p_column_heading=>'ID d''application'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(886493647565981512.4752)
,p_query_column_id=>5
,p_column_alias=>'ID'
,p_column_display_sequence=>8
,p_column_heading=>'ID'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(926448453999861803.4752)
,p_query_column_id=>6
,p_column_alias=>'MODIFY_APP_BUTTON'
,p_column_display_sequence=>5
,p_column_heading=>'Bouton Modifier une application'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<button class="a-Button a-Button--noLabel a-AppCards-button" title="#MANAGE#" type="button" onclick="#MODIFY_APP_BUTTON#"><span class="a-Icon icon-gear"></span></button>'
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(926448530210861804.4752)
,p_query_column_id=>7
,p_column_alias=>'RUN_APP_BUTTON'
,p_column_display_sequence=>6
,p_column_heading=>'Bouton Exécuter une application'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<button class="a-Button a-Button--hot a-Button--noLabel a-AppCards-button launch-aut" title="#RUN#" type="button" data-link="#RUN_APP_BUTTON#"><span class="a-Icon icon-run-page"></span></button>'
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(864570195174731021.4752)
,p_query_column_id=>8
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(864570463503731024.4752)
,p_query_column_id=>9
,p_column_alias=>'APP_INFO'
,p_column_display_sequence=>7
,p_column_heading=>'Infos sur l''application'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2310796521456520805.4752)
,p_query_column_id=>10
,p_column_alias=>'MANAGE'
,p_column_display_sequence=>10
,p_column_heading=>'Manage'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2310796924341520807.4752)
,p_query_column_id=>11
,p_column_alias=>'RUN'
,p_column_display_sequence=>11
,p_column_heading=>'Run'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1494304199802239903.4752)
,p_plug_name=>'Applications packagées conseillées'
,p_region_css_classes=>'a-Region--featuredApps a-Region--carousel a-Region--carouselSpin js-cycle5s'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:h480'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_pkg_app_ui.p1_featured_apps(',
'    p_app_id         => :app_id,',
'    p_app_page_id    => :app_page_id,',
'    p_app_session    => :app_session);'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1199601170102177728.4752)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(787083093555047575.4752)
,p_button_name=>'NEW_INSTALLED_APPS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'Créer une application packagée'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50::'
,p_button_css_classes=>'a-Button a-Button--withIcon a-Button--noLabel a-Button--small a-Button--noUI'
,p_icon_css_classes=>'icon-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(787719037872821217.4752)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(787083093555047575.4752)
,p_button_name=>'VIEW_INSTALLED_APPS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'Visualiser les applications installées'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3,RIR,CIR:IR_IS_INSTALLED:1'
,p_button_css_classes=>'a-Button a-Button--withIcon a-Button--noLabel a-Button--small a-Button--noUI'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(750755519256502601.4752)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'P1_ACCESSIBILITY_MODE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(750751746540502585.4752)
,p_name=>'P1_ACCESSIBILITY_MODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(750751542816502585.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'STANDARD'
,p_prompt=>'Mode d''accessibilité'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'case ',
'    when htmldb_util.is_screen_reader_session then ''SCREEN_READER''',
'    when htmldb_util.is_high_contrast_session then ''HIGH_CONTRAST''',
'    else ''STANDARD''',
'end;'))
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACCESSIBILITY_MODE'
,p_lov=>'.'||wwv_flow_api.id(750872384409975173)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Standard'
,p_lov_null_value=>'STANDARD'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1212080564184792020.4752)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(933144624364626643.4752)
,p_name=>'RENDERING: Page - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(787083093555047575.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(933144967905626652.4752)
,p_event_id=>wwv_flow_api.id(933144624364626643.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var lSuccessMsg = this.data.APEX_SUCCESS_MESSAGE,',
'      lUrl = ''f?p=&APP_ID.:1:&SESSION.::'',',
'      lVal = this.data[ ''REQUEST'' ]; ',
'',
'if ( lSuccessMsg ) {',
'   lUrl += ''&success_msg='' + lSuccessMsg;',
'}',
'setTimeout(function() {',
'    apex.navigation.redirect(lUrl);',
'}, 0);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(750754662427502591.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Accessibility Mode'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    if :P1_ACCESSIBILITY_MODE = ''SCREEN_READER'' then',
'        htmldb_util.set_session_screen_reader_on;',
'        htmldb_util.set_session_high_contrast_off;',
'    elsif :P1_ACCESSIBILITY_MODE = ''HIGH_CONTRAST'' then',
'        htmldb_util.set_session_high_contrast_on;',
'        htmldb_util.set_session_screen_reader_off;',
'    elsif :P1_ACCESSIBILITY_MODE = ''STANDARD'' then',
'        htmldb_util.set_session_screen_reader_off;',
'        htmldb_util.set_session_high_contrast_off;',
'    end if;',
'end;'))
,p_process_error_message=>'Erreur lors de la définition du mode d''accessibilité'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P1_ACCESSIBILITY_MODE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Mode d''accessibilité défini'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Tableau de bord'
,p_page_mode=>'NORMAL'
,p_step_title=>'Tableau de bord'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656959145671052411.4752)
,p_plug_name=>'Principales applications packagées'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.app_name, ',
'       ''f?p=''||:app_id||'':81:''||:app_session||'':::81:P81_ID,P81_APP_TYPE:''||a.app_id||'',''||(case when a.app_type = ''DB'' then ''DATABASE'' when a.app_type = ''WS'' then ''WEBSHEET'' end) link,',
'       count(*) view_cnt',
'from wwv_flow_activity_log l, wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where l.flow_id = m.installed_app_id',
'and   m.app_id = a.app_id',
'and l.security_group_id = :flow_security_group_id',
'and l.time_stamp > sysdate - (:P2_TIMEFRAME/86400)',
'group by a.app_name, a.app_id, a.app_type',
'order by 3 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--leftBorder'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'APP_NAME'
,p_attribute_03=>'&LINK.'
,p_attribute_04=>'VIEW_CNT'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'5'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'AROUND'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656959251264052412.4752)
,p_plug_name=>'Applications packagées installées par les utilisateurs'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select m.created_by d, count(*) c',
'from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where a.app_id = m.app_id',
'and m.security_group_id = :flow_security_group_id',
'group by m.created_by',
'order by 2 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.FLOT.PIE'
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--bottomBorder apex-col--leftBorder'
,p_attribute_01=>'D'
,p_attribute_02=>'C'
,p_attribute_05=>'DONUT'
,p_attribute_08=>'LABEL:VALUE'
,p_attribute_09=>'Y'
,p_attribute_10=>'2'
,p_attribute_11=>'Autre'
,p_attribute_14=>'.25'
,p_attribute_15=>'MODERN'
,p_attribute_17=>'424'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656959463401052414.4752)
,p_plug_name=>'Applications packagées'
,p_region_css_classes=>'u-Height h200'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Region--hideHeader'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (with category_name as (',
'                select app_id,',
'                case when app_category_id_1 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_1)',
'                when app_category_id_2 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_2)',
'                when app_category_id_3 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_3)',
'                end category_name',
'                from wwv_flow_pkg_applications p)',
'            select count(*) app_cnt',
'            from wwv_flow_pkg_applications a,',
'                 category_name cn',
'            where cn.app_id = a.app_id',
'            and a.app_status != ''HIDDEN''',
'            and ((:APPS_ONLY_WORKSPACE = ''N'') or',
'                 (:APPS_ONLY_WORKSPACE = ''Y'' and cn.category_name != ''Sample'')))',
'loop',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=''||:app_id||'':50:''||:app_session||'':::50" title="''||wwv_flow_lang.system_message(''PACKAGED_APPLICATIONS'')||''" class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(c1.app_cnt,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''PACKAGED_APPLICATIONS'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(741378333819007312.4752)
,p_plug_column_width=>'apex-col--bottomBorder'
,p_plug_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656959880777052418.4752)
,p_plug_name=>'A propos de'
,p_region_css_classes=>'a-Region--stacked a-Region--padded a-Region--flush a-Region--sideRegion'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Mesures concernant les applications packagées de l''espace de travail.'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656959992513052419.4752)
,p_plug_name=>'Vues de l''application packagée'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--slimPadding'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select to_date(to_char(l.time_stamp,''DDMMYYYYHH24''), ''DDMMYYYYHH24'') day,',
'       count(*) page_events',
'from wwv_flow_activity_log l, wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where l.flow_id = m.installed_app_id',
'and   m.app_id = a.app_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''DB''',
'and l.time_stamp > sysdate - (:P2_TIMEFRAME/86400)',
'and l.userid is not null',
'group by to_date(to_char(l.time_stamp,''DDMMYYYYHH24''), ''DDMMYYYYHH24'')',
'union all',
'select to_date(to_char(l.time_stamp,''DDMMYYYYHH24''), ''DDMMYYYYHH24'') day,',
'       count(*) page_events',
'from wwv_flow_activity_log l, wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'where l.websheet_id = m.installed_ws_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''WS''',
'and l.time_stamp > sysdate - (:P2_TIMEFRAME/86400)',
'and l.userid is not null',
'group by to_date(to_char(l.time_stamp,''DDMMYYYYHH24''), ''DDMMYYYYHH24'')'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.FLOT.LINE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'apex-col--bottomBorder apex-col--leftBorder'
,p_attribute_02=>'PAGE_EVENTS'
,p_attribute_05=>'Vues de page'
,p_attribute_06=>'NONE'
,p_attribute_10=>'SERIES:X:Y:CUSTOM'
,p_attribute_11=>'DAY'
,p_attribute_13=>'MODERN'
,p_attribute_15=>'DAY'
,p_attribute_17=>'DATE'
,p_attribute_18=>'400'
,p_attribute_21=>'LINE'
,p_attribute_22=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(788159425426560907.4752)
,p_plug_name=>'Installé'
,p_region_css_classes=>'u-Height h200'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Region--hideHeader'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (with category_name as (',
'                select app_id,',
'                case when app_category_id_1 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_1)',
'                when app_category_id_2 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_2)',
'                when app_category_id_3 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_3)',
'                end category_name',
'                from wwv_flow_pkg_applications p)',
'            select count(*) install_cnt',
'            from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m, category_name cn',
'            where a.app_id = m.app_id',
'            and cn.app_id = a.app_id',
'            and m.security_group_id = :flow_security_group_id',
'            and a.app_status != ''HIDDEN''',
'            and ((:APPS_ONLY_WORKSPACE = ''N'') or',
'                 (:APPS_ONLY_WORKSPACE = ''Y'' and cn.category_name != ''Sample'')))',
'loop',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=''||:app_id||'':3:''||:app_session||'':::RIR,3:IR_IS_INSTALLED:1" title="''||wwv_flow_lang.system_message(''DEMO_APPLICATION.INSTALLED'')||''" class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(c1.install_cnt,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''DEMO_APPLICATION.INSTALLED'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--bottomBorder apex-col--leftBorder'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(788164282527649493.4752)
,p_plug_name=>'Disponible en vue de la mise à niveau'
,p_region_css_classes=>'u-Height h200'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Region--hideHeader'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (select nvl(sum(case when (x.build_version > x.installed_build_version) and (x.application_locked = ''Y'')  then',
'                      1',
'                    else',
'                      0',
'                    end),0) upgrade_cnt',
'            from (select 1 installed_app, a.build_version, m.installed_build_version, nvl(m.application_locked,''Y'') application_locked',
'                   from wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'                  where a.app_id = m.app_id',
'                    and m.security_group_id = :flow_security_group_id',
'                    and a.app_type = ''DB''',
'                    and a.app_status != ''HIDDEN''',
'                 union all',
'                 select 1 installed_app, a.build_version, m.installed_build_version, nvl(m.application_locked,''Y'') application_locked',
'                   from wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'                  where a.app_id = m.app_id',
'                    and m.security_group_id = :flow_security_group_id',
'                    and a.app_type = ''WS''',
'                    and a.app_status != ''HIDDEN'') x)',
'loop',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=''||:app_id||'':3:''||:app_session||'':::RIR,3:IR_UPGRADE_IS_AVAILABLE:1" title="''||wwv_flow_lang.system_message(''PKG.APP.AVAILABLE.TO.UPGRADE'')||''" class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(c1.upgrade_cnt,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''PKG.APP.AVAILABLE.TO.UPGRADE'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--bottomBorder apex-col--leftBorder'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(788166095908674996.4752)
,p_plug_name=>'Non installé'
,p_region_css_classes=>'u-Height h200'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Region--hideHeader'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (with category_name as (',
'                select app_id,',
'                case when app_category_id_1 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_1)',
'                when app_category_id_2 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_2)',
'                when app_category_id_3 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories x where x.id = p.app_category_id_3)',
'                end category_name',
'                from wwv_flow_pkg_applications p)',
'            select count(*) uninstall_cnt',
'            from wwv_flow_pkg_applications a, category_name cn',
'            where cn.app_id = a.app_id',
'            and a.app_id not in (select m.app_id from wwv_flow_pkg_app_map m where security_group_id = :flow_security_group_id)',
'            and a.app_status != ''HIDDEN''',
'            and ((:APPS_ONLY_WORKSPACE = ''N'') or',
'                 (:APPS_ONLY_WORKSPACE = ''Y'' and cn.category_name != ''Sample'')))',
'loop',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=''||:app_id||'':3:''||:app_session||'':::RIR,3:IR_IS_NOT_INSTALLED:1" title="''||wwv_flow_lang.system_message(''DEMO_APPLICATION.NOT_INSTALLED'')||''" class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(c1.uninstall_cnt,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''DEMO_APPLICATION.NOT_INSTALLED'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_column_width=>'apex-col--bottomBorder apex-col--leftBorder'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(788982827579790091.4752)
,p_plug_name=>'Set Timeframe'
,p_region_css_classes=>'a-Region-caption'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    d number;',
'begin',
'    d := nvl(:P2_TIMEFRAME,604800); -- if null, 7 days',
'',
'    sys.htp.p(''<div class="page-events-info">'');',
'    sys.htp.p(wwv_flow_lang.system_message(''PKG.APP.EVENTS_FOR_LAST_X'',htmldb_util.get_timeframe(d/86400))||',
'         '' ( <a href="''||htmldb_util.prepare_url(''f?p=4750:5:''||:app_session||'':::5'')||''">''||wwv_flow_lang.system_message(''EDIT_REPORTING_TIMEFRAME'')||''</a> )'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.prn(''<br />'');',
'end;'))
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
 p_id=>wwv_flow_api.id(788983890794795218.4752)
,p_plug_name=>'Hidden'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(788983363220793228.4752)
,p_name=>'P2_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(788983890794795218.4752)
,p_item_default=>'604800'
,p_source=>'FSP_P2_TIMEFRAME_PREFERENCE,'
,p_source_type=>'PREFERENCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Définissez la tranche de temps au cours de laquelle limiter les requêtes de surveillance affichées sur cette page.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(789119577877826005.4752)
,p_computation_sequence=>10
,p_computation_item=>'P2_TIMEFRAME'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'nvl(apex_util.get_preference( p_preference => ''FSP_P2_TIMEFRAME_PREFERENCE'', p_user => :APP_USER), 604800)'
,p_compute_when=>'P2_TIMEFRAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(789084545317643151.4752)
,p_name=>'RENDERING: Dashboard - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(788982827579790091.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(789084801764643152.4752)
,p_event_id=>wwv_flow_api.id(789084545317643151.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var lSuccessMsg = this.data.APEX_SUCCESS_MESSAGE,',
'      lUrl = ''f?p=&APP_ID.:2:&SESSION.::''',
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
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Applications packagées'
,p_page_mode=>'NORMAL'
,p_step_title=>'Applications packagées'
,p_step_sub_title=>'Packaged Applications'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1224170433387563371.4752)
,p_plug_name=>'Applications packagées'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805538978589340502.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'with category_name as (',
'                select app_id,',
'                case when app_category_id_1 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories c where c.id = a.app_category_id_1)',
'                when app_category_id_2 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories c where c.id = a.app_category_id_2)',
'                when app_category_id_3 is not null then',
'                    (select category_name from wwv_flow_pkg_app_categories c where c.id = a.app_category_id_3)',
'                end category_name',
'                from wwv_flow_pkg_applications a)',
'select  p.app_name,',
'            p.app_description,',
'        --',
'        case when m.app_id is not null then',
'            ''Y''',
'        else',
'            ''N''',
'        end installed,',
'        case when m.app_id is not null then',
'            ''1''',
'        else',
'            ''0''',
'        end is_installed,',
'       case when m.app_id is null then',
'            ''1''',
'        else',
'            ''0''',
'        end is_not_installed,',
'        case when ( p.build_version > m.installed_build_version ) and ( nvl(m.application_locked,''Y'') = ''Y'' ) then',
'            ''Y''',
'        else',
'            ''N''',
'        end upgrade_available,',
'        case when ( p.build_version > m.installed_build_version ) and ( nvl(m.application_locked,''Y'') = ''Y'' ) then',
'            ''1''',
'        else',
'            ''0''',
'        end upgrade_is_available,',
'        --',
'        p.app_type application_type,',
'        apex_util.prepare_url( ''f?p=''||:APP_ID||'':81:''||:APP_SESSION||'':::81:P81_ID,P81_APP_TYPE:''',
'        ||p.app_id||'',''||decode(p.app_type,''WS'',''WEBSHEET'',''DB'',''DATABASE'') ) target_url,',
'        case when p.app_category_id_1 is not null then',
'            (select category_name from wwv_flow_pkg_app_categories c where c.id = p.app_category_id_1)',
'        when p.app_category_id_2 is not null then',
'            (select category_name from wwv_flow_pkg_app_categories c where c.id = p.app_category_id_2)',
'        when p.app_category_id_3 is not null then',
'            (select category_name from wwv_flow_pkg_app_categories c where c.id = p.app_category_id_3)',
'        end category_name',
'from wwv_flow_pkg_applications p, wwv_flow_pkg_app_map m, category_name cn',
'where p.app_id = m.app_id (+)',
'and p.app_id = cn.app_id',
'and m.security_group_id (+) = :FLOW_SECURITY_GROUP_ID',
'and p.app_status <> ''HIDDEN''',
'and ((:APPS_ONLY_WORKSPACE = ''N'') or',
'     (:APPS_ONLY_WORKSPACE = ''Y'' and cn.category_name != ''Sample''));'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1224170516463563371.4752)
,p_name=>'Packaged Applications'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'Le nombre maximal de lignes pour cet état est de #MAX_ROW_COUNT# lignes. Appliquez un filtre pour réduire le nombre d''enregistrements dans votre requête.'
,p_no_data_found_message=>'Aucune donnée n''a été trouvée.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'CBCHO'
,p_internal_uid=>1224170516463563371
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1224170864888563380.4752)
,p_db_column_name=>'APP_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nom'
,p_column_link=>'#TARGET_URL#'
,p_column_linktext=>'#APP_NAME#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1224171279819563380.4752)
,p_db_column_name=>'APPLICATION_TYPE'
,p_display_order=>12
,p_column_identifier=>'F'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1224176768409642192)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1224170911190563380.4752)
,p_db_column_name=>'APP_DESCRIPTION'
,p_display_order=>22
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1224171038140563380.4752)
,p_db_column_name=>'INSTALLED'
,p_display_order=>32
,p_column_identifier=>'D'
,p_column_label=>'Installé'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(801893675976261985)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1224171103374563380.4752)
,p_db_column_name=>'UPGRADE_AVAILABLE'
,p_display_order=>42
,p_column_identifier=>'E'
,p_column_label=>'Mise à niveau disponible'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(801893675976261985)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1224171357038563381.4752)
,p_db_column_name=>'TARGET_URL'
,p_display_order=>52
,p_column_identifier=>'G'
,p_column_label=>'URL cible'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(973962307327400233.4752)
,p_db_column_name=>'CATEGORY_NAME'
,p_display_order=>62
,p_column_identifier=>'H'
,p_column_label=>'Nom de catégorie'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1473925915428744023.4752)
,p_db_column_name=>'IS_INSTALLED'
,p_display_order=>63
,p_column_identifier=>'I'
,p_column_label=>'Est installé'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(973962433555400234.4752)
,p_db_column_name=>'IS_NOT_INSTALLED'
,p_display_order=>73
,p_column_identifier=>'J'
,p_column_label=>'N''est pas installé'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(973962551146400235.4752)
,p_db_column_name=>'UPGRADE_IS_AVAILABLE'
,p_display_order=>83
,p_column_identifier=>'K'
,p_column_label=>'Mise à niveau disponible'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(973962130782400231.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1224170433387563371.4752)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(973962236123400232.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1224170433387563371.4752)
,p_button_name=>'Reset'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Réinitialiser'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,RIR,RP:::'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Définir la tranche de temps de génération d''état de tableau de bord'
,p_page_mode=>'MODAL'
,p_step_title=>'Définir la tranche de temps de génération d''état de tableau de bord'
,p_step_sub_title=>'Set Dashboard Reporting Timeframe'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741365982136994250.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(788987310597838727.4752)
,p_plug_name=>'Définir la tranche de temps de génération d''état de la page d''accueil'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
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
 p_id=>wwv_flow_api.id(789086631472668997.4752)
,p_plug_name=>'wizard buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--wizard'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(788987501255838728.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(789086631472668997.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(788987706351838731.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(789086631472668997.4752)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(788987926490838731.4752)
,p_name=>'P5_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(788987310597838727.4752)
,p_prompt=>'Tranche de temps de génération d''état'
,p_source=>'nvl(:P2_TIMEFRAME,604800)'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, to_char(t) t',
'from (',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''SECONDS'')) d, 10 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''MINUTE'')) d, 60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 5*60 t from dual union all',
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 15*60 t from dual union all',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 30*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, 3600 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 2*3600  t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 3*3600  t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 4*3600  t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 6*3600 t from dual union all',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 8*3600 t from dual union all',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 12*3600 t from dual union all',
'select ''18 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 18*3600 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, 1*24*60*60 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 2*24*60*60 t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 3*24*60*60 t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 4*24*60*60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 5*24*60*60 t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 6*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, 7*24*60*60 t  from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 14*24*60*60 t  from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 28*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''YEAR'')) d, 365*24*60*60 t from dual order by 2',
') q'))
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Définissez la tranche de temps au cours de laquelle limiter les requêtes de surveillance affichées sur le tableau de bord.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(789083446179622323.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(788987501255838728.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(789083777258622324.4752)
,p_event_id=>wwv_flow_api.id(789083446179622323.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(788988650941838740.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set timeframe'
,p_process_sql_clob=>':P2_TIMEFRAME := :P5_TIMEFRAME;'
,p_process_when_button_id=>wwv_flow_api.id(788987706351838731.4752)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(788988458278838734.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Set Dashboard Reporting Timeframe Preference'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'FSP_P2_TIMEFRAME_PREFERENCE'
,p_attribute_03=>'P5_TIMEFRAME'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(789083864577624973.4752)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(788987706351838731.4752)
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Administration - Page d''accueil'
,p_page_mode=>'NORMAL'
,p_step_title=>'Administration - Page d''accueil'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20151205181315'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(387694845181435038.4752)
,p_plug_name=>'A propos de'
,p_region_css_classes=>'a-Region--stacked a-Region--padded a-Region--flush a-Region--sideRegion'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'L''administration permet de gérer et de surveiller les applications packagées dans l''espace de travail en fonction des privilèges.'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656960126007052421.4752)
,p_plug_name=>'Gérer un service'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(798354195880640621.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_plug_query_row_template=>1
,p_plug_required_role=>wwv_flow_api.id(404682514053862570)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656960270626052422.4752)
,p_plug_name=>'Gérer les paramètres d''état interactif'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:a-MediaList--noBadge'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(798364561880730346.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(808594161563279237.4752)
,p_plug_name=>'Etats d''activité'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(808592810483273051.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(798348984564602568.4752)
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(808616103208685071.4752)
,p_plug_name=>'Tâches'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_list_id=>wwv_flow_api.id(808614585475666760.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(808638904045321480.4752)
,p_name=>'RENDERING: Change Password - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(808616103208685071.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(808639250092321484.4752)
,p_event_id=>wwv_flow_api.id(808638904045321480.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var lSuccessMsg = this.data.APEX_SUCCESS_MESSAGE,',
'    lUrl = ''f?p=&APP_ID.:6:&SESSION.::'';',
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
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Détail de l''application packagée'
,p_page_mode=>'MODAL'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741365982136994250.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(931637196591229164.4752)
,p_plug_name=>'Détail de l''application packagée'
,p_region_template_options=>'#DEFAULT#:a-Form--autoWidthLabels'
,p_region_attributes=>'style="margin: 24px 0"'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(931641436807391977.4752)
,p_plug_name=>'wizard buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--wizard'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1284871957378082013.4752)
,p_plug_name=>'&P7_APP_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(931641795693396998.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(931641436807391977.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(931687732997369569.4752)
,p_branch_name=>'update app'
,p_branch_action=>'f?p=&APP_ID.:262:&SESSION.::&DEBUG.:262,209:P262_APPLICATION_ID,P262_ID,P81_APP_TYPE:&P7_APP_ID.,&P7_INSTALLED_APP_ID.,&P7_APP_TYPE.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P7_PKG_APP_TASK'
,p_branch_condition_text=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(932258382537362398.4752)
,p_branch_name=>'remove'
,p_branch_action=>'f?p=&APP_ID.:237:&SESSION.::&DEBUG.:237:P237_APPLICATION_ID,P81_APP_TYPE:&P7_INSTALLED_APP_ID.,&P7_APP_TYPE.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P7_PKG_APP_TASK'
,p_branch_condition_text=>'REMOVE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(935935713446136112.4752)
,p_branch_name=>'unlock'
,p_branch_action=>'f?p=&APP_ID.:234:&SESSION.::&DEBUG.:234:P234_APPLICATION_ID,P81_APP_TYPE:&P7_INSTALLED_APP_ID.,&P7_APP_TYPE.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':P7_PKG_APP_TASK = ''UNLOCK'' and not wwv_flow.apps_only_workspace and wwv_flow_authorization.is_authorized_developer (p_developer_authorization => ''EDIT'')'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(935936897243165511.4752)
,p_branch_name=>'change authentication'
,p_branch_action=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:46:P46_APPLICATION_ID,P81_APP_TYPE:&P7_INSTALLED_APP_ID.,&P7_APP_TYPE.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P7_PKG_APP_TASK'
,p_branch_condition_text=>'CHANGE_AUTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(931637438528238233.4752)
,p_name=>'P7_PKG_APP_TASK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(931637196591229164.4752)
,p_prompt=>'Tâches'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.WIZARD_SELECTION'
,p_named_lov=>'P7_PKG_APP_TASKS'
,p_lov=>'.'||wwv_flow_api.id(931635900643222282)||'.'
,p_field_template=>wwv_flow_api.id(1212080564184792020.4752)
,p_item_css_classes=>'a-IconList--featured'
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--stretch:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'S'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(931638459475251094.4752)
,p_name=>'P7_APP_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(931637196591229164.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(931639936453303973.4752)
,p_name=>'P7_APP_NAME'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(931637196591229164.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(932256936321321854.4752)
,p_name=>'P7_INSTALLED_APP_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(931637196591229164.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(933142221496546817.4752)
,p_name=>'P7_APP_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(931637196591229164.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(931641976701401005.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(931641795693396998.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(931642239083401010.4752)
,p_event_id=>wwv_flow_api.id(931641976701401005.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(933143447617575022.4752)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get app_name, app_type and installed_app_id'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (select a.app_name,',
'           case when a.app_type = ''DB'' then',
'                m.installed_app_id',
'           when a.app_type = ''WS'' then',
'                m.installed_ws_id',
'           end installed_app_id,',
'           case when a.app_type = ''DB'' then',
'                ''DATABASE''',
'           when a.app_type = ''WS'' then',
'                ''WEBSHEET''',
'           end app_type',
'		   from wwv_flow_pkg_applications a, wwv_flow_pkg_app_map m',
'		   where a.app_id = m.app_id',
'		   and m.security_group_id = :flow_security_group_id',
'		   and a.app_id = :P7_APP_ID)',
'loop',
'        :P7_APP_NAME := c1.app_name;',
'	:P7_APP_TYPE := c1.app_type;',
'	:P7_INSTALLED_APP_ID := c1.installed_app_id;',
'end loop;'))
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Gérer les états enregistrés'
,p_page_mode=>'NORMAL'
,p_step_title=>'Gérer les états enregistrés'
,p_step_sub_title=>'Saved Interactive Reports'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_ir_notifi.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(802126799972115514.4752)
,p_plug_name=>'Etats enregistrés d''application packagée'
,p_region_template_options=>'#DEFAULT#:a-IRR-region--noOuterBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805538978589340502.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_item.checkbox(1, r.id, null, null,'':'', ''f''||lpad(''''||1,2,''0'') || ''_'' || lpad(''''||rownum,4,''0''), wwv_flow_lang.system_message(''REPORT_LABEL'', wwv_flow_escape.html(r.name))) id,',
'       a.app_name application,',
'       r.page_id page,',
'       r.visibility report_type, ',
'       r.name report_name, ',
'       lower(r.created_by) created_by,',
'       r.created_on,',
'       lower(r.updated_by) updated_by,',
'       r.updated_on',
'from wwv_flow_worksheet_rpts_dev r, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where r.flow_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and r.security_group_id = :flow_security_group_id',
'and r.visibility in (''PUBLIC'', ''PRIVATE'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(802126998751115520.4752)
,p_name=>'Saved Reports'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'Cette requête renvoie plus de 10 000 lignes. Filtrez vos données pour être sûr d''obtenir des résultats complets.'
,p_no_data_found_message=>'Les applications packagées ne disposent d''aucun état enregistré d''utilisateur.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_owner=>'CBCHO'
,p_internal_uid=>802126998751115520
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(802127096586115528.4752)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'#CHECK_ALL_CHECKBOX#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387694112699435031.4752)
,p_db_column_name=>'PAGE'
,p_display_order=>31
,p_column_identifier=>'R'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(802127570505115533.4752)
,p_db_column_name=>'REPORT_TYPE'
,p_display_order=>51
,p_column_identifier=>'J'
,p_column_label=>'Type d''état'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(805149229047727280)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387694218150435032.4752)
,p_db_column_name=>'REPORT_NAME'
,p_display_order=>61
,p_column_identifier=>'S'
,p_column_label=>'Nom d''état'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387694401535435034.4752)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>71
,p_column_identifier=>'U'
,p_column_label=>'Créé'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387694308200435033.4752)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>81
,p_column_identifier=>'T'
,p_column_label=>'Créé par'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387694633493435036.4752)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>91
,p_column_identifier=>'W'
,p_column_label=>'Mis à jour'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387694552472435035.4752)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>101
,p_column_identifier=>'V'
,p_column_label=>'Mis à jour par'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387694785877435037.4752)
,p_db_column_name=>'APPLICATION'
,p_display_order=>111
,p_column_identifier=>'X'
,p_column_label=>'Application'
,p_column_type=>'STRING'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(385710174969581203.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(802126799972115514.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(802126115693115511.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(802126799972115514.4752)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Réinitialiser'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(802126337999115511.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(802126799972115514.4752)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer ce qui est coché'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from wwv_flow_worksheet_rpts_dev r, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where r.flow_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and r.security_group_id = :flow_security_group_id',
'and r.visibility in (''PUBLIC'', ''PRIVATE'')'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(802129063878115553.4752)
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(802128636115115543.4752)
,p_validation_name=>'must select report to delete'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow.g_f01.count = 0 then',
'  return false;',
'end if;',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Pour supprimer l''état, vous devez le sélectionner.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(802126337999115511.4752)
,p_associated_item=>wwv_flow_api.id(.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1199176300631878439.4752)
,p_name=>'ADD CHECK ALL CHECKBOX'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(802126799972115514.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1199176486106878440.4752)
,p_event_id=>wwv_flow_api.id(1199176300631878439.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'PLUGIN_COM.ORACLE.APEX.ADD_CHECKALL_CHECKBOX'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(802128701711115546.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete checked'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for i in 1..wwv_flow.g_f01.count',
'loop',
'    for c1 in (select id report_id, worksheet_id, is_default',
'               from wwv_flow_worksheet_rpts',
'               where id = wwv_flow.g_f01(i)',
'               and security_group_id=:flow_security_group_id)',
'    loop                ',
'        wwv_flow_worksheet_api.delete_saved_report (            ',
'            p_worksheet_id      => c1.worksheet_id,               ',
'            p_report_id         => c1.report_id,',
'            p_is_default        => c1.is_default);        ',
'    end loop;',
'end loop;'))
,p_process_error_message=>'Impossible d''enlever l''état.'
,p_process_when_button_id=>wwv_flow_api.id(802126337999115511.4752)
,p_process_success_message=>'Etats supprimés.'
);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Gérer les abonnements'
,p_page_mode=>'NORMAL'
,p_step_title=>'Gérer les abonnements'
,p_step_sub_title=>'Interactive Report Subscriptions'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_ir_notifi.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805210210849829544.4752)
,p_plug_name=>'Abonnements'
,p_region_template_options=>'#DEFAULT#:a-IRR-region--noOuterBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805538978589340502.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'wwv_flow_item.checkbox(1, n.id, null,null,'':'',''f''||lpad(''''||1,2,''0'') || ''_'' || lpad(''''||rownum,4,''0'') ,',
'wwv_flow_lang.system_message(''IR_SUBSCRIPTION_LABEL'',a.app_name,r.page_id,n.created_by)) id,',
'a.app_name application_name,',
'r.name report_name,',
'r.visibility report_type,',
'r.page_id  page_id,',
'to_timestamp(n.start_date) at time zone sessiontimezone start_date,',
'to_timestamp(n.end_date) at time zone sessiontimezone end_date,',
'case when nvl(n.end_date,systimestamp) >= systimestamp then',
'    n.offset_date',
'end offset_date,',
'n.notify_interval,',
'n.status,',
'n.notify_error,',
'n.email_from,',
'n.email_address email_to,',
'lower(n.created_by) created_by,',
'n.created_on',
'from wwv_flow_worksheet_notify n, wwv_flow_worksheet_rpts_dev r, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where n.worksheet_id = r.worksheet_id',
'and n.report_id = r.id',
'and r.flow_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and n.websheet_id is null',
'and n.security_group_id = :flow_security_group_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(805210444454829545.4752)
,p_name=>'Interactive Reports with Notification'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'Cette requête renvoie plus de 10 000 lignes. Filtrez vos données pour être sûr d''obtenir des résultats complets.'
,p_no_data_found_message=>'Les applications packagées ne disposent d''aucun abonnement.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'CBCHO'
,p_internal_uid=>805210444454829545
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805210582423829548.4752)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'AA'
,p_column_label=>'#CHECK_ALL_CHECKBOX#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805212071678829550.4752)
,p_db_column_name=>'NOTIFY_INTERVAL'
,p_display_order=>6
,p_column_identifier=>'H'
,p_column_label=>'Fréquence'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(805284490639012075)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805212408820829550.4752)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>8
,p_column_identifier=>'Z'
,p_column_label=>'Créé'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805212314470829550.4752)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'Y'
,p_column_label=>'Création par'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805211088270829548.4752)
,p_db_column_name=>'STATUS'
,p_display_order=>14
,p_column_identifier=>'AI'
,p_column_label=>'Statut'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(805215191044829557)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805211153537829548.4752)
,p_db_column_name=>'NOTIFY_ERROR'
,p_display_order=>15
,p_column_identifier=>'AJ'
,p_column_label=>'Message d''erreur'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805211294797829549.4752)
,p_db_column_name=>'START_DATE'
,p_display_order=>16
,p_column_identifier=>'AK'
,p_column_label=>'Date de début'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805211388654829549.4752)
,p_db_column_name=>'END_DATE'
,p_display_order=>17
,p_column_identifier=>'AL'
,p_column_label=>'Date de fin'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805211491386829549.4752)
,p_db_column_name=>'OFFSET_DATE'
,p_display_order=>18
,p_column_identifier=>'AM'
,p_column_label=>'Date de décalage'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805211932559829549.4752)
,p_db_column_name=>'EMAIL_FROM'
,p_display_order=>38
,p_column_identifier=>'AR'
,p_column_label=>'Expéditeur du courriel'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387695254687435042.4752)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>48
,p_column_identifier=>'AS'
,p_column_label=>'Application'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387695333359435043.4752)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>58
,p_column_identifier=>'AT'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387695483973435044.4752)
,p_db_column_name=>'EMAIL_TO'
,p_display_order=>68
,p_column_identifier=>'AU'
,p_column_label=>'Envoyer un courriel à'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805389236751702558.4752)
,p_db_column_name=>'REPORT_NAME'
,p_display_order=>69
,p_column_identifier=>'AV'
,p_column_label=>'Nom d''état'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(387695591788435045.4752)
,p_db_column_name=>'REPORT_TYPE'
,p_display_order=>79
,p_column_identifier=>'AW'
,p_column_label=>'Type d''état'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(805395834107760451)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(385710381915581205.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805210210849829544.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805213326731829552.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805210210849829544.4752)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Réinitialiser'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805213568160829552.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(805210210849829544.4752)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer ce qui est coché'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from wwv_flow_worksheet_notify',
'where security_group_id = :flow_security_group_id'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805214665882829554.4752)
,p_branch_action=>'f?p=&FLOW_ID.:17:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(805213568160829552.4752)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805215001211829556.4752)
,p_branch_name=>'Go To Page 17'
,p_branch_action=>'f?p=&FLOW_ID.:17:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805214089654829552.4752)
,p_validation_name=>'must select notification to delete'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow.g_f01.count = 0 then',
'  return false;',
'end if;',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Pour supprimer l''abonnement, vous devez le sélectionner.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805213568160829552.4752)
,p_associated_item=>wwv_flow_api.id(.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1199176517146878441.4752)
,p_name=>'ADD CHECK ALL CHECKBOX'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(805210210849829544.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1199176676147878442.4752)
,p_event_id=>wwv_flow_api.id(1199176517146878441.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'PLUGIN_COM.ORACLE.APEX.ADD_CHECKALL_CHECKBOX'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805214187440829553.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete checked'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for i in 1..wwv_flow.g_f01.count',
'loop',
'    for c1 in (select id,',
'                      worksheet_id,',
'                      report_id,',
'                      created_by',
'               from wwv_flow_worksheet_notify',
'               where id = wwv_flow.g_f01(i)',
'               and security_group_id = :flow_security_group_id)           ',
'    loop',
'        wwv_flow_worksheet_api.delete_notify (',
'            p_worksheet_id    => c1.worksheet_id,',
'            p_app_user        => c1.created_by,',
'            p_report_id       => c1.report_id,',
'            p_notify_id       => c1.id);',
'    end loop;',
'end loop;'))
,p_process_error_message=>'Impossible d''enlever l''abonnement.'
,p_process_when_button_id=>wwv_flow_api.id(805213568160829552.4752)
,p_process_success_message=>'Abonnements enlevés.'
);
end;
/
prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Définir des préférences d''espace de travail'
,p_page_mode=>'NORMAL'
,p_step_title=>'Définir des préférences d''espace de travail'
,p_html_page_onload=>'onload="p17_checkdisable()"'
,p_step_sub_title=>'Set Workspace Preferences'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(215469304188572178)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'<!--',
'',
'function p17_checkdisable(){ ',
'var ltext_0 = $x(''P17_EXPIRE_FND_USER_ACCOUNTS_0''); ',
'var ltext_1 = $x(''P17_EXPIRE_FND_USER_ACCOUNTS_1''); ',
'var ltext; ',
'if(ltext_0.checked == true){ltext = ltext_0}else{ltext = ltext_1} ',
'html_DisableOnValue(ltext,''N'',''P17_ACCOUNT_LIFETIME_DAYS'',''P17_USER_MAX_LOGIN_FAILURES'') ',
'} ',
'',
'//-->',
'</script>'))
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/*apex.jQuery(''#P17_WORKSPACE_IMAGE ~ a'').each(function() {',
'    if (this.href.match(/apex_util.get_blob_file/)) {',
'        $x("public_workspace_img").src = this.href;',
'    }',
'});*/'))
,p_step_template=>wwv_flow_api.id(741369094170994311.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(404682514053862570)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_prefs.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805410076630857770.4752)
,p_plug_name=>'Contrôle de connexion de compte'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805411797666857782.4752)
,p_plug_name=>'Définir des préférences'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Fonctionnalité de contrôle des préférences pour l''espace de travail.'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805414676421857790.4752)
,p_plug_name=>'Définir des préférences d''espace de travail'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noBorder:a-ButtonRegion--showTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805415029302857791.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805414676421857790.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805414831280857790.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805414676421857790.4752)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805426374033857810.4752)
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(805414831280857790.4752)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805410207563857772.4752)
,p_name=>'P22_EXPIRE_FND_USER_ACCOUNTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(805410076630857770.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expiration et verrouillage de compte :'
,p_source=>'EXPIRE_FND_USER_ACCOUNTS'
,p_source_type=>'DB_COLUMN'
,p_source_post_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'case',
'  when wwv_flow_platform.get_preference(''EXPIRE_FND_USER_ACCOUNTS'')=''Y'' then ''Y''',
'  else nvl(:P22_EXPIRE_FND_USER_ACCOUNTS,''N'')',
'end'))
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'EXPIRE USER ACCOUNTS'
,p_lov=>'.'||wwv_flow_api.id(805446669974928665)||'.'
,p_tag_attributes=>'onchange="p17_checkdisable()"'
,p_read_only_when=>'nvl(wwv_flow_platform.get_preference(''EXPIRE_FND_USER_ACCOUNTS''),''N'') = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Effectuez une sélection pour déterminer si les comptes utilisateur final &PRODUCT_NAME. peuvent être invalidés ou verrouillés. Cette fonctionnalité ne s''applique qu''aux',
'comptes utilisateur final créés à l''aide de l''interface de gestion des utilisateurs &PRODUCT_NAME..',
' Les options disponibles sont les suivantes :',
'<ul>',
'<li>Activer</li>',
'<li>Désactiver</li>',
'</ul>',
'Cette fonctionnalité offre d''autres fonctions de sécurité d''authentification pour les applications.',
'Si vous sélectionnez <b>Activer</b>, les mots de passe de compte utilisateur arriveront à expiration après une période de temps configurable,',
'les comptes seront verrouillés après un nombre déterminé d''échecs d''authentification et les mots de passe pourront être définis de telle sorte qu''ils arrivent à expiration après la première utilisation.',
'<p>',
'Si l''administrateur &PRODUCT_NAME. de cette installation a affecté la valeur Oui au paramètre d''environnement <b>Demander l''expiration et le verrouillage du compte utilisateur</b>, cela signifie que la fonctionnalité doit être activée pour tous les e'
||'spaces de travail et que l''élément affichera <b>Activer</b> et ne peut pas être modifié par l''administrateur d''espace de travail.'))
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805410744251857777.4752)
,p_name=>'P22_USER_MAX_LOGIN_FAILURES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(805410076630857770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'nvl (',
'    wwv_flow_platform.get_preference(''MAX_LOGIN_FAILURES''),',
'    4 )'))
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Nombre maximum d''échecs de connexion autorisé :'
,p_source=>'FND_USER_MAX_LOGIN_FAILURES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Saisissez un entier positif indiquant le nombre maximum autorisé de tentatives d''authentification consécutives en échec avant qu''un compte utilisateur final ne soit bloqué. Si vous n''indiquez pas de valeur dans ce champ, le paramètre d''environnement '
||'<b>Nombre maximum d''échecs de connexion autorisé</b> sera utilisé.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805411205289857780.4752)
,p_name=>'P22_ACCOUNT_LIFETIME_DAYS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(805410076630857770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'nvl (',
'    wwv_flow_platform.get_preference(''ACCOUNT_LIFETIME_DAYS''),',
'    45 )'))
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Durée de validité des comptes utilisateur final (jours) :'
,p_source=>'ACCOUNT_LIFETIME_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>3
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Saisissez un entier positif indiquant le nombre maximum de jours d''utilisation d''un mot de passe de compte utilisateur final avant que le compte n''arrive à expiration. Si vous n''indiquez pas de valeur dans ce champ, le paramètre d''environnement <b>Du'
||'rée de validité du mot de passe de compte</b> sera utilisé.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805415233004857791.4752)
,p_name=>'P22_PROVISIONING_COMPANY_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(805414676421857790.4752)
,p_use_cache_before_default=>'NO'
,p_source=>'PROVISIONING_COMPANY_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(805420907136857796.4752)
,p_computation_sequence=>10
,p_computation_item=>'P22_EXPIRE_FND_USER_ACCOUNTS'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if nvl(wwv_flow_platform.get_preference(''EXPIRE_FND_USER_ACCOUNTS''),''N'') = ''Y'' then',
'    return ''Y'';',
'else',
'    return :P22_EXPIRE_FND_USER_ACCOUNTS;',
'end if;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805421189091857798.4752)
,p_validation_name=>'Expire FND User Accounts in Y/N or null'
,p_validation_sequence=>10
,p_validation=>'nvl(:P22_EXPIRE_FND_USER_ACCOUNTS,''N'') in (''Y'',''N'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Valeur hors limites.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805414831280857790.4752)
,p_associated_item=>wwv_flow_api.id(805410207563857772.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805421383687857799.4752)
,p_validation_name=>'max login failures positive'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_number number;',
'begin',
'    l_number := to_number( :P22_USER_MAX_LOGIN_FAILURES );',
'    if l_number = abs(trunc(l_number)) then',
'        return TRUE;',
'    else ',
'        return FALSE;',
'    end if;',
'exception',
'    when others then',
'        return FALSE;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'La valeur doit être un entier positif.'
,p_always_execute=>'N'
,p_validation_condition=>'P22_USER_MAX_LOGIN_FAILURES'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(805414831280857790.4752)
,p_associated_item=>wwv_flow_api.id(805410744251857777.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805421546119857799.4752)
,p_validation_name=>'account lifetime positive'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_number number;',
'begin',
'    l_number := to_number( :P22_ACCOUNT_LIFETIME_DAYS );',
'    if l_number = abs(trunc(l_number)) then',
'        return TRUE;',
'    else ',
'        return FALSE;',
'    end if;',
'exception',
'    when others then',
'        return FALSE;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'La valeur doit être un entier positif.'
,p_always_execute=>'N'
,p_validation_condition=>'P22_ACCOUNT_LIFETIME_DAYS'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(805414831280857790.4752)
,p_associated_item=>wwv_flow_api.id(805411205289857780.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(805425657717857809.4752)
,p_name=>'App Builder Setting Updates Packaged Apps setting'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P22_ALLOW_APP_BUILDING_YN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805425947133857810.4752)
,p_event_id=>wwv_flow_api.id(805425657717857809.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P22_ALLOW_PACKAGED_APP_INS_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805426154712857810.4752)
,p_event_id=>wwv_flow_api.id(805425657717857809.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P22_ALLOW_PACKAGED_APP_INS_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805422042627857799.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'override with instance settings'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_platform.get_preference(''EXPIRE_FND_USER_ACCOUNTS'')=''Y'' then',
'    :P22_EXPIRE_FND_USER_ACCOUNTS := ''Y'';',
'end if;'))
,p_process_error_message=>'Impossible d''appliquer les préférences d''espace de travail.'
,p_process_when_button_id=>wwv_flow_api.id(805414831280857790.4752)
,p_process_success_message=>'Préférences d''espace de travail appliquées.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805422297100857801.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Save WWV_FLOW_COMPANIES'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_COMPANIES'
,p_attribute_03=>'P22_PROVISIONING_COMPANY_ID'
,p_attribute_04=>'PROVISIONING_COMPANY_ID'
,p_attribute_11=>'U'
,p_attribute_14=>'N'
,p_attribute_15=>'D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(805414831280857790.4752)
,p_process_when=>':P22_PROVISIONING_COMPANY_ID = wwv_flow_security.g_security_group_id'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805422669909857801.4752)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set provisioning_company_id'
,p_process_sql_clob=>':P22_PROVISIONING_COMPANY_ID := wwv_flow_security.g_security_group_id;'
,p_process_error_message=>'#SQLERRM#'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805422817459857801.4752)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'fetch wwv_flow_companies'
,p_attribute_01=>'#OWNER#'
,p_attribute_02=>'WWV_FLOW_COMPANIES'
,p_attribute_03=>'P22_PROVISIONING_COMPANY_ID'
,p_attribute_04=>'PROVISIONING_COMPANY_ID'
,p_attribute_14=>'N'
);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Changer mon mot de passe'
,p_page_mode=>'MODAL'
,p_step_title=>'Changer mon mot de passe'
,p_step_sub_title=>'Change Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(805159035944749645)
,p_inline_css=>'#htmldbMessageHolder {position: inherit !important; margin: -10px auto 12px auto !important};'
,p_step_template=>wwv_flow_api.id(741365982136994250.4752)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(808618444674696806.4752)
,p_plug_name=>'Changer de mot de passe'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--noBorder:a-Region--accessibleHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>wwv_flow_api.id(1939532588110833.4752)
,p_plug_column_width=>'valign="top"'
,p_plug_display_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_plug_display_when_condition=>'CONFIRM'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(808621063314696818.4752)
,p_plug_name=>'Close Window'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'CONFIRM'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(808621405592696819.4752)
,p_plug_name=>'reset'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':F4750_P24_PASSWORD := null;',
':F4750_P24_CONFIRM_PASSWORD := null;',
':P24_ENTER_CURRENT_PASSWORD := null;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(808630626294794185.4752)
,p_plug_name=>'Barre de boutons'
,p_region_template_options=>'a-ButtonRegion--withItems:a-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(808618618409696808.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(808630626294794185.4752)
,p_button_name=>'Cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(808618870920696809.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(808630626294794185.4752)
,p_button_name=>'Save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(808623589132696826.4752)
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.:CONFIRM:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(808619023600696810.4752)
,p_name=>'F4750_P24_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(808618444674696806.4752)
,p_prompt=>'Nom utilisateur :'
,p_source=>':flow_user'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Nom de l''utilisateur dont le mot de passe doit être modifié'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(808619567362696812.4752)
,p_name=>'P24_ENTER_CURRENT_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(808618444674696806.4752)
,p_prompt=>'Saisir le mot de passe en cours'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Saisissez votre mot de passe en cours.'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(808620040744696814.4752)
,p_name=>'F4750_P24_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(808618444674696806.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Saisir le nouveau mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Saisir le nouveau mot de passe'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(808620538452696818.4752)
,p_name=>'F4750_P24_CONFIRM_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(808618444674696806.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirmer le nouveau mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ressaisir le nouveau mot de passe'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(808621979876696823.4752)
,p_validation_name=>':FLOW_USER is not null'
,p_validation_sequence=>10
,p_validation=>'FLOW_USER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Le nom utilisateur n''a pas été défini correctement. Fermez complètement votre navigateur Web et réessayez de modifier votre mot de passe.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(808619023600696810.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_validation_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Implemented on Display Only field due to issues with Username being null in some instances. Issue often reported on apex.oracle.com with users being unable to change their password until they have restarted their browser -- David Peake',
''))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(808622161695696823.4752)
,p_validation_name=>'P24_ENTER_CURRENT_PASSWORD'
,p_validation_sequence=>20
,p_validation=>'P24_ENTER_CURRENT_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Vous devez indiquer un mot de passe.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(808619567362696812.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(808622355996696823.4752)
,p_validation_name=>'F4750_P24_PASSWORD Not Null'
,p_validation_sequence=>30
,p_validation=>'F4750_P24_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Vous devez indiquer un mot de passe.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(808620040744696814.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_validation_comment=>'generated 07-AUG-2002 16:59'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(808622505908696824.4752)
,p_validation_name=>'F4750_P24_CONFIRM_PASSWORD Not Null'
,p_validation_sequence=>40
,p_validation=>'F4750_P24_CONFIRM_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Vous devez indiquer un mot de passe de confirmation.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(808620538452696818.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_validation_comment=>'generated 07-AUG-2002 16:59'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(808622767498696824.4752)
,p_validation_name=>'passwd = confirm passwd'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :F4750_P24_PASSWORD != :F4750_P24_CONFIRM_PASSWORD then',
'  :F4750_P24_PASSWORD := null;',
'  :F4750_P24_CONFIRM_PASSWORD := null;',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Le mot de passe de confirmation ne correspond pas au mot de passe.'
,p_always_execute=>'N'
,p_validation_condition=>':F4750_P24_PASSWORD is not null and :F4750_P24_CONFIRM_PASSWORD is not null'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(808620538452696818.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(808622997499696824.4752)
,p_validation_name=>'Validate Current Password'
,p_validation_sequence=>60
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'return wwv_flow_user_api.is_login_password_valid(',
'  p_username=>:APP_USER,',
'  p_password=>:P24_ENTER_CURRENT_PASSWORD);'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Mot de passe non valide'
,p_always_execute=>'N'
,p_validation_condition=>'P24_ENTER_CURRENT_PASSWORD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(808619567362696812.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(808621799286696820.4752)
,p_validation_name=>'strong password'
,p_validation_sequence=>70
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'return wwv_flow_security.strong_password_validation(',
'      p_username              => :F4750_P24_USER_NAME,',
'      p_password              => :F4750_P24_PASSWORD,',
'      p_old_password          => :P24_ENTER_CURRENT_PASSWORD,',
'      p_workspace_name        => ',
'              wwv_flow_security.find_company_name(:WORKSPACE_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'Erreur'
,p_always_execute=>'N'
,p_validation_condition=>':F4750_P24_PASSWORD is not null and :F4750_P24_CONFIRM_PASSWORD is not null'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(808620040744696814.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(808623048192696824.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'change password'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare ',
'  l_p varchar2(256) := v(''F4750_P24_PASSWORD'');',
'begin',
'  wwv_flow.update_cache_with_write(''F4750_P24_PASSWORD'',null);',
'  wwv_flow.update_cache_with_write(''F4750_P24_CONFIRM_PASSWORD'',null);',
'  wwv_flow.update_cache_with_write(''P24_ENTER_CURRENT_PASSWORD'',null);',
'  wwv_flow_api.g_fnd_user_password_action := true;',
'  update wwv_flow_fnd_user ',
'    set web_password = l_p',
'  where security_group_id = :flow_security_group_id ',
'    and user_id = (select user_id ',
'                    from wwv_flow_fnd_user ',
'                   where security_group_id = :flow_security_group_id ',
'                     and user_name = :flow_user);',
'  wwv_flow_api.g_fnd_user_password_action := false;',
'end;'))
,p_process_error_message=>'Erreur lors de la modification du mot de passe.'
,p_process_when=>':F4750_P24_PASSWORD = :F4750_P24_CONFIRM_PASSWORD'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Mot de passe modifié.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(808623229362696825.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'58'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(808644992112421974.4752)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog on Save'
,p_process_error_message=>'Erreur lors de la modification du mot de passe.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(808618870920696809.4752)
,p_process_success_message=>'Mot de passe modifié.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(808626268357724569.4752)
,p_process_sequence=>15
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog on Cancel'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(808618618409696808.4752)
);
end;
/
prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Activité de l''application'
,p_page_mode=>'NORMAL'
,p_step_title=>'Activité de l''application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(815824970388163832.4752)
,p_plug_name=>'Activité de l''application'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''PKG.APP.USER_ACTIVITY'', x.the_users, x.page_events) display_col,',
'       x.the_day',
'from',
'(select l.distinct_users the_users,',
'       trim(to_char(l.page_events,''999G999G999G990'')) page_events,',
'       l.log_day the_day',
'from wwv_flow_log_history l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.application_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.workspace_id',
'and l.workspace_id = :flow_security_group_id',
'union all',
'select count(distinct userid) the_users,',
'       trim(to_char(count(*),''999G999G999G990'')) page_events,',
'       trunc(l.time_stamp) the_day',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.flow_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''DB''',
'and l.userid is not null ',
'and l.time_stamp > trunc(sysdate)',
'group by trunc(l.time_stamp)',
'union all',
'select count(distinct userid) the_users,',
'       trim(to_char(count(*),''999G999G999G990'')) page_events,',
'       trunc(l.time_stamp) the_day',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.websheet_id = m.installed_ws_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''WS''',
'and l.userid is not null ',
'and l.time_stamp > trunc(sysdate)',
'group by trunc(l.time_stamp)) x'))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_row_template=>1
,p_attribute_01=>'THE_DAY'
,p_attribute_03=>'DISPLAY_COL'
,p_attribute_07=>'N'
,p_attribute_09=>'month:list:navigation'
,p_attribute_13=>'N'
,p_attribute_17=>'Y'
,p_attribute_19=>'N'
,p_attribute_22=>'Y'
);
end;
/
prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Vues de page'
,p_page_mode=>'NORMAL'
,p_step_title=>'Vues de page'
,p_step_sub_title=>'Page Views'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(387695745099435047.4752)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(818291197123192122.4752)
,p_plug_name=>'Vues de page'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805538978589340502.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select x.user_id,',
'       x.application,',
'       x.page,',
'       x.page_name,',
'       x.component_name,',
'       x.time_stamp,',
'       x.elapsed,',
'       x.num_rows,',
'       x.ir_search,',
'       x.error,',
'       x.page_mode,',
'       x.pgsize',
'from (',
'select lower(l.userid)      user_id,',
'       a.app_name           application,',
'       l.step_id            page,',
'       l.step_id||''. ''||(select name from wwv_flow_steps p where p.id = l.step_id and p.flow_id = m.installed_app_id) page_name,',
'       l.component_name,',
'       l.time_stamp,',
'       l.elap               elapsed,',
'       l.num_rows,',
'       l.ir_search,',
'       l.sqlerrm            error,',
'       decode(l.page_mode,''p'',''partial'',''d'',''full'',page_mode) page_mode,',
'       l.content_length pgsize',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.flow_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''DB''',
'and l.time_stamp > sysdate - (:P29_TIMEFRAME/86400)',
'and l.userid is not null',
'union all',
'select lower(l.userid)      user_id,',
'       a.app_name           application,',
'       null                 page,',
'       (select name from wwv_flow_ws_webpages p where p.id = l.webpage_id and p.ws_app_id = m.installed_ws_id) page_name,',
'       null                 component_name,',
'       l.time_stamp,',
'       l.elap               elapsed,',
'       l.num_rows,',
'       null                 ir_search,',
'       l.sqlerrm            error,',
'       null                 page_mode,',
'       l.content_length pgsize',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.websheet_id = m.installed_ws_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''WS''',
'and l.time_stamp > sysdate - (:P29_TIMEFRAME/86400)',
'and l.userid is not null) x',
'order by x.time_stamp desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(818291210293192122.4752)
,p_name=>'Page Views'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'Le nombre maximal de lignes pour cet état est de #MAX_ROW_COUNT# lignes. Appliquez un filtre pour réduire le nombre d''enregistrements dans votre requête.'
,p_no_data_found_message=>'Aucune donnée n''a été trouvée.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'CBCHO'
,p_internal_uid=>818291210293192122
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818291543978192134.4752)
,p_db_column_name=>'APPLICATION'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Application'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818291708558192134.4752)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Page'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818291411458192133.4752)
,p_db_column_name=>'USER_ID'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'Utilisateur'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818291995338192134.4752)
,p_db_column_name=>'TIME_STAMP'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Horodatage'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818292017980192135.4752)
,p_db_column_name=>'ELAPSED'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Ecoulé'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D0000'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818292301932192135.4752)
,p_db_column_name=>'ERROR'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Erreur'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818292535119192135.4752)
,p_db_column_name=>'PGSIZE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'PGSIZE'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818291679407192134.4752)
,p_db_column_name=>'PAGE'
,p_display_order=>130
,p_column_identifier=>'C'
,p_column_label=>'PAGE'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818291832742192134.4752)
,p_db_column_name=>'COMPONENT_NAME'
,p_display_order=>140
,p_column_identifier=>'E'
,p_column_label=>'COMPONENT_NAME'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818292190505192135.4752)
,p_db_column_name=>'NUM_ROWS'
,p_display_order=>150
,p_column_identifier=>'H'
,p_column_label=>'NUM_ROWS'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818292229079192135.4752)
,p_db_column_name=>'IR_SEARCH'
,p_display_order=>160
,p_column_identifier=>'I'
,p_column_label=>'IR_SEARCH'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818292404284192135.4752)
,p_db_column_name=>'PAGE_MODE'
,p_display_order=>170
,p_column_identifier=>'K'
,p_column_label=>'PAGE_MODE'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(387695880936435048.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(818291197123192122.4752)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Réinitialiser'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,RIR:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(387695968139435049.4752)
,p_name=>'P29_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(387695745099435047.4752)
,p_item_default=>'86400'
,p_prompt=>'Tranche de temps'
,p_source=>'86400'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, to_char(t) t',
'from (',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''SECONDS'')) d, 10 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''MINUTE'')) d, 60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 5*60 t from dual union all',
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 15*60 t from dual union all',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 30*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, 3600 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 2*3600  t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 3*3600  t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 4*3600  t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 6*3600 t from dual union all',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 8*3600 t from dual union all',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 12*3600 t from dual union all',
'select ''18 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 18*3600 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, 1*24*60*60 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 2*24*60*60 t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 3*24*60*60 t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 4*24*60*60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 5*24*60*60 t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 6*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, 7*24*60*60 t  from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 14*24*60*60 t  from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 28*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''YEAR'')) d, 365*24*60*60 t from dual order by 2',
') q'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Principaux utilisateurs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Principaux utilisateurs'
,p_step_sub_title=>'Top Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(387696033127435050.4752)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(818309753019781737.4752)
,p_plug_name=>'Principaux utilisateurs'
,p_plug_template=>wwv_flow_api.id(805538978589340502.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'lower(l.userid)                   the_user,',
'count(*)                          page_events,',
'median(l.elap)                    median_elapsed,',
'sum(l.num_rows)                   rows_fetched,',
'sum(decode(l.ir_search,null,0,1)) ir_searches,',
'sum(decode(l.sqlerrm,null,0,1))   errors,',
'max(l.time_stamp)                 most_recent',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.flow_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''DB''',
'and l.time_stamp > sysdate - (:P30_TIMEFRAME/86400)',
'and l.userid is not null',
'group by lower(l.userid)',
'union all',
'select',
'lower(l.userid)                   the_user,',
'count(*)                          page_events,',
'median(l.elap)                    median_elapsed,',
'sum(l.num_rows)                   rows_fetched,',
'sum(decode(l.ir_search,null,0,1)) ir_searches,',
'sum(decode(l.sqlerrm,null,0,1))   errors,',
'max(l.time_stamp)                 most_recent',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.websheet_id = m.installed_ws_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''WS''',
'and l.time_stamp > sysdate - (:P30_TIMEFRAME/86400)',
'and l.userid is not null',
'group by lower(l.userid)',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P30_VIEW_AS'
,p_plug_display_when_cond2=>'REPORT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(818309872448781737.4752)
,p_name=>'Top Users'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'Le nombre maximal de lignes pour cet état est de #MAX_ROW_COUNT# lignes. Appliquez un filtre pour réduire le nombre d''enregistrements dans votre requête.'
,p_no_data_found_message=>'Aucune donnée n''a été trouvée.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'CBCHO'
,p_internal_uid=>818309872448781737
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818310029624781746.4752)
,p_db_column_name=>'THE_USER'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Utilisateur'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818310186167781749.4752)
,p_db_column_name=>'PAGE_EVENTS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Vues de page'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818310286211781749.4752)
,p_db_column_name=>'MEDIAN_ELAPSED'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Temps médian écoulé'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D0000'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818310396450781749.4752)
,p_db_column_name=>'ROWS_FETCHED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Lignes extraites'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818310413109781754.4752)
,p_db_column_name=>'IR_SEARCHES'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Recherches d''état'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818310564517781754.4752)
,p_db_column_name=>'ERRORS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Erreurs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(818310695218781754.4752)
,p_db_column_name=>'MOST_RECENT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Vue la plus récente'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(818313389467802103.4752)
,p_plug_name=>'Principaux utilisateurs'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select x.userid,',
'       x.page_views',
'from (',
'select lower(l.userid) as userid,',
'       count(*)        as page_views',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.flow_id = m.installed_app_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''DB''',
'and l.time_stamp > sysdate - (:P30_TIMEFRAME/86400)',
'and l.userid     is not null',
'group by lower(l.userid)',
'union all',
'select lower(l.userid) as userid,',
'       count(*)        as page_views',
'from wwv_flow_activity_log l, wwv_flow_pkg_app_map m, wwv_flow_pkg_applications a',
'where l.websheet_id = m.installed_ws_id',
'and m.app_id = a.app_id',
'and m.security_group_id = l.security_group_id',
'and l.security_group_id = :flow_security_group_id',
'and a.app_type = ''WS''',
'and l.time_stamp > sysdate - (:P30_TIMEFRAME/86400)',
'and l.userid is not null',
'group by lower(l.userid)) x',
'order by x.page_views'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.FLOT.PIE'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P30_VIEW_AS'
,p_plug_display_when_cond2=>'CHART'
,p_attribute_01=>'USERID'
,p_attribute_02=>'PAGE_VIEWS'
,p_attribute_05=>'DONUT'
,p_attribute_08=>'LABEL:VALUE'
,p_attribute_09=>'Y'
,p_attribute_10=>'2'
,p_attribute_11=>'Autre'
,p_attribute_14=>'.25'
,p_attribute_15=>'MODERN'
,p_attribute_17=>'420'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(818313423274802104.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(818309753019781737.4752)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Réinitialiser'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,RIR:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(818313166460802101.4752)
,p_name=>'P30_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(387696033127435050.4752)
,p_item_default=>'86400'
,p_prompt=>'Tranche de temps'
,p_source=>'86400'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, to_char(t) t',
'from (',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''SECONDS'')) d, 10 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''MINUTE'')) d, 60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 5*60 t from dual union all',
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 15*60 t from dual union all',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, 30*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, 3600 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 2*3600  t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 3*3600  t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 4*3600  t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 6*3600 t from dual union all',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 8*3600 t from dual union all',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 12*3600 t from dual union all',
'select ''18 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, 18*3600 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, 1*24*60*60 t from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 2*24*60*60 t from dual union all',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 3*24*60*60 t from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 4*24*60*60 t from dual union all',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 5*24*60*60 t from dual union all',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, 6*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, 7*24*60*60 t  from dual union all',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 14*24*60*60 t  from dual union all',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, 28*24*60*60 t from dual union all',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''YEAR'')) d, 365*24*60*60 t from dual order by 2',
') q'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(818313213970802102.4752)
,p_name=>'P30_VIEW_AS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(387696033127435050.4752)
,p_item_default=>'REPORT'
,p_prompt=>'Visualiser comme'
,p_source=>'REPORT'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P30_VIEW_AS'
,p_lov=>'.'||wwv_flow_api.id(818319918283815176)||'.'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
end;
/
prompt --application/pages/page_00046
begin
wwv_flow_api.create_page(
 p_id=>46.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Modifier authentification'
,p_page_mode=>'MODAL'
,p_step_title=>'Modifier authentification'
,p_step_sub_title=>'Change Authentication'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(806250634212071966)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492892149649858120.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_api.id(492893177518858121.4752)
,p_plug_name=>'Modifier authentification'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492893989100858123.4752)
,p_plug_name=>'Paramètres d''authentification'
,p_region_name=>'PLUGIN'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="color:#FFFFFF;display:none;"'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_footer=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'// masquer instantanément les attributs dynamiques une fois affichés, ',
'// l''exécution de jQuery.ready peut être trop longue. ',
'apex.builder.dynamicAttributes.hide(''P46_'');',
'</script>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492897358519858127.4752)
,p_plug_name=>'Add Javascript code for Plugins'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    -- create the onChange event for the P46_AUTH and',
'    -- also the initialization code for the dynamic attributes',
'    wwv_flow_plugin_dev.add_onload_code (',
'        p_plugin_type         => wwv_flow_plugin.c_plugin_type_authentication,',
'        p_type_page_item_name => ''P46_AUTH'',',
'        p_page_item_prefix    => ''P46_'' );',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492892379954858121.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(492892149649858120.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492892500116858121.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(492892149649858120.4752)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492893306622858121.4752)
,p_name=>'P46_APPLICATION_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(492893177518858121.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492893588321858122.4752)
,p_name=>'P46_APP_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(492893177518858121.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom d''application :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name ',
'from wwv_flows',
'where id = :P46_APPLICATION_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492893708139858123.4752)
,p_name=>'P46_AUTH'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(492893177518858121.4752)
,p_item_default=>'APEX'
,p_prompt=>'Authentification'
,p_source=>'select scheme_type from wwv_flow_authentications where flow_id = :P46_APPLICATION_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PACKAGED_APP_AUTH_OPTION_PG46'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.''|| name_with_prefix) as d,',
'       name_with_prefix      as r',
'  from wwv_flow_native_plugins',
' where plugin_type = ''AUTHENTICATION TYPE''',
'   and (          name_with_prefix = ''NATIVE_APEX_ACCOUNTS''',
'         or (     name_with_prefix = ''NATIVE_HTTP_HEADER_VARIABLE''',
'              and :P7_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_HHEAD'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_LDAP''',
'              and :P7_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_LDAP'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_IAS_SSO''',
'              and :P7_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_SSO'') = ''Y'' ))',
'union all',
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.NATIVE_CLOUD_IDM''),',
'       ''NATIVE_CLOUD_IDM''',
'  from sys.dual',
' where wwv_flow_authentication_dev.get_internal_authentication = ''CLOUD_IDM'''))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492894385246858124.4752)
,p_name=>'P46_ATTRIBUTE_01'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492894584823858124.4752)
,p_name=>'P46_ATTRIBUTE_02'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492894732824858124.4752)
,p_name=>'P46_ATTRIBUTE_03'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492894983148858124.4752)
,p_name=>'P46_ATTRIBUTE_04'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492895134570858124.4752)
,p_name=>'P46_ATTRIBUTE_05'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492895339778858125.4752)
,p_name=>'P46_ATTRIBUTE_06'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492895583803858125.4752)
,p_name=>'P46_ATTRIBUTE_07'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492895792177858125.4752)
,p_name=>'P46_ATTRIBUTE_08'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492895989502858125.4752)
,p_name=>'P46_ATTRIBUTE_09'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492896147252858125.4752)
,p_name=>'P46_ATTRIBUTE_10'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492896380421858125.4752)
,p_name=>'P46_ATTRIBUTE_11'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492896565565858125.4752)
,p_name=>'P46_ATTRIBUTE_12'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492896749160858126.4752)
,p_name=>'P46_ATTRIBUTE_13'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492896913620858127.4752)
,p_name=>'P46_ATTRIBUTE_14'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492897191101858127.4752)
,p_name=>'P46_ATTRIBUTE_15'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(492893989100858123.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(740979344212387742.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(492892379954858121.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(740979698605387743.4752)
,p_event_id=>wwv_flow_api.id(740979344212387742.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(492897911531858127.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Application Authentication'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'        --',
'        -- configure authentication scheme',
'        --',
'        if :P46_AUTH = ''NATIVE_CLOUD_IDM'' then',
'            -- IDM authentication',
'            update wwv_flow_authentications',
'               set scheme_type          = :P46_AUTH,',
'                   name                 = wwv_flow_lang.system_message (',
'                                              ''AUTHENTICATION_NAME.''||:P46_AUTH ),',
'                   --''Oracle Cloud Identity Management'',',
'                   invalid_session_type = null,',
'                   invalid_session_url  = null,',
'                   logout_url           = null',
'            where flow_id = :P46_APPLICATION_ID;',
'        else',
'            -- configure plugin attributes',
'            update wwv_flow_authentications',
'               set scheme_type  = :P46_AUTH,',
'                   name         = wwv_flow_lang.system_message(''AUTHENTICATION_NAME.''||:P46_AUTH),',
'                   attribute_01 = :P46_ATTRIBUTE_01,',
'                   attribute_02 = :P46_ATTRIBUTE_02,',
'                   attribute_03 = :P46_ATTRIBUTE_03,',
'                   attribute_04 = :P46_ATTRIBUTE_04,',
'                   attribute_05 = :P46_ATTRIBUTE_05,',
'                   attribute_06 = :P46_ATTRIBUTE_06,',
'                   attribute_07 = :P46_ATTRIBUTE_07,',
'                   attribute_08 = :P46_ATTRIBUTE_08,',
'                   attribute_09 = :P46_ATTRIBUTE_09,',
'                   attribute_10 = :P46_ATTRIBUTE_10,',
'                   attribute_11 = :P46_ATTRIBUTE_11,',
'                   attribute_12 = :P46_ATTRIBUTE_12,',
'                   attribute_13 = :P46_ATTRIBUTE_13,',
'                   attribute_14 = :P46_ATTRIBUTE_14,',
'                   attribute_15 = :P46_ATTRIBUTE_15',
'             where flow_id = :P46_APPLICATION_ID;',
'        end if;',
'        commit;',
' end;'))
,p_process_error_message=>'L''application n''a pas été mise à jour.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(492892500116858121.4752)
,p_process_success_message=>'Le modèle d''authentification d''application a été mis à jour.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(740979821670390985.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(492892500116858121.4752)
,p_process_success_message=>'Authentification de l''application modifiée.'
);
end;
/
prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Applications packagées'
,p_page_mode=>'NORMAL'
,p_step_title=>'Applications packagées'
,p_step_sub_title=>'Packaged Applications'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_file_urls=>'#IMAGE_PREFIX#apex_ui/js/staticSearch.js'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'staticSearch.initialize("#P50_SEARCH", "#applications", pkg_apps["pkg_apps"], {',
'        mapping: {',
'            "APP_NAME": {',
'                "priority": 3,',
'            },',
'            "APP_DESCRIPTION": {',
'                "priority": 2,',
'                "html": true',
'            },',
'            "CATEGORY": {',
'                "priority": 1',
'            }',
'        },',
'        filterEmpty: false,',
'        limit: 100,',
'        onEmptySearch: function () {',
'            $("#applications")[0].className = "a-AppCards a-AppCards--slim a-AppCards--grid";',
'        },',
'        onActiveSearch: function () {',
'            $("#applications")[0].className = "a-AppCards a-AppCards--searchResults";',
'        },',
'        template: ''<li class="a-AppCards-item">    <div class="a-AppCards-itemContainer">     <a href="#%TARGET_URL#%" class="a-AppCards-link">      <div class="a-AppCards-iconContainer">        <span class="a-AppCards-icon #%IMAGE_IDENTIFIER#%"></sp'
||'an>      </div>      <div class="a-AppCards-contentContainer">        <h2 class="a-AppCards-name">#%APP_NAME#%</h2>        <div class="a-AppCards-desc">#%APP_DESCRIPTION#%</div>        <div class="a-AppCards-info">#%CATEGORY#%</div>      </div>      '
||'</a>    </div>  </li>''',
'    });'))
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(806250634212071966)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_deep_linking=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1119586009828190520.4752)
,p_plug_name=>'Applications JSON'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    c sys_refcursor;',
'begin',
'    open c for',
'        with category_name as (',
'            select app_id,',
'            case when app_category_id_1 is not null then',
'                (select category_name from wwv_flow_pkg_app_categories ct where ct.id = pa.app_category_id_1)',
'            when app_category_id_2 is not null then',
'                (select category_name from wwv_flow_pkg_app_categories ct where ct.id = pa.app_category_id_2)',
'            when app_category_id_3 is not null then',
'                (select category_name from wwv_flow_pkg_app_categories ct where ct.id = pa.app_category_id_3)',
'            end category_name',
'            from wwv_flow_pkg_applications pa)',
'        select  p.app_name,',
'            p.id,',
'            p.app_id,',
'            p.app_description,',
'            p.image_identifier,',
'            p.app_status,',
'            decode(p.app_type,''WS'',''WEBSHEET'',''DB'',''DATABASE'') application_type,',
'            --',
'            rtrim(decode(p.app_category_id_1,null,null,decode(( select category_name from wwv_flow_pkg_app_categories x',
'                                                               where x.id = p.app_category_id_1),',
'                                                              ''Sample'',decode(p.app_type,''WS'', m.sample_websheet,',
'                                                                                         ''DB'', m.sample_db_app),',
'                                                            ( select category_name from wwv_flow_pkg_app_categories x',
'                                                               where x.id = p.app_category_id_1)) )||'', ''||',
'                  decode(p.app_category_id_2,null,null,decode(( select category_name from wwv_flow_pkg_app_categories x',
'                                                               where x.id = p.APP_CATEGORY_ID_2),',
'                                                              ''Sample'',decode(p.app_type,''WS'', m.sample_websheet,',
'                                                                                         ''DB'', m.sample_db_app),',
'                                                            ( select category_name from wwv_flow_pkg_app_categories x',
'                                                               where x.id = p.app_category_id_2)))||'', ''||',
'                  decode(p.app_category_id_3,null,null,decode(( select category_name from wwv_flow_pkg_app_categories x',
'                                                               where x.id = p.app_category_id_3),',
'                                                             ''Sample'',decode(p.app_type,''WS'', m.sample_websheet,',
'                                                                                        ''DB'', m.sample_db_app),',
'                                                            ( select category_name from wwv_flow_pkg_app_categories x',
'                                                               where x.id = p.APP_CATEGORY_ID_3))),'', '') category,',
'            --',
'            apex_util.prepare_url( ''f?p=''||:APP_ID||'':81:''||:APP_SESSION||'':::81:P81_ID,P81_APP_TYPE:''||p.app_id||'',''||decode(p.app_type,''WS'',''WEBSHEET'',''DB'',''DATABASE'') ) target_url',
'        from wwv_flow_pkg_applications p, category_name cn,',
'             (select wwv_flow_lang.system_message(''SAMPLE_WEBSHEET'') sample_websheet,',
'                     wwv_flow_lang.system_message(''DEMO.SAMPLE.APP'') sample_db_app',
'              from dual) m',
'        where p.app_status <> ''HIDDEN''',
'        and p.app_id = cn.app_id',
'        and ((:APPS_ONLY_WORKSPACE = ''N'') or',
'             (:APPS_ONLY_WORKSPACE = ''Y'' and cn.category_name != ''Sample''))',
'        order by p.app_name desc;',
'    wwv_flow_json.initialize_output( p_http_header => false );',
'    sys.htp.p(''<script type="text/javascript">'');',
'    sys.htp.p(''var pkg_apps = '');',
'    wwv_flow_json.open_object;',
'    wwv_flow_json.  write(''pkg_apps'', c);',
'    wwv_flow_json.close_object;',
'    sys.htp.p('';'');',
'    sys.htp.p(''</script>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1212073696697771901.4752)
,p_plug_name=>'Galerie d''applications packagées'
,p_region_css_classes=>'a-ButtonRegion--pkgApps'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noBorder:a-ButtonRegion--accessibleTitle:a-Form--autoWidthLabels'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1212073820889771903.4752)
,p_plug_name=>'Conteneur de recherche'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin: 12px;"'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<ul id="applications"></ul>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1212073736306771902.4752)
,p_name=>'P50_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1212073696697771901.4752)
,p_prompt=>'Rechercher'
,p_placeholder=>'rechercher des applications packagées'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'a-Form-field--searchField'
,p_field_template=>wwv_flow_api.id(1212080564184792020.4752)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
prompt --application/pages/page_00081
begin
wwv_flow_api.create_page(
 p_id=>81.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Détails de l''application packagée'
,p_page_mode=>'NORMAL'
,p_step_title=>'Détails de l''application packagée'
,p_step_sub_title=>'Packaged Application Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_icons.css" type="text/css" media="screen" charset="utf-8">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_frame.css" type="text/css" media="screen" charset="utf-8">',
'',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_details.css" type="text/css" media="screen" title="no title" charset="utf-8">',
'',
'<style>',
'span.ebaAppAvailable {',
'    display: inline-block;',
'    font: normal 14px/16px Arial, sans-serif;',
'    margin: 4px 5px 0 0;',
'    color: #f7941d;',
'    }',
'span.ebaAppInstalled {',
'    padding-left: 18px !important;',
'}',
'</style>'))
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'// extend jQuery selectors with a non case sensitive version',
'apex.jQuery.extend($.expr[":"], {',
'  "containsNC": function(pElem, pIdx, pMatch, pArray) {',
'                  return (pElem.textContent || pElem.innerText || "").toLowerCase().indexOf((pMatch[3] || "").toLowerCase()) >= 0;',
'                }',
'});',
'',
'',
'function initInstantFilter(){',
'  var $apps    = apex.jQuery(''#applications''),',
'      $allApps = $apps.clone(),',
'      lTimer;',
'',
'  function filterApplications(){',
'    var $filteredApps = $allApps.find("li:has(h3:containsNC(''"+$v(''p50_SEARCH'')+"''))");',
'    $apps.quicksand($filteredApps, {',
'      adjustHeight: false,',
'      useScaling: false,',
'      duration: 400,',
'      easing: ''easeInOutQuad''',
'    });',
'  };',
'',
'  // set a fixed size for the containing DIV to avoid flickering',
'  $apps.parent().css(''height'', $apps.parent().height() + ''px'').css(''min-width'', $apps.parent().width() + ''px'');',
'',
'  // everytime something is entered in our search field we want to execute the filter,',
'  // but only after a short delay to avoid flickering animations',
'  apex.jQuery(''#p50_SEARCH'')',
'    .keyup(function(pEvent){',
'      if (lTimer != undefined) {',
'        clearTimeout(lTimer);',
'      };',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        filterApplications();',
'      } else {',
'        lTimer = setTimeout(filterApplications, 300);',
'      }',
'    })',
'    .keypress(function(pEvent){',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        pEvent.preventDefault();',
'        pEvent.stopImmediatePropagation();',
'      }',
'    });',
'',
'};',
''))
,p_javascript_code_onload=>'initInstantFilter();'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.ebaAppLocked {',
'  font: 12px/16px "Helvetica Neue",Helvetica,Arial,sans-serif;',
'  color: #080;',
'  display: inline-block;',
'  padding: 0 8px 0 8px;',
'}',
'',
'.ebaAppUnlocked {',
'  font: 12px/16px "Helvetica Neue",Helvetica,Arial,sans-serif;',
'  color: #080;',
'  display: inline-block;',
'  padding: 0 8px 0 8px;',
'}',
'',
'',
'#ebaAppFrameTable {',
'    display: table;',
'    width: 100%;',
'    table-layout: fixed;',
'}',
'div#ebaAppFrameLeft,',
'div#ebaAppFrameRight {',
'    display: table-cell;',
'    padding: 12px;',
'}',
'div#ebaAppFrameRight {',
'    width: 50%;',
'}',
'#ebaAppFrameRight img {',
'    max-width: 100%;',
'}'))
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_deep_linking=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(806262870079109358.4752)
,p_plug_name=>'Packaged Application Details'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_pkg_app_ui.p81_app_detail (',
'    p_app_id       => :app_id,',
'    p_app_session  => :app_session,',
'    p_pkg_app_id   => :P81_ID,',
'    p_app_type     => :P81_APP_TYPE',
'    );'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(777114631304055958.4752)
,p_branch_name=>'redirect to manage ws obj'
,p_branch_action=>'f?p=4350:2020:&SESSION.'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'MANAGE_WS_OBJ'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806263040716109358.4752)
,p_name=>'P81_APP_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(806262870079109358.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806264548412109366.4752)
,p_name=>'P81_APP_CAT'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1494304242587239904.4752)
,p_name=>'P81_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(806262870079109358.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(740920159689190845.4752)
,p_name=>'RENDERING: App Detail Region - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(806262870079109358.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(740920401661190846.4752)
,p_event_id=>wwv_flow_api.id(740920159689190845.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var lSuccessMsg = this.data.APEX_SUCCESS_MESSAGE,',
'      lUrl = ''f?p=&APP_ID.:81:&SESSION.::'',',
'      lVal = this.data[ ''REQUEST'' ]; ',
'',
'if ( lVal === "MANAGE_WS_OBJ") {',
'    lUrl = ''f?p=4350:2000:&SESSION.'';',
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
prompt --application/pages/page_00083
begin
wwv_flow_api.create_page(
 p_id=>83.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Installer l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Installer l''application packagée'
,p_step_sub_title=>'Install Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_icons.css" type="text/css" media="screen" charset="utf-8">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_frame.css" type="text/css" media="screen" charset="utf-8">',
'',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_details.css" type="text/css" media="screen" title="no title" charset="utf-8">',
'',
'<style>',
'span.ebaAppAvailable {',
'    display: inline-block;',
'    font: normal 14px/16px Arial, sans-serif;',
'    margin: 4px 5px 0 0;',
'    color: #f7941d;',
'    }',
'</style>'))
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'// extend jQuery selectors with a non case sensitive version',
'apex.jQuery.extend($.expr[":"], {',
'  "containsNC": function(pElem, pIdx, pMatch, pArray) {',
'                  return (pElem.textContent || pElem.innerText || "").toLowerCase().indexOf((pMatch[3] || "").toLowerCase()) >= 0;',
'                }',
'});',
'',
'',
'function initInstantFilter(){',
'  var $apps    = apex.jQuery(''#applications''),',
'      $allApps = $apps.clone(),',
'      lTimer;',
'',
'  function filterApplications(){',
'    var $filteredApps = $allApps.find("li:has(h3:containsNC(''"+$v(''p50_SEARCH'')+"''))");',
'    $apps.quicksand($filteredApps, {',
'      adjustHeight: false,',
'      useScaling: false,',
'      duration: 400,',
'      easing: ''easeInOutQuad''',
'    });',
'  };',
'',
'  // set a fixed size for the containing DIV to avoid flickering',
'  $apps.parent().css(''height'', $apps.parent().height() + ''px'').css(''min-width'', $apps.parent().width() + ''px'');',
'',
'  // everytime something is entered in our search field we want to execute the filter,',
'  // but only after a short delay to avoid flickering animations',
'  apex.jQuery(''#p50_SEARCH'')',
'    .keyup(function(pEvent){',
'      if (lTimer != undefined) {',
'        clearTimeout(lTimer);',
'      };',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        filterApplications();',
'      } else {',
'        lTimer = setTimeout(filterApplications, 300);',
'      }',
'    })',
'    .keypress(function(pEvent){',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        pEvent.preventDefault();',
'        pEvent.stopImmediatePropagation();',
'      }',
'    });',
'',
'};',
''))
,p_javascript_code_onload=>'initInstantFilter();'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(806250634212071966)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492806582211498053.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_api.id(492807719360498054.4752)
,p_plug_name=>'Objets de feuille Web non valides'
,p_region_template_options=>'#DEFAULT#:a-Alert--defaultIcons:a-Alert--danger:a-Alert--wizard'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(746534672114889110.4752)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_wiz_confirm.create_warning_page (',
'   -- p_title       => wwv_flow_lang.system_message(''INVALID_WS_OBJ''),',
'    p_warning_msg => wwv_flow_lang.system_message(''INVALID_WS_OBJ_WARNING_MSG''));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P83_WS_OBJ_VALID = ''N'' and :P81_APP_TYPE = ''WEBSHEET'''
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492807966046498055.4752)
,p_plug_name=>'App Details Container'
,p_region_name=>'ebaAppFrameTable'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492809197937498056.4752)
,p_plug_name=>'Installer l''application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P83_WS_OBJ_VALID = ''Y'' and :P81_APP_TYPE = ''WEBSHEET'' ) or (:P81_APP_TYPE = ''DATABASE'')'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(755605410130924611.4752)
,p_plug_name=>'navigation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-WizardSteps--slim'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_api.id(755598782624864560.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_global.g_cloud'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492806784251498053.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(492806582211498053.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492806982934498053.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(492806582211498053.4752)
,p_button_name=>'INSTALL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Installer l''application'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'(:P83_WS_OBJ_VALID = ''Y'' and :P81_APP_TYPE = ''WEBSHEET'' ) or (:P81_APP_TYPE = ''DATABASE'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492807171037498054.4752)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(492806582211498053.4752)
,p_button_name=>'MANAGE_WS_OBJ'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Gérer des objets de base de données de feuille Web'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>':P83_WS_OBJ_VALID = ''N'' and :P81_APP_TYPE = ''WEBSHEET'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(404682514053862570)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(773648480184613772.4752)
,p_button_sequence=>5
,p_button_plug_id=>wwv_flow_api.id(492806582211498053.4752)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'Précédent'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:828:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1164738054380456686.4752)
,p_branch_action=>'f?p=&APP_ID.:85:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492807558146498054.4752)
,p_name=>'P83_WS_OBJ_VALID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(492806582211498053.4752)
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
 p_id=>wwv_flow_api.id(492808175757498055.4752)
,p_name=>'P83_APPLICATION_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(492807966046498055.4752)
,p_source=>'P828_APPLICATION_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492808368447498055.4752)
,p_name=>'P83_NEW_APP_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(492807966046498055.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492808536427498055.4752)
,p_name=>'P83_NEW_APP_URL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(492807966046498055.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492808783233498056.4752)
,p_name=>'P83_INSTALLING_APP_MSG'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(492807966046498055.4752)
,p_use_cache_before_default=>'NO'
,p_source=>'wwv_flow_lang.system_message(''WAITING.APP_DEFINITION'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492809321058498056.4752)
,p_name=>'P83_APP_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom d''application :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_name  varchar2(255);',
'begin',
'  if :P81_APP_TYPE = ''DATABASE'' then ',
'    select app_name into l_name from wwv_flow_pkg_applications',
'     where apex_application_id = :P828_APPLICATION_ID;',
'  else',
'      select app_name into l_name from wwv_flow_pkg_applications',
'       where apex_websheet_id = :P828_APPLICATION_ID;',
'  end if;',
'  return l_name;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492809562160498057.4752)
,p_name=>'P83_AUTH'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'APEX'
,p_prompt=>'Authentification :'
,p_source=>'P828_AUTH'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'PACKAGED_APP_AUTH_OPTION'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.''|| name_with_prefix) as d,',
'       name_with_prefix      as r',
'  from wwv_flow_native_plugins',
' where plugin_type = ''AUTHENTICATION TYPE''',
'   and (          name_with_prefix = ''NATIVE_APEX_ACCOUNTS''',
'         or (     name_with_prefix = ''NATIVE_HTTP_HEADER_VARIABLE''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_HHEAD'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_LDAP''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_LDAP'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_IAS_SSO''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_SSO'') = ''Y'' ))',
'union all',
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.NATIVE_CLOUD_IDM''),',
'       ''NATIVE_CLOUD_IDM''',
'  from sys.dual',
' where wwv_flow_authentication_dev.get_internal_authentication = ''CLOUD_IDM'''))
,p_tag_attributes=>'class="fieldtitlebold"'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492809777586498058.4752)
,p_name=>'P83_WORKSPACE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom d''espace de travail :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select DISPLAY_NAME',
'from WWV_FLOW_COMPANIES',
'where PROVISIONING_COMPANY_ID = :flow_security_group_id'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492809901309498058.4752)
,p_name=>'P83_SCHEMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_prompt=>'Schéma :'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492810186398498058.4752)
,p_name=>'P83_PROVIDER_COMPANY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fournisseur :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select provider_company',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and provider_company is not null',
'  '))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492810398893498058.4752)
,p_name=>'P83_PROVIDER_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Courriel du fournisseur :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select provider_email',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and provider_email is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492810514979498059.4752)
,p_name=>'P83_MIN_APEX_VERSION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Version minimale :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select min_apex_version',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and min_apex_version is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492810758910498059.4752)
,p_name=>'P83_RELEASED'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Publié :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select released',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and released is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492810994357498059.4752)
,p_name=>'P83_LANGUAGES'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(492809197937498056.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Langues :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select languages',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and languages is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492811213703498060.4752)
,p_computation_sequence=>20
,p_computation_item=>'P83_WS_OBJ_VALID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if wwv_flow_ws_setup.all_object_valid2 then',
'  return ''Y'';',
'else',
'  return ''N'';',
'end if;'))
,p_compute_when=>'P81_APP_TYPE'
,p_compute_when_text=>'WEBSHEET'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(755607951952004526.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(492806784251498053.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(755608227306004531.4752)
,p_event_id=>wwv_flow_api.id(755607951952004526.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(777115148935082355.4752)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog when Manage WS Obj clicked'
,p_attribute_01=>'REQUEST'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(492807171037498054.4752)
);
end;
/
prompt --application/pages/page_00085
begin
wwv_flow_api.create_page(
 p_id=>85.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Installer l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Installer l''application packagée'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Install Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code_onload=>'window.setTimeout(function() { apex.submit("INSTALL"); }, 100);'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1164691126616397394.4752)
,p_plug_name=>'Installation de l''application...'
,p_region_template_options=>'#DEFAULT#:a-ProcessingRegion--dialog'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1164683681838385745.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1164736283212438414.4752)
,p_branch_name=>'success and APEX auth in Cloud env.'
,p_branch_action=>'f?p=&APP_ID.:209:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from htmldb_collections',
'where collection_name = ''APEX_DEPLOYMENT_LOG_''||:P83_NEW_APP_ID',
'and c002 = ''FAIL'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1164736841004441978.4752)
,p_branch_name=>'failure'
,p_branch_action=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from htmldb_collections',
'where collection_name = ''APEX_DEPLOYMENT_LOG_''||:P83_NEW_APP_ID',
'and c002 = ''FAIL'''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1164736076863434590.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Install Application'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':P83_NEW_APP_ID := wwv_flow_pkg_app_install.install (',
'                       p_app_type          => :P81_APP_TYPE,',
'                       p_app_id            => :P83_APPLICATION_ID,',
'                       p_schema            => :P83_SCHEMA,',
'                       p_auth_scheme       => :P83_AUTH,',
'                       p_auth_attribute_01 => :P828_ATTRIBUTE_01,',
'                       p_auth_attribute_02 => :P828_ATTRIBUTE_02,',
'                       p_auth_attribute_03 => :P828_ATTRIBUTE_03,',
'                       p_auth_attribute_04 => :P828_ATTRIBUTE_04,',
'                       p_auth_attribute_05 => :P828_ATTRIBUTE_05,',
'                       p_auth_attribute_06 => :P828_ATTRIBUTE_06,',
'                       p_auth_attribute_07 => :P828_ATTRIBUTE_07,',
'                       p_auth_attribute_08 => :P828_ATTRIBUTE_08,',
'                       p_auth_attribute_09 => :P828_ATTRIBUTE_09,',
'                       p_auth_attribute_10 => :P828_ATTRIBUTE_10,',
'                       p_auth_attribute_11 => :P828_ATTRIBUTE_11,',
'                       p_auth_attribute_12 => :P828_ATTRIBUTE_12,',
'                       p_auth_attribute_13 => :P828_ATTRIBUTE_13,',
'                       p_auth_attribute_14 => :P828_ATTRIBUTE_14,',
'                       p_auth_attribute_15 => :P828_ATTRIBUTE_15 );'))
,p_process_error_message=>'L''application n''a pas été installée.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application installée.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(973961926573400229.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog if no error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_error_cnt number := 0;',
'begin',
'    select count(*)',
'    into l_error_cnt',
'    from htmldb_collections',
'    where collection_name = ''APEX_DEPLOYMENT_LOG_''||:P83_NEW_APP_ID',
'    and c002 = ''FAIL'';',
'',
'    if l_error_cnt = 0 then',
'        if wwv_flow_global.g_cloud and :P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' then',
'            return false; -- go to 209 to create user',
'        else',
'            return true; -- all done close dialog',
'        end if;',
'    else',
'        return false; -- go view error',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_success_message=>'Application installée.'
);
end;
/
prompt --application/pages/page_00100
begin
wwv_flow_api.create_page(
 p_id=>100.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Demande de service - Identifier la demande'
,p_page_mode=>'NORMAL'
,p_step_title=>'Demande de service - Identifier la demande'
,p_step_sub_title=>'Request Service - Identify Request'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741371098457994312.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(404682514053862570)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_request.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801839146826764574.4752)
,p_plug_name=>'Train'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(805118624066572072.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801839541541764582.4752)
,p_plug_name=>'Identifier une demande'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801839357425764582.4752)
,p_plug_name=>'Utilisation de tablespace'
,p_parent_plug_id=>wwv_flow_api.id(801839541541764582.4752)
,p_region_template_options=>'#DEFAULT#:a-Region--flush:is-collapsed:a-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:a-LinksList--nowrap:a-LinksList--showArrow'
,p_plug_template=>wwv_flow_api.id(805699740467941340.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(805116320497552727.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801840419433764585.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801841243734764587.4752)
,p_plug_name=>'Demander un service'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801840618419764586.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(801840419433764585.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801840884780764586.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(801840419433764585.4752)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--strongLabel:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801842048706764595.4752)
,p_branch_name=>'Go To Page 101'
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.::::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P100_SERVICE'
,p_branch_condition_text=>'STORAGE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801842271287764596.4752)
,p_branch_name=>'Go To Page 102'
,p_branch_action=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.::::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P100_SERVICE'
,p_branch_condition_text=>'TERMINATION'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801842633404764597.4752)
,p_branch_name=>'Go To Page 104'
,p_branch_action=>'104'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801839703900764582.4752)
,p_name=>'P100_SERVICE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(801839541541764582.4752)
,p_item_default=>'STORAGE'
,p_prompt=>'Indiquez le type de service à demander :'
,p_source=>'STORAGE'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'REQEUEST SERVICE'
,p_lov=>'.'||wwv_flow_api.id(801842749107764598)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376417814001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'Sélectionnez une demande de modification de service et cliquez sur <b>Suivant</b>.'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
,p_attribute_04=>'VERTICAL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801841802306764590.4752)
,p_validation_name=>'Validate storage request size'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null ',
'  from wwv_flow_workspace_req_size',
' where request_type = ''C''',
'   and display = ''Y''',
'   and req_size = :P100_STORAGE'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Quantité d''espace de stockage non valide exigée.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(168276114972961093.4752)
,p_associated_item=>wwv_flow_api.id(.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Demander de l''espace de stockage supplémentaire - Définir la demande'
,p_page_mode=>'NORMAL'
,p_step_title=>'Demander de l''espace de stockage supplémentaire - Définir la demande'
,p_step_sub_title=>'Request Storage - Define Request'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741371098457994312.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(404682514053862570)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_request.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805258536099937778.4752)
,p_plug_name=>'Train'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805131422007607886.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(805118624066572072.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805258798079937778.4752)
,p_name=>'Demander de l''espace de stockage supplémentaire'
,p_template=>wwv_flow_api.id(740771588500180474.4752)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-Report--stretch'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select owner schemas, tablespace_name tablespaces',
'  from sys.dba_segments',
' where owner in (select schema',
'                   from wwv_flow_company_schemas',
'                  where security_group_id = wwv_flow.get_sgid)',
'group by owner, tablespace_name'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'1'
,p_query_row_count_max=>5000
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805258905056937779.4752)
,p_query_column_id=>1
,p_column_alias=>'SCHEMAS'
,p_column_display_sequence=>1
,p_column_heading=>'Schémas'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805259030210937779.4752)
,p_query_column_id=>2
,p_column_alias=>'TABLESPACES'
,p_column_display_sequence=>2
,p_column_heading=>'Tablespaces'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805258369325937778.4752)
,p_plug_name=>'Utilisation de tablespace'
,p_parent_plug_id=>wwv_flow_api.id(805258798079937778.4752)
,p_region_template_options=>'#DEFAULT#:a-Region--flush:is-collapsed:a-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:a-LinksList--nowrap:a-LinksList--showArrow'
,p_plug_template=>wwv_flow_api.id(805699740467941340.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(805116320497552727.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805259837740937783.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805260603804937785.4752)
,p_plug_name=>'Demander de l''espace de stockage supplémentaire'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
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
 p_id=>wwv_flow_api.id(805260069728937783.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805259837740937783.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805260294188937784.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(805259837740937783.4752)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--strongLabel:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805260494925937785.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805259837740937783.4752)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'Précédent'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.::::'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805261149037937786.4752)
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(805260294188937784.4752)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805259164510937779.4752)
,p_name=>'P101_STORAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(805258798079937778.4752)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_default number;',
'begin',
'    for c1 in (select req_size',
'                 from wwv_flow_workspace_req_size',
'                where request_type = ''C''',
'                  and default_size = ''Y'') loop',
'        l_default := c1.req_size;',
'        exit;',
'    end loop;',
'    return l_default;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Quantité d''espace de stockage à ajouter (Mo) :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select req_size d, req_size r',
'  from wwv_flow_workspace_req_size',
' where request_type = ''C''',
'   and display = ''Y''',
' order by to_number(d)'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Indiquez la quantité d''espace à ajouter.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805260932553937785.4752)
,p_validation_name=>'Validate storage request size'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null ',
'  from wwv_flow_workspace_req_size',
' where request_type = ''C''',
'   and display = ''Y''',
'   and req_size = :P101_STORAGE'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Quantité d''espace de stockage non valide exigée.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805260294188937784.4752)
,p_associated_item=>wwv_flow_api.id(805259164510937779.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Demande d''interruption de service - Définir la demande'
,p_page_mode=>'NORMAL'
,p_step_title=>'Demande d''interruption de service - Définir la demande'
,p_step_sub_title=>'Request Service Termination - Define Request'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741371098457994312.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_request.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805272606936000230.4752)
,p_name=>'Applications packagées'
,p_template=>wwv_flow_api.id(662132465401686364.4752)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.app_name as name',
'from wwv_flows f,',
'    wwv_flow_pkg_app_map m,',
'    wwv_flow_pkg_applications a',
'where f.id = m.installed_app_id',
'    and f.security_group_id = m.security_group_id',
'    and m.app_id = a.apex_application_id',
'    and f.security_group_id = :flow_security_group_id',
'order by upper(a.app_name)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flows f,',
'    wwv_flow_pkg_app_map m,',
'    wwv_flow_pkg_applications a',
'where f.id = m.installed_app_id',
'    and f.security_group_id = m.security_group_id',
'    and m.app_id = a.apex_application_id',
'    and f.security_group_id = :flow_security_group_id'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805272814245000231.4752)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805272990153000231.4752)
,p_name=>'Applications de base de données'
,p_template=>wwv_flow_api.id(662132465401686364.4752)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-Report--stretch'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select f.id || ''. '' || f.name as name',
'from wwv_flow_visible_flows f',
'where f.build_status != ''RUN_AND_HIDDEN''',
'order by f.id',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_visible_flows f',
'where f.build_status != ''RUN_AND_HIDDEN'''))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'Aucune application de base de données n''a été trouvée.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805273143153000231.4752)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805273272750000232.4752)
,p_name=>'Applications Web'
,p_template=>wwv_flow_api.id(662132465401686364.4752)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ws.name',
'from wwv_flow_ws_applications ws',
'where ws.security_group_id = :flow_security_group_id',
'order by ws.name'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_ws_applications ws',
'where ws.security_group_id = :flow_security_group_id'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'Aucune application de feuille Web n''a été trouvée.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805273439749000232.4752)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805273581162000232.4752)
,p_name=>'Interruption de service d''espace de travail'
,p_template=>wwv_flow_api.id(740771588500180474.4752)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ',
'   "WWV_FLOW_COMPANIES"."PROVISIONING_COMPANY_ID" "PROVISIONING_COMPANY_ID", ',
'   "WWV_FLOW_COMPANIES"."SHORT_NAME" "SHORT_NAME", ',
'   "WWV_FLOW_COMPANIES"."FIRST_SCHEMA_PROVISIONED" "FIRST_SCHEMA_PROVISIONED"',
'FROM ',
'   "WWV_FLOW_COMPANIES"',
'WHERE (("WWV_FLOW_COMPANIES"."PROVISIONING_COMPANY_ID" =wwv_flow.get_sgid))'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary=""><tr><td valign="top"><img src="#IMAGE_PREFIX#menu/wiz_terminate_service_140x90.png" border="0" width="140" height="90" alt="&PRODUCT_NAME." /></td><td valign="top">',
'<p>Les administrateurs d''espace de travail utilisent cette page pour demander la fin du service.</p>'))
,p_footer=>'</td></tr></table><p />'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>2
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805273769889000233.4752)
,p_query_column_id=>1
,p_column_alias=>'PROVISIONING_COMPANY_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Workspace'
,p_column_alignment=>'RIGHT'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805273860118000233.4752)
,p_query_column_id=>2
,p_column_alias=>'SHORT_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Nom de l''espace de travail'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805273906981000233.4752)
,p_query_column_id=>3
,p_column_alias=>'FIRST_SCHEMA_PROVISIONED'
,p_column_display_sequence=>3
,p_column_heading=>'Premier schéma paramétré'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805274073022000233.4752)
,p_name=>'Schémas'
,p_template=>wwv_flow_api.id(662132465401686364.4752)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.schema, u.default_tablespace name2',
'  from wwv_flow_company_schemas a, ',
'       sys.dba_users u',
' where a.schema = u.username',
'   and a.security_group_id = wwv_flow.get_sgid',
'order by 1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805274240952000233.4752)
,p_query_column_id=>1
,p_column_alias=>'SCHEMA'
,p_column_display_sequence=>1
,p_column_heading=>'Schéma'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805274359482000233.4752)
,p_query_column_id=>2
,p_column_alias=>'NAME2'
,p_column_display_sequence=>2
,p_column_heading=>'Tablespace par défaut'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805274418118000233.4752)
,p_name=>'Développeurs d''application'
,p_template=>wwv_flow_api.id(662132465401686364.4752)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select userid as the_name',
'from WWV_FLOW_DEVELOPERS',
'where SECURITY_GROUP_ID = :flow_security_group_id',
'order by userid'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from WWV_FLOW_DEVELOPERS',
'where SECURITY_GROUP_ID = :flow_security_group_id'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'aucune donnée n''a été trouvée'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805274700563000235.4752)
,p_query_column_id=>1
,p_column_alias=>'THE_NAME'
,p_column_display_sequence=>1
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805274820294000235.4752)
,p_query_column_id=>2
,p_column_alias=>'THE_NAME'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805274974032000236.4752)
,p_plug_name=>'Train'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805131422007607886.4752)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(805118624066572072.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805275199714000236.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805275910850000237.4752)
,p_plug_name=>'Demande d''interruption de service'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
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
 p_id=>wwv_flow_api.id(805275772762000236.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805275199714000236.4752)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'Précédent'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805275386587000236.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805275199714000236.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805275530546000236.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(805275199714000236.4752)
,p_button_name=>'REQUEST_SERVICE_TERMINATION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--strongLabel:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805276231252000237.4752)
,p_branch_name=>'Go To Page 105'
,p_branch_action=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.::::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(805275530546000236.4752)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805276412217000237.4752)
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(805275772762000236.4752)
,p_branch_sequence=>20
);
end;
/
prompt --application/pages/page_00103
begin
wwv_flow_api.create_page(
 p_id=>103.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Etat détaillé Utilisation de tablespace'
,p_page_mode=>'MODAL'
,p_step_title=>'Etat détaillé Utilisation de tablespace'
,p_step_sub_title=>'Detailed Tablespace Utilization Report'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741365982136994250.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'300'
,p_dialog_width=>'500'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_request.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(722741717956798645.4752)
,p_plug_name=>'Boutons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(805141851656673659.4752)
,p_name=>'Utilisation de tablespace'
,p_template=>wwv_flow_api.id(404667570222803088.4752)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-Report--noBorders:a-Report--stretch'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'with workspace_tablespace as',
'    ( select distinct default_tablespace',
'        from sys.dba_users',
'       where username in ',
'             (select schema',
'                from wwv_flow_company_schemas',
'               where security_group_id = (select wwv_flow.get_sgid from dual where rownum = 1))',
'    ),',
'ddf as',
'    ( select file_id, tablespace_name, file_name,',
'             decode (autoextensible,',
'                     ''YES'', greatest (bytes, maxbytes), bytes) df_size,',
'             decode (autoextensible,',
'                     ''YES'', case',
'                         when (maxbytes > bytes)',
'                            then (maxbytes - bytes)',
'                         else 0',
'                      end,',
'                      0',
'                     ) growth',
'         from sys.dba_data_files',
'        where tablespace_name in (',
'              select default_tablespace',
'                from sys.dba_users',
'               where username in ',
'                     (select schema',
'                        from wwv_flow_company_schemas',
'                       where security_group_id = (select wwv_flow.get_sgid from dual where rownum = 1))))',
'select /* APEX4350P4651a */ ddf.tablespace_name name,',
'         round (sum (ddf.df_size)) bytes,',
'         round ((sum (nvl (freebytes, 0)) + sum (growth)) ) free,',
'         round (sum (ddf.df_size)) - round ((sum (nvl (freebytes, 0)) + sum (growth))) used,',
'         100 - round ((sum (nvl (freebytes, 0)) + sum (growth))/ sum (ddf.df_size)* 100,2) pct_used',
'  from ddf, (select d.file_id, sum (d.bytes) freebytes',
'                      from sys.dba_free_space d, workspace_tablespace',
'                     where d.tablespace_name = workspace_tablespace.default_tablespace',
'                  group by file_id) dfs',
' where ddf.file_id = dfs.file_id(+)',
' group by ddf.tablespace_name'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>15
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
,p_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select /* APEX4350P4651a */ name, bytes, bytes-free used, free, (bytes-free)/bytes*100 pct_used from',
'(select t.tablespace_name name,',
'       ( select sum(user_blocks * t.block_size)',
'             from sys.dba_data_files',
'            where tablespace_name = t.tablespace_name ) bytes,',
'       ( select sum(bytes)',
'             from sys.dba_free_space',
'            where tablespace_name = t.tablespace_name ) free ',
'   from sys.dba_tablespaces t',
'  where tablespace_name in (select default_tablespace',
'           from sys.dba_users where username in (select schema from wwv_flow_company_schemas',
'           where security_group_id= (select wwv_flow.get_sgid ',
'                                       from dual ',
'                                      where rownum = 1))))',
'  order by 1  '))
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805142091523673660.4752)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Nom de tablespace'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805142126725673660.4752)
,p_query_column_id=>2
,p_column_alias=>'BYTES'
,p_column_display_sequence=>2
,p_column_heading=>'Octets'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805142207100673660.4752)
,p_query_column_id=>3
,p_column_alias=>'FREE'
,p_column_display_sequence=>4
,p_column_heading=>'Quantité libre'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805142365645673660.4752)
,p_query_column_id=>4
,p_column_alias=>'USED'
,p_column_display_sequence=>3
,p_column_heading=>'Quantité utilisée'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805142477549673660.4752)
,p_query_column_id=>5
,p_column_alias=>'PCT_USED'
,p_column_display_sequence=>5
,p_column_heading=>'Pourcentage utilisé'
,p_use_as_row_header=>'N'
,p_column_format=>'999D99'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(722741894574798646.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(722741717956798645.4752)
,p_button_name=>'Cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(722741938879798647.4752)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00104
begin
wwv_flow_api.create_page(
 p_id=>104.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Demander de l''espace de stockage supplémentaire - Confirmer'
,p_page_mode=>'NORMAL'
,p_step_title=>'Demander de l''espace de stockage supplémentaire - Confirmer'
,p_step_sub_title=>'Request Storage - Confirm'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741371098457994312.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(404682514053862570)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_request.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805365003320561422.4752)
,p_plug_name=>'Train'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805131422007607886.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(805118624066572072.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805365463411561424.4752)
,p_plug_name=>'Demander de l''espace de stockage supplémentaire'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'Confirmez votre demande.</p>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805365201908561424.4752)
,p_plug_name=>'Utilisation de tablespace'
,p_parent_plug_id=>wwv_flow_api.id(805365463411561424.4752)
,p_region_template_options=>'#DEFAULT#:a-Region--flush:is-collapsed:a-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:a-LinksList--nowrap:a-LinksList--showArrow'
,p_plug_template=>wwv_flow_api.id(805699740467941340.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(805116320497552727.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805366320719561427.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805367101650561428.4752)
,p_plug_name=>'Demander de l''espace de stockage supplémentaire'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
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
 p_id=>wwv_flow_api.id(805366969714561428.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805366320719561427.4752)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'Précédent'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.::::'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805366500519561427.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805366320719561427.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805366770901561427.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(805366320719561427.4752)
,p_button_name=>'ADJUST_STORAGE_SIZE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Demander de l''espace de stockage supplémentaire'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805367883498561432.4752)
,p_branch_action=>'6'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805365673184561424.4752)
,p_name=>'P104_STORAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(805365463411561424.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_default number;',
'begin',
'    for c1 in (select req_size',
'                 from wwv_flow_workspace_req_size',
'                where request_type = ''C''',
'                  and default_size = ''Y'') loop',
'        l_default := c1.req_size;',
'        exit;',
'    end loop;',
'    return l_default;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Quantité d''espace de stockage à ajouter (Mo) :'
,p_source=>'&P101_STORAGE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez la quantité d''espace qui sera nécessaire.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805367465527561428.4752)
,p_validation_name=>'Validate storage request size'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null ',
'  from wwv_flow_workspace_req_size',
' where request_type = ''C''',
'   and display = ''Y''',
'   and req_size = :P101_STORAGE'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Quantité d''espace de stockage non valide exigée.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805366770901561427.4752)
,p_associated_item=>wwv_flow_api.id(805365673184561424.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805367558322561428.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'request change of size'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_changesize  number := :P101_STORAGE;',
'begin',
'  wwv_flow_provisioning.make_modification_request (',
'      p_service_name        => ''CHANGE_DB_SIZE'',',
'      p_service_attribute_1 => l_changesize,',
'      p_service_attribute_2 => wwv_flow_user_api.get_email(p_username => upper(wwv_flow.g_user)));',
'end;'))
,p_process_error_message=>'Erreur lors de la demande de stockage supplémentaire.'
,p_process_when_button_id=>wwv_flow_api.id(805366770901561427.4752)
,p_process_success_message=>'Vous avez demandé &P101_STORAGE. Mo de stockage supplémentaire.'
,p_security_scheme=>wwv_flow_api.id(805427695742857816)
);
end;
/
prompt --application/pages/page_00105
begin
wwv_flow_api.create_page(
 p_id=>105.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Fourniture d''infos de paramétrage : demande d''interruption de service'
,p_page_mode=>'NORMAL'
,p_step_title=>'Fourniture d''infos de paramétrage : demande d''interruption de service'
,p_step_sub_title=>'Provisioning: Request Service Termination'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(741371098457994312.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'AEADM/aadm_request.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805379747924646516.4752)
,p_plug_name=>'Confirmer l''interruption de service'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Cette page permet à l''administrateur d''un espace de travail de demander l''interruption du service auquel il est actuellement connecté.<br/><br/>',
'',
'<b>IMPORTANT</b> : lors de l''interruption du service, les données, les objets de base de données, les schémas de base de données, les tablespaces, les applications, les scripts, les fichiers, etc. vont tous être enlevés.</p>',
'',
'<p>Confirmez l''interruption du service.</p>'))
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805380179815646516.4752)
,p_plug_name=>'Train'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805131422007607886.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(805118624066572072.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805380363605646517.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805380918641646517.4752)
,p_plug_name=>'Demande d''interruption de service'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'DEFAULT'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
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
 p_id=>wwv_flow_api.id(805380532647646517.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805380363605646517.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805380789015646517.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805380363605646517.4752)
,p_button_name=>'TERMINATE_SERVICE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Interrompre un service'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805381622541646518.4752)
,p_branch_action=>'6'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(805380789015646517.4752)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805381240615646518.4752)
,p_validation_name=>'terminate service request exists'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'  from WWV_FLOW_PROVISION_SERICE_MOD',
' where request_status = ''REQUESTED''',
'   and service_name = ''REMOVE_EXISTING_SERVICE''',
'   and SECURITY_GROUP_ID = :flow_security_group_id'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Une demande d''interruption de service existe déjà pour cet espace de travail.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805380789015646517.4752)
,p_associated_item=>wwv_flow_api.id(.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805381315107646518.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'terminate service'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  wwv_flow_provisioning.make_modification_request(',
'    p_security_group_id    => :flow_security_group_id,',
'    p_service_name         => ''REMOVE_EXISTING_SERVICE'',',
'    p_service_attribute_2  => wwv_flow_user_api.get_email(p_username => upper(wwv_flow.g_user)));',
'end;'))
,p_process_error_message=>'Erreur lors de la soumission de la demande d''interruption de service.'
,p_process_when_button_id=>wwv_flow_api.id(805380789015646517.4752)
,p_process_success_message=>'Demande d''interruption de service soumise.'
);
end;
/
prompt --application/pages/page_00209
begin
wwv_flow_api.create_page(
 p_id=>209.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Configuration de compte Application Express'
,p_page_mode=>'MODAL'
,p_step_title=>'Configuration de compte Application Express'
,p_step_sub_title=>'Packaged Application Installed'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_icons.css" type="text/css" media="screen" charset="utf-8">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_frame.css" type="text/css" media="screen" charset="utf-8">',
'',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_details.css" type="text/css" media="screen" title="no title" charset="utf-8">',
'',
'<style>',
'span.ebaAppAvailable {',
'    display: inline-block;',
'    font: normal 14px/16px Arial, sans-serif;',
'    margin: 4px 5px 0 0;',
'    color: #f7941d;',
'    }',
'</style>'))
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'// extend jQuery selectors with a non case sensitive version',
'apex.jQuery.extend($.expr[":"], {',
'  "containsNC": function(pElem, pIdx, pMatch, pArray) {',
'                  return (pElem.textContent || pElem.innerText || "").toLowerCase().indexOf((pMatch[3] || "").toLowerCase()) >= 0;',
'                }',
'});',
'',
'',
'function initInstantFilter(){',
'  var $apps    = apex.jQuery(''#applications''),',
'      $allApps = $apps.clone(),',
'      lTimer;',
'',
'  function filterApplications(){',
'    var $filteredApps = $allApps.find("li:has(h3:containsNC(''"+$v(''p50_SEARCH'')+"''))");',
'    $apps.quicksand($filteredApps, {',
'      adjustHeight: false,',
'      useScaling: false,',
'      duration: 400,',
'      easing: ''easeInOutQuad''',
'    });',
'  };',
'',
'  // set a fixed size for the containing DIV to avoid flickering',
'  $apps.parent().css(''height'', $apps.parent().height() + ''px'').css(''min-width'', $apps.parent().width() + ''px'');',
'',
'  // everytime something is entered in our search field we want to execute the filter,',
'  // but only after a short delay to avoid flickering animations',
'  apex.jQuery(''#p50_SEARCH'')',
'    .keyup(function(pEvent){',
'      if (lTimer != undefined) {',
'        clearTimeout(lTimer);',
'      };',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        filterApplications();',
'      } else {',
'        lTimer = setTimeout(filterApplications, 300);',
'      }',
'    })',
'    .keypress(function(pEvent){',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        pEvent.preventDefault();',
'        pEvent.stopImmediatePropagation();',
'      }',
'    });',
'',
'};',
''))
,p_javascript_code_onload=>'initInstantFilter();'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_required_role=>wwv_flow_api.id(806250634212071966)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492818829813527218.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>45
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_api.id(492819635063527220.4752)
,p_plug_name=>'Configurer un compte'
,p_region_template_options=>'#DEFAULT#:a-Alert--defaultIcons:a-Alert--warning:a-Alert--horizontal'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(746534672114889110.4752)
,p_plug_display_sequence=>35
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(770118466855390796.4752)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(492818829813527218.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492819215638527220.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(492818829813527218.4752)
,p_button_name=>'CREATE_USER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer un utilisateur'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>':P83_AUTH = ''NATIVE_APEX_ACCOUNTS'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492819882805527221.4752)
,p_name=>'P209_APP_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Nom d''application :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492820018143527222.4752)
,p_name=>'P209_WORKSPACE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Nom d''espace de travail :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492820296100527225.4752)
,p_name=>'P209_SCHEMA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492820409273527225.4752)
,p_name=>'P209_METHOD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_item_default=>'E'
,p_prompt=>'Administrateur'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'WS_APP_ADMIN_USER_METHOD'
,p_lov=>'.'||wwv_flow_api.id(492828601280527238)||'.'
,p_display_when=>':P81_APP_TYPE = ''WEBSHEET'' and :P828_AUTH = ''NATIVE_APEX_ACCOUNTS'' and wwv_flow_global.g_cloud'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492820697304527226.4752)
,p_name=>'P209_CREATE_USER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_source=>'Y'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'PKG_APP_NEW_USER'
,p_lov=>'.'||wwv_flow_api.id(492829835934527241)||'.'
,p_display_when=>':P81_APP_TYPE = ''DATABASE'' and :P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and wwv_flow_global.g_cloud'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492820844713527226.4752)
,p_name=>'P209_EXISTING_USER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Nom utilisateur existant'
,p_source=>'APP_USER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APEX END USERS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select user_name d, user_name r',
'from wwv_flow_fnd_user u',
'where security_group_id = :flow_security_group_id',
'and not exists (select null',
'                from wwv_flow_developers d',
'                where d.security_group_id = u.security_group_id',
'                and d.userid            = u.user_name',
'                and (instr(d.developer_role,''ADMIN'') > 0',
'                     or instr(d.developer_role,''EDIT'') > 0))',
'and nvl(u.account_locked,''N'') = ''N''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Sélectionner un utilisateur -'
,p_cHeight=>1
,p_display_when=>':P81_APP_TYPE = ''WEBSHEET'' and :P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and wwv_flow_global.g_cloud'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492821075748527226.4752)
,p_name=>'P209_USERNAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Nom utilisateur'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>':P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and wwv_flow_global.g_cloud'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Indiquez le nom utilisateur employé pour la connexion à l''application packagée. Les noms utilisateur sont soumis aux restrictions suivantes : <ul><li>',
'Longueur maximale : 100 caractères</li><li>',
'Pas d''espaces</li>',
'<li>Caractères spéciaux autorisés : @ et point (.)</li></ul>',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492821585156527227.4752)
,p_name=>'P209_PASSWORD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>':P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and wwv_flow_global.g_cloud'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez un mot de passe. Les mots de passe respectent les majuscules/minuscules.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492822027856527228.4752)
,p_name=>'P209_CONFIRM_PASSWORD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Confirmer le mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>':P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and wwv_flow_global.g_cloud'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Entrez de nouveau le mot de passe.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492822594676527228.4752)
,p_name=>'P209_EMAIL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Adresse électronique'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>':P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and wwv_flow_global.g_cloud'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez l''adresse électronique à utiliser dans la correspondance générale, les notifications de réinitialisation des mots de passe, etc.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(656958442251052404.4752)
,p_name=>'P209_WARNING_MSG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(492819635063527220.4752)
,p_prompt=>'Message d''avertissement'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P81_APP_TYPE = ''DATABASE'' then',
'    return wwv_flow_lang.system_message(''F4750.P209.DB_APP_USER_SETUP'');',
'elsif :P81_APP_TYPE = ''WEBSHEET'' then',
'    return wwv_flow_lang.system_message(''F4750.P209.WEBSHEET_ADMIN_SETUP'');',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(750871254241940005.4752)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--stretch:a-Form-fieldContainer--autoLabelWidth'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(777061579764817791.4752)
,p_computation_sequence=>10
,p_computation_item=>'P209_CREATE_USER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'Y'
,p_compute_when=>'P209_METHOD'
,p_compute_when_text=>'N'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492823118333527228.4752)
,p_computation_sequence=>10
,p_computation_item=>'P209_SCHEMA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select FIRST_SCHEMA_PROVISIONED',
'from WWV_FLOW_COMPANIES',
'where PROVISIONING_COMPANY_ID = :flow_security_group_id'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492823384065527229.4752)
,p_computation_sequence=>10
,p_computation_item=>'P209_APP_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select app_name from wwv_flow_pkg_applications',
'where app_id = :P828_APPLICATION_ID'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492823728079527229.4752)
,p_computation_sequence=>12
,p_computation_item=>'P209_WORKSPACE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select DISPLAY_NAME',
'from WWV_FLOW_COMPANIES',
'where PROVISIONING_COMPANY_ID = :flow_security_group_id'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492823955896527229.4752)
,p_validation_name=>'P209_USERNAME not null'
,p_validation_sequence=>10
,p_validation=>'P209_USERNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# doit comporter une valeur.'
,p_always_execute=>'N'
,p_validation_condition=>'P209_CREATE_USER'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(492821075748527226.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492824175298527231.4752)
,p_validation_name=>'P209_EMAIL not null'
,p_validation_sequence=>20
,p_validation=>'P209_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# doit comporter une valeur.'
,p_always_execute=>'N'
,p_validation_condition=>'P209_CREATE_USER'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(492822594676527228.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492824349197527231.4752)
,p_validation_name=>'validate email'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_at  number;',
'    l_dot number;',
'begin',
'    l_at   := instr(nvl(:P209_EMAIL,''x''),''@'');',
'    l_dot  := instr(nvl(:P209_EMAIL,''x''),''.'',l_at);',
'    return l_at > 1 and l_dot > 1 and (l_dot - l_at) > 1;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Adresse électronique non valide.'
,p_always_execute=>'N'
,p_validation_condition=>':P209_CREATE_USER=''Y'' and :P209_EMAIL is not null'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(492822594676527228.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492824530875527231.4752)
,p_validation_name=>'P209_PASSWORD not null'
,p_validation_sequence=>40
,p_validation=>'P209_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# doit comporter une valeur.'
,p_always_execute=>'N'
,p_validation_condition=>'P209_CREATE_USER'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(492821585156527227.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492824717510527231.4752)
,p_validation_name=>'P209_CONFIRM_PASSWORD not null'
,p_validation_sequence=>50
,p_validation=>'P209_CONFIRM_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# doit comporter une valeur.'
,p_always_execute=>'N'
,p_validation_condition=>'P209_CREATE_USER'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(492822027856527228.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492824939547527231.4752)
,p_validation_name=>'new passwd = confirm passwd'
,p_validation_sequence=>60
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P209_PASSWORD != :P209_CONFIRM_PASSWORD then',
'    :P209_PASSWORD := null;',
'    :P209_CONFIRM_PASSWORD := null;',
'    return false;',
'else',
'    return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'La confirmation du mot de passe et le mot de passe saisi ne sont pas identiques.'
,p_always_execute=>'N'
,p_validation_condition=>'P209_CREATE_USER'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(492819215638527220.4752)
,p_associated_item=>wwv_flow_api.id(.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492825193741527232.4752)
,p_validation_name=>'strong password'
,p_validation_sequence=>65
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'return wwv_flow_security.strong_password_validation(',
'      p_username         => :P209_USERNAME,',
'      p_password         => :P209_PASSWORD,',
'      p_old_password     => null,',
'      p_workspace_name   => :P209_WORKSPACE_NAME);'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'Erreur'
,p_always_execute=>'N'
,p_validation_condition=>'P209_CREATE_USER'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(492819215638527220.4752)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492825374747527232.4752)
,p_validation_name=>'P209_USERNAME exists already'
,p_validation_sequence=>70
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P209_USERNAME is not null then',
'  for c1 in (select null',
'             from wwv_flow_fnd_user u',
'             where security_group_id = :flow_security_group_id',
'             and nvl(u.account_locked,''N'') = ''N''',
'             and u.user_name = upper(:P209_USERNAME))',
'  loop',
'    return false;',
'  end loop;',
'end if;',
'return true;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Le nom utilisateur existe déjà.'
,p_always_execute=>'N'
,p_validation_condition=>'P209_CREATE_USER'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(492821075748527226.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(492825541202527232.4752)
,p_validation_name=>'P209_EXISTING_USER Should Not Be Null'
,p_validation_sequence=>80
,p_validation=>'P209_EXISTING_USER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'S''il n''y a pas d''utilisateur existant, vous devez créer un utilisateur.'
,p_always_execute=>'N'
,p_validation_condition=>':P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and :P81_APP_TYPE = ''WEBSHEET'' and :P209_EXISTING_USER is null and :P209_METHOD = ''E'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(492819215638527220.4752)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(492820844713527226.4752)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(492826451491527234.4752)
,p_name=>'Display Create User Items for DB App on Cloud'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P209_CREATE_USER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(492826790590527234.4752)
,p_event_id=>wwv_flow_api.id(492826451491527234.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P209_USERNAME,P209_PASSWORD,P209_CONFIRM_PASSWORD,P209_EMAIL'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(492826968456527234.4752)
,p_event_id=>wwv_flow_api.id(492826451491527234.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P209_EXISTING_USER'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(492827153196527234.4752)
,p_event_id=>wwv_flow_api.id(492826451491527234.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P209_USERNAME,P209_PASSWORD,P209_CONFIRM_PASSWORD,P209_EMAIL,P209_EXISTING_USER'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(492827265876527234.4752)
,p_name=>'Display Admin User Items for WS App on Cloud'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P209_METHOD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(492827513295527235.4752)
,p_event_id=>wwv_flow_api.id(492827265876527234.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P209_USERNAME,P209_EMAIL,P209_PASSWORD,P209_CONFIRM_PASSWORD'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(492827728196527235.4752)
,p_event_id=>wwv_flow_api.id(492827265876527234.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P209_USERNAME,P209_EMAIL,P209_PASSWORD,P209_CONFIRM_PASSWORD'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(492827960709527235.4752)
,p_event_id=>wwv_flow_api.id(492827265876527234.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P209_EXISTING_USER'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(492828182378527235.4752)
,p_event_id=>wwv_flow_api.id(492827265876527234.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P209_EXISTING_USER'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(770119774478414886.4752)
,p_name=>'Close Dialog'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(770118466855390796.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(770120016874414887.4752)
,p_event_id=>wwv_flow_api.id(770119774478414886.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(492825632290527232.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create User'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'',
'    if :P209_CREATE_USER = ''Y'' then',
'        wwv_flow_pkg_app_install.create_user(',
'            p_username => :P209_USERNAME,',
'            p_email    => :P209_EMAIL,',
'            p_password => :P209_PASSWORD);',
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(492819215638527220.4752)
,p_process_when=>'wwv_flow_global.g_cloud and :P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and :P81_APP_TYPE = ''DATABASE'''
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(492825893428527233.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'define websheet acl'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_username varchar2(4000) := null;',
'begin',
'  if :P209_METHOD = ''N'' then',
'    l_username := :P209_USERNAME;',
'  elsif :P209_METHOD = ''E'' then',
'    l_username := :P209_EXISTING_USER;',
'  end if;',
'',
'  wwv_flow_ws_api.create_acl_user (',
'    p_ws_app_id     => :P83_APPLICATION_ID,',
'    p_method        => :P209_METHOD,',
'    p_username      => l_username,',
'    p_email         => :P209_EMAIL,',
'    p_password      => :P209_PASSWORD',
'    ); ',
'end;'))
,p_process_error_message=>'Impossible de définir l''administrateur de feuille Web.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(492819215638527220.4752)
,p_process_when=>'wwv_flow_global.g_cloud and :P83_AUTH = ''NATIVE_APEX_ACCOUNTS'' and :P81_APP_TYPE = ''WEBSHEET'''
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(770120150142419290.4752)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(492819215638527220.4752)
,p_process_success_message=>'Compte configuré pour exécuter l''application.'
);
end;
/
prompt --application/pages/page_00210
begin
wwv_flow_api.create_page(
 p_id=>210.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Installer l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Installer l''application packagée'
,p_step_sub_title=>'Packaged Application Install Failed'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'deploy_pa_install_obj.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(656909453831982642.4752)
,p_plug_name=>'Erreur'
,p_region_template_options=>'#DEFAULT#:a-Alert--defaultIcons:a-Alert--warning:a-Alert--wizard'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(746534672114889110.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'L''application packagée est installée. Cependant, l''installation des objets de base de données et des données prédéfinies a échoué.'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(656998326917093004.4752)
,p_name=>'Récapitulatif de l''installation'
,p_parent_plug_id=>wwv_flow_api.id(656909453831982642.4752)
,p_template=>wwv_flow_api.id(662132465401686364.4752)
,p_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:a-Report--stretch'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select c001 script_name, ',
'       decode(c002, ''SUCCESS'', ',
'                    wwv_flow_lang.system_message(''INSTALLER.SCRIPT.SUCCESS''),',
'                    ''FAIL'',',
'                    wwv_flow_lang.system_message(''INSTALLER.SCRIPT.FAIL'')) status,        ',
'       to_number(nvl(c003,0)) fail_count,',
'       to_number(nvl(c004,0)) success_count,',
'       c003 + c004 total_count',
'  from htmldb_collections',
' where collection_name = ''APEX_DEPLOYMENT_LOG_''||:P83_NEW_APP_ID'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'Aucun résultat d''installation n''a été trouvé.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(656998676759093019.4752)
,p_query_column_id=>1
,p_column_alias=>'SCRIPT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Nom de script'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(656998741553093019.4752)
,p_query_column_id=>2
,p_column_alias=>'STATUS'
,p_column_display_sequence=>2
,p_column_heading=>'Statut'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(656998866154093019.4752)
,p_query_column_id=>3
,p_column_alias=>'FAIL_COUNT'
,p_column_display_sequence=>4
,p_column_heading=>'Instructions avec erreurs'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(656998981674093019.4752)
,p_query_column_id=>4
,p_column_alias=>'SUCCESS_COUNT'
,p_column_display_sequence=>3
,p_column_heading=>'Instructions réussies'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(656999010775093019.4752)
,p_query_column_id=>5
,p_column_alias=>'TOTAL_COUNT'
,p_column_display_sequence=>5
,p_column_heading=>'Nombre total d''instructions'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(657004620656135228.4752)
,p_plug_name=>'Erreurs'
,p_parent_plug_id=>wwv_flow_api.id(656909453831982642.4752)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(662132465401686364.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'for c1 in (select c001 script_name, clob001 errors ',
'           from htmldb_collections ',
'           where collection_name = ''APEX_DEPLOYMENT_LOG_''||:P83_NEW_APP_ID',
'           and length(clob001) > 0)',
'loop',
'  sys.htp.p(''<b>''||wwv_flow_escape.html(c1.script_name)||''</b>'');',
'  sys.htp.p(''<pre>'');',
'  wwv_flow_sw_script.escape_sc_clob(c1.errors);',
'  sys.htp.p(''</pre>'');',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(539932723203132393.4752)
,p_plug_query_num_rows=>50
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(759862650080504786.4752)
,p_plug_name=>'wizard buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--wizard'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(662060974943577546.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(759862650080504786.4752)
,p_button_name=>'Close'
,p_button_action=>'SUBMIT'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fermer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(758898716821185198.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(662060974943577546.4752)
);
end;
/
prompt --application/pages/page_00234
begin
wwv_flow_api.create_page(
 p_id=>234.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Déverrouiller l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Déverrouiller l''application packagée'
,p_step_sub_title=>'Unlock Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_required_role=>wwv_flow_api.id(806250634212071966)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492883013793780169.4752)
,p_plug_name=>'Unlock Application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>35
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Si vous déverrouillez une application packagée, celle-ci ne pourra <strong>pas bénéficier des futures mises à niveau</strong>.',
'En outre, elle ne sera <strong>plus prise en charge</strong> par le support technique Oracle.'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492885234587780173.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492885472506780173.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(492885234587780173.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492885651312780174.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(492885234587780173.4752)
,p_button_name=>'UNLOCK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Déverrouiller l''application'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1190595122736251033.4752)
,p_branch_action=>'f?p=&APP_ID.:235:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(492885651312780174.4752)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492883614448780170.4752)
,p_name=>'P234_APPLICATION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492883837053780170.4752)
,p_name=>'P234_NEW_APP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492884044255780171.4752)
,p_name=>'P234_NEW_APP_URL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492884202411780171.4752)
,p_name=>'P234_APP_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_prompt=>'Nom d''application :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492884477154780172.4752)
,p_name=>'P234_WORKSPACE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_prompt=>'Nom d''espace de travail :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492884636725780172.4752)
,p_name=>'P234_SCHEMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_prompt=>'Schéma :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492884828429780172.4752)
,p_name=>'P234_CREATED'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_prompt=>'Installé :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(932669103927561041.4752)
,p_name=>'P234_UNLOCKING_APP_MSG'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(492883013793780169.4752)
,p_use_cache_before_default=>'NO'
,p_source=>'wwv_flow_lang.system_message(''WAITING.APP_UNLOCK'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492886401322780175.4752)
,p_computation_sequence=>10
,p_computation_item=>'P234_SCHEMA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select owner',
'from WWV_FLOWS',
'where security_group_id = :flow_security_group_id',
'   and id = :P234_APPLICATION_ID'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492886688874780175.4752)
,p_computation_sequence=>10
,p_computation_item=>'P234_APP_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name from wwv_flows',
'where id = :P234_APPLICATION_ID',
'and security_group_id = :flow_security_group_id'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492886815322780175.4752)
,p_computation_sequence=>10
,p_computation_item=>'P234_WORKSPACE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select DISPLAY_NAME',
'from WWV_FLOW_COMPANIES',
'where PROVISIONING_COMPANY_ID = :flow_security_group_id'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492887071230780175.4752)
,p_computation_sequence=>10
,p_computation_item=>'P234_CREATED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select htmldb_util.get_since(created) from wwv_flow_pkg_app_map where installed_app_id = :P234_APPLICATION_ID'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(740842633515106022.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(492885472506780173.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(740842954579106026.4752)
,p_event_id=>wwv_flow_api.id(740842633515106022.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00235
begin
wwv_flow_api.create_page(
 p_id=>235.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Déverrouiller l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Déverrouiller l''application packagée'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Unlock Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code_onload=>'window.setTimeout(function() { apex.submit("INSTALL"); }, 100);'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1187159732590219866.4752)
,p_plug_name=>'Déverrouillage de l''application...'
,p_region_template_options=>'#DEFAULT#:a-ProcessingRegion--dialog'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1164683681838385745.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1190594068400243089.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unlock Application'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  for c1 in (select 1',
'               from wwv_flows',
'              where id = :P234_APPLICATION_ID',
'                and security_group_id = :flow_security_group_id)',
'  loop',
'      wwv_flow_pkg_app_install.unlock_db_app(:P234_APPLICATION_ID); ',
'  end loop;',
'end;'))
,p_process_error_message=>'Erreur lors du déverrouillage de l''application'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application déverrouillée'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1187159933159219866.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application déverrouillée.'
);
end;
/
prompt --application/pages/page_00237
begin
wwv_flow_api.create_page(
 p_id=>237.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Enlever une application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Enlever une application packagée'
,p_step_sub_title=>'Remove Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_required_role=>wwv_flow_api.id(806250634212071966)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492863091096664851.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_api.id(492863870465664855.4752)
,p_plug_name=>'Enlever une application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>35
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_header=>'&P237_DB_APP_REMOVE_MSG.'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492863262180664855.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(492863091096664851.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492863491038664855.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(492863091096664851.4752)
,p_button_name=>'REMOVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enlever une application'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1187098855308175638.4752)
,p_branch_action=>'f?p=&APP_ID.:238:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(492863491038664855.4752)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492864092350664855.4752)
,p_name=>'P237_APPLICATION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492864260490664856.4752)
,p_name=>'P237_NEW_APP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492864492253664856.4752)
,p_name=>'P237_NEW_APP_URL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492864666800664857.4752)
,p_name=>'P237_APP_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_prompt=>'Nom d''application :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492864876329664857.4752)
,p_name=>'P237_WORKSPACE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_prompt=>'Nom d''espace de travail :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492865088005664857.4752)
,p_name=>'P237_SCHEMA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_prompt=>'Schéma :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492865274523664857.4752)
,p_name=>'P237_CREATED'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_prompt=>'Installé :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(590337159933680958.4752)
,p_name=>'P237_DB_APP_REMOVE_MSG'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(932668312768561033.4752)
,p_name=>'P237_REMOVING_APP_MSG'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(492863870465664855.4752)
,p_use_cache_before_default=>'NO'
,p_source=>'wwv_flow_lang.system_message(''WAITING.APP_REMOVAL'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492865791267664858.4752)
,p_computation_sequence=>2
,p_computation_item=>'P237_SCHEMA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select owner',
'from WWV_FLOWS',
'where security_group_id = :flow_security_group_id',
'  and id = :P237_APPLICATION_ID'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492865948604664859.4752)
,p_computation_sequence=>4
,p_computation_item=>'P237_CREATED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select htmldb_util.get_since(created) ',
'from wwv_flow_pkg_app_map ',
'where ( :P81_APP_TYPE = ''DATABASE'' and installed_app_id = :P237_APPLICATION_ID) or (:P81_APP_TYPE = ''WEBSHEET'' and installed_ws_id = :P237_APPLICATION_ID)'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492866108705664859.4752)
,p_computation_sequence=>6
,p_computation_item=>'P237_WORKSPACE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select DISPLAY_NAME',
'from WWV_FLOW_COMPANIES',
'where PROVISIONING_COMPANY_ID = :flow_security_group_id'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492866395909664859.4752)
,p_computation_sequence=>8
,p_computation_item=>'P237_APP_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name from wwv_flows',
'where id = :P237_APPLICATION_ID',
'and security_group_id = :flow_security_group_id'))
,p_compute_when=>'P81_APP_TYPE'
,p_compute_when_text=>'DATABASE'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492866593781664859.4752)
,p_computation_sequence=>9
,p_computation_item=>'P237_APP_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select name from wwv_flow_ws_applications',
'where id = :P237_APPLICATION_ID',
'and security_group_id = :flow_security_group_id'))
,p_compute_when=>'P81_APP_TYPE'
,p_compute_when_text=>'WEBSHEET'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(932668582987561035.4752)
,p_computation_sequence=>19
,p_computation_item=>'P237_DB_APP_REMOVE_MSG'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'wwv_flow_lang.custom_runtime_message(''REMOVE_DB_PKG_APP_WARNING'')'
,p_compute_when=>'P81_APP_TYPE'
,p_compute_when_text=>'DATABASE'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(740955465169333218.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(492863262180664855.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(740955786852333218.4752)
,p_event_id=>wwv_flow_api.id(740955465169333218.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00238
begin
wwv_flow_api.create_page(
 p_id=>238.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Enlever une application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Enlever une application packagée'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Remove Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code_onload=>'window.setTimeout(function() { apex.submit("INSTALL"); }, 100);'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1187095215315160513.4752)
,p_plug_name=>'Suppression de l''application...'
,p_region_css_classes=>'a-ProcessingRegion--slim'
,p_region_template_options=>'#DEFAULT#:a-ProcessingRegion--dialog'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1164683681838385745.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1187096974954165245.4752)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Application'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
' ',
'  if :P81_APP_TYPE = ''DATABASE'' then',
'      --',
'      -- Remove Database Packaged Application',
'      --',
'      for c1 in (select 1',
'                   from wwv_flows',
'                  where id = :P237_APPLICATION_ID',
'                    and security_group_id = :flow_security_group_id)',
'      loop',
'          wwv_flow_pkg_app_install.deinstall_db_app(p_id              => :P237_APPLICATION_ID,',
'                                                    p_supporting_objs => ''Y''); ',
'      end loop;',
'  else',
'      --',
'      -- Remove Websheet Packaged Application',
'      --',
'      for c1 in (select 1',
'                   from wwv_flow_ws_applications',
'                   where id = :P237_APPLICATION_ID',
'                    and security_group_id = :flow_security_group_id)',
'      loop',
'          wwv_flow_pkg_app_install.deinstall_websheet(:P237_APPLICATION_ID); ',
'      end loop; ',
'  end if;',
'end;'))
,p_process_error_message=>'Erreur lors de la suppression de l''application'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application enlevée'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1187100022731182050.4752)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application enlevée.'
);
end;
/
prompt --application/pages/page_00262
begin
wwv_flow_api.create_page(
 p_id=>262.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Mettre à jour l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Mettre à jour l''application packagée'
,p_step_sub_title=>'Update Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_icons.css" type="text/css" media="screen" charset="utf-8">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_frame.css" type="text/css" media="screen" charset="utf-8">',
'',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_details.css" type="text/css" media="screen" title="no title" charset="utf-8">',
'',
'<style>',
'span.ebaAppAvailable {',
'    display: inline-block;',
'    font: normal 14px/16px Arial, sans-serif;',
'    margin: 4px 5px 0 0;',
'    color: #f7941d;',
'    }',
'</style>'))
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'// extend jQuery selectors with a non case sensitive version',
'apex.jQuery.extend($.expr[":"], {',
'  "containsNC": function(pElem, pIdx, pMatch, pArray) {',
'                  return (pElem.textContent || pElem.innerText || "").toLowerCase().indexOf((pMatch[3] || "").toLowerCase()) >= 0;',
'                }',
'});',
'',
'',
'function initInstantFilter(){',
'  var $apps    = apex.jQuery(''#applications''),',
'      $allApps = $apps.clone(),',
'      lTimer;',
'',
'  function filterApplications(){',
'    var $filteredApps = $allApps.find("li:has(h3:containsNC(''"+$v(''p50_SEARCH'')+"''))");',
'    $apps.quicksand($filteredApps, {',
'      adjustHeight: false,',
'      useScaling: false,',
'      duration: 400,',
'      easing: ''easeInOutQuad''',
'    });',
'  };',
'',
'  // set a fixed size for the containing DIV to avoid flickering',
'  $apps.parent().css(''height'', $apps.parent().height() + ''px'').css(''min-width'', $apps.parent().width() + ''px'');',
'',
'  // everytime something is entered in our search field we want to execute the filter,',
'  // but only after a short delay to avoid flickering animations',
'  apex.jQuery(''#p50_SEARCH'')',
'    .keyup(function(pEvent){',
'      if (lTimer != undefined) {',
'        clearTimeout(lTimer);',
'      };',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        filterApplications();',
'      } else {',
'        lTimer = setTimeout(filterApplications, 300);',
'      }',
'    })',
'    .keypress(function(pEvent){',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        pEvent.preventDefault();',
'        pEvent.stopImmediatePropagation();',
'      }',
'    });',
'',
'};',
''))
,p_javascript_code_onload=>'initInstantFilter();'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(806250634212071966)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492904045512873121.4752)
,p_plug_name=>'App Details Container'
,p_region_name=>'ebaAppFrameTable'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492904827862873122.4752)
,p_plug_name=>'Mettre à jour une application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(492906875496873124.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_api.id(492907011478873124.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(492906875496873124.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(492907257055873125.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(492906875496873124.4752)
,p_button_name=>'UPDATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Mettre à jour une application'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1190595306937253254.4752)
,p_branch_action=>'f?p=&APP_ID.:265:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(492907257055873125.4752)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492904215920873122.4752)
,p_name=>'P262_APPLICATION_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(492904045512873121.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492904497797873122.4752)
,p_name=>'P262_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(492904045512873121.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492904627410873122.4752)
,p_name=>'P262_APP_URL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(492904045512873121.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492905018856873122.4752)
,p_name=>'P262_APP_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom d''application :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select app_name from wwv_flow_pkg_applications',
' where app_id = :P262_APPLICATION_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492905214425873122.4752)
,p_name=>'P262_AUTH'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_prompt=>'Authentification :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare ',
'  l_auth    varchar2(255);',
'begin',
'    select scheme_type into l_auth ',
'      from wwv_flow_authentications',
'     where flow_id = :P262_ID',
'       and id = (select authentication_id ',
'                   from wwv_flows',
'                  where id = :P262_ID ',
'                    and security_group_id = wwv_flow_security.g_security_group_id)',
'       and security_group_id = wwv_flow_security.g_security_group_id;',
'end;'))
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d,',
'       r',
'  from (',
'        select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.''|| name_with_prefix) as d,',
'               name_with_prefix      as r',
'          from wwv_flow_native_plugins',
'         where plugin_type = ''AUTHENTICATION TYPE''',
'         union all',
'        select display_name || wwv_flow_lang.system_message(''PLUGIN.DISPLAY_NAME_POSTFIX'') as d,',
'               ''PLUGIN_'' || name     as r',
'          from wwv_flow_plugins',
'         where flow_id           = to_number(:P262_ID)',
'           and security_group_id = to_number(:WORKSPACE_ID)',
'           and plugin_type       = ''AUTHENTICATION TYPE''',
'       )',
' order by 1'))
,p_tag_attributes=>'class="fieldtitlebold"'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492905487764873123.4752)
,p_name=>'P262_WORKSPACE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom d''espace de travail :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select DISPLAY_NAME',
'from WWV_FLOW_COMPANIES',
'where PROVISIONING_COMPANY_ID = :flow_security_group_id'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492905638520873123.4752)
,p_name=>'P262_SCHEMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_prompt=>'Schéma :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492905867180873123.4752)
,p_name=>'P262_PROVIDER_COMPANY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fournisseur :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select provider_company',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)',
'and provider_company is not null',
'  '))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492906048652873123.4752)
,p_name=>'P262_PROVIDER_EMAIL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Courriel du fournisseur :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select provider_email',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)',
'and provider_email is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492906267218873123.4752)
,p_name=>'P262_MIN_APEX_VERSION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Version minimale :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select min_apex_version',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)',
'and min_apex_version is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492906417529873124.4752)
,p_name=>'P262_RELEASED'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Publié :'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select released',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)',
'and released is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492906682018873124.4752)
,p_name=>'P262_LANGUAGES'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(492904827862873122.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Langues :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select languages',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P262_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P262_APPLICATION_ID)',
'and languages is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(932668445370561034.4752)
,p_name=>'P262_UPDATING_APP_MSG'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(492904045512873121.4752)
,p_use_cache_before_default=>'NO'
,p_source=>'wwv_flow_lang.system_message(''WAITING.APP_UPDATE'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(492908032782873126.4752)
,p_computation_sequence=>10
,p_computation_item=>'P262_AUTH'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    select scheme_type ',
'      from wwv_flow_authentications',
'     where flow_id = :P262_ID',
'       and id = (select authentication_id ',
'                   from wwv_flows',
'                  where id = :P262_ID ',
'                    and security_group_id = :flow_security_group_id)',
'       and security_group_id = :flow_security_group_id;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2203926432658252653.4752)
,p_computation_sequence=>10
,p_computation_item=>'P262_SCHEMA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select owner',
'from WWV_FLOWS',
'where security_group_id = :flow_security_group_id',
'   and id = :P262_ID'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(777148331924163851.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(492907011478873124.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(777148641561163851.4752)
,p_event_id=>wwv_flow_api.id(777148331924163851.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00265
begin
wwv_flow_api.create_page(
 p_id=>265.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Mettre à jour l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Mettre à jour l''application packagée'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Update Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code_onload=>'window.setTimeout(function() { apex.submit("INSTALL"); }, 100);'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1187116680194203401.4752)
,p_plug_name=>'Mise à jour de l''application...'
,p_region_template_options=>'#DEFAULT#:a-ProcessingRegion--dialog'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1164683681838385745.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1187160735875222266.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Application'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_pkg_app_install.update_db_app (',
'        p_app_id   => :P262_APPLICATION_ID,',
'        p_id       => :P262_ID );'))
,p_process_error_message=>'L''application n''a pas été mise à jour.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application mise à jour.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1187116845296203401.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application mise à jour.'
);
end;
/
prompt --application/pages/page_00300
begin
wwv_flow_api.create_page(
 p_id=>300.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Gérer les utilisateurs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Gérer les utilisateurs'
,p_step_sub_title=>'Manage Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(805159035944749645)
,p_step_template=>wwv_flow_api.id(741369094170994311.4752)
,p_required_role=>wwv_flow_api.id(1020614257688498212)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEADM/aadm_users.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801856451819237118.4752)
,p_plug_name=>'Comptes'
,p_region_template_options=>'#DEFAULT#:a-IRR-region--noOuterBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805538978589340502.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'    ''icon-apex-user'' as icon_view_class,',
'    alt,',
'    link,',
'    icon_view_name,',
'    user_id,',
'    "USER",',
'    "eMail",',
'    first_name,',
'    last_name,',
'    df, -- default schema',
'    developer,',
'    last_login,',
'    last_login2,',
'    builder_login_count,',
'    ul, -- is user locked?',
'    expiration,',
'    description,',
'    password_lifespan_days,',
'    password_lifespan_accesses,',
'    password_accesses_left,',
'    last_agent,',
'    last_ip,',
'    account_expiry,',
'    failed_access_attempts,',
'    change_password_on_first_use,',
'    first_password_use_occurred,',
'    dev_type,',
'    group_id,',
'    group_name,',
'    last_update_date,',
'    last_updated_by,',
'    creation_date,',
'    created_by,',
'    developer_type,',
'    allow_app_building,',
'    allow_sql_workshop,',
'    allow_websheet_dev,',
'    allow_team_devopment',
'from wwv_flow_workspace_users',
'where workspace_id = :flow_security_group_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(801856687341237121.4752)
,p_name=>'Internal Accounts'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'Cette requête renvoie plus de 10 000 lignes. Filtrez vos données pour être sûr d''obtenir des résultats complets.'
,p_no_data_found_message=>'Aucune donnée n''a été trouvée.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_use_custom=>'Y'
,p_icon_view_custom_link=>'<a href="#LINK#" class="a-IRR-icon"><span class="a-Icon #ICON_VIEW_CLASS#"></span><span class="a-IRR-iconName">#ICON_VIEW_NAME#</span></a>'
,p_icon_view_columns_per_row=>5
,p_owner=>'MIKE'
,p_internal_uid=>801856687341237121
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858314246237129.4752)
,p_db_column_name=>'USER_ID'
,p_display_order=>1
,p_column_identifier=>'E'
,p_column_label=>'USER_ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858480863237129.4752)
,p_db_column_name=>'USER'
,p_display_order=>2
,p_column_identifier=>'F'
,p_column_label=>'Utilisateur'
,p_column_link=>'f?p=&APP_ID.:306:&SESSION.::&DEBUG.:RP:F4750_P306_USER_ID:#USER_ID#:'
,p_column_linktext=>'#USER#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858584337237129.4752)
,p_db_column_name=>'eMail'
,p_display_order=>3
,p_column_identifier=>'G'
,p_column_label=>'Adresse électronique'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858623882237129.4752)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>4
,p_column_identifier=>'H'
,p_column_label=>'Prénom'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858773538237130.4752)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>5
,p_column_identifier=>'I'
,p_column_label=>'Nom de famille'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858805735237130.4752)
,p_db_column_name=>'DF'
,p_display_order=>6
,p_column_identifier=>'J'
,p_column_label=>'Schéma par défaut'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859290708237130.4752)
,p_db_column_name=>'UL'
,p_display_order=>7
,p_column_identifier=>'N'
,p_column_label=>'Verrouillé'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859438380237130.4752)
,p_db_column_name=>'DEV_TYPE'
,p_display_order=>8
,p_column_identifier=>'P'
,p_column_label=>'Type de compte'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858993339237130.4752)
,p_db_column_name=>'DEVELOPER'
,p_display_order=>9
,p_column_identifier=>'K'
,p_column_label=>'Statut du mot de passe'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859325164237130.4752)
,p_db_column_name=>'EXPIRATION'
,p_display_order=>10
,p_column_identifier=>'O'
,p_column_label=>'Compte utilisateur final'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859017236237130.4752)
,p_db_column_name=>'LAST_LOGIN'
,p_display_order=>11
,p_column_identifier=>'L'
,p_column_label=>'Date de dernière connexion à Builder'
,p_column_type=>'DATE'
,p_format_mask=>'&DATE_TIME_FORMAT.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859175920237130.4752)
,p_db_column_name=>'BUILDER_LOGIN_COUNT'
,p_display_order=>12
,p_column_identifier=>'M'
,p_column_label=>'Nombre de connexions à Builder'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858094341237128.4752)
,p_db_column_name=>'ALT'
,p_display_order=>14
,p_column_identifier=>'B'
,p_column_label=>'Alt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858105071237129.4752)
,p_db_column_name=>'LINK'
,p_display_order=>15
,p_column_identifier=>'C'
,p_column_label=>'Lien'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801858247883237129.4752)
,p_db_column_name=>'ICON_VIEW_NAME'
,p_display_order=>16
,p_column_identifier=>'D'
,p_column_label=>'Nom'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859551162237130.4752)
,p_db_column_name=>'LAST_LOGIN2'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Dernière connexion à Builder'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859699583237130.4752)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859796830237130.4752)
,p_db_column_name=>'PASSWORD_LIFESPAN_DAYS'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Durée de vie du mot de passe (jours)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859801192237130.4752)
,p_db_column_name=>'PASSWORD_LIFESPAN_ACCESSES'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Durée de vie du mot de passe - Accès'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801859966484237130.4752)
,p_db_column_name=>'PASSWORD_ACCESSES_LEFT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Nombre d''accès au mot de passe restants'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801860021426237131.4752)
,p_db_column_name=>'LAST_AGENT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Dernier agent'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801860146255237131.4752)
,p_db_column_name=>'LAST_IP'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Dernière adresse IP'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801860247718237131.4752)
,p_db_column_name=>'ACCOUNT_EXPIRY'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Expiration de compte'
,p_column_type=>'DATE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801860374733237131.4752)
,p_db_column_name=>'FAILED_ACCESS_ATTEMPTS'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Tentatives d''accès ayant échoué'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801860466821237131.4752)
,p_db_column_name=>'CHANGE_PASSWORD_ON_FIRST_USE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Modifier le mot de passe à la première utilisation'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801856890407237127.4752)
,p_db_column_name=>'FIRST_PASSWORD_USE_OCCURRED'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Première utilisation du mot de passe effectuée'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801856948910237127.4752)
,p_db_column_name=>'GROUP_NAME'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Nom de groupe'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857046187237127.4752)
,p_db_column_name=>'LAST_UPDATE_DATE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Mis à jour'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857162177237127.4752)
,p_db_column_name=>'LAST_UPDATED_BY'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Mis à jour par'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857210064237127.4752)
,p_db_column_name=>'CREATION_DATE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Créé'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857354053237128.4752)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Création par'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857487590237128.4752)
,p_db_column_name=>'DEVELOPER_TYPE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Type de développeur'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857508594237128.4752)
,p_db_column_name=>'ALLOW_APP_BUILDING'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Concepteur d''applications'
,p_column_type=>'STRING'
,p_display_condition_type=>'FUNCTION_BODY'
,p_display_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in (select 1 from WWV_FLOW_COMPANIES',
'                where provisioning_company_id = :flow_security_group_id',
'                  and NVL(allow_app_building_yn,''Y'') = ''Y'') ',
'    loop',
'        return not wwv_flow.apps_only_workspace;',
'    end loop;',
'    return false;',
'end;'))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857610548237128.4752)
,p_db_column_name=>'ALLOW_SQL_WORKSHOP'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Atelier SQL'
,p_column_type=>'STRING'
,p_display_condition_type=>'FUNCTION_BODY'
,p_display_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in (select 1 from WWV_FLOW_COMPANIES',
'                where provisioning_company_id = :flow_security_group_id',
'                  and NVL(allow_sql_workshop_yn,''Y'') = ''Y'') ',
'    loop',
'        return not wwv_flow.apps_only_workspace;',
'    end loop;',
'    return false;',
'end;'))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857742338237128.4752)
,p_db_column_name=>'ALLOW_WEBSHEET_DEV'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Feuilles Web'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857877225237128.4752)
,p_db_column_name=>'ALLOW_TEAM_DEVOPMENT'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Développement d''équipe'
,p_column_type=>'STRING'
,p_display_condition_type=>'FUNCTION_BODY'
,p_display_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in (select 1 from WWV_FLOW_COMPANIES',
'                where provisioning_company_id = :flow_security_group_id',
'                  and NVL(allow_team_development_yn,''Y'') = ''Y'') ',
'    loop',
'        return not wwv_flow.apps_only_workspace;',
'    end loop;',
'    return false;',
'end;'))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(801857970261237128.4752)
,p_db_column_name=>'GROUP_ID'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'ID de groupe'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(649535263416618335.4752)
,p_db_column_name=>'ICON_VIEW_CLASS'
,p_display_order=>49
,p_column_identifier=>'AN'
,p_column_label=>'Classe de vue icône'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801860750329237143.4752)
,p_plug_name=>'Tâches'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(805137189383669602.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(805146703039709510.4752)
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801860911393237144.4752)
,p_plug_name=>'Gérer les utilisateurs'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.prn(wwv_flow_lang.system_message(''PKG_APP_USER_TYPE_DESCRIPTION''));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801861189165237144.4752)
,p_plug_name=>'Tableaux de bord'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801861364718237144.4752)
,p_plug_name=>'users and groups APEX 4 0'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(802137241064353033.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(750892319717997379.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801861992108237145.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(801856451819237118.4752)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Réinitialiser'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:55,RIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801862136232237145.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(801856451819237118.4752)
,p_button_name=>'create_multiple'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--strongLabel'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_image_alt=>'Créer plusieurs utilisateurs'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:RP,302:::'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801862358775237145.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(801856451819237118.4752)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--strongLabel'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer un utilisateur'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801863333147237147.4752)
,p_branch_name=>'Go To Page 301'
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:301:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(801862358775237145.4752)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801863591290237150.4752)
,p_branch_action=>'300'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(649535137779618334.4752)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'300'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(801862919074237146.4752)
,p_computation_sequence=>10
,p_computation_item=>'F4350_P4802_USER_ID'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_compute_when=>'wwv_flow.g_request = ''CREATE_ROW'''
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(801863172071237147.4752)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'300'
,p_compute_when=>'CREATE'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(808639900234328664.4752)
,p_name=>'RENDERING: Change Password - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(801860750329237143.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(808640200279328664.4752)
,p_event_id=>wwv_flow_api.id(808639900234328664.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var lSuccessMsg = this.data.APEX_SUCCESS_MESSAGE,',
'      lUrl = ''f?p=&APP_ID.:300:&SESSION.::''',
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
prompt --application/pages/page_00301
begin
wwv_flow_api.create_page(
 p_id=>301.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Créer un utilisateur'
,p_page_mode=>'NORMAL'
,p_step_title=>'Créer un utilisateur'
,p_step_sub_title=>'Create User'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(805159035944749645)
,p_step_template=>wwv_flow_api.id(741366253443994295.4752)
,p_required_role=>wwv_flow_api.id(1020614257688498212)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEADM/aadm_new_users.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801868755606261949.4752)
,p_plug_name=>'Privilèges du compte'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801875453309261960.4752)
,p_plug_name=>'Identification de l''utilisateur'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801878522622261964.4752)
,p_plug_name=>'Utilisateurs'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.prn(wwv_flow_lang.system_message(''PKG_APP_USER_TYPE_DESCRIPTION''));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801878793950261965.4752)
,p_plug_name=>'Créer un utilisateur'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noUI:a-ButtonRegion--showTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801880245567261967.4752)
,p_plug_name=>'Mot de passe'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
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
 p_id=>wwv_flow_api.id(801882157461261968.4752)
,p_plug_name=>'Sélecteur d''affichage de région'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801878944731261965.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(801878793950261965.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801879374181261966.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(801878793950261965.4752)
,p_button_name=>'CREATE_ANOTHER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Créer et créer un autre'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801879151247261965.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(801878793950261965.4752)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer un utilisateur'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801893372555261985.4752)
,p_branch_action=>'300'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(801879151247261965.4752)
,p_branch_sequence=>10
,p_branch_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801893528145261985.4752)
,p_branch_action=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:301,EDIT_USER_PRIVS:P301_DEVELOPER,P301_ADMIN:&P301_DEVELOPER.,&P301_ADMIN.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(801879374181261966.4752)
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801868993934261949.4752)
,p_name=>'F4750_P301_DEFAULT_SCHEMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Schéma par défaut'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'Indiquez le schéma par défaut utilisé pour l''exploration des données, la création d''application et l''exécution de script SQL. Lors de l''utilisation d''espaces de travail où plusieurs schémas sont disponibles, le schéma indiqué ici est le schéma par dé'
||'faut pour la création d''applications, l''exécution de requêtes SQL, etc. Cette fonctionnalité ne contrôle pas la sécurité, seulement la préférence de l''utilisateur.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801869430459261953.4752)
,p_name=>'F4750_P301_ALLOW_SCHEMA_ACCESS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_prompt=>'Schémas accessibles (Null pour tous)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>4000
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Saisissez la liste des schémas, séparés par des deux-points, pour lesquels ce développeur a des droits d''accès lorsqu''il utilise l''atelier SQL. La liste des schémas saisie ici limite l''utilisateur à un sous-ensemble des schémas fournis pour l''espace '
||'de travail et détermine les noms de schéma que l''utilisateur visualise dans l''atelier SQL.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801869941199261953.4752)
,p_name=>'P301_ADMIN'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_item_default=>'N'
,p_prompt=>'L''utilisateur est un administrateur d''espace de travail :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_tag_attributes=>'onClick="javascript:if (document.forms[0].P52_ADMIN_0.checked) document.forms[0].P52_DEVELOPER_0.checked = true;"'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_escape_on_http_output=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Indiquez si cet utilisateur doit avoir les privilèges d''administrateur d''espace de travail. Les droits d''accès à tous les composants sont accordés aux administrateurs. En outre, ces derniers peuvent gérer les comptes utilisateur, groupes et services '
||'de développement.',
'',
'Les composants risquent de ne pas être disponibles s''ils sont désactivés par les administrateurs d''instance.'))
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801870426816261953.4752)
,p_name=>'P301_DEVELOPER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_item_default=>'N'
,p_prompt=>'L''utilisateur est un développeur :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'DEVELOPER TYPE'
,p_lov=>'.'||wwv_flow_api.id(801895490296261989)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'onClick="javascript:if (document.forms[0].P52_ADMIN_0.checked) document.forms[0].P52_DEVELOPER_0.checked = true;"'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_escape_on_http_output=>'N'
,p_help_text=>'Indiquez si l''utilisateur doit disposer de privilèges de développeur. Les développeurs peuvent installer, enlever ou mettre à niveau des applications packagées.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
,p_attribute_04=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801870938775261953.4752)
,p_name=>'P301_ALLOW_APP_BUILDING_YN'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès au concepteur d''applications'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au concepteur d''applications.<br>',
'<br>',
'Un administrateur a toujours accès au concepteur d''applications.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au concepteur d''applications pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801871495706261955.4752)
,p_name=>'P301_DISALLOW_APP_BUILDING'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès au concepteur d''applications'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au concepteur d''applications.<br>',
'<br>',
'Un administrateur a toujours accès au concepteur d''applications.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au concepteur d''applications pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801871925528261956.4752)
,p_name=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès au développement de feuilles Web'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au développement de feuilles Web.<br>',
'<br>',
'Un administrateur a toujours accès au développement de feuilles Web.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement de feuilles Web pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801872424483261956.4752)
,p_name=>'P301_DISALLOW_WEBSHEET_DEV'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès au développement de feuilles Web'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au développement de feuilles Web.<br>',
'<br>',
'Un administrateur a toujours accès au développement de feuilles Web.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement de feuilles Web pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801872966474261956.4752)
,p_name=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès à l''atelier SQL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès à l''atelier SQL.<br>',
'<br>',
'Un administrateur a toujours accès à l''atelier SQL.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès à l''atelier SQL pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801873457406261957.4752)
,p_name=>'P301_DISALLOW_SQL_WORKSHOP'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès à l''atelier SQL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès à l''atelier SQL.<br>',
'<br>',
'Un administrateur a toujours accès à l''atelier SQL.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès à l''atelier SQL pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801873990693261957.4752)
,p_name=>'P301_ALLOW_TEAM_DEVELOPMENT_YN'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès au développement d''équipe'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un utilisateur a accès au développement d''équipe.<br>',
'<br>',
'Un administrateur a toujours accès au développement d''équipe.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement d''équipe pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801874465165261960.4752)
,p_name=>'P301_DISALLOW_TEAM_DEVELOPMENT'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès au développement d''équipe'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un utilisateur a accès au développement d''équipe.<br>',
'<br>',
'Un administrateur a toujours accès au développement d''équipe.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement d''équipe pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801874998664261960.4752)
,p_name=>'P301_ACCOUNT_LOCKED'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(801868755606261949.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Définir la disponibilité du compte'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACCOUNT_LOCK_STATUS'
,p_lov=>'.'||wwv_flow_api.id(805398623015787070)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Sélectionnez <b>Verrouillé</b> pour interdire l''utilisation du compte. Sélectionnez <b>Déverrouillé</b> pour en autoriser l''utilisation.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801875696425261961.4752)
,p_name=>'F4750_P301_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(801875453309261960.4752)
,p_prompt=>'Nom utilisateur'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Indiquez le nom utilisateur employé pour la connexion au système. Les noms utilisateur sont soumis aux restrictions suivantes : <ul><li>',
'longueur maximale : 100 caractères</li><li>',
'pas d''espaces</li>',
'<li>seuls caractères spéciaux autorisés : @ et point (.)</li></ul>',
'<p>Le nom utilisateur peut également être employé pour faire référence à l''activité de l''utilisateur dans les applications de surveillance. La variable attachée <code>:app_user</code> renvoie la valeur de l''utilisateur en cours lors de la constructio'
||'n des applications.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_item_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801876075598261962.4752)
,p_name=>'F4750_P301_EMAIL_ADDRESS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(801875453309261960.4752)
,p_prompt=>'Adresse électronique'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>240
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez l''adresse électronique à utiliser dans la correspondance générale, les notifications de réinitialisation des mots de passe, etc.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
,p_item_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801876543353261962.4752)
,p_name=>'F4750_P301_FIRST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(801875453309261960.4752)
,p_prompt=>'Prénom'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez le prénom de l''utilisateur, pour préciser son identité. Ce champ facultatif n''est utilisé qu''à des fins d''information.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_item_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801877086687261963.4752)
,p_name=>'F4750_P301_LAST_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(801875453309261960.4752)
,p_prompt=>'Nom de famille'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez le nom de famille de l''utilisateur, pour préciser son identité. Ce champ facultatif n''est utilisé qu''à des fins d''information.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_item_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801877570915261963.4752)
,p_name=>'F4750_P301_DESCRIPTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(801875453309261960.4752)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>3
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Utilisez ce champ pour enregistrer des commentaires sur l''utilisateur, à des fins d''information uniquement.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
,p_item_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801880464552261967.4752)
,p_name=>'F4750_P301_WEB_PASSWORD'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(801880245567261967.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mot de passe'
,p_post_element_text=>' <span class="instructiontext">Les mots de passe font l''objet d''une distinction entre les majuscules et les minuscules</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez un mot de passe. Les mots de passe font l''objet d''une distinction entre les majuscules et les minuscules. Les développeurs peuvent modifier leur mot de passe. Ceux qui disposent du privilège d''administrateur peuvent modifier le mot de passe '
||'des utilisateurs du même espace de travail.'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_item_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801880964846261967.4752)
,p_name=>'F4750_P301_PASSWD_CONFIRM'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(801880245567261967.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirmer le mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Entrez de nouveau le mot de passe.'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801881438419261968.4752)
,p_name=>'P301_SP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(801880245567261967.4752)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_begin_on_new_line=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801881692544261968.4752)
,p_name=>'P301_CHANGE_PWD_ON_FIRST_USE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(801880245567261967.4752)
,p_item_default=>'Y'
,p_prompt=>'Demander la modification du mot de passe à la première utilisation'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Sélectionnez <b>Oui</b> pour demander à l''utilisateur de ce compte de modifier immédiatement le mot de passe après s''être connecté pour la première fois au moyen du mot de passe en cours. Cette règle s''applique à l''utilisation de ce compte pour l''adm'
||'inistration et le développement de l''espace de travail, ainsi qu''à son utilisation pour la connexion aux applications développées.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801882703797261969.4752)
,p_validation_name=>'F4750_P301_USER_NAME Not Null'
,p_validation_sequence=>10
,p_validation=>'F4750_P301_USER_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Le nom utilisateur doit être indiqué.'
,p_always_execute=>'N'
,p_validation_condition=>'SUBMIT,CREATE_ANOTHER'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(801875696425261961.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 10-JUN-2001 19:34'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801882963246261970.4752)
,p_validation_name=>'UserNameValid'
,p_validation_sequence=>20
,p_validation=>'F4750_P301_USER_NAME'
,p_validation2=>'< >'
,p_validation_type=>'ITEM_IN_VALIDATION_CONTAINS_NO_CHAR_IN_STRING2'
,p_error_message=>'Nom utilisateur non valide.'
,p_always_execute=>'N'
,p_validation_condition=>'SUBMIT,CREATE_ANOTHER'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(801875696425261961.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801883137525261970.4752)
,p_validation_name=>'user doesn''t already exist'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'  from wwv_flow_fnd_user',
' where user_name = upper(:F4750_P301_USER_NAME)',
'   and security_group_id = (select wwv_flow.get_sgid from dual where rownum = 1)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'L''utilisateur &F4750_P301_USER_NAME. existe déjà.'
,p_always_execute=>'N'
,p_validation_condition=>'SUBMIT,CREATE_ANOTHER'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(801875696425261961.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801883314260261970.4752)
,p_validation_name=>'F4750_P301_EMAIL_ADDRESS Not Null'
,p_validation_sequence=>40
,p_validation=>'F4750_P301_EMAIL_ADDRESS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'L''adresse électronique doit être indiquée.'
,p_always_execute=>'N'
,p_validation_condition=>'SUBMIT,CREATE_ANOTHER'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(801876075598261962.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'generated 10-JUN-2001 19:34'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801883545606261970.4752)
,p_validation_name=>'F4750_P301_EMAIL_ADDRESS valid format'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_at number;',
'  l_dot number;',
'begin',
'  l_at := instr(nvl(:F4750_P301_EMAIL_ADDRESS,''x''),''@'');',
'  l_dot := instr(nvl(:F4750_P301_EMAIL_ADDRESS,''x''),''.'',l_at);',
'  return l_at > 1 and l_dot > 1 and (l_dot - l_at) > 1;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Adresse électronique non valide.'
,p_always_execute=>'N'
,p_validation_condition=>'F4750_P301_EMAIL_ADDRESS'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(801876075598261962.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801883708623261970.4752)
,p_validation_name=>'default schema in accessible schemas'
,p_validation_sequence=>60
,p_validation=>'instr(upper(:F4750_P301_ALLOW_SCHEMA_ACCESS),:F4750_P301_DEFAULT_SCHEMA) > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Le schéma par défaut doit figurer dans les schémas accessibles.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':REQUEST in (''SUBMIT'',''CREATE_ANOTHER'') and ',
':F4750_P301_ALLOW_SCHEMA_ACCESS is not null'))
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(801868993934261949.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801883982214261970.4752)
,p_validation_name=>'Developer must have Access'
,p_validation_sequence=>80
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :P301_DEVELOPER = ''Y'' THEN',
'    IF :P301_ALLOW_APP_BUILDING_YN = ''N''',
'    AND :P301_ALLOW_SQL_WORKSHOP_YN = ''N'' THEN',
'      RETURN FALSE;',
'    END IF;',
'  END IF;',
'',
'  RETURN TRUE;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Un développeur doit détenir les droits d''accès au concepteur d''applications et/ou à l''atelier SQL.'
,p_always_execute=>'N'
,p_validation_condition=>'SUBMIT,CREATE_ANOTHER'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(801870426816261953.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801884168491261971.4752)
,p_validation_name=>'Validate Password'
,p_validation_sequence=>120
,p_validation=>':F4750_P301_PASSWD_CONFIRM = :F4750_P301_WEB_PASSWORD'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Les mots de passe ne concordent pas.  '
,p_always_execute=>'N'
,p_validation_condition=>'SUBMIT,CREATE_ANOTHER'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(801880964846261967.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801884344971261971.4752)
,p_validation_name=>'strong password verification'
,p_validation_sequence=>140
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'return wwv_flow_security.strong_password_validation(',
'      p_username       => :F4750_P301_USER_NAME,',
'      p_password       => :F4750_P301_WEB_PASSWORD,',
'      p_old_password   => null,',
'      p_workspace_name => wwv_flow_security.find_company_name(:WORKSPACE_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'Erreur'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':request in (''SUBMIT'',''CREATE_ANOTHER'')',
'and wwv_flow_authentication_dev.is_builder_password_required (',
'        p_developer_yn => :P301_DEVELOPER )'))
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(801880464552261967.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801884586679261972.4752)
,p_validation_name=>'admin / dev username validate'
,p_validation_sequence=>150
,p_validation=>'return regexp_like(:F4750_P301_USER_NAME,wwv_flow_platform.get_preference(''USERNAME_VALIDATION''));'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Le nom utilisateur ne concorde pas avec l''expression définie pour l''instance.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    nvl(wwv_flow_platform.get_preference(''USERNAME_VALIDATION''),''*'') != ''*''',
'and (:P301_ADMIN = ''Y'' or :P301_DEVELOPER = ''Y'')'))
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(801875696425261961.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801885433402261975.4752)
,p_name=>'Set Admin Defaults'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_ADMIN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801885789481261977.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_DEVELOPER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801885919620261978.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>11
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_DEVELOPER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801886168011261978.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_DEVELOPER'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801886311345261978.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801886575632261979.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>31
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801886797381261979.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801886968124261979.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801887147410261979.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>51
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801887323756261979.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801887568584261979.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801887791712261980.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>71
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801887910599261980.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801888115061261980.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_TEAM_DEVELOPMENT_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801888309020261980.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>91
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_TEAM_DEVELOPMENT_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801888519244261980.4752)
,p_event_id=>wwv_flow_api.id(801885433402261975.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_TEAM_DEVELOPMENT_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801888635934261981.4752)
,p_name=>'Set Developer Defaults'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_DEVELOPER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801888970591261981.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801889162513261981.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>11
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801889393982261981.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801889504152261981.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>21
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801889765539261982.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801889986362261982.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>31
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801890132279261982.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801890333861261982.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>41
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801890576092261983.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801890710396261983.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>51
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801890945503261983.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801891112507261983.4752)
,p_event_id=>wwv_flow_api.id(801888635934261981.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>61
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801892803110261984.4752)
,p_name=>'set email if user name contains @'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'F4750_P301_USER_NAME'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''F4750_P301_USER_NAME'').match(/@/)!=null'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801893131306261985.4752)
,p_event_id=>wwv_flow_api.id(801892803110261984.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'F4750_P301_EMAIL_ADDRESS'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$v(''F4750_P301_USER_NAME'')'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(801884616726261972.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create User PL/SQL API Call'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_user_id                      number        := wwv_flow_id.next_val;',
'  l_p                            varchar2(256) := :F4750_P301_WEB_PASSWORD;',
'  l_change_password_on_first_use varchar2(1)   := ''N'';',
'  l_developer_roles              varchar2(255) := NULL;',
'begin',
'  if :P301_CHANGE_PWD_ON_FIRST_USE = ''Y'' then',
'    l_change_password_on_first_use := ''Y'';',
'  end if;',
'  ',
'  wwv_flow.update_cache_with_write(''F4750_P301_WEB_PASSWORD'',null);',
'  wwv_flow.update_cache_with_write(''F4750_P301_PASSWD_CONFIRM'',null);',
'  ',
'  WWV_FLOW_FND_USER_API.CREATE_FND_USER(',
'      P_USER_ID                      => l_user_id,',
'      P_USER_NAME                    => :F4750_P301_USER_NAME,',
'      P_FIRST_NAME                   => :F4750_P301_FIRST_NAME,',
'      P_LAST_NAME                    => :F4750_P301_LAST_NAME,',
'      P_DESCRIPTION                  => :F4750_P301_DESCRIPTION,',
'      P_EMAIL_ADDRESS                => :F4750_P301_EMAIL_ADDRESS,',
'      P_WEB_PASSWORD                 => l_p,',
'      P_DEVELOPER_PRIVS              => null,',
'      P_DEFAULT_SCHEMA               => :F4750_P301_DEFAULT_SCHEMA,',
'      P_ALLOW_ACCESS_TO_SCHEMAS      => :F4750_P301_ALLOW_SCHEMA_ACCESS,',
'      P_ACCOUNT_EXPIRY               => trunc(sysdate),',
'      P_ACCOUNT_LOCKED               => nvl(:P301_ACCOUNT_LOCKED,''N''),',
'      p_failed_access_attempts       =>   0, ',
'      p_change_password_on_first_use => l_change_password_on_first_use,',
'      p_first_password_use_occurred  => ''N'' );',
'',
'  --',
'  -- Set User Component Privileges',
'  --',
'  if :P301_ADMIN = ''Y'' then',
'    wwv_flow_fnd_developer_api.set_component_privs (',
'        P_user_id                   => l_user_id,',
'        p_ALLOW_APP_BUILDING_YN     => ''Y'',',
'        p_ALLOW_WEBSHEET_DEV_YN     => ''Y'',',
'        p_ALLOW_SQL_WORKSHOP_YN     => ''Y'',',
'        p_ALLOW_TEAM_DEVELOPMENT_YN => ''Y'');',
'',
'  elsif :P301_DEVELOPER= ''Y'' then',
'    wwv_flow_fnd_developer_api.set_component_privs (',
'        P_user_id                   => l_user_id,',
'        p_ALLOW_APP_BUILDING_YN     => nvl(:P301_ALLOW_APP_BUILDING_YN,''Y''),',
'        p_ALLOW_WEBSHEET_DEV_YN     => nvl(:P301_ALLOW_WEBSHEET_DEV_YN,''Y''),',
'        p_ALLOW_SQL_WORKSHOP_YN     => nvl(:P301_ALLOW_SQL_WORKSHOP_YN,''Y''),',
'        p_ALLOW_TEAM_DEVELOPMENT_YN => nvl(:P301_ALLOW_TEAM_DEVELOPMENT_YN,''Y'') );',
'',
'  else',
'    wwv_flow_fnd_developer_api.set_component_privs (',
'        P_user_id                   => l_user_id,',
'        p_ALLOW_APP_BUILDING_YN     => ''N'',',
'        p_ALLOW_WEBSHEET_DEV_YN     => ''N'',',
'        p_ALLOW_SQL_WORKSHOP_YN     => ''N'',',
'        p_ALLOW_TEAM_DEVELOPMENT_YN => nvl(:P301_ALLOW_TEAM_DEVELOPMENT_YN,''Y''));',
'',
'  end if;',
'',
'  --',
'  -- Developer and Admin roles',
'  --',
'  if :P301_ADMIN = ''N'' and :P301_DEVELOPER= ''N'' then',
'    null;',
'  else',
'    -- {Trigger on WWV_FLOW_DEVELOPERS sets all developer roles for ADMINS ',
'    --  irrespective of what set here providing includes ''ADMIN''} ',
'    if :P301_ADMIN = ''Y'' then ',
'      l_developer_roles := ''ADMIN'';',
'    end if;',
'    if nvl(v(''P301_ALLOW_APP_BUILDING_YN''),''Y'') = ''Y'' then ',
'      if l_developer_roles is not null then',
'        l_developer_roles := l_developer_roles||'':'';',
'      end if;',
'      l_developer_roles := l_developer_roles||''CREATE:EDIT:HELP:MONITOR'';',
'    end if;',
'    if nvl(v(''P301_ALLOW_SQL_WORKSHOP_YN''),''Y'') = ''Y'' then',
'      if l_developer_roles is not null then',
'        l_developer_roles := l_developer_roles||'':'';',
'      end if;',
'      l_developer_roles := l_developer_roles||''SQL:MONITOR:DATA_LOADER'';',
'    end if;',
'    wwv_flow_fnd_developer_api.edit_developer_role(',
'      p_id => 1,',
'      p_user_id => l_user_id,',
'      p_user_name => :F4750_P301_USER_NAME,',
'      p_developer_roles => l_developer_roles);',
'  end if;',
'',
'end;',
'commit;'))
,p_process_error_message=>'Erreur : #SQLERRM#'
,p_process_when=>'SUBMIT,CREATE_ANOTHER'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Utilisateur créé.'
,p_process_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(801884849098261973.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'F4750_P301_WEB_PASSWORD,F4750_P301_PASSWD_CONFIRM'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(801885207571261975.4752)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'always developer if admin'
,p_process_sql_clob=>':P301_DEVELOPER := ''Y'';'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P301_ADMIN'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(801885067563261975.4752)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generate random password for SSO accounts'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':F4750_P301_WEB_PASSWORD   := wwv_flow_authentication_dev.create_shadow_user_password;',
':F4750_P301_PASSWD_CONFIRM := :F4750_P301_WEB_PASSWORD;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    :request in (''SUBMIT'',''CREATE_ANOTHER'')',
'and :F4750_P301_WEB_PASSWORD is null',
'and not wwv_flow_authentication_dev.is_builder_password_required (',
'            p_developer_yn => :P301_DEVELOPER )'))
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
prompt --application/pages/page_00302
begin
wwv_flow_api.create_page(
 p_id=>302.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Créer plusieurs utilisateurs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Créer plusieurs utilisateurs'
,p_step_sub_title=>'Create Multiple Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(805159035944749645)
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function clob_Submit(){',
'	var clob = new apex.ajax.clob(function (){',
'		if(p.readyState == 1){',
'				$x_Show(''AjaxLoading'');',
'		}else if(p.readyState == 2){',
'		}else if(p.readyState == 3){',
'		}else if(p.readyState == 4){',
'				$s(''P99_USERS'','''');',
'				doSubmit(''SUCCESS'');',
'				return;',
'		}else{return false;}',
'});',
'	clob._set($v(''P99_USERS''));',
'	return;',
'}'))
,p_step_template=>wwv_flow_api.id(741371098457994312.4752)
,p_required_role=>wwv_flow_api.id(1020614257688498212)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEADM/aadm_new_users_multi.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801904748492279859.4752)
,p_plug_name=>'Utilisateurs'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--noBorder:a-Region--accessibleHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>24
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Entrez ou copiez-collez les adresses électroniques en les séparant par des virgules, des points-virgules ou des sauts de ligne. Si vous copiez-collez des adresses électroniques à partir de courriels, le texte parasite sera filtré. Tous les utilisa'
||'teurs de messagerie fournis seront également ajoutés avec le rôle sélectionné. Les adresses de messagerie existantes ou en double seront ignorées.',
'',
'<p>Le mot de passe que vous indiquez sera affecté à tous les utilisateurs, qui devront le modifier lors de la connexion.</p>'))
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign=top'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801912387791279871.4752)
,p_plug_name=>'top bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_api.id(801914160780279872.4752)
,p_plug_name=>'Créer plusieurs utilisateurs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801912598970279871.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(801912387791279871.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801912771858279871.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(801912387791279871.4752)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801922947471279889.4752)
,p_branch_action=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801904987716279859.4752)
,p_name=>'P302_USERS'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(801904748492279859.4752)
,p_prompt=>'Liste d''adresses électroniques'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>32767
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(741376417814001773.4752)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--stretch'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Entrez ou copiez-collez les adresses électroniques en les séparant par des virgules, des points-virgules ou des sauts de ligne. Si vous copiez-collez des adresses électroniques à partir de messages électroniques, le texte parasite sera filtré.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801905448114279861.4752)
,p_name=>'P302_STRIP_DOMAIN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(801904748492279859.4752)
,p_item_default=>'N'
,p_prompt=>'Noms utilisateur'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'CREATE.MULT.USER.STRIP.DOMAIN'
,p_lov=>'.'||wwv_flow_api.id(805346280616446827)||'.'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Indiquez s''il faut inclure l''adresse électronique complète ou exclure le nom du domaine. Les options sont les suivantes :',
'<ul>',
'<li>Définir le nom utilisateur sur l''adresse électronique complète : l''adresse électronique complète est incluse.</li>',
'<li>Exclure @domaine du nom utilisateur : tout le texte suivant le symbole @ est enlevé (par exemple, <code>user1@xyz.com</code> devient <code>user1</code>).</li>',
'</ul>'))
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801907160517279864.4752)
,p_name=>'P302_ADMIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(801904748492279859.4752)
,p_item_default=>'N'
,p_prompt=>'Les utilisateurs sont des administrateurs d''espace de travail :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_tag_attributes=>'onClick="javascript:if (document.forms[0].P52_ADMIN_0.checked) document.forms[0].P52_DEVELOPER_0.checked = true;"'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_escape_on_http_output=>'N'
,p_help_text=>'Indiquez si ces utilisateurs doivent disposer de privilèges d''administrateur d''espace de travail. Comme les développeurs, les administrateurs d''espace de travail peuvent créer et modifier des applications et des objets de base de données. En outre, i'
||'ls peuvent gérer des comptes utilisateurs, des groupes et des services de développement.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801907691188279864.4752)
,p_name=>'P302_DEVELOPER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(801904748492279859.4752)
,p_item_default=>'N'
,p_prompt=>'Les utilisateurs sont des développeurs :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'DEVELOPER TYPE'
,p_lov=>'.'||wwv_flow_api.id(801895490296261989)||'.'
,p_tag_attributes=>'onClick="javascript:if (document.forms[0].P52_ADMIN_0.checked) document.forms[0].P52_DEVELOPER_0.checked = true;"'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_input=>'Y'
,p_escape_on_http_output=>'N'
,p_help_text=>'Indiquez si ces utilisateurs doivent disposer de privilèges de développeur. Les développeurs peuvent créer et modifier des applications et des objets de base de données.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801913106059279872.4752)
,p_name=>'P302_WEB_PASSWORD'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(801904748492279859.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mot de passe'
,p_post_element_text=>' <span class="instructiontext">Les mots de passe font l''objet d''une distinction entre les majuscules et les minuscules</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Indiquez un mot de passe. Les mots de passe font l''objet d''une distinction entre les majuscules et les minuscules. Les développeurs peuvent modifier leur mot de passe. Ceux qui disposent du privilège d''administrateur peuvent modifier le mot de passe '
||'des utilisateurs du même espace de travail.'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_item_comment=>'Generated 24-MAY-2001 18:02:15'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(801913625101279872.4752)
,p_name=>'P302_PASSWD_CONFIRM'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(801904748492279859.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirmer le mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Entrez de nouveau le mot de passe.'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(808601330697447699.4752)
,p_name=>'P302_DEFAULT_SCHEMA'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(801904748492279859.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Schéma par défaut'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LIST_AVAILABLE_SCHEMAS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(schema) d, schema r',
'',
'from   wwv_flow_company_schemas',
'',
'where  security_group_id = :flow_security_group_id',
'',
'order by 1'))
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'N'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'Indique le schéma par défaut utilisé pour l''exploration des données, la création d''application et l''exécution de script SQL. Lors de l''utilisation d''espaces de travail où plusieurs schémas sont disponibles, le schéma indiqué ici est le schéma par déf'
||'aut pour la création d''applications, l''exécution de requêtes SQL, etc. Cette fonctionnalité ne contrôle pas la sécurité, seulement la préférence de l''utilisateur.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801914714646279875.4752)
,p_validation_name=>'Developer must have Access'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :P302_DEVELOPER = ''Y'' THEN',
'    IF :P302_ALLOW_APP_BUILDING_YN = ''N''',
'    AND :P302_ALLOW_SQL_WORKSHOP_YN = ''N'' THEN',
'      RETURN FALSE;',
'    END IF;',
'  END IF;',
'',
'  RETURN TRUE;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Un développeur doit détenir les droits d''accès au concepteur d''applications et/ou à l''atelier SQL.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(801912771858279871.4752)
,p_associated_item=>wwv_flow_api.id(801907691188279864.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(801914902890279876.4752)
,p_validation_name=>'Passwords match'
,p_validation_sequence=>20
,p_validation=>'P302_WEB_PASSWORD'
,p_validation2=>'&P302_PASSWD_CONFIRM.'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>'Le mot de passe et sa confirmation ne concordent pas.'
,p_always_execute=>'N'
,p_validation_condition=>'P302_WEB_PASSWORD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(801912771858279871.4752)
,p_associated_item=>wwv_flow_api.id(801913106059279872.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801915486481279876.4752)
,p_name=>'Set Admin Defaults'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_ADMIN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>'not wwv_flow_authentication_dev.can_edit_builder_users'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801915701573279877.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_DEVELOPER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801915986681279879.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_DEVELOPER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801916102259279880.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801916378829279880.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_DEVELOPER'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801916595374279880.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801916737295279880.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801916994097279880.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801917182920279880.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801917349448279881.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801917582082279881.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_TEAM_DEVELOPMENT_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801917727153279884.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801917962850279885.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801918141703279885.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801918378301279885.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_TEAM_DEVELOPMENT_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801918598111279885.4752)
,p_event_id=>wwv_flow_api.id(801915486481279876.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_TEAM_DEVELOPMENT_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801918668813279885.4752)
,p_name=>'Set Developer Defaults'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_DEVELOPER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801918942607279885.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801919147716279885.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801919338677279885.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801919508167279885.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801919709709279885.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801919971132279885.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801920110797279885.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801920308300279887.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801920581817279887.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801920762327279887.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801920905785279887.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801921137676279887.4752)
,p_event_id=>wwv_flow_api.id(801918668813279885.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801921287884279887.4752)
,p_name=>'Disable Disallow App Building'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_DISALLOW_APP_BUILDING'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801921535147279887.4752)
,p_event_id=>wwv_flow_api.id(801921287884279887.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_DISALLOW_APP_BUILDING'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801921630343279887.4752)
,p_name=>'Disable Disallow Websheet Development'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_DISALLOW_WEBSHEET_DEV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801921983192279887.4752)
,p_event_id=>wwv_flow_api.id(801921630343279887.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_DISALLOW_WEBSHEET_DEV'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801922066430279887.4752)
,p_name=>'Disable Disallow SQL Workshop'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_DISALLOW_SQL_WORKSHOP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801922321050279889.4752)
,p_event_id=>wwv_flow_api.id(801922066430279887.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_DISALLOW_SQL_WORKSHOP'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(801922497921279889.4752)
,p_name=>'Disable Disallow Team Development'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P302_DISALLOW_TEAM_DEVELOPMENT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(801922762904279889.4752)
,p_event_id=>wwv_flow_api.id(801922497921279889.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P302_DISALLOW_TEAM_DEVELOPMENT'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(801915034587279876.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create collection of user names'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_line      varchar2(32767);',
'    l_emails    wwv_flow_global.vc_arr2;',
'    l_username  varchar2(4000);',
'    l_at        number;',
'    l_dot       number;',
'    l_valid     boolean := true;',
'    l_domain    varchar2(4000);',
'begin',
'    ---------------------',
'    -- create collections',
'    --',
'    apex_collection.CREATE_OR_TRUNCATE_COLLECTION (''BULK_USER_INVALID'');',
'    apex_collection.CREATE_OR_TRUNCATE_COLLECTION (''BULK_USER_VALID'');',
'    apex_collection.CREATE_OR_TRUNCATE_COLLECTION (''BULK_USER_CREATE'');',
'',
'    --------------------------------------------',
'    -- replace delimiting characters with commas',
'    --',
'    l_line := :P302_USERS;',
'    l_line := replace(l_line,chr(10),'' '');',
'    l_line := replace(l_line,chr(13),'' '');',
'    l_line := replace(l_line,chr(9),'' '');',
'    l_line := replace(l_line,''<'','' '');',
'    l_line := replace(l_line,''>'','' '');',
'    l_line := replace(l_line,'';'','' '');',
'    l_line := replace(l_line,'':'','' '');',
'    l_line := replace(l_line,'' '','','');',
'',
'    -----------------------------------------',
'    -- get one comma separated line of emails',
'    --',
'    for j in 1..1000 loop',
'        if instr(l_line,'',,'') > 0 then',
'           l_line := replace(l_line,'',,'','','');',
'        else',
'           exit;',
'        end if;',
'    end loop;',
'',
'    -------------------------',
'    -- get an array of emails',
'    --',
'    l_emails := wwv_flow_utilities.string_to_table(l_line,'','');',
'',
'    -----------------------------',
'    -- add emails to a collection',
'    --',
'    l_username := null;',
'    l_domain := null;',
'    l_at := 0;',
'    l_dot := 0;',
'    for j in 1..l_emails.count loop',
'        l_valid := true;',
'        l_username := trim(l_emails(j));',
'',
'        if l_username is not null then',
'            if :P302_STRIP_DOMAIN = ''N'' then',
'              -----------',
'              -- Validate',
'              --',
'              l_at := instr(nvl(l_username,''x''),''@'');',
'              l_domain := substr(l_username,l_at+1);',
'              l_dot := instr(l_domain,''.'');',
'              if l_at < 2 then',
'                  -- invalid email',
'                  apex_collection.add_member(',
'                      p_collection_name => ''BULK_USER_INVALID'',',
'                      p_c001            => l_username,',
'                      p_c002            => wwv_flow_lang.system_message(''MISSING_AT_SIGN''));',
'                  commit;',
'                  l_valid := false;',
'              end if;',
'',
'              if l_dot = 0 and l_valid then',
'                  apex_collection.add_member(',
'                      p_collection_name => ''BULK_USER_INVALID'',',
'                      p_c001            => l_username,',
'                      p_c002            => wwv_flow_lang.system_message(''MISSING_DOT''));',
'                  commit;',
'                  l_valid := false;',
'              end if;',
'            end if;',
'',
'            l_username := trim(l_username);',
'            l_username := replace(l_username,'' '',null);',
'            l_username := replace(l_username,chr(10),null);',
'            l_username := replace(l_username,chr(9),null);',
'            l_username := replace(l_username,chr(13),null);',
'',
'            if l_valid and length(l_username) > 255 then',
'                apex_collection.add_member(',
'                    p_collection_name => ''BULK_USER_INVALID'',',
'                    p_c001            => upper(l_username),',
'                    p_c002            => wwv_flow_lang.system_message(''WS_USERNAME_TOO_LONG''));',
'                commit;',
'                l_valid := false;',
'            end if;',
'',
'            if l_valid then',
'                for c1 in (select /* APEX76a66f */ user_name',
'                             from wwv_flow_fnd_user',
'                            where upper(user_name) = upper(l_username)',
'                            and security_group_id = :flow_security_group_id)',
'                loop',
'                    wwv_flow_collection.add_member(',
'                        p_collection_name => ''BULK_USER_INVALID'',',
'                        p_c001            => upper(l_username),',
'                        p_c002            => wwv_flow_lang.system_message(''ALREADY_IN_WS''));',
'                    commit;',
'                    l_valid := false;',
'                    exit;',
'                end loop;',
'            end if;',
'',
'            if l_valid then',
'                for c1 in (select /* APEXeaf772 */  c001',
'                             from wwv_flow_collections',
'                            where collection_name = ''BULK_USER_VALID''',
'                              and c001 = upper(l_username))',
'                loop',
'                    apex_collection.add_member(',
'                        p_collection_name => ''BULK_USER_INVALID'',',
'                        p_c001            => upper(l_username),',
'                        p_c002            => wwv_flow_lang.system_message(''DUPLICATE_USER''));',
'                        commit;',
'                    l_valid := false;',
'                    exit;',
'                end loop;',
'            end if;',
'',
'            if l_valid then',
'                apex_collection.add_member(',
'                    p_collection_name => ''BULK_USER_VALID'',',
'                    p_c001            => upper(l_username));',
'                    commit;',
'            end if;',
'',
'        end if;',
'        l_username := null;',
'    end loop;',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(801912771858279871.4752)
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(801915272354279876.4752)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'init collections'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_collection.CREATE_OR_TRUNCATE_COLLECTION (''BULK_USER_INVALID'');',
'wwv_flow_collection.CREATE_OR_TRUNCATE_COLLECTION (''BULK_USER_CREATE'');'))
);
null;
end;
/
prompt --application/pages/page_00303
begin
wwv_flow_api.create_page(
 p_id=>303.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Créer plusieurs utilisateurs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Créer plusieurs utilisateurs'
,p_step_sub_title=>'Create Multiple Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(805159035944749645)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.uReportList {',
'    margin: 0;',
'    list-style: none;',
'}',
'.uReportList li {',
'    margin: 0 0 4px 0;',
'}',
'.check_icon {',
'    display: inline-block;',
'    width: 16px;',
'    height: 16px;',
'    line-height: 16px;',
'    background: #69B86B;',
'    color: #FFF;',
'    text-align: center;',
'    border-radius: 12px;',
'    font-size: 15px;',
'    border: 1px solid green;',
'    text-shadow: 0 -1px 0 rgba(0,0,0,.15);',
'    vertical-align: top;',
'    margin-right: 4px;',
'}',
'.valid_user {',
'    display: inline-block;',
'    padding: 4px 8px 4px 4px;',
'    border: 1px solid #D0D0D0;',
'    border-radius: 3px;',
'    line-height: 20px;',
'    background-color: #F8F8F8;',
'    color: #404040;',
'}'))
,p_step_template=>wwv_flow_api.id(741371098457994312.4752)
,p_required_role=>wwv_flow_api.id(1020614257688498212)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEADM/aadm_users.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801930208766292145.4752)
,p_plug_name=>'Top Bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(801931007075292146.4752)
,p_name=>'Utilisateurs valides'
,p_template=>wwv_flow_api.id(805699740467941340.4752)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'a-Region--flush:is-expanded:a-Region--noPadding:a-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:a-Report--stretch'
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'    case when :P302_STRIP_DOMAIN = ''N'' then',
'        lower(c001)',
'    else',
'        lower(substr(c001,1,instr(c001,''@'') - 1))',
'    end as username',
'from',
'    apex_collections',
'where',
'    collection_name = ''BULK_USER_VALID''',
'order by',
'    1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'Aucune adresse électronique valide n''a été trouvée.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(801931278586292147.4752)
,p_query_column_id=>1
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>1
,p_column_heading=>'Nom(s) utilisateur'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<div class="u-alignTop"><span class="a-Icon icon-check u-textSuccess"></span> #USERNAME#</div>'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(801931409743292147.4752)
,p_name=>'Utilisateurs non valides'
,p_template=>wwv_flow_api.id(805699740467941340.4752)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'a-Region--flush:is-expanded:a-Region--noBorder'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'    case when :P302_STRIP_DOMAIN = ''N'' then',
'        lower(c001)',
'    else',
'        lower(substr(c001,1,instr(c001,''@'') - 1))',
'    end as username,',
'    c002 reason',
'from',
'    apex_collections',
'where',
'    collection_name = ''BULK_USER_INVALID''',
'order by',
'    1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'Aucun nouvel utilisateur non valide n''a été trouvé'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(801931653273292147.4752)
,p_query_column_id=>1
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>1
,p_column_heading=>'Nom(s) utilisateur'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(805572136806814040.4752)
,p_query_column_id=>2
,p_column_alias=>'REASON'
,p_column_display_sequence=>2
,p_column_heading=>'Pourquoi n''est-ce pas valide ?'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(801931985785292147.4752)
,p_plug_name=>'Créer plusieurs utilisateurs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805132117516607920.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805565776704660721.4752)
,p_plug_name=>'Eléments masqués'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805570158936760911.4752)
,p_plug_name=>'Valid Users Exists'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>16
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-Wizard-regionHeader">'');',
'sys.htp.p(wwv_flow_lang.system_message(''ABOUT_TO_CREATE_USERS'', :P303_VALID_COUNT));',
'if :P303_INVALID_COUNT > 0 then',
'    sys.htp.p(wwv_flow_lang.system_message(''INVALID_USERS_NOT_CREATED'', :P303_INVALID_COUNT));',
'end if;',
'sys.htp.p(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'  from apex_collections',
' where collection_name = ''BULK_USER_VALID'''))
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805570574949788758.4752)
,p_plug_name=>'Il n''existe aucun utilisateur valide'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>17
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>La liste de noms utilisateur de la page précédente ne contient aucun nom utilisateur valide, mais &P303_INVALID_COUNT. noms utilisateur non valides. Revenez à l''écran précédent et vérifiez la liste de noms utilisateur fournie.</p>'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'  from apex_collections',
' where collection_name = ''BULK_USER_VALID'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801930430813292145.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(801930208766292145.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801930665459292145.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(801930208766292145.4752)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:a-Button--large'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer des utilisateurs valides'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(801930872562292146.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(801930208766292145.4752)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404711161197908978.4752)
,p_button_image_alt=>'< Précédent'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'icon-left-chevron'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(801932483224292148.4752)
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805567015654677130.4752)
,p_name=>'P303_VALID_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(805565776704660721.4752)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select count(*)',
'  from apex_collections',
' where collection_name = ''BULK_USER_VALID'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805567384283686280.4752)
,p_name=>'P303_INVALID_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(805565776704660721.4752)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select count(*)',
'  from apex_collections',
' where collection_name = ''BULK_USER_INVALID'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(801932143563292147.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Users'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_collection.truncate_collection(''BULK_USER_CREATE'');',
'',
'for c in',
'(',
'    select ',
'        case when :P302_STRIP_DOMAIN = ''N'' then',
'            lower(c001)',
'        else',
'            lower(substr(c001,1,instr(c001,''@'') - 1))',
'        end as username',
'    from',
'        apex_collections',
'    where',
'        collection_name = ''BULK_USER_VALID''',
'    order by',
'        1',
')',
'loop',
'    apex_collection.add_member(',
'        p_collection_name => ''BULK_USER_CREATE'',',
'        p_c001            => upper(c.username),',
'        p_c002            => c.username);',
'        commit;',
'end loop;',
'',
'wwv_flow_fnd_user_api.create_user_from_collection (',
'    p_security_group_id         => :flow_security_group_id,',
'    p_web_password              => :P302_WEB_PASSWORD,',
'    p_allow_access_to_schemas   => null,',
'    p_default_schema            => :P302_DEFAULT_SCHEMA,',
'    p_developer                 => :P302_DEVELOPER,',
'    p_admin                     => :P302_ADMIN,',
'    p_allow_app_building_yn     => case when :P302_ADMIN = ''Y'' or :P302_DEVELOPER = ''Y'' then ''Y'' else ''N'' end,',
'    p_allow_sql_workshop_yn     => case when :P302_ADMIN = ''Y'' or :P302_DEVELOPER = ''Y'' then ''Y'' else ''N'' end,',
'    p_allow_websheet_dev_yn     => case when :P302_ADMIN = ''Y'' or :P302_DEVELOPER = ''Y'' then ''Y'' else ''N'' end,',
'    p_allow_team_development_yn => case when :P302_ADMIN = ''Y'' or :P302_DEVELOPER = ''Y'' then ''Y'' else ''N'' end);',
'',
'---------------------',
'-- delete collections',
'--',
'wwv_flow_collection.DELETE_COLLECTION(''BULK_USER_INVALID'');',
'wwv_flow_collection.DELETE_COLLECTION(''BULK_USER_VALID'');',
'wwv_flow_collection.DELETE_COLLECTION(''BULK_USER_CREATE'');',
'',
'commit;'))
,p_process_error_message=>'Erreur inattendue lors de la création d''utilisateurs'
,p_process_success_message=>'Utilisateurs créés'
);
end;
/
prompt --application/pages/page_00305
begin
wwv_flow_api.create_page(
 p_id=>305.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Supprimer plusieurs utilisateurs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Supprimer plusieurs utilisateurs'
,p_step_sub_title=>'Delete Multiple Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(805159035944749645)
,p_step_template=>wwv_flow_api.id(741368521013994306.4752)
,p_required_role=>wwv_flow_api.id(1020614257688498212)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEADM/aadm_del_multi_users.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805152858409739453.4752)
,p_plug_name=>'Utilisateurs'
,p_region_template_options=>'#DEFAULT#:a-IRR-region--noOuterBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(805538978589340502.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select case',
'      when u."USER"=:APP_USER then null',
'      else wwv_flow_item.checkbox(1,wwv_flow_escape.html(user_id),''title="''||wwv_flow_lang.system_message(''SELECT_ROW_C'', wwv_flow_escape.html(u."USER"))||''"'')',
'    end c,',
'    alt,',
'    "USER",',
'    "eMail",',
'    first_name,',
'    last_name,',
'    df, -- default schema',
'    developer,',
'    last_login,',
'    last_login2,',
'    builder_login_count,',
'    ul, -- is user locked?',
'    expiration,',
'    description,',
'    password_lifespan_days,',
'    password_lifespan_accesses,',
'    password_accesses_left,',
'    last_agent,',
'    last_ip,',
'    account_expiry,',
'    failed_access_attempts,',
'    change_password_on_first_use,',
'    first_password_use_occurred,',
'    dev_type,',
'    group_id,',
'    group_name,',
'    last_update_date,',
'    last_updated_by,',
'    creation_date,',
'    created_by,',
'    allow_app_building,',
'    allow_sql_workshop,',
'    allow_websheet_dev,',
'    allow_team_devopment',
'from wwv_flow_workspace_users u',
'where workspace_id = :flow_security_group_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(805153049948739455.4752)
,p_name=>'Internal Accounts'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'Cette requête renvoie plus de 10 000 lignes. Filtrez vos données pour être sûr d''obtenir des résultats complets.'
,p_no_data_found_message=>'Aucune donnée n''a été trouvée.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_link_column=>'LINK'
,p_icon_view_img_src_column=>'ICON_VIEW_ICON'
,p_icon_view_label_column=>'ICON_VIEW_NAME'
,p_icon_view_columns_per_row=>5
,p_owner=>'MIKE'
,p_internal_uid=>805153049948739455
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154452851739462.4752)
,p_db_column_name=>'USER'
,p_display_order=>2
,p_column_identifier=>'F'
,p_column_label=>'Utilisateur'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154562844739462.4752)
,p_db_column_name=>'eMail'
,p_display_order=>3
,p_column_identifier=>'G'
,p_column_label=>'Adresse électronique'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154697017739463.4752)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>4
,p_column_identifier=>'H'
,p_column_label=>'Prénom'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154775931739463.4752)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>5
,p_column_identifier=>'I'
,p_column_label=>'Nom de famille'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154862480739463.4752)
,p_db_column_name=>'DF'
,p_display_order=>6
,p_column_identifier=>'J'
,p_column_label=>'Schéma par défaut'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155265465739463.4752)
,p_db_column_name=>'UL'
,p_display_order=>7
,p_column_identifier=>'N'
,p_column_label=>'Verrouillé'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155449084739463.4752)
,p_db_column_name=>'DEV_TYPE'
,p_display_order=>8
,p_column_identifier=>'P'
,p_column_label=>'Type de compte'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154900740739463.4752)
,p_db_column_name=>'DEVELOPER'
,p_display_order=>9
,p_column_identifier=>'K'
,p_column_label=>'Statut du mot de passe'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155326334739463.4752)
,p_db_column_name=>'EXPIRATION'
,p_display_order=>10
,p_column_identifier=>'O'
,p_column_label=>'Compte utilisateur final'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155090045739463.4752)
,p_db_column_name=>'LAST_LOGIN'
,p_display_order=>11
,p_column_identifier=>'L'
,p_column_label=>'Date de dernière connexion à Builder'
,p_column_type=>'DATE'
,p_format_mask=>'&DATE_TIME_FORMAT.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155103748739463.4752)
,p_db_column_name=>'BUILDER_LOGIN_COUNT'
,p_display_order=>12
,p_column_identifier=>'M'
,p_column_label=>'Nombre de connexions à Builder'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154392117739462.4752)
,p_db_column_name=>'ALT'
,p_display_order=>14
,p_column_identifier=>'B'
,p_column_label=>'Alt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155508386739463.4752)
,p_db_column_name=>'LAST_LOGIN2'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Dernière connexion à Builder'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155691776739463.4752)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155776415739463.4752)
,p_db_column_name=>'PASSWORD_LIFESPAN_DAYS'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Durée de vie du mot de passe (jours)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155852146739464.4752)
,p_db_column_name=>'PASSWORD_LIFESPAN_ACCESSES'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Durée de vie du mot de passe - Accès'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805155941815739464.4752)
,p_db_column_name=>'PASSWORD_ACCESSES_LEFT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Nombre d''accès au mot de passe restants'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805156033975739464.4752)
,p_db_column_name=>'LAST_AGENT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Dernier agent'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805156134721739464.4752)
,p_db_column_name=>'LAST_IP'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Dernière adresse IP'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805156202268739464.4752)
,p_db_column_name=>'ACCOUNT_EXPIRY'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Expiration de compte'
,p_column_type=>'DATE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805156382420739464.4752)
,p_db_column_name=>'FAILED_ACCESS_ATTEMPTS'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Tentatives d''accès ayant échoué'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805156438203739464.4752)
,p_db_column_name=>'CHANGE_PASSWORD_ON_FIRST_USE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Modifier le mot de passe à la première utilisation'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153178863739460.4752)
,p_db_column_name=>'FIRST_PASSWORD_USE_OCCURRED'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Première utilisation du mot de passe effectuée'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153242925739461.4752)
,p_db_column_name=>'GROUP_ID'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'ID de groupe'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153314834739461.4752)
,p_db_column_name=>'GROUP_NAME'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Nom de groupe'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153423706739461.4752)
,p_db_column_name=>'LAST_UPDATE_DATE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Mis à jour'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153538236739461.4752)
,p_db_column_name=>'LAST_UPDATED_BY'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Mis à jour par'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153645096739461.4752)
,p_db_column_name=>'CREATION_DATE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Créé'
,p_column_type=>'DATE'
,p_format_mask=>'SINCE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153737217739461.4752)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Création par'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153874089739461.4752)
,p_db_column_name=>'ALLOW_APP_BUILDING'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Concepteur d''applications'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805153976154739461.4752)
,p_db_column_name=>'ALLOW_SQL_WORKSHOP'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Atelier SQL'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154030855739461.4752)
,p_db_column_name=>'ALLOW_WEBSHEET_DEV'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Feuilles Web'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154126292739462.4752)
,p_db_column_name=>'ALLOW_TEAM_DEVOPMENT'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Développement d''équipe'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(805154228669739462.4752)
,p_db_column_name=>'C'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'#CHECK_ALL_CHECKBOX#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805152413092739452.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805152858409739453.4752)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Réinitialiser'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:305:&SESSION.::&DEBUG.:RIR::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805152655703739453.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805152858409739453.4752)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer des utilisateurs'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805157722129739476.4752)
,p_branch_action=>'305'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805157376626739474.4752)
,p_validation_name=>'AtLeastOneSelected'
,p_validation_sequence=>10
,p_validation=>'wwv_flow.g_f01.count > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Vous devez sélectionner au moins un utilisateur à supprimer.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805152655703739453.4752)
,p_associated_item=>wwv_flow_api.id(.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1889782220188872433.4752)
,p_name=>'ADD CHECK ALL CHECKBOX'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(805152858409739453.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1889782368209872434.4752)
,p_event_id=>wwv_flow_api.id(1889782220188872433.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'PLUGIN_COM.ORACLE.APEX.ADD_CHECKALL_CHECKBOX'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805157495139739475.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete users'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for i in 1..wwv_flow.g_f01.count loop',
'   wwv_flow_fnd_user_api.remove_fnd_user(',
'             p_user_id => to_number(wwv_flow.g_f01(i)));',
'end loop;'))
,p_process_error_message=>'Echec de la suppression d''utilisateurs.'
,p_process_when_button_id=>wwv_flow_api.id(805152655703739453.4752)
,p_process_success_message=>'Utilisateurs supprimés.'
);
end;
/
prompt --application/pages/page_00306
begin
wwv_flow_api.create_page(
 p_id=>306.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Modifier un utilisateur'
,p_page_mode=>'NORMAL'
,p_step_title=>'Modifier un utilisateur'
,p_step_sub_title=>'Edit User'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="javascript">',
'<!--',
'function confirmaction(){',
'        if (document.wwv_flow.F4750_P306_EMAIL_ADDRESS.value != document.wwv_flow.F4750_P306_ORG_EMAIL_ADDRESS.value){',
'	if(confirm("Are you sure you want to change the email address?")){',
'		doSubmit(''ApplyChanges'') ;',
'          }',
'        }else{',
'            doSubmit(''ApplyChanges'') ;',
'        }',
' }',
'//-->',
'</script>'))
,p_step_template=>wwv_flow_api.id(741366253443994295.4752)
,p_required_role=>wwv_flow_api.id(1020614257688498212)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'AEADM/aadm_users.htm'
,p_last_upd_yyyymmddhh24miss=>'20150428184038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805476722517047764.4752)
,p_plug_name=>'Modifier un utilisateur'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>wwv_flow_api.id(1939532588110833.4752)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'generated 19-FEB-2000 22:09:25'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805481624163047770.4752)
,p_plug_name=>'Utilisateurs de &PRODUCT_NAME.'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Ce gestionnaire d''utilisateurs gère les comptes utilisés par les modèles d''authentification qui effectuent l''authentification par rapport aux noms utilisateur et aux mots de passe enregistrés dans ces comptes.</p>',
'<p>Si vous voulez modifier le mot de passe d''un utilisateur, saisissez un nouveau mot de passe. Sinon, laissez les colonnes de mot de passe à Null ; le mot de passe restera inchangé.</p>'))
,p_plug_query_row_template=>wwv_flow_api.id(1939532588110833.4752)
,p_plug_query_num_rows=>1500
,p_plug_query_num_rows_type=>'ROWS_X_TO_Y_OF_Z'
,p_plug_column_width=>'valign="top"'
,p_plug_query_show_nulls_as=>'(null)'
,p_plug_query_col_allignments=>'L:L:R:L:L:L:L:L'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805481820598047770.4752)
,p_plug_name=>'Privilèges du compte'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805489136243047777.4752)
,p_plug_name=>'reset'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':F4750_P306_WEB_PASSWORD := null;',
':F4750_P306_USER_PASSWORD := null;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805489399242047777.4752)
,p_plug_name=>'Gérer les utilisateurs'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'sys.htp.prn(wwv_flow_lang.system_message(''PKG_APP_USER_TYPE_DESCRIPTION''));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805489568429047778.4752)
,p_plug_name=>'Sélecteur d''affichage de région'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404672496027804677.4752)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805490464350047780.4752)
,p_plug_name=>'Utilisateur : &F4750_P306_USER_NAME.'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noUI:a-ButtonRegion--showTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_column_width=>'valign="top"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(805491259930047781.4752)
,p_plug_name=>'&F4350_PASSWORD_REGION_TITLE.'
,p_region_template_options=>'#DEFAULT#:a-Region--paddedBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805490644256047780.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(805490464350047780.4752)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805490871563047781.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(805490464350047780.4752)
,p_button_name=>'Delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Supprimer un utilisateur'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:confirmDelete(''&DELETE_MSG.'',''Delete'');'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1 from dual where :F4750_P306_USER_ID is null',
'union all',
'select 1 from wwv_flow_developers where user_id = nvl(:F4750_P306_USER_ID,-1) and upper(userid)=upper(:FLOW_USER) and security_group_id=:FLOW_SECURITY_GROUP_ID'))
,p_button_condition_type=>'NOT_EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(805491074986047781.4752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(805490464350047780.4752)
,p_button_name=>'ApplyChanges'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:confirmaction();'
,p_button_condition=>'F4750_P306_USER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805507274863047807.4752)
,p_branch_action=>'306'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'ADD_PRIV'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805507463953047808.4752)
,p_branch_action=>'306'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(2952830054296949.4752)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(805507663918047808.4752)
,p_branch_name=>'Go To Page &LAST_VIEW.'
,p_branch_action=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.::::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805476921966047766.4752)
,p_name=>'F4750_P306_USER_ID'
,p_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805477148150047766.4752)
,p_name=>'F4750_P306_COMPANY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Espace de travail :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'class="fieldtitlebold"'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Identifie l''espace de travail auquel appartient l''utilisateur.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805477651541047766.4752)
,p_name=>'F4750_P306_USER_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Nom utilisateur'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_read_only_when=>'F4750_P306_USER_NAME'
,p_read_only_when2=>'&APP_USER.'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Indique le nom utilisateur employé pour la connexion au système. Les noms utilisateur sont soumis aux restrictions suivantes : <ul><li>',
'longueur maximale : 100 caractères</li><li>',
'pas d''espaces</li>',
'<li>seuls caractères spéciaux autorisés : @ et point (.)</li></ul>',
'<p>Le nom utilisateur peut également être employé pour faire référence à l''activité de l''utilisateur dans les applications de surveillance. La variable attachée <code>:app_user</code> renvoie la valeur de l''utilisateur en cours lors de la constructio'
||'n des applications.</p>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805478117441047766.4752)
,p_name=>'F4750_P306_EMAIL_ADDRESS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Adresse électronique'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indique l''adresse électronique à utiliser dans la correspondance générale, les notifications de réinitialisation des mots de passe, etc.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805478659870047767.4752)
,p_name=>'F4750_P306_ORG_EMAIL_ADDRESS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_source=>'&F4750_P306_ORG_EMAIL_ADDRESS.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805478898050047767.4752)
,p_name=>'F4750_P306_START_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805479084861047768.4752)
,p_name=>'F4750_P306_END_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805479289917047768.4752)
,p_name=>'F4750_P306_EMPLOYEE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805479420071047768.4752)
,p_name=>'F4750_P306_PERSON_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_item_default=>'E'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805479626327047769.4752)
,p_name=>'F4750_P306_FIRST_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Prénom'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez le prénom de l''utilisateur, pour préciser son identité. Ce champ facultatif n''est utilisé qu''à des fins d''information.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805480115055047769.4752)
,p_name=>'F4750_P306_LAST_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Nom de famille'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indiquez le nom de famille de l''utilisateur, pour préciser son identité. Ce champ facultatif n''est utilisé qu''à des fins d''information.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805480656568047770.4752)
,p_name=>'P306_DESCRIPTION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>3
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Utilisez ce champ pour enregistrer des commentaires sur l''utilisateur, à des fins d''information uniquement.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805481193543047770.4752)
,p_name=>'P306_DEFAULT_DATE_FORMAT'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Default Date Format'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Spécifiez le format de date Oracle par défaut pour l''utilisateur. Cela contrôlera le format de date par défaut dans SQL Workshop.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805482085475047770.4752)
,p_name=>'F4750_P306_DEFAULT_SCHEMA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_prompt=>'Schéma par défaut'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LIST_AVAILABLE_SCHEMAS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_escape.html(schema) d, schema r',
'',
'from   wwv_flow_company_schemas',
'',
'where  security_group_id = :flow_security_group_id',
'',
'order by 1'))
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'N'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>'Indique le schéma par défaut utilisé pour l''exploration des données, la création d''application et l''exécution de script SQL. Lors de l''utilisation d''espaces de travail où plusieurs schémas sont disponibles, le schéma indiqué ici est le schéma par déf'
||'aut pour la création d''applications, l''exécution de requêtes SQL, etc. Cette fonctionnalité ne contrôle pas la sécurité, seulement la préférence de l''utilisateur.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805482577589047771.4752)
,p_name=>'F4750_P306_ACCESS_TO_SCHEMAS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_prompt=>'Schémas accessibles (Null pour tous)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'N'
,p_help_text=>'Saisissez la liste des schémas, séparés par des deux-points, pour lesquels ce développeur a des droits d''accès lorsqu''il utilise l''atelier SQL. La liste des schémas saisie ici limite l''utilisateur à un sous-ensemble des schémas fournis pour l''espace '
||'de travail et détermine les noms de schéma que l''utilisateur visualise dans l''atelier SQL.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805483093454047772.4752)
,p_name=>'F4750_P306_DEVELOPER_ROLE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805483273721047772.4752)
,p_name=>'P306_ADMIN'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_item_default=>'N'
,p_prompt=>'L''utilisateur est un administrateur d''espace de travail :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'onClick="javascript:if (document.forms[0].P56_ADMIN_0.checked) document.forms[0].P56_DEVELOPER_0.checked = true;"'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Indiquez si cet utilisateur doit disposer des privilèges d''administrateur d''espace de travail. Les administrateurs ont accès à tous les composants. Ils peuvent également gérer les comptes utilisateur et les services de développement.',
'',
'Certains composants risquent de ne pas être disponibles s''ils sont désactivés par les administrateurs d''instance.'))
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
,p_attribute_04=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805483794897047773.4752)
,p_name=>'P306_DEVELOPER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_item_default=>'N'
,p_prompt=>'L''utilisateur est un développeur :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'DEVELOPER TYPE'
,p_lov=>'.'||wwv_flow_api.id(801895490296261989)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'onClick="javascript:if (document.forms[0].P56_ADMIN_0.checked) document.forms[0].P56_DEVELOPER_0.checked = true;"'
,p_read_only_when=>'not wwv_flow_authentication_dev.can_edit_builder_users'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'Indiquez si l''utilisateur doit disposer de privilèges de développeur. Les développeurs peuvent installer, enlever ou mettre à niveau des applications packagées.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
,p_attribute_04=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805484251562047773.4752)
,p_name=>'P306_ALLOW_APP_BUILDING_YN'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès au concepteur d''applications'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nvl(ALLOW_APP_BUILDING_YN,''Y'')',
'from wwv_flow_fnd_user ',
'where user_id = :F4750_P306_USER_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au concepteur d''applications.<br>',
'<br>',
'Un administrateur a toujours accès au concepteur d''applications.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au concepteur d''applications pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805484726459047774.4752)
,p_name=>'P306_DISALLOW_APP_BUILDING'
,p_item_sequence=>201
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès au concepteur d''applications'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au concepteur d''applications.<br>',
'<br>',
'Un administrateur a toujours accès au concepteur d''applications.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au concepteur d''applications pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805485207898047774.4752)
,p_name=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès au développement de feuilles Web'
,p_source=>'select ALLOW_WEBSHEET_DEV_YN from wwv_flow_fnd_user where user_id = :F4750_P306_USER_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au développement de feuilles Web.<br>',
'<br>',
'Un administrateur a toujours accès au développement de feuilles Web.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement de feuilles Web pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805485738575047775.4752)
,p_name=>'P306_DISALLOW_WEBSHEET_DEV'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès au développement de feuilles Web'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès au développement de feuilles Web.<br>',
'<br>',
'Un administrateur a toujours accès au développement de feuilles Web.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement de feuilles Web pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805486274035047775.4752)
,p_name=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès à l''atelier SQL'
,p_source=>'select ALLOW_SQL_WORKSHOP_YN from wwv_flow_fnd_user where user_id = :F4750_P306_USER_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès à l''atelier SQL.<br>',
'<br>',
'Un administrateur a toujours accès à l''atelier SQL.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès à l''atelier SQL pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805486791836047775.4752)
,p_name=>'P306_DISALLOW_SQL_WORKSHOP'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès à l''atelier SQL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un développeur a accès à l''atelier SQL.<br>',
'<br>',
'Un administrateur a toujours accès à l''atelier SQL.<br>',
'Un développeur doit avoir accès au concepteur d''applications et/ou à l''atelier SQL.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès à l''atelier SQL pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805487282904047776.4752)
,p_name=>'P306_ALLOW_TEAM_DEVELOPMENT_YN'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Accès au développement d''équipe'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ALLOW_TEAM_DEVELOPMENT_YN ',
'from wwv_flow_fnd_user ',
'where user_id = :F4750_P306_USER_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un utilisateur a accès au développement d''équipe.<br>',
'<br>',
'Un administrateur a toujours accès au développement d''équipe.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement d''équipe pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805487734768047776.4752)
,p_name=>'P306_DISALLOW_TEAM_DEVELOPMENT'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Accès au développement d''équipe'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Détermine si un utilisateur a accès au développement d''équipe.<br>',
'<br>',
'Un administrateur a toujours accès au développement d''équipe.<br>',
'<br>',
'Cet attribut est toujours désactivé lorsqu''un administrateur a désactivé l''accès au développement d''équipe pour l''espace de travail.'))
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805488281662047776.4752)
,p_name=>'P306_ACCOUNT_EXPIRY'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805488437441047776.4752)
,p_name=>'P306_ACCOUNT_LOCKED'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(805481820598047770.4752)
,p_item_default=>'N'
,p_prompt=>'Disponibilité du compte'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACCOUNT_LOCK_STATUS'
,p_lov=>'.'||wwv_flow_api.id(805398623015787070)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Sélectionnez <b>Verrouillé</b> pour interdire l''utilisation du compte. Sélectionnez <b>Déverrouillé</b> pour en autoriser l''utilisation.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805489966639047779.4752)
,p_name=>'F4750_P306_GROUPS'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(805476722517047764.4752)
,p_prompt=>'Group Assignments:'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>6
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>L''utilisateur appartient aux groupes mis en évidence. Pour ajouter l''utilisateur à un groupe, cliquez sur son nom pour qu''il soit mis en évidence. Pour enlever l''utilisateur d''un groupe, cliquez de nouveau pour qu''il ne soit plus mis en évidence. '
||'</p>',
'<p>Les affectations à des groupes permettent aux développeurs de contrôler l''accès à des fonctions et fonctionnalités spécifiques par groupe.',
'Cette fonctionnalité de groupe est intégrée au concepteur d''applications. C''est avec l''authentification par cookie qu''elle fonctionne le mieux',
'(et qu''elle est la plus pratique). Elle n''est pas portable dans les différents modèles d''authentification.</p>',
''))
,p_attribute_01=>'Y'
,p_item_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'and user_id = :F4750_P306_USER_ID',
'',
''))
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805491451692047782.4752)
,p_name=>'F4750_P306_WEB_PASSWORD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mot de passe'
,p_post_element_text=>' <span class="instructiontext">Les mots de passe font l''objet d''une distinction entre les majuscules et les minuscules</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Le mot de passe est utilisé pour la connexion au système. Ne le saisissez que si vous voulez modifier le mot de passe en cours.'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805491931409047782.4752)
,p_name=>'F4750_P306_USER_PASSWORD'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirmer le mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Entrez de nouveau le mot de passe. Ne le saisissez que si vous voulez modifier le mot de passe en cours.'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805492442998047783.4752)
,p_name=>'P306_UPDATE_PW'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805492653436047784.4752)
,p_name=>'P306_FIRST_PWD_USE_OCCURRED'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805492824699047784.4752)
,p_name=>'P306_CHANGE_PWD_ON_FIRST_USE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_prompt=>'Demander la modification du mot de passe à la première utilisation'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_RETURNS_Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(801893675976261985)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Sélectionnez <b>Oui</b> pour demander à l''utilisateur de ce compte de modifier immédiatement le mot de passe après s''être connecté pour la première fois au moyen du mot de passe en cours. Cette règle s''applique à l''utilisation de ce compte pour l''adm'
||'inistration et le développement de l''espace de travail, ainsi qu''à son utilisation pour la connexion aux applications développées.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805493322626047784.4752)
,p_name=>'P306_EXPIRATION_STATUS1'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_prompt=>'Mot de passe du développeur ou de l''administrateur :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_display_when=>'P306_EXPIRATION_STATUS1'
,p_display_when2=>'NA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indique si le mot de passe a expiré ou est valide pour la connexion du développeur ou de l''administrateur d''espace de travail..'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805493891524047785.4752)
,p_name=>'P306_EXPIRATION_STATUS2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_prompt=>'Mot de passe de l''utilisateur final :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_display_when=>'P306_EXPIRATION_STATUS2'
,p_display_when2=>'NA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indique si le mot de passe a expiré ou est valide pour la connexion de l''utilisateur final.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805494323902047785.4752)
,p_name=>'P306_SHOW_EXPIRE_FLAG'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805494503718047785.4752)
,p_name=>'P306_EXPIRE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Invalider le mot de passe'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'select null d, ''Y'' r from dual'
,p_display_when=>'P306_SHOW_EXPIRE_FLAG'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'Cochez cette case pour invalider le mot de passe de l''utilisateur. Ceci affecte à la fois son accès en tant que développeur ou administrateur et son accès en tant qu''utilisateur final. Si le mot de passe est invalidé, la prochaine fois que l''utilisat'
||'eur accède à ce compte, il devra fournir son ancien mot de passe ainsi qu''un nouveau mot de passe pour pouvoir se connecter.'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(805495014527047785.4752)
,p_name=>'P306_FAILED_ACCESS_ATTEMPTS'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(805491259930047781.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(805495644034047790.4752)
,p_computation_sequence=>10
,p_computation_item=>'P306_CHANGE_PWD_ON_FIRST_USE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if nvl(:P306_CHANGE_PWD_ON_FIRST_USE,''N'') <> ''Y'' then',
'  return ''N'';',
'else',
'  return ''Y'';',
'end if;',
'',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(805495874977047790.4752)
,p_computation_sequence=>20
,p_computation_item=>'P306_EXPIRE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if nvl(:P306_EXPIRE,''N'') <> ''Y'' then',
'  return ''N'';',
'else',
'  return ''Y'';',
'end if;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(805496018421047790.4752)
,p_computation_sequence=>30
,p_computation_item=>'P306_ACCOUNT_LOCKED'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if nvl(:P306_ACCOUNT_LOCKED,''N'') <> ''Y'' then',
'  return ''N'';',
'else',
'  return ''Y'';',
'end if;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(805496297798047790.4752)
,p_computation_sequence=>40
,p_computation_item=>'P306_UPDATE_PW'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'length(:F4750_P306_USER_PASSWORD)'
,p_compute_when_type=>'%null%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805496468814047791.4752)
,p_validation_name=>'F4750_P306_USER_NAME not null'
,p_validation_sequence=>10
,p_validation=>'F4750_P306_USER_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Vous devez fournir un nom utilisateur.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805477651541047766.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805496619153047791.4752)
,p_validation_name=>'F4750_P306_USER_NAME'
,p_validation_sequence=>20
,p_validation=>'F4750_P306_USER_NAME'
,p_validation2=>'< >'
,p_validation_type=>'ITEM_IN_VALIDATION_CONTAINS_NO_CHAR_IN_STRING2'
,p_error_message=>'Nom utilisateur non valide.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805477651541047766.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805496875140047791.4752)
,p_validation_name=>'validate email'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_at  number;',
'  l_dot number;',
'begin',
'  l_at  := instr(nvl(:F4750_P306_EMAIL_ADDRESS,''x''),''@'');',
'  l_dot := instr(nvl(:F4750_P306_EMAIL_ADDRESS,''x''),''.'',l_at);',
'  return l_at > 1 and l_dot > 1 and (l_dot - l_at) > 1;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Adresse électronique non valide.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805478117441047766.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805497077259047791.4752)
,p_validation_name=>'default schema in accessible schemas'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'instr(upper(:F4750_P306_ACCESS_TO_SCHEMAS),:F4750_P306_DEFAULT_SCHEMA) > 0 or',
'v(''F4750_P306_ACCESS_TO_SCHEMAS'') is null'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Le schéma par défaut doit figurer dans les schémas accessibles.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805482085475047770.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805497271217047791.4752)
,p_validation_name=>'can''t remove admin from yourself'
,p_validation_sequence=>60
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :F4750_P306_USER_ID = wwv_flow_user_api.get_user_id(:FLOW_USER) and :P306_ADMIN = ''N'' then',
'  return false;',
'else',
'  return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Vous ne pouvez pas vous enlever à vous-même le privilège d''administration.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805483273721047772.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805497425906047791.4752)
,p_validation_name=>'Developer must have Access'
,p_validation_sequence=>70
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :P306_DEVELOPER = ''Y'' THEN',
'    IF :P306_ALLOW_APP_BUILDING_YN = ''N''',
'    AND :P306_ALLOW_SQL_WORKSHOP_YN = ''N'' THEN',
'      RETURN FALSE;',
'    END IF;',
'  END IF;',
'',
'  RETURN TRUE;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Un développeur doit détenir les droits d''accès au concepteur d''applications et/ou à l''atelier SQL.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805483794897047773.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805497655221047792.4752)
,p_validation_name=>'if change username, must reset password'
,p_validation_sequence=>105
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for c1 in (',
'   select user_name',
'     from wwv_flow_fnd_user',
'    where user_id = :F4750_P306_USER_ID',
'      and security_group_id = :flow_security_group_id )',
'loop',
'   if c1.user_name != :F4750_P306_USER_NAME and',
'      :F4750_P306_WEB_PASSWORD is null then',
'   return false;',
'   else return true;',
'   end if;',
'end loop;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Si vous mettez à jour le nom utilisateur, vous devez fournir un nouveau mot de passe.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805491451692047782.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805497847939047792.4752)
,p_validation_name=>'match password'
,p_validation_sequence=>120
,p_validation=>':F4750_P306_WEB_PASSWORD = :F4750_P306_USER_PASSWORD'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Le mot de passe n''a pas été confirmé correctement. Saisissez exactement le même mot de passe les deux fois.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':F4750_P306_WEB_PASSWORD is not null or',
':F4750_P306_USER_PASSWORD is not null'))
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805491931409047782.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(805498076422047792.4752)
,p_validation_name=>'strong password verification'
,p_validation_sequence=>130
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'return wwv_flow_security.strong_password_validation(',
'      p_username       => :F4750_P306_USER_NAME,',
'      p_password       => :F4750_P306_WEB_PASSWORD,',
'      p_old_password   => null,',
'      p_workspace_name => wwv_flow_security.find_company_name(:WORKSPACE_ID));'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_message=>'Erreur'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_authentication_dev.is_builder_password_required (',
'    p_developer_yn => :P306_DEVELOPER )'))
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(805491074986047781.4752)
,p_associated_item=>wwv_flow_api.id(805491451692047782.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'do not run for non-developers in SSO authentication mode'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(805499566708047800.4752)
,p_name=>'Set Admin Defaults'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P306_ADMIN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805499875666047800.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_DEVELOPER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805500006013047800.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>11
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_DEVELOPER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805500275196047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_DEVELOPER'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805500468814047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805500640817047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>31
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805500884027047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805501045220047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805501242572047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>51
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805501505931047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805501794074047801.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805501912622047802.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>71
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805502129196047802.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805502462365047802.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_TEAM_DEVELOPMENT_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805502631458047802.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>91
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_TEAM_DEVELOPMENT_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805502850860047803.4752)
,p_event_id=>wwv_flow_api.id(805499566708047800.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_TEAM_DEVELOPMENT_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(805502950507047803.4752)
,p_name=>'Set Developer Defaults'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P306_DEVELOPER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805503219897047803.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805503412421047803.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>11
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_APP_BUILDING_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805503650313047803.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805503824002047803.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>21
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_APP_BUILDING_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805504009155047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805504248994047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>31
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805504406743047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805504677467047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>41
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_WEBSHEET_DEV_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805504861921047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805505099885047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>51
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805505279268047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805505450596047804.4752)
,p_event_id=>wwv_flow_api.id(805502950507047803.4752)
,p_event_result=>'FALSE'
,p_action_sequence=>61
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_ALLOW_SQL_WORKSHOP_YN'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(805505534332047804.4752)
,p_name=>'Disable Disallow Application Building'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P306_DISALLOW_APP_BUILDING'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805505883539047805.4752)
,p_event_id=>wwv_flow_api.id(805505534332047804.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_DISALLOW_APP_BUILDING'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(805505912684047805.4752)
,p_name=>'Disable Disallow Websheet Dev'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P306_DISALLOW_WEBSHEET_DEV'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805506290911047805.4752)
,p_event_id=>wwv_flow_api.id(805505912684047805.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_DISALLOW_WEBSHEET_DEV'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(805506399068047805.4752)
,p_name=>'Disable Disallow SQL Workshop'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P306_DISALLOW_SQL_WORKSHOP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805506668499047805.4752)
,p_event_id=>wwv_flow_api.id(805506399068047805.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_DISALLOW_SQL_WORKSHOP'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(805506769461047807.4752)
,p_name=>'Disable Disallow Team Development'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P306_DISALLOW_TEAM_DEVELOPMENT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(805507034341047807.4752)
,p_event_id=>wwv_flow_api.id(805506769461047807.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_DISALLOW_TEAM_DEVELOPMENT'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805498147025047792.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'fetch user'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_fnd_user_api.fetch_fnd_user (',
'     p_user_id       => :F4750_P306_USER_ID,',
'     p_company       => :F4750_P306_COMPANY,',
'     p_user_name     => :F4750_P306_USER_NAME,',
'     p_first_name    => :F4750_P306_FIRST_NAME,',
'     p_last_name     => :F4750_P306_LAST_NAME,',
'     p_web_password  => :F4750_P306_WEB_PASSWORD,',
'     p_email_address => :F4750_P306_EMAIL_ADDRESS,',
'     p_start_date    => :F4750_P306_START_DATE,',
'     p_end_date      => :F4750_P306_END_DATE,',
'     p_employee_id   => :F4750_P306_EMPLOYEE_ID,',
'     p_allow_access_to_schemas => :F4750_P306_ACCESS_TO_SCHEMAS,',
'     p_person_type     => :F4750_P306_PERSON_TYPE,',
'     p_default_schema  => :F4750_P306_DEFAULT_SCHEMA,',
'     p_groups          => :F4750_P306_GROUPS,',
'     p_developer_role  => :F4750_P306_DEVELOPER_ROLE,',
'     p_description     => :P306_DESCRIPTION,',
'     p_account_expiry  => :P306_ACCOUNT_EXPIRY,',
'     p_account_locked  => :P306_ACCOUNT_LOCKED,',
'     p_failed_access_attempts => :P306_FAILED_ACCESS_ATTEMPTS,',
'     p_change_password_on_first_use => :P306_CHANGE_PWD_ON_FIRST_USE,',
'     p_first_password_use_occurred => :P306_FIRST_PWD_USE_OCCURRED',
'     );',
'',
'for c1 in (select default_date_format',
'           from wwv_flow_fnd_user',
'           where user_id = :F4750_P306_USER_ID',
'           and security_group_id =  :flow_security_group_id)',
'loop',
'    :P306_DEFAULT_DATE_FORMAT := c1.default_date_format;',
'    exit;',
'end loop;'))
,p_process_error_message=>'Erreur lors de l''extraction des informations utilisateur.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805498591751047793.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set values'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_site_account_lifetime number := ',
'    nvl(wwv_flow_platform.get_preference(''ACCOUNT_LIFETIME_DAYS''),45);',
'  l_workspace_account_lifetime number;',
'  l_account_last_updated date;',
'  l_dev_admin_expired boolean := false;',
'  l_end_user_expired boolean := false;',
'  l_found boolean := false;',
'begin',
':F4750_P306_ORG_EMAIL_ADDRESS := :F4750_P306_EMAIL_ADDRESS;',
'if :F4750_P306_DEVELOPER_ROLE is null then',
'  :P306_DEVELOPER := ''N'';',
'  :P306_ADMIN := ''N'';',
'elsif instr(:F4750_P306_DEVELOPER_ROLE,''ADMIN'') > 0 then',
'  :P306_DEVELOPER := ''Y'';',
'  :P306_ADMIN := ''Y'';',
'else',
'  :P306_DEVELOPER := ''Y'';',
'  :P306_ADMIN := ''N'';',
'end if;',
'--',
'-- account expiration notices',
'--',
'l_account_last_updated := nvl(:P306_ACCOUNT_EXPIRY, trunc(sysdate));',
'for c1 in (select ACCOUNT_LIFETIME_DAYS from WWV_FLOW_COMPANIES',
'           where provisioning_company_id = :flow_security_group_id) loop',
'  l_workspace_account_lifetime := nvl(c1.account_lifetime_days,l_site_account_lifetime);',
'end loop;',
'',
':P306_SHOW_EXPIRE_FLAG := ''N'';',
'if :P306_DEVELOPER = ''Y'' then',
'  if l_account_last_updated + l_site_account_lifetime < sysdate then',
'    l_dev_admin_expired := true;',
'    :P306_EXPIRATION_STATUS1 := wwv_flow_lang.system_message(''EXPIRED'');',
'  else',
'    :P306_EXPIRATION_STATUS1 := wwv_flow_lang.system_message(''VALID'');',
'    :P306_SHOW_EXPIRE_FLAG := ''Y'';',
'  end if;',
'else',
'  :P306_EXPIRATION_STATUS1 := ''NA'';',
'end if;',
'',
'for c1 in (select ACCOUNT_LIFETIME_DAYS from WWV_FLOW_COMPANIES',
'           where (',
'             EXPIRE_FND_USER_ACCOUNTS = ''Y'' or ',
'             wwv_flow_platform.get_preference(''EXPIRE_FND_USER_ACCOUNTS'') = ''Y'')',
'           and provisioning_company_id = :flow_security_group_id) loop',
'  l_found := true;',
'  if l_account_last_updated + l_workspace_account_lifetime < sysdate then',
'    l_end_user_expired := true;',
'    :P306_EXPIRATION_STATUS2 := wwv_flow_lang.system_message(''EXPIRED'');',
'  else',
'    :P306_EXPIRATION_STATUS2 := wwv_flow_lang.system_message(''VALID'');',
'    :P306_SHOW_EXPIRE_FLAG := ''Y'';',
'  end if;',
'end loop;',
'if not l_found then',
'  :P306_EXPIRATION_STATUS2 := ''NA'';',
'end if;',
'end;'))
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805498775565047799.4752)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'edit user'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare ',
'  l_p1                        varchar2(256) := v(''F4750_P306_WEB_PASSWORD'');',
'  l_p2                        varchar2(256) := v(''F4750_P306_USER_PASSWORD'');',
'  l_msg                       varchar2(4000);',
'  l_body_html                 varchar2(32767) := null;',
'  l_product_name              varchar2(500);',
'  l_developer_roles           varchar2(255) := null;',
'  l_ALLOW_APP_BUILDING_YN     varchar2(1);',
'  l_ALLOW_SQL_WORKSHOP_YN     varchar2(1);',
'  l_ALLOW_WEBSHEET_DEV_YN     varchar2(1);',
'  l_ALLOW_TEAM_DEVELOPMENT_YN varchar2(1);',
'begin',
'    if :F4750_P306_DEFAULT_SCHEMA is not null then',
'        wwv_flow_sw_api.check_priv(p_schema=>:F4750_P306_DEFAULT_SCHEMA);',
'    end if;',
'',
'    l_ALLOW_APP_BUILDING_YN     := case when :P306_ADMIN = ''Y'' or :P306_DEVELOPER = ''Y'' then ''Y'' else ''N'' end;',
'    l_ALLOW_SQL_WORKSHOP_YN     := case when :P306_ADMIN = ''Y'' or :P306_DEVELOPER = ''Y'' then ''Y'' else ''N'' end;',
'    l_ALLOW_WEBSHEET_DEV_YN     := case when :P306_ADMIN = ''Y'' or :P306_DEVELOPER = ''Y'' then ''Y'' else ''N'' end;',
'    l_ALLOW_TEAM_DEVELOPMENT_YN := case when :P306_ADMIN = ''Y'' or :P306_DEVELOPER = ''Y'' then ''Y'' else ''N'' end;',
'    ',
'    wwv_flow.update_cache_with_write(''F4750_P306_WEB_PASSWORD'',null);',
'    wwv_flow.update_cache_with_write(''F4750_P306_USER_PASSWORD'',null);',
'    ',
'    wwv_flow_fnd_developer_api.edit_fnd_user (',
'     p_user_id                      => :F4750_P306_USER_ID,           ',
'     p_user_name                    => :F4750_P306_USER_NAME,         ',
'     p_first_name                   => :F4750_P306_FIRST_NAME,          ',
'     p_last_name                    => :F4750_P306_LAST_NAME,',
'     p_web_password                 => l_p1,    ',
'     p_new_password                 => l_p2,                     ',
'     p_email_address                => :F4750_P306_EMAIL_ADDRESS,       ',
'     p_allow_access_to_schemas      => null,   ',
'     p_default_schema               => :F4750_P306_DEFAULT_SCHEMA, ',
'     p_default_date_format          => :P306_DEFAULT_DATE_FORMAT,',
'     p_group_ids                    => :null,',
'     P_DESCRIPTION                  => :P306_DESCRIPTION,',
'     --',
'     P_ACCOUNT_EXPIRY               => :P306_ACCOUNT_EXPIRY,',
'     P_ACCOUNT_LOCKED               => :P306_ACCOUNT_LOCKED,',
'     p_change_password_on_first_use => :P306_CHANGE_PWD_ON_FIRST_USE,',
'     p_first_password_use_occurred  => case when l_p1 is not null then ''N'' else :P306_FIRST_PWD_USE_OCCURRED end,',
'     --',
'     p_ALLOW_APP_BUILDING_YN        => l_ALLOW_APP_BUILDING_YN,',
'     p_ALLOW_SQL_WORKSHOP_YN        => l_ALLOW_SQL_WORKSHOP_YN,',
'     p_ALLOW_WEBSHEET_DEV_YN        => l_ALLOW_WEBSHEET_DEV_YN,',
'     p_ALLOW_TEAM_DEVELOPMENT_YN    => l_ALLOW_TEAM_DEVELOPMENT_YN',
'    );',
'',
'  --',
'  -- Mail the change of Email address',
'  --',
'  If :F4750_P306_ORG_EMAIL_ADDRESS <> :F4750_P306_EMAIL_ADDRESS then',
'    l_msg       := l_msg || wwv_flow_lang.system_message(''NEW_EMAIL_ADDRESS'') || chr(10) ',
'                      || :F4750_P306_EMAIL_ADDRESS || chr(10) || chr(10) || chr(10);',
'    l_msg       := l_msg || wwv_flow_utilities.host_url(''SCRIPT'') || chr(10);',
'   ',
'    l_body_html := wwv_flow_mail.convert_txt_to_html (',
'                       p_txt_message       => l_msg,',
'                       p_security_group_id => :flow_security_group_id );',
'    l_product_name := nvl(v(''PRODUCT_NAME''),''Oracle Application Express'');',
'',
'    wwv_flow_mail.send ( p_to        => :F4750_P306_ORG_EMAIL_ADDRESS,',
'                         p_from      => nvl(wwv_flow_platform.get_preference(''SMTP_FROM''),:F4750_P306_ORG_EMAIL_ADDRESS),',
'                         p_body      => l_msg,',
'                         p_body_html => l_body_html,',
'                         p_subj      => wwv_flow_lang.system_message(''CHANGE_PW_REQUEST'',l_product_name) );',
'  end if;',
'',
'  --',
'  -- Developer and Admin roles',
'  --',
'  if :P306_ADMIN = ''N'' and :P306_DEVELOPER = ''N'' then',
'    delete from wwv_flow_developers where user_id = :F4750_P306_USER_ID;',
'  else',
'    -- {Trigger on WWV_FLOW_DEVELOPERS sets all developer roles for ADMINS ',
'    --  irrespective of what set here providing includes ''ADMIN''} ',
'    if :P306_ADMIN = ''Y'' then ',
'      l_developer_roles := l_developer_roles||''ADMIN'';',
'    end if;',
'    if nvl(v(''P306_ALLOW_APP_BUILDING_YN''),''Y'') = ''Y'' then ',
'      if l_developer_roles is not null then',
'        l_developer_roles := l_developer_roles||'':'';',
'      end if;',
'      l_developer_roles := l_developer_roles||''CREATE:EDIT:HELP:MONITOR'';',
'    end if;',
'    if nvl(v(''P306_ALLOW_SQL_WORKSHOP_YN''),''Y'') = ''Y'' then',
'      if l_developer_roles is not null then',
'        l_developer_roles := l_developer_roles||'':'';',
'      end if;',
'      l_developer_roles := l_developer_roles||''SQL:MONITOR:DATA_LOADER'';',
'    end if;    ',
'    wwv_flow_fnd_developer_api.edit_developer_role(',
'             p_id              => 1,',
'             p_user_id         => :F4750_P306_USER_ID,',
'             p_user_name       => :F4750_P306_USER_NAME,',
'             p_developer_roles => l_developer_roles);',
'  end if;',
'end;'))
,p_process_error_message=>'Erreur lors de la mise à jour de l''utilisateur.'
,p_process_when_button_id=>wwv_flow_api.id(805491074986047781.4752)
,p_process_success_message=>'Utilisateur "&F4750_P306_USER_NAME." mis à jour.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805498998240047800.4752)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove user'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'wwv_flow_fnd_user_api.remove_fnd_user(',
'             p_user_id => :F4750_P306_USER_ID);'))
,p_process_error_message=>'Erreur lors de la suppression de &F4750_P306_USER_NAME..'
,p_process_when_button_id=>wwv_flow_api.id(805490871563047781.4752)
,p_process_success_message=>'Utilisateur &F4750_P306_USER_NAME. supprimé.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805499103434047800.4752)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'F4750_P306_WEB_PASSWORD,F4750_P306_USER_PASSWORD'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805499398118047800.4752)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'expire account'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_site_account_lifetime      number := nvl(wwv_flow_platform.get_preference(''ACCOUNT_LIFETIME_DAYS''),45);',
'  l_workspace_account_lifetime number;',
'  l_account_last_updated       date;',
'  l_account_next_updated       date;',
'begin',
'  l_account_last_updated := nvl(:P306_ACCOUNT_EXPIRY, trunc(sysdate));',
'  for c1 in (select ACCOUNT_LIFETIME_DAYS from WWV_FLOW_COMPANIES',
'              where provisioning_company_id = :flow_security_group_id)',
'  loop',
'      l_workspace_account_lifetime := nvl(c1.account_lifetime_days,l_site_account_lifetime);',
'  end loop;',
'  l_account_next_updated := trunc(sysdate) - greatest(l_workspace_account_lifetime,l_site_account_lifetime);',
'',
'  update wwv_flow_fnd_user ',
'     set account_expiry = l_account_next_updated ',
'   where :F4750_P306_USER_ID = user_id',
'     and security_group_id = :flow_security_group_id;',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(805491074986047781.4752)
,p_process_when=>':P306_EXPIRE = ''Y'' and nvl(:P306_UPDATE_PW,0) = 0'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(805498360362047793.4752)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'always developer if admin'
,p_process_sql_clob=>':P306_DEVELOPER := ''Y'';'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P306_ADMIN'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
);
end;
/
prompt --application/pages/page_00828
begin
wwv_flow_api.create_page(
 p_id=>828.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Installer l''application packagée'
,p_page_mode=>'MODAL'
,p_step_title=>'Installer l''application packagée'
,p_step_sub_title=>'Install Packaged Application'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_icons.css" type="text/css" media="screen" charset="utf-8">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_frame.css" type="text/css" media="screen" charset="utf-8">',
'',
'<link rel="stylesheet" href="#IMAGE_PREFIX#eba/css/cloud_app_details.css" type="text/css" media="screen" title="no title" charset="utf-8">',
'',
'<style>',
'span.ebaAppAvailable {',
'    display: inline-block;',
'    font: normal 14px/16px Arial, sans-serif;',
'    margin: 4px 5px 0 0;',
'    color: #f7941d;',
'    }',
'</style>'))
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'// extend jQuery selectors with a non case sensitive version',
'apex.jQuery.extend($.expr[":"], {',
'  "containsNC": function(pElem, pIdx, pMatch, pArray) {',
'                  return (pElem.textContent || pElem.innerText || "").toLowerCase().indexOf((pMatch[3] || "").toLowerCase()) >= 0;',
'                }',
'});',
'',
'',
'function initInstantFilter(){',
'  var $apps    = apex.jQuery(''#applications''),',
'      $allApps = $apps.clone(),',
'      lTimer;',
'',
'  function filterApplications(){',
'    var $filteredApps = $allApps.find("li:has(h3:containsNC(''"+$v(''p50_SEARCH'')+"''))");',
'    $apps.quicksand($filteredApps, {',
'      adjustHeight: false,',
'      useScaling: false,',
'      duration: 400,',
'      easing: ''easeInOutQuad''',
'    });',
'  };',
'',
'  // set a fixed size for the containing DIV to avoid flickering',
'  $apps.parent().css(''height'', $apps.parent().height() + ''px'').css(''min-width'', $apps.parent().width() + ''px'');',
'',
'  // everytime something is entered in our search field we want to execute the filter,',
'  // but only after a short delay to avoid flickering animations',
'  apex.jQuery(''#p50_SEARCH'')',
'    .keyup(function(pEvent){',
'      if (lTimer != undefined) {',
'        clearTimeout(lTimer);',
'      };',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        filterApplications();',
'      } else {',
'        lTimer = setTimeout(filterApplications, 300);',
'      }',
'    })',
'    .keypress(function(pEvent){',
'      if (pEvent.keyCode === 13 || pEvent.keyCode === 10) {',
'        pEvent.preventDefault();',
'        pEvent.stopImmediatePropagation();',
'      }',
'    });',
'',
'};',
''))
,p_javascript_code_onload=>'initInstantFilter();'
,p_step_template=>wwv_flow_api.id(740687851443061408.4752)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150428184038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(755599272547864571.4752)
,p_plug_name=>'navigation'
,p_component_template_options=>'#DEFAULT#:a-WizardSteps--slim'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(755598782624864560.4752)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(755602131069880061.4752)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'wwv_flow_global.g_cloud'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(806405890822441606.4752)
,p_plug_name=>'App Details Container'
,p_region_name=>'ebaAppFrameTable'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(806406219339441608.4752)
,p_plug_name=>'Installer l''application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_region_image_attr=>'style="margin:20px 40px 10px 10px" '
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(806407092769441610.4752)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
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
 p_id=>wwv_flow_api.id(806408479589441614.4752)
,p_plug_name=>'Paramètres d''authentification'
,p_region_name=>'PLUGIN'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="color:#FFFFFF;display:none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_footer=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script type="text/javascript">',
'// masquer instantanément les attributs dynamiques une fois affichés, ',
'// l''exécution de jQuery.ready peut être trop longue. ',
'apex.builder.dynamicAttributes.hide(''P4651_'');',
'</script>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(806411659565441620.4752)
,p_plug_name=>'Add Javascript code for Plugins'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'    -- create the onChange event for the P828_AUTH and',
'    -- also the initialization code for the dynamic attributes',
'    wwv_flow_plugin_dev.add_onload_code (',
'        p_plugin_type         => wwv_flow_plugin.c_plugin_type_authentication,',
'        p_type_page_item_name => ''P828_AUTH'',',
'        p_page_item_prefix    => ''P828_'' );',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(806407286428441610.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(806407092769441610.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(806407687719441613.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(806407092769441610.4752)
,p_button_name=>'Next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(758581488338548971.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'icon-right-chevron'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(806412441941441621.4752)
,p_branch_name=>'next step'
,p_branch_action=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492796407779370733.4752)
,p_name=>'P828_WORKSPACE_NAME'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom d''espace de travail :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select DISPLAY_NAME',
'from WWV_FLOW_COMPANIES',
'where PROVISIONING_COMPANY_ID = :flow_security_group_id'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492796679721373814.4752)
,p_name=>'P828_SCHEMA'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_prompt=>'Schéma :'
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492796853019377000.4752)
,p_name=>'P828_PROVIDER_COMPANY'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fournisseur :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select provider_company',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and provider_company is not null',
'  '))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492797065696379206.4752)
,p_name=>'P828_PROVIDER_EMAIL'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Courriel du fournisseur :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select provider_email',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and provider_email is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492797281238381967.4752)
,p_name=>'P828_MIN_APEX_VERSION'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Version minimale :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select min_apex_version',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and min_apex_version is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492797463567384055.4752)
,p_name=>'P828_RELEASED'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Publié :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select released',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and released is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(492797655776386305.4752)
,p_name=>'P828_LANGUAGES'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Langues :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select languages',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_display_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null',
'from wwv_flow_pkg_applications',
'where ( :P81_APP_TYPE = ''DATABASE'' and apex_application_id = :P83_APPLICATION_ID)',
'or (:P81_APP_TYPE = ''WEBSHEET'' and apex_websheet_id = :P83_APPLICATION_ID)',
'and languages is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806406056561441608.4752)
,p_name=>'P828_APPLICATION_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(806405890822441606.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806406447905441608.4752)
,p_name=>'P828_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806406668729441608.4752)
,p_name=>'P828_APP_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom d''application :'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_name  varchar2(255);',
'begin',
'  if :P81_APP_TYPE = ''DATABASE'' then ',
'    select app_name into l_name from wwv_flow_pkg_applications',
'     where apex_application_id = :P828_APPLICATION_ID;',
'  else',
'      select app_name into l_name from wwv_flow_pkg_applications',
'       where apex_websheet_id = :P828_APPLICATION_ID;',
'  end if;',
'  return l_name;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_cattributes_element=>'class="fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806406859586441609.4752)
,p_name=>'P828_AUTH'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(806406219339441608.4752)
,p_item_default=>'APEX'
,p_prompt=>'Authentification'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'case',
'  when wwv_flow_authentication_dev.get_internal_authentication = ''CLOUD_IDM'' then',
'    ''NATIVE_CLOUD_IDM''',
'  else',
'    ''NATIVE_APEX_ACCOUNTS''',
'end'))
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PACKAGED_APP_AUTH_OPTION'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.''|| name_with_prefix) as d,',
'       name_with_prefix      as r',
'  from wwv_flow_native_plugins',
' where plugin_type = ''AUTHENTICATION TYPE''',
'   and (          name_with_prefix = ''NATIVE_APEX_ACCOUNTS''',
'         or (     name_with_prefix = ''NATIVE_HTTP_HEADER_VARIABLE''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_HHEAD'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_LDAP''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_LDAP'') = ''Y'' )',
'         or (     name_with_prefix = ''NATIVE_IAS_SSO''',
'              and :P81_APP_TYPE    = ''DATABASE'' /* not yet implemented for websheets */',
'              and wwv_flow_platform.get_preference(''PKG_APP_AUTH_ALLOW_SSO'') = ''Y'' ))',
'union all',
'select wwv_flow_lang.system_message(''AUTHENTICATION_NAME.NATIVE_CLOUD_IDM''),',
'       ''NATIVE_CLOUD_IDM''',
'  from sys.dual',
' where wwv_flow_authentication_dev.get_internal_authentication = ''CLOUD_IDM'''))
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806408623610441617.4752)
,p_name=>'P828_ATTRIBUTE_01'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806408885234441617.4752)
,p_name=>'P828_ATTRIBUTE_02'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741012333966774170.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806409081064441618.4752)
,p_name=>'P828_ATTRIBUTE_03'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806409298246441618.4752)
,p_name=>'P828_ATTRIBUTE_04'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806409474555441618.4752)
,p_name=>'P828_ATTRIBUTE_05'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806409702516441618.4752)
,p_name=>'P828_ATTRIBUTE_06'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806409881446441618.4752)
,p_name=>'P828_ATTRIBUTE_07'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806410067095441618.4752)
,p_name=>'P828_ATTRIBUTE_08'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806410259550441618.4752)
,p_name=>'P828_ATTRIBUTE_09'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806410427249441618.4752)
,p_name=>'P828_ATTRIBUTE_10'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806410645254441619.4752)
,p_name=>'P828_ATTRIBUTE_11'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806410857047441619.4752)
,p_name=>'P828_ATTRIBUTE_12'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806411066113441619.4752)
,p_name=>'P828_ATTRIBUTE_13'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806411238449441619.4752)
,p_name=>'P828_ATTRIBUTE_14'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(806411434972441619.4752)
,p_name=>'P828_ATTRIBUTE_15'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(806408479589441614.4752)
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.PLUGIN_DYNAMIC_ATTRIBUTE'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(755608440143007972.4752)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(806407286428441610.4752)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(755608793776007973.4752)
,p_event_id=>wwv_flow_api.id(755608440143007972.4752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_11001
begin
wwv_flow_api.create_page(
 p_id=>11001.4752
,p_user_interface_id=>wwv_flow_api.id(539940534604132427.4752)
,p_name=>'Informations en retour'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Informations en retour'
,p_step_sub_title=>'Feedback'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'td_fb.htm'
,p_page_comment=>'This page was generated by the feedback wizard'
,p_last_upd_yyyymmddhh24miss=>'20150428184038'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(829721255038941612.4752)
,p_plug_name=>'Informations en retour'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(740771588500180474.4752)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1831121893546426040.4752)
,p_plug_name=>'Informations en retour existantes sur cette page'
,p_parent_plug_id=>wwv_flow_api.id(829721255038941612.4752)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_api.id(404667570222803088.4752)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1831121926658426041.4752)
,p_name=>'Informations en retour existantes'
,p_parent_plug_id=>wwv_flow_api.id(1831121893546426040.4752)
,p_template=>wwv_flow_api.id(404667570222803088.4752)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Region--hideHeader'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select id',
',      (select the_name from WWV_FLOW_FEEDBACK_TYPES ',
'        where id = f.FEEDBACK_TYPE',
'       ) feedback_type',
',      decode(f.feedback_comment, null, null',
'                                ,decode(greatest(100,length(f.feedback_comment)), 100, f.feedback_comment, substr(f.feedback_comment,1,100)||''...'') ',
'             ) feedback',
',      (select the_name ',
'        from wwv_flow_feedback_status',
'        where id = nvl(f.feedback_status,0)',
'       ) feedback_status',
',      decode(f.public_response,null,null',
'                               ,decode(greatest(100,length(f.public_response)),100, f.public_response,substr(f.public_response,1,100)||''...'')',
'             ) public_response',
',     trunc(CREATED_ON) created_date',
'from wwv_flow_feedback f',
'where f.application_id = :P11001_APPLICATION_ID',
'and   f.page_id = :P11001_PAGE_ID',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(741385154282007399.4752)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'Aucune information en retour saisie pour cette page.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1831122013825426042.4752)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1831122187593426043.4752)
,p_query_column_id=>2
,p_column_alias=>'FEEDBACK_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Type d''informations en retour'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1831122292218426044.4752)
,p_query_column_id=>3
,p_column_alias=>'FEEDBACK'
,p_column_display_sequence=>3
,p_column_heading=>'Informations en retour'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1831122323939426045.4752)
,p_query_column_id=>4
,p_column_alias=>'FEEDBACK_STATUS'
,p_column_display_sequence=>4
,p_column_heading=>'Statut des informations en retour'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1831122493214426046.4752)
,p_query_column_id=>5
,p_column_alias=>'PUBLIC_RESPONSE'
,p_column_display_sequence=>5
,p_column_heading=>'Réponse publique'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1831122584819426047.4752)
,p_query_column_id=>6
,p_column_alias=>'CREATED_DATE'
,p_column_display_sequence=>6
,p_column_heading=>'Créé'
,p_use_as_row_header=>'N'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(829723948212941618.4752)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(740735067061086300.4752)
,p_plug_display_sequence=>110
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
 p_id=>wwv_flow_api.id(829724329405941619.4752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(829723948212941618.4752)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Soumettre les informations en retour'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(829724171601941619.4752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(829723948212941618.4752)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(404710483554908976.4752)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(829721485791941614.4752)
,p_name=>'P11001_APPLICATION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(829721255038941612.4752)
,p_prompt=>'Application :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Application sur laquelle vous fournissez des informations en retour.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(829721931618941617.4752)
,p_name=>'P11001_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(829721255038941612.4752)
,p_prompt=>'Page :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fielddatabold'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Page sur laquelle vous fournissez des informations en retour.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(829722489187941618.4752)
,p_name=>'P11001_FEEDBACK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(829721255038941612.4752)
,p_prompt=>'Informations en retour pour le concepteur d''applications et le développement d''applications APEX'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>96
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(741376307162001773.4752)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Faites-nous part de vos commentaires pour nous aider à améliorer &PRODUCT_NAME..'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(829722929232941618.4752)
,p_name=>'P11001_FEEDBACK_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(829721255038941612.4752)
,p_prompt=>'Type d''informations en retour'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select the_name, id from WWV_FLOW_FEEDBACK_TYPES order by id'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Identifiez le type d''informations en retour.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(829723440981941618.4752)
,p_name=>'P11001_ATTRIBUTE1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(829721255038941612.4752)
,p_item_default=>'Other'
,p_prompt=>'Composant :'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Page Designer,Universal Theme,Template Options,Interactive Reports,Modal Pages,Navigation Lists,Mobile,Calendars,File Handling,Packaged Applications,Security,Other'
,p_field_template=>wwv_flow_api.id(741376158824001765.4752)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'Identifiez le composant ou la fonction associé à vos commentaires.'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(829724676691941620.4752)
,p_validation_name=>'P11001_ATTRIBUTE1 Not Null'
,p_validation_sequence=>10
,p_validation=>'P11001_ATTRIBUTE1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# doit comporter une valeur.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(829723440981941618.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(829724817666941621.4752)
,p_validation_name=>'Feedback not null'
,p_validation_sequence=>20
,p_validation=>'P11001_FEEDBACK'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'La valeur doit être indiquée'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(829724329405941619.4752)
,p_associated_item=>wwv_flow_api.id(829722489187941618.4752)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(829724961027941621.4752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit Feedback'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_util.submit_feedback (',
'    p_comment         => :P11001_FEEDBACK,',
'    p_type            => :P11001_FEEDBACK_TYPE,',
'    p_application_id  => :P11001_APPLICATION_ID,',
'    p_page_id         => :P11001_PAGE_ID,',
'    p_label_01       => ''Component'',',
'    p_attribute_01   => :P11001_ATTRIBUTE1);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(829724329405941619.4752)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(829725190931941621.4752)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
