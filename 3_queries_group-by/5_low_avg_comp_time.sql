-- Get the students who's average time it takes to complete an assignment
-- is less than the average estimated time it takes to complete an assignment.

SELECT students.name as student, 
    avg(assignment_submissions.duration) as average_assignment_duration,
    avg(assignments.duration) as average_estimated_duration
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
JOIN assignmentS ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;