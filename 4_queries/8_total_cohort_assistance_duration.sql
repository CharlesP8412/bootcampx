SELECT cohs.name, 
SUM(started_at - created_at) AS total_duration
FROM assistance_requests reqs
JOIN students stds ON stds.id = reqs.student_id
JOIN cohorts cohs ON stds.cohort_id = cohs.id
GROUP BY cohs.name
ORDER BY total_duration DESC;