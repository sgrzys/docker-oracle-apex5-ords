set define '^'
set verify off
prompt ...wwv_flow_epg_include_mod_local

Rem
Rem    SCRIPT ARGUMENTS
Rem      none
Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    SCRIPT ARGUMENTS
Rem      none
Rem
Rem    RUNTIME DEPLOYMENT: NO
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    sspadafo    11/22/2005 - Created
Rem    sspadafo    11/26/2005 - revise comments
Rem    mhichwa     12/08/2005 - Removed references to product name



--
-- This function is for administrators to modify in order to add procedures to the PL/SQL "inclusion list".
-- It is called by the PL/SQL inclusion list function, wwv_flow_epg_include_modules.
-- It must be compiled in the product schema, e.g., FLOWS_030000.
--
-- The source code for this procedure is shipped by Oracle in clear text (not wrapped).
--
create or replace function wwv_flow_epg_include_mod_local(
    procedure_name in varchar2)
return boolean
is  
begin  
    return false; -- remove this statement when you modify this function
    --
    -- Administrator note: the procedure_name input parameter may be in the format:
    --
    --    procedure
    --    schema.procedure
    --    package.procedure
    --    schema.package.procedure
    --
    -- If the expected input parameter is a procedure name only, the IN list code shown below
    -- can be modified to itemize the expected procedure names. Otherwise you must parse the
    -- procedure_name parameter and replace the simple code below with code that will evaluate
    -- all of the cases listed above.
    --
    if upper(procedure_name) in (
          '') then  
        return TRUE;  
    else  
        return FALSE;  
    end if;  
end wwv_flow_epg_include_mod_local;
/
show err
