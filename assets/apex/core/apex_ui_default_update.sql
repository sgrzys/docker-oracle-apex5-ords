
set define '^'
set verify off
prompt ...apex_ui_default_update

Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      sbkenned  01/04/2008 - Created
Rem      sbkenned  01/15/2008 - Changed item_label to just label (also used by reports)
Rem      sbkenned  02/05/2010 - Added support for Attribute Dictionary
Rem                           - Added update to all table, column and group attribues via one procedure (each)
Rem                           - Added delete of table, column, group
Rem      sbkenned  02/10/2010 - Added synch_table


create or replace package apex_ui_default_update as

--  Copyright (c) Oracle Corporation 2008. All Rights Reserved.
--
--    NAME
--      apex_ui_default_update.sql
--
--    DESCRIPTION
--      API to allow update to select attributes via mechanism other than APEX.
--
--    NOTES
--      Within upd_table, upd_group, upd_column, and upd_ad_column, to set attribute to null, pass in 'null%'
--
--    INTERNATIONALIZATION
--      No known issues
--
--    MULTI-CUSTOMER
--      Because UI Defaults are schema specific, there is no SGID check
--      These can only be run for the current user
--

procedure upd_form_region_title (
    p_table_name            in varchar2,
    p_form_region_title     in varchar2 default null
    );

procedure upd_report_region_title (
    p_table_name            in varchar2,
    p_report_region_title   in varchar2 default null
    );

procedure upd_label (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_label                 in varchar2 default null
    );

procedure upd_item_help (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_help_text             in varchar2 default null
    );

procedure upd_display_in_form (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_in_form       in varchar2
    );

procedure upd_display_in_report (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_in_report     in varchar2
    );

procedure upd_item_display_width (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_width         in number
    );

procedure upd_item_display_height (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_height        in number
    );

procedure upd_report_alignment (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_report_alignment      in varchar2
    );

procedure upd_item_format_mask (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_format_mask           in varchar2 default null
    );

procedure upd_report_format_mask (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_format_mask           in varchar2 default null
    ); 

-- new

procedure synch_table (
    p_table_name            in varchar2 
    );

procedure upd_table (
    p_table_name            in varchar2,
    p_form_region_title     in varchar2 default null,
    p_report_region_title   in varchar2 default null
    );

procedure upd_group (
    p_table_name            in varchar2,
    p_group_name            in varchar2,
    p_new_group_name        in varchar2 default null,
    p_description           in varchar2 default null,
    p_display_sequence      in varchar2 default null
    );

procedure upd_column (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_group_id              in varchar2  default null,
    p_label                 in varchar2  default null,
    p_help_text             in varchar2  default null,
    p_display_in_form       in varchar2  default null,
    p_display_seq_form      in varchar2  default null,
    p_mask_form             in varchar2  default null,
    p_default_value         in varchar2  default null,
    p_required              in varchar2  default null,
    p_display_width         in varchar2  default null,
    p_max_width             in varchar2  default null,
    p_height                in varchar2  default null,
    p_display_in_report     in varchar2  default null,
    p_display_seq_report    in varchar2  default null,
    p_mask_report           in varchar2  default null,
    p_alignment             in varchar2  default null
    );

procedure del_table (
   p_table_name            in varchar2 
   );

procedure del_group (
   p_table_name            in varchar2,
   p_group_name            in varchar2 
   );

procedure del_column (
   p_table_name             in varchar2,
   p_column_name            in varchar2 
   );

procedure add_ad_column (
    p_column_name           in  varchar2,
    p_label                 in  varchar2  default null,
    p_help_text             in  varchar2  default null,
    p_format_mask           in  varchar2  default null,
    p_default_value         in  varchar2  default null,
    p_form_format_mask      in  varchar2  default null,
    p_form_display_width    in  number    default null,
    p_form_display_height   in  number    default null,
    p_form_data_type        in  varchar2  default null,
    p_report_format_mask    in  varchar2  default null,
    p_report_col_alignment  in  varchar2  default null,
    p_syn_name1             in  varchar2  default null,
    p_syn_name2             in  varchar2  default null,
    p_syn_name3             in  varchar2  default null 
    );

procedure upd_ad_column (
    p_column_name           in varchar2,
    p_new_column_name       in varchar2  default null,
    p_label                 in varchar2  default null,
    p_help_text             in varchar2  default null,
    p_format_mask           in varchar2  default null,
    p_default_value         in varchar2  default null,
    p_form_format_mask      in varchar2  default null,
    p_form_display_width    in varchar2  default null,
    p_form_display_height   in varchar2  default null,
    p_form_data_type        in varchar2  default null,
    p_report_format_mask    in varchar2  default null,
    p_report_col_alignment  in varchar2  default null 
    );

procedure add_ad_synonym (
   p_column_name        in varchar2,
   p_syn_name           in varchar2 
   );

procedure upd_ad_synonym (
    p_syn_name           in varchar2,
    p_new_syn_name       in varchar2  default null 
    );

procedure del_ad_column (
    p_column_name           in varchar2 
    );

procedure del_ad_synonym (
    p_syn_name           in varchar2
    );

end apex_ui_default_update;
/
show errors