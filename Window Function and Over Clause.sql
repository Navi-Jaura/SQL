-- window function :-  window function is use to show the result on each row wise 

--  over clause :- this clause is use whene we apply aggregation function the over clause   maintaine the precess and return the output row wise


use sakila;
create table emp(id int primary key auto_increment,
dept varchar(20),salary int);

insert into emp(dept,salary) values("hr",200),("hr",300),("hr",100),
("marketing",70),("marketing",50),("marketing",200),("marketing",400),
("dsa",150),("dsa",120),("dsa",40),("dsa",90),("dsa",500);

select * from emp;

select avg(salary) from emp;

select dept,avg(salary) over(partition by dept) from emp  ;

select *,sum(salary) over(partition by dept order by salary) from emp;

select *,sum(salary) over(partition by dept order by salary),
sum(salary)  over(partition by dept) from emp;


select *,max(salary) over(partition by dept ),
min(salary) over(partition by dept) from emp;




select *,
sum(salary) over(partition by dept order by salary) as rolling_dept_salary,
sum(salary) over(partition by dept) as total_dept_salary
from emp;


-- 1. rank window function : this function return rank number whene we have duplicate value return the same number and jitne number repeate honge otna aage jump jo jaige 

select id,dept,salary,
rank() over(order by salary) from emp;

select id,dept,salary,
rank() over(partition by dept order by salary) from emp;


-- dense_rank : this function return rank number whene we have duplicate value return the same number and rank is continue

select id,dept,salary,
dense_rank() over(order by salary) from emp;

select id,dept,salary,
dense_rank() over(partition by dept order by salary) from emp;


-- row_number :-   this function return row number based on row no matter value duplicate or not


select id,dept,salary,
row_number() over(order by salary) from emp;

select id,dept,salary,
row_number() over(partition by dept order by salary) from emp;