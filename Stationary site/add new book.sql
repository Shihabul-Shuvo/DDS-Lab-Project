SET SERVEROUTPUT ON;

DECLARE
    v_new_book_id Books2.Book_ID%TYPE;
    v_new_title Books2.Title%TYPE;
    v_new_price Books2.Price%TYPE;
BEGIN
    -- Get input from the user
    v_new_title := '&new_title';
    v_new_price := &new_price;

    -- Get the next available Book_ID from a sequence (you may need to adjust the sequence name)
    SELECT book_id_seq.NEXTVAL INTO v_new_book_id FROM dual;

    -- Insert the new book into the Books2 table
    INSERT INTO Books2 (Book_ID, Title, Price)
    VALUES (v_new_book_id, v_new_title, v_new_price);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('New book added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/
