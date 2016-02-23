set define '^'
set verify off


prompt ...wwv_flow_tree

Rem    NAME
Rem      tree3.sql
Rem
Rem    SCRIPT ARGUMENTS
Rem      1:
Rem      2:
Rem      3:
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mbpierma  04/12/2001 - Created
Rem      mbpierma  04/12/2001 - Changed spec to expand, contract, and build
Rem      mbpierma  04/12/2001 - Removed the package variables from the spec
Rem      mbpierma  04/12/2001 - Added 'EXPAND' column to table & object
Rem      mbpierma  04/12/2001 - Renamed 'INDT' to 'INDENT' in the table & object
Rem      mbpierma  04/17/2001 - Removed parameters for anchor tags (not used)
Rem      mbpierma  04/17/2001 - Added RESET() procedure to clear state
Rem      mbpierma  04/20/2001 - Added some more global package state variables
Rem      mbpierma  01/18/2002 - Added TREE_ID to WWV_FLOW_TREE_STATE$PK
Rem      cbcho/mbp 07/30/2002 - Support for ID/PID using VARCHAR2
Rem      mbpierma  12/16/2002 - Added code to support expand/contract all
Rem       jstraub  03/25/2003 - Moved table and type ddl to tab.sql
Rem      pawolf    11/24/2010 - Replaced temporary table wwv_flow_temp_trees with a PL/SQL collection


-- ****************************************************************************
-- This stub package holds the current subordinate list for the tree builder.
-- We have to use DBMS_SQL to allow for running code as a different user. But,
-- DBMS_SQL doesn't allow for returning of oracle object types. So, we have the
-- code run by DBMS_SQL to set this state in this package. Callers will have to
-- pick up their results in this package. A decent workaround suggested by Tom!
-- The max_level is set after building a tree and the error tree is non-null if
-- we encountered an error while building a tree.
-- ****************************************************************************
create or replace package wwv_flow_tree_global_vars
as
  g_subs          wwv_flow_tree_subs;
  g_max_level     number;
  g_error         varchar2(32767);
  g_expand_all    boolean := false;
  g_contract_all  boolean := false;
end wwv_flow_tree_global_vars;
/
show errors


-- ****************************************************************************
-- Grant execute on these things so any code executed by RUN_BLOCK2 can work.
-- ****************************************************************************
grant execute on wwv_flow_tree_subs to public
/
grant execute on wwv_flow_tree_entry to public
/
grant execute on wwv_flow_tree_global_vars to public
/
-- ****************************************************************************
--
--
--
-- ****************************************************************************
create or replace package wwv_flow_tree
as

--  Copyright (c) Oracle Corporation 2001. All Rights Reserved.
--
--    DESCRIPTION
--      Tree control
--
--    SECURITY
--      Private to flows
--
--    NOTES
--
--    RUNTIME DEPLOYMENT: YES
--

  function build (
    p_tree_id                  in number,
    p_query                    in varchar2,
    p_top_id                   in varchar2,
    p_max_level                in integer default 5,
    p_order_by                 in varchar2 default null,
    p_unexpanded_parent        in varchar2 default '|+-',
    p_unexpanded_parent_last   in varchar2 default '`+-',
    p_expanded_parent          in varchar2 default '|=-',
    p_expanded_parent_last     in varchar2 default '`=-',
    p_leaf_node                in varchar2 default '|--',
    p_leaf_node_last           in varchar2 default '`--',
    p_indent_vertical_line     in varchar2 default '|  ',
    p_indent_space             in varchar2 default '   ')
    return wwv_flow_tree_subs;

  procedure expand(
    p_tree_id     in number,
    p_id          in varchar2);

  procedure contract(
    p_tree_id       in number,
    p_id            in varchar2);

  procedure reset(
    p_tree_id  in number);
end wwv_flow_tree;
/
show error
