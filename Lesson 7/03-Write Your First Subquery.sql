SELECT DISTINCT w.channel, DATE_TRUNC('day', w.occurred_at), COUNT(*)
FROM web_events AS w
JOIN accounts AS a
ON a.id = w.account_id
GROUP BY w.channel, DATE_TRUNC('day', w.occurred_at)
ORDER BY 3 DESC;

SELECT * 
FROM(
	SELECT DISTINCT w.channel, DATE_TRUNC('day', w.occurred_at), COUNT(*)
	FROM web_events AS w
	JOIN accounts AS a
	ON a.id = w.account_id
	GROUP BY w.channel, DATE_TRUNC('day', w.occurred_at)
	ORDER BY 3 DESC) AS sub;

SELECT channel, AVG(count) 
FROM(
	SELECT DISTINCT w.channel, DATE_TRUNC('day', w.occurred_at), COUNT(*)
	FROM web_events AS w
	JOIN accounts AS a
	ON a.id = w.account_id
	GROUP BY w.channel, DATE_TRUNC('day', w.occurred_at)
	) AS sub
GROUP BY 1
ORDER BY 2 DESC;
