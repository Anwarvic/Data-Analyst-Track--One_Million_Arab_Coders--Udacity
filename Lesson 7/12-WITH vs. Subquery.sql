WITH table1 AS (
	SELECT s.name sales_name, r.name region, SUM(total_amt_usd) AS total
	FROM accounts AS a
		JOIN sales_reps AS s
		ON a.sales_rep_id = s.id
		JOIN orders AS o
		ON o.account_id = a.id
		JOIN region AS r
		ON r.id = s.region_id
	GROUP BY 1, 2
	ORDER BY 3 DESC), 
table2 AS (
	SELECT region, MAX(total) AS max_total
	FROM table1
	GROUP BY 1
	ORDER BY 2 DESC)
SELECT table1.sales_name, table2.region, table2.max_total
FROM table1
JOIN table2
ON table1.region = table2.region AND table1.total = table2.max_total;


SELECT r.name, SUM(o.total_amt_usd)
FROM accounts AS a
	JOIN sales_reps AS s
	ON a.sales_rep_id = s.id
	JOIN orders AS o
	ON o.account_id = a.id
	JOIN region AS r
	ON r.id = s.region_id
WHERE r.name = (
	WITH table1 AS (
	SELECT s.name sales_name, r.name region, SUM(total_amt_usd) AS total
	FROM accounts AS a
		JOIN sales_reps AS s
		ON a.sales_rep_id = s.id
		JOIN orders AS o
		ON o.account_id = a.id
		JOIN region AS r
		ON r.id = s.region_id
	GROUP BY 1, 2
	ORDER BY 3 DESC), 
	table2 AS (
		SELECT region, MAX(total) AS max_total
		FROM table1
		GROUP BY 1
		ORDER BY 2 DESC)
	SELECT table2.region
	FROM table1
	JOIN table2
	ON table1.region = table2.region AND table1.total = table2.max_total
	LIMIT 1)
GROUP BY 1;


WITH tb1 AS (
	SELECT a.name, SUM(o.standard_qty) AS total_standard
	FROM accounts AS a
		JOIN orders AS o
		ON o.account_id = a.id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 1),
tb2 AS (
	SELECT a.name
	FROM accounts AS a
		JOIN orders AS o
		ON o.account_id = a.id
	GROUP BY 1
	HAVING SUM(o.total) > (SELECT total_standard from tb1)
	)
SELECT COUNT(*)
FROM tb2;


WITH tb AS (
	SELECT a.id AS acc_id, SUM(o.total_amt_usd)
	FROM accounts AS a
		JOIN orders AS o
		ON o.account_id = a.id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 1)
SELECT w.channel, COUNT(*)
FROM web_events AS w
	JOIN accounts AS a
	ON w.account_id = a.id
WHERE w.account_id = (SELECT acc_id FROM tb)
GROUP BY 1;


WITH tb1 AS(
	SELECT a.name, SUM(total_amt_usd) AS total
	FROM accounts AS a
		JOIN orders AS o
		ON a.id = o.account_id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 10)
SELECT AVG(total)
FROM tb1;


WITH tb1 AS (
	SELECT AVG(o.total_amt_usd) AS avg_all_counts
	FROM accounts AS a
		JOIN orders AS o
		ON o.account_id = a.id),
tb2 AS (
	SELECT account_id, AVG(total_amt_usd) AS average
	FROM orders
	GROUP BY 1
	HAVING AVG(total_amt_usd) > (SELECT avg_all_counts FROM tb1))
SELECT AVG(average)
FROM tb2;
