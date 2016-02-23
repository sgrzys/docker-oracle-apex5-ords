set define '^' verify off
prompt ...wwv_flow_hint
create or replace package wwv_flow_hint as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_hint.sql
--
--    DESCRIPTION
--      This package is used to interact with the following tables:
--          wwv_flow_hnt_table_info
--          wwv_flow_hnt_column_info
--          wwv_flow_hnt_column_dict
--          wwv_flow_hnt_col_dict_syn
--      This package can be used to better create meaningful forms and reports and other flows contructs.
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    04/02/2003 - Bug 2882452: Created
--     cbcho    04/09/2003 - Bug 2882452: Added get_display_seq_report
--     cbcho    04/10/2003 - Bug 2882452: Added create_table_hint, create_column_hint, remove_table_hint
--     cbcho    04/11/2003 - Bug 2882452: Added more functions to get friendly names for forms
--     cbcho    04/11/2003 - Bug 2882452: Removed obsolete column and added new column reference in create_column_hint
--     cbcho    04/24/2003 - Added Sharons default_hints procedure
--     sbk      05/06/2003 - Changed default_hints to synch_hints
--     cbcho    05/06/2003 - Added table_hint_exists and column_hint_exists
--     sbk      06/02/2003 - Added mask_form column to create column, renamed column mask to mask_report
--     sbk                 - renamed get_mask to get_report_mask, added get_form_mask
--     cbcho    06/03/2003 - Added procedure create_normalize_hint
--     sbk      05/25/2004 - Changes to support version 1.6
--                         - removed get_region_title, replace with get_report_region_title and get_form_region_title
--                         - added get_display_as_tab_form, get_display_as_report
--                         - changed create_table_hint to remove region_title,
--                                   added report_region_title and form_region_title
--                         - changed create_column_hint to add display_as_tab_form and display_as_report
--                         - changed synch_hints to default group_by to N (rather than Y) - requested by CBCho
--                         - changed synch_hints to reflect updated create_table_hint procedure
--                         - added create_lov_data
--     sbk      05/28/2004 - put back in get_region_title for backward compatibility
--     sbk      06/02/2004 - added get_lov to retrieve either query or column_id if static lov
--     sbk      06/04/2004 - added get_aggregate_by, modified create_column_hint to add aggregate_by
--     sbk      06/07/2004 - added display_cons_columns
--                         - added gen_lov_name
--     sbk      06/10/2004 - added get_table_ui_defaults and get_col_ui_defaults
--     sbk      06/11/2004 - defaulted globals to null, added global to allow users to not use defaults
--                         - added remove_hint
--                         - added check_table function, returns N if no UI Defaults, S if need to synch table, F if table fine
--     sbk      06/15/2004 - added get_static_lov_string
--     sbk      06/22/2004 - added check_schema_privs
--                         - added create_table_hint_priv, create_column_hint_priv, create_lov_data_priv, remove_hint_priv
--                                 These ensure that the user has privilge on the schema they are creating for
--     sbk      06/28/2004 - added check_lov_issues to display warning when display as requires lov but no lov provided
--     sbk      09/13/2004 - added back in create_normalize_hint - it was somehow dropped
--     sbk      09/19/2007 - added update_table_hint, update_column_hint, update_lov_data, remove_column_hint, remove_lov_data
--     mhichwa  07/06/2009 - added synch_defaults_from_app
--     pawolf   10/20/2009 - Added dynamic attributes to wwv_flow_hnt_column_info
--     sbkenned 11/24/2009 - Added migration to Attribute Dictionary
--     sbkenned 12/02/2009 - Added is_valid_lov_query (needed with move to 4500)
--     sbkenned 12/08/2009 - Added update_ad_from_items, insert_ad_from_items, update_ad_from_cr, update_ad_from_ir,
--                           insert_ad_from_cr, insert_ad_from_ir to support pushing from page to Attribute Dictionary
--     sbkenned 12/15/2009 - Updated create_col and create_col priv to include group_id
--                         - Added create_group, create_group_priv and remove_group
--                         - Added create_col_attribute, create_col_synonym, update_col_attribute, update_col_synonym,
--                                 remove_col_attribute, remove_col_synonym
--     sbkenned 01/13/2010 - Added remove_col_attr_by_name, g_exp_workspace to support export/import
--     sbkenned 01/22/2010 - Removed form_display_as from attribute dictionary
--                         - Added update_items_from_ad, update_ir_from_ad, update_cr_from_ad
--     sbkenned 02/02/2010 - Added update_cr_ht_from_ad to set plug_query_headings_type when label updated in standard report
--     sbkenned 03/30/2010 - Added ad_col_hint_exists
--     sbkenned 04/01/2010 - Added get_ad_ui_defaults
--     hfarrell 04/09/2010 - Modified g_report_col_alignment to increase size from 1 to 10
--     sbkenned 06/01/2010 - Added remove_col_syn_by_name to support import
--     pawolf   12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--     jstraub  01/18/2012 - Removed display_cons_columns
--     cneumuel 08/09/2012 - Removed is_valid_lov_query
--     cneumuel 04/05/2013 - removed obsolete variables, added schema and sgid checks (bug #16607248)
--     cneumuel 12/03/2013 - In check_schema_privs: added p_table_name (bug #17883392)
--     cneumuel 05/08/2015 - long identifiers (bug #21031940)
--
--------------------------------------------------------------------------------

-- Used in get_table_ui_defaults and get_col_ui_defaults

    g_form_region_title    varchar2(255)  := null;
    g_report_region_title  varchar2(255)  := null;

    g_group_id             number         := null;
    g_group_seq            number         := null;
    g_group_name           varchar2(255)  := null;

    g_column_id            number         := null;
    g_label                varchar2(255)  := null;
    g_help_text            varchar2(4000) := null;
    g_mask_form            varchar2(255)  := null;
    g_display_seq_form     number         := null;
    g_display_in_form      varchar2(1)    := null;
    g_display_as_form      varchar2(50)   := null;
    g_form_attribute_01    varchar2(4000) := null;
    g_form_attribute_02    varchar2(4000) := null;
    g_form_attribute_03    varchar2(4000) := null;
    g_form_attribute_04    varchar2(4000) := null;
    g_form_attribute_05    varchar2(4000) := null;
    g_form_attribute_06    varchar2(4000) := null;
    g_form_attribute_07    varchar2(4000) := null;
    g_form_attribute_08    varchar2(4000) := null;
    g_form_attribute_09    varchar2(4000) := null;
    g_form_attribute_10    varchar2(4000) := null;
    g_form_attribute_11    varchar2(4000) := null;
    g_form_attribute_12    varchar2(4000) := null;
    g_form_attribute_13    varchar2(4000) := null;
    g_form_attribute_14    varchar2(4000) := null;
    g_form_attribute_15    varchar2(4000) := null;
    g_display_as_tab_form  varchar2(255)  := null;
    g_display_seq_report   number         := null;
    g_display_in_report    varchar2(1)    := null;
    g_display_as_report    varchar2(255)  := null;
    g_mask_report          varchar2(255)  := null;
    g_aggregate_by         varchar2(1)    := null;
    g_lov_query            varchar2(4000) := null;
    g_default_value        varchar2(255)  := null;
    g_required             varchar2(1)    := null;
    g_alignment            varchar2(1)    := null;
    g_display_width        number         := null;
    g_max_width            number         := null;
    g_height               number         := null;
    g_group_by             varchar2(1)    := null;
    g_searchable           varchar2(1)    := null;
    g_lov_type             varchar2(1)    := null;
    --
    g_form_format_mask     varchar2(255)  := null;
    g_form_display_width   number         := null;
    g_form_display_height  number         := null;
    g_form_data_type       varchar2(30)   := null;
    g_report_format_mask   varchar2(4000) := null;
    g_report_col_alignment varchar2(10)    := null;

-- Setting the following global to true makes all the functions and procedures pull
--   the UI Default values.  If the global is set to false (the user running the wizard
--   decided to override and not use UI Defaults), null is returned for the values.

    g_use_ui_defaults      boolean        := true;

-- The following global is used in check_schema_privs to ensure that, on import,
--    the user has privilege on the schema they are importing.

    g_schema               wwv_flows.owner%type;

-- The following global is used in wwv_flow_imp_parser.get_attr_dict_workspace to show,
--    on import, the name of the exporting workspace.

    g_exp_workspace        varchar2(255)   := null;

procedure check_schema_privs (
    p_schema     in varchar2 default wwv_flow_hint.g_schema,
    p_table_name in varchar2 default null );

function table_hint_exists (
    p_schema      in varchar2,
    p_table_name  in varchar2
    ) return boolean;

function column_hint_exists (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return boolean;

-- sbk, 06/11/04: This column is no longer used but function left in for now
function get_region_title (
    p_schema      in varchar2,
    p_table_name  in varchar2
    ) return varchar2;

function get_report_region_title (
    p_schema      in varchar2,
    p_table_name  in varchar2
    ) return varchar2;

function get_form_region_title (
    p_schema      in varchar2,
    p_table_name  in varchar2
    ) return varchar2;

function get_item_help (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_report_mask (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_form_mask (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_alignment (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_searchable (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_required (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_label (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_display_in_report (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_display_seq_report (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return number;

function get_group_by (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;

-- sbk, 06/11/04 - column not used for 1.5 or 1.6
function get_order_by_seq (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return number;

-- sbk, 06/11/04 - column not used for 1.5 or 1.6
function get_order_by_asc_desc (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return number;

function get_display_in_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;

function get_display_seq_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return number;

function get_display_as_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;

function get_lov_query (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;

procedure get_lov (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2,
    p_lov_type     out varchar2,
    p_lov_query    out varchar2,
    p_column_id    out number
    );

function get_static_lov_string (
    p_column_id   in number
    ) return varchar2;

function get_default_value (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;

function get_display_width (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return number;

function get_max_width (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return number;

function get_height (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return number;

function get_display_as_tab_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;

function get_display_as_report (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;

function get_aggregate_by (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return varchar2;


procedure create_table_hint (
    p_table_id             in number   default null,
    p_schema               in varchar2 default null,
    p_table_name           in varchar2 default null,
    p_form_region_title    in varchar2 default null,
    p_report_region_title  in varchar2 default null
    );

procedure create_group (
    p_group_id             in number   default null,
    p_table_id             in number   default null,
    p_group_name           in varchar2 default null,
    p_description          in varchar2 default null,
    p_display_sequence     in number   default null
    );

procedure create_column_hint (
    p_column_id           in number   default null,
    p_table_id            in number   default null,
    p_column_name         in varchar2 default null,
    p_group_id            in number   default null,
    p_label               in varchar2 default null,
    p_help_text           in varchar2 default null,
    p_mask_form           in varchar2 default null,
    p_display_seq_form    in number   default null,
    p_display_in_form     in varchar2 default null,
    p_display_as_form     in varchar2 default null,
    p_form_attribute_01   in varchar2 default null,
    p_form_attribute_02   in varchar2 default null,
    p_form_attribute_03   in varchar2 default null,
    p_form_attribute_04   in varchar2 default null,
    p_form_attribute_05   in varchar2 default null,
    p_form_attribute_06   in varchar2 default null,
    p_form_attribute_07   in varchar2 default null,
    p_form_attribute_08   in varchar2 default null,
    p_form_attribute_09   in varchar2 default null,
    p_form_attribute_10   in varchar2 default null,
    p_form_attribute_11   in varchar2 default null,
    p_form_attribute_12   in varchar2 default null,
    p_form_attribute_13   in varchar2 default null,
    p_form_attribute_14   in varchar2 default null,
    p_form_attribute_15   in varchar2 default null,
    p_display_as_tab_form in varchar2 default null,
    p_display_seq_report  in number   default null,
    p_display_in_report   in varchar2 default null,
    p_display_as_report   in varchar2 default null,
    p_mask_report         in varchar2 default null,
    p_aggregate_by        in varchar2 default null,
    p_lov_query           in varchar2 default null,
    p_default_value       in varchar2 default null,
    p_required            in varchar2 default null,
    p_alignment           in varchar2 default null,
    p_display_width       in number   default null,
    p_max_width           in number   default null,
    p_height              in number   default null,
    p_group_by            in varchar2 default null,
    p_order_by_seq        in number   default null,
    p_order_by_asc_desc   in varchar2 default null,
    p_searchable          in varchar2 default null
    );

procedure create_lov_data (
    p_id                 in number      default null,
    p_column_id          in number      default null,
    p_lov_disp_sequence  in number      default null,
    p_lov_disp_value     in varchar2    default null,
    p_lov_return_value   in varchar2    default null
    );

procedure remove_table_hint (
    p_table_id    in number   default null
    );

procedure remove_hint (
    p_schema          in varchar2 default null,
    p_table_name      in varchar2 default null
    );

procedure synch_hints (
    p_schema          in varchar2 default null,
    p_table_name      in varchar2 default null
    );

function gen_lov_name (
    p_owner        in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2,
    p_sgid         in number,
    p_app_number   in number,
    p_page_number  in number
    ) return varchar2;


procedure get_table_ui_defaults (
    p_schema               in  varchar2,
    p_table_name           in  varchar2
    );

procedure get_col_ui_defaults (
    p_schema              in  varchar2,
    p_table_name          in  varchar2,
    p_column_name         in  varchar2
    );

function check_table (
    p_schema      in varchar2,
    p_table_name  in varchar2
    ) return varchar2;

procedure create_table_hint_priv (
    p_table_id             in number   default null,
    p_schema               in varchar2 default null,
    p_table_name           in varchar2 default null,
    p_form_region_title    in varchar2 default null,
    p_report_region_title  in varchar2 default null
    );

procedure create_group_priv (
    p_group_id             in number   default null,
    p_table_id             in number   default null,
    p_group_name           in varchar2 default null,
    p_description          in varchar2 default null,
    p_display_sequence     in number   default null
    );

procedure create_column_hint_priv (
    p_column_id           in number   default null,
    p_table_id            in number   default null,
    p_column_name         in varchar2 default null,
    p_group_id            in number   default null,
    p_label               in varchar2 default null,
    p_help_text           in varchar2 default null,
    p_mask_form           in varchar2 default null,
    p_display_seq_form    in number   default null,
    p_display_in_form     in varchar2 default null,
    p_display_as_form     in varchar2 default null,
    p_form_attribute_01   in varchar2 default null,
    p_form_attribute_02   in varchar2 default null,
    p_form_attribute_03   in varchar2 default null,
    p_form_attribute_04   in varchar2 default null,
    p_form_attribute_05   in varchar2 default null,
    p_form_attribute_06   in varchar2 default null,
    p_form_attribute_07   in varchar2 default null,
    p_form_attribute_08   in varchar2 default null,
    p_form_attribute_09   in varchar2 default null,
    p_form_attribute_10   in varchar2 default null,
    p_form_attribute_11   in varchar2 default null,
    p_form_attribute_12   in varchar2 default null,
    p_form_attribute_13   in varchar2 default null,
    p_form_attribute_14   in varchar2 default null,
    p_form_attribute_15   in varchar2 default null,
    p_display_as_tab_form in varchar2 default null,
    p_display_seq_report  in number   default null,
    p_display_in_report   in varchar2 default null,
    p_display_as_report   in varchar2 default null,
    p_mask_report         in varchar2 default null,
    p_aggregate_by        in varchar2 default null,
    p_lov_query           in varchar2 default null,
    p_default_value       in varchar2 default null,
    p_required            in varchar2 default null,
    p_alignment           in varchar2 default null,
    p_display_width       in number   default null,
    p_max_width           in number   default null,
    p_height              in number   default null,
    p_group_by            in varchar2 default null,
    p_order_by_seq        in number   default null,
    p_order_by_asc_desc   in varchar2 default null,
    p_searchable          in varchar2 default null
    );

procedure create_lov_data_priv (
    p_id                 in number      default null,
    p_column_id          in number      default null,
    p_lov_disp_sequence  in number      default null,
    p_lov_disp_value     in varchar2    default null,
    p_lov_return_value   in varchar2    default null
    );


procedure remove_hint_priv (
    p_schema          in varchar2 default null,
    p_table_name      in varchar2 default null
    );

function check_lov_issues (
    p_table_id in number
    ) return varchar2;

procedure create_normalize_hint (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2,
    p_lov_query   in varchar2
    );

procedure update_table_hint (
    p_table_id             in number   default null,
    p_schema               in varchar2 default null,
    p_table_name           in varchar2 default null,
    p_form_region_title    in varchar2 default null,
    p_report_region_title  in varchar2 default null
    );

procedure update_group (
    p_group_id             in number   default null,
    p_table_id             in number   default null,
    p_group_name           in varchar2 default null,
    p_description          in varchar2 default null,
    p_display_sequence     in number   default null
    );

procedure update_column_hint (
    p_column_id           in number   default null,
    p_table_id            in number   default null,
    p_column_name         in varchar2 default null,
    p_group_id            in number   default null,
    p_label               in varchar2 default null,
    p_help_text           in varchar2 default null,
    p_mask_form           in varchar2 default null,
    p_display_seq_form    in number   default null,
    p_display_in_form     in varchar2 default null,
    p_display_as_form     in varchar2 default null,
    p_display_as_tab_form in varchar2 default null,
    p_display_seq_report  in number   default null,
    p_display_in_report   in varchar2 default null,
    p_display_as_report   in varchar2 default null,
    p_mask_report         in varchar2 default null,
    p_aggregate_by        in varchar2 default null,
    p_lov_query           in varchar2 default null,
    p_default_value       in varchar2 default null,
    p_required            in varchar2 default null,
    p_alignment           in varchar2 default null,
    p_display_width       in number   default null,
    p_max_width           in number   default null,
    p_height              in number   default null,
    p_group_by            in varchar2 default null,
    p_order_by_seq        in number   default null,
    p_order_by_asc_desc   in varchar2 default null,
    p_searchable          in varchar2 default null
    );

procedure update_lov_data (
    p_id                 in number      default null,
    p_column_id          in number      default null,
    p_lov_disp_sequence  in number      default null,
    p_lov_disp_value     in varchar2    default null,
    p_lov_return_value   in varchar2    default null
    );

procedure remove_column_hint (
    p_column_id  in number   default null
    );

procedure remove_lov_data (
    p_id  in number   default null
    );

procedure remove_group (
    p_group_id  in number  default null
    );

--

procedure synch_defaults_from_app (
   p_application_id         in number,
   p_form_page_id           in number default null,
   p_report_page_id         in number default null,
   p_table_id               in number,
   p_attributes_to_synch    in varchar2)
   ;

procedure migrate (
   p_table_id   in number
   );

procedure update_ad_from_items (
   p_application_id   in number,
   p_page_id          in number,
   p_item_id          in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2);

procedure insert_ad_from_items (
   p_application_id   in number,
   p_page_id          in number,
   p_item_id          in number,
   p_attr_to_include  in varchar2);

procedure update_ad_from_cr (
   p_application_id   in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2);

procedure update_ad_from_ir (
   p_application_id   in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2);

procedure insert_ad_from_cr (
   p_application_id   in number,
   p_rc_id            in number,
   p_attr_to_include  in varchar2);

procedure insert_ad_from_ir (
   p_application_id   in number,
   p_rc_id            in number,
   p_attr_to_include  in varchar2);

procedure update_items_from_ad (
   p_application_id   in number,
   p_page_id          in number,
   p_item_id          in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2);

procedure update_ir_from_ad (
   p_application_id   in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2);

procedure update_cr_ht_from_ad (
   p_application_id   in number,
   p_page_id          in number,
   p_region_id        in number);

procedure update_cr_from_ad (
   p_application_id   in number,
   p_page_id          in number,
   p_region_id        in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2);

procedure create_col_attribute (
    p_column_id             in number   default null,
    p_column_name           in varchar2 default null,
    p_label                 in varchar2 default null,
    p_help_text             in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_default_value         in varchar2 default null,
    p_form_format_mask      in varchar2 default null,
    p_form_display_width    in number   default null,
    p_form_display_height   in number   default null,
    p_form_data_type        in varchar2 default null,
    p_report_format_mask    in varchar2 default null,
    p_report_col_alignment  in varchar2 default null
    );

procedure create_col_synonym (
    p_syn_id             in number   default null,
    p_column_id          in number   default null,
    p_syn_name           in varchar2 default null
    );

procedure update_col_attribute (
    p_column_id             in number   default null,
    p_column_name           in varchar2 default null,
    p_label                 in varchar2 default null,
    p_help_text             in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_default_value         in varchar2 default null,
    p_form_format_mask      in varchar2 default null,
    p_form_display_width    in number   default null,
    p_form_display_height   in number   default null,
    p_form_data_type        in varchar2 default null,
    p_report_format_mask    in varchar2 default null,
    p_report_col_alignment  in varchar2 default null
    );

procedure update_col_synonym (
    p_syn_id             in number   default null,
    p_syn_name           in varchar2 default null
    );

procedure remove_col_attribute (
    p_column_id          in number   default null
    );

procedure remove_col_attr_by_name (
    p_column_name        in varchar2   default null
    );

procedure remove_col_synonym (
    p_syn_id             in number   default null
    );

procedure remove_col_syn_by_name (
    p_syn_name           in varchar2   default null
    );

function ad_col_hint_exists (
    p_sgid        in number,
    p_schema      in varchar2,
    p_table_name  in varchar2
    ) return boolean;

procedure get_ad_ui_defaults (
    p_sgid                in  number,
    p_column_name         in  varchar2
    );

end wwv_flow_hint;
/
show errors;
