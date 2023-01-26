USE sloppyjoes;

SELECT * FROM customer_orders;

UPDATE customer_orders
SET order_total = 0
WHERE order_id IN (3,8,12,16,19);

ALTER TABLE `sloppyjoes`.`customer_orders` 
CHANGE COLUMN `order_total` `order_total` DECIMAL(13,2) NOT NULL ;


SELECT * FROM menu_items;
ALTER TABLE `sloppyjoes`.`menu_items` 
CHANGE COLUMN `item_name` `item_name` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `price` `price` DECIMAL(13,2) NOT NULL ,
ADD UNIQUE INDEX `item_name_UNIQUE` (`item_name` ASC) VISIBLE;
;


SELECT * FROM staff;
ALTER TABLE `sloppyjoes`.`staff` 
CHANGE COLUMN `first_name` `first_name` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `last_name` `last_name` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `orders_served` `orders_served` BIGINT NOT NULL ;