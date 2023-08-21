set verify off
set serveroutput ON

CREATE OR REPLACE TRIGGER Before_Delete_Borrower
BEFORE DELETE ON Borrowers
FOR EACH ROW
DECLARE
    v_book_id Books1.Book_ID%TYPE;
BEGIN
    -- Get the Book_ID of the book being deleted
    SELECT Book_ID INTO v_book_id
    FROM Borrowers
    WHERE Borrow_ID = :OLD.Borrow_ID;

    -- Increment Availability_Status_Library by 1 for the book in Book_Copies1
    UPDATE Book_Copies1
    SET Availability_Status_Library = Availability_Status_Library + 1
    WHERE Book_ID = v_book_id;

    -- Display message
    DBMS_OUTPUT.PUT_LINE('Availability status updated for book with Book_ID: ' || v_book_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Book not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/
