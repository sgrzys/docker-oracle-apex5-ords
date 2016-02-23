set define '^'
set verify off
prompt ...wwv_owa_cookie


Rem  Copyright (c) Oracle Corporation 2010. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_owa_cookie
Rem
Rem    DESCRIPTION
Rem      Replica of owa_cookie so httponly flag can be sent in the send() procedure
Rem
Rem    NOTES
Rem      Missing functionality in standard owa_cookie package only available in later versions
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  12/16/2010

create or replace package wwv_owa_cookie is
    
   -- Calls to the procedure SEND generate an HTTP header line
   -- of the form:
   -- Set-Cookie: <name>=<value> expires=<expires> path=<path> 
   --             domain=<domain> [secure] [HttpOnly]
   -- Only the name and value are required (as per the HTTP_COOKIE spec),
   -- and the default is non-secure.
   -- Calls to SEND must fall in the context of an OWA procedure's
   -- HTTP header output.  For example:

   -- begin
   --    owa_util.mime_header('text/html', FALSE);
   --                -- FALSE indicates not to close the header
   --    owa_cookie.send('ITEM1','SOCKS');
   --    owa_cookie.send('ITEM2','SHOES');
   --    owa_util.http_header_close;
   --
   --    -- Now output the page the user will see.
   --    htp.htmlOpen;
   --    <etc>
   procedure send(name     in varchar2,
                  value    in varchar2,
                  expires  in date     DEFAULT NULL,
                  path     in varchar2 DEFAULT NULL,
                  domain   in varchar2 DEFAULT NULL,
                  secure   in varchar2 DEFAULT NULL,
                  httponly in varchar2 DEFAULT NULL);
                  
end wwv_owa_cookie;
/
                      

show errors
