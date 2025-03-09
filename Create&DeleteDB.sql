/*  this query is use to create new database in our system  */

create database samplebd;

/*this query is use to delete a databse in our system*/

drop database samplebd;
drop table StudentInfo;

/*this query is used to create new table in iur database

create table tablename(column1 datatype,column2 datatype,..........)*/

create table StudentInfo(Rollno varchar(20),FirstName varchar(10),LastName varchar(10),DoB date,Email varchar(50),Phone varchar(20));
/*to show/veiw all the values in our table*/
select * from StudentInfo;
/*this query is used to ALTER(important query) in our table
alter table tablename add columnname datatype
this query is used to add a column in databse
*/
alter table StudentInfo add adress varchar(100);
/*this query is used to change datatype of any specfic column*/
alter table StudentInfo alter column DoB datetime;
/*this query is used to drop any column in our table*/
alter table StudentInfo drop column LastName;
/*this query is used to change the name of a specfic column*/
exec sp_rename 'StudentInfo.FirstName','FullName';
/* insert into exixting table */
insert into StudentInfo(Rollno ,FullName , DoB , Email , Phone) values
('fall-2023/466','faizan','07-4-2006','fezan1029@gmail.com','0987654321'),
('fall-2023/479','aliraza','11-5-2019','shoaib1029@gmail.com','222254321'),
('	fall-2023/463','umer','11-9-2106','umer1029@gmail.com','8989654321'),
('fall-2023/620','hamid','12-4-2006','fezan13229@gmail.com','095555321'),
('fall-2023/412','fezaaan','09-2-2906','shoaib007@gmail.com','098754321');
/* this query is used to delete data from table
truncate table StudentInfo;*/
