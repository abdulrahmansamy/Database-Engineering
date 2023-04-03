/*

CREATE TRIGGER trigger_name
{BEFORE|AFTER} {INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
{{FOLLOWS|PRECEDES} existing_trigger_name}
[statement]
WHERE columen_name = {NEW|OLD}.columen_name


*/



USE thriftshop;

CREATE TABLE `thriftshop`.`purchase_summary` (
  `purchase_summary_id` BIGINT NOT NULL,
  `customer_id` BIGINT NULL,
  `total_purchases` BIGINT NULL,
  `purchases_excluding_last` BIGINT NULL,
  PRIMARY KEY (`purchase_summary_id`));
  
INSERT INTO purchase_summary 
	VALUES 
		(1,1,6,5),
        (2,2,2,1),
        (3,3,1,0),
        (4,4,1,0),
        (5,5,1,0),
        (6,6,1,0)
;


CREATE TABLE `thriftshop`.`customer_purchases` (
  `customer_purchase_id` BIGINT NOT NULL,
  `customer_id` BIGINT NOT NULL,
  `inventory_id` BIGINT NOT NULL,
  PRIMARY KEY (`customer_purchase_id`))
;

ALTER TABLE `thriftshop`.`customer_purchases` 
ADD PRIMARY KEY (`customer_purchase_id`);
;


INSERT INTO customer_purchases 
	VALUES 
		(1,1,3),
        (2,1,2),
        (3,1,4),
        (4,1,7),
        (5,2,5),
        (6,3,1),
        (7,4,6),
        (8,5,8),
        (9,6,9),
        (10,2,3),
        (11,1,2),
        (12,1,6)
        ;
        
        
  

SELECT * FROM customer_purchases;
SELECT * FROM customers;
SELECT * FROM inventory;
SELECT * FROM purchase_summary;


SELECT COUNT(customer_purchase_id)
    FROM customer_purchases 
    WHERE customer_purchases.customer_id = 6;

CREATE TRIGGER purchaseUpdatePurchaseSummary_before
BEFORE INSERT
ON customer_purchases
FOR EACH ROW
UPDATE purchase_summary
	SET purchases_excluding_last = (
    SELECT COUNT(customer_purchase_id)
    FROM customer_purchases 
    WHERE customer_purchases.customer_id = purchase_summary.customer_id
    )
WHERE customer_id = NEW.customer_id
AND purchase_summary_id > 0;

CREATE TRIGGER purchaseUpdatePurchaseSummary_after
AFTER INSERT
ON customer_purchases
FOR EACH ROW
-- PRECEDES purchaseUpdatePurchaseSummary_before
UPDATE purchase_summary
	SET total_purchases = (
    SELECT COUNT(customer_purchase_id)
    FROM customer_purchases 
    WHERE customer_purchases.customer_id = purchase_summary.customer_id
    )
WHERE customer_id = NEW.customer_id
AND purchase_summary_id > 0;

DROP TRIGGER purchaseUpdatePurchaseSummary_before;
DROP TRIGGER purchaseUpdatePurchaseSummary_after;

SELECT * FROM purchase_summary;

SELECT * FROM customer_purchases;


INSERT INTO customer_purchases (customer_purchase_id,customer_id,inventory_id)
VALUES
	(13,6,4);
    

DELETE FROM customer_purchases WHERE customer_purchase_id = 13;
;


