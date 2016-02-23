set define '^'
set verify off
prompt ...wwv_flow_audit


Rem  Copyright (c) Oracle Corporation 2000 - 2006. All Rights Reserved.
Rem
Rem    NAME
Rem      audit.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       mhichwa  09/01/2000 - Created
Rem       mhichwa  09/02/2000 - Refinement bug fixes
Rem       mhichwa  09/04/2000 - Do not log export import
Rem       mhichwa  09/05/2000 - Add audit of shortcuts
Rem       mhichwa  12/12/2000 - Fixed show errors sql plus message
Rem       mhichwa  12/19/2000 - Crated two indexes on audit trail
Rem       mhichwa  03/03/2001 - Added security group id to audit trail table
Rem       mhichwa  03/27/2001 - Added remove audit trail
Rem       mhichwa  01/25/2002 - Added help trigger for item level help
Rem       sspadafo 01/25/2002 - Changed audit_action procedure for item level help table
Rem       sspadafo 08/06/2002 - Replaced use of wwv_flow_id.next_val with wwv_seq for audit_trail pk
Rem       sspadafo 08/14/2002 - Added check in wwv_biu_flows_audit trigger to skip audit on audit row updates
Rem       sspadafo 09/24/2002 - Added auth setups audit actions
Rem       sspadafo 09/27/2002 - Added wwv_flow_entry_points,wwv_flow_entry_point_args,wwv_flow_step_branch_args audit actions
Rem       sspadafo 11/27/2002 - Changed audit_action to record correct flow_id if current flow is 4150 or 4750
Rem       mhichwa  02/03/2003 - Added scn and audit comment columns for bug  2756289, 2782711
Rem       mhichwa  02/03/2003 - Extended audit action procedure to have an extra column on insert 2782711
Rem       mhichwa  02/03/2003 - Added index to speed access by flow component PK 2782711
Rem       cbcho    11/04/2003 - Changed wwv_flow_builder_audit_naming insert statement to use application instead of flow
Rem       sspadafo 09/08/2004 - Added wwv_flow_audit.g_cascade boolean package variable and reference it in audit_action procedure
Rem       mhichwa  05/10/2005 - Added index 5, removed index 4
Rem       mhichwa  05/10/2005 - Added trigger on breadcrumb entry (flow_menu_options)
Rem       mhichwa  05/10/2005 - Removed audit naming
Rem       mhichwa  05/10/2005 - Fixed menu options trigger name wwv_biu_flow_menu_opt_audit
Rem       mhichwa  05/10/2005 - Removed index 2 on menu options table
Rem       sspadafo 12/15/2005 - Added calls to wwv_flow_utilities.check_sgid in each procedure (Bug 4873315)
Rem       jkallman 04/25/2006 - Moved triggers to audit_trigger.sql, tables/indexes to tab.sql (Bug 5070914)
Rem       sbkenned 11/04/1009 - Added storage of object_name

create or replace package wwv_flow_audit as

    g_cascade boolean := false;

procedure audit_action (
    p_table_name              in varchar2,
    p_action                  in varchar2,
    p_table_pk                in number,
    p_object_name             in varchar2)
    ;

procedure remove_audit_trail (
    p_flow_id                 in number)
    ;

end wwv_flow_audit;
/

show errors

