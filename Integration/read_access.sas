/*=================================================================* 
* PART I. Read Access Database Table Names 
*==================================================================*/ 
%let dbname = s:\project\data\study12345-678.mdb ; 
%let uid = xxxx; 
%let pwd = *****; 
%let wgdb = s:\project\data\cdms-workgroup-12345-678.mdw; 
proc import out = work.objects 
 datatable = "msysobjects" 
 dbms = access97 replace; 
 database = "&dbname"; 
 userid = "&uid"; 
 password = "&pwd"; 
 workgpdb = "&wgdb"; 
run; 
data mstable (keep = name); 
 set objects; 
 where type in (1, 6) and name not like 'MSys%'; 
run; 
