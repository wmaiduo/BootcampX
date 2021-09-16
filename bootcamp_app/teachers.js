const { Pool } = require('pg');

const cohortName = [process.argv[2] || 'JUL02'];
const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
`

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(queryString, cohortName)
.then(res => {
  console.log(res.rows);
})
.catch(err => console.error('query error', err.stack));