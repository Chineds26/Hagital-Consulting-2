SHOW databases
SHOW TABLES

--QUESTION 1 ANSWER
SELECT continent, region, 
SUM(population) AS total_population
 FROM country
 GROUP BY continent, region
 ORDER BY total_population DESC;
 
 --QUESTION 2 ANSWER
SELECT name, population / surfacearea 
AS density
 FROM country
 WHERE surfacearea > 0
 AND population / surfacearea > (
 SELECT AVG(population / 
surfacearea)
 FROM country
 WHERE surfacearea > 0);

--QUESTION 3 ANSWER
SELECT l.language, SUM(c.population * 
l.percentage / 100) AS speakers
 FROM countrylanguage l
 JOIN country c ON l.countrycode = 
c.code
 GROUP BY l.language
 HAVING speakers > 100000000
 ORDER BY speakers DESC;

--QUESTION 4 ANSWER
SELECT DISTINCT city.name AS capital
 FROM country
 JOIN city ON country.capital = city.id
 WHERE country.code IN (
 SELECT countrycode
 FROM countrylanguage
 GROUP BY countrycode
 HAVING COUNT(*) > 1);

--QUESTION 5 ANSWER
SELECT continent
 FROM country
 GROUP BY continent
 HAVING MAX(population) > 
1000000000;

--QUESTION 6 ANSWER 
SELECT Name as Country_Name, Continent, language, IsOfficial
FROM countrylanguage
join country on CountryCode = Code
WHERE language LIKE 'English' AND isofficial = "T";
 
SELECT * FROM country
SELECT * FROM countrylanguage
SELECT * FROM city