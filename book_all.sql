SET VERIFY OFF
SET serveroutput on

CREATE OR REPLACE PACKAGE LibraryPackage AS
    PROCEDURE InsertIntoBooks(
        p_Title       VARCHAR2,
        p_Author      VARCHAR2,
        p_Price       NUMBER
    );

    PROCEDURE InsertIntoBookCopies(
        p_BookID                 NUMBER,
        p_BooksAtLibrary         NUMBER,
        p_AvailabilityStatusLib  NUMBER,
        p_AvailabilityStatusShop NUMBER
    );

    FUNCTION GetAvailableCopies(
        p_BookName VARCHAR2
    ) RETURN NUMBER;
	
    FUNCTION BorrowBook(
        p_BorrowID NUMBER,
        p_PhoneNo  VARCHAR2,
        p_BookID   NUMBER,
        p_LoanDate DATE,
        p_ReturnDate DATE
    ) RETURN BOOLEAN;
END LibraryPackage;
/
--Package Body
CREATE OR REPLACE PACKAGE BODY LibraryPackage AS
    PROCEDURE InsertIntoBooks(
        p_Title       VARCHAR2,
        p_Author      VARCHAR2,
        p_Price       NUMBER
    ) IS
    BEGIN
        INSERT INTO Books (Book_ID, Title, Author, Price)
        VALUES (Books_Seq.NEXTVAL, p_Title, p_Author, p_Price);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Book inserted successfully.');
    END InsertIntoBooks;

    PROCEDURE InsertIntoBookCopies(
        p_BookID                 NUMBER,
        p_BooksAtLibrary         NUMBER,
        p_AvailabilityStatusLib  NUMBER,
        p_AvailabilityStatusShop NUMBER
    ) IS
    BEGIN
        INSERT INTO Book_Copies (Copy_ID, Book_ID, Books_At_Library, Availability_Status_Library, Availability_Status_Shop)
        VALUES (BookCopies_Seq.NEXTVAL, p_BookID, p_BooksAtLibrary, p_AvailabilityStatusLib, p_AvailabilityStatusShop);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Book copy inserted successfully.');
    END InsertIntoBookCopies;

    FUNCTION GetAvailableCopies(
        p_BookName VARCHAR2
    ) RETURN NUMBER IS
        v_BookID     NUMBER;
        v_Copies     NUMBER;
    BEGIN
        SELECT Book_ID
        INTO v_BookID
        FROM Books
        WHERE Title = p_BookName;

        SELECT COUNT(*)
        INTO v_Copies
        FROM Book_Copies
        WHERE Book_ID = v_BookID AND Availability_Status_Library = 1;

        RETURN v_Copies;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Book not found.');
            RETURN NULL;
    END GetAvailableCopies;

    FUNCTION BorrowBook(
        p_BorrowID NUMBER,
        p_PhoneNo  VARCHAR2,
        p_BookID   NUMBER,
        p_LoanDate DATE,
        p_ReturnDate DATE
    ) RETURN BOOLEAN IS
    BEGIN
        INSERT INTO Borrowers (Borrow_ID, Phone_No, Loan_Date, Return_Date)
        VALUES (p_BorrowID, p_PhoneNo, p_LoanDate, p_ReturnDate);
        COMMIT;

        -- Update the Availability_Status_Library to 0 for the borrowed book copy
        UPDATE Book_Copies
        SET Availability_Status_Library = 0
        WHERE Book_ID = p_BookID AND Availability_Status_Library = 1 AND ROWNUM = 1;

        DBMS_OUTPUT.PUT_LINE('Book borrowed successfully.');
        RETURN TRUE;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Borrower ID already exists.');
            ROLLBACK;
            RETURN FALSE;
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Book not available for borrowing.');
            ROLLBACK;
            RETURN FALSE;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
            ROLLBACK;
            RETURN FALSE;
    END BorrowBook;
END LibraryPackage;
/
DECLARE
    v_Title   VARCHAR2(50);
    v_Author  VARCHAR2(30);
    v_Price   NUMBER;
BEGIN
    -- Get user input
    v_Title := '&Enter_Title';
    v_Author := '&Enter_Author';
    v_Price := &Enter_Price;

    -- Call the InsertIntoBooks procedure with user input
    LibraryPackage.InsertIntoBooks(v_Title, v_Author, v_Price);
END;
/


