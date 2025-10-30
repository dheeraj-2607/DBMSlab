---table_creation
CREATE TABLE Book (
    Accno INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Publisher VARCHAR(50),
    Edition INT,
    Number_of_copies INT
);



DELIMITER //
CREATE TRIGGER after_book_insert
AFTER INSERT ON Book
FOR EACH ROW
BEGIN
    SELECT CONCAT('Total number of books: ', COUNT(*)) AS Total_Books
    FROM Book;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_book_delete
AFTER DELETE ON Book
FOR EACH ROW
BEGIN
    SELECT CONCAT('Total number of books: ', COUNT(*)) AS Total_Books
    FROM Book;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_book_delete
AFTER DELETE ON Book
FOR EACH ROW
BEGIN
    SELECT CONCAT('Total number of books: ', COUNT(*)) AS Total_Books
    FROM Book;
END //
DELIMITER ;

INSERT INTO Book VALUES (1, 'DBMS', 'Navathe', 'Pearson', 6, 10);
INSERT INTO Book VALUES (2, 'Operating System', 'Galvin', 'Wiley', 10, 5);
UPDATE Book SET Number_of_copies = 12 WHERE Accno = 1;
DELETE FROM Book WHERE Accno = 2;