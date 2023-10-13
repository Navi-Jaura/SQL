-- Some Basics Questions are Here For Practice.

-- And Answer Also Given Below:

'''Q1 How many movies a user has worked
    Actor and film_actor table
    - Number of movies should me more than 3



Q2 Get all the information of user with the maximum and minium salary
    (id , name, email, salary)


Q3 Calculating the total population where the total population should be more
than 1000  and there should be more than 2 city in each code



Q4 Finding all the countrycode where
the number of city in each country should be greater than all the
city present in each country code  ( use country table



Q5 Create a table with  id, name, salary, dept
insert all the data for all the column value

- Get the id, salary and the salary_percent of every employee where salary_percent should be percentage with employee_id 2;'''











Answer:



-- Q1 How many movies a user has worked Actor and film_actor table - Number of movies should me more than 3 ?

-- Answer.1-

use sakila;
select * from actor;
select * from film_actor;

select actor_id,count(actor_id) from film_actor 
join film_list on (film_actor.film_id=film_list.fid) 
group by actor_id having count(actor_id)>3;





-- Q2 Get all the information of user with the maximum and minium salary (id , name, email, salary)

-- Answer.2-

create table empl(id int,name varchar(20),email varchar(20),salary int);
   insert into empl values(1,'tushar','tushar@gmail.com',10000);
   insert into empl values(2,'subham','shubh@gmail.com',20000);
   insert into empl values(3,'navi','navi@gmail.com',80000);
   insert into empl values(4,'raj','rajendra@gmail.com',69000);

select * from empl;
select * from empl
    where salary = (select max(salary) from empl )
    or salary = (select min(salary) from empl); 


-- Q.3 Calculating the total population where the total population should be more than 1000  and there should be more than 2 city in each code.?

-- Answer.2-

use world;
select * from city;
select * from country;
    
select CountryCode,count(ID),sum(Population) from city
group by CountryCode
having  count(id) > 2 and sum(Population)>1000;


-- Q4 Finding all the countrycode where the number of city in each country should be greater than all the city present in each country code  ( use country table

-- Answer.4-

use world ;
select * from city ;
select countrycode, count(name) from city group by countrycode having count(name) >=all
(select  count(name) from city  
group by countrycode 
having  countrycode in('AFG','NLD','ARE', 'BGD'));
 
 
 
-- Q5 Create a table with  id, name, salary, dept insert all the data for all the column value - Get the id, salary and the salary_percent of every employee where salary_percent should be percentage with employee_id 2;

-- Answer.5 

create database emplo;
use emplo;
drop table emp;
create table emp (id int,ename varchar(20),salary int,dept varchar(20));
insert into emp values(1,'anuj',1000,'eng'),(2,'bhawna',3000,'eng'),(3,'cheenu',4500,'manager'),(4,'dollar',4600,'manager'),(5,'elisha',5000,'team leader'),(6,'shivam',7000,'team leader'),(7,'ghanshyam',7800,'eng'),(8,'hari',8000,'team leader'),(9,'kamal',3000,'team leader');
select * from emp;

select id,ename,salary,concat(round(salary / (select salary from emp where id = 2)*100,0),'%') as salarypercentage from emp;



