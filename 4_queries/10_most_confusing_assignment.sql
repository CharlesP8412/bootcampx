SELECT
assignments.id AS id,
assignments.name AS name,
assignments.day AS day,
assignments.chapter AS chapter,
COUNT(reqs.*) AS total_requests
FROM assistance_requests reqs
JOIN assignments ON assignments.id = reqs.assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;