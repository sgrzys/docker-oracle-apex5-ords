set define '^' verify off
prompt ...wwv_flow_pkg_app_parser
create or replace package wwv_flow_pkg_app_parser as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_pkg_app_parser.sql
--
--    DESCRIPTION
--      This package is used to parse packaged application template export and save parsed information during the first time of install for the instance.
--      It extracts lines of statements from a export clob and inserts them one line at a time into WWV_FLOW_PKG_APP_STMTS table.
--      Once parsed, packaged application uses parsed statements to execute instead of re-parsing.
--
--    MODIFIED  (MM/DD/YYYY)
--     cbcho     08/19/2013 - Created
--     cbcho     08/20/2013 - Changed pkg comment
--     cbcho     08/21/2013 - Added p_app_type in execute, parse_n_execute to add DATABASE and WEBSHEET specific logic
--     cbcho     08/22/2013 - Removed truncate_stmts
--
--------------------------------------------------------------------------------

--
-- checks whether the packaged application has been parsed or not
--     p_app_id is the packaged application ID, i.e. 7240
--
function parsed (p_app_id in number) return boolean;

--
-- execute using parsed information
--
procedure execute (
    p_app_type         in varchar2, -- DATABASE or WEBSHEET
    p_old_app_id       in number,   -- original app_id contained in export
    p_new_app_id       in number,   -- install as app_id
    p_parse_as_schema  in varchar2 default null
    );

--
-- parse application export and execute using the parsed information
--    
procedure parse_n_execute (
    p_file_id          in number,
    p_app_type         in varchar2, -- DATABASE or WEBSHEET
    p_old_app_id       in number,   -- original app_id contained in export
    p_new_app_id       in number,   -- install as app_id
    p_parse_as_schema  in varchar2 default null
    );
    
end wwv_flow_pkg_app_parser;
/

show errors
