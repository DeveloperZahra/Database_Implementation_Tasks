--(DDL)
-- create database 

CREATE DATABASE university

USE university

--hostel table
create table hostel
(
hostel_id int primary key,
hostel_name varchar(10) Not null UNIQUE,
no_of_seats int not null

);

--student table
create table student 
(
S_id int primary key,
F_name varchar(20) not null, 
L_name varchar(20) not null,
city varchar(10) not null,
state_ varchar(10) not null,
pin_code varchar(6)  not null unique,
DOB Date not null
);

-- Student_PhoneNo table 
create table Student_PhoneNo
(
S_id int not null,
PhoneNo varchar(8) not null,
foreign key (S_id) references student(S_id),
primary key(S_id, PhoneNo)
);

--faculty table 
create table faculty
(
F_id int primary key,
F_name varchar(10) not null,
department varchar(10) not null,
salary int constraint cK_faculty_salary check(salary between 325 and 1000)
);

--faculty_MobileNO table
create table faculty_MobileNO
(
F_id int not null, 
MobileNO varchar(8) not null,
Foreign key(F_id) references faculty(F_id),
primary key (F_id, MobileNO)
);

--course table 
create table course
(
course_id int primary key,
course_name varchar(10) not null,
duration DECIMAL(4, 2) not null,
);

--course_student table 
create table course_student
(
course_id int not null,
S_id int not null,
foreign key(course_id) references course(course_id),
foreign key(S_id) references student(S_id),
primary key(S_id, course_id)
);

--exams table 
create table exams
(
department_id int not null,
exam_code varchar(10) not null unique,
time00  DECIMAL(4, 2) not null,
foreign key (department_id) references department(department_id),
primary key(department_id, exam_code, time00),
date00 date not null,
room varchar(4) not null 
);

--subjects table 
create table subjects
(
subject_id int primary key,
subject_name varchar(10) not null unique,
F_id int not null,
foreign key (F_id) references faculty(F_id)
);

-- department table 
create table department
(
department_id int primary key,
d_name varchar(10) not null unique,
);




-- change the data type of duration column in course table 
alter table course
alter column duration int;


-- add foreign key in course, faculty and student table 
ALTER TABLE student
add hostel_id int;


ALTER TABLE student
ADD FOREIGN KEY(hostel_id) REFERENCES hostel(hostel_id);


alter table faculty
add department_id int;

alter table faculty
add foreign key (department_id) references department(department_id);


use University
-- (DML) 
--insert
--simple insert

insert into student(S_id,F_name,L_name,city,state_,pin_code,DOB)
values('129843','zahra','alhabsi','muscat','Ghala' , 1234,'10-07-1994' )      

insert into student(S_id,F_name,L_name,city,state_,pin_code,DOB)
values('119843','sara','almhroqi','muscat','alkhawd' , 6061,'11-07-1993' )      

--row constructor
insert into student(S_id,F_name,L_name,city,state_,pin_code,DOB)
values('219516','ali','alsiyabi','South','sur' , 3290,'12-12-2000' ) ,
      ('325706','noor','alhabsi','north','ibra' , 7601,'12-02-2001' )
  
  
  ----INSERT DATA TO Students_Mobile_Numbers TABLE 
INSERT INTO Student_PhoneNo (PhoneNo , S_id) VALUES
(99235005, 129843),
(91234567, 119843),
(90077223, 219516),
(98877115, 325706)



--(DQL)

--select 
select *
from student

select * from student 
where F_name ='ali'


select S_id,F_name
from student


select F_name + ' '+ L_name as [full name]
from student


SELECT * FROM Student_PhoneNo;


SELECT * FROM subjects;

TRUNCATE TABLE subjects;
