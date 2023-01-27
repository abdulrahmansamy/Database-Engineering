USE mavenbearbuilders;

SELECT * FROM order_items;

ALTER TABLE order_items
ADD COLUMN product_id BIGINT NOT NULL -- ,
-- ADD FOREIGN KEY (product_id) REFERENCES products(product_id)
;

UPDATE  products
SET product_id = "1" ;

 

ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD COLUMN `product_id` BIGINT NOT NULL AFTER `website_session_id`,
ADD INDEX `productID_idx` (`product_id` ASC) VISIBLE;
;
ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD CONSTRAINT `productID`
  FOREIGN KEY (`product_id`)
  REFERENCES `mavenbearbuilders`.`products` (`product_id`)
;
  
SELECT * FROM products;