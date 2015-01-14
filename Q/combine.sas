/ * Combine Dataset A with Dataset B. Keep only those records that are contained in both A & B 

Dataset A       Dataset B
ordernumber     ordernumber
firstname       product
lastname        purchase date 

* /

/* good */

/* Sort-Sort-Merge */
proc sort data=dataseta;
 by ordernumber;
run;
proc sort data=datasetb;
 by ordernumber;
run;
data both; merge dataseta(in=a)
 datasetb(in=b);
 by ordernumber;
 if a and b;
run; 


/* SQL vs SAS */
/ *
Proc SQL;
create table result as
select a.*, b.*
from a, b
where a.ordernumber=b.ordernumber;
quit; 

*/

/* better */

/* Proc Format */
data b; set b;
 start = ordernumber;
 label = '*';
 fmtname = '$key';
run;
proc sort data=b nodupkey; by start;
run;
proc format cntlin=b; run;
data all; set a;
 if put(ordernumber,$key.) = '*';
run; 

/* best */

/* macro */
options symbolgen;
%macro doit(ds1,ds2,sortvar,mergetype);
proc sort data=&ds1;
 by &sortvar;
run;
data match; merge &ds1(in=a)
 &ds2(in=b);
 by &sortvar;
 mergetype = &mergetype;
 select(mergetype);
 when (1) if a and b;
 when (2) if a;
 when (3) if b;
 when (4) if a and not b;
 when (5) if b and not a;
 otherwise;
 end;
run;
%mend doit;
%doit(dataseta,datasetb,state,1); 
