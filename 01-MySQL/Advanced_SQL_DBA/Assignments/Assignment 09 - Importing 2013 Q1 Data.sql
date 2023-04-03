USE mavenbearbuilders;

SELECT * FROM order_items;
SELECT COUNT(*) FROM order_items;

SELECT * FROM order_item_refunds;
SELECT COUNT(*) FROM order_item_refunds;

DELETE FROM order_item_refunds
WHERE order_item_refund_id >= 170;

SELECT order_item_id, order_items.created_at, order_id, price_usd, cogs_usd, website_session_id, products.product_name 
FROM order_items
INNER JOIN products ON products.product_id = order_items.product_id
WHERE order_item_id > 2000
ORDER BY order_item_id

;