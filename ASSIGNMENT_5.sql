Note : To solve below queries use “hr” database

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

1. Display first name and last name after converting the first letter of each name to
upper case and the rest to lower case.

SELECT CONCAT(CONCAT(UPPER(LEFT(FIRST_NAME,1)),LOWER(SUBSTR(FIRST_NAME,2)))," ",CONCAT(UPPER(LEFT(LAST_NAME,1)),LOWER(SUBSTR(LAST_NAME,2)))) 
+-------------------+
| EMPLOYEE_NAME     |
+-------------------+
| Ellen Abel        |
| Sundar Ande       |
| Mozhe Atkinson    |
| David Austin      |
| Hermann Baer      |
| Shelli Baida      |
| Amit Banda        |
| Elizabeth Bates   |
| Sarah Bell        |
| David Bernstein   |
| Laura Bissot      |
| Harrison Bloom    |
| Alexis Bull       |
| Anthony Cabrio    |
| Gerald Cambrault  |
| Nanette Cambrault |
| John Chen         |
| Kelly Chung       |
| Karen Colmenares  |
| Curtis Davies     |
| Lex De haan       |
| Julia Dellinger   |
| Jennifer Dilly    |
| Louise Doran      |
| Bruce Ernst       |
| Alberto Errazuriz |
| Britney Everett   |
| Daniel Faviet     |
| Pat Fay           |
| Kevin Feeney      |
| Jean Fleaur       |
| Tayler Fox        |
| Adam Fripp        |
| Timothy Gates     |
| Ki Gee            |
| Girard Geoni      |
| William Gietz     |
| Douglas Grant     |
| Kimberely Grant   |
| Nancy Greenberg   |
| Danielle Greene   |
| Peter Hall        |
| Michael Hartstein |
| Shelley Higgins   |
| Guy Himuro        |
| Alexander Hunold  |
| Alyssa Hutton     |
| Charles Johnson   |
| Vance Jones       |
| Payam Kaufling    |
| Alexander Khoo    |
| Janette King      |
| Steven King       |
| Neena Kochhar     |
| Sundita Kumar     |
| Renske Ladwig     |
| James Landry      |
| David Lee         |
| Jack Livingston   |
| Diana Lorentz     |
| Jason Mallin      |
| Steven Markle     |
| James Marlow      |
| Mattea Marvins    |
| Randall Matos     |
| Susan Mavris      |
| Samuel Mccain     |
| Allan Mcewen      |
| Irene Mikkilineni |
| Kevin Mourgos     |
| Julia Nayer       |
| Donald Oconnell   |
| Christopher Olsen |
| Tj Olson          |
| Lisa Ozer         |
| Karen Partners    |
| Valli Pataballa   |
| Joshua Patel      |
| Randall Perkins   |
| Hazel Philtanker  |
| Luis Popp         |
| Trenna Rajs       |
| Den Raphaely      |
| Michael Rogers    |
| John Russell      |
| Nandita Sarchand  |
| Ismael Sciarra    |
| John Seo          |
| Sarath Sewall     |
| Lindsey Smith     |
| William Smith     |
| Stephen Stiles    |
| Martha Sullivan   |
| Patrick Sully     |
| Jonathon Taylor   |
| Winston Taylor    |
| Sigal Tobias      |
| Peter Tucker      |
| Oliver Tuvault    |
| Jose manuel Urman |
| Peter Vargas      |
| Clara Vishney     |
| Shanta Vollman    |
| Alana Walsh       |
| Matthew Weiss     |
| Jennifer Whalen   |
| Eleni Zlotkey     |
+-------------------+

2. Display the first word in job title.

select * from jobs;
+------------+---------------------------------+------------+------------+
| JOB_ID     | JOB_TITLE                       | MIN_SALARY | MAX_SALARY |
+------------+---------------------------------+------------+------------+
| AD_PRES    | President                       |      20000 |      40000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| FI_MGR     | Finance Manager                 |       8200 |      16000 |
| FI_ACCOUNT | Accountant                      |       4200 |       9000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| SA_MAN     | Sales Manager                   |      10000 |      20000 |
| SA_REP     | Sales Representative            |       6000 |      12000 |
| PU_MAN     | Purchasing Manager              |       8000 |      15000 |
| PU_CLERK   | Purchasing Clerk                |       2500 |       5500 |
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
| ST_CLERK   | Stock Clerk                     |       2000 |       5000 |
| SH_CLERK   | Shipping Clerk                  |       2500 |       5500 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| HR_REP     | Human Resources Representative  |       4000 |       9000 |
| PR_REP     | Public Relations Representative |       4500 |      10500 |
+------------+---------------------------------+------------+------------+
19 rows in set (0.00 sec)

mysql> SELECT LEFT(JOB_TITLE,1) FROM jobs;
+-------------------+
| LEFT(JOB_TITLE,1) |
+-------------------+
| P                 |
| A                 |
| A                 |
| F                 |
| A                 |
| A                 |
| P                 |
| S                 |
| S                 |
| P                 |
| P                 |
| S                 |
| S                 |
| S                 |
| P                 |
| M                 |
| M                 |
| H                 |
| P                 |
+-------------------+
19 rows in set (0.00 sec)


3. Display the length of first name for employees where last name contain character ‘b’
after 3rd position.

SELECT FIRST_NAME,LAST_NAME FROM employees WHERE LAST_NAME LIKE "___%B%"; 
+------------+-----------+
| FIRST_NAME | LAST_NAME |
+------------+-----------+
| Gerald     | Cambrault |
| Nanette    | Cambrault |
| Nancy      | Greenberg |
| Valli      | Pataballa |
+------------+-----------+


SELECT LENGTH(FIRST_NAME) FROM employees WHERE LAST_NAME LIKE "___%B%";
+--------------------+
| LENGTH(FIRST_NAME) |
+--------------------+
|                  6 |
|                  7 |
|                  5 |
|                  5 |
+--------------------+


4. Display first name in upper case and email address in lower case for employees
where the first name and email address are same irrespective of the case.

SELECT UPPER(FIRST_NAME),LOWER(EMAIL) FROM employees WHERE FIRST_NAME=EMAIL;
Empty set (0.00 sec)


5. Display first name, salary, and round the salary to thousands.

SELECT FIRST_NAME,ROUND(SALARY,-3) FROM employees;
+-------------+------------------+
| FIRST_NAME  | ROUND(SALARY,-3) |
+-------------+------------------+
| Steven      |            24000 |
| Neena       |            17000 |
| Lex         |            17000 |
| Alexander   |             9000 |
| Bruce       |             6000 |
| David       |             5000 |
| Valli       |             5000 |
| Diana       |             4000 |
| Nancy       |            12000 |
| Daniel      |             9000 |
| John        |             8000 |
| Ismael      |             8000 |
| Jose Manuel |             8000 |
| Luis        |             7000 |
| Den         |            11000 |
| Alexander   |             3000 |
| Shelli      |             3000 |
| Sigal       |             3000 |
| Guy         |             3000 |
| Karen       |             3000 |
| Matthew     |             8000 |
| Adam        |             8000 |
| Payam       |             8000 |
| Shanta      |             7000 |
| Kevin       |             6000 |
| Julia       |             3000 |
| Irene       |             3000 |
| James       |             2000 |
| Steven      |             2000 |
| Laura       |             3000 |
| Mozhe       |             3000 |
| James       |             3000 |
| TJ          |             2000 |
| Jason       |             3000 |
| Michael     |             3000 |
| Ki          |             2000 |
| Hazel       |             2000 |
| Renske      |             4000 |
| Stephen     |             3000 |
| John        |             3000 |
| Joshua      |             3000 |
| Trenna      |             4000 |
| Curtis      |             3000 |
| Randall     |             3000 |
| Peter       |             3000 |
| John        |            14000 |
| Karen       |            14000 |
| Alberto     |            12000 |
| Gerald      |            11000 |
| Eleni       |            11000 |
| Peter       |            10000 |
| David       |            10000 |
| Peter       |             9000 |
| Christopher |             8000 |
| Nanette     |             8000 |
| Oliver      |             7000 |
| Janette     |            10000 |
| Patrick     |            10000 |
| Allan       |             9000 |
| Lindsey     |             8000 |
| Louise      |             8000 |
| Sarath      |             7000 |
| Clara       |            11000 |
| Danielle    |            10000 |
| Mattea      |             7000 |
| David       |             7000 |
| Sundar      |             6000 |
| Amit        |             6000 |
| Lisa        |            12000 |
| Harrison    |            10000 |
| Tayler      |            10000 |
| William     |             7000 |
| Elizabeth   |             7000 |
| Sundita     |             6000 |
| Ellen       |            11000 |
| Alyssa      |             9000 |
| Jonathon    |             9000 |
| Jack        |             8000 |
| Kimberely   |             7000 |
| Charles     |             6000 |
| Winston     |             3000 |
| Jean        |             3000 |
| Martha      |             3000 |
| Girard      |             3000 |
| Nandita     |             4000 |
| Alexis      |             4000 |
| Julia       |             3000 |
| Anthony     |             3000 |
| Kelly       |             4000 |
| Jennifer    |             4000 |
| Timothy     |             3000 |
| Randall     |             3000 |
| Sarah       |             4000 |
| Britney     |             4000 |
| Samuel      |             3000 |
| Vance       |             3000 |
| Alana       |             3000 |
| Kevin       |             3000 |
| Donald      |             3000 |
| Douglas     |             3000 |
| Jennifer    |             4000 |
| Michael     |            13000 |
| Pat         |             6000 |
| Susan       |             7000 |
| Hermann     |            10000 |
| Shelley     |            12000 |
| William     |             8000 |
+-------------+------------------+


6. Display employee ID and the date on which he ended his previous job.

SELECT EMPLOYEE_ID,END_DATE FROM job_history;
+-------------+------------+
| EMPLOYEE_ID | END_DATE   |
+-------------+------------+
|         102 | 1998-07-24 |
|         101 | 1993-10-27 |
|         101 | 1997-03-15 |
|         201 | 1999-12-19 |
|         114 | 1999-12-31 |
|         122 | 1999-12-31 |
|         200 | 1993-06-17 |
|         176 | 1998-12-31 |
|         176 | 1999-12-31 |
|         200 | 1998-12-31 |
|           0 | 0000-00-00 |
+-------------+------------+



7. Display first name and date of first salary of the employees.
(Consider 1st day of month as salary day) HINT: LAST_DAY.


SELECT FIRST_NAME,DATE_ADD(LAST_DAY(HIRE_DATE), INTERVAL 1 DAY) AS FIRST_SAL_DATE FROM employees;
+-------------+----------------+
| FIRST_NAME  | FIRST_SAL_DATE |
+-------------+----------------+
| Steven      | 1987-07-01     |
| Neena       | 1987-07-01     |
| Lex         | 1987-07-01     |
| Alexander   | 1987-07-01     |
| Bruce       | 1987-07-01     |
| David       | 1987-07-01     |
| Valli       | 1987-07-01     |
| Diana       | 1987-07-01     |
| Nancy       | 1987-07-01     |
| Daniel      | 1987-07-01     |
| John        | 1987-07-01     |
| Ismael      | 1987-07-01     |
| Jose Manuel | 1987-07-01     |
| Luis        | 1987-07-01     |
| Den         | 1987-08-01     |
| Alexander   | 1987-08-01     |
| Shelli      | 1987-08-01     |
| Sigal       | 1987-08-01     |
| Guy         | 1987-08-01     |
| Karen       | 1987-08-01     |
| Matthew     | 1987-08-01     |
| Adam        | 1987-08-01     |
| Payam       | 1987-08-01     |
| Shanta      | 1987-08-01     |
| Kevin       | 1987-08-01     |
| Julia       | 1987-08-01     |
| Irene       | 1987-08-01     |
| James       | 1987-08-01     |
| Steven      | 1987-08-01     |
| Laura       | 1987-08-01     |
| Mozhe       | 1987-08-01     |
| James       | 1987-08-01     |
| TJ          | 1987-08-01     |
| Jason       | 1987-08-01     |
| Michael     | 1987-08-01     |
| Ki          | 1987-08-01     |
| Hazel       | 1987-08-01     |
| Renske      | 1987-08-01     |
| Stephen     | 1987-08-01     |
| John        | 1987-08-01     |
| Joshua      | 1987-08-01     |
| Trenna      | 1987-08-01     |
| Curtis      | 1987-08-01     |
| Randall     | 1987-08-01     |
| Peter       | 1987-08-01     |
| John        | 1987-09-01     |
| Karen       | 1987-09-01     |
| Alberto     | 1987-09-01     |
| Gerald      | 1987-09-01     |
| Eleni       | 1987-09-01     |
| Peter       | 1987-09-01     |
| David       | 1987-09-01     |
| Peter       | 1987-09-01     |
| Christopher | 1987-09-01     |
| Nanette     | 1987-09-01     |
| Oliver      | 1987-09-01     |
| Janette     | 1987-09-01     |
| Patrick     | 1987-09-01     |
| Allan       | 1987-09-01     |
| Lindsey     | 1987-09-01     |
| Louise      | 1987-09-01     |
| Sarath      | 1987-09-01     |
| Clara       | 1987-09-01     |
| Danielle    | 1987-09-01     |
| Mattea      | 1987-09-01     |
| David       | 1987-09-01     |
| Sundar      | 1987-09-01     |
| Amit        | 1987-09-01     |
| Lisa        | 1987-09-01     |
| Harrison    | 1987-09-01     |
| Tayler      | 1987-09-01     |
| William     | 1987-09-01     |
| Elizabeth   | 1987-09-01     |
| Sundita     | 1987-09-01     |
| Ellen       | 1987-09-01     |
| Alyssa      | 1987-09-01     |
| Jonathon    | 1987-10-01     |
| Jack        | 1987-10-01     |
| Kimberely   | 1987-10-01     |
| Charles     | 1987-10-01     |
| Winston     | 1987-10-01     |
| Jean        | 1987-10-01     |
| Martha      | 1987-10-01     |
| Girard      | 1987-10-01     |
| Nandita     | 1987-10-01     |
| Alexis      | 1987-10-01     |
| Julia       | 1987-10-01     |
| Anthony     | 1987-10-01     |
| Kelly       | 1987-10-01     |
| Jennifer    | 1987-10-01     |
| Timothy     | 1987-10-01     |
| Randall     | 1987-10-01     |
| Sarah       | 1987-10-01     |
| Britney     | 1987-10-01     |
| Samuel      | 1987-10-01     |
| Vance       | 1987-10-01     |
| Alana       | 1987-10-01     |
| Kevin       | 1987-10-01     |
| Donald      | 1987-10-01     |
| Douglas     | 1987-10-01     |
| Jennifer    | 1987-10-01     |
| Michael     | 1987-10-01     |
| Pat         | 1987-10-01     |
| Susan       | 1987-10-01     |
| Hermann     | 1987-10-01     |
| Shelley     | 1987-10-01     |
| William     | 1987-11-01     |
+-------------+----------------+


8. Display first name and experience of the employees.

SELECT FIRST_NAME,CONCAT(TIMESTAMPDIFF(YEAR,HIRE_DATE,NOW())," yrs ",TIMESTAMPDIFF(MONTH,HIRE_DATE,NOW())%12," mo") as Experience FROM employees;
+-------------+--------------+
| FIRST_NAME  | Experience   |
+-------------+--------------+
| Steven      | 36 yrs 11 mo |
| Neena       | 36 yrs 11 mo |
| Lex         | 36 yrs 11 mo |
| Alexander   | 36 yrs 11 mo |
| Bruce       | 36 yrs 11 mo |
| David       | 36 yrs 11 mo |
| Valli       | 36 yrs 11 mo |
| Diana       | 36 yrs 11 mo |
| Nancy       | 36 yrs 11 mo |
| Daniel      | 36 yrs 11 mo |
| John        | 36 yrs 11 mo |
| Ismael      | 36 yrs 11 mo |
| Jose Manuel | 36 yrs 11 mo |
| Luis        | 36 yrs 11 mo |
| Den         | 36 yrs 11 mo |
| Alexander   | 36 yrs 11 mo |
| Shelli      | 36 yrs 11 mo |
| Sigal       | 36 yrs 11 mo |
| Guy         | 36 yrs 11 mo |
| Karen       | 36 yrs 10 mo |
| Matthew     | 36 yrs 10 mo |
| Adam        | 36 yrs 10 mo |
| Payam       | 36 yrs 10 mo |
| Shanta      | 36 yrs 10 mo |
| Kevin       | 36 yrs 10 mo |
| Julia       | 36 yrs 10 mo |
| Irene       | 36 yrs 10 mo |
| James       | 36 yrs 10 mo |
| Steven      | 36 yrs 10 mo |
| Laura       | 36 yrs 10 mo |
| Mozhe       | 36 yrs 10 mo |
| James       | 36 yrs 10 mo |
| TJ          | 36 yrs 10 mo |
| Jason       | 36 yrs 10 mo |
| Michael     | 36 yrs 10 mo |
| Ki          | 36 yrs 10 mo |
| Hazel       | 36 yrs 10 mo |
| Renske      | 36 yrs 10 mo |
| Stephen     | 36 yrs 10 mo |
| John        | 36 yrs 10 mo |
| Joshua      | 36 yrs 10 mo |
| Trenna      | 36 yrs 10 mo |
| Curtis      | 36 yrs 10 mo |
| Randall     | 36 yrs 10 mo |
| Peter       | 36 yrs 10 mo |
| John        | 36 yrs 10 mo |
| Karen       | 36 yrs 10 mo |
| Alberto     | 36 yrs 10 mo |
| Gerald      | 36 yrs 10 mo |
| Eleni       | 36 yrs 10 mo |
| Peter       | 36 yrs 9 mo  |
| David       | 36 yrs 9 mo  |
| Peter       | 36 yrs 9 mo  |
| Christopher | 36 yrs 9 mo  |
| Nanette     | 36 yrs 9 mo  |
| Oliver      | 36 yrs 9 mo  |
| Janette     | 36 yrs 9 mo  |
| Patrick     | 36 yrs 9 mo  |
| Allan       | 36 yrs 9 mo  |
| Lindsey     | 36 yrs 9 mo  |
| Louise      | 36 yrs 9 mo  |
| Sarath      | 36 yrs 9 mo  |
| Clara       | 36 yrs 9 mo  |
| Danielle    | 36 yrs 9 mo  |
| Mattea      | 36 yrs 9 mo  |
| David       | 36 yrs 9 mo  |
| Sundar      | 36 yrs 9 mo  |
| Amit        | 36 yrs 9 mo  |
| Lisa        | 36 yrs 9 mo  |
| Harrison    | 36 yrs 9 mo  |
| Tayler      | 36 yrs 9 mo  |
| William     | 36 yrs 9 mo  |
| Elizabeth   | 36 yrs 9 mo  |
| Sundita     | 36 yrs 9 mo  |
| Ellen       | 36 yrs 9 mo  |
| Alyssa      | 36 yrs 9 mo  |
| Jonathon    | 36 yrs 9 mo  |
| Jack        | 36 yrs 9 mo  |
| Kimberely   | 36 yrs 9 mo  |
| Charles     | 36 yrs 9 mo  |
| Winston     | 36 yrs 9 mo  |
| Jean        | 36 yrs 8 mo  |
| Martha      | 36 yrs 8 mo  |
| Girard      | 36 yrs 8 mo  |
| Nandita     | 36 yrs 8 mo  |
| Alexis      | 36 yrs 8 mo  |
| Julia       | 36 yrs 8 mo  |
| Anthony     | 36 yrs 8 mo  |
| Kelly       | 36 yrs 8 mo  |
| Jennifer    | 36 yrs 8 mo  |
| Timothy     | 36 yrs 8 mo  |
| Randall     | 36 yrs 8 mo  |
| Sarah       | 36 yrs 8 mo  |
| Britney     | 36 yrs 8 mo  |
| Samuel      | 36 yrs 8 mo  |
| Vance       | 36 yrs 8 mo  |
| Alana       | 36 yrs 8 mo  |
| Kevin       | 36 yrs 8 mo  |
| Donald      | 36 yrs 8 mo  |
| Douglas     | 36 yrs 8 mo  |
| Jennifer    | 36 yrs 8 mo  |
| Michael     | 36 yrs 8 mo  |
| Pat         | 36 yrs 8 mo  |
| Susan       | 36 yrs 8 mo  |
| Hermann     | 36 yrs 8 mo  |
| Shelley     | 36 yrs 8 mo  |
| William     | 36 yrs 8 mo  |
+-------------+--------------+


9. Display first name of employees who joined in 2001.

SELECT * FROM employees WHERE YEAR(HIRE_DATE)=2001;
Empty set (0.00 sec)


10. Display employees who joined in the current year.

SELECT * FROM employees WHERE YEAR(HIRE_DATE)=YEAR(NOW());
Empty set (0.00 sec)

11. Display the number of days between system date and 1st January 2011.

SELECT TIMESTAMPDIFF(DAY,'2011-01-01',NOW());
+---------------------------------------+
| TIMESTAMPDIFF(DAY,'2011-01-01',NOW()) |
+---------------------------------------+
|                                  4904 |
+---------------------------------------+


12. Display number of employees joined after 15th of the month.

SELECT COUNT(*) FROM employees WHERE DAY(HIRE_DATE)>15;
+----------+
| COUNT(*) |
+----------+
|       61 |
+----------+


13. Display third highest salary of employees.

SELECT DISTINCT SALARY FROM employees ORDER BY SALARY DESC LIMIT 2,1;
+----------+
| SALARY   |
+----------+
| 14000.00 |
+----------+


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

SELECT * from J;
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


SELECT * from P;
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


SELECT * from S;
+------+-------+--------+--------+
| S#   | Sname | status | city   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+

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


1. Display all the Suppliers, belonging to cities starting with the letter ‘L’.
SELECT Sname,city FROM S WHERE LEFT(city,1)="L";
+-------+--------+
| Sname | city   |
+-------+--------+
| Smith | London |
| Clark | London |
+-------+--------+


2. Display all the Jobs, with the third letter in JNAME as ‘n’.
SELECT Jname FROM J WHERE JNAME LIKE "__n%";
+---------+
| Jname   |
+---------+
| Punch   |
| Console |
+---------+


3. Display all the Supplier names with the initial letter capital.
SELECT CONCAT(UPPER(LEFT(Sname,1)),LOWER(SUBSTR(Sname,2))) AS SUPPLIER_NAME FROM S;
+---------------+
| SUPPLIER_NAME |
+---------------+
| Smith         |
| Jones         |
| Blake         |
| Clark         |
| Adams         |
+---------------+


4. Display all the Supplier names in upper case.
SELECT UPPER(Sname) AS SUPPLIER_NAME FROM S;
+--------------+
| SUPPLIER_NAME |
+--------------+
| SMITH        |
| JONES        |
| BLAKE        |
| CLARK        |
| ADAMS        |
+--------------+


5. Display all the Supplier names in lower case.
SELECT LOWER(Sname) AS SUPPLIER_NAME FROM S;
+---------------+
| SUPPLIER_NAME |
+---------------+
| smith         |
| jones         |
| blake         |
| clark         |
| adams         |
+---------------+


6. Display the Supplier names and the lengths of the names.
SELECT Sname,LENGTH(Sname) FROM S;
+-------+---------------+
| Sname | LENGTH(Sname) |
+-------+---------------+
| Smith |             5 |
| Jones |             5 |
| Blake |             5 |
| Clark |             5 |
| Adams |             5 |
+-------+---------------+


7. Display the current day (e.g. Thursday).
select NOW(),DAYNAME(NOW());
+---------------------+----------------+
| NOW()               | DAYNAME(NOW()) |
+---------------------+----------------+
| 2024-06-05 16:08:19 | Wednesday      |
+---------------------+----------------+


8. Display the minimum Status in the Supplier table.
SELECT MIN(status) FROM S;
+-------------+
| MIN(status) |
+-------------+
|          10 |
+-------------+


9. Display the maximum Weight in the Parts table.
SELECT MAX(weight) FROM P;
+-------------+
| MAX(weight) |
+-------------+
|          19 |
+-------------+


10. Display the average Weight of the Parts.
SELECT AVG(weight) FROM P;
+-------------+
| AVG(weight) |
+-------------+
|     15.1667 |
+-------------+


11. Display the total Quantity sold for part ‘P1’.
SELECT SUM(QTY) FROM sp WHERE `P#`="P1";
+----------+
| SUM(QTY) |
+----------+
|     1000 |
+----------+


12. Display all the Supplier names (with ‘la’ replaced by ‘ro’).
HINT: REPLACE.
SELECT * FROM S WHERE Sname LIKE "%LA%";
+------+-------+--------+--------+
| S#   | Sname | status | city   |
+------+-------+--------+--------+
| S3   | Blake |     30 | Paris  |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+


SELECT REPLACE(Sname,"la","ro") FROM S WHERE Sname LIKE "%LA%";
+--------------------------+
| REPLACE(Sname,"la","ro") |
+--------------------------+
| Broke                    |
| Crork                    |
+--------------------------+
