set define '^' verify off
prompt ...wwv_flow_collection_int.sql
create or replace package wwv_flow_collection_int as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2013. All Rights Reserved.
--
--    NAME
--      wwv_flow_collection_int.sql
--
--    DESCRIPTION
--      Internal utility package for wwv_flow_collection
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    11/06/2013 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Support Apex Listener excel upload for collection names that start with
-- p_file_upload_item_names(i).
--
-- This procedure is meant to be executed by the engine at the end of a
-- wwv_flow.show() FSP_SHOW_POPUPLOV request, to allow the manipulation of
-- collections that are named like file upload items.
--
-- ARGUMENTS
-- * p_security_group_id the SGID that will be used for collection manipulation
-- * p_collection_names  a table of item names
--==============================================================================
procedure enable_file_upload (
    p_security_group_id      in number,
    p_file_upload_item_names in wwv_flow_global.vc_arr2 );

--==============================================================================
-- Return the security group id for collection manipulation. The collection code
-- that is used for Apex Listener excel file upload can not simply use
-- wwv_flow_security.g_security_group_id, because that will be null. Instead,
-- it can use this function, which returns the p_security_group_id that was set
-- with enable_file_upload (see above).
--==============================================================================
function get_security_group_id
    return number;

--==============================================================================
-- Return the collection id for a given name. This function uses the SGID that
-- was set with enable_file_upload for lookup, if the collection name matches a
-- file upload item name. The function also serves as a security guard, because
-- in the case of excel upload (where wwv_flow_security.g_security_group_id is
-- null) it only accepts a collection name that starts with a valid file upload
-- item name and raises an error if it gets another collection name.
--
-- ARGUMENTS
-- * p_collection_name the collection name
--==============================================================================
function get_collection_id (
    p_collection_name in varchar2 )
    return number;

end wwv_flow_collection_int;
/
show err

