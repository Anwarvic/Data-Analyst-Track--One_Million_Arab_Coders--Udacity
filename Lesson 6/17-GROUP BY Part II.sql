SELECT a.name, AVG(o.standard_qty) AS standard_mean, AVG(o.gloss_qty) AS gloss_mean, AVG(o.poster_qty) AS poster_mean
FROM accounts AS a
	JOIN orders AS o
	ON o.account_id = a.id
GROUP BY a.name;

SELECT a.name, AVG(o.standard_amt_usd) AS standard_mean, AVG(o.gloss_amt_usd) AS gloss_mean, AVG(o.poster_amt_usd) AS poster_mean
FROM accounts AS a
	JOIN orders AS o
	ON o.account_id = a.id
GROUP BY a.name;

SELECT s.name, w.channel, COUNT(*)
FROM accounts AS a
    JOIN sales_reps AS s
    ON s.id = a.sales_rep_id
    JOIN web_events AS w
    ON w.account_id = a.id
GROUP BY s.name, w.channel;

SELECT r.name, w.channel, COUNT(*)
FROM accounts AS a
    JOIN web_events AS w
    ON w.account_id = a.id
    JOIN sales_reps AS s
    ON s.id = a.sales_rep_id
	JOIN region AS r
    ON r.id = s.region_id
GROUP BY r.name, w.channel;