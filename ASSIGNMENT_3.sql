--To solve below queries use “hr” database

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

1. Write a query to get unique department ID from employee
table.

SELECT * FROM employees;
SELECT DISTINCT DEPARTMENT_ID FROM employees;
+---------------+
| DEPARTMENT_ID |
+---------------+
|             0 |
|            10 |
|            20 |
|            30 |
|            40 |
|            50 |
|            60 |
|            70 |
|            80 |
|            90 |
|           100 |
|           110 |
+---------------+

2. Write a query to get all employee details from the employee
table order by first name, descending.

SELECT * FROM employees ORDER BY FIRST_NAME DESC;

3. Write a query to get the employee ID, names (first_name,
last_name), salary in ascending order of salary.

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY FROM employees ORDER BY SALARY;
+-------------+-------------+-------------+----------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME   | SALARY   |
+-------------+-------------+-------------+----------+
|         132 | TJ          | Olson       |  2100.00 |
|         128 | Steven      | Markle      |  2200.00 |
|         136 | Hazel       | Philtanker  |  2200.00 |
|         127 | James       | Landry      |  2400.00 |
|         135 | Ki          | Gee         |  2400.00 |
|         119 | Karen       | Colmenares  |  2500.00 |
|         131 | James       | Marlow      |  2500.00 |
|         140 | Joshua      | Patel       |  2500.00 |
|         144 | Peter       | Vargas      |  2500.00 |
|         182 | Martha      | Sullivan    |  2500.00 |
|         191 | Randall     | Perkins     |  2500.00 |
|         118 | Guy         | Himuro      |  2600.00 |
|         143 | Randall     | Matos       |  2600.00 |
|         198 | Donald      | OConnell    |  2600.00 |
|         199 | Douglas     | Grant       |  2600.00 |
|         126 | Irene       | Mikkilineni |  2700.00 |
|         139 | John        | Seo         |  2700.00 |
|         117 | Sigal       | Tobias      |  2800.00 |
|         130 | Mozhe       | Atkinson    |  2800.00 |
|         183 | Girard      | Geoni       |  2800.00 |
|         195 | Vance       | Jones       |  2800.00 |
|         116 | Shelli      | Baida       |  2900.00 |
|         134 | Michael     | Rogers      |  2900.00 |
|         190 | Timothy     | Gates       |  2900.00 |
|         187 | Anthony     | Cabrio      |  3000.00 |
|         197 | Kevin       | Feeney      |  3000.00 |
|         115 | Alexander   | Khoo        |  3100.00 |
|         142 | Curtis      | Davies      |  3100.00 |
|         181 | Jean        | Fleaur      |  3100.00 |
|         196 | Alana       | Walsh       |  3100.00 |
|         125 | Julia       | Nayer       |  3200.00 |
|         138 | Stephen     | Stiles      |  3200.00 |
|         180 | Winston     | Taylor      |  3200.00 |
|         194 | Samuel      | McCain      |  3200.00 |
|         129 | Laura       | Bissot      |  3300.00 |
|         133 | Jason       | Mallin      |  3300.00 |
|         186 | Julia       | Dellinger   |  3400.00 |
|         141 | Trenna      | Rajs        |  3500.00 |
|         137 | Renske      | Ladwig      |  3600.00 |
|         189 | Jennifer    | Dilly       |  3600.00 |
|         188 | Kelly       | Chung       |  3800.00 |
|         193 | Britney     | Everett     |  3900.00 |
|         192 | Sarah       | Bell        |  4000.00 |
|         185 | Alexis      | Bull        |  4100.00 |
|         107 | Diana       | Lorentz     |  4200.00 |
|         184 | Nandita     | Sarchand    |  4200.00 |
|         200 | Jennifer    | Whalen      |  4400.00 |
|         105 | David       | Austin      |  4800.00 |
|         106 | Valli       | Pataballa   |  4800.00 |
|         124 | Kevin       | Mourgos     |  5800.00 |
|         104 | Bruce       | Ernst       |  6000.00 |
|         202 | Pat         | Fay         |  6000.00 |
|         173 | Sundita     | Kumar       |  6100.00 |
|         167 | Amit        | Banda       |  6200.00 |
|         179 | Charles     | Johnson     |  6200.00 |
|         166 | Sundar      | Ande        |  6400.00 |
|         123 | Shanta      | Vollman     |  6500.00 |
|         203 | Susan       | Mavris      |  6500.00 |
|         165 | David       | Lee         |  6800.00 |
|         113 | Luis        | Popp        |  6900.00 |
|         155 | Oliver      | Tuvault     |  7000.00 |
|         161 | Sarath      | Sewall      |  7000.00 |
|         178 | Kimberely   | Grant       |  7000.00 |
|         164 | Mattea      | Marvins     |  7200.00 |
|         172 | Elizabeth   | Bates       |  7300.00 |
|         171 | William     | Smith       |  7400.00 |
|         154 | Nanette     | Cambrault   |  7500.00 |
|         160 | Louise      | Doran       |  7500.00 |
|         111 | Ismael      | Sciarra     |  7700.00 |
|         112 | Jose Manuel | Urman       |  7800.00 |
|         122 | Payam       | Kaufling    |  7900.00 |
|         120 | Matthew     | Weiss       |  8000.00 |
|         153 | Christopher | Olsen       |  8000.00 |
|         159 | Lindsey     | Smith       |  8000.00 |
|         110 | John        | Chen        |  8200.00 |
|         121 | Adam        | Fripp       |  8200.00 |
|         206 | William     | Gietz       |  8300.00 |
|         177 | Jack        | Livingston  |  8400.00 |
|         176 | Jonathon    | Taylor      |  8600.00 |
|         175 | Alyssa      | Hutton      |  8800.00 |
|         103 | Alexander   | Hunold      |  9000.00 |
|         109 | Daniel      | Faviet      |  9000.00 |
|         152 | Peter       | Hall        |  9000.00 |
|         158 | Allan       | McEwen      |  9000.00 |
|         151 | David       | Bernstein   |  9500.00 |
|         157 | Patrick     | Sully       |  9500.00 |
|         163 | Danielle    | Greene      |  9500.00 |
|         170 | Tayler      | Fox         |  9600.00 |
|         150 | Peter       | Tucker      | 10000.00 |
|         156 | Janette     | King        | 10000.00 |
|         169 | Harrison    | Bloom       | 10000.00 |
|         204 | Hermann     | Baer        | 10000.00 |
|         149 | Eleni       | Zlotkey     | 10500.00 |
|         162 | Clara       | Vishney     | 10500.00 |
|         114 | Den         | Raphaely    | 11000.00 |
|         148 | Gerald      | Cambrault   | 11000.00 |
|         174 | Ellen       | Abel        | 11000.00 |
|         168 | Lisa        | Ozer        | 11500.00 |
|         108 | Nancy       | Greenberg   | 12000.00 |
|         147 | Alberto     | Errazuriz   | 12000.00 |
|         205 | Shelley     | Higgins     | 12000.00 |
|         201 | Michael     | Hartstein   | 13000.00 |
|         146 | Karen       | Partners    | 13500.00 |
|         145 | John        | Russell     | 14000.00 |
|         101 | Neena       | Kochhar     | 17000.00 |
|         102 | Lex         | De Haan     | 17000.00 |
|         100 | Steven      | King        | 24000.00 |
+-------------+-------------+-------------+----------+

4. Display first name and join date of the employees who is
either IT Programmer or Sales Man.

SELECT FIRST_NAME,HIRE_DATE FROM employees WHERE JOB_ID IN ("IT_PROG","SA_MAN");
+------------+------------+
| FIRST_NAME | HIRE_DATE  |
+------------+------------+
| Alexander  | 1987-06-20 |
| Bruce      | 1987-06-21 |
| David      | 1987-06-22 |
| Valli      | 1987-06-23 |
| Diana      | 1987-06-24 |
| John       | 1987-08-01 |
| Karen      | 1987-08-02 |
| Alberto    | 1987-08-03 |
| Gerald     | 1987-08-04 |
| Eleni      | 1987-08-05 |
+------------+------------+

5. Display details of employee with ID 150 or 160.
SELECT * FROM employees WHERE EMPLOYEE_ID IN(150,160);
+-------------+------------+-----------+---------+--------------------+------------+--------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL   | PHONE_NUMBER       | HIRE_DATE  | JOB_ID | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+---------+--------------------+------------+--------+----------+----------------+------------+---------------+
|         150 | Peter      | Tucker    | PTUCKER | 011.44.1344.129268 | 1987-08-06 | SA_REP | 10000.00 |           0.30 |        145 |            80 |
|         160 | Louise     | Doran     | LDORAN  | 011.44.1345.629268 | 1987-08-16 | SA_REP |  7500.00 |           0.30 |        146 |            80 |
+-------------+------------+-----------+---------+--------------------+------------+--------+----------+----------------+------------+---------------+
2 rows in set (0.00 sec)

6. Display first name, salary, commission pct, and hire date for 
employees with salary less than 10000.

SELECT FIRST_NAME,SALARY,COMMISSION_PCT,HIRE_DATE FROM  employees WHERE SALARY<10000;
+-------------+---------+----------------+------------+
| FIRST_NAME  | SALARY  | COMMISSION_PCT | HIRE_DATE  |
+-------------+---------+----------------+------------+
| Alexander   | 9000.00 |           0.00 | 1987-06-20 |
| Bruce       | 6000.00 |           0.00 | 1987-06-21 |
| David       | 4800.00 |           0.00 | 1987-06-22 |
| Valli       | 4800.00 |           0.00 | 1987-06-23 |
| Diana       | 4200.00 |           0.00 | 1987-06-24 |
| Daniel      | 9000.00 |           0.00 | 1987-06-26 |
| John        | 8200.00 |           0.00 | 1987-06-27 |
| Ismael      | 7700.00 |           0.00 | 1987-06-28 |
| Jose Manuel | 7800.00 |           0.00 | 1987-06-29 |
| Luis        | 6900.00 |           0.00 | 1987-06-30 |
| Alexander   | 3100.00 |           0.00 | 1987-07-02 |
| Shelli      | 2900.00 |           0.00 | 1987-07-03 |
| Sigal       | 2800.00 |           0.00 | 1987-07-04 |
| Guy         | 2600.00 |           0.00 | 1987-07-05 |
| Karen       | 2500.00 |           0.00 | 1987-07-06 |
| Matthew     | 8000.00 |           0.00 | 1987-07-07 |
| Adam        | 8200.00 |           0.00 | 1987-07-08 |
| Payam       | 7900.00 |           0.00 | 1987-07-09 |
| Shanta      | 6500.00 |           0.00 | 1987-07-10 |
| Kevin       | 5800.00 |           0.00 | 1987-07-11 |
| Julia       | 3200.00 |           0.00 | 1987-07-12 |
| Irene       | 2700.00 |           0.00 | 1987-07-13 |
| James       | 2400.00 |           0.00 | 1987-07-14 |
| Steven      | 2200.00 |           0.00 | 1987-07-15 |
| Laura       | 3300.00 |           0.00 | 1987-07-16 |
| Mozhe       | 2800.00 |           0.00 | 1987-07-17 |
| James       | 2500.00 |           0.00 | 1987-07-18 |
| TJ          | 2100.00 |           0.00 | 1987-07-19 |
| Jason       | 3300.00 |           0.00 | 1987-07-20 |
| Michael     | 2900.00 |           0.00 | 1987-07-21 |
| Ki          | 2400.00 |           0.00 | 1987-07-22 |
| Hazel       | 2200.00 |           0.00 | 1987-07-23 |
| Renske      | 3600.00 |           0.00 | 1987-07-24 |
| Stephen     | 3200.00 |           0.00 | 1987-07-25 |
| John        | 2700.00 |           0.00 | 1987-07-26 |
| Joshua      | 2500.00 |           0.00 | 1987-07-27 |
| Trenna      | 3500.00 |           0.00 | 1987-07-28 |
| Curtis      | 3100.00 |           0.00 | 1987-07-29 |
| Randall     | 2600.00 |           0.00 | 1987-07-30 |
| Peter       | 2500.00 |           0.00 | 1987-07-31 |
| David       | 9500.00 |           0.25 | 1987-08-07 |
| Peter       | 9000.00 |           0.25 | 1987-08-08 |
| Christopher | 8000.00 |           0.20 | 1987-08-09 |
| Nanette     | 7500.00 |           0.20 | 1987-08-10 |
| Oliver      | 7000.00 |           0.15 | 1987-08-11 |
| Patrick     | 9500.00 |           0.35 | 1987-08-13 |
| Allan       | 9000.00 |           0.35 | 1987-08-14 |
| Lindsey     | 8000.00 |           0.30 | 1987-08-15 |
| Louise      | 7500.00 |           0.30 | 1987-08-16 |
| Sarath      | 7000.00 |           0.25 | 1987-08-17 |
| Danielle    | 9500.00 |           0.15 | 1987-08-19 |
| Mattea      | 7200.00 |           0.10 | 1987-08-20 |
| David       | 6800.00 |           0.10 | 1987-08-21 |
| Sundar      | 6400.00 |           0.10 | 1987-08-22 |
| Amit        | 6200.00 |           0.10 | 1987-08-23 |
| Tayler      | 9600.00 |           0.20 | 1987-08-26 |
| William     | 7400.00 |           0.15 | 1987-08-27 |
| Elizabeth   | 7300.00 |           0.15 | 1987-08-28 |
| Sundita     | 6100.00 |           0.10 | 1987-08-29 |
| Alyssa      | 8800.00 |           0.25 | 1987-08-31 |
| Jonathon    | 8600.00 |           0.20 | 1987-09-01 |
| Jack        | 8400.00 |           0.20 | 1987-09-02 |
| Kimberely   | 7000.00 |           0.15 | 1987-09-03 |
| Charles     | 6200.00 |           0.10 | 1987-09-04 |
| Winston     | 3200.00 |           0.00 | 1987-09-05 |
| Jean        | 3100.00 |           0.00 | 1987-09-06 |
| Martha      | 2500.00 |           0.00 | 1987-09-07 |
| Girard      | 2800.00 |           0.00 | 1987-09-08 |
| Nandita     | 4200.00 |           0.00 | 1987-09-09 |
| Alexis      | 4100.00 |           0.00 | 1987-09-10 |
| Julia       | 3400.00 |           0.00 | 1987-09-11 |
| Anthony     | 3000.00 |           0.00 | 1987-09-12 |
| Kelly       | 3800.00 |           0.00 | 1987-09-13 |
| Jennifer    | 3600.00 |           0.00 | 1987-09-14 |
| Timothy     | 2900.00 |           0.00 | 1987-09-15 |
| Randall     | 2500.00 |           0.00 | 1987-09-16 |
| Sarah       | 4000.00 |           0.00 | 1987-09-17 |
| Britney     | 3900.00 |           0.00 | 1987-09-18 |
| Samuel      | 3200.00 |           0.00 | 1987-09-19 |
| Vance       | 2800.00 |           0.00 | 1987-09-20 |
| Alana       | 3100.00 |           0.00 | 1987-09-21 |
| Kevin       | 3000.00 |           0.00 | 1987-09-22 |
| Donald      | 2600.00 |           0.00 | 1987-09-23 |
| Douglas     | 2600.00 |           0.00 | 1987-09-24 |
| Jennifer    | 4400.00 |           0.00 | 1987-09-25 |
| Pat         | 6000.00 |           0.00 | 1987-09-27 |
| Susan       | 6500.00 |           0.00 | 1987-09-28 |
| William     | 8300.00 |           0.00 | 1987-10-01 |
+-------------+---------+----------------+------------+

7. Display employees where the first name or last name starts
with S.
SELECT * FROM employees WHERE FIRST_NAME LIKE "S%" OR LAST_NAME LIKE "S%";
+-------------+------------+-----------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL    | PHONE_NUMBER       | HIRE_DATE  | JOB_ID     | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven     | King      | SKING    | 515.123.4567       | 1987-06-17 | AD_PRES    | 24000.00 |           0.00 |          0 |            90 |
|         111 | Ismael     | Sciarra   | ISCIARRA | 515.124.4369       | 1987-06-28 | FI_ACCOUNT |  7700.00 |           0.00 |        108 |           100 |
|         116 | Shelli     | Baida     | SBAIDA   | 515.127.4563       | 1987-07-03 | PU_CLERK   |  2900.00 |           0.00 |        114 |            30 |
|         117 | Sigal      | Tobias    | STOBIAS  | 515.127.4564       | 1987-07-04 | PU_CLERK   |  2800.00 |           0.00 |        114 |            30 |
|         123 | Shanta     | Vollman   | SVOLLMAN | 650.123.4234       | 1987-07-10 | ST_MAN     |  6500.00 |           0.00 |        100 |            50 |
|         128 | Steven     | Markle    | SMARKLE  | 650.124.1434       | 1987-07-15 | ST_CLERK   |  2200.00 |           0.00 |        120 |            50 |
|         138 | Stephen    | Stiles    | SSTILES  | 650.121.2034       | 1987-07-25 | ST_CLERK   |  3200.00 |           0.00 |        123 |            50 |
|         139 | John       | Seo       | JSEO     | 650.121.2019       | 1987-07-26 | ST_CLERK   |  2700.00 |           0.00 |        123 |            50 |
|         157 | Patrick    | Sully     | PSULLY   | 011.44.1345.929268 | 1987-08-13 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         159 | Lindsey    | Smith     | LSMITH   | 011.44.1345.729268 | 1987-08-15 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         161 | Sarath     | Sewall    | SSEWALL  | 011.44.1345.529268 | 1987-08-17 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         166 | Sundar     | Ande      | SANDE    | 011.44.1346.629268 | 1987-08-22 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         171 | William    | Smith     | WSMITH   | 011.44.1343.629268 | 1987-08-27 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         173 | Sundita    | Kumar     | SKUMAR   | 011.44.1343.329268 | 1987-08-29 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         182 | Martha     | Sullivan  | MSULLIVA | 650.507.9878       | 1987-09-07 | SH_CLERK   |  2500.00 |           0.00 |        120 |            50 |
|         184 | Nandita    | Sarchand  | NSARCHAN | 650.509.1876       | 1987-09-09 | SH_CLERK   |  4200.00 |           0.00 |        121 |            50 |
|         192 | Sarah      | Bell      | SBELL    | 650.501.1876       | 1987-09-17 | SH_CLERK   |  4000.00 |           0.00 |        123 |            50 |
|         194 | Samuel     | McCain    | SMCCAIN  | 650.501.3876       | 1987-09-19 | SH_CLERK   |  3200.00 |           0.00 |        123 |            50 |
|         203 | Susan      | Mavris    | SMAVRIS  | 515.123.7777       | 1987-09-28 | HR_REP     |  6500.00 |           0.00 |        101 |            40 |
|         205 | Shelley    | Higgins   | SHIGGINS | 515.123.8080       | 1987-09-30 | AC_MGR     | 12000.00 |           0.00 |        101 |           110 |
+-------------+------------+-----------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+

8. Display details of jobs in the descending order of the title.

SELECT * FROM jobs ORDER BY JOB_TITLE DESC;
+------------+---------------------------------+------------+------------+
| JOB_ID     | JOB_TITLE                       | MIN_SALARY | MAX_SALARY |
+------------+---------------------------------+------------+------------+
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
| ST_CLERK   | Stock Clerk                     |       2000 |       5000 |
| SH_CLERK   | Shipping Clerk                  |       2500 |       5500 |
| SA_REP     | Sales Representative            |       6000 |      12000 |
| SA_MAN     | Sales Manager                   |      10000 |      20000 |
| PU_MAN     | Purchasing Manager              |       8000 |      15000 |
| PU_CLERK   | Purchasing Clerk                |       2500 |       5500 |
| PR_REP     | Public Relations Representative |       4500 |      10500 |
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| AD_PRES    | President                       |      20000 |      40000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| HR_REP     | Human Resources Representative  |       4000 |       9000 |
| FI_MGR     | Finance Manager                 |       8200 |      16000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| FI_ACCOUNT | Accountant                      |       4200 |       9000 |
+------------+---------------------------------+------------+------------+

9. Display details of the employees where commission percentage
is null and salary in the range 5000 to 10000 and department is30.

SELECT * FROM employees WHERE COMMISSION_PCT=0.0 AND DEPARTMENT_ID=30 AND SALARY BETWEEN 5000 AND 10000;
Empty set (0.00 sec)

10. Display employees first_name,email who are working in
“Executive” department.

SELECT * FROM departments;
SELECT FIRST_NAME,EMAIL FROM employees WHERE DEPARTMENT_ID=90;
+------------+----------+
| FIRST_NAME | EMAIL    |
+------------+----------+
| Steven     | SKING    |
| Neena      | NKOCHHAR |
| Lex        | LDEHAAN  |
+------------+----------+

11. Display unique contry_id from locations table.
SELECT * FROM locations;
SELECT DISTINCT COUNTRY_ID FROM locations;
+------------+
| COUNTRY_ID |
+------------+
|            |
| AU         |
| BR         |
| CA         |
| CH         |
| CN         |
| DE         |
| IN         |
| IT         |
| JP         |
| NL         |
| Ox         |
| SG         |
| UK         |
| US         |
+------------+

12. Display all employees whose have job_id IT_PROG and
FI_ACCOUNT.

SELECT * FROM employees WHERE JOB_ID IN ("IT_PROG","FI_ACCOUNT");
+-------------+-------------+-----------+----------+--------------+------------+------------+---------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME | EMAIL    | PHONE_NUMBER | HIRE_DATE  | JOB_ID     | SALARY  | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+-------------+-----------+----------+--------------+------------+------------+---------+----------------+------------+---------------+
|         109 | Daniel      | Faviet    | DFAVIET  | 515.124.4169 | 1987-06-26 | FI_ACCOUNT | 9000.00 |           0.00 |        108 |           100 |
|         110 | John        | Chen      | JCHEN    | 515.124.4269 | 1987-06-27 | FI_ACCOUNT | 8200.00 |           0.00 |        108 |           100 |
|         111 | Ismael      | Sciarra   | ISCIARRA | 515.124.4369 | 1987-06-28 | FI_ACCOUNT | 7700.00 |           0.00 |        108 |           100 |
|         112 | Jose Manuel | Urman     | JMURMAN  | 515.124.4469 | 1987-06-29 | FI_ACCOUNT | 7800.00 |           0.00 |        108 |           100 |
|         113 | Luis        | Popp      | LPOPP    | 515.124.4567 | 1987-06-30 | FI_ACCOUNT | 6900.00 |           0.00 |        108 |           100 |
|         103 | Alexander   | Hunold    | AHUNOLD  | 590.423.4567 | 1987-06-20 | IT_PROG    | 9000.00 |           0.00 |        102 |            60 |
|         104 | Bruce       | Ernst     | BERNST   | 590.423.4568 | 1987-06-21 | IT_PROG    | 6000.00 |           0.00 |        103 |            60 |
|         105 | David       | Austin    | DAUSTIN  | 590.423.4569 | 1987-06-22 | IT_PROG    | 4800.00 |           0.00 |        103 |            60 |
|         106 | Valli       | Pataballa | VPATABAL | 590.423.4560 | 1987-06-23 | IT_PROG    | 4800.00 |           0.00 |        103 |            60 |
|         107 | Diana       | Lorentz   | DLORENTZ | 590.423.5567 | 1987-06-24 | IT_PROG    | 4200.00 |           0.00 |        103 |            60 |
+-------------+-------------+-----------+----------+--------------+------------+------------+---------+----------------+------------+---------------+
10 rows in set (0.00 sec)

13. Display all countries in ascending order.
mysql> SELECT * FROM countries ORDER BY COUNTRY_NAME;
+------------+--------------------------+-----------+
| COUNTRY_ID | COUNTRY_NAME             | REGION_ID |
+------------+--------------------------+-----------+
| AR         | Argentina                |         2 |
| AU         | Australia                |         3 |
| BE         | Belgium                  |         1 |
| BR         | Brazil                   |         2 |
| CA         | Canada                   |         2 |
| CN         | China                    |         3 |
| DK         | Denmark                  |         1 |
| EG         | Egypt                    |         4 |
| FR         | France                   |         1 |
| DE         | Germany                  |         1 |
| HK         | HongKong                 |         3 |
| IN         | India                    |         3 |
| IL         | Israel                   |         4 |
| IT         | Italy                    |         1 |
| JP         | Japan                    |         3 |
| KW         | Kuwait                   |         4 |
| MX         | Mexico                   |         2 |
| NL         | Netherlands              |         1 |
| NG         | Nigeria                  |         4 |
| SG         | Singapore                |         3 |
| CH         | Switzerland              |         1 |
| UK         | United Kingdom           |         1 |
| US         | United States of America |         2 |
| ZM         | Zambia                   |         4 |
| ZW         | Zimbabwe                 |         4 |
+------------+--------------------------+-----------+
25 rows in set (0.00 sec)


