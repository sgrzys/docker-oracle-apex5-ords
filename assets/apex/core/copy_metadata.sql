    set define '^'
set verify off
prompt ...wwv_flow_copy_metadata

Rem    NAME
Rem      copy_metadata.sql
Rem    Arguments:
Rem     1:  
Rem     2:
Rem     3:  Flow user
Rem    MODIFIED (MM/DD/YYYY)
Rem     cbcho  01/22/2002 - Created
Rem     cbcho  01/23/2002 - Added subscribe_region_template
Rem     cbcho  01/23/2002 - Added subscribe_list_template
Rem     cbcho  01/23/2002 - Added subscribe_report_template
Rem     cbcho  01/23/2002 - Added subscribe_field_template
Rem     cbcho  01/23/2002 - Added remove_page_reference_id
Rem     cbcho  01/23/2002 - Added remove_region_reference_id
Rem     cbcho  01/23/2002 - Added remove_list_reference_id
Rem     cbcho  01/23/2002 - Added remove_report_reference_id
Rem     cbcho  01/23/2002 - Added remove_field_reference_id
Rem     cbcho  01/23/2002 - Added push_all_page_template
Rem     cbcho  01/24/2002 - Added push_all_region_template
Rem     cbcho  01/24/2002 - Added push_all_list_template
Rem     cbcho  01/24/2002 - Added push_all_report_template
Rem     cbcho  01/24/2002 - Added push_all_field_template
Rem     cbcho  02/19/2002 - Added subscribe_security_scheme
Rem     cbcho  02/19/2002 - Added remove_scheme_reference_id
Rem     cbcho  02/19/2002 - Added push_security_scheme
Rem     cbcho  03/01/2002 - Added remove_shourtcut_reference_id
Rem     cbcho  03/01/2002 - Added push_shortcut
Rem     cbcho  03/01/2002 - Added subscribe_shortcut
Rem     cbcho  04/04/2002 - Added remove_navbar_reference_id, push_navbar and subscribe_navbar
Rem     cbcho  04/10/2002 - Added remove_lov_reference_id, push_lov, subscribe_lov
Rem     cbcho  04/19/2002 - Added refresh procedures
Rem     cbcho  05/03/2002 - Added subscription procedures for popup lov template and menu template.
Rem     cbcho  07/18/2002 - Added subscription for button template
Rem     sspadafo 09/20/2002 - Added subscribe/push/refresh/remove for custom auth setups
Rem     cbcho    05/02/2003 - Added subscription for item help
Rem     klrice   05/25/2004 - Added support for calendars
Rem     pawolf   05/14/2009 - Added support for plugins
Rem     pawolf   05/19/2011 - Changed wwv_flow_custom_auth_setups to wwv_flow_authentications (feature 581)
Rem     pawolf   03/07/2012 - Added new table wwv_flow_theme_styles (feature# 821)
Rem     msewtz   04/29/2014 - Added subscription for theme level template options (feature 1394)
Rem     msewtz   07/22/2014 - Added theme subscriptions (feature 823)
Rem     msewtz   10/10/2014 - Added theme attributes and theme styles to theme subscriptions
Rem     msewtz   10/28/2014 - Added compare_themes

create or replace package wwv_flow_copy_metadata
as
--  Copyright (c) Oracle Corporation 1999 - 2002. All Rights Reserved.
--
--
--    DESCRIPTION
--      Used to subscribe and pull flow objects.
--
--    NOTES
--      
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--    RUNTIME DEPLOYMENT: YES
--

type templ_opt_checksum_type is record (templ_opt_name varchar2(255), tmpl_opt_checksum varchar2(32767));
type templ_opt_checksum_tbl is table of templ_opt_checksum_type index by binary_integer;

procedure remove_page_reference_id (
    --
    -- This procedure removes reference id from page templates.
    --
    p_id in number
    );
    
procedure remove_region_reference_id (
    --
    -- This procedure removes reference id from region templates.
    --
    p_id in number
    );
    
procedure remove_list_reference_id (
    --
    -- This procedure removes reference id from list templates.
    --
    p_id in number
    );
    
procedure remove_report_reference_id (
    --
    -- This procedure removes reference id from report templates.
    --
    p_id in number
    );
    
procedure remove_field_reference_id (
    --
    -- This procedure removes reference id from field templates.
    --
    p_id in number
    );   
    
procedure remove_popuplov_reference_id (
    --
    -- This procedure removes reference id from a popup LOV template.
    --
    p_id in number
    );
    
procedure remove_menu_reference_id (
    --
    -- This procedure removes reference id from a menu template.
    --
    p_id in number
    );                   

procedure remove_button_reference_id (
    --
    -- This procedure removes reference id from a button template.
    --
    p_id in number
    );
    
procedure remove_calendar_reference_id (
    --
    -- This procedure removes reference id from a calendar template.
    --
    p_id in number
    );
procedure remove_scheme_reference_id (
    --
    -- This procedure removes reference id from a security scheme.
    --
    p_id in number
    );

procedure remove_shortcut_reference_id (
    --
    -- This procedure removes reference id from a shortcut.
    --
    p_id in number
    );
    
procedure remove_navbar_reference_id (
    --
    -- This procedure removes reference id from a navbar.
    --
    p_id in number
    );    
    
procedure remove_lov_reference_id (
    --
    -- This procedure removes reference id from a lov.
    --
    p_id in number
    );        

procedure remove_authentication_ref_id (
    --
    -- This procedure removes reference id from an authentication.
    --
    p_id in number );
    
procedure remove_item_help_reference_id (
    --
    -- This procedure removes reference id from an item help
    --
    p_id in number
    );      

procedure subscribe_theme_options (
    --
    -- This procedure pulls theme level options from the master theme and
    -- copies it to the subscribing theme. 
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_page_templates (
    --
    -- This procedure pulls content from all subscribed master page templates of a theme and
    -- copies it to the subscribing page templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_page_template (
    --
    -- This procedure pulls content from the master template and
    -- copies it to the subscribing template. 
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);

procedure subscribe_region_templates (
    --
    -- This procedure pulls content from all subscribed master region templates of a theme and
    -- copies it to the subscribing region templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_region_template (
    --
    -- This procedure pulls content from the master region template and
    -- copies it to the subscribing region template. 
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);

procedure subscribe_list_templates (
    --
    -- This procedure pulls content from all subscribed master list templates of a theme and
    -- copies it to the subscribing list templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_list_template (
    --
    -- This procedure pulls content from the master list template and
    -- copies it to the subscribing list template. 
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);

procedure subscribe_report_templates (
    --
    -- This procedure pulls content from all subscribed master report templates of a theme and
    -- copies it to the subscribing report templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_report_template (
    --
    -- This procedure pulls content from the master report template and
    -- copies it to the subscribing report template. 
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);

procedure subscribe_field_templates (
    --
    -- This procedure pulls content from all subscribed master field templates of a theme and
    -- copies it to the subscribing fierld templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_field_template (
    --
    -- This procedure pulls content from the master field template and
    -- copies it to the subscribing field template. 
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);
    
procedure subscribe_popuplov_templates (
    --
    -- This procedure pulls content from all subscribed master popup templates of a theme and
    -- copies it to the subscribing popup templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_popuplov_template (
    --
    -- This procedure pulls content from the master popup lov template and
    -- copies it to the subscribing popup lov template.
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);
    
procedure subscribe_menu_templates (
    --
    -- This procedure pulls content from all subscribed master menu templates of a theme and
    -- copies it to the subscribing menu templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_menu_template (
    --
    -- This procedure pulls content from the master menu template and
    -- copies it to the subscribing menu template. 
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);        

procedure subscribe_button_templates (
    --
    -- This procedure pulls content from all subscribed master button templates of a theme and
    -- copies it to the subscribing button templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);

procedure subscribe_button_template (
    --
    -- This procedure pulls content from the master button template and
    -- copies it to the subscribing button template.
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);

procedure subscribe_calendar_templates (
    --
    -- This procedure pulls content from all subscribed master calendar templates of a theme and
    -- copies it to the subscribing calendar templates.
    --
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);
    
procedure subscribe_calendar_template (
    --
    -- This procedure pulls content from the master calendar template and
    -- copies it to the subscribing calendar template.
    --
    p_master_template_id         in number,
    p_subscribing_template_id    in number
);

procedure subscribe_security_scheme (
    --
    -- This procedure pulls content from the master security scheme and
    -- copies it to the subscribing security scheme. 
    --
    p_master_scheme_id         in number,
    p_subscribing_scheme_id    in number
    );    

procedure subscribe_shortcut (
    --
    -- This procedure pulls content from the master short cut and
    -- copies it to the subscribing short cut. 
    --
    p_master_shortcut_id         in number,
    p_subscribing_shortcut_id    in number
    );
    
procedure subscribe_navbar (
    --
    -- This procedure pulls content from the master navbar and
    -- copies it to the subscribing navbar. 
    --
    p_master_navbar_id         in number,
    p_subscribing_navbar_id    in number
    );    
    
procedure subscribe_lov (
    --
    -- This procedure pulls content from the master lov and
    -- copies it to the subscribing lov. 
    --
    p_master_lov_id         in number,
    p_subscribing_lov_id    in number
    );
    
procedure subscribe_authentication (
    --
    -- This procedure pulls content from the master authentication and
    -- copies it to the subscribing authentication.
    p_master_auth_id      in number,
    p_subscribing_auth_id in number );

procedure subscribe_item_help (
    --
    -- This procedure pulls content from the master item help and
    -- copies it to the subscribing item help. 
    p_master_item_id         in number,
    p_subscribing_item_id    in number
    );

--
-- This procedure pulls content from the master theme style and
-- copies it to the subscribing theme style.
--
procedure subscribe_theme_style (
    p_master_theme_style_id      in number,
    p_subscribing_theme_style_id in number );

procedure push_page_template (
    --
    -- This procedure pushes content of the page template to
    -- all templates that reference this page template.
    --
    p_template_id in number
    );
    
procedure push_region_template (
    --
    -- This procedure pushes content of the region template to
    -- all templates that reference this region template.
    --
    p_template_id in number
    );    
    
procedure push_list_template (
    --
    -- This procedure pushes content of the list template to
    -- all templates that reference this list template.
    --
    p_template_id in number
    );    
    
procedure push_report_template (
    --
    -- This procedure pushes content of the report template to
    -- all templates that reference this report template.
    --
    p_template_id in number
    );    
    
procedure push_field_template (
    --
    -- This procedure pushes content of the field template to
    -- all templates that reference this field template.
    --
    p_template_id in number
    );   
    
procedure push_popuplov_template (
    --
    -- This procedure pushes content of the popup LOV template to
    -- all templates that reference this popup LOV template.
    --
    p_template_id in number
    );
    
procedure push_menu_template (
    --
    -- This procedure pushes content of the menu template to
    -- all templates that reference this menu template.
    --
    p_template_id in number
    );  
    
procedure push_button_template (
    --
    -- This procedure pushes content of the button template to
    -- all templates that reference this button template.
    --
    p_template_id in number
    );           
         
procedure push_calendar_template (
    --
    -- This procedure pushes content of the calendar template to
    -- all templates that reference this calendar template.
    --
    p_template_id in number
    );           
         
procedure push_security_scheme (
    --
    -- This procedure pushes content of the security scheme to
    -- all security schemes that reference this security scheme.
    --
    p_scheme_id in number
    );  
    
procedure push_shortcut (
    --
    -- This procedure pushes content of the short cut to
    -- all short cuts that reference this short cut.
    --
    p_shortcut_id in number
    );     
    
procedure push_navbar (
    --
    -- This procedure pushes content of the navbar to
    -- all navbars that reference this navbar.
    --
    p_navbar_id in number
    );      
    
procedure push_lov (
    --
    -- This procedure pushes content of the lov to
    -- all lovs that reference this lov.
    --
    p_lov_id in number
    );  
    
procedure push_authentication (
    --
    -- This procedure pushes content of the authentication to
    -- all authentications that reference this authentication.
    --
    p_authentication_id in number );
    
procedure push_item_help (
    --
    -- This procedure pushes content of the item help to
    -- all item helps that reference this item help.
    --
    p_item_id in number
    );      

--
-- This procedure pushes content of the theme style to
-- all theme styles that reference this theme style.
--
procedure push_theme_style (
    p_theme_style_id in number );
    
procedure refresh_page_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );

procedure refresh_region_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );
    
procedure refresh_report_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );
    
procedure refresh_list_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );
    
procedure refresh_field_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    ); 
    
procedure refresh_popuplov_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );
    
procedure refresh_menu_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );
    
procedure refresh_button_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );    
            
procedure refresh_calendar_template (
    --
    -- If the master template ID is not passed, get the master template ID
    -- and refresh subscribing template.
    -- 
    p_subscribing_template_id    in number
    );    
            
procedure refresh_navbar (
    --
    -- If the master navbar ID is not passed, get the master navbar ID
    -- and refresh subscribing navbar.
    p_subscribing_navbar_id    in number
    );    
    
procedure refresh_lov (
    --
    -- If the master LOV ID is not passed, get the master LOV ID
    -- and refresh subscribing LOV.
    --
    p_subscribing_lov_id   in number
    );     
    
procedure refresh_shortcut (
    --
    -- If the master shortcut ID is not passed, get the master shortcut ID
    -- and refresh subscribing shortcut.
    --
    p_subscribing_shortcut_id    in number
    );  
    
procedure refresh_security_scheme (
    --
    -- If the master security scheme ID is not passed, get the master security scheme ID
    -- and refresh subscribing security scheme.
    --
    p_subscribing_scheme_id   in number
    );  
    
procedure refresh_authentication (
    --
    -- If the master authentication ID is not passed, get the master authentication ID
    -- and refresh subscribing authentication.
    --
    p_subscribing_auth_id in number );

procedure refresh_item_help (
    --
    -- If the master item help ITEM ID is not passed, get the master item help ITEM ID
    -- and refresh subscribing item help.
    --
    p_subscribing_item_id    in number
    );

procedure refresh_theme_style (
    --
    -- If the master theme style ID is not passed, get the master theme style ID
    -- and refresh subscribing theme style.
    --
    p_subscribing_theme_style_id in number );
  
function template_options_match (
    --
    -- compares template options of template with those of master template
    --
    p_template_id    in number,
    p_reference_id   in number
) return boolean;

function compare_themes (
    --
    -- compares all templates of the subscribing theme with the references templates in the master themes
    --
    p_subscribing_theme_id in number
) return number;

procedure unsubscribe_theme (
    --
    -- This procedure removes all reference IDs from the theme and
    -- associated templates
    --  
    p_subscribing_theme_id in number
);

procedure resubscribe_theme (
    --
    -- This procedure re-subscribes templates within a theme to corresponding templates in a master 
    -- theme based on matching template name 
    p_master_theme_id      in number,
    p_subscribing_theme_id in number  
);

procedure subscribe_theme (
    --
    -- This procedure pulls all templates and related components from the master theme and
    -- copies it to the subscribing theme. 
    --  
    p_master_theme_id      in number,
    p_subscribing_theme_id in number
);  
end wwv_flow_copy_metadata;
/
show errors
