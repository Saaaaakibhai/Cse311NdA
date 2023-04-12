use Sakib

go

create table department200(
deptname varchar(10) primary key,
building nchar(15) NOT NULL,
budget int NULL,
constraint chkbuilding check( [building] ='NAC' or [building]='SAC' )
)

select * from department200

insert into department200 values 
('CSE','NAC',211237)

create table department500(
deptname varchar(30) primary key,
building nchar(20) NOT NULL,
budget int NULL,
constraint chkBuilding500 check 
)