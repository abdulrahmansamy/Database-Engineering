/*
1) Import Q2 order_item and refund data into the database using the following files:                                                                                                                               
-- 08.order_items_2013_Apr-June
-- 09.order_item_refunds_2013_Apr-Jun
*/

SELECT 
	COUNT(*) AS count_rows,
    MAX(created_at) AS most_recent_created_at
FROM order_items
;
    
SELECT 
	COUNT(*) AS count_rows,
    MAX(created_at) AS most_recent_created_at
FROM order_item_refunds
;
    


/*
2) Next, your help is needed updating the structure of the order_items table. 
The company is going to start cross-selling products, and will want to track 
whether each item sold is the primary item (the first one put into the user’s shopping cart) 
or a cross-sold item. Add a binary column to order_items called is_primary_item. 
*/

SELECT * FROM order_items;

ALTER TABLE order_items
ADD COLUMN is_primary_item INT NULL
;

ALTER TABLE order_items
DROP COLUMN is_primary_item;

/* 
3) Update all previous records in the order_items table, setting is_primary_item = 1 
all records. Up until now, all items sold were the primary item (cross-selling is new). 
Confirm this change has executed successfully. 
*/ 

UPDATE order_items 
SET is_primary_item = 1
WHERE order_items.order_item_id > 0
;

SELECT * FROM order_items;

/*
4) After adding 2 new products to the products table, Import the remainder of 2013 order_item and refund data. 
Confirm successful import. Use the product values below and these files:  
-- 10.order_items_2013_Jul-Dec
-- 11.order_item_refunds_2013_Jul-Dec
*/ 

SELECT * FROM products;

INSERT INTO products 
VALUES 
	(3, '2013-12-12 09:00:00', 'The Birthday Sugar Panda'),
    (4, '2014-02-05 10:00:00', 'The Hudson River Mini bear')
;


SELECT 
	COUNT(*) AS count_rows,
    MAX(created_at) AS most_recent_created_at
FROM order_items
;
    
SELECT 
	COUNT(*) AS count_rows,
    MAX(created_at) AS most_recent_created_at
FROM order_item_refunds
;

/*
5) Your CEO would like your help making sure your database has a high degree of data integrity 
and bad data doesn’t start creeping in as more people start using the database. 
If you see any opportunities to ensure data integrity by using constrains like NON-NULL, 
add them to the relevant columns in the tables you have created . 
*/ 

ALTER TABLE order_items
CHANGE COLUMN `is_primary_item` `is_primary_item` INT NOT NULL ;

ALTER TABLE `mavenbearbuilders`.`products` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL ,
CHANGE COLUMN `product_name` `product_name` VARCHAR(50) NOT NULL ,
ADD UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE;
;

ALTER TABLE `mavenbearbuilders`.`order_item_refunds` 
ADD UNIQUE INDEX `order_item_id_UNIQUE` (`order_item_id` ASC) VISIBLE;
;


/* 
6) One of the company’s board advisors is pressuring your CEO on data risks and making sure 
she has a great backup and recovery plan. She would like a report on possible risks for 
data loss and steps the company can take to mitigate these concerns. 
*/ 









