set define '^'

set verify off
prompt ...wwv_flow_developer_toolbar
create or replace package wwv_flow_developer_toolbar
is
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_developer_toolbar.plb
--
--    DESCRIPTION
--      This package is responsible for showing the developer toolbar.
--
--    MODIFIED   (MM/DD/YYYY)
--    sspadafo    06/20/2003 - Created
--    pawolf      04/04/2011 - Added get_inline_edit and show_inline_edit
--    pawolf      12/11/2013 - Added add_component, removed get_inline_edit and show_inline_edit
--    pawolf      12/12/2013 - Added p_page_id to add_component
--
--------------------------------------------------------------------------------
--
g_ok_to_show_toolbar boolean := false;
--
procedure show_toolbar;
--
procedure add_component (
    p_type_id in number,
    p_page_id in number,
    p_id      in number,
    p_dom_id  in varchar2 );
--
end wwv_flow_developer_toolbar;
/
show errors
