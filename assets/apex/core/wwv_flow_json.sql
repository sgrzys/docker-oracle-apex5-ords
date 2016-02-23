set define '^' verify off
prompt ...wwv_flow_json.sql
create or replace package wwv_flow_json authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_json.sql
--
--    DESCRIPTION
--      Utilities for parsing and generating JSON
--
--      To read from a string that contains JSON data, first use parse() to
--      convert the string to an internal format. Then use the get_% routines
--      (e.g. get_varchar2(), get_number(), ...) to access the data and
--      find_paths_like() to search.
--
--      Alternatively, use to_xmltype() to convert a JSON string to an xmltype.
--
--      This package also contains procedures to generate JSON-formatted
--      output. Use the overloaded open_%(), close_%() and write() procedures
--      for writing.
--
--      Example 1:
--      ----------
--      Parse a JSON string and print the value of member variable "a".
--
--      declare
--          s varchar2(32767) := '{ "a": 1, "b": ["hello", "world"]}';
--      begin
--          apex_json.parse(s);
--          sys.dbms_output.put_line('a is '||apex_json.get_varchar2(p_path => 'a'));
--      end;
--
--      Example 2:
--      ----------
--      Convert a JSON string to XML and use XMLTABLE to query member values.
--
--      select col1, col2
--      from xmltable (
--          '/json/row'
--          passing apex_json.to_xmltype('[{"col1": 1, "col2": "hello"},'||
--                                        '{"col1": 2, "col2": "world"}]')
--          columns
--              col1 number path '/row/col1',
--              col2 varchar2(5) path '/row/col2' );
--
--      Example 3:
--      ----------
--      Write a nested JSON object to the HTP buffer.
--
--      begin
--          apex_json.open_object;        -- {
--          apex_json.  write('a', 1);    --   "a":1
--          apex_json.  open_array('b');  --  ,"b":[
--          apex_json.    open_object;    --    {
--          apex_json.      write('c',2); --      "c":2
--          apex_json.    close_object;   --    }
--          apex_json.    write('hello'); --   ,"hello"
--          apex_json.    write('world'); --   ,"world"
--          apex_json.close_all;          --  ]
--                                        -- }
--      end;
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    02/18/2013 - Created
--    cneumuel    03/11/2013 - In bool, num, str: added p[0-4]
--    cneumuel    03/12/2013 - Renamed bool, num, str to get_boolean, get_number, get_varchar2
--                           - added c_object, c_array, get_count
--    cneumuel    03/18/2013 - Added get_value
--    cneumuel    04/26/2013 - Renamed vc4000array to wwv_flow_t_varchar2
--    cneumuel    05/16/2013 - Added get_members
--    cneumuel    05/17/2013 - In parse: added p_strict
--    cneumuel    05/27/2013 - Added writer procedures (feature #1195)
--    cneumuel    05/28/2013 - Added does_exist, find_paths_like
--                           - In get%: added p_default
--    cneumuel    08/27/2013 - Moved write procedures to wwv_flow_t_json_generator (feature #1195)
--    cneumuel    12/03/2013 - pN parameters are varchar2 instead of pls_integer, g_values default
--    cneumuel    01/13/2014 - Added get_xml_to_json
--                           - Added parse() for xmltype
--    cneumuel    01/27/2014 - Made xmltype parse() procedures to_xmltype() functions
--    cneumuel    02/04/2014 - Integrated output interface and removed wwv_flow_t_json_generator (feature #1195)
--    cneumuel    02/06/2014 - Moved t_output and g_output to package body
--    cneumuel    02/20/2014 - In write(sys_refcursor): remove p_lower_names because of inconsistencies if an implicit xmltype conversion is needed
--    cneumuel    04/24/2014 - Moved wwv_flow_json.escape to wwv_flow_escape.json and improved performance
--    cneumuel    04/29/2014 - Documentation
--    cneumuel    05/05/2014 - Documentation. Removed p_key_column from sys_refcursor write procedures.
--    cneumuel    07/07/2014 - Made write_raw() public
--    cneumuel    07/18/2014 - In write(p_name, ...): add p_write_null
--    cneumuel    09/19/2014 - Added links, write_links and write_items to support oracle rest service standard json, for mike and kris
--    cneumuel    09/26/2014 - In link: added p_templated, p_method, p_profile
--    cneumuel    10/23/2014 - Added initialize_clob_output, get_clob_output, free_output
--    cneumuel    11/10/2014 - In get_%: move p_values parameter to the end of the argument list
--    cneumuel    11/21/2014 - Added overloaded parse and to_xmltype for wwv_flow_global.vc_arr2 (bug #20077254)
--    cneumuel    12/05/2014 - In write_items: default p_item_links and p_links to null
--    cneumuel    12/10/2014 - In initalize_output: add p_http_cache_etag
--    cneumuel    06/23/2015 - In write(<sys_refcursor>),write(<xmltype>),write(p_name,<sys_refcursor>),write(p_name,<xmltype>): added documentation (bug #21303648)
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# PARSER INTERFACE
--#
--##############################################################################

--==============================================================================
subtype t_kind is binary_integer range 1 .. 7;
c_null     constant t_kind := 1;
c_true     constant t_kind := 2;
c_false    constant t_kind := 3;
c_number   constant t_kind := 4;
c_varchar2 constant t_kind := 5;
c_object   constant t_kind := 6;
c_array    constant t_kind := 7;

--==============================================================================
-- JSON data is stored in an index by varchar2 table. The JSON values are
-- stored as records. The discriminator "kind" determines whether the value
-- is null, true, false, a number, a varchar2, an object or an array. It depends
-- on "kind" which record fields are used and how. If not explicitly mentioned
-- below, the other record fields' values are undefined:
--
-- * c_null:     -
-- * c_true:     -
-- * c_false:    -
-- * c_number:   number_value contains the number value
-- * c_varchar2: varchar2_value contains the varchar2 value
-- * c_object:   object_members contains the names of the object's members
-- * c_array:    number_value contains the array length
--==============================================================================
type t_value is record (
    kind           t_kind,
    number_value   number,
    varchar2_value varchar2(32767),
    object_members wwv_flow_t_varchar2 );
type t_values is table of t_value index by varchar2(32767);

--==============================================================================
-- default format for dates
--==============================================================================
c_date_iso8601 constant varchar2(30) := 'yyyy-mm-dd"T"hh24:mi:ss"Z"';

--==============================================================================
-- parse() throws e_parse_error on error
--==============================================================================
e_parse_error     exception;
pragma exception_init(e_parse_error, -20987);

--==============================================================================
-- default JSON values table
--==============================================================================
g_values t_values;

--==============================================================================
-- parse a json-formatted varchar2 and put the members into p_values.
--
-- PARAMETERS
-- * p_values   an index by varchar2 result array which contains the json
--              members and values. defaults to g_values.
-- * p_source json source (varchar2 or clob)
-- * p_strict if true (default), enforce strict JSON rules
--
-- EXAMPLE
--   Parse JSON and print member values.
--
--   declare
--       l_values apex_json.t_values;
--   begin
--       apex_json.parse (
--           p_values => l_values,
--           p_source => '{ "type": "circle", "coord": [10, 20] }' );
--       sys.htp.p('Point at '||
--                 apex_json.get_number (
--                     p_values => l_values,
--                     p_path   => 'coord[1]')||
--                 ','||
--                 apex_json.get_number (
--                     p_values => l_values,
--                     p_path   => 'coord[2]'));
--   end;
--==============================================================================
procedure parse (
    p_values   in out nocopy t_values,
    p_source   in varchar2,
    p_strict   in boolean default true );
procedure parse (
    p_values   in out nocopy t_values,
    p_source   in clob,
    p_strict   in boolean default true );
procedure parse (
    p_values   in out nocopy t_values,
    p_source   in wwv_flow_global.vc_arr2,
    p_strict   in boolean default true );

--==============================================================================
-- parse a json-formatted varchar2 and put the members into the package global
-- g_values. this simplified API works similar to the parse() procedures above,
-- but saves the developer from declaring a local variable for parsed JSON data
-- and passing it to each JSON API call.
--
-- PARAMETERS
-- * p_source   json source (varchar2 or clob)
-- * p_strict   if true (default), enforce strict JSON rules
--
-- EXAMPLE
--   Parse JSON and print member values.
--
--   apex_json.parse('{ "type": "circle", "coord": [10, 20] }');
--   sys.htp.p('Point at '||
--             apex_json.get_number(p_path=>'coord[1]')||
--             ','||
--             apex_json.get_number(p_path=>'coord[2]'));
--==============================================================================
procedure parse (
    p_source   in varchar2,
    p_strict   in boolean default true );
procedure parse (
    p_source   in clob,
    p_strict   in boolean default true );
procedure parse (
    p_source   in wwv_flow_global.vc_arr2,
    p_strict   in boolean default true );

--==============================================================================
-- parse a json-formatted varchar2 or clob and convert it to a xmltype
--
-- PARAMETERS
-- * p_source  json source (varchar2 or clob)
-- * p_strict  if true (default), enforce strict JSON rules
--
-- RETURNS
-- * a xmltype representation of the json data
--
-- EXAMPLE
--   Parse JSON and print it's XML representation.
--
--   declare
--       l_xml xmltype;
--   begin
--       l_xml := apex_json.to_xmltype('{ "items": [ 1, 2, { "foo": true } ] }');
--       dbms_output.put_line(l_xml.getstringval);
--   end;
--==============================================================================
function to_xmltype (
    p_source   in varchar2,
    p_strict   in boolean default true )
    return sys.xmltype;
function to_xmltype (
    p_source   in clob,
    p_strict   in boolean default true )
    return sys.xmltype;
function to_xmltype (
    p_source   in wwv_flow_global.vc_arr2,
    p_strict   in boolean default true )
    return sys.xmltype;

--==============================================================================
-- return whether the given path points to an existing value
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
--
-- RETURNS
-- * true/false         whether given path exists in the parsed JSON
--
-- EXAMPLE
--   Parse a JSON string and print whether it contains values under a path.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": true } ] }');
--       if apex_json.does_exist (
--              p_values => j,
--              p_path   => 'items[%d].foo',
--              p0       => 3 )
--       then
--           dbms_output.put_line('found items[3].foo');
--       end if;
--   end;
--
--==============================================================================
function does_exist (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return boolean;

--==============================================================================
-- return boolean member value at a given path
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
-- * p_default          default value if the member does not exist
--
-- RETURNS
-- * null/true/false    value at the given path position
--
-- RAISES
-- * VALUE_ERROR        if p_values(p_path) is not a boolean
--
-- EXAMPLE
--   Parse a JSON string and print the value at a position.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": true } ] }');
--       if apex_json.get_boolean (
--              p_values => j,
--              p_path   => 'items[%d].foo',
--              p0       => 3 )
--       then
--           dbms_output.put_line('items[3].foo is true');
--       end if;
--   end;
--==============================================================================
function get_boolean (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in boolean  default null,
    p_values           in t_values default g_values )
    return boolean;
--==============================================================================
-- return numeric member value
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
-- * p_default          default value if the member does not exist
--
-- RETURNS
-- * a number           value at the given path position
--
-- RAISES
-- * VALUE_ERROR        if p_values(p_path) is not a number
--
-- EXAMPLE
--   Parse a JSON string and print the value at a position.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": 42 } ] }');
--       dbms_output.put_line(apex_json.get_number (
--                                p_values => j,
--                                p_path   => 'items[%d].foo',
--                                p0       => 3));
--   end;
--==============================================================================
function get_number (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in number   default null,
    p_values           in t_values default g_values )
    return number;
--==============================================================================
-- return varchar2 member value. this function auto-converts boolean and number
-- values.
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
-- * p_default          default value if the member does not exist
--
-- RETURNS
-- * a varchar2         value at the given path position
--
-- RAISES
-- * VALUE_ERROR        if p_values(p_path) is an array or an object
--
-- EXAMPLE
--   Parse a JSON string and print the value at a position.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": 42 } ] }');
--       dbms_output.put_line(apex_json.get_varchar2 (
--                                p_values => j,
--                                p_path   => 'items[%d].foo',
--                                p0       => 3));
--   end;
--==============================================================================
function get_varchar2 (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in varchar2 default null,
    p_values           in t_values default g_values )
    return varchar2;

--==============================================================================
-- return date member value.
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
-- * p_default          default value if the member does not exist
-- * p_format           date format mask
--
-- RETURNS
-- * a date             value at the given path position
--
-- RAISES
-- * VALUE_ERROR        if p_values(p_path) is not a date
--
-- EXAMPLE
--   Parse a JSON string and print the value at a position.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "items": [ 1, 2, { "foo": "2014-04-29T10:08:00Z" } ] }');
--       dbms_output.put_line(to_char(apex_json.get_date (
--                                        p_values => j,
--                                        p_path   => 'items[%d].foo',
--                                        p0       => 3),
--                                    'DD-Mon-YYYY'));
--   end;
--==============================================================================
function get_date (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_default          in date     default null,
    p_format           in varchar2 default c_date_iso8601,
    p_values           in t_values default g_values )
    return date;

--==============================================================================
-- return the number of array elements or object members
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
--
-- RETURNS
-- * number of array elements or object members or null if the array/object
--   could not be found
--
-- RAISES
-- * VALUE_ERROR        if p_values(p_path) is not an array or an object
--
-- EXAMPLE
--   Parse a JSON string and print the number of members at positions.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "foo": 3, "bar": [1, 2, 3, 4] }');
--       dbms_output.put_line(apex_json.get_count (
--                                p_values => j,
--                                p_path   => '.'));   -- 2 (foo and bar)
--       dbms_output.put_line(apex_json.get_count (
--                                p_values => j,
--                                p_path   => 'bar')); -- 4
--   end;
--==============================================================================
function get_count (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return number;

--==============================================================================
-- return the table of object_member names for an object
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
--
-- RETURNS
-- * object_members of the object or null if the object could not be found
--
-- RAISES
-- * VALUE_ERROR        if p_values(p_path) is not an array or an object
--
-- EXAMPLE
--   Parse a JSON string and print members at positions.
--
--   declare
--       j apex_json.t_values;
--   begin
--       apex_json.parse(j, '{ "foo": 3, "bar": [1, 2, 3, 4] }');
--       dbms_output.put_line(apex_json.get_members (
--                                p_values => j,
--                                p_path   => '.')(1)); -- foo
--       dbms_output.put_line(apex_json.get_members (
--                                p_values => j,
--                                p_path   => '.')(2)); -- bar
--   end;
--==============================================================================
function get_members (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return wwv_flow_t_varchar2;

--==============================================================================
-- return the t_value at a path position
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_path             index into p_values
-- * p[0-4]             each %N in p_path will be replaced by pN and every
--                      i-th %s or %d will be replaced by the p[i-1]
--
-- RETURNS
-- * t_value            the t_value at the given path position. the record
--                      attributes will be null if no data was found.
--
-- EXAMPLE
--   Parse a JSON string and print attributes of values at positions.
--
--   declare
--       j apex_json.t_values;
--       v apex_json.t_value;
--   begin
--       apex_json.parse(j, '{ "foo": 3, "bar": [1, 2, 3, 4] }');
--       v := apex_json.get_value (
--                p_values => j,
--                p_path   => 'bar[%d]',
--                p0       => 2); -- returns the t_value for bar[2]
--       dbms_output.put_line(v.number_value);      -- 2
--       v := apex_json.get_value (
--                p_values => j,
--                p_path   => 'does.not.exist');
--       dbms_output.put_line(case when v.kind is null then 'not found!' end);
--   end;
--==============================================================================
function get_value (
    p_path             in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p4                 in varchar2 default null,
    p_values           in t_values default g_values )
    return t_value;

--==============================================================================
-- Return paths into p_values that match a pattern
--
-- PARAMETERS
-- * p_values           parsed json members. defaults to g_values.
-- * p_return_path      search pattern for the return path
-- * p_subpath          search pattern under p_return_path (optional)
-- * p_value            search pattern for value (optional)
--
-- RETURNS
-- * apex_t_varchar2    table of paths that match the pattern
--
-- EXAMPLE
--   Parse a JSON string, find paths that match a pattern and print the values
--   under the paths.
--
--   declare
--       j       apex_json.t_values;
--       l_paths apex_t_varchar2;
--   begin
--       apex_json.parse(j, '{ "items": [ { "name": "Amulet of Yendor", "magical": true }, '||
--                          '             { "name": "smelly slippers",  "magical": "rather not" } ]}');
--       l_paths := apex_json.find_paths_like (
--                      p_values      => j,
--                      p_return_path => 'items[%]',
--                      p_subpath     => '.magical',
--                      p_value       => 'true' );
--       dbms_output.put_line('Magical items:');
--       for i in 1 .. l_paths.count loop
--           dbms_output.put_line(apex_json.get_varchar2(j, l_paths(i)||'.name'));
--       end loop;
--   end;
--==============================================================================
function find_paths_like (
    p_return_path      in varchar2,
    p_subpath          in varchar2 default null,
    p_value            in varchar2 default null,
    p_values           in t_values default g_values )
    return wwv_flow_t_varchar2;

--##############################################################################
--#
--# CONVERSION UTILITIES
--#
--##############################################################################

--==============================================================================
-- convert p_value to an escaped JSON value
--
-- EXAMPLE
--   Query that returns the JSON varchar2 value "line 1\nline 2"
--
--   select apex_json.stringify('line 1'||chr(10)||'line 2') from dual
--==============================================================================
function stringify (
    p_value in varchar2 )
    return varchar2;

--==============================================================================
-- convert p_value to an escaped JSON value
--
-- EXAMPLE
--   Query that returns a JSON number value.
--
--   select apex_json.stringify(-1/10) from dual
--==============================================================================
function stringify (
    p_value in number )
    return varchar2;

--==============================================================================
-- convert p_value to an escaped JSON value
--
-- EXAMPLE
--   Query that returns a JSON varchar2 value that is suitable to be converted
--   to dates.
--
--   select apex_json.stringify(sysdate) from dual
--==============================================================================
function stringify (
    p_value  in date,
    p_format in varchar2    default c_date_iso8601 )
    return varchar2;

--==============================================================================
-- convert p_value to an escaped JSON value
--
-- EXAMPLE
--   Print JSON boolean values
--
--   begin
--     sys.htp.p(apex_json.stringify(true));
--     sys.htp.p(apex_json.stringify(false));
--   end;
--==============================================================================
function stringify (
    p_value in boolean )
    return varchar2;

--##############################################################################
--#
--# OUTPUT INTERFACE
--#
--##############################################################################

--==============================================================================
-- initialize the output interface for the SYS.HTP buffer. you only have to
-- call this procedure if you want to modify the parameters below. initially,
-- output is already configured with the defaults mentioned below.
--
-- PARAMETERS
--   * p_http_header     If true (the default), write an "application/json" mime
--                       type header
--   * p_http_cache      This parameter is only relevant if p_write_header is true.
--                       If true, writes a Cache-Control header that allows
--                       caching of the JSON content.
--                       If false (default), writes Cache-Control: no-cache
--                       Otherwise, does not write Cache-Control
--   * p_http_cache_etag If not null, writes an etag header. This parameter
--                       is only used if p_http_cache is true. 
--   * p_indent          Indent level. Defaults to 2 if debug is turned on, 0
--                       otherwise.
--
-- SEE ALSO
--   initialize_clob_output
--
-- EXAMPLE
--   configure APEX_JSON to not emit default headers, because we write them
--   directly
--
--   begin
--     apex_json.initialize_output (
--         p_http_header => false );
--
--     sys.owa_util.mime_header('application/json', false);
--     sys.owa_util.status_line(429, 'Too Many Requests');
--     sys.owa_util.http_header_close;
--     --
--     apex_json.open_object;
--     apex_json.write('maxRequestsPerSecond', 10);
--     apex_json.close_object;
--   end;
--==============================================================================
procedure initialize_output (
    p_http_header     in boolean     default true,
    p_http_cache      in boolean     default false,
    p_http_cache_etag in varchar2    default null,
    p_indent          in pls_integer default null );

--==============================================================================
-- initialize the output interface to write to a temporary CLOB. the default is
-- to write to SYS.HTP. if using CLOB output, you should call free_output() at
-- the end. to free the CLOB.
--
-- SEE ALSO
--   initialize_output, get_clob_output, free_output
--
-- PARAMETERS
--   * p_dur          duration of the temporary CLOB. this can be
--                    DBMS_LOB.SESSION or DBMS_LOB.CALL (the default).
--   * p_cache        specifies if the lob should be read into buffer cache or
--                    not.
--   * p_indent       Indent level. Defaults to 2 if debug is turned on, 0
--                    otherwise.
--
-- EXAMPLE
--   In this example, we configure APEX_JSON for CLOB output, generate JSON,
--   print the CLOB with DBMS_OUTPUT and finally free the CLOB.
--
--   begin
--     apex_json.initialize_clob_output;
--
--     apex_json.open_object;
--     apex_json.write('hello', 'world');
--     apex_json.close_object;
--
--     dbms_output.put_line(apex_json.get_clob_output);
--
--     apex_json.free_output;
--   end;
--   /
--==============================================================================
procedure initialize_clob_output (
    p_dur         in pls_integer default sys.dbms_lob.call,
    p_cache       in boolean     default true,
    p_indent      in pls_integer default null );

--==============================================================================
-- free output resources. call this procedure after processing, if you are
-- using initialize_clob_output to write to a temporary CLOB.
--
-- SEE ALSO
--   initialize_clob_output, get_clob_output, free_output
--
-- EXAMPLE
--   see initialize_clob_output
--==============================================================================
procedure free_output;

--==============================================================================
-- return the temporary clob that you created with initialize_clob_output.
--
-- SEE ALSO
--   initialize_clob_output, free_output, get_varchar2_output
--
-- EXAMPLE
--   see initialize_clob_output
--==============================================================================
function get_clob_output
    return clob;

--==============================================================================
-- flush pending changes. note that the close procedures below automatically
-- flush.
--
-- EXAMPLE
--   Write incomplete JSON
--
--   begin
--     apex_json.open_object;
--     apex_json.write('attr', 'value');
--     apex_json.flush;
--     sys.htp.p('the "}" is missing');
--   end;
--==============================================================================
procedure flush;

--==============================================================================
-- write {
--
-- PARAMETERS
--   * p_name     If not null, write an object attribute name and colon before the
--                opening brace.
--
-- EXAMPLE
--   Write { "obj": { "obj-attr": "value" }}
--
--   begin
--     apex_json.open_object;                -- {
--     apex_json.open_object('obj');         --   "obj": {
--     apex_json.write('obj-attr', 'value'); --     "obj-attr": "value"
--     apex_json.close_all;                  -- }}
--   end;
--==============================================================================
procedure open_object (
    p_name        in varchar2 default null );

--==============================================================================
-- write }
--
-- EXAMPLE
--   Write { "obj-attr": "value" }
--
--   begin
--     apex_json.open_object;                -- {
--     apex_json.write('obj-attr', 'value'); --   "obj-attr": "value"
--     apex_json.close_object;               -- }
--   end;
--==============================================================================
procedure close_object;

--==============================================================================
-- write [
--
-- PARAMETERS
--   * p_name     If not null, write an object attribute name and colon before the
--                opening bracket.
--
-- EXAMPLE
--   write { "array":[ 1 ,[ ] ] }
--
--   begin
--     apex_json.open_object;                -- {
--     apex_json.open_array('array');        --   "array": [
--     apex_json.write(1);                   --     1
--     apex_json.open_array;                 --   , [
--     apex_json.close_array;                --     ]
--     apex_json.close_array;                --   ]
--     apex_json.close_object;               -- }
--   end;
--==============================================================================
procedure open_array (
    p_name        in varchar2 default null );

--==============================================================================
-- write ]
--
-- EXAMPLE
--   Write [ 1, 2 ]
--
--   begin
--     apex_json.open_array;                 -- [
--     apex_json.write(1);                   --   1
--     apex_json.write(2);                   -- , 2
--     apex_json.close_array;                -- ]
--   end;
--==============================================================================
procedure close_array;

--==============================================================================
-- close all objects and arrays up to the outermost nesting level
--==============================================================================
procedure close_all;

--==============================================================================
-- write array attribute of type varchar2.
--
-- PARAMETERS
--   * p_value    The value to be written
--
-- EXAMPLE
--   Write an array containing 1, "two", "long text", false, the current date
--   and a JSON representation of an xml document.
--
--   declare
--     l_clob clob        := 'long text';
--     l_xml  sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--   begin
--     apex_json.open_array;                 -- [
--     apex_json.write(1);                   --   1
--     apex_json.write('two');               -- , "two"
--     apex_json.write(l_clob);              -- , "long text"
--     apex_json.write(false);               -- , false
--     apex_json.write(sysdate);             -- , "2014-05-05T05:36:08Z"
--     apex_json.write(l_xml);               -- , { "foo": 1, "bar": 2 }
--     apex_json.close_array;                -- ]
--   end;
--==============================================================================
procedure write (
    p_value       in varchar2 );

--==============================================================================
-- write array attribute of type clob.
--
-- PARAMETERS
--   * p_value    The value to be written
--==============================================================================
procedure write (
    p_value       in clob );

--==============================================================================
-- write array attribute
--
-- PARAMETERS
--   * p_value    The value to be written
--==============================================================================
procedure write (
    p_value       in number );

--==============================================================================
-- write array attribute
--
-- PARAMETERS
--   * p_value    The value to be written
--   * p_format   date format mask (default c_date_iso8601)
--==============================================================================
procedure write (
    p_value       in date,
    p_format      in varchar2    default c_date_iso8601 );

--==============================================================================
-- write array attribute
--
-- PARAMETERS
--   * p_value    The value to be written
--==============================================================================
procedure write (
    p_value       in boolean );

--==============================================================================
-- Write array attribute.
--
-- The procedure uses a XSL transformation to generate JSON. To determine the
-- JSON type of values, it uses the following rules:
-- * If the value is empty, it generates a null value
-- * If upper(value) is TRUE, it generates a boolean true value
-- * If upper(value) is FALSE, it generates a boolean false value
-- * If the XPath number function returns true, it emits the value as is
-- * Otherwise, it enquotes the value (i.e. treats it as a JSON string)
--
-- PARAMETERS
--   * p_value    The value to be written. The XML is converted to JSON.
--==============================================================================
procedure write (
    p_value       in sys.xmltype );

--==============================================================================
-- Write an array with all rows that the cursor returns. each row is a separate
-- object.
--
-- If the query contains object type, collection or cursor columns, the
-- procedure uses write(<xmltype>) to generate JSON. See write(<xmltype>) for
-- further details. Otherwise, it uses DBMS_SQL to fetch rows and the write()
-- procedures for the appropriate column data types for output. If the column
-- type is varchar2 and the uppercase value is 'TRUE' or 'FALSE', it generates
-- boolean values.
--
-- PARAMETERS
--   * p_cursor       The cursor
--
-- EXAMPLE
--   Write an array containing JSON objects for departments 10 and 20.
--
--   declare
--     c sys_refcursor;
--   begin
--     open c for select deptno, dname, loc from dept where deptno in (10, 20);
--     apex_json.write(c);
--   end;
--
--   [ { "DEPTNO":10 ,"DNAME":"ACCOUNTING" ,"LOC":"NEW YORK" }
--   , { "DEPTNO":20 ,"DNAME":"RESEARCH" ,"LOC":"DALLAS" } ]
--==============================================================================
procedure write (
    p_cursor      in out nocopy sys_refcursor );

--==============================================================================
-- write an object attribute of type varchar2
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--
-- EXAMPLE
--   Write an object containing attributes with values 1, "two", "long text",
--   false, the current date and a JSON representation of an xml document.
--
--   declare
--     l_clob clob        := 'long text';
--     l_xml  sys.xmltype := sys.xmltype('<obj><foo>1</foo><bar>2</bar></obj>');
--     l_null varchar2(10);
--   begin
--     apex_json.open_object;                 -- {
--     apex_json.write('a1', 1);                   -- "a1": 1
--     apex_json.write('a2', 'two');               -- ,"a2": "two"
--     apex_json.write('a3', l_clob);              -- ,"a3": "long text"
--     apex_json.write('a4', false);               -- ,"a4": false
--     apex_json.write('a5', sysdate);             -- ,"a5": "2014-05-05T05:36:08Z"
--     apex_json.write('a6', l_xml);               -- ,"a6": { "foo": 1, "bar": 2 }
--     apex_json.write('a7', l_null);              --
--     apex_json.close_object;                -- }
--   end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in varchar2,
    p_write_null  in boolean default false );

--==============================================================================
-- write an object attribute
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in clob,
    p_write_null  in boolean default false );

--==============================================================================
-- write an object attribute
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in number,
    p_write_null  in boolean default false );

--==============================================================================
-- write an object attribute
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_format       date format mask (default wwv_flow_json.c_date_iso8601)
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in date,
    p_format      in varchar2    default c_date_iso8601,
    p_write_null  in boolean default false );

--==============================================================================
-- write an object attribute
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_value        The attribute value to be written
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in boolean,
    p_write_null  in boolean default false );

--==============================================================================
-- write an attribute where the value is an array that contains all rows that
-- the cursor returns. each row is a separate object.
--
-- If the query contains object type, collection or cursor columns, the
-- procedure uses write(name,<xmltype>) to generate JSON. See
-- write(name,<xmltype>) for further details. Otherwise, it uses DBMS_SQL to
-- fetch rows and the write() procedures for the appropriate column data types
-- for output. If the column type is varchar2 and the uppercase value is 'TRUE'
-- or 'FALSE', it generates boolean values.
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_cursor       The cursor
--
-- EXAMPLE
--   Write an array containing JSON objects for departments 10 and 20, as an
--   object member attribute.
--
--   declare
--     c sys_refcursor;
--   begin
--     open c for select deptno,
--                       dname,
--                       cursor(select empno,
--                                     ename
--                                from emp e
--                               where e.deptno=d.deptno) emps
--                  from dept d;
--     apex_json.open_object;
--     apex_json.  write('departments', c);
--     apex_json.close_object;
--   end;
--
--   { "departments":[
--         {"DEPTNO":10,
--          "DNAME":"ACCOUNTING",
--          "EMPS":[{"EMPNO":7839,"ENAME":"KING"}]},
--         ...
--        ,{"DEPTNO":40,"DNAME":"OPERATIONS","EMPS":null}] }
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_cursor      in out nocopy sys_refcursor );

--==============================================================================
-- write an object attribute of type xmltype
--
-- The procedure uses a XSL transformation to generate JSON. To determine the
-- JSON type of values, it uses the following rules:
-- * If the value is empty, it generates a null value
-- * If upper(value) is TRUE, it generates a boolean true value
-- * If upper(value) is FALSE, it generates a boolean false value
-- * If the XPath number function returns true, it emits the value as is
-- * Otherwise, it enquotes the value (i.e. treats it as a JSON string)
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_value        The value to be written. The XML is converted to JSON.
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in sys.xmltype,
    p_write_null  in boolean default false );

--==============================================================================
-- write parsed json values
--
-- PARAMETERS
--   * p_values       parsed json members
--   * p_path         index into p_values
--   * p[0-4]         each %N in p_path will be replaced by pN and every
--                    i-th %s or %d will be replaced by the p[i-1]
--
-- EXAMPLE
--   parse a json string and write parts of it.
--
--   declare
--     j apex_json.t_values;
--   begin
--     apex_json.parse(j, '{ "foo": 3, "bar": { "x": 1, "y": 2 }}');
--     apex_json.write(j,'bar');             -- { "x": 1, "y": 2}
--   end;
--==============================================================================
procedure write (
    p_values      in t_values,
    p_path        in varchar2 default '.',
    p0            in varchar2 default null,
    p1            in varchar2 default null,
    p2            in varchar2 default null,
    p3            in varchar2 default null,
    p4            in varchar2 default null );

--==============================================================================
-- write parsed json values
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_values       parsed json members
--   * p_path         index into p_values
--   * p[0-4]         each %N in p_path will be replaced by pN and every
--                    i-th %s or %d will be replaced by the p[i-1]
--   * p_write_null   If true, write null values. If false (the default), do not
--                    write nulls.
--
-- EXAMPLE
--   parse a json string and write parts of it as an object member.
--
--   declare
--     j apex_json.t_values;
--   begin
--     apex_json.parse(j, '{ "foo": 3, "bar": { "x": 1, "y": 2 }}');
--     apex_json.open_object;                -- {
--     apex_json.write('parsed-bar',j,'bar');-- "parsed-bar":{ "x":1 ,"y":2 }
--     apex_json.close_object;               -- }
--   end;
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_values      in t_values,
    p_path        in varchar2 default '.',
    p0            in varchar2 default null,
    p1            in varchar2 default null,
    p2            in varchar2 default null,
    p3            in varchar2 default null,
    p4            in varchar2 default null,
    p_write_null  in boolean default false );

--##############################################################################
--#
--# ORACLE REST STANDARD SUPPORT
--#
--# The Oracle Rest Service Standard defines a few characteristics for JSON
--# data. The APIs below help creating standard conforming output.
--#
--##############################################################################

--==============================================================================
-- utility record and table for item links (see link function for details)
--==============================================================================
type t_link is record (
    href       varchar2(4000),
    rel        varchar2(30),
    media_type varchar2(80),
    templated  boolean,
    method     varchar2(10),
    profile    varchar2(80) );
type t_links is table of t_link;

--==============================================================================
-- utility function to create a t_link record
--
-- PARAMETERS
--   * p_href       link target URI or URI template (see p_templated)
--   * p_rel        link relation type
--   * p_templated  if true, p_href is a URI template
--   * p_media_type expected mime type of the link target (RFC 2046)
--   * p_method     request method (e.g. GET, DELETE)
--   * p_profile    JSON schema that describes the resource
--
-- EXAMPLE
--   see write_links
--==============================================================================
function link (
    p_href       in varchar2,
    p_rel        in varchar2,
    p_templated  in boolean  default null,
    p_media_type in varchar2 default null,
    p_method     in varchar2 default null,
    p_profile    in varchar2 default null )
    return t_link;

--==============================================================================
-- writes "links" attribute with given values
--
-- PARAMETERS
--   * p_links     table of links
--
-- EXAMPLE
--   Write given links data
--
--   begin
--     apex_json.open_object;
--     apex_json.  write_links (
--                     p_links => apex_json.t_links (
--                                    apex_json.link (
--                                        p_href => 'http://www.oracle.com',
--                                        p_rel  => 'self' )));
--     apex_json.close_object;
--   end;
--
--   {
--     "links": [
--       {
--         "href": "http://www.oracle.com",
--         "rel": "self"
--       }
--     ]
--   }
--==============================================================================
procedure write_links (
    p_links in t_links );

--==============================================================================
-- write values of given xmltype as "items" attribute.
--
-- PARAMETERS
--   * p_items      records to be written
--   * p_item_links links within each item record
--   * p_links      links for the whole item set
--
-- EXAMPLE
--   Write employee items collection
--
--   declare
--     c sys_refcursor;
--   begin
--     open c for select ename, empno from emp where deptno=20;
--     apex_json.write_items (
--         p_items      => c,
--         p_item_links => apex_json.t_links (
--                             apex_json.link (
--                                 p_href => 'f?p=&APP_ID.:EDIT_EMP:&SESSION.::::P99_EMPNO:#EMPNO#',
--                                 p_rel  => 'self' )),
--         p_links      => apex_json.t_links (
--                             apex_json.link (
--                                 p_href => 'f?p=&APP_ID.:EMPS:&SESSION.',
--                                 p_rel  => 'self' ),
--                             apex_json.link (
--                                 p_href       => '.../metadata/emps',
--                                 p_rel        => 'describedby',
--                                 p_media_type => 'application/json' ),
--                             apex_json.link (
--                                 p_href => 'f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10',
--                                 p_rel  => 'start' ),
--                             apex_json.link (
--                                 p_href => 'f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10',
--                                 p_rel  => 'prev' ),
--                             apex_json.link (
--                                 p_href => 'f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:30',
--                                 p_rel  => 'next' ),
--                             apex_json.link (
--                                 p_href => 'f?p=&APP_ID.:EDIT_EMPS:&SESSION.::::P98_DEPTNO:10',
--                                 p_rel => 'edit' )));
--   end;
--
--   Output:

--   { "items": [
--       { "ENAME": "employee 1",
--         "EMPNO": 4711,
--         "links": [
--           { "href": "href:f?p=&APP_ID.:EDIT_EMP:&SESSION.::::P99_EMPNO:4711" }
--         ]
--       },
--       { "ENAME": "employee 2",
--         "EMPNO": 4712,
--         "links": [
--           { "href": "href:f?p=&APP_ID.:EDIT_EMP:&SESSION.::::P99_EMPNO:4712" }
--         ]
--       }
--     ],
--     "links": [
--       { "href": "f?p=&APP_ID.:EMPS:&SESSION.", "rel": "self" },
--       { "href": ".../metadata/emps", "rel": "describedby", "type": "application/json" },
--       { "href": "f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10", "rel": "start" },
--       { "href": "f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:10", "rel": "prev" },
--       { "href": "f?p=&APP_ID.:EMPS:&SESSION.::::P98_DEPTNO:30", "rel": "next" },
--       { "href": "f?p=&APP_ID.:EDIT_EMPS:&SESSION.::::P98_DEPTNO:10", "rel": "edit" }
--     ]
--   }
--==============================================================================
procedure write_items (
    p_items      in out nocopy sys_refcursor,
    p_item_links in            t_links default null,
    p_links      in            t_links default null );

--##############################################################################
--#
--# UNSAFE RAW OUTPUT
--#
--##############################################################################

--==============================================================================
-- write an unescaped array attribute. use the escaping write() procedures
-- instead, if possible.
--
-- PARAMETERS
--   * p_value    The value to be written
--
-- EXAMPLE
--   Write an array attribute that contains JSON
--
--   begin
--     apex_json.open_array;
--     apex_json.write_raw('{ "foo": 1, "bar": { "x": 1, "y": 2 }}');
--     apex_json.close_array;
--   end;
--==============================================================================
procedure write_raw (
    p_value  in varchar2 );

--==============================================================================
-- write an unescaped object value. use the escaping write() procedures
-- instead, if possible.
--
-- PARAMETERS
--   * p_name         The attribute name
--   * p_value        The raw value to be written.
--
-- EXAMPLE
--   Write an object attribute that contains JSON
--
--   begin
--     apex_json.open_object;
--     apex_json.write_raw('foo', '[1, 2, 3]');
--     apex_json.close_object;
--   end;
--==============================================================================
procedure write_raw (
    p_name   in varchar2,
    p_value  in varchar2 );

end wwv_flow_json;
/
show err
