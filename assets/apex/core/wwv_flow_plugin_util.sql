set define '^' verify off
prompt ...wwv_flow_plugin_util
create or replace package wwv_flow_plugin_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_plugin_util.sql
--
--    DESCRIPTION
--      This package is a collection of utility functions for plug-ins.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      02/03/2010 - Created
--    pawolf      02/09/2010 - Added print_hidden_protected
--    pawolf      02/20/2010 - Added support for process plugins
--    pawolf      03/04/2010 - Added p_escape to print_option
--    pawolf      03/08/2010 - Added pagination support to prepare_query and get_data
--    pawolf      03/18/2010 - Added page_item_names_to_jQuery
--    pawolf      04/14/2010 - Added name to t_column_values
--    pawolf      04/15/2010 - Added get_plsql_expression_result, get_plsql_function_result and execute_plsql_code
--    pawolf      08/23/2010 - Bug# 10041505: Add LIKE operation for prepare_query and get_search_string
--    pawolf      08/27/2010 - Bug# 10024385: added cleanup_page_item_names
--    pawolf      08/29/2010 - Bug# 10157646: added is_component_used
--    pawolf      12/03/2010 - Bug# 10301638: increase t_column_values.name to have the same size as sys.dbms_sql.desc_tab2.col_name
--    cneumuel    02/03/2011 - Added plugin support for authorization (feature #580)
--    pawolf      04/21/2011 - Fixed get_data_legacy to support the search type c_search_like_ignore used in popup LOVs (bug# 12361232)
--    pawolf      04/28/2011 - Added replace_substitutions, set_component_values, clear_component_values and get_value_as_varchar2
--    pawolf      05/04/2011 - Added support for quoted/multibyte bind variables (feature 224)
--    pawolf      05/10/2011 - Added p_replace_substitutions parameter to print_lov_as_json (bug 12535720)
--    pawolf      05/13/2011 - Added plug-ins for authentication schemes (feature 581)
--    pawolf      05/20/2011 - Added bind variable support for get_plsql_* functions
--    arayner     05/31/2011 - Added get_layout_table_attributes function (feature 422)
--    pawolf      06/01/2011 - Added print_page_item_lov_as_json and added the parameter p_set_mime_type to print_lov_as_json (feature feature 629)
--    arayner     06/01/2011 - Moved get_layout_table_attributes to wwv_flow_utilities
--    pawolf      06/09/2011 - Added get_column_no
--    pawolf      01/24/2012 - Added print_hidden, print_protected (bug 12790216)
--    pawolf      02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
--    pawolf      03/05/2012 - Added new function get_element_attributes and new interface for print_display_only (feature# 815)
--    pawolf      04/25/2012 - Added new get_data, get_data2 functions which support p_search_column_name as parameter (feature# 917)
--    pawolf      04/25/2012 - Fixed value of c_data_type_timestamp_tz
--    pawolf      04/25/2012 - Added p_auto_bind_items and p_bind_list to a number of APIs
--    pawolf      04/26/2012 - Added ROWID data type detection
--    cneumuel    08/07/2012 - In get_data, get_display_data: added optimization for static lovs (bug #14191581)
--                             In prepare_query: change p_sql_handler to "in out nocopy", since the rewrite may change columns
--                             and require a new parse
--    pawolf      03/20/2014 - Added get_html_attr, get_link and get_data2
--    vuvarov     05/05/2014 - Added get_attribute_as_number (feature #1422)
--    pawolf      11/05/2014 - In get_element_attributes: added p_add_labelledby (feature #1503)
--    pawolf      11/05/2014 - In get_element_attributes: added p_add_required (feature #1503)
--    pawolf      01/09/2015 - In get_attribute_as_number: added parameter p_attribute_label
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_sql_handler is record (
    cursor_handler number,
    base_statement varchar2(32767),
    column_list    sys.dbms_sql.desc_tab2 );

type t_value is record (
    varchar2_value      varchar2(32767),
    number_value        number,
    date_value          date,
    timestamp_value     timestamp,
    timestamp_tz_value  timestamp with time zone,
    timestamp_ltz_value timestamp with local time zone,
    interval_y2m_value  interval year to month,
    interval_d2s_value  interval day to second,
    blob_value          blob,
    bfile_value         bfile,
    clob_value          clob );

type t_value_list is table of t_value index by pls_integer;

type t_column_values is record (
    name        varchar2(32767),
    data_type   varchar2(20), /* use c_data_type_* constants to compare */
    format_mask varchar2(255),
    value_list  t_value_list );

type t_column_value_list  is table of wwv_flow_global.vc_arr2 index by pls_integer;
type t_column_value_list2 is table of t_column_values         index by pls_integer;

type t_bind is record (
    name  varchar2(30),
    value varchar2(32767) );

type t_bind_list is table of t_bind index by pls_integer;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_search_contains_case    constant varchar2(20) := 'CONTAINS_CASE';   -- uses INSTR
c_search_contains_ignore  constant varchar2(20) := 'CONTAINS_IGNORE'; -- uses INSTR with UPPER
c_search_exact_case       constant varchar2(20) := 'EXACT_CASE';      -- uses LIKE value%
c_search_exact_ignore     constant varchar2(20) := 'EXACT_IGNORE';    -- uses LIKE VALUE% with UPPER
c_search_like_case        constant varchar2(20) := 'LIKE_CASE';       -- uses LIKE %value%
c_search_like_ignore      constant varchar2(20) := 'LIKE_IGNORE';     -- uses LIKE %VALUE% with UPPER
c_search_lookup           constant varchar2(20) := 'LOOKUP';          -- uses = value
--
c_data_type_varchar2      constant varchar2(20) := 'VARCHAR2';
c_data_type_number        constant varchar2(20) := 'NUMBER';
c_data_type_date          constant varchar2(20) := 'DATE';
c_data_type_timestamp     constant varchar2(20) := 'TIMESTAMP';
c_data_type_timestamp_tz  constant varchar2(20) := 'TIMESTAMP_TZ';
c_data_type_timestamp_ltz constant varchar2(20) := 'TIMESTAMP_LTZ';
c_data_type_interval_y2m  constant varchar2(20) := 'INTERVAL_Y2M';
c_data_type_interval_d2s  constant varchar2(20) := 'INTERVAL_D2S';
c_data_type_blob          constant varchar2(20) := 'BLOB';
c_data_type_bfile         constant varchar2(20) := 'BFILE';
c_data_type_clob          constant varchar2(20) := 'CLOB';
c_data_type_rowid         constant varchar2(20) := 'ROWID';
--
c_empty_data_type_list    wwv_flow_global.vc_arr2;
c_empty_bind_list         t_bind_list;
--
--==============================================================================
-- Returns p_value escaped or not depending on the escape parameter.
--==============================================================================
function escape (
    p_value  in varchar2,
    p_escape in boolean )
    return varchar2;
--
--==============================================================================
-- Replaces all &ITEM. substitution references in p_value and returns the result.
-- If p_escape is TRUE, special characters in the replaced values will be escaped.
--==============================================================================
function replace_substitutions (
    p_value  in varchar2,
    p_escape in boolean  default true )
    return varchar2;
--
--==============================================================================
-- Returns a properly escaped HTML attribute if p_value is not null.
--==============================================================================
function get_html_attr (
    p_name  in varchar2,
    p_value in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns some of the general attributes of an HTML element (eg. id, name,
-- required, placeholder, aria-error-attributes, class) which should be used
-- if a HTML input/select/textarea/... tag is generated to get a consistent
-- set of attributes.
--
-- Set p_add_labelledby to FALSE if you render a HTML input element like input/select/
-- textarea which doesn't require specifying the aria-labelledby attribute because
-- the label's 'for' attribute will work for those HTML input elements. Set it to
-- TRUE for all 'non-standard form element widgets (i.e using div, span, etc.)' which
-- do allow focus to make them accessible to screen readers. Note: Inclusion of
-- aria-labelledby is also dependent on 2 things. Firstly the item plug-in having
-- 'Standard Form Element' set to 'No' and secondly there being the #LABEL_ID# substitution
-- defined in the item's corresponding label template.
--==============================================================================
function get_element_attributes (
    p_item           in wwv_flow_plugin_api.t_page_item,
    p_name           in varchar2 default null,
    p_default_class  in varchar2 default null,
    p_add_id         in boolean  default true,
    p_add_required   in boolean  default true,
    p_add_labelledby in boolean  default true )
    return varchar2;
--
--==============================================================================
-- Returns an <a href>xxx</a> HTML tag where p_url is automatically converted
-- to a valid APEX url (checksum, dialog, ...).
--==============================================================================
function get_link (
    p_url                in varchar2,
    p_text               in varchar2,
    p_escape_text        in boolean  default true,
    p_attributes         in varchar2 default null,
    p_triggering_element in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- XXX. $$$
--
-- p_value: t_value record type
--==============================================================================
procedure set_component_values (
    p_column_value_list in t_column_value_list2,
    p_row_num           in pls_integer );
--
--==============================================================================
-- XXX. $$$
--
-- p_value: t_value record type
--==============================================================================
procedure clear_component_values;
--
--==============================================================================
-- Returns TRUE if both values are equal and FALSE if not.
-- Note: if both values are null, TRUE will be returned as well.
--==============================================================================
function is_equal (
    p_value1 in varchar2,
    p_value2 in varchar2 )
    return boolean;
--
--==============================================================================
-- Returns the position in the list where p_value is stored. If it's not found
-- null will be returned.
--==============================================================================
function get_position_in_list (
    p_list  in wwv_flow_global.vc_arr2,
    p_value in varchar2 )
    return number;
--
--==============================================================================
-- Outputs the value in an escaped form. It's also taking care of chunking big
-- strings into smaller outputs.
--==============================================================================
procedure print_escaped_value (
    p_value in varchar2 );
--
--==============================================================================
-- Outputs a hidden field to store the page item value if the
-- page item is rendered readonly but not printer friendly.
--==============================================================================
procedure print_hidden_if_readonly (
    p_item_name           in varchar2,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean,
    p_id_postfix          in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden field to store the page item value.
--==============================================================================
procedure print_hidden (
    p_item_name  in varchar2,
    p_value      in varchar2,
    p_id_postfix in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden protected field to store the page item value.
--==============================================================================
procedure print_hidden_protected (
    p_item_name  in varchar2,
    p_value      in varchar2,
    p_id_postfix in varchar2 default null );
--
--==============================================================================
-- Outputs a checksum to protect the value of a page item from manipulations.
--==============================================================================
procedure print_protected (
    p_item_name in varchar2,
    p_value     in varchar2 );
--
--==============================================================================
-- Outputs a SPAN tag for a display only field.
-- If p_escape isn't specified, the value from p_item.escape_output will be used.
--==============================================================================
procedure print_display_only (
    p_item             in wwv_flow_plugin_api.t_page_item,
    p_display_value    in varchar2,
    p_show_line_breaks in boolean,
    p_escape           in boolean  default null,
    p_id_postfix       in varchar2 default '_DISPLAY' );
--
--==============================================================================
-- Deprecated!
--
-- Outputs a SPAN tag for a display only field.
--==============================================================================
procedure print_display_only (
    p_item_name        in varchar2,
    p_display_value    in varchar2,
    p_show_line_breaks in boolean,
    p_escape           in boolean,
    p_attributes       in varchar2,
    p_id_postfix       in varchar2 default '_DISPLAY' );
--
--==============================================================================
-- Outputs an OPTION tag. The values are always escaped.
--==============================================================================
procedure print_option (
    p_display_value in varchar2,
    p_return_value  in varchar2,
    p_is_selected   in boolean,
    p_attributes    in varchar2,
    p_escape        in boolean  default true );
--
--==============================================================================
-- Outputs the standard HTTP header for a JSON output.
--==============================================================================
procedure print_json_http_header;
--
--==============================================================================
-- Outputs a JSON response based on the result of a two column LOV in the format:
-- [{"d":"display","r":"return"},{"d":...,"r":...},...]
--
-- p_sql_statement         A SQL statement which returns two columns from the SELECT.
-- p_component_name        The name of the page item or report column that is used
--                         in case an error is displayed.
-- p_escape                If set to TRUE the value of the display column will be
--                         escaped, otherwise it will be output as is.
-- p_replace_substitutions If set to TRUE, replace_substitutions will be called
--                         for the value of the display column, otherwise it will
--                         be output as is.
-- p_set_mime_type         If set to TRUE, the HTTP header is initialized with
--                         mime type "application/json".
--==============================================================================
procedure print_lov_as_json (
    p_sql_statement         in varchar2,
    p_component_name        in varchar2,
    p_escape                in boolean,
    p_replace_substitutions in boolean default false,
    p_set_mime_type         in boolean default true,
    p_support_legacy_lov    in boolean default false /* for internal use only! */
    );
--
--==============================================================================
-- Outputs a JSON response based on the result of a two column LOV in the format:
-- {"values":[{"d":"display","r":"return"},{"d":...,"r":...},...], "default":"..."}
--
-- The difference to print_lov_as_json is that the result also contains the
-- default value of the specified page item in the JSON attribute "default".
--
-- p_sql_statement         A SQL statement which returns two columns from the SELECT.
-- p_page_item_name        The name of the page item that is used to read the
--                         default value and which is also used in case an error is displayed.
-- p_escape                If set to TRUE the value of the display column will be
--                         escaped, otherwise it will be output as is.
-- p_replace_substitutions If set to TRUE, replace_substitutions will be called
--                         for the value of the display column, otherwise it will
--                         be output as is.
--
-- Note: The HTTP header is initialized with mime type "application/json".
--==============================================================================
procedure print_page_item_lov_as_json (
    p_sql_statement         in varchar2,
    p_page_item_name        in varchar2,
    p_escape                in boolean,
    p_replace_substitutions in boolean default false,
    p_support_legacy_lov    in boolean default false /* for internal use only! */
    );
--
--==============================================================================
-- Returns a jQuery selector based on a comma delimited string of page item names.
--==============================================================================
function page_item_names_to_jquery (
    p_page_item_names in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns a cleaned up version of a comma delimited string of page item names
-- where all spaces are removed, colons are replaced with a comma and the
-- page item names are converted to uppercase.
-- This is important for JavaScript code, because page item names are
-- case sensitive in the browser.
--==============================================================================
function cleanup_page_item_names (
    p_page_item_names in varchar2 )
    return varchar2;
--
--==============================================================================
-- Maps the numeric column type in p_sql_handler.column_list(x).col_type into
-- fewer data types defined by the constants c_data_type_*.
--==============================================================================
function get_data_type (
    p_col_type in number )
    return varchar2;
--
--==============================================================================
-- Returns the passed in value of p_value as VARCHAR2.
--
-- p_value: t_value record type
--==============================================================================
function get_value_as_varchar2 (
    p_data_type   in varchar2,
    p_value       in t_value,
    p_format_mask in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns the index of the specified column alias in p_column_value_list.
--==============================================================================
function get_column_no (
    p_attribute_label   in varchar2,
    p_column_alias      in varchar2,
    p_column_value_list in t_column_value_list2,
    p_is_required       in boolean,
    p_data_type         in varchar2 default c_data_type_varchar2 )
    return pls_integer;
--
--==============================================================================
-- Returns the index of the specified column alias in p_sql_handler.
--==============================================================================
function get_column_no (
    p_attribute_label in varchar2,
    p_column_alias    in varchar2,
    p_sql_handler     in t_sql_handler,
    p_is_required     in boolean,
    p_data_type       in varchar2 default c_data_type_varchar2 )
    return pls_integer;
--
--==============================================================================
-- Returns the index of the specified column alias in p_sql_handler.column_list.
--==============================================================================
function get_column_no (
    p_sql_handler  in t_sql_handler,
    p_column_alias in varchar2 )
    return pls_integer;
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column.
-- Note: All column values are returned as a string, independent of their original
--       data type!
--
-- p_sql_statement:      SQL statement which should be executed.
-- p_min_columns and
-- p_max_columns:        Used to check if the SQL statement complies to the number
--                       of required columns.
-- p_component_name:     The name of the page item or report column, ... which is
--                       used in case an error has to be displayed.
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      Value which should be used to restrict the query.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--==============================================================================
function get_data (
    p_sql_statement      in varchar2,
    p_min_columns        in number,
    p_max_columns        in number,
    p_component_name     in varchar2,
    p_search_type        in varchar2    default null,
    p_search_column_name in varchar2    default null,
    p_search_string      in varchar2    default null,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list )
    return t_column_value_list;
--
--==============================================================================
-- Same as the above get_data but references the search column by position number.
--==============================================================================
function get_data (
    p_sql_statement      in varchar2,
    p_min_columns        in number,
    p_max_columns        in number,
    p_component_name     in varchar2,
    p_search_type        in varchar2,
    p_search_column_no   in varchar2,
    p_search_string      in varchar2,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list,
    p_support_legacy_lov in boolean     default false  /* for internal use only! */ )
    return t_column_value_list;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column. This is a more advanced version of get_data, because
-- it returns the column values with their original data types.
--
-- p_sql_statement:      SQL statement which should be executed.
-- p_min_columns and
-- p_max_columns:        Used to check if the SQL statement complies to the number
--                       of required columns.
-- p_data_type_list:     If provided checks that the data type for each column
--                       matches to the specified data type in the array.
--                       Use the constants c_data_type_* for available data types.
-- p_component_name:     The name of the page item or report column, ... which is
--                       used in case an error has to be displayed.
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      Value which should be used to restrict the query.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--==============================================================================
function get_data2 (
    p_sql_statement      in varchar2,
    p_min_columns        in number,
    p_max_columns        in number,
    p_data_type_list     in wwv_flow_global.vc_arr2 default c_empty_data_type_list,
    p_component_name     in varchar2,
    p_search_type        in varchar2    default null,
    p_search_column_name in varchar2    default null,
    p_search_string      in varchar2    default null,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list )
    return t_column_value_list2;
--
--==============================================================================
-- Same as the above get_data2 but references the search column by position number.
--==============================================================================
function get_data2 (
    p_sql_statement    in varchar2,
    p_min_columns      in number,
    p_max_columns      in number,
    p_data_type_list   in wwv_flow_global.vc_arr2 default c_empty_data_type_list,
    p_component_name   in varchar2,
    p_search_type      in varchar2,
    p_search_column_no in varchar2,
    p_search_string    in varchar2,
    p_first_row        in number      default null,
    p_max_rows         in number      default null,
    p_auto_bind_items  in boolean     default true,
    p_bind_list        in t_bind_list default c_empty_bind_list )
    return t_column_value_list2;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column. This function expects a t_region record to automatically
-- set the format_mask in the t_column_value record which will be sued by set_component_values.
--
-- p_sql_statement:      SQL statement which should be executed.
-- p_region              Region record
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      Value which should be used to restrict the query.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--==============================================================================
function get_data2 (
    p_sql_statement      in varchar2,
    p_region             in wwv_flow_plugin_api.t_region,
    p_search_type        in varchar2    default null,
    p_search_column_name in varchar2    default null,
    p_search_string      in varchar2    default null,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list )
    return t_column_value_list2;
--
--==============================================================================
-- Gets the display (lookup) value for the value specified in p_search_string.
--
-- p_sql_statement:     SQL statement which is used for the lookup.
-- p_min_columns and
-- p_max_columns:       Used to check if the SQL statement complies to the number
--                      of required columns.
-- p_component_name:    The name of the page item or report column, ... which is
--                      used in case an error has to be displayed.
-- p_display_column_no: Column which should be returned from the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_column_no:  Column which should be used to restrict the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_string:     Value which should be looked up.
-- p_display_extra:     If set to TRUE and a value isn't found, the search value
--                      will be added to the result instead.
-- p_escape_display_extra: If set to TRUE p_search_string will be escaped if added
--                         as "Display Extra" value.
--
-- Note: In the case multiple rows are returned by the query, just the first one
--       is returned.
--==============================================================================
function get_display_data (
    p_sql_statement        in varchar2,
    p_min_columns          in number,
    p_max_columns          in number,
    p_component_name       in varchar2,
    p_display_column_no    in binary_integer default 1,
    p_search_column_no     in binary_integer default 2,
    p_search_string        in varchar2,
    p_display_extra        in boolean        default true,
    p_escape_display_extra in boolean        default true,
    p_auto_bind_items      in boolean        default true,
    p_bind_list            in t_bind_list    default c_empty_bind_list,
    p_support_legacy_lov   in boolean        default false /* for internal use only! */ )
    return varchar2;
--
--==============================================================================
-- Gets the display (lookup) values for the values specified in p_search_value_list.
--
-- p_sql_statement:     SQL statement which is used for the lookup.
-- p_min_columns and
-- p_max_columns:       Used to check if the SQL statement complies to the number
--                      of required columns.
-- p_component_name:    The name of the page item or report column, ... which is
--                      used in case an error has to be displayed.
-- p_display_column_no: Column which should be returned from the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_column_no:  Column which should be used to restrict the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_value_list: Array of values which should be looked up.
-- p_display_extra:     If set to TRUE and a value isn't found, the search value
--                      will be added to the result instead.
-- p_escape_display_extra: If set to TRUE p_search_string will be escaped if added
--                         as "Display Extra" value.
--==============================================================================
function get_display_data (
    p_sql_statement        in varchar2,
    p_min_columns          in number,
    p_max_columns          in number,
    p_component_name       in varchar2,
    p_display_column_no    in binary_integer default 1,
    p_search_column_no     in binary_integer default 2,
    p_search_value_list    in wwv_flow_global.vc_arr2,
    p_display_extra        in boolean        default true,
    p_escape_display_extra in boolean        default true,
    p_auto_bind_items      in boolean        default true,
    p_bind_list            in t_bind_list    default c_empty_bind_list,
    p_support_legacy_lov   in boolean        default false /* for internal use only! */ )
    return wwv_flow_global.vc_arr2;
--
--==============================================================================
-- Opens a sql cursor and returns useful information about the SQL statement
-- in a record structure. Like used bind variables, column information, ...
--
-- p_sql_statement:  SQL statement which should be executed.
-- p_min_columns and
-- p_max_columns:    Used to check if the SQL statement complies to the number
--                   of required columns.
-- p_data_type_list: If provided checks that the data type for each column
--                   matches to the specified data type in the array.
--                   Use the constants c_data_type_* for available data types.
--                   Note: This parameter should be used in combination with
--                         get_data2.
-- p_component_name: The name of the page item or report column, ... which is
--                   used in case an error has to be displayed.
--
-- Note: Always call free_sql_handler after you are done reading data. Don't
--       forget to add it to the exception handler as well to release the cursor!
--==============================================================================
function get_sql_handler (
    p_sql_statement   in varchar2,
    p_min_columns     in number,
    p_max_columns     in number,
    p_data_type_list  in wwv_flow_global.vc_arr2 default c_empty_data_type_list,
    p_component_name  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return t_sql_handler;
--
--==============================================================================
-- Closes the open cursor created by get_sql_handler.
--
-- p_sql_handler: Record returned by get_sql_handler.
--==============================================================================
procedure free_sql_handler (
    p_sql_handler in out nocopy t_sql_handler );
--
--==============================================================================
-- Creates and parses a SQL statement based on p_search_type and p_max_row.
-- The procedure also already binds all page item bind variables.
-- Call get_data afterwards to get the actual data.
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column which should be used to restrict the SQL statement.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--
-- Note: get_sql_handler has to be called before this call.
--==============================================================================
procedure prepare_query (
    p_sql_handler        in out nocopy t_sql_handler,
    p_search_type        in varchar2,
    p_search_column_name in varchar2,
    p_first_row          in number         default null,
    p_max_rows           in number         default null,
    p_auto_bind_items    in boolean        default true,
    p_bind_list          in t_bind_list    default c_empty_bind_list );
--
--==============================================================================
-- Creates and parses a SQL statement based on p_search_type and p_max_row.
-- The procedure also already binds all page item bind variables.
-- Call get_data afterwards to get the actual data.
--
-- p_sql_handler:      Record returned by get_sql_handler.
-- p_search_type:      Use one of the c_search_* constants.
-- p_search_column_no: Column which should be used to restrict the SQL statement.
--                     Has to be in range of p_min_column and p_max_column.
-- p_first_row:        Skips all rows before the specified row. Can be used for
--                     pagination.
-- p_max_rows:         Limits the number of returned rows.
--
-- Note: get_sql_handler has to be called before this call.
--==============================================================================
procedure prepare_query (
    p_sql_handler      in out nocopy t_sql_handler,
    p_search_type      in varchar2       default null,
    p_search_column_no in binary_integer default 2,
    p_first_row        in number         default null,
    p_max_rows         in number         default null,
    p_auto_bind_items  in boolean        default true,
    p_bind_list        in t_bind_list    default c_empty_bind_list );
--
--==============================================================================
-- Converts the search string in uppercase if it's a case insensitive search.
--
-- p_search_type:   Use one of the c_search_* constants.
-- p_search_string: Search string.
--==============================================================================
function get_search_string (
    p_search_type   in varchar2,
    p_search_string in varchar2 )
    return varchar2;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column.
-- Note: All column values are returned as a string, independent of their original
--       data type!
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      The query is restricted by this value.
--
-- Note: prepare_query has to be called before!
--==============================================================================
function get_data (
    p_sql_handler        in t_sql_handler,
    p_search_column_name in varchar2      default null,
    p_search_string      in varchar2      default null )
    return t_column_value_list;
--
--==============================================================================
-- Same as the above get_data but references the search column by position number.
--==============================================================================
function get_data (
    p_sql_handler      in t_sql_handler,
    p_search_column_no in binary_integer,
    p_search_string    in varchar2 )
    return t_column_value_list;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column.
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      The query is restricted by this value.
--
-- Note: prepare_query has to be called before!
--==============================================================================
function get_data2 (
    p_sql_handler        in t_sql_handler,
    p_search_column_name in varchar2       default null,
    p_search_string      in varchar2       default null )
    return t_column_value_list2;
--
--==============================================================================
-- Same as the above get_data2 but references the search column by position number.
--==============================================================================
function get_data2 (
    p_sql_handler      in t_sql_handler,
    p_search_column_no in binary_integer,
    p_search_string    in varchar2 )
    return t_column_value_list2;
--
--==============================================================================
-- Gets the display (lookup) values for the values specified in p_search_value_list.
--
-- p_sql_handler:       Record returned by get_sql_handler.
-- p_display_column_no: Column which should be returned from the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_column_no:  Column which should be used to restrict the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_value_list: Array of values which should be looked up.
-- p_display_extra:     If set to TRUE and a value isn't found, the search value
--                      will be added to the result instead.
-- p_escape_display_extra: If set to TRUE p_search_string will be escaped if added
--                         as "Display Extra" value.
--
-- Note: get_sql_handler has to be called before!
--       prepare_query will be called by this function.
--==============================================================================
function get_display_data (
    p_sql_handler          in t_sql_handler,
    p_display_column_no    in binary_integer default 1,
    p_search_column_no     in binary_integer default 2,
    p_search_value_list    in wwv_flow_global.vc_arr2,
    p_display_extra        in boolean        default true,
    p_escape_display_extra in boolean        default true,
    p_auto_bind_items      in boolean        default true,
    p_bind_list            in t_bind_list    default c_empty_bind_list )
    return wwv_flow_global.vc_arr2;
--
--==============================================================================
-- Executes a PL/SQL expression and returns the result.
--
-- p_plsql_expression: PL/SQL expression which returns string.
--==============================================================================
function get_plsql_expression_result (
    p_plsql_expression in varchar2,
    p_auto_bind_items  in boolean     default true,
    p_bind_list        in t_bind_list default c_empty_bind_list )
    return varchar2;
--
--==============================================================================
-- Executes a PL/SQL expression and returns the result.
--
-- p_plsql_expression: PL/SQL expression which returns boolean.
--==============================================================================
function get_plsql_expr_result_boolean (
    p_plsql_expression in varchar2,
    p_auto_bind_items  in boolean     default true,
    p_bind_list        in t_bind_list default c_empty_bind_list )
    return boolean;
--
--==============================================================================
-- Executes a PL/SQL function code block and returns the result.
--
-- p_plsql_function: PL/SQL function which returns string.
--                   For example:
--                   declare
--                       l_test varchar2(10);
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_function_result (
    p_plsql_function  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return varchar2;
--
--==============================================================================
-- Executes a PL/SQL function code block and returns the result.
--
-- p_plsql_function: PL/SQL function which returns boolean.
--                   For example:
--                   declare
--                       l_test boolean;
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_func_result_boolean (
    p_plsql_function  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return boolean;
--
--==============================================================================
-- Executes a PL/SQL function code block and returns the result.
--
-- p_plsql_function: PL/SQL function which returns clob.
--                   For example:
--                   declare
--                       l_test clob;
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_func_result_clob (
    p_plsql_function  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return clob;
--
--==============================================================================
-- Executes a PL/SQL code block.
--==============================================================================
procedure execute_plsql_code (
    p_plsql_code      in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list );
--
--==============================================================================
-- Function returns true if the passed build option, authorization and
-- condition are ok to display/process/use this component.
--==============================================================================
function is_component_used (
    p_build_option_id         in number   default null,
    p_authorization_scheme_id in varchar2,
    p_condition_type          in varchar2,
    p_condition_expression1   in varchar2,
    p_condition_expression2   in varchar2,
    p_component               in varchar2 default null )
    return boolean;
--
--==============================================================================
-- Writes the data of the page item meta data into the debug output.
--==============================================================================
procedure debug_page_item (
    p_plugin    in wwv_flow_plugin_api.t_plugin,
    p_page_item in wwv_flow_plugin_api.t_page_item );
--
procedure debug_page_item (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_page_item           in wwv_flow_plugin_api.t_page_item,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean );
--
--==============================================================================
-- Writes the data of the region meta data into the debug output.
--==============================================================================
procedure debug_region (
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_region in wwv_flow_plugin_api.t_region );
--
procedure debug_region (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_is_printer_friendly in boolean );
--
--==============================================================================
-- Writes the data of the dynamic action meta data into the debug output.
--==============================================================================
procedure debug_dynamic_action (
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action );
--
--==============================================================================
-- Writes the data of the process meta data into the debug output.
--==============================================================================
procedure debug_process (
    p_plugin  in wwv_flow_plugin_api.t_plugin,
    p_process in wwv_flow_plugin_api.t_process );
--
--==============================================================================
-- Writes the data of the authorization meta data into the debug output.
--==============================================================================
procedure debug_authorization (
    p_plugin        in wwv_flow_plugin_api.t_plugin,
    p_authorization in wwv_flow_plugin_api.t_authorization );
--
--==============================================================================
-- Writes the data of the authentication meta data into the debug output.
--==============================================================================
procedure debug_authentication (
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_authentication in wwv_flow_plugin_api.t_authentication );
--
--==============================================================================
-- Returns the value of a plug-in attribute as number, taking into account NLS
-- decimal separator effective for the current database session. Use this
-- function in plug-in PL/SQL source for custom attributes of type NUMBER
-- instead of the built-in to_number() function.
--==============================================================================
function get_attribute_as_number (
    p_value           in varchar2,
    p_attribute_label in varchar2 default null )
    return number;
--
end wwv_flow_plugin_util;
/
show errors
