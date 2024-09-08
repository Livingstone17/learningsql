-- Temporary Tables

# Use the key word CREATE TEMPORARY TABLE to create a new temp table as seen below
# temp tables are only accessible in a particular session, when you close windows and come back, you wont be able to access them, thats why they are called temporary tables
CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),				#this signifies the column name and datatypes which are essentials in creating a table 
last_name varchar(50),
favourite_movie varchar(100)
);

select *
from temp_table;

# insert data into the table
insert into temp_table
values('Peter', 'Samson', 'The Equalizer series');


select *
from employee_salary;

#create temporary table from an existing table. Say i want to create another table for employees earning 50k and above
create temporary table salary_over_50k
select * 
from employee_salary
where salary >= 50000;

select *
from salary_over_50k;
