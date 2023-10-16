create database KLP
use KLP
create table Student1(id int primary key, Name varchar(100), RollNo int, Age int )
select * from Student1
insert into Student1(id, Name, RollNo, Age)values(1, 'shalini', 23, 21 );
insert into Student1(id, Name, RollNo, Age)values(2, 'Rani', 25, 22);
insert into Student1(id, Name, RollNo, Age)values(3, 'priti', 26, 24 );
insert into Student1(id, Name, RollNo, Age)values(4, 'soni', 24, 26 );
insert into Student1(id, Name, RollNo, Age)values(5, 'sudha', 27, 28 );
create trigger AfterInsert on Student1 after insert as 
begin
print 'your data is successfully inserted !!';
end;
create trigger AfterUpdate on Student1 after Update as
begin
print 'your data is successfully Updated !!';
end;
create trigger AfterDelete on Student1 after Delete as
begin
print 'your data is successfully Deleted !!';
end;
create table customer(id int primary key, name varchar(50), Age int, salary int)
select * from customer
drop table customer
insert into customer(id, name, Age, salary) values (1, 'priti', 23, 12300);
insert into customer(id, name, Age, salary) values (2, 'priya', 24, 24000);
create procedure GeThighsalary
@abc int
as 
Begin
select name, age, salary
from customer
where salary > @abc;
end;
Exec GeThighsalary @abc = 20000

