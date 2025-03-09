create table studentaddinfo(roll_number varchar(30) primary key,first_name varchar(20) not null,last_name varchar (20) not null,father_cnic varchar(30) not null,dob date,phone_number bigint not null,email varchar (50),subject_domain varchar(100) not null,fsc_marks bigint not null,other_preference varchar (100),student_status varchar (20));
select * from studentaddinfo;
insert into studentaddinfo(roll_number,first_name,last_name,father_cnic,dob,phone_number,email,subject_domain,fsc_marks,other_preference,student_status)values
('fall-2023/466','M.Fezan','Abdul Rehman','35202-0511484-5','2006/04/07','03097413565','fezan@1029gmail.com','computer_science','1098','software engeringing','active'),
('fall-2023/628','M.umer','Abdul razzaq','35204-0798974-5','2006/03/08','0303456798','adnan@102gmail.com','computer_science','678','software engeringing','active'),
('fall-2023/472','Ali raza','Abdul qayyum','35205-878786-9','2007/09/06','03076657836','ali1212@gmail.com','BBA','898','software engeringing','inactive'),
('fall-2023/479','Shoaib Rafiq','Abdul rahim','35201-1234568-3','2011/07/10','03067674369','shoaib@1029gmail.com','MBA','1077','software engeringing','inactive'),
('fall-2023/620','Haroon Hamid','Abdul qudoos','35202-5678724-5','2016/11/27','0378769895','hamid@1079gmail.com','IT','787','software engeringing','active');

/*  update (tablename) set (column_name) = (value)
   where primary_key=(value)
*/
update studentaddinfo set dob = '2009/07/19',other_preference='it'
where roll_number = 'fall-2023/466';

/*
  delete a specfic row 
*/
delete from studentaddinfo where student_status='inactive';