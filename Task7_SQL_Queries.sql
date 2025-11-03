-- Task 7: SQL Queries for Parabank Example

-- 1. Customers from 'Los Angeles'
SELECT *
FROM customers
WHERE city = 'Los Angeles';

-- 2. Account count per customer
SELECT c.id AS customer_id,
       c.first_name,
       c.last_name,
       COUNT(a.id) AS account_count
FROM customers c
LEFT JOIN accounts a ON c.id = a.customer_id
GROUP BY c.id, c.first_name, c.last_name;

-- 3. Total transactions last month
SELECT SUM(t.amount) AS total_amount_last_month
FROM transactions t
WHERE DATE_TRUNC('month', t.date) = DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month');
