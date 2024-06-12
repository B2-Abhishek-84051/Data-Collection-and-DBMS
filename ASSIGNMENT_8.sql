-- To solve below queries use “sales” database

USE sales_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

USE sales_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
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
7 rows in set (0.00 sec)

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
10 rows in set (0.12 sec)

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
5 rows in set (0.00 sec)


-- 1. Write a query that uses a subquery to obtain all orders for the customer named
-- Cisneros. Assume you do not know his customer number (cnum).

SELECT cnum FROM customers WHERE cname = "Cisneros";
SELECT * FROM orders WHERE cnum = (SELECT cnum FROM customers WHERE cname = "Cisneros");
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+
2 rows in set (0.00 sec)

-- 2. Write a query that produces the names and ratings of all customers who have above-
-- average orders.

SELECT AVG(amt) FROM orders;
+-------------+
| AVG(amt)    |
+-------------+
| 2565.840000 |
+-------------+
1 row in set (0.01 sec)


SELECT cnum FROM orders WHERE amt > (SELECT AVG(amt) FROM orders);
+------+
| cnum |
+------+
| 2003 |
| 2006 |
| 2006 |
+------+
3 rows in set (0.00 sec)


SELECT cnum,cname,rating FROM customers WHERE cnum IN (SELECT cnum FROM ord
ers WHERE amt > (SELECT AVG(amt) FROM orders));
+------+---------+--------+
| cnum | cname   | rating |
+------+---------+--------+
| 2003 | Liu     |    200 |
| 2006 | Clemens |    100 |
+------+---------+--------+
2 rows in set (0.00 sec)

-- 3. Write a query that selects the total amount in orders for each salesperson for whom
-- this total is greater than the amount of the largest order in the table.

SELECT MAX(amt) FROM orders;;
+----------+
| MAX(amt) |
+----------+
|  9891.88 |
+----------+
1 row in set (0.00 sec)

SELECT snum,SUM(amt) FROM orders GROUP BY snum;
+------+----------+
| snum | SUM(amt) |
+------+----------+
| 1007 |  1116.85 |
| 1001 | 15382.07 |
| 1004 |  1900.10 |
| 1002 |  5546.15 |
| 1003 |  1713.23 |
+------+----------+
5 rows in set (0.01 sec)

SELECT snum,SUM(amt) FROM orders GROUP BY snum HAVING SUM(amt) > (SELECT MAX(amt) FROM orders);
+------+----------+
| snum | SUM(amt) |
+------+----------+
| 1001 | 15382.07 |
+------+----------+
1 row in set (0.00 sec)

-- 4. Write a query that selects all customers whose ratings are equal to or greater than
-- ANY of Serres’.

SELECT snum FROM salespeople WHERE sname = "Serres";
+------+
| snum |
+------+
| 1002 |
+------+
1 row in set (0.00 sec)

SELECT rating FROM customers WHERE snum = (SELECT snum FROM salespeople WHERE sname = "Serres");
+--------+
| rating |
+--------+
|    200 |
|    300 |
+--------+
2 rows in set (0.00 sec)

SELECT * FROM customers WHERE rating >= ANY(SELECT rating FROM customers WHERE snum = (SELECT snum FROM salespeople WHERE sname = "Serres"));
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+
4 rows in set (0.00 sec)


-- 5. Write a query using ANY or ALL that will find all salespeople who have no customers
-- located in their city.

select distinct city from customers;
+----------+
| city     |
+----------+
| London   |
| Rome     |
| San Jose |
| Berlin   |
+----------+
4 rows in set (0.00 sec)

select * from salespeople where city <> ANY(select distinct city from customers);
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
5 rows in set (0.00 sec)

select * from salespeople where city <> ALL(select distinct city from customers);
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
2 rows in set (0.00 sec)

-- 6. Write a query that selects all orders for amounts greater than any for the customers in
-- London.

select cnum from customers where city="London";
+------+
| cnum |
+------+
| 2001 |
| 2006 |
+------+
2 rows in set (0.00 sec)


select amt from orders where cnum = ANY(select cnum from customers where city="London");
+---------+
| amt     |
+---------+
|  767.19 |
| 4723.00 |
| 9891.88 |
+---------+
3 rows in set (0.00 sec)


select * from orders where amt > ANY(select amt from orders where cnum = ANY(select cnum from customers where city="London"));
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
6 rows in set (0.00 sec)

-- 7. Extract all the orders of Motika.

select * from salespeople;
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
5 rows in set (0.00 sec)

select snum from salespeople where sname = "Motika";
+------+
| snum |
+------+
| 1004 |
+------+
1 row in set (0.00 sec)

select * from orders where snum = (select snum from salespeople where sname = "Motika");
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
+------+---------+------------+------+------+
1 row in set (0.01 sec)

-- 8. Find all the order attribute to salespeople servicing customers in London.

select * from customers where city = "London";
+------+---------+--------+--------+------+
| cnum | cname   | city   | rating | snum |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2006 | Clemens | London |    100 | 1001 |
+------+---------+--------+--------+------+
2 rows in set (0.00 sec)

create view v_londonCustomers as select * from customers where city = "London";
Query OK, 0 rows affected (0.22 sec)

select * from v_londonCustomers;
+------+---------+--------+--------+------+
| cnum | cname   | city   | rating | snum |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2006 | Clemens | London |    100 | 1001 |
+------+---------+--------+--------+------+
2 rows in set (0.00 sec)

select * from orders where snum = ANY(SELECT snum from customers where city = "London");
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
3 rows in set (0.00 sec)


-- 9. Find names and numbers of all salesperson who have more than one customer.

select snum from customers group by snum having count(snum)>1;
+------+
| snum |
+------+
| 1001 |
| 1002 |
+------+
2 rows in set (0.00 sec)

select sname,snum from salespeople 
where snum = ANY(select snum from customers group by snum having count(snum)>1);
+--------+------+
| sname  | snum |
+--------+------+
| Peel   | 1001 |
| Serres | 1002 |
+--------+------+
2 rows in set (0.11 sec)


-- 10. Find salespeople number,name and city who have multiple customers.

select snum,sname,city from salespeople  
where snum = ANY(select snum from customers group by snum having count(snum)>1);
+------+--------+----------+
| snum | sname  | city     |
+------+--------+----------+
| 1001 | Peel   | London   |
| 1002 | Serres | San Jose |
+------+--------+----------+
2 rows in set (0.00 sec)

-- 11. Select customers who have a greater rating than any other customer in Rome.

select rating from customers where city="Rome";
+--------+
| rating |
+--------+
|    200 |
|    100 |
+--------+
2 rows in set (0.00 sec)

select * from customers where rating > ANY(select rating from customers where city="Rome");
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+
4 rows in set (0.00 sec)

-- 12. Select all orders that had amounts that were greater that atleast one of the orders
-- from ‘1990-10-04’.

select amt from orders where odate = '1990-10-04';
+---------+
| amt     |
+---------+
| 1713.23 |
|   75.75 |
| 4723.00 |
|  309.95 |
| 9891.88 |
+---------+
5 rows in set (0.01 sec)

select * from orders where amt > ANY(select amt from orders where odate = '1990-10-04');
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)

-- 13. Find all orders with amounts smaller than any amount for a customer in San Jose.

select amt from orders where cnum = ANY(select cnum from customers where city = "San Jose");
+---------+
| amt     |
+---------+
|   18.69 |
| 5160.45 |
| 1098.16 |
+---------+
3 rows in set (0.00 sec)

mysql> select * from orders where amt < ANY(select amt from orders where cnum = ANY(select cnum from customers where city = "San Jose"));
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)


-- 14. Select those customers whose rating are higher than every customer in Paris.

select rating from customers where city="Paris";
Empty set (0.00 sec)
