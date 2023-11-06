create database BankingSystem
use BankingSystem

create table Customer
(
CustomerId int primary key identity,
Firstname varchar(50),
LastName varchar(50),
Address Nvarchar(108),
Email Nvarchar(245)
);
insert into Customer( Firstname, LastName, Address, Email)values( 'Shalini', 'kumari', 'patna', 'shalinikumari97950@gmail.com');
insert into Customer( Firstname, LastName, Address, Email)values( 'puja', 'Singh', 'Gaya', 'pujasinghi97670@gmail.com');
insert into Customer( Firstname, LastName, Address, Email)values( 'Rani', 'Tiwari', 'Delhi', 'Ranitiwari9340@gmail.com');
insert into Customer( Firstname, LastName, Address, Email)values( 'pinki', 'patel', 'Kolkata', 'pinkipateli94560@gmail.com');

select * from Customer

create table Accounts
(
Accountid int primary key Identity,
CustomerId int,
AccountType Nvarchar(50),
Balance Decimal(18,2),
Opendate Date,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
insert into Accounts(AccountType,Balance,Opendate)values('Revenue', '23000', '9October 2023' );
insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Revenue', '23000', '5 August 2021', '1' );
insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Personal', '24000', '12 November 2022', '2' );
insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Nominal', '25000', '11 December 2023' , '3');
insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Real', '26000', '10 September 2023', '4');


update Accounts
SET CustomerId ='1' where CustomerId = 1; 


select * from Accounts

create table Transactions
(
Transactionsid int primary key identity,
Accountid int,
TransactionType nvarchar(50),
Anmmount Decimal(20,5),
TransactinsDate DateTime 
 FOREIGN KEY (Accountid) REFERENCES Accounts(Accountid)
);
--insert into Transactions(Accountid, )values('Revenue', '23000', '9October 2023' );
--insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Revenue', '23000', '5 August 2021', '1' );
--insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Personal', '24000', '12 November 2022', '2' );
--insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Nominal', '25000', '11 December 2023' , '3');
--insert into Accounts(AccountType,Balance,Opendate, CustomerId)values('Real', '26000', '10 September 2023', '4');

select * from Transactions

create table Employees
(
Employeeid int primary key identity,
FirstNmae varchar(50),
LastName varchar(50),
Email nvarchar(20),
DateOfBirth Date,
Department Nvarchar(50),
salary Decimal(20,2)
);
select * from Employees

create table Branches
(
Brancheid int primary key identity,
BrancheName varchar(50),
Locatio varchar(50),
);

select * from Branches
ALTER TABLE Branches
ADD CustomerId int;
ALTER TABLE Branches
DROP COLUMN CustomerId;

create Table Loans
(
LoanId int primary key,
 CustomerId int ,
 Amount Decimal(18, 2),
 InterestRate DECIMAL(5, 2),
 StartDate DATE,
 EndDate DATE
 FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);
select * from Loans

select * from Customer
select * from Accounts
select * from Transactions
select * from Employees
select * from Branches
select * from Loans


