-- Create a database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    Amount DECIMAL(10,2)
);

-- Order_History table (to log deleted records)
CREATE TABLE Order_History (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    Amount DECIMAL(10,2),
    DeletedAt DATETIME
);
INSERT INTO Orders (OrderID, CustomerName, OrderDate, Amount) VALUES
(1, 'Aravind Kumar', '2023-04-15', 5000),
(2, 'Hariprasad Kumar', '2023-08-01', 7000),
(3, 'Subbash Kumar', '2024-09-05', 3000),
(4, 'Abi Vickey', '2024-02-09', 6500),
(5, 'Deva Raj', '2024-11-11', 9000);

DELIMITER $$

CREATE TRIGGER after_order_delete
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Order_History (OrderID, CustomerName, OrderDate, Amount, DeletedAt)
    VALUES (OLD.OrderID, OLD.CustomerName, OLD.OrderDate, OLD.Amount, NOW());
END$$
DELETE FROM Orders WHERE OrderID = 3;

-- Check the log table
SELECT * FROM Order_History;
-- Grant permission to view data
GRANT SELECT ON CompanyDB.Orders TO 'junior_analyst'@'localhost';

-- Revoke permission if needed
REVOKE SELECT ON CompanyDB.Orders FROM 'junior_analyst'@'localhost';
-- Example of user creation
CREATE USER 'junior_analyst'@'localhost' IDENTIFIED BY 'password123';

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(100),
    Balance DECIMAL(10,2)
);

INSERT INTO Accounts VALUES
(1, 'Aravind Kumar', 10000),
(2, 'Abi Vickey', 5000);
-- Start the transaction
START TRANSACTION;

-- Step 1: Deduct from sender
UPDATE Accounts SET Balance = Balance - 2000 WHERE AccountID = 1;

-- Step 2: Create a savepoint
SAVEPOINT after_deduction;

-- Step 3: Add to receiver
UPDATE Accounts SET Balance = Balance + 2000 WHERE AccountID = 2;

-- Step 4: Commit the transaction
COMMIT;
