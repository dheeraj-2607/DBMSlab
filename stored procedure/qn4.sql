DELIMITER //

CREATE PROCEDURE primecomposite(IN n INT)
BEGIN
    DECLARE num INT DEFAULT 2;
    DECLARE p INT DEFAULT 0;
    DECLARE c INT DEFAULT 0;
    DECLARE i INT;
    DECLARE is_prime BOOLEAN;
    CREATE TABLE PRIME (
        i INT  PRIMARY KEY,
        term INT
    );
    CREATE TABLE COMPOSITE (
        i INT  PRIMARY KEY,
        term INT
    );
    WHILE p < n OR c < n DO
    	SET is_prime = TRUE;
	SET i = 2;
	WHILE i<num DO
     	IF num % i = 0 THEN
        	SET is_prime = FALSE;
       	END IF;
        	SET i = i + 1;
        END WHILE;
        IF is_prime AND p<n THEN
        	INSERT INTO PRIME VALUES(p+1,num);
        	SET p=p+1;
        ELSEIF NOT(is_prime) AND c<n THEN
        	INSERT INTO COMPOSITE VALUES(c+1,num);
        	SET c=c+1;
        END IF;
        SET num =num+1;
    END WHILE;
    SELECT * FROM PRIME;
    SELECT * FROM COMPOSITE;
    DROP TABLE PRIME;
    DROP TABLE COMPOSITE;
END //

DELIMITER ;

