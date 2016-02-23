set define '^'
set verify off
prompt ...audit triggers

Rem  Copyright (c) Oracle Corporation 2000 - 2012. All Rights Reserved.
Rem
Rem    NAME
Rem      audit_trigger.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jkallman 04/25/2006 - Created from original audit.sql (Bug 5070914)
Rem       pawolf   04/06/2009 - Added custom item types
Rem       pawolf   04/28/2009 - Renamed custom item type tables to wwv_flow_plugins
Rem       pawolf   05/06/2009 - Added wwv_flow_plugin_files
Rem       arayner  06/05/2009 - Added wwv_flow_page_da_events and wwv_flow_page_da_actions
Rem       pawolf   05/06/2009 - Added wwv_flow_plugin_events
Rem       pawolf   09/24/2009 - Added table wwv_flow_plugin_attr_values
Rem       sbkenned 11/04/2009 - Modified all wwv_flow_audit.audit_action calls to pass object_name
Rem                           - Added wwv_flow_shared_web_services
Rem                           - Added WWV_FLOW_SECURITY_SCHEMES
Rem       sbkenned 11/05/2009 - Added WWV_FLOW_TREES, WWV_FLOW_SHARED_QUERIES & WWV_FLOW_REPORT_LAYOUTS
Rem       mhichwa  11/12/2009 - Added trigger wwv_biu_flow_val_audit
Rem       sbkenned 12/01/2009 - Updated trigger on wwv_flow_icon_bar to push icon_subtext
Rem       pmanirah 26/04/2011 - Added wwv_flow_load_tables_audit, wwv_flow_ld_tab_lookups_audit, wwv_flow_ld_tab_rules_audit
Rem       cneumuel 05/16/2011 - Added wwv_biu_flow_authent_audit (feature 581)
Rem       cneumuel 06/06/2011 - Removed wwv_biu_flow_auth_setups_audit
Rem       pawolf   03/07/2012 - Added new table wwv_flow_theme_styles (feature# 821)
Rem       pawolf   03/08/2012 - Added data model changes for UI type feature (feature# 827)
Rem       pawolf   03/30/2012 - Added new table wwv_flow_plugin_settings (feature# 895)
Rem       vuvarov  04/03/2012 - Modified wwv_biu_step_branches_audit to use branch_name (feature #872)
Rem       vuvarov  05/01/2012 - Fixed reporting of update action in Data Loading triggers
Rem                           - Record display_name for plug-ins instead of the internal name
Rem       pawolf   05/14/2012 - Added grid templates (feature #936)
Rem       pawolf   05/21/2012 - Added wwv_flow_theme_display_points (feature #936)
Rem       pawolf   05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
Rem       pawolf   06/15/2012 - Added table wwv_flow_plug_tmpl_disp_points (feature #936)
Rem       pawolf   06/26/2012 - Added table wwv_flow_page_tmpl_disp_points (feature #936)
Rem       pawolf   04/11/2013 - Added new table wwv_flow_theme_files and new column files_version to wwv_flow_themes (feature #1162)
Rem       pawolf   04/18/2013 - Added wwv_flow_company_static_files and wwv_flow_static_files (feature #1169)
Rem       pawolf   01/14/2014 - Added wwv_flow_combined_files (feature #1340)
Rem       msewtz   03/14/2014 - Added wwv_flow_template_opt_audit (feature 1394)
Rem       pawolf   03/17/2014 - Added support for region columns (feature #1393)
Rem       msewtz   03/14/2014 - Added wwv_flow_templ_opt_grp_audit (feature 1394)

create or replace trigger wwv_biu_flow_build_audit_t
    before insert or update on wwv_flow_builder_audit_trail
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/
show errors


prompt ...wwv_flow_company_static_files audit

create or replace trigger wwv_biu_flow_comp_file_audit
    before insert or update or delete on wwv_flow_company_static_files
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_COMPANY_STATIC_FILES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.file_name, :old.file_name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_ui_types audit

create or replace trigger wwv_biu_flow_ui_type_audit
    before insert or update or delete on wwv_flow_ui_types
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_UI_TYPES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors



prompt ...wwv_flows audit

create or replace trigger wwv_biu_flows_audit
    before insert or update or delete on wwv_flows
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       -- skip audit procedure call if update is just updating the audit column
       if :new.last_updated_on <> :old.last_updated_on then
           return;
       end if;
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOWS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_templates audit

create or replace trigger wwv_biu_flow_tmplts_audit
    before insert or update or delete on wwv_flow_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_page_tmpl_dp_audit

create or replace trigger wwv_flow_page_tmpl_dp_audit
    before insert or update or delete on wwv_flow_page_tmpl_disp_points
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PAGE_TMPL_DISP_POINTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_template_opt_audit

create or replace trigger wwv_flow_template_opt_audit
    before insert or update or delete on wwv_flow_template_options
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_TEMPLATE_OPTIONS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_template_opt_grp_audit

create or replace trigger wwv_flow_templ_opt_grp_audit
    before insert or update or delete on wwv_flow_template_opt_groups
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_TEMPLATE_OPT_GROUPS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_icon_bar audit

create or replace trigger wwv_biu_flow_icon_bar_audit
    before insert or update or delete on wwv_flow_icon_bar
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ICON_BAR',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(nvl(:new.icon_image_alt,:new.icon_subtext),
                            nvl(:old.icon_image_alt,:old.icon_subtext)));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_processing audit

create or replace trigger wwv_biu_processing_audit
    before insert or update or delete on wwv_flow_processing
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PROCESSING',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.process_name,:old.process_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_items audit

create or replace trigger wwv_biu_flow_items_audit
    before insert or update or delete on wwv_flow_items
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ITEMS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_validations audit

create or replace trigger wwv_biu_flow_val_audit
    before insert or update or delete on wwv_flow_validations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_VALIDATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.validation_name,:old.validation_name));
    exception when others then null;
    end;
end wwv_biu_flow_val_audit;
/
show errors


prompt ...wwv_flow_computations audit

create or replace trigger wwv_biu_computations_audit
    before insert or update or delete on wwv_flow_computations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_COMPUTATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.computation_item,:old.computation_item));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_tabs audit

create or replace trigger wwv_biu_flow_tabs_audit
    before insert or update or delete on wwv_flow_tabs
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TABS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.tab_name,:old.tab_name));
    exception when others then null;
    end;
end;
/
show errors



prompt ...wwv_flow_toplevel_tabs audit

create or replace trigger wwv_biu_flow_tl_tabs_audit
    before insert or update or delete on wwv_flow_toplevel_tabs
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TOPLEVEL_TABS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.tab_name,:old.tab_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_lists_of_values$ audit

create or replace trigger wwv_biu_flow_lov_audit
    before insert or update or delete on wwv_flow_lists_of_values$
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LISTS_OF_VALUES$',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.lov_name,:old.lov_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_list_of_values_data audit

create or replace trigger wwv_biu_flow_lovd_audit
    before insert or update or delete on wwv_flow_list_of_values_data
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_OF_VALUES_DATA',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.lov_disp_value,:old.lov_disp_value));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_steps audit

create or replace trigger wwv_biu_flow_steps_audit
    before insert or update or delete on wwv_flow_steps
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEPS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_step_buttons audit

create or replace trigger wwv_biu_step_buttons_audit
    before insert or update or delete on wwv_flow_step_buttons
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BUTTONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.button_name,:old.button_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_step_branches audit

create or replace trigger wwv_biu_step_branches_audit
    before insert or update or delete on wwv_flow_step_branches
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BRANCHES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.branch_name, :old.branch_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_step_branch_args audit

create or replace trigger wwv_biu_step_branch_args_audit
    before insert or update or delete on wwv_flow_step_branch_args
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BRANCH_ARGS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => null);
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_step_items audit

create or replace trigger wwv_biu_step_items_audit
    before insert or update or delete on wwv_flow_step_items
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_ITEMS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_biu_flow_menu_opt audit (breadcrumbs)

create or replace trigger wwv_biu_flow_menu_opt_audit
    before insert or update or delete on wwv_flow_menu_options
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_MENU_OPTIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.short_name,:old.short_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_step_computations audit

create or replace trigger wwv_biu_step_comp_audit
    before insert or update or delete on wwv_flow_step_computations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_COMPUTATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.computation_item,:old.computation_item));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_step_validations audit

create or replace trigger wwv_biu_step_valid_audit
    before insert or update or delete on wwv_flow_step_validations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_VALIDATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.validation_name,:old.validation_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_step_processing audit

create or replace trigger wwv_biu_step_processing_audit
    before insert or update or delete on wwv_flow_step_processing
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_PROCESSING',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.process_name,:old.process_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_page_plug_templates audit

create or replace trigger wwv_biu_flowpageplugtemp_audit
    before insert or update or delete on wwv_flow_page_plug_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_PLUG_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.page_plug_template_name,:old.page_plug_template_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_plug_tmpl_dp_audit

create or replace trigger wwv_flow_plug_tmpl_dp_audit
    before insert or update or delete on wwv_flow_plug_tmpl_disp_points
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUG_TMPL_DISP_POINTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_row_templates audit

create or replace trigger wwv_biu_flowrowtmplts_audit
    before insert or update or delete on wwv_flow_row_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ROW_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.row_template_name,:old.row_template_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_list_templates audit

create or replace trigger wwv_biu_flowlisttmplts_audit
    before insert or update or delete on wwv_flow_list_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_template_name,:old.list_template_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_page_plugs audit

create or replace trigger wwv_biu_flowpageplugs_audit
    before insert or update or delete on wwv_flow_page_plugs
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_PLUGS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.plug_name,:old.plug_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_region_columns_audit

create or replace trigger wwv_flow_region_columns_audit
    before insert or update or delete on wwv_flow_region_columns
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_REGION_COLUMNS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_biu_flow_messages audit

create or replace trigger wwv_biu_flow_messages_audit
    before insert or update or delete on wwv_flow_messages$
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_MESSAGES$',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_patches audit (build options)

create or replace trigger wwv_biu_flow_patches_audit
    before insert or update or delete on wwv_flow_patches
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PATCHES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.patch_name,:old.patch_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_developers audit

create or replace trigger wwv_biu_flow_developers_audit
    before insert or update or delete on wwv_flow_developers
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_DEVELOPERS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.userid,:old.userid));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_lists audit

create or replace trigger wwv_biu_flow_lists_audit
    before insert or update or delete on wwv_flow_lists
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LISTS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_list_items audit

create or replace trigger wwv_biu_flow_list_items_audit
    before insert or update or delete on wwv_flow_list_items
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_ITEMS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_item_link_text,:old.list_item_link_text));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_lov_values audit

create or replace trigger wwv_biu_flow_lov_val_audit
    before insert or update or delete on wwv_flow_lov_values
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_LOV_VALUES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_display_value,:old.list_display_value));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_effective_userid_map audit

create or replace trigger wwv_biu_flw_eff_uid_map_audit
    before insert or update or delete on wwv_flow_effective_userid_map
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_EFFECTIVE_USERID_MAP',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.effective_userid,:old.effective_userid));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_shortcuts audit

create or replace trigger wwv_biu_flow_shortcuts_audit
    before insert or update or delete on wwv_flow_shortcuts
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_SHORTCUTS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.shortcut_name,:old.shortcut_name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_setp_item_help audit

create or replace trigger wwv_biu_flow_step_item_help_a
    before insert or update or delete on wwv_flow_step_item_help
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_ITEM_HELP',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.help_text,:old.help_text));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_entry_points audit

create or replace trigger wwv_biu_entry_points_audit
    before insert or update or delete on wwv_flow_entry_points
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ENTRY_POINTS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_entry_point_args audit

create or replace trigger wwv_biu_entry_point_args_audit
    before insert or update or delete on wwv_flow_entry_point_args
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ENTRY_POINT_ARGS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => null);
    exception when others then null;
    end;
end;
/
show errors


prompt ...trigger wwv_flow_themes audit

create or replace trigger wwv_biu_flowthemes_audit
         before insert or update or delete on wwv_flow_themes
         for each row
declare
    l_action varchar2(1);
begin
    if inserting then
        l_action := 'I';
    elsif updating then
        l_action := 'U';
    else
        l_action := 'D';
    end if;

     begin
         wwv_flow_audit.audit_action (
            p_table_name  => 'WWV_FLOW_THEMES',
            p_action      => l_action,
            p_table_pk    => nvl(:old.id,:new.id),
            p_object_name => nvl(:new.theme_name,:old.theme_name));
     exception when others then null;
     end;
end;
/
show errors


prompt ...wwv_flow_theme_styles_audit

create or replace trigger wwv_biu_flow_theme_style_audit
    before insert or update or delete on wwv_flow_theme_styles
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_THEME_STYLES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_theme_disp_poin_audit

create or replace trigger wwv_flow_theme_disp_poin_audit
    before insert or update or delete on wwv_flow_theme_display_points
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_THEME_DISPLAY_POINTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_theme_files audit

create or replace trigger wwv_biu_flow_theme_file_audit
    before insert or update or delete on wwv_flow_theme_files
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_THEME_FILES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.file_name,:old.file_name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_plugins audit

create or replace trigger wwv_biu_flow_plugin_audit
    before insert or update or delete on wwv_flow_plugins
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGINS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.display_name,:old.display_name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_plugin_attributes audit

create or replace trigger wwv_biu_flow_plugin_attr_audit
    before insert or update or delete on wwv_flow_plugin_attributes
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_ATTRIBUTES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.prompt,:old.prompt) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_plugin_attr_values audit

create or replace trigger wwv_biu_flow_plugin_attrv_audi
    before insert or update or delete on wwv_flow_plugin_attr_values
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_ATTR_VALUES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.display_value,:old.display_value) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_plugin_files audit

create or replace trigger wwv_biu_flow_plugin_file_audit
    before insert or update or delete on wwv_flow_plugin_files
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_FILES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.file_name,:old.file_name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_plugin_events audit

create or replace trigger wwv_biu_flow_plugin_evnt_audit
    before insert or update or delete on wwv_flow_plugin_events
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_EVENTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_plugin_settings audit

create or replace trigger wwv_biu_flow_plugin__set_audit
    before insert or update or delete on wwv_flow_plugin_settings
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_SETTINGS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id,    :new.id),
           p_object_name => nvl(:new.plugin,:old.plugin) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_page_da_events audit

create or replace trigger wwv_biu_flow_page_da_e_audit
    before insert or update or delete on wwv_flow_page_da_events
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PAGE_DA_EVENTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_page_da_actions audit

create or replace trigger wwv_biu_flow_page_da_a_audit
    before insert or update or delete on wwv_flow_page_da_actions
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PAGE_DA_ACTIONS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.action,:old.action) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_shared_web_services audit

create or replace trigger wwv_biu_flow_shared_ws_audit
    before insert or update or delete on wwv_flow_shared_web_services
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_SHARED_WEB_SERVICES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_user_interfaces audit

create or replace trigger wwv_biu_flow_user_int_audit
    before insert or update or delete on wwv_flow_user_interfaces
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_USER_INTERFACES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.display_name, :old.display_name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_combined_files

create or replace trigger wwv_biu_flow_comb_files_audit
    before insert or update or delete on wwv_flow_combined_files
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_COMBINED_FILES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.combined_file_url, :old.combined_file_url) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_static_files audit

create or replace trigger wwv_biu_flow_file_audit
    before insert or update or delete on wwv_flow_static_files
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_STATIC_FILES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.file_name,:old.file_name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_security_schemes audit

create or replace trigger wwv_biu_flow_sec_schemes_audit
    before insert or update or delete on wwv_flow_security_schemes
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_SECURITY_SCHEMES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_trees audit

create or replace trigger wwv_biu_flow_trees_audit
    before insert or update or delete on wwv_flow_trees
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_TREES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.tree_name,:old.tree_name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_shared_queries audit

create or replace trigger wwv_biu_flow_shrd_qry_audit
    before insert or update or delete on wwv_flow_shared_queries
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_SHARED_QUERIES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/
show errors


prompt ...wwv_flow_report_layouts audit

create or replace trigger wwv_biu_flow_rpt_layouts_audit
    before insert or update or delete on wwv_flow_report_layouts
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_REPORT_LAYOUTS',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.report_layout_name,:old.report_layout_name) );
    exception when others then null;
    end;
end;
/
show errors

prompt ...wwv_flow_load_tables audit

create or replace trigger wwv_flow_load_tables_audit
    before insert or update or delete on wwv_flow_load_tables
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                 when inserting then 'I'
                 when updating  then 'U'
                 else                'D'
               end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_LOAD_TABLES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/
show errors

prompt ...wwv_flow_load_table_lookups audit

create or replace trigger wwv_flow_ld_tab_lookups_audit
    before insert or update or delete on wwv_flow_load_table_lookups
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                 when inserting then 'I'
                 when updating  then 'U'
                 else                'D'
               end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_LOAD_TABLE_LOOKUPS',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.load_column_name,:old.load_column_name) );
    exception when others then null;
    end;
end;
/
show errors

prompt ...wwv_flow_load_table_rules audit

create or replace trigger wwv_flow_ld_tab_rules_audit
    before insert or update or delete on wwv_flow_load_table_rules
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                 when inserting then 'I'
                 when updating  then 'U'
                 else                'D'
               end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_LOAD_TABLE_RULES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.load_column_name,:old.load_column_name) );
    exception when others then null;
    end;
end;
/
show errors

prompt ...wwv_flow_authentications audit

create or replace trigger wwv_biu_flow_authent_audit
    before insert or update or delete on wwv_flow_authentications
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_AUTHENTICATIONS',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/
show errors
