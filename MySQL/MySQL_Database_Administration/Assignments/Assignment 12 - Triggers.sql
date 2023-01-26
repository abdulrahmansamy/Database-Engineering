USE sloppyjoes;

SELECT * FROM staff;
SELECT * FROM customer_orders;

CREATE TRIGGER updateorderserved
AFTER INSERT ON customer_orders
FOR EACH ROW 
	UPDATE staff
		SET orders_served = orders_serverd + 1
	WHERE staff_id = NEW.staff_id;
    
INSERT INTO customer_orders
VALUES
	(21,1,10.98),
    (22,2,5.99),
    (23,2,7.99),
    (24,2,12.97)
    ;
    

SELECT * FROM customer_orders;
SELECT * FROM staff;