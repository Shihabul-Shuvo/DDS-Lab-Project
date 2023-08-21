--Drop tables
Drop table Book_Copies; 
Drop table Books;
Drop table Members;

-- Create Members table
CREATE TABLE Members (
  Phone_No VARCHAR2(11) PRIMARY KEY,
  Name VARCHAR2(30),
  Address VARCHAR2(30),
  Membership_Status VARCHAR2(10),
  Start_Date_Lib DATE,
  End_Date_Lib DATE,
  Card varchar2(7)
);

-- Create Books table
CREATE TABLE Books (
  Book_ID NUMBER PRIMARY KEY,
  Title VARCHAR2(50),
  Author VARCHAR2(30),
  Publication varchar(20),
  Price NUMBER
);

-- Create Book Copies table
CREATE TABLE Book_Copies (
  Copy_ID NUMBER PRIMARY KEY,
  Book_ID NUMBER,
  Books_At_Library NUMBER,
  Availability_Status_Library NUMBER,
  Availability_Status_Shop NUMBER
);

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
INSERT INTO Purchases VALUES (1, '01787654321', 1, TO_DATE('2023-07-31', 'YYYY-MM-DD'));
INSERT INTO Purchases VALUES (2, '01987654321', 2, TO_DATE('2023-07-30', 'YYYY-MM-DD'));
INSERT INTO Purchases VALUES (3, '01987654321', 3, TO_DATE('2023-07-29', 'YYYY-MM-DD'));
INSERT INTO Purchases VALUES (4, '01543210987', 4, TO_DATE('2023-07-28', 'YYYY-MM-DD'));
INSERT INTO Purchases VALUES (Purchases_seq.nextval, '01787654321', 5, TO_DATE('2023-07-27', 'YYYY-MM-DD'));


-- Droping table before creating
Drop table members2;
Drop table members3;
Drop table books2;
Drop table Book_Copies2;
-- Create new tables for fragments
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

-- Display the counts of the new tables
DECLARE
    v_count1 NUMBER;
    v_count2 NUMBER;
	v_count3 NUMBER;
	v_count4 NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count1 FROM Members2;
    SELECT COUNT(*) INTO v_count2 FROM Members3;
	SELECT COUNT(*) INTO v_count3 FROM Books2;
    SELECT COUNT(*) INTO v_count4 FROM Book_Copies2;
    
    DBMS_OUTPUT.PUT_LINE('Members2 count: ' || v_count1);
    DBMS_OUTPUT.PUT_LINE('Members3 count: ' || v_count2);
	DBMS_OUTPUT.PUT_LINE('Books2 count: ' || v_count3);
    DBMS_OUTPUT.PUT_LINE('Book_Copies2 count: ' || v_count4);
END;
/
