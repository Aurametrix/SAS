// specify the location of an SAS library reference called "newdata"
libname newlib 'sas-library';
filename tranfile 'transport-file'
                  
host-option(s)-for-file-characteristics;
proc cimport library=newlib infile=tranfile;
run;

// creates a temporary SAS data set named WORK.GRADES:
data grades;
   infile 'file-specification';
   input Name $ 1-14 Gender $ 15-20 Section $ 22-24 Grade;
run;

// timezones and today function
/*TODAY function returns a value based on the value of the TIMEZONE= system option */
option timezone='America/Whitehorse';
data _null_;
   d1=today();
   put d1=nldate.;
run;
