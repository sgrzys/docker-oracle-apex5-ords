set define off
set verify off

prompt ...wwv_flow_calendar

create or replace package wwv_flow_calendar
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2004 - 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_calendar.sql
--
--    DESCRIPTION
--      This package is responsible for handling the calendar component
--      in the runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      klrice    04/22/2004 - Created
--      klrice    05/27/2004 - Checkpoint for compilations
--      klrice    06/04/2004 - Formatting
--      klrice    06/04/2004 - added display_type to cals
--      klrice    06/21/2004 - Changed to start_date/end_date and addeed start_of_week
--      klrice    07/01/2004 - Added display_item to wiz call
--      klrice    08/25/2004 - added flag to link all days or not, bug # 3855299
--      klrice    08/31/2004 - added separator for use when display is a Column
--      sspadafo  02/19/2005 - Added day_link, item_link references
--      klrice    05/09/2005 - Added is_Valid_query
--      Sathikum  01/02/2007 - Added printMonthCal, printWeekCal, printDayCal
--      Sathikum  01/12/2007 - Added support for Start Time, End Time , Time format for Weekly & Daily Calendar also start day & end day feature for weekly calendar.
--      jstraub   01/16/2007 - Added new columns for wwv_flow_cals to set_Attributes
--      sathikum  01/19/2997 - Added parameter to store calender type field.
--      sathikum  10/30/2007 - added process_calendar_date for ajax calendar
--      sathikum  10/31/2007 - added functionality to support both ajax and classic calendar
--      jstraub   11/21/2007 - added p_calendar_type to set_Attributes
--      jkallman  09/19/2008 - Added missing p_source_table to printMonthCal
--      sathikum  02/19/2009 - Added parameter p_source_table to printWeekCal & PrintDayCal for AJAX based data adding.
--      sathikum  05/08/2009 - Added parameter p_end_date_item_name to create_wizard_elements
--      sathikum  05/19/2009 - Added code for Custom Calendar feature.
--      sathikum  07/14/2009 - added code for supporting AJAX based Transaction.
--      sathikum  08/18/2009 - Added code for supporting Drag & Drop Feature 
--      sathikum  04/02/2010 - Allow choice of including Custom Calendar with Date Picker
--      sathikum  01/03/2011 - Added p_enable_drag_drop and p_enable_ajax_data_add to create_wizard_elements,set_Attributes (feature #520)
--      sathikum  01/10/2011 - Added code to include parameneter  p_enable_drag_drop and p_enable_ajax_data_add to all types of calendar (feature #520)
--      sathikum  01/14/2011 - added data_background_color and data_text_color(feature #520)
--      sathikum  01/21/2011 - Added column enable_ajax_data_edit (feature #520)
--      sathikum  02/15/2011 - Added column enable_ajax_data_delete (feature #520)
--      sathikum  04/11/2011 - Added primary_key_column, drag_drop_required_role, drag_drop_process_id and removed some parameteres from set_Attributes (feature #520)
--      sathikum  04/14/2011 - Added item_link_primary_key_item, item_link_date_item (feature #520)
--      sathikum  04/18/2011 - Added item_link_open_in to set_Attributes (feature #520)
--      sathikum  04/22/2011 - Added function create_on_demand_process for Drag & Drop (feature #520)
--      sathikum  05/18/2011 - Fixed issues and Cleaned up code which was used by previous version of Drag & Drop
--      sathikum  06/02/2011 - Added p_include_time_with_date to set_attributes and modified create_wizard_elements (feature #520)
--      sathikum  06/27/2011 - Fixed bug #12691760, added code to support creation of calendar data using keyboard
--      sathikum  03/15/2012 - Added Agenda Calendar Feature #812
--      sathikum  03/20/2012 - Fixed bug #13706809 modified set_attributes to include p_end_date_item
--
--------------------------------------------------------------------------------

procedure show(p_plug_id number,p_cal_type varchar2 default 'M',p_cal_action varchar2 default null,p_date_value varchar2 default null,
               p_end_date_value varchar2 default null);
          
procedure widget;

end wwv_flow_calendar;
/
show errors

set define '^'
