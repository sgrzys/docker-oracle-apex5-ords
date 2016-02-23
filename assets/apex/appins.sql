Rem  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
Rem
Rem    NAME
Rem      appins.sql
Rem
Rem    DESCRIPTION
Rem      This is the development installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by coreins.sql or apxdvins.sql.
Rem
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 11.1.0.7 or later
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   07/24/2012 - Created
Rem      jstraub   08/22/2012 - Aligned timing start/stops
Rem      pawolf    12/13/2012 - Removed setting of image prefix for internal apps (bug #15969515)
Rem      cneumuel  12/20/2012 - set define to '^' before executing verification_images_load.sql (bug #15969515)
Rem      pawolf    01/15/2014 - Always set Builder authentication to APEX accounts
Rem      cneumuel  01/15/2014 - Moved install of apex_install_pe_data.sql from coreins.sql to appins.sql
Rem                           - Moved compile schema and create synonyms to the top
Rem      jkallman  01/27/2014 - Added f4750.sql
Rem      cneumuel  02/03/2014 - Use wwv_flow_authentication_dev.reset_internal_authentication to reset authentication
Rem      vuvarov   02/26/2014 - Install packaged application metadata before application files (feature #1380)
Rem      vuvarov   03/03/2014 - Renamed wwv_flow_pkg_app_tab_load.sql to packaged_apps/metadata.sql
Rem      pawolf    05/08/2014 - Added calls for apex_install_dictionary_view_data and apex_install_advisor_data.sql
Rem      pawolf    05/13/2014 - Moved apex_install_pe_data.sql to coreins.sql
Rem      jkallman  06/10/2014 - Removed f4600
Rem      jstraub   12/01/2015 - Moved wwv_flow_upgrade.[drop|create|grant]_public_synonyms to coreins3.sql (bug 22105151)

set define '^' verify off
show define


@^PREFIX.builder/f4000.sql

set define '^'

@^PREFIX.builder/f4350.sql

set define '^'

@^PREFIX.builder/f4050.sql

set define '^'

@^PREFIX.builder/f4550.sql

set define '^'

@^PREFIX.builder/f4700.sql

set define '^'

@^PREFIX.builder/f4750.sql

set define '^'

@^PREFIX.builder/f4500.sql

set define '^'

@^PREFIX.builder/f4300.sql

set define '^'

@^PREFIX.builder/f4400.sql

set define '^'

@^PREFIX.builder/f4900.sql

set define '^'

@^PREFIX.builder/f4800.sql

set define '^'

@^PREFIX.builder/f4850.sql

begin
    wwv_flow_authentication_dev.reset_internal_authentication;
    commit;
end;
/

set define '^'

prompt ...Dictionary View metadata install
@^PREFIX.core/apex_install_dictionary_view_data.sql

prompt ...Advisor metadata install
@^PREFIX.core/apex_install_advisor_data.sql

set verify off termout on define '^'

timing start "Verification Images Load"
@^PREFIX.core/verification_images_load.sql
timing stop

timing start "Install Packaged and Sample Applications"
rem prompt  VII.   I N S T A L L   A P E X   P A C K A G E D   A P P L I C A T I O N S
set define '^'
@^PREFIX.core/packaged_apps/metadata.sql
set define '^'
@^PREFIX.core/packaged_apps/install_packaged_apps.sql
set define '^'
timing stop
