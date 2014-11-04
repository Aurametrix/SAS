/*=================================================================* 
* PART II. Extract Data from Access Tables, and Make SAS Datasets 
*==================================================================*/ 
libname mydata 's:\project\data\sasdata'; 
data _null_; 
 set mstable end=lastrec; 
 call symput('table'||left(_n_), compress(name)); 
 if lastrec then call symput('ntable', compress(_n_)); 
run; 
%macro access_import; 
%do i=1 %to &ntable; 
 %put i=&i table= &&table&i; 
 proc import out= mydata.&&table&i  datatable= "&&table&i" 
 dbms=access97 replace; 
 database="&dbname"; 
 
 userid="&uid"; 
 password="&pwd"; 
 workgpdb="&wgdb"; 
run; 
%end; 
%mend access_import; 
