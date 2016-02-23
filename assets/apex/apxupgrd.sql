Rem
Rem $Header: marvel/apxupgrd.sql raeburns_convert_apex_upgrade/2 2015/01/23 11:25:28 raeburns Exp $
Rem
Rem apxupgrd.sql
Rem
Rem Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.
Rem
Rem    NAME
Rem      apxupgrd.sql - APeX UPGRADEe script
Rem
Rem    DESCRIPTION
Rem       Upgrades APEX to the current release
Rem
Rem    NOTES
Rem      Invoked by cmpupgrd.sql via --CATCTL -CP
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    raeburns	   01/15/15 - temp fix for bug 20089214 during upgrade
Rem    raeburns    01/15/15 - new APEX upgrade script
Rem    raeburns    01/15/15 - Created
Rem

Rem Set identifier to APEX for errorlogging
SET ERRORLOGGING ON TABLE SYS.REGISTRY$ERROR IDENTIFIER 'APEX';

SELECT dbms_registry_sys.time_stamp_display('APEX') AS timestamp FROM DUAL;

@@apxdbmig.sql

-- Update APEX ancillary schemas
BEGIN
   sys.dbms_registry.update_schema_list('APEX',
       sys.dbms_registry.schema_list_t('FLOWS_FILES','APEX_PUBLIC_USER'));
END;
/

SELECT dbms_registry_sys.time_stamp('APEX') AS timestamp FROM DUAL;
