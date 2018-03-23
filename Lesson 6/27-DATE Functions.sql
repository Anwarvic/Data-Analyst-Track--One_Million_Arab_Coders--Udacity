SELECT DATE_TRUNC('year', occurred_at), SUM(total_amt_usd)
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_TRUNC('month', occurred_at), SUM(total_amt_usd)
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_TRUNC('year', occurred_at), COUNT(*)
FROM orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

SELECT DATE_TRUNC('month', occurred_at), COUNT(*)
FROM orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

SELECT DATE_TRUNC('month', o.occurred_at), SUM(o.gloss_amt_usd)
FROM orders AS o
	JOIN accounts AS a
    ON a.id = o.account_id
WHERE a.NAME = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;