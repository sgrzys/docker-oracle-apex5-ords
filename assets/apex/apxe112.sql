Rem Copyright (c) 2008, Oracle. All rights reserved.
Rem
Rem    NAME
Rem      apxe112.sql
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
Rem      jstraub   02/26/2008 - Created for 11.2 downgrade
Rem      jstraub   04/14/2008 - Changed logic to revert images directory to prior release, only if resource exists (lrg 3366866)
Rem      jstraub   05/08/2008 - Added call to validate_apex since there is no apxrelod script for 10.1 and 10.2 (lrg 3398351)
Rem      jkallman  10/02/2008 - Change FLOWS_030100 references to APEX_040000
Rem      jstraub   12/08/2008 - Changed current_schema to ^UFROM prior to wwv_flow_upgrade.switch_schemas (lrg 3702914)
Rem      jstraub   03/18/2009 - Removed call to validate_apex per component script guidelines, already in apxrelod.sql
Rem      jstraub   10/27/2009 - Moved storing of apxset.sql to $ORACLE_HOME/rdbms/log (Bug 7422107)
Rem      jstraub   05/12/2011 - Adapted for downgrade from 12.1 to 11.2
Rem      jstraub   10/20/2011 - Changed APEX_040000 references to APEX_040100
Rem      pawolf    02/21/2012 - Changed APEX_040100 references to APEX_040200
Rem      jstraub   03/20/2012 - Changed current_schema in call to wwv_flow_upgrade.switch_schemas to fix 12c issue
Rem      jstraub   04/30/2012 - Added changes to support downgrade from 12c
Rem      jkallman  12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      jstraub   04/29/2014 - Modified to call apxe121.sql

@@apxe121.sql
