-- Droping table before creating
Drop table members1;
Drop table members2;
Drop table members3;
Drop table books1;
Drop table books2;
Drop table Book_Copies1;
Drop table Book_Copies2;

-- Create new tables for fragments
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
