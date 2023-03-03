create database S_M_Mahedi_Hasan
GO
use S_M_Mahedi_Hasan
GO
create table department
(
  dept_name char(10) primary key,
  building varchar,
  budget int
)
go
create table student(
 ID smallint primary key,
 [name] nchar(100),
 dept_name char(10),
 tot_cred tinyint,
 constraint d_dname foreign key (dept_name) references department(dept_name)
)

go
create table instructor(
 ID smallint primary key,
 [name] nchar(100),
 dept_name char(10),
 salary int,
 constraint fk_dept_dn foreign key (dept_name) references department(dept_name)
)
go
create table advisor(
 s_id smallint primary key,
 i_id smallint,
 constraint fk_i_id foreign key (i_id) references instructor(ID),
 constraint fk_s_id foreign key (s_id) references student(ID)
)
go
create table course(
 course_id char primary key,
 title char,
 dept_name char(10),
 credit tinyint,
 constraint fk_d_deptname foreign key (dept_name) references department (dept_name)
)
go
create table prereq(
 course_id char NOT NUll,
 prereq_id char NOT NUll,
 constraint pk_prereq primary key (course_id,prereq_id),
 constraint c_couid foreign key(course_id) references course (course_id),
 constraint c_preid foreign key (prereq_id) references course (course_id)
)
go
create table classroom(
builing char(10),
room_number char(10),
capacity int,
constraint pk_classroom primary key (builing,room_number)
)
go 
create table time_slot(
time_slot_id char(10) unique,
[day] char(10),
start_time time,
end_time time,
primary key (time_slot_id,[day],start_time)
)
go
create table section(
course_id int,
sec_id int,
semester int,
[year] int,
builing char(10),
room_number char(10),
time_slot_id char(10) foreign key references time_slot(time_slot_id),
constraint pk_section primary key (course_id,sec_id,semester,[year]),
constraint c_b_r foreign key (builing,room_number) references classroom,
)

go
create table teaches (
ID smallint,
course_id int,
sec_id int,
semester int,
[year] int,
constraint pk_teaches  primary key (ID,course_id,sec_id,semester,[year]),
constraint fk_all foreign key (course_id,sec_id,semester,[year]) references section
)
go
create table takes(
ID smallint,
course_id int,
sec_id int,
semester int,
[year] int,
grade int
constraint pk_takes primary key (ID,course_id,sec_id,semester,[year]),
constraint fk_stu foreign key (ID) references student (ID),
constraint fk_sec foreign key (course_id,sec_id,semester,[year]) references section
)




