USE mavenbearbuilders;


CREATE TABLE orders (
	order_id BIGINT,
    created_at DATETIME,
    website_session_id BIGINT,
    product_id BIGINT,
    items_purchased BIGINT,
    price_usd DECIMAL(6,2),
    cogs_usd DECIMAL(6,2),
    PRIMARY KEY (order_id)
);

SELECT * FROM orders;

INSERT INTO orders
SELECT
	order_id,
    MIN(created_at) AS created_at,
    MIN(website_session_id) AS website_session_id,
    SUM(CASE
		WHEN is_primary_item = 1 THEN product_id
        ELSE NULL
        END
		) AS primary_product_id,
	COUNT(order_item_id) AS items_purchased,
    SUM(price_usd) AS price_usd,
    SUM(cogs_usd) AS cogs_usd
FROM order_items
GROUP BY 1
ORDER BY 1;