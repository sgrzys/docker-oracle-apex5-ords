set define '^'
set verify off
prompt ...wwv_flow_data_upload

Rem    MODIFIED (MM/DD/YYYY)
Rem    pmanirah  05/15/2011 - Created
Rem    pwolf     05/18/2011 - Changed code to use wwv_flow_dynamic_exec and to use wwv_ prefix instead of apex_
Rem    pmanirah  05/20/2011 - Updated the load_data and create_verify_collection procedures
Rem    pmanirah  05/24/2011 - Removed set_col_headings procedure
Rem    pmanirah  05/25/2011 - Added set_results procedure
Rem    pmanirah  06/03/2011 - removed set_results procedure and changed the load_data
Rem    pmanirah  06/06/2011 - Replaced p_table_name by p_name parameters for the create_verify_collection and load_data procedures
Rem    pmanirah  06/08/2011 - Updated create_verify_collection and load_data to use p_id instead of p_name (feature 545)
Rem    pmanirah  06/09/2011 - Added p_separator,p_enclosed_by, p_currency, p_group_separator, p_decimal_char to create_collections_from_data procedure
Rem    pmanirah  12/15/2011 - Updated display_table_mapping to take p_owner as parameter
Rem    pmanirah  04/25/2012 - Added a new parameter to create_collections_from_data procedure (feature 860)
Rem    pmanirah  05/08/2012 - Changed and updated the display_table_mapping procedure definition by taking one parameter load_table_id and moving part of the code from wwv_flow_region_native
Rem    pmanirah  05/31/2012 - Added a new output parameter to load_data which returns the value of just updated records (feature #903)
Rem    pmanirah  07/02/2012 - Added get_owner_name function to retrive the owner name instead of displaying #OWNER#
Rem    pmanriah  06/04/2013 - Added a new parameter to create_collections_from_data procedure for passing users date format (feature #1054)
Rem    pmanirah  03/12/2014 - Added procedure fix_pre42 and will be called at 4000:2117, to update imported application with pre-42 (bug#18393429)
Rem    pmanirah  02/10/2015 - Added a new function validate_plsql_expressions to validate advanced transformation rules

create or replace package wwv_flow_data_upload

as
empty_vc_arr               wwv_flow_global.vc_arr2;	

--==============================================================================
-- While loading data, read line by line and column by column 
-- and store the parsed data into temp collection
--==============================================================================

procedure create_collections_from_data (
    p_first_row_is_col_name   in varchar2 default 'N',
	p_data_type				  in varchar2 default 'PASTE',
	p_file_name 			  in varchar2 default null,
	p_use_app_date_format     in varchar2 default 'N',
    --
    p_separator               in varchar2 default chr(9),
    p_enclosed_by             in varchar2 default null,
    --
    p_currency                in varchar2 default '$',
    p_group_separator         in varchar2 default '.',
    p_decimal_char            in varchar2 default ',',
    p_charset                 in varchar2 default null);

--==============================================================================
-- Read the table columns or data load column names LOV and render as select list
--==============================================================================
    
procedure display_table_mapping (
    p_load_table_id     in number,
	p_flow_id			in number);

--==============================================================================
-- Save the User mapping of columns from spreasheet to table column names
--==============================================================================
    
procedure save_column_mapping (
    p_cnames                in wwv_flow_global.vc_arr2,
    p_data_format           in wwv_flow_global.vc_arr2 default empty_vc_arr);

--==============================================================================
-- Load the data from the user spreadsheet or file into temp collection
--==============================================================================
    
procedure create_load_collection;	

--==============================================================================
-- In order to do validation, check data to be updated/inserted/etc
-- Make Data manipulation like data lookup, data transformation, etc, 
-- All those operations are done and stored into session collections
--==============================================================================

procedure create_verify_collection (
    p_id    in number);

--==============================================================================
-- After data validation, 
-- This procedure will load data into underlying table
--==============================================================================
    
procedure load_data (
    p_id                    in number,
    p_session_id            in number,
    p_insert_count          out varchar2,
    p_update_count          out varchar2,
    p_error_count           out varchar2,
    p_review_count          out varchar2);

--==============================================================================
-- Checks the owner name and if same as parsing schema
-- Returns the #OWNER#
-- otherwise return the schema name
--==============================================================================

function get_owner_name(
    p_owner_name            in varchar2,
    p_flow_id               in number)
    return varchar2;

--==============================================================================
-- Checks for a valid SQL statement
-- Returns the error text.
--==============================================================================

function validate_plsql_expressions (
    p_expression       in varchar2,
    p_expression_type  in varchar2 )
    return varchar2;
    
procedure fix_pre42(p_flow_id          in number );
end wwv_flow_data_upload;
/ 
show errors