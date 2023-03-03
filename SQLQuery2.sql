create database nsu2
go
use nsu2
go

create table department(
deptname char(10),
builing varchar(8),
budget int,
constraint dndeptname primary key (deptname)
)

create table instructor 
(
id smallint primary key,
[name]nchar(100),
deptname char(10),
salary int,
-- foreign key deptname in instructor table and it reference departname table deptname 
constraint ins_dptn_fk foreign key (deptname) references department ([deptname])
)

create table instructor_1
(
id smallint primary key,
[name] nchar (100),
deptname char(10),
salary int,
foreign key(deptname) references department ([deptname])
)

create table instructor2(
id smallint primary key,
[name] nchar(100),
deptname char(10) 
foreign key (deptname) references department([deptname]),
salary int,
)
insert into department values
('Pharmacy','NAC',12345),
('Civil','SAC',45894)

select * from department 

insert into instructor values
--('1010','Srinivason','CSE',6000),
(1011,'Wu','civil',4000)

select * from instructor 

create table instructor5
(
id smallint primary key,
[name]nchar (100),
deptname char(10) foreign key (deptname) references department,
salary int
)

create table instructor6
(
id smallint,
[name]nchar (100),
deptname char(10) foreign key (deptname) references department,
salary int
)


















