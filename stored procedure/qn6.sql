DELIMITER //
CREATE PROCEDURE calculate_pension()
BEGIN
    DECLARE finished INT DEFAULT FALSE;
    DECLARE eid INT;
    DECLARE ename VARCHAR(20);
    DECLARE jdate DATE;
    DECLARE rdate DATE;
    DECLARE esalary DECIMAL(10,4);
    DECLARE experience INT;
    DECLARE pension DECIMAL(10,4);
    DECLARE emp_cursor CURSOR FOR 
        SELECT empid, empname, joining_date, relieving_date, salary 
        FROM employee 
        WHERE relieving_date IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = TRUE;
    CREATE TABLE PensionResults (
        empid INT,
        empname VARCHAR(100),
        service_years INT,
        pension_amount DECIMAL(10,2)
    );
    OPEN emp_cursor;
    read_loop: LOOP
        FETCH emp_cursor INTO eid, ename, jdate, rdate, esalary;
        IF finished THEN
            LEAVE read_loop;
        END IF;
        SET experience= FLOOR(TIMESTAMPDIFF(MONTH, jdate, rdate) / 12);
        SET pension = (experience* esalary) / 100;
        INSERT INTO PensionResults VALUES (eid, ename, experience,pension);
    END LOOP;
    CLOSE emp_cursor;
    SELECT * FROM PensionResults;
    DROP TABLE PensionResults;
END //

DELIMITER ;

