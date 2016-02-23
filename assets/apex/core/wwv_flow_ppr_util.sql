set define '^'
set verify off
prompt ...wwv_flow_ppr_util

Rem  Copyright (c) Oracle Corporation 1999 - 2005. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_flow_ppr_util
Rem
Rem    MODIFIED  (MM/DD/YYYY)
Rem    sspadafo   01/08/2005 - Created

create or replace package wwv_flow_ppr_util
as
procedure run_process(
    p_process_name_or_id in varchar2)
    ;
end wwv_flow_ppr_util;
/
show errors
