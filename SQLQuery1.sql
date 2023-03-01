create database nsu 
use nsu 
go 
create table department(
deptname varchar(10),
builing nchar(15),
budget int
);

--showing values of table
select * from department 

--inserting values in table
insert into department values 
('ece','nac',4500)



create table department1(
deptname varchar(10),
builing nchar(15),
budget int,
constraint dkeypk primary key (deptname)
);


select * from department1
insert into department1 values 
('law','sac',4500)


create table department2(
deptname varchar(10),
builing nchar(15),
budget int
primary key (deptname)
);
insert into department2 values 
('law','sac',4500)
create table department3(
deptname varchar(10) constraint d3dnpk primary key(deptname),
builing nchar(15),
budget int
);

create table department4(
deptname varchar (10) primary key,
building nchar (20),
budget int 
)

create table department5(
deptname varchar (10),
building nchar (20) constraint d5bpk primary key (deptname),
budget int 
)

insert into department5 values 
('bba','nac',4500)
select * from [dbo].[department5]

create table department6(
deptname varchar(50),
builing nchar(50) constraint dk5dpk primary key (builing),
budget int 
)
insert into department6 values 
('law','tac',4500)