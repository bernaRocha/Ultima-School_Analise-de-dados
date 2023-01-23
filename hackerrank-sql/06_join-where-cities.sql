/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT city.name
FROM city
LEFT JOIN country ON city.countrycode = country.code
WHERE continent = 'Africa'