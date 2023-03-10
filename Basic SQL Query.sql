-- Create a database
create database DB;

-- Use a database
use DB

-- Create a table
create table Patient(
	Id int primary key,
	FirstName varchar(255),
	LastName varchar(255),
	EmailId varchar(255) unique,
	PhoneNo bigint unique
)

-- Drop a table
drop table Patient

-- Alter a table
alter table Patient
alter column PhoneNo bigint

-- Insert into table
insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(1, 'Ujjwal', 'Kar', 'ujjwalkar21@gmail.com', 8388823359)

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(3, 'Hello', 'World', 'hello@world.com', 57357653275);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(4, 'Neha', 'Singh', 'neha.singh@gmail.com', 573573275);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(5, 'Disha', 'Chd', 'balad@world.com', 5365763576);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(6, 'Random', 'Name', 'name@rand.om', 786746756);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(7, 'Ashish', 'Ka Shop', 'ashish@ka.shop', 5765765776);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(8, 'Deb', 'Malya', 'deb@ma.lya', 73576354675);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(9, 'Abhi', 'Siekh', 'seikh@ka.shop', 6387688);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(10, 'Kri', 'ty', 'kri@ty.com', 574577656753);

insert into Patient(Id, FirstName, LastName, EmailId, PhoneNo)
values(11, 'Ai', 'Shikh', 'aisikh@djhk.cjh', 347567);

-- See records of a table
select * from Patient

-- Update records of a table
update  Patient
set PhoneNo=100
where Id=1


-- Create another table
create table HeartPatient(
	PatientId int primary key,
	Details text,
	Condition varchar(255)
)


-- Insert records
insert into HeartPatient(PatientId, Details, Condition)
values(1, 'No problem', 'Normal')

insert into HeartPatient(PatientId, Details, Condition)
values(4, 'No problem', 'Normal')

insert into HeartPatient(PatientId, Details, Condition)
values(6, 'No problem', 'Normal')

insert into HeartPatient(PatientId, Details, Condition)
values(9, 'No problem', 'Normal')


-- Create views
create view HeartPatientDetails as
select * from Patient
INNER JOIN HeartPatient
ON Patient.ID=HeartPatient.PatientId


-- See a view
select * from HeartPatientDetails

-- Create a table
create table Doctor(
	DoctorId int primary key,
	PatientId int,
	Specialist varchar(50)
)

-- Alter a table
alter table Doctor
alter column Specialist varchar(50) not null

-- Insert a record
insert into Doctor(DoctorId, PatientId, Specialist)
values(1, 3, 'ENT')

insert into Doctor(DoctorId, PatientId, Specialist)
values(2, 3, 'EYE')

insert into Doctor(DoctorId, PatientId, Specialist)
values(3, 6, 'Nerve')

insert into Doctor(DoctorId, PatientId, Specialist)
values(4, NULL, 'ENT')

insert into Doctor(DoctorId, PatientId, Specialist)
values(5, NULL, 'Surgery')

-- See Records
select * from Doctor
select * from Patient


-- Left Join
select * from Doctor
left join Patient
on Patient.ID=Doctor.PatientId

-- Right Join
select * from Doctor
right join Patient
on Patient.ID=Doctor.PatientId

-- Outer Join
select * from Doctor
full outer join Patient
on Patient.ID=Doctor.PatientId

-- Self Join
select * from Doctor A, Doctor B
where A.DoctorId <> B.DoctorId
and A.PatientId = B.PatientId

select * from Doctor A, Doctor B
where A.DoctorId <> B.DoctorId
and A.PatientId <> B.PatientId

-- Union
select PatientId from Doctor
union all
select Id from Patient

select PatientId from Doctor
union
select Id from Patient

-- Add foreign Key
alter table HeartPatient add foreign key (PatientId) references Patient(Id)

-- index




select * from indexname
    
Select  * From [HeartPatient] With (Index(2))


select * from HeartPatient


-- Procedure
create procedure procedureName
as
select * from HeartPatient;
GO;

exec procedureName
go;

alter procedure procedureName @PatientId int
as
select * from HeartPatient where PatientId=@PatientId;
go;

exec procedureName @PatientId=6

Select * from Patient

begin tran
exec Ujjwal.AddPatient @Id=399, @FirstName='dkjs', @LastName='jdhj', @EmailId='sadd@vkjfvkj', @PhoneNo=64083678678

commit;

-- Cursor

Declare
@a varchar(255),
@b varchar(255)

declare cursor_name cursor
for
	select 
		-- SQL Statement

open cursor_name;
fetch next from cursor_name into @FirstName, @LastName;


while @@FETCH_STATUS=0
	begin
		select @a = iif(@FirstName is IS NULL, 'No Name', @FirstName);
		print @FirstName + ' - ' + @LastName




-- Trigger

drop table HeartPatient

drop table Patient