data _null_;
length a b $11;
a="Hello World";
b=reverse(a);
put a;
put b;
run;
