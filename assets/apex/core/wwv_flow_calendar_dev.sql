set define off verify off
prompt ...wwv_flow_calendar_dev
create or replace package wwv_flow_calendar_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_calendar_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling the calendar component
--      in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/20/2012 - Created based on wwv_flow_calendar3
--      sathikum  03/28/2012 - Added create_calendar_page procedure
--      sathikum  03/29/2012 - Added create_calendar_region procedure
--      sathikum  03/30/2012 - Added additional columns to support Agenda Calendar feature (#812)
--      sathikum  04/13/2012 - Added additional columns to support Mobile and general Template (#811)
--      sathikum  06/19/2012 - Added additional column end_date_column (#814)
--      pmanirah  10/28/2012 - Added a new parameter p_user_interface_id to create_wizard_elements procedure
--      hfarrell  05/24/2013 - Added p_page_mode to create_calendar_page (feature #587)
--      cneumuel  12/20/2013 - Region type migration to native plugins: charts, calendars, trees (feature #1312)
--      hfarrell  01/27/2014 - In create_calendar_page: added p_group_name (feature #1347)
--      hfarrell  12/12/2014 - In create_calendar_page: added navigation menu parameters (feature #1236)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================


--==============================================================================
-- Global variables
--==============================================================================


--
-- set attributes for the calendar
-- KLR: add md5
--
procedure set_Attributes(
    p_flow_id                     number,
    p_template_id                 number,
    p_plug_id                     number,
    p_start_date                  varchar2    default null,
    p_end_date                    varchar2    default null,
    p_begin_at_Start_of_interval  varchar2    default 'Y',
    p_date_item                   varchar2    default null,
    p_end_date_item               varchar2    default null,
    p_date_type_item              varchar2    default null,
    p_interval                    varchar2    default 'M',
    p_display_item                varchar2    default null,
    p_display_type                varchar2    default null,
    p_item_format                 varchar2    default null,
    p_easy_sql_owner              varchar2    default null,
    p_easy_sql_table              varchar2    default null,
    p_date_col                    varchar2    default null,
    p_end_date_col                varchar2    default null,
    p_display_col                 varchar2    default null,
    p_start_of_week               number      default null,
    p_day_link                    varchar2    default null,
    p_item_link                   varchar2    default null,
    p_start_time                  in varchar2 default null,
    p_end_time                    in varchar2 default null,
    p_time_format                 in varchar2 default null,
    p_week_start_day              in varchar2 default null,
    p_week_end_day                in varchar2 default null,
    p_calendar_type               in varchar2 default null,
    p_include_custom_cal          in varchar2 default null,
    p_custom_cal_days             in number   default 3,
    p_primary_key_column          in varchar2 default null,
    p_drag_drop_required_role     in varchar2 default null,
    p_drag_drop_process_id        in number   default null,
    p_item_link_primary_key_item  in varchar2 default null,
    p_item_link_date_item         in varchar2 default null,
    p_item_link_open_in           in varchar2 default null,
    p_include_time_with_date      in varchar2 default 'N',
    p_data_background_color       in varchar2 default null,
    p_data_text_color             in varchar2 default null,
    p_agenda_cal_days_type        in varchar2 default 'MONTH',
    p_agenda_cal_days             in number   default 30,
    p_SECURITY_GROUP_ID           number      default wwv_flow_security.g_security_group_id ,
    p_LAST_UPDATED_BY             varchar2    default wwv_flow.g_user,
    p_LAST_UPDATED_ON             date        default sysdate);


procedure create_wizard_elements(p_flow_id                    number,
                                 p_page_id                    number,
                                 p_region_id                  number,
                                 p_date_item_name             varchar2,
                                 p_display_item_name          varchar2,
                                 p_buttons                    varchar2,
                                 p_button_template            varchar2,
                                 p_date_item_type_name        varchar2 default null,
                                 p_is_ajax_calendar           varchar2 default null,
                                 p_end_date_item_name         varchar2 default null,
                                 p_include_custom_cal         varchar2 default null,
                                 p_enable_monthly             varchar2 default 'Y',
                                 p_enable_weekly              varchar2 default 'Y',
                                 p_enable_daily               varchar2 default 'Y',
                                 p_enable_agenda              varchar2 default 'Y',
                                 p_add_create_button          varchar2 default 'N',
                                 p_create_url                 varchar2 default null,
                                 p_custom_cal_days            number   default 3,
                                 p_is_jqm_user_interface      boolean  default false,
                                 p_button_region_id           number   default null,
                                 p_user_interface_id          number   default null);

-- function to check process name already used.
function is_process_name_used(
    p_flow_id in number,
    p_step_id in number,
    p_name    in varchar2)
    return boolean;

-- function to generate on demand process for Drag & Drop

function create_on_demand_process(
    p_flow_id                     number,
    p_plug_id                     number,
    p_sql                         varchar2,
    p_primary_key_col             varchar2,
    p_date_col                    varchar2
) return number;

function is_valid_query(
    p_query  varchar2,
    p_owner  varchar2) return varchar2;

--
-- Loads columns of a select into a collection for select lists
--
procedure loadCols(p_sql   varchar2        default null,
                    p_owner varchar2        default null,
                    p_table varchar2        default null,
                    p_collection varchar2);

--
-- Procedure to Create Calendar Page
--
procedure create_calendar_page( 
    p_flow_id                    number,
    p_page_id                    number,
    p_page_name                  varchar2 default null,
    p_page_mode                  varchar2 default null,
    p_group_name                 varchar2 default null,
    p_theme_id                   number   default null,
    p_user_interface_id          number   default null,
    p_cal_region_id              number   default null,
    p_cal_region_name            varchar2 default null,
    p_cal_region_tabset          varchar2 default null,
    --
    p_cal_tab_options            number   default null,
    p_cal_tab_text               varchar2 default null,
    p_cal_tab_name               varchar2 default null,
    --
    p_nav_list_id                number   default null,
    p_nav_list_parent_item_id    number   default null,
    p_nav_list_child_item_name   varchar2 default null,
    --
    p_cal_source_table           varchar2 default null,
    p_cal_source_sql             varchar2 default null,
    p_cal_date_col               varchar2 default null,
    p_cal_end_date_col           varchar2 default null,
    p_cal_display_col            varchar2 default null,
    p_date_format                varchar2 default null,
    p_cal_type                   varchar2 default null,
    p_primary_key_col            varchar2 default null,
    p_include_custom_calendar    varchar2 default 'N',
    p_enable_drag_drop           varchar2 default 'N',
    p_on_demand_process          number   default null,
    p_drag_drop_auth_scheme      varchar2 default null,
    p_link_url_or_page           varchar2 default null,
    p_target_link                varchar2 default null,
    p_link_open_in               varchar2 default null,
    p_target_page                number   default null,
    p_target_page_primary_item   varchar2 default null,
    p_target_page_date_item      varchar2 default null,
    p_show_new_form_details      varchar2 default null,
    p_form_page_id               number   default null,
    p_form_page_name             varchar2 default null,
    p_form_region_id             number   default null,
    p_form_region_name           varchar2 default null,
    p_form_table_owner           varchar2 default null,
    p_form_table_name            varchar2 default null,
    p_form_primary_key_type      varchar2 default null,
    p_form_primary_key           varchar2 default null,
    p_form_columns               varchar2 default null,
    p_form_insert_allowed        varchar2 default 'N',
    p_form_update_allowed        varchar2 default 'N',
    p_form_delete_allowed        varchar2 default 'N',
    p_form_create_button_name    varchar2 default null,
    p_form_save_button_name      varchar2 default null,
    p_form_delete_button_name    varchar2 default null,
    p_form_cancel_button_name    varchar2 default null);

procedure create_calendar_region (p_flow_id                   number,
                                p_page_id                     number,
                                p_security_id                 number,
                                p_theme_id                    number default null,
                                p_user_interface_id           number default null,
                                p_template_id                 number default null,
                                p_parent_plug_id              varchar2 default null,
                                p_region_type                 varchar2 default null,
                                p_region_title                varchar2 default null,
                                p_region_sequence             varchar2 default null,
                                p_display_point               varchar2 default null,
                                p_owner                       varchar2 default null,
                                p_source_table                varchar2 default null,
                                p_source_sql                  varchar2 default null,
                                p_primary_key_col             varchar2 default null,
                                p_date_column                 varchar2 default null,
                                p_end_date_column             varchar2 default null,
                                p_date_column_alternate       varchar2 default null,
                                p_plug_display_column         varchar2 default null,
                                p_display_column              varchar2 default null,
                                p_date_format                 varchar2 default null,
                                p_calendar_type               varchar2 default null,
                                p_include_custom_calendar     varchar2 default 'N',
                                p_link_target_type            varchar2 default null,
                                p_link_target_open_in         varchar2 default null,
                                p_link_target_page            varchar2 default null,
                                p_link_target_url             varchar2 default null,
                                p_target_date_item            varchar2 default null,
                                p_target_primary_key_item     varchar2 default null,
                                p_enable_drag_drop            varchar2 default null,
                                p_drag_drop_on_demand_process number default null,
                                p_drag_drop_auth_scheme       varchar2 default null,
                                p_form_page_id                number default null,
                                p_form_page_name              varchar2 default null,
                                p_form_region_id              number default null,
                                p_form_region_name            varchar2 default null,
                                p_form_table_owner            varchar2 default null,
                                p_form_table_name             varchar2 default null,
                                p_form_primary_key_type       varchar2 default null,
                                p_form_primary_key            varchar2 default null,
                                p_form_columns                varchar2 default null,
                                p_form_insert_allowed         varchar2 default 'N',
                                p_form_update_allowed         varchar2 default 'N',
                                p_form_delete_allowed         varchar2 default 'N',
                                p_form_create_button_name     varchar2 default null,
                                p_form_save_button_name       varchar2 default null,
                                p_form_delete_button_name     varchar2 default null,
                                p_form_cancel_button_name     varchar2 default null) ;

end wwv_flow_calendar_dev;
/
show errors

set define '^'
