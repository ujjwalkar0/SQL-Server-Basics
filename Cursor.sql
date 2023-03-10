-- CREATE AND USE A DATABASE
IF NOT EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='DB')
BEGIN
	CREATE DATABASE DB;
	USE DB;
END
ELSE
	USE DB;


declare myCursor cursor scroll for select * from Patient

open myCursor

fetch first from myCursor

fetch next from myCursor

fetch next from myCursor

fetch last from myCursor

fetch absolute  3 from myCursor
fetch relative 3 from myCursor
select * from Patient

close myCursor

deallocate myCursor

-- Cursor in Loop

DECLARE 
@FIRSTNAME VARCHAR(255), 
@LASTNAME VARCHAR(255), 
@FullName VARCHAR(255);

DECLARE myCursor2 CURSOR
	FOR 
	SELECT 
		Patient.FIRSTNAME, 
		Patient.LASTNAME
	FROM Doctor
	LEFT JOIN Patient
	ON Patient.ID=Doctor.PatientId; 


OPEN myCursor2;

-- deallocate myCursor2

FETCH NEXT FROM myCursor2 INTO 
@FIRSTNAME, 
@LASTNAME; 


WHILE @@FETCH_STATUS = 0
	BEGIN
	SELECT @FullName = @FIRSTNAME + ' '+ @LASTNAME --IIF(@MentorName IS NULL, 'No Mentor', @MentorName);
	PRINT @FullName;
	FETCH NEXT FROM myCursor2 INTO 
		@FirstName, 
		@LastName;
END; 

CLOSE myCursor2; 
DEALLOCATE myCursor2;

