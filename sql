MariaDB [(none)]> create database school;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> use school;
Database changed
MariaDB [school]> create table student
    -> (
    -> name varchar(55),age int
    -> );
Query OK, 0 rows affected (0.023 sec)

MariaDB [school]>  show tables;
+------------------+
| Tables_in_school |
+------------------+
| student          |
+------------------+
1 row in set (0.000 sec)

MariaDB [school]> drop table student;
Query OK, 0 rows affected (0.007 sec)

MariaDB [school]> create table student(Stud_id int ,Stud_name varchar(55),Stud_class varchar (55));
Query OK, 0 rows affected (0.009 sec)

MariaDB [school]> insert into student(Stud_id,Stud_name,Stud_class)
    -> values(1,'prabal',7),(2,'nipun',8);
Query OK, 2 rows affected (0.003 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [school]>  select * from student;
+---------+-----------+------------+
| Stud_id | Stud_name | Stud_class |
+---------+-----------+------------+
|       1 | prabal    | 7          |
|       2 | nipun     | 8          |
+---------+-----------+------------+
2 rows in set (0.000 sec)

MariaDB [school]> alter table student ADD age int;
Query OK, 0 rows affected (0.004 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [school]> desc student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Stud_id    | int(11)     | YES  |     | NULL    |       |
| Stud_name  | varchar(55) | YES  |     | NULL    |       |
| Stud_class | varchar(55) | YES  |     | NULL    |       |
| age        | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.001 sec)


CRUD Operations---------------------------------------------------------

MariaDB [school]> create table students( id int not null auto_increment,fname varchar(55),lname varchar(55), age int , primary key(id) );
Query OK, 0 rows affected (0.011 sec)

MariaDB [school]>  desc students;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| fname | varchar(55) | YES  |     | NULL    |                |
| lname | varchar(55) | YES  |     | NULL    |                |
| age   | int(11)     | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
4 rows in set (0.001 sec)

MariaDB [school]> insert into students(fname,lname,age)
    -> values('vikram','sethi',42),('advait','sethi',41),('sethi','prakash',42),('prakash','yadav',53 );
Query OK, 4 rows affected (0.003 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [school]> select * from students;
+----+---------+---------+------+
| id | fname   | lname   | age  |
+----+---------+---------+------+
|  1 | vikram  | sethi   |   42 |
|  2 | advait  | sethi   |   41 |
|  3 | sethi   | prakash |   42 |
|  4 | prakash | yadav   |   53 |
+----+---------+---------+------+
4 rows in set (0.000 sec)

MariaDB [school]> select * from student where age=42; 
Empty set (0.000 sec)

MariaDB [school]> select * from students  where age=42;
+----+--------+---------+------+
| id | fname  | lname   | age  |
+----+--------+---------+------+
|  1 | vikram | sethi   |   42 |
|  3 | sethi  | prakash |   42 |
+----+--------+---------+------+
2 rows in set (0.000 sec)

MariaDB [school]> update students set age=61 where fname='advait';
Query OK, 1 row affected (0.004 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [school]> select * from students;
+----+---------+---------+------+
| id | fname   | lname   | age  |
+----+---------+---------+------+
|  1 | vikram  | sethi   |   42 |
|  2 | advait  | sethi   |   61 |
|  3 | sethi   | prakash |   42 |
|  4 | prakash | yadav   |   53 |
+----+---------+---------+------+
4 rows in set (0.000 sec)

MariaDB [school]> select * from students where fname='sethi' ;
+----+-------+---------+------+
| id | fname | lname   | age  |
+----+-------+---------+------+
|  3 | sethi | prakash |   42 |
+----+-------+---------+------+
1 row in set (0.000 sec)

MariaDB [school]> delete from students where fname='sethi' ;
Query OK, 1 row affected (0.003 sec)

MariaDB [school]> select * from students;
+----+---------+-------+------+
| id | fname   | lname | age  |
+----+---------+-------+------+
|  1 | vikram  | sethi |   42 |
|  2 | advait  | sethi |   61 |
|  4 | prakash | yadav |   53 |
+----+---------+-------+------+
3 rows in set (0.000 sec)

MariaDB [school]>  

JOINS--------------------------------------------------------------------

MariaDB [school]>   create table grade(grade_id int not null auto_increment primary key,subject_1 int,subject_2 int,id int, foreign key(id) references students(id));
Query OK, 0 rows affected (0.020 sec)
MariaDB [school]> desc grade;
+-----------+---------+------+-----+---------+----------------+
| Field     | Type    | Null | Key | Default | Extra          |
+-----------+---------+------+-----+---------+----------------+
| grade_id  | int(11) | NO   | PRI | NULL    | auto_increment |
| subject_1 | int(11) | YES  |     | NULL    |                |
| subject_2 | int(11) | YES  |     | NULL    |                |
| id        | int(11) | YES  | MUL | NULL    |                |
+-----------+---------+------+-----+---------+----------------+
4 rows in set (0.001 sec)

MariaDB [school]> insert into grade(subject_1,subject_2)values(
    -> 30,40),(34,47);
Query OK, 2 rows affected (0.003 sec)
Records: 2  Duplicates: 0  Warnings: 0
MariaDB [school]> select * from grade;
+----------+-----------+-----------+------+
| grade_id | subject_1 | subject_2 | id   |
+----------+-----------+-----------+------+
|        1 |        30 |        40 | NULL |
|        2 |        34 |        47 | NULL |
+----------+-----------+-----------+------+
2 rows in set (0.000 sec)

MariaDB [school]> delete from students where fname='prakash' ;
Query OK, 1 row affected (0.003 sec)

MariaDB [school]> select * from students  join grade on students.id=grade.grade_id;
+----+--------+-------+------+----------+-----------+-----------+------+
| id | fname  | lname | age  | grade_id | subject_1 | subject_2 | id   |
+----+--------+-------+------+----------+-----------+-----------+------+
|  1 | vikram | sethi |   42 |        1 |        30 |        40 | NULL |
|  2 | advait | sethi |   61 |        2 |        34 |        47 | NULL |
+----+--------+-------+------+----------+-----------+-----------+------+
2 rows in set (0.000 sec)



