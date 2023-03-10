select * from Patient

create Trigger TG
on Patient
after insert
as
begin
	select * from inserted
end

create Trigger TG1
on Patient
after delete
as
begin
	select * from deleted
end



select * from Patient

insert into Patient
values(389, 'fkjfb', 'nkf', 'dbj@n.vf', 6464646)


delete from Patient
where Id=35