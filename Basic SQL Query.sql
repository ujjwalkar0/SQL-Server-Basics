-- CREATE AND USE A DATABASE
IF NOT EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='DB')
BEGIN
	CREATE DATABASE DB;
	USE DB;
END
ELSE
	USE DB;

-- Create a table

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Patient')
BEGIN
	CREATE TABLE Patient(
	ID INT PRIMARY KEY,
	FIRSTNAME VARCHAR(255),
	LASTNAME VARCHAR(255),
	EMAILID VARCHAR(255) UNIQUE,
	PHONENO BIGINT UNIQUE
)
END
ELSE
	PRINT 'TABLE ALREADY EXIST'


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
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='HeartPatient')
	create table HeartPatient(
		PatientId int primary key,
		Details text,
		Condition varchar(255)
	)
ELSE
	PRINT 'TABLE ALREADY EXIST'


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
GO
CREATE OR ALTER VIEW HeartPatientDetails AS
SELECT* FROM Patient
INNER JOIN HeartPatient
ON Patient.ID=HeartPatient.PatientId

-- See a view
select * from HeartPatientDetails

-- Create a table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Doctor')
create table Doctor(
	DoctorId int primary key,
	PatientId int,
	Specialist varchar(50)
)
ELSE
	PRINT 'TABLE ALREADY EXIST'

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
SELECT * FROM HeartPatient

-- Inner Join


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


-- DROP TABLES AND VIEWS 
IF OBJECT_ID('dbo.HeartPatientDetails', 'V') IS NOT NULL
    DROP VIEW dbo.HeartPatientDetails

	---------------------------------------------- DROP TABLE ----------------------------------------------

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='HeartPatient')
	DROP TABLE HeartPatient
ELSE
	PRINT 'TABLE DOES NOT EXIST...'

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Patient')
	DROP TABLE Patient
ELSE
	PRINT 'TABLE DOES NOT EXIST...'

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Doctor')
	DROP TABLE Doctor
ELSE
	PRINT 'TABLE DOES NOT EXIST...'

