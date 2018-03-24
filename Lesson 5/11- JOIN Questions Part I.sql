SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events AS w
	JOIN accounts AS a
	ON w.account_id = a.id
WHERE a.name = 'Walmart';

SELECT r.name , s.name, a.name
FROM sales_reps AS s
	JOIN region AS r
	ON s.region_id = r.id
	JOIN accounts AS a
	ON a.sales_rep_id = s.id
ORDER BY a.name;

SELECT r.name, a.name, o.total_amt_usd/(o.total + 0.01)
FROM region AS r
	JOIN sales_reps AS s
	ON s.region_id = r.id
	JOIN accounts AS a
	ON a.sales_rep_id = s.id
	JOIN orders AS o
	ON o.account_id = a.id;