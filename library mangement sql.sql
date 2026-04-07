create database library;
use library;
create table books (
    book_id int primary key,
    title varchar(100),
    author varchar(100),
    category varchar(50)
);

create table students (
    student_id int primary key,
    student_name varchar(100),
    department varchar(50),
    join_date date
);

create table issuedbooks (
    issue_id int primary key,
    book_id int,
    student_id int,
    issuedate date,
    returndate date,
    foreign key (book_id) references books(book_id),
    foreign key (student_id) references students(student_id)
);

insert into books values
(1, 'database systems', 'navathe', 'science'),
(2, 'python programming', 'guido', 'science'),
(3, 'world history', 'smith', 'history'),
(4, 'english literature', 'john', 'fiction'),
(5, 'data structures', 'mark', 'science');

insert into students values
(101, 'arun', 'cse', '2021-06-10'),
(102, 'bala', 'it', '2020-07-12'),
(103, 'charan', 'ece', '2019-08-15'),
(104, 'divya', 'cse', '2018-09-20');

insert into issuedbooks values
(1, 1, 101, '2026-03-01', null),
(2, 2, 102, '2026-03-15', '2026-03-20'),
(3, 3, 103, '2026-02-10', null),
(4, 4, 101, '2026-03-25', null),
(5, 5, 104, '2025-12-01', '2025-12-10');

select students.student_id, students.student_name, books.title, issuedbooks.issuedate
from students
join issuedbooks on students.student_id = issuedbooks.student_id
join books on books.book_id = issuedbooks.book_id
where issuedbooks.returndate is null
and issuedbooks.issuedate < current_date - interval 14 day;

select books.category, count(*) as total_borrowed
from books
join issuedbooks on books.book_id = issuedbooks.book_id
group by books.category
order by total_borrowed desc;

delete students
from students
left join issuedbooks on students.student_id = issuedbooks.student_id
where issuedbooks.issuedate < current_date - interval 3 year;