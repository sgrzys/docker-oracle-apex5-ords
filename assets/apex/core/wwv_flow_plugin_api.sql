set define '^'
set verify off
prompt ...wwv_flow_plugin_api


create or replace package wwv_flow_plugin_api
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_plugin_api.sql
--
--    DESCRIPTION
--      This package provides all types, constants and APIs for plug-ins.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      02/03/2009 - Created based on wwv_flow_plugin
--    pawolf      02/20/2010 - Added support for processes
--    pawolf      04/17/2010 - Renamed lov_items_to_submit and lov_optimize_refresh to ajax_item_to_submit and ajax_optimize_refresh
--    arayner     04/23/2010 - Added "plain_label" attribute to t_page_item record (bug #9557074)
--    pawolf      04/26/2010 - Removed lov_query_result_translated and standard_validations
--    pawolf      12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--    cneumuel    02/02/2011 - Added plugin support for authorization (feature #580)
--    pawolf      03/28/2011 - Removed PLUG_DISPLAY_ERROR_MESSAGE (feature# 544)
--    pawolf      04/07/2011 - Added "Page Items to Submit" (ajax_items_to_submit) support for regions (eg. Classic Report) (feature #505)
--    pawolf      04/08/2011 - Added "Escape Special Characters" (escape_on_http_output) support for region plug-ins (feature #649)
--    pawolf      04/08/2011 - Added "Substitute Attribute Values" (substitute_attributes) to plug-ins (feature 655)
--    pawolf      04/20/2011 - Renamed wwv_flow_plugin.c_inline_in_notifiction to c_inline_in_notification
--    pawolf      05/13/2011 - Added plug-ins for authentication schemes (feature 581)
--    cneumuel    05/19/2011 - Extensions to authentication records (feature 581)
--    pawolf      05/23/2011 - Changed authentication plugin records (feature 581)
--    cneumuel    05/26/2011 - Added t_authentication.plsql_code (feature 581)
--    cneumuel    08/09/2011 - Renamed t_authorization.user_name to username (bug #12849435)
--    pawolf      02/27/2012 - Renamed package to wwv_flow_plugin_api
--    pawolf      02/28/2012 - Added placeholder attribute for page items (feature# 837)
--    pawolf      03/02/2012 - Added css_classes for page items (feature# 815)
--    pawolf      03/28/2012 - Added 10 more custom plug-in attributes to regions (feature# 890)
--    pawolf      04/18/2012 - Added fetched_rows to t_region (feature# 907)
--    pawolf      04/19/2012 - Added no_data_found_message to t_region (feature# 909)
--    cneumuel    09/12/2013 - In t_authorization: added caching, component (feature #1058)
--    cneumuel    09/30/2013 - In t_process: added region_id, row_num (feature #1281)
--    pawolf      02/17/2013 - Added support for region columns (feature #1393)
--    pawolf      07/18/2014 - Added navigable_dom_id to t_region_render_result (feature #1461)
--    pawolf      10/20/2014 - In t_page_item: added label_id (feature #1503)
--    pawolf      11/24/2014 - Added c_alignment_* constants (feature #1393)
--    pawolf      02/10/2015 - Restored "dummy" in t_region_render_result (bug #20511370)
--    pawolf      03/02/2015 - In t_process_exec_result: added execution_skipped (bug #20622844)
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_plugin is record (
    name         varchar2(45),
    file_prefix  varchar2(4000),
    attribute_01 varchar2(32767),
    attribute_02 varchar2(32767),
    attribute_03 varchar2(32767),
    attribute_04 varchar2(32767),
    attribute_05 varchar2(32767),
    attribute_06 varchar2(32767),
    attribute_07 varchar2(32767),
    attribute_08 varchar2(32767),
    attribute_09 varchar2(32767),
    attribute_10 varchar2(32767),
    attribute_11 varchar2(32767),
    attribute_12 varchar2(32767),
    attribute_13 varchar2(32767),
    attribute_14 varchar2(32767),
    attribute_15 varchar2(32767) );

type t_page_item is record (
    id                          number,
    name                        varchar2(255),
    label                       varchar2(4000),
    plain_label                 varchar2(4000),
    label_id                    varchar2(255), /* label id is set if "Standard Form Element" = no and label template uses #LABEL_ID# substitution */
    placeholder                 varchar2(255),
    format_mask                 varchar2(255),
    is_required                 boolean,
    lov_definition              varchar2(4000),
    lov_display_extra           boolean,
    lov_display_null            boolean,
    lov_null_text               varchar2(255),
    lov_null_value              varchar2(255),
    lov_cascade_parent_items    varchar2(255),
    ajax_items_to_submit        varchar2(255),
    ajax_optimize_refresh       boolean,
    element_width               number,
    element_max_length          number,
    element_height              number,
    element_css_classes         varchar2(255),
    element_attributes          varchar2(2000),
    element_option_attributes   varchar2(4000),
    escape_output               boolean,
    attribute_01                varchar2(32767),
    attribute_02                varchar2(32767),
    attribute_03                varchar2(32767),
    attribute_04                varchar2(32767),
    attribute_05                varchar2(32767),
    attribute_06                varchar2(32767),
    attribute_07                varchar2(32767),
    attribute_08                varchar2(32767),
    attribute_09                varchar2(32767),
    attribute_10                varchar2(32767),
    attribute_11                varchar2(32767),
    attribute_12                varchar2(32767),
    attribute_13                varchar2(32767),
    attribute_14                varchar2(32767),
    attribute_15                varchar2(32767) );

type t_page_item_render_result is record (
    is_navigable     boolean default false,
    navigable_dom_id varchar2(255)          /* should only be set if navigable element is not equal to item name */
    );

type t_page_item_ajax_result is record (
    dummy boolean /* not used yet */
    );

type t_page_item_validation_result is record (
    message          varchar2(32767),
    display_location varchar2(40),    /* if not set the application default will be used */
    page_item_name   varchar2(255) ); /* if not set the validated page item name will be used */

subtype t_region_column_name is wwv_flow_region_columns.name%type;

type t_region_column is record (
    id                    number,
    name                  t_region_column_name,
    is_displayed          boolean,
    heading               wwv_flow_region_columns.heading%type,
    heading_alignment     wwv_flow_region_columns.heading_alignment%type,
    value_alignment       wwv_flow_region_columns.value_alignment%type,
    value_css_classes     wwv_flow_region_columns.value_css_classes%type,
    value_attributes      wwv_flow_region_columns.value_attributes%type,
    format_mask           wwv_flow_region_columns.format_mask%type,
    escape_output         boolean,
    --
    attribute_01          varchar2(32767),
    attribute_02          varchar2(32767),
    attribute_03          varchar2(32767),
    attribute_04          varchar2(32767),
    attribute_05          varchar2(32767),
    attribute_06          varchar2(32767),
    attribute_07          varchar2(32767),
    attribute_08          varchar2(32767),
    attribute_09          varchar2(32767),
    attribute_10          varchar2(32767),
    attribute_11          varchar2(32767),
    attribute_12          varchar2(32767),
    attribute_13          varchar2(32767),
    attribute_14          varchar2(32767),
    attribute_15          varchar2(32767),
    attribute_16          varchar2(32767),
    attribute_17          varchar2(32767),
    attribute_18          varchar2(32767),
    attribute_19          varchar2(32767),
    attribute_20          varchar2(32767),
    attribute_21          varchar2(32767),
    attribute_22          varchar2(32767),
    attribute_23          varchar2(32767),
    attribute_24          varchar2(32767),
    attribute_25          varchar2(32767) );

type t_region_columns is table of t_region_column index by pls_integer;

type t_region is record (
    id                    number,
    static_id             varchar2(255),
    name                  varchar2(255),
    type                  varchar2(255),
    source                varchar2(32767),
    ajax_items_to_submit  varchar2(32767),
    fetched_rows          pls_integer,
    escape_output         boolean,
    error_message         varchar2(32767), /* obsolete */
    no_data_found_message varchar2(32767),
    attribute_01          varchar2(32767),
    attribute_02          varchar2(32767),
    attribute_03          varchar2(32767),
    attribute_04          varchar2(32767),
    attribute_05          varchar2(32767),
    attribute_06          varchar2(32767),
    attribute_07          varchar2(32767),
    attribute_08          varchar2(32767),
    attribute_09          varchar2(32767),
    attribute_10          varchar2(32767),
    attribute_11          varchar2(32767),
    attribute_12          varchar2(32767),
    attribute_13          varchar2(32767),
    attribute_14          varchar2(32767),
    attribute_15          varchar2(32767),
    attribute_16          varchar2(32767),
    attribute_17          varchar2(32767),
    attribute_18          varchar2(32767),
    attribute_19          varchar2(32767),
    attribute_20          varchar2(32767),
    attribute_21          varchar2(32767),
    attribute_22          varchar2(32767),
    attribute_23          varchar2(32767),
    attribute_24          varchar2(32767),
    attribute_25          varchar2(32767),
    region_columns        t_region_columns );

type t_region_render_result is record (
    navigable_dom_id varchar2(255), /* can be used to put focus to an input field (i.e. search field) the region renders as part of the plug-in output */
    dummy            boolean /* this attribute is not in use! Just available for backward compatibility (bug #20511370) */
    );

type t_region_ajax_result is record (
    dummy boolean /* not used yet */
    );

type t_dynamic_action is record (
    id           number,
    action       varchar2(50),
    attribute_01 varchar2(32767),
    attribute_02 varchar2(32767),
    attribute_03 varchar2(32767),
    attribute_04 varchar2(32767),
    attribute_05 varchar2(32767),
    attribute_06 varchar2(32767),
    attribute_07 varchar2(32767),
    attribute_08 varchar2(32767),
    attribute_09 varchar2(32767),
    attribute_10 varchar2(32767),
    attribute_11 varchar2(32767),
    attribute_12 varchar2(32767),
    attribute_13 varchar2(32767),
    attribute_14 varchar2(32767),
    attribute_15 varchar2(32767) );

type t_dynamic_action_render_result is record (
    javascript_function varchar2(32767),
    ajax_identifier     varchar2(255),
    attribute_01        varchar2(32767),
    attribute_02        varchar2(32767),
    attribute_03        varchar2(32767),
    attribute_04        varchar2(32767),
    attribute_05        varchar2(32767),
    attribute_06        varchar2(32767),
    attribute_07        varchar2(32767),
    attribute_08        varchar2(32767),
    attribute_09        varchar2(32767),
    attribute_10        varchar2(32767),
    attribute_11        varchar2(32767),
    attribute_12        varchar2(32767),
    attribute_13        varchar2(32767),
    attribute_14        varchar2(32767),
    attribute_15        varchar2(32767) );

type t_dynamic_action_ajax_result is record (
    dummy boolean /* not used yet */
    );

type t_process is record (
    id                   number,
    name                 varchar2(255),
    region_id            number,           -- region id for tabular forms processes
    row_num              number,           -- row number for tabular forms processes, null otherwise
    success_message      varchar2(32767),
    attribute_01         varchar2(32767),
    attribute_02         varchar2(32767),
    attribute_03         varchar2(32767),
    attribute_04         varchar2(32767),
    attribute_05         varchar2(32767),
    attribute_06         varchar2(32767),
    attribute_07         varchar2(32767),
    attribute_08         varchar2(32767),
    attribute_09         varchar2(32767),
    attribute_10         varchar2(32767),
    attribute_11         varchar2(32767),
    attribute_12         varchar2(32767),
    attribute_13         varchar2(32767),
    attribute_14         varchar2(32767),
    attribute_15         varchar2(32767) );

type t_process_exec_result is record (
    success_message   varchar2(32767),
    execution_skipped boolean default false -- process execution has been skipped by plug-in because of additional condition checks
    );

type t_authorization is record (
    id                   number,
    name                 varchar2(255),
    username             varchar2(255),
    caching              varchar2(20),
    component            wwv_flow.t_component,
    attribute_01         varchar2(32767),
    attribute_02         varchar2(32767),
    attribute_03         varchar2(32767),
    attribute_04         varchar2(32767),
    attribute_05         varchar2(32767),
    attribute_06         varchar2(32767),
    attribute_07         varchar2(32767),
    attribute_08         varchar2(32767),
    attribute_09         varchar2(32767),
    attribute_10         varchar2(32767),
    attribute_11         varchar2(32767),
    attribute_12         varchar2(32767),
    attribute_13         varchar2(32767),
    attribute_14         varchar2(32767),
    attribute_15         varchar2(32767) );

type t_authorization_exec_result is record (
    is_authorized        boolean
    );

type t_authentication is record (
    id                   number,
    name                 varchar2(255),
    invalid_session_url  varchar2(4000),
    logout_url           varchar2(4000),
    plsql_code           clob,
    attribute_01         varchar2(32767),
    attribute_02         varchar2(32767),
    attribute_03         varchar2(32767),
    attribute_04         varchar2(32767),
    attribute_05         varchar2(32767),
    attribute_06         varchar2(32767),
    attribute_07         varchar2(32767),
    attribute_08         varchar2(32767),
    attribute_09         varchar2(32767),
    attribute_10         varchar2(32767),
    attribute_11         varchar2(32767),
    attribute_12         varchar2(32767),
    attribute_13         varchar2(32767),
    attribute_14         varchar2(32767),
    attribute_15         varchar2(32767),
    --
    session_id           number,
    username             varchar2(255) );

type t_authentication_sentry_result is record (
    is_valid             boolean
    );

type t_authentication_inval_result is record (
    redirect_url         varchar2(4000)
    );

type t_authentication_auth_result is record (
    is_authenticated     boolean,
    redirect_url         varchar2(4000), -- Can be used for a change password page if password is expired
    log_code             number,         -- code to log in wwv_flow_...
    log_text             varchar2(4000), -- text to log in wwv_flow_...
    display_text         varchar2(4000)  -- text to display if authentication fails
    );

type t_authentication_ajax_result is record (
    dummy                boolean /* not used yet */
    );

type t_authentication_logout_result is record (
    redirect_url         varchar2(4000)
    );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

-- used for p_item.standard_validations in render function of page item type
c_std_val_browser             constant varchar2(20) := 'BROWSER';
c_std_val_server              constant varchar2(20) := 'SERVER';
c_std_val_browser_and_server  constant varchar2(20) := 'BROWSER_AND_SERVER';

-- used for display_location in a validation function result of page item type
c_inline_with_field           constant varchar2(40) := 'INLINE_WITH_FIELD';
c_inline_with_field_and_notif constant varchar2(40) := 'INLINE_WITH_FIELD_AND_NOTIFICATION';
c_inline_in_notification      constant varchar2(40) := 'INLINE_IN_NOTIFICATION';
c_on_error_page               constant varchar2(40) := 'ON_ERROR_PAGE';

-- used for t_region_column.heading_alignment and t_region_column.value_alignment
c_alignment_left    constant varchar2(6) := 'LEFT';
c_alignment_center  constant varchar2(6) := 'CENTER';
c_alignment_right   constant varchar2(6) := 'RIGHT';

-- deprecated
c_inline_in_notifiction       constant varchar2(40) := 'INLINE_IN_NOTIFICATION';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--
/* Note: for internal use only!!! */
g_plugin                       t_plugin;

g_page_item                    t_page_item;
g_page_item_render_result      t_page_item_render_result;
g_page_item_ajax_result        t_page_item_ajax_result;
g_page_item_validation_result  t_page_item_validation_result;

g_region                       t_region;
g_region_render_result         t_region_render_result;
g_region_ajax_result           t_region_ajax_result;

g_dynamic_action               t_dynamic_action;
g_dynamic_action_render_result t_dynamic_action_render_result;
g_dynamic_action_ajax_result   t_dynamic_action_ajax_result;

g_process                      t_process;
g_process_exec_result          t_process_exec_result;

g_authorization                t_authorization;
g_authorization_exec_result    t_authorization_exec_result;

g_authentication               t_authentication;
g_authentication_sentry_result t_authentication_sentry_result;
g_authentication_inval_result  t_authentication_inval_result;
g_authentication_auth_result   t_authentication_auth_result;
g_authentication_ajax_result   t_authentication_ajax_result;
g_authentication_logout_result t_authentication_logout_result;

--------------------------------------------------------------------------------
-- Public functions
--------------------------------------------------------------------------------

--==============================================================================
-- Returns the name attribute which has to be used for a HTML input element if
-- you want that the value of the element is stored in session state when the
-- page is submitted. If you have a HTML input element which returns multiple
-- values (eg. select list with multiple="multiple") you have
-- to set p_is_multi_value.
-- Note: This function has to be called before you write something to the
--       HTTP buffer with HTP.P(RN)
--==============================================================================
function get_input_name_for_page_item (
    p_is_multi_value in boolean )
    return varchar2;
--
--==============================================================================
-- Returns the AJAX identifier which has to be used for the on-demand call
-- of a plug-in.
--
-- Note: if the plug-in doesn't have an AJAX callback configured, null will be
--       returned!
--==============================================================================
function get_ajax_identifier return varchar2;
--
end wwv_flow_plugin_api;
/
show errors
