set define '^' verify off
prompt ...wwv_flow_spatial_api.sql
create or replace package wwv_flow_spatial_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_spatial_api.sql ( APEX_SPATIAL )
--
--    DESCRIPTION
--      This package enables you to use Oracle Locator and the Spatial Option
--      within Application Express.
--
--      In an Application Express context, the logon user of the database
--      session is typically APEX_PUBLIC_USER or ANONYMOUS. Spatial developers
--      can not directly use DML on USER_SDO_GEOM_METADATA within such a
--      session, e.g. in SQL Workshop > SQL Commands. The Spatial view's
--      trigger performs DML as the logon user, but it has to run as the
--      application owner / workspace user. With the APEX_SPATIAL API,
--      developers can use the procedures and functions below to insert, update
--      and delete rows of USER_SDO_GEOM_METADATA as the current Application
--      Express user. The package also provides a few utilities that simplify
--      the use of Spatial in Application Express.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    12/12/2013 - Created
--    cneumuel    12/16/2013 - In insert_geom_metadata: added p_create_index_name
--    cneumuel    12/18/2013 - Added point, rectangle, circle_polygon
--    cneumuel    12/19/2013 - In geometry functions: removed deterministic clause (bug #17980025)
--    cneumuel    04/29/2014 - Added documentation
--
--------------------------------------------------------------------------------

--==============================================================================
-- Spatial Reference system (i.e. coordinate system) IDentifiers. See
-- SDO_COORD_REF_SYS for available reference systems.
--==============================================================================
subtype t_srid is number;
c_no_reference_system constant t_srid := null;
c_wgs_84              constant t_srid := 4326; -- World Geodetic System, EPSG:4326

--##############################################################################
--#
--# GEOMETRY METADATA AND SPATIAL INDEXES
--#
--##############################################################################

--==============================================================================
-- Insert a spatial metadata record and optionally create a spatial index.
--
-- ARGUMENTS
-- * p_table_name        name of a feature table
-- * p_column_name       name of the column of type mdsys.sdo_geometry
-- * p_diminfo           SDO_DIM_ELEMENT array, ordered by dimension, with one entry for each dimension
-- * p_srid              SRID value for the coordinate system for all geometries in the column
-- * p_create_index_name if not null, a spatial index on the column will be
--                       created with this name. only simple column names are
--                       supported, function based indexes or indexes on object
--                       attributes will cause an error. for more complex
--                       requirements, leave this parameter null (the default)
--                       and manually create the index.
--
-- EXAMPLE
--   Create table CITIES, spatial metadata and an index on column CITIES.SHAPE.
--
--   create table cities (
--       city_id   number primary key,
--       city_name varchar2(30),
--       shape     mdsys.sdo_geometry )
--   /
--   begin
--       apex_spatial.insert_geom_metadata (
--           p_table_name   => 'CITIES',
--           p_column_name  => 'SHAPE',
--           p_diminfo     => SDO_DIM_ARRAY (
--                                SDO_DIM_ELEMENT('X', -180, 180, 1),
--                                SDO_DIM_ELEMENT('Y',  -90,  90, 1) ),
--           p_srid        => apex_spatial.c_wgs_84 );
--   end;
--   /
--   create index cities_idx_shape on cities(shape) indextype is mdsys.spatial_index
--   /
--==============================================================================
procedure insert_geom_metadata (
    p_table_name        in varchar2,
    p_column_name       in varchar2,
    p_diminfo           in mdsys.sdo_dim_array,
    p_srid              in t_srid,
    p_create_index_name in varchar2 default null );

--==============================================================================
-- Insert a spatial metadata record that is suitable for longitude/latitude and
-- optionally create a spatial index.
--
-- ARGUMENTS
-- * p_table_name        name of a feature table
-- * p_column_name       name of the column of type mdsys.sdo_geometry
-- * p_tolerance         tolerance value in each dimension, in meters (default 1)
-- * p_create_index_name if not null, a spatial index on the column will be
--                       created with this name. only simple column names are
--                       supported, function based indexes or indexes on object
--                       attributes will cause an error. for more complex
--                       requirements, leave this parameter null (the default)
--                       and manually create the index.
--
-- EXAMPLE
--   Create table CITIES and spatial metadata on column CITIES.SHAPE. By
--   passing 'CITIES_IDX_SHAPE' to p_create_index_name, the API call
--   automatically creates an index on the spatial column.
--
--   create table cities (
--       city_id   number primary key,
--       city_name varchar2(30),
--       shape     mdsys.sdo_geometry )
--   /
--   begin
--       apex_spatial.insert_geom_metadata_lonlat (
--           p_table_name        => 'CITIES',
--           p_column_name       => 'SHAPE',
--           p_create_index_name => 'CITIES_IDX_SHAPE' );
--   end;
--   /
--==============================================================================
procedure insert_geom_metadata_lonlat (
    p_table_name        in varchar2,
    p_column_name       in varchar2,
    p_tolerance         in number default 1,
    p_create_index_name in varchar2 default null );

--==============================================================================
-- Modify a spatial metadata record
--
-- ARGUMENTS
-- * p_table_name      name of a feature table
-- * p_column_name     name of the column of type mdsys.sdo_geometry
-- * p_new_table_name  new name of a feature table (or null, to keep the current value)
-- * p_new_column_name new name of the column of type mdsys.sdo_geometry (or null, to keep the current value)
-- * p_diminfo         SDO_DIM_ELEMENT array, ordered by dimension, with one entry for each dimension
-- * p_srid            SRID value for the coordinate system for all geometries in the column
--
-- EXAMPLE
--   The code below modifies the dimensions of column CITIES.SHAPE.
--
--   begin
--       for l_meta in ( select *
--                         from user_sdo_geom_metadata
--                        where table_name  = 'CITIES'
--                          and column_name = 'SHAPE' )
--       loop
--           apex_spatial.change_geom_metadata (
--               p_table_name  => l_meta.table_name,
--               p_column_name => l_meta.column_name,
--               p_diminfo     => SDO_DIM_ARRAY (
--                                    SDO_DIM_ELEMENT('X', -180, 180, 0.1),
--                                    SDO_DIM_ELEMENT('Y',  -90,  90, 0.1) ),
--               p_srid        => l_meta.srid );
--      end loop;
--   end;
--==============================================================================
procedure change_geom_metadata (
    p_table_name      in varchar2,
    p_column_name     in varchar2,
    p_new_table_name  in varchar2 default null,
    p_new_column_name in varchar2 default null,
    p_diminfo         in mdsys.sdo_dim_array,
    p_srid            in t_srid );

--==============================================================================
-- Delete a spatial metadata record
--
-- ARGUMENTS
-- * p_table_name      name of a feature table
-- * p_column_name     name of the column of type mdsys.sdo_geometry
-- * p_drop_index      if true (default is false), drop the spatial index on the column
--
-- EXAMPLE
--   Delete metadata on column CITIES.SHAPE and drop the spatial index on this
--   column.
--
--   begin
--       apex_spatial.delete_geom_metadata (
--           p_table_name  => 'CITIES',
--           p_column_name => 'SHAPE',
--           p_drop_index  => true );
--   end;
--==============================================================================
procedure delete_geom_metadata (
    p_table_name  in varchar2,
    p_column_name in varchar2,
    p_drop_index  in boolean default false );

--##############################################################################
--#
--# GEOMETRY UTILITIES
--#
--##############################################################################

--==============================================================================
-- create a point at (p_lon, p_lat)
--
-- ARGUMENTS
-- * p_lon             longitude position
-- * p_lat             latitude position
-- * p_srid            reference system (default c_wgs_84)
--
-- RETURNS
-- * geometry for the point
--
-- EXAMPLE
--   Query that returns a point at (10, 50).
--
--   select apex_spatial.point(10, 50) from dual;
--
--   This is equivalent to:
--
--   select mdsys.sdo_geometry(2001, 4326, sdo_point_type(10, 50, null), null, null) from dual;
--==============================================================================
function point (
    p_lon    in number,
    p_lat    in number,
    p_srid in t_srid default c_wgs_84 )
    return mdsys.sdo_geometry;

--==============================================================================
-- create a rectangle from (p_lon1, p_lat1) to (p_lon2, p_lat2)
--
-- ARGUMENTS
-- * p_lon1            longitude of the lower left point
-- * p_lat1            latitude of the lower left point
-- * p_lon2            longitude of the upper right point
-- * p_lat2            latitude of the upper right point
-- * p_srid            reference system (default c_wgs_84)
--
-- RETURNS
-- * geometry for the rectangle (p_lon1, p_lon2, p_lon2, p_lat2)
--
-- EXAMPLE
--   Query that returns a rectangle from (10, 50) to (11, 51).
--
--   select apex_spatial.rectangle(10, 50, 11, 51) from dual
--
--   This is equivalent to:
--
--   select mdsys.sdo_geometry(
--              2003, 4326, null,
--              sdo_elem_info_array(1, 1003, 1),
--              sdo_ordinate_array(10, 50, 11, 50, 11, 51, 10, 51, 10, 50))
--   from dual;
--==============================================================================
function rectangle (
    p_lon1   in number,
    p_lat1   in number,
    p_lon2   in number,
    p_lat2   in number,
    p_srid in t_srid default c_wgs_84 )
    return mdsys.sdo_geometry;

--==============================================================================
-- create a polygon that approximates a circle at (p_lon, p_lat) with radius
-- p_radius. see mdsys.sdo_util.circle_polygon for details.
--
-- ARGUMENTS
-- * p_lon             longitude of center point
-- * p_lat             latitude of center point
-- * p_radius          radius of the circle in meters
-- * p_arc_tolerance   arc tolerance (default 20)
-- * p_srid            reference system (default c_wgs_84)
--
-- RETURNS
-- * geometry for the polygon which approximates the circle
--
-- EXAMPLE
--   Query that returns a polygon which approximates a circle at (0, 0) with
--   radius 1.
--
--   select apex_spatial.circle_polygon(0, 0, 1) from dual
--
-- SEE ALSO
--   mdsys.sdo_util.circle_polygon
--==============================================================================
function circle_polygon (
    p_lon           in number,
    p_lat           in number,
    p_radius        in number,
    p_arc_tolerance in number default 20,
    p_srid          in t_srid default c_wgs_84 )
    return mdsys.sdo_geometry;

end wwv_flow_spatial_api;
/
show err
