set define '^'
set verify off
prompt ...wwv_flow_plugin_dev


create or replace package wwv_flow_plugin_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_plugin_dev.sql
--
--    DESCRIPTION
--      This package is resonsible for handling plugins in the APEX Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      09/25/2009 - Created
--    pawolf      10/20/2009 - Added set_defaults
--    pawolf      01/11/2009 - Added validate_lov
--    pawolf      01/19/2010 - Added validate_region_source
--    pawolf      02/05/2010 - Added check for item type file
--    pawolf      04/16/2010 - Added functions for dynamic actions
--    pawolf      04/21/2010 - Added is_attribute_translatable
--    pawolf      05/31/2010 - Bug# 9748679: always store minimum/maximum value with a period
--    pawolf      10/14/2010 - Bug# 10201943: changed get_attribute_def_javascript to write_plugin_meta_data_array
--    pawolf      12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--    pawolf      04/11/2011 - Added plug-in attribute type "REGION SOURCE COLUMN" (feature 663)
--    pawolf      03/29/2012 - Added get_max_custom_attributes and renamed package to wwv_flow_plugin_dev
--    pawolf      04/02/2012 - Added delete_plugin_settings
--    pawolf      04/03/2012 - Removed compiler warnings
--    pawolf      04/04/2012 - Added is_column_translatable
--    arayner     04/24/2012 - Added p_action to synchronize_attribute_columns
--    pawolf      03/19/2014 - Exposed get_columns_of_sql as public function
--    pawolf      04/30/2014 - Added build_sql_statement
--    pawolf      07/23/2014 - In add_onload_code: added p_is_wizard (feature #1463)
--    pawolf      10/22/2014 - In copy_plugin: added new parameters
--    pawolf      10/28/2014 - Added support for 'supported ui types' (feature #1271)
--    pawolf      10/29/2014 - In build_sql_statement: added pk parameters, p_where_clause and p_order_by_clause
--    pawolf      01/14/2014 - In get_columns_of_sql: enhanced function to work with pl/sql block returning SQL (bug #19019793)
--    pawolf      02/25/2015 - Added conv_number_fields_for_storage, conv_number_fields_for_display, init_number_fields_for_display and get_number_field_for_display (bug #18706089)
--    hfarrell    03/18/2015 - In write_plugin_meta_data_array: added p_plugin_name (bug #20706599)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Returns the number of custom plug-in attributes depending on the plug-in type.
--==============================================================================
function get_max_custom_attributes (
    p_plugin_type     in varchar2,
    p_attribute_scope in varchar2 )
    return pls_integer;

--==============================================================================
-- Adds the necessary javascript code to initialize the dynamic attributes on a
-- Builder page.
--==============================================================================
procedure add_onload_code (
    p_application_id          in number   default V('FB_FLOW_ID'),
    p_plugin_type             in varchar2,
    p_type_page_item_name     in varchar2,
    p_page_item_prefix        in varchar2,
    p_user_interface_id       in number   default null,
    p_register_onchange_event in boolean  default true,
    p_is_wizard               in boolean  default false );
--
--==============================================================================
-- Adds the necessary javascript code to initialize the dynamic attributes on a
-- Builder page where the type can't be changed.
--==============================================================================
procedure add_onload_code (
    p_application_id    in number   default V('FB_FLOW_ID'),
    p_plugin_type       in varchar2,
    p_type_value        in varchar2,
    p_page_item_prefix  in varchar2,
    p_user_interface_id in number   default null,
    p_region_source     in varchar2 default null,
    p_attribute_scope   in varchar2 default wwv_flow_plugin.c_attribute_scope_component,
    p_is_wizard         in boolean  default false );
--
--==============================================================================
-- Writes the javascript array definition gPluginList which contains the
-- dynamic attribute meta data information to the HTTP output.
--==============================================================================
procedure write_plugin_meta_data_array (
    p_application_id  in number,
    p_plugin_type     in varchar2,
    p_attribute_scope in varchar2 default wwv_flow_plugin.c_attribute_scope_component,
    p_region_source   in varchar2 default null,
    p_plugin_name     in varchar2 default null);
--
--==============================================================================
-- Returns the value of the SQL examples column of the plug-in configuration if
-- the plug-in has the standard attribute LOV or SOURCE_SQL. Otherwise NULL is
-- returned. 
--==============================================================================
function get_sql_examples (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2 )
    return varchar2;
--
--==============================================================================
-- Used in the builder to validate the entered attribute values for a plugin.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure validate_attribute_items (
    p_application_id    in number,
    p_page_id           in number default v('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_attribute_scope   in varchar2,
    p_page_item_prefix  in varchar2,
    p_user_interface_id in number   default null,
    p_region_source     in varchar2 default null );
--
--==============================================================================
-- Used in the builder to validate the LOV for a plugin and the old item types.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure validate_lov (
    p_application_id    in number,
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the builder to validate the region source for a plugin.
-- The function will return the error message which should be used in a
-- validation.
--==============================================================================
function validate_region_source (
    p_application_id    in number,
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_name       in varchar2,
    p_region_source     in varchar2 )
    return varchar2;
--
--==============================================================================
-- Used in the builder to validate the affected element attributes of
-- a dynamic action.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P675_
--==============================================================================
procedure validate_affected_elements (
    p_application_id    in number,
    p_security_group_id in number   default v('WORKSPACE_ID'),
    p_plugin_name       in varchar2 default null,
    p_is_required       in boolean  default null,
    p_is_available      in boolean  default null,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the builder to validate the triggering of a dynamic action.
-- This procedure directly adds the errors for the different attribute page items
-- to the wwv_flow.g_validation_* arrays.
-- p_page_item_prefix for example is P793_
--==============================================================================
procedure validate_triggering (
    p_page_item_prefix in varchar2 );
--
--==============================================================================
-- Used in the Builder to convert NUMBER plug-in attributes to always use
-- a dot as decimal separator before storage.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure conv_number_fields_for_storage (
    p_application_id    in number,
    p_page_id           in number default v('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_attribute_scope   in varchar2,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the Builder to convert NUMBER plug-in attributes to use current
-- decimal separator before display.
-- p_page_item_prefix for example is P751_
--==============================================================================
procedure conv_number_fields_for_display (
    p_application_id    in number,
    p_page_id           in number default v('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_attribute_scope   in varchar2,
    p_page_item_prefix  in varchar2 );
--
--==============================================================================
-- Used in the Builder on Edit pages to initialize the all plug-in attributes
-- of type NUMBER.
--==============================================================================
procedure init_number_fields_for_display (
    p_application_id    in number,
    p_page_id           in number default v('FB_FLOW_PAGE_ID'),
    p_security_group_id in number default v('WORKSPACE_ID'),
    p_plugin_type       in varchar2,
    p_plugin_name       in varchar2,
    p_attribute_scope   in varchar2 );
--
--==============================================================================
-- Used in the Builder in "Post Calculation Computation" to convert NUMBER
-- plug-in attributes to use current decimal separator before display.
--==============================================================================
function get_number_field_for_display (
    p_attribute_no in number,
    p_value        in varchar2 )
    return varchar2;
--
--==============================================================================
-- Called when a new version of a plug-in is installed or when it's refreshed
-- with the Subscribe mechanism. The purpose of the procedure is to check all
-- references of the plug-in and migrate the attribute values if necessary.
--==============================================================================
procedure synchronize_attribute_columns (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2,
    p_action         in varchar2 default null );
--
--==============================================================================
-- Returns true if the plug-in is referenced in wwv_flow_step_items, ...
--==============================================================================
function is_in_use (
    p_plugin_id in number )
    return boolean;
--
--==============================================================================
-- Sets the attribute_xx parameters to the default values defined for the plugin
-- specified in p_plugin_name. If a p_attribute_xx parameter contains a value,
-- then the value is NOT modified.
--==============================================================================
procedure set_defaults (
    p_application_id  in            number   default null,
    p_plugin_type     in            varchar2,
    p_plugin_name     in            varchar2,
    p_attribute_scope in            varchar2 default 'COMPONENT',
    p_attribute_01    in out nocopy varchar2,
    p_attribute_02    in out nocopy varchar2,
    p_attribute_03    in out nocopy varchar2,
    p_attribute_04    in out nocopy varchar2,
    p_attribute_05    in out nocopy varchar2,
    p_attribute_06    in out nocopy varchar2,
    p_attribute_07    in out nocopy varchar2,
    p_attribute_08    in out nocopy varchar2,
    p_attribute_09    in out nocopy varchar2,
    p_attribute_10    in out nocopy varchar2,
    p_attribute_11    in out nocopy varchar2,
    p_attribute_12    in out nocopy varchar2,
    p_attribute_13    in out nocopy varchar2,
    p_attribute_14    in out nocopy varchar2,
    p_attribute_15    in out nocopy varchar2 );
--
--==============================================================================
-- Sets the attribute_xx parameters to the default values defined for the plugin
-- specified in p_plugin_name. If a p_attribute_xx parameter contains a value,
-- then the value is NOT modified.
--==============================================================================
procedure set_defaults (
    p_application_id  in            number   default null,
    p_plugin_type     in            varchar2,
    p_plugin_name     in            varchar2,
    p_attribute_scope in            varchar2 default 'COMPONENT',
    p_attribute_01    in out nocopy varchar2,
    p_attribute_02    in out nocopy varchar2,
    p_attribute_03    in out nocopy varchar2,
    p_attribute_04    in out nocopy varchar2,
    p_attribute_05    in out nocopy varchar2,
    p_attribute_06    in out nocopy varchar2,
    p_attribute_07    in out nocopy varchar2,
    p_attribute_08    in out nocopy varchar2,
    p_attribute_09    in out nocopy varchar2,
    p_attribute_10    in out nocopy varchar2,
    p_attribute_11    in out nocopy varchar2,
    p_attribute_12    in out nocopy varchar2,
    p_attribute_13    in out nocopy varchar2,
    p_attribute_14    in out nocopy varchar2,
    p_attribute_15    in out nocopy varchar2,
    p_attribute_16    in out nocopy varchar2,
    p_attribute_17    in out nocopy varchar2,
    p_attribute_18    in out nocopy varchar2,
    p_attribute_19    in out nocopy varchar2,
    p_attribute_20    in out nocopy varchar2,
    p_attribute_21    in out nocopy varchar2,
    p_attribute_22    in out nocopy varchar2,
    p_attribute_23    in out nocopy varchar2,
    p_attribute_24    in out nocopy varchar2,
    p_attribute_25   in out nocopy varchar2 );
--
--==============================================================================
-- Returns the specified standard attributes for the passed in plugin.
--==============================================================================
function get_standard_attributes (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns TRUE if the specified feature/standard attribute in p_feature is set
-- for the passed plugin
--==============================================================================
function has_standard_attribute (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2,
    p_feature        in varchar2 )
    return boolean;
--
--==============================================================================
-- Returns TRUE if one of the specified dynamic actions has any of the affected
-- element types.
--==============================================================================
function has_affected_element_type (
    p_application_id in number,
    p_true_action    in varchar2,
    p_false_action   in varchar2 default null,
    p_type           in varchar2 default null )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the is_translatable flag is set to Y for the specified
-- plug-in attribute.
--==============================================================================
function is_attribute_translatable (
    p_application_id     in number,
    p_plugin_type        in varchar2,
    p_plugin_name        in varchar2,
    p_attribute_scope    in varchar2,
    p_attribute_sequence in number )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified record identified by p_table_name and p_id
-- uses a plug-in where the specified p_column_name is a translatable plug-in
-- attribute. p_table_name has to be one of the tables which support plug-ins
-- ( WWV_FLOW_PLUGIN_SETTINGS, WWV_FLOW_STEP_PROCESSING, WWV_FLOW_PAGE_PLUGS,
--   WWV_FLOW_STEP_ITEMS, WWV_FLOW_PAGE_DA_ACTIONS, WWV_FLOW_SECURITY_SCHEMES,
--   WWV_FLOW_AUTHENTICATIONS ) and p_column_name has to be ATTRIBUTE_xx.
--==============================================================================
function is_column_translatable (
    p_application_id in number,
    p_table_name     in varchar2,
    p_column_name    in varchar2,
    p_id             in number )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified plug-in has custom attributes of
-- scope "APPLICATION".
--==============================================================================
function has_application_attributes (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin_name    in varchar2 )
    return boolean;
--
--==============================================================================
-- Describes a SQL statement and returns the selected columns used in the SQL.
--==============================================================================
function get_columns_of_sql (
    p_application_id       in number,
    p_sql                  in varchar2,
    p_sql_is_function      in boolean default false,
    p_generic_column_count in number  default null )
    return sys.dbms_sql.desc_tab2;
--
--==============================================================================
-- Returns a formatted SQL statement based on the table and columns provided. 
--==============================================================================
function build_sql_statement (
    p_application_id  in number   default v('FB_FLOW_ID'),
    p_table_owner     in varchar2,
    p_table_name      in varchar2,
    p_columns         in varchar2,
    p_pk_type         in varchar2 default null,
    p_pk_column       in varchar2 default null,
    p_pk_column2      in varchar2 default null,
    p_where_clause    in varchar2 default null,
    p_order_by_clause in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Copy a plugin, including attributes and events, between applications
-- p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new plugin gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a plugin with the same type+name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
--==============================================================================
procedure copy_plugin (
    p_from_application_id      in number,
    p_type                     in varchar2,
    p_name                     in varchar2,
    p_to_application_id        in number,
    p_to_name                  in varchar2 default null,
    p_to_display_name          in varchar2 default null,
    p_subscribe                in boolean default false,
    p_if_existing_raise_dupval in boolean default false );
--
--==============================================================================
-- Copy a plugin's attributes, events and files from source to destination. The
-- attributes, events and files of destination will be removed before copying.
--
-- Used internally by copy_plugin and also to refresh subscribers.
--==============================================================================
procedure copy_plugin_details (
    p_source_plugin_id      in number,
    p_destination_plugin_id in number );
--
--==============================================================================
-- This procedure pulls content from the master plugin and
-- copies it to the subscribing plugin.
--==============================================================================
procedure subscribe_plugin (
    p_master_plugin_id      in number,
    p_subscribing_plugin_id in number );
--
--==============================================================================
-- This procedure pushes content of the plugin to
-- all plugins that reference this plugin.
--==============================================================================
procedure push_plugin (
    p_plugin_id in number );
--
--==============================================================================
-- If the master plugin ID is not passed, get the master plugin ID
-- and refresh subscribing plugin.
--==============================================================================
procedure refresh_plugin (
    p_subscribing_plugin_id in number );
--
--==============================================================================
-- Deletes the plug-in settings for the specified plug-in.
-- This procedure should be used when a plug-in is removed from an application.
--==============================================================================
procedure delete_plugin_settings (
    p_application_id in number,
    p_plugin_type    in varchar2,
    p_plugin         in varchar2 );
--
--
end wwv_flow_plugin_dev;
/
show errors
