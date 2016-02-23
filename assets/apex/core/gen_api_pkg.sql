set define '^' verify off serveroutput on size 1000000
prompt ...wwv_flow_gen_api
create or replace package wwv_flow_gen_api2 is
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2000 - 2014. All Rights Reserved.
--
--    NAME
--      gen_api_pkg.sql
--
--    DESCRIPTION
--      Generate API calls to create objects from database
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  05/20/2000 - Created
--     mhichwa  08/18/2000 - Added template exports
--     mhichwa  08/28/2000 - Added p_owner_override
--     mhichwa  03/30/2001 - Added g id offset package variable
--     sdillon  05/10/2001 - Added export company & flow images
--     sdillon  05/18/2001 - Added css export
--     sdillon  05/29/2001 - Added multiple/individual page support to css exporting
--     sdillon  06/04/2001 - Added file export support
--     mhichwa  10/05/2001 - Added export field template
--     cbcho    07/09/2002 - Exposed g_mime_shown
--     sspadafo 01/06/2003 - Added p_build_status_override to export (Bug 2739851)
--     jstraub  05/21/2003 - Added g_rpt_format to support new reporting engine structures
--     jstraub  05/23/2003 - Removed g_rpt_format, no longer needed
--     sspadafo 07/28/2003 - Added g_nls_numeric_chars (Bug 3070294)
--     sspadafo 07/29/2003 - Removed g_nls_numeric_chars (Bug 3074774)
--     skutz    06/14/2004 - Added export_theme api
--     skutz    06/14/2004 - Added p_theme_id to all create template api's to facilitate theme export
--     skutz    06/14/2004 - Made export_page_template,export_region_template,export_list_template OBSOLETE
--     skutz    06/14/2004 - Made export_row_template,export_field_template OBSOLETE
--     cbcho    05/16/2005 - Added export_script
--     mhichwa  07/07/2005 - Added p_flashback_min_ago argument to clean up flashback export
--     madelfio 02/03/2005 - Added create_flow_image
--     madelfio 02/06/2005 - Added create_image_script(renamed from create_flow_image), create_css_script, and create_static_script
--     cbcho    04/06/2006 - Added p_file_id to procedure export
--     mhichwa  04/14/2006 - Added p_export_comments argument to export procedure
--     mhichwa  05/01/2006 - Added g_exp_region_col_width boolean := true; to allow export to be turned off if needed from f4000.
--     mhichwa  05/17/2006 - Added support for debugging_override export option bug 5231642
--     mhichwa  05/18/2006 - Added p_component and p_component_id to export procedure
--     madelfio 05/31/2006 - Added functions to return clob output of create_image_script, create_css_script, and create_html_script
--     jstraub  01/09/2009 - Added p_export_saved_reports to export (from 3.2 branch by sspadafo 1/11/2009)
--     pawolf   05/08/2009 - Added export_plugin
--     cbcho    07/27/2009 - Added support for exporting interactive report notifications
--     cbcho    11/11/2009 - Added p_export_ir_public_reports,renamed p_export_saved_reports,p_export_notification_reports to p_export_ir_private_reports,p_export_ir_notifications in export
--     pawolf   02/23/2010 - Added export/import for feedback
--     pawolf   04/15/2010 - Expose file_open and file_close
--     jkallman 05/26/2011 - Added p_export_translations to export
--     hfarrell 10/21/2011 - Added export_restful_service and export_restful_services for RESTful Services
--     hfarrell 05/24/2012 - Added export_packaged_app_info for Packaged Application Mapping Information
--     hfarrell 05/25/2012 - Moved export_packaged_app_info to new package wwv_flow_pkg_app_api.plb
--     jstraub  02/08/2013 - Added p_include_script_header to export_restful_services
--     cneumuel 02/22/2013 - In file_open: added p_set_application_id (feature #985)
--     cneumuel 04/16/2013 - In export: added p_with_original_ids (feature #985)
--     cneumuel 04/16/2013 - Export with original IDs (feature #985)
--     pawolf   04/22/2013 - Merged wwv_flow_html_repository, wwv_flow_css_repository and wwv_flow_image_repository into wwv_flow_company_static_files and wwv_flow_static_files (feature #1169)
--     jstraub  06/11/2013 - Added p_include_groups to export_restful_services (bug 16781538)
--     cbcho    01/10/2014 - Added p_export_sup_objects to export (feature #1248)
--     cneumuel 02/12/2014 - Use g_writer, g_blob_writer for output
--     cbcho    03/20/2014 - Added p_export_pkg_app_mapping in export (feature #1399)
--     vuvarov  10/14/2014 - In export: added p_subscription_override (feature #1532)
--     vuvarov  12/03/2014 - In export: added p_exclude_subscriptions (feature #1532)
--     pawolf   12/18/2014 - In file_close: added p_is_component_export (features #1623 and #1624)
--
--------------------------------------------------------------------------------

g_id_offset            number  := 0;
g_mime_shown           boolean := false;
g_exp_region_col_width boolean := true;

g_writer               wwv_flow_t_writer := wwv_flow_t_htp_writer();

--##############################################################################
--#
--# Application Export
--#
--##############################################################################

--==============================================================================
-- This procedure exports flows
--
-- p_flow_id...................Unique ID number of your flow
-- p_page_id...................Optional Page ID number
-- p_format....................Output format UNIX, DOS, DB, XML
-- p_commit....................Generate a commit statement at end of script (YES or NO)
-- p_owner_override............Set the application owner to this USER and not the current flows owner attribute
-- p_flashback_min_ago.........Set the export procedure to use flashback mode
-- p_file_id...................Use optionally when exporting into DB format
-- p_export_comments...........Export comments in with the file
-- p_export_ir_public_reports..Export Public Interactive Reports
-- p_export_ir_private_reports.Export Private Interactive Reports
-- p_export_ir_notifications...Export Interactive Report Notification Settings
-- p_export_pkg_app_mapping....Export mapping between the application and packaged application if it exists
-- p_debugging_override........Set the application debugging status to this value (1 = Yes, 0 = No)
-- p_component.................
-- p_component_id..............
-- p_with_original_ids.........If true, export with original workspace id, application id and component ids
--                             Otherwise, use the current ids.
--                             Setting this flag to true helps to diff/merge changes from different workspaces.
--==============================================================================
procedure export (
    p_flow_id                     in number,
    p_page_id                     in number   default null,
    p_format                      in varchar2 default 'UNIX',
    p_commit                      in varchar2 default 'YES',
    p_owner_override              in varchar2 default null,
    p_build_status_override       in varchar2 default 'NO',
    p_flashback_min_ago           in number   default null,
    p_file_id                     in number   default null,
    p_export_sup_objects          in varchar2 default null,
    p_export_comments             in varchar2 default 'N',
    p_export_ir_public_reports    in varchar2 default 'N',
    p_export_ir_private_reports   in varchar2 default 'N',
    p_export_ir_notifications     in varchar2 default 'N',
    p_export_translations         in varchar2 default 'N',
    p_export_pkg_app_mapping      in varchar2 default 'N',
    p_debugging_override          in number   default null,
    p_exclude_subscriptions       in boolean  default false,
    p_component                   in varchar2 default null,
    p_component_id                in number   default null,
    p_with_original_ids           in boolean  default false );

--##############################################################################
--#
--# Flow Component Export
--#
--##############################################################################

--==============================================================================
-- p_flow_id........Unique ID number of your flow
-- p_page_id........Optional Page ID number
-- p_format.........Output format UNIX, DOS, DB, XML
-- p_commit.........Generate a commit statement at end of script (YES or NO)
--==============================================================================
procedure export_theme (
    p_flow_id               in number,
    p_theme_id              in number,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES');

--==============================================================================
procedure export_tabset (
    p_flow_id               in number,
    p_tabset                in varchar2 default null,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES');

procedure export_parent_tabset (
    p_flow_id               in number,
    p_tabset                in varchar2 default null,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES')
    ;

procedure export_plugin (
    p_flow_id   in number,
    p_plugin_id in number,
    p_format    in varchar2 default 'UNIX',
    p_commit    in varchar2 default 'YES' );

procedure export_restful_services (
    p_format    in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES',
    p_include_script_header in boolean  default true,
    p_include_groups        in boolean  default true );


procedure export_restful_service (
    p_module_id in number,
    p_format    in varchar2 default 'UNIX',
    p_commit    in varchar2 default 'YES' );


--##############################################################################
--#
--# File Component Export
--#
--##############################################################################

procedure export_workspace_static_files (
    p_format in varchar2 default 'UNIX',
    p_commit in varchar2 default 'YES' );

--##############################################################################
--#
--# Other Exports
--#
--##############################################################################

procedure export_script (
    p_format           in varchar2 default 'UNIX',
    p_commit           in varchar2 default 'YES')
    ;

procedure export_feedback_to_development (
    p_id     in number   default null,
    p_since  in date     default null,
    p_format in varchar2 default 'UNIX',
    p_commit in varchar2 default 'YES' );

procedure export_feedback_to_deployment (
    p_deployment_system in varchar2,
    p_id                in number   default null,
    p_since             in date     default null,
    p_format            in varchar2 default 'UNIX',
    p_commit            in varchar2 default 'YES' );

--##############################################################################
--#
--# Other Functions
--#
--##############################################################################
procedure file_open (
    p_format             in varchar2,
    p_set_application_id in boolean default false,
    p_with_original_ids     in boolean default false );

procedure file_close (
    p_commit              in boolean,
    p_is_component_export in boolean default false );

-- OBSOLETE
procedure export_page_template (
    p_flow_id               in number,
    p_name                  in varchar2 default null,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES')
    ;

-- OBSOLETE
procedure export_region_template (
    p_flow_id               in number,
    p_name                  in varchar2 default null,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES')
    ;

-- OBSOLETE
procedure export_list_template (
    p_flow_id               in number,
    p_name                  in varchar2 default null,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES')
    ;

-- OBSOLETE
procedure export_row_template (
    p_flow_id               in number,
    p_name                  in varchar2 default null,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES')
    ;

-- OBSOLETE
procedure export_field_template (
    p_flow_id               in number,
    p_name                  in varchar2 default null,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES')
    ;

end wwv_flow_gen_api2;
/
show error
