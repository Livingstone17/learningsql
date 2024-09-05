SELECT *
FROM employee_salary
WHERE salary >= 50000;

# Using Int DataType
SELECT *
FROM employee_salary
WHERE salary < 50000;

# String Datatype
SELECT *
FROM employee_demographics
WHERE gender = 'Male';

# Usig Date format
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

#LOGICAL OPERATORS IN WHERE CLAUSE
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male';


# LIKE Statement
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';            #this selects everyone whose first name starts with a


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';   # this selects any name that starts with a,ha 3characters after a and any other letter after that