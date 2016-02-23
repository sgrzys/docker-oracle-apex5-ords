set define '^'
set verify off
prompt ...wwv_flow_generate_ddl


Rem    NAME
Rem      generate_ddl.sql
Rem
Rem    Arguments:
Rem     1:
Rem     2:
Rem     3:
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbcho    08/02/2002 - Created
Rem     cbcho    02/20/2003 - Added execute_get_table_ddl (Bug 2814264)
Rem     cbcho    10/07/2004 - Changed pkg security description
Rem     cbcho    05/18/2005 - Removed p_filename, p_file_type, p_description from get_ddl procedure (Bug 3812379)
Rem     jstraub  03/06/2014 - Exposed get_ddl function
Rem     jstraub  03/13/2014 - Added get_ddl_supporting_objects and unexposed get_ddl function
Rem     jstraub  04/30/2014 - Added p_filter to execute_get_ddl and get_ddl


create or replace package wwv_flow_generate_ddl
--  Copyright (c) Oracle Corporation 1999 - 2002. All Rights Reserved.
--
--    NAME
--      generate_ddl.sql
--
--    DESCRIPTION
--      Used to generate DDL using dbms_metadata.
--
--    NOTES
--      This package will only compile in 9i and above.
--
--    SECURITY
--      Grant execute to Public.  Synonym is NOT availabe on wwv_flow_generate_ddl.
--      This package is invokers right package.
--      Flows owner needs SELECT_CATALOG_ROLE granted to run this package.
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--
AUTHID CURRENT_USER
as

empty_vc_arr wwv_flow_global.vc_arr2;

function get_ddl_supporting_objects (
    p_schema      in varchar2,
    p_object_type in varchar2,
    p_objects     in varchar2 default null
    ) return wwv_flow.clob_arr;

procedure get_ddl (
    p_schema      in varchar2,
    p_object_type in varchar2,
    p_objects     in varchar2 default null,
    p_output_type in varchar2 default null,
    p_filter       in varchar2 default 'NAME_EXPR'
    );

procedure execute_get_ddl (
    p_schema       in varchar2,
    p_object_types in varchar2,
    p_objects      in varchar2 default null,
    p_output_type  in varchar2 default null,
    p_filter       in varchar2 default 'NAME_EXPR',
    p_filename     in varchar2 default null,
    p_file_type    in varchar2 default 'sql',
    p_description  in varchar2 default null
    );

procedure execute_get_table_ddl (
    p_schema       in varchar2,
    p_table_name   in varchar2 default null
    );

end wwv_flow_generate_ddl;
/
show error;