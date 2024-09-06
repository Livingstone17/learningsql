-- UNions
# Unions allows you to combine rows together

SELECT first_name, last_name
FROM employee_demographics
UNION ALL     # displays all results after combining
SELECT first_name, last_name
FROM employee_salary;


SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT    # displays all results without repetition after combining
SELECT first_name, last_name
FROM employee_salary;

# to check from two tables the highly paid employees
SELECT first_name, last_name, 'Old Man' as label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION 
SELECT first_name, last_name, 'Old Lady' as label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly paid employees' as label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;