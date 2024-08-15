-- Retrieve names and emails of customers who have joined after a specific date
--  Replace YYYY-MM-DD with a date.

SELECT name, email
FROM Customer
WHERE joinDate > 20210405;
-----------------------------------------------
-- Display the total volume of transactions made by each customer

SELECT customerID, SUM(amount) AS total_volume
FROM transactions
GROUP BY customerID
ORDER BY total_colume DESC;
-------------------------------------------------
-- List all transactions where the amount exceeds a threshold.
--  Replace threshold_value with a value.

SELECT *
FROM transactions
WHERE amount > 22000 AND status = 'Successful';
----------------------------------------------------
-- Calculate the average percentage change in crypto value over 7 days.

SELECT AVG(percentChange7d) AS average_change_7_days
FROM Cryptocurrency;
-----------------------------------------------------
-- Identify customers who have bought and sold same crypto within the same --time frame.
-- Replace time_condition with a value.

SELECT c.id, c.name
FROM customer AS c JOIN transactions AS t ON c.id = t.customerid
WHERE t.timestamp > 20240408120001 AND t.timestamp < 20240408120026;
------------------------------------------------------
-- Determine the total amount of cryptocurrency bought by customers from a       --specific bank.
-- Replace bank_name with a value

SELECT c.bankName, SUM(t.amount) AS total_bought
FROM Customer c
JOIN Transactions t ON c.id = t.customerID
WHERE t.type = 'Buy' AND c.bankName = 'Wells Fargo'
GROUP BY c.bankName;

-------------------------------------------------------
-- List all customers who have credit score above a certain value and made 
-- made transactions in the last month.
-- Replace threshold_value with value

SELECT *
FROM customer
WHERE creditscore > 750 AND joindate < 20220211;

-------------------------------------------------------
-- Find the total number of transaction of each type(buy or sell) for a given crypto.

SELECT currency, type, COUNT(*) AS transaction_count
FROM transactions
GROUP BY currency, type; 

-------------------------------------------------------
-- Retrieve the names of customers along with the current value of their portfolio

SELECT p.customerId, c.name, p.portfolioValue
FROM portfolio AS p JOIN customer AS c ON p.customerId = c.id
ORDER BY portfolioValue DESC;

-------------------------------------------------------
-- Retrieve the names of customers along with the crypto they own and 
-- corresponding current values

SELECT p.customerId, c.name, p.numberCoinsOwned
FROM portfolio AS p JOIN customer AS c ON p.customerId = c.id
ORDER BY p.numberCoinsOwned DESC;

--------------------------------------------------------



