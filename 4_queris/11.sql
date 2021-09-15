SELECT
  DAY,
  count(*) AS number_of_assignments,
  sum(duration) AS duration
FROM
  assignments
GROUP BY
  DAY
ORDER BY
  DAY;