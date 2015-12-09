/ * not for many-to-many, faster for all others */ 
Proc sort data = PROD out =A1; by household;run;
Proc sort data = GENDER out =A2; by household;run;
Data MERGED;
    merge A1(in=a) A2(in=b);
    by household;
    if a AND b;
run;
