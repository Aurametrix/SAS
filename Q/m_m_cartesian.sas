/* cartesian product for many-to-many tables */

PROC SQL;

Create table work.merged as
    select t1.household, t1.type, t2.gender
    from prod as t1, gender as t2
    where t1.household = t2.household
quit;
