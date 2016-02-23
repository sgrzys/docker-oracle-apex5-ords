set define '^'
set verify off
prompt ...wwv_flow_load_excel_data

Rem NAME
Rem      wwv_flow_load_excel_data.sql
Rem
Rem    SCRIPT ARGUMENTS
Rem      
Rem      
Rem        
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     cbcho      11/07/2001  Created
Rem     cbcho      09/23/2002  Exposed cleanout_column_name function
Rem     cbcho      09/23/2002  Exposed is_number function
Rem     cbcho      09/23/2002  Exposed is_date function
Rem     cbcho      09/24/2002  Exposed build_sql
Rem     cbcho      09/24/2002  Depricated add_member. Use wwv_flow_collections.add_members instead
Rem     cbcho      09/24/2002  Added p_enclosed_by in build_sql
Rem     cbcho      09/24/2002  Moved cleanout_column_name, is_number, is_date, build_sql, date_format to wwv_flow_load_data
Rem     cbcho      09/26/2002  Added p_separator, p_enclosed_by to get_table_info and load_excel_data
Rem     cbcho      12/13/2002  Removed p_saved_ddl_id from create table and load_excel_data. no longer needed
Rem     cbcho      01/16/2003  Added p_data_type, p_data_format in load_excel_data to support data format (Bug 2756274)
Rem     cbcho      02/05/2003  Changed create_table to accept primary key and constraint name (Bug 2787083)
Rem     cbcho      02/05/2003  Fixed bug not to drop table if the load is to existing table (Bug 2778057)
Rem     cbcho      04/01/2003  Bug 2861875: Added logic to accept globalization number format parameters
Rem     cbcho      08/05/2003  Added p_load_type to get_table_info and load_excel_data (Bug 3044890)
Rem     cbcho      08/10/2004  Added p_load_id to load_excel_data
Rem     cbcho      08/12/2004  Added p_parsed_data_format to load_excel_data
Rem     cbcho      08/31/2007  Added overload procedures get_table_info,load_excel_data to take in clob as p_string to support spreadsheet load > 32KB


create or replace package wwv_flow_load_excel_data
as


function table_exists (
  p_table_name  in varchar2,
  p_schema      in varchar2
  ) return boolean;


procedure get_table_info (
   p_string                 in varchar2,
   p_separator              in varchar2 default '\t',
   p_enclosed_by            in varchar2 default null,      
   p_first_row_is_col_name  in boolean default false,
   p_currency               in varchar2 default '$',
   p_numeric_chars          in varchar2 default '.,',
   p_load_type              in varchar2 default 'EXCEL'
   );

procedure get_table_info (
   p_string                 in clob,
   p_separator              in varchar2 default '\t',
   p_enclosed_by            in varchar2 default null,      
   p_first_row_is_col_name  in boolean default false,
   p_currency               in varchar2 default '$',
   p_numeric_chars          in varchar2 default '.,',
   p_load_type              in varchar2 default 'EXCEL'
   );
     
procedure create_table (
  p_schema        in varchar2,
  p_table_name    in varchar2,
  p_pk1           in varchar2,
  p_pk1_name      in varchar2,
  p_pk1_type      in varchar2,
  p_seq_name      in varchar2 default null,
  --
  p_cnames        in wwv_flow_global.vc_arr2,
  p_data_type     in wwv_flow_global.vc_arr2,  
  p_upload        in wwv_flow_global.vc_arr2,
  p_max_length    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr   
  );
  
procedure load_excel_data (
   p_string                 in varchar2,
   p_cnames                 in wwv_flow_global.vc_arr2,
   p_upload                 in wwv_flow_global.vc_arr2,
   p_schema                 in varchar2,
   p_table                  in varchar2,
   --                      
   p_data_type              in wwv_flow_global.vc_arr2,
   p_data_format            in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
   p_parsed_data_format     in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
   --
   p_separator              in varchar2 default '\t',
   p_enclosed_by            in varchar2 default null,
   p_first_row_is_col_name  in boolean default false,
   p_load_to                in varchar2 default 'EXIST',
   p_currency               in varchar2 default '$',
   p_numeric_chars          in varchar2 default '.,',
   p_load_type              in varchar2 default 'EXCEL',
   p_load_id                in number default null
   );
   
procedure load_excel_data (
   p_string                 in clob,
   p_cnames                 in wwv_flow_global.vc_arr2,
   p_upload                 in wwv_flow_global.vc_arr2,
   p_schema                 in varchar2,
   p_table                  in varchar2,
   --                      
   p_data_type              in wwv_flow_global.vc_arr2,
   p_data_format            in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
   p_parsed_data_format     in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
   --
   p_separator              in varchar2 default '\t',
   p_enclosed_by            in varchar2 default null,
   p_first_row_is_col_name  in boolean default false,
   p_load_to                in varchar2 default 'EXIST',
   p_currency               in varchar2 default '$',
   p_numeric_chars          in varchar2 default '.,',
   p_load_type              in varchar2 default 'EXCEL',
   p_load_id                in number default null
   );   
   
end wwv_flow_load_excel_data;
/
show error;