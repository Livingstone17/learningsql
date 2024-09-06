-- Strings Functions
# these are sql built in functions that helps us mnipulate string data types differently

SELECT length('Skyfall');

# Length function
select first_name, length(first_name)
from employee_demographics
order by 2;

#Upper Function
select upper("sky");

#Lower Function
select lower('Delwe');

select first_name, upper(first_name)
from employee_demographics
order by 2;

#Trim; takes whitespaces from a string and gets rid of it
Select trim('          STYle        ');

Select rtrim('          STYle        '); #removes whitespaces on the right

Select ltrim('          STYle        '); #removes whitespaces on the left

#left and right manipulation
select first_name, left(first_name,4)
first_name, right(first_name,4)
from employee_demographics;


#Substring manipultion
select first_name, left(first_name,4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as month_of_birth  # to get the month that every employee is born
from employee_demographics;


#REPLACE 
# this replaces a specific character with what you want to replace it with
SELECT first_name, replace(first_name, 'a','z')
from employee_demographics;

select locate('x','Alexander');  #to locate the position of x in alexander


#CONCATENATION
select first_name, last_name,
concat(first_name, ' ' , last_name) as full_name
from employee_demographics