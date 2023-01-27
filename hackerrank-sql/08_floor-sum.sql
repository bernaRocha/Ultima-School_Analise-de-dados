/*
Query the average population for all cities in CITY, rounded down to the nearest integer.
*/

SELECT FLOOR(AVG(population))
FROM city

/*
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/

SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN'