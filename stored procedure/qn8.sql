CREATE TABLE Employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE INCREMENT (
    empid INT,
    incr DECIMAL(10,2)
);

DELIMITER //
CREATE TRIGGER check_salary_increment
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    DECLARE diff DECIMAL(10,2);
    SET diff = NEW.salary - OLD.salary;

    IF diff > 1000 THEN
        INSERT INTO INCREMENT(empid, incr)
        VALUES (NEW.empid, diff);
    END IF;
END //
DELIMITER ;

-- Insert some employees
INSERT INTO Employee VALUES
(1, 'Alice', 25000),
(2, 'Bob', 30000),
(3, 'Charlie', 40000);

-- Update salary (increment > 1000 triggers insert)
UPDATE Employee SET salary = 27050 WHERE empid = 1;

-- Update salary (increment ≤ 1000 → no record added)
UPDATE Employee SET salary = 30500 WHERE empid = 2;

-- Check increment table
SELECT * FROM INCREMENT;