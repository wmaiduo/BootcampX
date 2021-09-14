select
  name,
  email,
  id
  and cohort_id
from
  students
where
  email not like '%gmail.com'
  and phone is NULL;