-- Explore database structure

.tables

.schema Customers
.schema Accounts
.schema Transactions

-- Count records

SELECT COUNT(*) AS total_customers FROM Customers;
SELECT COUNT(*) AS total_accounts FROM Accounts;
SELECT COUNT(*) AS total_transactions FROM Transactions;

-- View sample data

SELECT * FROM Customers LIMIT 5;
SELECT * FROM Accounts LIMIT 5;
SELECT * FROM Transactions LIMIT 5;