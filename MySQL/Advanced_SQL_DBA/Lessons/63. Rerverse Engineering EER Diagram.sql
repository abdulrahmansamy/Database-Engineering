

CREATE TABLE order_items (
	order_item_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    order_id BIGINT NOT NULL,
    price_usd DECIMAL(6,2) NOT NULL,
    cogs_usd DECIMAL(6,2) NOT NULL,
    website_session_id BIGINT NOT NULL,
    PRIMARY KEY (order_item_id)
    );
    
CREATE TABLE products
(
	product_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (product_id)
);


ALTER TABLE `mavenbearbuilders`.`order_items` 
-- ADD COLUMN `product_id` BIGINT NOT NULL AFTER `website_session_id`,
ADD INDEX `productID_idx` (`product_id` ASC) VISIBLE;
;
ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD CONSTRAINT `productID`
  FOREIGN KEY (`product_id`)
  REFERENCES `mavenbearbuilders`.`products` (`product_id`)
;
  