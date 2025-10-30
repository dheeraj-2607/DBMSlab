DELIMITER //

CREATE PROCEDURE fibonacci(IN n INT)
BEGIN
    DECLARE a INT DEFAULT -1;
    DECLARE b INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;
    DECLARE c INT;
    CREATE TABLE fibtable(
        i INT,
        term INT);
        WHILE i < n DO        
            SET c= a + b;
            INSERT INTO fibtable VALUES(I,C);   
            SET a = b;
            SET b = c;
            SET i = i + 1;
        END WHILE;
    SELECT * FROM fibtable;
    DROP TABLE fibtable;
END //

DELIMITER ;

