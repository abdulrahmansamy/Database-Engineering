USE candystore;

SELECT * FROM candystore_old.employees;
SELECT * FROM candystore.employees;


ALTER TABlE candystore.employees
DROP COLUMN hourly_wage,
ADD COLUMN avg_customer_rating DECIMAL(10,1) AFTER position;


SELECT * FROM candystore.employees;