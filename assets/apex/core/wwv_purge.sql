set define '^'
set verify off
prompt ...wwv_purge.sql

Rem  Copyright (c) Oracle Corporation 2009-2010. All Rights Reserved.
Rem    NAME
Rem      wwv_purge.sql
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    jkallman    04/01/2010

create or replace package wwv_purge is
	
procedure compute_inactive;

procedure save_response( 
    p_purge_email_id in number,
    p_response_code  in varchar2 );
    
procedure daily_purge_process;    

procedure send_summary_email;

end wwv_purge;
/

show errors

