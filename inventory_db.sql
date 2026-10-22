--Step 6: Create the INVENTORY table
--Creates a the 'INVENTORY' table, gives it 6 columns, including column name and data type
CREATE TABLE INVENTORY (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(40) NOT NULL,
    category VARCHAR(30),
    quantity INT,
    unit_cost DECIMAL(7,2),
    received_on DATE
);

DESCRIBE INVENTORY

--Step 7: Insert three record
--Inserts 3 records into the INVENTORY tablle
INSERT INTO INVENTORY VALUES (1,'Laser Mouse','Peripherals',25,18.50,'2026-02-10');
INSERT INTO INVENTORY VALUES (2,'Mechanical Keyboard','Peripherals',12,64.00,'2026-03-05');
INSERT INTO INVENTORY VALUES (3,'USB Hub','Accessories',40,22.75,'2026-04-18');

SELECT * FROM INVENTORY;

--STEP 8: Select, update, one record, then select again
--Selects 3 records from the INVENTORY table
SELECT item_id, item_name, unit_cost
FROM INVENTORY;

--Updates the unit_cost of the record with an item_id value of 2
UPDATE INVENTORY
SET unit_cost = 59.99
WHERE item_id = 2;

SELECT item_id, item_name, unit_cost
FROM INVENTORY;

--STEP 9: Create a view and select from it
--Creates a view based of the INVENTORY table, with 4 regular columns + 1 calculated column
CREATE VIEW INTENTORY_VALUE AS
SELECT item_name, quantity, unit_cost, quantity * unit_cost AS total_value
FROM INVENTORY
ORDER BY total_value DESC;

--STEP 10: Copy the table, then give the copy a primary key
--Creates a copy of the original 'INVENTORY' table
CREATE TABLE INVENTORY_COPY AS
SELECT *
FROM INVENTORY;

DESCRIBE INVENTORY_COPY

--Adds a primary key to the INVENTORY_COPY table
ALTER TABLE INVENTORY_COPY ADD PRIMARY KEY (item_id);

DESCRIBE INVENTORY_COPY

--Fails because of redundant PRIMARY KEY
INSERT INTO INVENTORY VALUES (1,'Laptop','Peripherals',20,500,'2026-03-14');

--STEP 11: Add a new user and view the users
--Creats a new user in the database
CREATE USER 'stockclerk'@'localhost' IDENTIFIED BY 'Stock#2026';

--lists all the user in the database
SELECT user, host FROM mysql.user ORDER BY USER;

