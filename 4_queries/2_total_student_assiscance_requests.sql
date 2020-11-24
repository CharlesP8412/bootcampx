SELECT COUNT(reqs.*) AS total_assistances, students.name
FROM assistance_requests reqs
JOIN students ON reqs.student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;