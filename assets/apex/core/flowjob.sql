set define '^'
set verify off
prompt ...wwv_flow_job

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
Rem      sdillon  02/27/2001 - Created
Rem      sdillon  03/02/2001 - Updated for inclusion of bind variables
Rem      mhichwa  03/05/2001 - Change ref to g_user to reference wwv_flow security variable
Rem      sdillon  03/05/2001 - Added the ability for the SQL to be run to have :JOB as an input,
Rem                            that way the user can make callbacks to UPDATE_JOB_STATUS
Rem      sdillon  03/13/2001 - Migrated most of the functionality to wwv_flow_plsql_job to provide
Rem                            a public interface.
Rem      sdillon  03/14/2001 - Added cleanup_completed_jobs
Rem      jkallman 07/11/2005 - Added p_language parameter to run_internal_job

create or replace package wwv_flow_job
as

/*
 * For internal use.  DO NOT call this package as it's only
 * meaningful to the body of this application.
 */
procedure run_internal_job(
    p_job                 in number,
    p_language            in varchar2 default null)
    ;


/*
 * Used to update the SYSTEM_STATUS of a wwv_flow_job.
 */
procedure update_system_status(
    p_job                 in number,
    p_system_status       in varchar2)
    ;


/*
 * For removing jobs.  We need to ensure that sloppy flows 
 * developers do not cause an extraneous amount of completed
 * jobs which have not been cleaned out.
 */ 
procedure remove_job(
    p_job                 in number)
    ;


/*
 * For internal use.  We need to ensure that sloppy flows 
 * developers do not cause an extraneous amount of completed
 * jobs which have not been cleaned out.
 */ 
procedure cleanup_completed_jobs(
    p_completed_before        in date)
    ;

end wwv_flow_job;
/
show error
