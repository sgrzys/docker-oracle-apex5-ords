Rem
Rem $Header:  
Rem
Rem wwv_mig_exporter_ins.sql
Rem
Rem Copyright (c) 2006, Oracle Corporation.  All rights reserved.  
Rem
Rem    NAME
Rem      WWV_MIG_EXPORTER_INS.sql - Load Exporter details 
Rem
Rem    DESCRIPTION
Rem     This script will insert a record for each Microsoft Access
Rem     Exporter version supported. Currently supported versions 
rem     are 97,2000,2003
Rem     The exporters tool is zipped.
Rem     The files should be placed in: /i/migration
Rem	
Rem    NOTES
Rem     Initial Version
Rem
Rem    Rem
Rem    MODIFIED     (DD/MM/YY) Comments
Rem    ddaly        19/01/2006 - Created 
Rem    hfarrell     22/09/2006 - Updated version of Exporter to 10.2.0.1.0
Rem                              Added insert for XP/2002 version
Rem    hfarrell     12/02/2007 - Updated version of Exporter to 10.2.0.2.0
Rem    hfarrell     28/08/2007 - Updated version of Exporter to 10.2.0.2.5 as released with Oracle SQL Dev 1.2.0.
Rem    hfarrell     19/02/2009 - Updated with latest version from 3.2 branch: version number revised to 3.2.0.00.13 and support for 2007 also added.


prompt ...Inserting into table wwv_mig_exporter


begin
    insert into wwv_mig_exporter values ('1','10','omwb97.zip','Exporter for Microsoft Access','97','3.2.0.00.13');

    insert into wwv_mig_exporter values ('2','10','omwb2000.zip','Exporter for Microsoft Access','2000','3.2.0.00.13');

    insert into wwv_mig_exporter values ('3','10','omwb2002.zip','Exporter for Microsoft Access','2002','3.2.0.00.13');

    insert into wwv_mig_exporter values ('4','10','omwb2003.zip','Exporter for Microsoft Access','2003','3.2.0.00.13');
    
    insert into wwv_mig_exporter values ('5','10','omwb2007.zip','Exporter for Microsoft Access','2007','3.2.0.00.13');

    commit;
end;
/
