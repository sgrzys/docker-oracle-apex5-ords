set define '^' verify off feedback off

Rem  Copyright (c) Oracle Corporation 2012 - 2015. All Rights Reserved.
Rem
Rem    NAME
Rem      install_packaged_apps.sql
Rem
Rem    DESCRIPTION
Rem    Install packaged and sample applications as template applications during APEX installation.
Rem
Rem    MODIFIED     (MM/DD/YYYY)
Rem    hfarrell      05/15/2012 - Created - based on cloud_ga/dbservice/pod_internal/template_apps/dbpod_install_applications.sql
Rem    hfarrell      05/15/2012 - Copied INHERIT PRIVILEGES logic from /core/apex_install_sample_app.sql
Rem    hfarrell      05/29/2012 - Uncommented the following list of applications following request from Marc:
Rem                               Opportunity Tracker,Campaign Manager,Asset Manager,Data Model Repository Viewer, Survey Builder,
Rem                               Sample Lists,Sample Collections,Sample Timezone,Sample Files,Sample Access Control,Sample Build Options,
Rem                               Service Notifications,Service Notifications Admin
Rem    jkallman      06/01/2012 - Clear out globals at end of script
Rem    hfarrell      06/18/2012 - Removed 8951 - old Collections Showcase application
Rem    vuvarov       07/24/2012 - Removed 7180 (Feedback)
Rem    hfarrell      07/30/2012 - Added 7650 (Go Live Check List) as requested by Mike
Rem    vuvarov       08/13/2012 - Removed 7620 and 7630 (Service Notifications)
Rem    vuvarov       08/23/2012 - Changed 7650 and 7890 to be locked on install
Rem    vuvarov       11/02/2012 - Set g_import_in_progress (bug 14645890)
Rem    hfarrell      11/20/2012 - Renamed Sample Database Application export file reference from sample_app.sql to f8950.sql
Rem    vuvarov       12/07/2012 - Removed application 7280
Rem    cbcho         08/21/2013 - Added logic to truncate wwv_flow_pkg_app_stmts (feature #1257)
Rem    jstraub       10/21/2013 - Changed SGID 11 references to 12
Rem    hfarrell      10/22/2013 - Added Data Reporter (7250), Live Poll (7340) and Standards Tracker (7260)
Rem    hfarrell      01/09/2014 - Removed Live Poll (7340), update Data Reporter (7250) and Standards Tracker (7260) to SGID 12
Rem    vuvarov       01/28/2014 - Added Live Poll (7340), Geolocation Showcase (7160), Survey Builder (7280),
Rem                               Sample RESTful Services (7980); reordered installation based on application IDs
Rem    vuvarov       02/26/2014 - Updated to load packaged applications into BLOB (feature #1380)
Rem    cbcho         03/13/2014 - Moved truncate on statements table before the delete of files table (feature #1380)
Rem    cneumuel      07/28/2015 - Removed inherit privileges (bug #21245456)


define PKGAPP_SGID = '12'

prompt Application Express Packaged and Sample Applications installation data

prompt
prompt ...Remove existing packaged application data
prompt
declare
    c_sgid constant number := to_number( '^PKGAPP_SGID.' );
begin
    wwv_flow_api.set_security_group_id( c_sgid );

    -- Even though there is FK constraint on file_id column pointing to wwv_flow_pkg_app_files,
    -- it is better to truncate before the delete on files table for efficiency as there can be a lot of rows in parsed statements.
    -- It is okay to remove the parsed statements for all app_group (PACKAGE, SAMPLE, TEMPLATE) as the engine will parse again during the first install of an application.
    execute immediate 'truncate table wwv_flow_pkg_app_stmts';

    delete from wwv_flow_pkg_app_files
     where app_id in ( select app_id
                         from wwv_flow_pkg_applications
                        where app_group in ( 'PACKAGE', 'SAMPLE' ) );

    delete from wwv_flow_company_static_files
     where security_group_id = c_sgid
       and mime_type = 'application/x-zip'
       and file_name like 'apps_%.zip';

    commit;
end;
/


prompt
prompt ...Load packaged application archive
prompt
declare
    c_sgid constant number := to_number( '^PKGAPP_SGID.' );
begin
    wwv_flow_api.set_security_group_id( c_sgid );
    wwv_flow_application_install.set_workspace_id( c_sgid );
    wwv_flow_application_install.generate_offset();
    wwv_flow_application_install.set_schema( wwv_flow.g_flow_schema_owner );
end;
/

@@apps_zip.sql


set define '^' verify off feedback off
prompt
prompt ...Expand packaged application archive
prompt
declare
    c_sgid constant number := to_number( '^PKGAPP_SGID.' );
begin
    for c1 in ( select *
                  from ( select id, file_name, security_group_id
                           from wwv_flow_company_static_files
                          where security_group_id = c_sgid
                            and mime_type = 'application/x-zip'
                            and file_name like 'apps_%.zip'
                          order by created_on desc )
                 where rownum = 1 )
    loop
        wwv_flow_pkg_app_api.expand_application_zip( p_security_group_id => c1.security_group_id,
                                                     p_file_name         => c1.file_name );

        delete from wwv_flow_company_static_files
         where security_group_id = c1.security_group_id
           and id = c1.id;
    end loop;

    commit;
end;
/


--
--  Clear out application globals, so this avoids any downstream effect
begin
    wwv_flow_application_install.clear_all;
end;
/

set verify off feedback on
prompt ...done
