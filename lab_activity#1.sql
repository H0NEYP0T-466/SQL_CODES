create database lab_activity_1;
use lab_activity_1;


create table Student
(
	StudentID varchar(255) primary key,
	Email varchar(255)unique,
	Age int check(Age>18),
	DepartmentID varchar(255),
	foreign key (DepartmentID) references Departments (DepartmentID)
);

create table Departments	
(
	DepartmentID varchar(255) primary key,
	DepartmentNAME varchar(255)
);
