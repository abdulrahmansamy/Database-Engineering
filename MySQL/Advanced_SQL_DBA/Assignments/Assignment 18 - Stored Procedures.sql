USE mavenbearbuilders;

SELECT * FROM orders;
SELECT 
	COUNT(order_id) AS total_orders,
    SUM(price_usd) AS total_revenue
FROM orders
WHERE DATE(created_at) BETWEEN '2013-11-01' AND '2013-12-31'
;


DELIMITER //
CREATE PROCEDURE order_performance
(IN startdate DATE, IN enddate DATE)
BEGIN
SELECT 
	COUNT(order_id) AS total_orders,
    SUM(price_usd) AS total_revenue
FROM orders
WHERE DATE(created_at) BETWEEN startdate AND enddate
;
END //
DELIMITER ;

CALL order_performance('2013-11-01','2013-12-31');

DROP PROCEDURE order_performance;