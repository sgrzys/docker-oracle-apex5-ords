
Rem  Copyright (c) Oracle Corporation 2010 - 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      apex_ws_views.sql
Rem
Rem    DESCRIPTION
Rem      data dictionary views of Oracle APEX Websheet meta data
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    cbcho       02/11/2010 - Created
Rem    mhichwa     02/18/2010 - added apex_ws_applications and apex_ws_app_pages
Rem    mhichwa     02/19/2010 - added grants
Rem    jkallman    04/22/2010 - Added language and territory to apex_ws_applications
Rem    jkallman    11/22/2010 - Change APEX_040000 references to APEX_040100
Rem    sathikum    02/24/2011 - Modified all the conditions of APEX_ prefixed views (feature #608)
Rem    cbcho       05/13/2011 - Added page_style,custom_css,show_reset_passwd_yn,allow_sql_yn,allow_public_access_yn,login_page_message to apex_ws_applications
Rem    sathikum    12/07/2011 - Fixed #13426740 modified APEX_ views
Rem    cneumuel    04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem    cbcho       04/27/2012 - Added email_from to apex_ws_applications (feature #695)
Rem    cbcho       10/11/2013 - Added allow_pivot (feature #536)
Rem    cneumuel    08/05/2014 - Removed grants to public

create or replace view apex_ws_applications
as
select
   w.short_name                workspace,
   a.id                        application_id,
   a.security_group_id         workspace_id,
   a.name                      application_name,
   a.OWNER,
   a.DESCRIPTION,
   a.STATUS,
   a.LOGIN_URL,
   a.LOGOUT_URL,
   a.HOME_PAGE_ID,
   a.page_style,
   a.custom_css,
   a.show_reset_passwd_yn,
   a.allow_sql_yn,
   a.allow_public_access_yn,
   a.login_page_message,
   a.AUTH_ID,
   a.ACL_TYPE,
   a.DATE_FORMAT,
   a.language,
   a.territory,
   a.LOGO_TYPE,
   a.LOGO_TEXT,
   a.LOGO_TEXT_ATTRIBUTES,
   sys.dbms_lob.getlength(a.LOGO_IMAGE) logo_image_size,
   a.LOGO_IMAGE_FILENAME,
   a.LOGO_IMAGE_MIMETYPE,
   a.LOGO_IMAGE_CHARSET,
   a.LOGO_IMAGE_LAST_UPDATE,
   a.LOGO_IMAGE_ATTRIBUTES,
   a.LOGO_FILEPATH,
   a.LOGO_FILEPATH_ATTRIBUTES,
   a.email_from,
   --
   a.created_on,
   a.created_by,
   a.updated_on,
   a.updated_by
from
     wwv_flow_ws_applications a,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.security_group_id = w.PROVISIONING_COMPANY_ID and
      w.provisioning_company_id != 0
/
comment on table apex_ws_applications is 'Websheet applications';

create or replace view apex_ws_app_pages
as
select
   w.short_name                workspace,
   a.id                        application_id,
   p.id                        page_id,
   a.security_group_id         workspace_id,
   a.name                      application_name,
--
    p.NAME                      page_name,
    p.OWNER                     page_owner,
   p.STATUS                    page_status,
   p.DESCRIPTION               page_description,
   p.PARENT_PAGE_ID            page_parent_id,
   p.UPPER_NAME                page_upper_name,
   p.PAGE_NUMBER               page_number,
   p.PAGE_ALIAS                page_alias,
   --
   p.created_on,
   p.created_by,
   p.updated_on,
   p.updated_by
from
     wwv_flow_ws_applications a,
     WWV_FLOW_WS_WEBPAGES p,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.id = p.ws_app_id and
      p.security_group_id = w.PROVISIONING_COMPANY_ID and
      a.security_group_id = w.PROVISIONING_COMPANY_ID and
      w.provisioning_company_id != 0
/
comment on table apex_ws_app_pages is 'Websheet application pages';


create or replace view apex_ws_data_grid
as
select
w.short_name                workspace,
a.id                        application_id,
a.name                      application_name,
dg.worksheet_id             interactive_report_id,
dg.id                       data_grid_id,
dg.websheet_name            data_grid_name,
dg.websheet_alias           data_grid_alias,
--
dg.created_on               ,
dg.created_by               ,
dg.updated_on               ,
dg.updated_by
from wwv_flow_ws_websheet_attr dg,
     wwv_flow_ws_applications a,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.security_group_id = w.PROVISIONING_COMPANY_ID and
      a.security_group_id = dg.security_group_id and
      a.id = dg.ws_app_id and
      dg.websheet_type = 'DATA' and
      w.provisioning_company_id != 0
/

comment on table  apex_ws_data_grid                    is 'Websheet Data Grid definition';
comment on column apex_ws_data_grid.workspace          is 'A work area mapped to one or more database schemas';
comment on column apex_ws_data_grid.application_id     is 'Application Primary Key, Unique over all workspaces';
comment on column apex_ws_data_grid.application_name   is 'Identifies the application';
comment on column apex_ws_data_grid.interactive_report_id is 'ID of the interactive report';
comment on column apex_ws_data_grid.data_grid_id       is 'ID of the Data Grid';
comment on column apex_ws_data_grid.data_grid_name     is 'Name of the Data Grid';
comment on column apex_ws_data_grid.data_grid_alias    is 'An alternate alphanumeric Data Grid identifier';
comment on column apex_ws_data_grid.created_on         is 'Auditing; date the record was created.';
comment on column apex_ws_data_grid.created_by         is 'Auditing; user that created the record.';
comment on column apex_ws_data_grid.updated_on         is 'Auditing; date the record was last modified.';
comment on column apex_ws_data_grid.updated_by         is 'Auditing; user that last modified the record.';


create or replace view apex_ws_data_grid_col
as
select
w.short_name                workspace,
a.id                        application_id,
a.name                      application_name,
ir.id                       interactive_report_id,
dg.id                       data_grid_id,
c.id                        column_id,
c.db_column_name            column_alias,
c.display_order             display_order,
(select name from wwv_flow_worksheet_col_groups where id = c.group_id) column_group,
c.group_id                  column_group_id,
c.report_label              report_label,
c.column_label              form_label,
c.column_link               ,
c.column_linktext           ,
c.column_link_attr          ,
c.column_link_checksum_type ,
--
decode(c.allow_sorting     ,'Y','Yes','N','No',c.allow_sorting     ) allow_sorting     ,
decode(c.allow_filtering   ,'Y','Yes','N','No',c.allow_filtering   ) allow_filtering   ,
decode(c.allow_highlighting   ,'Y','Yes','N','No',c.allow_highlighting) allow_highlighting,
decode(c.allow_ctrl_breaks ,'Y','Yes','N','No',c.allow_ctrl_breaks ) allow_ctrl_breaks ,
decode(c.allow_aggregations,'Y','Yes','N','No',c.allow_aggregations) allow_aggregations,
decode(c.allow_computations,'Y','Yes','N','No',c.allow_computations) allow_computations,
decode(c.allow_charting    ,'Y','Yes','N','No',c.allow_charting    ) allow_charting    ,
decode(c.allow_group_by    ,'Y','Yes','N','No',c.allow_group_by    ) allow_group_by    ,
decode(c.allow_pivot       ,'Y','Yes','N','No',c.allow_pivot       ) allow_pivot       ,
decode(c.allow_hide        ,'Y','Yes','N','No',c.allow_hide        ) allow_hide        ,
--
c.column_type               ,
c.display_text_as           ,
c.heading_alignment         ,
c.column_alignment          ,
c.format_mask               ,
tz_dependent                ,
--
decode(c.rpt_show_filter_lov,
       'D','Default Based on Column Type',
       'S','Use Defined List of Values to Filter Exact Match',
       'C','Use Defined List of Values to Filter Word Contains',
       '1','Use Named List of Values to Filter Exact Match',
       '2','Use Named List of Values to Filter Word Contains',
       'N','None',
       c.rpt_show_filter_lov)
                            filter_lov_source,
c.rpt_filter_date_ranges    filter_date_ranges,
--
c.help_text                 ,
--
c.column_expr,
c.column_comment                component_comment,
--
c.created_on,
c.created_by,
c.updated_on,
c.updated_by
from wwv_flow_worksheet_columns c,
     wwv_flow_worksheets ir,
     wwv_flow_ws_websheet_attr dg,
     wwv_flow_ws_applications a,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.security_group_id = w.provisioning_company_id and
      a.security_group_id = c.security_group_id and
      a.security_group_id = dg.security_group_id and
      a.id = dg.ws_app_id and
      ir.id = dg.worksheet_id and
      ir.id = c.worksheet_id and
      dg.websheet_type = 'DATA' and
      w.provisioning_company_id != 0
/

comment on table  apex_ws_data_grid_col                    is 'Report column definitions for Websheet Data Grid columns';
comment on column apex_ws_data_grid_col.workspace          is 'A work area mapped to one or more database schemas';
comment on column apex_ws_data_grid_col.application_id     is 'Application Primary Key, Unique over all workspaces';
comment on column apex_ws_data_grid_col.application_name   is 'Identifies the application';
comment on column apex_ws_data_grid_col.interactive_report_id is 'ID of the interactive report';
comment on column apex_ws_data_grid_col.data_grid_id       is 'ID of the Data Grid';
comment on column apex_ws_data_grid_col.column_id          is 'ID of this column';
comment on column apex_ws_data_grid_col.column_alias       is 'Database column name or expression to use in SQL query when displaying this data grid column';
comment on column apex_ws_data_grid_col.display_order      is 'Default display order of this column';
comment on column apex_ws_data_grid_col.column_group       is 'Name of the column group for this column';
comment on column apex_ws_data_grid_col.column_group_id    is 'ID of the column group for this column';
comment on column apex_ws_data_grid_col.report_label       is 'Report heading label to use for this column';
comment on column apex_ws_data_grid_col.form_label         is 'Single row view label to use for this column';
comment on column apex_ws_data_grid_col.column_link        is 'Optional link target for this column';
comment on column apex_ws_data_grid_col.column_linktext    is 'Text to display if a link is defined';
comment on column apex_ws_data_grid_col.column_link_attr   is 'Link attributes for the column link.  Displayed within the HTML "A" tag';
comment on column apex_ws_data_grid_col.column_link_checksum_type is 'An appropriate checksum when linking to protected pages';
comment on column apex_ws_data_grid_col.allow_sorting      is 'Determines whether to allow sorting for this column.';
comment on column apex_ws_data_grid_col.allow_filtering    is 'Determines whether to allow filtering for this column.';
comment on column apex_ws_data_grid_col.allow_highlighting is 'Determines whether to allow highlighting for this column.';
comment on column apex_ws_data_grid_col.allow_ctrl_breaks  is 'Determines whether to allow control breaks for this column.';
comment on column apex_ws_data_grid_col.allow_aggregations is 'Determines whether to allow aggregations for this column.';
comment on column apex_ws_data_grid_col.allow_computations is 'Determines whether to allow computations for this column.';
comment on column apex_ws_data_grid_col.allow_charting     is 'Determines whether to allow charting for this column.';
comment on column apex_ws_data_grid_col.allow_group_by     is 'Determines whether to allow group by for this column.';
comment on column apex_ws_data_grid_col.allow_pivot        is 'Determines whether to allow pivot for this column.';
comment on column apex_ws_data_grid_col.allow_hide         is 'Determines whether to allow hiding this column.';
comment on column apex_ws_data_grid_col.column_type        is 'Type of data in this column';
comment on column apex_ws_data_grid_col.display_text_as    is 'Format to display this column';
comment on column apex_ws_data_grid_col.heading_alignment  is 'Horizontal alignment of this column''s report heading';
comment on column apex_ws_data_grid_col.column_alignment   is 'Horizontal alignment of this column''s report data';
comment on column apex_ws_data_grid_col.format_mask        is 'Format mask for this column';
comment on column apex_ws_data_grid_col.tz_dependent       is 'Column is time zone dependent';
comment on column apex_ws_data_grid_col.filter_lov_source  is 'Query used to retrieve a list of values for the interactive report.  Displayed in the column header dropdowns, and during filter and highlight creation.';
comment on column apex_ws_data_grid_col.filter_date_ranges is 'Determines the range of dates to display for filters on this column';
comment on column apex_ws_data_grid_col.help_text          is 'Descriptive help text for this column, displayed when a user clicks on the column information icon';
comment on column apex_ws_data_grid_col.column_expr        is 'Attribute for internal use only';
comment on column apex_ws_data_grid_col.created_on         is 'Auditing; date the record was created.';
comment on column apex_ws_data_grid_col.created_by         is 'Auditing; user that created the record.';
comment on column apex_ws_data_grid_col.updated_on         is 'Auditing; date the record was last modified.';
comment on column apex_ws_data_grid_col.updated_by         is 'Auditing; user that last modified the record.';
comment on column apex_ws_data_grid_col.component_comment  is 'Developer Comment';
