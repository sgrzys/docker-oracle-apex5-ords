set define '^' verify off
prompt ...wwv_flow_feedback_int.sql
create or replace package wwv_flow_feedback_int as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_feedback_int.sql
--
--    DESCRIPTION
--      Internal API for feedback and feedback followup
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    09/13/2013 - Created
--                           - Moved implementation of submit_feedback, submit_feedback_followup, get_feedback_follow_up from wwv_flow_team to wwv_flow_feedback_int
--
--------------------------------------------------------------------------------

--==============================================================================
procedure submit_feedback (
    p_comment          in varchar2 default null,
    p_type             in number   default 1,
    p_application_id   in varchar2 default null,
    p_page_id          in varchar2 default null,
    p_email            in varchar2 default null,
    p_screen_width     in varchar2 default null,
    p_screen_height    in varchar2 default null,
    p_attribute_01     in varchar2 default null,
    p_attribute_02     in varchar2 default null,
    p_attribute_03     in varchar2 default null,
    p_attribute_04     in varchar2 default null,
    p_attribute_05     in varchar2 default null,
    p_attribute_06     in varchar2 default null,
    p_attribute_07     in varchar2 default null,
    p_attribute_08     in varchar2 default null,
    p_label_01         in varchar2 default null,
    p_label_02         in varchar2 default null,
    p_label_03         in varchar2 default null,
    p_label_04         in varchar2 default null,
    p_label_05         in varchar2 default null,
    p_label_06         in varchar2 default null,
    p_label_07         in varchar2 default null,
    p_label_08         in varchar2 default null);

--==============================================================================
procedure submit_feedback_followup (
    p_feedback_id      in number,
    p_follow_up        in varchar2 default null,
    p_email            in varchar2 default null );

--==============================================================================
function get_feedback_follow_up (
    p_feedback_id    in number,
    p_row            in number default 1,
    p_template       in varchar2 default '<br />#CREATED_ON# (#CREATED_BY#) #FOLLOW_UP#')
    return varchar2;

end wwv_flow_feedback_int;
/
show err

