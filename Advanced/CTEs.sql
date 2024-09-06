-- CTEs
-- CTEs stands for COMMON TABLE EXPRESSIONS, they allow you to define a separate block that you can reference within the main query
-- CTEs helps to make subqueries easier to read, however CTEs arent stored in memory  like temp tables.

with CTE_Example (Gender, AVG_Sal, MAX_Sal,Min_Sal,COUNT_Sal) as               #use the WITH keyword to create a CTE; NOTE: you can only use a CTE immediately after you have created it
(select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics as dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select *
from CTE_Example
;

# you can write multiple ctes in one cte
with CTE_Example as 
(
select employee_id, gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
CTE_Example2 as 
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select *
from CTE_Example
join CTE_Example2
	on CTE_Example.employee_id = CTE_Example2.employee_id