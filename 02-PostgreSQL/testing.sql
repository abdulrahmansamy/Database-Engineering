SELECT * FROM migration.mtable;


INSERT INTO migration.mtable VALUES (2, 'Abdul');


INSERT INTO migration.mtable VALUES (3, 'Abdul');

INSERT INTO migration.mtable VALUES (4, 'Abdul');

ALTER TABLE migration.mtable RENAME COLUMN name to firstName;
ALTER TABLE migration.mtable ADD COLUMN lastName VARCHAR(25);
ALTER TABLE migration.mtable ADD COLUMN city VARCHAR(25);
ALTER TABLE migration.mtable ADD COLUMN postal VARCHAR(25);

INSERT INTO migration.mtable VALUES (5, 'Abdul', 'Rahman', 'Riyadh');

INSERT INTO migration.mtable VALUES (6, 'Abdul');
INSERT INTO migration.mtable (id) VALUES (8);

UPDATE migration.mtable SET firstname='Abdul', lastname = 'Rahman', city='Jeddah' WHERE id = 7;
UPDATE migration.mtable SET firstname='Abdul', lastname = 'Rahman', city='Qassim' WHERE id = 8;

DROP TABLE rtable;

CREATE TABLE migration.rtable (id BIGSERIAL NOT NULL PRIMARY KEY, firstName VARCHAR(50) );

SELECT * FROM migration.rtable;

UPDATE 


