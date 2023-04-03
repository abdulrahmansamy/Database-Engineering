USE mavenbearbuilders;
 
SELECT COUNT(*) AS total_records FROM orders;
 -- 10033 records BEFORE insert

 
 
SELECT MAX(order_id) AS max_order_id
 FROM order_items;
 
 
SELECT COUNT(*) AS total_records FROM orders;
  -- 12036 records AFTER insert