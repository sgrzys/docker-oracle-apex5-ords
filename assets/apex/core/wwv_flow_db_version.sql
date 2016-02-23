set define '^' verify off
prompt ...wwv_flow_db_version
create or replace package wwv_flow_db_version as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_db_version.sql
--
--    DESCRIPTION
--      This package gives information about the current database version,
--      including the patch level (e.g. the last number in 11.2.0.2), which is
--      missing in dbms_db_version.
--
--      Because c_full_version is a varchar2 constant, this can not be used for
--      conditional compilation, however.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     cneumuel 04/26/2011 - Created
--     cneumuel 08/30/2013 - Added c_ver_le_12_1_0_1 (feature #1152)
--     cneumuel 04/29/2015 - Added c_ver_le_12_1_0_2 (bug #20931298)
--
--------------------------------------------------------------------------------

c_full_version    constant varchar2(4000) := sys.dbms_registry.release_version;

c_ver_le_11_2_0_1 constant boolean        := c_full_version < '11.2.0.2.';
c_ver_le_11_2_0_2 constant boolean        := c_full_version < '11.2.0.3.';
c_ver_le_12_1_0_1 constant boolean        := c_full_version < '12.1.0.2.';

end wwv_flow_db_version;
/
show errors
