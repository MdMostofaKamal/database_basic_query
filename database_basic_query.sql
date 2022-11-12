CREATE DATABASE database_query;

USE database_query;

CREATE TABLE customers(
Id INT AUTO_INCREMENT,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Date_of_Birth DATE NOT NULL,
Phone VARCHAR(20),
Address VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
State VARCHAR(50) NOT NULL,
Points INT,
PRIMARY KEY (Id)
);

SELECT * FROM customers;

INSERT INTO customers(First_Name,Last_Name,Date_of_Birth,Phone,Address,City,State,Points) VALUES
('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', '2273'),
('Ines' ,'Brushfield' ,'1986-04-13' ,'804-427-9456' ,'14187 Commercial Trail' ,'Hampton','VA','947'),
('Freddi' ,'Boagey' ,'1985-02-07' ,'719-724-7869' ,'251 Springs Junction' ,'Colorado Springs' ,'CO' ,'2967'),
('Ambur','Roseburgh','1974-04-14' ,'407-231-8017','30 Arapahoe Terrace', 'Orlando', 'FL', '457'),
('Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX','3675'); 

SELECT * FROM customers WHERE points > 1000 LIMIT 2;
SELECT * FROM customers WHERE Date_of_Birth BETWEEN '1980-01-01' AND '1990-01-01' OR points < 1000;
SELECT * FROM customers ORDER BY points;
SELECT * FROM customers ORDER BY points DESC;
SELECT * FROM customers WHERE CONCAT(First_Name,Last_Name) LIKE '%burgh%';
SELECT * FROM customers WHERE CONCAT(First_Name,Last_Name) REGEXP 'burgh';
SELECT * FROM customers WHERE Phone = NULL;

ALTER TABLE customers CHANGE Date_of_Birth dob DATE NOT NULL;
SELECT *,MAX(points) FROM customers WHERE points = (SELECT MAX(points) FROM customers);
SELECT *, CASE
	WHEN points < 1000 THEN 'they are bronze member'
	WHEN points > 1000 AND points < 2000 THEN 'they are silver member'
	WHEN points > 2000 AND points < 3000 THEN 'they are gold member'
	ELSE 'they are platinum member'

END AS customer_quality FROM customers;
