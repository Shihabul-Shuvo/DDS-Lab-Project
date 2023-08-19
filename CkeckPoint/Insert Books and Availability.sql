SET VERIFY OFF
SET serveroutput on

CREATE OR REPLACE PACKAGE LibraryPackage AS
    PROCEDURE InsertIntoBooks;
	
	FUNCTION GetAvailableCopies(
        p_BookName VARCHAR2
    ) RETURN NUMBER;
	
END LibraryPackage;
/

--Package Body
CREATE OR REPLACE PACKAGE BODY LibraryPackage AS
	--insert into books
    PROCEDURE InsertIntoBooks AS
		v_Title   books.title%type;
		v_Author  books.author%type;
		v_Price   books.price%type;
		v_book_count NUMBER;
	BEGIN 
		-- Get user input
		v_Title := '&Enter_Title';
		v_Author := '&Enter_Author';
		v_Price := &Enter_Price;
		
		SELECT COUNT(*) AS Total_Books 
		INTO v_book_count FROM Books;
		v_book_count := v_book_count+1;
		
        INSERT INTO Books VALUES(v_book_count, v_Title, v_Author, v_Price);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Book inserted successfully.');
    END InsertIntoBooks;
	
	
	--Function Check available copies
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
        WHERE Book_ID = v_BookID;

        RETURN v_Copies;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Book not found.');
            RETURN NULL;
    END GetAvailableCopies;
	
END LibraryPackage;
/
DECLARE
	v_BookName     VARCHAR2(50);
    v_AvailableCopies NUMBER;
BEGIN
    -- Call the InsertIntoBooks procedure with user input
	LibraryPackage.InsertIntoBooks;
	
	-- Get user input
    v_BookName := '&Enter_BookName';

    -- Call the GetAvailableCopies function with user input
    v_AvailableCopies := LibraryPackage.GetAvailableCopies(v_BookName);

    -- Display the result
    IF v_AvailableCopies IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Available Copies of ' || v_BookName || ': ' || v_AvailableCopies);
    END IF;
END;
/


