set define '^' verify off
prompt ...wwv_flow_item
create or replace package wwv_flow_item as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001 - 2014. All Rights Reserved.
--
--    DESCRIPTION
--      API to generate flow f01... items for use with multi row forms and
--      other purposes.
--
--    SECURITY
--      Publicly executable.
--
--    NOTES
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--      mhichwa  03/02/2001 - Created
--      mhichwa  03/03/2001 - Added checkbox
--      sleuniss 03/24/2001 - Added date popup 
--      sleuniss 03/26/2001 - fixed data_popup for result sets with one row
--      mhichwa  04/17/2001 - Added get first rownum function
--      sleuniss 04/17/2001 - updated comments accordingly
--      mhichwa  05/17/2001 - Added select list
--      mhichwa  06/18/2001 - Enhanced documenation
--      mhichwa  10/10/2001 - Added select list from query
--      mhichwa  10/10/2001 - Added null options to select list functions
--      mhichwa  10/11/2001 - Added select list from lov
--      mhichwa  10/11/2001 - Added md5 checksum global
--      mhichwa  10/11/2001 - Added md5 checksum routines for lost update detection
--      cbcho    10/12/2001 - Added mru for multiple row update
--      cbcho    10/15/2001 - Added md5_checksum
--      cbcho    10/16/2001 - Added multi_row_update
--      mhichwa  10/17/2001 - Added comments
--      mhichwa  10/29/2001 - Added 2 arguments to checkbox
--      mhichwa  10/30/2001 - Added display and save (which is hidden and display the item)
--      mhichwa  03/04/2002 - Added textarea function
--      cbcho    07/16/2002 - Added g_f21..g_f50
--      cbcho    07/19/2002 - Added popup_from_lov and popup_from_query
--      cbcho    07/29/2002 - Added popupkey_from_query and popupkey_from_lov
--      cbcho    08/16/2002 - Added radiogroup
--      sspadafo 02/24/2003 - Added public wrapper functions for meta fetch_g_build_options_included/excluded (Bug 2748385)
--      tmuth    06/05/2003 - Changed every item to include 2 additional parameters: 1. p_item_id which sets the id of the item
--                            to the value passed in and 2. p_item_label which adds hidden labels to comly with section 508.
--                            Also cleaned up a lot of the HTML of the items.
--      sspadafo 06/19/2003 - Changed return types of select_list_from_query/select_list_from_lov to clob (Bug 3016573)
--      sspadafo 06/26/2003 - Restore return types of select_list_ functions to vc2 & add new functions returning clob (Bug 3016573)
--      jkallman 08/05/2003 - Added text_from_lov
--      msewtz   02/16/2004 - Added text_from_lov_query (bug 3253464)
--      msewtz   05/05/2004 - Added support for date values with different date format masks to multi row update
--      msewtz   05/05/2004 - added display_as argument to date_popup
--      msewtz   05/14/2004 - added multi row delete procedure to support row select + delete feature
--      msewtz   06/15/2004 - updated multi row update to support pk defaults
--      msewtz   06/17/2004 - added support for extra value in LOVs (bug 3659392)
--      mhichwa  11/29/2007 - added g_where_clause global to facilitate runtime_where_clause with mru
--      sspadafo 01/26/2008 - added g_query_hold declaration, related to bug 6707923
--      msewtz   02/13/2008 - updated hidden, added support for attributes, item ID and label for hidden columns (bug 6815558)
--      sathikum 01/29/2010 - Added date_popup2 for jQuery date picker
--      jkallman 02/11/2010 - Removed p_display_as from date_popup2
--      sathikum 02/12/2010 - Added additional attributes to date_popup2
--      msewtz   04/06/2010 - added form item ID to mru functions
--      sathikum 04/27/2010 - Added p_validation_date to date_popup2
--      sathikum 05/27/2010 - fixed #9751951 removed p_show_other_month from date_popup2, instead computing based on p_number_of_months
--      msewtz   05/27/2010 - added p_validation_date to date_popup (Bug 9664286)
--      msewtz   12/22/2010 - updated multi row update and mru to use wwv_flow.g_fcud to determine which rows to insert, which rows to update and which rows to delete (bug 10425000)
--      msewtz   04/28/2011 - Added support for label templates and before and after item HTML, and updated label processing for tabular form items
--      cneumuel 06/09/2011 - Removed g_query_hold, not necessary anymore because of wwv_flow_dynamic_exec
--      arayner  06/20/2011 - Bug# 11728071: In checkbox function, changed parameter p_checked_values_delimitor to be p_checked_values_delimiter
--      pawolf   06/20/2011 - Bug# 10376966: Swapped default values of p_rows and p_cols of textarea
--      cneumuel 07/08/2014 - Added t_protection_level (feature #1453)
--
--------------------------------------------------------------------------------

subtype t_protection_level is wwv_flow_step_items.protection_level%type;
c_protection_unrestricted  constant t_protection_level := 'N';
c_protection_app_checksum  constant t_protection_level := 'B';
c_protection_user_checksum constant t_protection_level := 'P';
c_protection_checksum      constant t_protection_level := 'S'; -- session checksum
c_protection_restricted    constant t_protection_level := 'I'; -- may not be set from browser

g_md5_checksum        varchar2(255) := null;
g_mru_count           number := 0;
g_mri_count           number := 0;
g_mrd_count           number := 0;
g_where_clause        varchar2(4000) := null;

function get_first_rownum 
    --
    -- 
    --
    return number
    ;

function checkbox (
    --
    -- Return an HTML form checkbox.  Allows you to select a checkbox form element from a query.
    --
    -- Arguments:
    --     p_idx                      = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                                  Typically the p_idx argument is constant for a given column.
    --     p_value                    = When checked return this value
    --     p_attributes               = Custom HTML arguments added to the HTML input type of checkbox.
    --     p_checked_values           = Colon (by default delimted list of values
    --     p_checked_values_delimiter = Defaults to a colon ":" and is used to pass multiple values in one string.
    --     p_item_id                  = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label               = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template           = Optional label template to be used instead of built-in one
    --     p_before_item              = HTML to be printed before the item lable and field
    --     p_after_item               = HTML to be printed after the item lable and field
    --
    -- example(s): 
    --     select wwv_flow_item.checkbox(1,empno) c from emp
    --     select wwv_flow_item.checkbox(1,empno,null,empno) c from emp
    --
    p_idx                      in number,
    p_value                    in varchar2 default null,
    p_attributes               in varchar2 default null,
    p_checked_values           in varchar2 default null,
    p_checked_values_delimiter in varchar2 default ':',
    p_item_id                  in varchar2 default null,
    p_item_label               in varchar2 default null,
    p_label_template           in varchar2 default null,
    p_before_item              in varchar2 default null,      
    p_after_item               in varchar2 default null        
) return varchar2;

function simple_checkbox (
    --
    -- Return an HTML form checkbox.  Allows to select a simplified checkbox element from a query.
    --
    -- Arguments:
    --     p_idx                      = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                                  Typically the p_idx argument is constant for a given column.
    --     p_value                    = The current value
    --     p_checked_value            = Value returned if checkbox checked
    --     p_checked_value            = Value returned if checkbox unchecked
    --     p_attributes               = Custom HTML arguments added to the HTML input type of checkbox.
    --     p_item_id                  = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label               = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template           = Optional label template to be used instead of built-in one
    --     p_before_item              = HTML to be printed before the item lable and field
    --     p_after_item               = HTML to be printed after the item lable and field
    --
    -- example(s): 
    --     select wwv_flow_item.checkbox(1,[column name], 'Y') c from [table name]
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_checked_value   in varchar2 default null,
    p_unchecked_value in varchar2 default null,
    p_attributes      in varchar2 default null,
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null      
) return varchar2;


function radiogroup (
    --
    -- Return an HTML form radiogroup.  Allows you to select a radiogroup form element from a query.
    --
    -- Arguments:
    --     p_idx                      = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                                  Typically the p_idx argument is constant for a given column.
    --     p_value                    = When selected return this value
    --     p_selected_value           = Default selected value
    --     p_display                  = Display text
    --     p_attributes               = Custom HTML arguments added to the HTML input type of radiogroup.
    --     p_item_id                  = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label               = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template           = Optional label template to be used instead of built-in one
    --     p_before_item              = HTML to be printed before the item lable and field
    --     p_after_item               = HTML to be printed after the item lable and field
    --
    -- example(s): 
    --     select wwv_flow_item.radiogroup(1,empno,'7839',ename) c from emp    
    --
    p_idx            in number,
    p_value          in varchar2 default null,
    p_selected_value in varchar2 default null,
    p_display        in varchar2 default null,
    p_attributes     in varchar2 default null,
    p_onBlur         in varchar2 default null,
    p_onChange       in varchar2 default null,
    p_onFocus        in varchar2 default null,
    p_item_id        in varchar2 default null,
    p_item_label     in varchar2 default null,
    p_label_template in varchar2 default null,
    p_before_item    in varchar2 default null,      
    p_after_item     in varchar2 default null      
) return varchar2;
    

function radio_group_from_static_lov (
    -- Generates an HTML radio group from static inputs.
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = The current value, the value should be one of the values in
    --                    the p_list_values aregument.
    --     p_list_values= A list of static values seperated by commas.  
    --                    Display values and return values are
    --                    seperated by semicolons.
    --                    to write back the selected date into the proper row.
    --                    format: display1;Return1,Display2;Return2...
    --     p_rows         number of rows for radio groups, default 1, i.e. all options shown on same row
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template           = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --     p_show_extra = show current value even if not part of LOV
    --
    -- example(s):
    --   select wwv_flow_item.select_list(1,'Y','Yes;Y,No;N') from emp
    --
    -- Notes:
    --   This procedure requires a flows environment thus is designed to
    --   be called from within a page region or page process.
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_list_values     in varchar2 default null,
    p_rows            in number   default 1,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'NO',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null     
) return varchar2;
    
    
function radio_group_from_query (
    -- Generates an HTML radio group with hidden fields from static inputs.
    -- 
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = The current value, the value should be one of the values in 
    --                    the p_list_values aregument.
    --     p_query      = A SQL SELECT statement in the format:
    --                    select display_value, return_value from ...
    --                    or
    --                    select display_and_return_value from ...
    --     p_rows         number of rows for radio groups, default 1, i.e. all options shown on same row
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.  
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe. --
    --     p_label_template           = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --     p_show_extra = show current value even if not part of LOV
    -- Example(s): 
    --   select wwv_flow_item.select_list(1,'Y','Yes;Y,No;N') from emp
    --
    -- Notes:
    --   This procedure requires a flows environment thus is designed to
    --   be called from within a page region or page process.
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_query           in varchar2,
    p_rows            in number   default 1,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'YES',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null
) return varchar2;    


function radio_group_from_lov (
    -- Generates an HTML radio group from a named LOV
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = The current value, the value should be one of the values in
    --                    the p_list_values aregument.
    --     p_lov        = named LOV used for this radio group
    --                    select display_and_return_value from ...
    --     p_rows         number of rows for radio groups, default 1, i.e. all options shown on same row
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --     p_show_extra = show current value even if not part of LOV
    --
    --
    -- Notes:
    --   This procedure requires a flows environment thus is designed to
    --   be called from within a page region or page process.
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_lov             in varchar2,
    p_rows            in number   default 1,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'YES',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null
) return varchar2;
    
    
function hidden (
    --
    -- Return an HTML form hidden value.  Hidden values will not show up on your dynamically
    -- generated HTML page however they will be passed to the wwv_flow.accept procedure.
    -- example: select wwv_flow_item.hidden(2,empno) from emp
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = Value of the hidden HTML form element.
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --    
    --
    -- example(s): 
    --     select wwv_flow_item.hidden(10,empno) c from emp
    --
    p_idx        in number,
    p_value      in varchar2 default null,
    p_attributes in varchar2 default null,
    p_item_id    in varchar2 default null,
    p_item_label in varchar2 default null
) return varchar2;


function display_and_save (
    --
    -- Return an HTML form hidden value and display the text. 
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = Value of the hidden HTML form element.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --
    -- example(s):
    --     select wwv_flow_item.display_and_save(10,empno) c from emp
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null      
) return varchar2;


function text (
    -- Generates an HTML input type of text.  Basically a single hight form field.
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = Text displayed in HTML input type equals text.
    --     p_size       = Width of text displayed on screen (HTML width attribute)
    --     p_maxLength  = Maximum width that your brower will let you type into the field
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --
    -- example(s): 
    --     select wwv_flow_item.text(1,ename) from emp
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_size            in number   default 20,
    p_maxLength       in number   default 2000,
    p_attributes      in varchar2 default null,
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null      
) return varchar2;


function textarea (
    -- Generates an HTML input type of text.  Basically a single hight form field.
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = Text displayed in HTML textarea.
    --     p_rows       = Height of the textarea (HTML rows attribute)
    --     p_cols       = Width of text displayed on screen (HTML cols attribute)
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --
    -- example(s):
    --     select wwv_flow_item.textarea(1,ename) from emp
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_rows            in number   default 4,
    p_cols            in number   default 40,
    p_attributes      in varchar2 default null,
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null      
) return varchar2;


function date_popup (
    -- Generates an HTML input type of text with an image that pops up date picker.
    -- 
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column. 
    --     p_row        = depricated   
    --     p_value      = Oracle date datatype.
    --     p_date_format= Oracle date format mask for alternate date displays, defaults to 'DD-MON-YYYY'.
    --     p_size       = Width of text displayed on screen (HTML width attribute)
    --     p_maxLength  = Maximum width that your brower will let you type into the field
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe. --
    --     p_validaiton_date = date value to be used in case of failed validations to re-render that value for the user to change
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    -- example(s): 
    --     select wwv_flow_item.date_popup(4, null,HIREDATE) "Date hired" from emp
    -- 
    p_idx             in number,
    p_row             in number default null,-- depricated
    p_value           in date default null,
    p_date_format     in varchar2 default 'DD-MON-YYYY',
    p_size            in number default 20,
    p_maxLength       in number default 2000,
    p_attributes      in varchar2 default null,
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_display_as      in varchar2 default null,
    p_validation_date in varchar2 default null,
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null
) return varchar2;


function date_popup2 (
    -- Generates an HTML input type of text with an image that pops up date picker.
    -- 
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column. 
    --     p_value      = Oracle date datatype.
    --     p_date_format= Oracle date format mask for alternate date displays, defaults to 'DD-MON-YYYY'.
    --     p_size       = Width of text displayed on screen (HTML width attribute)
    --     p_maxLength  = Maximum width that your brower will let you type into the field
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe. --
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --
    -- example(s): 
    --     select wwv_flow_item.date_popup(4, null,HIREDATE) "Date hired" from emp
    -- 
    p_idx                   in number,
    p_value                 in date     default null,
    p_date_format           in varchar2 default null,--'DD-MON-YYYY', not sure why earlier date_popup the format is defaulted
    p_size                  in number   default 20,
    p_maxLength             in number   default 2000,
    p_attributes            in varchar2 default null,
    p_item_id               in varchar2 default null,
    p_item_label            in varchar2 default null,
    p_default_value         in varchar2 default null,
    p_max_value             in varchar2 default null,
    p_min_value             in varchar2 default null,
    p_show_on               in varchar2 default 'button',
    p_number_of_months      in varchar2 default null,
    p_navigation_list_for   in varchar2 default 'NONE',
    p_year_range            in varchar2 default null,
    p_validation_date       in varchar2 default null,
    p_label_template        in varchar2 default null,
    p_before_item           in varchar2 default null,      
    p_after_item            in varchar2 default null
) return varchar2;
    
    
function select_list (
    -- Generates an HTML select list from static inputs.
    -- 
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = The current value, the value should be one of the values in 
    --                    the p_list_values aregument.
    --     p_list_values= A list of static values seperated by commas.  
    --                    Display values and return values are
    --                    seperated by semicolons.
    --                    to write back the selected date into the proper row.
    --                    format: display1;Return1,Display2;Return2...
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_show_extra = show current value even if not part of LOV
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    -- example(s): 
    --   select wwv_flow_item.select_list(1,'Y','Yes;Y,No;N') from emp
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_list_values     in varchar2 default null,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'NO',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null
) return varchar2;

    
function select_list_from_query (
    -- Generates an HTML select list from static inputs.
    -- 
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = The current value, the value should be one of the values in 
    --                    the p_list_values aregument.
    --     p_query      = A SQL SELECT statement in the format:
    --                    select display_value, return_value from ...
    --                    or
    --                    select display_and_return_value from ...
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.  
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe. --
    --     p_show_extra = show current value even if not part of LOV
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    -- Example(s): 
    --   select wwv_flow_item.select_list(1,'Y','Yes;Y,No;N') from emp
    --
    -- Notes:
    --   This procedure requires a flows environment thus is designed to
    --   be called from within a page region or page process.
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_query           in varchar2,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'YES',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,   
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null
) return varchar2;
    
    
function select_list_from_query_xl (
    --
    -- Same as select_list_from_query but returns clob
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_query           in varchar2,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'YES',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,   
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null
) return clob;
        
        
function popup_from_lov (
    --
    --  popup LOV from a named LOV
    --
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column. 
    --     p_value      = The current value, the value should be one of the values in 
    --                    the p_lov_name argument.
    --     p_lov_name   = named DYNAMIC LOV used for this popup
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_column_id  = tabular form column ID        
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    -- example(s): 
    --     select wwv_flow_item.popup_from_lov (1,deptno,'DEPT') dt from emp
    -- 
    p_idx               in number,
    p_value             in varchar2 default null,
    p_lov_name          in varchar2,
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'NO',
    p_show_null         in varchar2 default 'NO',
    p_null_value        in varchar2 default '%null%',
    p_null_text         in varchar2 default '%',     
    p_item_id           in varchar2 default null,
    p_item_label        in varchar2 default null,
    p_column_id         in number   default null,        
    p_label_template    in varchar2 default null,  
    p_before_item       in varchar2 default null,      
    p_after_item        in varchar2 default null    
) return varchar2;
    
    
function popup_from_query (
    --
    --  popup LOV from a query
    --
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = The current value, the value should be one of the values in 
    --                    the p_lov_query argument.
    --     p_lov_query  = LOV query used for this popup
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_column_id  = tabular form column ID    
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    -- example(s): 
    --     select wwv_flow_item.popup_from_query (1,deptno,'select dname, deptno from dept') dt from emp
    -- 
    p_idx               in number, 
    p_value             in varchar2 default null,   
    p_lov_query         in varchar2,    
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'NO',
    p_show_null         in varchar2 default 'NO',
    p_null_value        in varchar2 default '%null%',
    p_null_text         in varchar2 default '%',     
    p_item_id           in varchar2 default null,
    p_item_label        in varchar2 default null,
    p_column_id         in number   default null,    
    p_label_template    in varchar2 default null,  
    p_before_item       in varchar2 default null,      
    p_after_item        in varchar2 default null
) return varchar2;


function popupkey_from_lov (
    --
    --  popupkey LOV from a named LOV
    --
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column. 
    --                    Due to the behavior of popupkey the next index value should be p_idx + 1.
    -- example:
    --     select wwv_flow_item.popupkey_from_query (1,deptno,'select dname, deptno from dept') dt,
    --            wwv_flow_item.hidden(3,empno) eno
    --     from emp
    --
    --     p_value      = The current value, the value should be one of the values in 
    --                    the p_lov_name argument.
    --     p_lov_name   = named LOV used for this popup
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_column_id  = tabular form column ID
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    -- example(s): 
    --     select wwv_flow_item.popupkey_from_lov (1,deptno,'DEPT') dt from emp
    -- 
    p_idx               in number,
    p_value             in varchar2 default null,
    p_lov_name          in varchar2,
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'YES',
    p_show_null         in varchar2 default 'NO',
    p_null_value        in varchar2 default '%null%',
    p_null_text         in varchar2 default '%',     
    p_item_id           in varchar2 default null,
    p_item_label        in varchar2 default null,
    p_column_id         in number   default null,    
    p_label_template    in varchar2 default null,  
    p_before_item       in varchar2 default null,      
    p_after_item        in varchar2 default null      
) return varchar2;


function popupkey_from_query (
    --
    --  popupkey LOV from a query
    --
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --                    Due to the behavior of popupkey the next index value should be p_idx + 1.
    -- example:
    --     select wwv_flow_item.popupkey_from_query (1,deptno,'select dname, deptno from dept') dt,
    --            wwv_flow_item.hidden(3,empno) eno
    --     from emp
    --
    --     p_value      = The current value, the value should be one of the values in 
    --                    the p_lov_query argument.
    --     p_lov_query  = LOV query used for this popup
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_column_id  = tabular form column ID
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    -- example(s): 
    --     select wwv_flow_item.popupkey_from_query (1,deptno,'select dname, deptno from dept') dt from emp
    -- 
    p_idx               in number,
    p_value             in varchar2 default null,
    p_lov_query         in varchar2,
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'YES',
    p_show_null         in varchar2 default 'NO',
    p_null_value        in varchar2 default '%null%',
    p_null_text         in varchar2 default '%',     
    p_item_id           in varchar2 default null,
    p_item_label        in varchar2 default null,
    p_column_id         in number   default null,
    p_label_template    in varchar2 default null,  
    p_before_item       in varchar2 default null,      
    p_after_item        in varchar2 default null      
) return varchar2;
    
    
function select_list_from_lov (
    -- Generates an HTML select list from static inputs.
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_value      = The current value, the value should be one of the values in
    --                    the p_list_values aregument.
    --     p_query      = A SQL SELECT statement in the format:
    --                    select display_value, return_value from ...
    --                    or
    --                    select display_and_return_value from ...
    --     p_attributes = Extra HTML arguments you wish to add
    --     p_show_null  = Include an extra select option to allow the "null" selection.
    --                    Range of values is YES and NO
    --     p_null_value = The value to be returned when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_null_text  = The value to be displayed when a user selects the null option.
    --                    Only relevant when p_show_null is YES.
    --     p_item_id    = Will set the ID of the item to this value (id="...").  Must be unique!  Try concatenating some string with rownum.  Required for 508 compliance
    --     p_item_label = Creates an invisible label for an item.  Used for Section 508 Compliance.  Class is hideMeButHearMe.
    --     p_show_extra = show current value even if not part of LOV
    --     p_label_template = Optional label template to be used instead of built-in one
    --     p_before_item= HTML to be printed before the item lable and field
    --     p_after_item = HTML to be printed after the item lable and field
    --
    -- example(s):
    --   select wwv_flow_item.select_list(1,'Y','Yes;Y,No;N') from emp
    --
    -- Notes:
    --   This procedure requires a flows environment thus is designed to
    --   be called from within a page region or page process.
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_lov             in varchar2,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'YES',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,  
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null    
) return varchar2
    ;
    
function select_list_from_lov_xl (
    --
    -- Same as select_list_from_lov but returns clob
    --
    p_idx             in number,
    p_value           in varchar2 default null,
    p_lov             in varchar2,
    p_attributes      in varchar2 default null,
    p_show_null       in varchar2 default 'YES',
    p_null_value      in varchar2 default '%null%',
    p_null_text       in varchar2 default '%',
    p_item_id         in varchar2 default null,
    p_item_label      in varchar2 default null,
    p_show_extra      in varchar2 default 'YES',
    p_label_template  in varchar2 default null,
    p_before_item     in varchar2 default null,      
    p_after_item      in varchar2 default null
) return clob
    ;

function text_from_lov_query (
    p_value       in varchar2 default null,
    p_query       in varchar2,
    p_null_text   in varchar2 default '%')
    return varchar2;
    
    
function text_from_lov (
    --
    -- Display only based upon LOV
    --
    p_value       in varchar2 default null,
    p_lov         in varchar2,
    p_null_text   in varchar2 default '%')
    return varchar2;
        
function md5 (
    --
    -- example:
    --   select wwv_flow_item.md5(ename,job) from emp
    --
    p_value01    in varchar2 default null,
    p_value02    in varchar2 default null,
    p_value03    in varchar2 default null,
    p_value04    in varchar2 default null,
    p_value05    in varchar2 default null,
    p_value06    in varchar2 default null,
    p_value07    in varchar2 default null,
    p_value08    in varchar2 default null,
    p_value09    in varchar2 default null,
    p_value10    in varchar2 default null,
    p_value11    in varchar2 default null,
    p_value12    in varchar2 default null,
    p_value13    in varchar2 default null,
    p_value14    in varchar2 default null,
    p_value15    in varchar2 default null,
    p_value16    in varchar2 default null,
    p_value17    in varchar2 default null,
    p_value18    in varchar2 default null,
    p_value19    in varchar2 default null,
    p_value20    in varchar2 default null,    
    p_value21    in varchar2 default null,
    p_value22    in varchar2 default null,
    p_value23    in varchar2 default null,
    p_value24    in varchar2 default null,
    p_value25    in varchar2 default null,
    p_value26    in varchar2 default null,
    p_value27    in varchar2 default null,
    p_value28    in varchar2 default null,
    p_value29    in varchar2 default null,
    p_value30    in varchar2 default null,
    p_value31    in varchar2 default null,
    p_value32    in varchar2 default null,
    p_value33    in varchar2 default null,
    p_value34    in varchar2 default null,
    p_value35    in varchar2 default null,
    p_value36    in varchar2 default null,
    p_value37    in varchar2 default null,
    p_value38    in varchar2 default null,
    p_value39    in varchar2 default null,
    p_value40    in varchar2 default null,
    p_value41    in varchar2 default null,
    p_value42    in varchar2 default null,
    p_value43    in varchar2 default null,
    p_value44    in varchar2 default null,
    p_value45    in varchar2 default null,
    p_value46    in varchar2 default null,
    p_value47    in varchar2 default null,
    p_value48    in varchar2 default null,
    p_value49    in varchar2 default null,
    p_value50    in varchar2 default null,
    p_col_sep    in varchar2 default '|')
    return varchar2
    ;


function md5_checksum (    
    p_value01    in varchar2 default null,
    p_value02    in varchar2 default null,
    p_value03    in varchar2 default null,
    p_value04    in varchar2 default null,
    p_value05    in varchar2 default null,
    p_value06    in varchar2 default null,
    p_value07    in varchar2 default null,
    p_value08    in varchar2 default null,
    p_value09    in varchar2 default null,
    p_value10    in varchar2 default null,
    p_value11    in varchar2 default null,
    p_value12    in varchar2 default null,
    p_value13    in varchar2 default null,
    p_value14    in varchar2 default null,
    p_value15    in varchar2 default null,
    p_value16    in varchar2 default null,
    p_value17    in varchar2 default null,
    p_value18    in varchar2 default null,
    p_value19    in varchar2 default null,
    p_value20    in varchar2 default null,    
    p_value21    in varchar2 default null,
    p_value22    in varchar2 default null,
    p_value23    in varchar2 default null,
    p_value24    in varchar2 default null,
    p_value25    in varchar2 default null,
    p_value26    in varchar2 default null,
    p_value27    in varchar2 default null,
    p_value28    in varchar2 default null,
    p_value29    in varchar2 default null,
    p_value30    in varchar2 default null,
    p_value31    in varchar2 default null,
    p_value32    in varchar2 default null,
    p_value33    in varchar2 default null,
    p_value34    in varchar2 default null,
    p_value35    in varchar2 default null,
    p_value36    in varchar2 default null,
    p_value37    in varchar2 default null,
    p_value38    in varchar2 default null,
    p_value39    in varchar2 default null,
    p_value40    in varchar2 default null,
    p_value41    in varchar2 default null,
    p_value42    in varchar2 default null,
    p_value43    in varchar2 default null,
    p_value44    in varchar2 default null,
    p_value45    in varchar2 default null,
    p_value46    in varchar2 default null,
    p_value47    in varchar2 default null,
    p_value48    in varchar2 default null,
    p_value49    in varchar2 default null,
    p_value50    in varchar2 default null,    
    p_col_sep    in varchar2 default '|',
    p_item_id    in varchar2 default null)
    return varchar2;


function md5_hidden (
    --
    -- Return an HTML form hidden value.  Hidden values will not show up on your dynamically
    -- generated HTML page however they will be passed to the wwv_flow.accept procedure.
    --
    -- Arguments:
    --     p_idx        = The form element name, e.g. 1 equals f01, 2 equals f02, etc.
    --                    Typically the p_idx argument is constant for a given column.
    --     p_valueXX    = Value of the hidden HTML form element which will be md5 checksum encoded.
    --     p_item_id    = ID of the HTML form item
    --
    -- example(s):
    --     select wwv_flow_item.md5_hidden(10,empno,ename) c from emp
    --     select wwv_flow_item.md5_hidden(10,empno,ename,job,sal) c from emp
    --    
    --
    p_idx        in number,
    p_value01    in varchar2 default null,
    p_value02    in varchar2 default null,
    p_value03    in varchar2 default null,
    p_value04    in varchar2 default null,
    p_value05    in varchar2 default null,
    p_value06    in varchar2 default null,
    p_value07    in varchar2 default null,
    p_value08    in varchar2 default null,
    p_value09    in varchar2 default null,
    p_value10    in varchar2 default null,
    p_value11    in varchar2 default null,
    p_value12    in varchar2 default null,
    p_value13    in varchar2 default null,
    p_value14    in varchar2 default null,
    p_value15    in varchar2 default null,
    p_value16    in varchar2 default null,
    p_value17    in varchar2 default null,
    p_value18    in varchar2 default null,
    p_value19    in varchar2 default null,
    p_value20    in varchar2 default null,
    p_value21    in varchar2 default null,
    p_value22    in varchar2 default null,
    p_value23    in varchar2 default null,
    p_value24    in varchar2 default null,
    p_value25    in varchar2 default null,
    p_value26    in varchar2 default null,
    p_value27    in varchar2 default null,
    p_value28    in varchar2 default null,
    p_value29    in varchar2 default null,
    p_value30    in varchar2 default null,
    p_value31    in varchar2 default null,
    p_value32    in varchar2 default null,
    p_value33    in varchar2 default null,
    p_value34    in varchar2 default null,
    p_value35    in varchar2 default null,
    p_value36    in varchar2 default null,
    p_value37    in varchar2 default null,
    p_value38    in varchar2 default null,
    p_value39    in varchar2 default null,
    p_value40    in varchar2 default null,
    p_value41    in varchar2 default null,
    p_value42    in varchar2 default null,
    p_value43    in varchar2 default null,
    p_value44    in varchar2 default null,
    p_value45    in varchar2 default null,
    p_value46    in varchar2 default null,
    p_value47    in varchar2 default null,
    p_value48    in varchar2 default null,
    p_value49    in varchar2 default null,
    p_value50    in varchar2 default null, 
    p_col_sep    in varchar2 default '|',
    p_item_id    in varchar2 default null)
    return varchar2
    ;

procedure mru (
    --Multi Row Update (MRU)
    --  Perform updates to multiple rows of a single table given a primary key
    --  comprised of one or two columns.  Perform lost update detection via an
    --  md5 checksum.
    --
    --Arguments:
    --  p_table_owner      = The owner of the table. 
    --  p_table_name       = The name of the table.   
    --  p_pk_col           = The primary key column name. 
    --                       e.g. p_pk_col=>'empno'
    --  p_pk_col_src_type  = type of pk default (PL/SQL expression or function, NULL)
    --  p_pk_col_src       = pk default source
    --  p_pk_vals          = Array of primary key values. 
    --  p_pk_col2          = The secondary key column name.
    --                       e.g. p_pk_col2=>'deptno'    
    --  p_pk_col2_src_type = type of pk source (PL/SQL expression or function, NULL)
    --  p_pk_col2_src      = pk default source        
    --  p_pk_vals2         = Array of secondary key values.
    --  p_col_name01..50   = Column names you are trying to update.
    --                       e.g. p_col_name01=>'ename', p_col_name01=>'sal'                               
    --  p_col_vals01..50   = Array of column values for the corresponding column names.
    --                       For example, p_col_vals01 should have value of p_col_name01 column.
    --  p_md5_row_checksum = The current checksum of updating rows in array.           
    p_table_owner        in varchar2 default null,
    p_table_name         in varchar2 default null,    
    p_pk_col             in varchar2 default null,
    p_pk_col_src_type    in varchar2 default null,
    p_pk_col_src         in varchar2 default null,        
    p_pk_vals            in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_pk_col2            in varchar2 default null,                                  
    p_pk_col2_src_type   in varchar2 default null,
    p_pk_col2_src        in varchar2 default null,        
    p_pk_vals2           in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_name01         in varchar2 default null,
    p_col_name02         in varchar2 default null,
    p_col_name03         in varchar2 default null, 
    p_col_name04         in varchar2 default null, 
    p_col_name05         in varchar2 default null, 
    p_col_name06         in varchar2 default null, 
    p_col_name07         in varchar2 default null,     
    p_col_name08         in varchar2 default null,
    p_col_name09         in varchar2 default null,
    p_col_name10         in varchar2 default null,
    p_col_name11         in varchar2 default null,
    p_col_name12         in varchar2 default null,
    p_col_name13         in varchar2 default null,
    p_col_name14         in varchar2 default null,
    p_col_name15         in varchar2 default null,
    p_col_name16         in varchar2 default null,
    p_col_name17         in varchar2 default null,
    p_col_name18         in varchar2 default null,
    p_col_name19         in varchar2 default null,
    p_col_name20         in varchar2 default null, 
    p_col_name21         in varchar2 default null, 
    p_col_name22         in varchar2 default null, 
    p_col_name23         in varchar2 default null, 
    p_col_name24         in varchar2 default null, 
    p_col_name25         in varchar2 default null, 
    p_col_name26         in varchar2 default null, 
    p_col_name27         in varchar2 default null, 
    p_col_name28         in varchar2 default null, 
    p_col_name29         in varchar2 default null,
    p_col_name30         in varchar2 default null, 
    p_col_name31         in varchar2 default null,
    p_col_name32         in varchar2 default null,
    p_col_name33         in varchar2 default null,
    p_col_name34         in varchar2 default null,
    p_col_name35         in varchar2 default null,
    p_col_name36         in varchar2 default null,
    p_col_name37         in varchar2 default null,
    p_col_name38         in varchar2 default null,
    p_col_name39         in varchar2 default null,
    p_col_name40         in varchar2 default null,
    p_col_name41         in varchar2 default null,
    p_col_name42         in varchar2 default null,
    p_col_name43         in varchar2 default null,
    p_col_name44         in varchar2 default null,
    p_col_name45         in varchar2 default null,
    p_col_name46         in varchar2 default null,
    p_col_name47         in varchar2 default null,
    p_col_name48         in varchar2 default null,
    p_col_name49         in varchar2 default null,
    p_col_name50         in varchar2 default null,  
    p_col_mask01         in varchar2 default null,
    p_col_mask02         in varchar2 default null,
    p_col_mask03         in varchar2 default null, 
    p_col_mask04         in varchar2 default null, 
    p_col_mask05         in varchar2 default null, 
    p_col_mask06         in varchar2 default null, 
    p_col_mask07         in varchar2 default null,     
    p_col_mask08         in varchar2 default null,
    p_col_mask09         in varchar2 default null,
    p_col_mask10         in varchar2 default null,
    p_col_mask11         in varchar2 default null,
    p_col_mask12         in varchar2 default null,
    p_col_mask13         in varchar2 default null,
    p_col_mask14         in varchar2 default null,
    p_col_mask15         in varchar2 default null,
    p_col_mask16         in varchar2 default null,
    p_col_mask17         in varchar2 default null,
    p_col_mask18         in varchar2 default null,
    p_col_mask19         in varchar2 default null,
    p_col_mask20         in varchar2 default null, 
    p_col_mask21         in varchar2 default null, 
    p_col_mask22         in varchar2 default null, 
    p_col_mask23         in varchar2 default null, 
    p_col_mask24         in varchar2 default null, 
    p_col_mask25         in varchar2 default null, 
    p_col_mask26         in varchar2 default null, 
    p_col_mask27         in varchar2 default null, 
    p_col_mask28         in varchar2 default null, 
    p_col_mask29         in varchar2 default null,
    p_col_mask30         in varchar2 default null, 
    p_col_mask31         in varchar2 default null,
    p_col_mask32         in varchar2 default null,
    p_col_mask33         in varchar2 default null,
    p_col_mask34         in varchar2 default null,
    p_col_mask35         in varchar2 default null,
    p_col_mask36         in varchar2 default null,
    p_col_mask37         in varchar2 default null,
    p_col_mask38         in varchar2 default null,
    p_col_mask39         in varchar2 default null,
    p_col_mask40         in varchar2 default null,
    p_col_mask41         in varchar2 default null,
    p_col_mask42         in varchar2 default null,
    p_col_mask43         in varchar2 default null,
    p_col_mask44         in varchar2 default null,
    p_col_mask45         in varchar2 default null,
    p_col_mask46         in varchar2 default null,
    p_col_mask47         in varchar2 default null,
    p_col_mask48         in varchar2 default null,
    p_col_mask49         in varchar2 default null,
    p_col_mask50         in varchar2 default null,         
    p_col_vals01         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,    
    p_col_vals02         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,    
    p_col_vals03         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,    
    p_col_vals04         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,    
    p_col_vals05         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,    
    p_col_vals06         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,    
    p_col_vals07         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals08         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals09         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals10         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals11         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals12         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals13         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals14         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals15         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals16         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals17         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals18         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals19         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals20         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,    
    p_col_vals21         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals22         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals23         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals24         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals25         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals26         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals27         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals28         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals29         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals30         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals31         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals32         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals33         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals34         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals35         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals36         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals37         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals38         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals39         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals40         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals41         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals42         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals43         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals44         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals45         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals46         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals47         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals48         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals49         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_col_vals50         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_md5_row_checksum   in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_row_status         in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_error_display_location in varchar2 default null,
    p_error_region_id        in number   default null,
    p_process_error          in varchar2 default null     
    );


-- ------------------------------------------------------------------------------------------------------------

procedure multi_row_delete (
    --
    -- This procedure performs a multi row delete of a table or view.
    -- This procedure can be called using the following method:
    --
    --   Supply the ID of the region with the short MRU string
    --   OWNER:TABLE:PK_COLUMN1:PK_COLUMN2
    --
    p_mru_string             in varchar2 default null,
    p_region_id              in number   default null,
    p_error_display_location in varchar2 default null,
    p_process_error          in varchar2 default null     
);



-- ------------------------------------------------------------------------------------------------------------
    
procedure multi_row_update (
    --
    -- This procedure performs a multi row update of a table or view.
    -- This procedure can be called using two methods:
    --
    -- Method 1: (Complete P_MRU_STRING no region ID)
    --   Supply only a complete mru string.
    --   OWNER:TABLE:PK_COLUMN1,PK_IDX:PK_COLUMN2,PK_IDX2|COL,IDX:COL,IDX...
    --
    -- Method 2: (Short P_MRU_STRING and region ID)
    --   Supply the ID of the region with the short MRU string
    --   OWNER:TABLE:PK_COLUMN1:PK_COLUMN2
    --
    p_mru_string             in varchar2 default null,
    p_region_id              in number   default null,
    p_error_display_location in varchar2 default null,
    p_process_error          in varchar2 default null     
);
        
function fetch_g_build_options_included return varchar2
;

function fetch_g_build_options_excluded return varchar2
;

end wwv_flow_item;
/
show errors
