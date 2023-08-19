CREATE OR REPLACE PROCEDURE InsertMember3(
    p_phone_no IN Members3.Phone_No%TYPE
) AS
    v_name Members3.Name%TYPE;
    v_address Members3.Address%TYPE;
	v_end_date  date;
	v_start_date date;
BEGIN
    -- Get user input for name and address
    v_name := '&name';
    v_address := '&address';
	
    SELECT name, address, start_date_lib, end_date_lib 
		INTO v_name, v_address, v_start_date, v_end_date 
		from MEMBERS1@site
		where Phone_No = p_phone_number;
		
		DELETE FROM Members1@site
        WHERE Phone_No = p_phone_number;
		
		INSERT INTO Members3 VALUES (
        p_phone_number,
        f_name,
        f_address,
        'Both',
        v_start_date,
		v_end_date
    );
    COMMIT;
	DBMS_OUTPUT.PUT_LINE('Updated status as Both.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Phone number already registered.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        ROLLBACK;
END InsertMember2;
/
