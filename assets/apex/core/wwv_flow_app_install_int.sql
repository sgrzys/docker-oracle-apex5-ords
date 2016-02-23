set define '^' verify off
prompt ...wwv_flow_app_install_int.sql
create or replace package wwv_flow_app_install_int authid definer
$if sys.dbms_db_version.version >= 12 $then
accessible by (wwv_flow_imp_parser, wwv_flow_pkg_app_parser)
$end
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_app_install_int.sql
--
--    DESCRIPTION
--      Internal utilities for installing DB and Websheet applications, either
--      through GUI import or for installing packaged applications
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    03/28/2014 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- run this procedure to start the installation. it configures a internal
-- package state and locks down several portions of APEX, to prevent attacks
-- via manipulated import files.
--
-- SEE ALSO
--   end_install
--==============================================================================
procedure begin_install (
    p_parse_as_schema in varchar2,
    p_app_id          in number,
    p_workspace_id    in number default wwv_flow_security.g_security_group_id,
    p_offset          in number default null );

--==============================================================================
-- run this procedure after the installation, to reset package state and unlock
-- portions of APEX that have been locked down via begin_install.
--
-- SEE ALSO
--   begin_install
--==============================================================================
procedure end_install;

--==============================================================================
-- execute a code block as the install user. requires initialization via
-- begin_install first.
--==============================================================================
procedure run_block (
    p_code_block in varchar2 );
procedure run_block (
    p_code_block in sys.dbms_sql.varchar2a );

end wwv_flow_app_install_int;
/
show err

