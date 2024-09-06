-- Window Functions


SELECT gender, AVG(salary) as avg_salary
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;


SELECT gender, AVG(salary)  OVER(PARTITION BY gender)     # OVER IS A WINDOW FUNCTION KEYWORD TO CHECK AVERAGE SALARY OF THE ENTIRE SALARY COLUMN
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;


# using window functions for rolling total
select dem.first_name, dem.last_name, gender, salary,
SUM(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem
join employee_salary as sal
		on dem.employee_id = sal.employee_id
;
        

select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_num
from employee_demographics as dem
join employee_salary as sal
		on dem.employee_id = sal.employee_id
;