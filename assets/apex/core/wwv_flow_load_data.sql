set define '^' verify off
prompt ...wwv_flow_data_load
create or replace package wwv_flow_load_data as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2014. All Rights Reserved.
--
-- NAME
--      wwv_flow_data_load.sql
--
--    SCRIPT ARGUMENTS
--      1:
--      2:
--      3:  Flow Schema Owner
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--     sleuniss   2/28/01      Created modified from tkyte
--     sleuniss   3/16/01      began work on dump_ascii
--     sleuniss   3/17/01      dump_ascii working with optional separator
--                             fixed load_data to work across schema
--     sleuniss   3/20/01      changed to dbms_sys_sql.parse_as
--     cbcho      01/21/02     Changed dump_ascii to accept p_enclosed_by parameter
--     cbcho      07/02/02     Added p_mime_header in dump_ascii
--     cbcho      09/23/2002   Added create_csv_collection
--     cbcho      09/24/2002   Added load_csv_data
--     cbcho      09/24/2002   Moved cleanout_column_name, is_number, is_date, build_sql, date_format from wwv_flow_load_excel_data
--     cbcho      09/26/2002   Fixed character buffer string too small bug in cleanout_column_name
--     cbcho      10/01/2002   Added p_inc_col_names option in dump_ascii
--     cbcho      01/16/2003   Added p_data_type, p_data_format in load_csv_data and build_sql to support data format (Bug 2756274)
--     cbcho      02/05/2003   Fixed bug not to drop table if the load is to existing table (Bug 2778057)
--     cbcho      04/01/2003   Bug 2861875: Added logic to accept globalization number format parameters
--     jkallman   08/01/2003   Add p_mime_charset to dump_ascii (Bug 3033754)
--     jkallman   08/03/2003   Added p_charset to create_csv_collection (Bug 3033754)
--     jkallman   08/03/2003   Added p_charset to load_csv_data (Bug 3033754)
--     cbcho      08/04/2003 - Added p_file_format to dump_ascii to support UNIX,DOS file format (Bug 3080891)
--     cbcho      08/05/2003 - Added p_load_type to build_sql (Bug 3044890) 
--     cbcho      07/08/2004 - Added p_file_name to dump_ascii to pass table name as file name (Bug 3190734)
--     cbcho      08/10/2004 - Added p_load_id to load_csv_data
--     cbcho      08/12/2004 - Exposed g_number_format, function date_format
--     cbcho      05/19/2005 - Added valid_file_extension
--     cbcho      07/10/2005 - Added p_de_quote argument on build_sql to de quote during spreadsheet import only if the flag is Yes
--     cbcho      03/22/2006 - Added procedure display_etable_property, display_ntable_property
--     jstraub    06/28/2006 - Added p_schema so dump_ascii would correctly parse as proper schema (Bug 5359590)
--     cbcho      08/30/2007 - Added create_tab_info_collection
--     cbcho      08/31/2007 - Added procedure load_data
--     jkallman   02/04/2008 - Change names and values arguments as type sys.wwv_dbms_sql.vc_arr2
--     pmanirah   04/05/2012 - Changed build_sql to return a new parameter of p_types that hold the types of the columns to be uploaded
--     cneumuel   04/30/2014 - In create_csv_collection, load_csv_data: tag wwv_flow_file_objects$ with a file_type (bug #18659423)
--                           - Removed parse, word, load_data(p_id): dead code
--
--------------------------------------------------------------------------------

  g_number_format varchar2(4000);
  
  function valid_file_extension (
      p_filename in varchar2) return boolean
      ;
    
  function de_quote( p_str in varchar2, p_enc_by in varchar2 ) return varchar2
  ;
  
  function cleanout_column_name (
    p_column_name in varchar2
    ) return varchar2
    ;

  function is_number (
     p_string            in varchar2,
     p_currency          in varchar2 default '$',
     p_numeric_chars     in varchar2 default '.,'
     ) return boolean
     ;
  
  function is_date (
     p_string in varchar2
     ) return boolean
     ;

  function date_format (
   p_string in varchar2
   ) return varchar2
   ;
   
  procedure build_sql (
  p_line                   in varchar2,
  p_upload                 in wwv_flow_global.vc_arr2,
  p_schema                 in varchar2,
  p_table                  in varchar2,
  p_cnames                 in wwv_flow_global.vc_arr2,
  p_line_ctr               in number,
  --
  p_data_type              in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
  p_data_format            in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
  p_parsed_data_format     in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
  --
  p_separator              in varchar2 default chr(9),
  p_enclosed_by            in varchar2 default null,
  p_first_row_is_col_name  in boolean default false,
  --
  p_currency               in varchar2 default '$',
  p_numeric_chars          in varchar2 default '.,',
  p_load_type              in varchar2 default 'CSV',
  p_de_quote              in varchar2 default 'NO',
  --
  p_sql                    out varchar2,
  p_n                      out sys.wwv_dbms_sql.vc_arr2,
  p_r                      out sys.wwv_dbms_sql.vc_arr2,
  p_types                  out wwv_flow_global.vc_arr2
  )
  ;

  function  dump_ascii( p_query         in varchar2,
                        p_schema        in varchar2,
                        p_separator     in varchar2 default ',',
                        p_enclosed_by   in varchar2 default null,
                        p_inc_col_names in varchar2 default 'N',
                        p_mime_header   in varchar2 default 'application/text',
                        p_mime_charset  in varchar2 default null,
                        p_file_format   in varchar2 default 'UNIX',
                        p_file_name     in varchar2 default 'export')                        
  return number
  ;
    
  procedure create_tab_info_collection(
    p_clob                   in clob, 
    p_collection_name        in varchar2 default null,
    p_load_type              in varchar2 default null,   
    p_separator              in varchar2 default null,
    p_enclosed_by            in varchar2 default null,    
    p_first_row_is_col_name  in boolean default false,
    p_currency               in varchar2 default '$',
    p_numeric_chars          in varchar2 default '.,'
    )
    ;
    
  procedure create_csv_collection (
   p_file_id               in number,
   p_separator             in varchar2 default ',',
   p_enclosed_by           in varchar2 default null,   
   p_first_row_is_col_name in boolean default false,
   p_currency              in varchar2 default '$',
   p_numeric_chars         in varchar2 default '.,',
   p_charset               in varchar2 default null  
   )
   ;
 
  procedure load_data (
    p_clob                  in clob,
    p_cnames                in wwv_flow_global.vc_arr2,
    p_upload                in wwv_flow_global.vc_arr2,
    p_schema                in varchar2,
    p_table                 in varchar2,
    --                      
    p_data_type             in wwv_flow_global.vc_arr2,
    p_data_format           in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_parsed_data_format    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    --                      
    p_separator             in varchar2 default ',',
    p_enclosed_by           in varchar2 default null,
    p_first_row_is_col_name in boolean default false,
    p_load_to               in varchar2 default 'EXIST' ,
    p_currency              in varchar2 default '$',
    p_numeric_chars         in varchar2 default '.,',
    p_load_id               in number default null,
    --
    p_file_id               in number default null,
    p_load_data_type        in varchar2 default null,
    p_load_type             in varchar2 default null
    )
    ;
      
  procedure load_csv_data (
   p_file_id               in number,
   p_cnames                in wwv_flow_global.vc_arr2,
   p_upload                in wwv_flow_global.vc_arr2,
   p_schema                in varchar2,
   p_table                 in varchar2,
   --                      
   p_data_type             in wwv_flow_global.vc_arr2,
   p_data_format           in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
   p_parsed_data_format    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
   --                      
   p_separator             in varchar2 default ',',
   p_enclosed_by           in varchar2 default null,
   p_first_row_is_col_name in boolean default false,
   p_load_to               in varchar2 default 'EXIST',
   p_currency              in varchar2 default '$',
   p_numeric_chars         in varchar2 default '.,',
   p_charset               in varchar2 default null,
   p_load_id               in number default null 
   )
   ;
   
   procedure display_ntable_property (
    p_collection_name in varchar2
    );

   procedure display_etable_property (
    p_table_owner     in varchar2,
    p_table_name      in varchar2,
    p_collection_name in varchar2
    );
end wwv_flow_load_data;
/
show errors
