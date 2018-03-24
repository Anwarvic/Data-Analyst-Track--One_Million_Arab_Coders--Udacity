WITH tb AS(
	SELECT  name, 
			RIGHT(website, 3) AS extension,
			primary_poc, 
			LEFT(primary_poc, POSITION(' ' IN primary_poc)-1) AS first_name,  
			RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
	FROM accounts)
SELECT CONCAT(LOWER(first_name), '.', LOWER(last_name), '@', LOWER(name), '.', extension) AS email_adderss
FROM tb;


WITH tb AS(
	SELECT  name, 
			RIGHT(website, 3) AS extension,
			primary_poc, 
			LEFT(primary_poc, POSITION(' ' IN primary_poc)-1) AS first_name,
			RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
	FROM accounts)
SELECT CONCAT(LOWER(first_name), '.', LOWER(last_name), '@', LOWER(REPLACE(name, ' ', '')), '.', extension) AS email_adderss
FROM tb;


WITH tb AS(
	SELECT  LEFT(primary_poc, POSITION(' ' IN primary_poc)-1) AS first_name,
			RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name,
			UPPER(REPLACE(name, ' ', '')) AS company_name
	FROM accounts)
SELECT CONCAT(  LEFT(first_name, 1),
				RIGHT(first_name, 1),
				LEFT(last_name, 1),
				RIGHT(last_name, 1),
				LENGTH(first_name),
				LENGTH(last_name),
				company_name) AS password
FROM tb;