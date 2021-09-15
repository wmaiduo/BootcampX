SELECT
  assignments.id,
  assignments.name,
  DAY,
  chapter,
  count(assistance_requests.*) AS total_requests
FROM
  assignments
  JOIN assistance_requests ON assignments.id = assistance_requests.assignment_id
GROUP BY
  assignments.id
ORDER BY
  count(assistance_requests.*) DESC;