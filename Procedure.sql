-- Create a Procedure
create procedure procedureName
as
select * from HeartPatient;

-- Call a Procedure
exec procedureName

-- Alter a Procedure
alter procedure procedureName @PatientId int
as
select * from HeartPatient where PatientId=@PatientId;

-- Call a Procedure
exec procedureName @PatientId=6


-- Create a Procedure to Insert data in Table
create procedure Ujjwal.AddPatient @Id int, @FirstName varchar(255), @LastName varchar(255), @EmailId varchar(255), @PhoneNo bigint
as
	insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
	values(@Id, @FirstName, @LastName, @EmailId, @PhoneNo)

GO;

-- Call a Procedure
exec Ujjwal.AddPatient @Id=399, @FirstName='dkjs', @LastName='jdhj', @EmailId='sadd@vkjfvkj', @PhoneNo=64083678678

-- Call a Procedure with lock
begin tran
exec Ujjwal.AddPatient @Id=124, @FirstName='dkhjs', @LastName='judhj', @EmailId='a1h@yfhtf', @PhoneNo=4778868678
select @@SPID
commit;