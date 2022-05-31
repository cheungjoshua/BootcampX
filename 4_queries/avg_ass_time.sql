-- Get the average time of an assistance request.

select avg(select sum(completed_at - started_at) as total
from assistance_requests) as average_assistance_request_duration
from assistance_requests;


-- correct answer

SELECT avg(completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests;