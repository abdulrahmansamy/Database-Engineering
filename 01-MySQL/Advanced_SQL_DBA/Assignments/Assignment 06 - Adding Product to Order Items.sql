USE mavenbearbuilders;

SELECT * FROM order_items;

ALTER TABLE order_items
ADD COLUMN product_id BIGINT NOT NULL 
;



-- to drop the product id column
ALTER TABLE `mavenbearbuilders`.`order_items` 
DROP FOREIGN KEY `productID`;
ALTER TABLE `mavenbearbuilders`.`order_items` 
DROP COLUMN `product_id`
;
ALTER TABLE `mavenbearbuilders`.`order_items` 
DROP COLUMN `product_id`,
DROP INDEX `productID_idx` ;
;


