digital library audit system

project overview

this project is a relational database system designed to manage a digital library for a community college. it helps track book borrowing, identify overdue books, analyze popular categories, and manage inactive student records.
 objectives

* store and manage books, students, and issued records
* identify overdue books (not returned within 14 days)
* analyze most popular book categories
* remove or manage inactive student accounts

 database structure

1. books table

stores details of all books available in the library

* book_id (primary key)
* title
* author
* category

 2. students table

stores student information

* student_id (primary key)
* student_name
* department
* join_date

3. issuedbooks table

stores borrowing details

* issue_id (primary key)
* book_id (foreign key)
* student_id (foreign key)
* issuedate
* returndate
 features implemented

 1. overdue books detection

identifies students who have not returned books within 14 days

logic used:

* returndate is null
* issuedate is older than 14 days

```sql
issuedate < current_date - interval 14 day

 2. popularity analysis

finds most borrowed book categories using group by

```sql
select category, count(*)
from books
join issuedbooks
group by category;
```

---

 ✅ 3. inactive student cleanup

removes students who have not borrowed books for more than 3 years

```sql
issuedate < current_date - interval 3 year
```

---

 technologies used

* mysql (database)
* sql (ddl, dml, joins, aggregate functions)

---

sample data

the database includes sample records for:

* 5 books
* 4 students
* 5 issued book transactions

---

 how to run the project

1. open mysql command line or workbench
2. create database:

```sql
create database library;
use library;
```

3. run all table creation queries
4. insert sample data
5. execute queries for:

   * overdue books
   * popularity analysis
   * inactive students cleanup

 key concepts used

* joins (inner join, left join)
* aggregate functions (count)
* group by
* date functions
* interval keyword
* foreign keys

 learning outcome

* learned how to design relational databases
* implemented real-world business logic using sql
* understood date calculations using interval
* performed data analysis using sql queries



📎 conclusion

this project demonstrates how sql can be used to manage and analyze a digital library system efficiently. it helps in decision-making such as identifying overdue books and understanding user reading trends.


