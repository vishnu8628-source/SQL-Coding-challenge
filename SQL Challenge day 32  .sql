create database school_db;
use school_db;

create table students(
student_id int primary key,
student_name varchar(50),
course_id int);

create table courses(
course_id int primary key,
course_name varchar(50));

insert into students values 
(1, "kathiravan", 101),
(2, "Meenakshi", 102),
(3, "Madhan", 103),
(4, "Priya", 104),
(5, "Aswini", 105);

insert into students(student_id,student_name) values 
(6, "Balu");

insert into courses values
(101, "Biology"),
(102, "Maths"),
(103, "History"),
(104, "Computer science"),
(105, "Commerce");

insert into courses values 
(107, "Computer Commerce");

-- INNER JOIN --
select s.student_name, c.course_name from students s inner join courses c on s.course_id = c.course_id;

-- LEFT AND RIGHT JOIN --
select s.student_name, c.course_name from students s left join courses c on s.course_id = c.course_id;
select s.student_name, c.course_name from students s right join courses c on s.course_id = c.course_id;

create table employees_current(
emp_id int primary key,
emp_name varchar(50));

insert into employees_current values 
(1, "Arjun"),
(2, "Karthika"),
(3, "Mohan"),
(4, "Lakshmi"),
(5, "Seenu");


create table employees_past(
past_emp_id int primary key,
past_emp_name varchar(50));

insert into employees_past values
(3, "Mohan"),
(5, "Seenu"),
(6,"Sakthivel"),
(7, "Vasuki");

-- UNION VS UNION ALL --
select emp_name from employees_current union select past_emp_name from employees_past;

select emp_name from employees_current union all select past_emp_name from employees_past;