CREATE SCHEMA `toms_marketing_stuff` DEFAULT CHARACTER SET utf8mb4 ; 

USE toms_marketing_stuff;

CREATE TABLE `toms_marketing_stuff`.`publishers`(
  `publisher_id` INT NOT NULL,
  `publisher_name` VARCHAR(65) NULL,
  PRIMARY KEY (`publisher_id`)
  );
  
  SELECT * FROM publishers;
  
  CREATE TABLE `toms_marketing_stuff`.`publisher_spend`(
  `publisher_id` INT,
  `month` DATE,
  `spend` DECIMAL,
  PRIMARY KEY (`publisher_id`)
  );
  
ALTER TABLE `toms_marketing_stuff`.`publisher_spend` 
ADD COLUMN `publisher_spend_id` VARCHAR(45) NOT NULL FIRST,
CHANGE COLUMN `publisher_id` `publisher_id` INT NOT NULL ,
CHANGE COLUMN `spend` `spend` DECIMAL(10,2) NOT NULL ,
CHANGE COLUMN `month` `month` DATE NOT NULL,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`publisher_spend_id`);

SELECT * FROM publisher_spend;