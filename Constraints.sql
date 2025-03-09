create database classtask;
/* sql not null constraint */


create table persons(
id int not null primary key,lastperson varchar(15),firstperson varchar(15),age int unique 
);
select * from persons;
insert into persons(id,firstperson,lastperson,age)values
('019','zan','rbd','18'),
('109','fzan','ren','88'),
('509','fzan','man','58'),
('809','fan','ran','98');
/*to chnage alter columns*/
alter table persons alter column age int not null;
alter table persons add unique age int;
drop table persons;
/* unique syxtax with alter is different which is
    alter table tablename add unique columnname 
-->	primary key 
create table persons(id int not null primary key);
alter table persons

add primary key(id);
*/
alter table persons
add primary key(id);
create table persons(id int not null primary key);
/*check constraint*/
create table work(
age int,firstperson varchar(20)
);
select * from work;
alter table work
/*add constraints ali check
   this is the second methord of adding constraints
*/

add check (age>18);
insert into work(age,firstperson)values
('19','shaoib');
alter table work
drop constraint age;
/*default constraints*/
create table task(age int ,firstperson varchar(20) default'enter your name');
insert into task(age)values
('19');
select * from task;
/*string can repeat
   indentity constraints
*/
create table labtsk(id int identity primary key,firstname varchar(20),secondname varchar(20),age int);
insert into labtsk(firstname,secondname,age)values
('ali','ahmad','17'),
('shoaib','rafiq','28');

select * from labtsk;