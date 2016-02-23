set define '^'
set verify off
prompt ...wwv_flow_translation_util_api

Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    jkallman    08/15/2012 - Created from wwv_flow_translation_utilities, in support of Bug 13805875
Rem    jkallman    08/19/2012 - Added set_translation_mapping


create or replace package wwv_flow_translation_util_api
as

--  Copyright (c) Oracle Corporation 2001 - 2012. All Rights Reserved.
--
--    DESCRIPTION
--      Internal APIs for use with application translation publishing
--
procedure publish_application (
    p_from_flow_id          in number default null,
    p_translated_flow_id    in number default null )
    ;

procedure sync_translations (
    p_flow_id              in number   default null,
    p_language             in varchar2 default null)
    ;
    
procedure flow_copy (
    p_flow_id_from         in number,
    p_flow_id_to           in number,
    p_alias_to             in varchar2 default null,
    p_flow_language_to     in varchar2,
    p_ok_to_delete_flow    in boolean := false,
    p_perform_translations in boolean := true)
    ;    
    
procedure set_translation_mapping( 
    p_application_id_from  in number,
    p_application_id_to    in number,
    p_language             in varchar2 );
        
 
end wwv_flow_translation_util_api;
/
show errors

