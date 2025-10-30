DELIMITER //
CREATE TRIGGER toggle_name_case
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF BINARY NEW.name = LOWER(NEW.name) THEN
        SET NEW.name = UPPER(NEW.name);
    ELSE
        SET NEW.name = LOWER(NEW.name);
    END IF;
END //
DELIMITER ;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO employees (name) VALUES ('john');

UPDATE employees SET name='john' WHERE emp_id=1;
SELECT * FROM employees;