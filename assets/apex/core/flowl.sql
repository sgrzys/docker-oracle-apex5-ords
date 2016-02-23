set define '^' verify off
prompt ...wwv_flowl
create or replace package wwv_flow_lang as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999. All Rights Reserved.
--
--    NAME
--      flowl.sql
--
--    DESCRIPTION
--      Flow language translation services
--
--    NOTES
--      This program allows for translation of text strings from
--      on national language to another.
--
--    SCRIPT ARGUMENTS
--      1:
--      2:
--      3:  Flow Schema Owner
--
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa    08/22/1999 - Created
--      mhichwa    11/24/1999 - http abbrevisation of polish is missing assume pl
--      mhichwa    03/04/2000 - Removed sys_table argument
--      mhichwa    07/23/2001 - Added  set_translated_flow_and_page
--      mhichwa    08/28/2001 - Added procedure report_lang_to_browser
--      mhichwa    10/26/2001 - Added p_lang argument to message procedure and function
--      jstraub    03/12/2003 - Removed globals g_language_abbreviation, g_http_abbreviation, g_language_name
--      jkallman   04/08/2003 - Added g_nls_language_set (Bug 2894573)
--      jkallman   05/01/2003 - Added system_message, system_message_p
--      jkallman   08/05/2003 - Added map_iana_charset, map_db_charset (Bug 3033761)
--      jkallman   10/23/2003 - Added reset_nls (Bug 3213466)
--      jkallman   10/27/2003 - Added get_nls_language (Bug 3219231)
--      jkallman   03/30/2004 - Added system_message_lit (Bug 3400751)
--      jkallman   06/09/2004 - Added function pick_date_from_language
--      jkallman   05/12/2005 - Add get_nls_windows_charset
--      jkallman   05/13/2005 - Add get_csv_charset
--      jkallman   06/02/2006 - Add get_db_charset
--      jkallman   01/02/2007 - Add p_application_id to system message methods (Bug 5729666)
--      jkallman   01/18/2007 - Add p_security_group_id to system message methods (Bug 5729666)
--      jkallman   11/20/2007 - Add procedure set_application_date_format
--      jkallman   01/24/2008 - Move g_browser_language to package body (Bug 6707982)
--      mhichwa    01/25/2008 - Changed comments
--      jkallman   08/03/2009 - Rename set_application_date_format to set_application_dt_tz_formats
--      jkallman   08/27/2009 - Added set_g_session_time_zone, get_g_session_time_zone, set_session_time_zone
--      jkallman   08/28/2009 - Removed set_g_session_time_zone
--      pawolf     08/31/2009 - Added auto detect of time zone
--      pawolf     09/16/2009 - Added get_translated_application_id
--      pawolf     10/23/2009 - Added custom_runtime_message
--      jkallman   12/07/2009 - Added set_session_lang, get_g_session_lang, set_g_session_lang
--      jkallman   12/11/2009 - Added reset_session_lang
--      jkallman   12/11/2009 - Added set_builder_lang_cookie
--      jkallman   12/14/2009 - Added get_session_lang_from_cookie, renamed set_session_lang_cookie
--      pawolf     01/14/2010 - Removed pick_date_from_language
--      jkallman   04/22/2010 - Added set_session_territory, get_g_session_territory, set_g_session_territory
--      jkallman   04/24/2010 - Added get_session_lang_from_cookie
--      jkallman   06/07/2011 - Added get_nls_time_format
--      jkallman   01/12/2011 - Add p_application_id parameter to message() and message_p()
--      jkallman   02/13/2012 - Added reset_session_time_zone (Bug 13097973)
--      jkallman   02/14/2013 - Added init_nls
--      jkallman   05/09/2013 - Added update_message
--      jkallman   05/15/2013 - Added globals for translation seeding, added procedure seed_translations, update_translated_string
--      jkallman   08/01/2013 - Added procedures create_language_mapping, update_language_mapping, delete_language_mapping
--      jkallman   08/26/2013 - Added create_message, delete_message
--      cneumuel   09/11/2013 - Moved implementation of get_language_selector_list, get_language_selector_ul, get_language_selector_ul2 from htmldb_util to wwv_flow_lang
--      pawolf     03/03/2014 - Added js_messages (feature #1279)
--      pawolf     01/20/2015 - In js_messages: added p_builder (bug #20184648)
--
--------------------------------------------------------------------------------

g_set_nls boolean := false;
g_nls_language_set varchar2(255) := null;
g_seed_new_attributes      number := 0;
g_seed_purged_attributes   number := 0;
g_seed_changed_attributes  number := 0;


procedure report_lang_to_browser
    --
    -- Produce an HTML report listing the browser language to database
    -- language equivs.
    --
    ;


function map_language (
    --
    -- Convert a browser language into a database language.
    -- for example:
    -- us = AMERICAN
    -- fr = FRENCH
    -- ja = JAPANESE
    --
    --
    p_language  in varchar2)
    RETURN varchar2
    ;

procedure alter_session (
    --
    -- alter the dbms session set the language to this value.
    --
    p_language  in varchar2 default null)
    ;

function replace_param (
    p_message                   in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null)
    return varchar2
    ;


--
-- return named text message with substitutions
--
function message (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in number   default null)
    return varchar2
    ;



--
-- htp.print a named text message with substitutions
--
procedure message_p (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in number   default null )
    ;


--
-- Create a runtime message
--
procedure create_message(
    p_application_id in number,
    p_name           in varchar2,
    p_language       in varchar2,
    p_message_text   in varchar2 )
    ;

--
-- Update the text of a runtime message
--
procedure update_message(
    p_id in number,
    p_message_text in varchar2 )
    ;

--
-- Delete a runtime message
--
procedure delete_message(
    p_id in number );





--
-- Update the string in the translation repository
--
procedure update_translated_string(
    p_id in number,
    p_language in varchar2,
    p_string in varchar2);

--
-- return named text System message with substitutions
--
function system_message (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    return varchar2
    ;



--
-- Return named text System message with substitutions.
-- This function is used when the returned string is going to be included
-- in a literal, so all occurrences of a single quote in the message will
-- be returned as two consecutive single quotes.
--
function system_message_lit (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    return varchar2
    ;


--
-- htp.print a named text System message with substitutions
--
procedure system_message_p (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    ;


--==============================================================================
-- Returns an APEX runtime message, but first checks if it has been overwritten
-- in the current application.
--==============================================================================
function custom_runtime_message (
    p_name in varchar2,
    p0     in varchar2 default null,
    p1     in varchar2 default null,
    p2     in varchar2 default null,
    p3     in varchar2 default null,
    p4     in varchar2 default null,
    p5     in varchar2 default null,
    p6     in varchar2 default null,
    p7     in varchar2 default null,
    p8     in varchar2 default null,
    p9     in varchar2 default null,
    p_lang in varchar2 default null )
    return varchar2
    ;

--==============================================================================
-- Returns all text messages of the APEX Runtime Engine and the specified
-- application which are marked as JavaScript messages.
--==============================================================================
procedure js_messages (
    p_application_id in number,
    p_lang           in varchar2,
    p_version        in varchar2,
    p_builder        in varchar2 default 'N' );

--
--  WebDB20 style translations
--
function lang (
   p_primary_text_string       in varchar2 default null,
   p0                          in varchar2 default null,
   p1                          in varchar2 default null,
   p2                          in varchar2 default null,
   p3                          in varchar2 default null,
   p4                          in varchar2 default null,
   p5                          in varchar2 default null,
   p6                          in varchar2 default null,
   p7                          in varchar2 default null,
   p8                          in varchar2 default null,
   p9                          in varchar2 default null,
   p_primary_text_context      in varchar2 default null,
   p_primary_language          in varchar2 default null)
   return varchar2
   ;

FUNCTION find_language_preference
   RETURN varchar2
   ;

--==============================================================================
-- Returns based on the specified language (eg. de-at, zh-cn, ...)
-- the application id of the translated application.
--==============================================================================
function get_translated_application_id (
    p_application_id in number   default wwv_flow.g_flow_id,
    p_language       in varchar2 default wwv_flow.g_browser_language )
    return number;

procedure set_translated_flow_and_page
    ---------------------------------
    --- SET NATIONAL LANGUAGE SUPPORT
    --  The language is determined from the browser
    --  this procedure sets:
    --  1. wwv_flow.g_translated_flow_id
    --  2. wwv_flow.g_translated_page_id
    --
   ;

--
-- Given an Oracle datbase character set, return the corresponding
-- IANA character set.  For example, given DB character set
-- of 'JA16SJIS', return 'shift_jis'.
--
-- If not found, will return NULL.
--
function map_iana_charset(
    p_db_charset in varchar2 )
    return varchar2;


--
-- Given an IANA character set, return the corresponding
-- Oracle database character set.  For example, given IANA
-- character set 'windows-1257', return 'BLT8MSWIN1257'.
--
-- If not found, will return NULL.
--
function map_db_charset(
    p_iana_charset in varchar2 )
    return varchar2;

--
-- Initialize the NLS settings for the current
-- database session to that of the database
--
procedure init_nls;

--
-- Initialize the NLS settings for the current
-- database session to that of the database and
-- also set the cached variables so this isn't
-- unnecessarily executed again
--
procedure reset_nls;


--
-- Return the value of the NLS_LANGUAGE which
-- was set in the current session
--
function get_nls_language return varchar2;


--
-- Return the value of the NLS Windows Charset which
-- was set in the current session.  Typically used for
-- CSV encoding
--
function get_nls_windows_charset return varchar2;


--
-- Return the target character set for CSV data in the
-- current application.  A null value returned from this function
-- means that either application language derived from is set to
-- No NLS (application not translated) or that the csv_encoding
-- flag of wwv_flows is not turned on.  Otherwise, the non-null
-- value will be an Oracle character set to be used as the target
-- character set which CSV data is to be converted to
--
function get_csv_charset return varchar2;


--
-- Return the database characterset from nls_database_parameters
--
function get_db_charset return varchar2;


--
-- Check for the application-level date format setting
-- and adjust the database session NLS_DATE_FORMAT parameter
--
procedure set_application_dt_tz_formats;



--==============================================================================
-- Sets the time zone in the format +HH:MI or -HH:MI.
-- For example -02:00 for CEST or -05:30 for IST.
--==============================================================================
procedure set_session_time_zone( p_time_zone in varchar2 );

procedure set_g_session_time_zone( p_time_zone in varchar2 );

function get_g_session_time_zone return varchar2;

procedure reset_session_time_zone( p_force in boolean default FALSE );




--==============================================================================
-- Sets the session language
-- For example de or en-us
--==============================================================================
procedure set_session_lang( p_lang in varchar2 );

procedure set_g_session_lang( p_lang in varchar2 );

function get_g_session_lang return varchar2;

procedure reset_session_lang;

procedure set_session_lang_cookie( p_lang in varchar2 default null );

function get_session_lang_from_cookie return varchar2;


--
-- Territory specific
---
procedure set_session_territory( p_territory in varchar2 );

procedure set_g_session_territory( p_territory in varchar2 );

function get_g_session_territory return varchar2;

procedure reset_session_territory;

procedure set_ws_lang_terr_cookie(
    p_lang      in varchar2 default null,
    p_territory in varchar2 default null );

function get_ws_lang_from_cookie return varchar2;

function get_ws_territory_from_cookie return varchar2;

function get_nls_territory_from_lang( p_lang in varchar2 ) return varchar2;

function get_nls_time_format return varchar2;

--==============================================================================
-- Generates a HTML page with the necessary Javascript code to automatically
-- detect the time zone based on the operating system setting.
--==============================================================================
procedure auto_detect_time_zone;


procedure seed_translations (
    p_flow_id              in varchar2 default null,
    p_language             in varchar2 default null,
    p_insert_only          in varchar2 default 'NO' );

procedure create_language_mapping(
    --
    -- Create a language mapping for the specified application.  A mapping
    -- includes the target application ID and also the language code (e.g., de, en-us, etc.)
    --
    p_application_id             in number,
    p_language                   in varchar2,
    p_translation_application_id in number);


procedure update_language_mapping(
    --
    -- Update the mapping for specified application and language.  Only the mapping to the new translation
    -- ID can be updated.  The language cannot be updated.
    --
    p_application_id             in number,
    p_language                   in varchar2,
    p_new_trans_application_id   in number);


procedure delete_language_mapping(
    --
    -- Delete a language mapping for the specified application and language.
    --
    p_application_id in number,
    p_language       in varchar2);

--==============================================================================
function get_language_selector_list
   return varchar2;

--==============================================================================
function get_language_selector_ul
    return varchar2;

--==============================================================================
function get_language_selector_ul2
    return varchar2;

end wwv_flow_lang;
/
show errors
