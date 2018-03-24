SELECT *
FROM orders
WHERE gloss_amt_usd > 1000
LIMIT 5;

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;