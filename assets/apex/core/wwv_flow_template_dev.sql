set define off
set verify off

prompt ...wwv_flow_template_dev

create or replace package wwv_flow_template_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_template_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling templates in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/16/2012 - Created
--      pawolf    05/14/2012 - Added grid templates (feature #936)
--      pawolf    05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================


--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Returns the default breadcrumb position of a page template.
-- If p_page_template_id isn't specified, the default page template will be used.
--==============================================================================
function get_breadcrumb_display_point (
    p_application_id   in number,
    p_theme_id         in number,
    p_page_template_id in number default null )
    return varchar2;
--
--
end wwv_flow_template_dev;
/
show errors

set define '^'
