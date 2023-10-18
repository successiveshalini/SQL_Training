create database Sql_Assignment1
use sql_Assignment

create table student(studentid int primary key, firstname varchar(50),lastname varchar(50))
select * from student
insert into student(studentid, firstname, lastname) values (1, 'puja', 'kumari')
insert into student(studentid, firstname, lastname) values (2, 'Rani', 'singh')
insert into student(studentid, firstname, lastname) values (3, 'priti', 'raj')
insert into student(studentid, firstname, lastname) values (4, 'soni', 'singh')


create table course(courseid int primary key, coursename varchar(50),  departmentid int )
select * from course
insert into course(courseid, coursename, departmentid) values (1, 'BCA', 2)
insert into course(courseid, coursename, departmentid) values (2, 'Mca', 3)
insert into course(courseid, coursename, departmentid) values (3, 'physics', 4)
insert into course(courseid, coursename, departmentid) values (4, 'music', 5)


create table department(departmentId int primary key, departmentname varchar(50))
select * from department
insert into department(departmentid, departmentname) values (1, 'Mca')
insert into department(departmentid, departmentname) values (2, 'Bca')
insert into department(departmentid, departmentname) values (3, 'Bba')
insert into department(departmentid, departmentname) values (4, 'Mba')



create table Enrollment(Enrollmentid int primary key, studentid int, courseid int, Enrollmentdate datetime);
select * from Enrollment
insert into Enrollment(Enrollmentid,studentid, courseid, Enrollmentdate) values (1, 2, 3, getdate());
insert into Enrollment(Enrollmentid,studentid, courseid, Enrollmentdate) values (2, 3, 6, getdate());
insert into Enrollment(Enrollmentid,studentid, courseid, Enrollmentdate) values (3, 4, 7, getdate());
insert into Enrollment(Enrollmentid,studentid, courseid, Enrollmentdate) values (4, 5, 8, getdate());

drop table Enrollment

select * from student
select * from course
select * from department
select * from Enrollment

--1. Retrieve the full names of students who are enrolled in more than one course in the "Computer science deparment
select student