set define off
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
--
-- ORACLE
--
-- Application Express (APEX)
--
-- NOTE: This script is auto-generated. Do not edit directly!
--
prompt Set Credentials...
begin
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,12));
end;
/
begin
select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';
end;
/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';
end;
/
prompt Creating Packaged Application Wizard Information...
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
prompt ...Delete Packaged Applications and associated images
delete from wwv_flow_pkg_app_images
/ 
delete from wwv_flow_pkg_applications
where app_group in ('PACKAGE','SAMPLE')
/
update wwv_flow_pkg_applications
set app_category_id_1 = (select id from wwv_flow_pkg_app_categories where category_name = 'Template')
where app_group in ('CUSTOM') and app_category_id_1 is null
/
 
prompt ...Load Packaged Application Categories
 
delete from wwv_flow_pkg_app_categories
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Community', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'IT Management', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Knowledge Management', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Marketing', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Other', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Project Management', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Sample', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Software Development', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Team Productivity', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Template', 
    '' )
/ 
 
insert into wwv_flow_pkg_app_categories ( 
    category_name, 
    category_desc )
values (
    'Tracking', 
    '' )
/ 
 
prompt ...Load Packaged Applications and associated images
 
-- Package 7000, Online Marketing Campaign Calendar
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269116428363893901;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Marketing')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7000, 
        7000, 
        null, 
        'Online Marketing Campaign Calendar', 
        'PACKAGE', 
        'DB', 
        '10.2.0.4', 
        'Y', 
        '', 
        '<ul>'||unistr('\000a')||
'<li>Updated mobile user interface with APEX 4.2 mobile features</li>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Set compatibility mode to 4.2</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        '', 
        'HIDDEN', 
        '1.0.5', 
        to_date('20140328000000','YYYYMMDDHH24MISS'), 
        '1', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        null, 
        '4.2.2', 
        'Oracle', 
        '', 
        'www.oracle.com', 
        51, 
        null, 
        ''); 
 
null;
end;
/
-- Package 7010, Decision Manager
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269116598854893901;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Team Productivity')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7010, 
        7010, 
        null, 
        'Decision Manager', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Decision Manager helps you track all the important decisions you have to make.  Decision Manager allows you to classify decisions by a number of aspects, including importance, type of decision, due date and the project the decision is associated with.</p>'||unistr('\000a')||
'<p>Decision Manager allows you to include relevant materials, either as links or attachments, and each decision gives all interested parties the ability to add notes to the overall decision record.  You can make a decision with a simple click, choosing between a set of options you define.</p>'||unistr('\000a')||
'<p>You can even see a list of outstanding decisions ranked by weight, which takes into consideration factors such as the importance and due date of the decision.</p>'||unistr('\000a')||
'<p>With Decision Manager, you can not only reach effective decision productively, but maintain a record of the decision making process for later validation and enlightenment.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Decision Views and Visitors counters</li>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>User interface and user experience improvements</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-decision-manager', 
        'AVAILABLE', 
        '2.0.6', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '15', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        62, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Decision Manager', 
        'Screenshot showing the dashboard home page from Decision Manager, where an overview of important application information is available, such as ''Decision Requests'', ''Decisions'' and ''Tags''.', 
        'decision_manager.png'); 
 
null;
end;
/
-- Package 7020, Script Planner
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269116693395893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7020, 
        7020, 
        null, 
        'Script Planner', 
        'PACKAGE', 
        'DB', 
        '10.2.0.4', 
        'Y', 
        '', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Set compatibility mode to 4.2</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        '', 
        'HIDDEN', 
        '1.0.0', 
        to_date('20150626182705','YYYYMMDDHH24MISS'), 
        '3', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        null, 
        '', 
        'Oracle', 
        '', 
        'www.oracle.com', 
        42, 
        null, 
        ''); 
 
null;
end;
/
-- Package 7050, Opportunity Tracker
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269116791437893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Team Productivity')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7050, 
        7050, 
        null, 
        'Opportunity Tracker', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Opportunity Tracker helps you to track your sales opportunities throughout their lifespan, while giving sales management a quick and easy tool to both see the current state of the sales pipeline and analyze past sales performance.</p>'||unistr('\000a')||
'<p>With Opportunity Tracker, you can define accounts, contacts, territories, products  and competitors and combine these to define leads and opportunities.  Opportunity Tracker includes a rich set of reports on opportunities, pipeline analysis, key accounts, projected closing dates and different snapshots of sales by rep. </p> '||unistr('\000a')||
'<p>All reports in Opportunity Tracker are completely customizable by users, allowing for extended analysis and charting based on these reports.</p>'||unistr('\000a')||
''||unistr('\000a')||
'', 
        '<ul>'||unistr('\000a')||
'<li>Added Opportunity Views and Visitors counters, implemented using new Oracle APEX Usage Metrics plugin</li>'||unistr('\000a')||
'<li>A new Opportunity Completeness "fish bowl" widget, implemented using new Oracle APEX Content Completeness (Fish Bowl) plugin</li>'||unistr('\000a')||
'<li>The ability to validate a bug status at a point in time, implemented using new Oracle APEX Content Validation plugin</li>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>User interface and user experience improvements</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-opportunity-tracker', 
        'AVAILABLE', 
        '2.1.5', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '14', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        3520, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        155, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Opportunity Tracker Home Page', 
        'Screenshot showing the dashboard home page from Opportunity Tracker, where an overview of important application information is available, such as ''Open Opportunities by Territory, ''Leads'', ''Open Opportunities by Account'' and ''Open Opportunities''.', 
        'opportunity_tracker.png'); 
 
null;
end;
/
-- Package 7060, Bug Tracking
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269116800404893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Software Development')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7060, 
        7060, 
        null, 
        'Bug Tracking', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>The Bug Tracker application is an easy-to-use Web-accessible method to enter and track bugs against various projects.</p>'||unistr('\000a')||
'<p>You can enter bugs along with a variety of information, including associated project, severity, status and who the bug has been assigned to, along with a number of attributes about the problem. You can easily view when a bug was created and last updated, along with a free form description of the bug.</p>'||unistr('\000a')||
'<p>You can customize the values for standard attributes, insuring that your Bug Tracker application will fit your particular needs. An administrator can specify products and their versions, categories, and codes for status, priority and severity.</p>'||unistr('\000a')||
'<p>Bug Tracker gives all users an easy way to view bugs, based on a variety of selection filters.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Added Opportunity Views and Visitors counters, implemented using new Oracle APEX Usage Metrics plugin</li>'||unistr('\000a')||
'<li>A new Bug Completeness "Fish Bowl" widget, implemented using new Oracle APEX Content Completeness (Fish Bowl) plugin</li>'||unistr('\000a')||
'<li>The ability to validate an opportunity status at a point in time, implemented using new Oracle APEX Content Validation plugin</li>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>User interface and user experience improvements</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-bug-tracking', 
        'AVAILABLE', 
        '2.1.7', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '23', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        2368, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        106, 
        null, 
        'EBA_BUG_'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Bug Tracking Home Page', 
        'Screenshot showing the dashboard home page from the Bug Tracking application, where information such as ''Recent Bugs'', ''Severity Metrics'' and ''Assignees'' is available.', 
        'bugs.png'); 
 
null;
end;
/
-- Package 7090, Group Calendar
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269116945279893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Team Productivity')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7090, 
        7090, 
        null, 
        'Group Calendar', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>The Group Calendar application gives you a way to list all your events on an easy to use, Web-accessible calendar. The Home page for the Group Calendar displays events in a monthly, weekly or daily format, with embedded links to detailed information about each event. You can also create customized reports on events.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Each event is classified by event type and automatically displayed in an associated color. You can create your own event types or modify existing event type attributes.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'You can send emails to individuals or groups with information about upcoming meetings, and you have the ability to create your own groups to match your needs.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-group-calendar', 
        'AVAILABLE', 
        '2.0.6', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '12', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        1408, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        55, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Group Calendar Home', 
        'Screenshot of the Group Calendar home page, showing a calendar for the current month.', 
        'group_cal.png'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Group Calendar Administration', 
        'Screenshot showing the Administration pages from the Group Calendar application, where you can perform Administrative tasks such as enable access control, manage sample data and set color preferences.', 
        'group_cal_admin.png'); 
 
null;
end;
/
-- Package 7120, Expertise Tracker
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117018024893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Knowledge Management')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7120, 
        7120, 
        null, 
        'Expertise Tracker', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Expertise Tracker allows you to manage people and their skills.  You define skills and add people to the application, then associate expertise for the individuals.  A full range of reports allows you to quickly identify people with specific skills, as well as track the overall availability of skills in a set of people.</p>  '||unistr('\000a')||
'<p>You can track people from more than one organization to expand your network of expertise.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-expertise-tracker', 
        'AVAILABLE', 
        '2.0.36', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '9', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        256, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        50, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Expertise Tracker', 
        'Screenshot showing the dashboard home page of Expertise Tracker, which includes the ability to search areas of expertise and see the most common areas of expertise.', 
        'expertise_tracker.png'); 
 
null;
end;
/
-- Package 7130, Community Requests
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117190769893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Software Development')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Community')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7130, 
        7130, 
        null, 
        'Community Requests', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Community Requests lets your user community submit requests for new features in products and then vote on these requests.  The requests are automatically ranked by their average rating.</p>'||unistr('\000a')||
'<p>Each user has the ability to quickly see the status of the requests they have submitted, or to see the rankings they have assigned to requests.  Community Requests also includes reports to show the overall distribution of rankings to understand the relative weighting of rankings across all requests.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-community-requests', 
        'AVAILABLE', 
        '1.0.40', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '8', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        77, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Community Requests', 
        'Screenshot showing the dashboard home page of Community Requests, where information such as ''Recent Requests'', ''Top Requests'' and ''Tags'' is available.', 
        'community_requests.png'); 
 
null;
end;
/
-- Package 7140, Incident Tracking
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117229267893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Software Development')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'IT Management')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7140, 
        7140, 
        null, 
        'Incident Tracking', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>The Incident Tracking application gives you a complete system for entering and tracking support incidents.  The application allows you to enter customer companies and multiple contacts for each company, specify products and categories and set up values to limit status codes, severity and urgency attributes for an incident.</p>'||unistr('\000a')||
'<p>Incident Tracking includes a wizard to enter essential information about an incident and a variety of ways to sort and report on incidents, including a time line based on when incidents were entered into the system.</p>'||unistr('\000a')||
'<p>Once a ticket is entered into the system, you can track the progress of the ticket in an update area of the ticket, or add attachments and links to the incident.  You can also use tags to further classify incidents and use the resulting tag cloud in your reports.</p>'||unistr('\000a')||
'<p>The Incident Tracking system includes robust interactive reports, which provide valuable analysis of incidents through an easy-to-use interface, including the ability to create charts.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Ticket Views and Visitors counters, implemented using new Oracle APEX Usage Metrics plugin</li>'||unistr('\000a')||
'<li>A new Ticket Completeness "fish bowl" widget, implemented using new Oracle APEX Content Completeness (Fish Bowl) plugin</li>'||unistr('\000a')||
'<li>The ability to validate a ticket status at a point in time, implemented using new Oracle APEX Content Validation plugin</li>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>User interface and user experience improvements</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-incident-tracking', 
        'AVAILABLE', 
        '2.0.5', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '11', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        82, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Incident Tracking', 
        'Screenshot showing the dashboard home page of Incident Tracking, allowing the ability to search incidents and also providing important information such as ''Recent Activity'' and an incident summary.', 
        'incident_tracking.png'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Incident Tracking Ticket Details Page', 
        'Screenshot showing the details page for an Incident Tracking Ticket.', 
        'incident_tracking2.png'); 
 
null;
end;
/
-- Package 7160, Sample Geolocation Showcase
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117377048893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7160, 
        7160, 
        null, 
        'Sample Geolocation Showcase', 
        'SAMPLE', 
        'DB', 
        '', 
        'Y', 
        '<p>'||unistr('\000a')||
' This application demonstrates Spatial capabilities of the Oracle database. It has 3 main areas: Addresses, Images and Areas Of Interest.</p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li><b>Addresses</b> allows to add postal addresses which can be geocoded (converted to a coordinate) and then be displayed on the map.</li>'||unistr('\000a')||
'<li><b>Images</b> allows to upload images. If an image (e.g. a smartphone image) contains a location, it will be automatically extracted and being stored in the database.</li>'||unistr('\000a')||
'<li><b>Areas Of Interest</b> are polygons which can be drawn on the map and then be stored into the database</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Based on this data, the application offers 3 kinds of spatial analysis'||unistr('\000a')||
'</p> '||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li><b>Within Distance Search</b>: After clicking a position on the map and adjusting the "distance slider", the application will return all images and addresses, which are located within that area.</li>'||unistr('\000a')||
'<li><b>Nearest Neighbor Search</b>: After selecting an address, a maximum distance and the maximum number of results, the application will show N images which are closest to the selected address.</li>'||unistr('\000a')||
'<li><b>Area Of Interest Search</b>: Allows to choose one of the previously created Areas Of Interest - the application will return all images and addresses within that area.</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-sample-geolocation', 
        'AVAILABLE', 
        '1.1.7', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        25, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Geolocation Showcase', 
        'Screenshot showing the Home page for the ''Sample Geolocation Showcase'', listing the available sample options such as ''Areas of Interest'', and ''Nearest-Neighbor Search'' are available.', 
        'sample_geolocation.png'); 
 
null;
end;
/
-- Package 7170, Customer Tracker
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117488481893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Marketing')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7170, 
        7170, 
        null, 
        'Customer Tracker', 
        'PACKAGE', 
        'DB', 
        '11.2', 
        'Y', 
        '<p>Customer Tracker helps you improve your customer interactions by offering a centralized repository of information about your customers.</p>'||unistr('\000a')||
'<p>Each customer can have multiple contacts and be associated with multiple products.  Each contact has a variety of standard attributes, such as category, geography, industry and status, as well as the ability to add tags to a customer for further ad hoc classification.  You can indicate the reference status for a customer and enter free form text as a customer profile.</p>'||unistr('\000a')||
'<p>You can create activity records to log interactions with each customer.  Customer Tracker includes a variety of reports which let you view recent activities, status changes and tags.  You can also use interactive reports to give your users the ability to filter and shape customer, contact, activity and interaction data.</p>'||unistr('\000a')||
'<p>Customer Tracker gives you the ability to define your own standards for attributes such as categories, statuses, customer and activity types, and products, allowing you to create a customized version of Customer Tracker to meet your own needs.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Flex Field-related bugs fixed</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-customer-tracker', 
        'AVAILABLE', 
        '3.0.9', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '17', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        1856, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        108, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Home Page', 
        'Screenshot showing the dashboard home page from Customer Tracker, where an overview of important application information is available, such as ''Customers'', ''Updates'' and ''Tags''.', 
        'custtrack.png'); 
 
null;
end;
/
-- Package 7220, P-Track
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117510980893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Project Management')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Team Productivity')
    loop
        l_category_2 := c2.id;
    end loop;

    for c3 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_3 := c3.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7220, 
        7220, 
        null, 
        'P-Track', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>P-Track is an application that allows you to track the status of your projects over time.  </p><p>A project in P-Track has a number of attributes, including one or more owners, a status indication, and a set of milestones and action items.  You can submit status updates for a project and create status reports based on a selection of updates.  Projects are assigned to a category, and a project can be the parent of one or more child projects.  You can also add tags to a project to allow for more informal groups of projects.</p><p>All projects allow you to add annotations, such as links to other resources or files, to the project for consolidated access to all information relating to a project.</p><p>Each project has a set of milestones, which can be viewed in a report, a calendar view, or in a Gantt chart format.  </p><p>Each project has a set of action items, which can be viewed in a report or a calendar view.  P-Track includes a set of high level analysis reports on action items, for a quick review of assigned tasks.</p><p>P-Track also includes built-in integration with email.  You can request status updates through an email message, and team members who receive this type of message can directly update status, milestones or action items, as well as add annotations to a project.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Fixed potential upgrade/deinstall bug.</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-p-track', 
        'AVAILABLE', 
        '5.0.12', 
        to_date('20150903000000','YYYYMMDDHH24MISS'), 
        '41', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        168, 
        null, 
        'ptrack'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'P-Track Home Page', 
        'Screenshot showing the dashboard home page from P-Track, where an overview of important application information is available, such as ''Project Milestones'', ''Recently Edited'' and ''Project Statuses''.', 
        'ptrack1.png'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Project Details Page', 
        'Screenshot showing project details, from P-Track.', 
        'ptrack2.png'); 
 
null;
end;
/
-- Package 7230, Data Model Repository Viewer
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117636798893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Software Development')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7230, 
        7230, 
        null, 
        'Data Model Repository Viewer', 
        'PACKAGE', 
        'DB', 
        '10.2.0.4', 
        'Y', 
        '', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Set compatibility mode to 4.2</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        '', 
        'HIDDEN', 
        '', 
        null, 
        '1', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        null, 
        '', 
        '', 
        '', 
        '', 
        null, 
        null, 
        ''); 
 
null;
end;
/
-- Package 7240, Checklist Manager
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117750885893902;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Team Productivity')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7240, 
        7240, 
        null, 
        'Checklist Manager', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Checklist Manager gives you a way to manage the components of a larger task.  A checklist contains multiple steps, and each step can be marked with different levels of completion.  With Checklist Manager, you can track your progress on any task, quickly and easily.</p><p>You can create a checklist type with a name and the items, or columns, which make up the overall checklist.  You define whether you want to allow partial completion of each item or simply mark them as complete when finished.  You can also add text fields for each checklist.</p><p>Once you define a checklist type, users can add checklists to the overall type.  Checklist Manager automatically tracks the completion of the overall task and of each item over all checklists, on the overview page of the checklist type.</p><p>You can drill down to an individual checklist, which can include columns which are not shown on the overview page, to display more detailed information on the checklist. </p><p>Checklist Manager supports different levels of privileges, including administrators, who can create checklist types, contributors, who can add checklists to a type, and users, who can view and modify existing checklists.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-checklist-manager', 
        'AVAILABLE', 
        '2.0.8', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '14', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        576, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        46, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Checklist Manager', 
        'Screenshot showing the main page for the ''Checklist Manager'', listing the available sample checklists.', 
        'checklist.png'); 
 
null;
end;
/
-- Package 7250, Data Reporter
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117824013893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Knowledge Management')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_2 := c2.id;
    end loop;

    for c3 in (select id from wwv_flow_pkg_app_categories where category_name =  'Project Management')
    loop
        l_category_3 := c3.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7250, 
        7250, 
        null, 
        'Data Reporter', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Data Reporter lets end-users easily create and share reports based on available data.  Data can be from your own SQL (Structured Query Language) select statements or from Data Sources.  Data Sources provide a way for more SQL-savvy users to pre-create queries based on available data including Websheet Data Grid data. Report types include Interactive, Calendar, Dashboard, and PDF and reports can link to each other (providing drill down capabilities) or to outside URLs.  Reports can be accessible to all or limited to a specific set of users.   Data can also be all accessible to the schema the application is installed in or you can create a whitelist to limit data access.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Fixed potential upgrade/deinstall bug.</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-data-reporter', 
        'AVAILABLE', 
        '2.1.0', 
        to_date('20150903000000','YYYYMMDDHH24MISS'), 
        '9', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        132, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Data Reporter', 
        'Screenshot showing the dashboard home page from Data Reporter, where an overview of important application information is available.', 
        'data_reporter.png'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Data Reporter Filter Report', 
        'Screenshot showing a sample Filter Report from Data Reporter.', 
        'data_reporter2.png'); 
 
null;
end;
/
-- Package 7260, Application Standards Tracker
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269117984080893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Knowledge Management')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7260, 
        7260, 
        null, 
        'Application Standards Tracker', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        'This application is designed to assist teams in developing applications which conform to a standard set of best practices. Developers can create tests against the Oracle Application Express (APEX) Data Dictionary for compliance, and group them into Standards; the tests are then run automatically against the registered applications.', 
        '<ul>'||unistr('\000a')||
'<li>Fixed potential upgrade/deinstall bug.</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-application-standards-tracker', 
        'AVAILABLE', 
        '2.0.8', 
        to_date('20150903000000','YYYYMMDDHH24MISS'), 
        '8', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        46, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Application Standards Tracker Homepage', 
        'Screenshot showing the dashboard home page for the Application Standards Tracker application, where information such as ''Total Applications'', ''All Standards'' and ''Standards with Automated Tests'' is available.', 
        'standards_tester_app.png'); 
 
null;
end;
/
-- Package 7270, APEX Application Archive
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118087597893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Software Development')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7270, 
        7270, 
        null, 
        'APEX Application Archive', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>The APEX Application Archive makes it easy for you to archive your applications, providing safety for your work and productivity for your development efforts.</p>'||unistr('\000a')||
'<p>You can archive your Oracle Application Express applications into tables within your Database Cloud Service. Your archives can be full or incremental backups, and you can specify which applications should be included in either type of backup.  You can restore any application from any archive or download the application through the Application Archive.</p>'||unistr('\000a')||
'<p>You can easily see all of your archives and drill down to see the applications included in the archive.  You can restore individual applications from any archive.  The APEX Application Archive automatically tracks application versions and gives you a high level view showing when each of your apps has been most recently backed up.</p>'||unistr('\000a')||
'<p>The APEX Application Archive lets you specify the number of version you want to keep of any application and to purge older application versions.  You can also search your archives and report on their contents.</p>'||unistr('\000a')||
'<p>By keeping your archives in database tables, the APEX Application Archive insures that your applications will be backed up just like your data.  By automating the backup process, the APEX Application Archive makes it easy for you to keep multiple versions of your applications, increasing your flexibility without impacting your productivity.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-apex-application-archive', 
        'AVAILABLE', 
        '2.0.3', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '8', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        53, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Application Archive', 
        'Screenshot showing the dashboard home page from Application Archive, where an overview of important application information is available, such as ''Recent Activity'' and ''Archive Repository History''.', 
        'archive_sample.png'); 
 
null;
end;
/
-- Package 7280, Survey Builder
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118133251893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Knowledge Management')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Marketing')
    loop
        l_category_2 := c2.id;
    end loop;

    for c3 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_3 := c3.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7280, 
        7280, 
        null, 
        'Survey Builder', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Survey Builder manages the process of conducting survey research.  It provides a simple user interface for creating great looking web based questionnaires, supporting both random sample and self selected survey types. There are a number of options to control the style and format of the questionnaires which work on a wide range of browsers on mobile, tablet, and desktop platforms. Survey builder can distribute the questionnaire by sending a URL to the questionnaire via email. It can also send reminder and thank you emails.  Once your survey is complete, you can use the included reports to review the results and download for further analysis.'||unistr('\000a')||
'</p>', 
        '<ul>'||unistr('\000a')||
'<li>Added Email Templates with rich HTML, for sending survey request, reminder, and thank you emails.</li>'||unistr('\000a')||
'<li>Added Respondent Communities, for sending survey requests to a pre-defined list of respondents</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-survey-builder', 
        'AVAILABLE', 
        '2.0.5', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '10', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        91, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Survey Builder', 
        'Screenshot showing the Questionnaire page from Survey Builder, displaying a number of questions and possible answers for a sample questionnaire, and application options to allow the editing or creation of questions and answers for the questionnaire.', 
        'survey_builder.png'); 
 
null;
end;
/
-- Package 7290, Meeting Minutes
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118236792893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Team Productivity')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7290, 
        7290, 
        null, 
        'Meeting Minutes', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>'||unistr('\000a')||
'      The "Meeting Minutes" application is used to store meeting agenda information for a meeting organizer, assigned presenters, and other attendees.'||unistr('\000a')||
'    </p>'||unistr('\000a')||
'    <p>'||unistr('\000a')||
'      It is a collaborative environment for meeting participants to simultaneously review agenda items, and add relevant attachment files, action items, decisions, and/or notes.'||unistr('\000a')||
'    </p>'||unistr('\000a')||
'    <p>'||unistr('\000a')||
'      Each meeting will always contain:'||unistr('\000a')||
'      <ul>'||unistr('\000a')||
'        <li>Details (name, description, start and end times, location, etc...)</li>'||unistr('\000a')||
'        <li>Agenda</li>'||unistr('\000a')||
'        <li>Organizer</li>'||unistr('\000a')||
'      </ul>'||unistr('\000a')||
'    </p>'||unistr('\000a')||
''||unistr('\000a')||
'    <p>'||unistr('\000a')||
'      Each meeting may also contain:'||unistr('\000a')||
'      <ul>'||unistr('\000a')||
'        <li>Presenters</li>'||unistr('\000a')||
'        <li>Attendees</li>'||unistr('\000a')||
'        <li>Attachments</li>'||unistr('\000a')||
'        <li>Action Items</li>'||unistr('\000a')||
'        <li>Decisions</li>'||unistr('\000a')||
'        <li>Notes</li>'||unistr('\000a')||
'      </ul>'||unistr('\000a')||
'    </p>', 
        '<ul>'||unistr('\000a')||
'<li>Meeting Views and Visitors counters, implemented using new Oracle APEX Usage Metrics plugin</li>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-meeting-minutes', 
        'AVAILABLE', 
        '1.0.33', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '9', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        43, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Home Page', 
        'Screenshot showing a breakdown of meetings, in the Meeting Minutes application.', 
        'meeting_minutes.png'); 
 
null;
end;
/
-- Package 7300, Use Case Status
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118331258893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Team Productivity')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7300, 
        7300, 
        null, 
        'Use Case Status', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Use Case Status helps to utilize use cases in creating and testing product releases.  Developers and quality assurance testers run use cases to verify product functionality.</p>'||unistr('\000a')||
'<p>Use Case Status lets you define test areas and sub-areas for use cases, as well as the milestones used in a development effort.  Each individual use case can have a status assigned for each milestone and sub-area, and you can create your own set of status codes.  You can include attachments and links for each sub-area, and all status changes are automatically tracked. </p>', 
        '<ul>'||unistr('\000a')||
'<li>Use Case Views and Visitors counters, implemented using new Oracle APEX Usage Metrics plugin</li>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-use-case-status', 
        'AVAILABLE', 
        '2.0.4', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '11', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        70, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Use Case Status', 
        'Screenshot showing a report page of use case statuses for an ''Early Access Release'' in the Use Case Status application.', 
        'use_case_status.png'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Use Case Status Check List', 
        'Screenshot showing a check list in the Use Case Status application.', 
        'use_case_status2.png'); 
 
null;
end;
/
-- Package 7340, Live Poll
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118492500893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Marketing')
    loop
        l_category_1 := c1.id;
    end loop;

    for c2 in (select id from wwv_flow_pkg_app_categories where category_name =  'Tracking')
    loop
        l_category_2 := c2.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7340, 
        7340, 
        null, 
        'Live Poll', 
        'PACKAGE', 
        'DB', 
        '11.2', 
        'Y', 
        '<p>This application allows you to conduct a simple poll or quiz.  Results of the poll or quiz can be displayed in real time.  You can use live poll during meetings or presentations to get instant feedback and to facilitate discussions.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Fixed bug which prevented polls which required authentication from working properly.</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-live-poll', 
        'AVAILABLE', 
        '3.1.13', 
        to_date('20150903000000','YYYYMMDDHH24MISS'), 
        '16', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        101, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Live Poll', 
        'Screenshot showing the results for a sample poll conducted with Live Poll, where information such as total number of responses, and a visual representation of the responses to two questions is available.'||unistr('\000a')||
'', 
        'live_poll.png'); 
 
null;
end;
/
-- Package 7600, Sample Access Control
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118551779893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7600, 
        7600, 
        null, 
        'Sample Access Control', 
        'SAMPLE', 
        'DB', 
        '10.2.0.4', 
        'Y', 
        '', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Set compatibility mode to 4.2</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-access-control', 
        'HIDDEN', 
        '', 
        null, 
        '1', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        null, 
        'English', 
        null, 
        '', 
        '', 
        '', 
        '', 
        null, 
        null, 
        ''); 
 
null;
end;
/
-- Package 7610, Sample Build Options
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118682245893903;
 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7610, 
        7610, 
        null, 
        'Sample Build Options', 
        'SAMPLE', 
        'DB', 
        '10.2.0.4', 
        'Y', 
        '', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Set compatibility mode to 4.2</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-build-options', 
        'HIDDEN', 
        '', 
        null, 
        '1', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        null, 
        '', 
        '', 
        '', 
        '', 
        null, 
        null, 
        ''); 
 
null;
end;
/
-- Package 7650, Go Live Checklist
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118730495893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Project Management')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7650, 
        7650, 
        null, 
        'Go Live Checklist', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        'This go live check list manager is a simple application which lets you manage a product launch. You can organize a list of "go live" action items by project, category and sub category. Each check list item has a color coded status for easy visual reporting.'||unistr('\000a')||
''||unistr('\000a')||
'Each check list item also tracks assignees, description, risk, and rationale. Use this application to manage your product release end game.', 
        '<ul>'||unistr('\000a')||
'<li>Project Views and Visitors counters, implemented using new Oracle APEX Usage Metrics plugin</li>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-go-live-checklist', 
        'AVAILABLE', 
        '2.0.4', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '10', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        57, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Go Live Check List Home Page', 
        'Screenshot showing the dashboard home page from the Go Live Check List application, where information such as ''Projects'', ''Check List Items'' and ''Go Live Component Counts'' is available.', 
        'go_live_checklist.png'); 
 
null;
end;
/
-- Package 7800, Brookstrut Sample Application
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118825097893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7800, 
        7800, 
        null, 
        'Brookstrut Sample Application', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>This application is a hyper simplified retail sales analysis portal designed to illustrate and highlight various Oracle Application Express capabilities including integration with Google Maps.  Use this application to generate random sales transaction data and visualize this information on maps, reports, and charts.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-sample-brookstrut', 
        'AVAILABLE', 
        '1.1.5', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '6', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        45, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Brookstrut Sample Application', 
        'Screenshot showing the Sales Dashboard page from the Brookstrut Sample Application, where information such as regional and annual sales figures, and a regional ''Sales'' area chart are available.', 
        'brookstrut_sample_app.png'); 
 
null;
end;
/
-- Package 7810, Sample Reporting
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269118967488893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7810, 
        7810, 
        null, 
        'Sample Reporting', 
        'SAMPLE', 
        'DB', 
        '11.2', 
        'Y', 
        '<p>This application highlights the two primary reporting engines of Oracle Application Express Interactive Reports and Classic Reports. The interactive report sample pages highlight the following declarative features</p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li>column filtering</li>'||unistr('\000a')||
'<li>column sorting</li>'||unistr('\000a')||
'<li>row high lighting</li>'||unistr('\000a')||
'<li>drill down reporting</li>'||unistr('\000a')||
'<li>saved reports</li>'||unistr('\000a')||
'<li>report column selection</li>'||unistr('\000a')||
'<li>row and detail views</li>'||unistr('\000a')||
'<li>column formatting</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'<p>The classic report sample pages highlight:</p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li>row linking</li>'||unistr('\000a')||
'<li>column formatting</li>'||unistr('\000a')||
'<li>column sorting</li>'||unistr('\000a')||
'<li>referencing field values in report SQL using bind variables</li>'||unistr('\000a')||
'</ul>', 
        '<ul>'||unistr('\000a')||
'<li>Fixed potential upgrade/deinstall bug.</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-sample-reporting', 
        'AVAILABLE', 
        '1.2.19', 
        to_date('20150903000000','YYYYMMDDHH24MISS'), 
        '9', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        38, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Reporting', 
        'Screenshot showing an Interactive Report page in the Sample Reporting application.', 
        'reporting_sample.png'); 
 
null;
end;
/
-- Package 7820, Sample Calendar
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119006834893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7820, 
        7820, 
        null, 
        'Sample Calendar', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>This application highlights the native calendaring capabilities of Oracle Application Express.  It features a monthly calendar with stylized daily tasks.  The dates can be changed using drag and drop, which is all declarative and easily created using native Application Express wizards.  The calendar also features custom PL/SQL calendar control examples that show data in a vertical timeline, as well as a CSS Gantt chart also based on PL/SQL code.</p><p>Use this application to familiarize yourself with monthly calendars, drag and drop, monthly calendar styling, and custom PL/SQL driven calendar rendering techniques.  The CSS required is included in the "HTML Header" attribute of each page.  This makes the CSS easy to integrate into your own application.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-calendar', 
        'AVAILABLE', 
        '1.0.12', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '7', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        16, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Calendar', 
        'Screenshot showing a monthly calendar page in the Sample Calendar application.', 
        'calendar_sample.png'); 
 
null;
end;
/
-- Package 7830, Sample Charts
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119191803893903;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7830, 
        7830, 
        null, 
        'Sample Charts', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>This application highlights the charting capabilities of Oracle Application Express.  It features a number of Flash charts, which are all declarative and easily created and modified using native Application Express wizards.  It demonstrates how you can enhance your applications to visually represent your data, using Pie, Column, Gantt, Gauge, Candlestick, Scatter, and maps. The sample Combination chart demonstrates how you can generate a combined Bar and Line chart.  Chart attributes such as color, font, axes and legend settings can be easily modified to suit your requirements. The application also features a custom PL/SQL chart example that shows data in a vertical timeline, as well as a CSS Bar chart also based on PL/SQL code.</p><p>Use this application to familiarize yourself with the various Flash charting options available, and custom PL/SQL driven chart rendering techniques.  The CSS required is included in the "HTML Header" attribute of each page.  This makes the CSS easy to integrate into your own application.', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-charts', 
        'AVAILABLE', 
        '1.0.14', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '9', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        18, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Charts', 
        'Screenshot showing a chart page with a combination chart, where 2 data series are displayed in an ''Annual Stock Valuations'' chart, from the Sample Charts application.', 
        'chart_sample.png'); 
 
null;
end;
/
-- Package 7840, Sample Dynamic Actions
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119211676893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7840, 
        7840, 
        null, 
        'Sample Dynamic Actions', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>This application demonstrates a number of different dynamic actions that can be incorporated into an application. These declarative client-side behaviors include simple examples for manipulating the display of components, style examples for changing the appearance of components, and server-side examples which interact with the database. Some of the examples include plug-ins which further extend the capabilities of dynamic actions.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-dynamic-actions', 
        'AVAILABLE', 
        '1.0.12', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '9', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        27, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Dynamic Actions', 
        'Screenshot showing a sample report page, from the Dynamic Actions sample application.', 
        'dyn_actions_sample.png'); 
 
null;
end;
/
-- Package 7850, Sample Data Loading
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119305167893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7850, 
        7850, 
        null, 
        'Sample Data Loading', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>The data loading sample application is built on simple EMP and DEPT tables to highlight how developers can define pages to allow end users to upload spreadsheet data into an existing table. The example includes column lookups on the Manager and Department columns such that the users can specify names instead of numbers when uploading. For example, the end user would know an employee belongs to the Accounting department but may not know that Accounting is department number 10. Similarly instead of specify a manager as employee number 7839 they can specify the employee name of King.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-data-loading', 
        'AVAILABLE', 
        '1.0.11', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '8', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        10, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Data Loading', 
        'Screenshot showing the 1st page of a data load wizard where the user selects the ''Data Load Source'', from the Sample Data Loading application.', 
        'data_load_sample.png'); 
 
null;
end;
/
-- Package 7860, Sample Master Detail
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119453981893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7860, 
        7860, 
        null, 
        'Sample Master Detail', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>This application highlights the native master detail capabilities of Oracle Application Express.  The application has two master detail reports on the same department and employee sample data set.  The first master detail highlights departments as the master and employees as the detail.  The second uses the employees table for both the master and detail, allowing for an employee to be updated along with their direct reports.</p> <p>Declarative form validations of not null and numeric values are included, along with select list controls and the ability to add additional rows.  This sample application highlights improvements made to tabular forms in release 4.1 including the highlighting of cells that fail validation conditions.  Use this application to better understand the native and declarative master detail form functionality of Oracle Application Express.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Set compatibility mode to 4.2</li>'||unistr('\000a')||
'<li>New responsive theme with grid layout, Theme 25</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-master-detail', 
        'AVAILABLE', 
        '1.0.9', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '7', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        13, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Master Detail', 
        'Screenshot showing a master detail page, where master ''Department'' information can be edited on the same page as multiple ''Employees'' from that department, in the Sample Master Detail application.', 
        'md_sample.png'); 
 
null;
end;
/
-- Package 7890, Feedback
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119546756893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Software Development')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7890, 
        7890, 
        null, 
        'Feedback', 
        'PACKAGE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>This application helps you to quickly submit, organize, sort, and view feedback for multiple applications. You can define types, components, and sub-components and view feedback based on these categories. The application includes reports that show you feedback collected over time.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Graphical representation of Access Control status on Administration page</li>'||unistr('\000a')||
'<li>Bug fixes</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-feedback', 
        'AVAILABLE', 
        '2.0.3', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '7', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        53, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Provide Feedback', 
        'Screenshot showing a page to submit feedback from the Feedback application.', 
        'feedback.png'); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Manage Feedback', 
        'Screenshot showing the dashboard home page from the Feedback application.', 
        'feedback_admin.png'); 
 
null;
end;
/
-- Package 7900, Sample Dialog
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119635899893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7900, 
        7900, 
        null, 
        'Sample Dialog', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>See how you can leverage jQuery to launch basic, model, and stylized dialogs from within Oracle Application Express.  View the sample dialogs and see and copy the implemenation.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-sample-dialog', 
        'AVAILABLE', 
        '1.0.9', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '8', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        11, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Dialog', 
        'Screenshot showing a sample modal dialog used to edit simple ''Department'' information, from the Sample Dialog application.', 
        'sample_dialog.png'); 
 
null;
end;
/
-- Package 7910, Sample Trees
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119749334893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7910, 
        7910, 
        null, 
        'Sample Trees', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Learn how to create a tree control using a SQL query.  This application shows various methods of integrating tree controls into your Oracle Application Express application.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Removed Project Document Example</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-trees', 
        'AVAILABLE', 
        '1.0.11', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '8', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        11, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Trees', 
        'Screenshot showing a tree page containing ''Project'' tree nodes and ''Task'' and ''Subtask'' leaf nodes under these ''Projects'', from the Sample Trees application.', 
        'sample_trees.png'); 
 
null;
end;
/
-- Package 7940, Sample Collections
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119824744893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7940, 
        7940, 
        null, 
        'Sample Collections', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Sample Collections enables you to store rows of data for use within a Oracle Application Express session. This database application illustrates how to use PL/SQL to create and manage collection-based session state.<p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-collections', 
        'AVAILABLE', 
        '1.1.8', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '8', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        14, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample Collections', 
        'Sample Collections', 
        'sample_collections.png'); 
 
null;
end;
/
-- Package 7950, Sample Timezone
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269119915148893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7950, 
        7950, 
        null, 
        'Sample Timezone', 
        'SAMPLE', 
        'DB', 
        '10.2.0.4', 
        'Y', 
        '', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Set compatibility mode to 4.2</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-timezone', 
        'HIDDEN', 
        '', 
        null, 
        '1', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        null, 
        'English', 
        null, 
        '', 
        '', 
        '', 
        '', 
        null, 
        null, 
        ''); 
 
null;
end;
/
-- Package 7960, Sample File Upload and Download
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269120002142893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7960, 
        7960, 
        null, 
        'Sample File Upload and Download', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>Learn how to create Oracle Application Express applications that include file upload and download. Upload files using dialogs as well as dedicated pages. See how to download files stored in Oracle database BLOB columns within database tables. Specifically see how to produce file download links from interactive reports, classic reports, forms, and dynamically created HTML content.</p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'', 
        '', 
        'app-sample-file-upload-download', 
        'AVAILABLE', 
        '2.0.4', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '9', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        13, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample File Upload and Download', 
        'Screenshot showing a dashboard page with ''Project Summary'' information, and any recent files relating to that ''Project'' with a link to download those files, from the Sample File Upload and Download application.', 
        'sample_file.png'); 
 
null;
end;
/
-- Package 7980, Sample RESTful Services
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269120114382893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        7980, 
        7980, 
        null, 
        'Sample RESTful Services', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>This application highlights the RESTful Service capabilities of Oracle Application Express. It demonstrates how you can enhance your applications to consume RESTful Services via a Web Service Reference. </p>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'<p><b>Pre-requisites</b></p>'||unistr('\000a')||
'<p>To successfully run this application, the following pre-requisites must be met:</p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li>1. RESTful Services must be configured on the instance.  To learn more, see the <a href="http://docs.oracle.com/cd/E37097_01/doc/doc.42/e35129/adm_mg_service_set.htm#autoId24">Oracle Application Express Installation Guide</a>.</li>'||unistr('\000a')||
'<li>2. Network Services must be enabled in the database.  To learn more, see <b>Enable Network Services in Oracle Database 11g</b> in the <a href="http://www.oracle.com/technetwork/developer-tools/apex/documentation/index.html">Oracle Application Express Installation Guide</a>.</li>'||unistr('\000a')||
'<li>3. ''Enable RESTful Services'' must be set to ''Yes'' at both instance and workspace level.  See <i>Administration > Manage Instance > Feature Configuration</i>.</li>'||unistr('\000a')||
'<li>4. ''Allow RESTful Access'' must be set to ''Yes'' at instance level.  To learn more, see <b>Controlling RESTful Access</b> in the <a href="http://docs.oracle.com/cd/E37097_01/doc/doc.42/e35129/adm_mg_service_set.htm#autoId24">Oracle Application Express Installation Guide</a></li>'||unistr('\000a')||
'<li>5. The sample ''oracle.example.hr'' RESTful Service Module must exist in the workspace. To learn more, see <b>About the Example RESTful Service Module (oracle.example.hr)</b> in the <a href="http://docs.oracle.com/cd/E37097_01/doc/doc.42/e35128/restful_svc.htm#CIHFEDDC">Oracle Application Express SQL Workshop Guide</a>.  Use SQL Workshop > RESTful Services > Reset Sample Data to create the example.</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-sample-restful-services', 
        'HIDDEN', 
        '1.0.5', 
        to_date('20140410104843','YYYYMMDDHH24MISS'), 
        '2', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        null, 
        '4.2.3', 
        'Oracle', 
        '', 
        'http://www.oracle.com', 
        8, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Sample RESTful Services', 
        'Screenshot showing a page with an ''Employee Details'' region containing an ''Employee'' select list with an employee selected, and a ''Retrieve Employee Details'' button to trigger the calling of a RESTful service. The results of the RESTful Service are displayed in JSON format in the ''JSON Result'' region, and parsed on the ''Parsed Result'' region, taken from the Sample RESTful Services application.', 
        'sample_restful_services.png'); 
 
null;
end;
/
-- Package 8940, Universal Theme Sample Application
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269120299371893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        8940, 
        8940, 
        null, 
        'Universal Theme Sample Application', 
        'SAMPLE', 
        'DB', 
        '11.2', 
        'Y', 
        '<p>Universal Theme is an all-new user interface for your Application Express apps. This app introduces you to Universal Theme by providing an easy way to browse through the various templates, template options, and theme styles.</p>'||unistr('\000a')||
'<p>Install this application to view all the component templates that can be incorporated into an application with the new theme.  The examples demonstrate how you can easily control the layout of your pages, to create a great looking application.</p>', 
        '', 
        'app-sample-universal-theme', 
        'AVAILABLE', 
        '1.0.1', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '4', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        0, 
        '', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        25, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Universal Theme Sample Application', 
        'Application homepage introducing the Universal Theme and how to best use it.', 
        'universal_theme_app.png'); 
 
null;
end;
/
-- Package 8950, Sample Database Application
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269120377818893904;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        change_log, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        8950, 
        8950, 
        null, 
        'Sample Database Application', 
        'SAMPLE', 
        'DB', 
        '11.1', 
        'Y', 
        '<p>The Sample Database Application is an application that highlights common design concepts. It includes dedicated pages for customers, products, and orders as well as demonstrates the use of reports, charts, calendar, map, and tree.<p>', 
        '<ul>'||unistr('\000a')||
'<li>Bug fixes and minor functional improvements</li>'||unistr('\000a')||
'<li>Requires Oracle APEX 4.2.2 or greater</li>'||unistr('\000a')||
'</ul>', 
        '', 
        'app-sample-database-application', 
        'AVAILABLE', 
        '5.0.3', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '11', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        67, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Product Portal', 
        'Product Portal', 
        'product_portal.png'); 
 
null;
end;
/
-- Package 1097894920371103914, Sample Websheet - AnyCo IT Department
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269120420155893905;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        1097894920371103914, 
        null, 
        1097894920371103914, 
        'Sample Websheet - AnyCo IT Department', 
        'SAMPLE', 
        'WS', 
        '11.1', 
        'Y', 
        '<p>AnyCo IT Department highlights how to use the features and capabilities of Websheets for Web-based content sharing and reporting on business critical data. This sample Websheet application contains several data grids and demonstrates how to include data in embedded reports and charts.<p>', 
        '', 
        'app-websheet-any-co', 
        'AVAILABLE', 
        'anyco_it 1.0', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '4', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        6, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'AnyCo IT Department', 
        'AnyCo IT Department', 
        'anyco_it.png'); 
 
null;
end;
/
-- Package 1097895031667104017, Sample Websheet Application - Big Cats
 
declare
    l_id number         := null;
    l_category_1 number := null;
    l_category_2 number := null;
    l_category_3 number := null;
begin
    l_id := 269120548039893905;
    for c1 in (select id from wwv_flow_pkg_app_categories where category_name =  'Sample')
    loop
        l_category_1 := c1.id;
    end loop;

 
    insert into wwv_flow_pkg_applications ( 
        id, 
        app_id, 
        apex_application_id,
        apex_websheet_id,
        app_name, 
        app_group, 
        app_type, 
        min_db_version, 
        unlock_allowed, 
        app_description, 
        tags, 
        image_identifier, 
        app_status, 
        app_display_version, 
        app_version_date, 
        build_version, 
        app_category_id_1, 
        app_category_id_2, 
        app_category_id_3, 
        required_free_kb, 
        languages, 
        released, 
        min_apex_version, 
        provider_company, 
        provider_email, 
        provider_website, 
        app_page_count, 
        app_object_count, 
        app_object_prefix) 
    values (
        l_id, 
        1097895031667104017, 
        null, 
        1097895031667104017, 
        'Sample Websheet Application - Big Cats', 
        'SAMPLE', 
        'WS', 
        '11.1', 
        'Y', 
        '<p>Big Cats highlights many features and capabilities of Websheets, including embedding images and page links.<p>', 
        '', 
        'app-websheet-big-cats', 
        'AVAILABLE', 
        'big_cats 1.0', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '4', 
        l_category_1, 
        l_category_2, 
        l_category_3, 
        100, 
        'English', 
        to_date('20150715000000','YYYYMMDDHH24MISS'), 
        '5.0.1', 
        'Oracle', 
        '', 
        'http://oracle.com', 
        10, 
        null, 
        ''); 
 
-- Application Image 
 
    insert into wwv_flow_pkg_app_images ( 
        app_id, 
        title, 
        description, 
        file_name)
    values (
        l_id, 
        'Big Cats', 
        'Big Cats', 
        'big_cats.png'); 
 
null;
end;
/
commit;
 
begin 
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
prompt ...done
