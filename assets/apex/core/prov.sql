set define '^'
set verify off
prompt ...wwv_flow_provision

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
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      sdillon  02/21/2001 - Created
Rem      sdillon  02/22/2001 - Added remove provisioned companies
Rem      sdillon  03/20/2001 - Added get random password
Rem      sdillon  03/20/2001 - Removed create tablespace, create user
Rem      sdillon  03/26/2001 - Exposed create_user & set_user_tablespace
Rem      cbcho    06/27/2001 - Added drop_user to the package spec
Rem      jstraub  02/18/2004 - Exposed set_company_tablespace (Bug 3306469)
Rem      jkallman 12/09/2005 - Remove references to internal resources in comments (Bug 4692570)
Rem      jkallman 05/09/2011 - Add p_preallocation_size to setup_company_tablespace and provision_company
Rem      jkallman 05/10/2011 - Renamed all occurrences of preallocation to initial
Rem      jstraub  06/13/2011 - Added schema_name_valid (bug 10426595)
Rem      jkallman 06/13/2011 - Remove default values in set_user_tablespace
Rem      jkallman 10/15/2012 - Added overloaded version of change_provisioned_storage (Bug 14734825)


create or replace package wwv_flow_provision
as

/* ------------- PROVISIONING API -------------------- */

/*
 * creates a user account, creates a tablespace for the user, and
 * grants the user privileges to create objects and such.
 *
 * p_quota:  the size in MBytes the company is allocated
 *
 * rules for p_company:
 * - Must be from 1 to 30 bytes long
 * - Cannot contain quotation marks
 * - Must begin with an alphabetic character from THIS database set
 * - Can only contain alphanumeric characters, with the exception of
 *   (_) underscore, ($) dollar, and (#) pound signs.
 * - Cannot be an oracle reserved word
 * - Cannot be DUAL
 */

procedure provision_company(
    p_company            in varchar2,
    p_password           in varchar2,
    p_quota              in number    default 20,
    p_initial_size       in number    default null)
    ;


/*
 * removes the company's tablespace(s) (including contents cascade
 * constraints); drops the company's flows schema user
 */
procedure remove_provisioned_company(
    p_company         in varchar2)
    ;


/*
 * this adds more space to the company's storage capacity.  We will
 * extend the tablespace to allow for more data.
 *
 * p_add: the size (in MB) you are extending the tablespace
 */
-- deprecated 
procedure change_provisioned_storage(
    p_sgid            in number,
    p_newsize         in number)
    ;
    
-- preferred    
procedure change_provisioned_storage(
    p_sgid            in number,
    p_add_size_mb     in number );    


/*
 * returns the number of bytes which have been provisioned to this company
 */
function get_provisioned_space(
    p_sgid            in number)
    return number
    ;

/*
 * returns the number of bytes being used by this company
 */
function get_space_consumption(
    p_sgid            in number)
    return number
    ;


/*
 * function which returns a password of varying length
 *
 *   p_length indicates the length of the password you wish to be
 *    randomly generated
 */
function get_random_password(
    p_length          in number)
    return varchar2
    ;

/*
 * When provisioning companies, use this function to verify the
 * words you are passing are NOT reserved.
 *
 */
function is_reserved(
    p_word            in varchar2)
    return boolean
    ;


 /*
 * When provisioning companies, use this function to verify the
 * schema name is valid.
 *
 */
function schema_name_valid(
    p_schema            in varchar2,
    p_workspace_name    in varchar2)
    return boolean
    ;

/*
 *
 */
procedure create_user(
    p_username        in varchar2,
    p_password        in varchar2)
    ;

/*
 *
 */
procedure drop_user(
    p_username        in varchar2,
    p_cascade         in boolean default TRUE,
    p_drop_ts         in boolean default FALSE)
    ;

/*
 *
 */
procedure set_user_tablespace(
    p_username        in varchar2,
    p_default_ts      in varchar2,
    p_temp_ts         in varchar2 )
    ;


/*
 *
 */
procedure grant_initial_privs(
    p_username        in varchar2)
    ;

procedure setup_company_tablespace(
    p_company in varchar2,
    p_size    in number,
    p_initial_size in number default null)
    ;

end wwv_flow_provision;
/
show errors
