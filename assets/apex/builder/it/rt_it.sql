Rem  Copyright (c) Oracle Corporation 1999 - 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      rt_it.sql
Rem
Rem    DESCRIPTION
Rem      Install Italian version of Application Express runtime
Rem
Rem    NOTES
Rem      Assumes the Application Express owner.
Rem      Note that the NLS_LANG must be properly set in the environment
Rem      prior to running this script or character set conversion can take place
Rem      The character set portion of NLS_LANG must be set to AL32UTF8
Rem         Example: AMERICAN_AMERICA.AL32UTF8
Rem 
Rem    REQUIREMENTS
Rem      - Oracle 9.2.0.3 or greater
Rem
Rem    Arguments:
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   10/04/2007 - Created 
Rem      hfarrell   02/13/2012 - Added set define statement after f4155_it.sql (due to bug 13403278 fix)
Rem      arayner    01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)

prompt . ORACLE
prompt .
prompt . Application Express Runtime Installation.
prompt .........................................................


set define '^'
set concat on
set concat .
set verify off
set termout off
spool off
set termout on


prompt Install Application Express applications
begin
    wwv_flow_security.g_security_group_id := 10;
end;
/
@@f4411_it.sql
@@f4155_it.sql

set define '^'

prompt Adjust instance settings
-- Update image prefix, owner, release of installed translated applications
begin
    wwv_flow_security.g_security_group_id := 10;
    --
    for c1 in (select flow_image_prefix, owner
                 from wwv_flows
                where security_group_id = 10
                  and id = 4155) loop
        update wwv_flows
           set flow_image_prefix = c1.flow_image_prefix,
               owner = c1.owner,
               flow_version = (select '&PRODUCT_NAME. ' || wwv_flows_release from dual where rownum = 1)
         where id in (4159,4415);
        commit;
        exit;
    end loop;--c1
end;
/
