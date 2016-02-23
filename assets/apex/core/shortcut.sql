set define '^' verify off
prompt ...wwv_flow_render_shortcut
create or replace package wwv_flow_render_shortcut as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2000 - 2012. All Rights Reserved.
--
--    NAME
--      shortcut.sql
--
--    DESCRIPTION
--      Substitucte shortcuts in HTML text
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    SCRIPT ARGUMENTS
--      1:
--      2:
--      3:  Flow Schema Owner
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--      mhichwa  09/04/2000 - Created
--      mhichwa  03/02/2001 - Added grant to public as well as public syn
--      jkallman 12/16/2009 - Change wwv_flow_render_shortcut.do_sortcuts_exist to wwv_flow_render_shortcut.do_shortcuts_exist
--      cneumuel 08/08/2012 - Moved package global l_shortcut to body of expand_shortcuts
--
--------------------------------------------------------------------------------

function do_shortcuts_exist (
    p_string       in varchar2)
    return boolean
    ;

function expand_shortcuts (
    p_string       in varchar2)
    return varchar2
    ;
end wwv_flow_render_shortcut;
/
show errors


grant execute on wwv_flow_render_shortcut to public
/
