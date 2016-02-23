Rem Copyright (c) 2007, Oracle. All rights reserved.
Rem
Rem    NAME
Rem      apxe101.sql
Rem
Rem    DESCRIPTION
Rem      Runs downgrade actions for Application Express.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIRENTS
Rem      Application Express
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   05/15/2007 - Created
Rem      jstraub   05/21/2007 - Added store set command to save session settings
Rem      jstraub   06/08/2007 - Completed changes suggested by cdilling
Rem      jkallman  08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
Rem      jstraub   02/05/2008 - Changed reference from wwv_flow_dynsql_parse.plb to wwv_dbms_sql_noroles.plb
Rem      jstraub   02/26/2008 - Added call to apxe102.sql per component script guidelines
Rem      jstraub   02/28/2008 - Adapted for 11.2 downgrade
Rem      jstraub   04/16/2008 - Added set define '&' for lrg 3367442
Rem      jkallman  08/03/2009 - Remove reference to wwv_dbms_sql_noroles.plb

@@apxe102.sql

set define '&'
