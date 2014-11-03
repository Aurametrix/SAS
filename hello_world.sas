%LET myName = FirstName LastName;
%PUT Hello World! My name is &myName;

/* a few more examples of variables  */
%Let age = 70;
%Let twograde = 77 + 92;
%Put &twograde

%*SilentMacro(ds=);

%Let totgrade  = %eval(77+92)
%Put &totgrade

%Let totprice  = %sysevalf(77.5+92.1)
%Put &totprice

%Let state=;
%Put &state;
