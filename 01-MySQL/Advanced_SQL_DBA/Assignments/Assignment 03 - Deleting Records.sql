
USE mavenbearbuilders;

    
SELECT * FROM order_item_refunds;
   
DELETE 
	FROM order_item_refunds
	WHERE order_item_refund_id 
    BETWEEN 6 AND 10;


SELECT COUNT(order_item_refund_id) FROM order_item_refunds;