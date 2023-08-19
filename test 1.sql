DECLARE
    v_value NUMBER;
BEGIN
    -- Attempt to divide by zero, which will cause an error
    v_value := 10 / 0;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
