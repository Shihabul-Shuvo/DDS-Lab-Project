create or replace procedure "SEARCHBOOKS" (book_name IN VARCHAR2, book_id OUT NUMBER default 0) 
is begin 
-- Search for the book by title in the Books2 table 
SELECT Book_ID 
INTO book_id 
FROM Books2 
WHERE Title = p_title; 
-- If the book is not found, set p_book_id to None (NULL) 
EXCEPTION WHEN NO_DATA_FOUND THEN 
p_book_id := NULL; 

end;
/
