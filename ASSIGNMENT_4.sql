Note : To solve below queries use “spj” database

use spj;
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

1. Display the PNAME and COLOR from the P table for the
CITY=”London”.

SELECT * FROM P;
+------+-------+-------+--------+--------+
| P#   | Pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P2   | Bolt  | Green |     17 | Paris  |
| P3   | Screw | Blue  |     17 | Rome   |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
| P6   | Cog   | Red   |     19 | London |
+------+-------+-------+--------+--------+

SELECT Pname,color FROM P WHERE city="London";
+-------+-------+
| Pname | color |
+-------+-------+
| Nut   | Red   |
| Screw | Red   |
| Cog   | Red   |
+-------+-------+

2. Display all the Suppliers from London.
SELECT Sname FROM S;
SELECT Sname FROM S WHERE city="London";
+-------+
| Sname |
+-------+
| Smith |
| Clark |
+-------+

3. Display all the Suppliers from Paris or Athens.
SELECT Sname FROM S WHERE city IN("Paris","Athens");
+-------+
| Sname |
+-------+
| Jones |
| Blake |
| Adams |
+-------+

4. Display all the Jobs in Athens.
SELECT * FROM J;
+----+----------+--------+
| J# | Jname    | City   |
+----+----------+--------+
| J1 | Sorter   | Paris  |
| J2 | Punch    | Rome   |
| J3 | Reader   | Athens |
| J4 | Console  | Athens |
| J5 | Collator | London |
| J6 | Terminal | Oslo   |
| J7 | Tape     | London |
+----+----------+--------+

SELECT Jname,City FROM J WHERE City="Athens";
+---------+--------+
| Jname   | City   |
+---------+--------+
| Reader  | Athens |
| Console | Athens |
+---------+--------+


5. Display all the Part names with the weight between 12 and 14
(inclusive of both).
SELECT * FROM P;
+------+-------+-------+--------+--------+
| P#   | Pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P2   | Bolt  | Green |     17 | Paris  |
| P3   | Screw | Blue  |     17 | Rome   |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
| P6   | Cog   | Red   |     19 | London |
+------+-------+-------+--------+--------+

SELECT Pname,weight FROM P WHERE weight BETWEEN 12 AND 14;
+-------+--------+
| Pname | weight |
+-------+--------+
| Nut   |     12 |
| Screw |     14 |
| Cam   |     12 |
+-------+--------+


6. Display all the Suppliers with a Status greater than or equal
to 20.
SELECT * FROM S;
+------+-------+--------+--------+
| S#   | Sname | status | city   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+

mysql> SELECT * FROM S WHERE status>=20;
+------+-------+--------+--------+
| S#   | Sname | status | city   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S3   | Blake |     30 | Paris  |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+


7. Display all the Suppliers except the Suppliers from London.
SELECT * FROM S WHERE city != "London";
+------+-------+--------+--------+
| S#   | Sname | status | city   |
+------+-------+--------+--------+
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+
3 rows in set (0.00 sec)


8. Display only the Cities from where the Suppliers come from.
SELECT city FROM S;
+--------+
| city   |
+--------+
| London |
| Paris  |
| Paris  |
| London |
| Athens |
+--------+

9. Display the Supplier table in the descending order of CITY.
 SELECT * FROM S ORDER BY city DESC;
+------+-------+--------+--------+
| S#   | Sname | status | city   |
+------+-------+--------+--------+
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S1   | Smith |     20 | London |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+


10. Display the Part Table in the ascending order of CITY and
within the city in the ascending order of Part names.
 SELECT * FROM P ORDER BY city,Pname;
+------+-------+-------+--------+--------+
| P#   | Pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P6   | Cog   | Red   |     19 | London |
| P1   | Nut   | Red   |     12 | London |
| P4   | Screw | Red   |     14 | London |
| P2   | Bolt  | Green |     17 | Paris  |
| P5   | Cam   | Blue  |     12 | Paris  |
| P3   | Screw | Blue  |     17 | Rome   |
+------+-------+-------+--------+--------+


11. Display all the Suppliers with a status between 10 and 20.
 SELECT * FROM S WHERE status BETWEEN 10 AND 20;
+------+-------+--------+--------+
| S#   | Sname | status | city   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S2   | Jones |     10 | Paris  |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+
3 rows in set (0.00 sec)


12. Display all the Parts and their Weight, which are not in the
range of 10 and 15.
 SELECT * FROM P WHERE weight NOT BETWEEN 10 AND 15;
+------+-------+-------+--------+--------+
| P#   | Pname | color | weight | city   |
+------+-------+-------+--------+--------+
| P2   | Bolt  | Green |     17 | Paris  |
| P3   | Screw | Blue  |     17 | Rome   |
| P6   | Cog   | Red   |     19 | London |
+------+-------+-------+--------+--------+
