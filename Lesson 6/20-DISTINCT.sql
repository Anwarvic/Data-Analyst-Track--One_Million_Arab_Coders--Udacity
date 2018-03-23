SELECT DISTINCT a.name, COUNT(*)
FROM accounts AS a
	JOIN sales_reps AS s
    ON s.id = a.sales_rep_id
    JOIN region AS r
    ON s.region_id = r.id
GROUP BY a.name, r.id;

SELECT DISTINCT s.name, COUNT(*)
FROM accounts AS a
	JOIN sales_reps AS s
    ON s.id = a.sales_rep_id
    JOIN region AS r
    ON s.region_id = r.id
GROUP BY s.name, a.id;