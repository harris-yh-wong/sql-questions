/*
4
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. 
*/ 
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;


/*
5
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/ 
SELECT 
    CITY,
    LENGTH(CITY) as LEN
FROM STATION
ORDER BY LEN DESC, CITY ASC
LIMIT 1;

SELECT 
    CITY,
    LENGTH(CITY) as LEN
FROM STATION
ORDER BY LEN ASC, CITY ASC
LIMIT 1;

/*
6
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[aeiou]';

/*
7
Query the list of CITY names ending with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[aeiou]$';

/*
8
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[aeiou].*[aeiou]$';

/*
9
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^aeiou].*';
/* the first ^ specifies start of string; 
the second ^ specifies negation */

/*
10
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '.*[^aeiou]$';

/*
11
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^aeiou].*' OR CITY REGEXP '.*[^aeiou]$';

/*
12
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^aeiou].*' AND CITY REGEXP '.*[^aeiou]$';






/*
Students
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC;

/*
Employee
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME;

/*
Employee Salaries
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
*/
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID;