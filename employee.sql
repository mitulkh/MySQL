-- Create database for employee
CREATE DATABASE employee;

-- Use database for employee
USE employee;

-- Create tables(hobby, employee, employee_salary, employee_hobby) 
CREATE TABLE hobby(id int(12), name varchar(24), primary key(id));
CREATE TABLE employee(id int(12), first_name varchar(15), last_name varchar(15),age tinyint(3), mobile_number varchar(10), address varchar(65), primary key(id));
CREATE TABLE employee_salary(id int(12), salary decimal(8,2), date date, fk_employee_id int(12), foreign key(fk_employee_id) references employee(id), primary key(id));
CREATE TABLE employee_hobby(id int(12), fk_employee_id int(12), fk_hobby_id int(12), foreign key(fk_employee_id) references employee(id), foreign key(fk_hobby_id) references hobby(id), primary key(id));

-- Separate SELECT query to get a hobby, employee, employee_salary and employee_hobby
SELECT * FROM hobby;
SELECT * FROM employee;
SELECT * FROM employee_salary;
SELECT * FROM employee_hobby;

-- Insert data into hobby table
insert into hobby(id, name) values (201, "Singing, Reading");
insert into hobby(id, name) values (202, "Gaming, Writing");
insert into hobby(id, name) values (203, "Travelling, Dancing");
insert into hobby(id, name) values (204, "Cricket, listening");
insert into hobby(id, name) values (205, "Exploring, Watching");

-- Insert data into employee table
insert into employee(id, first_name, last_name, age, mobile_number, address) values (101, "James", "Bond", 20, "7674332933", "Manohar Society");
insert into employee(id, first_name, last_name, age, mobile_number, address) values (102, "Andrew", "Watson", 21, "7674345654", "Subhas Society");
insert into employee(id, first_name, last_name, age, mobile_number, address) values (103, "Amar", "Patel", 24, "7674332933", "Manjeet Society");
insert into employee(id, first_name, last_name, age, mobile_number, address) values (104, "John", "Smith", 21, "7674333033", "Sanskrut Society");
insert into employee(id, first_name, last_name, age, mobile_number, address) values (105, "Mitesh", "Patel", 30, "7674362935", "Rajeshwari Society");

-- Insert data into employee_salary table
insert into employee_salary(id, salary, date, fk_employee_id) values (301, 15000.00, '2021-01-20', 101);
insert into employee_salary(id, salary, date, fk_employee_id) values (302, 25000.00, '2021-01-22', 102);
insert into employee_salary(id, salary, date, fk_employee_id) values (303, 10000.00, '2021-01-21', 103);
insert into employee_salary(id, salary, date, fk_employee_id) values (304, 34000.00, '2021-01-23', 104);
insert into employee_salary(id, salary, date, fk_employee_id) values (305, 20000.00, '2021-01-25', 105);

-- Insert data into employee_hobby table
insert into employee_hobby(id, fk_employee_id, fk_hobby_id) values (401, 101, 201);
insert into employee_hobby(id, fk_employee_id, fk_hobby_id) values (402, 102, 202);
insert into employee_hobby(id, fk_employee_id, fk_hobby_id) values (403, 103, 203);
insert into employee_hobby(id, fk_employee_id, fk_hobby_id) values (404, 104, 204);
insert into employee_hobby(id, fk_employee_id, fk_hobby_id) values (405, 105, 205);

-- Update data into employee table
update employee set age = 22 where id = 102;
update employee set mobile_number = "9723593423" where id = 104;

-- Update data into employee_salary table
update employee_salary set salary = "30000" where id = 302;

-- Update data into hobby table
update hobby set name = "Travelling, Skii-diving" where id = 203;

-- Delete data from employee_hobby table
delete from employee_hobby where id = 403;
delete from employee_hobby where id = 405;

-- Delete data from employee_salary table
delete from employee_salary where id = 303;
delete from employee_salary where id = 305;

-- Delete data from employee table
delete from employee where id = 103;
delete from employee where id = 105;

-- Delete data from hobby table
delete from hobby where id = 203;
delete from hobby where id = 205;

-- Truncate all the tables
truncate table employee_salary;
truncate table employee_hobby;

set foreign_key_checks = 0;
truncate table employee;
set foreign_key_checks = 1;

set foreign_key_checks = 0;
truncate table hobby;
set foreign_key_checks = 1;

-- Create a select single query to get all employee name, all hobby_name in single column
select first_name from employee union select name from hobby;

-- Create a select query to get  employee name, his/her employee_salary
select concat(e.first_name, ' ', e.last_name) as full_name, es.salary from employee as e inner join employee_salary as es on e.id = es.fk_employee_id;
select concat(e.first_name, ' ',e.last_name) as full_name, sum(salary) as sum_salary from employee as e inner join employee_salary as es on e.id = es.fk_employee_id 
group by e.first_name;

update hobby set name = "Singing" where id = 201;
update hobby set name = "Dancing" where id = 202;
update hobby set name = "Gaming" where id = 203;
update hobby set name = "Travelling" where id = 204;
update hobby set name = "Exploring" where id = 205;

-- Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name)
select concat(e.first_name, ' ',e.last_name) as full_name, sum(es.salary) as total_salary,
(select group_concat(h.name) from hobby as h
inner join employee_hobby as eh on h.id = eh.fk_hobby_id and e.id = eh.fk_employee_id) as hobby_name 
from employee as e
left join employee_salary as es 
	on e.id = es.fk_employee_id
group by e.id;

-- Create a example of Left Join and Right Join using employee and employee_salary
SELECT concat(e.first_name, " ",e.last_name) as full_name, es.salary, es.fk_employee_id FROM employee as e left join employee_salary as es on e.id = es.fk_employee_id;
SELECT concat(e.first_name, " ",e.last_name) as full_name, es.salary, es.fk_employee_id FROM employee as e right join employee_salary as es on e.id = es.fk_employee_id;