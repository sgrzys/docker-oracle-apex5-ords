Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      load_fr.sql
Rem
Rem    DESCRIPTION
Rem      Install French version of Application Express applications
Rem
Rem    NOTES
Rem      Assumes the Application Express owner.
Rem      Note that the NLS_LANG must be properly set in the environment
Rem      prior to running this script or character set conversion can take place
Rem      The character set portion of NLS_LANG must be set to AL32UTF8
Rem         Example: AMERICAN_AMERICA.AL32UTF8
Rem
Rem    Arguments:
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   08/29/2003 - Created 
Rem      jkallman   11/07/2003 - Set sgid
Rem      jkallman   12/29/2003 - Remove exit statement (Bug 3343818)
Rem      jkallman   09/23/2005 - Added conditional logic for XE 
Rem      jkallman   09/29/2005 - Unconditionally load 4550, remove 4200
Rem      jkallman   03/27/2006 - Modify update of flow_version (Bug 5113472)
Rem      jkallman   01/15/2007 - Added 4400
Rem      jkallman   10/04/2007 - Remove XE-specifics
Rem      jkallman   03/26/2010 - Added 4600, 4800 and 4900
Rem      jkallman   06/13/2011 - Added 4850
Rem      jkallman   08/10/2011 - Remove spool off, add call to wwv_flow_security.set_internal_cookie_name;
Rem      pawolf     12/19/2011 - Added final commit (bug# 13515612)
Rem      hfarrell   02/13/2012 - Added set define statement after f4900_fr.sql (due to bug 13403278 fix)
Rem      arayner    01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)
Rem      cneumuel   06/04/2013 - Removed call to wwv_flow_security.set_internal_cookie_name (bug #12803793)
Rem      jkallman   01/27/2014 - Added 4750
Rem      jkallman   06/10/2014 - Removed 4600

prompt . ORACLE
prompt .
prompt . Application Express Hosted Development Service Installation.
prompt .........................................................


set define '^'
set concat on
set concat .
set verify off
set termout off
set termout on

prompt Install Application Express applications
begin
    wwv_flow_security.g_security_group_id := 10;
end;
/
@@f4411_fr.sql
@@f4000_fr.sql
@@f4050_fr.sql
@@f4155_fr.sql
@@f4300_fr.sql
@@f4350_fr.sql
@@f4400_fr.sql
@@f4500_fr.sql
@@f4550_fr.sql
@@f4700_fr.sql
@@f4750_fr.sql
@@f4800_fr.sql
@@f4850_fr.sql
@@f4900_fr.sql

set define '^'

prompt Adjust instance settings
-- Update image prefix, owner, release of installed translated applications
begin
    wwv_flow_security.g_security_group_id := 10;
    --
    for c1 in (select flow_image_prefix, owner
                 from wwv_flows
                where security_group_id = 10
                  and id = 4000) loop
        update wwv_flows
           set flow_image_prefix = c1.flow_image_prefix,
                owner = c1.owner,
                flow_version = (select '&PRODUCT_NAME. ' || wwv_flows_release from dual where rownum = 1)
          where id in (4002,4052,4157,4302,4352,4402,4413,4502,4552,4602,4702,4752,4802,4852,4902);
        update wwv_flows set flow_version = '&PRODUCT_NAME. ' where id = 4552;
        exit;
    end loop;--c1
    commit;
end;
/
