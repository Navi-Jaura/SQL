use sakila;


show databases;

show tables;

-- kisi select
-- select statement

describe actor;

desc actor;
-- dql statement
select * from actor;

select actor_id from actor;

select actor;

desc actor;

select * from actor;

select actor_id from actor;

select * from actor;

show tables;
desc actor_info;
select * from actor_info;

-- projection and selection

select * from actor_info;
select actor_id, actor_id*10 from actor_info;

select * from actor_info;
select actor_id, actor_id*5 from actor_info;

select * from actor_info where actor_id=2;

select actor_id,first_name
from actor_info where actor_id>2;