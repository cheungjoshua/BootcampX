-- Get all of the students currently enrolled.

SELECT name, id, cohort_id 
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;