USE mavenbearbuilders;

CREATE TABLE products
(
	product_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (product_id)
);

INSERT INTO products VALUES 
(1,"2012-03-19 09:00:00","The Original Mr. Fuzzy"),
(2,"2013-01-06 13:00:00","The Forever Love Bear")
;

SELECT * FROM products;