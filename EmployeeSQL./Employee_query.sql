-- Data Engineering --
-- Drop Tables if Existing
DROP TABLE IF EXISTS Department CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Department" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(20)   NOT NULL,
    "birth_date" varchar(10)   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(20)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(20)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(20)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--Data Analysis
--Once you have a complete database, do the following:


--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no AS "Employee Number"
		,employees.last_name AS "Last Name"
		,employees.first_name AS "First name"
		,employees.sex AS " Gender"
		,salaries.salary AS "Salary"
		
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;




--List first name, last name, and hire date for employees who were hired in 1986.
,to_char(employees.hire_date , 'MM/DD/YYYY') AS "Hire_Date"
SELECT	employees.last_name AS "Last Name"
		,employees.first_name AS "First Name"
		,employees.hire_date AS "Hire Date"
		
FROM employees

WHERE employees.hire_date BETWEEN '01/01/1986' AND '12/31/1986';		

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT department.dept_no AS "Department Number"
		,department.dept_name AS "Department Name"
		,employees.emp_no AS "Employee Number"
		,employees.last_name AS "Last Name"
		,employees.first_name AS "First Name"
		
FROM department JOIN dept_manager ON department.dept_no = dept_manager.dept_no

	join employees ON dept_manager.emp_no = employees.emp_no;



--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no AS "Employee Number"
		,employees.last_name AS "Employee Last Name"
		,employees.first_name AS "Employee Fisrt Name"
		,department.dept_name AS "Department Name"

		
FROM employees JOIN dept_emp  ON employees.emp_no = dept_emp.emp_no 
JOIN department ON   dept_emp.dept_no = department.dept_no ;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.





