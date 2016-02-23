prompt ...sys.wwv_flow_val
create or replace package SYS.WWV_FLOW_VAL authid current_user as
--------------------------------------------------------------------------------
--
--
-- Copyright (c) 2005, Oracle.  All rights reserved.  
--
--    NAME
--      wwv_flow_val.sql
--
--    DESCRIPTION
--      Access library SYS.WWV_FLOW_VAL_LIB 
--
--    NOTES
--      Hard-coded reference to schema name, e.g., FLOWS_020100 must be maintained for each release
--
--    MODIFIED   (MM/DD/YY)
--    lvbcheng    09/06/2005 - Created
--    sspadafo    10/25/2005 - Split into separate spec and body files	
--    mhichwa     12/08/2005 - Removed references to product name
--    jkallman    01/23/2006 - Adjust flows_020100 references to flows_020200
--    jkallman    09/29/2006 - Adjust flows_020200 references to flows_030000
--    jkallman    08/02/2007 - Change FLOWS_030000 references to FLOWS_030100
--    jkallman    07/08/2008 - Changed FLOWS_030100 references to FLOWS_040000
--    jkallman    10/02/2008 - Changed FLOWS_040000 references to APEX_040000
--    jkallman    11/22/2010 - Changed APEX_040000 references to APEX_040100
--    pawolf      02/21/2012 - Changed APEX_040100 references to APEX_040200
--    cneumuel    10/15/2012 - Removed well known username and password in doc of verify_user (bug #14760689)
--    jkallman    12/17/2012 - Change APEX_040200 references to APEX_050000
--    cneumuel    11/07/2014 - Added get_version_identifier (feature #1153)
--
--------------------------------------------------------------------------------

  /*********************************/
  /* return values for verify_user */
  /*********************************/

  valid_user CONSTANT PLS_INTEGER := 0;
  invalid_user CONSTANT PLS_INTEGER := 1;
  null_input CONSTANT PLS_INTEGER := -1;

  /******************************/
  /* exceptions for verify_user */
  /******************************/

  invalid_caller exception; /* this exception is raised if the user
                               is not allowed to call this package
                             */
  internal_error exception; /* this exception is raised only in unusual
                               situations (i.e., out of memory, database
                               down) */
  account_locked exception; /* this exception is raised if the account
                               is locked */
  password_expired exception; /* this exception is raised if the password
                                 has expired */
  /***********************/
  /* exception constants */
  /***********************/

  invalid_caller_errcode     CONSTANT PLS_INTEGER:= -32058;
  internal_error_errcode     CONSTANT PLS_INTEGER:= -600;
  account_locked_errcode     CONSTANT PLS_INTEGER:= -28000;
  password_expired_errcode   CONSTANT PLS_INTEGER:= -28001;

  PRAGMA EXCEPTION_INIT(invalid_caller,     -32058);
  PRAGMA EXCEPTION_INIT(internal_error,     -600);
  PRAGMA EXCEPTION_INIT(account_locked,     -28000);
  PRAGMA EXCEPTION_INIT(password_expired,   -28001);

  function verify_user(username IN varchar2 character set any_cs,
                       password IN varchar2 character set any_cs) 
    return PLS_INTEGER;
  /* 
    DESCRIPTION:
    Verify that the username and password pair is valid.

    PARAMETERS:
    username (IN) - username to be validated. Blank padded
                    usernames are not valid. Thus, 'MYUSER '
                    is not equal to 'MYUSER'.
    password (IN) - password to be validated. Blank padded
                    usernames are not valid. Thus, 'MYPASSWORD '
                    is not equal to 'MYPASSWORD'.

    USAGE NOTES:
    This package can only be called by the user FLOWS_xxxxxx (product release-specific)
    Any other caller will be rejected.

    SECURITY:

    TBD
 
  */
--==============================================================================
function get_version_identifier
    return varchar2;

end WWV_FLOW_VAL;
/
show errors

create or replace library SYS.WWV_FLOW_VAL_LIB trusted is static
/
grant execute on WWV_FLOW_VAL to APEX_050000
/
