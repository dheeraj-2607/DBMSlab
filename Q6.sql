USE Dheeraj;

CREATE TABLE Employees (
    EmployeeID INT ,
    Name VARCHAR(100),
    Address VARCHAR(255),
    AadharNumber VARCHAR(12),
    MobileNumber VARCHAR(15) ,
    EmailID VARCHAR(100) ,
    JoiningDate DATE,
    Salary DECIMAL(10,2)
);

CREATE TABLE Residents (
    ResidentID INT ,
    Name VARCHAR(100) ,
    Address VARCHAR(255),
    AadharNumber VARCHAR(12),
    Gender VARCHAR(10),
    Age INT,
    MobileNumber VARCHAR(15) ,
    EmailID VARCHAR(100) 
);
CREATE TABLE Companions (
    CompanionID INT ,
    Name VARCHAR(100) ,
    Gender VARCHAR(10),
    MobileNumber VARCHAR(15),
    ResidentID INT
);
CREATE TABLE Rooms (
    RoomNumber INT PRIMARY KEY,
    RoomType VARCHAR(10) ,
    Capacity VARCHAR(20) 
);

CREATE TABLE BookingDetails (
    BookingID INT ,
    ResidentID INT,
    RoomNumber INT ,
    CheckInDate DATE ,
    CheckOutDate DATE ,
    NumberOfCompanions INT
);
CREATE TABLE FoodItems (
    FoodItemID INT ,
    FoodItem VARCHAR(100) ,
    Type VARCHAR(20) ,
    Price DECIMAL(7,2) 
);
CREATE TABLE FoodOrders (
    OrderID INT ,
    BookingID INT ,
    FoodItemID INT ,
    Quantity INT ,
    OrderDate DATE
);

INSERT INTO Employees (EmployeeID, Name, Address, AadharNumber, MobileNumber, EmailID, JoiningDate, Salary) VALUES
(1, 'Rahul Sharma', '123 Beach Road, Goa', '123456789012', '9876543210', 'rahul.sharma@email.com', '2023-01-15', 35000.00),
(2, 'Priya Singh', '456 Lake View, Kerala', '234567890123', '8765432109', 'priya.singh@email.com', '2022-12-01', 40000.00),
(3, 'Amit Patel', '789 Hill Top, Manali', '345678901234', '7654321098', 'amit.patel@email.com', '2024-03-10', 32000.00),
(4, 'Sneha Verma', '321 River Side, Mumbai', '456789012345', '6543210987', 'sneha.verma@email.com', '2023-05-20', 37000.00),
(5, 'Vikram Rao', '654 Forest Lane, Ooty', '567890123456', '5432109876', 'vikram.rao@email.com', '2024-01-05', 39000.00),
(6, 'Neha Gupta', '987 Valley Road, Shimla', '678901234567', '4321098765', 'neha.gupta@email.com', '2023-08-12', 36000.00),
(7, 'Arjun Mehta', '159 Mountain View, Darjeeling', '789012345678', '3210987654', 'arjun.mehta@email.com', '2022-11-30', 41000.00),
(8, 'Riya Das', '753 Ocean Drive, Chennai', '890123456789', '2109876543', 'riya.das@email.com', '2023-02-18', 34000.00),
(9, 'Karan Joshi', '852 Garden Street, Pune', '901234567890', '1098765432', 'karan.joshi@email.com', '2024-04-22', 38000.00),
(10, 'Pooja Nair', '951 City Center, Kochi', '012345678901', '1987654321', 'pooja.nair@email.com', '2023-09-14', 35500.00);


INSERT INTO Residents (ResidentID, Name, Address, AadharNumber, Gender, Age, MobileNumber, EmailID) VALUES
(1, 'Suresh Menon', '11 Palm Street, Goa', '111122223333', 'Male', 45, '9001112233', 'suresh.menon@email.com'),
(2, 'Asha Pillai', '22 Lotus Avenue, Kerala', '222233334444', 'Female', 38, '9002223344', 'asha.pillai@email.com'),
(3, 'Deepak Rao', '33 Hill Road, Manali', '333344445555', 'Male', 29, '9003334455', 'deepak.rao@email.com'),
(4, 'Geeta Iyer', '44 River Lane, Mumbai', '444455556666', 'Female', 41, '9004445566', 'geeta.iyer@email.com'),
(5, 'Manoj Kumar', '55 Forest Path, Ooty', '555566667777', 'Male', 36, '9005556677', 'manoj.kumar@email.com'),
(6, 'Lata Sharma', '66 Valley Road, Shimla', '666677778888', 'Female', 27, '9006667788', 'lata.sharma@email.com'),
(7, 'Ramesh Gupta', '77 Mountain View, Darjeeling', '777788889999', 'Male', 50, '9007778899', 'ramesh.gupta@email.com'),
(8, 'Sunita Joshi', '88 Ocean Drive, Chennai', '888899990000', 'Female', 32, '9008889900', 'sunita.joshi@email.com'),
(9, 'Ajay Desai', '99 Garden Street, Pune', '999900001111', 'Male', 28, '9009990011', 'ajay.desai@email.com'),
(10, 'Meena Nair', '100 City Center, Kochi', '000011112222', 'Female', 34, '9000001122', 'meena.nair@email.com');


INSERT INTO Companions (CompanionID, Name, Gender, MobileNumber, ResidentID) VALUES
(1, 'Vikas Menon', 'Male', '9011112234', 1),
(2, 'Radhika Pillai', 'Female', '9012223345', 2),
(3, 'Sanjay Rao', 'Male', '9013334456', 3),
(4, 'Priya Iyer', 'Female', '9014445567', 4),
(5, 'Anil Kumar', 'Male', '9015556678', 5),
(6, 'Kavita Sharma', 'Female', '9016667789', 6),
(7, 'Sunil Gupta', 'Male', '9017778890', 7),
(8, 'Poonam Joshi', 'Female', '9018889901', 8),
(9, 'Ravi Desai', 'Male', '9019990012', 9),
(10, 'Shalini Nair', 'Female', '9010001123', 10);

INSERT INTO Rooms (RoomNumber, RoomType, Capacity)
VALUES
(101, 'AC', 'Single'),
(102, 'AC', 'Double'),
(103, 'Non-AC', 'Single'),
(104, 'Non-AC', 'Double'),
(105, 'AC', 'Single'),
(106, 'AC', 'Double'),
(107, 'Non-AC', 'Single'),
(108, 'Non-AC', 'Double'),
(109, 'AC', 'Single'),
(110, 'Non-AC', 'Double');

INSERT INTO BookingDetails (BookingID, ResidentID, RoomNumber, CheckInDate, CheckOutDate, NumberOfCompanions)
VALUES
(1, 1, 101, '2025-09-01', '2025-09-05', 2),
(2, 2, 102, '2025-09-02', '2025-09-06', 1), 
(3, 3, 103, '2025-09-03', '2025-09-07', 3), 
(4, 4, 104, '2025-09-04', '2025-09-08', 1), 
(5, 5, 105, '2025-09-05', '2025-09-09', 4), 
(6, 6, 106, '2025-09-06', '2025-09-10', 1), 
(7, 7, 107, '2025-09-07', '2025-09-11', 3), 
(8, 8, 108, '2025-09-08', '2025-09-12', 5), 
(9, 9, 109, '2025-09-09', '2025-09-13', 2),
(10, 10, 110, '2025-09-10', '2025-09-14', 3),
(11, 5, 105, '2025-09-11', '2025-09-19', 2),
(12, 5, 105, '2025-09-15', '2025-09-19', 4); 



INSERT INTO FoodItems (FoodItemID, FoodItem, Type, Price)
VALUES
(1, 'Paneer Butter Masala', 'Veg', 180.00),
(2, 'Chicken Biryani', 'Non-Veg', 220.00),
(3, 'Veg Fried Rice', 'Veg', 150.00),
(4, 'Mutton Curry', 'Non-Veg', 250.00),
(5, 'Masala Dosa', 'Veg', 90.00),
(6, 'Fish Fry', 'Non-Veg', 200.00),
(7, 'Aloo Gobi', 'Veg', 140.00),
(8, 'Prawn Curry', 'Non-Veg', 270.00),
(9, 'Dal Tadka', 'Veg', 120.00),
(10, 'Egg Curry', 'Non-Veg', 160.00);

INSERT INTO FoodOrders (OrderID, BookingID, FoodItemID, Quantity, OrderDate)
VALUES
(1, 1, 1, 1, '2025-09-02'), 
(2, 2, 2, 2, '2025-09-03'), 
(3, 2, 5, 1, '2025-09-04'), 
(4, 3, 3, 1, '2025-09-04'), 
(5, 4, 4, 2, '2025-09-05'), 
(6, 5, 9, 1, '2025-09-06'), 
(7, 6, 6, 2, '2025-09-07'), 
(8, 7, 7, 1, '2025-09-08'), 
(9, 8, 8, 2, '2025-09-09'), 
(10, 9, 10, 1, '2025-09-10'), 
(11, 10, 2, 2, '2025-09-11'), 
(12, 10, 1, 1, '2025-09-12'),
(13, 11, 3, 1, '2025-09-13'),
(14, 12, 6, 3, '2025-09-13'),
(15, 10, 3, 1, '2025-09-14'),
(16, 11, 10, 2, '2025-09-14'),
(17, 10, 3, 4, '2025-09-15'),
(18, 8, 2, 1, '2025-09-16'),
(19, 6, 5, 3, '2025-09-16'),
(20, 7, 3, 2, '2025-09-17'),
(21, 1, 3, 1, '2025-09-18');

--a)
SELECT R.ResidentID,R.Name,R.Address,R.Gender,R.Age,R.MobileNumber 
    FROM Residents R 
    LEFT JOIN BookingDetails B ON R.ResidentID=B.ResidentID 
    WHERE B.NumberOfCompanions >= 3;
--b)
SELECT R.ResidentID,R.Name,R.Address,R.Gender,R.Age,R.MobileNumber,B.NumberOfCompanions 
    FROM Residents R    
    LEFT JOIN BookingDetails B ON R.ResidentID=B.ResidentID 
    WHERE CheckInDate >= '2025-09-01' AND CheckOutDate <= '2025-09-09' ;

--c)
SELECT R.ResidentID,R.Name,R.Address,R.Gender,R.Age,R.MobileNumber 
FROM Residents R 
LEFT JOIN BookingDetails B ON R.ResidentID=B.ResidentID 
LEFT JOIN Rooms Q ON Q.RoomNumber = B.RoomNumber 
WHERE Q.RoomType='AC' 
GROUP BY R.ResidentID,R.Name,R.Address,R.Gender,R.Age,R.MobileNumber 
HAVING COUNT(B.ResidentID)>2 AND COUNT(DISTINCT B.BookingID)>1;

--d)
CREATE VIEW ordercount AS
SELECT I.FoodItemID, I.FoodItem, I.Type, I.Price,COUNT(F.FoodItemID) AS count
    FROM FoodOrders F
    JOIN FoodItems I ON I.FoodItemID = F.FoodItemID
    GROUP BY I.FoodItemID, I.FoodItem, I.Type, I.Price;

    SELECT FoodItemID, FoodItem, Type, Price
    FROM ordercount
    WHERE count = (SELECT MAX(count) FROM ordercount);

    SELECT FoodItemID, FoodItem, Type, Price
    FROM ordercount
    WHERE count = (SELECT MIN(count) FROM ordercount);

   
--e)
CREATE VIEW ordercounts AS
SELECT I.FoodItemID, I.FoodItem, I.Type, I.Price,F.OrderDate,COUNT(F.FoodItemID) AS count
    FROM FoodOrders F
    JOIN FoodItems I ON I.FoodItemID = F.FoodItemID
    GROUP BY I.FoodItemID, I.FoodItem, I.Type, I.Price,F.OrderDate;
SELECT FoodItemID,FoodItem,Type,Price
    FROM ordercounts
    WHERE OrderDate >= '2025-09-02' AND OrderDate <= '2025-09-09' AND count = (SELECT MAX(count) FROM ordercounts) 
    ORDER BY Price ASC;