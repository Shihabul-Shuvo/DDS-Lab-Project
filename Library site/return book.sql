set verify off
set serveroutput ON

DECLARE
    v_phone_no Borrowers.Phone_No%TYPE;
    v_fine Borrowers.Fine%TYPE;
    v_book_id Borrowers.Book_ID%TYPE;
BEGIN
    -- Get user input
    v_phone_no := '&phone_no';

    -- Search for the phone number in the Borrowers table
    SELECT Fine, Book_ID
    INTO v_fine, v_book_id
    FROM Borrowers
    WHERE Phone_No = v_phone_no;

    -- Display the fine value and book details
    IF v_fine IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Fine for the borrowed book: ' || v_fine);
		delete * from borrowers where Phone_No = v_phone_no;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No fine for the borrowed book.');
		delete * from borrowers where Phone_No = v_phone_no;
    END IF;

    -- Optionally, you can retrieve and display more information about the book using v_book_id

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Phone number not found in the Borrowers table.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/
