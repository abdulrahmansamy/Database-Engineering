USE mavenbearbuilders;

SELECT * FROM order_items;


ALTER TABLE `mavenbearbuilders`.`order_items` 
-- ADD COLUMN `product_id` BIGINT NOT NULL AFTER `website_session_id`,
ADD INDEX `productID_idx` (`product_id` ASC) VISIBLE;
;
ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD CONSTRAINT `productID`
  FOREIGN KEY (`product_id`)
  REFERENCES `mavenbearbuilders`.`products` (`product_id`)
;
  
SELECT * FROM products;


SELECT order_item_id, order_items.created_at, order_id, price_usd, cogs_usd, website_session_id, products.product_name 
FROM order_items
INNER JOIN products ON products.product_id = order_items.product_id
ORDER BY order_item_id
;


