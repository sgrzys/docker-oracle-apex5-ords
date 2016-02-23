set define off verify off
prompt ...wwv_flow_pkg_app_log
create or replace package wwv_flow_pkg_app_log as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_pkg_app_log.plb
--
--    DESCRIPTION
--      API to log packaged application installations.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    07/09/2012 - Created (feature #992)
--     cneumuel 07/10/2012 - Added "set define '^'" to avoid install errors
--    hfarrell  03/14/2013 - Added build_version, app_locked, and installed_build_version to t_install_log record (bug #16500430)
--
--------------------------------------------------------------------------------

--
-- Global Variables
--

type t_install_log is record (
    log_key                 varchar2(32767),
    app_id                  number,
    app_type                varchar2(255),
    app_version             varchar2(255),
    build_version           number,
    installed_build_version number,
    app_locked              varchar2(1));
    
g_install_log t_install_log;

function start_log (
    p_log_event     in varchar2 default null,
    p_log_type      in varchar2 default null,
    p_started       in timestamp default null,
    p_ended         in timestamp default null) return number;
    
procedure end_log (
    p_id            in number);
    
end wwv_flow_pkg_app_log;
/
show error;
set define '^'
