set define '^'
set verify off

prompt ...wwv_flow_custom_auth

Rem     NAME
Rem       custom_auth_api.sql
Rem
Rem     SCRIPT ARGUMENTS
Rem       none
Rem
Rem     RUNTIME DEPLOYMENT: YES
Rem
Rem     MODIFIED   (MM/DD/YYYY)
Rem       sspadafo  11/12/2001 - Created
Rem       sspadafo  12/01/2001 - Added current_page_is_public function
Rem       sspadafo  12/01/2001 - Removed all exposed routines not related to custom2 auth
Rem       sspadafo  12/02/2001 - Moved parse_query_string to wwv_flow_utilities
Rem       sspadafo  12/02/2001 - Added get_next_session id to replace direct use of wwv_flow version
Rem       sspadafo  03/04/2002 - Removed p_security_group_id from fetch_flow_state_item arguments
Rem       sspadafo  03/16/2002 - Removed fetch_flow_state_item; moved to wwv_flow as fetch_flow_item
Rem       sspadafo  06/06/2002 - Added getter/setter procedures and functions for flow globals
Rem       sspadafo  06/06/2002 - Added/revised comments.
Rem       sspadafo  03/26/2003 - Add remember_deep_link procedure (Bug 2776103,2862150)



create or replace package wwv_flow_custom_auth
as
--  Copyright (c) Oracle Corporation 2001-2002. All Rights Reserved.
--
--     DESCRIPTION
--       API package for flow developers using custom authentication.
--
--       These functions and procedures provide access to flow 
--       metadata and flow session state and provide wrappers
--       for commonly used security-related modules.
--     
--       Some of these modules are intended for use only within
--       the flow engine runtime context, and others may be 
--       called from within any context, if so indicated.
--
--    SECURITY
--       Executable via public synonym and grant
--
--    NOTES
--      
--    EXAMPLE
--
--
function get_next_session_id
    --
    -- Context: flows runtime
    -- Purpose: Generate next session id from sequence generator
    --
    return number;
    
function get_security_group_id
    --
    -- Context: flows runtime
    -- Purpose: Return the wwv_flow_security.g_security_group_id global
    --
    return number;

function flow_page_item_exists(
    --
    -- Context: flows runtime
    -- Purpose: Return boolean as to existence within the current
    --          flow page's metadata of a named page-level item.
    --
    p_item_name in varchar2)
    return boolean;

function current_page_is_public
    --
    -- Context: flows runtime
    -- Purpose: Return boolean corresponding to current flow
    --          page attribute PAGE_IS_PUBLIC_Y_N setting.
    --
    return boolean;

function session_id_exists
    --
    -- Context: flows runtime
    -- Purpose: Return boolean if wwv_flow.g_instance is set/not set
    --
    return boolean;

function get_user
    --
    -- Context: flows runtime
    -- Purpose: Return wwv_flow.g_user global
    --
    return varchar2;
    
function get_session_id
    --
    -- Context: flows runtime
    -- Purpose: Return wwv_flow.g_instance global
    --
    return number;
    
procedure set_user(
    --
    -- Context: flows runtime
    -- Purpose: Set wwv_flow.g_user global
    --
    p_user in varchar2);
    
procedure set_session_id(
    --
    -- Context: flows runtime
    -- Purpose: Set wwv_flow.g_instance global
    --
    p_session_id in number);
    
procedure set_session_id_to_next_value
    --
    -- Context: flows runtime
    -- Purpose: Set wwv_flow.g_instance to next
    --          session id from sequence generator.
    --
    ;

procedure define_user_session(
    --
    -- Context: flows runtime
    -- Purpose: Combine the functions of set_user and
    --          set_session_id to provide a concise API call
    --
    p_user in varchar2,
    p_session_id in number);

procedure remember_deep_link(
    --
    -- Context: flows runtime
    -- Purpose: Check if the item we use to hold
    -- the deep linking url used by scheme authentication
    -- exists in the current flow. If not, it creates the flow
    -- item and updates the disk cache with the new value, 
    -- after creating the flows session if it doesn't exist.
    --
    p_url in varchar2);
    
end wwv_flow_custom_auth;
/
show errors
