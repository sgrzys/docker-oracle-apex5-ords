set define '^'
set verify off
prompt ...wwv_flow_sample_app

Rem  Copyright (c) Oracle Corporation 2003. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_sample_app.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    SCRIPT ARGUMENTS
Rem      NONE
Rem
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem    sspendol   08/01/2003 - Created
Rem    jstraub    09/08/2004 - Added load_images to enable new sample app
Rem    jstraub    09/21/2004 - Added v_security_group_id to populate_tables to support lower of workspace name for psswd's
Rem    cbcho      11/22/2005 - Changed load_images to accept v_flow_id
Rem    cbcho      01/24/2008 - Renamed load_images to load_product_info, Changed populate_tables to accept v_flow_id
Rem    hfarrell   06/20/2011 - Start of package rewrite: added procedures to initiate install/de-install of Websheet sample applications from Template Applications (feature #661)
Rem    hfarrell   07/01/2011 - Added install/deinstall procedures for Database sample applications: Product Portal and Collections
Rem    hfarrell   07/05/2011 - Removed procedures no longer required:remove_and_create_sample_app,create_sample_app,remove_sample_app,create_tables, remove_tables, populate_tables and load_product_info
Rem     hfarrell  05/28/2012 - Updated install_db_app to replace p_name with p_app_id, part of integration with Packaged Applications

CREATE OR REPLACE PACKAGE wwv_flow_sample_app
IS

procedure deinstall_websheet (
	p_security_group_id in number,
	p_id                in number);

procedure install_websheet (
	p_name              in varchar2,
	p_security_group_id in number,
	p_id                in number);

procedure deinstall_db_app (
  p_id                in number);

procedure install_db_app (
  p_app_id            in number,
  p_schema            in varchar2,
  p_security_group_id in number default wwv_flow_security.g_security_group_id,
  p_id                in number default wwv_flow_utilities.minimum_free_flow);

END wwv_flow_sample_app;
/
show errors
