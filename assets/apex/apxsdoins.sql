set define '^' verify off
prompt ...apxsdoins.sql
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      apxsdoins.sql
--
--    REQUIREMENTS
--      - This script has to be executed as SYS
--      - The spatial objects has to exist in the database
--
--    SYNOPSIS
--      sqlplus / as sysdba @apxsdoins APEX_050000 /path/to/apex/
--      sqlplus / as sysdba @apxsdoins APEX_050000 ""
--
--    ARGUMENTS
--      1 .... the APEX schema name
--      2 .... relative path to the APEX directory terminated by "/", or null
--
--    DESCRIPTION
--      Install script for APEX spatial (SDO) extensions. You have to run the
--      script as SYS, with the APEX schema and the path to the APEX
--      installation directory as parameters. The script will raise errors if
--      the logon user is not SYS or if the spatial option is not installed.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    12/13/2013 - Created
--    cneumuel    01/14/2014 - callable from coreins.sql
--    cneumuel    07/02/2014 - Added direct grants on objects that are normally available to public
--
--------------------------------------------------------------------------------
define APPUN=^1
define PREFIX=^2

alter session set current_schema=^APPUN;

--==============================================================================
-- grant privileges on spatial objects to apex
--==============================================================================
grant execute on mdsys.mderr                                  to ^APPUN;
grant execute on mdsys.sdo_dim_array                          to ^APPUN;
grant execute on mdsys.sdo_dim_element                        to ^APPUN;
grant execute on mdsys.sdo_elem_info_array                    to ^APPUN;
grant execute on mdsys.sdo_geometry                           to ^APPUN;
grant execute on mdsys.sdo_meta                               to ^APPUN;
grant execute on mdsys.sdo_ordinate_array                     to ^APPUN;
grant execute on mdsys.sdo_point_type                         to ^APPUN;
grant execute on mdsys.sdo_util                               to ^APPUN;
grant select, insert, delete on mdsys.sdo_geom_metadata_table to ^APPUN;
grant select on mdsys.user_sdo_index_info                     to ^APPUN;

--==============================================================================
-- install spatial utilities
--==============================================================================
@^PREFIX.core/wwv_flow_spatial_int.sql
@^PREFIX.core/wwv_flow_spatial_int.plb
@^PREFIX.core/wwv_flow_spatial_api.sql
@^PREFIX.core/wwv_flow_spatial_api.plb

--==============================================================================
-- publish API
--==============================================================================
create or replace public synonym apex_spatial for ^APPUN..wwv_flow_spatial_api;
grant execute on  ^APPUN..wwv_flow_spatial_api to public;
