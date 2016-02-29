data leap_years(keep=year);
  length date 8;
  do year=2000 to 2200;
    /* MISSING when Feb 29 not a valid date */
    date=mdy(2,29,year);
    if not missing(date) then
      output;
  end;
run;
