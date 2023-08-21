CREATE OR REPLACE PROCEDURE UpdateFine AS
BEGIN
    -- Update the fine by 1 for borrowers whose return date has passed
    UPDATE Borrowers
    SET fine = fine + 1
    WHERE Return_Date < SYSDATE;
	
    COMMIT;
    --DBMS_OUTPUT.PUT_LINE('Fine updates completed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/
