
set define '^'
set verify off
prompt ...wwv_flow_region_tree

Rem NAME
Rem      tree.sql
Rem
Rem    SCRIPT ARGUMENTS
Rem      1:  
Rem      2:
Rem      3:  Flow Schema Owner
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   03/12/2001 - Created
Rem      mhichwa   03/13/2001 - Expanded
Rem      cbcho/mbp 07/30/2002 - Support for ID/PID using VARCHAR2

create or replace package wwv_flow_region_tree as 

--  Copyright (c) Oracle Corporation 2001. All Rights Reserved.
--
--    DESCRIPTION
--      Display a tree structure
--
--    SECURITY
--
--    NOTES
--      show_tree.p_id   = the globally unique ID of the tree identifies a tree to paint in the wwv_flow_trees table
--

procedure show_tree (
    p_id          in number,
    p_expand_id   in varchar2 default null,
    p_contract_id in varchar2 default null)
    ;

end wwv_flow_region_tree;
/
show errors

