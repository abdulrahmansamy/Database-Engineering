CREATE SCHEMA mavenbearbuilders;

USE mavenbearbuilders;

CREATE TABLE order_items (
	order_item_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    order_id BIGINT NOT NULL,
    price_usd DECIMAL(6,2) NOT NULL,
    cogs_usd DECIMAL(6,2) NOT NULL,
    website_session_id BIGINT NOT NULL,
    PRIMARY KEY (order_item_id)
    );
    
    
    SELECT * FROM order_items;
    
    SELECT 
		MIN(created_at),
        MAX(created_at)
	FROM
		order_items
	;