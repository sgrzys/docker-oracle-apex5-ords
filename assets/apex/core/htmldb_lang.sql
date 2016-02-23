set define '^'
set verify off
prompt ...htmldb_lang

Rem  Copyright (c) Oracle Corporation 1999 - 2005. All Rights Reserved.
Rem
Rem    NAME
Rem      htmldb_lang.sql
Rem
Rem    DESCRIPTION
Rem      Flow language translation services
Rem
Rem    NOTES
Rem      This program allows for translation of text strings from
Rem      on national language to another.
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      cbackstr    10/14/2003 - Created
Rem      jkallman    10/16/2003 - Removed p_primary_text_context from lang
Rem      mhichwa     12/08/2005 - Removed references to old product name
Rem      jkallman    01/12/2012 - Added p_application_id to message
Rem      jkallman    05/09/2013 - Added update_message
Rem      jkallman    05/15/2013 - Added seed_translations, update_translated_string
Rem      jkallman    07/29/2013 - Added create_language_mapping, update_language_mapping, delete_language_mapping, publish_application
Rem      jkallman    08/26/2013 - Added create_message, delete_message



create or replace package htmldb_lang 
--  Copyright (c) Oracle Corporation 2003. All Rights Reserved.
--
--    DESCRIPTION
--      globalization services 
--
--    NOTES
--      This program allows for translation of text strings from
--      on national language to another.
--
--    RUNTIME DEPLOYMENT: YES
is

function message (
    -- Function to return a message from the message repository.
    --
    -- p_name           - name of message to be printed
    -- p0 - p9          - substitution parameters that replace text srings
    --                    %0 through %9
    -- p_lang           - optional parameter to override the language
    -- p_application_id - optional parameter for a specific application ID instead of the current one
    --
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
    p_application_id            in number default null)
    return varchar2
    ;



procedure message_p (
    -- Print a message from the message repository.
    --
    -- p_name           - name of message to be printed
    -- p0 - p9          - substitution parameters that replace text srings
    --                    %0 through %9
    -- p_lang           - optional parameter to override the language
    -- p_application_id - optional parameter for a specific application ID instead of the current one
    --
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
    ;


function lang (
   -- Return a translated text string from the 
   -- translatable messages repository within HTMLDB.
   -- 
   -- p_primary_text_string - text string to be translated
   -- p0 - p9  - substitution parameters that replace text srings
   --            %0 through %9
   -- p_primary_text_context-
   -- p_primary_language    -
   --
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
   p_primary_language          in varchar2 default null)
   return varchar2
   ;

procedure create_message(
    --
    -- Create a runtime message
    --
    p_application_id in number,
    p_name           in varchar2,
    p_language       in varchar2,
    p_message_text   in varchar2 )
    ;

procedure update_message(
    --
    -- Update a text message specified by ID
    --
    p_id           in number,
    p_message_text in varchar2 );

procedure delete_message(
    --
    -- Delete a runtime message
    --
    p_id in number );    


procedure update_translated_string(
    --
    -- Update the string in the translation repository
    --  
    p_id       in number,
    p_language in varchar2,
    p_string   in varchar2);


procedure seed_translations(
    --
    -- Seed the translation repository for the specified application
    -- and language.  
    -- 
    p_application_id in number,
    p_language       in varchar2 );

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


procedure publish_application(
    --
    -- Publish the translations of an application.  You can optionally specify
    -- a new application ID for the specific translation mapping.
    --
    p_application_id           in number,
    p_language                 in varchar2,
    p_new_trans_application_id in number default null );


end htmldb_lang;
/

show errors

