--this query is use to create new database in our system 

create database A1SQL_CompanyDB;

--a new database name A1SQL_CompanyDB is created

--by using this query we can create a new table in our database

create table Employees(Employees_id int,Name varchar(30),Department varchar (20),Salary numeric(10,3));

--a new table is created  name Employees

--we use insert query to put our data in our tables

insert into Employees (Employees_id,Name, Department, Salary)VALUES
(466, 'Muhammad Fezan', 'CS', 5689.345),
(479, 'Shoaib Rafiq', 'Agriculture', 6456.29),
(628, 'Umer Malik', 'Finance', 5501.09),
(472, 'Ali Raza', 'Marketing', 52560.667),
(620, 'Haroon Hamid', 'IT', 7180.876)

--our data is inserted in records

--now to show our data we use select * from query

Select * from Employees;

--by executing this query our table and its data is shown

--now creating another table named Departments

create table Departments(Department_id int,Name varchar (30),location varchar (50));

--inserting our data

INSERT INTO Departments (Department_id,Name,location) values
(879, 'Computer_Science', 'Karachi, Sindh, Pakistan'),
(342, 'Agriculture', 'Lahore, Punjab, Pakistan'),
(676, 'Finance', 'Islamabad, Islamabad Capital Territory, Pakistan'),
(555, 'Marketing', 'Rawalpindi, Punjab, Pakistan'),
(345, 'Infornation_Technology', 'Faisalabad, Punjab, Pakistan');

--our data is inserted in records

--now to show our data we use select * from query

Select * from Departments;

--to delete a table permantly we use drop query

drop table employees;

--after this query is extcuted table named Employees is deleted permantly

--same for the departments 

drop table Departments;

--after this query is extcuted table named Departments is deleted permantly

--to add a new column in an existing table we use alter query

alter table Employees add Email varchar(30);

-- a new column/record name Email is added in the table employees

--now we want to change some parameters in the employees table and salary column

alter table Employees alter column Salary numeric(12,7);

--now salary can store numeric data according to the new modifacitions


