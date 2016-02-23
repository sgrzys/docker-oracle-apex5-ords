set define '^'
set verify off
prompt ...wwv_flow_mail

Rem    NAME
Rem      wwv_flow_mail
Rem
Rem    SCRIPT ARGUMENTS
Rem      1:
Rem      2:
Rem      3:  Flow Schema Owner
Rem
Rem    EXAMPLE
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  11/01/2000 - Created (from tkyte/clbeck source)
Rem      tmuth     02/28/2000 - Modified to include ability to send html
Rem      jkallman  10/17/2002 - Added send procedure with CLOB body
Rem      jkallman  12/08/2005 - Change p_smtp_hostname and p_smtp_portno parameters to have default null values (Bug 4863562)
Rem      jkallman  01/24/2006 - Support no Reply-To via p_reply parameter in send() procedure
Rem      jkallman  02/15/2006 - Change p_replyto to varchar2, add overloaded specifications for p_replyto
Rem      jkallman  02/09/2007 - Added push_queue_background
Rem      jkallman  11/08/2007 - Added add_attachment
Rem      jkallman  09/15/2011 - Added push_queue_immediate
Rem      cbcho     04/17/2012 - Added get_instance_url, get_images_url (feature #549)
Rem      vuvarov   06/25/2012 - Moved convert_urls_to_links() and convert_txt_to_html() from wwv_flow_fnd_developer_api
Rem      jkallman  07/25/2012 - Add p_force_yn to push_queue_immediate


create or replace package wwv_flow_mail
as

--  Copyright (c) Oracle Corporation 2000 - 2012. All Rights Reserved.
--
--    DESCRIPTION
--      Flows generic mail routines
--
--    SECURITY
--
--    NOTES
--

--==============================================================================
procedure send( p_to            in varchar2,
                p_from          in varchar2,
                p_body          in varchar2,
                p_body_html     in varchar2 default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL);

--==============================================================================
procedure send( p_to            in varchar2,
                p_from          in varchar2,
                p_body          in clob,
                p_body_html     in clob     default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL);

--==============================================================================
procedure send( p_to            in varchar2,
                p_from          in varchar2,
                p_body          in varchar2,
                p_body_html     in varchar2 default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL,
                p_replyto       in varchar2 );

--==============================================================================
procedure send( p_to            in varchar2,
                p_from          in varchar2,
                p_body          in clob,
                p_body_html     in clob     default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL,
                p_replyto       in varchar2 );

--==============================================================================
function  send( p_to            in varchar2,
                p_from          in varchar2,
                p_body          in varchar2,
                p_body_html     in varchar2 default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL)
                return number;

--==============================================================================
function send(  p_to            in varchar2,
                p_from          in varchar2,
                p_body          in clob,
                p_body_html     in clob     default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL)
                return number;

--==============================================================================
function send(  p_to            in varchar2,
                p_from          in varchar2,
                p_body          in varchar2,
                p_body_html     in varchar2 default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL,
                p_replyto       in varchar2 )
                return number;

--==============================================================================
function send(  p_to            in varchar2,
                p_from          in varchar2,
                p_body          in clob,
                p_body_html     in clob     default NULL,
                p_subj          in varchar2 default NULL,
                p_cc            in varchar2 default NULL,
                p_bcc           in varchar2 default NULL,
                p_replyto       in varchar2 )
                return number;

--==============================================================================
procedure add_attachment( p_mail_id    in number,
                          p_attachment in blob,
                          p_filename   in varchar2,
                          p_mime_type  in varchar2 );


--==============================================================================
--
-- Parameters p_smtp_hostname and p_smtp_portno remain for backward
-- compatibility.  But they are ignored.  The SMTP host name and
-- parameter are exclusively derived from system preferences
-- when sending mail.
--
--==============================================================================
procedure background( p_id in number,
                      p_smtp_hostname in varchar2 default null,
                      p_smtp_portno   in varchar2 default null );

--==============================================================================
--
-- Parameters p_smtp_hostname and p_smtp_portno remain for backward
-- compatibility.  But they are ignored.  The SMTP host name and
-- parameter are exclusively derived from system preferences
-- when sending mail.
--
--==============================================================================
procedure push_queue( p_smtp_hostname in varchar2 default null,
                      p_smtp_portno   in varchar2 default null );

--==============================================================================
--
-- Will submit a one-time database job to push the mail queue
--
--==============================================================================
procedure push_queue_background;

--==============================================================================
procedure push_queue_immediate( p_force_yn in varchar2 default 'N');

--==============================================================================
--
-- If email includes link to APEX instance, use this function to get the instance URL
--
--==============================================================================
function get_instance_url (
    p_security_group_id in number default null )
    return varchar2;

--==============================================================================
--
-- If email includes APEX instance images, use this function to get the image prefixed URL
--
--==============================================================================
function get_images_url (
    p_security_group_id in number default null )
    return varchar2;

--==============================================================================
--
-- Converts plain-text URLs (e.g. http://www.oracle.com) to HTML hyperlinks (e.g.
-- <a href="http://www.oracle.com">http://www.oracle.com</a>).
--
--==============================================================================
function convert_urls_to_links (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
--
-- Converts plain-text input into basic HTML, while adding APEX logo and converting
-- URLs to HTML hyperlinks.
--
--==============================================================================
function convert_txt_to_html (
    p_txt_message       in varchar2,
    p_security_group_id in number default null )
    return varchar2;


end wwv_flow_mail;
/
show errors
