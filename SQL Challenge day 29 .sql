CREATE DATABASE BookStore;
USE BookStore;

-- Primary & Foreign Key
CREATE TABLE Books(BookID INT PRIMARY KEY, Title VARCHAR(100), ISBN VARCHAR(30));
CREATE TABLE Orders(OrderID INT PRIMARY KEY, BookID INT, FOREIGN KEY(BookID) REFERENCES Books(BookID));

-- UNIQUE Constraint
ALTER TABLE Books ADD UNIQUE(ISBN);
insert into Books (BookID,title,author,ISBN) values (101,"We were never ment to be ","Overthinking is an art",500);
insert into Orders (orderID,BookID) values (394,101);

-- Delete vs Truncate
DELETE FROM Orders WHERE OrderID=394;
TRUNCATE TABLE Orders;