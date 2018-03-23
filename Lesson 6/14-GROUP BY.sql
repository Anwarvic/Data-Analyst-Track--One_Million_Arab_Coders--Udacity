SELECT accounts.name, orders.occurred_at
FROM accounts
JOIN orders 
ON accounts.id = orders.account_id
ORDER BY orders.occurred_at
LIMIT 1;

SELECT accounts.name, SUM(orders.total_amt_usd)
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
GROUP BY accounts.name;

SELECT w.occurred_at, w.channel, a.name
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;

SELECT channel, COUNT(*)
FROM web_events
GROUP BY channel;

SELECT a.primary_poc
FROM accounts AS a
JOIN web_events AS W
ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;

SELECT a.name, o.total_amt_usd
FROM accounts AS a
JOIN orders AS o
ON o.account_id = a.id
ORDER BY o.total_amt_usd;

SELECT r.name, COUNT(*)
FROM region AS r
JOIN sales_reps AS s
ON s.region_id = r.id
GROUP BY r.name;