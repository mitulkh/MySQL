-- Create database of Jobs
CREATE DATABASE jobs;

-- Select jobs database for use
USE jobs;

-- Create a table(job, country, department, employee)
CREATE TABLE job
  (
     id         INT NOT NULL auto_increment,
     name       VARCHAR(34),
     min_salary DECIMAL(7, 2),
     max_salary DECIMAL(7, 2),
     PRIMARY KEY(id)
  );

CREATE TABLE country
  (
     id   INT NOT NULL auto_increment,
     name VARCHAR(34),
     PRIMARY KEY(id)
  );

CREATE TABLE department
  (
     id            INT NOT NULL auto_increment,
     name          VARCHAR(34),
     fk_country_id INT(10),
     FOREIGN KEY(fk_country_id) REFERENCES country(id) ON UPDATE CASCADE ON
     DELETE CASCADE,
     PRIMARY KEY(id)
  );

CREATE TABLE employee
  (
     id               INT NOT NULL auto_increment,
     firstname        VARCHAR(15),
     lastname         VARCHAR(15),
     email            VARCHAR(55),
     salary           DECIMAL(7, 2),
     fk_department_id INT(10),
     fk_job_id        INT(10),
     FOREIGN KEY(fk_department_id) REFERENCES department(id) ON UPDATE CASCADE
     ON DELETE CASCADE,
     FOREIGN KEY(fk_job_id) REFERENCES job(id) ON UPDATE CASCADE ON DELETE
     CASCADE,
     PRIMARY KEY(id)
  );

-- Separate SELECT query to get a hobby, employee, employee_salary and employee_hobby
SELECT *
FROM   job;

SELECT *
FROM   country;

SELECT *
FROM   department;

SELECT *
FROM   employee;

-- Insert data into job table
INSERT INTO job
            (name,
             min_salary,
             max_salary)
VALUES      ("junior developer",
             10000,
             50000);

INSERT INTO job
            (name,
             min_salary,
             max_salary)
VALUES      ("senior developer",
             20000,
             60000);

INSERT INTO job
            (name,
             min_salary,
             max_salary)
VALUES      ("intern",
             2000,
             10000);

INSERT INTO job
            (name,
             min_salary,
             max_salary)
VALUES      ("marketing",
             30000,
             50000);

INSERT INTO job
            (name,
             min_salary,
             max_salary)
VALUES      ("mba",
             10000,
             40000);

-- Insert data into country table
INSERT INTO country
            (name)
VALUES      ("india");

INSERT INTO country
            (name)
VALUES      ("australia");

INSERT INTO country
            (name)
VALUES      ("europe");

INSERT INTO country
            (name)
VALUES      ("china");

INSERT INTO country
            (name)
VALUES      ("america");

-- Insert data into department table 
INSERT INTO department
            (name,
             fk_country_id)
VALUES      ("it",
             1);

INSERT INTO department
            (name,
             fk_country_id)
VALUES      ("computer",
             2);

INSERT INTO department
            (name,
             fk_country_id)
VALUES      ("it",
             3);

INSERT INTO department
            (name,
             fk_country_id)
VALUES      ("e-commerce",
             4);

INSERT INTO department
            (name,
             fk_country_id)
VALUES      ("management",
             5);

-- Insert data into employee table
INSERT INTO employee
            (firstname,
             lastname,
             email,
             salary,
             fk_department_id,
             fk_job_id)
VALUES      ("mayur",
             "patel",
             "mayurpatel23@gmail.com",
             10000,
             1,
             1);

INSERT INTO employee
            (firstname,
             lastname,
             email,
             salary,
             fk_department_id,
             fk_job_id)
VALUES      ("rajesh",
             "shah",
             "rajeshshah32@gmail.com",
             5000,
             2,
             2);

INSERT INTO employee
            (firstname,
             lastname,
             email,
             salary,
             fk_department_id,
             fk_job_id)
VALUES      ("chandresh",
             "soni",
             "chandreshpatel23@gmail.com",
             14000,
             3,
             3);

INSERT INTO employee
            (firstname,
             lastname,
             email,
             salary,
             fk_department_id,
             fk_job_id)
VALUES      ("lokesh",
             "bhanderi",
             "lokeshbh23@gmail.com",
             17000,
             4,
             4);

INSERT INTO employee
            (firstname,
             lastname,
             email,
             salary,
             fk_department_id,
             fk_job_id)
VALUES      ("amit",
             "patel",
             "amitpatel23@gmail.com",
             25000,
             5,
             5);

-- Create select query get name (firstname + lastname) with department name, country name, job name
SELECT concat(e.firstname, "", e.lastname) AS name,
       d.name AS department_name,
       c.name AS country_name,
       j.name AS job_name
FROM   employee AS e
       LEFT JOIN department AS d
              ON d.id = e.fk_department_id
       LEFT JOIN country AS c
              ON c.id = d.fk_country_id
       LEFT JOIN job AS j
              ON j.id = e.fk_job_id
GROUP  BY e.id;

-- Get 2nd highest salary of the employee
SELECT *
FROM   employee
ORDER  BY salary DESC
LIMIT  1, 1;

-- Get all job name and department name in single query
SELECT name
FROM   job
UNION
SELECT name
FROM   department; 