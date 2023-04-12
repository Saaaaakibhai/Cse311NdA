create database datatable_withdata
GO
use datatable_withdata
go

create table department(
  dept_name nchar(30) primary key,
  building varchar(30),
  budget int
)
insert into department values 
('Biology','Watson',90000),
('Comp. Sci.','Taylor',100000),
('Elec. Eng.','Taylor',85000),
('Finance','Painter',120000),
('History','Painter',50000),
('Music','Packard',80000),
('Physics','Watson',70000);
go
create table student(
 ID int primary key,
 [name] nchar(100),
 dept_name nchar(30),
 tot_cred smallint,
 constraint d_dname foreign key (dept_name) references department(dept_name)
)
insert into student values 
(00128,'Zhang','Comp. Sci.',102),
(12345,'Shankar','Comp. Sci.',32),
(19991,'Brandt','History',80),
(23121,'Chavez','Finance',110),
(44553,'Peltier','Physics',56),
(45678,'Levy','Physics',46),
(54321,'Williams','Comp. Sci.',54),
(55739,'Sanchez','Music',38),
(70557,'Snow','Physics',0),
(76543,'Brown','Comp. Sci.',58),
(76653,'Aoi','Elec. Eng.',60),
(98765,'Bourikas','Elec. Eng.',98),
(98988,'Tanaka','Biology',120);
go
create table instructor(
 ID int primary key,
 [name] nchar(100),
 dept_name nchar(30),
 salary int,
 constraint fk_dept_dn foreign key (dept_name) references department(dept_name)
)
insert into instructor values 
(10101,'Srinivasan','Comp. Sci.',65000),
(12121,'Wu','Finance',90000),
(15151,'Mozart','Music',40000),
(22222,'Einstein','Physics',95000),
(32343,'El Said','History',60000),
(33456,'Gold','Physics',87000),
(45565,'Katz','Comp. Sci.',75000),
(58583,'Califieri','History',62000),
(76543,'Singh','Finance',80000),
(76766,'Crick','Biology',72000),
(83821,'Brandt','Comp. Sci.',92000),
(98345,'Kim','Elec. Eng.',80000);
go
create table advisor(
 s_id int primary key,
 i_id int,
 constraint fk_i_id foreign key (i_id) references instructor(ID),
 constraint fk_s_id foreign key (s_id) references student(ID)
)
insert into advisor values 
(00128,45565),
(12345,10101),
(23121,76543),
(44553,22222),
(45678,22222),
(76543,45565),
(76653,98345),
(98765,98345),
(98988,76766);
go
create table course(
 course_id char(30) primary key,
 title char(30),
 dept_name nchar(30),
 credit int,
 constraint fk_d_deptname foreign key (dept_name) references department (dept_name)
)
insert into course values 
('BIO-301','Genetics','Biology',4),
('BIO-399','Computational Biology','Biology',3),
('CS-101','Intro. to Computer Science','Comp. Sci.',4),
('CS-190','Game Design','Comp. Sci.',4),
('CS-315','Robotics','Comp. Sci.',3),
('CS-319','Image Processing','Comp. Sci.',3),
('CS-347','Database System Concepts','Comp. Sci.',3),
('EE-181','Intro. to Digital Systems','Elec. Eng.',3),
('FIN-201','Investment Banking','Finance',3),
('HIS-351','World History','History',3),
('MU-199','Music Video Production','Music',3),
('PHY-101','Physical Principles','Physics',4);
go
create table prereq(
 course_id char (30) NOT NUll,
 prereq_id char(30) NOT NUll,
 constraint pk_prereq primary key (course_id,prereq_id),
 constraint c_couid foreign key(course_id) references course (course_id),
)

insert into prereq values 
('BIO-301','BIO-101'),
('BIO-399','BIO-101'),
('CS-190','CS-101'),
('CS-315','CS-101'),
('CS-319','CS-101'),
('CS-347','CS-101'),
('EE-181','PHY-101');

go
create table classroom(
building varchar(30),
room_number int,
capacity int,
constraint pk_classroom primary key (building,room_number)
)

insert into classroom values 
('Packard',101,500),
('Painter',514,10),
('Taylor',3128,70),
('Watson',100,30),
('Watson',120,50);
go 
create table time_slot(
time_slot_id char(30) not null,
[day] char(30) not null,
start_time time not null,
end_time time,
CONSTRAINT pk_all primary key (time_slot_id,[day],start_time),
)
insert into time_slot values 
('A','M','8:00','8:50'),
('A','W','8:00','8:50'),
('A','F','8:00','8:50'),
('B','M','9:00','9:50'),
('B','W','9:00','9:50'),
('B','F','9:00','9:50'),
('C','M','11:00','11:50'),
('C','W','11:00','11:50'),
('C','F','11:00','11:50'),
('D','M','13:00','13:50'),
('D','W','13:00','13:50'),
('D','F','13:00','13:50'),
('E','T','10:30','11:45'),
('E','R','10:30','11:45'),
('F','T','14:30','15:45'),
('F','R','14:30','15:45'),
('G','M','16:00','16:50'),
('G','W','16:00','16:50'),
('G','F','16:00','16:50'),
('H','W','10:00','12:30');
go
create table section(
course_id char(30),
sec_id int,
semester char(20),
[year] int,
building varchar(30),
room_number int,
time_slot_id char(30) ,
[day] char(30) ,
start_time time ,

constraint fk_all_timeslot foreign key (time_slot_id,[day],start_time) references time_slot(time_slot_id,[day],start_time),
constraint pk_section primary key (course_id,sec_id,semester,[year]),
constraint c_b_r foreign key (building,room_number) references classroom
)
insert into section values 
('BIO-101',1,'Summer',2017,'Painter',514,'B','M','9:0'),
('BIO-301',1,'Summer',2018,'Painter',514,'A','M','8:0'),
('CS-101',1,'Fall',2017,'Packard',101,'H','W','10:0'),
('CS-101',1,'Spring',2018,'Packard',101,'F','T','14:30'),
('CS-190',1,'Spring',2017,'Taylor',3128,'E','T','10:30'),
('CS-190',2,'Spring',2017,'Taylor',3128,'A','M','8:0'),
('CS-315',1,'Spring',2018,'Watson',120,'D','W','13:0'),
('CS-319',1,'Spring',2018,'Watson',100,'B','M','9:0'),
('CS-319',2,'Spring',2018,'Taylor',3128,'C','W','11:0'),
('CS-347',1,'Fall',2017,'Taylor',3128,'A','M','8:0'),
('EE-181',1,'Spring',2017,'Taylor',3128,'C','W','11:0'),
('FIN-201',1,'Spring',2018,'Packard',101,'B','M','9:0'),
('HIS-351',1,'Spring',2018,'Painter',514,'C','W','11:0'),
('MU-199',1,'Spring',2018,'Packard',101,'D','W','13:0'),
('PHY-101',1,'Fall',2017,'Watson',100,'A','M','8:0');
go
create table teaches (
ID int,
course_id char(30),
sec_id int,
semester char(20),
[year] int,
constraint pk_teaches  primary key (ID,course_id,sec_id,semester,[year]),
constraint fk_all foreign key (course_id,sec_id,semester,[year]) references section
)
insert into teaches values
('10101','CS-101','1','Fall','2017'),
('10101','CS-315','1','Spring','2018'),
('10101','CS-347','1','Fall','2017'),
('12121','FIN-201','1','Spring','2018'),
('15151','MU-199','1','Spring','2018'),
('22222','PHY-101','1','Fall','2017'),
('32343','HIS-351','1','Spring','2018'),
('45565','CS-101','1','Spring','2018'),
('45565','CS-319','1','Spring','2018'),
('76766','BIO-101','1','Summer','2017'),
('76766','BIO-301','1','Summer','2018'),
('83821','CS-190','1','Spring','2017'),
('83821','CS-190','2','Spring','2017'),
('83821','CS-319','2','Spring','2018'),
('98345','EE-181','1','Spring','2017');
go
create table takes(
ID int,
course_id char(30),
sec_id int,
semester char(20),
[year] int,
grade char(10),
constraint pk_takes primary key (ID,course_id,sec_id,semester,[year]),
constraint fk_stu foreign key (ID) references student (ID),
constraint fk_sec foreign key (course_id,sec_id,semester,[year]) references section
)
insert into takes values 
('00128','CS-101','1','Fall','2017','A'),
('00128','CS-347','1','Fall','2017','A-'),
('12345','CS-101','1','Fall','2017','C'),
('12345','CS-190','2','Spring','2017','A'),
('12345','CS-315','1','Spring','2018','A'),
('12345','CS-347','1','Fall','2017','A'),
('19991','HIS-351','1','Spring','2018','B'),
('23121','FIN-201','1','Spring','2018','C+'),
('44553','PHY-101','1','Fall','2017','B-'),
('45678','CS-101','1','Fall','2017','F'),
('45678','CS-101','1','Spring','2018','B+'),
('45678','CS-319','1','Spring','2018','B'),
('54321','CS-101','1','Fall','2017','A-'),
('54321','CS-190','2','Spring','2017','B+'),
('55739','MU-199','1','Spring','2018','A-'),
('76543','CS-101','1','Fall','2017','A'),
('76543','CS-319','2','Spring','2018','A'),
('76653','EE-181','1','Spring','2017','C'),
('98765','CS-101','1','Fall','2017','C-'),
('98765','CS-315','1','Spring','2018','B'),
('98988','BIO-101','1','Summer','2017','A'),
('98988','BIO-301','1','Summer','2018','null');
go