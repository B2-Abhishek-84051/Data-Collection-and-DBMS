Database Technologies 'Assignment 1'
1. Create 'spj' database.
CREATE DATABASE spj;
Query OK, 1 row affected (0.36 sec)

2. use spj database;
USE spj;
Database changed

3. Create following tables in spj database.

CREATE TABLE S (`S#` CHAR(5) NOT NULL, Sname CHAR(20), status
SMALLINT, city CHAR(15));
Query OK, 0 rows affected (0.82 sec)
SHOW TABLES;
+----------------+
| Tables_in_spj |
+----------------+
| S              |
+----------------+

INSERT INTO S VALUES('S1','Smith',20,'London'),
('S2','Jones',10,'Paris'),
('S3','Blake',30,'Paris'),
('S4','Clark',20,'London'),
('S5','Adams',30,'Athens');
Query OK, 5 rows affected (0.20 sec)
Records: 5  Duplicates: 0  Warnings: 0

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

CREATE TABLE P (`P#` CHAR(6) NOT NULL, Pname CHAR(20), color
CHAR(6), weight SMALLINT , city CHAR(15));
Query OK, 0 rows affected (1.22 sec)

INSERT INTO P VALUES('P1',"Nut","Red",12,"London"),
('P2','Bolt','Green',12,'London'),
('P3','Screw','Blue',17,'Paris'),
('P2','Bolt','Green',12,'London'),
('P3','Screw','Blue',17,'Paris');
Query OK, 5 rows affected (0.36 sec)
Records: 5  Duplicates: 0  Warnings: 0

SHOW TABLES;
+----------------+
| Tables_in_spj2 |
+----------------+
| P              |
| S              |
+----------------+

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

CREATE TABLE J (`J#` CHAR(4) NOT NULL, Jname CHAR(10), City
CHAR(15));
Query OK, 0 rows affected (1.30 sec)

SHOW TABLES;
+----------------+
| Tables_in_spj2 |
+----------------+
| J              |
| P              |
| S              |
+----------------+
3 rows in set (0.00 sec)

INSERT INTO J VALUES
('J1','Sorter','Paris'),
('J2','Punch','Rome'),
('J3','Reader','Athens'),
('J4','Console','Athens'),
('J5','Collator','London'),
('J6','Terminal','Oslo'),
('J7','Tape','London');
Query OK, 7 rows affected (0.25 sec)
Records: 7  Duplicates: 0  Warnings: 0

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
7 rows in set (0.00 sec)

CREATE TABLE sp (`S#` CHAR(4) NOT NULL, `P#` CHAR(4) NOT NULL, `J#`
CHAR(4) NOT NULL, QTY INT);
Query OK, 0 rows affected (1.30 sec)

SHOW TABLES;
+----------------+
| Tables_in_spj2 |
+----------------+
| J              |
| P              |
| S              |
| sp             |
+----------------+

INSERT INTO sp VALUES
('S1','P1','J1',200),
('S1','P1','J4',700),
('S2','P3','J1',400),
('S2','P3','J2',200),
('S2','P3','J3',200),
('S2','P3','J4',500),
('S2','P3','J5',600),
('S2','P3','J6',400),
('S2','P3','J7',800),
('S2','P5','J2',100),
('S3','P3','J1',200),
('S3','P4','J2',500),
('S4','P6','J3',300),
('S4','P6','J7',300),
('S5','P2','J2',200),
('S5','P2','J4',100),
('S5','P5','J5',500),
('S5','P5','J7',100),
('S5','P6','J2',200),
('S5','P1','J4',100),
('S5','P3','J4',200),
('S5','P4','J4',800),
('S5','P5','J4',400),
('S5','P6','J4',500);
Query OK, 24 rows affected (0.23 sec)
Records: 24  Duplicates: 0  Warnings: 0

SELECT * FROM sp;
+----+----+----+------+
| S# | P# | J# | QTY  |
+----+----+----+------+
| S1 | P1 | J1 |  200 |
| S1 | P1 | J4 |  700 |
| S2 | P3 | J1 |  400 |
| S2 | P3 | J2 |  200 |
| S2 | P3 | J3 |  200 |
| S2 | P3 | J4 |  500 |
| S2 | P3 | J5 |  600 |
| S2 | P3 | J6 |  400 |
| S2 | P3 | J7 |  800 |
| S2 | P5 | J2 |  100 |
| S3 | P3 | J1 |  200 |
| S3 | P4 | J2 |  500 |
| S4 | P6 | J3 |  300 |
| S4 | P6 | J7 |  300 |
| S5 | P2 | J2 |  200 |
| S5 | P2 | J4 |  100 |
| S5 | P5 | J5 |  500 |
| S5 | P5 | J7 |  100 |
| S5 | P6 | J2 |  200 |
| S5 | P1 | J4 |  100 |
| S5 | P3 | J4 |  200 |
| S5 | P4 | J4 |  800 |
| S5 | P5 | J4 |  400 |
| S5 | P6 | J4 |  500 |
+----+----+----+------+
