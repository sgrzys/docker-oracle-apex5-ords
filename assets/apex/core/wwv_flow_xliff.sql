set define '^' verify off
prompt ...wwv_flow_xliff
create or replace package wwv_flow_xliff as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_xliff.sql
--
--    DESCRIPTION
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    SCRIPT ARGUMENTS
--      None
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED    (MM/DD/YYYY)
--      jkallman   05/03/2002 - Created
--      jkallman   06/18/2002 - Added apply_xliff_translations
--      jkallman   10/02/2002 - Added apply_xliff_file
--      jkallman   05/13/2003 - Added support for g_include_target to include target elements on-demand (per WPTG)
--      jkallman   07/28/2003 - Add support for download of only those strings requiring translation via p_include_all (Bug 3011738)
--      jkallman   05/30/2006 - Add p_item_help parameter for generation of internal translations
--      jkallman   06/01/2006 - Added get_translation_document
--      vuvarov    05/02/2014 - In apply_xliff_file, apply_xliff_translations: added p_check_source parameter
--
--------------------------------------------------------------------------------


procedure generate_translation_document(
    p_flow_id             in number,
    p_page_id             in number default null,
    p_translation_flow_id in number,
    p_include_target      in varchar2 default 'N',
    p_include_all         in varchar2 default 'N',
    p_item_help           in varchar2 default null );

procedure print_translation_document(
    p_flow_id             in number,
    p_page_id             in number default null,
    p_translation_flow_id in number,
    p_include_target      in varchar2 default 'N',
    p_include_all         in varchar2 default 'N',
    p_download            in varchar2 default 'Y',
    p_item_help           in varchar2 default null );

--==============================================================================
-- When p_check_source=true, we will check the source string in XLIFF against the source string currently seeded in the
-- translation repository. If the strings don't match, we will not use this translation (that is, we assume that the
-- translation in XLIFF is outdated).
--==============================================================================
procedure apply_xliff_translations(
    p_flow_id             in number,
    p_translation_flow_id in number,
    p_clob                in clob,
    p_check_source        in boolean default false );

procedure apply_xliff_file(
    p_flow_id             in number,
    p_translation_flow_id in number,
    p_file_id             in number,
    p_check_source        in boolean default false );

function get_translation_document(
    p_flow_id             in number,
    p_page_id             in number default null,
    p_translation_flow_id in number,
    p_include_target      in varchar2 default 'N',
    p_include_all         in varchar2 default 'N',
    p_item_help           in varchar2 default null )
return blob;

end wwv_flow_xliff;
/
show err
