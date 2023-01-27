USE mavenmoviesmini;
SELECT * FROM mavenmoviesmini.inventory_non_normalized;


CREATE SCHEMA mavenmoviesmini_normalized;
USE mavenmoviesmini_normalized;



CREATE TABLE mavenmoviesmini_normalized.MOVIES
SELECT DISTINCT film_id,title,description,release_year,rental_rate,rating
FROM mavenmoviesmini.inventory_non_normalized;

SELECT * FROM mavenmoviesmini_normalized.movies;

ALTER TABLE mavenmoviesmini_normalized.movies
ADD PRIMARY KEY (film_id);

CREATE TABLE mavenmoviesmini_normalized.STORES
SELECT DISTINCT store_id,store_manager_first_name,store_manager_last_name,store_address,store_city,store_district
FROM mavenmoviesmini.inventory_non_normalized
;

ALTER TABLE mavenmoviesmini_normalized.stores
ADD PRIMARY KEY (store_id)
;

SELECT * FROM mavenmoviesmini_normalized.stores;



CREATE TABLE mavenmoviesmini_normalized.inventory
SELECT inventory_id,film_id,store_id 
FROM mavenmoviesmini.inventory_non_normalized;

ALTER TABLE `mavenmoviesmini_normalized`.`inventory` 
ADD PRIMARY KEY (`inventory_id`),
ADD INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
ADD INDEX `store_id_idx` (`store_id` ASC) VISIBLE;
;
ALTER TABLE `mavenmoviesmini_normalized`.`inventory` 
ADD CONSTRAINT `film_id`
  FOREIGN KEY (`film_id`)
  REFERENCES `mavenmoviesmini_normalized`.`movies` (`film_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `store_id`
  FOREIGN KEY (`store_id`)
  REFERENCES `mavenmoviesmini_normalized`.`stores` (`store_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SELECT inventory.inventory_id,inventory.film_id,inventory.store_id,title,description,release_year,rental_rate,rating,store_manager_first_name,store_manager_last_name,store_address,store_city,store_district
FROM mavenmoviesmini_normalized.inventory
INNER JOIN mavenmoviesmini_normalized.movies ON mavenmoviesmini_normalized.movies.film_id = mavenmoviesmini_normalized.inventory.film_id
INNER JOIN mavenmoviesmini_normalized.stores ON mavenmoviesmini_normalized.stores.store_id = mavenmoviesmini_normalized.inventory.store_id
ORDER BY inventory_id;
;