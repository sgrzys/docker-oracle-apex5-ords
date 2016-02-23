set define '^'
set verify off
prompt ...wwv_flow_image_api

Rem    NAME
Rem      imgapi_public.sql
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    Arguments:
Rem     1:  
Rem     2:
Rem     3:  Flow user
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     sdillon  04/13/2001 - Created
Rem     sdillon  05/01/2001 - Cleaned up for integration into flows installation source
Rem     sdillon  05/04/2001 - Added ability to export blobs to varchar2 tables
Rem     sdillon  05/04/2001 - Added ability to create new file objects$ and image repository record fm vc2tab
Rem     sdillon  05/24/2001 - Removed sec group id fm new image repos record
Rem     sdillon  06/04/2001 - Added remove_image(filename,flow_id) procedure
Rem     jkallman 08/18/2003 - Remove write_image (Bug 3063954)
Rem     sspadafo 03/22/2004 - Add g_varchar2_table for export image api to use (Bug 3515462)
Rem     sspadafo 06/24/2006 - Created as copy of imgapi.sql. Package wwv_flow_css_api will now be only for publicly exposed entry points. (Bug 5308534)
Rem     cneumuel 04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem     pawolf   04/22/2013 - Deprecated APIs (feature ##1169)

create or replace package wwv_flow_image_api as
    g_varchar2_table sys.dbms_sql.varchar2_table; -- used by wwv_flow_gen_api2.create_flow_image_repository

/*
 * Create a new image_repository entry, returns unique id for 
 *  wwv_flow_image_repository table.
 *
 * *** API Deprecated, use wwv_flow_api.create_app_static_file and create_workspace_static_file instead ***
 */


function new_image_repository_record(
    p_name                  in out varchar2,
    p_varchar2_table            in sys.dbms_sql.varchar2_table,
    p_mimetype                  in varchar2,
    p_flow_id                   in number,
    p_nlang                     in varchar2,
    p_height                    in number default null,
    p_width                     in number default null,
    p_notes                     in varchar2)
    return number
    ;
    
--
-- F I L E S Y S T E M   I N T E G R A T I O N
--

/* 
 * pass in the image name and flow id of the wwv_flow_image_repository record 
 *  representing the image you want to drop. If this image does not exist 
 *  according to the wwv_flow_image_repository table, this will not work.
 *
 * *** API Deprecated ***
 */
procedure remove_image(
    p_image_name                in varchar2,
    p_flow_id                   in number)
    ;

end wwv_flow_image_api;
/
show error
