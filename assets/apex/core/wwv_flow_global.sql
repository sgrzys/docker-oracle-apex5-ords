set define '^' verify off
prompt ...wwv_flow_global.sql
create or replace package wwv_flow_global as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_global.sql
--
--    DESCRIPTION
--      Application Express global package variables.
--
--    NOTES
--      Allows sharing of data within a session that does not belong to any given package.
--      Includes type declaration(s).
--
--      Any change to this file must also be replicated in the same file in cloud/apex_patches.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    08/04/1999 - Created
--     mhichwa    03/18/2003 - Added n_arr (bug 2845535)
--     jkallman   09/22/2005 - Added g_xe
--     jkallman   09/27/2005 - Change g_xe to be boolean
--     jkallman   02/06/2007 - Change g_image_prefix to use wwv_flow_image_prefix
--     jkallman   01/14/2010 - Added d_arr
--     pawolf     01/21/2010 - Added vc_map
--     jstraub    01/13/2012 - Added g_cloud
--     jstraub    05/31/2012 - Added g_12c
--     pawolf     06/05/2012 - Added b_arr
--     vuvarov    04/05/2013 - Moved from flowg.sql to wwv_flow_global.sql
--     cneumuel   05/05/2015 - Added t_dbms_id, t_dbms_quoted_id (bug #21031940)
--     cneumuel   05/08/2015 - Added c_dbms_id_length (bug #21031940)
--     cneumuel   05/11/2015 - Removed sqlplus parameter for g_xe, because the file was always called with a 0 value. If needed, the value should be determined via v$instance.edition instead.
--
--------------------------------------------------------------------------------

--==============================================================================
g_v255_result       varchar2(255) := null;
g_v1_result         varchar2(1)   := null;
g_image_prefix      constant varchar2(255) := wwv_flow_image_prefix.g_image_prefix;
g_xe                boolean := false;

g_cloud             constant boolean := false;

$if sys.dbms_db_version.ver_le_10_2 $then
    g_12c           constant boolean := false;
$elsif sys.dbms_db_version.ver_le_11_1 $then
    g_12c           constant boolean := false;
$elsif sys.dbms_db_version.ver_le_11_2 $then
    g_12c           constant boolean := false;
$else
    g_12c           constant boolean := true;
$end

$if sys.dbms_db_version.version >= 12 $then
subtype             t_dbms_id        is dbms_id;
subtype             t_dbms_quoted_id is dbms_quoted_id;
subtype             t_dbms_id_128    is dbms_id_128;
$if sys.dbms_db_version.version = 12 and sys.dbms_db_version.release = 1 $then
c_dbms_id_length    constant pls_integer := 30;
$else
c_dbms_id_length    constant pls_integer := 128;
$end
$else
subtype             t_dbms_id        is varchar2(30);
subtype             t_dbms_quoted_id is varchar2(32);
subtype             t_dbms_id_128    is varchar2(128);
c_dbms_id_length    constant pls_integer := 30;
$end

--==============================================================================
type vc_map  is table of varchar2(32767) index by varchar2(255);
type vc_arr2 is table of varchar2(32767) index by binary_integer;
type n_arr   is table of number          index by binary_integer;
type d_arr   is table of date            index by binary_integer;
type b_arr   is table of boolean         index by binary_integer;

end wwv_flow_global;
/
show err
