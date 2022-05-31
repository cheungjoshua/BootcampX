-- List each assignment with the total number of assistance requests with it.

SELECT assignments.id as id, assignments.name as name,
      assignments.chapter as chapter, count(assistance_requests.*) as total_request
FROM assistance_requests 
JOIN assignments ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_request DESC;