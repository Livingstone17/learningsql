-- Group By Tut 

# group by with aggregate functions
SELECT gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;

-- ORDER BY FUnction
SELECT *
from employee_demographics
order by gender;

SELECT *
from employee_demographics
order by first_name desc;				#descending order


SELECT *
from employee_demographics
order by gender,age desc;


SELECT *
from employee_demographics
order by 5, 4;				#using column position

