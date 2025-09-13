USE Dheeraj;
CREATE TABLE Books (accession_no INT ,title VARCHAR(20) ,publisher VARCHAR(20),year INT,date_of_purchase DATE ,status VARCHAR(25));
CREATE TABLE Member (member_id INT ,name VARCHAR(20) ,number_of_Book_Issued INT ,max_limit INT);
CREATE TABLE Book_Issue (accession_no INT ,member_id INT ,date_of_issue DATE);


INSERT INTO Books (accession_no, title, publisher, year, date_of_purchase, status) VALUES
        (1001, 'Database Mgmt', 'McGraw Hill', 2018, '2021-06-15', 'available'),
        (1002, 'Operating Sys', 'Pearson', 2017, '2021-07-20', 'issued'),
        (1003, 'Computer Net', 'Wiley', 2019, '2021-08-05', 'available'),
        (1004, 'Data Science', 'O''Reilly', 2020, '2022-01-12', 'reference'),
        (1005, 'AI Basics', 'Springer', 2021, '2022-03-25', 'cannot be issued'),
        (1006, 'C Programming', 'PHI Learning', 2016, '2020-09-14', 'cannot be issued'),
        (1007, 'Java Complete', 'Tata McGraw', 2019, '2021-11-10', 'issued'),
        (1008, 'Machine Learn', 'Packt', 2020, '2022-06-01', 'available'),
        (1009, 'Web Dev Guide', 'Oreilly', 2021, '2022-09-17', 'cannot be issued'),
        (1010, 'Python Crash', 'No Starch', 2020, '2022-10-21', 'reference');

INSERT INTO Member (member_id, name, number_of_Book_Issued, max_limit) VALUES
        (1, 'Amit Sharma', 2, 5),
        (2, 'Priya Nair', 1, 4),
        (3, 'Rohan Mehta', 3, 5),
        (4, 'Sneha Iyer', 0, 4),
        (5, 'Vikram Singh', 5, 5),
        (6, 'Ananya Gupta', 2, 5),
        (7, 'Karan Verma', 4, 5),
        (8, 'Meera Das', 1, 3),
        (9, 'Aditya Joshi', 0, 4),
        (10, 'Neha Kulkarni', 3, 5);

INSERT INTO Book_Issue (accession_no, member_id, date_of_issue) VALUES
        (1001, 1, '2025-08-05'),  
        (1002, 2, '2025-08-10'),  
        (1007, 3, '2025-08-14'),  
        (1006, 5, '2025-08-20'),
        (1006, 6, '2025-08-20'),  
        (1009, 7, '2025-08-25'); 


--a)
SELECT B.title FROM Books B LEFT JOIN Book_Issue I ON B.accession_no = I.accession_no WHERE TIMESTAMPDIFF(DAY, I.date_of_issue, CURDATE()) > 15;

--b)
SELECT name FROM Member WHERE number_of_Book_Issued = max_limit;

--c)
CREATE VIEW bcount AS
SELECT B.accession_no,B.title,B.publisher,B.year,B.date_of_purchase,COUNT(I.accession_no) AS book_count
        FROM Books B
        LEFT JOIN Book_Issue I ON B.accession_no=I.accession_no
        GROUP BY B.accession_no,B.title,B.publisher,B.year,B.date_of_purchase;

SELECT title, book_count
    FROM bcount
    WHERE book_count = (SELECT MAX(book_count) FROM bcount);
SELECT title, book_count
    FROM bcount
    WHERE book_count = (SELECT MIN(book_count) FROM bcount);


--d)
CREATE VIEW Bcount AS
SELECT accession_no, COUNT(DISTINCT member_id) AS member_count
FROM Book NATURAL JOIN Book_Issue
GROUP BY accession_no;

CREATE VIEW Total_Member AS
SELECT COUNT(*) AS total_members
FROM Member;

SELECT DISTINCT accession_no, title, publisher, date_of_purchase, status
FROM Book NATURAL JOIN Bcount, Total_Member
WHERE member_count = total_members;

SELECT DISTINCT accession_no, title, publisher, date_of_purchase, status
FROM Book
WHERE accession_no NOT IN (SELECT accession_no FROM Book_Issue);

