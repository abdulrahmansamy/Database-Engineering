USE mavenbearbuilders;

SELECT * FROM order_items;  
SELECT * FROM order_item_refunds;
   
   
SELECT 
	MAX(created_at),
    COUNT(*) AS records
FROM order_items
;  

SELECT 
	MAX(created_at),
    COUNT(*) AS records
FROM order_item_refunds
;

