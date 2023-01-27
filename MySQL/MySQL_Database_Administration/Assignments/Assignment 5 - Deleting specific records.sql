USE candystore;

SELECT * FROM employees;

SELECT @@autocommit;

SET autocommit = off;

DELETE FROM employees
WHERE first_name = "Margaret" AND last_name = "Simpson";

DELETE FROM employees
WHERE employee_id = 4;

ROLLBACK;




SELECT * FROM customer_reviews;

ALTER TABLE `candystore`.`customer_reviews` 
ADD PRIMARY KEY (`customer_review_id`);


DELETE FROM customer_reviews
WHERE customer_review_id BETWEEN 1 AND 33;

ROLLBACK;



TRUNCATE TABLE customer_reviews;

ROLLBACK;





SET autocommit = 1;

COMMIT;





DELETE FROM customers 
WHERE customer_id BETWEEN 1 AND 6;		-- you can rollback

TRUNCATE TABLE customers;  				-- Delete table contents , no rollback allowed
