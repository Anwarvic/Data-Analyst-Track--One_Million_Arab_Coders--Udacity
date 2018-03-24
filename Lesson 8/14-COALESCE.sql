SELECT *
FROM accounts a
	LEFT JOIN orders o
	ON a.id = o.account_id
WHERE o.total IS NULL;


SELECT COALESCE(a.id, a.id) AS id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts AS a
	LEFT JOIN orders AS o
	ON a.id = o.account_id
WHERE o.total IS NULL;


SELECT COALESCE(a.id, a.id) AS new_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, 
				o.id, COALESCE(o.account_id, a.id) AS account_id, o.occurred_at, o.standard_qty, o.gloss_qty, 
				o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts AS a
	LEFT JOIN orders AS o
	ON a.id = o.account_id
WHERE o.total IS NULL;


SELECT COALESCE(a.id, a.id) AS new_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, 
				o.id, COALESCE(o.account_id, a.id) AS account_id, o.occurred_at, COALESCE(o.standard_qty, 0) AS standard_qty, 
				COALESCE(o.gloss_qty, 0) AS gloss_qty, COALESCE(o.poster_qty, 0) AS poster_qty, o.total, 
				COALESCE(o.standard_amt_usd, 0) AS standard_amt_usd, COALESCE(o.gloss_amt_usd, 0) AS gloss_amt_usd, 
				COALESCE(o.poster_amt_usd, 0) AS poster_amt_usd, COALESCE(o.total_amt_usd, 0) AS total_amt_usd
FROM accounts AS a
	LEFT JOIN orders AS o
	ON a.id = o.account_id
WHERE o.total IS NULL;


SELECT COUNT(a.id)
FROM accounts a
	LEFT JOIN orders o
	ON a.id = o.account_id;


SELECT COALESCE(a.id, a.id) AS new_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, 
				o.id, COALESCE(o.account_id, a.id) AS account_id, o.occurred_at, COALESCE(o.standard_qty, 0) AS standard_qty, 
				COALESCE(o.gloss_qty, 0) AS gloss_qty, COALESCE(o.poster_qty, 0) AS poster_qty, o.total, 
				COALESCE(o.standard_amt_usd, 0) AS standard_amt_usd, COALESCE(o.gloss_amt_usd, 0) AS gloss_amt_usd, 
				COALESCE(o.poster_amt_usd, 0) AS poster_amt_usd, COALESCE(o.total_amt_usd, 0) AS total_amt_usd
FROM accounts AS a
	LEFT JOIN orders AS o
	ON a.id = o.account_id;