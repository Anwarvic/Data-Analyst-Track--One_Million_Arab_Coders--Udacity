SELECT  primary_poc, 
		LEFT(primary_poc, POSITION(' ' IN primary_poc)-1) AS first_name,  
		RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
FROM accounts;


SELECT  name, 
		LEFT(name, POSITION(' ' IN name)-1) AS first_name,  
		RIGHT(name, LENGTH(name) - POSITION(' ' IN name)) AS last_name
FROM sales_reps;