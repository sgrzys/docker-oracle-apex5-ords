set define off verify off
prompt ...wwv_flow_error_api
create or replace package wwv_flow_error_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2011 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_error_api.sql
--
--    DESCRIPTION
--      This package is responsible for handling errors.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    02/27/2012 - Created
--      pawolf    02/27/2012 - Moved public constants and types to wwv_flow_error_api
--      pawolf    06/25/2012 - Changed error example
--      cneumuel  07/17/2013 - In t_error: added error_statement
--      cneumuel  12/18/2014 - In t_error: added is_common_runtime_error (feature #1655)
--      pawolf    01/16/2015 - In t_error: added original_message and original_additional_info (bug# 20369751)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Example of an error handling function
--==============================================================================
/*

create or replace function apex_error_handling_example (
    p_error in apex_error.t_error )
    return apex_error.t_error_result
is
    l_result          apex_error.t_error_result;
    l_reference_id    number;
    l_constraint_name varchar2(255);
begin
    l_result := apex_error.init_error_result (
                    p_error => p_error );

    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then
        -- mask all errors that are not common runtime errors (Access Denied
        -- errors raised by application / page authorization and all errors
        -- regarding session and session state)
        if not p_error.is_common_runtime_error then
            -- log error for example with an autonomous transaction and return
            -- l_reference_id as reference#
            -- l_reference_id := log_error (
            --                       p_error => p_error );
            --

            -- Change the message to the generic error message which doesn't expose
            -- any sensitive information.
            l_result.message         := 'An unexpected internal application error has occurred. '||
                                        'Please get in contact with XXX and provide '||
                                        'reference# '||to_char(l_reference_id, '999G999G999G990')||
                                        ' for further investigation.';
            l_result.additional_info := null;
        end if;
    else
        -- Always show the error as inline error
        -- Note: If you have created manual tabular forms (using the package
        --       apex_item/htmldb_item in the SQL statement) you should still
        --       use "On error page" on that pages to avoid loosing entered data
        l_result.display_location := case
                                       when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification
                                       else l_result.display_location
                                     end;

        -- If it's a constraint violation like
        --
        --   -) ORA-00001: unique constraint violated
        --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)
        --   -) ORA-02290: check constraint violated
        --   -) ORA-02291: integrity constraint violated - parent key not found
        --   -) ORA-02292: integrity constraint violated - child record found
        --
        -- we try to get a friendly error message from our constraint lookup configuration.
        -- If we don't find the constraint in our lookup table we fallback to
        -- the original ORA error message.
        if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then
            l_constraint_name := apex_error.extract_constraint_name (
                                     p_error => p_error );

            begin
                select message
                  into l_result.message
                  from constraint_lookup
                 where constraint_name = l_constraint_name;
            exception when no_data_found then null; -- not every constraint has to be in our lookup table
            end;
        end if;

        -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
        -- in a table trigger or in a PL/SQL package called by a process and we
        -- haven't found the error in our lookup table, then we just want to see
        -- the actual error text and not the full error stack with all the ORA error numbers.
        if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
            l_result.message := apex_error.get_first_ora_error_text (
                                    p_error => p_error );
        end if;

        -- If no associated page item/tabular form column has been set, we can use
        -- apex_error.auto_set_associated_item to automatically guess the affected
        -- error field by examine the ORA error for constraint names or column names.
        if l_result.page_item_name is null and l_result.column_alias is null then
            apex_error.auto_set_associated_item (
                p_error        => p_error,
                p_error_result => l_result );
        end if;
    end if;

    return l_result;
end apex_error_handling_example;

*/

-- Record structure which is passed into an error handling callout function and
-- which contains all the relevant information about the occurred error
type t_error is record (
    message                  varchar2(32767),     /* Error message which will be displayed */
    additional_info          varchar2(32767),     /* Only used for display_location ON_ERROR_PAGE to display additional error information */
    display_location         varchar2(40),        /* Use constants "used for display_location" below */
    association_type         varchar2(40),        /* Use constants "used for asociation_type" below */
    page_item_name           varchar2(255),       /* Associated page item name */
    region_id                number,              /* Associated tabular form region id of the primary application */
    column_alias             varchar2(255),       /* Associated tabular form column alias */
    row_num                  pls_integer,         /* Associated tabular form row */
    apex_error_code          varchar2(255),       /* Contains the system message code if it's an error raised by APEX */
    is_internal_error        boolean,             /* Set to TRUE if it's a critical error raised by the APEX engine, like an invalid SQL/PLSQL statements, ... Internal Errors are always displayed on the Error Page */
    is_common_runtime_error  boolean,             /* TRUE for internal authorization, session and session state errors that normally should not be masked by an error handler */
    original_message         varchar2(32767),     /* Contains the original error message in case it has been modified by an error handling function */
    original_additional_info varchar2(32767),     /* Contains the original additional error information in case it has been modified by an error handling function */
    ora_sqlcode              number,              /* SQLCODE on exception stack which triggered the error, NULL if the error was not raised by an ORA error */
    ora_sqlerrm              varchar2(32767),     /* SQLERRM which triggered the error, NULL if the error was not raised by an ORA error */
    error_backtrace          varchar2(32767),     /* Output of sys.dbms_utility.format_error_backtrace or sys.dbms_utility.format_call_stack */
    error_statement          varchar2(32767),     /* Statement that was parsed when the error occurred - only suitable when parsing caused the error */
    component                wwv_flow.t_component /* Component which has been processed when the error occurred */
    );

-- Record structure which has to be returned my an error handling callout function
type t_error_result is record (
    message          varchar2(32767), /* Error message which will be displayed */
    additional_info  varchar2(32767), /* Only used for display_location ON_ERROR_PAGE to display additional error information */
    display_location varchar2(40),    /* Use constants "used for display_location" below */
    page_item_name   varchar2(255),   /* Associated page item name */
    column_alias     varchar2(255)    /* Associated tabular form column alias */
    );

--==============================================================================
-- Global constants
--==============================================================================

-- used for display_location
c_inline_with_field           constant varchar2(40) := 'INLINE_WITH_FIELD';
c_inline_with_field_and_notif constant varchar2(40) := 'INLINE_WITH_FIELD_AND_NOTIFICATION';
c_inline_in_notification      constant varchar2(40) := 'INLINE_IN_NOTIFICATION';
c_on_error_page               constant varchar2(40) := 'ON_ERROR_PAGE';

-- used for association_type
c_ass_type_page_item     constant varchar2(30) := 'PAGE_ITEM';
c_ass_type_region        constant varchar2(30) := 'REGION';
c_ass_type_region_column constant varchar2(30) := 'REGION_COLUMN';

--==============================================================================
-- Global variables
--==============================================================================

/* Note: for internal use only!!! */
g_error        t_error;
g_error_result t_error_result;

--==============================================================================
-- Adds an error message onto the error stack.
-- Note: This procedure has to be called before APEX has performed the
--       last validation/process, otherwise it will not take the error into account
--       when the inline errors are displayed.
--==============================================================================
procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2, -- use constants "used for display_location"
    p_ignore_ora_error in boolean  default false );

procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2,
    p_page_item_name   in varchar2,
    p_ignore_ora_error in boolean  default false );

procedure add_error (
    p_error_code          in varchar2, -- name of a "Text Message"
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default true,
    p_additional_info     in varchar2 default null,
    p_display_location    in varchar2, -- use constants "used for display_location"
    p_page_item_name      in varchar2,
    p_ignore_ora_error    in boolean  default false );

procedure add_error (
    p_message          in varchar2,
    p_additional_info  in varchar2 default null,
    p_display_location in varchar2, -- use constants "used for display_location"
    p_region_id        in number,
    p_column_alias     in varchar2 default null,
    p_row_num          in number,
    p_ignore_ora_error in boolean  default false );

procedure add_error (
    p_error_code          in varchar2, -- name of a "Text Message"
    p0                    in varchar2 default null,
    p1                    in varchar2 default null,
    p2                    in varchar2 default null,
    p3                    in varchar2 default null,
    p4                    in varchar2 default null,
    p5                    in varchar2 default null,
    p6                    in varchar2 default null,
    p7                    in varchar2 default null,
    p8                    in varchar2 default null,
    p9                    in varchar2 default null,
    p_escape_placeholders in boolean  default true,
    p_additional_info     in varchar2 default null,
    p_display_location    in varchar2, -- use constants "used for display_location"
    p_region_id           in number,
    p_column_alias        in varchar2 default null,
    p_row_num             in number,
    p_ignore_ora_error    in boolean  default false );

--==============================================================================
-- Function which returns the t_error_result record initialized with the values
-- stored in p_error.
-- Note: This function should be used for initialization to be compatible with
--       future changes in t_error_result and to properly initialize them.
--==============================================================================
function init_error_result (
    p_error in t_error )
    return t_error_result;

--==============================================================================
-- This procedure tries to automatically set the associated page item/tabular
-- form column based on a constraint contained in the ORA error message.
--
-- 1) The constraint is identified by searching for the pattern (schema.constraint)
-- 2) Only constraints of type P, U, R and C are supported
-- 3) For constraints of type C (check constraints) the procedure tries to parse
--    the expression to identify those columns which are used in the constraint
--    expresion
-- 4) Using those columns, the procedure will get the first visible page item or
--    tabular form column which is based on that column and set it as associated
--    p_error_result.page_item_name/p_error_result.column_alias.
-- 5) If a page item/tabular form column was found, p_error_result.display_location
--    will be set to apex_error.c_inline_with_field_and_notif
--==============================================================================
procedure auto_set_associated_item (
    p_error_result in out nocopy t_error_result,
    p_error        in            t_error );

--==============================================================================
-- Function which tries to extract a constraint name contained in p_error.ora_sqlerrm.
-- The constraint has to match to the pattern (schema.constraint).
-- If p_include_schema is set to TRUE, the result will be prefixed with the
-- schema name (for example: HR.DEMO_PRODUCT_INFO_PK), if FALSE only the
-- constraint name will be returned.
--==============================================================================
function extract_constraint_name (
    p_error          in t_error,
    p_include_schema in boolean default false )
    return varchar2;

--==============================================================================
-- Function which returns the first ORA error message text stored in
-- p_error.ora_sqlerrm. If p_error.ora_sqlerrm doesn't contain a value, NULL
-- will be returned. Only if p_include_error_no is set to TRUE, ORA-xxxx: will
-- be included in the returned error message, otherwise only the message text
-- will be returned.
--==============================================================================
function get_first_ora_error_text (
    p_error            in t_error,
    p_include_error_no in boolean default false )
    return varchar2;

--==============================================================================
-- Writes the data of the error to the debug output.
--==============================================================================
procedure debug_error (
    p_error in t_error );

--==============================================================================
-- Function returns TRUE if (inline) errors have occurred and FALSE if
-- no error has occurred.
--==============================================================================
function have_errors_occurred return boolean;

--==============================================================================
-- Function returns the number of errors on the stack.
--==============================================================================
function get_error_count return pls_integer;

--==============================================================================
-- Returns a string containing the relevant ARIA attributes for an item that
-- has errors, only when running in screen reader mode.
--==============================================================================
function get_aria_error_attributes (
    p_item_name in varchar2 )
    return varchar2;
--
--
end wwv_flow_error_api;
/
show errors

set define '^'
