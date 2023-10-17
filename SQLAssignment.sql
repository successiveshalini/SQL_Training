create database ABC3
Use ABC3
create table tbl_Employee(EmployeeID int primary key, firstname varchar(50),lastname varchar(50), DepartmentID int)
insert into tbl_Employee(EmployeeID,firstname,lastname )values(1, 'Shalini','kumari')
select * from tbl_Employee
update tbl_Employee set DepartmentID=101 where EmployeeID=1

create table tbl_Depatment (Departmentid int primary key, departmentname varchar(50))
select * from tbl_Depatment

create table tbl_Orders(OrderID int PRIMARY KEY,CustomerId int, OrderDate date)
select * from tbl_Orders

create table tbl_OrdersDetails(OrderDetailID int PRIMARY KEY,OrderId int,ProductID int, Quantity int);
select * from tbl_OrdersDetails

create table tbl_Products (ProductID int PRIMARY KEY,ProductName varchar(50), UnitPrice int);
select * from tbl_Products

Insert Into tbl_Orders Values(1002,12,'2123-07-23')
Insert Into tbl_Orders Values(1345,13,'2423-08-24')
Insert Into tbl_Orders Values(1239,14,'2123-09-18')

select * from tbl_Orders

ALTER TABLE tbl_Department ADD  FOREIGN KEY (departmentID) REFERENCES tbl_Employees (departmentID); 

--Question 1 Retrieve the first and last names of all employees.

SELECT firstname, lastname From tbl_Employee;

--QUESTION 2 Find the total number of employees in each department.

SELECT departmentID, COUNT(*) FROM tbl_Depatment  GROUP BY departmentID;

--Question 3:List the names of departments that have no employees.

SELECT * FROM tbl_Employee  WHERE departmentID NOT IN (select departmentID FROM tbl_Employee);

--Question 4: Retrieve the details of the employee with the highest EmployeeID.

SELECT TOP 1 * FROM tbl_Employee  ORDER BY EmployeeID DESC ;

--Quesrion 5: Calculate the average quantity of products ordered in the OrderDetails table

SELECT AVG(Quantity) AS Average FROM tbl_OrdersDetails ;

--Question 6:List the names of employees who have placed orders.
select e.firstname, e.lastname 
FROM tbl_Employee as e inner join tbl_Orders as O on O.CustomerId=E.EmployeeID

--Question 7: Find the total number of orders placed in each year.
select year(orderdate),Count(orderid)
from tbl_Orders
group by year(OrderDate)

--Question 8: Retrieve the product names that have never been ordered.
select ProductName
from tbl_Products 
where ProductID NOT IN (select ProductID from tbl_OrdersDetails)

--Question 9: List the employees who have the same first name as their department.
SELECT EmployeeID firstname,  departmentname
FROM tbl_Employee
join tbl_Depatment d ON firstname = departmentname

--Question 10 : Calculate the total price of products sold in each order.
select ProductName, Unitprice, Quantity, UnitPrice*Quantity as total
from tbl_Products as P
inner join tbl_OrdersDetails as OD on p.ProductID = OD.ProductID

--Question 11 : Find the customer who placed the largest total value of orders.

--Question 12 : Retrieve the employee with the highest total quantity of products ordered.
select 


