set define '^'
set verify off
prompt ...wwv_mig_frm_update_apx_app

Rem  Copyright (c) Oracle Corporation 2008. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_mig_frm_update_apx_app.plb
Rem
Rem    DESCRIPTION
Rem
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem    ashiverm   01/06/2008 - Created
Rem    hfarrell   06/20/2008 - Updated to break the script into separate specification and body files
Rem    hfarrell   08/18/2008 - Added is_table_or_view function
Rem    hfarrell   09/15/2008 - Removed function is_table_or_view, moved to wwv_mig_frm_utilities package
Rem    hfarrell   09/18/2008 - Added set_apex_app_logo procedure, to set Text Application Logo in generated APEX application
Rem    hfarrell   09/18/2008 - Added update_forms_pages procedure

CREATE OR REPLACE PACKAGE wwv_mig_frm_update_apx_app
AS

PROCEDURE update_page_plug (
    p_flow_id                           IN  NUMBER,
    p_model_id                          IN  NUMBER,
    p_project_id                        IN  NUMBER,
    p_security_group_id                 IN  NUMBER
);

PROCEDURE set_apex_app_logo (
    p_app_name                          IN VARCHAR2,
    p_flow_id                           IN NUMBER,
    p_security_group_id                 IN NUMBER
);

PROCEDURE update_forms_pages (
    p_flow_id                           IN  NUMBER,
    p_model_id                          IN  NUMBER,
    p_project_id                        IN  NUMBER,
    p_security_group_id                 IN  NUMBER
);

end wwv_mig_frm_update_apx_app;
/

show errors
/

