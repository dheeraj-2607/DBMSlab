USE Dheeraj;

CREATE TABLE Student(roll_no INT ,name VARCHAR(20) ,date_of_birth DATE );
CREATE TABLE Course(course_id INT ,name VARCHAR(20) ,duration_in_month INT );
CREATE TABLE Enrolment (roll_no INT ,name VARCHAR(20) ,course_id INT ,c_name VARCHAR(20) );


INSERT INTO Student (roll_no, name, date_of_birth)VALUES
(1, 'Amit Sharma', '2008-05-14'),
(2, 'Priya Nair', '2001-11-22'),
(3, 'Rohan Mehta', '2010-03-09'),
(4, 'Sneha Iyer', '2002-07-30'),
(5, 'Vikram Singh', '2001-12-18'),
(6, 'Ananya Gupta', '2006-09-25'),
(7, 'Karan Verma', '2002-01-05'),
(8, 'Meera Das', '2001-06-17'),
(9, 'Aditya Joshi', '2013-10-11'),
(10, 'Neha Kulkarni', '2002-04-02');

INSERT INTO Course (course_id, name, fee, duration_in_month)VALUES
    (201, 'B.Tech', 350000, 48),
    (202, 'M.Tech', 180000, 24),
    (203, 'B.Sc', 120000, 36),
    (204, 'M.Sc', 90000, 24),
    (205, 'B.Com', 100000, 36),
    (206, 'M.Com', 85000, 24),
    (207, 'BBA', 150000, 36),
    (208, 'MBA', 250000, 24),
    (209, 'BA', 90000, 36),
    (210, 'MA', 80000, 24);


INSERT INTO Enrolment (roll_no, name, course_id, c_name) VALUES
(1, 'Amit Sharma', 201, 'B.Tech'),
(3, 'Rohan Mehta', 201, 'B.Tech'),
(5, 'Vikram Singh', 201, 'B.Tech'),
(7, 'Karan Verma', 201, 'B.Tech'),
(2, 'Priya Nair', 202, 'M.Tech'),
(6, 'Ananya Gupta', 202, 'M.Tech'),
(10, 'Neha Kulkarni', 202, 'M.Tech'),
(3, 'Rohan Mehta', 203, 'B.Sc'),
(8, 'Meera Das', 203, 'B.Sc'),
(9, 'Aditya Joshi', 203, 'B.Sc'),
(2, 'Priya Nair', 204, 'M.Sc'),
(6, 'Ananya Gupta', 204, 'M.Sc'),
(5, 'Vikram Singh', 205, 'B.Com'),
(7, 'Karan Verma', 205, 'B.Com'),
(8, 'Meera Das', 206, 'M.Com'),
(1, 'Amit Sharma', 207, 'BBA'),
(4, 'Sneha Iyer', 207, 'BBA'),
(9, 'Aditya Joshi', 207, 'BBA'),
(4, 'Sneha Iyer', 208, 'MBA'),
(6, 'Ananya Gupta', 208, 'MBA'),
(8, 'Meera Das', 208, 'MBA'),
(10, 'Neha Kulkarni', 208, 'MBA'),
(2, 'Priya Nair', 209, 'BA'),
(9, 'Aditya Joshi', 209, 'BA'),
(4, 'Sneha Iyer', 210, 'MA'),
(10, 'Neha Kulkarni', 210, 'MA');


--a)
SELECT S.name FROM Student S LEFT JOIN Enrolment E ON S.roll_no = E.roll_no WHERE E.c_name = "B.Tech" AND (YEAR(CURDATE()) - YEAR(date_of_birth)) > 18;

--b)
SELECT * FROM Course WHERE fee > (SELECT fee FROM Course WHERE name = "B.Tech");

--c)
SELECT S.roll_no,S.name,S.date_of_birth FROM Student S LEFT JOIN Enrolment E ON S.roll_no = E.roll_no GROUP BY S.roll_no,S.name,S.date_of_birth HAVING COUNT(E.course_id)>2;

--d)
SELECT C.name,C.fee,C.duration_in_month,COUNT(E.c_name) FROM Course C LEFT JOIN Enrolment E ON C.course_id= E.course_id GROUP BY C.name,C.fee,C.duration_in_month ORDER BY COUNT(E.c_name) DESC LIMIT 1;
SELECT C.name,C.fee,C.duration_in_month,COUNT(E.c_name) FROM Course C LEFT JOIN Enrolment E ON C.course_id= E.course_id GROUP BY C.name,C.fee,C.duration_in_month ORDER BY COUNT(E.c_name) ASC LIMIT 1;

--e)
SELECT S.roll_no, S.name, S.date_of_birth
FROM Student S
JOIN Enrolment E ON S.roll_no = E.roll_no
GROUP BY S.roll_no, S.name, S.date_of_birth
HAVING COUNT(E.course_id) = (SELECT COUNT(*) FROM Course);
