# SpaceMissions
Maven Space Mission Challenge
About the data: This dataset contains a csv table with 4,631 records, one for each space mission. Each record contains details on each mission's name, location, date, and status of the launch, the company responsible, and the price, status, and name of the rocket.

Aims: 
1. Which company has launched the most rockets? 
2. What is the most common location for space missions? 
3 Cost by the top 5 countries
4 What is the most common street for space missions? 
5. Has the number of space missions increased or decreased over time (years)? 
6 Has the number of space missions increased or decreased over time ( in decades)? 
7. What is the success rate of space missions? 
8. Are there any correlations between rocket status and mission success? 
9. What is the total number of space mission completed till date? 
10. What is the average price of a space mission? 
11. What are the most expensive space missions? 
12. What are the cheapest space missions?

Data source
https://www.mavenanalytics.io/blog/maven-space-challenge.  

Skills used
Data aggregation, Data manipulation and cleaning, Desktop design, SQL, Data visualization and Data insights, DAX.

Process
✅ I reviewed the data to find any bad data points, missing data, and duplicated data in order to perform accurate analysis, visualize the data, and draw actionable insights.
✅Then, I cleaned and transformed the data.
✅Performed simple excel functions to estimate country, street and year.
✅Added new columns for street, country and year.
✅Changed the names Gran Canaria to ‘Spain’ and  Shahrud Missile Test Site to ‘Iran’
✅Hence the original data of 4631 records was reduced to 4504 after cleaning.
✅Final step was to divide into the cleaned data and obtain important insights.

Data cleaning manipulation and transformation
Excel functions
To extract country as Locations
=RIGHT(B2,LEN(B2)-FIND("*",SUBSTITUTE(B2,",","*",LEN(B2)-LEN(SUBSTITUTE(B2,",","")))))
To extract street as Locations
=LEFT(A1,FIND("@",SUBSTITUTE(A1,",","@",LEN(A1)-LEN(SUBSTITUTE(A1,",",""))))-1)
To extract year
=YEAR (A1)
Tools
Excel spreadsheet, Power Query, PostgreSQL, Microsoft PowerBI, Microsoft PowerPoint

Insights from the data
There have been a total of 4,448 unique space missions, with 359 rockets launched by 21 countries and 61 companies from 1957 to 2022.

Out of the 4,503 missions analyzed, 4,076 were successful, making up 90.52% of all space missions. Furthermore, 3,512 rockets (77.99%) have been retired, while 991 are still active.

The number of missions has shown an upward trend, experiencing a 466.67% increase between October 1957 and July 2022. Mission numbers started rising notably in April 2016, with a 90.91% (20) increase over 24 quarters. The steepest incline in mission numbers occurred between April 2016 and April 2022, with an increase from 22 to 42 missions.

The top three countries in terms of mission count are the US with 1,444 missions, followed by Russia with 1,372 and Kazakhstan with 697. The US accounts for 41.10% of all missions.

Among the companies, RVSN USSR holds the highest number of missions with 1,717, which is 486.01% higher than Arianespace, the company with the lowest count at 293 missions. Following RVSN USSR is CASC with 336 missions and Arianespace with 293 missions.
