DECLARE
    choice NUMBER;
BEGIN
    -- Display the options to the user
    DBMS_OUTPUT.PUT_LINE('Select an option:');
    DBMS_OUTPUT.PUT_LINE('1. Option 1');
    DBMS_OUTPUT.PUT_LINE('2. Option 2');
    DBMS_OUTPUT.PUT_LINE('3. Option 3');
    DBMS_OUTPUT.PUT_LINE('4. Option 4');
    DBMS_OUTPUT.PUT_LINE('5. Option 5');

    -- Ask the user to enter their choice
    DBMS_OUTPUT.PUT_LINE('Enter the number of your choice:');
    INPUT_CHOICE:
    LOOP
        BEGIN
            -- Read the user's choice
            EXECUTE IMMEDIATE 'DECLARE choice NUMBER := ' || '&1' || '; BEGIN NULL; END;';
            EXIT INPUT_CHOICE;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Invalid input. Please enter a valid number.');
        END;
    END LOOP;

    -- Retrieve the user's choice and store it in the "choice" variable
    choice := &1;

    -- Process the selected option
    CASE choice
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('You selected Option 1.');
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE('You selected Option 2.');
        WHEN 3 THEN
            DBMS_OUTPUT.PUT_LINE('You selected Option 3.');
        WHEN 4 THEN
            DBMS_OUTPUT.PUT_LINE('You selected Option 4.');
        WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE('You selected Option 5.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid option.');
    END CASE;
END;
/
