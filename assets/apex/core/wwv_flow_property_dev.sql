set define off
set verify off

prompt ...wwv_flow_property_dev

create or replace package wwv_flow_property_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_property_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling properties in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    05/16/2013 - Created
--      pawolf    05/27/2013 - Continue
--      pawolf    11/24/2013 - Added emit_distinct_values
--      pawolf    11/25/2013 - Added emit_pages and emit_page_items
--      pawolf    11/26/2013 - Added emit_db_objects
--      pawolf    11/28/2013 - Added write_page_data
--      pawolf    12/12/2013 - Added lock_page and unlock_page
--      arayner   01/10/2014 - Added p_include_global to emit_pages
--      arayner   01/20/2014 - Tidied emit_pages
--      pawolf    01/28/2014 - Added emit_map_regions
--      pwolf     05/21/2014 - In emit_map_regions: Added support to just query one record by id
--      arayner   06/09/2014 - Added set_preference
--      pawolf    10/31/2014 - In emit_pages: added p_filter_type and p_filter_id
--      pawolf    12/09/2014 - Changed emit_static_data and emit_shared_components to use a pre-generated file for static data (feature #1623)
--      pawolf    12/19/2014 - In write_page_data: changed p_data to an array instead of a CLOB (bug #20077254)
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


--==============================================================================
-- Emit a JSON structure which contains the static component type and property
-- data.
 --==============================================================================
procedure emit_static_data (
    p_write_to_clob in boolean default false );
--
--==============================================================================
-- Emit a JSON structure which contains the shared components of an application.
--==============================================================================
procedure emit_shared_component_data (
    p_application_id in number );
--
--==============================================================================
-- Emit a JSON structure which contains the page components of an application.
--==============================================================================
procedure emit_page_data (
    p_application_id in number,
    p_page_id        in number );
--
--==============================================================================
-- Returns the following JSON structure with the distinct values of the
-- specified property.
--
-- [ "string1", "string2", ... ]
--
--==============================================================================
procedure emit_distinct_values (
    p_application_id    in number,
    p_component_type_id in number,
    p_property_id       in number );
--
--==============================================================================
-- Returns the following JSON structure with the page items of the specified
-- page.
--
-- { "ITEM_NAME1": "label",
--   "ITEM_NAME2": "label",
-- ... }
--
--==============================================================================
procedure emit_page_items (
    p_application_id in number,
    p_page_id        in number );
--
--==============================================================================
-- Returns the following JSON structure with the pages of the specified application.
--
-- [ { id: "number", name: "string", title: "string", userInterfaceId: "number", mode: "string", groupId: "number" },
--   { id: "number", name: "string", title: "string", userInterfaceId: "number", mode: "string", groupId: "number" },
-- ... ]
--
--==============================================================================
procedure emit_pages (
    p_application_id in number,
    p_include_global in boolean  default false,
    p_filter_type    in varchar2 default null,
    p_filter_id      in number   default null );
--
--==============================================================================
-- Returns the following JSON structure with the map regions of the specified map file path.
--
-- [ { id: "number", name: "string" },
--   { id: "number", name: "string" },
-- ... ]
--
--==============================================================================
procedure emit_map_regions (
    p_map_file_path in varchar2,
    p_id            in number );
--
--==============================================================================
-- Returns the following JSON structure with the database objects specified.
--
-- [ { name: "string", comment: "string" },
--   { name: "string", comment: "string" },
-- ... ]
--
--==============================================================================
procedure emit_db_objects (
    p_application_id in number,
    p_type           in varchar2,
    p_owner          in varchar2,
    p_include_public in boolean );
--
--==============================================================================
-- Returns the following JSON structure with new component ids.
--
-- [ "new component id1", "new component id2", ... ]
--
--==============================================================================
procedure emit_new_component_id (
    p_count in pls_integer default 1 );
--
--==============================================================================
-- Validates p_value based on the property type specified. The result is returned
-- with the following JSON structure:
--
-- { "result": "OK/<error returned",
--   "columns: [{ "name": "<name of column>", "type": "<data type of column>" }]
-- }
--
-- "columns" is only populated if the statement was valid and the property type
-- is SQL or TABLE
--
--==============================================================================
procedure validate_browser_property (
    p_application_id       in number,
    p_property_id          in number      default null,
    p_property_type        in varchar2,
    p_sql_min_column_count in pls_integer default 1,
    p_sql_max_column_count in pls_integer default null,
    p_value1               in varchar2,
    p_value2               in varchar2 );
--
--==============================================================================
-- todo
--==============================================================================
procedure write_page_data (
    p_application_id in number,
    p_page_id        in number,
    p_data           in wwv_flow_global.vc_arr2 );
--
--==============================================================================
-- Locks or updates an existing page lock. The result is returned
-- with the following JSON structure:
--
-- { isUserOwner: true,   // only emitted in case of true
--   owner:   "<string>", // only emitted if isUserOwner = flase
--   on:      "<string">,
--   comment: "<string>"
-- }
--
--==============================================================================
procedure lock_page (
    p_application_id in number,
    p_page_id        in number,
    p_comment        in varchar2 );
--
--==============================================================================
-- Unlocks the current page lock. The result is returned
-- with the following JSON structure:
--
-- { status: "OK" / "FAILED",
--   reason: "<error>"
-- }
--
--==============================================================================
procedure unlock_page (
    p_application_id in number,
    p_page_id        in number );
--
--==============================================================================
-- Sets a preference
-- Preference name and value must be whitelisted in procedure implementation
--
--==============================================================================
procedure set_preference (
    p_preference_name   in varchar2,
    p_preference_value  in varchar2 );
--
end wwv_flow_property_dev;
/
show errors

set define '^'
