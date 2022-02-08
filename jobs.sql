-- Create database of Jobs
create database jobs;

-- Select jobs database for use
use jobs; 

-- Create a table(job, country, department, employee)
create table job(id int not null auto_increment, name varchar(34), min_salary decimal(7,2), max_salary decimal(7,2), primary key(id));
create table country(id int not null auto_increment, name varchar(34), primary key(id));

create table department(id int not null auto_increment, name varchar(34), fk_country_id int(10), foreign key(fk_country_id)
 references country(id) on update cascade on delete cascade, primary key(id));
 
create table employee(id int not null auto_increment, firstname varchar(15), lastname varchar(15), email varchar(55), salary decimal(7,2),
 fk_department_id int(10), fk_job_id int(10), foreign key(fk_department_id) references department(id) on update cascade on delete cascade,
 foreign key(fk_job_id) references job(id) on update cascade on delete cascade, primary key(id));
 
 -- Separate SELECT query to get a hobby, employee, employee_salary and employee_hobby
 select * from job;
 select * from country;
 select * from department;
 select * from employee;
 
-- Insert data into job table
insert into job(name, min_salary, max_salary) values ("Junior Developer", 10000, 50000);
insert into job(name, min_salary, max_salary) values ("Senior Developer", 20000, 60000);
insert into job(name, min_salary, max_salary) values ("Intern", 2000, 10000);
insert into job(name, min_salary, max_salary) values ("Marketing", 30000, 50000);
insert into job(name, min_salary, max_salary) values ("MBA", 10000, 40000);

-- Insert data into country table
insert into country(name) values ("India");
insert into country(name) values ("Australia");
insert into country(name) values ("Europe");
insert into country(name) values ("China");
insert into country(name) values ("America");

-- Insert data into department table 
insert into department(name, fk_country_id) values ("IT", 1);
insert into department(name, fk_country_id) values ("Computer", 2);
insert into department(name, fk_country_id) values ("IT", 3);
insert into department(name, fk_country_id) values ("E-commerce", 4);
insert into department(name, fk_country_id) values ("Management", 5);

-- Insert data into employee table
insert into employee(firstname, lastname, email, salary, fk_department_id, fk_job_id) values ("Mayur", "Patel", "mayurpatel23@gmail.com", 10000, 1, 1);
insert into employee(firstname, lastname, email, salary, fk_department_id, fk_job_id) values ("Rajesh", "Shah", "rajeshshah32@gmail.com", 5000, 2, 2);
insert into employee(firstname, lastname, email, salary, fk_department_id, fk_job_id) values ("Chandresh", "Soni", "chandreshpatel23@gmail.com", 14000, 3, 3);
insert into employee(firstname, lastname, email, salary, fk_department_id, fk_job_id) values ("Lokesh", "Bhanderi", "lokeshbh23@gmail.com", 17000, 4, 4);
insert into employee(firstname, lastname, email, salary, fk_department_id, fk_job_id) values ("Amit", "Patel", "amitpatel23@gmail.com", 25000, 5, 5);

-- Create select query get name (firstname + lastname) with department name, country name, job name
SELECT concat(e.firstname, " ", e.lastname) as name, d.name as department_name, c.name as country_name, j.name as job_name FROM employee as e
left join department as d on d.id = e.fk_department_id
left join country as c on c.id = d.fk_country_id
left join job as j on j.id = e.fk_job_id
group by e.id;

-- Get 2nd highest salary of the employee
select * from employee order by salary desc limit 1,1;


-- Get all job name and department name in single query
select j.name from job as j union select d.name from department as d; 