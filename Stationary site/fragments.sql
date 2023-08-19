-- Droping table before creating
Drop table members2;
Drop table members3;
Drop table books2;
Drop table Book_Copies2;

-- Create new tables for fragments
-- Stationary site

-- Members2 (SLstatus = 'customer')
CREATE TABLE Members2 AS
SELECT Phone_no, Name, Address, Membership_Status, Start_Date_lib
FROM Members
WHERE Membership_Status = 'Customer';

-- Members3 (SLstatus = 'both')
CREATE TABLE Members3 AS
SELECT Phone_no, Name, Address, Membership_Status, Start_Date_lib
FROM Members
WHERE Membership_Status = 'Both';

-- Books2 (PJBook_ID, Price)
CREATE TABLE Books2 AS
SELECT Book_ID, Price
FROM Books;

-- Book Copies2 (PJCopy_ID, Book_ID, Availibility_status_shop)
CREATE TABLE Book_Copies2 AS
SELECT Copy_ID, Book_ID, Availability_Status_Shop
FROM Book_Copies;

-- Display the counts of the new tables
DECLARE
    v_count1 NUMBER;
    v_count2 NUMBER;
	v_count3 NUMBER;
	v_count4 NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count1 FROM Members2;
    SELECT COUNT(*) INTO v_count2 FROM Members3;
	SELECT COUNT(*) INTO v_count3 FROM Books2;
    SELECT COUNT(*) INTO v_count4 FROM Book_Copies2;
    
    DBMS_OUTPUT.PUT_LINE('Members2 count: ' || v_count1);
    DBMS_OUTPUT.PUT_LINE('Members3 count: ' || v_count2);
	DBMS_OUTPUT.PUT_LINE('Books2 count: ' || v_count3);
    DBMS_OUTPUT.PUT_LINE('Book_Copies2 count: ' || v_count4);
END;
/
