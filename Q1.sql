USE Dheeraj;


CREATE TABLE College (college_code INT ,college_name VARCHAR(20) ,address VARCHAR(30));
CREATE TABLE Faculty (college_code INT ,faculty_code INT ,faculty_name VARCHAR(10),qualification VARCHAR(20) ,experience INT ,department VARCHAR(
20),address VARCHAR(20));

INSERT INTO College (college_code, college_name, address)
	VALUES(101, 'NIT Calicut', 'Calicut, Kerala'),
	(102, 'IIT Madras', 'Chennai, Tamil Nadu'),
	(103, 'IISc Bangalore', 'Bangalore, Karnataka'),
	(104, 'IIM Ahmedabad', 'Ahmedabad, Gujarat'),
	(105, 'JNU', 'New Delhi');

INSERT INTO Faculty (college_code, faculty_code, faculty_name, qualification, experience, department, address)
    VALUES (101, 201, 'Arun', 'PhD CSE', 12, 'Computer Sci', 'Calicut'),
    (101, 202, 'Meera', 'M.Tech ECE', 8, 'Electronics', 'Kochi'),
    (102, 203, 'Ravi', 'PhD Mech', 15, 'Mechanical', 'Chennai'),
    (103, 204, 'Sneha', 'PhD Physics', 10, 'Physics', 'Bangalore'),
    (104, 205, 'Kiran', 'MBA', 6, 'Management', 'Ahmedabad'),
    (101, 206, 'Abijith' ,'MSc' , 16,'Biotechnology','Trivandrum'),
    (101, 301, 'Rajesh', 'PhD', 15, 'Computer Sci', 'Calicut'),
    (101, 303, 'Anil', 'PhD', 22, 'Computer Sci', 'Thrissur');

--a)
SELECT F.faculty_name,F.experience,C.college_name FROM Faculty F LEFT JOIN College C ON C.college_code=F.college_code WHERE F.experience>10 AND C.college_name="IIT Madras";


--b)
SELECT F.faculty_name,F.experience,C.college_name FROM Faculty F LEFT JOIN College C ON C.college_code=F.college_code WHERE F.experience>10 AND C.college_name ="NIT Calicut" AND F.qualification != "M.Tech ECE";

--c)
SELECT F.faculty_name,F.department,F.experience FROM Faculty F LEFT JOIN College C ON C.college_code=F.college_code WHERE C.college_name = "NIT Calicut" ORDER BY F.department ASC,F.experience ASC;

--d)
SELECT C.college_name,COUNT(F.faculty_name) AS n FROM Faculty F LEFT JOIN College C ON C.college_code=F.college_code GROUP BY C.college_name HAVING COUNT(F.faculty_name)>1 ;

--e)