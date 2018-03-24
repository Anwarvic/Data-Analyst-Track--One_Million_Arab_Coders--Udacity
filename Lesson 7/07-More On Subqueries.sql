SELECT MIN(occurred_at)
FROM orders;

SELECT AVG(standard_qty) AS standard, AVG(gloss_qty) AS gloss, AVG(poster_qty) AS poster
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
	(SELECT DATE_TRUNC('month', MIN(occurred_at)) AS m
      FROM orders);

SELECT r.name, COUNT(*)
FROM sales_reps AS s
	JOIN region AS r
   	ON r.id = s.region_id
   	JOIN accounts AS a
   	ON s.id = a.sales_rep_id
   	JOIN orders AS o
    ON a.id = o.account_id
WHERE r.name = 
(
  SELECT r.name
	FROM sales_reps AS s
		JOIN region AS r
    	ON r.id = s.region_id
    	JOIN accounts AS a
    	ON s.id = a.sales_rep_id
    	JOIN orders AS o
    	ON a.id = o.account_id
	GROUP BY s.name, 1
	ORDER BY SUM(o.total_amt_usd) DESC
	LIMIT 1)
GROUP BY r.name;

