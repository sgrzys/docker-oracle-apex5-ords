Rem  Copyright (c) Oracle Corporation 2006 - 2014. All Rights Reserved.
Rem

Rem    NAME
Rem      apex_install_dictionary_view_data.sql
Rem

Rem    DESCRIPTION
Rem      Insert data into tables wwv_flow_dictionary_views
Rem

Rem    MODIFIED     (MM/DD/YYYY)
Rem      pawolf      05/08/2014 - Moved from apex_install_data.sql
Rem      pawolf      05/23/2014 - Removed wwv_flow_templates.has_edit_links
Rem                             - Added wwv_flow_templates.grid_always_emit (feature #1433)
Rem      pmanirah    06/02/2014 - Renamed glv_new_column to glv_new_row (feature #1210)
Rem      pawolf      07/08/2014 - Added WHEN_SELECTION_TYPE_CODE and AFFECTED_ELEMENTS_TYPE_CODE to support Advisor deprecation warning (feature #1448)
Rem      hfarrell    07/09/2014 - In APEX_APPLICATION_TEMP_CALENDAR: renamed from P697_ID to F4000_P697_ID (as per David Gs item renaming)
Rem      msewtz      07/10/2014 - Added icon_library lookup to apex_application_themes
Rem      pawolf      07/22/2014 - Added wwv_flow_plugin_attributes.show_in_wizard
Rem      pawolf      07/25/2014 - Moved content_delivery_network, javascript_file_urls and include_legacy_javascript from wwv_flows into wwv_flow_user_interfaces (feature #1464)
Rem      davgale     08/06/2014 - Added navigation list position (feature 1472)
Rem      pawolf      08/08/2014 - Fixed rename of nav_list_position to navigation_list_position
Rem                             - Added missing columns to apex_application_themes
Rem      pawolf      08/13/2014 - Added APEX_APPL_CONCATENATED_FILES (feature #1340)
Rem      pawolf      08/14/2014 - Added include_jquery_migrate to wwv_flow_user_interfaces (feature #1475)
Rem      pawolf      09/01/2014 - Added edit urls for APEX_APPL_TEMP_PAGE_DP, APEX_APPL_TEMP_REGION_DP and APEX_APPLICATION_PAGE_REG_COLS
Rem      pawolf      09/05/2014 - Removed wrong lookup definition lov_entry_template from APEX_APPLICATION_LOV_ENTRIES
Rem      pawolf      10/17/2014 - Added apex_appl_developer_comments (bug# 16731390)
Rem      pawolf      10/17/2014 - Added p_deprecated_columns to avoid viewing similar columns twice (bug# 16599622)
Rem      hfarrell    10/21/2014 - Added nav_bar_type, nav_bar_type_code, default_nav_bar_list_template to apex_application_themes
Rem                               Added nav_bar_list, nav_bar_list_template to apex_appl_user_interfaces (feature #1536)
Rem      pawolf      11/12/2014 - Added wwv_flow_plugin_attributes.reference_scope (feature #1596)
Rem      arayner     11/28/2014 - Added FIXED_HEADER to inserts for APEX_APPLICATION_PAGE_IR and APEX_APPLICATION_PAGE_REGIONS (feature #1534)
Rem      hfarrell    12/11/2014 - Added default_dialogr_template and default_dialogbtnr_template, removed default_dialog_btr_template (verified by pmanirah that it is not required)

set define '^'

prompt
prompt ...insert into wwv_flow_dictionary_views
prompt

declare
    procedure store_dictionary_view (
        p_view_name             in varchar2,
        p_parent_view_name      in varchar2,
        p_component_type_id     in number   default null,
        p_pk_column_name        in varchar2,
        p_display_expression    in varchar2,
        p_order_expression      in varchar2,
        p_order_seq             in number,
        p_lookup_or_lov_columns in varchar2,
        p_deprecated_columns    in varchar2 default null,
        p_link_url              in varchar2 default null )
    is
        l_parent_view_id number;
    begin
        ------------------------------------------------------------------------
        -- get parent dictionary view.
        ------------------------------------------------------------------------
        if p_parent_view_name is not null
        then
            select id
              into l_parent_view_id
              from wwv_flow_dictionary_views
             where view_name = p_parent_view_name
            ;
        end if;
        ------------------------------------------------------------------------
        -- let's try an update first.
        ------------------------------------------------------------------------
        update wwv_flow_dictionary_views
           set parent_view_id        = l_parent_view_id,
               component_type_id     = p_component_type_id,
               pk_column_name        = p_pk_column_name,
               display_expression    = p_display_expression,
               order_expression      = p_order_expression,
               order_seq             = p_order_seq,
               lookup_or_lov_columns = p_lookup_or_lov_columns ||
                                       case when p_lookup_or_lov_columns is not null and p_deprecated_columns is not null then ',' end ||
                                       p_deprecated_columns,
               link_url              = p_link_url
         where view_name             = p_view_name
        ;
        ------------------------------------------------------------------------
        -- let's do an insert if nothing has been updated.
        ------------------------------------------------------------------------
        if sql%rowcount = 0
        then
            insert into wwv_flow_dictionary_views (
                view_name,
                parent_view_id,
                component_type_id,
                pk_column_name,
                display_expression,
                order_expression,
                order_seq,
                lookup_or_lov_columns,
                link_url )
            values (
                p_view_name,
                l_parent_view_id,
                p_component_type_id,
                p_pk_column_name,
                p_display_expression,
                p_order_expression,
                p_order_seq,
                p_lookup_or_lov_columns,
                p_link_url );
        end if;
    end store_dictionary_view;
begin
    ----------------------------------------------------------------------------
    -- Note:
    --   p_lookup_or_lov_columns should contain all the columns which are
    --   Yes/No flags, LOV columns with static values or columns joined from
    --   another table. For example template name.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATIONS',
        p_parent_view_name      => NULL,
        p_pk_column_name        => 'APPLICATION_ID',
        p_display_expression    => 'APPLICATION_ID||'' - ''||APPLICATION_NAME',
        p_order_expression      => 'TO_CHAR(APPLICATION_ID, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'APPLICATION_GROUP,LOGGING,APPLICATION_PRIMARY_LANGUAGE,LANGUAGE_DERIVED_FROM,AUTHENTICATION_SCHEME_TYPE,MEDIA_TYPE,AUTHENTICATION_SCHEME,AVAILABILITY_STATUS,DEBUGGING,EXACT_SUBSTITUTIONS,BUILD_STATUS,PUBLISH,AUTHORIZATION_SCHEME,SESSION_STATE_PROTECTION,AUTO_TIME_ZONE,CONTENT_DELIVERY_NETWORK,JAVASCRIPT_FILE_URLS,INCLUDE_LEGACY_JAVASCRIPT,DEFAULT_ERROR_DISPLAY_LOCATION,BROWSER_CACHE,BROWSER_FRAME,COMPATIBILITY_MODE,AUTHORIZE_PUBLIC_PAGES',
        p_deprecated_columns    => 'VPD,THEME_NUMBER,HOME_LINK,LOGIN_URL,PAGE_TEMPLATE,ERROR_PAGE_TEMPLATE,CONTENT_DELIVERY_NETWORK,JAVASCRIPT_FILE_URLS,INCLUDE_LEGACY_JAVASCRIPT',
        p_link_url              => 'f?p=4000:4001:%session%::::F4000_P1_FLOW,FB_FLOW_ID:%pk_value%,%pk_value%' );
    ----------------------------------------------------------------------------
    -- Page.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_component_type_id     => 5000,
        p_pk_column_name        => 'PAGE_ID',
        p_display_expression    => 'PAGE_ID||'' - ''||PAGE_NAME',
        p_order_expression      => 'TO_CHAR(PAGE_ID, ''0000000000'')',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'TAB_SET,PAGE_FUNCTION,ALLOW_DUPLICATE_SUBMISSIONS,INCLUDE_APEX_CSS_JS_YN,FOCUS_CURSOR,PAGE_TEMPLATE,AUTHORIZATION_SCHEME,BUILD_OPTION,PAGE_REQUIRES_AUTHENTICATION,PAGE_ACCESS_PROTECTION,PAGE_GROUP,FORM_AUTOCOMPLETE,PAGE_TRANSITION,POPUP_TRANSITION,READ_ONLY_CONDITION_TYPE,READ_ONLY_CONDITION_TYPE_CODE,CACHED,CACHE_CONDITION_TYPE,BROWSER_CACHE,PAGE_MODE,OVERWRITE_NAVIGATION_LIST,NAVIGATION_LIST,NAVIGATION_LIST_TEMPLATE,NAVIGATION_LIST_POSITION,NAV_LIST_TEMPLATE_OPTIONS',
        p_link_url              => 'f?p=4000:4301:%session%::NO::F4000_P4301_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_REGIONS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5110,
        p_pk_column_name        => 'REGION_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'PARENT_REGION_NAME,TEMPLATE,NEW_GRID,NEW_GRID_ROW,NEW_GRID_COLUMN,DISPLAY_REGION_SELECTOR,DISPLAY_COLUMN,DISPLAY_POSITION,DISPLAY_POSITION_CODE,DISPLAY_ITEM_POSITION,DISPLAY_ITEM_POSITION_CODE,BREADCRUMB_TEMPLATE,LIST_TEMPLATE_OVERRIDE,SOURCE_TYPE,SOURCE_TYPE_PLUGIN_NAME,ESCAPE_ON_HTTP_OUTPUT,AUTHORIZATION_SCHEME,CONDITION_TYPE,CONDITION_TYPE_CODE,READ_ONLY_CONDITION_TYPE,READ_ONLY_CONDITION_TYPE_CODE,REPORT_TEMPLATE,HEADINGS_TYPE,PAGINATION_SCHEME,PAGINATION_DISPLAY_POSITION,AJAX_ENABLED,REST_ENABLED,STRIP_HTML,REPORT_COLUMN_SOURCE_TYPE,CUSTOMIZATION,BUILD_OPTION,REGION_CACHING,CACHE_WHEN,BREAK_DISPLAY_FLAG,ENABLE_CSV_OUTPUT,TRANSLATE_REGION_TITLE,FIXED_HEADER',
        p_deprecated_columns    => 'SOURCE_TYPE_CODE,DISPLAY_COLUMN',
        p_link_url              => 'f?p=4000:4651:%session%:::4651,960,420:F4000_P4651_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_REG_COLS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 7710,
        p_pk_column_name        => 'REGION_COLUMN_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,DATA_TYPE,IS_VISIBLE,HEADING_ALIGNMENT,VALUE_ALIGNMENT,ESCAPE_ON_HTTP_OUTPUT,CONDITION_TYPE,CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,AUTHORIZATION_SCHEME_ID',
        p_order_seq             => 1,
        p_link_url              => 'f?p=4000:4486:%session%::NO:RP,4486:P4486_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_ITEMS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 5120,
        p_pk_column_name        => 'ITEM_ID',
        p_display_expression    => 'ITEM_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,DISPLAY_AS,DISPLAY_AS_CODE,ITEM_DATA_TYPE,IS_REQUIRED,STANDARD_VALIDATIONS,REGION,SOURCE_USED,ITEM_DEFAULT_TYPE,ITEM_LABEL_TEMPLATE,ITEM_SOURCE_TYPE,ENCRYPT_SESSION_STATE,READ_ONLY_CONDITION_TYPE,READ_ONLY_CONDITION_TYPE_CODE,LOV_NAMED_LOV,LOV_DISPLAY_EXTRA,LOV_DISPLAY_NULL,LOV_QUERY_RESULT_TRANSLATED,LOV_OPTIMIZE_REFRESH,NEW_GRID,NEW_GRID_ROW,NEW_GRID_COLUMN,LABEL_ALIGNMENT,ITEM_ALIGNMENT,CONDITION_TYPE,CONDITION_TYPE,MAINTAIN_SESSION_STATE,ITEM_PROTECTION_LEVEL,ESCAPE_ON_HTTP_OUTPUT,AUTHORIZATION_SCHEME,BUILD_OPTION,SHOW_QUICK_PICKS,BUTTON_EXECUTE_VALIDATIONS',
        p_deprecated_columns    => 'BEGINS_ON_NEW_ROW,BEGINS_ON_NEW_CELL,COLUMN_SPAN',
        p_link_url              => 'f?p=4000:4311:%session%::::F4000_P4311_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_RPT_COLS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => null, -- we don't really know if it's a tabular form or classic report columns
        p_pk_column_name        => 'REGION_REPORT_COLUMN_ID',
        p_display_expression    => 'COLUMN_ALIAS',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,USE_AS_ROW_HEADER,PAGE_CHECKSUM,COLUMN_ALIGNMENT,HEADING_ALIGNMENT,DEFAULT_SORT_DIRECTION,SORTABLE_COLUMN,SUM_COLUMN,COLUMN_IS_HIDDEN,COLUMN_FIELD_TEMPLATE,IS_REQUIRED,STANDARD_VALIDATIONS,CONDITION_TYPE,CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,DISPLAY_AS,DISPLAY_AS_CODE,NAMED_LIST_OF_VALUES,LOV_SHOW_NULLS,LOV_DISPLAY_EXTRA_VALUES,PRIMARY_KEY_COLUMN_SOURCE_TYPE,DERIVED_COLUMN,COLUMN_DEFAULT_TYPE,INCLUDE_IN_EXPORT',
        p_order_seq             => 2,
        p_link_url              => 'f?p=4000:422:%session%:::4651,960,420,422:P422_COLUMN_ID,P420_REGION_ID,F4000_P4651_ID,P960_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%parent_pk_value%,%parent_pk_value%,%parent_pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_BUTTONS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 5130,
        p_pk_column_name        => 'BUTTON_ID',
        p_display_expression    => 'BUTTON_NAME',
        p_order_expression      => 'TO_CHAR(BUTTON_SEQUENCE, ''0000000000'')',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION,BUTTON_TEMPLATE,IS_HOT_BUTTON,DISPLAY_POSITION,ALIGNMENT,EXECUTE_VALIDATIONS,CONDITION_TYPE,CONDITION_TYPE_CODE,DATABASE_ACTION,BUILD_OPTION,AUTHORIZATION_SCHEME,BUTTON_POSITION,BUTTON_ACTION,BUTTON_ACTION_CODE',
        p_deprecated_columns    => 'IMAGE_NAME,IMAGE_ATTRIBUTES',
        p_link_url              => 'f?p=4000:4314:%session%:::4314:F4000_P4314_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_FLASH5',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 5110,
        p_pk_column_name        => 'REGION_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 4,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,CHART_TYPE,CHART_ANIMATION,COLOR_SCHEME,CHART_BGTYPE,ASYNC_UPDATE,USE_CHART_XML,CHART_RENDERING',
        p_link_url              => 'f?p=4000:754:%session%::NO:754:P754_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_FLASH5_S',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_FLASH5',
        p_component_type_id     => 7520,
        p_pk_column_name        => 'SERIES_ID',
        p_display_expression    => 'SERIES_NAME',
        p_order_expression      => 'TO_CHAR(SERIES_SEQ, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,SERIES_TYPE,SERIES_QUERY_TYPE,SERIES_QUERY_PARSE_OPT,AUTHORIZATION_SCHEME,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION',
        p_link_url              => 'f?p=4000:834:%session%::NO::P754_ID,P834_SERIES_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%parent_pk_value%,%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_IR',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5110,
        p_pk_column_name        => 'REGION_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'REGION_NAME,PAGINATION_SCHEME,PAGINATION_DISPLAY_POSITION,BUTTON_TEMPLATE,SHOW_FINDER_DROP_DOWN,SHOW_DISPLAY_ROW_COUNT,SHOW_SEARCH_BAR,SHOW_SEARCH_TEXTBOX,SHOW_ACTIONS_MENU,SHOW_REPORTS_AS_TABS,SHOW_SELECT_COLUMNS,SHOW_ROWS_PER_PAGE,SHOW_FILTER,SHOW_SORT,SHOW_CONTROL_BREAK,SHOW_HIGHLIGHT,SHOW_COMPUTE,SHOW_AGGREGATE,SHOW_NOTIFY,SHOW_CHART,SHOW_GROUP_BY,SHOW_PIVOT,SHOW_FLASHBACK,SHOW_SAVE,SHOW_SAVE_PUBLIC,SAVE_PUBLIC_AUTH_SCHEME,SHOW_RESET,SHOW_DOWNLOAD,SHOW_HELP,DOWNLOAD_FORMATS,DETAIL_LINK_TYPE,DETAIL_LINK_CHECKSUM_TYPE,DETAIL_LINK_CONDITION_TYPE,DETAIL_LINK_COND_TYPE_CODE,DETAIL_LINK_AUTH_SCHEME,ICON_VIEW_ENABLED_YN,ICON_VIEW_USE_CUSTOM,DETAIL_VIEW_ENABLED_YN,FIXED_HEADER',
        p_link_url              => 'f?p=4000:601:%session%:::601,4651:P601_REGION_ID,F4000_P4651_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_IR_COL',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_IR',
        p_component_type_id     => 7040,
        p_pk_column_name        => 'COLUMN_ID',
        p_display_expression    => 'COLUMN_ALIAS',
        p_order_expression      => 'TO_CHAR(DISPLAY_ORDER, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'COLUMN_GROUP,COLUMN_LINK_CHECKSUM_TYPE,ALLOW_SORTING,ALLOW_FILTERING,ALLOW_HIGHLIGHTING,ALLOW_CTRL_BREAKS,ALLOW_AGGREGATIONS,ALLOW_COMPUTATIONS,ALLOW_CHARTING,ALLOW_GROUP_BY,ALLOW_PIVOT,ALLOW_HIDE,COLUMN_TYPE,DISPLAY_TEXT_AS,HEADING_ALIGNMENT,COLUMN_ALIGNMENT,TZ_DEPENDENT,FILTER_LOV_SOURCE,NAMED_LOV,FILTER_DATE_RANGES,DISPLAY_CONDITION_TYPE,DISPLAY_CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:687:%session%:::687,601,4651:P687_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_COMP',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5520,
        p_pk_column_name        => 'COMPUTATION_ID',
        p_display_expression    => 'ITEM_NAME||'' ''||COMPUTATION_POINT',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')||COMPUTATION_POINT',
        p_order_seq             => 6,
        p_lookup_or_lov_columns => 'PAGE_NAME,COMPUTATION_POINT,COMPUTATION_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4315:%session%::::F4000_P4315_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_VAL',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5510,
        p_pk_column_name        => 'VALIDATION_ID',
        p_display_expression    => 'VALIDATION_NAME',
        p_order_expression      => 'TO_CHAR(VALIDATION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 7,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,VALIDATION_TYPE,VALIDATION_TYPE_CODE,ALWAYS_EXECUTE,CONDITION_TYPE,CONDITION_TYPE_CODE,EXEC_COND_FOR_EACH_ROW,ONLY_FOR_CHANGED_ROWS,WHEN_BUTTON_PRESSED,ERROR_DISPLAY_LOCATION,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4316:%session%::::F4000_P4316_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_PROC',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5530,
        p_pk_column_name        => 'PROCESS_ID',
        p_display_expression    => 'PROCESS_NAME',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')||PROCESS_POINT',
        p_order_seq             => 8,
        p_lookup_or_lov_columns => 'PAGE_NAME,PROCESS_POINT,PROCESS_POINT_CODE,REGION_NAME,PROCESS_TYPE,PROCESS_TYPE_PLUGIN_NAME,ERROR_DISPLAY_LOCATION,WHEN_BUTTON_PRESSED,CONDITION_TYPE,CONDITION_TYPE_CODE,EXEC_COND_FOR_EACH_ROW,ONLY_FOR_CHANGED_ROWS,RUN_PROCESS,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_deprecated_columns    => 'PROCESS_TYPE_CODE,RUNTIME_WHERE_CLAUSE',
        p_link_url              => 'f?p=4000:4312:%session%::NO:4312:F4000_P4312_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_BRANCHES',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5540,
        p_pk_column_name        => 'BRANCH_ID',
        p_display_expression    => 'NVL(BRANCH_NAME, PROCESS_SEQUENCE||'' ''||INITCAP(REPLACE(BRANCH_POINT, ''_'', '' '')))',
        p_order_expression      => 'TO_CHAR(PROCESS_SEQUENCE, ''0000000000'')||BRANCH_POINT',
        p_order_seq             => 9,
        p_lookup_or_lov_columns => 'PAGE_NAME,BRANCH_POINT,WHEN_BUTTON_PRESSED,BRANCH_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE,SAVE_STATE_BEFORE_BRANCH,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4313:%session%::::F4000_P4313_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_DA',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5140,
        p_pk_column_name        => 'DYNAMIC_ACTION_ID',
        p_display_expression    => 'DYNAMIC_ACTION_NAME',
        p_order_expression      => 'TO_CHAR(DYNAMIC_ACTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 10,
        p_lookup_or_lov_columns => 'PAGE_NAME,WHEN_SELECTION_TYPE,WHEN_SELECTION_TYPE_CODE,WHEN_REGION,WHEN_BUTTON,WHEN_CONDITION,WHEN_EVENT_SCOPE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME,NUMBER_OF_ACTIONS',
        p_link_url              => 'f?p=4000:793:%session%::::F4000_P793_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_DA_ACTS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_DA',
        p_component_type_id     => 5150,
        p_pk_column_name        => 'ACTION_ID',
        p_display_expression    => 'ACTION_NAME',
        p_order_expression      => 'TO_CHAR(ACTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,DYNAMIC_ACTION_NAME,ACTION_CODE,DYNAMIC_ACTION_EVENT_RESULT,EXECUTE_ON_PAGE_INIT,AFFECTED_ELEMENTS_TYPE,AFFECTED_ELEMENTS_TYPE_CODE,AFFECTED_REGION,AFFECTED_BUTTON,STOP_EXECUTION_ON_ERROR,WAIT_FOR_RESULT',
        p_link_url              => 'f?p=4000:591:%session%::::F4000_P591_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_CALENDARS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5110,
        p_pk_column_name        => 'REGION_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'PAGE_NAME,DATE_FORMAT,DISPLAY_TYPE,BEGIN_AT_START_OF_INTERVAL,TIME_FORMAT,LIST_VIEW_DAYS_DISPLAY,OPEN_LINK_IN,DRAG_DROP_AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:2000:%session%:::RP,2000,4651:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4651_ID:%application_id%,%page_id%,%pk_value%');

    ----------------------------------------------------------------------------
    -- Shared Components.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_USER_INTERFACES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'USER_INTERFACE_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 13,
        p_lookup_or_lov_columns => 'UI_TYPE_NAME,USE_AUTO_DETECT,IS_DEFAULT,BUILD_OPTION,NAVIGATION_LIST,NAVIGATION_LIST_POSITION,NAVIGATION_LIST_TEMPLATE,NAV_LIST_TEMPLATE_OPTIONS,NAV_BAR_TYPE,NAV_BAR_TEMPLATE_OPTIONS,NAV_BAR_LIST,NAV_BAR_LIST_TEMPLATE,CONTENT_DELIVERY_NETWORK,INCLUDE_LEGACY_JAVASCRIPT,INCLUDE_JQUERY_MIGRATE',
        p_link_url              => 'f?p=4000:677:%session%::NO:677:P677_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_SETTINGS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'PLUGIN_SETTING_ID',
        p_display_expression    => 'PLUGIN',
        p_order_expression      => 'PLUGIN',
        p_order_seq             => 14,
        p_lookup_or_lov_columns => 'PLUGIN_TYPE,PLUGIN,PLUGIN_CODE',
        p_link_url              => 'f?p=4000:4446:%session%::NO:4446:P4446_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_COMPUTATIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_COMPUTATION_ID',
        p_display_expression    => 'COMPUTATION_ITEM||'' ''||COMPUTATION_POINT',
        p_order_expression      => 'TO_CHAR(COMPUTATION_SEQUENCE, ''0000000000'')||COMPUTATION_POINT',
        p_order_seq             => 15,
        p_lookup_or_lov_columns => 'COMPUTATION_POINT,COMPUTATION_TYPE,AUTHORIZATION_SCHEME,BUILD_OPTION,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_link_url              => 'f?p=4000:4304:%session%::::F4000_P4304_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PROCESSES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_PROCESS_ID',
        p_display_expression    => 'PROCESS_NAME',
        p_order_expression      => 'TO_CHAR(PROCESS_SEQUENCE, ''0000000000'')||PROCESS_POINT',
        p_order_seq             => 16,
        p_lookup_or_lov_columns => 'PROCESS_POINT,PROCESS_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4309:%session%::::F4000_P4309_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_ITEMS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_ITEM_ID',
        p_display_expression    => 'ITEM_NAME',
        p_order_expression      => 'ITEM_NAME',
        p_order_seq             => 17,
        p_lookup_or_lov_columns => 'DATA_TYPE,SESSION_STATE_PROTECTION,BUILD_OPTION',
        p_link_url              => 'f?p=4000:4303:%session%::NO::F4000_P4303_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_BREADCRUMBS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'BREADCRUMB_ID',
        p_display_expression    => 'BREADCRUMB_NAME',
        p_order_expression      => 'BREADCRUMB_NAME',
        p_order_seq             => 18,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:288:%session%::NO:RP,288:F4000_P288_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_BC_ENTRIES',
        p_parent_view_name      => 'APEX_APPLICATION_BREADCRUMBS',
        p_pk_column_name        => 'BREADCRUMB_ENTRY_ID',
        p_display_expression    => 'ENTRY_LABEL',
        p_order_expression      => 'ENTRY_LABEL',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'CONDITION_TYPE,CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,BUILD_OPTION',
        p_link_url              => 'f?p=4000:290:%session%::NO:RP,287,290:F4000_P290_ID,F4000_P287_MENU_ID,FB_FLOW_ID:%pk_value%,%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LISTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'LIST_ID',
        p_display_expression    => 'LIST_NAME',
        p_order_expression      => 'LIST_NAME',
        p_order_seq             => 19,
        p_lookup_or_lov_columns => 'BUILD_OPTION,LIST_TYPE,LIST_TYPE_CODE',
        p_deprecated_columns    => 'TEMPLATE',
        p_link_url              => 'f?p=4000:4051:%session%::NO:RP:F4000_P4051_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LIST_ENTRIES',
        p_parent_view_name      => 'APEX_APPLICATION_LISTS',
        p_pk_column_name        => 'LIST_ENTRY_ID',
        p_display_expression    => 'ENTRY_TEXT',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'LIST_NAME,PARENT_ENTRY_TEXT,CURRENT_FOR_PAGES_TYPE,CURRENT_FOR_PAGES_TYPE_CODE,CONDITION_TYPE,CONDITION_TYPE_CODE,COUNT_CLICKS,TRANSLATE_ATTRIBUTES,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4052:%session%::NO:RP,4050,4052:F4000_P4052_ID,F4000_P4050_LIST_ID,FB_FLOW_ID:%pk_value%,%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LOVS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'LOV_ID',
        p_display_expression    => 'LIST_OF_VALUES_NAME',
        p_order_expression      => 'LIST_OF_VALUES_NAME',
        p_order_seq             => 20,
        p_lookup_or_lov_columns => 'LOV_TYPE,IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:4111:%session%::NO:4111:F4000_P4111_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LOV_ENTRIES',
        p_parent_view_name      => 'APEX_APPLICATION_LOVS',
        p_pk_column_name        => 'LOV_ENTRY_ID',
        p_display_expression    => 'DISPLAY_VALUE',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'LIST_OF_VALUES_NAME,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION',
        p_link_url              => 'f?p=4000:4113:%session%::NO:RP,4113,4111:F4000_P4113_ID,F4000_P4111_ID,FB_FLOW_ID:%pk_value%,%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_NAV_BAR',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'NAV_BAR_ID',
        p_display_expression    => 'ICON_SUBTEXT',
        p_order_expression      => 'ICON_SUBTEXT',
        p_order_seq             => 21,
        p_lookup_or_lov_columns => 'BEGINS_ON_NEW_LINE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME,IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:4308:%session%::::F4000_P4308_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PARENT_TABS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'PARENT_TAB_ID',
        p_display_expression    => 'TAB_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 22,
        p_lookup_or_lov_columns => 'CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:331:%session%::NO::FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TABS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'TAB_ID',
        p_display_expression    => 'TAB_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 23,
        p_lookup_or_lov_columns => 'PARENT_TABSET,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4305:%session%::::F4000_P4305_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_AUTH',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'AUTHENTICATION_SCHEME_ID',
        p_display_expression    => 'AUTHENTICATION_SCHEME_NAME',
        p_order_expression      => 'AUTHENTICATION_SCHEME_NAME',
        p_order_seq             => 24,
        p_lookup_or_lov_columns => 'IS_CURRENT_AUTHENTICATION,IS_SUBSCRIBED,SCHEME_TYPE,SCHEME_TYPE_CODE,INVALID_SESSION_TYPE,COOKIE_SECURE',
        p_link_url              => 'f?p=4000:4495:%session%::::P4495_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_AUTHORIZATION',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'AUTHORIZATION_SCHEME_ID',
        p_display_expression    => 'AUTHORIZATION_SCHEME_NAME',
        p_order_expression      => 'AUTHORIZATION_SCHEME_NAME',
        p_order_seq             => 25,
        p_lookup_or_lov_columns => 'SCHEME_TYPE,SCHEME_TYPE_CODE,CACHING,IS_SUBSCRIBED',
        p_link_url              => 'f?p=4000:4008:%session%::NO::F4000_P4008_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SHORTCUTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SHORTCUT_ID',
        p_display_expression    => 'SHORTCUT_NAME',
        p_order_expression      => 'SHORTCUT_NAME',
        p_order_seq             => 26,
        p_lookup_or_lov_columns => 'SHORTCUT_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:4048:%session%::NO::F4000_P4048_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_WEB_SERVICES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'WEB_SERVICE_ID',
        p_display_expression    => 'WEB_SERVICE_NAME',
        p_order_expression      => 'WEB_SERVICE_NAME',
        p_order_seq             => 27,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM,SOAP_VERSION',
        p_link_url              => NULL /* doesn't work */ );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TREES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_TREE_ID',
        p_display_expression    => 'TREE_NAME',
        p_order_expression      => 'TREE_NAME',
        p_order_seq             => 28,
        p_lookup_or_lov_columns => 'TREE_TYPE',
        p_link_url              => 'f?p=4000:27:%session%::NO::F4000_P27_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGINS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'PLUGIN_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 29,
        p_lookup_or_lov_columns => 'PLUGIN_TYPE,CATEGORY,SUPPORTED_UI_TYPES,SUBSCRIBED_FROM,SUBSCRIBE_PLUGIN_SETTINGS,STANDARD_ATTRIBUTES,SUBSTITUTE_ATTRIBUTES',
        p_deprecated_columns    => 'ATTRIBUTE_01,ATTRIBUTE_02,ATTRIBUTE_03,ATTRIBUTE_04,ATTRIBUTE_05,ATTRIBUTE_06,ATTRIBUTE_07,ATTRIBUTE_08,ATTRIBUTE_09,ATTRIBUTE_10,ATTRIBUTE_11,ATTRIBUTE_12,ATTRIBUTE_13,ATTRIBUTE_14,ATTRIBUTE_15',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_ATTRIBUTES',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_ATTRIBUTE_ID',
        p_display_expression    => 'PROMPT',
        p_order_expression      => 'PROMPT',
        p_order_seq             => 30,
        p_lookup_or_lov_columns => 'PLUGIN_NAME,ATTRIBUTE_SCOPE,ATTRIBUTE_TYPE,IS_REQUIRED,IS_COMMON,SHOW_IN_WIZARD,COLUMN_DATA_TYPES,SUPPORTED_UI_TYPES,IS_TRANSLATABLE,DEPENDING_ON_CONDITION_TYPE,REFERENCE_SCOPE',
        p_link_url              => 'f?p=4000:4415:%session%::NO::P4415_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_ATTR_VALUES',
        p_parent_view_name      => 'APEX_APPL_PLUGIN_ATTRIBUTES',
        p_pk_column_name        => 'PLUGIN_ATTRIBUTE_VALUE_ID',
        p_display_expression    => 'DISPLAY_VALUE',
        p_order_expression      => 'DISPLAY_VALUE',
        p_order_seq             => 31,
        p_lookup_or_lov_columns => 'PLUGIN_ATTRIBUTE_PROMPT,IS_QUICK_PICK',
        p_link_url              => 'f?p=4000:4416:%session%::NO::P4416_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_FILES',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_FILE_ID',
        p_display_expression    => 'FILE_NAME',
        p_order_expression      => 'FILE_NAME',
        p_order_seq             => 31,
        p_lookup_or_lov_columns => 'PLUGIN_NAME',
        p_link_url              => 'f?p=4000:4440:%session%::NO::P4440_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_EVENTS',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_EVENT_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 32,
        p_lookup_or_lov_columns => 'PLUGIN_NAME',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TRANSLATIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'TRANSLATION_ENTRY_ID',
        p_display_expression    => 'TRANSLATABLE_MESSAGE',
        p_order_expression      => 'TRANSLATABLE_MESSAGE',
        p_order_seq             => 33,
        p_lookup_or_lov_columns => 'LANGUAGE_CODE,IS_JS_MESSAGE',
        p_link_url              => 'f?p=4000:4009:%session%::NO::F4000_P4009_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TRANS_DYNAMIC',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'MESSAGE_ID',
        p_display_expression    => 'FROM_MESSAGE',
        p_order_expression      => 'FROM_MESSAGE',
        p_order_seq             => 34,
        p_lookup_or_lov_columns => 'LANGUAGE_CODE',
        p_link_url              => 'f?p=4000:4757:%session%::NO::F4000_P4757_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TRANS_REPOS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'ID',
        p_display_expression    => 'FROM_STRING||'' - ''||ATTRIBUTE_DESCRIPTION',
        p_order_expression      => 'FROM_STRING||'' - ''||ATTRIBUTE_DESCRIPTION',
        p_order_seq             => 35,
        p_lookup_or_lov_columns => 'FROM_STRING,ATTRIBUTE_DESCRIPTION,LANGUAGE_CODE',
        p_link_url              => 'f?p=4000:704:%session%::NO::P704_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_BUILD_OPTIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'BUILD_OPTION_ID',
        p_display_expression    => 'BUILD_OPTION_NAME',
        p_order_expression      => 'BUILD_OPTION_NAME',
        p_order_seq             => 36,
        p_lookup_or_lov_columns => 'BUILD_OPTION_STATUS,STATUS_ON_EXPORT',
        p_link_url              => 'f?p=4000:4911:%session%::NO:4911:F4000_P4911_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view(
        p_view_name             => 'APEX_APPL_LOAD_TABLES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'LOAD_TABLE_ID',
        p_display_expression    => 'TABLE_NAME',
        p_order_expression      => 'TABLE_NAME',
        p_order_seq             => 37,
        p_lookup_or_lov_columns => 'IS_UK1_CASE_SENSITIVE,IS_UK2_CASE_SENSITIVE,IS_UK3_CASE_SENSITIVE,COLUMN_NAMES_LOV_ID,SKIP_VALIDATION',
        p_link_url              => 'f?p=4000:1801:%session%::NO:1801:P1801_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view(
        p_view_name             => 'APEX_APPL_LOAD_TABLE_LOOKUPS',
        p_parent_view_name      => 'APEX_APPL_LOAD_TABLES',
        p_pk_column_name        => 'LOOKUP_ID',
        p_display_expression    => 'LOAD_COLUMN_NAME',
        p_order_expression      => 'LOAD_COLUMN_NAME',
        p_order_seq             => 38,
        p_lookup_or_lov_columns => 'INSERT_NEW_VALUE',
        p_link_url              => 'f?p=4000:1803:%session%::NO:1803:P1803_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view(
        p_view_name             => 'APEX_APPL_LOAD_TABLE_RULES',
        p_parent_view_name      => 'APEX_APPL_LOAD_TABLES',
        p_pk_column_name        => 'RULE_ID',
        p_display_expression    => 'RULE_NAME',
        p_order_expression      => 'RULE_NAME',
        p_order_seq             => 39,
        p_lookup_or_lov_columns => 'RULE_TYPE',
        p_link_url              => 'f?p=4000:1804:%session%::NO:1804:P1804_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_STATIC_FILES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_FILE_ID',
        p_display_expression    => 'FILE_NAME',
        p_order_expression      => 'FILE_NAME',
        p_order_seq             => 40,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:275:%session%::NO:275:P275_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_CONCATENATED_FILES',
        p_parent_view_name      => 'APEX_APPL_USER_INTERFACES',
        p_pk_column_name        => 'CONCATENATED_FILE_ID',
        p_display_expression    => 'COMBINED_FILE_URL',
        p_order_expression      => 'COMBINED_FILE_URL',
        p_order_seq             => 41,
        p_lookup_or_lov_columns => 'BUILD_OPTION',
        p_link_url              => 'f?p=4000:209:%session%::NO:209:P209_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_DEVELOPER_COMMENTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'COMMENT_ID',
        p_display_expression    => 'DEVELOPER_COMMENT',
        p_order_expression      => 'DEVELOPER_COMMENT',
        p_order_seq             => 42,
        p_lookup_or_lov_columns => 'PAGES',
        p_link_url              => 'f?p=4000:1236:%session%::NO:RP,1236:P1236_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- Themes.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_THEMES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'THEME_NUMBER',
        p_display_expression    => 'THEME_NAME',
        p_order_expression      => 'THEME_NAME',
        p_order_seq             => 36,
        p_lookup_or_lov_columns => 'UI_TYPE_NAME,NAVIGATION_TYPE,NAVIGATION_TYPE_CODE,IS_LOCKED,IS_CURRENT,NAVIGATION_TYPE,DEFAULT_NAV_LIST_POSITION,DEFAULT_PAGE_TRANSITION,DEFAULT_POPUP_TRANSITION,DEFAULT_PAGE_TEMPLATE,DEFAULT_DIALOG_TEMPLATE,DEFAULT_BUTTON_TEMPLATE,DEFAULT_REGION_TEMPLATE,DEFAULT_CHART_RG_TEMPLATE,DEFAULT_FORM_RG_TEMPLATE,DEFAULT_REPORT_REGION_TEMPLATE,DEFAULT_TABULAR_FORM_TEMPLATE,DEFAULT_WIZARD_TEMPLATE,DEFAULT_BREADCRUMB_RG_TEMPLATE,DEFAULT_REPORT_ROW_TEMPLATE,DEFAULT_ITEM_LABEL_TEMPLATE,DEFAULT_BREADCRUMB_TEMPLATE,DEFAULT_CALENDAR_TEMPLATE,DEFAULT_LIST_TEMPLATE,DEFAULT_TOP_NAV_LIST_TEMPLATE,DEFAULT_SIDE_NAV_LIST_TEMPLATE,DEFAULT_OPTION_LABEL,DEFAULT_REQUIRED_LABEL,DEFAULT_IRR_TEMPLATE,DEFAULT_HEADER_TEMPLATE,DEFAULT_FOOTER_TEMPLATE,DEFAULT_DIALOGBTNR_TEMPLATE,DEFAULT_DIALOGR_TEMPLATE,ICON_LIBRARY,DEFAULT_NAV_BAR_LIST_TEMPLATE,NAV_BAR_TYPE,NAV_BAR_TYPE_CODE',
        p_link_url              => 'f?p=4000:267:%session%::NO:RP,267:P267_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_THEME_STYLES',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'THEME_STYLE_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'IS_CURRENT,IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:177:%session%::NO:RP,177:P177_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_THEME_FILES',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'THEME_FILE_ID',
        p_display_expression    => 'FILE_NAME',
        p_order_expression      => 'FILE_NAME',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:227:%session%::NO:RP,227:P227_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_THEME_DISPLAY_POINTS',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'THEME_DISPLAY_POINT_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'HAS_GRID_SUPPORT,IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => '$$$' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMPLATE_OPTIONS',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_OPTION_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM,IS_ADVANCED',
        p_link_url              => '' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMPLATE_OPT_GROUPS',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_OPT_GROUP_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM,IS_ADVANCED',
        p_link_url              => '' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_BC',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'BREADCRUMB_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:289:%session%::NO:289:F4000_P289_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_BUTTON',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'BUTTON_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 4,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:204:%session%::NO:204:F4000_P204_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_CALENDAR',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'CALENDAR_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:697:%session%::NO:697:F4000_P697_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_LABEL',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'LABEL_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 6,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATE_THIS_TEMPLATE',
        p_link_url              => 'f?p=4000:85:%session%::NO:85:F4000_P85_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_LIST',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'LIST_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 7,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATE_THIS_TEMPLATE',
        p_link_url              => 'f?p=4000:4655:%session%::NO:4655:F4000_P4655_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_PAGE',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'PAGE_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 8,
        p_lookup_or_lov_columns => 'GRID_TYPE,GRID_TYPE_CODE,GRID_ALWAYS_USE_MAX_COLUMNS,GRID_HAS_COLUMN_SPAN,GRID_ALWAYS_EMIT,GRID_EMIT_EMPTY_LEADING_COLS,GRID_EMIT_EMPTY_TRAILING_COLS,THEME_CLASS,IS_POPUP,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE,MOBILE_PAGE_TEMPLATE,DIALOG_BROWSER_FRAME',
        p_deprecated_columns    => 'HAS_EDIT_LINKS,TEMPLATE_ID,MULTICOLUMN_REGION_TABLE_ATTR',
        p_link_url              => 'f?p=4000:4307:%session%::NO:4307:F4000_P4307_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMP_PAGE_DP',
        p_parent_view_name      => 'APEX_APPLICATION_TEMP_PAGE',
        p_pk_column_name        => 'PAGE_TMPL_DISPLAY_POINT_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'HAS_GRID_SUPPORT,GLV_NEW_ROW',
        p_link_url              => 'f?p=4000:4307:%session%::NO:4307:F4000_P4307_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_POPUPLOV',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_ID',
        p_display_expression    => '''Popup LOV''',
        p_order_expression      => '''Popup LOV''',
        p_order_seq             => 9,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:251:%session%::NO:251:F4000_P251_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_REGION',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'REGION_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 10,
        p_lookup_or_lov_columns => 'LAYOUT,THEME_CLASS,DEFAULT_LABEL_ALIGNMENT,DEFAULT_FIELD_ALIGNMENT,DEFAULT_BUTTON_POSITION,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:4653:%session%::NO:4653:F4000_P4653_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMP_REGION_DP',
        p_parent_view_name      => 'APEX_APPLICATION_TEMP_REGION',
        p_pk_column_name        => 'REGION_TMPL_DISPLAY_POINT_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'HAS_GRID_SUPPORT,GLV_NEW_ROW',
        p_link_url              => 'f?p=4000:4653:%session%::NO:4653:F4000_P4653_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_REPORT',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 11,
        p_lookup_or_lov_columns => 'THEME_CLASS,TEMPLATE_TYPE,COL_TEMPLATE_DISPLAY_COND1,COL_TEMPLATE_DISPLAY_COND2,COL_TEMPLATE_DISPLAY_COND3,COL_TEMPLATE_DISPLAY_COND4,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATE_THIS_TEMPLATE',
        p_link_url              => 'f?p=4000:258:%session%::NO:258:F4000_P258_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- Misc.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUBSTITUTIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SUBSTITUTION_STRING',
        p_display_expression    => 'SUBSTITUTION_STRING',
        p_order_expression      => 'SUBSTITUTION_STRING',
        p_order_seq             => 39,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:4001:%session%::NO:2:FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_GROUPS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'GROUP_ID',
        p_display_expression    => 'PAGE_GROUP_NAME',
        p_order_expression      => 'PAGE_GROUP_NAME',
        p_order_seq             => 40,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:521:%session%::NO:521,RP:P521_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- Supporting Objects
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJECTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SUPPORTING_OBJECT_ID',
        p_display_expression    => 'SUPPORTING_OBJECT_ID',
        p_order_expression      => 'TO_CHAR(SUPPORTING_OBJECT_ID)',
        p_order_seq             => 50,
        p_lookup_or_lov_columns => 'INCLUDE_IN_APPLICATION_EXPORT',
        p_link_url              => 'f?p=4000:567:%session%::NO:567,RP:FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJ_BOPT',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'INSTALL_BUILD_OPTION_ID',
        p_display_expression    => 'BUILD_OPTION',
        p_order_expression      => 'BUILD_OPTION',
        p_order_seq             => 51,
        p_lookup_or_lov_columns => 'BUILD_OPTION,DEFAULT_STATUS',
        p_link_url              => 'f?p=4000:511:%session%::NO:511,RP:FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJ_CHCK',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'CHECK_ID',
        p_display_expression    => 'CHECK_NAME',
        p_order_expression      => 'TO_CHAR(CHECK_SEQUENCE, ''0000000000'')',
        p_order_seq             => 52,
        p_lookup_or_lov_columns => 'CHECK_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_link_url              => 'f?p=4000:376:%session%::NO:RP,376:P376_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJ_SCR',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SUPPORTING_OBJECT_SCRIPT_ID',
        p_display_expression    => 'SCRIPT_NAME||''(''||SCRIPT_TYPE||'')''',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 53,
        p_lookup_or_lov_columns => 'SCRIPT_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_link_url              => 'f?p=4000:865:%session%::NO:865,RP:P865_SCRIPT_ID,P865_MODE,FB_FLOW_ID:%pk_value%,EDIT,%application_id%' );


end;
/
commit;
