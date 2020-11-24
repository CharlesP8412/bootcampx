
FROM (SELECT teachers.name AS teacher,
cohorts.name AS cohort
FROM assistance_requests reqs
JOIN teachers ON teachers.id = reqs.teacher_id
JOIN students ON students.id = reqs.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher)