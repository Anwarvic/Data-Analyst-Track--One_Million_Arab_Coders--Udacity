WITH tb AS(
	SELECT RIGHT(website, 3) AS extension
	FROM accounts)
SELECT extension, COUNT(*)
FROM tb
GROUP BY 1;


WITH tb AS(
	SELECT LEFT(name, 1) AS first_letter
	FROM accounts)
SELECT first_letter, COUNT(*)
FROM tb
GROUP BY 1;


WITH tb AS(
	SELECT LEFT(name, 1) AS first_letter
	FROM accounts)
SELECT first_letter, 
	CASE
		WHEN first_letter BETWEEN 'A' AND 'Z' THEN 'letter_group'
		ELSE 'number_group'
	END AS first_letter_group
FROM tb
GROUP BY 1;


WITH tb1 AS(
	SELECT LEFT(name, 1) AS first_letter
	FROM accounts),
tb2 AS(
	SELECT 
		CASE
			WHEN first_letter IN ('A', 'E', 'I', 'O', 'U') THEN 'vowel_group'
			ELSE 'consonant_group'
		END AS first_letter_group
	FROM tb1)
SELECT first_letter_group, COUNT(*)
FROM tb2
GROUP BY 1;

