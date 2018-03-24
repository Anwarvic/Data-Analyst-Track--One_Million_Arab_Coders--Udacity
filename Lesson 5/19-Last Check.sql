SELECT r.name, s.name, a.name
FROM sales_reps AS s
	JOIN region AS r
	ON s.region_id = r.id
	JOIN accounts AS a
	ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

SELECT r.name, s.name, a.name
FROM sales_reps AS s
JOIN region AS r
ON s.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;

SELECT r.name, s.name, a.name
FROM sales_reps AS s
	JOIN region AS r
	ON s.region_id = r.id
	JOIN accounts AS a
	ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name;

SELECT r.name, a.name, o.total_amt_usd/(o.total + 0.01)
FROM region AS r
	JOIN sales_reps AS s
	ON s.region_id = r.id
	JOIN accounts AS a
	ON a.sales_rep_id = s.id
	JOIN orders AS o
	ON o.account_id = a.id
WHERE o.standard_qty > 100;

SELECT r.name, a.name, o.total_amt_usd/(o.total + 0.01)
FROM region AS r
	JOIN sales_reps AS s
	ON s.region_id = r.id
	JOIN accounts AS a
	ON a.sales_rep_id = s.id
	JOIN orders AS o
	ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

SELECT r.name, a.name, o.total_amt_usd/(o.total + 0.01)
FROM region AS r
	JOIN sales_reps AS s
	ON s.region_id = r.id
	JOIN accounts AS a
	ON a.sales_rep_id = s.id
	JOIN orders AS o
	ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

SELECT DISTINCT a.name, w.channel
FROM accounts AS a
	RIGHT JOIN web_events AS w
	ON a.id = w.account_id
WHERE a.id = '1001';

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts AS a
	JOIN orders AS o
	ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;