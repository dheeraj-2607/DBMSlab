USE Dheeraj;

CREATE TABLE Book (accession_no INT ,title VARCHAR(20) ,publisher VARCHAR(20) ,author VARCHAR(20) ,date_of_purchase DATE ,date_of_publishing DATE ,status VARCHAR(20));

INSERT INTO Book VALUES (1001, 'DBMS Concepts', 'Pearson', 'Korth', '2021-06-15', '2019-01-10', 'issued');
INSERT INTO Book VALUES (1002, 'DBMS Concepts', 'Pearson', 'Korth', '2021-06-20', '2019-01-10', 'present in Library');
INSERT INTO Book VALUES (1003, 'DBMS Concepts', 'Pearson', 'Korth', '2021-07-01', '2019-01-10', 'reference');
INSERT INTO Book VALUES (2001, 'Operating Sys', 'McGrawHill', 'Silberschatz', '2022-01-20', '2020-05-12', 'issued');
INSERT INTO Book VALUES (2002, 'Operating Sys', 'McGrawHill', 'Silberschatz', '2022-01-25', '2020-05-12', 'present in Library');
INSERT INTO Book VALUES (2003, 'Operating Sys', 'McGrawHill', 'Silberschatz', '2022-02-02', '2020-05-12', 'reference');
INSERT INTO Book VALUES (3001, 'Computer Net', 'PrenticeHall', 'Tanenbaum', '2020-08-30', '2018-03-15', 'present in Library');
INSERT INTO Book VALUES (3002, 'Computer Net', 'PrenticeHall', 'Tanenbaum', '2021-02-15', '2018-03-15', 'cannot be issue');
INSERT INTO Book VALUES (3003, 'Computer Net', 'PrenticeHall', 'Tanenbaum', '2021-03-01', '2018-03-15', 'issued');
INSERT INTO Book VALUES (4001, 'C Programming', 'BPB', 'K&R', '2019-09-05', '2015-11-20', 'reference');
INSERT INTO Book VALUES (4002, 'C Programming', 'BPB', 'K&R', '2020-01-18', '2015-11-20', 'present in Library');
INSERT INTO Book VALUES (4003, 'C Programming', 'BPB', 'K&R', '2020-02-12', '2015-11-20', 'issued');
INSERT INTO Book VALUES (5001, 'AI Basics', 'Springer', 'Stuart Russell', '2023-12-01', '2022-06-25', 'issued');
INSERT INTO Book VALUES (5002, 'AI Basics', 'Springer', 'Stuart Russell', '2023-12-10', '2022-06-25', 'present in Library');
INSERT INTO Book VALUES (6001, 'Data Science', 'OReilly', 'Wes McKinney', '2023-03-11', '2021-07-01', 'present in Library');
INSERT INTO Book VALUES (6002, 'Data Science', 'OReilly', 'Wes McKinney', '2023-03-20', '2021-07-01', 'issued');
INSERT INTO Book VALUES (6003, 'Data Science', 'OReilly', 'Wes McKinney', '2023-04-01', '2021-07-01', 'cannot be issue');
INSERT INTO Book VALUES (7001, 'Java Prog', 'Pearson', 'Herbert Schildt', '2021-05-05', '2019-09-10', 'issued');
INSERT INTO Book VALUES (7002, 'Java Prog', 'Pearson', 'Herbert Schildt', '2021-05-10', '2019-09-10', 'present in Library');
INSERT INTO Book VALUES (8001, 'Algorithms', 'MIT Press', 'CLRS', '2022-08-15', '2020-04-01', 'reference');
INSERT INTO Book VALUES (8002, 'Algorithms', 'MIT Press', 'CLRS', '2022-08-20', '2020-04-01', 'issued');
INSERT INTO Book VALUES (8003, 'Algorithms', 'MIT Press', 'CLRS', '2022-08-25', '2020-04-01', 'present in Library');
INSERT INTO Book VALUES (9001, 'Physics Fund.', 'Oxford', 'Halliday', '2018-07-12', '2015-01-10', 'present in Library');
INSERT INTO Book VALUES (9002, 'Physics Fund.', 'Oxford', 'Halliday', '2018-07-20', '2015-01-10', 'issued');
INSERT INTO Book VALUES (9003, 'Physics Fund.', 'Oxford', 'Halliday', '2018-07-25', '2015-01-10', 'reference');
INSERT INTO Book VALUES (10001, 'Hamlet', 'Penguin', 'Shakespeare', '2017-06-11', '2005-03-15', 'present in Library');
INSERT INTO Book VALUES (10002, 'Hamlet', 'Penguin', 'Shakespeare', '2017-06-18', '2005-03-15', 'issued');
INSERT INTO Book VALUES (10003, 'Hamlet', 'Penguin', 'Shakespeare', '2017-06-22', '2005-03-15', 'reference');
INSERT INTO Book VALUES (10003, 'Hamlet', 'Penguin', 'Shakespeare', '2025-06-22', '2025-09-15', 'reference');


--a)
SELECT title,COUNT(title) AS copies 
    FROM Book GROUP BY title;

--b)
SELECT title,COUNT(title) AS copies 
    FROM Book WHERE status = "reference" 
    GROUP BY title;

--c)
SELECT title,COUNT(title) AS copies 
    FROM Book 
    WHERE status = "issued" 
    GROUP BY title;
SELECT title,COUNT(title) AS copies 
    FROM Book 
    WHERE status = "present in Library" OR status = "reference" OR status = "cannot be issue" 
    GROUP BY title;
SELECT title,COUNT(title) AS copies 
    FROM Book 
    WHERE status = "reference" 
    GROUP BY title;



--d)
SELECT * 
    FROM Book 
    WHERE status = "cannot be issue" 
    ORDER BY publisher ASC;


--e)
SELECT DISTINCT * 
    FROM Book  
    WHERE TIMESTAMPDIFF(MONTH, date_of_purchase, CURDATE()) < 6;



--f)
SELECT
    title,
    COUNT(accession_no) AS total_copies
FROM
    Book
WHERE
    date_of_purchase <= DATE_ADD(date_of_publishing, INTERVAL 1 YEAR)
GROUP BY
    title
HAVING
    COUNT(accession_no) > 10;