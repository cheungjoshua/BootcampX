-- Get the name of all teachers that performed an assistance request during a cohort.

SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohortS ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02' 
ORDER BY teachers.name;