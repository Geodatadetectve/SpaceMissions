# SpaceMissions
This dataset contains a csv table with 4,631 records, one for each space mission. Each record contains details on each mission's name, location, date, and status of the launch, the company responsible, and the price, status, and name of the rocket

SQL commands
1. Which company has launched the most rockets? 
SELECT company, COUNT(*) AS num_rockets_launched
FROM space_missions
GROUP BY company
ORDER BY num_rockets_launched DESC
Limit 5;

"company"	"num_rockets_launched"
"RVSN USSR"	1723
"CASC"		1050
"SpaceX"	710
"Arianespace"	680
"NASA"		650

2. What is the most common location for space missions? 
SELECT location, COUNT(*) AS num_missions
FROM space_missions
GROUP BY Location
ORDER BY num_missions DESC
Limit 5;

"country"	"num_missions"
" USA"		3214
" Russia"	1618
" China"	1120
" Kazakhstan"	886
" France"	702

3 Cost by the top 5 countries
SELECT country, COUNT(*) AS num_missions, SUM(price) AS total_cost, ROUND(AVG(price), 2) AS avg_cost
FROM space_missions
GROUP BY country
ORDER BY num_missions DESC
LIMIT 5;

"country"	"num_missions"	"total_cost"	"avg_cost"
" USA"		3214			226219.64	111.22
" Russia"	1618			5603.12	3.85
" China"	1120			18912.26	30.80
" Kazakhstan"	886			24259.48	31.92
" France"	702			36320		81.43

4 What is the most common street for space missions? 
SELECT street, COUNT(*) AS num_missions
FROM space_missions
GROUP BY street
ORDER BY num_missions DESC
LIMIT 5;

"street"						"num_missions"
"LC-39A, Kennedy Space Center, Florida"	596
"ELA-3, Guiana Space Centre, French Guiana"	363
"Site 31/6, Baikonur Cosmodrome"		339
"SLC-41, Cape Canaveral AFS, Florida"		304
"SLC-40, Cape Canaveral AFS, Florida"		290

5. Has the number of space missions increased or decreased over time ( in decades)? 
SELECT year, COUNT(*) AS num_missions
FROM space_missions
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year DESC;

6 SELECT FLOOR(year/10)*10 AS decade_start, COUNT(*) AS num_missions
FROM space_missions
WHERE year IS NOT NULL
GROUP BY FLOOR(year/10)*10
ORDER BY decade_start DESC;

"decade_start"	"num_missions"
2020	680
2010	1182
2000	673
1990	758
1980	651
1970	989
1960	784
1950	45

7. What is the success rate of space missions? 
SELECT (round(COUNT(*) FILTER (WHERE missionstatus = 'Success') * 100.0 / COUNT(*)),2) AS Success_percentage,
(round(COUNT(*) FILTER (WHERE missionstatus = 'Failure') * 100.0 / COUNT(*)),2) AS Failure_percentage,
(round(COUNT(*) FILTER (WHERE missionstatus = 'Partial Failure') * 100.0 / COUNT(*)),2) AS Partial_Failure_percentage,
(round(COUNT(*) FILTER (WHERE missionstatus = 'Prelaunch Failure') * 100.0 / COUNT(*)),2) AS Prelaunch_Failure_percentage
FROM space_missions;

"success_percentage"	"failure_percentage"	"partial_failure_percentage" prelaunch_failure_percentage"
"(64,2)"	"(4,2)"	"(2,2)"	"(0,2)"



8. Are there any correlations between rocket status and mission success? 
SELECT rocketstatus, missionstatus, COUNT(*) AS num_missions, SUM(CASE WHEN missionstatus = 'Success' THEN 1 ELSE 0 END) AS num_successes, AVG(CASE WHEN missionstatus = 'Success' THEN 1 ELSE 0 END) AS success_rate
FROM space_missions
WHERE rocketstatus IS NOT NULL
GROUP BY rocketstatus, missionstatus

"rocketstatus"	"missionstatus"	"num_missions"	"num_successes"	"success_rate"
"Active"	"Failure"		75		0	0.00000000000000000000
"Active"	"Partial Failure"		26		0	0.00000000000000000000
"Retired"	"Prelaunch Failure"	3		0	0.00000000000000000000
"Retired"	"Success"		3515		3515	1.00000000000000000000
"Active"	"Success"		1754		1754	1.00000000000000000000
"Retired"	"Failure"		289		0	0.00000000000000000000
"Retired"	"Partial Failure"		100		0	0.00000000000000000000

9. What is the total number of space mission completed till date? 
SELECT COUNT(*) AS num_missions
FROM space_missions
"num_missions" 2518

10. What is the average price of a space mission? 

SELECT AVG(Price) AS avg_price
FROM space_missions
"avg_price" 56.2777334258937869

11. What are the most expensive space missions? 
SELECT price, country, COUNT(*) AS num_missions
FROM space_missions
WHERE  price IS NOT NULL
GROUP BY price, country
ORDER BY price DESC
Limit 5;

"price"	"country"	"num_missions"
5000	" Kazakhstan"	4
1160	" USA"		26
450	" USA"		272
350	" USA"		26
200	" France"	160

10. What are the cheapest space missions? 
"price"	"country"	"num_missions"
0	" New Zealand"	3
0	" Pacific Ocean"	32
0	" Barents Sea"	3
0	" Japan"	83
0	" South Korea"	5
