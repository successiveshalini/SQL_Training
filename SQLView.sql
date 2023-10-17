create database ddl
use ddl
create table mobile(id int primary key, name varchar(100), Color varchar(50))
select * from mobile
insert into mobile(id, name, color) values (1, 'Nokia', 'Red');
create view [pink mobile] as
select name, color
from mobile
where color = 'pink';
select * from [pink mobile];
drop view [pink mobile];