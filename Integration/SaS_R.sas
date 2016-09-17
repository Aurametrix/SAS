%let dir = %sysfunc(getoption(work)); /*achieve the work directory path*/
proc EXPORT data=sashelp.cars
outfile= "&dir\rindata.csv"
DBMS=CSV REPLACE;
proc IML;
submit /R;
dataset = read.csv("rindata.csv")
print(dataset)
endsubmit;
quit;

%let dir = %sysfunc(getoption(work));
proc EXPORT data=sashelp.cars
outfile= "&dir\rindata.csv"
DBMS=CSV REPLACE;
run;
proc IML;
submit /R;
dataset = read.csv("rindata.csv")
lm.MPG = lm(MPG_City ~ .,data=dataset) /*call lm function in R*/
yhat = fitted.values(lm.MPG)
library(foreign)
outdata = data.frame(pred = yhat, resid = r)
write.foreign(df=outdata,datafile="routdata_out_data.csv",codefile="routdata_out_data.sa s",
package="SAS")
endsubmit;
quit;
data export_train ;
INFILE "&dir\routdata_out_data.csv" DSD LRECL= 200;
INPUT pred resid;
run;

proc IML;
run ExportDataSetToR("sashelp.cars", "indata");
submit /R;
print(indata)
endsubmit;
quit

proc iml;
/* Transfer SAS dataset into R */
run ExportDataSetToR("sashelp.cars", "indata"); /* Transfer parameters into R */
_family = "gaussian";
_inputs = '"Make","Horsepower","Cylinders","MPG_City"';
submit _family _inputs /R;
varnames <- c(&_inputs)
lm.MPG = glm(MPG_City ~., data=indata[varnames], family=&_family)
yhat = fitted.values(lm.MPG)
print(yhat)
endsubmit;
quit;

%let family = gaussian;
%let inputs = 'Make', 'Horsepower', 'Cylinders', 'MPG_City';
proc iml;
/* Transfer SAS dataset into R */
run ExportDataSetToR("sashelp.cars", "indata");
/* Transfer parameters into R */
_family = "&family";
_inputs = "&inputs";
submit * /R;
varnames <- c(&_inputs)
lm.MPG = glm(MPG_City ~., data=indata[varnames], family=&_family)
yhat = fitted(lm.MPG)
print(yhat)
endsubmit;
quit;

