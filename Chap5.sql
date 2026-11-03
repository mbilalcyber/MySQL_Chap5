/**********************************************************************
Query 1.1: Count Original Customers
• Count the total number of customers
• table: customer
**********************************************************************/

SELECT COUNT(*)
FROM customer;

/**********************************************************************
Query 1.2: Create Customer Backup
• Create a complete backup of the customer table
• original table: customer
• backup table: customer_full_backup
**********************************************************************/

CREATE TABLE customer_full_backup AS
SELECT *
FROM customer;

/**********************************************************************
Query 1.3: Compare Customer Counts
• Compare the number of records in the original and backup tables
• original table: customer
• backup table: customer_full_backup
**********************************************************************/

SELECT COUNT(*) AS original_customer_count
FROM customer;

SELECT COUNT(*) AS backup_customer_count
FROM customer_full_backup;

/**********************************************************************
Query 1.4: Verify Customer Backup
• Verify that the original and backup tables have matching checksums
• tables: customer, customer_full_backup
**********************************************************************/

CHECKSUM TABLE
    customer,
    customer_full_backup;

/**********************************************************************
Query 2.1: Count All Rentals
• Count the total number of rentals
• table: rental
**********************************************************************/

SELECT COUNT(*)
FROM rental;

/**********************************************************************
Query 2.1B: Count Returned Rentals
• Count rentals that have been returned
• table: rental
• condition: return_date IS NOT NULL
**********************************************************************/

SELECT COUNT(*)
FROM rental
WHERE return_date IS NOT NULL;

/**********************************************************************
Query 2.1C: Count Unreturned Rentals
• Count rentals that have not been returned
• table: rental
• condition: return_date IS NULL
**********************************************************************/

SELECT COUNT(*)
FROM rental
WHERE return_date IS NULL;

/**********************************************************************
Query 2.2: Create Returned Rental Backup
• Create a backup of all returned rentals
• original table: rental
• backup table: returned_rental
• condition: return_date IS NOT NULL
**********************************************************************/

CREATE TABLE returned_rental AS
SELECT *
FROM rental
WHERE return_date IS NOT NULL;

/**********************************************************************
Query 2.2: Verify the Returned Rental Backup
• Verify the number of records in the backup table
• table: returned_rental
**********************************************************************/

SELECT COUNT(*)
FROM returned_rental;

/**********************************************************************
Query 3.1: Drop Backup Table
• Drop the customer_full_backup table
• table: customer_full_backup
**********************************************************************/

DROP TABLE customer_full_backup;

/**********************************************************************
Query 3.2: Verify Table Deletion
• Verify that customer_full_backup has been deleted
• Verify that returned_rental has been deleted
**********************************************************************/

SHOW TABLES LIKE 'customer_full_backup';

SHOW TABLES LIKE 'returned_rental';

/**********************************************************************
Query 4.1a: Insert a New City
• Insert a new city into the city table
• table: city
**********************************************************************/

INSERT INTO city
VALUES (
    DEFAULT,
    'Bilal City',
    103,
    DEFAULT
);

/**********************************************************************
Query 4.1a: Verify the New City
• Verify that the new city has been inserted
• table: city
• city: Bilal City
**********************************************************************/

SELECT *
FROM city
WHERE city = 'Bilal City';

/**********************************************************************
Query 4.1b: Insert a New Address
• Insert a new address into the address table
• table: address
**********************************************************************/

INSERT INTO address
VALUES (
    DEFAULT,
    '123 Student Street',
    NULL,
    'Wayne',
    601,
    NULL,
    '4025550123',
    DEFAULT
);

/**********************************************************************
Query 4.1b: Verify the New Address
• Verify the newly inserted address record
• table: address
• city_id: 601
**********************************************************************/

SELECT *
FROM address
WHERE city_id = 601;

/**********************************************************************
Query 4.1c: Insert a New Customer
• Insert a new customer into the customer table
• table: customer
**********************************************************************/

INSERT INTO customer
VALUES (
    DEFAULT,
    1,
    'Bilal',
    'Muhammed',
    'bilal@example.com',
    609,
    DEFAULT,
    NOW(),
    DEFAULT
);

/**********************************************************************
Query 4.1c: Verify the New Customer
• Verify the newly inserted customer record
• table: customer
• address_id: 606
**********************************************************************/

SELECT *
FROM customer
WHERE address_id = 609;

/**********************************************************************
Query 5.1: Insert a Second Customer Using a Column List
• Insert a second customer using a specified column list
• table: customer
**********************************************************************/

INSERT INTO customer (
    store_id,
    first_name,
    last_name,
    address_id,
    create_date
)
VALUES (
    1,
    'Sam',
    'YOUR_LAST_NAME',
    609,
    NOW()
);

/**********************************************************************
Query 5.2: Verify the Newly Inserted Customer
• Verify the newly inserted customer
• table: customer
• address_id: 609
**********************************************************************/

SELECT *
FROM customer
WHERE address_id = 609;

/**********************************************************************
Query 6.1: Update the First Customer
• Update the first customer's store_id and email
• table: customer
• customer_id: 600
**********************************************************************/

UPDATE customer
SET
    store_id = 2,
    email = 'bilal600@example.com'
WHERE
    customer_id = 600;

/**********************************************************************
Query 6.2: Update the Second Customer
• Update the second customer's store_id and email
• table: customer
• customer_id: 601
**********************************************************************/

UPDATE customer
SET
    store_id = 2,
    email = 'bilal601@example.com'
WHERE
    customer_id = 601;


/**********************************************************************
Query 6.3: Verify Both Updated Customer Records
• Display both updated customer records
• table: customer
• address_id: 609
**********************************************************************/

SELECT
    customer_id,
    store_id,
    first_name,
    last_name,
    email,
    address_id
FROM
    customer
WHERE
    address_id = 609;

/**********************************************************************
Query 7.1: Update Multiple Customer Records
• Update the address_id for multiple customer records
• table: customer
• change address_id from 609 to 605
**********************************************************************/

UPDATE customer
SET
    address_id = 605
WHERE
    address_id = 609;

/**********************************************************************
Query 7.2: Verify Both Updated Customer Records
• Verify both updated customer records
• table: customer
• address_id: 605
**********************************************************************/

SELECT
    customer_id,
    first_name,
    last_name,
    address_id
FROM
    customer
WHERE
    address_id = 605;

/**********************************************************************
Query 8.1a: Delete the City Record
• Delete the city record
• table: city
• city_id: 609
**********************************************************************/

DELETE FROM city
WHERE city_id = 609;

/**********************************************************************
Query 8.1b: Delete the New Address Record
• Delete the new address record
• table: address
• address_id: 606
**********************************************************************/

DELETE FROM address
WHERE address_id = 606;

/**********************************************************************
Query 8.1c: Delete Both New Customer Records
• Delete both new customer records
• table: customer
• customer_id: 600 and 601
**********************************************************************/

DELETE FROM customer
WHERE customer_id IN (600, 601);

/**********************************************************************
Query 8.2: Verify Deleted Records
• Verify deleted customer records
• Verify deleted address record
• Verify deleted city record
• tables: customer, address, city
**********************************************************************/

SELECT *
FROM customer
WHERE customer_id IN (600, 609);

SELECT *
FROM address
WHERE address_id = 609;

SELECT *
FROM city
WHERE city_id = 600;

