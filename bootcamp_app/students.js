const { Pool } = require('pg');

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
/* 
//Rtn Array of Objects (Rows)
pool.query(`
SELECT id, name, cohort_id
FROM students
LIMIT 5;
`)
.then(res => {
  console.log(res.rows);
})
.catch(err => console.error('query error', err.stack));

// Joins behave as usual, can use output as variable...
pool.query(`
SELECT students.id, students.name, cohort_id
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id 
LIMIT 5;
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} cohort`);
  })
});
 */

//Use argv for input

const queryString = `
SELECT students.id, students.name, cohort_id
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id 
WHERE cohorts.name LIKE $1
LIMIT $2;
`

// Store all potentially malicious values in an array. 
const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} cohort`);
  })
});