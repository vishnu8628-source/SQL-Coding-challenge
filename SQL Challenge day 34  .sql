create database humanresoursedb;
use humanresoursedb;

create table employee(
emp_id int primary key,
emp_name varchar (50),
email varchar(100),
hiredate date,
jobtitle varchar(50),
salary decimal (10,2) 
);

insert into employee values
(101,"Somu", "somu11@gmail.com", "2011-01-03", "Mechanic", "30123"),
(102, "kavin", "kavin44@gmail.com", "2018-09-12", "Supervisor", "40545"),
(103, "sakthi", "sakthi@gmail.com", "2020-02-18", "Manager", "50000"),
(104, "Subhu", "Subhu23@gmail.com", "2019-04-03", "Electrician", "25000");

-- STORED PROCEDURE --

DELIMITER //

create procedure GetEmployeeDetailsByID (IN empid int)
begin 
	select * from employee where emp_id = empid;
end //

DELIMITER ;


call GetEmployeeDetailsByID(103);



alter table employee 
add column Department varchar(50);
 
 select * from employee;

update employee set department = "Maintence" where  emp_id = 101;
update employee set department = "Checking" where  emp_id = 102;
update employee set department = "Administration" where  emp_id = 103;
update employee set department = "General" where  emp_id = 104;

-- SIMPLE VIEW --
create view EmployeeDepartmentView as select emp_name as "Employee Name", department from employee;

select * from EmployeeDepartmentView;

CREATE TABLE employee1(
employee_id int primary key,
employee_name varchar(100)
);
insert into employee1 values 
(1, "Sudhan"),
(2, "Maha"); 

create table Department(
Dept_id int primary key,
Dept_Name varchar(50),
employee_id int,
foreign key (employee_id) references employee1(employee_id)
);

insert into Department values 
(11, "Finance", 1),
(12, "Sales", 2);

create table Salary(
Salary_id int,
Salary decimal (10,2),
employee_id int,
foreign key (employee_id) references employee1(employee_id)
);

insert into Salary values
(501, "50000", 1),
(502, "55000", 2);

-- COMPLEX VIEW --

select employee_name, Dept_Name, Salary from employee1 e join department d on e.employee_id = d.employee_id 
join Salary s on e.employee_id = s.employee_id;

create view EmployeeDetails as select employee_name, Dept_Name, Salary from employee1 e join department d on e.employee_id = d.employee_id 
join Salary s on e.employee_id = s.employee_id;

select * from EmployeeDetails;