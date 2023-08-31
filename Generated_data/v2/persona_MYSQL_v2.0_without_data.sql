CREATE DATABASE IF NOT EXISTS persona;
USE persona;

CREATE TABLE IF NOT EXISTS person01 (
	id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(50),
	birthdate DATE,
	email VARCHAR(50),
	ip_address VARCHAR(20),
	age INT,
	country VARCHAR(50),
	postal_code VARCHAR(50),
	favorite_color VARCHAR(5)
);