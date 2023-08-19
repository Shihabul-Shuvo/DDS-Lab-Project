-- Create new tables for fragments
-- Members1 (SLstatus = 'reader')
CREATE TABLE Members1 AS
SELECT *
FROM Members
WHERE Status = 'reader';

-- Members2 (SLstatus = 'customer')
CREATE TABLE Members2 AS
SELECT Phone, Name, Address, Status, Start_Date
FROM Members
WHERE Status = 'customer';

-- Members3 (SLstatus = 'both')
CREATE TABLE Members3 AS
SELECT Phone, Name, Address, Status, Start_Date
FROM Members
WHERE Status = 'both';

-- Books1 (PJBook_ID, Title, Author, Publisher)
CREATE TABLE Books1 AS
SELECT Book_ID, Title, Author, Publisher
FROM Books;

-- Books2 (PJBook_ID, Price)
CREATE TABLE Books2 AS
SELECT Book_ID, Price
FROM Books;

-- Book_Copies1 (PJCopy_ID, Book_ID, Books_at_library, Availibility_status_library)
CREATE TABLE Book_Copies1 AS
SELECT Copy_ID, Book_ID, Books_At_Library, Availability_Status_Library
FROM Book_Copies;

-- Book Copies2 (PJCopy_ID, Book_ID, Availibility_status_shop)
CREATE TABLE Book_Copies2 AS
SELECT Copy_ID, Book_ID, Availability_Status_Shop
FROM Book_Copies;
