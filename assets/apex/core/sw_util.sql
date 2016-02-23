set define '^' verify off
prompt sw_util.sql
create or replace package wwv_flow_sw_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2002 - 2013. All Rights Reserved.
--
--    NAME
--      sw_util.sql
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      msewtz   01/13/2002 - Created
--      tmuth    01/14/2002 - Added is_reserved and modified is_valid_name to call it
--      msewtz   01/15/2002 - Added table and sequence name to run_sql for DDL rollback
--      msewtz   01/16/2002 - Added run option to get_ddl
--     jstraub   02/12/2003 - Added get_altertable_ddl
--     jstraub   02/12/2003 - Added run_altertable_sql
--     jstraub   02/13/2003 - Added get_index_ddl, get_row_cnt, get_trigger2_ddl, get_copytbl_ddl
--     msewtz    02/25/2003 - bug 2819189: added create package procedure
--     jstraub   02/25/2003 - bug 2805569: added get_sequence_ddl, get_synonym_ddl
--     jstraub   02/26/2003 - Added get_drop_ddl for bug 2821625
--     msewtz    02/26/2003 - bug 2819189: added table_exists function
--     jstraub   02/27/2003 - Added get_view_ddl for bug 2824356
--     jstraub   02/27/2003 - Altered run_other_sql to return sql error messages properly, bug 2825170
--     jstraub   02/27/2003 - Added get_package_ddl and get_packagebody_ddl for bug 2824361
--     cbcho     05/13/2003 - Added is_wrapped function for bug 2815860
--     cbcho     05/29/2003 - Added is_pk function for bug 2939357
--     cbcho     06/20/2003 - Added procedure get_object_info
--     msewtz    07/07/2003 - Added p_owner to is_available_name (bug 3036313)
--     jstraub   06/22/2004 - Added get_dblink_ddl for create database link feature
--     jstraub   06/23/2004 - Removed p_preserve from get_dblink_ddl, doesn't make sense for dblink
--     cbcho     08/05/2004 - Added function is_database_reserved_word
--     skutz     03/02/2005 - changed signature for get_dll function
--     skutz     04/25/2005 - exposed get_foreign_key_ddl for create table wizard
--     skutz     05/22/2005 - exposed is_available_name2 for name validation by oracle namespace
--     sspadafo  11/16/2005 - Added run_block and run_ddl for callers who need the UseLogonRoles version
--     jstraub   12/05/2007 - Added show_plsql_edit
--     pawolf    03/11/2009 - Bug# 8289805: Added get_altertable_column_ddl
--     hfarrell  04/05/2011 - Fix for bug 7048187: replaced all occurrences of varchar2s with varchar2a
--     cneumuel  04/17/2012 - Prefix sys objects with schema (bug #12338050)
--     jstraub   07/09/2012 - Added p_identity parameter to get_altertable_column_ddl
--     jstraub   02/19/2013 - Added get_data_redaction_ddl
--     jstraub   04/03/2013 - Added p_enabled to get_data_redaction_ddl
--     cneumuel  07/12/2013 - Removed run_ddl
--     cneumuel  08/08/2014 - In generate_seq_name, generate_pk_name: added p_owner, removed p_cnt
--
--------------------------------------------------------------------------------

    function get_pk_position (
      p_table_owner in varchar2,
      p_table_name  in varchar2,
      p_column_name in varchar2
      )
    return number;

    function is_wrapped (
      p_owner  in varchar2,
      p_object in varchar2,
      p_type   in varchar2
      )
    return boolean;

    function is_reserved(
      p_word in varchar2)
    return boolean;

    function is_valid_name (
      p_name in varchar2
    ) return boolean;

    function is_database_reserved_word(
      p_word in varchar2)
    return boolean;

    function table_exists (
      p_name in varchar2,
      p_owner in varchar2
    ) return boolean;

    function is_available_name (
      p_name in varchar2,
      p_owner in varchar2
    ) return boolean;

    function is_available_name2 (
      p_name in varchar2,
      p_owner in varchar2,
      p_type in varchar2
    ) return boolean;

    function pick_pk (
      p_collection_name in varchar2
    ) return varchar2;

    function generate_name (
      p_owner  in varchar2,
      p_name   in varchar2,
      p_suffix in varchar2
    ) return varchar2;

    function generate_pk_name (
      p_owner in varchar2,
      p_name  in varchar2
    ) return varchar2;

    function generate_seq_name (
      p_owner in varchar2,
      p_name  in varchar2
    ) return varchar2;

    procedure run_block(
      p_sql  in varchar2,
      p_user in varchar2 );

    function get_altertable_ddl(
      p_table_name varchar2,
      p_action     varchar2,
      p_con_claus  varchar2,
      p_col_claus  varchar2
    ) return varchar2;

   --
   -- Returns the alter table statement to add/modify a column.
   -- Valid values for p_action are add and modify.
   --
   function get_altertable_column_ddl(
       p_owner       in varchar2,
	   p_table_name  in varchar2,
	   p_column_name in varchar2,
	   p_data_type   in varchar2,
	   p_length      in number,
	   p_precision   in number,
	   p_scale       in number,
	   p_null        in varchar2,
	   p_identity    in varchar2,
	   p_action      in varchar2
   ) return varchar2;

   function get_trigger2_ddl(
      p_table_name in varchar2,
      p_action     in varchar2,
      p_trigger_nm in varchar2,
      p_when       in varchar2,
      p_operations in varchar2,
      p_for_each   in varchar2,
      p_body       in varchar2,
      p_col        in varchar2,
      p_col_when   in varchar2
   ) return varchar2;

   function get_index_ddl(
      p_table_name in varchar2,
      p_index_name in varchar2,
      p_action     in varchar2,
      p_unique     in varchar2,
      p_col1       in varchar2,
      p_col2       in varchar2,
      p_col3       in varchar2,
      p_col4       in varchar2,
      p_indextype  in varchar2
   ) return varchar2;

   function get_copytbl_ddl(
      p_table_name in varchar2,
      p_cp_table   in varchar2,
      p_columns    in varchar2,
      p_where      in varchar2
   ) return varchar2;

   function get_row_cnt(
      p_schema     in varchar2,
      p_table_name in varchar2
   ) return varchar2;

   function get_analyze_ddl(
      p_table_name  in varchar2,
      p_action      in varchar2,
      p_est_claus   in varchar2
   ) return varchar2;

   function get_function_ddl(
      p_func_name   in varchar2,
      p_arguments   in varchar2,
      p_return      in varchar2,
      p_body        in varchar2
   ) return varchar2;

   function get_sequence_ddl(
      p_seq_name    in varchar2,
      p_start       in varchar2 default null,
      p_increment   in varchar2 default null,
      p_max         in varchar2 default null,
      p_min         in varchar2 default null,
      p_cache       in varchar2 default null,
      p_cycle       in varchar2 default null,
      p_order       in varchar2 default null
   ) return varchar2;

   function get_dblink_ddl(
      p_link_name   in varchar2,
      p_schema      in varchar2,
      p_password    in varchar2,
      p_host        in varchar2,
      p_host_port   in varchar2,
      p_sid_or_serv in varchar2,
      p_sid_name    in varchar2
   ) return varchar2;

   function get_synonym_ddl(
      p_syn_name    in varchar2,
      p_type        in varchar2,
      p_schema_to   in varchar2,
      p_object_to   in varchar2,
      p_link        in varchar2
   ) return varchar2;

   function get_drop_ddl(
      p_object_type in varchar2,
      p_object_name in varchar2,
      p_cascade     in varchar2 default null
   ) return varchar2;

   function get_view_ddl(
      p_view_name   in varchar2,
      p_body        in varchar2
   ) return varchar2;

   function get_package_ddl(
      p_pack_name   in varchar2,
      p_spec        in varchar2
   ) return varchar2;

   function get_packagebody_ddl(
      p_pack_name   in varchar2,
      p_body        in varchar2
   ) return varchar2;

   function run_other_sql (
      p_schema     in varchar2,
      p_sql        in varchar2
   ) return varchar2;

   function get_ddl(
     p_table_name varchar2,
     p_schema     varchar2,
     p_pk1        varchar2,
     p_pk1_name   varchar2,
     p_pk1_type   varchar2,
     p_seq_name   varchar2,
     p_run_ddl    varchar2 default 'NO',
     p_pk2        varchar2 default null,
     p_fk_name    varchar2 default null,
     p_fk_col     varchar2 default null,
     p_fk_ftable  varchar2 default null,
     p_fk_fcol    varchar2 default null,
     p_fk_type    varchar2 default null
   ) return varchar2;

    procedure run_sql (
      p_sql_cmd    in varchar2,
      p_schema     in varchar2,
      p_table_name in varchar2,
      p_seq_name   in varchar2
    );

    procedure create_package (
      p_source  in sys.dbms_sql.varchar2a,
      p_owner   in varchar2
    );

    procedure get_object_info (
      p_object_id in number,
      p_object_owner out varchar2,
      p_object_name  out varchar2,
      p_object_type  out varchar2
    );

  function get_foreign_key_ddl(
    p_table_name varchar2,
    p_schema     varchar2,
    p_seq_name   varchar2,
    p_run_ddl    boolean default false,
    p_fk_name    varchar2,
    p_fk_col     varchar2,
    p_fk_ftable  varchar2,
    p_fk_fcol    varchar2,
    p_fk_type    varchar2 default 'N'
  ) return varchar2;

  function get_const_ddl(
    p_table_name varchar2,
    p_schema     varchar2,
    p_con_name   varchar2,
    p_type       varchar2,
    p_check      varchar2,
    p_cols       varchar2,
    p_run_ddl    boolean default false
  ) return       varchar2;

    function show_plsql_edit(
        p_sgid  in  varchar2
    ) return boolean;

    function get_data_redaction_ddl(
        p_owner       in varchar2,
        p_table_name  in varchar2,
        p_column_name in varchar2,
        p_redact_name in varchar2,
        p_redact_exp  in varchar2,
        p_redact_type in varchar2,
        p_func_parms  in varchar2 default null,
        p_regexp_pat  in varchar2 default null,
        p_regexp_rep  in varchar2 default null,
        p_regexp_pos  in varchar2 default null,
        p_regexp_occ  in varchar2 default null,
        p_regexp_matp in varchar2 default null,
        p_enabled     in boolean  default true,
        p_action      in varchar2
    ) return varchar2;

end;
/
show errors
