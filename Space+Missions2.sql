COPY space_missions FROM 'D:\space_missions.csv' WITH DELIMITER ',' CSV HEADER ENCODING 'ISO-8859-1';
SELECT company, COUNT(*) AS num_rockets_launched
FROM space_missions
GROUP BY company
ORDER BY num_rockets_launched DESC
Limit 5;

SELECT country, COUNT(*) AS num_missions
FROM space_missions
GROUP BY country
ORDER BY num_missions DESC
Limit 5;

SELECT country, COUNT(*) AS num_missions, SUM(price) AS total_cost, ROUND(AVG(price), 2) AS avg_cost
FROM space_missions
GROUP BY country
ORDER BY num_missions DESC
LIMIT 5;


SELECT street, COUNT(*) AS num_missions
FROM space_missions
GROUP BY street
ORDER BY num_missions DESC
LIMIT 5;

SELECT year, COUNT(*) AS num_missions
FROM space_missions
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year DESC;

SELECT FLOOR(year/10)*10 AS decade_start, COUNT(*) AS num_missions
FROM space_missions
WHERE year IS NOT NULL
GROUP BY FLOOR(year/10)*10
ORDER BY decade_start DESC;

SELECT (round(COUNT(*) FILTER (WHERE missionstatus = 'Success') * 100.0 / COUNT(*)),2) AS Success_percentage,
(round(COUNT(*) FILTER (WHERE missionstatus = 'Failure') * 100.0 / COUNT(*)),2) AS Failure_percentage,
(round(COUNT(*) FILTER (WHERE missionstatus = 'Partial Failure') * 100.0 / COUNT(*)),2) AS Partial_Failure_percentage,
(round(COUNT(*) FILTER (WHERE missionstatus = 'Prelaunch Failure') * 100.0 / COUNT(*)),2) AS Prelaunch_Failure_percentage
FROM space_missions;

SELECT rocketstatus, missionstatus, COUNT(*) AS num_missions, SUM(CASE WHEN missionstatus = 'Success' THEN 1 ELSE 0 END) AS num_successes, AVG(CASE WHEN missionstatus = 'Success' THEN 1 ELSE 0 END) AS success_rate
FROM space_missions
WHERE rocketstatus IS NOT NULL
GROUP BY rocketstatus, missionstatus

SELECT COUNT(*) AS num_missions
FROM space_missions

SELECT AVG(Price) AS avg_price
FROM space_missions

SELECT price, country, COUNT(*) AS num_missions
FROM space_missions
WHERE  price IS NOT NULL
GROUP BY price, country
ORDER BY price DESC
Limit 5;

SELECT price, country, COUNT(*) AS num_missions
FROM space_missions
WHERE  price IS NOT NULL
GROUP BY price, country
ORDER BY price ASC
Limit 5;

