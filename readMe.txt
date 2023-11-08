# Distributed Database project

Ahsanullah university of science and technology

##Instructions:

1. Connect both computers to access data from each other. (The procedure of connection is given in the "Connection" folder)
2. When running the "conn.sql" file given in each site's project folder i.e. Library site or Stationary site just change the 'HOST' value with the other site's ipv4 address.
3. When accessing the table's data of other sites use the site's name as '@site' 
   example: select * from members2@site; (accessing data members2 of stationary site from library site)
	    select * from members1@site; (accessing data members2 of library site from stationary site)
4. The project run sequence for both sites is given in the "Sqquence.txt" file.
5. "Library auto run.sql" and "Stationary auto run.sql" will automatically run all the files sequentially as listed in the "sequence.txt" file. Just give corresponding inputs when needed.

##Contributors

Student ID | Name
-----------|-----
190204075	 | MD Shihabul Islam Shovo
190204086	 | Kazi Atiqur Rahman
