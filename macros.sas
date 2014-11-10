         /* RECOMMENDATION: Have global macro variables start and end with an
          underscore exclusively and then no confusion will ever arise. Declare
          all other macro variables as local at the start of the macro before
          using them and then they will never overwrite those of the same name
          outside the macro.  */
 
           options nodate nonotes;
          
          
          
          %*- scope of macro variables examples;
          
          
          %*- using the same macro variable inside another macro overwrites it;
          
          %let a=5;
          
          %macro testa;
          %let a=99;
          %mend testa;
          %testa;
          
          %put >> a was 5 and now a=&a;
