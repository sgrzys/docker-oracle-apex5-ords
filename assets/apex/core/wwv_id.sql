set define '^'
set verify off
prompt ...wwv_flow_id

Rem
Rem    INTERNATIONALIZATION
Rem      unknown
Rem
Rem    MULTI-CUSTOMER
Rem      unknown
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   08/04/1999 - Created
Rem      mhichwa   02/22/2000 - Changed name to wwv_flow_id
Rem      mhichwa   03/01/2001 - enhanced uniqueness
Rem      sdillon   03/05/2001 - changed dbms_random.random to wwv_flow_random.rand
Rem      mhichwa   07/23/2001 - Added grant on wwv seq to public
Rem      jkallman  02/26/2014 - Changed cache to 100

prompt ...create sequence wwv_seq



create sequence wwv_seq cache 100;

grant select on wwv_seq to public
/

prompt ...wwv_flow_id

create or replace package wwv_flow_id 
as
--  Copyright (c) Oracle Corporation 1999. All Rights Reserved.
--
--    DESCRIPTION
--      Unique id generation utility
--
--    SECURITY
--     Publicly executable
--
--    NOTES
--      This package generates sequence numbers which
--      are, for all practial purposes, globally unique.
--      This assumes the following: "create sequence wwv_seq"

   function curr_val return number;
   pragma restrict_references( curr_val, wnds, rnds, wnps );
   --
   function next_val return number;
end wwv_flow_id;
/
show errors



grant execute on wwv_flow_id to public;
