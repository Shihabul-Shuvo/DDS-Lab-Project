-- Trigger for members3 table
CREATE OR REPLACE TRIGGER members3_trigger
AFTER INSERT ON members3
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Status updated as both');
END;
/

-- Trigger for members2 table
CREATE OR REPLACE TRIGGER members2_trigger
AFTER INSERT ON members2
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('New customer added.');
END;
/

-- Trigger for books2 table
CREATE OR REPLACE TRIGGER books2_trigger
AFTER INSERT ON books2
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('New book added.');
END;
/

-- Trigger for Book_Copies2 table
CREATE OR REPLACE TRIGGER booksCopies2_trigger
AFTER INSERT ON Book_Copies2
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Books availability updated.');
END;
/
