SELECT AVG(total_duration) AS average_total_duration
FROM 
(SELECT cohs.name AS cohort, 
SUM(completed_at - started_at) AS total_duration
FROM assistance_requests reqs
JOIN students stds ON stds.id = reqs.student_id
JOIN cohorts cohs ON stds.cohort_id = cohs.id
GROUP BY cohs.name
ORDER BY total_duration) AS avgs;