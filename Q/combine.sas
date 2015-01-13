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
