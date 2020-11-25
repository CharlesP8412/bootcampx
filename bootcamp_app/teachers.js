const { Pool } = require('pg');

const cohortName = process.argv[2];


const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const sqlQuery4 = `
SELECT 
DISTINCT teachers.name AS teacher,
cohorts.name AS cohort
FROM assistance_requests reqs
JOIN teachers ON teachers.id = reqs.teacher_id
JOIN students ON students.id = reqs.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;`

const values = [cohortName];

pool.query(sqlQuery4)
  .then(res => {
    console.log('connected');
    res.rows.forEach(user => {
      const name = user.teacher;
      const cohort = user.cohort;
      console.log(`${cohort}: ${name}`);
    })
  });