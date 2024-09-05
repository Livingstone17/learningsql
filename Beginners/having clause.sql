

SELECT  gender, avg(age)
FROM employee_demographics
group by gender
having avg(age) > 40;


SELECT  occupation, avg(salary)
FROM employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000