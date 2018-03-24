SELECT orders.*, accounts.*
FROM accounts
	JOIN orders
	ON accounts.id = orders.account_id;

SELECT orders.standard_qty, orders.gloss_qty, 
       orders.poster_qty,  accounts.website, 
       accounts.primary_poc
FROM orders
	JOIN accounts
	ON orders.account_id = accounts.id