set define '^'

set verify off
prompt ...wwv_flow_login
Rem  Copyright (c) Oracle Corporation 1999 - 2004. All Rights Reserved.




Rem      mhichwa   09/23/2004 - Created
Rem      sspadafo  09/15/2005 - Added xe_login
Rem      sspadafo  09/27/2005 - Add authenticate, user_is_dba functions
Rem      sspadafo  03/25/2006 - Created from wwv_flow_login_xe.sql for xe to post-xe upgrade
Rem      jstraub   07/06/2006 - Removed xe_login procedure for XE upgrade to SE/EE

create or replace package wwv_flow_login as
--  Copyright (c) Oracle Corporation 1999 - 2004. All Rights Reserved.
--
--    DESCRIPTION
--      Logic to login
--
--    SECURITY
--      Private

procedure builder (
   p_workspace in varchar2,
   p_username  in varchar2,
   p_password  in varchar2)
   ; 

procedure administrator (
   p_username  in varchar2,
   p_password  in varchar2)
   ; 

function authenticate(
		p_username in varchar2,
		p_password in varchar2)
    return boolean
    ;
    
function user_is_dba(
		p_username in varchar2)
    return boolean
    ;
    
end wwv_flow_login;
/
show errors
