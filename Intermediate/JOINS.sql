-- Joins

# JOINS allows you to bind two or more tables together if they have something in common that you can use.
# We have 3 Types of JOINS; The inner joins, the outer joins, Self Joins.alter

 SELECT * 
 FROM employee_demographics;
 
 
 SELECT *
 FROM employee_salary;
 
 # Inner joins return rows that are the same in both tables
  SELECT *
 FROM employee_demographics AS dem   # I added the use of ALIASING here to represent employee_demographics
 INNER JOIN employee_salary AS sal   #using the keyword JOIN defaults to INNER JOIN
	ON dem.employee_id = sal.employee_id   # we are joining these two tables based on the employee_id
 ;
 
 
  # Inner joins return rows that are the same in both tables
  SELECT dem.employee_id,age, occupation, salary
 FROM employee_demographics AS dem   # I added the use of ALIASING here to represent employee_demographics
 INNER JOIN employee_salary AS sal   #using the keyword JOIN defaults to INNER JOIN
	ON dem.employee_id = sal.employee_id   # we are joining these two tables based on the employee_id
 ;
 
 
  # Outer joins has two types; left and right joins
  SELECT *
 FROM employee_demographics AS dem   # I added the use of ALIASING here to represent employee_demographics
 LEFT JOIN employee_salary AS sal   #using the keyword JOIN defaults to INNER JOIN
	ON dem.employee_id = sal.employee_id   # we are joining these two tables based on the employee_id
 ;
 
 
   # Outer joins has two types; left and right joins
  SELECT *
 FROM employee_demographics AS dem   # I added the use of ALIASING here to represent employee_demographics
 RIGHT JOIN employee_salary AS sal   #using the keyword JOIN defaults to INNER JOIN
	ON dem.employee_id = sal.employee_id   # we are joining these two tables based on the employee_id
 ;
 
 
   # Self joins is when you tie a table to itself
  SELECT emp1.employee_id AS emp_santa,
  emp1.first_name as first_name_santa,
  emp1.last_name as last_name_santa,
  emp2.employee_id AS emp_id,
  emp2.first_name as first_name_emp,
  emp2.last_name as last_name_emp
 FROM employee_salary AS emp1   # I added the use of ALIASING here to represent employee_demographics
 JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
    
    
-- JOINING multiple Tables together
SELECT *
 FROM employee_demographics AS dem   # I added the use of ALIASING here to represent employee_demographics
 INNER JOIN employee_salary AS sal   #using the keyword JOIN defaults to INNER JOIN
	ON dem.employee_id = sal.employee_id   # we are joining these two tables based on the employee_id
INNER JOIN parks_departments as pd
	ON sal.dept_id = pd.department_id
 ;