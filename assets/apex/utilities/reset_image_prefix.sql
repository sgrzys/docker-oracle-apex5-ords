Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      reset_image_prefix.sql
Rem
Rem    DESCRIPTION
Rem      Reset the image prefix used in an Application Express installation
Rem
Rem    NOTES
Rem
Rem      - This utility should be run via SQL*Plus and connected as SYS.
Rem      - This utility will also recompile the entire Application Express schema
Rem
Rem      - This utility should not be run on an active Application Express instance.
Rem        If need be, the database should be started in RESTRICT mode.
Rem
Rem    Arguments:
Rem      None - The user will be prompted for the updated image prefix
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   02/27/2007 - Created
Rem      jkallman   12/04/2007 - Updated with FLOWS_030100
Rem      jkallman   04/14/2008 - Add call to wwv_flow_page_cache_api.purge_all (Bug 6963877)
Rem      jkallman   07/08/2008 - Updated with FLOWS_040000
Rem      jkallman   10/02/2008 - Changed FLOWS_040000 references to APEX_040000
Rem      jkallman   11/22/2010 - Changed APEX_040000 references to APEX_040100
Rem      pawolf     10/19/2012 - Changed APEX_040100 references to APEX_040200 (bug 14785456)
Rem      pawolf     12/12/2012 - Removed updating of image prefix for internal apps (bug #15969515)
Rem      jkallman   12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      jstraub    08/26/2013 - Moved logic to reset_image_prefix_core.sql to support CDB installations
Rem      jstraub    03/06/2017 - Added passing extra parameter (x) to reset_image_prefix_core.sql (bug 18016349)

set define '&'
set concat on
set concat .
set verify off
set termout on

prompt
prompt
accept IMGPRE CHAR default '/i/' prompt 'Enter the Application Express image prefix [/i/] '

@@reset_image_prefix_core.sql &IMGPRE x

exit;