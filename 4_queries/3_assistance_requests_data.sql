SELECT 
teachers.name AS teacher, 
students.name AS student, 
assignments.name AS assignment,
reqs.completed_at - reqs.started_at AS duration
FROM assistance_requests reqs
JOIN teachers ON teachers.id = reqs.teacher_id
JOIN students ON students.id = reqs.student_id
JOIN assignments ON assignments.id = reqs.assignment_id
ORDER BY duration;