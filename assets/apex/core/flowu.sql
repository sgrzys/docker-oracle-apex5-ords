set define '^' verify off
prompt wwv_flow_utilities
create or replace package wwv_flow_utilities as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2000 - 2014. All Rights Reserved.
--
--    NAME
--      flowu.sql
--
--    DESCRIPTION
--      Application Express utility package.
--
--      Includes:
--      1. JavaScript Generation Utilities
--      2. Array Manipulation Utilities
--      3. Date Utilities
--      4. List of Values (LOV) Utilities
--      5. String Manipulation Function Utilities
--      6. If Then Else (ite) Utility
--      7. URL Utilities
--      8. Check Sum Utility
--      9. Bind Variable Utilities
--     10. Substitution Value Utilities
--
--    NOTES
--      This package contains utility functions for the APEX service.
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    08/04/1999 - Created
--     mhichwa    01/25/2000 - Added inStr_toStr, inStr_fromStr, minimum_free_page
--     mhichwa    01/26/2000 - Added minimum_free_flow
--     mhichwa    02/20/2000 - Added p_ok_to_query to allow popup lov to not query by default
--     mhichwa    03/02/2000 - Added p_popup_lov_type argument
--     mhichwa    03/21/2000 - Added url_decode2 function
--     mhichwa    04/08/2000 - Added procedure show_as_display_only
--     mhichwa    06/09/2000 - Added p_translation to show_as_display_only
--     mhichwa    06/21/2000 - Added procedure show_as_popup_calendar
--     mhichwa    10/31/2000 - Added checksum from tkyte but modified to return numbers
--     mhichwa    11/04/2000 - Added tkyte get binds function
--     mhichwa    11/05/2000 - Added comments and get_using_clause function
--     jkallman   11/15/2000 - Added get_substitution_value function
--     jkallman   11/16/2000 - Added grant to PUBLIC
--     mhichwa    11/20/2000 - Added flow_authentication function
--     mhichwa    02/08/2001 - Added is date (clbeck code)
--     mhichwa    02/13/2001 - Added is number (clbeck code)
--     jkallman   02/13/2001 - Added p_upper_vals to list_mgr_display
--     mhichwa    02/20/2001 - Added function to remove duplicate white space
--     mhichwa    02/24/2001 - Added function to display region name given region id
--     mhichwa    02/28/2001 - Added striphtml function provided by sdillon
--     jkallman   03/02/2001 - Added return key support in gen_popup_list, show_as_popup
--     mhichwa    03/05/2001 - Added get_display_value_given_lov
--     sdillon    03/15/2001 - Added pause
--     sdillon    03/22/2001 - Added is valid identifier function
--     mhichwa    03/29/2001 - Added my_url function and get cookie username given id
--     mhichwa    03/09/2001 - Added p company to gen popup list
--     mhichwa    05/04/2001 - Added fast replace functions (provided by tkyte)
--     mhichwa    06/22/2001 - Added remove trailing whitespace function
--     mhichwa    06/22/2001 - Added get_column_headings function
--     mhichwa    06/26/2001 - Changed vc4000Array to vc 32767
--     mhichwa    06/30/2001 - Enhanced comments
--     mhichwa    07/02/2001 - Added remove white space function provided by tkyte
--     cbcho      08/17/2001 - Added function show_line_number
--     jkallman   08/23/2001 - Added show_as_textarea_with_controls
--     jkallman   10/25/2001 - Added is_valid_alias
--     mhichwa    11/27/2001 - Added is_numeric
--     mhichwa    12/05/2001 - Added radiogroup 2
--     sspadafo   12/06/2001 - Added parse_query_string procedure
--     jkallman   01/16/2002 - Added time components to show_as_popup_calendar
--     cbcho      02/12/2002 - Added g_data_type and get_data_type function for qbe
--     sspadafo   02/16/2002 - Changed parse_query_string param types
--     mhichwa    02/18/2002 - Per rmattama instruction: Added p_attributes to list_mgr_display
--     mhichwa    02/18/2002 - Per rmattama instruction: added p_attributes to show_as_display_only
--     rmattama   02/18/2002 - Added support for p_attributes2
--     cbcho      02/28/2002 - Added g_xml_clob for xml data upload
--     cbcho      04/18/2002 - Changed p_show_extra default to 'YES' in show_as_checkbox and show_as_combobox
--     cbcho      04/19/2002 - Changed p_show_extra default to 'YES' in show_as_radio_group, show_as_radio_group2, show_as_multiple_select
--     cbcho      04/22/2002 - Removed show extra value from show_as_checkbox
--     mhichwa    05/21/2002 - Added p_filter_first
--     mhichwa    06/27/2002 - Added parse function
--     tmuth      10/04/2002 - Added p_item1 and p_item2 to list_mgr_display to separate the id from the attributes
--                           - as there are several items displayed by this that need different ids for JavaScript
--     sspadafo   04/24/2003 - Added p_lov_checksum to gen_popup_list parameters (Bug 2792894)
--     tmuth      05/06/2003 - Added p_item_name to show_as_radio_group and show_as_radio_group2
--     tmuth      05/13/2003 - Added p_item_name to show_as_checkbox
--     msewtz     06/19/2003 - Added is_valid_lov_query (bug 3007663)
--     mhichwa    07/11/2003 - Added extracthtml function written by jstraub (bug 3048540)
--     jkallman   07/12/2003 - Added p_application_format to show_as_popup_calendar
--     klrice     08/13/2003 - Added quick_link FUNCTION
--     klrice     08/13/2003 - reformatted FUNCTION quick_link
--     jkallman   08/22/2003 - Added clob_to_varchar2
--     jkallman   08/25/2003 - Added escape_url (Bug 3101477)
--     sspadafo   09/01/2003 - Added blob_to_clob (3047575)
--     sspadafo   09/02/2003 - Added p_offset to clob_to_varchar2 (3047575)
--     klrice     09/05/2003 - Added lov_checksum
--     tmuth      10/17/2003 - Added p_item_name parameter to show_as_textarea_with_controls
--     jkallman   10/27/2003 - Added support for p_nls_language in show_as_popup_calendar (Bug 3219231)
--     sspadafo   10/27/2003 - Added prepare_url function (Bug 3187964)
--     jkallman   11/05/2003 - Change p_url_charset in escape_url to default to null
--     sspadafo   11/05/2003 - Change p_url_charset in prepare_url to default to null
--     jkallman   11/13/2003 - Add p_escape_reserved to escape_url
--     msewtz     02/18/2004 - Added lov_value_array (bugs 3174478, 3119694)
--     sspadafo   03/12/2003 - Add p_escape parameter to parse function (Bug 2998081)
--     sspadafo   03/28/2004 - Add get_cgi_query_string_decoded function (Bug 3535416)
--     jkallman   05/28/2004 - Added pick_date_format_mask
--     klrice     06/02/2004 - added process_calendar_date
--     klrice     06/10/2004 - Added public calls for changing the calendar date
--     mhichwa    07/28/2004 - Changed max lov elements from 10000 to 1000000
--     sspadafo   02/08/2005 - Added p_checksum_type to prepare_url for URL tampering feature
--     sspadafo   02/08/2005 - Added page_checksum function for URL tampering feature
--     jkallman   02/23/2005 - Added function clob_to_blob
--     sspadafo   02/26/2005 - Added globals g_val_num, g_val_vc2 and functions savekey_num, keyval_num, savekey_vc2, keyval_vc2 for use in correlated subqueries
--     jkallman   05/19/2005 - Changed parameter p_nls_language to p_lang in show_as_popup_calendar
--     jkallman   06/28/2005 - Added function get_clob_md5
--     jkallman   07/14/2005 - Added procedure gen_filter_escape
--     sspadafo   10/24/2005 - Added procedure check_sgid (Bug 4692046)
--     msewtz     02/02/2006 - added function is_build_option_enabled
--     sspadafo   02/27/2006 - Added p_quote parameter to is_valid_identifier (Bug 5051084)
--     sspadafo   04/25/2006 - Added db_version, db_compatibility functions
--     sspadafo   04/26/2006 - Added db_version_is_at_least and db_version_is_at_least_i functions
--     mhichwa    05/01/2006 - Added p_item_id to gen_popup_list bug 2997135
--     mhichwa    05/01/2006 - Added p_item_id to show_as_popup bug 2997135
--     mhichwa    05/08/2006 - Added p_element_attributes to show_as_popup for 508
--     mhichwa    05/15/2006 - Added p_item_id to list_mgr_display (bug 5225858)
--     mhichwa    05/16/2006 - Added cache functions and procedures to manipulate page caching
--     mhichwa    06/28/2006 - Added p_null_display_value and p_display_extra arguments to show_as_display_only procedure bug (5327747)
--     mhichwa    06/29/2006 - Added export application and page to clob functions from jkallman java class
--     jstraub    08/03/2006 - Added function db_edition_is_xe
--     cbcho      12/01/2006 - Added gen_popup_color, show_as_popup_color
--     sathikum   12/29/2006 - Added weekly_calendar, daily_calendar
--     jkallman   01/02/2007 - Add p_application_id to show_as_popup_calendar (Bug 5729666)
--     mhichwa    01/02/2007 - Added region caching funcitonality
--     mhichwa    01/05/2007 - Added function count_stale_regions
--     rvallam    01/08/2007 - Added new function show_as_shuttle
--     ashiverm   01/09/2007 - Added new procedure show_as_textarea_html_editor
--     ashiverm   01/11/2007 - Added new function html_editor_language
--     rvallam    01/12/2007 - Added sort controls to show_as_shuttle
--     sathikum   01/17/2007 - Added month_calendar procedure
--     jkallman   01/18/2007 - Added host_url
--     jkallman   01/18/2007 - Add p_security_group_id to show_as_popup_calendar
--     sathikum   01/19/2007 - Added parameter to weekly_calendar,month_calendar & Daily_calendar
--     jkallman   01/26/2007 - Added p_format_mask to pick_date_format_mask
--     cbackstr   01/29/2007 - added id attribute to checkbox layout table
--     cbackstr   01/29/2007 - enhanced color picker popup
--     mhichwa    02/02/2002 - added procedure bulk_save_session_state
--     jkallman   02/08/2007 - Added procedure lob_replace
--     rvallam    02/14/2007 - Modifed indentation/added IN mode to parameters in show_as_shuttle
--     cbcho      02/16/2007 - Added function array_element
--     cbackstr   02/23/2007 - Simplified Color Picker per user feedback (Bug 5860057)
--     jkallman   02/26/2007 - Add argument p_raise to clob_to_varchar2
--     jkallman   03/09/2007 - Add b64_encode and encode filename (Bug 5924990)
--     sspadafo   04/27/2007 - Added overloaded version of function cache_get_date_cached for regions (Bug 5996963)
--     mhichwa    12/04/2007 - Added get_theme_file
--     mhichwa    12/05/2007 - Added show_ir_help
--     mhichwa    12/06/2007 - Made ir help context sensitive
--     msewtz     01/07/2008 - Added get_print_document
--     mhichwa    01/10/2008 - removed code
--     msewtz     01/24/2008 - moved is_valid_lov_query to wwv_flow_f4000_util (bug 6707530)
--     sspadafo   01/26/2008 - Replaced g_query declaration with g_query_hold (bug 6707923)
--     mhichwa    01/30/2008 - Enhanced comments
--     jkallman   02/04/2008 - Added string_to_table3
--     msewtz     02/06/2008 - Added overloaded versions of download_print_document and get_print_document to support supplying XML data in CLOB format
--     madelfio   02/27/2008 - Added p_lang parameter in show_ir_help (bug 6851312)
--     cbackstr   04/16/2008 - updates to html css and javascript effecting different popup item types (Bug 6976538)
--     jkallman   05/30/2008 - Change lob_replace to use nocopy parameter modifier
--     mhichwa    12/31/2008 - Added p_save_session_state_yn argument to prepare_url to save state on redirect branches
--     jstraub    01/21/2009 - Added p_export_saved_reports to export_application_to_clob
--     pawolf     03/23/2009 - Added get_excel_mime_type and print_download_header
--     sathikum   05/11/2009 - Added procedure Custom_Calendar
--     pawolf     08/17/2009 - Added string_to_table4
--     cbcho      11/11/2009 - Added p_export_ir_public_reports,p_export_ir_notifications to export_application_to_clob
--     arayner    11/12/2009 - Added g_null_map global for storing page elements that have a developer defined null value
--     cbcho      11/12/2009 - Renamed p_export_saved_reports to p_export_ir_private_reports in export_application_to_clob
--     arayner    11/12/2009 - Added add_null_map procedure
--     arayner    11/12/2009 - Changed g_null_map to use associative array
--     arayner    11/17/2009 - Replaced g_null_map with a record structure t_null_value_entry, to support different types of null value entry (ITEM or COLUMN), also renamed add_null_map procedure to add_null_value_entry
--     pawolf     01/13/2010 - Added pick_date_classic_format_mask
--     jstraub    01/13/2010 - Added export_workspace_to_clob
--     sathikum   02/01/2010 - Adding jQueryUI Date Picker related functions
--     jstraub    02/12/2010 - Exposed get_javascript_date_format in package spec
--     pawolf     02/24/2010 - Added export for feedback
--     sathikum   02/25/2010 - Added get_time_format to determine time display and format for datepicker
--     arayner    03/24/2010 - Added show_image procedure to handle generating image HTML in a more accessible way
--     arayner    03/24/2010 - Added p_anchor_id parameter to the show_image procedure
--     arayner    04/07/2010 - Added p_attributes parameter to show_image procedure
--     sbkenned   04/22/2010 - Added p_help_type to show_ir_help
--     arayner    04/23/2010 - Removed show_image procedure and added simpler show_icon
--     jkallman   05/13/2010 - Removed redirect_url from package specification (Bug 9708953)
--     jstraub    10/12/2010 - Added wwv_flow_team_tag_sync (bug 10104409)
--     pawolf     10/29/2010 - Bug# 10247107: added table_to_string3
--     pawolf     11/26/2010 - Bug# 9789152: Removed gen_popup_color
--     jstraub    12/15/2010 - Added is_available_application_id
--     msewtz     01/25/2011 - Added p_http_hdr_attr1 to print_download_header to allow for additional http header lines
--     cbcho      01/31/2011 - Added export_ws_app_to_clob (bug 10055338)
--     cneumuel   03/30/2011 - Overloaded table_to_string with vc4000Array argument type
--     jkallman   04/05/2011 - Added lob_replace supporting CLOBs
--     msewtz     04/21/2011 - Updated gen_popup_list to support show nulls for tabular form columns (bug 10176505)
--     pawolf     04/27/2011 - Removed t_temp_lov_data and t_temp_lov_value from package spec and moved it to tab.sql
--     pawolf     04/28/2011 - Fixed bug of uninitialized collection in populate_temp_lov_table
--     pawolf     05/02/2011 - Moved object types into it's own file types.sql
--     pawolf     05/02/2011 - Added redirect_url (feature# 694)
--     pawolf     05/05/2011 - Restored new color picker
--     pawolf     05/27/2011 - Added is_public_user
--     arayner    06/01/2011 - Moved get_layout_table_attributes from wwv_flow_utilities to this package (bug 12431813)
--     cneumuel   06/03/2011 - Moved get_clob_textarea_value from wwv_flow_f4000_plugins to this package
--     jstraub    07/06/2011 - Added p_export_translations to export_application_to_clob to support exporting translations in APEXExport
--     cneumuel   07/11/2011 - Added unescape_url
--     pawolf     07/13/2011 - Removed parameter p_set_session_id_to_zero from rewrite_query_string (bug# 11855392)
--     jkallman   10/26/2011 - Added parameter p_check_reserved to is_available_application_id
--     jstraub    11/03/2011 - Added export_files_to_clob
--     jstraub    11/09/2011 - Added p_include_script_header to export_workspace (bug 13355663)
--     cbcho      11/29/2011 - Added load_apex_archive_file
--     jstraub    11/30/2011 - Reverted changes for bug 13355663, now handled in APEXExport with fix for bug 13375538
--     pawolf     02/01/2012 - Added get_temp_lov_query and removed populate_temp_lov (bug# 13640940)
--     pawolf     02/02/2011 - Added parameter p_use_template to get_temp_lov_query (bug 13640940)
--     pawolf     02/28/2012 - Added placeholder support to get_date_picker (feature# 837)
--     sathikum   03/06/2012 - Added agenda_calendar procedure (#812)
--     cneumuel   04/03/2012 - Prefixed sys packages with schema name to avoid public synonyms (bug #12338050)
--     jstraub    04/26/2012 - Added export_restful_to_clob (bug 14008382)
--     pawolf     05/09/2012 - Added emit_popup_lov_header (feature# 821)
--     cneumuel   05/31/2012 - Added format
--     arayner    06/15/2012 - Added p_item_label to show_as_popup_color (bug 14198566)
--     cneumuel   07/02/2012 - Added get_app_id_reserved_reason (bug #14241822)
--     cneumuel   08/07/2012 - Added get_temp_lov_index, for static lov performance improvement (bug #14191581)
--     hfarrell   11/27/2012 - Added is_valid_application_name (bug #15889878)
--     cneumuel   12/07/2012 - Changed sample domains in docs to example.com (bug #15963390)
--     cbcho      01/29/2013 - Extended export_page_to_clob to accept export of Interactive components(bug #16224861)
--     cbcho      02/05/2013 - Changed minimum_free_page to accept p_start_page (bug #16238360)
--     cbcho      02/27/2013 - Added t_dependent_object, t_dependent_object_list and get_dependency_objects (bug #16397724)
--     vuvarov    03/01/2013 - Removed grant to public
--     cbcho      03/06/2013 - Removed p_schema from get_dependency_objects (bug #16397724)
--     jstraub    03/22/2013 - Added p_minimal to export_workspace and export_workspace_to_clob
--     pawolf     04/08/2013 - Added get_friendly_workspace_url and get_friendly_app_url
--     cneumuel   04/16/2013 - In export_application_to_clob, export_application_to_db, export_page_to_clob:  add p_with_original_ids (feature #985)
--     cneumuel   04/25/2013 - Added split, join, join_clob. Renamed vc4000array to wwv_flow_t_varchar2
--     cneumuel   05/29/2013 - Added append
--     hfarrell   06/04/2013 - Added get_page_mode  (feature #1200)
--     hfarrell   06/17/2013 - Moved get_page_mode to wwv_flow_page.plb
--     cneumuel   07/08/2013 - Added split_numbers, join(wwv_flow_t_number)
--     hfarrell   07/17/2013 - Added is_valid_group_name to handle validation of group name (bug #17059125)
--     hfarrell   07/17/2013 - Added is_valid_application_id to handle validation of app id during app creation (bug #17054656)
--     hfarrell   08/21/2013 - Added get_region_static_id to retrieve value for a given region ID (feature #1201)
--     hfarrell   08/23/2013 - Removed get_region_static_id - not required
--     cneumuel   08/29/2013 - Added is_email. Simplified is_valid_alias (bug #17375236)
--     cneumuel   09/11/2013 - Added export_application_as_download, export_page_as_download, export_component_as_download
--     cneumuel   09/24/2013 - Added wrap_clob, to add text to a clob without running into varchar2 limitations with concatenation
--     pawolf     10/24/2013 - Added p_dialog to prepare_url
--     cneumuel   01/10/2014 - Added minimum_free_flow_candidates to unify code in minimum_free_flow and wwv_flow_api.create_language_map.
--     hfarrell   01/24/2014 - Added get_page_group_id function
--     hfarrell   01/27/2014 - Added is_valid_page_group_name (feature #1347)
--     cneumuel   02/26/2014 - In prepare_url: added p_rejoin_public_only, for calls from wwv_flow_session_state.prepare_url_in_anchors.
--                           - escape printer friendly attribute and rest of url.
--     cbcho      03/21/2014 - Added p_export_pkg_app_mapping to export_application_to_clob and export_ws_app_to_clob (feature #1399)
--     cneumuel   05/27/2014 - Moved show_as_popup_color from wwv_flow_utilities to body of wwv_flow_native_item and cleaned it up (bug #18818832)
--     arayner    06/24/2014 - Deprected p_disable of quick_link (bug #17881111)
--     cneumuel   06/27/2014 - Removed show_invalid_instance_screen
--     cneumuel   07/14/2014 - Added is_lov_value for LOV validation
--     pawolf     09/25/2014 - Added reset_friendly_url_cache
--     pawolf     09/25/2014 - API of wwv_flow_utilities.get_friendly_* changed
--     cneumuel   09/29/2014 - Added split_clob
--     cneumuel   10/06/2014 - Added get_target_url_app_info
--     vuvarov    10/14/2014 - In export_application_to_clob, added p_subscription_override (feature #1532)
--     cneumuel   10/28/2014 - Added push for wwv_flow_t_varchar2 and wwv_flow_t_number; improved split_clob, split, split_numbers
--     cneumuel   10/30/2014 - Added parse_p; use in f and prepare_url (bug #17750471)
--     cneumuel   10/31/2014 - Removed page_checksum.
--     vuvarov    12/03/2014 - In export_application_to_clob, added p_exclude_subscriptions (feature #1532)
--     cneumuel   01/30/2015 - Added get_hash (bug #20384628)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Flow Utilities Public Data Types
--==============================================================================
    type vc_assoc_arr  is table of varchar2(32767) index by varchar2(255);

    type t_null_value_entry is record (
        entry_type   varchar2(255),
        entry_name   varchar2(255),
        entry_value  varchar2(255));

    type t_null_value_list is table of t_null_value_entry index by pls_integer;

    type t_dependent_object is record (
        owner              sys.user_dependencies.referenced_owner%type,
        object_type        sys.user_dependencies.referenced_type%type,
        object_name        sys.user_dependencies.referenced_name%type );

    type t_dependent_object_list is table of t_dependent_object index by binary_integer;

    type t_p_arguments is record (
        app              varchar2(4000),
        page             varchar2(4000),
        session_id       varchar2(4000),
        request          varchar2(4000),
        debug            varchar2(4000),
        clear_cache      varchar2(4000),
        arg_names_vc2    varchar2(4000),
        arg_names        wwv_flow_global.vc_arr2,
        arg_values_vc2   varchar2(32767),
        arg_values       wwv_flow_global.vc_arr2,
        printer_friendly varchar2(4000) );

--==============================================================================
-- Misc Global Variables
--==============================================================================
    empty_vc_arr        wwv_flow_global.vc_arr2;
    g_value             wwv_flow_global.vc_arr2;
    g_display           wwv_flow_global.vc_arr2;
    g_query_hold        varchar2(32767) := null;
    g_data_type         varchar2(256) := null;
    g_xml_clob          clob;
    g_val_num           number;
    g_val_vc2           varchar2(4000);
    g_null_map          vc_assoc_arr;
    g_null_value_list   t_null_value_list;

--==============================================================================
-- ASCII regexp ranges
--==============================================================================
    c_alpha             constant varchar2(52) := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    c_alnum             constant varchar2(62) := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';

--==============================================================================
procedure bulk_save_session_state (
    p_value   in varchar2,
    p_item_01 in varchar2 default null,
    p_item_02 in varchar2 default null,
    p_item_03 in varchar2 default null,
    p_item_04 in varchar2 default null,
    p_item_05 in varchar2 default null,
    p_item_06 in varchar2 default null,
    p_item_07 in varchar2 default null,
    p_item_08 in varchar2 default null,
    p_item_09 in varchar2 default null,
    p_item_10 in varchar2 default null,
    p_item_11 in varchar2 default null,
    p_item_12 in varchar2 default null,
    p_item_13 in varchar2 default null,
    p_item_14 in varchar2 default null,
    p_item_15 in varchar2 default null,
    p_item_16 in varchar2 default null,
    p_item_17 in varchar2 default null,
    p_item_18 in varchar2 default null,
    p_item_19 in varchar2 default null,
    p_item_20 in varchar2 default null,
    p_item_21 in varchar2 default null,
    p_item_22 in varchar2 default null,
    p_item_23 in varchar2 default null,
    p_item_24 in varchar2 default null,
    p_item_25 in varchar2 default null,
    p_item_26 in varchar2 default null,
    p_item_27 in varchar2 default null,
    p_item_28 in varchar2 default null,
    p_item_29 in varchar2 default null,
    p_item_30 in varchar2 default null,
    p_item_31 in varchar2 default null,
    p_item_32 in varchar2 default null,
    p_item_33 in varchar2 default null,
    p_item_34 in varchar2 default null,
    p_item_35 in varchar2 default null,
    p_item_36 in varchar2 default null,
    p_item_37 in varchar2 default null,
    p_item_38 in varchar2 default null,
    p_item_39 in varchar2 default null,
    p_item_40 in varchar2 default null,
    p_item_41 in varchar2 default null,
    p_item_42 in varchar2 default null,
    p_item_43 in varchar2 default null,
    p_item_44 in varchar2 default null,
    p_item_45 in varchar2 default null,
    p_item_46 in varchar2 default null,
    p_item_47 in varchar2 default null,
    p_item_48 in varchar2 default null,
    p_item_49 in varchar2 default null,
    p_item_50 in varchar2 default null,
    p_set_as_preference  in varchar2 default 'N')
    ;



-------------------------------------------------------------------------------
-- JavaScript Generation Utilities
--
--


procedure open_noscript
    -- Generates javascript that...
    --
    --
    ;

function  open_noscript
    -- Generates javascript that...
    --
    --
    return varchar2
    ;

procedure close_noscript
    -- Generates javascript that...
    --
    --
    ;

function close_noscript
    -- Generates javascript that...
    --
    --
    return varchar2
    ;

procedure open_javascript (
    -- Generates javascript that...
    --
    --
    version varchar2 default '1.1')
    ;

function open_javascript (
    -- Generates javascript that...
    --
    --
    version varchar2 default '1.1')
    return varchar2
    ;

procedure close_javascript
    -- Generates javascript that...
    --
    --
    ;

function close_javascript
    -- Generates javascript that...
    --
    --
    return varchar2
    ;

procedure add_null_value_entry (
    -- Generates javascript that...
    --
    --
    p_entry_type    varchar2,
    p_entry_name    varchar2,
    p_entry_value   varchar2 )
    ;

procedure append_to_list
    -- Generates javascript that...
    --
    --
    ;

procedure delete_from_list
    -- Generates javascript that...
    --
    --
    ;

procedure delete_list_element
    -- Generates javascript that...
    --
    --
    ;

function delete_list_element
    -- Generates javascript that...
    --
    --
    return varchar2
    ;


-------------------------------------------------------------------------------
-- Array Manipulation Utilities
--

function in_list (
    p_value      varchar2,
    p_array      wwv_flow_global.vc_arr2)
    return boolean
    ;


-------------------------------------------------------------------------------
-- Date Utilities
--

function time_since (
    --
    --
    --
    p_date     in date)
    return varchar2
    ;


-------------------------------------------------------------------------------
-- Text Area with Controls Utilities
--

procedure show_as_textarea_with_controls(
    p_value      in varchar2 default null,
    p_name       in varchar2 default null,
    p_height     in varchar2 default null,
    p_size       in varchar2 default null,
    p_attributes in varchar2 default null,
    p_item_name  in varchar2 default null )
    ;


-------------------------------------------------------------------------------
-- Text Area with HTML Editor
--

function html_editor_language
    -- Checks for html editor's specified/default language...
    --
    --
    return varchar2
    ;

procedure show_as_textarea_html_editor(
    p_value      in varchar2 default null,
    p_name       in varchar2 default null,
    p_height     in varchar2 default null,
    p_size       in varchar2 default null,
    p_attributes in varchar2 default null,
    p_toolbarset in varchar2 default null,
    p_item_name  in varchar2 default null )
    ;


-------------------------------------------------------------------------------
-- List of Values (LOV) Utilities
--

procedure list_mgr_display (
    p_lov          in varchar2 default null,
    p_popup_lov_type in varchar2 default 'POPUP',
    p_name         in varchar2 default null,
    p_text_name    in varchar2 default null,
    p_value        in wwv_flow_global.vc_arr2,
    p_edit_mode    in boolean,
    p_upper_vals   in boolean default true,
    p_form_index   in number default 0,
    p_attributes   in varchar2 default null,
    p_item1        in varchar2 default null,
    p_item2        in varchar2 default null,
    p_item_id      in varchar2 default null)
    ;


procedure show_as_display_only (
    p_lov                in varchar2 default null,
    p_value              in varchar2 default null,
    p_translation        in varchar2 default null,
    p_attributes         in varchar2 default null,
    p_null_display_value in varchar2 default null,
    p_display_extra      in varchar2 default null)
    ;

procedure show_as_combobox (
    p_lov          in varchar2,
    p_value        in varchar2 default null,
    p_name         in varchar2 default null,
    p_height       in varchar2 default null,
    p_show_null    in varchar2 default null,
    p_null_text    in varchar2 default '%',
    p_null_value   in varchar2 default '%null%',
    p_show_extra   in varchar2 default 'YES',
    p_extra_text   in varchar2 default null,
    p_onBlur       in varchar2 default null,
    p_onChange     in varchar2 default null,
    p_onFocus      in varchar2 default null,
    p_max_elements in number   default 1000000,
    p_attributes   in varchar2 default null,
    p_translation  in varchar2 default 'NO')
    ;

procedure show_as_multiple_select (
    p_lov          in varchar2,
    p_value        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_name         in varchar2 default null,
    p_show_null    in varchar2 default null,
    p_null_text    in varchar2 default '%',
    p_null_value   in varchar2 default '%null%',
    p_height       in varchar2 default null,
    p_show_extra   in varchar2 default 'YES',
    p_extra_text   in varchar2 default null,
    p_onBlur       in varchar2 default null,
    p_onChange     in varchar2 default null,
    p_onFocus      in varchar2 default null,
    p_max_elements in number   default 1000000,
    p_attributes   in varchar2 default null,
    p_translation  in varchar2 default 'NO')
    ;

procedure show_as_multiple_select2 (
    p_lov          in varchar2,
    p_value        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_name         in varchar2 default null,
    p_show_null    in varchar2 default null,
    p_null_text    in varchar2 default '%',
    p_null_value   in varchar2 default '%null%',
    p_height       in varchar2 default null,
    p_show_extra   in varchar2 default 'YES',
    p_extra_text   in varchar2 default null,
    p_onBlur       in varchar2 default null,
    p_onChange     in varchar2 default null,
    p_onFocus      in varchar2 default null,
    p_max_elements in number   default 1000000,
    p_attributes   in varchar2 default null,
    p_translation  in varchar2 default 'NO')
    ;

procedure show_as_radio_group (
    --
    -- Standard radio group
    --
    p_lov          in varchar2,
    p_value        in varchar2 default null,
    p_name         in varchar2 default null,
    p_show_null    in varchar2 default null,
    p_null_text    in varchar2 default '%',
    p_null_value   in varchar2 default '%null%',
    p_cols         in varchar2 default null,
    p_show_extra   in varchar2 default 'YES',
    p_extra_text   in varchar2 default null,
    p_onBlur       in varchar2 default null,
    p_onChange     in varchar2 default null,
    p_onFocus      in varchar2 default null,
    p_max_elements in varchar2 default null,
    p_attributes   in varchar2 default null,
    p_translation  in varchar2 default 'NO',
    p_attributes2  in varchar2 default null,
    p_item_name    in varchar2 default null)
    ;

procedure show_as_radio_group2 (
    --
    -- same as radiogroup except radio group is shown without an inline html table
    --
    p_lov          in varchar2,
    p_value        in varchar2 default null,
    p_name         in varchar2 default null,
    p_show_null    in varchar2 default null,
    p_null_text    in varchar2 default '%',
    p_null_value   in varchar2 default '%null%',
    p_cols         in varchar2 default null,
    p_show_extra   in varchar2 default 'YES',
    p_extra_text   in varchar2 default null,
    p_onBlur       in varchar2 default null,
    p_onChange     in varchar2 default null,
    p_onFocus      in varchar2 default null,
    p_max_elements in varchar2 default null,
    p_attributes   in varchar2 default null,
    p_translation  in varchar2 default 'NO',
    p_attributes2  in varchar2 default null,
    p_item_name    in varchar2 default null)
    ;

procedure show_as_checkbox (
    p_lov          in varchar2,
    p_value        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_name         in varchar2 default null,
    p_cols         in varchar2 default null,
    p_show_extra   in varchar2 default null,
    p_extra_text   in varchar2 default null,
    p_onBlur       in varchar2 default null,
    p_onChange     in varchar2 default null,
    p_onFocus      in varchar2 default null,
    p_max_elements in number   default 1000000,
    p_attributes   in varchar2 default null,
    p_translation  in varchar2 default 'NO',
    p_attributes2  in varchar2 default null,
    p_item_name    in varchar2 default null)
    ;

procedure gen_popup_list (
    p_name                    in varchar2,
    p_lov                     in varchar2,
    p_lov_checksum            in varchar2,
    p_element_index           in varchar2,
    p_form_index              in varchar2,
    p_filter                  in varchar2,
    p_escape_html             in varchar2 default null,
    p_max_elements            in varchar2 default null,
    p_before_field_field_text in varchar2 default null,
    p_after_field_field_text  in varchar2 default null,
    p_title                   in varchar2 default null,
    p_image                   in varchar2 default null,
    p_help                    in varchar2 default null,
    p_eval_value              in varchar2 default null,
    p_request                 in varchar2 default null,
    p_min_row                 in number   default 1,
    p_translation             in varchar2 default 'NO',
    p_return_key              in varchar2 default 'NO',
    p_hidden_elem_name        in varchar2 default null,
    p_elem_id                 in varchar2 default null,
    p_hidden_elem_id          in varchar2 default null,
    --
    p_ok_to_query             in varchar2 default 'YES',
    p_flow_id                 in number   default null,
    p_page_id                 in number   default null,
    p_session_id              in number   default null,
    p_company                 in number   default null,
    p_item_id                 in varchar2 default null,
    p_column_id               in number   default null)
    ;

procedure show_as_popup_calendar (
    p_request                 in varchar2 default null,
    p_title                   in varchar2 default null,
    p_yyyy                    in varchar2 default null,
    p_mm                      in varchar2 default null,
    p_dd                      in varchar2 default null,
    p_hh                      in varchar2 default null,
    p_mi                      in varchar2 default null,
    p_pm                      in varchar2 default null,
    p_element_index           in varchar2 default null,
    p_form_index              in varchar2 default null,
    p_date_format             in varchar2 default 'MM/DD/YYYY',
    p_bgcolor                 in varchar2 default '#336699',
    p_white_foreground        in varchar2 default 'Y',
    p_application_format      in varchar2 default 'N',
    p_lang                    in varchar2 default null,
    p_application_id          in varchar2 default null,
    p_security_group_id       in varchar2 default null)
    ;

procedure show_as_popup (
    p_lov               in varchar2,
    p_name              in varchar2 default null,
    p_value             in varchar2 default null,
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'NO',
    p_hidden_elem_name  in varchar2 default null,
    p_filter_first_fetch in varchar2 default 'NO',
    p_item_id           in varchar2 default null,
    p_element_attributes in varchar2 default null,
    p_item_name in varchar2 default null)
    ;

function show_as_popup (
    p_lov               in varchar2,
    p_name              in varchar2 default null,
    p_value             in varchar2 default null,
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'NO',
    p_hidden_elem_name  in varchar2 default null,
    p_filter_first_fetch in varchar2 default 'NO',
    p_item_id           in varchar2 default null,
    p_element_attributes in varchar2 default null,
    p_item_name in varchar2 default null)
    return varchar2
    ;

function static_to_query (
    p_lov                   in varchar2 default null)
    return varchar2
    ;


-------------------------------------------------------------------------------
-- String Manipulation Function Utilities
--

function remws(
    --
    -- Given a string remove the lead, trailing, or leading and trialing whitespace.
    --
    -- Arguments:
    --   p_str   = any text string
    --   p_where = B for both leading and trailing
    --             L for leading
    --             T for trailing
    --
    p_str in varchar2,
    p_where in varchar2 default 'B' )
    return varchar2
    ;

function remove_trailing_whitespace (
    --
    -- Given a string remove trailing chr 10, chr 13s and spaces.
    -- Also removes leading whitespace.
    --
    p_str in varchar2 )
    return varchar2
    ;

--==============================================================================
-- append value to table
--
-- PARAMETERS
-- * p_table the table
-- * p_value the value to be added
--
-- EXAMPLE
--   append 2 elements and print the table (prints 'a:b')
--
--   declare
--       l_table apex_t_varchar2 := apex_t_varchar2();
--   begin
--       wwv_flow_utilities.push(l_table, 'a');
--       wwv_flow_utilities.push(l_table, 'b');
--       dbms_output.put_line(wwv_flow_utilities.join(l_table, ':'));
--   end;
--==============================================================================
procedure push (
    p_table in out nocopy wwv_flow_t_varchar2,
    p_value in varchar2 );

--==============================================================================
-- append value to table
--
-- PARAMETERS
-- * p_table the table
-- * p_value the value to be added
--
-- EXAMPLE
--   append 2 elements and print the table (prints '1:2')
--
--   declare
--       l_table apex_t_number := apex_t_number();
--   begin
--       wwv_flow_utilities.push(l_table, 1);
--       wwv_flow_utilities.push(l_table, 2);
--       dbms_output.put_line(wwv_flow_utilities.join(l_table, ':'));
--   end;
--==============================================================================
procedure push (
    p_table in out nocopy wwv_flow_t_number,
    p_value in number );

--==============================================================================
-- split input clob at separator
--
-- PARAMETERS
-- * p_str   the input string
-- * p_sep   the separator. if null, split after each character. if a single
--           character, split at this character. if more than 1 character, split
--           at regular expression.
--
-- EXAMPLES
--   see split
--   -> apex_t_varchar2('1','2','3')
--
--   split('1:2:3',':')
--   -> apex_t_varchar2('1','2','3')
--
--   split('123',null)
--   -> apex_t_varchar2('1','2','3')
--==============================================================================
function split_clob (
    p_str   in clob,
    p_sep   in varchar2    default wwv_flow.LF )
    return wwv_flow_t_varchar2;

--==============================================================================
-- split input string at separator
--
-- PARAMETERS
-- * p_str   the input string
-- * p_sep   the separator. if null, split after each character. if a single
--           character, split at this character. if more than 1 character, split
--           at regular expression.
-- * p_limit maximum number of splits, ignored if null. if smaller than the
--           total possible number of splits, the last table element contains
--           the rest.
--
-- EXAMPLES
--   split(1||chr(10)||2||chr(10)||3)
--   -> apex_t_varchar2('1','2','3')
--
--   split('1:2:3',':')
--   -> apex_t_varchar2('1','2','3')
--
--   split('123',null)
--   -> apex_t_varchar2('1','2','3')
--
--   split('1:2:3:4',':',2)
--   -> apex_t_varchar2('1','2:3:4')
--
--   split('key1=val1, key2=val2','\s*[=,]\s*')
--   -> apex_t_varchar2('key1','val1','key2','val2')
--==============================================================================
function split (
    p_str   in varchar2,
    p_sep   in varchar2    default wwv_flow.LF,
    p_limit in pls_integer default null )
    return wwv_flow_t_varchar2;

--==============================================================================
--==============================================================================
function split_numbers (
    p_str in varchar2,
    p_sep in varchar2 default wwv_flow.LF)
    return wwv_flow_t_number;

function string_to_table (
    --
    --
    --
    str in varchar2,
    sep in varchar2 default ':')
    return wwv_flow_global.vc_arr2
    ;

function string_to_table2 (
    --
    --
    --
    str in varchar2,
    sep in varchar2 default ':')
    return wwv_flow_global.vc_arr2
    ;

function string_to_table3 (
    --
    --
    --
    str in varchar2,
    sep in varchar2 default ':')
    return sys.wwv_dbms_sql.vc_arr2
    ;

--==============================================================================
-- Returns p_str as a pl/sql table seperated by the specified list of seperators.
-- The found seperator will also be included in the result array if p_include_sep
-- is true.
-- Only the first occurrense of the seperator is searched if p_first_occurrense is
-- true.
--
-- Example:
--
-- l_result_list := wwv_flow_utilities.string_to_table4 (
--                      'this#SEP1#is#SEP2#a test',
--                      wwv_flow_t_varchar2('#SEP1', '#SEP2#') );
--
-- Will result in an array of
--   this
--   #SEP1#
--   is
--   #SEP2#
--   a test
--==============================================================================
function string_to_table4 (
    p_str              in varchar2,
    p_sep_list         in wwv_flow_t_varchar2,
    p_include_sep      in boolean := true,
    p_first_occurrense in boolean := true )
    return sys.wwv_dbms_sql.vc_arr2
    ;

--==============================================================================
-- Appends the values of p_src to p_dest
--==============================================================================
procedure append (
    p_dest in out nocopy wwv_flow_t_varchar2,
    p_src  in wwv_flow_t_varchar2 );

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
-- As long as the result contains a value, the separator will always be appended.
--==============================================================================
function join (
    t in wwv_flow_t_varchar2,
    s in varchar2 default wwv_flow.LF)
    return varchar2;

--==============================================================================
-- Returns the values of the array t as a clob separated by s.
-- As long as the result contains a value, the separator will always be appended.
--==============================================================================
function join_clob (
    t in wwv_flow_t_varchar2,
    s in varchar2 default wwv_flow.LF)
    return clob;

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
-- As long as the result contains a value, the separator will always be appended.
--==============================================================================
function join (
    t in wwv_flow_t_number,
    s in varchar2 default wwv_flow.LF)
    return varchar2;

--==============================================================================
-- compute a hash value for all given values. this function can be used to
-- implement lost update detection for data records.
--
-- PARAMETERS
-- * p_values    input values
-- * p_salted    if true (the default), salt hash with internal session info
--==============================================================================
function get_hash (
    p_values in wwv_flow_t_varchar2,
    p_salted in boolean default true )
    return varchar2;

--==============================================================================
-- Returns p_prefix||p_clob||p_suffix
--==============================================================================
function wrap_clob (
    --
    --
    --
    p_prefix in varchar2,
    p_clob   in clob,
    p_suffix in varchar2 )
    return clob
    ;

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
-- As long as the result contains a value, the separator will always be appended.
--
-- Note: If an error occurs during concatenating the string, for example the
--       result gets to long, only the last valid value will be returned.
--==============================================================================
function table_to_string (
    --
    --
    --
    t in wwv_flow_global.vc_arr2,
    s in varchar2 default ':')
    return varchar2
    ;

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
-- If the separator is not a colon, any colons in the values are escaped with &#58;
--
-- Note: If an error occurs during concatenating the string, for example the
--       result gets to long, only the last valid value will be returned.
--==============================================================================
function table_to_string2 (
    --
    --
    --
    t in wwv_flow_global.vc_arr2,
    s in varchar2 default ':')
    return varchar2
    ;

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
--==============================================================================
function table_to_string3 (
    t in wwv_flow_global.vc_arr2,
    s in varchar2 default ':' )
    return varchar2;

--==============================================================================
-- Formatted printing, inspired by C's sprintf and utl_lms.format_message
--
-- Returns p_message after replacing
-- * each <n>th occurrence of %s with p<n>
-- * each occurrence of %<n> with p<n>
-- If p_max_length is not null, substr(p<n>,1,p_arg_max_length) is used instead
-- of p<n>.
--
-- Examples:
--   '1+2=three' = wwv_flow_utilities.format('%s+%s=%s', 1, 2, 'three')
--   '1+2=three' = wwv_flow_utilities.format('%1+%2=%0', 'three', 1, 2)
--==============================================================================
function format (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p10          in varchar2    default null,
    p11          in varchar2    default null,
    p12          in varchar2    default null,
    p13          in varchar2    default null,
    p14          in varchar2    default null,
    p15          in varchar2    default null,
    p16          in varchar2    default null,
    p17          in varchar2    default null,
    p18          in varchar2    default null,
    p19          in varchar2    default null,
    p_max_length in pls_integer default 1000 )
    return varchar2;

--==============================================================================
function instr_tostr (
    --
    --
    --
    p_instr             in varchar2 default null,
    p_tostr             in varchar2 default null)
    return varchar2
    ;

--==============================================================================
function instr_fromstr (
    --
    --
    --
    p_instr             in varchar2 default null,
    p_fromstr           in varchar2 default null)
    return varchar2
    ;

--==============================================================================
function striphtml(
    --
    --
    --
    p_html        in varchar2)
    return varchar2
    ;

--==============================================================================
function is_numeric (
    --
    --
    --
    p_str in varchar2 default null)
    return boolean
    ;

-------------------------------------------------------------------------------
-- If Then Else (ite) Utility
--
function ite (
    --
    --
    --
    b boolean,
    t varchar2,
    f varchar2)
    return varchar2
    ;


-------------------------------------------------------------------------------
-- URL Utilities
--

function urlencode(
    --
    -- Encode every character of a URL.
    -- an encoded URL is a URL in Hex.
    -- Encoded URLs allow spaces, question marks and other special characters.
    --
    p_str in varchar2 )
    return varchar2
    ;

function url_encode2 (
    --
    -- Encode (into HEX) all special characters which includes spaces,
    -- question marks, ampersands, etc.
    --
    p_str in varchar2)
    return varchar2
    ;

function url_decode2 (
    --
    --
    --
    p_str in varchar2)
    return varchar2
    ;

function url_encode (
    --
    -- Encode every character of a URL.
    -- an encoded URL is a URL in Hex.
    -- Encoded URLs allow spaces, question marks and other special characters.
    --
    p_str in varchar2)
    return varchar2
    ;

function is_valid_application_name(
    --
    --  Verify application name does not contain invalid characters '<>"'
    --  during creation of application
    --
    p_name        in varchar2)
    return varchar2
    ;

function is_valid_group_name(
    --
    --  Verify group name does not contain invalid characters '<>', is not null,
    --  or does not contain only blank spaces during creation/modification of group name
    --
    p_name        in varchar2)
    return varchar2
    ;

function is_valid_page_group_name(
    --
    --  Verify page group name does not contain invalid characters '<>', is not null,
    --  or does not contain only blank spaces during creation/modification of page group name
    --
    p_name        in varchar2)
    return varchar2
    ;

function is_valid_application_id(
    --
    --  Verify application id conforms to the regular expression '^[0-9]*$', is not null,
    --  is an available id, or does not contain only blank spaces during creation of application
    --
    p_name        in varchar2)
    return varchar2
    ;

function get_page_group_id(
    --
    -- Purpose: Return boolean as to existence within the given
    --          flow page's metadata of a named page-group.
    --
    p_group_name      in varchar2,
    p_application_id  in number)
    return number
    ;


--------------------------------------------------------------------------------
-- Calls owa_util.redirect_url to redirect the browser to a new URL.
-- The procedure automatically calls apex_application.stop_apex_engine to
-- abort further processing of the APEX application.
--
-- p_reset_htp_buffer should be set to FALSE if the application has set it's own
-- cookie in the response, otherwise the HTP buffer will be reseted to make sure
-- that the browser understands the redirect to the new URL and isn't confused
-- by data which has already been written to the HTP buffer.
--------------------------------------------------------------------------------
procedure redirect_url (
    p_url              in varchar2,
    p_reset_htp_buffer in boolean default true );

procedure redirect_url_array (
    p_owner      varchar2 default null,
    p_package    varchar2 default null,
    p_procedure  varchar2 default null,
    p_parameters wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_values     wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;




-------------------------------------------------------------------------------
-- Check Sum Utility
--
function checksum (
    --
    -- Obsolete with 8.1.7 of Oracle and greater.  This PLSQL checksum
    -- algorythem is slower and less reliable then the
    -- dbms_obfuscation_toolkit.md5 function.  This function is provided
    -- for backward compatability and for support of 8.1.6.
    --
    -- Note recommended use is:
    --    x := utl_raw.cast_to_raw( dbms_obfuscation_toolkit.md5( input_string => p_string ) );
    --
    p_buff in varchar2 )
    return number
    ;




-------------------------------------------------------------------------------
-- Bind Variable Utilities
--

function get_binds(
    --
    -- Given a valid Oracle SQL statement, which
    -- can include quotes, c style, and plsql style
    -- comments, return a table of bind variable names.
    -- The bind variable names will be used for binding in
    -- flows session state.
    --
    p_stmt  in varchar2 )
    return  sys.dbms_sql.varchar2_table
    ;

procedure perform_binds(
    --
    --
    --
    p_cursor in number,
    p_stmt   in varchar2)
    ;

function get_using_clause (
    --
    --
    --
    p_stmt   in varchar2 )
    return varchar2
    ;

function get_column_headings (
    --
    -- Given a SQL select statement return colon delimited list of
    -- column headings.
    --
    p_sql_select_statement in varchar2)
    return varchar2
    ;


-------------------------------------------------------------------------------
-- Substitution Variable Utilities
--

function parse(
    p_string in varchar2,
    p_escape in boolean default false )
    return varchar2
    ;



function get_substitution_value(
    --
    --
    --
    p_substitution_string in varchar2,
    p_flow_id in varchar2 )
    return varchar2
    ;

-------------------------------------------------------------------------------
-- Flows Internal Utilities
--
-- These utilities are exposed however they are of little or no value to the
-- flows application programmer.

function minimum_free_page (
    --
    -- Given a flow find the minimum page number
    -- available.  Useful in building flow wizards
    -- since you can default the page to the next
    -- availble page ID number.
    --
    p_flow_id           in number default null,
    p_occurance         in number default 1,
    p_start_page        in number default 1)
    return number
    ;

type t_free_flow_candidate_rec is record (
    candidate_id     number,
    next_reserved_id number );
type t_free_flow_candidates is ref cursor return t_free_flow_candidate_rec;

function minimum_free_flow_candidates
    return t_free_flow_candidates;

function minimum_free_flow
    return number
    ;

function flow_authentication (
    p_flow_id           in number default null)
    return varchar2
    ;

function is_date (
  p_date varchar2,
  p_format varchar2 default null )
  return boolean
  ;

--==============================================================================
-- Given a security group id and an application id, return a message text
-- that explains why the id is reserved and can not be used. Return null if the
-- id can be used.
--
-- ARGUMENTS
-- * p_security_group_id: the workspace id
-- * p_application_id:    the application id
-- * p_check_reserved:    flag that determines wheter IDs that are reserved by
--                        the create app wizard should be treated as reserved
--==============================================================================
function get_app_id_reserved_reason (
    p_security_group_id     in number,
    p_application_id        in number,
    p_check_reserved        in boolean default TRUE )
    return varchar2;

--==============================================================================
-- Given a security group id and the application number, return true if the
-- application number is not reserved, false if it is reserved.
--
-- Same as get_app_id_reserved_reason(...) is null.
--==============================================================================
function is_available_application_id (
    p_security_group_id     in number,
    p_application_id        in number,
    p_check_reserved        in boolean default TRUE )
    return boolean;

function is_number(
  p_number varchar2,
  p_format varchar2 default null )
  return boolean
  ;

--==============================================================================
-- return whether p_string looks like an email address
--==============================================================================
function is_email (
    p_string in varchar2 )
    return boolean;
--
procedure get_lov_delimiters(
  p_s in varchar2,
  p_r out varchar2,
  p_c out varchar2)
  ;

function get_temp_lov_query (
    p_display_values in varchar2,
    p_return_values  in varchar2,
    p_delimiter      in varchar2 default ';',
    p_order_by       in varchar2 ) /* values: null, SEQ or DISPLAY */
    return varchar2;

function get_temp_lov_query (
    p_lov_id       in number,
    p_add_order_by in boolean default true,
    p_use_template in boolean default false )
    return varchar2;

function get_temp_lov_index (
    p_sql in varchar2 )
    return number;

function get_temp_lov_data (
    p_lov_index in binary_integer )
    return t_temp_lov_data;


function remove_spaces (
    --
    -- takes a string and removes duplicate spaces
    --
    p_str in varchar2 default null)
    return varchar2
    ;


function is_valid_alias(
    --
    -- Verify that the Flow alias is composed of valid characters,
    -- namely A-Z, 0-9, and _ or -.  Also, must be at least 1 char
    -- long but not longer than 32 chars.
    --
    p_alias in varchar2)
    return boolean
    ;


----------------------
-- SQL Query functions
--
function get_display_value_given_lov (
   p_sql_query   in varchar2,
   p_value       in varchar2,
   p_translation in varchar2 default 'NO',
   p_escape_sc   in varchar2 default 'YES')
   return varchar2
   ;


----------------------------------
-- Given an ID get the region name
--
function get_region_name (
    p_region_id   in varchar2 default null)
    return varchar2
    ;


------------------------------------------------------
-- Pause for number of seconds identified by p_seconds
--  (capped at 120 seconds)
--
procedure pause (
    p_seconds   in number)
    ;

-------------------------------------------------------
-- Checks to ensure p_name is a valid Oracle identifier
--
function is_valid_identifier (
    p_identifier   in varchar2,
    p_quote        in boolean := false)
    return boolean
    ;

function get_company_from_cookie return varchar2
    ;
function get_un_from_cookie return varchar2
    ;
function my_url return varchar2
    ;
function get_cookie_user_name (p_cookie_user_id in number) return varchar2
    ;

-----------------------------------------
-- Optimized String Replacement Functions
--


procedure fast_replace(
    srcstr in out NOCOPY varchar2,
    oldsub in varchar2,
    newsub in varchar2 )
    ;

procedure fast_replace_many (
   srcstr in out NOCOPY varchar2,
   oldsub in wwv_flow_t_varchar2,
   newsub in wwv_flow_t_varchar2 )
   ;

function fast_replace_f(
   p_srcstr in varchar2,
   oldsub in varchar2,
   newsub in varchar2 )
   return varchar2
   ;

function fast_replace_manyf (
   p_srcstr in varchar2,
   oldsub in wwv_flow_t_varchar2,
   newsub in wwv_flow_t_varchar2 )
   return varchar2
   ;

function show_line_number (
   --------------------------------------------------------
   -- Displays line numbers for the given query or string
   --
   q in varchar2)
   return varchar2
   ;

function lov_values (
    ----------------------------------------------------------------------------
    -- Return a LOV string (displayVal;returnVal,displayVal;returnVal...) given a list of values
    --
    p_lov          in varchar2)
    return varchar2
    ;

function lov_value_array (
    p_lov          in varchar2
) return htmldb_item.lov_table;

--==============================================================================
function is_lov_value (
    p_lov   in varchar2,
    p_value in varchar2 )
    return boolean
    ;

--==============================================================================
procedure parse_query_string(
    p_query     in  varchar2,
    p_flow_id   out varchar2,
    p_page_id   out varchar2,
    p_sess_id   out varchar2,
    p_remainder out varchar2)
    ;

--==============================================================================
-- Returns the query string of the current GET request where the session id is
-- replaced with the value of wwv_flow.g_instance.
--
-- For example, if the current request were
--   p=105:12:5312::NO:ARG1:VAL1&p_trace=YES
-- and the current g_instance is 1675, this function will return:
--   p=105:12:1675::NO:ARG1:VAL1&p_trace=YES
--
-- Context: runtime with HTTP GET request in process.
--==============================================================================
function rewrite_query_string return varchar2;

---------------------------
-- session state conditions
--

function page_changed (
    -----------------------------------------------------------------
    -- Any item on page changed for current flow and current session.
    -- Change implys item was populated, then update.
    p_page_number in number )
    return boolean
    ;

function item_changed (
    -------------------------------------------------
    -- Item in current flow and session has changed.
    -- Change implys item was populated, then update.
    p_item_name in varchar2)
    return boolean
    ;

function list_of_items_changed (
    p_item_names in varchar2)
    return boolean
    ;

function list_of_pages_changed (
    p_page_numbers in varchar2 )
    return boolean
    ;

function current_session_changed
    return boolean
    ;

function current_flow_changed
    return boolean
    ;

function get_data_type (
   p_table_name  in varchar2,
   p_column_name in varchar2)
   return varchar2
   ;

function extracthtml (
   p_html in varchar2)
   return varchar2
   ;

--
-- function to construct quick links
--
-- p_disable    Deprecated and no longer does anything. This used to internally emit a call to callDisItems,
--              which was not a library function, only locally defined on page 190 in application 4000. This
--              also called disableItems, which internally called eval(), and on page 190 this functionality
--              was replaced with Dynamic Action's disable / enable, hence this parameter was no longer required.
--
function quick_link(
   p_forminput in varchar2,
   p_form_value in varchar2,
   p_display in varchar2,
   p_system_message in boolean  := true,
   p_forminput2 in varchar2 := null ,
   p_form_value2 in varchar2 := null,
   p_disable in varchar2 := null,
   p_popup_message  in varchar2 := null)
   return varchar2
   ;

function clob_to_varchar2(
   p_clob   in clob,
   p_offset in number default 0,
   p_raise  in boolean default false)
   return varchar2
   ;

function blob_to_clob(
   p_blob    in out blob,
   p_charset in varchar2 default null)
   return clob
   ;

function clob_to_blob(
   p_clob    in out clob,
   p_charset in varchar2 default null)
   return blob
   ;


function escape_url(
    p_url             in varchar2,
    p_url_charset     in varchar2 default null,
    p_escape_reserved in varchar2 default 'N')
    return varchar2
    ;
function unescape_url(
    p_url             in varchar2,
    p_url_charset     in varchar2 default null )
    return varchar2
    ;

function host_url(
    --
    -- Return the host URL
    --
    -- Possible options are:
    --     NULL   - Return URL up to port number (e.g., https://myserver.com:7778 )
    --     SCRIPT - Return URL to include script name (e.g., https://myserver.com:7778/pls/apex/ )
    --     IMGPRE - Return URL to include image prefix (e.g., https://myserver.com:7778/i/ )
    --
    p_option          in varchar2 default null )
    return varchar2
    ;

--==============================================================================
-- Returns the protocol (http or https) used for the current HTTP request or post.
--==============================================================================
function get_protocol return varchar2;

--==============================================================================
function lov_checksum (
    p_string      in varchar2 )
    return varchar2;

--==============================================================================
-- utility type for information on target app and page in an url
--==============================================================================
type t_target_url_app_info is record (
    app_id                      wwv_flows.id%type,
    page_id                     wwv_flow_steps.id%type,
    browser_frame               wwv_flows.browser_frame%type,
    rejoin_existing_sessions    wwv_flows.rejoin_existing_sessions%type,
    bookmark_checksum_function  wwv_flows.bookmark_checksum_function%type,
    checksum_salt               wwv_flows.checksum_salt%type );

--==============================================================================
function get_target_url_app_info (
    p_app                       in varchar2,
    p_page                      in varchar2 )
    return t_target_url_app_info;

--==============================================================================
-- Parse f?p value
--==============================================================================
function parse_p (
    p_arguments in varchar2,
    p_sep       in varchar2 default ':' )
    return t_p_arguments;

--==============================================================================
-- If URL is f?p format, do escape_url on the argument values only.  This
-- function assumes that all substitutions, e.g., &ITEM_NAME. substitutions
-- have already been performed.
--==============================================================================
function prepare_url (
    p_url                   in varchar2,
    p_url_charset           in varchar2 default null,
    p_checksum_type         in varchar2 default null,
    p_save_session_state_yn in varchar2 default 'N',
    p_triggering_element    in varchar2 default 'this',
    p_dialog                in varchar2 default 'null',
    p_rejoin_public_only    in boolean  default false )
    return varchar2;

--==============================================================================
-- get cgi QUERY_STRING and decode content
--==============================================================================
function get_cgi_query_string_decoded
    return varchar2;

function pick_date_format_mask(
    --
    -- Given a Date Picker type (e.g., PICK_DATE_DD_MON_YYYY), return
    -- the corresponding format mask.  The input p_format_mask is only
    -- applicable when p_pick_date_type = PICK_DATE_USING_FORMAT_MASK.
    --
    p_pick_date_type in varchar2,
    p_format_mask    in varchar2 default null )
    return varchar2
    ;

function pick_date_classic_format_mask (
    --
    -- Given a Classic Date Picker type (e.g., PICK_DATE_DD_MON_YYYY), return
    -- the corresponding format mask.  The input p_format_mask is only
    -- applicable when p_pick_date_type = PICK_DATE_USING_FORMAT_MASK.
    --
    p_pick_date_type in varchar2,
    p_format_mask    in varchar2 default null )
    return varchar2;

procedure increment_calendar;
    --
    -- procedure to handle the increment of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
procedure decrement_calendar;
    --
    -- procedure to handle the decrement of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
procedure today_calendar;
    --
    -- procedure to handle the chaning to today of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
procedure month_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the Month type of the calendar

procedure weekly_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the date type of the calendar
procedure daily_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle agenda view of calendar
procedure agenda_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the Custom calendar
procedure custom_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the date type of the calendar

procedure process_calendar_date(
    --
    -- procedure to handle the changes of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
    p_request varchar2);

function savekey_num(p_val in number)
    return number
    ;

function keyval_num return number
    ;

function savekey_vc2(p_val in varchar2)
    return varchar2
    ;

function keyval_vc2 return varchar2
    ;

--==============================================================================
function get_clob_md5(
    --
    -- Compute and return a hash for the specified CLOB.
    -- Arguments:
    --     p_clob              =  Input CLOB value
    --
    p_clob            in clob )
    return varchar2
    ;

--
-- Print with opening and closing JavaScript tags the JavaScript function filter_escape.
-- This JavaScript function is used in encoding multibyte values in a URL in JavaScript
--
procedure gen_filter_escape;

procedure check_sgid;

--------------------------------------------
-- is_build_option_enabled
-- returns YES / NO based on build option ID

function is_build_option_enabled (
    p_build_option_id number) return boolean;

-----------------------------------------------
-- is_build_option_enabled
-- returns YES / NO based on build option name

function is_build_option_enabled (
    p_build_option_name varchar2) return boolean;


 -----------------------------------------------
 -- esc_non_basic_tags
 -- escapes input string, except specified tags
 -- use this function to preserve basic HTML formatting, yet escaping all other tags

 -- example:
 --   wwv_flow_utilities.esc_non_basic_tags('<a href="hello"><b>hello</b></a>')
 --   results in: &lt;a href="hello"&gt;<b>hello</b>&lt;/a&gt;')

 function esc_non_basic_tags (
     p_string in varchar2) return varchar2;

---------------------------------------------
-- function to extract database version value
--
function db_version
    return varchar2;

--------------------------------------------------
-- function to extract database compatibility value
--
function db_compatibility
    return varchar2;

---------------------------------------------------------------------
-- boolean function to compare current db version with input parameter
--
function db_version_is_at_least(p_version in varchar2)
    return boolean;

--------------------------------------------------------------
-- vc2 function to compare current db version with input parameter
--
function db_version_is_at_least_i(p_version in varchar2)
    return varchar2;

---------------------------------------------------------------------
-- boolean function to check if database is xe
--
function db_edition_is_xe
    return boolean;

--##############################################################################
--#
--# Page Caching
--#
--##############################################################################

procedure cache_purge_by_application (
    p_application    in number)
    ;

procedure cache_purge_by_page (
    p_application  in number,
    p_page         in number,
    p_user_name    in varchar2 default null)
    ;

procedure cache_purge_stale (
    p_application    in number);

function cache_get_date_cached (
    p_application  in number,
    p_page         in number)
    return date;

--##############################################################################
--#
--# Region Caching
--#
--##############################################################################

procedure purge_regions_by_app (
     p_application in number);

procedure purge_regions_by_id (
     p_application in number,
     p_region_id   in number);

procedure purge_regions_by_name (
     p_application  in number,
     p_page_id      in number,
     p_region_name  in varchar2);

procedure purge_regions_by_page (
     p_application  in number,
     p_page_id      in number);

procedure purge_stale_regions (
     p_application in number);

function count_stale_regions (
    p_application    in number)
    return number;

function cache_get_date_cached (
    p_application  in number,
    p_page         in number,
    p_region_name  in varchar2)
    return date;

--##############################################################################
--#
--# Export
--#
--##############################################################################

--==============================================================================
function export_ws_app_to_clob (
   p_ws_app_id                   in number,
   p_export_datagrid_data        in varchar2 default 'N',
   p_export_datagrid_annotations in varchar2 default 'N',
   p_export_page_annotations     in varchar2 default 'N',
   p_export_private_reports      in varchar2 default 'N',
   p_export_pkg_app_mapping      in varchar2 default 'N' )
   return clob;

--==============================================================================
procedure export_application_to_db (
   p_application_id    in number,
   p_with_original_ids in boolean default false );

--==============================================================================
function export_application_to_clob (
   p_application_id            in number,
   p_export_ir_public_reports  in varchar2 default 'N',
   p_export_ir_private_reports in varchar2 default 'N',
   p_export_ir_notifications   in varchar2 default 'N',
   p_export_translations       in varchar2 default 'N',
   p_export_pkg_app_mapping    in varchar2 default 'N',
   p_with_original_ids         in boolean  default false,
   p_exclude_subscriptions     in boolean  default false )
   return clob
   ;

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_application_as_download (
    p_application_id          in number);

--==============================================================================
function export_page_to_clob (
   p_application_id            in number,
   p_page_id                   in number,
   p_export_ir_public_reports  in varchar2 default 'N',
   p_export_ir_private_reports in varchar2 default 'N',
   p_export_ir_notifications   in varchar2 default 'N',
   p_with_original_ids         in boolean  default false )
   return CLOB;

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_page_as_download (
    p_application_id          in number,
    p_page_id                 in number);

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_component_as_download (
    p_application_id          in number,
    p_component_id            in number,
    p_component_type          in varchar2);

--==============================================================================
procedure export_workspace (
    p_workspace_id             in number,
    p_format                   in varchar2 default 'UNIX',
    p_include_team_development in boolean  default true,
    p_minimal                  in boolean default false );

--==============================================================================
function export_workspace_to_clob (
    p_workspace_id             in number,
    p_include_team_development in boolean default true,
    p_minimal                  in boolean default false )
    return clob;

--==============================================================================
function export_restful_to_clob (
    p_workspace_id             in number )
    return clob;

--==============================================================================
function export_files_to_clob (
    p_workspace_id             in number )
    return clob;

--==============================================================================
function export_feedback_to_development (
    p_workspace_id in number,
    p_since        in date   default null )
    return clob;

--==============================================================================
function export_feedback_to_deployment (
    p_workspace_id      in number,
    p_deployment_system in varchar2,
    p_since             in date   default null )
    return clob;

--##############################################################################

procedure show_as_shuttle (
    p_lov                   in varchar2,
    p_value                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_name                  in varchar2                default null,
    p_show_null             in varchar2                default null,
    p_null_text             in varchar2                default '%',
    p_null_value            in varchar2                default '%null%',
    p_height                in varchar2                default '10',
    p_width                 in varchar2                default '150',
    p_show_extra            in varchar2                default 'YES',
    p_extra_text            in varchar2                default null,
    p_onBlur                in varchar2                default null,
    p_onChange              in varchar2                default null,
    p_onFocus               in varchar2                default null,
    p_attributes            in varchar2                default null,
    p_max_elements          in number                  default 1000000,
    p_item_id               in varchar2                default null,
    p_item_tag_attrs        in varchar2                default null,
    p_translation           in varchar2                default 'NO',
    p_current_item_sequence in varchar2                default null,
    pRefreshImage           in varchar2                default 'shuttle_reload.png',
    pRightAllImage          in varchar2                default 'shuttle_last.png',
    pRightImage             in varchar2                default 'shuttle_right.png',
    pLeftImage              in varchar2                default 'shuttle_left.png',
    pLeftAllImage           in varchar2                default 'shuttle_first.png',
    pTopImage               in varchar2                default 'shuttle_top.png',
    pUpImage                in varchar2                default 'shuttle_up.png',
    pDownImage              in varchar2                default 'shuttle_down.png',
    pBottomImage            in varchar2                default 'shuttle_bottom.png'
    );


--
-- Perform a string replacement in a CLOB variable
--
procedure lob_replace (
    p_lob                in out nocopy clob,
    p_search_string      in varchar2,
    p_replacement_string in varchar2 );

procedure lob_replace (
    p_lob                in out nocopy clob,
    p_search_clob        in clob,
    p_replacement_clob   in clob );


function array_element(
    p_vcarr in wwv_flow_global.vc_arr2,
    p_index in number )
    return varchar2;

--
-- Convert input to utf-8 and base 64 encode, per RFC 2231
--
function b64_encode(
    p_input in varchar2 )
    return varchar2;

--
-- Encode a filename in either utf-8 encoding or utf-8 base64 encoding.
-- This is commonly used in the generation of the HTTP header for a file download,
-- as IE and FF behave differently
--
function encode_filename(
    p_filename in varchar2)
    return varchar2;


procedure get_theme_file(
    p_id            in number,
    p_app_id        in number,
    p_show_last_mod in varchar2 default 'Y');

procedure show_ir_help (
   p_app_id       in number,
   p_worksheet_id in number,
   p_lang         in varchar2 default null,
   p_help_type    in varchar2 default 'IR');


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_report_data:        XML based report data (utf-8 encoded)
--   p_report_layout:      Report layout in XSL-FO or RTF format
--   p_report_layout_type: Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:    Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:       URL of of the print server. If not specified, the print server will be derived from preferences
--                         example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_report_data         in clob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_report_data:        XML based report data (utf-8 encoded)
--   p_report_layout:      Report layout in XSL-FO or RTF format
--   p_report_layout_type: Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:    Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:       URL of of the print server. If not specified, the print server will be derived from preferences
--                         example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_report_data         in blob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using pre-defined report query and pre-defined report layout.
--
-- Arguments:
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout_name:  Name of the report query (stored under application's shared components)
--                          if report layout name is not specified, layout associated with report query will be used
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout_name  in varchar2 default null,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using a pre-defined report query and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout:       Defines the report layout in in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_file_name            Defines the filename of the print document
--   p_content_disposition: Specifies whether to download the print document or display inline ("attachment", "inline")
--   p_report_data:         XML based report data
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_report_data         in clob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_file_name            Defines the filename of the print document
--   p_content_disposition: Specifies whether to download the print document or display inline ("attachment", "inline")
--   p_report_data:         XML based report data
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_report_data         in blob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using pre-defined report query and pre-defined report layout.
--
-- Arguments:
--   p_file_name            Filename of print document
--   p_content_disposition: Download print document or display inline ("attachment", "inline")
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout_name:  Name of the report query (stored under application's shared components)
--                          if report layout name is not specified, layout associated with report query will be used
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout_name  in varchar2 default null,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using pre-defined report query and RTF and XSL-FO based report layout.
--
-- Arguments:
--   p_file_name            Filename of print document
--   p_content_disposition: Download print document or display inline ("attachment", "inline")
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);

-------------------------------------------------------------------------------------------------
-- Based on the browser this function returns the mime type for an excel file download.
-- IE:     application/vnd.ms-excel
-- Others: application/excel
-------------------------------------------------------------------------------------------------
function get_excel_mime_type return varchar2;

-------------------------------------------------------------------------------------------------
-- Adds the necessary commands to the HTTP header to indicate a file download of a specific
-- mime type. It also takes care that the file name is probably encoded.
-- Use p_is_attachment to indicate if the browser should show it inline or as an attachment.
--
-- Note: You have to call htp.init before and owa_util.http_header_close after this call!
-------------------------------------------------------------------------------------------------
procedure print_download_header (
    p_mime_type      in varchar2,
    p_mime_charset   in varchar2 default null,
    p_file_name      in varchar2 default null,
    p_is_attachment  in boolean  default true,
    p_content_length in number   default null,
    p_http_hdr_attr1 in varchar  default null );

--==============================================================================
-- function to convert Oracle Dateformat to a javascript date date format
-- pFormat - Oracle Date format to be converted
--==============================================================================
function get_javascript_date_format (
    p_format in varchar2 )
    return varchar2;

--==============================================================================
-- function to determine should time part be displayed and it's display format(24hr or 12hr date format
-- p_js_date_format - javascript based date format
--==============================================================================
function get_time_format (
    p_js_date_format in varchar2)
    return varchar2;
-------------------------------------------------------------------------------------------------
-- Function returns an Oracle date datatype for an absoute or relative date string value.
-- p_value:    is a date string containing an absolute date (eg. 12-OCT-2009) or a
--             relative date (eg. +1d)
-- p_format:   is an Oracle date format
-- p_attribute is the name of the attribute which is converted and is used to build
--             the error message in the format APEX.DATEPICKER_xxx_INVALID if the
--             conversion fails
-------------------------------------------------------------------------------------------------
function get_oracle_date (
    p_value     in varchar2,
    p_format    in varchar2,
    p_attribute in varchar2,
    p_item_name in varchar2
) return date;
-------------------------------------------------------------------------------------------------
-- Function to render and get the JqueryUI Datepicker related Source
--    p_id:                 The id for the item
--    p_name:               Name for the item
--    p_value:              The value for item
--    p_date_format:        The Date format to be used for rendering
--    p_size:               Input item size
--    p_max_length:         Maxlength for the item
--    p_placeholder:        Placeholder rendered into the date input field
--    p_attributes:         Additional HTML attributes for the item
--    p_item_label:         Label for the input item
--    p_default_value:      The default date to be highlighted in datepicker
--    p_max_value:          Maximum date for item
--    p_min_value:          Minimum date for item
--    p_show_on:            When the datepicker should be displayed
--    p_show_other_months:  should the datepicker show Month Selection list
--    p_number_of_months:   Number of months to be displayed
--    p_navigation_list_for:Navigation list for Year, Month or Both
--    p_year_range:         Year range to be displayed in the Year selection list
-------------------------------------------------------------------------------------------------
function get_date_picker (
    p_id                    in varchar2 default null,
    p_name                  in varchar2 default null,
    p_value                 in varchar2 default null,
    p_date_format           in varchar2 default null,
    p_size                  in number default 20,
    p_max_length            in number default 2000,
    p_placeholder           in varchar2 default null,
    p_attributes            in varchar2 default null,
    p_item_label            in varchar2 default null,

    p_default_value         in varchar2 default null,
    p_max_value             in varchar2 default null,
    p_min_value             in varchar2 default null,
    p_show_on               in varchar2 default 'button',
    p_show_other_months     in boolean  default false,
    p_number_of_months      in varchar2 default null,
    p_navigation_list_for   in varchar2 default 'NONE',
    p_year_range            in varchar2 default null
) return varchar2;


-------------------------------------------------------------------------------------------------
-- Procedure to generate out an icon (clickable image).
--
-- Arguments:
--      p_img_src           The source of the image,
--      p_img_alt           The alt text of the image
--      p_img_attributes    Any additional attributes for the image (Optional)
--
--      p_anchor_onclick    If the image needs to invoke some JavaScript call, supply the JS here (Optional)
--      p_anchor_href       If the image needs to link somewhere, supply the link here, defaults to '#'
--      p_anchor_attributes Any additional attributes for the anchor tag (Optional)
--
procedure show_icon (
    -- img attributes
    p_img_src           in varchar2,
    p_img_alt           in varchar2,
    p_img_attributes    in varchar2 default null,
    -- anchor attributes
    p_anchor_onclick    in varchar2 default null,
    p_anchor_href       in varchar2 default '#',
    p_anchor_attributes in varchar2 default null );

procedure wwv_flow_team_tag_sync (
    p_component_type    in varchar2 default 'FEATURE',
    p_component_id      in number   default null,
    p_new_tags          in varchar2 default null,
    p_security_group_id in number   default null)
    ;

--==============================================================================
-- Returns TRUE if p_user equals to ANONYMOUS, APEX_PUBLIC_USER,
-- HTMLDB_PUBLIC_USER, nobody or the value in wwv_flow.g_public_user.
-- If not it returns FALSE.
--==============================================================================
function is_public_user (
    p_user in varchar2 default wwv_flow_security.g_user )
    return boolean;

--==============================================================================
-- Returns HTML attributes to define a table as a 'layout' table, such that it
-- will be ignored by screen readers. A 'layout' table is one that does not
-- contain data and is used purely for presentation.
--==============================================================================
function get_layout_table_attributes
    return varchar2;

--==============================================================================
-- CLOB Textarea item plugin
--
-- get clob value that was written back by ajax_clob_textarea, to process it on
-- submit.
--
-- the function was moved here from wwv_flow_f4000_plugins because it needs to
-- exist in a runtime only environment, too.
--==============================================================================
function get_clob_textarea_value (
    p_item_name in varchar2 )
    return clob;

--==============================================================================
-- Function used to load application archive to files table.
-- Only application and page archive is allowed.
--==============================================================================
function load_apex_archive_file (
    p_blob           in blob,
    p_app_id         in number default null,
    p_file_type      in varchar2 default null,
    p_file_name      in varchar2 default null,
    p_title          in varchar2 default null,
    p_mime_type      in varchar2 default null,
    p_file_charset   in varchar2 default null,
    p_description    in varchar2 default null
    ) return number;

--==============================================================================
-- Emit the header of a popup LOV.
--==============================================================================
procedure emit_popup_lov_header (
    p_template in varchar2,
    p_title    in varchar2 );

--==============================================================================
-- Function used to get dependency object in a query.
--==============================================================================
function get_dependency_objects (
    p_sql in varchar2) return t_dependent_object_list;

--==============================================================================
-- Returns p_url prefixed by <path alias>/<path prefix of workspace>/
-- if the Web Server supports friendly URLs.
--==============================================================================
function get_friendly_workspace_url (
    p_url in varchar2 )
    return varchar2;

--==============================================================================
-- Returns p_url prefixed by get_friendly_workspace_url() + <appid>/
-- if the Web Server supports friendly URLs.
--==============================================================================
function get_friendly_app_url (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_url            in varchar2 )
    return varchar2;

--==============================================================================
-- Resets the internal cache for building friendly URLs.
--==============================================================================
procedure reset_friendly_url_cache;

end wwv_flow_utilities;
/
show errors
