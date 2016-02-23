set define '^'
set verify off
prompt ...wwv_calculator

Rem NAME
Rem      wwv_calculator.sql
Rem
Rem    SCRIPT ARGUMENTS
Rem      1:
Rem      2:
Rem      3:
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      oalami    07/14/2000 - Created

create or replace 
package wwv_calculator 
as
--  Copyright (c) Oracle Corporation 2000. All Rights Reserved.
--
--    DESCRIPTION
--      Display a javascript based calculator passing a value back to a flow field.
--
--    SECURITY
--      Publicly executable.
--
--    NOTES
--
   procedure draw(p_field varchar2);
   procedure show(p_field varchar2);
end wwv_calculator;

/

show error
