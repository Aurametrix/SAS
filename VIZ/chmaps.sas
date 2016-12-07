filename census url 
"http://www.census.gov/popest/national/files/NST_EST2009_ALLDATA.csv"; 

proc import datafile=census out=ds dbms=csv replace;
getnames=yes;
guessingrows = 58;
run;

data cpop;
set ds;
pop3mill = (census2000pop > 3000000);
run;

data us48;
   set maps.states;
   if (state ne 2) and (state ne 15) and (state ne 72);
   if density < 4;
run;

proc gproject data=us48 out=us48proj
  parallel1 = 35 parallel2=50;
  id state;
run;

title "48 States by population";
pattern1 c=red;
pattern2 c=blue;
proc gmap map=us48proj data=cpop all;
   id state;
   choro pop3mill;
run; quit;
