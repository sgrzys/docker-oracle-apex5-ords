
set define '^'
set verify off
prompt ...wwv_flow_customize

Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    SCRIPT ARGUMENTS
Rem      none
Rem 
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   10/10/2002 - Created
Rem      mhichwa   11/08/2002 - Added company
Rem      sspadafo  08/07/2003 - Changed default for p_text in get_link for translations (Bug 3087017)
Rem      sspadafo  11/03/2003 - Add p_lang parameter to show (Bug 3221074)
Rem      sspadafo  11/21/2003 - Add p_lang parameter to accept (Bug 3258101)
Rem      sspadafo  12/15/2005 - Remove unneeded params from show and accept (Bug 4873558)
Rem      jkallman  11/20/2009 - Change default value of p_lang to 'en'

create or replace package wwv_flow_customize
as

g_notification varchar2(32767) := null;
g_regions_counted boolean := false;
g_region_count pls_integer := 0;

function  get_link (
    p_text in varchar2 default null)
    -- Returns a URL for the current page
    return varchar2
    ;
procedure show(
    p_flow              in varchar2 default null,
    p_page              in varchar2 default null,
    p_session           in varchar2 default null,
    p_lang              in varchar2 default 'en')
    ;
procedure accept(
    p_request           in varchar2 default null,
    p_flow              in varchar2 default null,
    p_page              in varchar2 default null,
    p_session           in varchar2 default null,
    p_check             in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_lang              in varchar2 default 'en')
    ;
end wwv_flow_customize;
/
show errors


grant execute on wwv_flow_customize to public
/
