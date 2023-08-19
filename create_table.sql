--Drop tables
Drop table Purchases;
Drop table Borrowers;
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
  End_Date_Lib DATE
);

-- Create Books table
CREATE TABLE Books (
  Book_ID NUMBER PRIMARY KEY,
  Title VARCHAR2(50),
  Author VARCHAR2(30),
  Price NUMBER
);

-- Create Book Copies table
CREATE TABLE Book_Copies (
  Copy_ID NUMBER PRIMARY KEY,
  Book_ID NUMBER REFERENCES Books(Book_ID),
  Books_At_Library NUMBER,
  Availability_Status_Library NUMBER,
  Availability_Status_Shop NUMBER
);

-- Create Borrowers table
CREATE TABLE Borrowers (
  Borrow_ID NUMBER PRIMARY KEY,
  Phone_No VARCHAR2(11) REFERENCES Members(Phone_No),
  Book_ID NUMBER REFERENCES Books(Book_ID),
  Loan_Date DATE,
  Return_Date DATE,
  fine number
);

-- Create Purchases table
CREATE TABLE Purchases (
  Purchase_ID NUMBER PRIMARY KEY,
  Phone_No VARCHAR2(11),
  Book_ID NUMBER REFERENCES Books(Book_ID),
  Purchase_Date DATE
);

DROP SEQUENCE Purchases_seq;
CREATE SEQUENCE Purchases_seq START WITH 5 INCREMENT BY 1 NOCACHE NOCYCLE;

--Insert values into Members table
INSERT INTO Members VALUES ('01801234567', 'Md. Rahman', 'Dhaka', 'Reader', TO_DATE('2023-07-31', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
INSERT INTO Members VALUES ('01787654321', 'Shahnaz Begum', 'Chittagong', 'Customer', TO_DATE('2023-07-30', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
INSERT INTO Members VALUES ('01987654321', 'Abdul Karim', 'Rajshahi', 'Both', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
INSERT INTO Members VALUES ('01654321098', 'Farhana Akter', 'Khulna', 'Reader', TO_DATE('2023-03-15', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
INSERT INTO Members VALUES ('01543210987', 'Sarwar Hossain', 'Sylhet', 'Customer', TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));

--Insert values into Books table
INSERT INTO Books VALUES (1, 'To Kill a Mockingbird', 'Harper Lee', 12.99);
INSERT INTO Books VALUES (2, '1984', 'George Orwell', 9.99);
INSERT INTO Books VALUES (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 10.49);
INSERT INTO Books VALUES (4, 'Pride and Prejudice', 'Jane Austen', 8.75);
INSERT INTO Books VALUES (5, 'To Kill a Kingdom', 'Alexandra Christo', 15.25);

--Insert values into Book_Copies table
INSERT INTO Book_Copies VALUES (1, 1, 5, 6, 5);
INSERT INTO Book_Copies VALUES (2, 5, 3, 6, 5);
INSERT INTO Book_Copies VALUES (3, 2, 7, 6, 5);
INSERT INTO Book_Copies VALUES (4, 3, 2, 6, 5);
INSERT INTO Book_Copies VALUES (5, 4, 4, 6, 5);

-- Insert values into Borrowers table
INSERT INTO Borrowers VALUES (1, '01987654321', 2, TO_DATE('2023-07-31', 'YYYY-MM-DD'), TO_DATE('2023-08-14', 'YYYY-MM-DD'), 0);
INSERT INTO Borrowers VALUES (2, '01801234567', 4, TO_DATE('2023-07-30', 'YYYY-MM-DD'), TO_DATE('2023-08-13', 'YYYY-MM-DD'), 0);
INSERT INTO Borrowers VALUES (3, '01543210987', 1, TO_DATE('2023-07-29', 'YYYY-MM-DD'), TO_DATE('2023-08-12', 'YYYY-MM-DD'), 0);
INSERT INTO Borrowers VALUES (4, '01654321098', 3, TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_DATE('2023-08-11', 'YYYY-MM-DD'), 0);
INSERT INTO Borrowers VALUES (5, '01787654321', 5, TO_DATE('2023-07-27', 'YYYY-MM-DD'), TO_DATE('2023-08-10', 'YYYY-MM-DD'), 0);

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