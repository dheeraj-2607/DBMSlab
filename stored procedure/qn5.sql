DELIMITER //
CREATE PROCEDURE squarecube(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE s INT;
    DECLARE c INT;
    CREATE TABLE Square(
        i INT,
        val INT
    );
    CREATE TABLE Cuberoot(
        i INT,
        val INT
    );
    WHILE i <= n DO
        SET s = i*i;
        SET c = i*i*i;
        INSERT INTO Square(i,val) VALUES (i, s);
        INSERT INTO Cuberoot(i,val) VALUES (i, c);
        SET i = i + 1;
    END WHILE;
    SELECT * FROM Square;
    SELECT * FROM Cuberoot;
  
END // 
DELIMITER ;