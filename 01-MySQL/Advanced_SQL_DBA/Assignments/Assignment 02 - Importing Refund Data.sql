CREATE SCHEMA IF NOT EXISTS mavenbearbuilders;

USE mavenbearbuilders;

CREATE TABLE order_item_refunds (
	order_item_refund_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    order_item_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    refund_amount_usd DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (order_item_refund_id),
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id)
    );
    
    
SELECT * FROM order_item_refunds;
    
SELECT 
	MIN(created_at),
        MAX(created_at)
FROM
	order_item_refunds
;
    
SELECT COUNT(order_item_refund_id) FROM order_item_refunds;