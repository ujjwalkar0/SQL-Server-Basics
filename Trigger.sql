select * from Patient

-- Trigger when data inserted or updated
create or alter Trigger TG
on Patient
after insert, update
as
begin
	declare
		@id int = 0,
		@email varchar(255)='';

	select @id = ID, @email=EmailId from inserted

	-- print @id
	-- print @email
	
	if @email NOT LIKE '%_@__%.__%' 
	begin
		print 'Invalid Email Id'
		delete Patient where ID = @id
	end
	else
		print 'Record inserted...'
end

create or alter Trigger TG1
on Patient
after delete
as
begin
	print 'select * from deleted'
end



select * from Patient

insert into Patient
values(92, 'fkjb', 'nf', 'kdj@kvf.vk', 646)

update patient
set PhoneNo=65646464
where id=5

delete from Patient
where Id=35