SELECT date
FROM sf_crime_data
LIMIT 10;


SELECT CAST(    SUBSTR(date, 7, 4) ||
				'-' ||
				SUBSTR(date, 1, 2) ||
				'-' ||
				SUBSTR(date, 4, 2) AS DATE) AS correct_date
FROM sf_crime_data
LIMIT 10;