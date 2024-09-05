-- LIMITS AND ALIASING

# This selects the top 3 oldest employee in the table
SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3 ;

-- Aliasing is changing the name of a column
SELECT  gender, avg(age) AS avg_age
FROM employee_demographics
group by gender
having avg_age > 40;


# This selects the top 10 highest earning employee in the table
SELECT * 
FROM employee_salary
ORDER BY salary DESC
LIMIT 10 ;

