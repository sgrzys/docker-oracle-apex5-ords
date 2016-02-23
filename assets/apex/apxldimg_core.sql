Rem Copyright (c) 2004, 2014, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxldimg_core.sql
Rem
Rem    DESCRIPTION
Rem      This script will load Application Express images into XDB.
Rem
Rem    NOTES
Rem      This script should be run as SYS.
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     jstraub    02/03/2014 - Created - split off from apex_epg_config_core.sql
Rem     jstraub    02/04/2014 - Fixed query to clean-up old images (or i) directories
Rem     jstraub    03/26/2014 - Added new argument in call to createcrossconfolder for 12.1.0.2.0
Rem     jstraub    05/22/2014 - Reverted createcrossconfolder for 12.1.0.2.0

set define '&' verify off
set serveroutput on

declare
    c_file_list             constant varchar2(30) := 'imagelist.xml';
    c_upload_directory_name constant varchar2(30) := '&IMGDIR.';
    repository_folder_path  varchar2(30);
    pathseparator           varchar2(1) := '/';
    index_file              varchar2(30) := 'index.htm';

    directory_path          varchar2(256);

    target_folder_path      varchar2(256);
    target_file_path        varchar2(256);
    target_file_name        varchar2(256);

    resource_path           varchar2(256);

    filelist_xml            sys.xmltype := sys.xmltype(bfilename(c_upload_directory_name, c_file_list), nls_charset_id('AL32UTF8') );
    content_bfile           bfile;

    result                  boolean;

    filelist_dom            xdb.dbms_xmldom.domdocument;
    files_nl                xdb.dbms_xmldom.domnodelist;
    directory_nl            xdb.dbms_xmldom.domnodelist;
    filename_nl             xdb.dbms_xmldom.domnodelist;
    files_node              xdb.dbms_xmldom.domnode;
    directory_node          xdb.dbms_xmldom.domnode;
    file_node               xdb.dbms_xmldom.domnode;
    text_node               xdb.dbms_xmldom.domnode;
    l_mv_folder             varchar2(30);
begin

  $if sys.dbms_db_version.ver_le_10 $then
    repository_folder_path := '/i/';
  $else
    repository_folder_path := '/images/';
  $end

    --clean up old images directories
    for c1 in (select any_path
                 from xdb.resource_view
                where regexp_like(any_path,'(/i)$|(/images)$|(/images_20[0-9]{10})$|(/i_20[0-9]{10})$','c')
                  and instr(any_path,'/',2) = 0) loop
        if xdb.dbms_xdb.existsresource(c1.any_path||'/wwv_create_33.gif') or xdb.dbms_xdb.existsresource(c1.any_path||'/apex_version.txt') then
            xdb.dbms_xdb.deleteresource( abspath => c1.any_path, delete_option => xdb.dbms_xdb.delete_recursive_force );
        end if;
    end loop;

    result           := xdb.dbms_xdb.createfolder(repository_folder_path);

  -- create the set of folders in the xdb repository

  filelist_dom := xdb.dbms_xmldom.newdomdocument(filelist_xml);

  directory_nl := xdb.dbms_xmldom.getelementsbytagname(filelist_dom,'directory');

  for i in 0 .. (xdb.dbms_xmldom.getlength(directory_nl) - 1) loop
    directory_node := xdb.dbms_xmldom.item(directory_nl,i);
    text_node      := xdb.dbms_xmldom.getfirstchild(directory_node);
    directory_path := xdb.dbms_xmldom.getnodevalue(text_node);
    directory_path := repository_folder_path || directory_path;
    result         := xdb.dbms_xdb.createfolder(directory_path);
  end loop;

    -- load the resources into the xml db repository

  files_nl           := xdb.dbms_xmldom.getelementsbytagname(filelist_dom,'files');
  files_node         := xdb.dbms_xmldom.item(files_nl,0);

  filename_nl := xdb.dbms_xmldom.getelementsbytagname(filelist_dom,'file');

  for i in 0 .. (xdb.dbms_xmldom.getlength(filename_nl) - 1) loop
    file_node          := xdb.dbms_xmldom.item(filename_nl,i);

    text_node          := xdb.dbms_xmldom.getfirstchild(file_node);

    target_file_path   := xdb.dbms_xmldom.getnodevalue(text_node);
    target_file_name   := substr(target_file_path,instr(target_file_path,pathseparator,-1)+1);
    target_folder_path := substr(target_file_path,1,instr(target_file_path,pathseparator,-1));
    target_folder_path := substr(target_folder_path,instr(target_folder_path,pathseparator));
    target_folder_path := substr(target_folder_path,1,length(target_folder_path)-1);
    resource_path := repository_folder_path || target_folder_path || '/' || target_file_name;

    begin
      content_bfile := bfilename(c_upload_directory_name,target_file_path);
      if sys.dbms_lob.getlength(content_bfile) > 0 then
        result := xdb.dbms_xdb.createresource(resource_path,content_bfile,nls_charset_id('AL32UTF8'));
      else
        result := xdb.dbms_xdb.createresource(resource_path,'');
      end if;
    exception when others then
      sys.dbms_output.put_line('file not found: '||target_file_path);
    end;

  end loop;

  -- need to remove index.htm link to XE license page
  if xdb.dbms_xdb.existsresource('/'||index_file) then
    xdb.dbms_xdb.deleteresource('/'||index_file,1);
  end if;

  commit;
end;
/


Rem During an upgrade of Application Express, the previous images directory is copied and renamed.  There are
Rem resources in the images directory shipped with Application Express 3.0 and DB 11.1.0.6 which were marked as
Rem encoded in Shift JIS when, in fact, they were encoded in utf-8.  Locate these resources and delete them.
Rem
begin
    for c1 in (select any_path
                 from xdb.resource_view
                where existsNode(res,'/Resource[CharacterSet="SHIFT_JIS" and DisplayName = "toc.xml"]') = 1 ) loop
        --
        if c1.any_path like '/images_200%' then
            xdb.dbms_xdb.deleteresource( abspath => c1.any_path, delete_option => xdb.dbms_xdb.delete_force );
        end if;
    end loop;
    --
    commit;
end;
/


Rem Update ACL (11g+ databases only):
Rem - Create a new ACL for "/images" and give ANONYMOUS read-only access to it.
Rem - Give ANONYMOUS read access to the root folder as well.
Rem
declare
  ro_anonymous_acl   varchar2(80) := '/sys/acls/ro_anonymous_acl.xml';

  procedure publish_folder(folder varchar2, acl varchar2) is
  begin
    for r in (select r.any_path path
                from xdb.resource_view r
               where xdb.under_path(r.res, folder) = 1) loop
      xdb.dbms_xdb.setACL(r.path, acl);
    end loop;
  end publish_folder;

  procedure changeOwner(resourcePath varchar2, owner varchar2, recursive boolean default false)
  as
    cursor recursiveOperation is
      select path
        from path_view
       where under_path(res,resourcePath) = 1;
  begin
    update resource_view
       set res = updateXml(res,'/Resource/Owner/text()',owner)
    where equals_path(res,resourcePath) = 1;

    if (recursive) then
      for res in recursiveOperation loop
       update resource_view
          set res = updateXml(res,'/Resource/Owner/text()',owner)
        where equals_path(res,res.path) = 1;
      end loop;
    end if;
  end changeOwner;

begin
  $if sys.dbms_db_version.ver_le_10 $then
    return;
  $end

  if not xdb.dbms_xdb.existsResource(ro_anonymous_acl) and
    (not xdb.dbms_xdb.createResource(ro_anonymous_acl,
          sys.XMLType('<acl description="Read-only privileges to anonymous"
                            xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
                            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                            xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
                            http://xmlns.oracle.com/xdb/acl.xsd">
                         <ace>
                           <grant>true</grant>
                           <principal>ANONYMOUS</principal>
                           <privilege>
                             <read-properties/>
                             <read-contents/>
                             <resolve/>
                           </privilege>
                         </ace>
                       </acl>'))) then
    raise program_error;
  end if;
  publish_folder('/images', ro_anonymous_acl);
  xdb.dbms_xdb.setACL('/images', ro_anonymous_acl);
  changeowner(
    resourcePath    => '/images',
    owner           => 'FLOWS_FILES',
    recursive       => true );

  if to_number(replace(dbms_registry.version('CATALOG'),'.',null)) < 121020 then
    if (not xdb.dbms_xdb.changePrivileges('/',
               sys.XMLType('<ace xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
                            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                            xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
                            http://xmlns.oracle.com/xdb/acl.xsd">
                              <grant>true</grant>
                              <principal>ANONYMOUS</principal>
                              <privilege>
                                <read-properties/>
                                <resolve/>
                              </privilege>
                            </ace>')) > 0) then
        raise program_error;
    end if;
  end if;
end;
/
