/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT city
FROM station
WHERE city LIKE 'a%'
OR city LIKE 'e%'
OR city LIKE 'i%'
OR city LIKE 'o%'
OR city LIKE 'u%'

/*
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT city
FROM station
WHERE city LIKE '%a'
OR city LIKE '%e'
OR city LIKE '%i'
OR city LIKE '%o'
OR city LIKE '%u'

/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.*/

SELECT DISTINCT city 
FROM station 
WHERE (city LIKE "a%" 
OR city LIKE "e%" 
OR city LIKE "i%" 
OR city LIKE "o%" 
OR city LIKE "u%") 
AND 
(city LIKE "%a"
OR city LIKE "%e" 
OR city LIKE "%i" 
OR city LIKE "%o" 
OR city LIKE "%u");

SELECT DISTINCT city 
FROM station 
WHERE substr(city,1,1) IN ('a','e','i','o','u') 
AND substr(city,-1,1) IN ('a','e','i','o','u') 
ORDER BY city;

SELECT DISTINCT city 
FROM station
WHERE substr(lower(city),1,1) IN ('a', 'e', 'i', 'o', 'u') 
AND substr(lower(city), -1, 1) IN ('a', 'e', 'i', 'o', 'u');
