
Rem  Copyright (c) Oracle Corporation 2011. All Rights Reserved.
Rem
Rem    NAME
Rem      types.sql
Rem
Rem    DESCRIPTION
Rem      Object types used by Oracle APEX packages.
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    pawolf      05/02/2011 - Created (moved object types from tab.sql and flowu.sql)
Rem    cneumuel    04/26/2013 - renamed vc4000array to wwv_flow_t_varchar2
Rem    cneumuel    05/22/2013 - Added wwv_flow_t_number
Rem    cneumuel    10/31/2013 - Added wwv_flow_t_ldap_attribute, wwv_flow_t_ldap_attributes (feature #3)
Rem    jstraub     03/27/2015 - Removed force keyword from wwv_flow_t_ldap_attribute, not valid syntax for 11.1 (bug 20783772)

set define '^'

--------------------------------------------------------------------------------
-- T R E E S
--------------------------------------------------------------------------------

-- These types define tree entries and arrays of these entries. The array of
-- tree entries represents a list of sub-tree entries.

prompt creating object type wwv_flow_tree_entry

create or replace type wwv_flow_tree_entry as object
( seq      number,
  lev      number,
  id       varchar2(4000),
  pid      varchar2(4000),
  kids     number,
  expand   varchar2(1),
  indent   varchar2(4000),
  name     varchar2(4000),
  link     varchar2(4000),
  a1       varchar2(4000),
  a2       varchar2(4000) )
/

prompt creating object type wwv_flow_tree_subs

create or replace type wwv_flow_tree_subs as table of wwv_flow_tree_entry not null;
/

prompt creating object type wwv_flow_tree_num_arr

create or replace type wwv_flow_tree_num_arr as table of number not null
/

--------------------------------------------------------------------------------
-- Object types used in flowu.sql
--------------------------------------------------------------------------------

prompt creating object type wwv_flow_t_varchar2

create or replace type wwv_flow_t_varchar2 as table of varchar2(32767)
/

prompt creating object type wwv_flow_t_number

create or replace type wwv_flow_t_number as table of number
/

prompt creating object type t_temp_lov_value

create or replace type t_temp_lov_value is object (
    insert_order number,
    disp         varchar2(4000),
    val          varchar2(4000) )
/

prompt creating object type t_temp_lov_data

create or replace type t_temp_lov_data is table of t_temp_lov_value
/

--##############################################################################
--#
--# TYPES FOR APEX_LDAP
--#
--##############################################################################

create or replace type wwv_flow_t_ldap_attribute is object (
    dn   varchar2(4000),
    name varchar2(4000),
    val  varchar2(4000)
)
/
show err
create or replace type wwv_flow_t_ldap_attributes is table of wwv_flow_t_ldap_attribute
/
show err

prompt ...done create object types
