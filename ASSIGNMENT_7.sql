-- To solve below queries use “sales” database

USE sales_db;
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
3 rows in set (0.00 sec)

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
7 rows in set (0.05 sec)

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
10 rows in set (0.02 sec)

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
5 rows in set (0.03 sec)


-- 1. Write a query that lists each order number followed by the name of the customer who
-- made the order.
SELECT o.onum,c.cname FROM orders o LEFT JOIN customers c ON o.cnum=c.cnum;
+------+----------+
| onum | cname    |
+------+----------+
| 3001 | Cisneros |
| 3003 | Hoffman  |
| 3002 | Pereira  |
| 3005 | Liu      |
| 3006 | Cisneros |
| 3009 | Giovanni |
| 3007 | Grass    |
| 3008 | Clemens  |
| 3010 | Grass    |
| 3011 | Clemens  |
+------+----------+
10 rows in set (0.00 sec)


-- 2. Write a query that gives the names of both the salesperson and the customer for
-- each order along with the order number.

--o.snum=s.snum=c.snum
SELECT o.onum,s.sname,c.cname FROM orders o INNER JOIN salespeople s ON o.snum=s.snum INNER JOIN customers c ON c.snum=o.snum;
+------+---------+----------+
| onum | sname   | cname    |
+------+---------+----------+
| 3001 | Rifkin  | Cisneros |
| 3003 | Peel    | Clemens  |
| 3003 | Peel    | Hoffman  |
| 3002 | Motika  | Pereira  |
| 3005 | Serres  | Grass    |
| 3005 | Serres  | Liu      |
| 3006 | Rifkin  | Cisneros |
| 3009 | Axelrod | Giovanni |
| 3007 | Serres  | Grass    |
| 3007 | Serres  | Liu      |
| 3008 | Peel    | Clemens  |
| 3008 | Peel    | Hoffman  |
| 3010 | Serres  | Grass    |
| 3010 | Serres  | Liu      |
| 3011 | Peel    | Clemens  |
| 3011 | Peel    | Hoffman  |
+------+---------+----------+
16 rows in set (0.00 sec)

--o.snum=s.snum; c.cnum=o.cnum
mysql> SELECT o.onum,s.sname,c.cname FROM orders o INNER JOIN salespeople s ON o.snum=s.snum INNER JOIN customers c ON c.cnum=o.cnum;
+------+---------+----------+
| onum | sname   | cname    |
+------+---------+----------+
| 3003 | Peel    | Hoffman  |
| 3009 | Axelrod | Giovanni |
| 3005 | Serres  | Liu      |
| 3010 | Serres  | Grass    |
| 3007 | Serres  | Grass    |
| 3011 | Peel    | Clemens  |
| 3008 | Peel    | Clemens  |
| 3006 | Rifkin  | Cisneros |
| 3001 | Rifkin  | Cisneros |
| 3002 | Motika  | Pereira  |
+------+---------+----------+
10 rows in set (0.00 sec)




-- 3. Write a query that produces all customers serviced by salespeople with a commission
-- above 12%. Output the customer’s name, the salesperson’s name, and the
-- salesperson’s rate of commission.
SELECT c.cname,s.sname,s.comm FROM salespeople s INNER JOIN customers c ON c.snum=s.snum WHERE comm>0.12;
+----------+--------+------+
| cname    | sname  | comm |
+----------+--------+------+
| Liu      | Serres | 0.13 |
| Grass    | Serres | 0.13 |
| Cisneros | Rifkin | 0.15 |
+----------+--------+------+
3 rows in set (0.00 sec)



-- 4. Write a query that calculates the amount of the salesperson’s commission on each
-- order by a customer with a rating above 100.
select o.onum,o.amt*s.comm,c.rating from orders o inner join customers c ON o.cnum=c.cnum inner join salespeople s ON c.snum=s.snum where
 c.rating>100;
+------+--------------+--------+
| onum | o.amt*s.comm | rating |
+------+--------------+--------+
| 3001 |       2.8035 |    300 |
| 3005 |     670.8585 |    200 |
| 3006 |     164.7240 |    300 |
| 3009 |     171.3230 |    200 |
| 3007 |       9.8475 |    300 |
| 3010 |      40.2935 |    300 |
+------+--------------+--------+
6 rows in set (0.00 sec)


-- 5. Write a query that produces all pairs of salespeople who are living in the same
-- city.Exclude combinations of salespeople with themselves as well as duplicate rows
-- with the order reversed.
SELECT s1.sname,s2.sname FROM salespeople s1 
CROSS join salespeople s2 
WHERE s1.city=s2.city AND s1.sname<>s2.sname AND s1.sname<s2.sname;
+--------+-------+
| sname  | sname |
+--------+-------+
| Motika | Peel  |
+--------+-------+
1 row in set (0.00 sec)


To solve below queries use “spj” database
USE spj;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

SHOW TABLES;
+---------------+
| Tables_in_spj |
+---------------+
| J             |
| P             |
| S             |
| sp            |
+---------------+
4 rows in set (0.00 sec)

1. Display the Supplier name and the Quantity sold.
SELECT Sname,SUM(QTY) FROM S LEFT JOIN sp ON S.`S#`=sp.`S#` GROUP BY S.Sname;
+-------+----------+
| Sname | SUM(QTY) |
+-------+----------+
| Smith |      900 |
| Jones |     3200 |
| Blake |      700 |
| Clark |      600 |
| Adams |     3100 |
+-------+----------+
5 rows in set (0.00 sec)


2. Display the Part name and Quantity sold.
SELECT Pname,SUM(QTY) FROM P LEFT JOIN sp ON P.`P#`=sp.`P#` GROUP BY P.Pname;
+-------+----------+
| Pname | SUM(QTY) |
+-------+----------+
| Nut   |     1000 |
| Bolt  |      300 |
| Screw |     4800 |
| Cam   |     1100 |
| Cog   |     1300 |
+-------+----------+
5 rows in set (0.04 sec)


3. Display the Job name and Quantity sold.
SELECT Jname,SUM(QTY) FROM J LEFT JOIN sp ON J.`J#`=sp.`J#` GROUP BY J.Jname;
+----------+----------+
| Jname    | SUM(QTY) |
+----------+----------+
| Sorter   |      800 |
| Punch    |     1200 |
| Reader   |      500 |
| Console  |     3300 |
| Collator |     1100 |
| Terminal |      400 |
| Tape     |     1200 |
+----------+----------+
7 rows in set (0.05 sec)


4. Display the Supplier name, Part name, Job name and Quantity sold.
SELECT S.Sname,P.Pname,J.Jname,sp.QTY FROM S LEFT JOIN sp ON S.`S#`=sp.`S#` 
LEFT JOIN J ON J.`J#`=sp.`J#` LEFT JOIN P ON P.`P#`=sp.`P#`;
+-------+-------+----------+------+
| Sname | Pname | Jname    | QTY  |
+-------+-------+----------+------+
| Smith | Nut   | Console  |  700 |
| Smith | Nut   | Sorter   |  200 |
| Jones | Cam   | Punch    |  100 |
| Jones | Screw | Tape     |  800 |
| Jones | Screw | Terminal |  400 |
| Jones | Screw | Collator |  600 |
| Jones | Screw | Console  |  500 |
| Jones | Screw | Reader   |  200 |
| Jones | Screw | Punch    |  200 |
| Jones | Screw | Sorter   |  400 |
| Blake | Screw | Punch    |  500 |
| Blake | Screw | Sorter   |  200 |
| Clark | Cog   | Tape     |  300 |
| Clark | Cog   | Reader   |  300 |
| Adams | Cog   | Console  |  500 |
| Adams | Cam   | Console  |  400 |
| Adams | Screw | Console  |  800 |
| Adams | Screw | Console  |  200 |
| Adams | Nut   | Console  |  100 |
| Adams | Cog   | Punch    |  200 |
| Adams | Cam   | Tape     |  100 |
| Adams | Cam   | Collator |  500 |
| Adams | Bolt  | Console  |  100 |
| Adams | Bolt  | Punch    |  200 |
+-------+-------+----------+------+
24 rows in set (0.00 sec)

5. Display the Supplier name, Supplying Parts to a Job in the same City.
SELECT J.City,S.Sname,J.Jname,P.Pname FROM J INNER JOIN S ON J.City=S.City INNER JOIN P ON J.City=P.City;
+--------+-------+----------+-------+
| City   | Sname | Jname    | Pname |
+--------+-------+----------+-------+
| Paris  | Jones | Sorter   | Cam   |
| Paris  | Blake | Sorter   | Cam   |
| Paris  | Jones | Sorter   | Bolt  |
| Paris  | Blake | Sorter   | Bolt  |
| London | Smith | Collator | Cog   |
| London | Clark | Collator | Cog   |
| London | Smith | Collator | Screw |
| London | Clark | Collator | Screw |
| London | Smith | Collator | Nut   |
| London | Clark | Collator | Nut   |
| London | Smith | Tape     | Cog   |
| London | Clark | Tape     | Cog   |
| London | Smith | Tape     | Screw |
| London | Clark | Tape     | Screw |
| London | Smith | Tape     | Nut   |
| London | Clark | Tape     | Nut   |
+--------+-------+----------+-------+
16 rows in set (0.00 sec)

6. Display the Part name that is ‘Red’ is color, and the Quantity sold.
SELECT P.Pname,SUM(sp.QTY) FROM P INNER JOIN sp ON P.`P#`=sp.`P#` WHERE color="RED" GROUP BY P.Pname;
+-------+-------------+
| Pname | SUM(sp.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        1300 |
| Cog   |        1300 |
+-------+-------------+
3 rows in set (0.00 sec)


7. Display all the Quantity sold by Suppliers with the Status = 20.
SELECT S.Sname,SUM(sp.QTY) FROM S LEFT JOIN sp ON S.`S#`=sp.`S#` WHERE status=20 GROUP BY S.Sname;
+-------+-------------+
| Sname | SUM(sp.QTY) |
+-------+-------------+
| Smith |         900 |
| Clark |         600 |
+-------+-------------+
2 rows in set (0.00 sec)


8. Display all the Parts and Quantity with a Weight > 14.
SELECT Pname,SUM(QTY) FROM P LEFT JOIN sp ON P.`P#`=sp.`P#` WHERE weight>14 GROUP BY P.Pname;
+-------+----------+
| Pname | SUM(QTY) |
+-------+----------+
| Bolt  |      300 |
| Screw |     3500 |
| Cog   |     1300 |
+-------+----------+
3 rows in set (0.00 sec)


9. Display all the Job names and City, which has bought more than 500 Parts.
SELECT J.Jname,J.City,SUM(sp.QTY) FROM J INNER JOIN sp ON J.`J#`=sp.`J#` GROUP BY J.Jname,J.city HAVING SUM(sp.QTY)>500;
+----------+--------+-------------+
| Jname    | City   | SUM(sp.QTY) |
+----------+--------+-------------+
| Sorter   | Paris  |         800 |
| Console  | Athens |        3300 |
| Punch    | Rome   |        1200 |
| Collator | London |        1100 |
| Tape     | London |        1200 |
+----------+--------+-------------+
5 rows in set (0.00 sec)


10. Display all the Part names and Quantity sold that have a Weight less than 15.
SELECT Pname,SUM(QTY) FROM P LEFT JOIN sp ON P.`P#`=sp.`P#` WHERE weight<15 GROUP BY P.Pname;
+-------+----------+
| Pname | SUM(QTY) |
+-------+----------+
| Nut   |     1000 |
| Screw |     1300 |
| Cam   |     1100 |
+-------+----------+
3 rows in set (0.00 sec)


11. Display all the Suppliers with the same Status as the supplier, ‘CLARK’.
SELECT Sname FROM S WHERE STATUS=20;
+-------+
| Sname |
+-------+
| Smith |
| Clark |
+-------+
2 rows in set (0.00 sec)


12. Display all the Parts which have more Weight than any Red parts.
SELECT distinct P1.* FROM P P1 INNER JOIN P P2 ON P2.color="Red" WHERE P1.weight>P2.weight;
+------+-------+-------+--------+--------+
| P#   | Pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P2   | Bolt  | Green |     17 | Paris  |
| P3   | Screw | Blue  |     17 | Rome   |
| P4   | Screw | Red   |     14 | London |
| P6   | Cog   | Red   |     19 | London |
+------+-------+-------+--------+--------+
4 rows in set (0.00 sec)


13. Display all the Jobs going on in the same city as the job ‘TAPE’.
SELECT DISTINCT J1.* FROM J J1 INNER JOIN J J2 ON J2.Jname="Tape" WHERE J1.City=J2.City AND J1.Jname<>"Tape";
+----+----------+--------+
| J# | Jname    | City   |
+----+----------+--------+
| J5 | Collator | London |
+----+----------+--------+
1 row in set (0.00 sec)

14. Display all the Parts with Weight less than any the Green parts.
SELECT DISTINCT P1.* FROM P P1 INNER JOIN P P2 ON P2.color="Green" WHERE P1.weight<P2.weight;
+------+-------+-------+--------+--------+
| P#   | Pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
+------+-------+-------+--------+--------+
3 rows in set (0.00 sec)

SELECT DISTINCT P1.* FROM P P1 WHERE P1.weight < (SELECT MIN(P2.weight) FROM P P2 WHERE P2.color = 'Green');
+------+-------+-------+--------+--------+
| P#   | Pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
+------+-------+-------+--------+--------+

-- 15. Display the name of the Supplier who has sold the maximum Quantity (in onesale).
SELECT S.Sname,MAX(sp.QTY) FROM S JOIN sp ON S.`S#` = sp.`S#` GROUP BY S.Sname ORDER BY MAX(sp.QTY) DESC;
+-------+-------------+
| Sname | MAX(sp.QTY) |
+-------+-------------+
| Jones |         800 |
| Adams |         800 |
| Smith |         700 |
| Blake |         500 |
| Clark |         300 |
+-------+-------------+
5 rows in set (0.00 sec)


-- 16. Display the name of the Supplier who has sold the maximum overall Quantity
-- (sumof Sales).
SELECT S.Sname,SUM(sp.QTY) FROM S JOIN sp ON S.`S#` = sp.`S#` GROUP BY S.Sname ORDER BY SUM(sp.QTY) DESC;
+-------+-------------+
| Sname | SUM(sp.QTY) |
+-------+-------------+
| Jones |        3200 |
| Adams |        3100 |
| Smith |         900 |
| Blake |         700 |
| Clark |         600 |
+-------+-------------+
5 rows in set (0.01 sec)