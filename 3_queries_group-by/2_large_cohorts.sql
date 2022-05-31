-- Get all cohorts with 18 or more students.

SELECT cohorts.name as cohort_name,
      count(students.cohort_id) as student_count
FROM cohorts JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohort_name
HAVING count(students.cohort_id) >= 18
ORDER BY student_count;

-- ANSWER

SELECT cohorts.name as cohort_name, count(students.*) AS student_count 
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohort_name 
HAVING count(students.*) >= 18
ORDER BY student_count;