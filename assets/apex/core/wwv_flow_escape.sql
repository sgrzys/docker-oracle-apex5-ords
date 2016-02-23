set define '^' verify off
prompt wwv_flow_escape
create or replace package wwv_flow_escape as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_escape.sql
--
--    PUBLIC NAME
--      apex_escape
--
--    DESCRIPTION
--      This package provides functions for escaping special characters in
--      strings, to ensure that the data is suitable for further processing.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    04/13/2012 - Created
--    jkallman    05/04/2012 - Added selective_escape
--    cneumuel    05/09/2012 - in ldap_dn, ldap_search_filter: added p_reserved_chars, p_escape_non_ascii (bug #14047270)
--    pawolf      06/15/2012 - Renamed selective_escape to html_whitelist
--    cneumuel    07/05/2012 - Added js_literal
--    cneumuel    07/09/2012 - Added html, html_attribute (bug #14047702)
--    cneumuel    07/12/2012 - Added init. In html: optimization when no character set conversion is needed (bug #14047270)
--    cneumuel    07/13/2012 - Added html_prn
--    cneumuel    07/13/2012 - Added html_truncated
--    pawolf      07/16/2012 - Renamed html_truncated to html_trunc
--    cneumuel    07/30/2012 - removed html_prn
--    cneumuel    08/16/2012 - added set_html_escaping_mode (bug #14047702)
--    cneumuel    08/24/2012 - added noop, to silince injection detection tools
--    cneumuel    09/04/2012 - added api documentation
--    cneumuel    04/11/2013 - In c_html_whitelist_tags: added additional notations for <br/> tag (bug #16612634)
--    pawolf      11/26/2013 - In c_html_whitelist_tags: added pre and code tags
--    pawolf      01/16/2014 - Added regexp
--    pawolf      02/11/2014 - In c_html_whitelist_tags: added em and definition list tags
--    pawolf      03/07/2014 - In c_html_whitelist_tags: fixed bug in definition list tags
--    cneumuel    04/24/2014 - Moved wwv_flow_json.escape to wwv_flow_escape.json and improved performance
--    pawolf      03/09/2015 - Added css_selector (bug #20670706)
--
--------------------------------------------------------------------------------

c_ldap_dn_reserved_chars     constant varchar2(8)   := '"+,;<=>\';
c_ldap_search_reserved_chars constant varchar2(5)   := '*()\/';
c_html_whitelist_tags        constant varchar2(255) := '<h1>,</h1>,<h2>,</h2>,<h3>,</h3>,<h4>,</h4>,<p>,</p>,<b>,</b>,<strong>,</strong>,<i>,</i>,<em>,</em>,<ul>,</ul>,<ol>,</ol>,<li>,</li>,<dl>,</dl>,<dt>,</dt>,<dd>,</dd>,<pre>,</pre>,<code>,</code>,<br />,<br/>,<br>,<BR>,<hr/>';

--##############################################################################
--#
--# LDAP ESCAPING
--#
--##############################################################################

--==============================================================================
-- Escape reserved characters in an LDAP distinguished name, according to RFC
-- 4514.
--
-- The RFC describes "+,;<=>\ as reserved characters (see p_reserved_chars).
-- These will be escaped by a backslash (e.g. " becomes \").
-- Non-printable characters (ascii 0 - 31) and ones with a code > 127
-- (see p_escape_non_ascii) will be escaped as \xx, xx being the
-- hexadecimal character code.
-- The space character at the beginning or end of the string and # at
-- the beginning will also be escaped with a backslash.
--
-- ARGUMENTS
-- * p_string            string that should be escaped.
-- * p_reserved_chars    every character of p_string in this list will be escaped
--                       with a backslash.
-- * p_escape_non_ascii  if true, escape characters above ascii 127. this is
--                       supported by RFCs 4514 and 2253, but may cause errors
--                       with older LDAP servers and Microsoft AD.
--
-- EXAMPLE
--   declare
--       l_name    varchar2(4000) := 'Joe+User';
--       l_escaped varchar2(4000);
--   begin
--       l_escaped := apex_escape.ldap_dn(l_name);
--       htp.p(l_name||' becomes '||l_escaped);
--   end;
--
-- SEE ALSO
--   ldap_search_filter
--==============================================================================
function ldap_dn (
    p_string           in varchar2,
    p_reserved_chars   in varchar2 default c_ldap_dn_reserved_chars,
    p_escape_non_ascii in boolean  default true )
    return varchar2;

--==============================================================================
-- Escape reserved characters in an LDAP search filter, according to RFC 4515.
--
-- The RFC describes *()\/ as reserved characters (see p_reserved_chars).
-- These, non-printable characters (ascii 0 - 31) and ones with a code > 127
-- (see p_escape_non_ascii) will be escaped as \xx, xx being the hexadecimal
-- character code.
--
-- ARGUMENTS
-- * p_string            search filter that should be escaped.
-- * p_reserved_chars    every character of p_string in this list will be escaped
--                       with \xx (xx being the character's ascii hex code).
-- * p_escape_non_ascii  if true, escape characters above ascii 127 as \xx.
--                       this is supported by RFC 4515, but may cause errors
--                       with older LDAP servers and Microsoft AD.
--
-- EXAMPLE
--   declare
--       l_name    varchar2(4000) := 'Joe*User';
--       l_escaped varchar2(4000);
--   begin
--       l_escaped := apex_escape.ldap_search_filter(l_name);
--       htp.p(l_name||' becomes '||l_escaped);
--   end;
--
-- SEE ALSO
--   ldap_dn
--==============================================================================
function ldap_search_filter (
    p_string           in varchar2,
    p_reserved_chars   in varchar2 default c_ldap_search_reserved_chars,
    p_escape_non_ascii in boolean default true )
    return varchar2;

--##############################################################################
--#
--# HTML ESCAPING
--#
--##############################################################################

--==============================================================================
-- Escape html
--
-- This function escapes characters which can change the context in an html
-- environment. It is an extended version of the well-known sys.htf.escape_sc.
--
-- The function's result depends on the escaping mode that is defined via
-- apex_escape.set_html_escaping_mode. By default, the escaping mode is
-- "Extended", but it can be overridden by manually calling
-- set_html_escaping_mode or by setting the application security attribute
-- "HTML Escaping Mode" to "Basic". If the mode is "Basic", the function
-- behaves like sys.htf.escape_sc. Otherwise, the rules below apply.
--
-- The following table depicts ascii characters that the function will
-- transform and their escaped values:
--
--   Raw Escaped
--   --- -------
--   &   &amp;
--   "   &quot;
--   <   &lt;
--   >   &gt;
--   '   &#x27;
--   /   &#x2F;
--
-- In addition, the function may escape unicode characters if the database NLS
-- character set is not UTF-8 or if the REQUEST_IANA_CHARSET http header
-- variable is set to something different than UTF-8 (which is the default). If
-- unicode escaping applies, these characters are escaped via &#xHHHH; where
-- HHHH is the unicode hex code.
--
-- ARGUMENTS
-- * p_string            text that should be escaped
--
-- EXAMPLE
--   declare
--     procedure eq(p_str1 in varchar2,p_str2 in varchar2)
--     is
--     begin
--       if p_str1||'.' <> p_str2||'.' then
--         raise_application_error(-20001,p_str1||' <> '||p_str2);
--       end if;
--     end eq;
--   begin
--     apex_escape.set_html_escaping_mode('B');
--     eq(apex_escape.html('hello &"<>''/'), 'hello &amp;&quot;&lt;&gt;''/');
--     apex_escape.set_html_escaping_mode('E');
--     eq(apex_escape.html('hello &"<>''/'), 'hello &amp;&quot;&lt;&gt;&#x27;&#x2F;');
--   end;
--
-- SEE ALSO
--   html_trunc, html_whitelist, html_attribute, set_html_escaping_mode
--==============================================================================
function html (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- Escape html but limit the returned string to p_length characters
--
-- This function returns the first p_length characters of an input clob and
-- escapes them. You can use this function if the input clob might be too large
-- to fit in a varchar2 variable and it is sufficient to only display the first
-- part of it.
--
-- ARGUMENTS
-- * p_string            text that should be escaped
-- * p_length            the number of characters which should be taken from
--                       p_string
--
-- EXAMPLE
--   begin
--     htp.p('<ul>');
--     for l_data in ( select title, cls, body
--                       from my_topics )
--     loop
--       sys.htp.p('<li><span class="'||apex_escape.html_attribute(l_data.cls)||'">'||
--                 apex_escape.html(l_data.title)||
--                 '</span>');
--       sys.htp.p(apex_escape.html_trunc(l_data.body));
--       sys.htp.p('</li>');
--     end loop;
--     htp.p('</ul>');
--   end;
--
-- SEE ALSO
--   html, html_whitelist, html_attribute, set_html_escaping_mode
--==============================================================================
function html_trunc (
    p_string            in clob,
    p_length            in number default 4000 )
    return varchar2;

--==============================================================================
-- HTML escape all characters in the input text with the exception of the
-- specified whitelist tags.
--
-- This function can be useful if the input text may contain simple html markup
-- but a developer wants to ensure that an attacker can not use malicious tags
-- for cross-site scripting.
--
-- ARGUMENTS
-- * p_html              input text that should be filtered
-- * p_whitelist_tags    comma separated list of tags that should stay in p_html
--
-- EXAMPLE
--   begin
--     sys.htp.p(apex_escape.html_whitelist(
--                 '<h1>Hello<script>alert("XSS");</script></h1>'));
--   end;
--
-- SEE ALSO
--   html, html_trunc, html_attribute, set_html_escaping_mode
--==============================================================================
function html_whitelist (
   p_html           in varchar2,
   p_whitelist_tags in varchar2 default c_html_whitelist_tags )
   return varchar2;

--==============================================================================
-- Escape html attribute
--
-- This function can be used to escape the values of html entity attributes. It
-- hex - escapes everything that is not alphanumeric or in ',' '.' '-' '_'
--
-- Use this function to ensure that 
--
-- ARGUMENTS
-- * p_string            input text that should be escaped
--
-- EXAMPLE
--   see html_trunc
--
-- SEE ALSO
--   html, html_trunc, html_whitelist, set_html_escaping_mode
--==============================================================================
function html_attribute (
    p_string in varchar2 )
    return varchar2;

--##############################################################################
--#
--# JAVASCRIPT ESCAPING
--#
--##############################################################################

--==============================================================================
-- Escape and optionally enquote a javascript string.
--
-- This function replaces non-immune characters with \xHH or \uHHHH equivalents.
-- The result can be injected into javascript code, within <script> tags or
-- inline ("javascript:xxx").
--
-- Immune characters are a-z A-Z 0-9 , . _
--
-- ARGUMENTS
-- * p_string            string to be escaped
-- * p_quote             if not null, place this string left and right of the
--                       result. the quote character should either be a single
--                       or a double quote.
--
-- EXAMPLE
--   declare
--     l_string varchar2(4000) := 'O''Brien';
--   begin
--     sys.htp.p('<script>'||
--               'alert('||apex_escape.js_literal(l_string)||');'||
--               '</script>');
--   end;
--==============================================================================
function js_literal (
    p_string in varchar2,
    p_quote  in varchar2 default '''' )
    return varchar2;

--==============================================================================
-- Escape characters in a JSON string.
--
-- ARGUMENTS
-- * p_string            string to be escaped
--
-- EXAMPLE
--   Print this: { "name": "O\u0027Brien"}
--
--   declare
--     l_string varchar2(4000) := 'O''Brien';
--   begin
--     sys.htp.p('{ "name": "'||apex_escape.json(l_string)||'"}');
--   end;
--==============================================================================
function json (
    p_string  in varchar2 )
    return varchar2;

--##############################################################################
--#
--# REGEXP ESCAPING
--#
--##############################################################################

--==============================================================================
-- Escape regular expression special characters
--
-- This function escapes characters which can change the context in a
-- regular expression. It should be used to secure user input.
--
-- The following list depicts ascii characters that the function will escape
-- with a \
--
--   \.^$*+-?()[]{|
--
-- ARGUMENTS
-- * p_string            text that should be escaped
--
-- EXAMPLE
--   The following example will make sure that the special character "-"
--   in Mary-Ann will be escaped and ignored by the regular expression engine.
--
--   declare
--     l_subscribers varchar2(4000) := 'Christina,Hilary,Mary-Ann,Joel';
--     l_name        varchar2(4000) := 'Mary-Ann';
--   begin
--     if regexp_instr( l_subscribers, '(^|,)' || apex_escape.regexp( l_name ) || '($|,)' ) > 0 then
--       sys.htp.p('found');
--     else
--       sys.htp.p('not found');
--     end if;
--   end;
--
--==============================================================================
function regexp (
    p_string in varchar2 )
    return varchar2 deterministic;

--##############################################################################
--#
--# CSS SELECTOR ESCAPING
--#
--##############################################################################

--==============================================================================
-- Escape CSS selector meta-characters
--
-- This function escapes meta-characters in a string used in a CSS selector.
--
-- See http://api.jquery.com/category/selectors/ for a list of characters.
--
-- ARGUMENTS
-- * p_string            text that should be escaped
--
-- EXAMPLE
--   The following example will make sure that the meta-character "@"
--   in mary@ann.com will be escaped and ignored by jQuery.
--
--   declare
--     l_name varchar2(30) := 'mary@ann.com';
--   begin
--     apex_javascript.add_onload_code( '$( "#' || apex_escape.js_literal( apex_escape.css_selector( l_name ), null ) || '" ).hide();' );
--   end;
--
--==============================================================================
function css_selector (
    p_string in varchar2 )
    return varchar2 deterministic;

--##############################################################################
--#
--# PUBLIC UTILITY FUNCTIONS
--#
--##############################################################################

--==============================================================================
-- Return p_string unchanged. This function can be used to silence automatic
-- injection detection tests, similar to dbms_assert.noop for SQL injection.
--
-- ARGUMENTS
-- * p_string            input string
--
-- EXAMPLE
--   begin
--     sys.htp.p(apex_escape.noop('Cats & Dogs'));
--   end;
--==============================================================================
function noop (
    p_string in varchar2 )
    return varchar2 deterministic;

--==============================================================================
-- Configure HTML escaping mode for wwv_flow_escape.html
--
-- ARGUMENTS
-- * p_mode             if B: do basic escaping, like sys.htf.escape_sc
--                      if E: do extended escaping
--
-- SEE ALSO
--   html, html_trunc, html_whitelist, html_attribute
--==============================================================================
procedure set_html_escaping_mode (
    p_mode in varchar2 );

--==============================================================================
-- This procedure can be used to re-initialize internal package state, after
-- HTTP header variables or the current application have been changed. It is for
-- internal use only.
--==============================================================================
procedure init;

end wwv_flow_escape;
/
show errors
