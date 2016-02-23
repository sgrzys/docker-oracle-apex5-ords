Rem  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_epg_config.sql
Rem
Rem    DESCRIPTION
Rem      This script will load the Application Express images into XDB and then configure
Rem      a DAD for use by Application Express in the Embedded PL/SQL Gateway.
Rem
Rem    NOTES
Rem      This script should be run as SYS.
Rem
Rem    Arguments:
Rem      Position 1: The path to the directory where the Application Express software exists on
Rem                  the filesystem.
Rem
Rem    Example:
Rem      sqlplus "sys/syspass as sysdba" @apex_epg_config.sql /tmp
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     jstraub    09/09/2008 - Created to support OTN and DB distributions, moved logic to apex_epg_config_core.sql
Rem     jstraub    02/03/2014 - Added PREFIX

set define '&'

define PREFIX  = '@'

@@apex_epg_config_core.sql '&1'
