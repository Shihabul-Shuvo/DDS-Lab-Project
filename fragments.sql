-- Droping table before creating
Drop table members1;
Drop table members2;
Drop table members3;
Drop table books1;
Drop table books2;
Drop table Book_Copies1;
Drop table Book_Copies2;
Drop table Purchases;
Drop table Borrowers;

-- Create new tables for fragments
-- Library site
-- Members1 (SLstatus = 'reader')
CREATE TABLE Members1 AS
SELECT *
FROM Members
WHERE Membership_Status = 'Reader';

-- Books1 (PJ Book_ID, Title, Author, Publication)
CREATE TABLE Books1 AS
SELECT Book_ID, Title, Author, Publication
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
WHERE Membership_Status = 'Customer';

-- Members3 (SLstatus = 'both')
CREATE TABLE Members3 AS
SELECT *
FROM Members
WHERE Membership_Status = 'Both';

-- Books2 (PJBook_ID, Price)
CREATE TABLE Books2 AS
SELECT Book_ID, Title, Price
FROM Books;

-- Book Copies2 (PJCopy_ID, Book_ID, Availibility_status_shop)
CREATE TABLE Book_Copies2 AS
SELECT Copy_ID, Book_ID, Availability_Status_Shop
FROM Book_Copies;

-- Create Borrowers table
CREATE TABLE Borrowers (
  Borrow_ID NUMBER PRIMARY KEY,
  Phone_No VARCHAR2(11),
  Book_ID NUMBER,
  Loan_Date DATE,
  Return_Date DATE,
  fine number
);

-- Create Purchases table
CREATE TABLE Purchases (
  Purchase_ID NUMBER PRIMARY KEY,
  Phone_No VARCHAR2(11),
  Book_ID NUMBER,
  Purchase_Date DATE
);

DROP SEQUENCE Purchases_seq;
CREATE SEQUENCE Purchases_seq START WITH 5 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP SEQUENCE book_id_seq;
CREATE SEQUENCE book_id_seq START WITH 15 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Insert values into Borrowers table
INSERT INTO Borrowers VALUES (1, '01987654321', 2, TO_DATE('2023-07-31', 'YYYY-MM-DD'), TO_DATE('2023-08-14', 'YYYY-MM-DD'), 0);
INSERT INTO Borrowers VALUES (2, '01801234567', 4, TO_DATE('2023-07-30', 'YYYY-MM-DD'), TO_DATE('2023-08-13', 'YYYY-MM-DD'), 0);
INSERT INTO Borrowers VALUES (3, '01654321098', 3, TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_DATE('2023-08-11', 'YYYY-MM-DD'), 0);

-- Insert values into Purchases table
INSERT INTO Purchases
VALUES (1, '01787654321', 1, TO_DATE('2023-07-31', 'YYYY-MM-DD'));

INSERT INTO Purchases
VALUES (2, '01987654321', 2, TO_DATE('2023-07-30', 'YYYY-MM-DD'));

INSERT INTO Purchases
VALUES (3, '01987654321', 3, TO_DATE('2023-07-29', 'YYYY-MM-DD'));

INSERT INTO Purchases 
VALUES (4, '01543210987', 4, TO_DATE('2023-07-28', 'YYYY-MM-DD'));

INSERT INTO Purchases VALUES (Purchases_seq.nextval, '01787654321', 5, TO_DATE('2023-07-27', 'YYYY-MM-DD'));

commit;
