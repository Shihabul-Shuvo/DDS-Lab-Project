SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE CustomerInfoPackage AS
    PROCEDURE ShowCustomerInfo;
END CustomerInfoPackage;
/

CREATE OR REPLACE PACKAGE BODY CustomerInfoPackage AS
    PROCEDURE ShowCustomerInfo IS
	CURSOR MembersCursor IS
        SELECT Name, Phone_No
        FROM Members2
        UNION ALL
        SELECT Name, Phone_No
        FROM Members3;
		
        v_customer_name Members2.Name%TYPE;
        v_customer_phone Members2.Phone_No%TYPE;
    BEGIN
        -- Retrieve and display customer names and phone numbers
		DBMS_OUTPUT.PUT_LINE('ALl customers name with their name and phone no: ');
        OPEN MembersCursor;
    LOOP
        FETCH MembersCursor INTO v_customer_name, v_customer_phone;
        EXIT WHEN MembersCursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Member Name: ' || v_customer_name || ', Phone: ' || v_customer_phone);
    END LOOP;
	CLOSE MembersCursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
    END ShowCustomerInfo;
END CustomerInfoPackage;
/
BEGIN
    CustomerInfoPackage.ShowCustomerInfo;
END;
/


