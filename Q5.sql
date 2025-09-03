USE Dheeraj;

CREATE TABLE Branch(branch_id INT ,branch_name VARCHAR(30) ,branch_city VARCHAR(20) );

CREATE TABLE Customer(customer_id INT ,customer_name VARCHAR(30) ,customer_city VARCHAR(20) );

CREATE TABLE Savings(customer_id INT ,branch_id INT ,saving_accno INT,balance INT );

CREATE TABLE Loan(customer_id INT ,branch_id INT ,loan_accno INT,balance INT );

INSERT INTO Branch (branch_id, branch_name, branch_city) VALUES
(1, 'Connaught Place Branch', 'Delhi'),
(2, 'MG Road Branch', 'Bangalore'),
(3, 'Banjara Hills Branch', 'Hyderabad'),
(4, 'Park Street Branch', 'Kolkata'),
(5, 'Andheri West Branch', 'Mumbai'),
(6, 'Anna Salai Branch', 'Chennai'),
(7, 'Hazratganj Branch', 'Lucknow'),
(8, 'Sector 17 Branch', 'Chandigarh');

INSERT INTO Customer (customer_id, customer_name, customer_city) VALUES
(101, 'Amit Sharma', 'Delhi'),
(102, 'Priya Nair', 'Bangalore'),
(103, 'Rohan Reddy', 'Hyderabad'),
(104, 'Sneha Mukherjee', 'Kolkata'),
(105, 'Karan Mehta', 'Mumbai'),
(106, 'Divya Krishnan', 'Chennai'),
(107, 'Alok Verma', 'Lucknow'),
(108, 'Simran Kaur', 'Chandigarh'),
(109, 'Anshul Ghosh', 'Haryana'),
(110, 'Harsha Bhosle', 'UP');

INSERT INTO Savings (customer_id, branch_id, saving_accno, balance) VALUES
(101, 1, 5001001, 75000),   
(102, 2, 5002002, 62000),  
(103, 3, 5003003, 45000),   
(104, 4, 5004004, 83000),   
(105, 5, 5005005, 92000),   
(106, 6, 5006006, 51000),   
(107, 7, 5007007, 37000),   
(108, 8, 5008008, 68000),
(102, 4, 5001015, 50000),
(102, 6, 5001017, 70000);

INSERT INTO Loan (customer_id, branch_id, loan_accno, balance) VALUES
(101, 1, 7001001, 250000),   
(102, 2, 7002002, 300000),  
(103, 3, 7003003, 150000),  
(104, 4, 7004004, 275000),  
(105, 5, 7005005, 400000),   
(106, 6, 7006006, 220000),   
(107, 7, 7007007, 180000),   
(108, 8, 7008008, 260000); 
(110, 4, 7008009, 30000),
(110, 6, 7008019, 38000),
(110, 7, 7008015, 49000);


--a)
SELECT C.customer_id,C.customer_name,B.branch_name,B.branch_city FROM Customer C LEFT JOIN Savings S ON C.customer_id = S.customer_id LEFT JOIN Branch B ON S.branch_id = B.branch_id;

--b)
SELECT C.customer_id,C.customer_name,B.branch_name,B.branch_city FROM Customer C LEFT JOIN Savings S ON C.customer_id = S.customer_id LEFT JOIN Branch B ON S.branch_id = B.branch_id WHERE branch_city = "Delhi";

--c)
SELECT C.customer_id,C.customer_name,COUNT(S.customer_id) AS no_of_acc FROM Customer C LEFT JOIN Savings S ON C.customer_id=S.customer_id GROUP BY C.customer_id,C.customer_name,S.customer_id HAVING COUNT(S.customer_id)>1;

--d)


--e)
SELECT C.customer_id,C.customer_name,COUNT(L.customer_id) AS no_of_lacc FROM Customer C LEFT JOIN Savings S ON C.customer_id = S.customer_id LEFT JOIN Loan L ON C.customer_id=L.customer_id GROUP BY  C.customer_id,C.customer_name,L.customer_id HAVING COUNT(S.customer_id)=0 AND COUNT(L.customer_id)>2;

--f)

--g)


--h)


--i)