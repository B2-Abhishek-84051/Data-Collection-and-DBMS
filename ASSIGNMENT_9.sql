-- use “sales” database to solve below queries.

USE sales_db;
Database changed

SHOW TABLES;
+--------------------+
| Tables_in_sales_db |
+--------------------+
| customers          |
| orders             |
| salespeople        |
| v_londonCustomers  |
+--------------------+
4 rows in set (0.00 sec)

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
10 rows in set (0.00 sec)

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

-- 1. Create an index that will enable a user to pull orders for ‘1990-10-03’ out of the
-- Orders table quickly.

SELECT * FROM orders WHERE odate = '1990-10-03';
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+
5 rows in set (0.00 sec)

EXPLAIN FORMAT = JSON SELECT * FROM orders WHERE odate = '1990-10-03';
"query_cost": "1.25"

CREATE INDEX idx_orders_odate ON orders(odate);
Query OK, 0 rows affected (0.81 sec)
Records: 0  Duplicates: 0  Warnings: 0

DESC orders;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| onum  | int          | YES  |     | NULL    |       |
| amt   | decimal(7,2) | YES  |     | NULL    |       |
| odate | date         | YES  | MUL | NULL    |       |
| cnum  | int          | YES  |     | NULL    |       |
| snum  | int          | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> SHOW INDEXES FROM orders;
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name         | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| orders |          1 | idx_orders_odate |            1 | odate       | A         |           2 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.15 sec)

EXPLAIN FORMAT = JSON SELECT * FROM orders WHERE odate = '1990-10-03';
"query_cost": "1.00"

-- 2. If the Orders table has already been created, how can you force the onum field to be
-- unique (assume all current values are unique)?

CREATE UNIQUE INDEX idx_orders_onum ON orders(onum);
Query OK, 0 rows affected (0.67 sec)
Records: 0  Duplicates: 0  Warnings: 0

desc orders;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| onum  | int          | YES  | UNI | NULL    |       |
| amt   | decimal(7,2) | YES  |     | NULL    |       |
| odate | date         | YES  | MUL | NULL    |       |
| cnum  | int          | YES  |     | NULL    |       |
| snum  | int          | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

insert into orders(onum) values(3011);
ERROR 1062 (23000): Duplicate entry '3011' for key 'orders.idx_orders_onum'


-- 3. Create an index that would permit salesperson to retrieve his orders.

CREATE INDEX idx_orders_snum ON orders(snum); 
Query OK, 0 rows affected (0.93 sec)
Records: 0  Duplicates: 0  Warnings: 0

desc orders;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| onum  | int          | YES  | UNI | NULL    |       |
| amt   | decimal(7,2) | YES  |     | NULL    |       |
| odate | date         | YES  | MUL | NULL    |       |
| cnum  | int          | YES  |     | NULL    |       |
| snum  | int          | YES  | MUL | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

show indexes from orders;
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name         | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| orders |          0 | idx_orders_onum  |            1 | onum        | A         |          10 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| orders |          1 | idx_orders_odate |            1 | odate       | A         |           2 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| orders |          1 | idx_orders_snum  |            1 | snum        | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0.25 sec)

-- 4. Let us assume that each salesperson is to have only one customer of a given rating,
-- and that this is currently the case. Create an index that enforces it.

select * from customers;
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

CREATE INDEX idx_snum_rating ON customers(cnum,rating);

-- 5. Create an index to speed up searching order on a given date by given customer.

CREATE INDEX idx_orders_odate ON orders(odate);
