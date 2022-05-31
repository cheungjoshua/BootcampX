-- Calculate the average total duration of assistance requests for each cohort.

-- SELECT cohorts.name as cohort,
--      sum(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
-- FROM assistance_requests
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY total_duration;

SELECT SUM(SELECT cohorts.name as cohort,
     sum(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;) AS total
FROM assistance_requests;

-- correct answer

SELECT avg (total_duration) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, sum(completed_at-started_at) as total_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_durations;