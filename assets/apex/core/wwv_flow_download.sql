set define '^'
set verify off
prompt ...wwv_flow_download


Rem    NAME
Rem      wwv_flow_download.sql
Rem    Arguments:
Rem     1:  
Rem     2:
Rem     3:  Flow user
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbcho    10/04/2002 - Created


create or replace package wwv_flow_download
as
--  Copyright (c) Oracle Corporation 1999 - 2002. All Rights Reserved.
--
--
--    DESCRIPTION
--      Used to download flow source to favorite text editor.
--
--    NOTES
--      
--      
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--    RUNTIME DEPLOYMENT: YES
--

procedure get_page_process_source (
    p_process_id in number
    );

end wwv_flow_download;
/
show error;