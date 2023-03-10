-- Create Index
create index indexname
on
HeartPatient (Condition, PatientId)

-- Alter Index
-- alter index indexname on HeartPatient rebuild
-- alter index indexname on HeartPatient (Condition, PatientId) exclude (Condition)

-- Drop Index
drop index indexname on HeartPatient
