Rem  Copyright (c) Oracle Corporation 1999 - 2008. All Rights Reserved.
Rem
Rem    NAME
Rem      apxpatch.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIRENTS
Rem      - Oracle 11g
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   01/03/2008 - Created
Rem      jstraub   01/30/2008 - Added missing @ sign in calling apxrelod.sql

WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
-- If you are calling this script manually, and it is not called by the normal upgrade process,
-- you must comment the following line
EXECUTE dbms_registry.check_server_instance;
WHENEVER SQLERROR CONTINUE

@@apxrelod.sql
