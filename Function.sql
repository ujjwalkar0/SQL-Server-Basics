-- Create Function
create function Fun (@patid int) 
returns int as 
begin
	declare @intpat int = 0
	Select @intpat=Details from HeartPatient where PatientId=@patid
	return @intpat
end

-- Alter Function
alter function Fun (@patid int) 
returns varchar(255) as 
begin
	declare @intpat varchar(255)=''
	Select @intpat=Details from HeartPatient where PatientId=@patid
	return @intpat
end

-- Drop Function
drop function Fun

-- Call a Function
Select dbo.Fun(1);

-- Create a Schema
create schema Ujjwal

-- Create Function on a Scema
create function Ujjwal.Fun (@patid int) 
returns varchar(255) as 
begin
	declare @intpat varchar(255)=''
	Select @intpat=Details from HeartPatient where PatientId=@patid
	return @intpat
end

-- Call a Function
Select Ujjwal.Fun(1);
