set define '^'
set verify off
prompt ...wwv_htf


Rem  Copyright (c) Oracle Corporation 1999. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_htf.sql
Rem
Rem    DESCRIPTION
Rem      htf extensions
Rem
Rem    NOTES
Rem      Missing functionality in standard htp htf packages
Rem
Rem    SCRIPT ARGUMENTS
Rem      1:
Rem      2:
Rem      3:
Rem      4:
Rem      5:
Rem      6:
Rem      7:
Rem      8:
Rem      9:
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      webdb_20    08/23/1999 - Created
Rem      tmuth       03/10/2003 - Added formHidden function, updated other functions to be XHTML compliant
Rem      klrice      08/13/2003 - added formTextareaClose AND formTextareaOpen2
Rem      klrice      08/13/2003 - reformatted formTextareaClose AND formTextareaOpen2
Rem		 cbackstr    03/23/2006 - xhtml improvments
Rem      cbackstr	 03/27/2006 - xhtml improvments
Rem      cbackstr	 05/19/2006 - xhtml improvments (bug 5232351)
Rem		 cbackstr    07/10/2008 - created wwv_htf.formPassword for correct xhtml (Bug 7134251)
Rem      pawolf      03/06/2009 - added new functions fieldsetOpen and fieldsetClose, added parameter cclass to divOpen
Rem      pawolf      05/22/2009 - Added escape_sc_sql
Rem      pawolf      04/28/2010 - Bug# 9659998: Limit wwv_htf.escape_sc_sql to 3996 chars, otherwise a numeric value error is raised when used in a SQL statement
Rem      pawolf      10/13/2010 - Bug# 10150816: added escape_sc for CLOBs
Rem      arayner     06/07/2011 - Bug# 11775015: In support of this bug fix, added cattributes parameter to fieldsetOpen function
Rem      pawolf      03/02/2012 - Added novalidate to formOpen  
Rem      pawolf      03/02/2012 - Added nmaxlength to formTextareaOpen2 (feature# 842)

create or replace package wwv_htf is
/**
 *
 */
nbsp constant varchar2(6) := '&nbsp;';

/**
 * Encode special characters
 */
function url_encode
(
    ctext      in varchar2 DEFAULT NULL
)
return varchar2;
pragma restrict_references (url_encode, wnds, rnds, wnps, rnps ) ;

/**
 * Encode all characters of the string
 */
function url_encode2
(
    ctext      in varchar2 DEFAULT NULL
)
return varchar2;
pragma restrict_references (url_encode2, wnds, rnds, wnps, rnps ) ;

/**
 * Encode characters to a specific character set.
 */

function url_encode3(p_url_text varchar2,
                     p_escape_reserved varchar2,
                     p_charset varchar2) 
return varchar2;

/**
 * Same function as sys.htf.escape_sc but it limits the output to 3996 chars
 * so that it also works in a SQL statement without raising a numeric value error.
 */

function escape_sc_sql (
    p_text in varchar2 )
    return varchar2;

/**
 * Same function as sys.htf.escape_sc but for CLOBs.
 */

function escape_sc (
    p_text in clob )
    return clob;

/**
 * Return an opening HMTL table cell "TD" tag.
 */
function tableDataOpen
(
    calign      in varchar2 DEFAULT NULL,
    cdp         in varchar2 DEFAULT NULL,
    cnowrap     in varchar2 DEFAULT NULL,
    crowspan    in varchar2 DEFAULT NULL,
    ccolspan    in varchar2 DEFAULT NULL,
    cattributes in varchar2 DEFAULT NULL
)
return varchar2;


/**
 * Return a closing HMTL table cell "TD" tag.
 */
tableDataClose constant varchar2(5) := '</TD>';


/**
 * Return an opening HTML paragraph "P" tag.
 */
function paragraphOpen
(
    calign       in varchar2 DEFAULT NULL,
    cnowrap      in varchar2 DEFAULT NULL,
    cclear       in varchar2 DEFAULT NULL,
    cattributes  in varchar2 DEFAULT NULL
)
return varchar2;


/**
 * Return a closing HTML paragraph "P" tag.
 */
paragraphClose constant varchar2(4) := '</P>';


/**
 * Return an opening HTML division "DIV" tag.
 */
function divOpen
(
    calign      in varchar2 DEFAULT NULL,
    cattributes in varchar2 DEFAULT NULL,
    cclass      in varchar2 DEFAULT NULL
)
return varchar2;

/**
 * Return an opening HTML fieldset tag which can
 * contain the optional attributes id, class and
 * additional parameter for other attributes
 */
function fieldsetOpen
(
    cid         in varchar2 default null,
    cclass      in varchar2 default null,
    cattributes in varchar2 default null
)
return varchar2;

/**
 * Return a closing HTML fieldset tag.
 */
function fieldsetClose
return varchar2;

/**
 * Return a closing HTML division "DIV" tag.
 */
divClose constant varchar2(6) := '</DIV>';


/**
 * Return a form button "INPUT" HTML tag.
 */
function formButton
(
    cname in varchar2 DEFAULT NULL,
    cvalue in varchar2 DEFAULT NULL,
    cattributes in varchar2 DEFAULT NULL
)
return varchar2;


/**
 * Return an opening HMTL script "SCRIPT" tag.
 */
function scriptOpen
(
    clanguage in varchar2 DEFAULT 'JavaScript'
)
return varchar2;


/**
 * Return a closing HMTL script "SCRIPT" tag.
 */
function scriptClose return varchar2;


/**
 * Return an opening HMTL script "CENTER" tag.
 */
centerOpen constant varchar2(8) := '<center>';


/**
 * Return a closing HMTL script "CENTER" tag.
 */
centerClose constant varchar2(9) := '</center>';


/**
 * Return an opening HMTL script "LI" tag.
 */
function listitemopen
(
    cclear      in varchar2 default null,
    cdingbat    in varchar2 default null,
    csrc        in varchar2 default null,
    cattributes in varchar2 default null
)
return varchar2;


function formhidden(
    cname       in varchar2,
    cvalue      in varchar2 default null,
    cattributes in varchar2 default null
) return varchar2;

function formtextareaclose return varchar2;

function formtextareaopen2(
     cname       in varchar2,
     nrows       in integer,
     ncolumns    in integer,
     nmaxlength  in integer  default null,
     calign      in varchar2 default null,
     cwrap       in varchar2 default null,
     cattributes in varchar2 default null) 
  return varchar2;


/*htp overides for xhtml and 508*/

function tabledata (
	CVALUE      in varchar2 default null,
	CALIGN      in varchar2 default null,
	CDP         in varchar2 default null,
	CNOWRAP     in varchar2 default null,
	CROWSPAN    in varchar2 default null,
	CCOLSPAN    in varchar2 default null,
	CATTRIBUTES in varchar2 default null
 ) return varchar2;

function tablerowopen (
 CALIGN      in varchar2 default null,
 CVALIGN     in varchar2 default null,
 CDP         in varchar2 default null,
 CNOWRAP     in varchar2 default null,
 CATTRIBUTES in varchar2 default null
) return varchar2;


function tablerowclose return varchar2;



function tableheader (
 CVALUE      in varchar2 default null,
 CALIGN      in varchar2 default null,
 CDP         in varchar2 default null,
 CNOWRAP     in varchar2 default null,
 CROWSPAN    in varchar2 default null,
 CCOLSPAN    in varchar2 default null,
 CATTRIBUTES in varchar2 default null
 ) return varchar2;



function tableopen (
 CBORDER     in varchar2 default null,
 CALIGN      in varchar2 default null,
 CNOWRAP     in varchar2 default null,
 CCLEAR      in varchar2 default null,
 CATTRIBUTES in varchar2 default null

) return varchar2;

function tableclose return varchar2;

function img (
 CURL        in varchar2 default null,
 CALIGN      in varchar2 default null,
 CALT        in varchar2 default null,
 CISMAP      in varchar2 default null,
 CATTRIBUTES in varchar2 default null
) return varchar2;


function bodyopen (
 CBACKGROUND in varchar2 default null,
 CATTRIBUTES in varchar2 default null
) return varchar2;

function bodyClose return varchar2;

function htmlopen return varchar2;

function htmlClose return varchar2;

function formText (
cname in varchar2 DEFAULT NULL,
csize in varchar2 DEFAULT NULL,
cmaxlength in varchar2 DEFAULT NULL,
cvalue in varchar2 DEFAULT NULL,
cattributes in varchar2 DEFAULT NULL
) return varchar2;

function formPassword (
	cname in varchar2 DEFAULT NULL,
	csize in varchar2 DEFAULT NULL,
	cmaxlength in varchar2 DEFAULT NULL,
	cvalue in varchar2 DEFAULT NULL,
	cattributes in varchar2 DEFAULT NULL
) return varchar2;

function anchor(
curl in varchar2 DEFAULT NULL,
ctext in varchar2 DEFAULT NULL,
cname in varchar2 DEFAULT NULL,
cattributes in varchar2 DEFAULT NULL
)return varchar2;

function anchor2(
curl in varchar2 DEFAULT NULL,
ctext in varchar2 DEFAULT NULL,
cname in varchar2 DEFAULT NULL,
ctarget in varchar2 DEFAULT NULL,
cattributes in varchar2 DEFAULT NULL
)return varchar2;

function formOpen (
    curl        in varchar2 default null,
    cmethod     in varchar2 default null,
    ctarget     in varchar2 default null,
    cenctype    in varchar2 default null,
    cattributes in varchar2 default null,
    novalidate  in boolean  default true )
    return varchar2;

function formSelectOpen(
	cname in varchar2 DEFAULT NULL,
	cprompt in varchar2 DEFAULT NULL,
	nsize in integer DEFAULT NULL,
	cattributes in varchar2 DEFAULT NULL
)return varchar2;


function formSelectOption(	
	cvalue in varchar2 DEFAULT NULL,
	cselected in varchar2 DEFAULT NULL,
	cattributes in varchar2 DEFAULT NULL
)return varchar2;

function formSelectClose return varchar2;

function formSubmit(
   cname          in       varchar2   DEFAULT NULL,
   cvalue         in       varchar2   DEFAULT 'Submit',
   cattributes    in       varchar2   DEFAULT NULL
)return varchar2;

end wwv_htf;
/
show errors
