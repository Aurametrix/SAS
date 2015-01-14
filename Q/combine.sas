/ * Combine Dataset A with Dataset B. Keep only those records that are contained in both A & B 

Dataset A       Dataset B
ordernumber     ordernumber
firstname       product
lastname        purchase date 

* /

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


/* SQL */
/ *
Proc SQL;
create table result as
select a.*, b.*
from a, b
where a.ordernumber=b.ordernumber;
quit; 

*/

/* */

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
