proc import datafile="data\test.csv"
     out=shoes
     dbms=csv
     replace;
     getnames=no;
run;

proc print;
run;
