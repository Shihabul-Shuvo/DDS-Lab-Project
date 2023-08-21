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
Drop table members1;
Drop table books1;
Drop table Book_Copies1;

-- Create new tables for fragments
-- Library site
-- Members1 (SLstatus = 'reader')
CREATE TABLE Members1 AS
SELECT *
FROM Members
WHERE Membership_Status = 'Reader';

-- Members3 (SLstatus = 'both')
CREATE TABLE Members3 AS
SELECT *
FROM Members
WHERE Membership_Status = 'Both';

-- Books1 (PJBook_ID, Title, Author, Publication)
CREATE TABLE Books1 AS
SELECT Book_ID, Title, Author, Publication
FROM Books;

-- Book_Copies1 (PJCopy_ID, Book_ID, Books_at_library, Availibility_status_library)
CREATE TABLE Book_Copies1 AS
SELECT Copy_ID, Book_ID, Books_At_Library, Availability_Status_Library
FROM Book_Copies;

-- Display the counts of the new tables
DECLARE
    v_count1 NUMBER;
    v_count2 NUMBER;
	v_count3 NUMBER;
	v_count4 NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count1 FROM Members1;
    SELECT COUNT(*) INTO v_count2 FROM Members3;
	SELECT COUNT(*) INTO v_count3 FROM Books1;
    SELECT COUNT(*) INTO v_count4 FROM Book_Copies1;
    
    DBMS_OUTPUT.PUT_LINE('Members1 count: ' || v_count1);
    DBMS_OUTPUT.PUT_LINE('Members3 count: ' || v_count2);
	DBMS_OUTPUT.PUT_LINE('Books1 count: ' || v_count3);
    DBMS_OUTPUT.PUT_LINE('Book_Copies1 count: ' || v_count4);
END;
/
