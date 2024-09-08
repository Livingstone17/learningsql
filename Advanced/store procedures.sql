-- STORE PROCEDURES

# store procedures are ways you can store your sql code and reuse them over and over again.

-- use park_and_recreation;
create procedure large_salaries()    			-- this line creates the store procedure
select *
from employee_salary
where salary >= 50000;

call large_salaries(); 				-- this lines calls the store procedure that we created



DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT * 
    FROM employee_salary
    WHERE salary >= 10000;
END$$
DELIMITER ;



call large_salaries2();





-- Parameters are inputs passed into your store procedures
DELIMITER $$
CREATE PROCEDURE large_salaries4(id_of_employee int)    			-- id_of_employee is the parameter
BEGIN
    SELECT first_name, salary
    FROM employee_salary
    WHERE employee_id = id_of_employee;
    
END$$
DELIMITER ; 

call large_salaries4(1);