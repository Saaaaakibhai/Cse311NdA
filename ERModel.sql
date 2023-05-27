create database theredisson
create table reservation(
  resnumber int,
  checkin varchar(30),
  chekout varchar(30),
  constraint pk_takes primary key (resnumber,checkin),
)
insert into reservation values 
(11173,'12.30am','12.30pm'),
(21513,'1.00am','11.00pm'),
(11146,'5.00am','4.50am'),
(15493,'4.30pm','6.30pm'),
(52496,'7.45pm','7.30am'),
(96513,'4.00am','4.30pm'),
(98485,'5.00pm','5.00am');

go

create table guests(
loginID int primary key,
[name] char(30),
phone int,
[address] char(20),
pass varchar(50),
email char(10)
)
insert into guests values 
('00128','Sakib','01721','Dhaka','dfas','sakib@12'),
('00129','Anta','01965','Cumilla','adsda','anta@23'),
('13245','Sajan','01845','Feni','asd','sajan@45'),
('12045','Micheal','01322','Khulna','aklgf','micheal@34'),
('12145','Saurov','01465','Dhaka','sgvb','saurov@12'),
('12245','Jhon','01156','Maymansingh','adfd213','jhon@14'),
('19991','Rahim','01356','Pabna','afa121','rahim@474');
go

create table book(
 resnumber int,
 checkin varchar(30),
 loginID int,
 review nchar(30),
 constraint pk_takess primary key (resnumber,checkin,loginID),
 constraint fk_stu foreign key (loginID) references guests (loginID),
 constraint fk_sec foreign key (resnumber,checkin) references reservation
)
insert into book values 
(11173,'12.30am','00128','Good'),
(21513,'1.00am','00129','Bad'),
(11146,'5.00am','13245','Good'),
(15493,'4.30pm','12045','Bad'),
(52496,'7.45pm','12145','Good'),
(96513,'4.00am','12245','Bad'),
(98485,'5.00pm','19991','Good');


create table room (
number int primary key,
[level] char(30),
price int
)
insert into room values 
('111','5',90000),
('112','10',100000),
('211','3',85000),
('212','4',120000),
('311','8',50000),
('312','4',80000),
('411','6',70000);

create table request (
number int,
loginID int
 constraint pkk_takess primary key (number,loginID)
)
insert into request values
('111','00128'),
('112','00129'),
('211','13245'),
('212','12045'),
('311','12145'),
('312','12245'),
('411','19991');

create table reserve(
  resnumber int,
  checkin varchar(30),
  number int
  constraint pkkk_takess primary key (resnumber,checkin,number)
)
insert into reserve values 
(11173,'12.30am','111'),
(21513,'1.00am','112'),
(11146,'5.00am','211'),
(15493,'4.30pm','212'),
(52496,'7.45pm','311'),
(96513,'4.00am','312'),
(98485,'5.00pm','411');


