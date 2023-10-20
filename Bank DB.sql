create database BankingSystem3
use BankingSystem3

create Table Customer1
(
CustomerId int primary key,
FirstName varchar(50),
LastNmae varchar(50),
Address varchar(50),
Age int,
MobileNunmber int,
Branchid int,
Foreign key(Branchid) references Branch(Branchid)
)


insert into Customer1(CustomerId, FirstName, LastNmae, Address, Age, MobileNunmber)values(102,'Rakesh', 'Kumar', 'patna', 23, 8794324);

Create Table Employees1
(
EmployeesId int primary key,
EmployeesName varchar(50),
EmployeesAge int,
EmployeesAddress varchar(50),
EmployeesMobileNumber bigint,
Branchid int
Foreign key(Branchid) references Branch(Branchid)
);
select * from Employees1

Create Table Account1
(
AccountNumber int primary key,
AccountBalance int,
Opening_Date date,
AccountStatus varchar(50),
AccountHolder int,
CustomerId int,
Foreign key(CustomerId) references Customer1(CustomerId)
);
select * from Account1

Create Table Branch
(
Branchid int primary key,
BranchName varchar(50),
BranchAddress varchar(50),
BranchState varchar(50),
BranchCity varchar(50)
);
select * from Branch

Create Table Transactions1
(
Transactionid int primary key,
TransactionType varchar(50),
TransactionDate datetime,
TransactionAmmount int
);
select * from Transactions1

Create Table Loan1
(
Loanid int primary key,
Ammount int,
Starting date,
Ending date,
CustomerId int,
Foreign key(CustomerId) references Customer1(CustomerId)
);
select * from Loan1

select * from Customer1
select * from Employees1
select * from Account1
select * from Branch
select * from Transactions1
select * from Loan1
