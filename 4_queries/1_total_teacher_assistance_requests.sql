SELECT COUNT(reqs.teacher_id) AS total_assistances, teachers.name
FROM assistance_requests reqs
JOIN teachers ON reqs.teacher_id = teachers.id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;