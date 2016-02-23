Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_epg_config_core.sql
Rem
Rem    DESCRIPTION
Rem      This script will load the Application Express images into XDB and then configure
Rem      a DAD for use by Application Express in the Embedded PL/SQL Gateway.
Rem
Rem    NOTES
Rem      Do not run this script directly. Instead, run apex_epg_config.sql.
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     jstraub    09/22/2004 - Created
Rem     jstraub    10/07/2004 - Added character set ids to call to dbms_xdb.createresource
Rem     jduan      07/27/2005 - Enable anonymous access to XDB repository
Rem     jduan      08/08/2005 - Enable database version checking for <security-role-ref> tag
Rem     jduan      08/08/2005 - Modified the logic to insert anonymous access tag only when
Rem                             it is not present in the config file. Otherwise, update its value to 'true.'
Rem     jduan      09/08/2005 - Move the section of adding two mime types to before the file loading section. It is
Rem                             necessary to set the correct mime types before loading the file to XDB. Otherwise, files
Rem                             with "xbl" extension would not be treated as an xml file.
Rem     jkallman   09/22/2005 - Configure with ANONYMOUS instead of HTMLDB_PUBLIC_USER
Rem     jkallman   09/30/2005 - Configure nls-language DAD attribute
Rem     jkallman   10/25/2005 - Remove unnecessary authorize_dad call as a result of transaction rpang_authorize_dad_opt
Rem     jkallman   11/29/2005 - Set attribute request-validation-function in DAD configuration
Rem     jkallman   12/03/2005 - Modify request-validation-function to reference package and not procedure
Rem     jduan      12/07/2005 - Add the index.htm link that points to the license agreement file
Rem     jduan      12/07/2005 - Remove several lines of code that add the anonymousServletRole
Rem     jkallman   12/13/2005 - Rename DAD and virtual path from HTMLDB to APEX (Bug 4879917)
Rem     jduan      12/13/2005 - Using insertxmlbefore to enable allow-repository-anonymous-access when http-host exist (Bug 4886392)
Rem     jkallman   12/13/2005 - Change DAD default-page from htmldb to apex (Bug 4879917)
Rem     jduan      12/15/2005 - Change logic for add allow-repository-anonymous-access element to use insertchildxml sql function
Rem     jkallman   02/26/2006 - Copied for original htmldb_epg_config.sql
Rem     jstraub    07/06/2006 - Removed spooling and setting XE start page to adapt for upgrade from XE to SE/EE
Rem     jstraub    07/12/2006 - Added call to deleteresource to remove link to index.htm
Rem     jstraub    07/24/2006 - Added logic to check for existance of directory /i/, if exists, move it to new folder
Rem     jstraub    07/24/2006 - Added check for existence of /index.html before removing link
Rem     jstraub    08/29/2006 - Added call to dbms_epg.allow_anonymous_access, ignore if doesn't exist, raise if other error (bug 5366888)
Rem     jstraub    12/19/2006 - Removed call to dbms_epg.allow_anonymous_access on advice from rpang
Rem     jstraub    01/19/2007 - Moved setting allow-repository-anonymous-access from apex_epg_config.sql
Rem     jstraub    02/21/2007 - Added code from rpang to configure new /i/ anonymous servlet
Rem     jstraub    03/21/2007 - Replaced UnauthenticatedFileAccessServlet with PublishedContentServlet per rpang
Rem     jstraub    05/30/2007 - Altered to be multi-use for XE upgrade to 10.2.0.3 and for 11g
Rem     jstraub    06/01/2007 - Added existance check for mime extenstion before adding to the xdbconfig.xml
Rem     jstraub    06/07/2007 - Added other existance checks for images servlet and ACL to make script re-runnable
Rem     jkallman   06/26/2007 - Always upload doc_map.xml encoded as AL32UTF8
Rem     jstraub    03/03/2008 - Adapted for 11.2 upgrade/downgrade
Rem     jstraub    09/09/2008 - Move logic from apex_epg_config.sql to support multiple distribution methods
Rem     jkallman   01/09/2009 - Load all JA online help files with .xml extension as AL32UTF8 (Bug 7700562)
Rem     jkallman   01/09/2009 - Delete incorrectly encoded files in JA online help (Bug 7700562)
Rem     jkallman   07/01/2009 - Change JA16SJIS charset reference to AL32UTF8 to account for Japanese online help encoding
Rem     jkallman   04/08/2010 - Use only under_path in publish_folder, and then directly set ACL on parent.  Work around to bug 9321922.
Rem     jkallman   04/12/2010 - Rewrite logic of removal of incorrectly encoded toc.xml
Rem     vuvarov    04/05/2013 - Prefixed objects with schema names; added support for empty files
Rem     vuvarov    04/15/2013 - Reference script arguments only once
Rem     pawolf     04/30/2013 - Added path-alias and path-alias-procedure (feature# 478)
Rem     pawolf     04/30/2013 - Removed plsqldocumentpath and plsqldocumentprocedure (bug# 16671975)
Rem     jstraub    07/24/2013 - Removed granting ANONYMOUS read on '/' (Bug 16990557)
Rem     jstraub    08/15/2013 - Backed out changes for 16990557, properties on '/' are needed for image servlet
Rem     jstraub    10/11/2013 - Only grant privs on '/' to ANONYMOUS if < 12.1.0.2, change owner of /images files to FLOWS_FILES
Rem     jstraub    10/18/2013 - Changed call to dbms_xdb.changeowner (not available in 10.2) to locally defined changeowner
Rem     jstraub    12/02/2013 - Removed setting htc and xbl extensions
Rem     jstraub    12/30/2013 - Changed creating /images using createcrossconfolder if 12.1.0.2
Rem     jstraub    02/03/2014 - Invoke apxldimg_core.sql
Rem     pawolf     02/27/2015 - Changed path-alias alias to "r" to be in sync with mod_plsql and ORDS


set define '&' verify off
set serveroutput on
set concat on
set concat .

Rem Add two mime types
declare
    cfg sys.XMLType;
begin

    cfg := xdb.dbms_xdb.cfg_get();

    if wwv_flow_utilities.db_version_is_at_least('11') then --11g only

    -- Add "PublishedContentServlet" and
    -- publish "/images" folder in XDB repository as "/i" in HTTP
        if cfg.existsNode('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-mappings/servlet-mapping/servlet-name[text()="PublishedContentServlet"]') = 0 then
            cfg := cfg.appendChildXML('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-mappings',
                   sys.XMLType('<servlet-mapping xmlns="http://xmlns.oracle.com/xdb/xdbconfig.xsd">
                                  <servlet-pattern>/i/*</servlet-pattern>
                                  <servlet-name>PublishedContentServlet</servlet-name>
                                </servlet-mapping>'));
	    end if;
        if cfg.existsNode('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-list/servlet/servlet-name[text()="PublishedContentServlet"]') = 0 then
            cfg := cfg.appendChildXML('/xdbconfig/sysconfig/protocolconfig/httpconfig/webappconfig/servletconfig/servlet-list',
                   sys.XMLType(
                         '<servlet  xmlns="http://xmlns.oracle.com/xdb/xdbconfig.xsd">
                            <servlet-name>PublishedContentServlet</servlet-name>
                            <servlet-language>C</servlet-language>
                            <display-name>Unauthenticated File Access Servlet</display-name>
                            <description>Servlet for files for unauthenticated users</description>
                            <init-param>
                              <param-name>RootFolder</param-name>
                              <param-value>/images</param-value>
                              <description>RootFolder</description>
                            </init-param>
                            <security-role-ref>
                              <role-name>anonymousServletRole</role-name>
                              <role-link>anonymousServletRole</role-link>
                            </security-role-ref>
                          </servlet>'));

            xdb.dbms_xdb.cfg_update(cfg);
        end if;
    end if;

    commit;
    xdb.dbms_xdb.cfg_refresh;
end;
/


timing start "Load Images"

define IMGPATH = '&1/apex/images'
define IMGDIR  = 'APEX_IMAGES'

begin
    execute immediate 'drop directory &IMGDIR.';
exception when others then
    null;
end;
/

prompt . Loading images directory: &IMGPATH.
create directory &IMGDIR. as '&IMGPATH.';

@&PREFIX.apxldimg_core.sql

commit;

drop directory &IMGDIR.;

timing stop

begin
    sys.dbms_epg.create_dad('APEX','/apex/*');
    sys.dbms_epg.set_dad_attribute('APEX','database-username','ANONYMOUS');
    sys.dbms_epg.set_dad_attribute('APEX','default-page','apex');
    sys.dbms_epg.set_dad_attribute('APEX','document-table-name','wwv_flow_file_objects$');
    sys.dbms_epg.set_dad_attribute('APEX','nls-language','american_america.al32utf8');
    sys.dbms_epg.set_dad_attribute('APEX','request-validation-function','wwv_flow_epg_include_modules.authorize');
    sys.dbms_epg.set_dad_attribute('APEX','path-alias','r');
    sys.dbms_epg.set_dad_attribute('APEX','path-alias-procedure','wwv_flow.resolve_friendly_url');
end;
/

commit;
