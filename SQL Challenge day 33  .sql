create database workforcedb;
use workforcedb;

create table employees(
employee_id int primary key,
first_name varchar(50),
last_name varchar(50),
hiredate date
);
insert into employees values
(1, "Devi", "Sethupathy", "2024-05-15"),
(2, "Rama", "Kannan", "2023-08-12"),
(3, "Raja", "Sekar", "2021-06-09"),
(4, "Siva", "Ram", "2020-03-01"),
(5, "Muthu", "Krishnan", "2018-02-23");

create table students(
student_id int primary key,
first_name varchar(50),
last_name varchar(50)
);
insert into students values 
(1, "Jeya","Balu"),
(2, "Mari", "Muthu"),
(3, "Gomathi", "sankar"),
(4, "Saravanan", "Kumar");

-- STRING FUNCTIONS --
select upper(first_name) as upperfirstname from employees;
select
	lower(last_name) as lowerlastname from employees;
select
	substring(first_name, 1, 3) as first3chars from employees;
select
	concat(first_name, ' ', last_name) as Fullname from employees;
    
-- DATE FUNCTIONS --
select employee_id, first_name, hiredate, timestampdiff(year, hiredate, now()) as tenureyears from employees; 

select employee_id, first_name as "Employe Name", ROUND(DATEDIFF(now(), HireDate)/365,2) as "Tenure Years" from employees;

-- USER DEFINED FUNCTION --

DROP function if exists DisplayName;

DELIMITER //

CREATE function DisplayName(
first_name varchar(50),
last_name varchar(50)
) returns varchar(100)
DETERMINISTIC

BEGIN
	return concat(first_name, ' ', last_name);
END //
delimiter ;

select DisplayName(first_name, last_name) from students;