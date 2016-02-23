set define '^'

set verify off
prompt ...wwv_flow_rest

Rem  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_rest.sql
Rem
Rem    DESCRIPTION
Rem      Interface to handle RESTful requests to Application Express.
Rem
Rem    RUNTIME DEPLOYMENT
Rem      Yes
Rem
Rem    SECURITY
Rem      Publicly executable.
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   11/24/2009 - Created
Rem      jstraub   12/10/2009 - Removed key parameter and added lang, page parameters

create or replace package wwv_flow_rest as

g_sql       clob;
g_result    clob;

procedure getReport(
    app             in varchar2,
    page            in varchar2,
    reportid        in varchar2,
    parmvalues      in varchar2     default null,
    lang            in varchar2     default 'en',
    output          in varchar2     default 'xml'
    );

procedure getServiceDescription(
    app             in varchar2
    );

end wwv_flow_rest;
/
show errors
