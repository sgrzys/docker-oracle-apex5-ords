set define '^'
set verify off
prompt ...wwv_flow_file_mgr

Rem    SCRIPT ARGUMENTS
Rem      1:
Rem      2:
Rem      3:  Flow Schema Owner
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     jkallman   12/14/2000 - Created
Rem     mhichwa    01/18/2001 - Added grant
Rem     jkallman   02/02/2001 - Added get_file
Rem     rmattama   02/26/2003 - Added p_inline parm to get_file for content disposition
Rem     jkallman   08/18/2003 - Added get_file by fname and sgid (Bug 3063954)
Rem     jkallman   08/19/2003 - Added p_inline and p_flow_id to get_file (Bug 3063954)
Rem     sspadafo   06/25/2004 - Add get_file_id (Bug 3449543)
Rem     mhichwa    02/04/2008 - Added show_download_format_page to aid in editing download format masks
Rem     mhichwa    02/06/2008 - Added procedure show_item_download_page bug 6801990
Rem     arayner    10/29/2008 - Changed get_file_id parameter p_fname to be p_name (bug 7201348) 
Rem     pawolf     05/06/2009 - Added get_file for plugins
Rem     pawolf     03/10/2010 - Added new download_file interface
Rem     cbcho      03/11/2010 - Added get_ws_file
Rem     pawolf     05/05/2010 - Changed apex_builder.js reference to apex_builder_4_0.js and removed show_item_download_page
Rem     cbcho      07/17/2012 - Added get_team_file (feature #1007)
Rem     pawolf     04/12/2013 - Added get_file for theme files (feature #1162)
Rem     pawolf     04/12/2013 - Added p_never_expires for optimal caching of friendly URLs (feature #478)
Rem     pawolf     04/19/2013 - Removed show_download_format_page
Rem     pawolf     04/30/2013 - Deprecated process_download (bug# 16671975)
Rem     pawolf     03/07/2014 - Added get_file (for user profile images)
REm     pawolf     02/13/2015 - In get_file: add p_compatibility_mode to fallback to application files (bug #20537030)

Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    NOTES
Rem       Using this package, the settings in the DAD configuration should
Rem       be as follows:
Rem
Rem       Document Table:                        flows.wwv_flow_file_objects$
Rem       Extensions to be uploaded as Long Raw: 
Rem 


create or replace package wwv_flow_file_mgr
as

-- Copyright (c) Oracle Corporation 2000-2008. All Rights Reserved.
--
--    DESCRIPTION
--      File Upload/Download services
--
--    SECURITY
--      
--    NOTES
--      Package Body should be wrapped
--

function get_file_id(
    p_name in varchar2)
    return number
    ;
    
--==============================================================================
-- Procedure to download a file identified by it's id.
-- Note: the parameter p_mime_type will be ignored and is deprecated.
--==============================================================================
procedure get_file( 
    p_id        in varchar2,
    p_mime_type in varchar2 default null, /* deprecated */
    p_inline    in varchar2 default 'NO' );

--==============================================================================
-- Procedure to download a workspace or application file identified by its name.
--==============================================================================
procedure get_file(
    p_fname              in varchar2,
    p_security_group_id  in varchar2,
    p_flow_id            in varchar2 default null,
    p_inline             in varchar2 default 'YES',
    p_never_expires      in boolean  default false,
    p_compatibility_mode in boolean  default true );

--==============================================================================
-- Procedure to download a plugin file identified by its name.
-- If the file is a text file, all occurences of #PLUGIN_PREFIX# are replaced by
-- the URL to access a plugin file.
--==============================================================================
procedure get_file (
    p_plugin_id         in number,
    p_security_group_id in number,
    p_file_name         in varchar2,
    p_never_expires     in boolean  default false );

--==============================================================================
-- Procedure to download a theme file identified by its name.
--==============================================================================
procedure get_file (
    p_application_id    in number,
    p_theme_no          in number,
    p_security_group_id in number,
    p_file_name         in varchar2,
    p_never_expires     in boolean  default false );

--==============================================================================
-- Procedure to download a user profile image.
--==============================================================================
procedure get_file (
    p_user_id in number,
    p_ck      in varchar2 );

procedure download_file (
    p_file_content    in blob,
    p_file_name       in varchar2,
    p_mime_type       in varchar2,
    p_file_charset    in varchar2,
    p_last_updated_on in date,
    p_etag            in varchar2,
    p_is_attachment   in boolean default true,
    p_never_expires   in boolean  default false );

--==============================================================================
-- Procedure to download a Websheet file identified by its ID.
--==============================================================================
procedure get_ws_file (
    s  in number, -- session ID
    f  in number, -- file id
    ck in varchar2 );

--==============================================================================
-- Procedure to download a Team Development file identified by its ID.
--==============================================================================
procedure get_team_file (
    p  in number, -- page ID
    s  in number, -- session ID
    f  in number, -- file id
    ck in varchar2 );
     
--==============================================================================
-- Deprecated! Procedure doesn't do anything anymore.
--==============================================================================
procedure process_download;

end wwv_flow_file_mgr;
/
show errors


grant execute on wwv_flow_file_mgr to public;
