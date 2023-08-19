-- Droping table before creating
Drop table members1;
Drop table members2;
Drop table members3;
Drop table books1;
Drop table books2;
Drop table Book_Copies1;
Drop table Book_Copies2;
-- Create new tables for fragments
-- Library site
-- Members1 (SLstatus = 'reader')
CREATE TABLE Members1 AS
SELECT *
FROM Members
WHERE Membership_Status = 'reader';

-- Books1 (PJBook_ID, Title, Author)
CREATE TABLE Books1 AS
SELECT Book_ID, Title, Author
FROM Books;

-- Book_Copies1 (PJCopy_ID, Book_ID, Books_at_library, Availibility_status_library)
CREATE TABLE Book_Copies1 AS
SELECT Copy_ID, Book_ID, Books_At_Library, Availability_Status_Library
FROM Book_Copies;

-- Stationary site
-- Members2 (SLstatus = 'customer')
CREATE TABLE Members2 AS
SELECT Phone_no, Name, Address, Membership_Status, Start_Date_lib
FROM Members
WHERE Membership_Status = 'customer';

-- Members3 (SLstatus = 'both')
CREATE TABLE Members3 AS
SELECT Phone_no, Name, Address, Membership_Status, Start_Date_lib
FROM Members
WHERE Membership_Status = 'both';

-- Books2 (PJBook_ID, Price)
CREATE TABLE Books2 AS
SELECT Book_ID, Price
FROM Books;

-- Book Copies2 (PJCopy_ID, Book_ID, Availibility_status_shop)
CREATE TABLE Book_Copies2 AS
SELECT Copy_ID, Book_ID, Availability_Status_Shop
FROM Book_Copies;
