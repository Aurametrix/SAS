data _null_;
array _val {20} 8 (20*0);

*- assign a random value to all the cells and display -;
do i=1 to 20;
_val(i)=floor(ranuni(9)*500);
put _val(i)=;
end;

*- bubble sort -;
max=dim(_val);
swapdone=1;
do while(max > 1 and swapdone);
swapdone=0;
do i=1 to (max-1);
if _val(i)>_val(i+1) then do;
store=_val(i+1);
_val(i+1)=_val(i);
_val(i)=store;
swapdone=1;
end;
end;
max=max-1;
end;

*- display the final sorted order -;
do i=1 to 20;
put _val(i)=;
end;
run;
