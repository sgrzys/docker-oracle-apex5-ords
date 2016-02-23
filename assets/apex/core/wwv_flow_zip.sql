set define off
set verify off

prompt ...wwv_flow_zip

create or replace package wwv_flow_zip
as
--------------------------------------------------------------------------------
-- 
-- Copyright (C) 2010,2011 by Anton Scheffer
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
-- 
--    NAME
--      wwv_flow_zip.sql
--
--    DESCRIPTION
--      This package is responsible for zip/unzip handing.
--      It's based on http://technology.amis.nl/wp-content/uploads/2010/06/as_zip8.txt
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/24/2013 - Created
--      pawolf    04/26/2013 - Added API examples
--      pawolf    02/25/2013 - Added changes of version from 31-Jan-2014 - http://technology.amis.nl/wp-content/uploads/2010/06/as_zip8.txt
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_files is table of varchar2(32767) index by binary_integer;

--==============================================================================
-- Global constants
--==============================================================================


--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Returns an array of file names (including path) of a zip file provided as BLOB.
--
-- ARGUMENTS
-- * p_zipped_blob   BLOB containing the zip file.
-- * p_only_files    If true, empty directory entries will not be included in
--                   the returned array.
-- * p_encoding      Encoding used to zip the file.
--
-- EXAMPLE
--
--   Example which reads a zip file from a table, extracts it and stores all
--   files of the zip file into "my_files".
--
--   declare
--       l_zip_file      blob;
--       l_unzipped_file blob;
--       l_files         apex_zip.t_files;
--   begin
--       select file_content
--         into l_zip_file
--         from my_zip_files
--        where file_name = 'my_file.zip';
--
--       l_files := apex_zip.get_files (
--                      p_zipped_blob => l_zip_file );
--
--       for i in 1 .. l_files.count loop
--           l_unzipped_file := apex_zip.get_file_content (
--                                  p_zipped_blob => l_zip_file,
--                                  p_file_name   => l_files(i) );
--
--           insert into my_files ( file_name, file_content )
--           values ( l_files(i), l_unzipped_file );
--       end loop;
--   end;
--
--==============================================================================
function get_files (
    p_zipped_blob in blob,
    p_only_files  in boolean  default true,
    p_encoding    in varchar2 default null )
    return t_files;
--
--==============================================================================
-- Returns the BLOB of a file contained in a zip file.
--
-- ARGUMENTS
-- * p_zipped_blob   BLOB containing the zip file.
-- * p_file_name     File name (including path) of a file located in the zip file.
-- * p_encoding      Encoding used to zip the file.
--
-- EXAMPLE
--
--   See get_files.
--
--==============================================================================
function get_file_content (
    p_zipped_blob in blob,
    p_file_name   in varchar2,
    p_encoding    in varchar2 default null )
    return blob;
--
--==============================================================================
-- Adds a file to a zip file.
--
-- ARGUMENTS
-- * p_zipped_blob   BLOB which should contain the zip file.
-- * p_file_name     File name (including path) of the file which should be added.
-- * p_content       BLOB containing the file.
--
-- NOTE:
--
--   You have to call finish after all files have been added.
--
-- EXAMPLE
--
--   Example which reads multiple files from a table and puts it into a single
--   zip file.
--
--   declare
--       l_zip_file blob;
--   begin
--       for l_file in ( select file_name,
--                              file_content
--                         from my_files )
--       loop
--           apex_zip.add_file (
--               p_zipped_blob => l_zip_file,
--               p_file_name   => l_file.file_name,
--               p_content     => l_file.file_content );
--       end loop;
--
--       apex_zip.finish (
--           p_zipped_blob => l_zip_file );
--
--   end;
--
--==============================================================================
procedure add_file (
    p_zipped_blob in out nocopy blob,
    p_file_name   in     varchar2,
    p_content     in     blob );
--
--==============================================================================
-- Finishes the creating of a zip file after adding files with add_file.
--
-- ARGUMENTS
-- * p_zipped_blob   BLOB which should contain the zip file.
--
-- EXAMPLE
--
--   See add_file.
--
--==============================================================================
procedure finish (
    p_zipped_blob in out nocopy blob );
--
end wwv_flow_zip;
/
show errors

set define '^'
