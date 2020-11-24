SELECT cohs.name, 
AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests reqs
JOIN students stds ON stds.id = reqs.student_id
JOIN cohorts cohs ON stds.cohort_id = cohs.id
GROUP BY cohs.name
ORDER BY average_assistance_time DESC
LIMIT 1;