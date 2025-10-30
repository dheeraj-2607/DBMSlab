DELIMITER //

CREATE PROCEDURE narcissistic(IN n INT)
BEGIN
    DECLARE s INT DEFAULT 0;
    DECLARE d INT;
    DECLARE dcnt INT DEFAULT 0;
    DECLARE temp INT;
    SET temp = n;
    WHILE temp<> 0 DO
        SET temp= FLOOR(temp/10);
        SET dcnt = dcnt + 1;
    END WHILE;
    SET temp=n;
    WHILE temp <> 0 DO
        SET d = MOD(temp, 10);
        SET s= s+ POW(d, dcnt);
        SET temp= FLOOR(temp/ 10);
    END WHILE;
    IF s = n THEN
        SELECT CONCAT(n, ' is a narcissistic number.') AS finalresult;
    ELSE
        SELECT CONCAT(n, ' is NOT a narcissistic number.') AS finalresult;
    END IF;
END //

DELIMITER ;

