SELECT
  DISTINCT teachers.name AS teacher,
  cohorts.name AS cohort,
  count(assistance_requests.*) AS total_assistances
FROM
  teachers
  JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
WHERE
  cohorts.name = 'JUL02'
GROUP BY
  cohort,
  teacher
ORDER BY
  teacher;