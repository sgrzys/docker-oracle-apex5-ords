set define '^'
set verify off
prompt ...wwv_flow_ws_geocode

Rem  Copyright (c) Oracle Corporation 2007. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ws_geocode.sql
Rem    DESCRIPTION
Rem     Interface for geocoding data.
Rem
Rem    NOTES
Rem      API to generate geocode data and store in worksheet.
Rem
Rem    SECURITY
Rem      No grants, must be run as FLOW schema owner.
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     jstraub  04/04/2007 - Created
Rem     cbcho    05/27/2007 - Changed wwv_flow_worksheet_geocode to wwv_flow_ws_geocode
Rem     jstraub  08/21/2008 - Added reset_geocodes



create or replace package wwv_flow_ws_geocode
as

function get_geocode (
    p_worksheet_id  in varchar2,
    p_address       in varchar2
    ) return varchar2;

procedure cache_geocode (
    p_address   in varchar2,
    p_geocode   in varchar2
    );

procedure save_geocodes (
    p_worksheet_id  in varchar2,
    p_columns       in varchar2
    );

procedure reset_geocodes (
    p_worksheet_id  in varchar
    );

end wwv_flow_ws_geocode;
/
show errors;

