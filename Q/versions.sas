/* Approximate ship dates for major releases of SAS software.
   Ignore the day: 01JUN just means "some day in June" */
data Releases;
format Date DATE7.;
input Category $8. Release $6. Date DATE9. StatRelease $5.;
datalines;
Ancient 8.0   01Nov1999 
Ancient 8.1   01Jul2000 
Ancient 8.2   01Mar2001 
Old     9.0   01Oct2002 
Old     9.1   01Dec2003 
Old     9.1.3 01Aug2004 
Old     9.2   01Mar2008 
Recent  9.2m2 01Apr2010 9.22
Recent  9.3   12Jul2011 9.3
Recent  9.3m2 29Aug2012 12.1
Recent  9.4   10Jul2013 12.3
Recent  9.4m1 15Dec2013 13.1
Recent  9.4m2 05Aug2014 13.2
;
 
title "Major Releases SAS Software and Analytical Products";
proc sgplot data=Releases noautolegend;
styleattrs datacolors=(red yellow green);
block x=date block=category / transparency = 0.8;
scatter x=date y=release / datalabel=StatRelease datalabelpos=right
                           markerattrs=(symbol=CircleFilled size=14);
xaxis grid type=time;
yaxis type=discrete offsetmax=0.1;
run;
