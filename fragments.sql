-- Create new tables
CREATE TABLE Members1 AS
SELECT *
FROM Members
WHERE Membership_Status = 'Reader';

CREATE TABLE Members2 AS
SELECT *
FROM Members
WHERE Membership_Status = 'Customer' OR Membership_Status = 'Both';

CREATE TABLE Members3 AS
SELECT *
FROM Members
WHERE Membership_Status = 'Both';

-- Display the counts of the new tables
DECLARE
    v_count1 NUMBER;
    v_count2 NUMBER;
    v_count3 NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count1 FROM Members1;
    SELECT COUNT(*) INTO v_count2 FROM Members2;
    SELECT COUNT(*) INTO v_count3 FROM Members3;
    
    DBMS_OUTPUT.PUT_LINE('Members1 count: ' || v_count1);
    DBMS_OUTPUT.PUT_LINE('Members2 count: ' || v_count2);
    DBMS_OUTPUT.PUT_LINE('Members3 count: ' || v_count3);
END;
/


-- Create the Books1 table
CREATE TABLE Books1 (
  PJBook_ID NUMBER PRIMARY KEY,
  Title VARCHAR2(255),
  Author VARCHAR2(255),
  Publisher VARCHAR2(255)
);

-- Create the Books2 table
CREATE TABLE Books2 (
  PJBook_ID NUMBER PRIMARY KEY,
  PriceBooks NUMBER
);


-- Create the Book_Copies1 table
CREATE TABLE Book_Copies1 (
  PJCopy_ID NUMBER PRIMARY KEY,
  Book_ID NUMBER,
  Books_at_library NUMBER,
  Availibility_status_libraryBook_Copies VARCHAR2(50),
  FOREIGN KEY (Book_ID) REFERENCES Books (PJBook_ID)
);

-- Create the Book_Copies2 table
CREATE TABLE Book_Copies2 (
  PJCopy_ID NUMBER PRIMARY KEY,
  Book_ID NUMBER,
  Availibility_status_shopBook_Copies VARCHAR2(50),
  FOREIGN KEY (Book_ID) REFERENCES Books (PJBook_ID)
);



commit;