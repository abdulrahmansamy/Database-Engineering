-- Create Schema
CREATE SCHEMA `bubsbooties`;
USE `bubsbooties`;

-- Create Tables

-- customers (customer_id, first_name, last_name, email)

CREATE TABLE IF NOT EXISTS `bubsbooties`.`customers` (
  `customer_id` BIGINT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customer_id`))
  ;
  
-- employees (employee_id, first_name, last_name, start_date, position_held)

CREATE TABLE IF NOT EXISTS `bubsbooties`.`employees` (
  `employee_id` BIGINT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  PRIMARY KEY (`employee_id`))
  ;

-- products (product_id, product_name, product_description, launched_date)

CREATE TABLE IF NOT EXISTS `bubsbooties`.`products` (
  `product_id` BIGINT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(45) NULL,
  `launched_date` DATE NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE)
;

-- customer purchases (purchase_id, customer_id,poduct_id, purchased_at, amount_usd)

CREATE TABLE IF NOT EXISTS `bubsbooties`.`customer_purchases` (
  `purchase_id` BIGINT NOT NULL,
  `customer_id` BIGINT NOT NULL,
  `product_id` BIGINT NOT NULL,
  `employee_id` BIGINT NOT NULL,
  `purchased_at` TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP,
  `amount_usd` DECIMAL(10,2) NULL,
  PRIMARY KEY (`purchase_id`),
  INDEX `productID_idx` (`product_id` ASC) VISIBLE,
  INDEX `customerID_idx` (`customer_id` ASC) VISIBLE,
  INDEX `employeeID_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `productID`
    FOREIGN KEY (`product_id`)
    REFERENCES `bubsbooties`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customer_id`)
    REFERENCES `bubsbooties`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `employeeID`
    FOREIGN KEY (`employee_id`)
    REFERENCES `bubsbooties`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ;


SELECT * FROM customers;
INSERT INTO  `bubsbooties`.`customers` 
VALUES
	(1, 'Ella', 'Grace', 'abc@xyz.com'),
    (2, 'Kathleen', 'McPauler', 'xyz@abc.com'),
    (3, 'Landon', 'Oliver',  'def@abc.cov')
    ;
SELECT * FROM customers;


SELECT * FROM employees;
INSERT INTO  `bubsbooties`.`employees` 
VALUES
	(1, 'Tucker', 'Glover', 'manager','2020-09-01'),
    (2, 'Reily', 'Glover', 'cashier','2021-08-01'),
    (3, 'Brody', 'Glover',  'salesman','2022-07-01')
    ;
SELECT * FROM employees;

SELECT * FROM products;
INSERT INTO  `bubsbooties`.`products` 
VALUES
	(1, 'Big Booties', 'Booties', '2022-10-01'),
    (2, 'Medium Booties', 'Booties', '2020-03-01'),
    (3, 'Mini Booties', 'Booties', '2021-04-01')
    ;
SELECT * FROM products;

SELECT * FROM customer_purchases;
INSERT INTO `bubsbooties`.`customer_purchases`
VALUES
	(1,1,3,2,'2021-04-07',NULL),
    (2,2,2,3,'2022-02-21',NULL),
    (3,1,1,1,'2020-06-13',NULL)
    ;
    
    
    
SELECT *
FROM customer_purchases
INNER JOIN products ON products.product_id = customer_purchases.product_id
INNER JOIN customers ON customers.customer_id = customer_purchases.customer_id
INNER JOIN employees ON employees.employee_id = customer_purchases.employee_id
ORDER BY purchase_id
;
    