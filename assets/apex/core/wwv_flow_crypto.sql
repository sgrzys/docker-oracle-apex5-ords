set define '^' verify off
prompt ...wwv_flow_crypto
create or replace package wwv_flow_crypto as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001-2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_crypto.sql
--
--    DESCRIPTION
--      This package is resonsible for encryption, decryption and randomizing
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     tkyte    05/01/2001 - Created
--     sdillon  05/15/2001 - Added "oneway_hash" for a least common denominator where we are
--                           using 8.1.6 & 8.1.7, and we want to do diff things on diff versions.
--     cneumuel 03/03/2011 - Removed obsolete functions encryptString,
--                           decryptString, encryptRaw, decryptRaw, encryptLob, decryptLob
--     cneumuel 04/21/2011 - renamed from wwv_crypt to wwv_flow_crypto, added
--                           crypto funcs from package wwv_flow_security
--     cneumuel 10/15/2013 - removed md5lob, one_way_hash_raw, md5raw
--                         - added hash_raw
--     cneumuel 10/18/2013 - Added p_iv to aes_encrypt_hex and aes_decrypt_hex
--                         - moved hash_password from wwv_flow_security to wwv_flow_crypto
--     cneumuel 10/24/2013 - Added hash_raw for clob and blob
--     cneumuel 01/30/2015 - In hash%: default function to c_hash_default (bug #20384628)
--     cneumuel 02/03/2015 - Added mac_raw. In hash_password: added p_version (bug #20462973)
--                         - Removed md5str, one_way_hash_str: obsolete
--     cneumuel 02/09/2015 - Added get_current_password_version. pbkdf2 iterations are encoded in password version (bug #20462973)
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# ENCRYPTION / DECRYPTION
--#
--##############################################################################

--==============================================================================
-- encrypt p_src with key p_key and algorithm sys.DBMS_CRYPTO.AES_CBC_PKCS5
-- and return the converted value as hexadecimal
--==============================================================================
function aes_encrypt_hex (
    p_src in varchar2,
    p_key in raw,
    p_iv  in varchar2 default null )
    return varchar2;

--==============================================================================
-- decrypt the hexadecimal p_src with key p_key and algorithm
-- sys.DBMS_CRYPTO.AES_CBC_PKCS5 and return the converted value
--==============================================================================
function aes_decrypt_hex (
    p_src in varchar2,
    p_key in raw,
    p_iv  in varchar2 default null )
    return varchar2;

--##############################################################################
--#
--# HASHING
--#
--##############################################################################

--==============================================================================
-- supported hash function types
--==============================================================================
subtype t_hash_function is varchar2(10);
c_hash_md5   constant t_hash_function := 'MD5';
c_hash_sh1   constant t_hash_function := 'SH1';
-- sha-2 (only supported on 12c or later)
c_hash_sh256 constant t_hash_function := 'SH256';
c_hash_sh384 constant t_hash_function := 'SH384';
c_hash_sh512 constant t_hash_function := 'SH512';
$if sys.dbms_db_version.version >= 12 $then
c_hash_best constant t_hash_function := 'SH512';
$else
c_hash_best constant t_hash_function := 'SH1';
$end
c_hash_default constant t_hash_function := null;

--==============================================================================
-- return a one way hash string for a given input string/clob/blob
--
-- PARAMETERS
-- * p_src      string/clob/blob to be hashed
-- * p_function hash function type. note that the sha2 algorithms (c_hash_sh256,
--              c_hash_sh384, c_hash_sh512) are only supported on 12c or higher
--              and cause a runtime error on 11c
--
-- RAISES
-- * WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM
--==============================================================================
function hash_raw (
    p_src      in varchar2,
    p_function in t_hash_function default c_hash_default )
    return raw;
function hash_raw (
    p_src      in clob,
    p_function in t_hash_function default c_hash_default )
    return raw;
function hash_raw (
    p_src      in blob,
    p_function in t_hash_function default c_hash_default )
    return raw;

--==============================================================================
-- return a one way hash string for a given input string. the result can be
-- included in an uri, e.g. as checksum
--
-- PARAMETERS
-- * p_src      string to be hashed
-- * p_function hash function type. note that the sha2 algorithms (c_hash_sh256,
--              c_hash_sh384, c_hash_sh512) are only supported on 12c or higher
--              and cause a runtime error on 11c
--
-- RAISES
-- * WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM
--==============================================================================
function hash_for_uri (
    p_src      in varchar2,
    p_function in t_hash_function default c_hash_default )
    return varchar2;

--==============================================================================
function mac_raw (
    p_src      in raw,
    p_key      in raw,
    p_function in t_hash_function default c_hash_default )
    return raw;

--==============================================================================
-- return p_str encrypted with key p_key and converted from raw to a varchar2
-- that can be used as part of an uri
--==============================================================================
function mac_for_uri (
    p_src      in varchar2,
    p_key      in raw,
    p_function in t_hash_function default c_hash_default )
    return varchar2;

--==============================================================================
-- implementation of pbkdf2 password hashing algorithm.
--
-- PARAMETERS
-- * p_function     hash function to be used (MD5, SH1, SH256, ...)
-- * p_password     password to be hashed
-- * p_salt         salt to be used for hashing
-- * p_iterations   number of repetitive calls to the hash function
-- * p_result_bytes desired length of result in bytes. if null, use length of
--                  hash function result.
--
-- SEE ALSO
-- * https://en.wikipedia.org/wiki/PBKDF2
-- * PBKDF2 test vectors
--   http://tools.ietf.org/html/draft-josefsson-pbkdf2-test-vectors-06
--==============================================================================
function pbkdf2 (
    p_function     in t_hash_function,
    p_password     in raw,
    p_salt         in raw,
    p_iterations   in pls_integer,
    p_result_bytes in pls_integer )
    return raw;

--==============================================================================
-- return the current password version
--==============================================================================
function get_current_password_version
    return varchar2;

--==============================================================================
-- standard workspace user password hash function
--
-- PARAMETERS
-- * p_password          password to be hashed
-- * p_version           password algorithm version
-- * p_security_group_id workspace id (used for salting)
-- * p_user_name         user name (used for salting)
-- * p_user_id           user id (used for salting)
--==============================================================================
function hash_password (
    p_password          in varchar2,
    p_version           in varchar2,
    p_security_group_id in number,
    p_user_name         in varchar2,
    p_user_id           in number )
    return raw;

--##############################################################################
--#
--# RANDOM DATA
--#
--##############################################################################

--==============================================================================
-- return a random number
--==============================================================================
function randomnumber return number;

--==============================================================================
-- return a random byte sequence
--==============================================================================
function randombytes (
    p_numbytes in pls_integer )
    return raw;

end wwv_flow_crypto;
/
show errors
