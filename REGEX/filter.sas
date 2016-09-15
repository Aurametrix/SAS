option validvarname=any;   /* This option is  needed for names with spaces */
libname Orion infomaps ...;
proc print data=Orion.'Star Schema'n
     (filter=( (NOT('Repeat Buyer'n) ) AND
               ( ('Midwest Region'n) OR 
                 ('Southwest Region'n) ) ) );
RUN;
