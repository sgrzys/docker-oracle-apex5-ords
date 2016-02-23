set define '^' verify off
prompt ...wwv_flow_file_api
create or replace package wwv_flow_file_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_file_api.sql
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      sdillon   04/15/2001 - Created
--      mhichwa   06/26/2001 - Added get and set file id and sgid
--      mhichwa   06/26/2001 - Added g_file_inserted
--      cbcho     12/11/2001 - Added create_file
--      jkallman  08/18/2003 - Remove write_file (Bug 3063954)
--      sspadafo  01/12/2009 - Added g_file_inserted_count
--      cneumuel  04/17/2012 - Prefix sys objects with schema (bug #12338050)
--      pawolf    04/24/2013 - Added get_mime_type
--      pawolf    04/26/2013 - Added get_file_name and enhanced clean_dirname
--      cneumuel  05/21/2014 - replaced set_file_security_group_id with register_file (bug #15844363)
--                           - added delete_temp_request_files
--                           - removed obsolete get_file_id
--      cneumuel  06/06/2014 - Added check_workspace_limits (feature #1198)
--      cneumuel  06/10/2014 - In check_workspace_limits: added p_security_group_id parameter (feature #1198)
--
--------------------------------------------------------------------------------

--==============================================================================
g_file_inserted       boolean := false;
g_file_inserted_count pls_integer := 0;

/*
 * Clean a directory varchar2 value
 */
function clean_dirname(
    p_dir                       in varchar2)
    return varchar2
    ;

/*
 * Clean a filename varchar2 value
 */
function clean_filename(
    p_file                      in varchar2)
    return varchar2
    ;

/*
 * Remove leading and trailing spaces, dots and slashes and then append the uploaded filename to get the final file name
 */
function get_file_name (
    p_directory in varchar2,
    p_file_name in varchar2 )
    return varchar2;

/*
 * Get mime type based on the provided file name extension
 */
function get_mime_type (
    p_file_name in varchar2 )
    return varchar2;

/*
 * Take a BLOB, and write it to a table of VARCHAR2's. You can then use
 *  varchar2_to_blob to reconstruct your binary objects from your varchars'2.
 */
function blob_to_varchar2(
    p_blob                      in blob)
    return sys.dbms_sql.varchar2_table
    ;

/*
 * Take a table of varchar2s, and write them to a blob.
 */
function varchar2_to_blob(
    p_varchar2_tab              in sys.dbms_sql.varchar2_table)
    return blob
    ;

/*
 * Create a new record in the wwv_flow_file_objects$ table.
 */
function new_file_object$(
    p_name                    in out varchar2,
    p_blob                        in blob,
    p_mimetype                    in varchar2)
    return number
    ;

procedure remove_file(
    p_id                        in number,
    p_file_path                 in varchar2,
    p_file_name                 in varchar2)
    ;

procedure create_file (
       p_id              in number default null,
       p_flow_id         in number default null,
       p_name            in varchar2 default null,
       p_pathid          in number default null,
       p_filename        in varchar2 default null,
       p_title           in varchar2 default null,
       p_mime_type       in varchar2 default null,
       p_doc_size        in number default null,
       p_dad_charset     in varchar2 default null,
       p_created_by      in varchar2 default null,
       p_created_on      in date default null,
       p_updated_by      in varchar2 default null,
       p_updated_on      in date default null,
       p_deleted_as_of   in date default null,
       p_last_updated    in date default null,
       p_content_type    in varchar2 default null,
       p_blob_content    in blob default null,
       p_language        in varchar2 default null,
       p_description     in varchar2 default null,
       p_file_type       in varchar2 default null)
       ;

--##############################################################################
--#
--# REGISTERING FILES AND CLEANING UP
--#
--##############################################################################

--==============================================================================
subtype t_temp_type is varchar2(10);
c_temp_session constant t_temp_type := 'SESSION';
c_temp_request constant t_temp_type := 'REQUEST';

--==============================================================================
-- update the file with the given name to reference the current workspace
-- (g_security_group_id). if p_temp_type is null, the file is persistent. if
-- p_temp_type is SESSION or REQUEST, it is temporary.
--
-- temporary files populate wwv_flow_file_objects$.session_id and the after
-- delete trigger on sessions deletes them. if the type is REQUEST,
-- wwv_flow_file_api saves the name on registration with register_file(). at
-- the end of the request, delete_temp_request_files() should be called. this
-- deletes all files which were registered with type REQUEST.
--==============================================================================
procedure register_file (
    p_file_name in varchar2,
    p_temp_type in t_temp_type );

--==============================================================================
-- delete files that were registered with p_temp_type REQUEST. this is a
-- utility procedure for wwv_flow_security.teardown. the procedure performs the
-- delete statement in an autonomous transaction.
--==============================================================================
procedure delete_temp_request_files;

--==============================================================================
-- assert that the workspace limits for file uploads have not been exceeded and
-- raise an error otherwise.
--==============================================================================
procedure check_workspace_limits (
    p_security_group_id in number default wwv_flow_security.g_security_group_id );

end wwv_flow_file_api;
/
show error
