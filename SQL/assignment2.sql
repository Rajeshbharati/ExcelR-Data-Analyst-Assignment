use assignment;
-- 1.	select all employees in department 10 whose salary is greater than 3000. [table: employee]
select * from employee where salary > 3000 and deptno = 10;
-- 2. The grading of students based on the marks they have obtained is done as follows:

-- 40 to 50 -> Second Class
-- 50 to 60 -> First Class
-- 60 to 80 -> First Class
-- 80 to 100 -> Distinctions
-- a.	How many students have graduated with first class?
select count(*) from students where marks between 50 and 80;

-- b.	How many students have obtained distinction? [table: students]
select count(*) from students where marks between 80 and 100;

-- 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
select distinct city from station where mod(id,2)=0;

-- 4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station.
-- [table: station]

select count(city) - count(distinct city) from station as cities;

-- 5. Answer the following
-- a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]
-- Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]
select distinct city from station where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%' or city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' or city like 'U%';

-- b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
select distinct city from station where city like '[A,E,I,O,U]%[A,E,I,O,U]';

-- c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city from station where city not like 'a%' or city not like 'e%' or city not like 'i%' or city not like 'o%' or city not like 'u%' or city not like 'A%' or city not like 'E%' or city not like 'I%' or city not like 'O%' or city not like 'U%';

-- d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]
select distinct city from station where city not like '[A,E,I,O,U]%[A,E,I,O,U]';

-- 6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp]

select emp_no,first_name,last_name, salary from emp where '2021-10-23'-hire_date<1095 and salary > 2000 order by emp_no asc;
-- 7. How much money does the company spend every month on salaries for each department? [table: employee]

-- Expected Result
----------------------
-- +--------+--------------+
-- | deptno | total_salary |
-- +--------+--------------+
-- |     10 |     20700.00 |
-- |     20 |     12300.00 |
-- |     30 |      1675.00 |
-- +--------+--------------+
SELECT deptno, SUM(salary)
FROM employee 
GROUP BY deptno;

-- 8. How many cities in the CITY table have a Population larger than 100000. [table: city]
select count(name) from city where population>100000;

-- 9. What is the total population of California? [table: city]
select sum(population) from city where district = 'California';

-- 10. What is the average population of the districts in each country? [table: city]

select countrycode, avg(population) as avg_population
from city
group by countrycode;

-- 11. Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]


SELECT c.customernumber,c.customername, o.orderNumber,o.status, o.comments 
FROM orders o
LEFT JOIN  customers c
ON c.customerNumber = o.customerNumber
WHERE status='Disputed';