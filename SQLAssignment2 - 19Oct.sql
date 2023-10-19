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
select s.studentid, S.FirstName, S.LastName from student as S
inner join Enrollment as E on s.studentid = S.StudentId
inner join course as C on C.CourseId = c.courseid
inner join department as D on C.DepartmentId = D.DepartmentId
where D.DepartmentName = 'MBA'
group by S.studentid, S.FirstName, S.LastName 
having count(s.studentid) > 1


--2. Question  List the names of courses that have at least one student enrolled but have not yet started.
select distinct C.coursename from course as C
inner join Enrollment as E on E.courseid = C.CourseId
where E.EnrollmentDate < '2023-10-15 15:55:02.383'


--3. Question  Find the students who are enrolled in courses from more than one department
select S.studentid, S.FirstName, S.LastName from student as S
inner join Enrollment as E on E.studentid = S.studentid
inner join course as C on C.CourseId = e.studentid
group by S.StudentId, S.FirstName, S.LastName 
having count(distinct C.departmentid) > 1


--4. Questin Retrieve the names of students who are enrolled in all courses offered by the "Engineering" 
select S.studentid, S.firstname, S.lastname from student as S
inner join Enrollment as E on E.studentid = S.studentid
inner join course as C on E.CourseId = C.CourseId
inner join department as D on C.DepartmentId = D.DepartmentId
where D.DepartmentName like '%Engineering'
group by S.StudentId, S.FirstName, S.LastName




--5 Question Calculate the total number of students enrolled in each department for each course.
select D.DepartmentName, C.CourseName, count(Distinct S.StudentId) as total from department as D
inner join course as C on C.DepartmentId = D.DepartmentId
inner join Enrollment as E on C.CourseId = E.courseid
inner join student as S on E.studentid = S.studentid
group by D.departmentname, C.coursename


--6. List the students who have the same first name as the department they are enrolled in.
select s.studentid, s.firstname, s.lastname from student as s
inner join Enrollment as E on E.studentid = s.studentid
inner join course as c on E.courseid = c.courseid
inner join department d on c.departmentid = d.departmentId
where s.firstname = d.departmentname


--7. Find the department with the highest average number of students enrolled per course.

SELECT  departmentname, AVG(Student_count) AS Avg_Students_Per_Course
FROM (
    SELECT c.departmentId, COUNT(e.CourseID) AS Student_count
    FROM Enrollment AS e
    INNER JOIN course AS c ON e.courseid = c.courseid
    GROUP BY c.DepartmentID, e.CourseID
) AS subquery
INNER JOIN department AS d on d.departmentId = subquery.departmentid
GROUP BY d.departmentname,d.departmentId
ORDER BY Avg_Students_Per_Course DESC


--8. Retrieve the students who have not enrolled in any courses offered by the "Science" department.
select S.studentid, S.firstname, S.lastname from student as S 
where S.StudentId not in 
(select E.studentid from Enrollment as E
inner join course as C on E.courseId = C.CourseId
inner join department as D on D.DepartmentId = C.DepartmentId
where D.DepartmentName = 'Computer Science')


--9. List the courses with the most recent enrolment date for each department.

select D.departmentname, C.coursename, max(E.Enrollment) as Recent from department as D
inner join course as C on C.DepartmentId = D.DepartmentId
inner join Enrollment as E on E.courseid = c.courseid
group by D.DepartmentName, C.CourseName



--10. Calculate the total number of students in the "Engineering" department who have enrolled in
--more courses than the average number of courses per student in that department.
SELECT  departmentname, AVG(Student_count) AS Avg_Students_Per_Course
FROM (
    SELECT c.departmentId, COUNT(e.CourseID) AS Student_count
    FROM Enrollment AS e
    INNER JOIN course AS c ON e.courseid = c.courseid
    GROUP BY c.DepartmentID, e.CourseID
) AS subquery
INNER JOIN department AS d on d.departmentId = subquery.departmentid
where d.departmentname = 'Mba'
GROUP BY d.departmentname,d.departmentId
ORDER BY Avg_Students_Per_Course DESC
