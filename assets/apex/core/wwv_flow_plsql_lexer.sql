set define '^' verify off
prompt ...wwv_flow_plsql_lexer.sql
create or replace package wwv_flow_plsql_lexer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      wwv_flow_plsql_lexer.sql
--
--    DESCRIPTION
--      Lexer for PL/SQL
--
--    EXAMPLE 1
--      wwv_flow_plsql_lexer.init('begin dbms_output.put_line(3); end;');
--      if     wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_begin
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_identifier
--         and wwv_flow_plsql_lexer.g_lexer.val = 'DBMS_OUTPUT'
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_dot
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_identifier
--         and wwv_flow_plsql_lexer.g_lexer.val = 'PUT_LINE'
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_open_brace
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_number
--         and wwv_flow_plsql_lexer.g_lexer.val = '3'
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_closed_brace
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_semicolon
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_end
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_semicolon
--         and wwv_flow_plsql_lexer.get         = wwv_flow_plsql_lexer.c_sy_eof
--      then
--          dbms_output.put_line('parsed statement');
--      else
--          dbms_output.put_line('parse error');
--      end if;
--
--    EXAMPLE 2
--      declare
--          l_sy wwv_flow_plsql_lexer.t_symbol;
--          l_execute boolean := false;
--      begin
--          wwv_flow_plsql_lexer.init('begin execute/*foo*/Immediate ''drop table x''; end;');
--          loop
--              l_sy := wwv_flow_plsql_lexer.get;
--              exit when l_sy = wwv_flow_plsql_lexer.c_sy_eof;
--              if l_execute and l_sy = wwv_flow_plsql_lexer.c_sy_immediate then
--                  raise_application_error(-20001, 'no execute immediate allowed');
--              else
--                  l_execute := l_sy = wwv_flow_plsql_lexer.c_sy_execute;
--              end if;
--          end loop;
--      end;
--
--    RNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    03/22/2013 - Created
--    cneumuel    04/02/2013 - In get: return c_sy_invalid_char for unexpected characters
--    cneumuel    04/03/2013 - Added c_sy_autonomous_transaction, is_identifier
--    cneumuel    08/14/2014 - Added c_sy_bind_variable
--    cneumuel    09/11/2014 - In get: comments lexing (c_sy_comments and t_lexer.comments)
--    cneumuel    10/23/2014 - Added c_sy_siblings
--    cneumuel    01/29/2015 - Added init(clob), val (bug #20205388)
--
--------------------------------------------------------------------------------

type t_lexer is record (
    reader   wwv_flow_char_reader.t,     -- input reader state
    pos      wwv_flow_char_reader.t_pos, -- position of current token
    val      varchar2(32767),            -- string representation of lex value
    comments wwv_flow_global.vc_arr2     -- representation for comments only
);
-- keywords are reserved pl/sql words, only they can be overridden by local
-- declarations, e.g.
--
--   declare
--     package number;
--   begin
--     package := 42;
--   end;
subtype t_symbol is binary_integer range 0 .. 502;
c_sy_eof             constant t_symbol := 0;
c_sy_invalid_char    constant t_symbol := 1;
c_sy_dot             constant t_symbol := 2; -- .
c_sy_comma           constant t_symbol := 3; -- ,
c_sy_semicolon       constant t_symbol := 4; -- ;
c_sy_percent         constant t_symbol := 5; -- %
c_sy_open_brace      constant t_symbol := 6; -- (
c_sy_closed_brace    constant t_symbol := 7; -- )
c_sy_equal           constant t_symbol := 8; -- =
c_sy_not_equal       constant t_symbol := 9; -- <> or !=
c_sy_plus            constant t_symbol := 10; -- +
c_sy_minus           constant t_symbol := 11; -- -
c_sy_times           constant t_symbol := 12; -- *
c_sy_divide          constant t_symbol := 13; -- /
c_sy_less            constant t_symbol := 14; -- <
c_sy_greater         constant t_symbol := 15; -- >
c_sy_less_eq         constant t_symbol := 16; -- <=
c_sy_greater_eq      constant t_symbol := 17; -- >=
c_sy_arrow           constant t_symbol := 18; -- =>
c_sy_concat          constant t_symbol := 19; -- ||
c_sy_dotdot          constant t_symbol := 20; -- ..
c_sy_label_start     constant t_symbol := 21; -- <<
c_sy_label_end       constant t_symbol := 22; -- >>
c_sy_assign          constant t_symbol := 23; -- :=
c_sy_colon           constant t_symbol := 24; -- :

c_sy_string          constant t_symbol := 97;
c_sy_number          constant t_symbol := 98;
c_sy_identifier      constant t_symbol := 99;
-- reserved words ----------------------------
c_sy_all             constant t_symbol := 100;
c_sy_alter           constant t_symbol := 101;
c_sy_and             constant t_symbol := 102;
c_sy_any             constant t_symbol := 103;
c_sy_as              constant t_symbol := 104;
c_sy_asc             constant t_symbol := 105;
c_sy_at              constant t_symbol := 106;
c_sy_begin           constant t_symbol := 107;
c_sy_between         constant t_symbol := 108;
c_sy_by              constant t_symbol := 109;
c_sy_case            constant t_symbol := 110;
c_sy_check           constant t_symbol := 111;
c_sy_clusters        constant t_symbol := 112;
c_sy_cluster         constant t_symbol := 113;
c_sy_colauth         constant t_symbol := 114;
c_sy_columns         constant t_symbol := 115;
c_sy_compress        constant t_symbol := 116;
c_sy_connect         constant t_symbol := 117;
c_sy_crash           constant t_symbol := 118;
c_sy_create          constant t_symbol := 119;
c_sy_cursor          constant t_symbol := 120;
c_sy_declare         constant t_symbol := 121;
c_sy_default         constant t_symbol := 122;
c_sy_desc            constant t_symbol := 123;
c_sy_distinct        constant t_symbol := 124;
c_sy_drop            constant t_symbol := 125;
c_sy_else            constant t_symbol := 126;
c_sy_end             constant t_symbol := 127;
c_sy_exception       constant t_symbol := 128;
c_sy_exclusive       constant t_symbol := 129;
c_sy_fetch           constant t_symbol := 130;
c_sy_for             constant t_symbol := 131;
c_sy_from            constant t_symbol := 132;
c_sy_function        constant t_symbol := 133;
c_sy_goto            constant t_symbol := 134;
c_sy_grant           constant t_symbol := 135;
c_sy_group           constant t_symbol := 136;
c_sy_having          constant t_symbol := 137;
c_sy_identified      constant t_symbol := 138;
c_sy_if              constant t_symbol := 139;
c_sy_in              constant t_symbol := 140;
c_sy_index           constant t_symbol := 141;
c_sy_indexes         constant t_symbol := 142;
c_sy_insert          constant t_symbol := 143;
c_sy_intersect       constant t_symbol := 144;
c_sy_into            constant t_symbol := 145;
c_sy_is              constant t_symbol := 146;
c_sy_like            constant t_symbol := 147;
c_sy_lock            constant t_symbol := 148;
c_sy_minus_ident     constant t_symbol := 149;
c_sy_mode            constant t_symbol := 150;
c_sy_nocompress      constant t_symbol := 151;
c_sy_not             constant t_symbol := 152;
c_sy_nowait          constant t_symbol := 153;
c_sy_null            constant t_symbol := 154;
c_sy_of              constant t_symbol := 155;
c_sy_on              constant t_symbol := 156;
c_sy_option          constant t_symbol := 157;
c_sy_or              constant t_symbol := 158;
c_sy_order           constant t_symbol := 159;
c_sy_overlaps        constant t_symbol := 160;
c_sy_procedure       constant t_symbol := 161;
c_sy_public          constant t_symbol := 162;
c_sy_resource        constant t_symbol := 163;
c_sy_revoke          constant t_symbol := 164;
c_sy_select          constant t_symbol := 165;
c_sy_share           constant t_symbol := 166;
c_sy_size            constant t_symbol := 167;
c_sy_sql             constant t_symbol := 168;
c_sy_start           constant t_symbol := 169;
c_sy_subtype         constant t_symbol := 170;
c_sy_tabauth         constant t_symbol := 171;
c_sy_table           constant t_symbol := 172;
c_sy_then            constant t_symbol := 173;
c_sy_to              constant t_symbol := 174;
c_sy_type            constant t_symbol := 175;
c_sy_union           constant t_symbol := 176;
c_sy_unique          constant t_symbol := 177;
c_sy_update          constant t_symbol := 178;
c_sy_values          constant t_symbol := 179;
c_sy_view            constant t_symbol := 180;
c_sy_views           constant t_symbol := 181;
c_sy_when            constant t_symbol := 182;
c_sy_where           constant t_symbol := 183;
c_sy_with            constant t_symbol := 184;
-- keywords ----------------------------------
c_sy_first_keyword   constant t_symbol := 200;
c_sy_a               constant t_symbol := 200;
c_sy_add             constant t_symbol := 201;
c_sy_agent           constant t_symbol := 202;
c_sy_aggregate       constant t_symbol := 203;
c_sy_array           constant t_symbol := 204;
c_sy_attribute       constant t_symbol := 205;
c_sy_authid          constant t_symbol := 206;
c_sy_avg             constant t_symbol := 207;
c_sy_bfile_base      constant t_symbol := 208;
c_sy_binary          constant t_symbol := 209;
c_sy_blob_base       constant t_symbol := 210;
c_sy_block           constant t_symbol := 211;
c_sy_body            constant t_symbol := 212;
c_sy_both            constant t_symbol := 213;
c_sy_bound           constant t_symbol := 214;
c_sy_bulk            constant t_symbol := 215;
c_sy_byte            constant t_symbol := 216;
c_sy_c               constant t_symbol := 217;
c_sy_call            constant t_symbol := 218;
c_sy_calling         constant t_symbol := 219;
c_sy_cascade         constant t_symbol := 220;
c_sy_char            constant t_symbol := 221;
c_sy_char_base       constant t_symbol := 222;
c_sy_character       constant t_symbol := 223;
c_sy_charset         constant t_symbol := 224;
c_sy_charsetform     constant t_symbol := 225;
c_sy_charsetid       constant t_symbol := 226;
c_sy_clob_base       constant t_symbol := 227;
c_sy_close           constant t_symbol := 228;
c_sy_collect         constant t_symbol := 229;
c_sy_comment         constant t_symbol := 230;
c_sy_commit          constant t_symbol := 231;
c_sy_committed       constant t_symbol := 232;
c_sy_compiled        constant t_symbol := 233;
c_sy_constant        constant t_symbol := 234;
c_sy_constructor     constant t_symbol := 235;
c_sy_context         constant t_symbol := 236;
c_sy_continue        constant t_symbol := 237;
c_sy_convert         constant t_symbol := 238;
c_sy_count           constant t_symbol := 239;
c_sy_current         constant t_symbol := 240;
c_sy_customdatum     constant t_symbol := 241;
c_sy_dangling        constant t_symbol := 242;
c_sy_data            constant t_symbol := 243;
c_sy_date            constant t_symbol := 244;
c_sy_date_base       constant t_symbol := 245;
c_sy_day             constant t_symbol := 246;
c_sy_define          constant t_symbol := 247;
c_sy_delete          constant t_symbol := 248;
c_sy_deterministic   constant t_symbol := 249;
c_sy_double          constant t_symbol := 250;
c_sy_duration        constant t_symbol := 251;
c_sy_element         constant t_symbol := 252;
c_sy_elsif           constant t_symbol := 253;
c_sy_empty           constant t_symbol := 254;
c_sy_escape          constant t_symbol := 255;
c_sy_except          constant t_symbol := 256;
c_sy_exceptions      constant t_symbol := 257;
c_sy_execute         constant t_symbol := 258;
c_sy_exists          constant t_symbol := 259;
c_sy_exit            constant t_symbol := 260;
c_sy_external        constant t_symbol := 261;
c_sy_final           constant t_symbol := 262;
c_sy_fixed           constant t_symbol := 263;
c_sy_float           constant t_symbol := 264;
c_sy_forall          constant t_symbol := 265;
c_sy_force           constant t_symbol := 266;
c_sy_general         constant t_symbol := 267;
c_sy_hash            constant t_symbol := 268;
c_sy_heap            constant t_symbol := 269;
c_sy_hidden          constant t_symbol := 270;
c_sy_hour            constant t_symbol := 271;
c_sy_immediate       constant t_symbol := 272;
c_sy_including       constant t_symbol := 273;
c_sy_indicator       constant t_symbol := 274;
c_sy_indices         constant t_symbol := 275;
c_sy_infinite        constant t_symbol := 276;
c_sy_instantiable    constant t_symbol := 277;
c_sy_int             constant t_symbol := 278;
c_sy_interface       constant t_symbol := 279;
c_sy_interval        constant t_symbol := 280;
c_sy_invalidate      constant t_symbol := 281;
c_sy_isolation       constant t_symbol := 282;
c_sy_java            constant t_symbol := 283;
c_sy_language        constant t_symbol := 284;
c_sy_large           constant t_symbol := 285;
c_sy_leading         constant t_symbol := 286;
c_sy_length          constant t_symbol := 287;
c_sy_level           constant t_symbol := 288;
c_sy_library         constant t_symbol := 289;
c_sy_like2           constant t_symbol := 290;
c_sy_like4           constant t_symbol := 291;
c_sy_likec           constant t_symbol := 292;
c_sy_limit           constant t_symbol := 293;
c_sy_limited         constant t_symbol := 294;
c_sy_local           constant t_symbol := 295;
c_sy_long            constant t_symbol := 296;
c_sy_loop            constant t_symbol := 297;
c_sy_map             constant t_symbol := 298;
c_sy_max             constant t_symbol := 299;
c_sy_maxlen          constant t_symbol := 300;
c_sy_member          constant t_symbol := 301;
c_sy_merge           constant t_symbol := 302;
c_sy_min             constant t_symbol := 303;
c_sy_minute          constant t_symbol := 304;
c_sy_mod             constant t_symbol := 305;
c_sy_modify          constant t_symbol := 306;
c_sy_month           constant t_symbol := 307;
c_sy_multiset        constant t_symbol := 308;
c_sy_name            constant t_symbol := 309;
c_sy_nan             constant t_symbol := 310;
c_sy_national        constant t_symbol := 311;
c_sy_native          constant t_symbol := 312;
c_sy_nchar           constant t_symbol := 313;
c_sy_new             constant t_symbol := 314;
c_sy_nocopy          constant t_symbol := 315;
c_sy_number_base     constant t_symbol := 316;
c_sy_object          constant t_symbol := 317;
c_sy_ocicoll         constant t_symbol := 318;
c_sy_ocidate         constant t_symbol := 319;
c_sy_ocidatetime     constant t_symbol := 320;
c_sy_ociduration     constant t_symbol := 321;
c_sy_ociinterval     constant t_symbol := 322;
c_sy_ociloblocator   constant t_symbol := 323;
c_sy_ocinumber       constant t_symbol := 324;
c_sy_ociraw          constant t_symbol := 325;
c_sy_ociref          constant t_symbol := 326;
c_sy_ocirefcursor    constant t_symbol := 327;
c_sy_ocirowid        constant t_symbol := 328;
c_sy_ocistring       constant t_symbol := 329;
c_sy_ocitype         constant t_symbol := 330;
c_sy_old             constant t_symbol := 331;
c_sy_only            constant t_symbol := 332;
c_sy_opaque          constant t_symbol := 333;
c_sy_open            constant t_symbol := 334;
c_sy_operator        constant t_symbol := 335;
c_sy_oracle          constant t_symbol := 336;
c_sy_oradata         constant t_symbol := 337;
c_sy_organization    constant t_symbol := 338;
c_sy_orlany          constant t_symbol := 339;
c_sy_orlvary         constant t_symbol := 340;
c_sy_others          constant t_symbol := 341;
c_sy_out             constant t_symbol := 342;
c_sy_overriding      constant t_symbol := 343;
c_sy_package         constant t_symbol := 344;
c_sy_parallel_enable constant t_symbol := 345;
c_sy_parameter       constant t_symbol := 346;
c_sy_parameters      constant t_symbol := 347;
c_sy_parent          constant t_symbol := 348;
c_sy_partition       constant t_symbol := 349;
c_sy_pascal          constant t_symbol := 350;
c_sy_pipe            constant t_symbol := 351;
c_sy_pipelined       constant t_symbol := 352;
c_sy_pragma          constant t_symbol := 353;
c_sy_precision       constant t_symbol := 354;
c_sy_prior           constant t_symbol := 355;
c_sy_private         constant t_symbol := 356;
c_sy_raise           constant t_symbol := 357;
c_sy_range           constant t_symbol := 358;
c_sy_raw             constant t_symbol := 359;
c_sy_read            constant t_symbol := 360;
c_sy_record          constant t_symbol := 361;
c_sy_ref             constant t_symbol := 362;
c_sy_reference       constant t_symbol := 363;
c_sy_relies_on       constant t_symbol := 364;
c_sy_rem             constant t_symbol := 365;
c_sy_remainder       constant t_symbol := 366;
c_sy_rename          constant t_symbol := 367;
c_sy_result          constant t_symbol := 368;
c_sy_result_cache    constant t_symbol := 369;
c_sy_return          constant t_symbol := 370;
c_sy_returning       constant t_symbol := 371;
c_sy_reverse         constant t_symbol := 372;
c_sy_rollback        constant t_symbol := 373;
c_sy_row             constant t_symbol := 374;
c_sy_sample          constant t_symbol := 375;
c_sy_save            constant t_symbol := 376;
c_sy_savepoint       constant t_symbol := 377;
c_sy_sb1             constant t_symbol := 378;
c_sy_sb2             constant t_symbol := 379;
c_sy_sb4             constant t_symbol := 380;
c_sy_second          constant t_symbol := 381;
c_sy_segment         constant t_symbol := 382;
c_sy_self            constant t_symbol := 383;
c_sy_separate        constant t_symbol := 384;
c_sy_sequence        constant t_symbol := 385;
c_sy_serializable    constant t_symbol := 386;
c_sy_set             constant t_symbol := 387;
c_sy_short           constant t_symbol := 388;
c_sy_siblings        constant t_symbol := 389;
c_sy_size_t          constant t_symbol := 390;
c_sy_some            constant t_symbol := 391;
c_sy_sparse          constant t_symbol := 392;
c_sy_sqlcode         constant t_symbol := 393;
c_sy_sqldata         constant t_symbol := 394;
c_sy_sqlname         constant t_symbol := 395;
c_sy_sqlstate        constant t_symbol := 396;
c_sy_standard        constant t_symbol := 397;
c_sy_static          constant t_symbol := 398;
c_sy_stddev          constant t_symbol := 399;
c_sy_stored          constant t_symbol := 400;
c_sy_string_ident    constant t_symbol := 401;
c_sy_struct          constant t_symbol := 402;
c_sy_style           constant t_symbol := 403;
c_sy_submultiset     constant t_symbol := 404;
c_sy_subpartition    constant t_symbol := 405;
c_sy_substitutable   constant t_symbol := 406;
c_sy_sum             constant t_symbol := 407;
c_sy_synonym         constant t_symbol := 408;
c_sy_tdo             constant t_symbol := 409;
c_sy_the             constant t_symbol := 410;
c_sy_time            constant t_symbol := 411;
c_sy_timestamp       constant t_symbol := 412;
c_sy_timezone_abbr   constant t_symbol := 413;
c_sy_timezone_hour   constant t_symbol := 414;
c_sy_timezone_minute constant t_symbol := 415;
c_sy_timezone_region constant t_symbol := 416;
c_sy_trailing        constant t_symbol := 417;
c_sy_transaction     constant t_symbol := 418;
c_sy_transactional   constant t_symbol := 419;
c_sy_trusted         constant t_symbol := 420;
c_sy_ub1             constant t_symbol := 421;
c_sy_ub2             constant t_symbol := 422;
c_sy_ub4             constant t_symbol := 423;
c_sy_under           constant t_symbol := 424;
c_sy_unsigned        constant t_symbol := 425;
c_sy_untrusted       constant t_symbol := 426;
c_sy_use             constant t_symbol := 427;
c_sy_using           constant t_symbol := 428;
c_sy_valist          constant t_symbol := 429;
c_sy_value           constant t_symbol := 430;
c_sy_variable        constant t_symbol := 431;
c_sy_variance        constant t_symbol := 432;
c_sy_varray          constant t_symbol := 433;
c_sy_varying         constant t_symbol := 434;
c_sy_void            constant t_symbol := 435;
c_sy_while           constant t_symbol := 436;
c_sy_work            constant t_symbol := 437;
c_sy_wrapped         constant t_symbol := 438;
c_sy_write           constant t_symbol := 439;
c_sy_year            constant t_symbol := 440;
c_sy_zone            constant t_symbol := 441;
-- "not really" keywords
c_sy_autonomous_transaction constant t_symbol := 500;
c_sy_bind_variable          constant t_symbol := 501;
c_sy_comments               constant t_symbol := 502;

--==============================================================================
-- lexer state
--==============================================================================
g_lexer t_lexer;

--==============================================================================
-- initialize the lexer
--==============================================================================
procedure init (
    p_code in varchar2 );
procedure init (
    p_code in clob );

--==============================================================================
-- get next symbol
--
-- ARGUMENTS
-- * p_comments  if true, return comments as c_sy_comments symbol. otherwise,
--               ignore comments
--==============================================================================
function get (
    p_comments in boolean default false )
    return t_symbol;

--==============================================================================
-- get next sumbol value
--==============================================================================
function val
    return varchar2;

--==============================================================================
-- return whether a given symbol can be used as an identifier. keywords can be
-- overloaded, as in
--
-- declare
--     subtype immediate is number;
--     execute immediate;
-- begin
--     execute := 42;
-- end;
--==============================================================================
function is_identifier (
    p_symbol in t_symbol )
    return boolean;

end wwv_flow_plsql_lexer;
/
show err

