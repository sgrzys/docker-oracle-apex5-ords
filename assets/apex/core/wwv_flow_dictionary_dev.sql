set define off
set verify off

prompt ...wwv_flow_dictionary

create or replace package wwv_flow_dictionary_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_dictionary_dev.sql
--
--    DESCRIPTION
--      This package provides helper functions for wwv_flow_search and
--      wwv_flow_advisor.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    08/24/2009 - Created
--      pawolf    08/28/2009 - Renamed columns_ignored_by_search to lookup_or_lov_columns
--      pawolf    09/02/2009 - Used CLOB for attribute_value
--      pawolf    02/27/2012 - Renamed packages wwv_flow_advisor to wwv_flow_advisor_dev, wwv_flow_dictionary to wwv_flow_dictionary_dev and wwv_flow_search to wwv_flow_builder_search_dev
--      pawolf    05/07/2014 - Added wwv_flow_dictionary_views.component_type_id
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_view is record (
    view_name             wwv_flow_dictionary_views.view_name            %type,
    component_type_id     wwv_flow_dictionary_views.component_type_id    %type,
    pk_column_name        wwv_flow_dictionary_views.pk_column_name       %type,
    display_expression    wwv_flow_dictionary_views.display_expression   %type,
    order_expression      wwv_flow_dictionary_views.order_expression     %type,
    parent_view_name      wwv_flow_dictionary_views.view_name            %type,
    parent_fk_column_name wwv_flow_dictionary_views.pk_column_name       %type,
    lookup_or_lov_columns wwv_flow_dictionary_views.lookup_or_lov_columns%type,
    order_seq             wwv_flow_dictionary_views.order_seq            %type,
    link_url              wwv_flow_dictionary_views.link_url             %type,
    has_page_id           boolean );
--
type t_view_map is table of t_view index by wwv_flow_dictionary_views.view_name%type;
--
--==============================================================================
-- Global constants
--==============================================================================
--
--
--==============================================================================
-- Global variables
--==============================================================================
g_view_map t_view_map;
--
--==============================================================================
-- Returns the primary key column for a dictionary view.
--==============================================================================
function get_primary_key_column (
    p_view_name in varchar2 )
    return varchar2;
--
--==============================================================================
-- Adds an object to the specified collection.
--==============================================================================
procedure add_to_result (
    p_collection_name   in varchar2,
    p_application_id    in number,
    p_view_name         in varchar2,
    p_primary_key_value in varchar2,
    p_column_name       in varchar2,
    p_c005              in varchar2 default null,
    p_c006              in varchar2 default null,
    p_c007              in varchar2 default null,
    p_c008              in varchar2 default null,
    p_n002              in number   default null,
    p_n003              in number   default null );
--
end wwv_flow_dictionary_dev;
/
show errors

set define '^'
