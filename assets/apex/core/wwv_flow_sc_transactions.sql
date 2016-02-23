set define '^'
set verify off

prompt wwv_flow_sc_transactions.sql

Rem    MODIFIED   (MM/DD/YYYY)
Rem    skutz       03/21/2005 - Created
Rem    skutz       03/28/2005 - Removed log procedure
Rem    skutz       04/05/2005 - exposed setting application information calls
Rem    cbcho       05/05/2005 - added set_identifier
Rem    cneumuel    12/05/2011 - added sc_create_job (bug #13427866)
Rem    sathikum    09/03/2013 - Added p_language parameter to sc_create_job and sc_job (bug #10264981)


create or replace package wwv_flow_sc_transactions as

--==============================================================================
function add_trans(p_session in number,
                    p_user in varchar2,
                    p_schema in varchar2,
                    p_type in varchar2,
                    p_rows in number,
                    p_binds in varchar2,
                    p_sql in varchar2) return number;

--==============================================================================
procedure set_identifier(p_client_id in varchar2);

--==============================================================================
procedure set_client(p_user in varchar2);

--==============================================================================
procedure set_mod(p_mod in varchar2, p_sql in varchar2);

--==============================================================================
procedure set_action(p_name in varchar2);

--==============================================================================
procedure sc_job (p_session in number, p_user in varchar2, p_language in varchar2 default null);

--==============================================================================
-- schedule sc_job (in app process of 4500)
--==============================================================================
function sc_create_job(p_language in varchar2 default null)
    return number;

end;
/

