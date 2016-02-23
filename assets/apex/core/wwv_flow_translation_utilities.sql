set define '^'
set verify off
prompt ...wwv_flow_translation_utilities


Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   06/07/2001 - Created
Rem      mhichwa   07/31/2009 - Added seed_translations
Rem      mhichwa   07/31/2009 - added flow_copy and seed_translations
Rem      mhichwa   07/31/2009 - added sync_translations and publish_application
Rem      mhichwa   07/31/2009 - added seed_and_publish
Rem      jkallman  05/15/2013 - Refactored seed_translations (in support of Mike's string manager).  Moved globals to wwv_flow_lang.


create or replace package wwv_flow_translation_utilities
as

--  Copyright (c) Oracle Corporation 2001 - 2009. All Rights Reserved.
--
--    DESCRIPTION
--      Global variables and APIs for use with flow translation services
--
--    SECURITY
--      Available to flows owner
--      No sensitive data
--
--    NOTES
--
--      Populate wwv_flow_translatable_text$ from columns identified in wwv_flow_translatable_cols$.
--      P_FLOW_ID identifies primary language flow ID.
--      P_LANGUAGE identifies language code the translation is into.
--      The translation_flow_id will be derived from the wwv_flow_language_map table.


procedure reuse_translations (
    p_from_flow_id          in varchar2 default null,
    p_translated_flow_id    in varchar2 default null,
    p_security_group_id     in varchar2 default null)
    ;

procedure seed_and_publish (
    p_from_flow_id          in varchar2 default null,
    p_language              in varchar2 default null,
    p_insert_only           in varchar2 default 'NO',
    p_translated_flow_id    in varchar2 default null,
    p_security_group_id     in varchar2 default null)
    ;

procedure publish_application (
    p_from_flow_id          in varchar2 default null,
    p_translated_flow_id    in varchar2 default null,
    p_security_group_id     in varchar2 default null)
    ;

procedure sync_translations (
    p_flow_id              in varchar2 default null,
    p_language             in varchar2 default null)
    ;

procedure seed_translations (
    p_flow_id              in varchar2 default null,
    p_language             in varchar2 default null,
    p_insert_only          in varchar2 default 'NO')
    ;

    
procedure flow_copy (
    p_flow_id_from         in number,
    p_flow_id_to           in number,
    p_alias_to             in varchar2 default null,
    p_flow_language_to     in varchar2,
    p_ok_to_delete_flow    in boolean := false,
    p_perform_translations in boolean := true)
    ;    
 
end wwv_flow_translation_utilities;
/
show errors

