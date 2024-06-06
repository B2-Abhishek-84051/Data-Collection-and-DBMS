use sales_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

SHOW TABLES;
+--------------------+
| Tables_in_sales_db |
+--------------------+
| customers          |
| orders             |
| salespeople        |
+--------------------+

SELECT * FROM customers;
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.18 sec)

SELECT * FROM orders;
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
10 rows in set (0.05 sec)

SELECT * FROM salespeople;
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
5 rows in set (0.04 sec)

--1. Write a query that counts the number of salespeople registering orders for eachday.
--(If a salesperson has more than one order on a given day, he or she should be
--counted only once.).

select odate,COUNT(DISTINCT cnum) from orders GROUP BY ODATE;
+------------+----------------------+
| odate      | COUNT(DISTINCT cnum) |
+------------+----------------------+
| 1990-10-03 |                    4 |
| 1990-10-04 |                    3 |
+------------+----------------------+


-- 2. Write a query on the Customers table that will find the highest rating in each city. Put
-- the output in this form:
-- For the city (city), the highest rating is : (rating).

SELECT city,MAX(rating) FROM customers GROUP BY city;
+----------+-------------+
| city     | MAX(rating) |
+----------+-------------+
| London   |         100 |
| Rome     |         200 |
| San Jose |         300 |
| Berlin   |         300 |
+----------+-------------+

SELECT CONCAT("For the city ",city,", the highest rating is : ",MAX(rating)) AS Output FROM customers GROUP BY city;
+----------------------------------------------------+
| Output                                             |
+----------------------------------------------------+
| For the city London, the highest rating is : 100   |
| For the city Rome, the highest rating is : 200     |
| For the city San Jose, the highest rating is : 300 |
| For the city Berlin, the highest rating is : 300   |
+----------------------------------------------------+


-- 3 Write a query that totals the orders for each day and places the results in descending
-- order.

select odate,COUNT(cnum) from orders GROUP BY ODATE ORDER BY DESC;
+------------+-------------+
| odate      | COUNT(cnum) |
+------------+-------------+
| 1990-10-03 |           5 |
| 1990-10-04 |           5 |
+------------+-------------+


-- 4. Write a query that selects the total amount in orders for each salesperson for whom
-- this total is greater than the average amount of the order in the table.
-- (Note Use the average amount value directly →2565.84)

SELECT snum,SUM(amt) FROM orders GROUP BY SNUM HAVING SUM(amt)>2565.84;
+------+----------+
| snum | SUM(amt) |
+------+----------+
| 1001 | 15382.07 |
| 1002 |  5546.15 |
+------+----------+


-- 5. Write a query that selects the highest rating in each city.

SELECT city,MAX(rating) FROM customers GROUP BY city;
+----------+-------------+
| city     | MAX(rating) |
+----------+-------------+
| London   |         100 |
| Rome     |         200 |
| San Jose |         300 |
| Berlin   |         300 |
+----------+-------------+

-- 6. Largest order taken by each salesperson with order value more than Rs.3000.

SELECT snum,MAX(amt) FROM orders WHERE amt>3000 GROUP BY snum;
+------+----------+
| snum | MAX(amt) |
+------+----------+
| 1002 |  5160.45 |
| 1001 |  9891.88 |
+------+----------+


-- 7. Select each customer smallest order.

mysql> SELECT cnum,MIN(amt) FROM orders GROUP BY cnum;
+------+----------+
| cnum | MIN(amt) |
+------+----------+
| 2008 |    18.69 |
| 2001 |   767.19 |
| 2007 |  1900.10 |
| 2003 |  5160.45 |
| 2002 |  1713.23 |
| 2004 |    75.75 |
| 2006 |  4723.00 |
+------+----------+


-- To solve below queries use “hr” database
USE hr;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

SHOW TABLES;
+--------------+
| Tables_in_hr |
+--------------+
| countries    |
| departments  |
| employees    |
| job_history  |
| jobs         |
| locations    |
| regions      |
+--------------+

-- 1. Display manager ID and number of employees managed by the manager.

SELECT MANAGER_ID,COUNT(EMPLOYEE_ID) FROM   employees GROUP BY MANAGER_ID;
+------------+--------------------+
| MANAGER_ID | COUNT(EMPLOYEE_ID) |
+------------+--------------------+
|          0 |                  1 |
|        100 |                 14 |
|        101 |                  5 |
|        102 |                  1 |
|        103 |                  4 |
|        108 |                  5 |
|        114 |                  5 |
|        120 |                  8 |
|        121 |                  8 |
|        122 |                  8 |
|        123 |                  8 |
|        124 |                  8 |
|        145 |                  6 |
|        146 |                  6 |
|        147 |                  6 |
|        148 |                  6 |
|        149 |                  6 |
|        201 |                  1 |
|        205 |                  1 |
+------------+--------------------+
19 rows in set (0.00 sec)


-- 2. Display the country ID and number of cities we have in the country.

SELECT COUNTRY_ID,COUNT(CITY) AS NO_OF_CITIES FROM locations GROUP BY COUNTRY_ID;
+------------+--------------+
| COUNTRY_ID | NO_OF_CITIES |
+------------+--------------+
|            |            1 |
| AU         |            1 |
| BR         |            1 |
| CA         |            2 |
| CH         |            2 |
| CN         |            1 |
| DE         |            1 |
| IN         |            1 |
| IT         |            2 |
| JP         |            2 |
| NL         |            1 |
| Ox         |            1 |
| SG         |            1 |
| UK         |            2 |
| US         |            4 |
+------------+--------------+
15 rows in set (0.00 sec)


-- 3. Display average salary of employees in each department who have commission
-- percentage.
SELECT DEPARTMENT_ID,AVG(SALARY) FROM employees WHERE COMMISSION_PCT > 0.0 GROUP BY DEPARTMENT_ID;
+---------------+-------------+
| DEPARTMENT_ID | AVG(SALARY) |
+---------------+-------------+
|             0 | 7000.000000 |
|            80 | 8955.882353 |
+---------------+-------------+
2 rows in set (0.00 sec)

-- 4. Display job ID, number of employees, sum of salary, and difference between highest
-- salary and lowest salary of the employees of the job.

SELECT JOB_ID,COUNT(EMPLOYEE_ID),SUM(SALARY),MAX(SALARY)-MIN(SALARY) AS SALARY_DIFF FROM employees GROUP BY JOB_ID;
+------------+--------------------+-------------+-------------+
| JOB_ID     | COUNT(EMPLOYEE_ID) | SUM(SALARY) | SALARY_DIFF |
+------------+--------------------+-------------+-------------+
| AC_ACCOUNT |                  1 |     8300.00 |        0.00 |
| AC_MGR     |                  1 |    12000.00 |        0.00 |
| AD_ASST    |                  1 |     4400.00 |        0.00 |
| AD_PRES    |                  1 |    24000.00 |        0.00 |
| AD_VP      |                  2 |    34000.00 |        0.00 |
| FI_ACCOUNT |                  5 |    39600.00 |     2100.00 |
| FI_MGR     |                  1 |    12000.00 |        0.00 |
| HR_REP     |                  1 |     6500.00 |        0.00 |
| IT_PROG    |                  5 |    28800.00 |     4800.00 |
| MK_MAN     |                  1 |    13000.00 |        0.00 |
| MK_REP     |                  1 |     6000.00 |        0.00 |
| PR_REP     |                  1 |    10000.00 |        0.00 |
| PU_CLERK   |                  5 |    13900.00 |      600.00 |
| PU_MAN     |                  1 |    11000.00 |        0.00 |
| SA_MAN     |                  5 |    61000.00 |     3500.00 |
| SA_REP     |                 30 |   250500.00 |     5400.00 |
| SH_CLERK   |                 20 |    64300.00 |     1700.00 |
| ST_CLERK   |                 20 |    55700.00 |     1500.00 |
| ST_MAN     |                  5 |    36400.00 |     2400.00 |
+------------+--------------------+-------------+-------------+


-- 5. Display job ID for jobs with average salary more than 10000.
SELECT JOB_ID,ROUND(AVG(SALARY),2) AS AVG_SALARY FROM employees GROUP BY JOB_ID HAVING AVG(SALARY)>10000;
+---------+------------+
| JOB_ID  | AVG_SALARY |
+---------+------------+
| AC_MGR  |   12000.00 |
| AD_PRES |   24000.00 |
| AD_VP   |   17000.00 |
| FI_MGR  |   12000.00 |
| MK_MAN  |   13000.00 |
| PU_MAN  |   11000.00 |
| SA_MAN  |   12200.00 |
+---------+------------+
7 rows in set (0.00 sec)


-- 6. Display years in which more than 10 employees joined.
SELECT YEAR(HIRE_DATE),COUNT(EMPLOYEE_ID) FROM employees GROUP BY YEAR(HIRE_DATE) HAVING COUNT(EMPLOYEE_ID>10) ;
+-----------------+--------------------+
| YEAR(HIRE_DATE) | COUNT(EMPLOYEE_ID) |
+-----------------+--------------------+
|            1987 |                107 |
+-----------------+--------------------+
1 row in set (0.00 sec)


-- 7. Display departments in which more than five employees have commission percentage.
SELECT DEPARTMENT_ID,COUNT(EMPLOYEE_ID) FROM employees WHERE COMMISSION_PCT > 0.0 GROUP BY DEPARTMENT_ID HAVING COUNT(EMPLOYEE_ID)>5;
+---------------+--------------------+
| DEPARTMENT_ID | COUNT(EMPLOYEE_ID) |
+---------------+--------------------+
|            80 |                 34 |
+---------------+--------------------+
1 row in set (0.00 sec)


-- 8. Display employee ID for employees who did more than one job in the past.
SELECT EMPLOYEE_ID,COUNT(JOB_ID) FROM job_history GROUP BY EMPLOYEE_ID;
+-------------+---------------+
| EMPLOYEE_ID | COUNT(JOB_ID) |
+-------------+---------------+
|           0 |             1 |
|         101 |             2 |
|         102 |             1 |
|         114 |             1 |
|         122 |             1 |
|         176 |             2 |
|         200 |             2 |
|         201 |             1 |
+-------------+---------------+
8 rows in set (0.01 sec)


-- 9. Display job ID of jobs that were done by more than 3 employees for more than 100 days.
SELECT JOB_ID,COUNT(EMPLOYEE_ID) FROM employees GROUP BY JOB_ID HAVING COUNT(EMPLOYEE_ID)>3;
SELECT JOB_ID,COUNT(EMPLOYEE_ID) FROM employees WHERE DATEDIFF(HIRE_DATE,NOW()) GROUP BY JOB_ID HAVING COUNT(EMPLOYEE_ID)>3;
+------------+--------------------+
| JOB_ID     | COUNT(EMPLOYEE_ID) |
+------------+--------------------+
| FI_ACCOUNT |                  5 |
| IT_PROG    |                  5 |
| PU_CLERK   |                  5 |
| SA_MAN     |                  5 |
| SA_REP     |                 30 |
| SH_CLERK   |                 20 |
| ST_CLERK   |                 20 |
| ST_MAN     |                  5 |
+------------+--------------------+
8 rows in set (0.00 sec)


-- 10. Display department ID, year, and Number of employees joined.
SELECT DEPARTMENT_ID,YEAR(HIRE_DATE),COUNT(EMPLOYEE_ID) FROM employees GROUP BY DEPARTMENT_ID,YEAR(HIRE_DATE);
+---------------+-----------------+--------------------+
| DEPARTMENT_ID | YEAR(HIRE_DATE) | COUNT(EMPLOYEE_ID) |
+---------------+-----------------+--------------------+
|            90 |            1987 |                  3 |
|            60 |            1987 |                  5 |
|           100 |            1987 |                  6 |
|            30 |            1987 |                  6 |
|            50 |            1987 |                 45 |
|            80 |            1987 |                 34 |
|             0 |            1987 |                  1 |
|            10 |            1987 |                  1 |
|            20 |            1987 |                  2 |
|            40 |            1987 |                  1 |
|            70 |            1987 |                  1 |
|           110 |            1987 |                  2 |
+---------------+-----------------+--------------------+
12 rows in set (0.01 sec)


-- 11. Display how many employees joined in each month of the current year.

SELECT MONTH(HIRE_DATE),COUNT(EMPLOYEE_ID) FROM employees WHERE YEAR(HIRE_DATE)=1987 GROUP BY MONTH(HIRE_DATE);
+------------------+--------------------+
| MONTH(HIRE_DATE) | COUNT(EMPLOYEE_ID) |
+------------------+--------------------+
|                6 |                 14 |
|                7 |                 31 |
|                8 |                 31 |
|                9 |                 30 |
|               10 |                  1 |
+------------------+--------------------+
5 rows in set (0.00 sec)

-- 12. Display details of departments in which the maximum salary is more than 10000.
SELECT DEPARTMENT_ID,MAX(SALARY) FROM employees GROUP BY DEPARTMENT_ID HAVING MAX(SALARY)>10000;
+---------------+-------------+
| DEPARTMENT_ID | MAX(SALARY) |
+---------------+-------------+
|            20 |    13000.00 |
|            30 |    11000.00 |
|            80 |    14000.00 |
|            90 |    24000.00 |
|           100 |    12000.00 |
|           110 |    12000.00 |
+---------------+-------------+
6 rows in set (0.00 sec)
