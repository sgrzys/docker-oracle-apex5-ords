set define '^' verify off
prompt ...wwv_flow_char_reader.sql
create or replace package wwv_flow_char_reader as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_char_reader.sql
--
--    DESCRIPTION
--      This is the basis for doing lexical analysis in PL/SQL
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    02/07/2013 - Created
--    cneumuel    03/22/2013 - In read, read_printable: do not raise no_data_found, but set p_char to null
--    cneumuel    12/04/2013 - Added CR, CRLF, WS
--    cneumuel    09/11/2014 - In read, unread: support multiple calls to unread
--    cneumuel    10/13/2014 - In t_pos, read, unread: save character position in t_pos.idx
--    cneumuel    01/29/2015 - Added read_plsql_identifer_chars, read_until (bug #20205388)
--
--------------------------------------------------------------------------------

--==============================================================================
-- utility types and constants
--==============================================================================
subtype t_char is char(1 char);                     -- a single character

LF constant t_char := unistr('\000a');              -- line separator character
CR constant t_char := unistr('\000d');
CRLF constant varchar2(2) := CR||LF;
WS constant varchar2(5) := unistr(' \0009\000b')||CRLF; -- white space

type t_pos is record (
    line              binary_integer not null := 0, -- currrent line number
    col               binary_integer not null := 0, -- current column number
    idx               binary_integer not null := 0  -- character index
);

--==============================================================================
-- char_reader state
--==============================================================================
type t is record (
    --
    -- public fields (read/write)
    --
    input             wwv_flow_global.vc_arr2,      -- input text
    is_line_separated boolean not null := true,     -- true if the char_reader should assume chr(10) between input(n) and input(n+1)
    --
    -- read-only fields
    --
    pos               t_pos,                        -- current line/column position
    --
    -- private fields
    --
    putback           varchar2(32767),              -- stack of unread characters
    putback_length    binary_integer not null := 0, -- length of putback
    cur_input         varchar2(32767),              -- copy of input(cur_input_idx) for performance
    cur_input_pos     binary_integer not null := 1, -- cursor position in cur_input
    cur_input_length  binary_integer not null := 0, -- length(cur_input)
    cur_input_idx     binary_integer not null := 0, -- index of cur_input within input. if 0 -> not initialized
    input_count       binary_integer not null := 0  -- input.count
);

--==============================================================================
-- read next character
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: read character
--
-- RETURNS
--   next character
--==============================================================================
procedure read (
    p_this in out nocopy t,
    p_char in out nocopy t_char );

--==============================================================================
-- read next character that is printable ( i.e. ascii(char) > ascii(' ') )
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: read character
--==============================================================================
procedure read_printable (
    p_this in out nocopy t,
    p_char in out nocopy t_char );

--==============================================================================
-- read all characters that are allowed in PL/SQL identifiers (A-Za-z0-9_$#)
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_result: varchar2 buffer where the procedure appends identifier chars
--==============================================================================
procedure read_plsql_identifer_chars (
    p_this   in out nocopy t,
    p_result in out nocopy varchar2 );

--==============================================================================
-- read until p_char is found
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: the character after which reading stops
-- * p_result: (optional) buffer for read characters, except last one
--==============================================================================
procedure read_until (
    p_this in out nocopy t,
    p_char in t_char );
procedure read_until (
    p_this   in out nocopy t,
    p_char   in t_char,
    p_result in out nocopy varchar2 );

--==============================================================================
-- put character back. if called multiple times, the next characters that read
-- yields are in the unread order.
--
-- EXAMPLE
--   unread(t, 'x');
--   unread(t, 'y');
--   read(t, c);     -- y
--   read(t, c);     -- x
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: character to put back.
--==============================================================================
procedure unread (
    p_this in out nocopy t,
    p_char in t_char );

end wwv_flow_char_reader;
/
show err

