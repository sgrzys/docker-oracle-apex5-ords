set define '^' verify off
prompt wwv_render_report3.sql
create or replace package wwv_render_report3 as
--------------------------------------------------------------------------------
--
--    SCRIPT ARGUMENTS
--      1:
--      2:
--     3: Flow Schema Owner
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      msewtz   07/24/2002 - Created
--      msewtz   09/27/2002 - Added template support for pagination
--      msewtz   10/08/2002 - Added support for pagination display position
--      msewtz   10/28/2002 - Removed show_total_row_count (handled by pagination settings now)
--      msewtz   10/28/2002 - Removed plug_query_options, plug_ignore_pagination, plug_query_table_border attributes
--      msewtz   11/05/2002 - Removed UI defaults defined in page templates from reports engine
--      msewtz   12/05/2002 - Added report export formats CSV and XML
--      msewtz   02/24/2003 - bug 2811609: added pagination position flag to get_pagination_row, used to hide JavaScript when not needed (pagination only below report)
--      msewtz   03/14/2003 - Added is_valid_query function (bug 2852334,2852344,2851749 )
--      msewtz   03/20/2003 - Added support for plug_query_hit_highlighting (bug 2860378)
--      msewtz   04/28/2003 - added support for wwv_flow_report_region_column table
--      msewtz   05/20/2003 - added update_report_columns
--      msewtz   05/23/2003 - added comments to show list of parameters
--      msewtz   05/27/2003 - moved globals to from package body to package spec
--      msewtz   05/27/2003 - added set_legacy_col_attributes to spec
--      msewtz   06/04/2003 - updated show so that columns with hidden form elements will no longer be shown
--      msewtz   06/06/2003 - added support for column_required_role
--      msewtz   06/16/2003 - added support for wizard to is_valid_query (made region_id optional and added owner attribute)
--      msewtz   06/16/2003 - added get_dbms_sql_cursor to package spec (bug 3007663)
--      msewtz   07/27/2003 - added p_required_col_num to is_valid_query (bug 3013191)
--      msewtz   08/05/2003 - Increased number of generic columns to 60 using global g_max_cols (bug 3026458)
--      msewtz   02/24/2004 - fixed handling of conditions and authorization schemes for tabular form columns (bug 3197598)
--      msewtz   04/22/2004 - Added g_is_xml_export to support XML/PDF printing processes (Feature: Printable PDF output of any report region)
--      msewtz   05/14/2004 - added checkbox functionality to support row select + delete feature
--      msewtz   06/15/2004 - cleaned up show procedure, removed attributes that were no longer required
--      msewtz   06/18/2004 - added support for user defined separators and enclosed-by characters for csv export
--      msewtz   06/23/2004 - added column defaults used when inserting new rows
--      msewtz   06/25/2004 - modified update_report, fixed removing and adding columns to SQL query for tabular forms
--      msewtz   07/06/2004 - made get_since public
--      msewtz   07/08/2004 - added support for column link attributes
--      msewtz   07/14/2004 - added support for display extra value for select lists
--      msewtz   07/14/2004 - added support for optionally stripping HTML out of HTML expressions and column links
--      msewtz   02/04/2005 - added p_print_url_label to show procedure
--      msewtz   02/23/2005 - added support for column_link_checksum_type
--      msewtz   05/06/2005 - added support for variable number of generic columns
--      msewtz   03/05/2007 - Added support for FO XSL
--      msewtz   03/07/2007 - added support for column heading alignment when print reports (bug 5921210)
--      mhichwa  12/03/2007 - Added to before_column_heading and after_column_heading to set_template
--      mhichwa  12/03/2007 - Extended procedure set_template with p_before_column_heading and p_after_column_heading
--      cbackstr 12/04/2007 - Added the functionality to make AJAX pagination and Sorting a report attribute.
--      msewtz   12/09/2007 - Added p_print_server to show
--      msewtz   12/20/2007 - Added support for report_attributes_substitution column
--      msewtz   01/24/2008 - Removed get_dbms_sql_cursor from package spec (bug 6707530)
--      jkallman 08/03/2009 - Added function get_since_tswltz
--      jkallman 08/14/2009 - Modified get_since to accept p_sysdate parameter
--      msewtz   09/17/2009 - Removed get_rmu_info, this functin is not called from outside reports3
--      jkallman 03/01/2010 - Added get_since_tswtz
--      jkallman 03/18/2010 - Added p_plug_query_parse_override to show
--      msewtz   05/06/2010 - Added p_render_full_page to show, this is used to print certain content only when full page is rendered
--      msewtz   05/20/2010 - updated activate_sort_columns and add_derived_columns to correctly index global column arrays for reports and tabular forms with altered display seqeuence (bug 9234750)
--      msewtz   07/21/2010 - Added g_column_alias_by_query_pos (bug 9879227)
--      pawolf   12/14/2010 - Added attribute_11 - attribute_15 to all tables supporting plug-ins (feature# 572)
--      msewtz   01/19/2011 - Updated formatting of XSL template
--      pawolf   04/07/2011 - Added "Page Items to Submit" (ajax_items_to_submit) support for regions (eg. Classic Report) (feature #505)
--      pawolf   03/06/2012 - Added css classes support for report columns (feature# 815)
--      msewtz   03/16/2012 - Removed show_preview
--      arayner  05/04/2012 - Added ajax procedure to handle all PPR request (Dynamic action refresh, sorting and pagination) (feature #599)
--      cneumuel 10/09/2013 - In highlight_value: case insensitive highlighting
--      cneumuel 12/04/2013 - code cleanup
--      cneumuel 12/06/2013 - Moved ajax to wwv_flow_region_native.ajax_classic_report (feature #1312)
--      msewtz   02/17/2013 - Added p_region_sub_css_classes to show procedure (feature 1383)
--      msewtz   02/20/2015 - Added tabular form item CSS classes (feature 1696)
--      shrahman 02/22/2015 - Updated tabular form item class prefix
--      cneumuel 07/28/2015 - In empty_vc_arr: change to constant to silence zsqi (bug #21382669)
--
--------------------------------------------------------------------------------

  type totals_table is table of wwv_flow_global.n_arr index by binary_integer;
  type col_names_index_type is table of number index by varchar2(4000);

  type row_template_type is record (
    template                    varchar2(32767),
    type                        varchar2(32767),
    before_rows                 varchar2(32767),
    after_rows                  varchar2(32767),
    before_first                varchar2(32767),
    after_last                  varchar2(32767),
    tab_attr                    varchar2(32767),
    row_style_mouse_over        varchar2(255),
    row_style_mouse_out         varchar2(255),
    row_style_checked           varchar2(255),
    row_style_unchecked         varchar2(255),
    pagination                  varchar2(32767),
    pagination_template         varchar2(32767),
    next_page_template          varchar2(32767),
    previous_page_template      varchar2(32767),
    next_set_template           varchar2(32767),
    previous_set_template       varchar2(32767),
    report_total_text_format    varchar2(32767),
    break_column_text_format    varchar2(32767),
    break_before_row            varchar2(32767),
    break_generic_column        varchar2(32767),
    break_after_row             varchar2(32767),
    break_type_flag             varchar2(255),
    break_repeat_heading_format varchar2(32767)
  );

--==============================================================================
-- public globals
--==============================================================================
  g_num_rows                      number;          -- number of rows returned
  g_total_rows                    number;          -- number of rows returned
  g_internet_pagination           varchar2(32767);
  g_row_ranges                    varchar2(32767);
  g_row_ranges_in_select_list     varchar2(32767);

  g_show_total_row_count_max      number := 1000;  -- max number when count the query's rows

  empty_vc_arr                    constant wwv_flow_global.vc_arr2 := cast(null as wwv_flow_global.vc_arr2);
  g_column_format                 wwv_flow_global.vc_arr2;
  g_column_alias                  wwv_flow_global.vc_arr2;
  g_column_heading                wwv_flow_global.vc_arr2;
  g_column_hit_highlight          wwv_flow_global.vc_arr2;
  g_column_link                   wwv_flow_global.vc_arr2;
  g_column_linktext               wwv_flow_global.vc_arr2;
  g_column_alignment              wwv_flow_global.vc_arr2;
  g_heading_alignment             wwv_flow_global.vc_arr2;
  g_default_sort_column_sequence  wwv_flow_global.vc_arr2;
  g_default_sort_dir              wwv_flow_global.vc_arr2;
  g_disable_sort_column           wwv_flow_global.vc_arr2;
  g_sum_column                    wwv_flow_global.vc_arr2;
  g_hidden_column                 wwv_flow_global.vc_arr2;
  
  g_is_tabular_form               boolean := false;

  g_use_generic_columns           boolean := false;

  g_css_tab_form_item             varchar2(255) := 'u-TF-item u-TF-item-';

--------------------------------------------------------------------------------------------------------------
-- generic XSL-FO definition

  g_prn_template_table_cell_fop  varchar2(32767) := '                     <fo:table-column column-width="#COLUMN_WIDTH#pt"/>
';

  g_prn_template_header_col_fop  varchar2(32767) := '                           <fo:table-cell xsl:use-attribute-sets="cell header-color border">
                               <fo:block xsl:use-attribute-sets="text #TEXT_ALIGN#">
                                   <fo:inline xsl:use-attribute-sets="header-font">#COLUMN_HEADING#</fo:inline>
                               </fo:block>
                           </fo:table-cell>
';


  g_prn_template_body_col_fop    varchar2(32767) :='                              <fo:table-cell xsl:use-attribute-sets="cell border">
                                  <fo:block xsl:use-attribute-sets="text #TEXT_ALIGN#">
                                      <fo:inline xsl:use-attribute-sets="body-font">
                                          <xsl:value-of select=".//#COLUMN_HEADER_NAME#"/>
                                      </fo:inline>
                                  </fo:block>
                              </fo:table-cell>
';


  g_prn_template_fop             varchar2(32767) := '<?xml version = ''1.0'' encoding = ''utf-8''?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xlink="http://www.w3.org/1999/xlink">
   <xsl:variable name="_XDOFOPOS" select="''''"/>
   <xsl:variable name="_XDOFOPOS2" select="number(1)"/>
   <xsl:variable name="_XDOFOTOTAL" select="number(1)"/>
   <xsl:variable name="_XDOFOOSTOTAL" select="number(0)"/>
   <xsl:attribute-set name="padding">
      <xsl:attribute name="padding-bottom">0.25pt</xsl:attribute>
      <xsl:attribute name="padding-top">0.25pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text">
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="orphans">2</xsl:attribute>
      <xsl:attribute name="start-indent">0.0pt</xsl:attribute>
      <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
      <xsl:attribute name="padding-top">0.0pt</xsl:attribute>
      <xsl:attribute name="end-indent">0.0pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0.0pt</xsl:attribute>
      <xsl:attribute name="height">0.0pt</xsl:attribute>
      <xsl:attribute name="widows">2</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="align-left">
      <xsl:attribute name="text-align">left</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="align-center">
      <xsl:attribute name="text-align">center</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="align-right">
      <xsl:attribute name="text-align">right</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="footer">
      <xsl:attribute name="text-align">right</xsl:attribute>
      <xsl:attribute name="start-indent">5.4pt</xsl:attribute>
      <xsl:attribute name="end-indent">5.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text_2">
      <xsl:attribute name="start-indent">5.4pt</xsl:attribute>
      <xsl:attribute name="end-indent">23.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text_20">
      <xsl:attribute name="height">13.872pt</xsl:attribute>
      <xsl:attribute name="end-indent">5.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="text_0">
      <xsl:attribute name="end-indent">5.4pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="page-header">
      <xsl:attribute name="color">#PAGE_HEADER_FONT_COLOR#</xsl:attribute>
      <xsl:attribute name="font-family">#PAGE_HEADER_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#PAGE_HEADER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#PAGE_HEADER_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="page-footer">
      <xsl:attribute name="color">#PAGE_FOOTER_FONT_COLOR#</xsl:attribute>
      <xsl:attribute name="font-family">#PAGE_FOOTER_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#PAGE_FOOTER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#PAGE_FOOTER_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="body-font">
      <xsl:attribute name="height">12.0pt</xsl:attribute>
      <xsl:attribute name="font-family">#BODY_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#BODY_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#BODY_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="page-number">
      <xsl:attribute name="height">13.872pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="header-font">
      <xsl:attribute name="height">#HEADER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-family">#HEADER_FONT_FAMILY#</xsl:attribute>
      <xsl:attribute name="white-space-collapse">false</xsl:attribute>
      <xsl:attribute name="font-size">#HEADER_FONT_SIZE#pt</xsl:attribute>
      <xsl:attribute name="font-weight">#HEADER_FONT_WEIGHT#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="border">
      <xsl:attribute name="border-top">#BORDER_WIDTH#pt solid #BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-bottom">#BORDER_WIDTH#pt solid #BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-start-width">#BORDER_WIDTH#pt</xsl:attribute>
      <xsl:attribute name="border-start-color">#BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-start-style">solid</xsl:attribute>
      <xsl:attribute name="border-end-width">#BORDER_WIDTH#pt</xsl:attribute>
      <xsl:attribute name="border-end-color">#BORDER_COLOR#</xsl:attribute>
      <xsl:attribute name="border-end-style">solid</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="cell">
      <xsl:attribute name="background-color">#BODY_BG_COLOR#</xsl:attribute>
      <xsl:attribute name="color">#BODY_FONT_COLOR#</xsl:attribute>
      <xsl:attribute name="padding-start">5.15pt</xsl:attribute>
      <xsl:attribute name="vertical-align">top</xsl:attribute>
      <xsl:attribute name="padding-top">0.0pt</xsl:attribute>
      <xsl:attribute name="padding-end">5.15pt</xsl:attribute>
      <xsl:attribute name="number-columns-spanned">1</xsl:attribute>
      <xsl:attribute name="height">0.0pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0.0pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="header-color">
      <xsl:attribute name="background-color">#HEADER_BG_COLOR#</xsl:attribute>
      <xsl:attribute name="color">#HEADER_FONT_COLOR#</xsl:attribute>
   </xsl:attribute-set>
   <xsl:template match="/">
      <fo:root>
         <fo:layout-master-set>
            <fo:simple-page-master master-name="master0" margin-left="66.6pt" margin-right="66.6pt" page-height="#PAGE_HEIGHT#pt" page-width="#PAGE_WIDTH#pt" margin-top="36.0pt" margin-bottom="36.0pt">
               <fo:region-body region-name="region-body" margin-top="54.0pt" margin-bottom="54.0pt"/>
               <fo:region-before region-name="region-header" extent="54.0pt"/>
               <fo:region-after region-name="region-footer" extent="54.0pt" display-align="after"/>
            </fo:simple-page-master>
         </fo:layout-master-set>
         <fo:page-sequence master-reference="master0">
            <xsl:variable name="_PW" select="number(#PAGE_HEIGHT#)"/>
            <xsl:variable name="_PH" select="number(#PAGE_WIDTH#)"/>
            <xsl:variable name="_ML" select="number(72.0)"/>
            <xsl:variable name="_MR" select="number(72.0)"/>
            <xsl:variable name="_MT" select="number(90.0)"/>
            <xsl:variable name="_MB" select="number(90.0)"/>
            <xsl:variable name="_HY" select="number(36.0)"/>
            <xsl:variable name="_FY" select="number(36.0)"/>
            <xsl:variable name="_SECTION_NAME" select="string(''master0'')"/>
            <fo:static-content flow-name="region-header">
               <fo:block xsl:use-attribute-sets="text text_2 text_0 #PAGE_HEADER_ALIGNMENT#">
                  <fo:inline xsl:use-attribute-sets="page-header">#PAGE_HEADER#</fo:inline>
               </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="region-footer">
               <fo:block xsl:use-attribute-sets="text footer">
                  <fo:inline xsl:use-attribute-sets="body-font page-number">
                     <fo:page-number/>
                  </fo:inline>
               </fo:block>
               <fo:block xsl:use-attribute-sets="text text_2 #PAGE_FOOTER_ALIGNMENT#">
                  <fo:inline xsl:use-attribute-sets="page-footer">#PAGE_FOOTER#</fo:inline>
               </fo:block>
            </fo:static-content>
            <fo:flow flow-name="region-body">
               <fo:block xsl:use-attribute-sets="padding">
                  <fo:table start-indent="0.0pt">
                     <xsl:variable name="_XDOFOPOS2" select="number(1)"/>
                     <xsl:variable name="_XDOFOTOTAL" select="number(1)"/>
'||'#PRN_TABLE_CELLS#                     <fo:table-header>
                        <fo:table-row>
'||'#PRN_TEMPLATE_HEADER_ROW#                        </fo:table-row>
                     </fo:table-header>
                     <fo:table-body>
                        <xsl:for-each select=".//ROW">
                           <fo:table-row>
'||'#PRN_TEMPLATE_BODY_ROW#                           </fo:table-row>
                        </xsl:for-each>
                     </fo:table-body>
                  </fo:table>
               </fo:block>
               <fo:block xsl:use-attribute-sets="text text_2 text_20">
                  <fo:inline id="{concat(''page-total-'', $_SECTION_NAME, $_XDOFOPOS)}"/>
                  <fo:inline id="{concat(''page-total'', $_XDOFOPOS)}"/>
               </fo:block>
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>
</xsl:stylesheet>
';


  g_prn_template_table_cell     varchar2(32767) := g_prn_template_table_cell_fop;
  g_prn_template_header_col     varchar2(32767) := g_prn_template_header_col_fop;
  g_prn_template_body_col       varchar2(32767) := g_prn_template_body_col_fop;
  g_prn_template                varchar2(32767) := g_prn_template_fop;


  -- ----------------------------------------------------------------------------------------
  -- is valid query
  --
  function is_valid_query (
    p_region_id number default null,
    p_plug_source varchar2,
    p_plug_source_type varchar2,
    p_owner varchar2 default null,
    p_required_col_num number default null
  ) return varchar2;

  -- ----------------------------------------------------------------------------------------
  -- upgrade report

  procedure upgrade_report (
    p_region_id number,
    p_user      varchar2
  );

  -- ----------------------------------------------------------------------------------------
  -- get_query_headings

  function get_query_headings (
    p_region_id number,
    p_include_derived varchar2 default 'Y'
  ) return wwv_flow_global.vc_arr2;


  -- ----------------------------------------------------------------------------------------
  -- get since

  function get_since(
      p_date    in date,
      p_sysdate in date default null
  ) return varchar2;


  -- ----------------------------------------------------------------------------------------
  -- get since
  function get_since_tswtz(
      p_timestamp timestamp with time zone
  ) return varchar2;


  -- ----------------------------------------------------------------------------------------
  -- get since
  function get_since_tswltz(
      p_ltimestamp timestamp with local time zone
  ) return varchar2;

  -- ----------------------------------------------------------------------------------------
  -- set template
  -- sets template definition based on row template id or default setting for non-template
  -- based reports

  procedure set_template(
    p_row_template_id           in     number,
    p_report_attributes_subs    in     varchar2,
    p_region_sub_css_classes    in     varchar2,
    p_column_heading_template   in out varchar2,
    p_row_template              in out row_template_type,
    p_row_templates             in out wwv_flow_global.vc_arr2,
    p_row_template_conditions   in out wwv_flow_global.vc_arr2,
    p_row_template_display_cond in out wwv_flow_global.vc_arr2,
    p_multiple_templates_exist  in out boolean,
    p_show_null_cols            in out boolean,
    p_before_column_heading     in out varchar2,
    p_after_column_heading      in out varchar2
  );

  -- ----------------------------------------------------------------------------------------
  -- build_pagination_row

  function build_pagination_row (
    p_row_template            in row_template_type,
    p_row_count               in number,
    p_row_count_max           in number,
    p_min_row                 in number,
    p_max_rows                in number,
    p_total_row_count         in number,
    p_region_id               in number,
    p_col_cnt                 in number,
    p_row_count_fmt           in varchar2,
    p_row_count_fmt2          in varchar2,
    p_pagination_align        in varchar2,
    p_show_top_pagination     in boolean default false,
    p_more_data_found         in boolean default false,
    p_ajax_enabled            in varchar2 default 'N',
    p_ajax_items_to_submit    in varchar2 default null
  ) return varchar2;

  -- ----------------------------------------------------------------------------------------
  -- Set legacy col attribyts
  --
  procedure set_legacy_col_attributes (
    p_region_id number,
    p_is_api_call                 boolean default false,
    p_plug_query_headings         varchar2 default null,
    p_plug_query_headings_type    varchar2 default null,
    p_plug_query_col_allignments  varchar2 default null,
    p_plug_query_sum_cols         varchar2 default null,
    p_plug_query_number_formats   varchar2 default null,
    p_plug_query_hit_highlighting varchar2 default null
  );

  -- ----------------------------------------------------------------------------------------
  -- update_report_columns
  --
  procedure update_report_columns (
    p_region_id number
  );


  -- ----------------------------------------------------------------------------------------
  -- show
  --
  --

  procedure show(
    p_query                       in varchar2,
    p_min_row                     in number                    default 1,
    p_max_rows                    in number                    default 200,
    p_row_count_max               in number                    default g_show_total_row_count_max,
    p_plug_query_num_rows_type    in varchar2                  default null,
    p_pagination_display_position in varchar2                  default null,
    p_plug_source_type            in varchar2                  default null,
    p_csv_output                  in varchar2                  default 'N',
    p_print_server                in varchar2                  default null,
    p_csv_output_link_text        in varchar2                  default null,
    p_prn_output                  in varchar2                  default 'N',
    p_prn_output_show_link        in varchar2                  default 'N',
    p_prn_output_link_text        in varchar2                  default null,
    p_prn_document_header         in varchar2                  default null,
    p_prn_format                  in varchar2                  default null,
    p_prn_format_item             in varchar2                  default null,
    p_print_url                   in varchar2                  default null,
    p_print_url_label             in varchar2                  default null,
    p_plug_query_parse_override   in varchar2                  default null,
    p_plug_query_exp_filename     in varchar2                  default null,
    p_plug_query_exp_separator    in varchar2                  default ',',
    p_plug_query_exp_enclosed_by  in varchar2                  default '''',
    p_plug_query_hit_highlighting in varchar2                  default null,
    p_plug_query_headings_type    in varchar2                  default 'QUERY_COLUMNS',
    p_plug_query_headings         in varchar2                  default '(null)',     -- rename
    p_show_nulls_as               in varchar2                  default '(null)',
    p_break_cols                  in wwv_flow_global.vc_arr2   default empty_vc_arr,
    p_sum_cols                    in wwv_flow_global.vc_arr2   default empty_vc_arr,
    p_show_nulls                  in varchar2                  default 'F',
    p_plug_query_options          in varchar2                  default null,
    p_plug_query_strip_html       in varchar2                  default 'Y',
    p_row_template_id             in number                    default null,
    p_repeat_headings             in number                    default null,
    p_more_rows_message           in varchar2                  default null,
    p_no_data_found_message       in varchar2                  default 'No data found...',
    p_region_id                   in number                    default null,
    p_region_name                 in varchar2                  default null,
    p_region_static_id            in varchar2                  default null,
    p_ajax_enabled                in varchar2                  default 'N',
    p_ajax_items_to_submit        in varchar2                  default null,
    p_report_attributes_subs      in varchar2                  default null,
    p_region_sub_css_classes      in varchar2                  default null,
    p_render_full_page            in varchar2                  default 'Y'
    );

end;
/
show err
