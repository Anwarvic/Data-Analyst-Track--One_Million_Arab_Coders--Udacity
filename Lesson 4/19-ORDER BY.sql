SELECT id, occurred_at, total_amt_usd
FROM orders
LIMIT 10;

SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, occurred_at, total
FROM orders
ORDER BY total
LIMIT 20;
