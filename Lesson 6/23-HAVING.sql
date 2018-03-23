SELECT sales_rep_id, COUNT(*)
FROM accounts
GROUP BY sales_rep_id
HAVING COUNT(*) > 5;

SELECT a.name, COUNT(*)
FROM accounts AS a
	JOIN orders AS o
	ON a.id = o.account_id
GROUP BY a.name
HAVING COUNT(*) > 30;

SELECT a.name, COUNT(*)
FROM ACCOUNTS AS a
	JOIN orders AS o
	ON a.id = o.account_id
GROUP BY a.name
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT a.name, SUM(o.total_amt_usd)
FROM ACCOUNTS AS a
	JOIN orders AS o
	ON a.id = o.account_id
GROUP BY a.name
HAVING sum>30000.00;

SELECT a.name, SUM(o.total_amt_usd)
FROM ACCOUNTS AS a
	JOIN orders AS o
	ON a.id = o.account_id
GROUP BY a.name
HAVING SUM(o.total_amt_usd)<1000.00;

SELECT a.name, SUM(o.total_amt_usd) AS total_spent
FROM ACCOUNTS AS a
	JOIN orders AS o
	ON a.id = o.account_id
GROUP BY a.name
ORDER BY total_spent DESC
LIMIT 1;

SELECT a.name, SUM(o.total_amt_usd) AS total_spent
FROM ACCOUNTS AS a
	JOIN orders AS o
	ON a.id = o.account_id
GROUP BY a.name
ORDER BY total_spent
LIMIT 1;

SELECT a.name
FROM ACCOUNTS AS a
	JOIN web_events AS w
	ON a.id = w.account_id
WHERE w.channel = 'facebook';

SELECT a.name, COUNT(*)
FROM ACCOUNTS AS a
	JOIN web_events AS w
	ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.name
HAVING COUNT(*)>6;

SELECT a.name, COUNT(*)
FROM ACCOUNTS AS a
	JOIN web_events AS w
	ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.name
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT w.channel, COUNT(*)
FROM ACCOUNTS AS a
	JOIN web_events AS w
	ON a.id = w.account_id
GROUP BY w.channel
ORDER BY COUNT(*) DESC
LIMIT 1;
