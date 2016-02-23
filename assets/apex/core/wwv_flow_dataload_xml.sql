set define '^' verify off
prompt ...wwv_flow_dataload_xml
create or replace package wwv_flow_dataload_xml as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2006. All Rights Reserved.
--
-- NAME
--      wwv_flow_dataload_xml.sql
--
--    DESCRIPTION
--      XML Utility routines for the data loader.
--
--    NOTE
--      This package will ONLY compile in 9i due to reference to sys.dbms_xmlgen pkg.
--
--    NOTES
--      This package has various procedures and functions for
--      accepting xml datagrams for loading into tables, and for
--      exporting xml datagrams from sql queries.
--
--    MODIFIED   (MM/DD/YYYY)
--      cbcho     04/18/2002 - Retrieved missing package from Oracle Platform
--      tmuth     05/02/2002 - Changed default values of p_skiprows to match pkg spec (wouldn't compile in 9i)
--      cbcho     07/19/2002 - Removed p_dateformat,p_xmlcase from getQueryXmlPage and getQueryXml
--      mhichwa   05/16/2006 - Added where clause
--      cneumuel  08/08/2012 - Removed empty_vc_arr, load_table, getQueryXml (bug #14053241)
--                           - Renamed getQueryXmlPage to download_xml, and moved code from process in 4300:90 to procedure body, code cleanup (binds, wwv_flow_dynamic_exec)
--
--------------------------------------------------------------------------------

----------------------------------------------------------------------------
-- E X P O R T   R O U T I N E S
--

procedure download_xml (
    p_to_file         in varchar2,
    p_schema          in varchar2,
    p_table           in varchar2,
    p_columns         in wwv_flow_global.vc_arr2,
    p_skiprows        in number   default 0,
    p_maxrows         in number   default NULL,
    p_where           in varchar2 default null );


end wwv_flow_dataload_xml;
/
show error;
