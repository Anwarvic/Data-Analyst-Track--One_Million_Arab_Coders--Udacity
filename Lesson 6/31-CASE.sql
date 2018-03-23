SELECT a.name, SUM(o.total_amt_usd),
	CASE
    	WHEN SUM(o.total_amt_usd) > 200000 THEN 'Top Branch'
        WHEN SUM(o.total_amt_usd) BETWEEN 200000 AND 100000 THEN 'Second Branch'
        ELSE 'Lowest Branch'
    END AS "level"
FROM accounts AS a
	JOIN orders AS o
    ON o.account_id = a.id
GROUP BY a.name
ORDER BY 2 DESC;

SELECT a.name, SUM(o.total_amt_usd),
	CASE
    	WHEN SUM(o.total_amt_usd) > 200000 THEN 'Top Branch'
        WHEN SUM(o.total_amt_usd) BETWEEN 200000 AND 100000 THEN 'Second Branch'
        ELSE 'Lowest Branch'
      END AS "level"
FROM accounts AS a
	JOIN orders AS o
    ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '2016-01-01' AND '2017-12-31'
GROUP BY a.name
ORDER BY 2 DESC;

SELECT s.name, COUNT(*), 
	CASE
    	WHEN COUNT(*) > 200 THEN 'Top'
        ELSE 'Not'
    END AS "TOP?"
FROM accounts AS a
	JOIN sales_reps AS s
    ON s.id = a.sales_rep_id
    JOIN orders AS o
    ON o.account_id = a.id
GROUP BY s.name
ORDER BY 2 DESC;

SELECT s.name, COUNT(*), SUM(o.total_amt_usd),
	CASE
    	WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
    	WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
    	ELSE 'low'
    END AS "level"
FROM accounts AS a
	JOIN orders AS o
	ON o.account_id = a.id
	JOIN sales_reps AS s
	ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;
