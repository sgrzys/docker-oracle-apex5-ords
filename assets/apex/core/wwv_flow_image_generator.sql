
set define '^'
set verify off
prompt ...wwv_flow_image_generator

Rem    NAME
Rem      wwv_flow_image_generator.sql
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      nagkrish    01/04/2007 - Created


create or replace package wwv_flow_image_generator
as

procedure get_image(
    p_position in number,
    p_sessionid in number);
    

end wwv_flow_image_generator;
/
show errors