set define '^' verify off
prompt ...wwv_flow_css_calendar_dev
create or replace package wwv_flow_css_calendar_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_css_calendar_dev.sql
--
--    DESCRIPTION
--      This package is responsible for css calendar dev code
--
--    MODIFIED      (MM/DD/YYYY)
--    pmanirah       06/19/2014  - Created
--    pmanirah       07/25/2014  - Updated the create_dd_code_edit_page by adding additional parameters for form
--    pmanirah       01/06/2015  - refactored the code of procedure create_dd_code_edit_page to create two different pages for editting or creating  a new event.
--    pmanirah       01/20/2015  - Updated the create_dd_code_edit_page to handle differently creation of edit from of desktop and mobile
--    pmanirah       01/21/2015  - Added a format mask to the creating of edit/create page for date columns
--

procedure create_dd_code_edit_page (
        p_flow_id             in  number,
        p_table_owner         in  varchar2,
        p_table_name          in  varchar2,
        p_group_name          in  varchar2,
        p_user_interface      in  varchar2,
        p_pk_column_name      in  varchar2,
        p_drag_and_drop       in  varchar2 default 'N',
        p_cal_edit_page       in  varchar2 default 'N',
        p_mob_edit_page       in  varchar2 default 'N',
        p_cal_new_page        in  varchar2 default 'N',        
        p_pk_column_name2     in  varchar2 default null,
        p_form_page_number    in  number   default null,
        p_form_page_name      in  varchar2 default null,
        p_form_page_mode      in  varchar2 default null,
        p_form_region_name    in  varchar2 default null,
        p_form_reg_template   in  varchar2 default null,
        --
        p_new_page_number    in  number   default null,
        p_new_page_name      in  varchar2 default null,
        p_new_region_name    in  varchar2 default null,
        --        
        p_form_columns        in  varchar2 default null,
        p_branch              in  varchar2,
        p_attribute_01        in  varchar2,
        p_attribute_02        in  varchar2,
        p_attribute_03        in  varchar2,
        p_attribute_04        out varchar2,
        p_attribute_05        out varchar2,
        p_attribute_06        out varchar2,
        p_attribute_07        out varchar2,
        p_attribute_08        out varchar2,
        p_attribute_13        in  varchar2 );

end wwv_flow_css_calendar_dev;
/
show errors
