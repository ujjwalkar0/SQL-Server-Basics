use db;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS;


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