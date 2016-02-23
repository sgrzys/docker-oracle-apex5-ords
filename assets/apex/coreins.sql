Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      coreins.sql
Rem
Rem    DESCRIPTION
Rem      This is the primary installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by apexins.sql, the primary installation script for APEX.
Rem
Rem    NOTES
Rem      Ensure that all arguments (except image prefix) are entered in UPPERCASE.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 10.2.0.3 or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    Arguments:
Rem      1 - LOG1      = Installation log file
Rem      2 - UPGRADE   = Upgrade flag (1 = NO, 2 = YES)
Rem      3 - APPUN     = APEX schema name
Rem      4 - TEMPTBL   = Temporary tablespace
Rem      5 - IMGPR     = Image prefix
Rem      6 - DATTS     = APEX tablespace
Rem      7 - FF_TBLS   = APEX files tablespace
Rem      8 - ADM_PWD   = APEX administrator password
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   08/14/2000 - Created
Rem      mhichwa   08/15/2000 - Added update of wwv_flows owner to install owner
Rem      mhichwa   08/24/2000 - Added lov function
Rem      mhichwa   08/25/2000 - Added grant on flow_utilities to public
Rem      mhichwa   09/03/2000 - Added audit.sql
Rem      mhichwa   09/04/2000 - Added shortcut.sql and .plb
Rem      mhichwa   09/25/2000 - Removed sys info from calls to sub programs
Rem      mhichwa   09/29/2000 - Added java
Rem      mhichwa   09/30/2000 - Added create procedure grant
Rem      mhichwa   10/19/2000 - Create user with APPPW password
Rem      mhichwa   10/24/2000 - Changed javachart.plb to .sql
Rem      mhichwa   10/24/2000 - Added wwv_flow_rewrite_query
Rem      mhichwa   10/25/2000 - Added temp_table_init
Rem      jkallman  11/01/2000 - Added wwv_flow_mail
Rem      mhichwa   11/01/2000 - Added core/wwv_flow_page_cache.sql
Rem      mhichwa   11/02/2000 - Reorganize caching tables package and body
Rem      mhichwa   11/08/2000 - Fixed link
Rem      mhichwa   11/11/2000 - Added view on v$session
Rem      mhichwa   11/12/2000 - Added additional grants from sys to flows
Rem      mhichwa   12/01/2000 - Added flows 4100, 4200, 4300, 4400, 4500
Rem      mhichwa   12/10/2000 - Added flow 4450
Rem      mhichwa   12/12/2000 - Added gen_trans.sql
Rem      mhichwa   12/12/2000 - Changed reference of wwv_flow_java_chart to javachart.sql
Rem      mhichwa   12/15/2000 - Added additional sys grants
Rem      mhichwa   12/21/2000 - Added file_mgr
Rem      mhichwa   12/21/2000 - Added f4600.sql
Rem      mhichwa   01/16/2001 - Added wwv_flow_gen_global_api spec and body and platform_tabs.sql
Rem      mhichwa   01/17/2001 - Added obj$ grant to flows
Rem      mhichwa   01/18/2001 - Added grant all on wwv_flow_file_objects$ to PUBLIC
Rem      jstraub   01/23/2001 - Removed grant drop procedure - privelage does not exist
Rem      mhichwa   01/23/2001 - Added provisioning_tables.sql
Rem      mhichwa   01/24/2001 - Added wwv_apply_configuration.sql
Rem      mhichwa   01/26/2001 - removed duplicate audit.sql added dynsql.sql
Rem      mhichwa   01/31/2001 - Added f4900
Rem      mhichwa   02/05/2001 - Added p.sql
Rem      mhichwa   02/05/2001 - Added f4950
Rem      mhichwa   02/16/2001 - Moved dynsql.sql
Rem      mhichwa   02/16/2001 - Added f4050
Rem      jkallman  02/19/2001 - Added auth.sql before tab.sql
Rem      mhichwa   02/20/2001 - Added wizard.sql and wizard.plb
Rem      mhichwa   02/21/2001 - Added f4700
Rem      mhichwa   02/21/2001 - Added f4650
Rem      sdillon   02/23/2001 - Added provisioning api
Rem      sdillon   02/23/2001 - Added many sys & object privs with admin option for provisioning
Rem      mhichwa   02/23/2001 - Added provision.sql
Rem      mhichwa   02/25/2001 - Added db_auth_tables.sql
Rem      jstraub   02/28/2001 - Added trigger.sql
Rem      sdillon   03/01/2001 - Added wwv_flow_job api for submitting processes to sys.dbms_job
Rem      jstraub   03/01/2001 - Added grant on wwv_flow_lov_temp to PUBLIC
Rem      mhichwa   03/01/2001 - Added default temporary tablespace to creation script
Rem      mhichwa   03/02/2001 - Added wwv_flow_item
Rem      mhichwa   03/02/2001 - Added removed prompt for index tablespace
Rem      mhichwa   03/02/2001 - Changed name of flow_job to flowjob
Rem      mhichwa   03/04/2001 - Added flowjob.ddl
Rem      mhichwa   03/04/2001 - Added platform.sql
Rem      mhichwa   03/04/2001 - Added flow 4150 dbol
Rem      sdillon   03/05/2001 - Fixed alter user default temp tblspc bug
Rem      mhichwa   03/07/2001 - Added public syn
Rem      mhichwa   03/08/2001 - Added wwv_flow_init_htp_buffer public syn
Rem      mhichwa   03/09/2001 - Added V_$SESSION grant and added an additional public syn
Rem      mhichwa   03/12/2001 - Added tree
Rem      sdillon   03/15/2001 - Added plsqljob.sql,plb; removed flowjob.ddl (moved to tab.sql)
Rem      sdillon   03/15/2001 - Added grant execute on sys.dbms_lock to flows
Rem      tmuth     03/14/2001 - Added public syn WWV_RENDER_REPORT2
Rem      mhichwa   03/17/2001 - Moved job above v to avoid compile error on v
Rem      mhichwa   03/17/2001 - Added drop public syn that were missing
Rem      mhichwa   03/18/2001 - Added wizapi
Rem      sdillon   03/19/2001 - Added wwv_flow_debug
Rem      mhichwa   03/19/2001 - Added flow 4250 for help text editing
Rem      mhichwa   03/20/2001 - Added cookie users and db auth user mapping for flows user
Rem      sleuniss  03/20/2001 - Added wwv_flow_csv_data table ddl
Rem      sleuniss  03/20/2001 - Added wwv_flow_load_data .sql and .plb
Rem      mhichwa   03/21/2001 - Added core home
Rem      sdillon   03/22/2001 - Granted exec on sys.dbms_random
Rem      mhichwa   03/22/2001 - Added f4350, f4550, removed home from builder dir
Rem      mhichwa   03/26/2001 - Do not install flows 1000, 4200 and 4100.
Rem      sdillon   03/30/2001 - Added platdemo.sql (wwv_flow_demo)
Rem      mhichwa   03/30/2001 - Added execute any procedure priv to sys grants
Rem      sleuniss  03/31/2001 - Added demo.sql
Rem      mhichwa   04/05/2001 - Added repurposed f4100.sql and generic login.sql
Rem      jkallman  04/09/2001 - Added public syn for WWV_FLOW_SESSION_SEQ
Rem      jstraub   04/09/2001 - Added install for new f4200 - Web Calendar Environment Administration
Rem      mhichwa   04/09/2001 - Added provision.plb
Rem      mhichwa   04/09/2001 - Commented out grant on sys dbms random because it is not gernic oracle
Rem      mhichwa   04/09/2001 - Moved random below sequence creation to avoid install error
Rem      mhichwa   04/10/2001 - Added drop public syn added set define before tab sql
Rem      mhichwa   04/12/2001 - Added tree3 sql and plb
Rem      mhichwa   04/13/2001 - Added gen_demo.sql
Rem      mhichwa   04/18/2001 - Added f4955_demo.sql
Rem      mhichwa   04/19/2001 - Fixed update flow owner to allow install in schema other then flows
Rem      sdillon   04/25/2001 - Added capability for FLOWS user to grant java file.io.FilePermission
Rem      sdillon   05/01/2001 - Added image functionality, and the crypt package for MD5 hashing
Rem      sdillon   05/11/2001 - Fixed java.io.FilePermission grant, by wrapping quotes around ^P_IMG_DIR
Rem      sdillon   05/11/2001 - Moved crypt.sql & plb BEFORE trigger.sql due to dependency rqmts
Rem      sdillon   05/11/2001 - Commented insert into wwv_flow_db_auth. That insert is already in db_auth_tables.sql
Rem      sleuniss  05/15/2001 - removed duplicate grant_policy from dbms java grants
Rem      sdillon   05/15/2001 - Added fileapi and cssapi specs & bodies
Rem      sdillon   05/24/2001 - Fixed sys.dbms_java.grant_permission call for P_IMG_DIR grant
Rem      mhichwa   05/24/2001 - Added wwv flow fnd user api
Rem      mhichwa   05/24/2001 - Added html apis
Rem      sdillon   06/04/2001 - Granted select on sys.dba_tab_columns & sys.dba_objects to ^APPUN, created pub syn wwv_flow_files
Rem      mhichwa   06/07/2001 - Added flow user api and trans util spec
Rem      mhichwa   06/08/2001 - Moved translation above seed to avoid ins errors per sdillon instruction
Rem      mhichwa   06/19/2001 - Added runtime company id preference (flow runtime configuration setting)
Rem      mhichwa   06/20/2001 - Changed comments
Rem      mhichwa   06/26/2001 - Changed order of api.sql to occur before create tables
Rem      mhichwa   06/26/2001 - Added RTCN (runtime company name) and RTS (runtime schema)
Rem      mhichwa   06/26/2001 - Changed order of fileapi.sql
Rem      mhichwa   06/28/2001 - Added additional public synonym (moved from create scripts)
Rem      mhichwa   06/29/2001 - Removed extra semicolon on creation of runtime company
Rem      mhichwa   06/29/2001 - Moved flows 4100 and 4750 (runtime flows) to the core directory
Rem      mhichwa   07/02/2001 - Changed one of the two synonym scripts to be remove_synonyms.sql
Rem      mhichwa   07/02/2001 - Added wwv_flow_template_api
Rem      mhichwa   07/03/2001 - Added wwv_flow_upgrade
Rem      mhichwa   07/23/2001 - Added flows version
Rem      mhichwa   07/26/2001 - Remove drop synonyms
Rem      jstraub   08/08/2001 - Corrected SYS connect string for 9i compatability
Rem      tmuth     08/08/2001 - Added wwv_flow_upgrade_report
Rem      mhichwa   08/21/2001 - Merged apps tab.sql into tab.sql
Rem      jstraub   08/21/2001 - Removed reference to db_auth_tables since it merged into tab.sql
Rem      mhichwa   09/19/2001 - Added ask us url link
Rem      cbcho     09/20/2001 - Added alter database priv to flows owner
Rem      cbcho     09/21/2001 - Added grant select on v_$parameter to flows owner
Rem      mhichwa   09/21/2001 - Removed f4900
Rem      cbcho     09/27/2001 - Added 9i system privilege, grant select any dictionary to flows owner.
Rem      tmuth     09/28/2001 - Removed inline creation of push_mail_queue job and added call to sys.dbms_jobs.sql
Rem      ---------------------------------------------------------------------------------------------------------------------------------------
Rem      tmuth     10/09/2001 - Made many changes to eliminate localins.sql and rtins.sql etc.  This is a major revision point in the installer.
Rem      tmuth     10/09/2001 - Added collection.sql and collection.plb
Rem      jstraub   10/10/2001 - Automated burned in APPUN and APPPW parameters
Rem      tmuth     10/10/2001 - Replaced '' with chr(32) for ^LINK
Rem      jstraub   10/10/2001 - Added markup for auto-generated rtins support
Rem      tmuth     10/10/2001 - Moved connect info from flows_files_new(2) to ins.sql since you can't pass a null connect string
Rem      jstraub   10/11/2001 - Added wwv_flow_item.plb
Rem      tmuth     10/12/2001 - Removed comment on dictionary install
Rem      tmuth     10/12/2001 - Changed hard-coded temp tablespace.  Changed create flows_files.
Rem      tmuth     10/12/2001 - Added exception handling
Rem      tmuth     10/14/2001 - Fixed public synonym errors
Rem      tmuth     10/22/2001 - Changed NEW/UPGRADE question to a number
Rem      tmuth     10/23/2001 - Added link information at the end of installation
Rem      jstraub   10/29/2001 - Added prompts for SMTP host & port, inserted those in platform prefs table
Rem      jstraub   10/29/2001 - Added sys create any directory grant to FLOWS user
Rem      jstraub   10/29/2001 - Enclosed /* */ blocks with set termout off & on
Rem      jstraub   10/29/2001 - Added wwv_flow_runtime_dist.*
Rem      mhichwa   10/30/2001 - Added copy button procedure
Rem      jkallman  11/01/2001 - Clean up Java permissions for Windows and Unix
Rem      tmuth     11/02/2001 - Added stage.sql
Rem      tmuth     11/05/2001 - Added template_gallery.sql
Rem      cbcho     11/15/2001 - Added wwv_flow_load_excel_data.sql and wwv_flow_load_excel_data.plb
Rem      jstraub   11/15/2001 - Added z.sql to support counting clickthrus
Rem      sleuniss  11/27/2001 - Added custom_auth_api.sql and plb
Rem      tmuth     11/30/2001 - Added set termout off for 9i  specific grant
Rem      tmuth     11/30/2001 - Added upgrade instructions
Rem      tmuth     12/06/2001 - Added flow 4300 (Data Workshop) to the runtime
Rem      tmuth     12/06/2001 - Added build options for Data Workshop
Rem      tmuth     12/11/2001 - Modified Java Permissions to include dir* read
Rem      cbcho     12/13/2001 - Added sw_api.sql and plb
Rem      cbcho     12/13/2001 - Added wwv_flow_script_export.sql and plb
Rem      jstraub   12/18/2001 - Added correcting Data Workshop Login and Logout URL's
Rem      jstraub   12/18/2001 - Fixed build options for Data Workshop, need '/' after end;
Rem      tmuth     12/19/2001 - Added wwv_flow_xml_deploy and wwv_flow_xml_import
Rem      jstraub   01/14/2001 - moved app_auth.* to install in both run-time & full installation
Rem      cbcho     01/23/2002 - Added copy_metadata.sql and plb
Rem      cbcho     02/15/2002 - Added create_flow_api.sql and plb
Rem      mhichwa   02/22/2002 - Changed flows_20020101 to flows_20020301
Rem      tmuth     02/26/2002 - Changed ^LINK decode statement to handle "AS SYSDBA" for 9i, but not for 817.  In some combinations
Rem                             of 817 and different versions of SQL Plus, the installer was unable to connect.
Rem      rmattama  02/27/2002 - Added ihelp.sql and plb
Rem      tmuth     03/01/2002 - Added flows_backup
Rem      cbcho     03/04/2002 - Added copyu.sql and plb
Rem      cbcho     03/08/2002 - Added wwv_flow_admin_api.sql and plb
Rem      tmuth     03/25/2002 - Added wwv_flow_xml_report
Rem      tmuth     03/25/2002 - Fixed / direction for upgrade.sql
Rem      tmuth     03/25/2002 - Moved user to check to immediately after login info is entered to save user a lot of typing.
Rem      tmuth     03/25/2002 - Added f4850
Rem      tmuth     03/26/2002 - Added flows_files prompt
Rem      tmuth     04/03/2002 - Moved define APPUN = 'FLOWS_20020401' up
Rem      cbcho     04/04/2002 - Added wwv_flow_xml_report2.sql and plb
Rem      cbcho     04/18/2002 - Added xmlutil.sql and plb
Rem      cbcho     04/18/2002 - Added wwv_flow_dataload_xml.sql and plb
Rem      cbcho     04/18/2002 - Added create public synonym entry for sys.XSLPROCESSOR, sys.XMLDOM, sys.XMLPARSER
Rem      cbcho     04/26/2002 - Added processu.sql and plb
Rem      tmuth     05/01/2002 - Removed some questions, added question for logfile dir
Rem      tmuth     05/01/2002 - Added migrate_metadata
Rem      tmuth     05/02/2002 - Moved migrate_metadata.plb below tab.sql
Rem      tmuth     05/02/2002 - Moved migrate_metadata.plb below wwv_flow_security
Rem      tmuth     05/02/2002 - Added build options to remove data workshop
Rem      tmuth     05/03/2002 - Removed hard ref to install.lst
Rem      tmuth     05/03/2002 - Moved XSLPROCESSOR related packages to end for Mike to comment
Rem      mhichwa   05/03/2002 - Changed message
Rem      mhichwa   05/06/2002 - Added flowcon.sql and flowcon.plb
Rem      mhichwa   05/08/2002 - Added log2 and log3
Rem      tmuth     06/21/2002 - Added wwv_flow_tab_mgr
Rem      mhichwa   06/24/2002 - Changed banner
Rem      mhichwa   06/26/2002 - Added forum_demo.sql
Rem      mhichwa   06/27/2002 - Two new grants  with admin option
Rem      cbcho     06/28/2002 - Added f145_demo.sql
Rem      cbcho     07/09/2002 - Fixed bug to include wwv_flow_tab_mgr.plb
Rem      jstraub   07/10/2002 - Removed java permission grant to l_img_dir2
Rem      jstraub   07/11/2002 - Changed text for runtime install to reference Project Marvel
Rem      jkallman  07/22/2002 - Added call to set define after invocation of random.sql
Rem      jkallman  07/22/2002 - Added call to collections_showcase.sql
Rem      cbcho     07/29/2002 - Added call to wwv_flow_lookup_tables.sql
Rem      cbcho     08/02/2002 - Added call to generate_ddl.sql and .plb
Rem      cbcho     08/02/2002 - Added select_catalog_role grant to flows owner
Rem      mhichwa   08/08/2002 - Added web services package and body and tables
Rem      jstraub   08/15/2002 - Conditionally exec wwv_flow_web_services based upon db version
Rem      tmuth     08/16/2002 - Commented out call to platform_tabs.sql
Rem      jstraub   08/16/2002 - Added prompts before wwv_flow_web_services.sql
Rem      cbcho     08/19/2002 - Added comment on installing wwv_flow_dataload_xml is 9i specific
Rem      cbcho     08/19/2002 - Added comment about SYS.XSLPROCESSOR, SYS.XMLDOM, SYS.XMLPARSER grants are XML XDK dependant
Rem      mhichwa   08/22/2002 - Added f4660 (quick tour technical to install)
Rem      mhichwa   09/10/2002 - Added escape_sc function
Rem      mhichwa   09/17/2002 - Added business_look.sql, petstore.sql
Rem      cbcho     09/17/2002 - Added call to table_drill.sql and .plb
Rem      jstraub   09/17/2002 - Added presidents.sql to demonstration flows, moved collections_showcase.sql to same area
Rem      jstraub   09/17/2002 - Added grants for ctx_doc and ctx_ddl with grant option
Rem      jstraub   09/19/2002 - Added webservices.sql to demonstration flows
Rem      tmuth     10/07/2002 - Added grant select on sys.dba_ind_columns and sys.dba_sequences
Rem      cbcho     10/08/2002 - Added call to wwv_flow_svg.sql and .plb
Rem      mhichwa   10/10/2002 - Added customized
Rem      mhichwa   10/12/2002 - Added generic.sql plb
Rem      tmuth     10/14/2002 - Added ctx_ddl
Rem      jkallman  10/14/2002 - Changed script name from ctx_ddl.sql to flow_helptext_ddl.sql
Rem      tmuth     10/24/2002 - Added reports3.sql and reports3.plb
Rem      mhichwa   10/25/2002 - Added f4150.sql
Rem      tmuth     10/28/2002 - Added ctx_ddl.sync_index('WWV_HELPTEXT_IDX') after flow 4200 is installed.
Rem      tmuth     10/28/2002 - Added XLIFF to installation only when db version is 9i R2 or greater
Rem      mhichwa   10/28/2002 - Removed wwv flow java and javachart
Rem      jstraub   11/01/2002 - Added projstat.sql to demonstration flows
Rem      tmuth     11/04/2002 - Added ldap.sql and ldap.plb
Rem      tmuth     11/05/2002 - Fixed db_version statement
Rem      tmuth     11/05/2002 - Fixed 2nd db_version statement
Rem      tmuth     11/06/2002 - Changed install of ldap.sql and .plb to be dynamic based on existence of sys.dbms_ldap
Rem      sspadafo  11/06/2002 - Added custom_auth_ldap.sql and .plb
Rem      tmuth     11/06/2002 - Made install of custom_auth_ldap.sql and .plb dynamic. Supplied ldap warning to users without sys.dbms_ldap.
Rem      tmuth     11/07/2002 - Added pointer to doc/ldap.html
Rem      msewtz    11/13/2002 - Added wwv_flow_edit_query.sql and wwv_flow_edit_query.plb
Rem      tmuth     11/25/2002 - Added meta_cleanup and turned heading
Rem      tmuth     11/26/2002 - Changed order of upgrade and meta_cleanup
Rem      sspadafo  11/28/2002 - Added custom_auth_sso.sql and .plb conditional on existence of Portal SSO package
Rem      tmuth     12/02/2002 - Added view.sql and column_exceptions.sql
Rem      tmuth     12/03/2002 - Removed f4550, added f4660
Rem      tmuth     12/03/2002 - Moved column_exceptions down
Rem      mhichwa   12/04/2002 - Removed obsolete flows 4400, 4450, 4800, 4600, 4650
Rem      msewtz    12/09/2002 - Added Flow 4550
Rem      mhichwa   12/10/2002 - Added wwv_flow_fnd_developer_api.sql and plb
Rem      jstraub   12/11/2002 - Added wwv_flow_download.sql and .plb
Rem      jstraub   12/12/2002 - Added DB version check & exit if less than 9.2
Rem      mhichwa   12/20/2002 - Removed reports.plb
Rem      jkallman  01/02/2003 - Remove all references to flow 4150, per SSpadafore
Rem      jkallman  01/08/2003 - Removed references to wwv_flow_page_cache
Rem      jkallman  01/08/2003 - Removed references to wwv_flow_cache_tables.sql
Rem      cbcho     01/09/2003 - Added wwv_flow_copy_page.sql and plb (Bug 2743418)
Rem      cbcho     01/09/2003 - Removed reference to copy_page.sql
Rem      cbcho     01/16/2003 - Removed reference to copy_plug.sql (Bug 2754327)
Rem      tmuth     01/17/2003 - Added sw_util.sql and sw_util.plb to install
Rem      tmuth     01/29/2003 - Added call to update image prefix of all f4000 flows on install
Rem      tmuth     01/31/2003 - Added wwv_flow_quick_flow to install
Rem      jstraub   02/04/2003 - Fixed call to wwv_flow_quick_flow, precede with @^PREFIX.
Rem      jstraub   02/06/2003 - Fixed call to wwv_flow_quick_flow, precede with core/
Rem      jkallman  02/06/2003 - Added grant on sys.dbms_flashback
Rem      jkallman  02/14/2003 - Conditionally invoke flow_helptext for 9i/10i
Rem      mhichwa   02/19/2003 - Added popup.sql and popup.plb
Rem      jstraub   02/24/2003 - Removed prompts about errors if installing in 8i, no longer support installing in 8i
Rem      tmuth     02/24/2003 - Bug 2772864: Added dynamic computation of image directory and tablspaces IF upgrading.
Rem      tmuth     02/24/2003 - Added max() to query that determines db version ensuring only 1 row is returned.
Rem      jstraub   02/25/2003 - Changed naming convention from based on date, to based on version
Rem      jstraub   02/25/2003 - Added generate_table_api.* for bug #2819189
Rem      tmuth     02/26/2003 - Set spool off first, then spool all inputs and don't stop spooling until end of install.
Rem                             Changed exit calls from a different file to use "whenever sqlerror exit" and intentially
Rem                             issue erroneous sqlstmnt after printing out error.
Rem      tmuth     02/27/2003 - Added termout off/on around pl/sql anonymous block to hide error that is trapped anyway.
Rem      jstraub   03/03/2003 - Removed grants and synonyms for SYS.XSLPROCESSOR, SYS.XMLDOM, SYS.XMLPARSER
Rem      tmuth     03/07/2003 - Added "whenever sqlerror exit" around sys connect.  Modified how flows owner is computed.
Rem                             Modified how temporary and image directories are computed.
Rem      jstraub   03/11/2003 - Added as file separate from ins.sql, with all parameters passed in
Rem      jstraub   03/11/2003 - Changed to stay connected as SYS user at all times, issue alter session set current_schema
Rem      jstraub   03/11/2003 - Changed call to ctx_ddl.sync_index, to use wwv_execute_immediate to be compatible with commment above
Rem      jstraub   03/11/2003 - Removed all unnecessary comments
Rem      jstraub   03/17/2003 - Added xmlschema.* per msewtz
Rem      jstraub   03/25/2003 - Removed wstab.sql, ddl moved to tab.sql and trigger.sql
Rem      cbcho     04/02/2003 - Added wwv_flow_hint.sql and plb
Rem      tmuth     04/07/2003 - Added core/table_ddl_changes.sql
Rem      jstraub   04/08/2003 - Added wwv_flow_regexp.sql and wwv_flow_regexp9.plb or wwv_flow_regexp.plb, based on db version
Rem      jstraub   04/10/2003 - Removed f4750 (Runtime Flow) - obsolete
Rem      cbcho     04/10/2003 - Added wwv_flow_gen_hint.sql and plb
Rem      cbcho     04/15/2003 - Added wwv_flow_series_attr.sql and plb
Rem      jstraub   04/16/2003 - Removed project status tracking demonstration
Rem      jstraub   04/22/2003 - Added set defines after running of builder flows
Rem      jstraub   04/29/2003 - Added comments.sql and hint_seed.sql per sbkenned
Rem      jkallman  05/02/2003 - Moved meta_cleanup.plb, wwv_flow_upgrade.plb
Rem      sspadafo  05/05/2003 - Added wwv_flow_element.sql and .plb
Rem      jkallman  05/05/2003 - Removed call to core/trans.sql (obsolete)
Rem      jstraub   05/12/2003 - Removed 9iR2 check for running of wwv_flow_xliff.*
Rem      cbcho     05/12/2003 - Removed entry for wwv_flow_vbschart.sql and plb
Rem      jkallman  05/13/2003 - Correct invocation of wwv_flow_element.* (was not referencing core directory)
Rem      jkallman  05/13/2003 - Remove reference to builder/f4955.sql
Rem      jkallman  05/14/2003 - Added reference to builder/f4411.sql
Rem      jkallman  05/15/2003 - Load f4411.sql before all other flows
Rem      jstraub   05/20/2003 - Added edit_report.* and query_api.* for bug 2861658
Rem      jstraub   05/20/2003 - Changed reference from Project Marvel to Oracle HTML DB
Rem      cbcho     05/20/2003 - Added imp_parser.sql and plb
Rem      jstraub   05/29/2003 - Removed stage.sql, wwv_flow_xml_deploy.*, wwv_flow_xml_export.*, wwv_flow_xml_import.*,
Rem                             wwv_flow_gen_xml.*, xmlschema.*, bug 2972214
Rem      jstraub   05/29/2003 - Removed wwv_flow_edit_query.*, load_xml_structure.sql and load_xml_mapping.sql
Rem      jstraub   05/30/2003 - Removed f4250.sql, since it is obsolete
Rem      tmuth     06/16/2003 - Added timer to various components of flows install, bug:2772866
Rem      jstraub   06/19/2003 - Added flows_release.sql and stmt to update flow_version in wwv_flows with value of wwv_flows_release
Rem      jkallman  06/20/2003 - Added call to htmldb_admin.sql (bug 3017850)
Rem      sspadafo  06/21/2003 - Add wwv_flow_developer_toolbar.sql/.plb (Bug 3018687)
Rem      jkallman  06/23/2003 - Added call to flow_isc.* (Bug 3020053)
Rem      jkallman  06/26/2003 - Modified printed URLs at end of installation to include ref to htmldb_admin
Rem      jkallman  06/26/2003 - Added additional argument for Administration password, ordered reports3.sql after auth.sql
Rem      jkallman  06/30/2003 - Order flow_isc.sql before home.sql
Rem      jstraub   07/16/2003 - Removed f4850.sql per mhichwa
Rem      jkallman  08/04/2003 - Added call to flows_files_upgrade.sql during upgrade installation (Bug 3033761)
Rem      jstraub   08/05/2003 - Changed reference in example URL from development_service_home to htmldb (Bug 3078080)
Rem      jstraub   08/05/2003 - Removed installing business_look demonstration, replaced with wwv_flow_sample_app.sql (Bug 3044729)
Rem      jstraub   08/06/2003 - Removed logic of only running wwv_flow_web_services.plb if database is 9.2 (Bug 3085909)
Rem      jstraub   08/06/2003 - Removed APPPW, replace with ADM_PWD, and used it for the flows_files password
Rem      jkallman  08/15/2003 - Remove call to flow_helptext_ddl_10.sql (replace with null1.sql, Bug 3091983)
Rem      jstraub   08/18/2003 - Removed build optioning out of Data Workshop (Bug 3065853)
Rem      jkallman  08/18/2003 - Remove invocation of fileutil.sql, sys.dbms_java permissions, removed all references to P_IMG_DIR (Bug 3063954)
Rem      jstraub   08/20/2003 - Removed flow_helptext_ddl.sql and f4200.sql, help replaced with static html in images directory
Rem      jkallman  08/22/2003 - Set termout before and after grants on ctx_doc, ctx_ddl
Rem      jstraub   08/22/2003 - Added wwv_flow_sample_app.plb
Rem      jstraub   08/26/2003 - Removed flow 4660
Rem      jstraub   08/28/2003 - Disabled trigger bi_wwv_dictionary$_fer before sqlldr call, and enable after.
Rem                             Trigger no longer necessary on load, due to new english.ctl file which includes all columns (bug 3115564)
Rem      jkallman  08/28/2003 - Remove installation of f4100
Rem      jstraub   08/29/2003 - Removed gen_demo.sql
Rem      jstraub   09/02/2003 - Added wwv_flow_help.sql
Rem      jstraub   09/25/2003 - Removed duplicate grant for create any directory
Rem      jstraub   09/25/2003 - Removed installing petstore, platdemo.*, f4955_demo.sql and f145_demo.sql
Rem      jstraub   09/25/2003 - Added conditionally creating hmldb_public_user, and lock accounts of flows_files & ^APPUN
Rem      jstraub   09/29/2003 - Added with admin option to create database link priv, added create job, library to privs granted (Bug 3159606)
Rem      tmuth     10/03/2003 - Added XML DB as required in the XML XDK / XML DB related section of installation (3172569)
Rem      jstraub   10/06/2003 - Added inserts into wwv_flow_platform_prefs for default SMTP server settings
Rem      jstraub   10/08/2003 - Added htmldb_util.*, htmldb_item.*, htmldb_custom_auth.* (Bug 3180502)
Rem      jstraub   10/16/2003 - Added htmldb_lang.*
Rem      jstraub   02/11/2004 - Removed duplicate references to flowl.sql and plsqljob.sql, moved call to switch_schemas to before
Rem                             package bodies, moved meta_cleanup.plb to before and after call to switch_schemas, moved v.sql to
Rem                             before trigger.sql, moved meta_cleanup.plb before and after call to switch_schemas in order to
Rem                             avoid invalid objects at the end of installation (Bug 3425094)
Rem      jstraub   03/03/2004 - Moved htmldb_item.sql before flowu.sql, since flowu.sql now references object in htmldb_item (bugs 3174478, 3119694)
Rem      jstraub   03/05/2004 - Removed description of ADMIN user in insert into wwv_flow_fnd_user (Bug 3191317)
Rem      jstraub   03/25/2004 - Added grant all on wwv_flow_file_objects$ to ^APPUN after flows_files script (Bug 3532644)
Rem      cbcho     04/06/2004 - Added wwv_flow_form_control.sql and plb
Rem      klrice    04/26/2004 - wwv_flow_calendar3.sql and plb
Rem      cbcho     05/19/2004 - Added wwv_flow_data_quick_flow.sql and plb
Rem      jkallman  06/02/2004 - Remove call to import_export.sql
Rem      jkallman  06/02/2004 - Remove calls to xmlutil.sql and xmlutil.plb
Rem      jkallman  06/08/2004 - Add wwv_flow_svg_util.sql and wwv_flow_svg_util.plb
Rem      skutz     06/10/2004 - added theme calls
Rem      cbcho     06/15/2004 - Remove calls to wwv_flow_quick_flow.sql and wwv_flow_quick_flow.plb
Rem      jstraub   06/17/2004 - Added in-line upgrade logic not requiring user intervention to upgrade from 1.5.*
Rem      jstraub   06/17/2004 - Corrected URLS at end of installation to coincide with Install Guide (bug 3332996)
Rem      jstraub   06/21/2004 - Added wwv_flow_theme_files.* for mhichwa
Rem      jstraub   07/08/2004 - Altered to only run hint_seed.sql if new install
Rem      jstraub   07/14/2004 - Removed consideration of FLOWS_010501 schema per conversation with jkallman
Rem      jkallman  07/14/2004 - Added wwv_flow_help.plb
Rem      jkallman  07/27/2004 - Remove references to wwv_flow_svg_util.*
Rem      jkallman  08/05/2004 - Remove references to wwv_flow_xml_report.* and wwv_flow_xml_report2.*
Rem      sspadafo  08/12/2004 - Added htmldb_site_admin_privs.sql/.plb
Rem      jstraub   08/13/2004 - Moved each call to wwv_flow_upgrade in own block with commit
Rem      jstraub   08/27/2004 - Added call to wwv_flow_upgrade.template_name_cleanup if upgrade (Bug 3858934)
Rem      jstraub   09/09/2004 - Moved audit.sql before trigger.sql to support new trigger references to wwv_flow_audit.g_cascade
Rem      jstraub   09/23/2004 - Added wwv_flow_login.* for 4550 per mhichwa
Rem      jkallman  10/31/2004 - Remove calls to utilities/backup_utilities/flows_backup.*
Rem      skutz     12/14/2004 - Added additional feedback to upgrade processes (Bug 4064137)
Rem      sspadafo  01/08/2005 - Add wwv_flow_ppr_util.sql/.plb
Rem      klrice    01/26/2005 - Add wwv_flow_query_builder.sql/.plb
Rem      cbcho     01/27/2005 - Add wwv_flow_sw_script.sql and plb
Rem      msewtz    01/31/2005 - Added wwv_flow_render_query.sql/plb
Rem      jkallman  02/07/2005 - Corrected reference to portal_sso.html
Rem      jkallman  02/07/2005 - Added wwv_flow_sw_object_feed.sql and plb
Rem      sspadafo  02/08/2005 - Add wwv_flow_list.sql/.plb
Rem      jkallman  02/16/2005 - Move auth.sql before flowu.sql
Rem      cbcho     02/18/2005 - Removed wwv_flow_parser.sql/.plb,wwv_flow_parser_public.sql/plb
Rem      jkallman  02/21/2005 - Added wwv_flow_sw_parser.sql/plb
Rem      msewtz    03/02/2005 - Added wwv_flow_plsql_editor.sql/plb
Rem      msewtz    03/07/2005 - Added wwv_flow_model_api.sql/plb
Rem      cbcho     03/14/2005 - Added inserts into wwv_flow_platform_prefs for default script max size settings and PLSQL editing flag
Rem      cbcho     03/25/2005 - Added wwv_flow_create_model_app.sql/plb
Rem      jkallman  04/11/2005 - Remove calls to wwv_flow_file_system.*
Rem      jkallman  04/14/2005 - Add system preference WORKSPACE_PROVISION_DEMO_OBJECTS, added references to wwv_flow_sc_transactions.
Rem      jkallman  04/19/2005 - Change YES system preference seed values to Y
Rem      jkallman  04/25/2005 - Added system preference ENABLE_TRANSACTIONAL_SQL
Rem      jkallman  05/02/2005 - Add wwv_flow_user_api.sql before trigger.sql, modified system preference for ENABLE_TRANSACTIONAL_SQL to be Y
Rem      jkallman  05/04/2005 - Add wwv_flow_session_mon.sql and wwv_flow_session_mon.plb
Rem      jkallman  05/05/2005 - Removed core/comments.sql
Rem      jkallman  05/10/2005 - Seed values for system preferences DISABLE_ADMIN_LOGIN, DISABLE_WORKSPACE_LOGIN
Rem      jkallman  05/19/2005 - Add conditional compilation of wwv_flow_sql_injection.sql/plb, add grants for SQL injection packages
Rem      jkallman  05/27/2005 - Add wwv_flow_sw_page_calls.sql/plb
Rem      cbcho     06/02/2005 - Added call to wwv_flow_upgrade.sw_cleanup
Rem      jkallman  06/10/2005 - Remove sqlldr reference, call dictionary_load.sql (Bug 4411739)
Rem      cbcho     06/13/2005 - Added wwv_flow_sw_upgrade.sql/plb
Rem      jduan     07/07/2005 - Modify for upgrade to 2.0
Rem      jkallman  07/08/2005 - Add seed value for system preference ALLOW_DB_MONITOR
Rem      jkallman  07/11/2005 - Add seed value for system preference SERVICE_DEFAULT_FLOW
Rem      jduan     07/13/2005 - List job_queue_processes
Rem      sspadafo  07/14/2005 - Add seed values for wwv_flow_restricted_schemas
Rem      sspadafo  07/14/2005 - Fix condition around block that adds seed values for wwv_flow_restricted_schemas
Rem      jduan     07/15/2005 - Check for database version around grant of create job (Bug 4228236)
Rem      jkallman  07/18/2005 - Correct errors with block to seed restricted schemas
Rem      jkallman  08/02/2005 - Add UFROM in p_from parameter to upgrade_to_020000
Rem      jkallman  09/14/2005 - Add calls to wwv_flow_xe_config.sql/plb
Rem      jkallman  09/21/2005 - Add conditional compilation for XE packages
Rem      jkallman  09/22/2005 - Move compilation of wwv_flow_val to primary SYS section
Rem      jkallman  09/22/2005 - Add conditional compilation for wwv_flow_login(_xe)
Rem      jkallman  09/27/2005 - Grant DBA to APPUN if XE
Rem      jkallman  09/29/2005 - Remove 4200 from installation
Rem      jkallman  09/29/2005 - Only restrict HR and SCOTT if not XE
Rem      jkallman  10/17/2005 - Add TSMSYS to list of restricted schemas (Bug 4659228)
Rem      sspadafo  10/25/2005 - Compile wwv_flow_val.sql and wwv_flow_val.plb as separate files sequenced to allow compilation of auth.sql and auth.plb
Rem      sspadafo  10/25/2005 - Remove XE-only condition on wwv_flow_val.sql
Rem      sspadafo  10/25/2005 - Compile sw_api_xe.plb, wwv_flow_render_query_xe.plb for XE only and sw_api.plb, wwv_flow_render_query.plb for non-XE only
Rem      jkallman  10/26/2006 - Remove conditional compilation of sw_api.sql and wwv_flow_render_query.sql
Rem      jkallman  10/27/2005 - Add grant of ALTER SYSTEM (Bug 4704840)
Rem      jkallman  11/10/2005 - Add conditional compilation of sw_util.plb and sw_util_xe.plb (Bug 4730186)
Rem      jkallman  11/14/2005 - Add conditional compilation of sw_util.sql and sw_util_xe.sql (Bug 4730186)
Rem      sspadafo  11/16/2005 - Remove conditional compilation of sw_util.sql and sw_util_xe.sql (now gone), replace with unconditional sw_util.sql (Bug 4730186)
Rem      sspadafo  11/22/2005 - Add conditional compilation for xe of wwv_flow_epg_include_local.sql, wwv_flow_epg_include.sql
Rem      sspadafo  11/27/2005 - Change rule for conditional compilation of custom_auth_sso.plb to compile custom_auth_sso_902.plb instead in some cases (Bug 4244603)
Rem      jkallman  11/29/2005 - Move compilation of wwv_flow_epg_include.sql and wwv_flow_epg_include_local.sql after flow.sql
Rem      sspadafo  11/30/2005 - Add grant execute on SYS.dbms_crypto to APPUN if XE
Rem      sspadafo  12/02/2005 - Add conditional compilation for xe of wwv_flow_epg_include.plb, now split into separate .sql/.plb files
Rem      jkallman  12/03/2005 - Remove wwv_flow_runtime_dist
Rem      jkallman  12/06/2005 - Add wwv_flow_dynsql_util.sql and conditional compilation of wwv_flow_dynsql_util[_xe].plb (Bug 4864382)
Rem      jkallman  12/06/2005 - Always set SSO_PLB to null1.sql if XE
Rem      jkallman  12/08/2005 - Lock APPUN and FLOWS_FILES if XE
Rem      sspadafo  12/09/2005 - Remove compilation of wwv_test_apps.sql (obsolete) (Bug 4864511)
Rem      jkallman  12/09/2005 - Remove unused debug tables
Rem      sspadafo  12/10/2005 - Remove compilation of pmessage.sql/.plb (obsolete) (Bug 4870920)
Rem      sspadafo  12/10/2005 - Remove insert of 'TEST' into wwv_flow_restricted_schemas
Rem      jkallman  12/16/2005 - Remove flowm.*, flowa.*, compile app_auth if not XE (Bugs 4871017, 4870818, 4870818)
Rem      jkallman  12/16/2005 - Change update of flow_version of internal applications to not show version number in 4550 (Bug 4886104)
Rem      jkallman  12/20/2005 - Remove deprecated files wwv_apply_configuration.sql, gen_trans.sql, flow_designer.sql (Bug 4886210)
Rem      jkallman  12/20/2005 - Add direct grants on sys.utl_http, sys.utl_smtp and sys.utl_file to APPUN
Rem      jkallman  01/19/2006 - Replace htmldb_admin with apex_admin, change other occurrences of HTML DB
Rem      jkallman  01/23/2006 - Adjust XE flag to 0, modify calculation of upgrade schema to account for versions prior to 2.2
Rem      madelfio  01/30/2006 - Added wwv_flow_install_wizard.sql/plb
Rem      jkallman  02/14/2006 - Add direct grants on sys.dbms_lob to APPUN
Rem      jkallman  02/17/2006 - Add themes 13,14,15 - also change upgrade procedure to upgrade_to_020200
Rem      jduan     02/20/2006 - Change foo_user to foo_usr in the select statement on line 500
Rem      cbcho     03/02/2006 - Remove compilation of webservices.sql/.plb (obsolete)
Rem      cbcho     03/02/2006 - Remove compilation of presidents.sql/.plb (obsolete)
Rem      jduan     03/03/2006 - Change the query that determins the existence of wwsec_sso_enabler_private for SSO
Rem      jduan     03/08/2006 - Add column name 'temp' to the query that determins the existence of wwsec_sso_enabler_private for SSO (bug 5084545)
Rem      jkallman  03/23/2006 - Remove flow_ views created in SYS schema from previous installations
Rem      jkallman  03/24/2006 - Merged XE and previous help packages, removed wwv_flow_help_xe from installation (Bug 5112535)
Rem      jkallman  03/24/2006 - Changed creation of HTMLDB_PUBLIC_USER to APEX_PUBLIC_USER
Rem      cbcho     03/30/2006 - Added wwv_flow_wiz_confirm.sql/plb
Rem      jkallman  04/25/2006 - Add audit.plb, audit_trigger.sql (Bug 5070914)
Rem      jkallman  04/26/2006 - Remove grants of execute any procedure, create database link (Bug 4922214)
Rem      jkallman  04/27/2006 - Remove g_xe condition from grant on sys.dbms_crypto.  Silently fail if it does not exist.
Rem      jduan     04/27/2006 - Added logic to handle the conditional compilation of custom_auth_sso.sql and custom_auth_sso_902.sql
Rem      jkallman  05/01/2006 - Grant execute on previous version's wwv_flows_version procedure, as no longer granted execute any procedure
Rem      jkallman  05/03/2006 - Correct grant on wwv_flows_version procedure (Bug 5202724)
Rem      jkallman  05/09/2006 - Add themes 16 and 17
Rem      jkallman  06/02/2006 - Remove conditional compilation from wwv_flow_regexp.plb
Rem      msewtz    06/13/2006 - Added wwv_flow_page_cache_api.sql and wwv_flow_page_cache_api.plb
Rem      jkallman  06/16/2006 - Added wwv_flow_f4000_util.sql and wwv_flow_f4000_util.plb
Rem      jstraub   06/21/2006 - Added logic to register APEX as a server component of the database
Rem      jstraub   06/22/2006 - Added timing for validating installation
Rem      jstraub   06/22/2006 - Added SQLPlus column called version to use with both updating flow_version in wwv_flows and registering APEX as component
Rem      jstraub   06/22/2006 - Added desc to query that determines UFROM to ensure proper upgrade (bug 5343712)
Rem      mhichwa   06/23/2006 - Added core/apex_views.sql to install apex views for the purpose of system doc and developer productivity
Rem      msewtz    06/26/2006 - Added wwv_flow_theme_18.sql/plb
Rem      sspadafo  06/26/2006 - Added imgapi_public.*, cssapi_public.*, htmlapi_public.*
Rem      jstraub   06/29/2006 - Added logic to put validate_apex as standalone procedure again on advice from rburns
Rem      jstraub   06/29/2006 - Moved registering FLOWS_FILES as auxilary schema in execute immediate calls to sys.DBMS_REGISTRY for compatibility prior to 10.2 (bug 5366916)
Rem      jstraub   07/11/2006 - Removed creating new ADMIN user in internal, as well as FLOWS as developer user
Rem      jstraub   07/11/2006 - Fixed above so ADMIN user is created in new installation
Rem      jkallman  07/18/2006 - Restore grant of execute any procedure
Rem      jkallman  07/19/2006 - Always compile wwv_flow_epg_include* files
Rem      jkallman  07/19/2006 - Remove refererences to portal_sso.html, ldap.html
Rem      jkallman  08/01/2006 - Alter grant of create job to check for appropriate db version
Rem      jstraub   08/11/2006 - Added PREFIX to allow calling files either based on Oracle home or current working directory
Rem      jstraub   08/14/2006 - Added calls to sys.dbms_registry.set_required_comps for 11g
Rem      sspadafo  08/20/2006 - Consolidated xe and non-xe versions of wwv_flow_render_query.plb, wwv_flow_dynsql_util.plb, wwv_flow_sw_api.plb, wwv_flow_sw_util.plb (Bug 5453611)
Rem      sspadafo  08/20/2006 - Added wwv_flow_dynsql_parse.sql, wwv_flow_dynsql_parse.plb (pre-10.2.0.3/non-xe) and wwv_flow_dynsql_parse_roles.plb (10.2.0.3/xe) (Bug 5453611)
Rem      sspadafo  08/21/2006 - Made wwv_flow_dynsql_parse_roles.plb compile conditionally using db version check logic enabled after flowu.plb compiles
Rem      jstraub   08/22/2006 - Wrapped passwords in create user statements in double quotes to support apxdbmig.sql (random password)
Rem      jstraub   08/24/2006 - Changed condition on wwv_flow_dynsql_parse_roles.plb to include compilation for XE edition
Rem      jkallman  09/29/2006 - Add FLOWS_020200 to previous version query, change upgrade to call upgrade_to_030000
Rem      sspadafo  11/27/2006 - Added @^PREFIX.core/wwv_flow_builder30.sql and @^PREFIX.core/wwv_flow_builder30.plb (for Mike)
Rem      sspadafo  11/27/2006 - Added select grants on sys tables/views and removed "select any table" grant from APPUN (Bug 5684179)
Rem      sspadafo  11/27/2006 - Added update of wwv_flow_fnd_user.expiry columns to set to sysdate if they are null (new account management features)
Rem      sspadafo  11/27/2006 - Changed insert into wwv_flow_fnd_user for ADMIN account, set new columns (new account management features)
Rem      sspadafo  11/30/2006 - Restored "grant select any table", this fix will be deferred (Bug 5684179)
Rem      sspadafo  12/01/2006 - Fixed date on previous Rem. Removed "grant select any dictionary to ^APPUN;" (Bug 5684179)
Rem      sspadafo  12/02/2006 - Added more select grants on sys tables (Bug 5684179)
Rem      sspadafo  12/04/2006 - Add "grant select on sys.dba_tab_comments to ^APPUN;" (Bug 5684179)
Rem      jstraub   12/06/2006 - Added wwv_flow_print_util.*
Rem      hfarrell  12/07/2006 - Added 4400 install statements, commented as Application Migration Workshop
Rem      sspadafo  12/11/2006 - Removed HR from restricted schema insert statements (per sbkenned, bug 5712312)
Rem      jkallman  12/12/2006 - Conditionally grant certain 10g and greater SYS privileges, correct insert into wwv_flow_fnd_user,
Rem                             add compilation of wwv_flow_flash_chart, change wwv_flow_builder30 to wwv_flow_page_map
Rem      sspadafo  12/12/2006 - Added bug number to 'HR' fix, above
Rem      jkallman  12/15/2006 - Add output before component validation
Rem      jkallman  12/19/2006 - Remove feedback.sql
Rem      jkallman  12/22/2006 - Remove grant of CREATE LIBRARY system privilege (Bug 5729908)
Rem      jkallman  01/06/2007 - Remove SQL Injection packages and grants
Rem      cbcho     01/09/2007 - Added compilation of wwv_flow_flash_chart_util.sql/plb
Rem      jkallman  01/11/2007 - Add call to verification_images_load.sql
Rem      jkallman  01/11/2007 - Change incorrect compilation of wwv_flow_page_cache_api.sql to wwv_flow_page_cache_api.plb
Rem      jkallman  01/15/2007 - Move flow.sql before auth.sql
Rem      msewtz    01/22/2007 - Added PRINT_BIB_LICENSED to platform preferences
Rem      jkallman  01/23/2007 - Add call to apex_install_data.sql
Rem      sspadafo  01/24/2007 - Added LBACSYS, DVSYS, DVF, AVSYS to restricted schema insert statements for label security, database vault, audit vault
Rem      cbackstr  01/26/2007 - Added compilation of wwv_flow_drag_layout.sql/plb
Rem      sspadafo  01/27/2007 - Revise block that creates flows_files user
Rem      sspadafo  01/27/2007 - Remove obsolete generic_login.sql/.plb directives
Rem      sspadafo  01/28/2007 - Revise block that alters flows_files user during upgrade
Rem      sspadafo  01/28/2007 - Remove grants of select/drop any directory privilege to APPUN
Rem      sspadafo  01/29/2007 - Added with grant option to grant execute on sys.dbms_lob to APPUN
Rem      jkallman  01/30/2007 - Add wwv_flow_image_generator.sql and wwv_flow_image_generator.plb
Rem      jkallman  02/06/2007 - Add compilation of wwv_flow_image_prefix.sql
Rem      jstraub   02/08/2007 - Removed WHENEVER SQLERROR statements to comply with component install/upgrade guidelines
Rem      sspadafo  02/09/2007 - Add "grant select on sys.dba_trigger_cols to ^APPUN;" (Bug 5872695)
Rem      jkallman  02/19/2007 - Add grant on sys.v_$process to ^APPUN (Bug 5860771)
Rem      jkallman  03/09/2007 - Account for ungranted role when revoking privs from FLOWS_FILES
Rem      jstraub   04/10/2007 - Added conditional setting of WHENEVER SQLERROR EXIT before installing internal applications, if manual install
Rem      jstraub   04/11/2007 - Fixed conditional logic of running apxsqler.sql, should run if INSTALL_TYPE is MANUAL
Rem      jstraub   05/01/2007 - Added Oracle XML DB HTTP listener with the embedded PL/SQL gateway to end of install prompts for link structures
Rem      jstraub   05/08/2007 - Removed grant on sys.dba_java_policy for lrg 2947476
Rem      jstraub   07/13/2007 - Split off files to support runtime, devins.sql, core_grants.sql, dev_grants.sql, endins.sql
Rem      jkallman  08/02/2007 - Change reference to wwv_flow_upgrade.upgrade_to_030100
Rem      jstraub   08/13/2007 - Added worksheet specs and bodies
Rem      jstraub   08/16/2007 - Moved wwv_flow_sample.* to before provision.plb
Rem      jstraub   08/28/2007 - Added wwv_flow_worksheet_dialog.* for worksheets
Rem      jstraub   09/05/2007 - Removed wwv_flow_worksheet_webpage.*
Rem      jstraub   09/06/2007 - Added wwv_flow_instance_admin.*
Rem      jkallman  09/11/2007 - Remove app_auth.* (Bug 6355820)
Rem      cbcho     09/13/2007 - Added wwv_flow_worksheet_form.*
Rem      jstraub   09/18/2007 - Added role APEX_ADMINISTRATOR_ROLE and installing internal 4155 to support runtime
Rem      jkallman  10/11/2007 - Added wwv_flow_worksheet_ajax.*
Rem      jkallman  10/12/2007 - Added wwv_flow_calendar_ajax.*
Rem      cbcho     11/06/2007 - Added wwv_flow_flash_chart2.*
Rem      cbcho     11/06/2007 - Moved wwv_flow_flash_chart2.* above wwv_flow_flash_chart_util.*
Rem      jkallman  11/08/2007 - Added creation of nv stub
Rem      jkallman  11/21/2007 - Move compilation of v.sql after plug.sql (new dependencies on region id)
Rem      nagkrish  11/22/2007 - Seed values for system preferences DISABLE_WS_PROV, REQ_NEW_SCHEMA
Rem      jkallman  12/13/2007 - Move wwv_flow_fnd_developer_api.sql before provisioning_tables.sql
Rem      jkallman  12/13/2007 - Added wwv_flow_theme_1-20.* (dependencies in wwv_flow_theme_manager)
Rem      jstraub   12/19/2007 - Changed creating APEX_ADMINISTRATOR_ROLE only if it does not already exist
Rem      jstraub   01/07/2008 - Added wwv_flow_assert.*
Rem      jkallman  01/11/2008 - Moved up compilation of wwv_flow_assert package body
Rem      madelfio  01/17/2008 - Added wwv_flow_rpt_std_msg.*
Rem      jkallman  01/25/2008 - Moved compilation of crypt.plb
Rem      jstraub   01/29/2008 - Removed ^XE substituion and all references
Rem      jkallman  01/30/2008 - Compile wwv_dbms_sql.*
Rem      jkallman  01/31/2008 - Remove dynsql.*, wwv_flow_dynsql.*, wwv_flow_dynsql_util.*;  Add wwv_dbms_sql_noroles.plb
Rem      jkallman  02/01/2008 - Reorder compilation of wwv_flow_sw_parser.sql, move flows_files_objects_remove and create.
Rem      jkallman  02/04/2008 - Move up compilation of wwv_dbms_sql
Rem      jkallman  02/05/2008 - Add recompilation of wwv_dbms_sql to upgrade steps
Rem      jkallman  02/16/2008 - Change order of wwv_flow_worksheet_standard.sql and wwv_flow_worksheet_expr.sql
Rem      jkallman  02/19/2008 - Remove wwv_flow_worksheet_geocode
Rem      jkallman  02/21/2008 - Remove wwv_flow_worksheet_import
Rem      jstraub   04/02/2008 - Added wwv_flow_create_app_from_query.*
Rem      jstraub   04/17/2008 - Removed compilation of custom_auth_sso packages, moved to utilities script
Rem      cbcho     05/27/3008 - Removed wwv_flow_worksheet_stickies, wwv_flow_worksheet_attachment, wwv_flow_worksheet_ui
Rem      jkallman  07/08/2008 - Change reference to wwv_flow_upgrade.upgrade_to_040000
Rem      jkallman  07/09/2008 - Add compilation of wwv_flow_stylesheets.*, wwv_flow_javascript.*
Rem      jstraub   07/10/2008 - Added wwv_flow_ws*.* and wwv_wg*.* packages
Rem      jkallman  07/17/2008 - Add explict create synonym grant to FLOWS_FILES, per DAlpern 11.2 change (Bug 6690853)
Rem      sspadafo  07/20/2008 - Revoke/re-grant unlimited tablespace to da flows to rid it of the "admin option" (Bug 7225208)
Rem      jstraub   07/22/2008 - Changed creating APEX_PUBLIC_USER as locked account to be consistent with documentation
Rem      cbcho     07/28/2008 - Removed compilation of wwv_flow_ws_getfile.sql
Rem      jkallman  09/16/2008 - Reorder compilation of wwv_flow_ws_api.sql and wwv_dbms_sql for new dependencies
Rem      mhichwa   10/15/2008 - Modernized prompts printed during installation to reference Oracle APEX and not flows
Rem      mhichwa   10/15/2008 - Commented out the loading of the english dictionary
Rem      mhichwa   10/15/2008 - Added additional sections for locking the apex account (XIII) and upgrades (IX)
Rem      mhichwa   10/15/2008 - Added additional timeing to locate why regristry is taking too long
Rem      jkallman  11/14/2008 - Change default of ALLOW_DB_MONITOR to N
Rem      sspadafo  01/24/2009 - Added insert statements for platform prefs default values for ALLOW_PUBLIC_FILE_UPLOAD, STRONG_SITE_ADMIN_PASSWORD, MAX_SESSION_LENGTH_SEC, MAX_SESSION_IDLE_SEC
Rem      sspadafo  01/25/2009 - Removed "update wwv_flow_fnd_user set account_expiry ..." (moved to upgrade_to_040000)
Rem      jstraub   01/29/2009 - Moved wwv_flow_fnd_user_api.sql prior to trigger.sql
Rem      sspadafo  01/29/2009 - Added compilation, execution, and drop of wwv_flow_create_key_package in SYS section
Rem      sspadafo  01/29/2009 - Added grant execute on sys.wwv_flow_key to ^APPUN;
Rem      sspadafo  01/29/2009 - Fixed file directory error in reference to wwv_flow_create_key_package
Rem      jkallman  01/30/2009 - Changed reference to wwv_flow_create_key_package.plb to be from core directory
Rem      sspadafo  02/03/2009 - Added inserts for wwv_flow_platform_prefs for PASSWORD_ALPHA_CHARACTERS and PASSWORD_PUNCTUATION_CHARACTERS (Bug 8222823)
Rem      jstraub   02/06/2009 - Added wwv_flow_webservices_api.*
Rem      jkallman  02/13/2009 - Compile WWV_DBMS_SQL before call to wwv_flow_upgrade.sw_cleanup (Bug 8240324)
Rem      jstraub   03/24/2009 - Removed spool off, was stopping spool for catupgrd
Rem      pawolf    04/03/2009 - Added package wwv_flow_custom_item_type
Rem      pawolf    04/08/2009 - Renamed wwv_wg_api to new teamspace naming structure
Rem      pawolf    05/14/2009 - Renamed wwv_flow_item_type_plugin to wwv_flow_plugin
Rem      hfarrell  05/20/2009 - Added AnyChart 5 packages: wwv_flow_flash_chart5, wwv_flow_flash_chart5_util
Rem      arayner   06/05/2009 - Added dynamic action package wwv_flow_dyn_actions
Rem      cbcho     06/08/2009 - Removed wwv_ts_auth and added wwv_flow_ws_auth
Rem      cbcho     06/08/2009 - Added wwv_flow_apex_util.sql/plb, wwv_flow_apex_ddl.sql/plb
Rem      sspadafo  06/09/2009 - Added wwv_flow_meta_util.sql/plb
Rem      pawolf    06/10/2009 - Renamed wwv_flow_dyn_actions
Rem      jkallman  07/23/2009 - Move wwv_flow_install_wizard to devins.sql
Rem      pawolf    07/28/2009 - wwv_flow_dynamic_action.sql has to be loaded before wwv_flow_plugin.sql
Rem      jkallman  08/03/2009 - Remove reference to wwv_dbms_sql_noroles.plb
Rem      pawolf    09/11/2009 - Added wwv_flow_native_item
Rem      pawolf    09/21/2009 - Added missing wwv_flow_team
Rem      jkallman  10/05/2009 - Removed wwv_flow_upgrade_report.*
Rem      jstraub   10/30/2009 - Removed spell.*
Rem      jstraub   11/02/2009 - Removed commented code calling dictionary_load.sql
Rem      jkallman  11/25/2009 - Added wwv_flow_maint.*
Rem      arayner   12/08/2009 - Added wwv_flow_native_dynamic_action
Rem      pawolf    12/15/2009 - Added wwv_flow_plugin_f4000 as a temporary workaround, because wizapi and wwv_flow_hint are defined here as well
Rem      jstraub   12/16/2009 - Added wwv_flow_rest.*
Rem      cbcho     12/21/2009 - Added wwv_flow_ws_flash_chart.sql/plb
Rem      pawolf    01/04/2010 - Added wwv_flow_css, removed wwv_flow_stylesheets
Rem      cbcho     01/26/2010 - Removed wwv_flow_apex_ddl.*
Rem      jkallman  01/27/2010 - Added wwv_flow_debug_messages.*
Rem      cbcho     01/29/2010 - Removed wwv_flow_apex_util.*, added wwv_flow_ws_setup.*
Rem      cbcho     01/29/2010 - Added wwv_flow_ws_install_data.sql
Rem      jkallman  01/29/2010 - Added wwv_flow_application_install.*
Rem      pawolf    02/05/2010 - Added wwv_flow_plugin_util and wwv_flow_plugin_engine
Rem      jkallman  02/11/2010 - Correct references to wwv_flow_debug_message.*, add wwv_flow_ws_security.*
Rem      pawolf    02/11/2010 - Removed wwv_flow_plugin_f4000.plb
Rem      cbcho     02/11/2010 - Added apex_ws_views.sql
Rem      jkallman  02/24/2010 - Added wwv_flow_tree_region.*
Rem      jkallman  02/24/2010 - Added ws.sql
Rem      jkallman  02/24/2010 - Add AUTOEXTEND_TABLESPACES to wwv_flow_platform_prefs
Rem      jkallman  03/08/2010 - Add WORKSPACE_WEBSHEET_OBJECTS to wwv_flow_platform_prefs
Rem      pawolf    03/16/2010 - Added wwv_flow_native_process.*
Rem      jkallman  03/24/2010 - Added system preference for WEBSHEET_SQL_ACCESS
Rem      jkallman  03/24/2010 - Added grant of "select any table" to facilitate upgrade, and then added revoke
Rem      jkallman  03/31/2010 - Removed drop of package sys.wwv_flow_create_key_pkg
Rem      jkallman  04/01/2010 - Add purge_tab.sql, wwv_purge.*
Rem      jkallman  04/05/2010 - Removed purge_tab.sql
Rem      cbcho     04/09/2010 - Added wwv_flow_ws_export.*, wwv_flow_ws_import_api.*
Rem      jstraub   04/12/2010 - Added call to wwv_flow_ws_setup.install prior to compiling wwv_flow_ws_import_api.plb
Rem      jstraub   04/15/2010 - Fixed above by putting inside PL/SQL anonymous block
Rem      jstraub   04/15/2010 - Fixed above again by setting wwv_flow_security.g_context := WWV_FLOW_UPGRADE
Rem      jstraub   04/26/2010 - Added wwv_flow_upgrade_app.*
Rem      jkallman  04/27/2010 - Added wwv_flow_ws_sample.*
Rem      jstraub   05/03/2010 - Added compile of sys.wwv_dbms_sql prior to call to wwv_flow_ws_setup.install for 10.2 installs (bug 9639019)
Rem      jkallman  05/07/2010 - Change default of AUTOEXTEND_TABLESPACES to Y
Rem      jkallman  05/12/2010 - Compile wwv_flow_assert body before running wwv_flow_ws_setup.install
Rem      jstraub   05/12/2010 - Added compile of sys.wwv_dbms_sql and wwv_flow_assert prior to upgrade actions
Rem      jstraub   05/13/2010 - Added compile of wwv_flow and wwv_flow_utilities prior to call to wwv_flow_upgrade.upgrade_to_040000 (bug 9664405)
Rem      jkallman  06/08/2010 - Add default values for require SSL and expiration of APEX accounts to preferences (Bug 9780597)
Rem      jstraub   06/10/2010 - Moved call to endins.sql from devins.sql to coreins.sql (bug 9797996)
Rem      jstraub   10/12/2010 - Moved wwv_flow_f4000_util.* and wwv_flow_plugin_f4000.* to coreins.sql (bug 10104409)
Rem      jkallman  11/03/2010 - Added wwv_flow_theme_21.* and wwv_flow_theme_22.*
Rem      pawolf    11/24/2010 - Removed temp_table_init.sql/plb
Rem      pawolf    11/24/2010 - Removed grant for wwv_flow_lov_temp
Rem      jkallman  12/17/2010 - Added wwv_owa_cookie
Rem      jkallman  01/06/2011 - Set autocommit to off
Rem      pawolf    01/10/2011 - Added new packages wwv_flow_validation and wwv_flow_process
Rem      pawolf    01/12/2011 - Added new package wwv_flow_tabular_form
Rem      pawolf    01/14/2011 - Renamed upgrade_to_040000 to upgrade_to_040100
Rem      cneumuel  02/03/2011 - Added wwv_flow_authorization.* (feature #580)
Rem      jkallman  02/22/2011 - Added APPLICATION_ACTIVITY_LOGGING to wwv_Flow_platform_prefs
Rem      jkallman  02/26/2011 - Moved platform.sql before trigger.sql
Rem      sathikum  02/28/2011 - Added WWV_FLOW_PRIVATE_TO_ADMIN view creation feature #608
Rem      arayner   03/03/2011 - Added new package wwv_flow_button.* (feature #385)
Rem      jstraub   03/03/2011 - Added call to wwv_flow_upgrade.upgrade_ws_to_040100 at end of upgrade tasks
Rem      sathikum  03/08/2011 - removed conditional creation of View WWV_FLOW_PRIVATE_TO_ADMIN (feature #608)
Rem      pawolf    03/09/2011 - Added new package wwv_flow_error.*
Rem      cneumuel  03/10/2011 - Fixed typo in grant of WWV_FLOW_PRIVATE_TO_ADMIN
Rem      jkallman  04/01/2011 - Added db_webservices_tab.sql
Rem      jkallman  04/01/2011 - Added INSTANCE_ID to wwv_flow_platform_prefs
Rem      jkallman  04/05/2011 - Expire passwords of created database accounts
Rem      jkallman  04/08/2011 - Set internal cookie name to include Instance ID, after prefs are copied
Rem      jkallman  04/12/2011 - Compile body of wwv_flow_assert, wwv_flow_security before calling wwv_flow_security.set_internal_cookie_name
Rem      cneumuel  04/18/2011 - Added wwv_flow_session
Rem      jkallman  04/20/2011 - Added REQUIRE_VERIFICATION_CODE to wwv_flow_platform_prefs
Rem      mhichwa   04/21/2011 - Changed REQUIRE_VERIFICATION_CODE to default to N
Rem      jkallman  04/25/2011 - Moved wwv_flow_button.sql to before wizapi.sql, wwv_flow_error.sql to before crypt.plb
Rem      cneumuel  04/26/2011 - Added wwv_flow_db_version.sql (Bug 12395197)
Rem      cneumuel  04/27/2011 - Added platform parameter SMTP_TLS_MODE (Feature #566)
Rem      jkallman  04/28/2011 - Added system preference PURGE_UPLOADED_FILES_AFTER_DAYS
Rem      jkallman  05/01/2011 - Moved flowu.sql after tab.sql (due to type t_temp_lov_data)
Rem      pawolf    05/02/2011 - Added types.sql and moved flowu.sql to original position
Rem      jkallman  05/02/2011 - Changed system preference name from PURGE_UPLOADED_FILES_AFTER_DAYS to DELETE_UPLOADED_FILES_AFTER_DAYS
Rem      cneumuel  05/03/2011 - Added system preference APEX_BUILDER_AUTHENTICATION (Feature #632)
Rem      pawolf    05/05/2011 - Added wwv_flow_dynamic_exec (feature 224)
Rem      jkallman  05/05/2011 - Moved wwv_flow_dynamic_exec.sql after auth.sql
Rem      jkallman  05/11/2011 - Added wwv_flow_cloud_db_services.*
Rem      cneumuel  05/19/2011 - Added wwv_flow_authentication_engine
Rem      jkallman  05/20/2011 - Add SYSTEM_HELP_URL to wwv_flow_platform_prefs
Rem      jkallman  05/23/2011 - Modify call to sys.dbms_registry.comp_depend_list_t to only list XDB as a dependent component
Rem      pawolf    05/31/2011 - Added wwv_flow_native_authentication and wwv_flow_authentication
Rem      cbcho     06/02/2011 - Changed call to wwv_flow_upgrade.upgrade_ws_to_040100 to pass p_from value
Rem      jstraub   06/02/2011 - Added USERNAME_VALIDATION to wwv_flow_platform_prefs
Rem      msewtz    06/03/2011 - Added MOBILE_DEVELOPMENT_ENABLED  to wwv_flow_platform_prefs
Rem      cbcho     06/03/2011 - Removed temporary add of wwv_flow_f4000_plugins.sql/plb.  It does not need to be included for runtime.
Rem      pawolf    06/07/2011 - Added wwv_flow_native_region.*
Rem      pmanirah  06/08/2011 - Added wwv_flow_data_upload.sql/plb (feature 545)
Rem      cneumeul  06/08/2011 - Moved WWV_FLOW_PRIVATE_TO_ADMIN from SYS to APEX schema
Rem      jkallman  06/14/2011 - Added DATABASE_SERVICES_ENABLED to wwv_flow_platform_prefs
Rem      jkallman  06/15/2011 - Change default of DATABASE_SERVICES_ENABLED to Y
Rem      jkallman  06/17/2011 - Rename DATABASE_SERVICES_ENABLED to RESTFUL_SERVICES_ENABLED
Rem      jkallman  06/17/2011 - Added SERVICE_REQUESTS_ENABLED
Rem      jkallman  06/21/2011 - Added WORKSPACE_EMAIL_MAXIMUM
Rem      jkallman  07/02/2011 - Moved wwv_flow_install_wizard from devins.sql
Rem      hfarrell  07/05/2011 - Removed calls to wwv_flow_ws_sample.sql and .plb - no longer required for sample Websheet application
Rem      jstraub   07/08/2011 - Set RESTFUL_SERVICES_ENABLED to N on install
Rem      cneumuel  07/12/2011 - Added HPROF_DIRECTORY,TRACING_ENABLED (bug #12733333)
Rem      jstraub   07/14/2011 - Added wwv_flow_theme_23.*
Rem      jstraub   09/09/2011 - Added revoking inherit privileges for 12c
Rem      cneumuel  09/14/2011 - Added wwv_flow_listener.*
Rem      hfarrell  09/16/2011 - Added db_webservices_triggers.sql
Rem      pawolf    10/25/2011 - Added wwv_flow_cloud_idm.*
Rem      jkallman  11/02/2011 - Added system preference APP_EXPORT_TO_DB_ENABLED
Rem      cneumuel  11/11/2011 - Moved v and nv down because of v's dependency on wwv_flow_cloud_idm
Rem      jstraub   11/17/2011 - Made revoking of unlimited tablespace privilege silently fail (bug 13363440)
Rem      jkallman  11/28/2011 - Added ENCRYPTED_TABLESPACES_ENABLED system preference
Rem      jstraub   12/05/2011 - Wrapped creation of APPUN in whenever sqlerror exit and whenever sqlerror continue
Rem      jstraub   12/07/2011 - Added wwv_flow_cloud_archive.*, wwv_flow_cloud_archive_obj.*
Rem      jstraub   12/22/2011 - Added creating apex_application and apex_cloud_archive private synonyms in upgrade install (bug 13499756)
Rem      jstraub   01/04/2012 - Replaced wwv_flow_cloud_archive_obj.create_archive_objects with wwv_flow_cloud_archive_obj.create_archive_tables (bug 13499756)
Rem      jkallman  01/04/2012 - Added BIGFILE_TABLESPACES_ENABLED system preference
Rem      cneumuel  01/24/2012 - Added APEX_GRANTS_FOR_NEW_USERS_ROLE (bug #13587252)
Rem      shrahman  02/02/2012 - Added wwv_flow_theme_24.sql and wwv_flow_theme_24.plb
Rem      pawolf    02/27/2012 - Removed cssapi_public.* and added wwv_flow_css_api.plb
Rem      pawolf    02/27/2012 - Added wwv_flow_javascript_api.*
Rem      pawolf    02/27/2012 - Added wwv_flow_error_api.*
Rem      pawolf    02/27/2012 - Renamed package wwv_flow_plugin to wwv_flow_plugin_api and wwv_flow_plugin_engine to wwv_flow_plugin
Rem      pawolf    02/27/2012 - Changed install order of wwv_flow_error_api
Rem      pawolf    02/28/2012 - Removed wwv_flow_regexp
Rem      pawolf    02/29/2012 - Added wwv_flow_page.* and wwv_flow_page_api.*
Rem      cneumuel  02/29/2012 - Added statements to create private synonyms for SYS objects in APEX schema
Rem      cneumuel  03/07/2012 - Moved wwv_flow_plugin_api.sql and wwv_flow_native_item.sql before trigger.sql, because of dependencies
Rem      jstraub   03/08/2012 - Changed invoking wwv_flow_cloud_archive_obj.create_archive_tables in definer rights wrapper for 12c inherit privs
Rem      pawolf    03/09/2012 - Added wwv_flow_user_interface.*
Rem      pawolf    03/16/2012 - Added wwv_flow_theme.*
Rem      pawolf    03/20/2012 - Moved wwv_flow_upgrade_app.* to devins.sql
Rem      pawolf    03/20/2012 - Added wwv_flow_template_dev and wwv_flow_user_interface_dev to avoid installation errors
Rem      pawolf    03/20/2012 - Splitted up wwv_flow_calendar3 into wwv_flow_calendar and wwv_flow_calendar_dev. Removed wwv_flow_calendar_ajax
Rem      pawolf    03/29/2012 - Renamed wwv_flow_plugin_f4000 to wwv_flow_plugin_dev
Rem      jkallman  04/02/2012 - Removed compilation of obsolete file table_ddl_changes.sql
Rem      pawolf    04/04/2012 - Renamed wwv_flow_native_region to wwv_flow_region_native, wwv_flow_native_process to wwv_flow_process_native and wwv_flow_native_dynamic_action to wwv_flow_dynamic_action_native
Rem      cneumuel  04/05/2012 - Added LOGIN_THROTTLE_DELAY=5 to wwv_flow_platform_prefs (feature #899)
Rem      cneumuel  04/05/2012 - Added wwv_flow_session_state.{sql,plb} (feature #897)
Rem      pawolf    04/05/2012 - Added Content Delivery Network support (feature #819)
Rem      pawolf    04/12/2012 - Added wwv_flow_region*.sql/plb
Rem      cneumuel  04/12/2012 - Renamed wwv_flow_debug_message.* to wwv_flow_debug.*
Rem      cneumuel  04/16/2012 - Added wwv_flow_escape.*
Rem      cneumuel  04/17/2012 - Added private synonym for wwv_flow_file_objects$ (bug #12338050)
Rem      hfarrell  04/17/2012 - Added wwv_flow_legacy_plugins.sql and plb (feature #856)
Rem      cneumuel  04/18/2012 - Prefix sys objects with schema (bug #12338050)
Rem                           - Moved wwv_flow_session_state.sql up, because it is referenced in trigger.sql
Rem                           - Moved wwv_flow_plugin_api.sql before wwv_flow_legacy_plugins.sql
Rem                           - Added wwv_flow_debug_api
Rem      pawolf    04/19/2012 - Added wwv_flow_mail_api
Rem      cneumuel  04/20/2012 - Moved wwv_flow_{debug_api,debug,escape}.sql up
Rem      cneumuel  05/03/2012 - Added wwv_flow_authentication_dev (must be in coreins because wwv_flow_create_app_from_query depends on it)
Rem      jkallman  05/03/2012 - Added collection_member_resize.sql
Rem      pawolf    05/04/2012 - Added wwv_flow_template.*
Rem      pawolf    05/08/2012 - Added wwv_flow_computation.*
Rem      cbcho     05/09/2012 - Added wwv_flow_worksheet_util.*
Rem      vuvarov   05/10/2012 - Moved wwv_flow_plugin_util.sql before wwv_flow_worksheet_util.sql
Rem      cneumuel  05/16/2012 - Moved wwv_flow_ws_security.sql and view.sql up (bug #14047270)
Rem      msewtz    05/18/2012 - Added system preferences for top themes
Rem      pawolf    05/19/2012 - Added wwv_flow_grid_layout.*
Rem      msewtz    05/18/2012 - Added system preferences for default themes
Rem      jkallman  05/30/2012 - Moved wwv_flow_pkg_app_tab.sql from devins.sql
Rem      jkallman  05/31/2012 - Added apex_install_internal_themes.sql
Rem      jkallman  05/31/2012 - Moved wwv_flow_template.sql to before form.sql
Rem      pawolf    06/01/2012 - Moved wwv_flow_template.* before wwv_flow_theme.*
Rem      jkallman  06/04/2012 - Added initialization of logs
Rem      hfarrell  06/05/2012 - Added PKG_APP_ENABLED preference, setting to Y (bug 14155332)
Rem      cneumuel  06/05/2012 - Added wwv_flow_authorization_api
Rem      msewtz    06/05/2012 - Removed wwv_flow_theme_1-24.*
Rem      cneumuel  06/14/2012 - Added wwv_flow_cgi
Rem                           - Added LOGIN_THROTTLE_METHODS (feature #899)
Rem      msewtz    06/19/2012 - Added theme 25 to standard themes preference
Rem      pawolf    06/21/2012 - Added wwv_flow_page_dev.* because it's used by wizapi
Rem      pawolf    06/21/2012 - Moved apex_sys_all_views.sql into coreins.sql (bug# 14227074)
Rem      cneumuel  06/26/2012 - Added wwv_flow_ui_type.* (Feature #791)
Rem      pawolf    06/26/2012 - Moved wwv_flow_create_app_from_query.* and wwv_flow_authentication_dev.* to devins.sql
Rem      jstraub   07/03/2012 - Moved wwv_flow_session.sql before trigger.sql
Rem      cbcho     07/09/2012 - Added wwv_flow_pkg_app_log.* (feature #992)
Rem      jkallman  07/13/2012 - Removed escape_sc.sql
Rem      vuvarov   07/13/2012 - Moved apex_sys_all_views.sql to devins.sql (bug 14227074); set upgrade environment type (bug 14094544)
Rem      hfarrell  07/16/2012 - Set RESTFUL_SERVICES_ENABLED to Y on install - a change agreed by Joel and Kris via email exchange
Rem      msewtz    07/17/2012 - Added PKG_APP_AUTH_ALLOW_HHEAD, PKG_APP_AUTH_ALLOW_LDAP, PKG_APP_AUTH_ALLOW_SSO to platform preferences
Rem      cbcho     07/18/2012 - Added wwv_flow_team_file.* (feature 1007)
Rem      jstraub   07/24/2012 - Added invoking appins.sql
Rem      jstraub   08/01/2012 - Added grant select on sys.dba_tab_identity_cols to ^APPUN in 12c specific block
Rem      jkallman  08/15/2012 - Added wwv_flow_translation_util_api.* (Bug 13805875)
Rem      jstraub   08/16/2012 - Added call to wwv_flow_upgrade.enable_ws_constraints after installing applications
Rem      jstraub   08/16/2012 - Removed call to wwv_flow_upgrade.enable_ws_constraints
Rem      jstraub   08/17/2012 - Moved appins.sql before upgrade logic
Rem      jstraub   08/17/2012 - Modified DEFAULT_THEME and TOP_THEME preference insert per Shakeeb
Rem      jstraub   08/20/2012 - Moved appins.sql after upgrade logic
Rem      jkallman  08/21/2012 - Updated SYSTEM_HELP_URL for APEX 4.2
Rem      jstraub   08/21/2012 - Moved installing 4411, 4150, themes after upgrade logic
Rem      jstraub   08/22/2012 - Aligned timing start/stops
Rem      msewtz    08/21/2012 - Modified TOP_THEME preference
Rem      jstraub   10/25/2012 - Pre-create public synonym apex_application_global prior to creating websheet objects (bug 14778588)
Rem      jkallman  12/17/2012 - Add APEX_040200 to list of schemas to upgrade from, changed upgrade_to_040200 to upgrade_to_050000
Rem      cneumuel  01/24/2013 - Move wwv_flow_assert.plb and crypt.plb down, because of dependencies
Rem      cbcho     02/05/2013 - Added wwv_flow_app_builder_api.sql/plb (bug #16238360)
Rem      cneumuel  02/05/2013 - Added wwv_flow_authorization_dev.* (bug #16192465)
Rem      cneumuel  02/26/2013 - Added core_sys_views.sql (bug #15893138)
Rem      cbcho     02/28/2013 - Moved flowu.sql before wwv_flow_dynamic_exec.sql (bug #16397724)
Rem      msewtz    03/06/2013 - Added PRINT_FOP_PATH platform preference to store path to APEX Listener FOP interface (bug 16447504)
Rem      msewtz    03/07/2013 - Renamed new preference to APEX_LISTENER_FOP_PATH (bug 16447504)
Rem      hfarrell  03/11/2013 - Added wwv_flow_char_reader and wwv_flow_json (bug 16462622)
Rem      jstraub   03/13/2013 - Added setting and unsetting _ORACLE_SCRIPT
Rem      cneumuel  04/02/2013 - Added wwv_flow_plsql_lexer (bug #16002408)
Rem      cneumuel  04/03/2013 - Moved wwv_flow_plsql_lexer and wwv_flow_char_reader up, because of a dependency in wwv_flow_assert
Rem                           - moved from platform.sql to wwv_flow_platform.{sql,plb} (bug #15893138)
Rem                           - default WEBSHEET_SQL_ACCESS to N (bug #16595297)
Rem      vuvarov   04/05/2013 - Moved from flowg.sql to wwv_flow_global.sql
Rem      pawolf    04/09/2013 - Move creation of tables before creation of package specs
Rem      pawolf    04/19/2013 - Renamed file_mgr.* to wwv_flow_file_mgr.*
Rem      pawolf    04/22/2013 - Removed imgapi.*, cssapi.* and htmlapi.* (feature #1169)
Rem      pawolf    04/26/2013 - Added new public package wwv_flow_zip (feature #1173)
Rem      cneumuel  05/17/2013 - Added wwv_flow_authentication_f4155.* (bug #16827691)
Rem      cneumuel  06/04/2013 - Removed call to wwv_flow_security.set_internal_cookie_name (bug #12803793)
Rem      jkallman  06/17/2013 - Changed flows_files_new2.sql to always be executed
Rem      cneumuel  07/17/2013 - Added ALLOW_RAS instance setting, wwv_flow_session_ras.* (feature #1152)
Rem      cneumuel  07/24/2013 - Added APEX$SESSION context and wwv_flow_session_context.* (feature #887)
Rem      pmanirah  08/01/2013 - Added Added a new package wwv_flow_css_calendar.sql/plb (feature #1128)
Rem      cneumuel  08/27/2013 - Added wwv_flow_t_writer, wwv_flow_t_clob_writer, wwv_flow_t_blob_writer, wwv_flow_t_htp_writer, wwv_flow_t_json_generator
Rem      cneumuel  09/04/2013 - Changed instance parameter USERNAME_VALIDATION (feature #3)
Rem      arayner   09/09/2013 - Added installation of Page Designer metadata, apex_install_pe_data.sql (feature #1124)
Rem      cneumuel  09/09/2013 - Added wwv_flow_fnd_user_int
Rem      arayner   09/11/2013 - Moved installation of Page Designer metadata (core/apex_install_pe_data.sql) to after installation of 4411, and
Rem                             also to only run during a full development installation (feature #1124).
Rem      cneumuel  09/13/2013 - Added wwv_flow_feedback_int.*, removed wwv_flow_team.*
Rem      cneumuel  10/02/2013 - Removed obsolete wwv_flow_form_control.* (feature #1281)
Rem      jstraub   10/08/2013 - Added creating COM.ORACLE.CUST.REPOSITORY for SGID 12
Rem      jstraub   10/09/2013 - Added call to wwv_flow_upgrade.move_template_app if upgrading
Rem      jstraub   10/10/2013 - Fixed typo in call to wwv_flow_upgrade.move_template_app
Rem      jstraub   10/11/2013 - Added moving public themes to SGID 12 if upgrading
Rem      jstraub   10/15/2013 - Changed initialization of UFROM to APPUN so SGID 12 upgrade blocks are valid
Rem      cneumuel  10/17/2013 - Renamed crypt.* to wwv_flow_crypto and moved it up
Rem      jstraub   10/18/2013 - Removed calls to wwv_flow_upgrade.move_template_app
Rem      cneumuel  10/25/2013 - Removed wwv_flow_element
Rem                           - Removed asfcookie
Rem      msewtz    11/06/2013 - Updated theme preferences
Rem      cneumuel  11/11/2013 - Added wwv_flow_collection_int
Rem      msewtz    11/13/2013 - Updated theme preferences
Rem      cneumuel  11/19/2013 - Moved wwv_flow_collection_int up (bug #17809334)
Rem      pawolf    12/11/2013 - Added wwv_flow_component.sql
Rem      pawolf    12/12/2013 - Removed wwv_flow_list.*
Rem      vuvarov   12/24/2013 - Moved wizapi.sql after wwv_flow_region_native.sql
Rem      msewtz    01/07/2014 - Set default desktop theme to 31
Rem      vuvarov   01/09/2014 - Create internal workspaces in ASSIGNED status with RESTful enabled for SGID=10 (feature #1267)
Rem      cneumuel  01/14/2014 - Call apxsdoins.sql if MDSYS schema exists
Rem      pawolf    01/14/2014 - Added wwv_flow_combined_file.sql/plb
Rem      cneumuel  01/15/2014 - Moved install of apex_install_pe_data.sql to appins.sql
Rem      cneumuel  01/16/2014 - Added wwv_flow_t_dbms_output_writer
Rem      cneumuel  01/23/2014 - Added wwv_flow_response, moved wwv_flow_cgi up (feature #1065)
Rem      cneumuel  01/28/2014 - Defaulted HTTP_RESPONSE to N (feature #1065)
Rem      cneumuel  02/03/2014 - Added dbms_utility.compile_schema at end of upgrade
Rem      cneumuel  02/05/2014 - Removed wwv_flow_t_json_generator
Rem      vuvarov   02/05/2014 - Removed http.sql (bug 18177471)
Rem      cneumuel  02/24/2014 - Added REJOIN_EXISTING_SESSIONS (feature #1047)
Rem      vuvarov   02/24/2014 - Moved wwv_flow_pkg_app_parser from devins.sql
Rem      cneumuel  03/10/2014 - Default REJOIN_EXISTING_SESSIONS to P (feature #1112)
Rem      vuvarov   03/12/2014 - Removed duplicate wwv_flow_css.sql, wwv_flow_plugin_dev.sql
Rem      cneumuel  03/28/2014 - Added wwv_flow_app_install_int.* (bug #18329215)
Rem      hfarrell  04/11/2013 - Removed wwv_flow_flash_chart.* and wwv_flow_flash_chart_util.* (feature #1345)
Rem      cneumuel  04/15/2014 - Changed default of REQUIRE_HTTPS to N
Rem      asitters  04/28/2014 - Added WORKSPACE_TEAM_DEV_FILES_YN and WORKSPACE_TEAM_DEV_FS_LIMIT (feature #1415)
Rem      cbcho     04/29/2014 - Pre-create public synonym apex_util prior to creating websheet objects (feature #614)
Rem      cneumuel  05/05/2014 - Removed core_sys_views.sql
Rem      cneumuel  05/12/2014 - Added drop statement for obsolete wwv_flow_gv$session, which was introduced in 4.2
Rem      pawolf    05/13/2014 - Moved apex_install_pe_data.sql to coreins.sql
Rem      cneumuel  05/16/2014 - Removed htmldb_site_admin_privs.{sql,plb} (feature #1427)
Rem      pawolf    05/16/2014 - Added installation parameter to apex_install_pe_data.sql
Rem      msewtz    05/28/2014 - Updated theme preferences to default to theme 42
Rem      vuvarov   05/30/2014 - Updated SYSTEM_HELP_URL for APEX 5.0
Rem      cneumuel  06/27/2014 - Removed apexws.{sql,plb}
Rem      cneumuel  07/02/2014 - Renamed apexvalidate.sql to core/validate_apex.sql
Rem      cbcho     07/18/2014 - Added wwv_flow_lock.* (feature #1449)
Rem      vuvarov   08/08/2014 - Moved wwv_flow_cloud_db_services.* to devins.sql
Rem      cneumuel  10/06/2014 - Added wwv_flow_region_list.*
Rem      cneumuel  10/16/2014 - Do not create ADMIN workspace user, apxchpwd.sql can create users (feature #1382)
Rem      cneumuel  10/24/2014 - Moved grant of dba_tab_identity_cols to core_grants.sql
Rem      jstraub   11/24/2014 - Added call to sys.dbms_registry.update_schema_list for APEX_PUBLIC_USER to indicate it is Oracle supplied
Rem      jstraub   12/03/2014 - Fixed call to sys.dbms_registry.update_schema_list
Rem      jstraub   12/11/2014 - Configure RESTful services for this instance if APEX_LISTENER exists (bug 20145977)
Rem      jstraub   01/09/2015 - Removed query_api.*
Rem      msewtz    01/13/2015 - Removed theme 26 from standard themes
Rem      jstraub   02/16/2015 - Moved revoke of select any table to end of installation (Bug 20342131)
Rem      jstraub   02/17/2015 - Added "Thank you for installing" prompts at end from endins.sql
Rem      jstraub   02/19/2015 - Moved invoking apex_rest_config_core.sql until after upgrade actions
Rem      jstraub   02/20/2015 - Split into coreins[2345].sql (bug 20381781)
Rem      cneumuel  02/23/2015 - Moved restricted schema initialization to coreins3.sql (bug #20569037)
Rem      jstraub   02/25/2015 - Added INSTALL_TYPE as passed parameter
Rem      cneumuel  03/31/2015 - For all privileges granted to APEX_GRANTS_FOR_NEW_USERS_ROLE, make sure APPUN can grant them to new users (bug #20660459)
Rem      cneumuel  05/11/2015 - Removed sqlplus parameters for wwv_flow_global.sql
Rem      jstraub   05/27/2015 - Removed granting execute on prior version of wwv_flows_version
Rem      jstraub   06/15/2015 - Added back setting current_schema to FLOWS_FILES prior to running flows_files_new2.sql (bug 21178186)
Rem      jstraub   07/24/2015 - Replaced whenever sqlerror exit with dynamic call to apxsqler.sql based on INSTALL_TYPE
Rem      jstraub   07/28/2015 - Load package bodies without compiling to support parallelism in database upgrade
Rem      jstraub   08/14/2015 - Removed setting current_schema around flows_files_new2.sql, prefix with FLOWS_FILES in create trigger statement
Rem      jstraub   08/18/2015 - Changed calls to FLOWS_FILES_OBJECTS_REMOVE[CREATE] to always execute, in case of PDB plugin upgrade
Rem      hfarrell  08/28/2015 - Repositioned db_webservices_triggers.sql after wwv_flow_error.sql - dependency on wwv_flow_error.e_mutating_table ( part of bug #21682162)
Rem      jstraub   10/12/2015 - Reverted calls to FLOWS_FILES_OBJECTS_REMOVE[CREATE] to only be done on new installation (bug 21944186)
Rem      jstraub   11/23/2015 - Also call FLOWS_FILES_OBJECTS_REMOVE[CREATE] if part of database upgrade install


set define '^'
set concat on
set concat .
set verify off
set autocommit off

define LOG1      = '^1'
define UPGRADE   = '^2'
define APPUN     = '^3'
define TEMPTBL   = '^4'
define IMGPR     = '^5'
define DATTS     = '^6'
define FF_TBLS   = '^7'
define ADM_PWD   = '^8'
define PREFIX    = '^9'
define INSTALL_TYPE = '^10'

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
exception
    when invalid_alter_priv then
        null;
end;
/

set termout off
define UFROM     = '^APPUN'
column foo_usr new_val UFROM

select username foo_usr from
(select username, 2 weight from sys.dba_users where username in ('APEX_040200','APEX_040100','APEX_040000','APEX_030200')
union
select username, 1 weight from sys.dba_users where username in ('FLOWS_010500','FLOWS_010600','FLOWS_020000','FLOWS_020100','FLOWS_020200','FLOWS_030000','FLOWS_030100')
order by 2 desc, 1 desc) x where rownum = 1;

set termout on

timing start "Complete Installation"

begin
    if '^UPGRADE' = '1' then
        sys.dbms_output.put_line('Proceeding with new installation.');
    elsif '^UPGRADE' = '2' then
        sys.dbms_output.put_line('Proceeding with upgrade installation.');
    else
        sys.dbms_output.put_line('Could not determine installation type.');
    end if;
end;
/

begin
    if '^UPGRADE' = '1' then
        execute immediate 'create user flows_files identified by "^ADM_PWD" password expire account lock default tablespace ^FF_TBLS temporary tablespace ^TEMPTBL quota unlimited on ^FF_TBLS';
    else
        declare
            system_privilege_not_granted EXCEPTION;
            PRAGMA EXCEPTION_INIT(system_privilege_not_granted, -1952);
            role_not_granted EXCEPTION;
            PRAGMA EXCEPTION_INIT(role_not_granted, -1951);
        begin
            execute immediate 'revoke connect from flows_files';
            execute immediate 'revoke create any synonym from flows_files';
            execute immediate 'revoke create public synonym from flows_files';
        exception
            when system_privilege_not_granted then
                null;
            when role_not_granted then
                null;
        end;
    end if;
    execute immediate 'grant create synonym to flows_files';
end;
/


define foo2 = 'NOPUBUSER'
column foo new_val foo2

select 'INSTALLED' foo from sys.dba_users where username = 'APEX_PUBLIC_USER';

begin
    if '^foo2' = 'NOPUBUSER' then
        execute immediate 'create user apex_public_user identified by "^ADM_PWD" password expire account lock';
        execute immediate 'grant create session to apex_public_user';
    else
        sys.dbms_output.put_line('APEX_PUBLIC_USER exists.');
    end if;
end;
/

prompt I.    O R A C L E   S Y S   I N S T A L L   P R O C E S S

prompt ...create flows user


column foo new_val script
set termout off
select decode('^INSTALL_TYPE','MANUAL','apxsqler.sql','RUNTIME','apxsqler.sql','core/null1.sql') foo from sys.dual;
set termout on
@^PREFIX.^script

create user ^APPUN identified by "^ADM_PWD" password expire account lock default tablespace ^DATTS temporary tablespace ^TEMPTBL;

whenever sqlerror continue

grant  connect, resource              to ^APPUN;

declare
    priv_already_revoked exception;
    pragma exception_init(priv_already_revoked,-01952);
begin
    execute immediate 'revoke unlimited tablespace from ^APPUN';
exception
    when priv_already_revoked then
        null;
end;
/

grant unlimited tablespace to ^APPUN;
--
-- APEX specific database roles and privileges for schema provisioning
--
declare
    c_grants_role constant varchar2(30) := 'APEX_GRANTS_FOR_NEW_USERS_ROLE';
    procedure create_role (
        p_role in varchar2 )
    is
        l_exists exception;
        pragma exception_init(l_exists,-1921);
    begin
        execute immediate 'create role '||p_role;
    exception when l_exists then
        sys.dbms_output.put_line(p_role||' exists.');
    end create_role;
    procedure addpriv (
        p_privilege in varchar2,
        p_to        in varchar2 default c_grants_role,
        p_option    in varchar2 default null )
    is
    begin
        execute immediate 'grant '||p_privilege||' to '||p_to||' '||p_option;
    exception when others then
        sys.dbms_output.put_line(sqlerrm);
            sys.dbms_output.put_line('... when granting '||p_privilege||' to '||p_to||' '||p_option);
    end addpriv;
begin
    -- role for privileged access to apex views and admin APIs
    create_role('APEX_ADMINISTRATOR_ROLE');
    -- when apex creates a new workspace schema (prov.plb), it passes grants to
    -- this role on to the new schema
    create_role(c_grants_role);
    addpriv('CREATE SESSION');
    addpriv('CREATE CLUSTER');
    addpriv('CREATE DIMENSION');
    addpriv('CREATE INDEXTYPE');
    addpriv('CREATE JOB');
    addpriv('CREATE MATERIALIZED VIEW');
    addpriv('CREATE OPERATOR');
    addpriv('CREATE PROCEDURE');
    addpriv('CREATE SEQUENCE');
    addpriv('CREATE SNAPSHOT');
    addpriv('CREATE SYNONYM');
    addpriv('CREATE TABLE');
    addpriv('CREATE TRIGGER');
    addpriv('CREATE TYPE');
    addpriv('CREATE VIEW');
    -- make sure that privileges granted to APEX_GRANTS_FOR_NEW_USERS_ROLE are
    -- granted to APPUN with grant/admin option, so APEX can re-grant them. we
    -- base this on a query instead of the static list above, because the role
    -- may have more privileges when an APEX upgrade occurs.
    for i in ( select privilege,
                      'with admin option' priv_option
                 from sys.dba_sys_privs
                where grantee = c_grants_role
                union all
               select granted_role,
                      'with admin option'
                 from sys.dba_role_privs
                where grantee = c_grants_role
               union all
              select privilege||' on '||
                     sys.dbms_assert.enquote_name(owner)||'.'||
                     sys.dbms_assert.enquote_name(table_name),
                     'with grant option'
                 from sys.dba_tab_privs
                where grantee = c_grants_role )
    loop
        addpriv (
            p_privilege => i.privilege,
            p_to        => '^APPUN',
            p_option    => i.priv_option );
    end loop;
end;
/
--
-- more APPUN privileges
--

prompt ...Create validate procedure in SYS schema and start registration
@^PREFIX.core/validate_apex.sql x x ^APPUN

@^PREFIX.core/core_grants.sql

select to_char(sysdate,'HH24:MI:SS') the_time from sys.dual;

begin
    if '^UPGRADE' = '1' then
        sys.dbms_registry.loading('APEX','Oracle Application Express','validate_apex', '^APPUN');
        execute immediate 'begin sys.dbms_registry.update_schema_list(''APEX'', sys.dbms_registry.schema_list_t(''FLOWS_FILES'',''APEX_PUBLIC_USER'')); end;';
        execute immediate 'begin sys.dbms_registry.set_required_comps(''APEX'', sys.dbms_registry.comp_depend_list_t(''XDB'')); end;';
    elsif '^UPGRADE' = '2' then
        if sys.dbms_registry.is_valid('APEX') is not null then
            sys.dbms_registry.upgrading('APEX','Oracle Application Express','validate_apex', '^APPUN');
            execute immediate 'begin sys.dbms_registry.update_schema_list(''APEX'', sys.dbms_registry.schema_list_t(''FLOWS_FILES'',''APEX_PUBLIC_USER'')); end;';
            execute immediate 'begin sys.dbms_registry.set_required_comps(''APEX'', sys.dbms_registry.comp_depend_list_t(''XDB'')); end;';
        else --it has never been registered, so register it now
            sys.dbms_registry.loading('APEX','Oracle Application Express','validate_apex', '^APPUN');
            execute immediate 'begin sys.dbms_registry.update_schema_list(''APEX'', sys.dbms_registry.schema_list_t(''FLOWS_FILES'',''APEX_PUBLIC_USER'')); end;';
            execute immediate 'begin sys.dbms_registry.set_required_comps(''APEX'', sys.dbms_registry.comp_depend_list_t(''XDB'')); end;';
        end if;
    end if;
exception
    when others then null;
end;
/

select to_char(sysdate,'HH24:MI:SS') the_time from sys.dual;


@^PREFIX.core/wwv_flow_val.sql

prompt ...Remove views created from previous APEX installations
declare
    procedure ddl(p_sql in varchar2)
    is
    begin
        execute immediate p_sql;
    exception
        when others then null;
    end ddl;
begin
    if '^UPGRADE' = '2' then
        ddl('drop view sys.flow_sessions');
        ddl('drop view sys.flow_parameters');
        ddl('drop view sys.flow_sqlarea');
        ddl('drop view sys.flow_sga');
        ddl('drop view sys.wwv_flow_gv$session');
    end if;
end;
/


prompt ...wwv_dbms_sql
@^PREFIX.core/wwv_dbms_sql.sql
grant execute on sys.wwv_dbms_sql to ^APPUN;

prompt ...wwv_flow_create_key_package
@^PREFIX.core/wwv_flow_create_key_package.plb
exec wwv_flow_create_key_package
drop procedure sys.wwv_flow_create_key_package
/
grant execute on sys.wwv_flow_key to ^APPUN;

create or replace context APEX$SESSION using ^APPUN..wwv_flow_session_context
/

prompt ...CONNECT as the Oracle user who will own the Oracle APEX engine

alter session set current_schema = ^APPUN;
set serveroutput on size 1000000
prompt  ...Creating private synonyms for SYS objects
declare
    procedure create_synonym(p_name in varchar2)
    is
    begin
        execute immediate 'create synonym '||p_name||' for sys.'||p_name;
    exception when others then
        sys.dbms_output.put_line('Could not create synonym for sys.'||p_name||':');
        sys.dbms_output.put_line(sqlerrm);
    end;
begin
    create_synonym('OWA_UTIL');
    create_synonym('OWA_COOKIE');
    create_synonym('HTP');
    create_synonym('HTF');
    create_synonym('UTL_ENCODE');
    create_synonym('UTL_HTTP');
    create_synonym('UTL_RAW');
    create_synonym('UTL_SMTP');
    create_synonym('UTL_URL');
end;
/

prompt II.   I N S T A L L   O R A C L E    A P E X   T A B L E S

column thescript  new_val script
set termout off
select decode('^UPGRADE','1','flows_files_new.sql','flows_files_upgrade.sql') thescript from sys.dual;
set termout on


prompt  ...Installing flows_files objects 1

alter session set current_schema = FLOWS_FILES;

@^PREFIX.core/^script

grant all on wwv_flow_file_objects$ to ^APPUN with grant option;

alter session set current_schema = ^APPUN;
create or replace synonym wwv_flow_file_objects$ for FLOWS_FILES.wwv_flow_file_objects$;

prompt ...Install flow rendering engine tables

@^PREFIX.core/tab.sql                          x x x x x x x ^DATTS x


prompt ...insert default companies
declare
    procedure ins (
        p_id                        in number,
        p_provisioning_company_id   in number,
        p_short_name                in varchar2,
        p_allow_restful_services_yn in varchar2 default 'N' )
    is
    begin
        -- Also set some default values that are normally populated in wwv_flow_companies_t1 trigger
        insert into wwv_flow_companies (
            id,
            provisioning_company_id,
            short_name,
            display_name,
            first_schema_provisioned,
            expire_fnd_user_accounts,
            account_status,
            allow_to_be_purged_yn,
            allow_restful_services_yn )
        values (
            p_id,
            p_provisioning_company_id,
            p_short_name,
            p_short_name,
            '^APPUN',
            'Y',
            'ASSIGNED',
            'N',
            p_allow_restful_services_yn );
    end;
begin
    ins (
        p_id                        => 0,
        p_provisioning_company_id   => 0,
        p_short_name                => 'Unknown' );
    ins (
        p_id                        => 1,
        p_provisioning_company_id   => 10,
        p_short_name                => 'INTERNAL',
        p_allow_restful_services_yn => 'Y' );
    ins (
        p_id                        => 3,
        p_provisioning_company_id   => 11,
        p_short_name                => 'COM.ORACLE.APEX.REPOSITORY' );
    ins (
        p_id                        => 4,
        p_provisioning_company_id   => 12,
        p_short_name                => 'COM.ORACLE.CUST.REPOSITORY' );
    commit;
end;
/

create view WWV_FLOW_PRIVATE_TO_ADMIN as select 1 x from sys.dual;
grant select on WWV_FLOW_PRIVATE_TO_ADMIN to APEX_ADMINISTRATOR_ROLE;


prompt III.  I N S T A L L    S E L E C T E D   O B J E C T   T Y P E S
@^PREFIX.core/types.sql

prompt IV.  I N S T A L L    S E L E C T E D   P A C K A G E   S P E C S

prompt ...Create v function stub
create or replace function v ( p_item in varchar2) return varchar2 is begin return null; end;
/
show error

prompt ...Create nv function stub
create or replace function nv ( p_item in varchar2) return number is begin return null; end;
/
show error

@^PREFIX.core/wwv_flow_image_prefix.sql    x x x x x x ^IMGPR x x x
@^PREFIX.core/wwv_flow_global.sql
@^PREFIX.core/htmldb_item.sql
@^PREFIX.core/wwv_flow_component.sql
@^PREFIX.core/flow.sql
@^PREFIX.core/wwv_flow_crypto.sql
@^PREFIX.core/wwv_flow_security.sql
@^PREFIX.core/flowu.sql
@^PREFIX.core/wwv_flow_dynamic_exec.sql
@^PREFIX.core/flowl.sql
@^PREFIX.core/wwv_flow_debug_api.sql
@^PREFIX.core/wwv_flow_debug.sql
@^PREFIX.core/wwv_flow_escape.sql
@^PREFIX.core/wwv_htf.sql
@^PREFIX.core/wwv_htp.sql
@^PREFIX.core/wwv_owa_cookie.sql
@^PREFIX.core/wwv_flow_cgi.sql
@^PREFIX.core/wwv_flow_response.sql
@^PREFIX.core/init_htp.sql
@^PREFIX.core/meta.sql
@^PREFIX.core/template.sql
@^PREFIX.core/chart.sql
@^PREFIX.core/check.sql
@^PREFIX.core/reports3.sql
@^PREFIX.core/wwv_flow_page_cache_api.sql
@^PREFIX.core/wwv_flow_render_query.sql
@^PREFIX.core/api.sql
@^PREFIX.core/wwv_flow_file_api.sql
@^PREFIX.core/wwv_flow_file_mgr.sql
@^PREFIX.core/wwv_flow_file_object_id.sql
@^PREFIX.core/wwv_flow_db_version.sql
@^PREFIX.core/wwv_flow_plugin_api.sql
@^PREFIX.core/wwv_flow_plugin_util.sql
@^PREFIX.core/wwv_flow_legacy_plugins.sql

@^PREFIX.core/wwv_flow_epg_include_local.sql
@^PREFIX.core/wwv_flow_epg_include.sql

set define '^'
@^PREFIX.core/random.sql
set define '^'
@^PREFIX.core/wwv_id.sql
@^PREFIX.core/random.plb
@^PREFIX.core/wwv_id.plb
set define '^'

alter session set current_schema = SYS;

@^PREFIX.core/wwv_flow_val.plb

alter session set current_schema = ^APPUN;

@^PREFIX.core/wwv_flow_pkg_app_tab.sql

@^PREFIX.core/migrate_metadata.sql

@^PREFIX.core/collection_member_resize.sql
@^PREFIX.core/db_webservices_tab.sql

@^PREFIX.core/wwv_flow_assert.sql
@^PREFIX.core/wwv_flow_error_api.sql
@^PREFIX.core/wwv_flow_error.sql
@^PREFIX.core/column_exceptions.sql
@^PREFIX.core/meta_cleanup.sql
@^PREFIX.core/wwv_flow_sw_upgrade.sql
@^PREFIX.core/wwv_flow_upgrade.sql

@^PREFIX.core/plsqljob.sql

@^PREFIX.core/wwv_flow_rpt_std_msg.sql

-- Worksheet
@^PREFIX.core/wwv_flow_worksheet_standard.sql
@^PREFIX.core/wwv_flow_worksheet_expr.sql
@^PREFIX.core/wwv_flow_worksheet.sql
@^PREFIX.core/wwv_flow_worksheet_api.sql
@^PREFIX.core/wwv_flow_ajax.sql
@^PREFIX.core/wwv_flow_worksheet_dialogue.sql
@^PREFIX.core/wwv_flow_worksheet_form.sql
@^PREFIX.core/wwv_flow_worksheet_ajax.sql
@^PREFIX.core/wwv_flow_worksheet_util.sql

@^PREFIX.core/wwv_flow_ws_install_data.sql

@^PREFIX.core/audit.sql
@^PREFIX.core/wwv_flow_user_api.sql
@^PREFIX.core/wwv_flow_fnd_user_int.sql
@^PREFIX.core/wwv_flow_fnd_user_api.sql
@^PREFIX.core/wwv_flow_ws_api.sql
@^PREFIX.core/wwv_flow_platform.sql
@^PREFIX.core/wwv_flow_ui_type.sql
@^PREFIX.core/wwv_flow_user_interface.sql
@^PREFIX.core/wwv_flow_template.sql
@^PREFIX.core/wwv_flow_theme.sql
@^PREFIX.core/wwv_flow_native_item.sql
@^PREFIX.core/wwv_flow_session_state.sql
@^PREFIX.core/view.sql
@^PREFIX.core/wwv_flow_ws_security.sql
@^PREFIX.core/wwv_flow_session.sql
@^PREFIX.core/wwv_flow_session_ras.sql
@^PREFIX.core/wwv_flow_session_context.sql
@^PREFIX.core/wwv_flow_collection_int.sql

@^PREFIX.core/trigger.sql
@^PREFIX.core/apex_install_data.sql

@^PREFIX.core/wwv_flow_fnd_developer_api.sql
@^PREFIX.core/provisioning_tables.sql
@^PREFIX.core/wwv_flow_csv_data.sql
@^PREFIX.core/wwv_flow_char_reader.sql
@^PREFIX.core/wwv_flow_plsql_lexer.sql
@^PREFIX.core/wwv_flow_t_writer.sql
@^PREFIX.core/wwv_flow_t_clob_writer.sql
@^PREFIX.core/wwv_flow_t_blob_writer.sql
@^PREFIX.core/wwv_flow_t_htp_writer.sql
@^PREFIX.core/wwv_flow_t_dbms_output_writer.sql
@^PREFIX.core/wwv_flow_listener.sql

@^PREFIX.core/wwv_flow_crypto.plb
@^PREFIX.core/wwv_flow_char_reader.plb
@^PREFIX.core/wwv_flow_plsql_lexer.plb
@^PREFIX.core/wwv_flow_assert.plb
@^PREFIX.core/wwv_flow_t_writer.plb
@^PREFIX.core/wwv_flow_t_clob_writer.plb
@^PREFIX.core/wwv_flow_t_blob_writer.plb
@^PREFIX.core/wwv_flow_t_htp_writer.plb
@^PREFIX.core/wwv_flow_t_dbms_output_writer.plb

@^PREFIX.core/wwv_flow_platform.plb
@^PREFIX.core/wwv_flow_upgrade.plb

timing start "Package Specs"
prompt  V.   I N S T A L L   O R A C L E    A P E X   P A C K A G E   S P E C S
set define '^'

@^PREFIX.core/flow_log.sql
@^PREFIX.core/flow_dml.sql
@^PREFIX.core/flowp.sql
@^PREFIX.core/f.sql
@^PREFIX.core/vrn.sql
@^PREFIX.core/flowc.sql
@^PREFIX.core/gen_api_pkg.sql
@^PREFIX.core/plug.sql
@^PREFIX.core/customize.sql
@^PREFIX.core/generic.sql
@^PREFIX.core/form.sql
@^PREFIX.core/popup_filter.sql
@^PREFIX.core/wwv_calculator.sql
@^PREFIX.core/wwv_flow_builder.sql
@^PREFIX.core/shortcut.sql
@^PREFIX.core/popup.sql
@^PREFIX.core/wwv_flow_calendar.sql

@^PREFIX.core/wwv_flow_mail_api.sql
@^PREFIX.core/wwv_flow_mail.sql
@^PREFIX.core/prov.sql
@^PREFIX.core/provision.sql

@^PREFIX.core/flowjob.sql
@^PREFIX.core/wwv_flow_item.sql
@^PREFIX.core/tree.sql
@^PREFIX.core/tree3.sql
@^PREFIX.core/wwv_flow_button.sql
@^PREFIX.core/flow_isc.sql

@^PREFIX.core/home.sql

@^PREFIX.core/imgapi_public.sql
@^PREFIX.core/htmlapi_public.sql
@^PREFIX.core/flows_version.sql
@^PREFIX.core/flows_release.sql
@^PREFIX.core/collection.sql
@^PREFIX.core/z.sql
@^PREFIX.core/custom_auth_api.sql
@^PREFIX.core/custom_auth_std.sql
@^PREFIX.core/sw_api.sql
@^PREFIX.core/wwv_flow_item_help.sql
@^PREFIX.core/wwv_flow_admin_api.sql
@^PREFIX.core/flowcon.sql
@^PREFIX.core/wwv_flow_svg.sql
@^PREFIX.core/sw_util.sql
@^PREFIX.core/wwv_flow_hint.sql
@^PREFIX.core/wwv_flow_series_attr.sql
@^PREFIX.core/edit_report.sql
@^PREFIX.core/wwv_flow_app_install_int.sql
@^PREFIX.core/imp_parser.sql

@^PREFIX.core/wwv_flow_login.sql


column thescript  new_val script
set termout off
select decode('^UPGRADE','1','hint_seed.sql','null1.sql') thescript from sys.dual;
set termout on
@^PREFIX.core/^script

@^PREFIX.core/wwv_flow_developer_toolbar.sql
@^PREFIX.core/wwv_flow_feedback_int.sql
@^PREFIX.core/htmldb_util.sql
@^PREFIX.core/htmldb_custom_auth.sql
@^PREFIX.core/htmldb_lang.sql
@^PREFIX.core/wwv_flow_theme_globals.sql
@^PREFIX.core/wwv_flow_theme_manager.sql
@^PREFIX.core/wwv_flow_ppr_util.sql
@^PREFIX.core/wwv_flow_sw_script.sql
-- Eventually break dependency from wwv_flow_sc_transactions to wwv_flow_sw_script
@^PREFIX.core/wwv_flow_sc_transactions.sql
@^PREFIX.core/wwv_flow_print_util.sql
@^PREFIX.core/wwv_flow_flash_chart2.sql
@^PREFIX.core/wwv_flow_flash_chart5.sql
@^PREFIX.core/wwv_flow_flash_chart5_util.sql
@^PREFIX.core/wwv_flow_instance_admin.sql
@^PREFIX.core/wwv_flow_grid_layout.sql
@^PREFIX.core/wwv_flow_page_api.sql
@^PREFIX.core/wwv_flow_page.sql
@^PREFIX.core/wwv_flow_region_api.sql
@^PREFIX.core/wwv_flow_region.sql
@^PREFIX.core/wwv_flow_json.sql
@^PREFIX.core/wwv_flow_cdn.sql
@^PREFIX.core/wwv_flow_combined_file.sql
@^PREFIX.core/wwv_flow_css.sql
@^PREFIX.core/wwv_flow_css_api.sql
@^PREFIX.core/wwv_flow_javascript_api.sql
@^PREFIX.core/wwv_flow_javascript.sql
@^PREFIX.core/wwv_flow_plugin.sql
@^PREFIX.core/wwv_flow_tabular_form.sql
@^PREFIX.core/wwv_flow_validation.sql
@^PREFIX.core/wwv_flow_computation.sql
@^PREFIX.core/wwv_flow_process.sql
@^PREFIX.core/wwv_flow_dynamic_action.sql
@^PREFIX.core/wwv_flow_dynamic_action_native.sql
@^PREFIX.core/wwv_flow_data_upload.sql
@^PREFIX.core/wwv_flow_region_native.sql
@^PREFIX.core/wwv_flow_region_list.sql
@^PREFIX.core/wwv_flow_process_native.sql
@^PREFIX.core/wwv_flow_authorization_api.sql
@^PREFIX.core/wwv_flow_authorization.sql
@^PREFIX.core/wwv_flow_authentication_api.sql
@^PREFIX.core/wwv_flow_authentication.sql
@^PREFIX.core/wwv_flow_authentication_native.sql
@^PREFIX.core/wwv_flow_authentication_f4155.sql
@^PREFIX.core/wwv_flow_cloud_idm.sql
@^PREFIX.core/v.sql
@^PREFIX.core/nv.sql
@^PREFIX.core/wwv_flow_maint.sql
@^PREFIX.core/wwv_flow_application_install.sql
@^PREFIX.core/wwv_flow_tree_region.sql
@^PREFIX.core/wizapi.sql

@^PREFIX.core/wwv_flow_ws_attachment.sql
@^PREFIX.core/wwv_flow_ws_geocode.sql
@^PREFIX.core/wwv_flow_ws_stickies.sql
@^PREFIX.core/wwv_flow_ws_flash_chart.sql
@^PREFIX.core/wwv_flow_ws_webpage.sql
@^PREFIX.core/wwv_flow_ws_ui.sql
@^PREFIX.core/wwv_flow_ws_import.sql
@^PREFIX.core/wwv_flow_ws_dialog.sql
@^PREFIX.core/wwv_flow_ws_form.sql
@^PREFIX.core/wwv_flow_webservices_api.sql

@^PREFIX.core/wwv_flow_ws_auth.sql
@^PREFIX.core/wwv_flow_ws_setup.sql

@^PREFIX.core/wwv_flow_ws_export.sql
@^PREFIX.core/wwv_flow_ws_import_api.sql

@^PREFIX.core/wwv_flow_authorization_dev.sql
@^PREFIX.core/wwv_flow_meta_util.sql
@^PREFIX.core/wwv_flow_rest.sql
@^PREFIX.core/ws.sql
@^PREFIX.core/wwv_purge.sql
@^PREFIX.core/wwv_flow_f4000_util.sql
@^PREFIX.core/wwv_flow_plugin_dev.sql
@^PREFIX.core/wwv_flow_install_wizard.sql
@^PREFIX.core/wwv_flow_cloud_archive_obj.sql
@^PREFIX.core/wwv_flow_cloud_archive.sql
@^PREFIX.core/wwv_flow_pkg_app_log.sql
@^PREFIX.core/wwv_flow_team_file.sql
@^PREFIX.core/wwv_flow_translation_util_api.sql
@^PREFIX.core/wwv_flow_app_builder_api.sql
@^PREFIX.core/wwv_flow_zip.sql
@^PREFIX.core/wwv_flow_css_calendar.sql
@^PREFIX.core/wwv_flow_pkg_app_parser.sql
@^PREFIX.core/wwv_flow_sample_app.sql
@^PREFIX.core/wwv_flow_lock.sql

Rem $$$ pawolf: Added temporary because of cross reference cycles in our packages
@^PREFIX.core/wwv_flow_page_dev.sql
@^PREFIX.core/wwv_flow_theme_dev.sql
@^PREFIX.core/wwv_flow_template_dev.sql
@^PREFIX.core/wwv_flow_user_interface_dev.sql
@^PREFIX.core/wwv_flow_calendar_dev.sql

Rem  Only install the LDAP packages if sys.dbms_ldap exists
column temp new_val LDAP_SQL
column temp2 new_val AUTH_LDAP_SQL
set termout off
select decode(count(*),0,'null1.sql','ldap.sql') temp from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
select decode(count(*),0,'null1.sql','custom_auth_ldap.sql') temp2 from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set termout on
@^PREFIX.core/^LDAP_SQL
@^PREFIX.core/^AUTH_LDAP_SQL
set heading off
set termout off
column temp format a80
select decode(count(*),0,'DBMS_LDAP is not installed.','') temp
  from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set heading on
set termout on
Rem  End LDAP package specs

prompt ...Installing files dependend upon 9iR2
prompt ...if errors are encountered, ignore if not 9iR2
@^PREFIX.core/wwv_flow_web_services.sql

@^PREFIX.core/processu.sql

timing stop



timing start "Package Bodies"
set define '^'
prompt  VI.   I N S T A L L   O R A C L E   A P E X   P A C K A G E   B O D I E S
alter session set "_LOAD_WITHOUT_COMPILE" = plsql;

@^PREFIX.core/wwv_flow_session_ras.plb
@^PREFIX.core/wwv_dbms_sql.plb


begin
    if '^UPGRADE' = '1' or '^INSTALL_TYPE' = 'INTERNAL' then
        wwv_flow_upgrade.FLOWS_FILES_OBJECTS_REMOVE('^APPUN');
    end if;
end;
/

begin
    if '^UPGRADE' = '1' or '^INSTALL_TYPE' = 'INTERNAL' then
        wwv_flow_upgrade.FLOWS_FILES_OBJECTS_CREATE('^APPUN');
    end if;
end;
/

@^PREFIX.core/meta_cleanup.plb
begin
    if '^UPGRADE' = '1' then
        wwv_flow_upgrade.set_environment('^INSTALL_TYPE');
        wwv_flow_upgrade.switch_schemas('^APPUN','^APPUN');
    end if;
end;
/
@^PREFIX.core/wwv_flow_sw_parser.sql

@^PREFIX.core/wwv_flow_dynamic_exec.plb
@^PREFIX.core/chart.plb
@^PREFIX.core/reports3.plb
@^PREFIX.core/wwv_flow_page_cache_api.plb
@^PREFIX.core/wwv_flow_render_query.plb
@^PREFIX.core/api.plb
@^PREFIX.core/gen_api_pkg.plb
@^PREFIX.core/wwv_htf.plb
@^PREFIX.core/wwv_htp.plb
@^PREFIX.core/wwv_owa_cookie.plb
@^PREFIX.core/flow_log.plb
@^PREFIX.core/flow_dml.plb
@^PREFIX.core/flowu.plb
@^PREFIX.core/wwv_flow_error_api.plb
@^PREFIX.core/wwv_flow_error.plb
@^PREFIX.core/db_webservices_triggers.sql
@^PREFIX.core/wwv_flow_grid_layout.plb
@^PREFIX.core/wwv_flow_page_api.plb
@^PREFIX.core/wwv_flow_page.plb
@^PREFIX.core/wwv_flow_region_api.plb
@^PREFIX.core/wwv_flow_region.plb
@^PREFIX.core/wwv_flow_json.plb
@^PREFIX.core/wwv_flow_cdn.plb
@^PREFIX.core/wwv_flow_combined_file.plb
@^PREFIX.core/wwv_flow_css_api.plb
@^PREFIX.core/wwv_flow_css.plb
@^PREFIX.core/wwv_flow_javascript_api.plb
@^PREFIX.core/wwv_flow_javascript.plb
@^PREFIX.core/wwv_flow_ui_type.plb
@^PREFIX.core/wwv_flow_user_interface.plb
@^PREFIX.core/wwv_flow_template.plb
@^PREFIX.core/wwv_flow_theme.plb
@^PREFIX.core/wwv_flow_plugin_api.plb
@^PREFIX.core/wwv_flow_plugin.plb
@^PREFIX.core/wwv_flow_plugin_util.plb
@^PREFIX.core/wwv_flow_tabular_form.plb
@^PREFIX.core/wwv_flow_validation.plb
@^PREFIX.core/wwv_flow_computation.plb
@^PREFIX.core/wwv_flow_process.plb
@^PREFIX.core/wwv_flow_dynamic_action.plb
@^PREFIX.core/wwv_flow_native_item.plb
@^PREFIX.core/wwv_flow_dynamic_action_native.plb
@^PREFIX.core/wwv_flow_data_upload.plb
@^PREFIX.core/wwv_flow_region_native.plb
@^PREFIX.core/wwv_flow_region_list.plb
@^PREFIX.core/wwv_flow_process_native.plb
@^PREFIX.core/wwv_flow_session.plb
@^PREFIX.core/wwv_flow_session_state.plb
@^PREFIX.core/wwv_flow_session_context.plb
@^PREFIX.core/wwv_flow_cgi.plb
@^PREFIX.core/wwv_flow_response.plb
@^PREFIX.core/wwv_flow_authorization_api.plb
@^PREFIX.core/wwv_flow_authorization.plb
@^PREFIX.core/wwv_flow_authentication_api.plb
@^PREFIX.core/wwv_flow_authentication.plb
@^PREFIX.core/wwv_flow_authentication_native.plb
@^PREFIX.core/wwv_flow_authentication_f4155.plb
@^PREFIX.core/wwv_flow_maint.plb
@^PREFIX.core/wwv_flow_debug_api.plb
@^PREFIX.core/wwv_flow_debug.plb
@^PREFIX.core/wwv_flow_escape.plb
@^PREFIX.core/wwv_flow_application_install.plb
@^PREFIX.core/wwv_flow_tree_region.plb
@^PREFIX.core/wwv_flow_button.plb
@^PREFIX.core/wwv_flow_legacy_plugins.plb

@^PREFIX.core/wwv_flow_rpt_std_msg.plb

prompt ...Install Worksheet
@^PREFIX.core/wwv_flow_worksheet_expr.plb
@^PREFIX.core/wwv_flow_worksheet_standard.plb
@^PREFIX.core/wwv_flow_worksheet.plb
@^PREFIX.core/wwv_flow_worksheet_api.plb
@^PREFIX.core/wwv_flow_ajax.plb
@^PREFIX.core/wwv_flow_worksheet_dialogue.plb
@^PREFIX.core/wwv_flow_worksheet_form.plb
@^PREFIX.core/wwv_flow_worksheet_ajax.plb
@^PREFIX.core/wwv_flow_worksheet_util.plb

@^PREFIX.core/audit.plb
@^PREFIX.core/audit_trigger.sql
@^PREFIX.core/flowc.plb
@^PREFIX.core/flowp.plb
@^PREFIX.core/meta.plb
@^PREFIX.core/flow.plb
@^PREFIX.core/flowl.plb
@^PREFIX.core/template.plb
@^PREFIX.core/plug.plb
@^PREFIX.core/customize.plb
@^PREFIX.core/sw_util.plb
@^PREFIX.core/generic.plb
@^PREFIX.core/wwv_flow_security.plb
@^PREFIX.core/form.plb
@^PREFIX.core/check.plb
@^PREFIX.core/wwv_calculator.plb
@^PREFIX.core/wwv_flow_builder.plb
@^PREFIX.core/shortcut.plb
@^PREFIX.core/wwv_flow_fnd_developer_api.plb
@^PREFIX.core/wwv_flow_pkg_app_parser.plb
@^PREFIX.core/wwv_flow_sample_app.plb
@^PREFIX.core/wwv_flow_mail_api.plb
@^PREFIX.core/wwv_flow_mail.plb
@^PREFIX.core/wwv_flow_file_mgr.plb
@^PREFIX.core/prov.plb


@^PREFIX.core/provision.plb
@^PREFIX.core/flowjob.plb

set define '^'

@^PREFIX.core/plsqljob.plb

set define '^'

@^PREFIX.core/tree.plb
@^PREFIX.core/tree3.plb
@^PREFIX.core/wizapi.plb
@^PREFIX.core/wwv_flow_file_api.plb
@^PREFIX.core/imgapi_public.plb
@^PREFIX.core/htmlapi_public.plb
@^PREFIX.core/wwv_flow_fnd_user_int.plb
@^PREFIX.core/wwv_flow_fnd_user_api.plb
@^PREFIX.core/wwv_flow_user_api.plb
@^PREFIX.core/wwv_flow_collection_int.plb
@^PREFIX.core/collection.plb
@^PREFIX.core/wwv_flow_item.plb
@^PREFIX.core/custom_auth_api.plb
@^PREFIX.core/custom_auth_std.plb
@^PREFIX.core/sw_api.plb

@^PREFIX.core/wwv_flow_item_help.plb
@^PREFIX.core/wwv_flow_admin_api.plb
@^PREFIX.core/flowcon.plb
@^PREFIX.core/wwv_flow_svg.plb
@^PREFIX.core/popup.plb
@^PREFIX.core/wwv_flow_calendar.plb
@^PREFIX.core/wwv_flow_hint.plb
@^PREFIX.core/wwv_flow_series_attr.plb
@^PREFIX.core/edit_report.plb
@^PREFIX.core/wwv_flow_app_install_int.plb
@^PREFIX.core/imp_parser.plb
@^PREFIX.core/wwv_flow_developer_toolbar.plb
@^PREFIX.core/flow_isc.plb
@^PREFIX.core/wwv_flow_web_services.plb
@^PREFIX.core/wwv_flow_feedback_int.plb
@^PREFIX.core/htmldb_util.plb
@^PREFIX.core/htmldb_item.plb
@^PREFIX.core/htmldb_custom_auth.plb
@^PREFIX.core/htmldb_lang.plb
@^PREFIX.core/wwv_flow_theme_manager.plb

@^PREFIX.core/wwv_flow_login.plb

@^PREFIX.core/wwv_flow_ppr_util.plb
@^PREFIX.core/wwv_flow_sw_script.plb
@^PREFIX.core/wwv_flow_sw_parser.plb
@^PREFIX.core/wwv_flow_sc_transactions.plb
@^PREFIX.core/wwv_flow_sw_upgrade.plb
@^PREFIX.core/wwv_flow_print_util.plb
@^PREFIX.core/wwv_flow_flash_chart2.plb
@^PREFIX.core/wwv_flow_flash_chart5.plb
@^PREFIX.core/wwv_flow_flash_chart5_util.plb
@^PREFIX.core/wwv_flow_instance_admin.plb
@^PREFIX.core/wwv_flow_rest.plb
@^PREFIX.core/wwv_purge.plb
@^PREFIX.core/wwv_flow_f4000_util.plb
@^PREFIX.core/wwv_flow_cloud_idm.plb
@^PREFIX.core/wwv_flow_install_wizard.plb
@^PREFIX.core/wwv_flow_listener.plb
@^PREFIX.core/wwv_flow_pkg_app_log.plb
@^PREFIX.core/wwv_flow_team_file.plb
@^PREFIX.core/wwv_flow_translation_util_api.plb
@^PREFIX.core/wwv_flow_app_builder_api.plb
@^PREFIX.core/wwv_flow_zip.plb
@^PREFIX.core/wwv_flow_css_calendar.plb
@^PREFIX.core/wwv_flow_lock.plb

Rem $$$ pawolf: Added temporary because of cross reference cycles in our packages
@^PREFIX.core/wwv_flow_authorization_dev.plb
@^PREFIX.core/wwv_flow_plugin_dev.plb
@^PREFIX.core/wwv_flow_page_dev.plb
@^PREFIX.core/wwv_flow_theme_dev.plb
@^PREFIX.core/wwv_flow_template_dev.plb
@^PREFIX.core/wwv_flow_user_interface_dev.plb
@^PREFIX.core/wwv_flow_calendar_dev.plb


@^PREFIX.core/wwv_flow_epg_include.plb

Rem  Only install the ldap packages if sys.dbms_ldap exists
column temp new_val LDAP_PLB
column temp2 new_val AUTH_LDAP_PLB
set termout off
set heading off
select decode(count(*),0,'null1.sql','ldap.plb') temp from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
select decode(count(*),0,'null1.sql','custom_auth_ldap.plb') temp2 from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set termout on
@^PREFIX.core/^LDAP_PLB
@^PREFIX.core/^AUTH_LDAP_PLB
set termout off
set heading off
column temp format a80
select decode(count(*),0,'DBMS_LDAP is not installed.','') temp
  from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set termout on
set heading on
Rem  End LDAP package bodies

@^PREFIX.core/processu.plb
@^PREFIX.core/migrate_metadata.plb

set define '^'

prompt ...Page Builder
@^PREFIX.core/p.sql

@^PREFIX.core/apex_views.sql
@^PREFIX.core/apex_ws_views.sql

@^PREFIX.core/wwv_flow_ws_api.plb
@^PREFIX.core/wwv_flow_ws_attachment.plb
@^PREFIX.core/wwv_flow_ws_geocode.plb
@^PREFIX.core/wwv_flow_ws_stickies.plb
@^PREFIX.core/wwv_flow_ws_flash_chart.plb
@^PREFIX.core/wwv_flow_ws_webpage.plb
@^PREFIX.core/wwv_flow_ws_ui.plb
@^PREFIX.core/wwv_flow_ws_import.plb
@^PREFIX.core/wwv_flow_ws_dialog.plb
@^PREFIX.core/wwv_flow_ws_form.plb
@^PREFIX.core/wwv_flow_webservices_api.plb

@^PREFIX.core/wwv_flow_ws_auth.plb
@^PREFIX.core/wwv_flow_ws_security.plb
@^PREFIX.core/wwv_flow_ws_setup.plb

@^PREFIX.core/wwv_flow_ws_export.plb

--
-- In case upgrading from a version prior to 3.0, need to pre-create apex_application_global synonym
begin
if '^UPGRADE' = '2' then
    execute immediate 'create or replace public synonym apex_application_global for ^APPUN..wwv_flow_global';
    execute immediate 'create or replace public synonym apex_util for ^APPUN..htmldb_util';
end if;
end;
/

Rem Need to create APEX$ objects in APPUN schema prior to compiling wwv_flow_ws_import_api
alter package sys.wwv_dbms_sql compile body;
alter package wwv_flow_assert compile body;
begin
    ^APPUN..wwv_flow_security.g_context := 'WWV_FLOW_UPGRADE';
    ^APPUN..wwv_flow_ws_setup.install('^APPUN',10,'^APPUN');
    ^APPUN..wwv_flow_security.g_context := null;
end;
/


@^PREFIX.core/wwv_flow_ws_import_api.plb

@^PREFIX.core/wwv_flow_meta_util.plb

@^PREFIX.core/wwv_flow_cloud_archive_obj.plb

alter session set "_LOAD_WITHOUT_COMPILE" = none;

begin
    sys.utl_recomp.recomp_parallel(schema => '^APPUN.');
end;
/

create or replace procedure create_cloud_obj
as
begin
    wwv_flow_cloud_archive_obj.create_archive_tables;
end;
/

begin
    ^APPUN..create_cloud_obj;
end;
/

drop procedure create_cloud_obj
/

@^PREFIX.core/wwv_flow_cloud_archive.plb

column thescript  new_val script
set termout off
select decode(has_mdsys, 1, 'apxsdoins.sql', 'core/null1.sql') thescript
  from ( select count(*) has_mdsys
           from sys.dba_users
          where username = 'MDSYS' );
set termout on
@^PREFIX.^script ^APPUN ^PREFIX

timing stop

prompt  ...Installing flows_files objects 2

@^PREFIX.core/flows_files_new2.sql


-- Set the mail preferences to default values
prompt ...Initialize SMTP server settings
insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('SMTP_HOST_ADDRESS','localhost','The address of the SMTP server used to relay mail.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('SMTP_HOST_PORT','25','The port that the SMTP server listens for requests.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('SMTP_TLS_MODE','N','The flag which determines if apex_mail uses an encrypted smtp connection',10);

-- Set script and result quota preferences to default values
prompt ...Initialize preference settings
insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('MAX_SCRIPT_SIZE','500000','The maximum allowable size for a script text.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('SQL_SCRIPT_MAX_OUTPUT_SIZE','200000','The maximum allowable size for an individual script result.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('WORKSPACE_MAX_OUTPUT_SIZE','2000000','The maximum space allocated for script results.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('ENABLE_TRANSACTIONAL_SQL','Y','The flag which determines if Transactional SQL Commands are enabled on this instance.',10);

-- Set PL/SQL editing flag to default value
insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PLSQL_EDITING','Y','The flag used in SQL Workshop Object Browser to enable user to edit and compile PL/SQL.',10);

-- Set Instance Administration creation of demonstration objects flag to default value
insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('WORKSPACE_PROVISION_DEMO_OBJECTS','Y','The flag used in Instance Adminstration which determines if demonstration applications and database objects are created in new workspaces.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('WORKSPACE_WEBSHEET_OBJECTS','Y','The flag used in Instance Adminstration which determines if APEX Websheet database objects are created in new workspaces.',10);

-- Default Builder and Instance Admin authentication
insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('APEX_BUILDER_AUTHENTICATION','APEX','The flag used to control the Instance Administration and Builder authentication scheme.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('USERNAME_VALIDATION','*','The regular expression used to validate a username of workspace developers and administrators.',10);

-- Default values for restrictions on workspace and adminstration login
insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('DISABLE_ADMIN_LOGIN','N','The flag which determines if Adminstration services are disabled.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('DISABLE_WORKSPACE_LOGIN','N','The flag which determines if workspace login is disabled.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('LOGIN_THROTTLE_DELAY','5','The flag which determines the time increase in seconds after failed logins.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('LOGIN_THROTTLE_METHODS','USERNAME_IP','The methods to count failed logins. Colon-separated list of USERNAME_IP, USERNAME, IP',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('ALLOW_PUBLIC_FILE_UPLOAD','N','The flag which determines if file uploads are allowed without user authentication.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('STRONG_SITE_ADMIN_PASSWORD','Y','The flag which determines if the apex_admin password must conform to the default set of stong complexity rules.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PASSWORD_ALPHA_CHARACTERS','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ','The alphabetic characters used for pasword complexity rules.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PASSWORD_PUNCTUATION_CHARACTERS','!"#$%&()``*+,-/:;<=>?_','The punctuation characters used for pasword complexity rules.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('MAX_SESSION_LENGTH_SEC','28800','The number of seconds an internal application session may exist.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('MAX_SESSION_IDLE_SEC','3600','The number of seconds an internal application may be idle.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('ALLOW_DB_MONITOR','N','The flag which determines if database monitoring is enabled.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('ALLOW_RAS','N','The flag which determines if Real Application Security is enabled.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('SERVICE_REQUEST_FLOW','MANUAL','Determines default provisioning mode.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PRINT_BIB_LICENSED','APEX_LISTENER','Determines BI Publisher licensing level.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('APEX_LISTENER_FOP_PATH','_/fop2pdf','path to FOP rendering script',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('DISABLE_WS_PROV','N','The flag which determines if workspace creation is disabled for requests sent out via e-mail notification.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('AUTO_SCHEMA_NAME', 'N', 'Controls whether schema name is automatically assigned to someone requesting a new workspace', 10 );

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('AUTO_WORKSPACE_NAME', 'N', 'Controls whether workspace name is automatically assigned to someone requesting a new workspace', 10 );

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('REQ_NEW_SCHEMA','N','The flag which determines if option for new schema for new workspace requests is disabled.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('AUTOEXTEND_TABLESPACES','Y','If set to ''Y'', provisioned tablespaces will autoextend up to a maximum size.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('WEBSHEET_SQL_ACCESS','N','If set to ''Y'', SQL tags and SQL reports will be possible in Websheet applications.',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('REJOIN_EXISTING_SESSIONS','P','Disable or enable session joining for the instance',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('REQUIRE_HTTPS','N','Only permit access to the instance over SSL',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('EXPIRE_FND_USER_ACCOUNTS','N','Enable expiration of APEX accounts',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('APPLICATION_ACTIVITY_LOGGING','U','Controls instance wide setting of application activity log (always, never, use application settings)',10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('INSTANCE_ID', wwv_flow_id.next_val, 'Instance Identifier', 10 );

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('REQUIRE_VERIFICATION_CODE', 'N', 'Determines if the Verification Code is displayed and is required for someone to request a new workspace', 10 );

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('DELETE_UPLOADED_FILES_AFTER_DAYS', 14, 'Uploaded files like application export files, websheet export files, spreadsheet data load files will be automatically deleted after this number of days.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('SYSTEM_HELP_URL', 'http://apex.oracle.com/doc50', 'Location of the help and documentation, from within the Help link of the development enviornment.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('MOBILE_DEVELOPMENT_ENABLED', 'N', 'If set to ''Y'', mobile application development will be enabled.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('RESTFUL_SERVICES_ENABLED', 'Y', 'If set to ''Y'', RESTful services development will be enabled.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('SERVICE_REQUESTS_ENABLED', 'Y', 'If set to ''Y'', workspace service requests for schemas, storage, and termination will be enabled.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('WORKSPACE_EMAIL_MAXIMUM', '1000', 'Maximum number of emails allowed to be sent via APEX_MAIL per workspace in a 24 hour period.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('HPROF_DIRECTORY', '-', 'Name of the directory where profiling files are stored if p_trace=HPROF, "-" if not configured', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('TRACING_ENABLED', 'Y', 'Y if tracing and profiling (p_trace) is enabled', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('APP_EXPORT_TO_DB_ENABLED', 'Y', 'Y if applcation export to File Format "Database" is enabled', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('ENCRYPTED_TABLESPACES_ENABLED', 'N', 'Y if the tablespaces provisioned through APEX should be encrypted', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('BIGFILE_TABLESPACES_ENABLED', 'N', 'Y if the tablespaces provisioned through APEX should be done using bigfiles', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('TOP_THEMES', '42,51', 'Comma delimited list of top themes', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('DEFAULT_THEMES', '42,51', 'Comma delimited list of default themes', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PKG_APP_ENABLED', 'Y', 'If set to ''Y'', Packaged Applications will be enabled.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PKG_APP_AUTH_ALLOW_HHEAD', 'N', 'If set to ''Y'',  HTTP header authentication will be enabled for packaged applications.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PKG_APP_AUTH_ALLOW_LDAP', 'N', 'If set to ''Y'', LDAP authentication will be enabled for packaged applications.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('PKG_APP_AUTH_ALLOW_SSO', 'N', 'If set to ''Y'', Oracle Single-Sign authentication will be enabled for packaged applications.', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('WORKSPACE_TEAM_DEV_FILES_YN', 'Y', 'Y if new workspaces in this instance will allow file uploads in Team Development, N otherwise (default is Y)', 10);

insert into wwv_flow_platform_prefs (name, value, pref_desc, security_group_id)
values ('WORKSPACE_TEAM_DEV_FS_LIMIT', '15728640', 'The maximum file size per upload of a Workspace''s Team Development "File" (default is 15MB)', 10);

commit;

set verify off

prompt ...Initialize logs
begin
    wwv_flow_log.initialize_log( p_log => 'ACCESS' );
    wwv_flow_log.initialize_log( p_log => 'ACTIVITY' );
    wwv_flow_log.initialize_log( p_log => 'CLICKTHRU' );
    wwv_flow_log.initialize_log( p_log => 'DEBUG' );
    commit;
end;
/

---------------------------------

prompt ...Development install if necessary
column foo new_val script
set termout off
select decode('^INSTALL_TYPE','RUNTIME','core/null1.sql','devins.sql') foo from sys.dual;
set termout on
@^PREFIX.^script ^LOG1 ^UPGRADE ^APPUN ^TEMPTBL ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX

set termout on

set verify off

rem prompt  VIII.   L O C K   O R A C L E    A P E X    A C C O U N T

alter user ^APPUN account lock password expire;
alter user FLOWS_FILES account lock password expire;

rem inherit privileges for APEX accounts

begin

$if sys.dbms_db_version.ver_le_10_2 $then
    null;
$elsif sys.dbms_db_version.ver_le_11_1 $then
    null;
$elsif sys.dbms_db_version.ver_le_11_2 $then
    null;
$else

declare
  already_revoked exception;
  pragma exception_init(already_revoked,-01927);

  procedure revoke_inherit_privilege(user in varchar2) as
  begin
    execute immediate 'revoke inherit privileges on user '||user||' from PUBLIC';
  exception
    when already_revoked then
      null;
  end;
begin
  revoke_inherit_privilege('^APPUN');
  revoke_inherit_privilege('APEX_PUBLIC_USER');
  revoke_inherit_privilege('FLOWS_FILES');
  execute immediate 'grant inherit any privileges to ^APPUN';
end;

$end
end;
/


rem prompt  IX.   U P G R A D E    O R A C L E   A P E X

timing start "Upgrade"

set serveroutput on
set feedback off
begin
if '^UPGRADE' = '2' Then
    sys.dbms_output.put_line('');
    sys.dbms_output.put_line('   -- Now beginning upgrade. This will take several minutes.-------');
    sys.dbms_output.put_line('');
    sys.dbms_output.put_line('');
end if;
end;
/


begin
if '^UPGRADE' = '2' Then
    sys.dbms_output.put_line('   -- Ensuring template names are unique -------');
    wwv_flow_upgrade.template_name_cleanup('^UFROM');
    wwv_flow_security.g_security_group_id := 10;
    commit;
end if;
end;
/

alter session set current_schema = SYS;
grant select any table to ^APPUN;
alter package sys.wwv_dbms_sql compile body;
