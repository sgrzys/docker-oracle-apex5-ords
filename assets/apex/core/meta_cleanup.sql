set define '^'
set verify off
prompt ...wwv_meta_cleanup

Rem    Arguments:
Rem     1:  
Rem     2:
Rem     3:  Flow user

Rem    MODIFIED (MM/DD/YYYY)
Rem    tmuth     10/01/2002 - Created
Rem    tmuth     11/25/2002 - Added item_attributes
Rem    msewtz    11/26/2002 - Added row_template_condition
Rem    cbcho     04/15/2003 - Bug 2722911: Added copy_svg_series_attr
Rem    jkallman  04/30/2003 - Added menu_options_update
Rem    cbcho     05/01/2003 - Added svg_region_source_update
Rem    jkallman  05/08/2003 - Added lov_data_update
Rem    sspadafo  07/06/2003 - Added report_columns_update for report columns migration (Bug 3039227)
Rem    sspadafo  07/28/2003 - Added fix_app_auth_logout_url (Bug 3072617)
Rem    sspadafo  08/18/2003 - Added enforce_page_alias_uniqueness (Bug 3039513)
Rem    jkallman  09/26/2003 - Added fix_file_repository (Bug 3162605)
Rem    pawolf    04/23/2013 - Removed fix_repository (feature #1169)

create or replace package wwv_meta_cleanup
as
--
--
--
--  Copyright (c) Oracle Corporation 2000 - 2002. All Rights Reserved.
--
--    NAME
--      meta_cleanup.sql
--
--    DESCRIPTION
--      Package to cleanup meta data between versions
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--    RUNTIME DEPLOYMENT: YES
--
--

    procedure template_head_update;
    
    procedure item_attributes;
    
    procedure row_template_condition;
    
    procedure copy_svg_series_attr;

    procedure menu_options_update;

    procedure lov_data_update;
    
    procedure svg_region_source_update;
    
    procedure report_columns_update;
    
    procedure fix_app_auth_logout_url;
    
    procedure enforce_page_alias_uniqueness;

end wwv_meta_cleanup;
/
show errors
