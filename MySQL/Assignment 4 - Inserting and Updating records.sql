USE candystore;

SELECT * FROM employees;

ALTER TABLE `candystore`.`employees` 
CHANGE COLUMN `avg_customer_rating` `avg_customer_rating` DECIMAL(10,2) NULL DEFAULT NULL ;

INSERT INTO employees (employee_id,first_name,last_name,hire_date,position) 
VALUES 
(7,'Charles','Munger','2020-03-15','Clerk'),
(8,'William','Gates','2020-03-15','Clerk');

UPDATE employees 
SET avg_customer_rating = '4.80'  
WHERE employee_id = 1;

UPDATE employees 
SET avg_customer_rating = '4.60'  
WHERE employee_id = 2;

UPDATE employees 
SET avg_customer_rating = '4.75'  
WHERE employee_id = 3;

UPDATE employees 
SET avg_customer_rating = '4.90'  
WHERE employee_id = 4;

UPDATE employees 
SET avg_customer_rating = '4.75'  
WHERE employee_id = 5;

UPDATE employees 
SET avg_customer_rating = '4.2'  
WHERE employee_id = 6;

UPDATE employees 
SET avg_customer_rating = '5.0'  
WHERE employee_id = 7;

UPDATE employees 
SET avg_customer_rating = '5.0'  
WHERE employee_id = 8;

SELECT * FROM employees;

