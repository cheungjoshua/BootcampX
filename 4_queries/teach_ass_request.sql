-- Get the total number of assistance_requests for a teacher.

SELECT count(assistance_requests.*) as total_assistances, teachers.name as name
FROM assistance_requests 
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE teachers.name =  'Waylon Boehm'
GROUP BY name;